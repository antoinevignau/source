*
* WARNING: IT IS A WORK IN PROGRESS (ONLY $B000++ IS VERIFIED)
*
* AC/BASIC
* 16-Bit BASIC Compiler for Apple II GS
*
* (c) 1988, absoft
* (s) 2020, Antoine Vignau
*

	mx	%00
	rel
	typ	S16
	dsk	AC2020.SYS16
	lst	off
	
*-------------------------------

COPMGRV	=	$E10014
GSOS	=	$E100A8

*-------------------------------

	use	4/Ctl.Macs
	use	4/Desk.Macs
	use	4/Dialog.Macs
	use	4/Event.Macs
	use	4/Font.Macs
	use	4/Line.Macs
	use	4/Load.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Misc.Macs
	use	4/Print.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/Scrap.Macs
	use	4/Sound.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*-------------------------------

         CLC
         XCE
         REP   #$FF
         STZ   $00
         LDA   #$023A
         BPL   L000E
         BRL   *-LA3FA
L000E    STX   $26
         STY   $24
         STA   $04
         STZ   $06
         TXA
         ORA   $24
         BEQ   L0059
         TDC
         CLC
         ADC   #$002B
         STA   $28
         STZ   $2A
         LDY   $00
         LDX   #$0084
         SEP   #$20
L002B    DEX
         BMI   L0057
         LDA   [$24],Y
         BEQ   L0057
         INY
         CMP   #$20
         BNE   L002B
L0037    DEX
         BMI   L0057
         LDA   [$24],Y
         BEQ   L0057
         INY
         CMP   #$20
         BEQ   L0037
         DEY
         DEY
L0045    INY
         DEX
         BMI   L0057
         INC   $28
         BNE   L004F
         INC   $29
L004F    LDA   [$24],Y
         STA   [$28]
         BNE   L0045
         STY   $06
L0057    REP   #$20
L0059    PHK
         PER   L006C-1
         PER   L00F8
         LDA   $00
         LDY   $06
         BEQ   L0068
         INC
         INC
L0068    INC
         BRL   *-L9BD0
L006C    STZ   $F4
         DEC   $F4
         TDC
         STA   $0C
         LDA   $FC
         SEC
         SBC   $0C
         TAX
         STX   $F6
         LDA   $06,X
         BNE   L0086
         LDAL  $00FFE6	; LOGO BUG?
         INC
         BNE   L008B
L0086    LDA   #$8FF1
         STA   $F4
L008B    PHK
         PER   L0091-1
         BRA   L0094
L0091    BRL   L0503
L0094    LDX   $00
         LDY   #$403C
         LDA   #$2BDA     ; Z+
         PHK
         PER   L00A3-1
         BRL   *-LA622
L00A3    BCS   L00C7
         LDX   $00
         LDY   #$80E0
         LDA   #$7FF0
         PHK
         PER   L00B4-1
         BRL   *-LA622
L00B4    BCS   L00C7
         LDX   $00
         LDY   #$80E4
         LDA   #$3600
         PHK
         PER   L00C5-1
         BRL   *-LA622
L00C5    BCC   L00CC
L00C7    PER   L01C0
         BRA   L00FC
L00CC    PHK
         PER   L0298
         PEA   $5C00
         PLB
         PLA
         STAL  COPMGRV
         PLA
         STAL  COPMGRV+2
         PHK
         PHK
         PER   L02CE
         PLY
         STY   $E8
         PLY
         STY   $EA
         BIT   $F4
         BVC   L00F7
         LDA   $00
         TAX
         PHK
         PER   L00F7-1
         BRL   *-LB6E0
L00F7    RTL

L00F8    ADRL  $00000000

L00FC    PLA
         PHK
         PHK
         PHA
         LDX   $F4
         PHK
         PER   L0109-1
         BRL   *-LAF42
L0109    PHK
         PHK
         PER   L01ED
         LDX   $F4
         PHK
         PER   L0114+2
L0114    BRL   *-LAF42
         PER   L011C-1
         BRA   L012F
L011C    BRL   L03F2
         PLA
         PHK
         PHK
         PHA
         LDX   $F4
         PHK
         PER   L012C-1
         BRL   *-LAF42
L012C    BRL   L04C3
L012F    PEA   $0000
         PEA   $0000
         _ReadChar
         PLA
         AND   #$007F
         RTS

L0141    STR   'Can not Open Source File'
         DB    $00
L015B    STR   'Can not Create List File'
         DB    $00
L0175    STR   ' or Temporary Files'
         DB    $00
L018A    STR   'Label/Symbol table'
         DB    $00
L019E    STR   ' Overflow'
         DB    $00
L01A9    STR   'Failure Creating File'
         DB    $00
L01C0    ASC   'Not enough memory available.'0D00
L01DE    ASC   'Compiling %s.'0D00
L01ED    ASC   'Type any key to continue.'0D00
L0208    ASC   'Fatal File number mix up. Id %d.'0D00
L022A    ASC   'MAIN'00
L022F    ASC   0C0D
         ASC   'AC/BASIC Compiler Listing   %s         '
         ASC   '           Page %d'0D0D
         ASC   '  Source File: %s%s%s'0D0D0D00
L0285    ASC   ' '00
L0287    ASC   '. Include file: '00

L0298    PLP
         REP   #$3C
         PLA
         DEC
         PLB
         PHB
         PHA
         PHY
         LDY   #$0000
         LDA   ($03,S),Y
         PLY
         AND   #$00FF
         CMP   #$0072
         BEQ   L02C9
         CMP   #$0073
         BEQ   L02C1
         PEA   $0081
         PHK
         PER   L02BE-1
         BRL   L3CE4
L02BE    SEP   #$41
         RTL

L02C1    LDA   #$0006
         STA   $04
         SEP   #$41
         RTL

L02C9    PEI   $FA
         PEI   $F8
         RTL

L02CE    PHB
         PLB
         PHA
         PER   L02DE-1
         PLA
         PHP
         CLC
         ADC   $04,S
         STA   $04,S
         PLP
         PLA
         RTS

L02DE    BRL   L0319	; LOGO ADDRESSES
         BRL   L03AB
         BRL   L0580
         BRL   L04C3
         BRL   L04A7
         BRL   L0492
         BRL   L047B
         BRL   L04CA
         BRL   L08D6
         BRL   L0845
         BRL   *-LA005
         BRL   L0565
         BRL   L0094
         BRL   L0516
         BRL   L0560

L030B    PEI   $DC
         PHX
         PHY
         LDY   $38
         STY   $44
         LDY   $3A
         STY   $46
         BRA   L032B

L0319    PEI   $DC
         PHX
         PHY
         LDA   #$00CA
         CLC
         ADC   $3C
         STA   $44
         LDA   $00
         ADC   $3E
         STA   $46
L032B    LDY   #$001C
         LDA   [$3C],Y
         DEC
         STA   $48
         LDY   #$001E
         LDA   [$3C],Y
         STA   $4A
         LDY   $00
         TYA
         STA   [$44]
         INY
         STZ   $DC
         SEP   #$20
L0344    LDA   [$48],Y
         STA   [$44],Y
         BEQ   L0355
         INC   $DC
         CMP   #$2F
         BNE   L0352
         STZ   $DC
L0352    INY
         BRA   L0344
L0355    LDX   #$0005
         LDA   $04,S
         BNE   L0372
         DEX
         LDA   $03,S
         BNE   L0372
         DEX
         LDA   $02,S
         BNE   L0372
         DEX
         LDA   $01,S
         BNE   L0372
         REP   #$20
         PLA
         PLA
         INY
         BRA   L039C
         MX    %10
L0372    TXA
         CLC
         ADC   $DC
L0376    CMP   #$10
         BCC   L037E
         DEY
         DEC
         BRA   L0376
L037E    LDA   #$2E
         STA   [$44],Y
         INY
         PLA
         STA   [$44],Y
         INY
         PLA
         STA   [$44],Y
         BEQ   L038D
         INY
L038D    PLA
         STA   [$44],Y
         BEQ   L0393
         INY
L0393    PLA
         STA   [$44],Y
         BEQ   L0399
         INY
L0399    INY
         REP   #$20
L039C    DEY
         PLA
         STA   $DC
         LDA   $00
         STA   [$44],Y
         DEY
         TYA
         ORA   [$44]
         STA   [$44]
         RTL

L03AB    PHA
         PHX
         PHK
         PHK
         PER   L054F
         PLA
         LDY   #$001C
         STA   [$3C],Y
         PLA
         LDY   #$001E
         STA   [$3C],Y
         LDA   #$0004
         STA   $1C
         LDA   #$07AE
         CLC
         ADC   $3C
         STA   $38
         LDA   $00
         ADC   $3E
         STA   $3A
L03D1    LDA   $1C
         ORA   #$4630
         TAY
         LDX   $00
         PHK
         PER   L03DD+2
L03DD    BRL   L030B
         PEI   $46
         PEI   $44
         PHK
         PER   L03E8+2
L03E8    BRL   *-LA455
         DEC   $1C
         BNE   L03D1
         PLX
         PLA
         RTL

L03F2    PHK
         PER   L03F6+2
L03F6    BRL   L0565
         BIT   $F4
         BVC   L0403
         PHK
         PER   L0401+1
L0401    BRA   L03AB
L0403    BRL   *-LA3FA
L0406    TAX
         PHK
         PHK
         PER   L054F
         PLA
         LDY   #$001C
         STA   [$3C],Y
         PLA
         LDY   #$001E
         STA   [$3C],Y
         TXA
L0419    ORA   #$4630     ; 0F
         TAY
         LDX   $00
         PHK
         PER   L0423+2
L0423    BRL   L0319
         LDX   $00
         LDA   #$00B7
         BRA   L0439
L042D    PHK
         PER   L0431+2
L0431    BRL   L0319
         LDA   #$0004
         LDX   $00
L0439    PEI   $46
         PEI   $44
         PHK
         PER   L0441+2
L0441    BRL   *-LA354
         BCS   L0447
         RTL

L0447    PHK
         PHK
         PER   L0175
         PHK
         PHK
         PER   L015B
         BRA   L04B1
L0453    TAX
         BNE   L045E
         TYA
         PHK
         PER   L045B+1
L045B    BRA   L0419
         RTS

L045E    PHX
         LDA   $00
         PHA
         PHA
         PHX
         PHA
         PHA
         PHX
         PHK
         PER   L046B+2
L046B    BRL   *-LA49E
         BCS   L0447
         PHK
         PER   L0474+2
L0474    BRL   *-LA487
         BCS   L0447
         PLA
         RTS

L047B    LDA   $04,S
         LDY   #$0008
         CMP   [$3C],Y
         BEQ   L0492
         INX
         LDY   #$0010
         LDA   [$3C],Y
         CMP   #$ABCD
         BNE   L0492
         BRL   *-LA580
L0492    PEA   $0000
         PHX
         PER   L0208
         BRL   L00FC
L049C    PEI   $46
         PEI   $44
         PHK
         PHK
         PER   L01A9
         BRA   L04B1
L04A7    PHK
         PHK
         PER   L019E
         PHK
         PHK
         PER   L018A
L04B1    PHK
         PER   L04BC
         PEA   $003C
         PEI   $EE
         PEI   $EC
L04BC    RTL

         DEX
         BEQ   L04C3
         BRL   L03F2
L04C3    PHK
         PER   L04C7+2
L04C7    BRL   L0565
L04CA    LDA   #$0004
         BIT   $72
         BEQ   L04E6
         PHK
         PER   L04D5+2
L04D5    BRL   L0565
         LDA   $44
         LDX   $46
         PHK
         PER   L04E0+2
L04E0    BRL   L03AB
         BRL   *-LA3F0
L04E6    LDA   #$001A
         CLC
         ADC   $3C
         STA   $2C
         LDA   $00
         ADC   $3E
         STA   $2E
         LDY   #$0010
         LDA   [$3C],Y
         CMP   #$ABCD
         BEQ   L050B
         LDX   #$0001
         BRA   L0492
L0503    LDY   $3C
         STY   $2C
         LDY   $3E
         STY   $2E
L050B    PHK
         PER   L050F+1
L050F    BRA   L0516
         LDA   $A2
         TCS
         BRA   L0558
L0516    LDX   #$00E0
         STZ   $00
         LDA   $A2
L051D    DEX
         DEX
         STZ   $00,X
         CPX   #$0046
         BCS   L051D
         STA   $A2
         LDA   $00
         LDY   #$01D4
L052D    STA   [$2C],Y
         DEY
         DEY
         BPL   L052D
         STA   [$2C]
         LDA   #$ABCD
         LDY   #$0010
         STA   [$3C],Y
         PHK
         PHK
         PER   L054F
         PLA
         LDY   #$001C
         STA   [$3C],Y
         PLA
         LDY   #$001E
         STA   [$3C],Y
         RTL

L054F    ASC   '6/Bprogr'00

L0558    PEA   $0033
         PEI   $EE
         PEI   $EC
         RTL

L0560    BCC   L05A3
         BRL   L03F2
L0565    LDY   #$000E
L0568    LDA   [$3C],Y
         BEQ   L057B
         PHY
         PHA
         PHK
         PER   L0572+2
L0572    BRL   *-LA472
         PLY
         LDA   #$0000
         STA   [$3C],Y
L057B    DEY
         DEY
         BPL   L0568
         RTL

L0580    BIT   $F4
         BVC   L059E
         PEI   $20
         STZ   $20
         INC   $20
         PHK
         PER   L0595
         PEA   $0036
         PEI   $EE
         PEI   $EC
L0595    RTL

         PLA
         STA   $20
         BCC   L059E
         BRL   L03F2
L059E    RTL

L059F    STR   '0/'
         DB    $00

L05A3    LDA   [$3C]
         BNE   L05B8
         PHK
         PHK
         PER   L059F
         PEA   $0006
         PHK
         PER   L05B3+2
L05B3    BRL   *-LA57B
         LDA   $00
L05B8    LDY   #$0001
         PER   L05BE+2
L05BE    BRL   L0453
         STA   [$3C]
         LDY   #$0002
         LDA   [$3C],Y
         LDY   #$0002
         PER   L05CE+2
L05CE    BRL   L0453
         LDY   #$0002
         STA   [$3C],Y
         LDA   #$072C
         CLC
         ADC   $3C
         STA   $28
         LDA   $00
         ADC   $3E
         STA   $2A
         LDA   $28
         INC
         LDY   #$001C
         STA   [$3C],Y
         LDA   $2A
         LDY   #$001E
         STA   [$3C],Y
         PEI   $2A
         PEI   $28
         PHK
         PER   L05FB+2
L05FB    BRL   *-LA2FC
         BCC   L062A
         PEI   $2A
         PEI   $28
         PHK
         PHK
         PER   L0141
         PHK
         PER   L0614
         PEA   $003C
         PEI   $EE
         PEI   $EC
L0614    RTL

         DEX
         BNE   L061B
         BRL   L04CA
L061B    PHK
         PER   L0626
         PEA   $003F
         PEI   $EE
         PEI   $EC
L0626    RTL

         BRL   L04CA
L062A    LDY   #$0008
         STA   [$3C],Y
         PHA
         PHK
         PER   L0634+2
L0634    BRL   *-LA537
         LDY   #$01B4
         ASL
         STA   [$3C],Y
         INY
         INY
         TXA
         ROL
         STA   [$3C],Y
         INC   $28
         LDY   #$0000
         TYX
         SEP   #$20
L064B    LDA   [$28],Y
         BEQ   L065B
         INY
         CMP   #$2F
         BNE   L064B
         LDA   [$28],Y
         BEQ   L065B
         TYX
         BRA   L064B
L065B    REP   #$20
         PEI   $2A
         TXA
         CLC
         ADC   $28
         PHA
         PHK
         PHK
         PER   L01DE
         LDX   $F4
         PHK
         PER   L066F+2
L066F    BRL   *-LAF42
         LDA   $A2
         TCS
         LDA   #$0152
         CLC
         ADC   $3C
         STA   $2C
         LDA   $00
         ADC   $3E
         STA   $2E
         PEI   $2E
         PEI   $2C
         _ReadAsciiTime
         LDY   #$0000
L0691    LDA   [$2C],Y
         AND   #$7F7F
         STA   [$2C],Y
         INY
         INY
         CPY   #$0014
         BCC   L0691
         LDA   $00
         STA   [$2C],Y
         PHK
         PHK
         PER   L022A
         PER   L06AB+2
L06AB    BRL   L08A4
         LDA   #$0C8C
         CLC
         ADC   $3C
         STA   $BE
         LDA   $00
         ADC   $3E
         STA   $C0
         LDA   #$1298
         CLC
         ADC   $3C
         STA   $6E
         LDA   $00
         ADC   $3E
         STA   $70
         LDA   #$FF00
         TRB   $70
         LDA   $72
         LDY   #$001A
         STA   [$3C],Y
         BIT   #$0020
         BEQ   L06E0
         LDA   #$0080
         TSB   $71
L06E0    LDA   #$0046
         LDY   #$016A
         STA   [$3C],Y
         LDA   #$179E
         CLC
         ADC   $3C
         STA   $24
         LDA   $00
         ADC   $3E
         STA   $26
         LDA   #$01EE
         CLC
         ADC   $3C
         LDX   $3E
         BCC   L0701
         INX
L0701    LDY   #$0020
         STA   [$3C],Y
         STA   $28
         LDY   #$0024
         STA   [$3C],Y
         TXA
         STA   $2A
         LDY   #$0026
         STA   [$3C],Y
         LDY   #$0022
         STA   [$3C],Y
         LDY   $24
         STY   $AC
         LDY   $26
         STY   $AE
         LDA   $00
         STA   [$24]
         INC   $24
         INC   $24
         STA   [$24]
         STA   [$28]
         LDY   #$004A
         STA   [$3C],Y
         INC
         LDY   #$0046
         STA   [$3C],Y
         LDY   #$0038
         STA   [$3C],Y
         LDY   #$0086
         STA   [$3C],Y
         LDY   #$008F
         STA   [$3C],Y
         INC
         LDY   #$0097
         STA   [$3C],Y
         INC
         LDY   #$009F
         STA   [$3C],Y
         INC
         LDY   #$00C2
         STA   [$3C],Y
         LDY   #$00A7
         STA   [$3C],Y
         LDA   #$FFFF
         LDY   #$002E
         STA   [$3C],Y
         PHK
         PER   L0772
         PEA   $0000
         PEI   $EE
         PEI   $EC
L0772    RTL

         LDA   #$04F8
         CLC
         ADC   $3C
         STA   $38
         LDA   $00
         ADC   $3E
         STA   $3A
         INC   $38
         LDX   $00
         TXY
         PHK
         PER   L078A+2
L078A    BRL   L030B
         LDA   [$38]
         AND   #$00FF
         DEC   $38
         STA   [$38]
         PHK
         PER   L07A1
         PEA   $002D
         PEI   $EE
         PEI   $EC
L07A1    RTL

         LDA   #$01D4
         CLC
         ADC   $3C
         STA   $28
         LDA   $00
         ADC   $3E
         STA   $2A
         SEP   #$20
         LDX   $00
         INX
         BIT   $73
         BPL   L07BA
         INX
L07BA    LDY   #$0019
         TXA
L07BE    STA   [$28],Y
         DEY
         BPL   L07BE
         REP   #$20
         TXA
         LDY   #$0050
         STA   [$3C],Y
         PHK
         PER   L07D3
         PHK
         PER   L3CEF
L07D3    RTL

         LDY   #$000C
         LDA   [$3C],Y
         BEQ   L0838
         PER   L07DE+2
L07DE    BRL   L0865
         LDY   #$003C
         LDA   [$3C],Y
         BNE   L07EA
         BRA   L0838
L07EA    LDY   #$016A
         LDA   [$3C],Y
         CMP   #$0034
         BCC   L07FB
         PHK
         PER   L07F8+2
L07F8    BRL   L08D6
L07FB    PHK
         PHK
         PER   L087C
         PHK
         PER   L0804+1
L0804    BRA   L0845
         PLA
         PLA
         LDY   #$000A
         STZ   $20
         TSC
         STA   $22
L0810    INC   $20
         LDX   $20
         PER   L0817+2
L0817    BRL   L097F
         BCS   L0833
         PHA
         PHY
         PEA   $0000
         PEI   $20
         PHK
         PHK
         PER   L0873
         PHK
         PER   L082C+1
L082C    BRA   L0845
         LDA   $22
         TCS
         BRA   L0810
L0833    PER   L0836+1
L0836    BRA   L0865
L0838    LDY   #$0036
         LDA   [$3C],Y
         BNE   L0842
         BRL   L099D
L0842    BRL   L0C73
L0845    LDY   #$016A
         LDA   [$3C],Y
         TAX
         INC
         LDY   #$016A
         STA   [$3C],Y
         CPX   #$003C
         BCC   L085C
         PHK
         PER   L085A+1
L085A    BRA   L08D6
L085C    LDY   #$000C
         LDA   [$3C],Y
         TAX
         BRL   *-LAF42
L0865    PHK
         PHK
         PER   L08A2
         PHK
         PER   L086E+1
L086E    BRA   L0845
         PLA
         PLA
         RTS

L0873    ASC   ' %d  %s'0D00
L087C    ASC   0D
         ASC   'Source File and Include File list:'0D0D00
L08A2    ASC   0D00

L08A4    PLY
         PLX
         PLA
         XBA
         PHA
         PLB
         PLB
         PHY
         PEI   $26
         PEI   $24
         PHX
         LDA   #$016C
         CLC
         ADC   $3C
         STA   $24
         LDA   $00
         ADC   $3E
         STA   $26
         LDY   $00
         SEP   #$20
L08C3    LDA   ($01,S),Y
         STA   [$24],Y
         BEQ   L08CC
         INY
         BRA   L08C3
L08CC    REP   #$20
         PLA
         PLA
         STA   $24
         PLA
         STA   $26
         RTS

L08D6    PEI   $20
         TSC
         STA   $20
         LDY   #$0038
         LDA   [$3C],Y
         TAX
         DEC
         BEQ   L08F5
         PER   L08E7+2
L08E7    BRL   L097F
         BCS   L08F5
         PHA
         PHY
         PHK
         PHK
         PER   L0287
         BRA   L08FF
L08F5    PHK
         PHK
         PER   L0285
         PHK
         PHK
         PER   L0285
L08FF    LDX   #$0001
         PER   L0905+1
L0905    BRA   L097F
         PHA
         PHY
         LDA   $00
         PHA
         LDA   #$0006
         LDY   #$016A
         STA   [$3C],Y
         LDY   #$0168
         LDA   [$3C],Y
         TAX
         BNE   L091D
         INC
L091D    PHA
         INC
         LDY   #$0168
         STA   [$3C],Y
         LDA   #$0152
         CLC
         ADC   $3C
         LDY   $3E
         BCC   L092F
         INY
L092F    PHY
         PHA
         PHK
         PHK
         PER   L022F
         TXA
         BNE   L093E
         LDA   $01,S
         INC
         STA   $01,S
L093E    LDY   #$000C
         LDA   [$3C],Y
         BNE   L0970
         LDA   #$072D
         CLC
         ADC   $3C
         LDY   $3E
         BCC   L0950
         INY
L0950    PHY
         PHA
         PLA
         LDY   #$001C
         STA   [$3C],Y
         PLA
         LDY   #$001E
         STA   [$3C],Y
         LDY   #$534C
         LDX   #$0054
         PHK
         PER   L0968+2
L0968    BRL   L042D
         LDY   #$000C
         STA   [$3C],Y
L0970    TAX
         PHK
         PER   L0975+2
L0975    BRL   *-LAF42
         LDA   $20
         TCS
         PLA
         STA   $20
         RTL

L097F    INX
         LDY   #$000A
L0983    LDA   [$E0],Y
         BEQ   L099B
         TAY
         DEX
         BNE   L0983
         TYA
         CLC
         ADC   #$0004
         CLC
         ADC   $E0
         TAY
         LDA   $E2
         BCC   L0999
         INC
L0999    CLC
         RTS

L099B    SEC
         RTS

L099D    TSC
         STA   $40
         LDY   #$001A
         LDA   [$3C],Y
         STA   $72
         LDY   #$0086
         LDA   [$3C],Y
         LDY   #$0010
         STA   [$E4],Y
         LDA   #$0001
         LDY   #$0086
         STA   [$3C],Y
         ASL
         ASL
         TAY
         LDA   $00
         STA   [$E4],Y
         INY
         INY
         STA   [$E4],Y
         INY
         INY
         STA   [$E4],Y
         INY
         INY
         STA   [$E4],Y
         LDA   #$1096
         CLC
         ADC   $3C
         STA   $C2
         LDA   $00
         ADC   $3E
         STA   $C4
         LDA   #$07AE
         CLC
         ADC   $3C
         STA   $C6
         LDA   $00
         ADC   $3E
         STA   $C8
         LDA   #$1298
         CLC
         ADC   $3C
         STA   $CA
         LDA   $00
         ADC   $3E
         STA   $CC
         LDA   #$0C8C
         CLC
         ADC   $3C
         STA   $BE
         LDA   $00
         ADC   $3E
         STA   $C0
         LDA   #$1F9E
         CLC
         ADC   $3C
         STA   $CE
         LDA   $00
         ADC   $3E
         STA   $D0
         LDA   #$149A
         CLC
         ADC   $3C
         STA   $D2
         LDA   $00
         ADC   $3E
         STA   $D4
         LDA   #$0004
         PHK
         PER   L0A27+2
L0A27    BRL   L0406
         LDY   #$0006
         STA   [$3C],Y
         LDY   #$0004
         LDA   [$3C],Y
         BEQ   L0A43
         TAX
         LDA   $00
         PHA
         PHA
         PHX
         PHK
         PER   L0A40+2
L0A40    BRL   *-LA49E
L0A43    LDY   #$0042
         LDA   [$3C],Y
         TAX
         DEY
         DEY
         LDA   [$3C],Y
         LDY   #$01BA
         PHA
         TXA
         STA   [$3C],Y
         DEY
         DEY
         PLA
         STA   [$3C],Y
         DEY
         DEY
         ASL
         PHA
         TXA
         ROL
         STA   [$3C],Y
         PLA
         DEY
         DEY
         STA   [$3C],Y
         PHK
         PER   L0A6A+2
L0A6A    BRL   *-L8F9C
         LDA   $00
         LDY   #$008A
         STA   [$3C],Y
         LDY   #$00C6
         STA   [$3C],Y
         LDY   #$00C8
         STA   [$3C],Y
         LDY   #$0084
         STA   [$3C],Y
         LDY   #$0088
         STA   [$3C],Y
         LDY   #$002C
         STA   [$3C],Y
         STZ   $5C
         PHA
         PHA
         LDA   [$3C]
         PHA
         LDA   $00
         PHK
         PER   L0A9A+2
L0A9A    BRL   *-LA49E
         PER   L0AA0+2
L0AA0    BRL   L3C9E
         BCC   L0AA8
         BRL   L3B9B
L0AA8    PER   L0AAB+2
L0AAB    BRL   L3B48
         LDA   [$28]
         CMP   #$0002
         BEQ   L0AB8
         BRL   L3B9B
L0AB8    PER   L0ABB+2
L0ABB    BRL   L0B62
         STZ   $1C
         STZ   $1E
         LDY   $5C
         LDX   #$0900
         STX   $08
         PHY
         PER   L0AED
         PER   L0AD0+2
L0AD0    BRL   L3B1E
         STY   $5C
         PLA
         PER   L0AD9+2
L0AD9    BRL   L256B
         LDA   $5C
         CLC
         LDY   #$0084
         ADC   [$3C],Y
         PLY
         INY
         STA   [$CE],Y
         STZ   $90
         BRL   L21FC
L0AED    PEA   $0000
         PEA   $0002
         DB    $FF        ; LOGO BUG?
L0AF4    PER   L0AF7+2
L0AF7    BRL   L2114
         PER   L0AFD+2
L0AFD    BRL   L3B48
         LDA   #$00FF
         TRB   $92
         LDA   [$28]
         XBA
         AND   #$00FF
         ASL
         CMP   #$0036
         BMI   L0B1E
         PEA   $0045
         PHK
         PER   L0B18+2
L0B18    BRL   L3CE4
         BRL   L21FC
L0B1E    PER   L0B2C
         TAY
         PHK
         PLB
         LDA   ($01,S),Y
         CLC
         ADC   $01,S
         STA   $01,S
         RTS

L0B2C    DB    $26
         DB    $01
         DB    $67
         DB    $12
         DB    $C0
         DB    $01
         DB    $96
         DB    $03
         DB    $98
         DB    $03
         DB    $D2
         DB    $03
         DB    $3B
         DB    $12
         DB    $3E
         DB    $13
         DB    $B5
         DB    $13
         DB    $AB
         DB    $13
         DB    $79
         DB    $01
         DB    $5B
         DB    $12
         DB    $9D
         DB    $12
         DB    $8B
         DB    $12
         DB    $BA
         DB    $13
         DB    $2A
         DB    $14
         DB    $83
         DB    $14
         DB    $DB
         DB    $14
         DB    $50
         DB    $15
         DB    $F3
         DB    $01
         DB    $E9
         DB    $02
         DB    $45
         DB    $03
         DB    $56
         DB    $02
         DB    $24
         DB    $02
         DB    $F2
         DB    $02
         DB    $3A
         DB    $06
         DB    $83
         DB    $06
L0B62    LDY   #$0086
         LDA   [$3C],Y
         PHA
         ASL
         ASL
         ASL
         ASL
         TAX
         CLC
         ADC   #$000A
         TAY
         LDA   [$E4],Y
         STA   $16
         LDA   #$0082
         LDY   $5C
         STA   [$CE],Y
         INY
         STY   $5E
         INY
         INY
         LDA   #$0007
         STA   $04
         PER   L0B8A+1
L0B8A    BRA   L0BDB
         LDA   $01,S
         DEC
         BNE   L0B9D
         LDX   $00
         LDA   #$0003
         STA   $04
         PER   L0B9B+1
L0B9B    BRA   L0BDB
L0B9D    STY   $5C
         PER   L0BA2+1
L0BA2    BRA   L0BF9
         LDA   $5C
         DEC
         DEC
         DEC
         LDY   $5E
         STA   [$CE],Y
         LDY   $5C
         LDA   #$FFA9
         STA   [$CE],Y
         INY
         INY
         LDA   #$A0FF
         STA   [$CE],Y
         INY
         INY
         LDA   $16
         DEC
         DEC
         STA   [$CE],Y
         INY
         INY
         LDA   #$0097
         STA   [$CE],Y
         INY
         LDA   #$005C
         PLX
         DEX
         BEQ   L0BD5
         LDA   #$0064
L0BD5    STA   [$CE],Y
         INY
         STY   $5C
         RTS

L0BDB    PHY
         TXY
         LDA   [$E4],Y
         PLY
         STA   [$CE],Y
         INY
         INY
         INX
         INX
         DEC   $04
         BPL   L0BDB
         DEY
         DEY
         DEY
         DEY
         LDA   $00
         STA   [$CE],Y
         INY
         INY
         STA   [$CE],Y
         INY
         INY
         RTS

L0BF9    LDY   #$0086
         LDA   [$3C],Y
         PHA
         LDY   $5C
         LDA   #$00F4
         STA   [$CE],Y
         INY
         PLA
         STA   [$CE],Y
         INY
         INY
         LDA   #$00F4
         STA   [$CE],Y
         INY
         LDA   #$0002
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         LDA   #$0800
         STA   $08
         PER   L0C23+2
L0C23    BRL   L256B
         RTS

L0C27    LDY   #$0086
         LDA   [$3C],Y
         TAX
         LDA   #$0013
         DEX
         BNE   L0C36
         LDA   #$001B
L0C36    SEC
         LDY   #$0084
         SBC   [$3C],Y
         SEC
         SBC   $5C
         DEC
         DEC
         DEC
         PHA
         LDY   $5C
         LDA   #$0082
         STA   [$CE],Y
         INY
         PLA
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         RTS

         LDY   $5C
         LDA   #$7602
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         PER   L0C61+1
L0C61    BRA   L0C87
L0C63    LDA   $A2
         TCS
         STZ   $08
         INC   $08
         INC   $08
         PHK
         PER   L0C70+2
L0C70    BRL   L6890
L0C73    PHK
         PER   L0C77+2
L0C77    BRL   *-L8F68
         LDA   $A2
         TCS
         PHK
         PER   L0C81+2
L0C81    BRL   *-L9097
         BRL   L04CA
L0C87    PER   L0C8A+1
L0C8A    BRA   L0C27
         PER   L0C8F+2
L0C8F    BRL   L2114
         LDY   #$0086
         LDA   [$3C],Y
         ASL
         ASL
         ASL
         INC
         ASL
         TAX
         LDY   #$0084
         LDA   [$3C],Y
         TXY
         STA   [$E4],Y
         RTS

         LDA   #$0080
         TRB   $93
         LDY   #$0002
         LDA   [$28],Y
         TAX
         PER   L0CB4+2
L0CB4    BRL   L1DFC
         LDY   #$0004
         PER   L0CBD+2
L0CBD    BRL   L2114
         LDA   #$0080
         TSB   $8C
         LDY   #$0002
         LDA   [$BE],Y
         CLC
         ADC   #$0004
         TAX
         LDY   #$0084
         LDA   [$3C],Y
         TXY
         STA   [$E0],Y
         INX
         INX
         LDY   #$0086
         LDA   [$3C],Y
         TXY
         SEP   #$20
         STA   [$E0],Y
         REP   #$20
         LDA   #$0008
         STA   $2C
         BRL   L0F04
         LDY   #$0002
         LDA   [$28],Y
         PHA
         LDY   #$0032
         LDA   [$3C],Y
         INC
         LDY   #$0032
         STA   [$3C],Y
         DEC
         ASL
         ASL
         PHA
         LDY   #$0088
         LDA   [$3C],Y
         PLY
         STA   [$C6],Y
         TAX
         LDA   #$8000
         INY
         INY
         STA   [$C6],Y
         PLA
         CLC
         STX   $02
         ADC   $02
         LDY   #$0088
         STA   [$3C],Y
         BRL   L0AF4
         LDA   [$28]
         AND   #$00FF
         DEC
         DEC
         PEA   $0000
         PHA
         CLC
         LDY   #$008A
         ADC   [$3C],Y
         LDY   #$008A
         STA   [$3C],Y
         INC   $28
         INC   $28
         PEI   $2A
         PEI   $28
         LDY   #$0002
         LDA   [$3C],Y
         PHA
         LDX   #$0004
         PHK
         PER   L0D4B+2
L0D4B    BRL   L047B
         BRL   L0AF4
         LDY   #$0002
         LDA   [$28],Y
         LSR
         LSR   $72
         ROL
         STA   $72
         AND   #$FCA7
         STA   $1C
         PER   L0D72
         LDY   $5C
         PER   L0D69+2
L0D69    BRL   L3B1E
         PLA
         STY   $5C
         BRL   L21FC
L0D72    LDA   $88
         AND   #$0358
         ORA   #$0000
         STA   $88
         DB    $FF        ; LOGO BUG?
L0D7D    LDA   #$0000
         STA   $8A
         DB    $FF        ; LOGO BUG?
         LDA   #$04F8
         CLC
         ADC   $3C
         STA   $38
         LDA   $00
         ADC   $3E
         STA   $3A
         LDY   #$0002
         LDA   [$28],Y
         BEQ   L0DE6
         CLC
         ADC   #$0009
         TAY
         LDA   [$E0],Y
         AND   #$00FF
         STA   [$38]
         STA   $04
         INY
         LDX   #$0002
         SEP   #$20
L0DAC    LDA   [$E0],Y
         PHY
         TXY
         STA   [$38],Y
         PLY
         INX
         INY
         DEC   $04
         BNE   L0DAC
         TXY
         LDA   $00
         STA   [$38],Y
         REP   #$20
         STZ   $04
         DEC   $04
         PHK
         PER   L0DCF
         PEA   $0006
         PEI   $EE
         PEI   $EC
L0DCF    RTL

         TYA
         BEQ   L0DF9
         CLC
         ADC   #$0009
         TAY
         LDA   [$E0],Y
         AND   #$00FF
         INC
         CLC
         STY   $02
         ADC   $02
         TAY
         LDA   [$E0],Y
L0DE6    PER   L0D7D
         STA   $1C
         LDY   $5C
         PER   L0DF0+2
L0DF0    BRL   L3B1E
         PLA
         STY   $5C
         BRL   L21FC
L0DF9    LDY   #$0002
         LDA   [$28],Y
         TAX
         PHK
         PER   L0E0A
         PEA   $002A
         PEI   $EE
         PEI   $EC
L0E0A    RTL

         LDA   $00
         BRA   L0DE6
         PEA   $0000
         PEA   $0002
         DB    $FF        ; LOGO BUG?
         PER   L0E19+2
L0E19    BRL   L0C27
         BRL   L21FC
         STZ   $08
         LDX   $08
         INC   $08
         INC   $08
         LDY   #$0002
         LDA   [$28],Y
         BEQ   L0E4F
         INC   $08
         INC
         BEQ   L0E4F
         INC
         INC
         INC
         PHA
         INC   $08
         LDY   $5C
         LDA   #$00F4
         STA   [$CE],Y
         INY
         STY   $5C
         PLX
         STZ   $22
         PER   L0E49+2
L0E49    BRL   L1DDC
         LDX   #$0002
L0E4F    PER   L0E52+1
L0E52    BRA   L0E57
         BRL   L21FC
L0E57    LDY   $5C
         LDA   #$00F4
         STA   [$CE],Y
         INY
         TXA
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         LDA   #$0900
         TSB   $08
         PER   L0E6E+2
L0E6E    BRL   L256B
         RTS

         STZ   $08
         LDX   $00
         INC   $08
         LDY   #$0002
         LDA   [$28],Y
         PHA
         BEQ   L0E85
         LDA   #$0005
         STA   $08
L0E85    PER   L0E88+1
L0E88    BRA   L0E57
         PLA
         BNE   L0E99
L0E8D    LDY   $5C
         LDA   #$006B
         STA   [$CE],Y
         INC   $5C
         BRL   L21FC
L0E99    CLC
         ADC   #$0004
         TAX
         LDY   $5C
         LDA   #$688B
         STA   [$CE],Y
         INY
         INY
         LDA   #$4B68
         STA   [$CE],Y
         INY
         INY
         LDA   #$0062
         STA   [$CE],Y
         INY
         STY   $5C
         LDA   #$FFFD
         STA   $22
         PER   L0EBE+2
L0EBE    BRL   L1E0B
         BRA   L0E8D
         BRA   L0ECC
         LDA   $00
         LDY   #$0C8A
         STA   [$3C],Y
L0ECC    LDY   #$0C8A
         LDA   [$3C],Y
         TAX
         LDA   [$28]
         AND   #$00FF
         DEC
         DEC
         STA   $04
         LDY   #$0002
L0EDE    DEC   $04
         DEC   $04
         BMI   L0EF4
         LDA   [$28],Y
         PHX
         TYX
         PLY
         STA   [$BE],Y
         PHX
         TYX
         PLY
         INX
         INX
         INY
         INY
         BRA   L0EDE
L0EF4    TXA
         LSR
         LSR
         LDY   #$0C8A
         STA   [$3C],Y
         BRL   L0AF4
         LDA   #$0002
         STA   $2C
L0F04    LDA   #$0014
         LDY   #$1092
         STA   [$3C],Y
         LDA   $00
         LDY   #$1090
         STA   [$3C],Y
         STZ   $12
         STZ   $88
         STZ   $8A
L0F19    STZ   $B8
         STZ   $8E
         LDA   #$007F
         TRB   $90
         LDX   $2C
         TXY
         INX
         STX   $30
         INC   $30
         LDA   [$28],Y
         XBA
         STA   $14
         LDA   $14
         SEP   #$20
         BPL   L0F74
         AND   #$FC
         LSR
         LSR
         DEC
         DEC
         BEQ   L0F4E
         DEC
         DEC
         DEC
         BEQ   L0F4E
         DEC
         BEQ   L0F74
         DEC
         BEQ   L0F74
         LDA   #$80
         TSB   $8E
         BRA   L0F74
L0F4E    LDY   $30
L0F50    LDA   [$28],Y
         BEQ   L0F65
         INY
         CMP   #$13
         BNE   L0F50
         STY   $30
         LDA   [$28],Y
         CMP   #$11
         BNE   L0F74
         INC   $30
         BRA   L0F74
L0F65    REP   #$20
         PEA   $0045
         PHK
         PER   L0F6E+2
L0F6E    BRL   L3CE4
         BRL   L21FC
L0F74    TXY
L0F75    INY
         LDA   [$28],Y
         BNE   L0F75
         INY
         REP   #$20
         STY   $2E
         LDA   #$00C0
         TRB   $8D
         LDA   #$0080
         TSB   $8D
         PER   L0F8C+2
L0F8C    BRL   L27B2
L0F8F    BIT   $13
         BPL   L0F9D
         BVC   L0F9D
         PER   L1D64
         PEA   $0000
         BRA   L0FA3
L0F9D    PER   L1D4C
         PEA   $0000
L0FA3    PLA
         TAY
         INC
         INC
         PHA
         PHK
         PLB
         LDA   ($03,S),Y
         BMI   L0FF6
         BIT   $8C
         BPL   L0FC0
         CMP   #$1919
         BNE   L0FC0
         BVS   L0FD3
         LDA   #$00C0
         TRB   $8D
         LDA   ($03,S),Y
L0FC0    PER   L0FC3+2
L0FC3    BRL   L221B
         BCS   L0FCE
         BIT   $87
         BVS   L0FA3
         BRA   L0FF6
L0FCE    PLA
         PLA
         BRL   L21FC
L0FD3    LDA   #$00C0
         TRB   $8D
         PLA
         PLA
         BRA   L0F8F
         PEA   $005D
         PHK
         PER   L0FE3+2
L0FE3    BRL   L3CE4
         BRL   L21FC
L0FE9    PEA   $0045
         PHK
         PER   L0FF0+2
L0FF0    BRL   L3CE4
         BRL   L21FC
L0FF6    PLA
         PLA
         LDA   #$00FF
         TRB   $91
         LDA   $14
         XBA
         ASL
         BCC   L1008
         BMI   L1048
         BRL   L1B27
L1008    BPL   L100D
         BRL   L17AC
L100D    BRA   L101B
L100F    LDA   #$007F
         TRB   $90
         LDA   $2E
         STA   $2C
         BRL   L0F19
L101B    LDA   #$003F
         AND   $14
         LSR
         LSR
         DEC
         BEQ   L1048
         DEC
         BNE   L102B
         BRL   L13BA
L102B    DEC
         BNE   L1031
         BRL   L11C0
L1031    DEC
         BEQ   L1095
         DEC
         BNE   L103A
         BRL   L13BA
L103A    DEC
         BNE   L1040
         BRL   L112D
L1040    DEC
         BNE   L1046
         BRL   L11B8
L1046    BRA   L0FE9
L1048    LDA   #$00FF
         TRB   $91
         LDY   $30
         INY
         PER   L1053+2
L1053    BRL   L2A60
         BCC   L105B
         BRL   L21FC
L105B    LDY   $30
         LDA   [$28],Y
         TAX
         INY
         LDA   [$28],Y
         AND   #$FF00
         BNE   L0FE9
         LDA   $14
         BPL   L106F
         BRL   L0FE9
L106F    XBA
         AND   #$007F
         DEC
         ASL
         TAY
         TXA
         STA   [$C2],Y
         BIT   $8F
         BVC   L100F
         LDA   $12
         AND   #$00FF
         CMP   #$0077
         BMI   L108C
         CMP   #$007B
         BMI   L100F
L108C    PER   L108F+2
L108F    BRL   L2A03
         BRL   L100F
L1095    LDA   $00
         LDY   #$00BC
         STA   [$3C],Y
         LDY   #$00C0
         STA   [$3C],Y
         LDA   [$BE]
         AND   #$003F
         LSR
         LSR
         DEC
         DEC
         BEQ   L10BC
         DEC
         BEQ   L10BC
         PEA   $0002
         PHK
         PER   L10B6+2
L10B6    BRL   L3CE4
         BRL   L21FC
L10BC    LDY   #$0002
         LDA   [$BE],Y
         CLC
         ADC   #$0003
         TAY
         LDA   [$E0],Y
         AND   #$00FF
         TYX
         LDY   #$00C4
         STA   [$3C],Y
         STA   $BC
         TXY
         INY
         LDA   [$E0],Y
         BNE   L10E6
         PEA   $0023
         PHK
         PER   L10E0+2
L10E0    BRL   L3CE4
         BRL   L21FC
L10E6    STA   $06
         INY
         INY
         INY
         INY
         LDA   [$E0],Y
         STA   $04
         INY
         LDA   [$E0],Y
         AND   #$00FF
         INC
         CLC
         STY   $02
         ADC   $02
         STA   $BA
         LDY   $5C
         LDA   #$00F4
         TAX
         STA   [$CE],Y
         INY
         LDA   $06
         STA   [$CE],Y
         INY
         INY
         TXA
         STA   [$CE],Y
         INY
         LDA   #$0002
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         LDA   #$0004
         AND   $04
         ORA   #$0740
         STA   $08
         PER   L1127+2
L1127    BRL   L256B
         BRL   L21FC
L112D    LDA   #$0080
         TSB   $8C
         INC   $30
         INC   $30
         BRL   L13BA
L1139    LDA   #$0003
         AND   $14
         BEQ   L1147
         LDY   $5C
         LDA   #$06A5
         BRA   L1159
L1147    LDY   $5C
         DEY
         DEY
         BMI   L1154
         LDA   [$CE],Y
         CMP   #$0485
         BEQ   L115D
L1154    LDA   #$04A5
         INY
         INY
L1159    STA   [$CE],Y
         INY
         INY
L115D    STY   $5C
         LDA   #$0080
         TRB   $8C
         BRL   L21FC
         LDY   #$0002
         LDA   [$28],Y
         STA   [$BE],Y
         CLC
         ADC   #$0008
         TAY
         LDA   [$E0],Y
         AND   #$0003
         STA   [$BE]
         STZ   $36
         LDA   #$0080
         TRB   $92
         TRB   $8F
         LDY   $00
         PER   L1188+2
L1188    BRL   L2F1E
         BCC   L1190
         BRL   L21FC
L1190    LDY   $5C
         LDA   $34
         STA   $1C
         PER   L11A5
         PER   L119C+2
L119C    BRL   L3B1E
         PLA
         STY   $5C
         BRL   L21FC
L11A5    LDA   [$00],Y
         BPL   L11AD
         LDA   $06
         STA   $04
L11AD    LDA   $04
         DB    $FF        ; LOGO BUG?
         LDA   #$0100
         TSB   $72
         BRL   L21FC
L11B8    LDA   #$FFFC
         AND   $14
         INC
         STA   $14
L11C0    LDY   $30
         LDA   [$28],Y
         CMP   #$8062
         BNE   L11CC
         BRL   L21FC
L11CC    LDY   #$0100
         STY   $B2
         LDA   $00
         STA   [$28],Y
         LDY   $30
L11D7    LDA   [$28],Y
         AND   #$00FF
         BEQ   L11E1
         INY
         BRA   L11D7
L11E1    STY   $AE
         STZ   $B8
         STZ   $6E
         STZ   $70
L11E9    LDY   $AE
         LDA   $14
         LSR
         BCS   L1215
         LDX   $00
         LDY   $30
         INY
         INY
         LDA   [$28],Y
         AND   #$00FF
         CMP   #$0064
         BNE   L1212
         LDA   [$28],Y
         BPL   L1212
         XBA
         AND   #$007F
         BEQ   L1212
         CMP   #$0004
         BPL   L1212
         ASL
         ASL
         TAX
L1212    BRL   L12A2
L1215    DEY
         CPY   $30
         BMI   L1290
         BEQ   L1290
         LDA   [$28],Y
         AND   #$00FF
         XBA
         XBA
         BMI   L1231
L1225    XBA
         TYX
         LDY   $B2
         DEY
         STA   [$28],Y
         STY   $B2
         TXY
         BRA   L1215
L1231    DEY
         CPY   $30
         BEQ   L1290
         STY   $AE
         STZ   $AC
         LDA   [$28],Y
         AND   #$00FF
         STA   $AC
         CMP   #$0064
         BEQ   L1284
         LDA   #$0080
         TSB   $8F
         TYA
         INC   $6E
         LDX   #$0400
         PER   L1254+2
L1254    BRL   L157A
         LDX   $AC
         TXA
         AND   #$00FF
         CMP   #$006C
         BEQ   L126D
         CMP   #$006D
         BEQ   L126D
L1267    TXA
         XBA
         LDY   $AE
         BRA   L1225
L126D    TXA
         XBA
         TAX
         AND   #$00FF
         CMP   #$006F
         BEQ   L1267
         PEA   $0074
         PHK
         PER   L127F+2
L127F    BRL   L3CE4
         BRA   L1267
L1284    LDA   [$28],Y
         LDY   $B2
         DEY
         STA   [$28],Y
         STY   $B2
         BRL   L11E9
L1290    LDY   $5C
         LDA   #$00F4
         STA   [$CE],Y
         INY
         LDA   $B8
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         LDX   $00
L12A2    LDY   $30
         LDA   [$28],Y
         BIT   $90
         BVC   L12BC
         AND   #$7F00
         STA   $22
         CLC
         ADC   #$0000
         STA   $08
         LDA   #$0003
         AND   $91
         BRA   L12CE
L12BC    AND   #$FF00
         STA   $22
         CLC
         ADC   #$0000
         STX   $08
         TSB   $08
         LDA   #$0003
         AND   $14
L12CE    BIT   $8F
         BPL   L12D5
         ORA   #$0040
L12D5    TSB   $08
         PER   L12DA+2
L12DA    BRL   L256B
         LDA   #$0080
         STA   [$CE],Y
         INY
         LDA   $14
         TYX
         LSR
         BCS   L1300
         DEY
         STY   $5C
L12EC    BIT   $90
         BVS   L12F3
         BRL   L21FC
L12F3    STZ   $08
         LDA   $91
         LSR
         ROR   $08
         LSR
         ROR   $08
         BRL   L1AC9
L1300    STY   $A0
         LDA   $00
         STA   [$CE],Y
         INX
         TXY
         BIT   $8F
         BPL   L1312
         PER   L130F+2
L130F    BRL   L1394
L1312    LDX   $B2
         INX
         SEP   #$20
         PHY
         TXY
         LDA   [$28],Y
         CMP   #$2C
         BNE   L1320
         INX
L1320    PLY
L1321    PHY
         TXY
         LDA   [$28],Y
         BEQ   L132E
         PLY
         STA   [$CE],Y
         INY
         INX
         BRA   L1321
L132E    REP   #$20
         PLY
         LDA   $22
         XBA
         CMP   #$009E
         BNE   L133E
         PER   L133C+1
L133C    BRA   L135F
L133E    LDA   $00
         STA   [$CE],Y
         INY
         STY   $5C
         LDX   $70
         BEQ   L1352
L1349    STA   [$CE],Y
         INY
         DEX
         BNE   L1349
         STY   $5C
         DEY
L1352    TYA
         DEC
         SEC
         SBC   $A0
         LDY   $A0
         ORA   [$CE],Y
         STA   [$CE],Y
         BRA   L12EC
L135F    LDA   $14
         BIT   #$0002
         BNE   L1386
L1366    BIT   $8F
         BPL   L1393
         LDA   #$00FF
         STA   [$CE],Y
         INY
         LDA   $00
         STA   [$CE],Y
         TYA
         INY
         INY
         PHY
         CLC
         LDY   #$0084
         ADC   [$3C],Y
         LDY   #$01D4
         STA   [$3C],Y
         PLY
         BRA   L1393
L1386    LDA   #$0080
         BIT   $8F
         BMI   L1391
         TSB   $90
         BRA   L1366
L1391    TRB   $90
L1393    RTS

L1394    PHY
         LDY   #$0086
         LDA   [$3C],Y
         STA   $19
         LDA   #$0003
         STA   $16
         LDY   #$01D4
         LDA   [$3C],Y
         STA   $17
         LDA   $01,S
         CLC
         LDY   #$0084
         ADC   [$3C],Y
         STA   $1A
         PER   L13B5+2
L13B5    BRL   L2173
         PLY
         RTS

L13BA    LDA   $12
         BEQ   L13D2
         BIT   $89
         BPL   L13D2
         LDA   #$0080
         TRB   $8A
         LDY   $5C
         LDA   #$0485
         STA   [$CE],Y
         INC   $5C
         INC   $5C
L13D2    LDY   $2C
         INY
         INY
         LDA   [$28],Y
         AND   #$00FF
         SEC
         SBC   #$0077
         BPL   L13E4
         BRL   L1496
L13E4    CMP   #$0004
         BCC   L13EC
         BRL   L1496
L13EC    TAX
         LDA   $BC
         DEC
         STA   $BC
         BPL   L1401
         PEA   $0019
         PHK
         PER   L13FB+2
L13FB    BRL   L3CE4
         BRL   L21FC
L1401    CLC
         ADC   $BA
         TAY
         LDA   [$E0],Y
         AND   #$0003
         SEC
         STX   $02
         SBC   $02
         BEQ   L141E
         PEA   $000D
         PHK
         PER   L1418+2
L1418    BRL   L3CE4
         BRL   L21FC
L141E    LDY   $30
         LDA   [$28],Y
         AND   #$00FF
         CMP   #$006E
         BEQ   L1468
         CMP   #$0068
         BNE   L1496
         INY
         PER   L1433+2
L1433    BRL   L2A60
         LDY   $30
         LDA   [$28],Y
         AND   #$00FF
         CMP   #$0077
         BCC   L1447
         CMP   #$007B
         BCC   L1451
L1447    PEA   $0045
         PHK
         PER   L144E+2
L144E    BRL   L3CE4
L1451    STZ   $12
         LDY   $5C
         LDA   #$32D4
         STA   [$CE],Y
         INY
         INY
         LDA   #$30D4
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         BRL   L21FC
L1468    LDY   $30
         LDA   [$28],Y
         XBA
         AND   #$007F
         DEC
         ASL
         ASL
         TAY
         LDA   [$BE],Y
         AND   #$00FF
         CMP   #$00FF
         BEQ   L1496
         LDA   #$0080
         TSB   $8F
         LDA   $30
         LDX   #$0400
         PER   L148B+2
L148B    BRL   L157A
         LDA   #$0080
         TRB   $8F
         BRL   L21FC
L1496    LDY   $30
         INY
         PER   L149C+2
L149C    BRL   L2A60
         BIT   $8A
         BMI   L14A6
         BRL   L15B5
L14A6    LDY   $30
         LDA   $12
         BNE   L14AF
         BRL   L0FE9
L14AF    CMP   [$28],Y
         BEQ   L14BE
         LDA   $12
         PER   L14B8+2
L14B8    BRL   L2C19
         BRL   L15B5
L14BE    LDA   #$C000
         AND   $08
         CLC
         ROL
         ROL
         ROL
         PHA
         LDA   #$0003
         AND   $14
         CMP   $01,S
         BEQ   L14E3
         PLA
         ASL
         ASL
         STA   $08
         PER   L14D9+2
L14D9    BRL   L2A55
         LDA   $5C
         STA   $5E
         BRL   L15C8
L14E3    PLA
L14E4    BIT   $8B
         BPL   L150C
L14E8    STZ   $08
         DEC   $08
         PER   L14EF+2
L14EF    BRL   L2A12
         LDA   #$00FC
         AND   $14
         CMP   #$0018
         BNE   L14FF
         BRL   L1139
L14FF    LDY   $5C
         LDA   #$0060
         STA   [$CE],Y
         INY
         STY   $5C
         BRL   L21FC
L150C    LDA   #$0003
         AND   $14
         CMP   #$0003
         BEQ   L1545
         PER   L1519+2
L1519    BRL   L1675
         BCC   L1521
         BRL   L21FC
L1521    BIT   $89
         BPL   L152E
         PER   L1528+2
L1528    BRL   L3145
         BRL   L21FC
L152E    LDA   #$0003
         AND   $14
         CLC
         ROR
         ROR
         ROR
         ORA   #$0106
         STA   $34
         PER   L153F+2
L153F    BRL   L3151
         BRL   L21FC
L1545    LDA   #$0080
         TSB   $92
         LDA   #$0400
         STA   $36
         PER   L1552+2
L1552    BRL   L1677
         LDA   $36
         ORA   #$C000
         STA   $34
         LDA   #$010A
         STA   $36
         PER   L1564+2
L1564    BRL   L3151
         LDA   #$0080
         TRB   $92
         LDA   #$050F
         STA   $08
         PER   L1574+2
L1574    BRL   L256B
         BRL   L21FC
L157A    INC
         INC
         STA   $06
         LDA   #$3F7F
         TRB   $8A
         BRA   L1593
L1585    INC
         INC
         STA   $06
         PHX
         PER   L158D+2
L158D    BRL   L2A03
         PLX
         STZ   $8A
L1593    LDA   #$0013
         STA   $0A
         LDA   #$8000
         STA   $08
         STZ   $60
         STZ   $64
         STZ   $88
         LDA   #$0040
         TRB   $8C
         LDA   $5C
         STA   $5E
         STX   $36
         PER   L15B1+2
L15B1    BRL   L28B7
         RTS

L15B5    LDA   $5C
         STA   $5E
         LDA   $30
         LDX   #$0106
         PER   L15C1+1
L15C1    BRA   L1585
         BCC   L15C8
         BRL   L21FC
L15C8    LDA   #$0003
         AND   $14
         PHA
         LDA   $08
         LSR
         LSR
         AND   #$0003
         STA   $08
         PLX
         CMP   #$0003
         BNE   L15F3
         TXA
         CPX   #$0003
         BNE   L15E6
         BRL   L14E4
L15E6    PEA   $0002
         PHK
         PER   L15ED+2
L15ED    BRL   L3CE4
         BRL   L21FC
L15F3    CPX   #$0003
         BEQ   L15E6
         TXA
         CMP   $08
         BNE   L1606
         BIT   $8B
         BPL   L1604
         BRL   L14E8
L1604    BRA   L1639
L1606    CLC
         ROR
         ROR
         ROR
         TSB   $08
         LDA   #$000B
         STA   $0A
         PER   L1614+2
L1614    BRL   L2584
         PER   L161A+2
L161A    BRL   L2D64
         BCC   L1622
         BRL   L21FC
L1622    BIT   $8B
         BMI   L165D
         BVS   L1639
         BIT   $89
         BVC   L162F
         BRL   L14E4
L162F    LDY   $30
         STA   [$28],Y
         INY
         INY
         STY   $06
         BRA   L163F
L1639    LDY   $30
         INY
         INY
         STY   $06
L163F    LDA   $5E
         STA   $5C
         PER   L1646+1
L1646    BRA   L1675
         BCC   L164D
         BRL   L21FC
L164D    STZ   $64
         LDA   #$8000
         STA   $08
         PER   L1657+2
L1657    BRL   L28B7
         BRL   L21FC
L165D    BIT   $89
         BVC   L1664
         BRL   L14E8
L1664    LDY   $30
         STA   [$28],Y
         TYA
         LDX   #$0106
         PER   L166F+2
L166F    BRL   L1585
         BRL   L14E8
L1675    STZ   $36
L1677    LDY   $2C
         INY
         INY
         LDA   [$28],Y
         TAX
         AND   #$00FF
         CMP   #$006E
         BNE   L169F
         TXA
         XBA
         AND   #$007F
         DEC
         ASL
         ASL
         TAY
         PER   L1692+2
L1692    BRL   L2F1E
         BCS   L169E
         LDA   #$3FFF
         AND   $34
         STA   $36
L169E    RTS

L169F    CMP   #$0068
         BNE   L16A7
         BRL   L176B
L16A7    SEC
         SBC   #$0077
         BMI   L16D0
         TAX
         STA   $16
         CMP   #$0003
         BEQ   L16DD
         BCS   L16D0
         LDY   #$00BC
         LDA   [$3C],Y
         STA   $1C
         LDY   #$00BE
         STA   [$3C],Y
         CPX   #$0001
         BMI   L16F4
         BEQ   L16F8
         CLC
         ADC   #$0008
         BRA   L16FC
L16D0    PEA   $0045
         PHK
         PER   L16D7+2
L16D7    BRL   L3CE4
         SEC
         BRA   L169E
L16DD    LDY   #$00C0
         LDA   [$3C],Y
         STA   $1C
         LDY   #$00C2
         STA   [$3C],Y
         INC
         INC
         INC
         INC
         LDY   #$00C0
         STA   [$3C],Y
         BRA   L1701
L16F4    INC
         INC
         BRA   L16FC
L16F8    INC
         INC
         INC
         INC
L16FC    LDY   #$00BC
         STA   [$3C],Y
L1701    LDY   $2C
         INY
         INY
         LDA   [$28],Y
         XBA
         AND   #$007F
         DEC
         ASL
         ASL
         CLC
         ADC   #$0048
         STA   $1E
         ORA   #$0200
         STA   $36
         INC
         INC
         STA   $1F
         LDY   $5C
         STY   $5E
         LDA   $1C
         STA   $20
         BNE   L1731
         LDA   $1E
         XBA
         STA   $1C
         PER   L3879
         BRA   L1734
L1731    PER   L386A
L1734    PER   L1737+2
L1737    BRL   L3B1E
         PLA
         LDA   #$00A0
         LDX   $16
         CPX   #$0003
         BNE   L1748
         LDA   #$00A9
L1748    STA   [$CE],Y
         INY
         LDA   $20
         LSR   $16
         BCC   L1757
         LSR   $16
         BCS   L1761
         BRA   L175F
L1757    LSR   $16
         BCC   L1761
         INC
         INC
         INC
         INC
L175F    INC
         INC
L1761    STA   [$CE],Y
         INY
         INY
         STY   $5C
         CLC
         BRL   L169E
L176B    LDY   $5C
         LDA   #$00A9
         BIT   $91
         BMI   L177B
         BIT   $8E
         BMI   L177B
         LDA   #$00A0
L177B    STA   [$CE],Y
         INY
         LDA   $00
         BIT   $8E
         BMI   L179D
         BIT   $91
         BMI   L179D
         LDA   #$0003
         AND   $14
         TAX
         BEQ   L179D
         LDA   #$0002
         DEX
         BEQ   L179D
         DEX
         BNE   L179D
         INC
         INC
         INC
         INC
L179D    STA   [$CE],Y
         INY
         INY
         STY   $5C
         LDA   #$0230
         STA   $36
         CLC
         BRL   L169E
L17AC    STZ   $B4
         LDA   $14
         XBA
         ASL
         ASL
         ASL
         BCS   L17B9
         BRL   L19F7
L17B9    BMI   L17BE
         BRL   L1CE1
L17BE    BIT   $92
         BPL   L17D2
         LDA   #$7702
         LDY   $5C
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         LDA   #$0080
         TRB   $93
L17D2    LDY   $30
         LDA   [$28],Y
         TAX
         AND   #$00FF
         CMP   #$006E
         BEQ   L17E2
         BRL   L0FE9
L17E2    TXA
         XBA
         PER   L17E7+2
L17E7    BRL   L8854
L17EA    PER   L17ED+2
L17ED    BRL   L19D0
         BCC   L17F5
         BRL   L18BB
L17F5    LDA   [$28],Y
         AND   #$FF00
         BNE   L17FF
         BRL   L18BB
L17FF    STA   [$28],Y
         INY
         STY   $16
         INY
         PER   L1808+2
L1808    BRL   L2A60
         BIT   $8A
         BPL   L1819
         LDA   $12
         BEQ   L1819
         PER   L1816+2
L1816    BRL   L2C19
L1819    LDA   $5C
         STA   $5E
         LDA   $16
         LDX   #$0106
         PER   L1825+2
L1825    BRL   L1585
         BCC   L182D
         BRL   L21FC
L182D    LDY   $B6
         LDA   #$0003
         AND   [$E0],Y
         PHA
         LDA   $08
         LSR
         LSR
         AND   #$0003
         CMP   $01,S
         BEQ   L18A3
         CMP   #$0003
         BNE   L1852
L1845    PEA   $0002
         PHK
         PER   L184C+2
L184C    BRL   L3CE4
         BRL   L21FC
L1852    STA   $08
         LDA   $01,S
         CMP   #$0003
         BEQ   L1845
         LDA   $08
         ASL
         ASL
         ASL
         ORA   $01,S
         CLC
         ROR
         ROR
         ROR
         STA   $08
         LDA   #$000B
         STA   $0A
         PLA
         PER   L1871+2
L1871    BRL   L2584
         BIT   $89
         BVS   L1885
         PER   L187B+2
L187B    BRL   L2D64
         LDY   $16
         STA   [$28],Y
         PHA
         BRA   L18A3
L1885    LDA   #$0400
         STA   $36
         LDA   #$C000
         AND   $08
         ORA   #$0106
         STA   $34
         PER   L1897+2
L1897    BRL   L3151
         STZ   $12
         STZ   $88
         STZ   $8A
         BRL   L17EA
L18A3    PLA
         LDA   $5E
         STA   $5C
         LDX   #$0400
         LDA   $16
         PER   L18B0+2
L18B0    BRL   L1585
         BCC   L18B8
         BRL   L21FC
L18B8    BRL   L17EA
L18BB    LDY   #$1092
         LDA   [$3C],Y
         LDY   $5C
         CMP   #$0024
         BMI   L18FD
         CLC
         ADC   #$FFDC
         PHA
         LDA   #$4400
         ORA   #$00A5
         STA   [$CE],Y
         INY
         INY
         LDA   #$6918
         STA   [$CE],Y
         INY
         INY
         PLA
         STA   [$CE],Y
         INY
         INY
         LDA   #$4400
         ORA   #$0085
         STA   [$CE],Y
         INY
         INY
         LDA   #$0290
         STA   [$CE],Y
         INY
         INY
         LDA   #$4600
         ORA   #$00E6
         STA   [$CE],Y
         INY
         INY
L18FD    TYX
         LDY   $30
         LDA   [$28],Y
         XBA
         AND   #$007F
         DEC
         ASL
         ASL
         TAY
         INY
         INY
         LDA   [$BE],Y
         CLC
         ADC   #$0004
         TAY
         LDA   [$E0],Y
         SEC
         STX   $02
         SBC   $02
         SEC
         SBC   #$0006
         SEC
         LDY   #$0084
         SBC   [$3C],Y
         PHA
         TXY
         LDA   #$0262
         STA   [$CE],Y
         INY
         INY
         LDA   #$8200
         STA   [$CE],Y
         INY
         INY
         PLA
         STA   [$CE],Y
         INY
         INY
         TYX
         LDY   #$1092
         LDA   [$3C],Y
         TXY
         CMP   #$0024
         BMI   L197B
         CLC
         ADC   #$FFDC
         PHA
         LDA   #$4400
         ORA   #$00A5
         STA   [$CE],Y
         INY
         INY
         LDA   #$E938
         STA   [$CE],Y
         INY
         INY
         PLA
         STA   [$CE],Y
         INY
         INY
         LDA   #$4400
         ORA   #$0085
         STA   [$CE],Y
         INY
         INY
         LDA   #$02B0
         STA   [$CE],Y
         INY
         INY
         LDA   #$4600
         ORA   #$00C6
         STA   [$CE],Y
         INY
         INY
L197B    PER   L197E+1
L197E    BRA   L19AE
         PER   L1983+2
L1983    BRL   L2114
         LDA   #$0003
         AND   $14
         CLC
         ROR
         ROR
         ROR
         STA   $08
         LDA   #$4000
         STA   $88
         XBA
         STA   $8A
         PER   L199C+2
L199C    BRL   L2D64
         LDY   $30
         STA   [$28],Y
         STA   $12
         LDA   $00
         INY
         INY
         STA   [$28],Y
         BRL   L1048
L19AE    LDA   $B8
         BEQ   L19CD
         LDA   #$183B
         STA   [$CE],Y
         INY
         INY
         LDA   #$0069
         STA   [$CE],Y
         INY
         LDA   $B8
         STA   [$CE],Y
         INY
         INY
         STZ   $B8
         LDA   #$001B
         STA   [$CE],Y
         INY
L19CD    STY   $5C
         RTS

L19D0    LDY   $B4
         DEY
         STY   $B6
         LDY   $30
         LDX   #$FFFF
         SEP   #$20
L19DC    LDA   [$28],Y
         BEQ   L19ED
         CMP   #$2C
         BNE   L19EA
         LDX   $B6
         INX
         STX   $B6
         TYX
L19EA    INY
         BRA   L19DC
L19ED    SEC
         INX
         BEQ   L19F3
         DEX
         CLC
L19F3    TXY
         REP   #$20
         RTS

L19F7    PER   L19FA+1
L19FA    BRA   L19D0
         BCS   L1A43
         LDA   [$28],Y
         AND   #$FF00
         BEQ   L1A43
         STA   [$28],Y
         INY
         STY   $16
         INY
         PER   L1A0E+2
L1A0E    BRL   L2A60
         LDA   $5C
         STA   $5E
         LDA   #$0040
         TSB   $8B
         LDA   $16
         LDX   #$0106
         PER   L1A22+2
L1A22    BRL   L157A
         LDA   #$0040
         TRB   $8B
         BCC   L1A2F
         BRL   L21FC
L1A2F    ASL   $08
         LSR   $08
         LSR   $08
         LSR   $08
         BIT   $90
         BVC   L1A4A
L1A3B    PER   L1A3E+2
L1A3E    BRL   L2A55
         BRA   L1A4A
L1A43    BIT   $90
         BVS   L1A3B
         BRL   L1B1A
L1A4A    BIT   $90
         BMI   L1A8E
         LDA   #$000C
         AND   $14
         CMP   #$000C
         BEQ   L1A84
         LDA   #$0003
         AND   $08
         CMP   #$0003
         BNE   L1A8E
L1A62    BIT   $90
         BVC   L1A77
         LDY   $30
         LDA   [$28],Y
         AND   #$7F00
         CMP   #$1900
         BMI   L1A77
         CMP   #$1E00
         BMI   L1A8E
L1A77    PEA   $000D
         PHK
         PER   L1A7E+2
L1A7E    BRL   L3CE4
         BRL   L21FC
L1A84    LDA   #$0003
         AND   $08
         CMP   #$0003
         BNE   L1A62
L1A8E    LDY   $30
         LDA   [$28],Y
         AND   #$00FF
         CMP   #$0063
         BEQ   L1A9D
         BRL   L0FE9
L1A9D    PER   L1AA0+2
L1AA0    BRL   L2A03
         LDY   $30
         LDA   [$28],Y
         AND   #$7F00
         BIT   $90
         BVS   L1AFF
         CLC
         ADC   #$1800
         TSB   $08
         LDA   #$0003
         AND   $14
         ASL   $08
         ASL   $08
         ROR
         ROR   $08
         ROR
         ROR   $08
         PER   L1AC6+2
L1AC6    BRL   L2597
L1AC9    LDA   #$3FFF
         TRB   $08
         LDA   #$4000
         STA   $88
         LDA   #$FFBF
         BIT   $90
         BVS   L1ADC
         TRB   $8A
L1ADC    PER   L1ADF+2
L1ADF    BRL   L2D64
         BCC   L1AE7
         BRL   L21FC
L1AE7    LDY   $30
         STA   [$28],Y
         STA   $12
         LDA   $00
         INY
         INY
         STA   [$28],Y
         BIT   $8A
         BPL   L1AFA
         BRL   L1048
L1AFA    STZ   $12
         BRL   L1048
L1AFF    TSB   $08
         LDA   #$0003
         AND   $14
         ASL
         ASL
         TSB   $08
         PER   L1B0D+2
L1B0D    BRL   L256B
         LDA   $14
         LSR
         ROR   $08
         LSR
         ROR   $08
         BRA   L1AC9
L1B1A    PEA   $0095
         PHK
         PER   L1B21+2
L1B21    BRL   L3CE4
         BRL   L21FC
L1B27    STZ   $B8
         LDA   $30
         STA   $16
L1B2D    PER   L1B30+2
L1B30    BRL   L1CC7
         BCC   L1B38
         BRL   L1BCF
L1B38    LDA   [$28],Y
         AND   #$FF00
         BNE   L1B42
         BRL   L1BCF
L1B42    STA   [$28],Y
         INY
         STY   $16
         INY
         PER   L1B4B+2
L1B4B    BRL   L2A60
         BCC   L1B53
         BRL   L21FC
L1B53    LDA   $5C
         STA   $5E
         LDY   $16
         PER   L1B5C+2
L1B5C    BRL   L29B2
         TXA
         BNE   L1B74
         LDA   $16
         LDX   #$0400
         PER   L1B6A+2
L1B6A    BRL   L157A
         BCC   L1B72
         BRL   L21FC
L1B72    BRA   L1B2D
L1B74    LDA   $16
         LDX   #$0106
         PER   L1B7C+2
L1B7C    BRL   L157A
         BCC   L1B84
         BRL   L21FC
L1B84    ASL   $08
         LSR   $08
         LSR   $08
         LSR   $08
         LDA   $08
         BNE   L1B94
         LDY   $5C
         BRA   L1BA7
L1B94    STZ   $64
         LDA   #$0100
         TSB   $08
         PER   L1B9E+2
L1B9E    BRL   L2597
         BIT   $89
         BVC   L1BB7
         LDY   $5C
L1BA7    LDA   #$04D4
         STA   [$CE],Y
         INY
         INY
         INC   $B8
         INC   $B8
         STY   $5C
         BRL   L1B2D
L1BB7    LDA   #$4000
         STA   $88
         LDA   #$FFBF
         TRB   $8A
         PER   L1BC4+2
L1BC4    BRL   L2D64
         STZ   $12
         LDY   $16
         STA   [$28],Y
         BRA   L1B74
L1BCF    LDY   $30
         LDA   [$28],Y
         XBA
         AND   #$007F
         DEC
         ASL
         ASL
         TAY
         INY
         INY
         LDA   [$BE],Y
         INC
         INC
         STA   $16
         INC
         INC
         TAY
         LDA   [$E0],Y
         STA   $1C
         INY
         INY
         LDA   [$E0],Y
         XBA
         TAX
         DEC
         ASL
         ASL
         CLC
         ADC   #$0050
         STA   $1E
         INC
         INC
         XBA
         TSB   $1E
         CPX   #$0007
         BNE   L1C13
         INC   $1C
         INC   $1C
         LDA   $1E
         XBA
         DEC
         DEC
         STA   $1E
         PER   L387E
         BRA   L1C16
L1C13    PER   L386A
L1C16    LDY   $5C
         PER   L1C1B+2
L1C1B    BRL   L3B1E
         PLA
         LDA   #$00F4
         STA   [$CE],Y
         INY
         LDA   $B8
         INC
         INC
         INC
         INC
         STA   [$CE],Y
         INY
         INY
         LDX   #$0200
         LDA   $14
         BIT   #$0010
         BEQ   L1C41
         BIT   #$0020
         BNE   L1C41
         LDX   #$0110
L1C41    STY   $5C
         STX   $08
         AND   #$002F
         TSB   $08
         LDY   $16
         INY
         INY
         INY
         INY
         INY
         INY
         LDA   [$E0],Y
         TAX
         AND   #$0008
         ASL
         ASL
         ASL
         TSB   $08
         TXA
         AND   #$0004
         ASL
         ASL
         TSB   $08
         PER   L1C68+2
L1C68    BRL   L256B
         STZ   $08
         LDA   $14
         LSR
         ROR   $08
         LSR
         ROR   $08
         PER   L1C78+2
L1C78    BRL   L2114
         LDA   #$0020
         BIT   $14
         BEQ   L1CA5
         LSR
         BIT   $14
         BEQ   L1C9C
         LDA   #$0040
         TSB   $90
         LDA   $14
         ASL   $08
         ASL   $08
         LSR
         LSR
         LSR
         ROR   $08
         LSR
         ROR   $08
         BRA   L1CAA
L1C9C    STZ   $88
         STZ   $8A
         STZ   $12
         BRL   L100F
L1CA5    LSR
         BIT   $14
         BNE   L1C9C
L1CAA    LDA   #$4000
         STA   $88
         XBA
         STA   $8A
         PER   L1CB5+2
L1CB5    BRL   L2D64
         LDY   $30
         STA   [$28],Y
         STA   $12
         LDA   $00
         INY
         INY
         STA   [$28],Y
         BRL   L1048
L1CC7    LDY   $16
         LDX   $00
         SEP   #$20
L1CCD    LDA   [$28],Y
         BEQ   L1CD9
         CMP   #$2C
         BEQ   L1CD8
         INY
         BRA   L1CCD
L1CD8    TYX
L1CD9    REP   #$20
         SEC
         TXY
         BEQ   L1CE0
         CLC
L1CE0    RTS

L1CE1    STZ   $08
         LDA   #$00FF
         TRB   $91
         LDA   #$0040
         TSB   $91
         LDY   $30
         LDA   [$28],Y
         AND   #$7F00
         XBA
         CMP   #$000F
         BPL   L1D07
         PEA   $0045
         PHK
         PER   L1D01+2
L1D01    BRL   L3CE4
         BRL   L21FC
L1D07    CMP   #$0019
         BMI   L1D1E
         BEQ   L1D26
         CMP   #$001E
         BPL   L1D16
         BRL   L19F7
L1D16    CMP   #$0032
         BMI   L1D40
         BRL   L19F7
L1D1E    LDA   #$0080
         TSB   $91
         BRL   L19F7
L1D26    INY
         INY
         LDA   [$28],Y
         AND   #$FF00
         BEQ   L1D32
         BRL   L19F7
L1D32    PER   L1D35+2
L1D35    BRL   L2A03
         LDA   #$0003
         STA   $08
         BRL   L19F7
L1D40    LDA   #$0003
         TRB   $91
         AND   $14
         TSB   $91
         BRL   L11B8
L1D4C    DB    $0C
         DB    $0C
         DB    $0E
         DB    $0D
         DB    $0F
         DB    $0F
         DB    $10
         DB    $10
         DB    $12
         DB    $11
         DB    $18
         DB    $13
         DB    $19
         DB    $19
         DB    $1A
         DB    $1A
         DB    $1C
         DB    $1B
         DB    $1D
         DB    $1D
         DB    $1E
         DB    $1E
         DB    $FF
         DB    $FF
L1D64    DB    $2C
         DB    $2C
         DB    $FF
         DB    $FF
         LDY   #$0002
         LDA   [$28],Y
         TAX
         LDY   #$0086
         LDA   [$3C],Y
         PHA
         LDY   #$0084
         LDA   [$3C],Y
         TXY
         STA   [$E4],Y
         INY
         INY
         PLA
         SEP   #$20
         STA   [$E4],Y
         REP   #$20
         BRL   L0AF4
         LDA   #$0080
         TRB   $8C
         LDY   #$0002
         LDA   [$28],Y
         BRA   L1D9D
         LDY   #$0002
         LDA   [$28],Y
         CLC
         ADC   #$0004
L1D9D    TAX
         LDY   #$0086
         LDA   [$3C],Y
         PHA
         LDY   #$0084
         LDA   [$3C],Y
         TXY
         STA   [$E0],Y
         INY
         INY
         PLA
         SEP   #$20
         STA   [$E0],Y
         REP   #$20
         BRL   L0AF4
         LDY   #$0002
         LDA   [$28],Y
         CLC
         ADC   #$0004
         TAX
         PER   L1DC5+1
L1DC5    BRA   L1DEA
         BRL   L21FC
         LDY   #$0002
         LDA   [$28],Y
         CLC
         ADC   #$0004
         TAX
         PER   L1DD7+1
L1DD7    BRA   L1DFC
         BRL   L21FC
L1DDC    LDY   #$0086
         LDA   [$3C],Y
         STA   $19
         LDA   #$0002
         STA   $16
         BRA   L1E17
L1DEA    LDY   $5C
         LDA   #$624B
         STA   [$CE],Y
         INY
         INY
         LDA   #$0002
         STA   [$CE],Y
         INY
         INY
         BRA   L1DFE
L1DFC    LDY   $5C
L1DFE    LDA   #$0082
         STA   [$CE],Y
         INY
         STY   $5C
         LDA   #$FFFE
         STA   $22
L1E0B    LDY   #$0086
         LDA   [$3C],Y
         STA   $19
         LDA   #$0001
         STA   $16
L1E17    STX   $1A
         TXY
         LDA   [$E0],Y
         BEQ   L1E3A
         CLC
         ADC   $22
         DEC   $16
         DEC   $16
         BEQ   L1E30
         SEC
         LDY   #$0084
         SBC   [$3C],Y
         SEC
         SBC   $5C
L1E30    LDY   $5C
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         BRA   L1E6A
L1E3A    INY
         INY
         LDA   [$E0],Y
         AND   #$FF00
         CMP   #$7E00
         BEQ   L1E50
         PEA   $0012
         PHK
         PER   L1E4D+2
L1E4D    BRL   L3CE4
L1E50    LDA   $5C
         CLC
         LDY   #$0084
         ADC   [$3C],Y
         STA   $17
         LDY   $5C
         LDA   $22
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         PER   L1E67+2
L1E67    BRL   L2165
L1E6A    RTS

         LDY   $00
L1E6D    LDA   #$0082
         STA   [$CE],Y
         INY
         TYX
         LDY   #$0086
         LDA   [$3C],Y
         STA   $19
         LDA   $00
         STA   $16
         LDY   #$0002
         LDA   [$28],Y
         STA   $1A
         TAY
         LDA   [$E4],Y
         BEQ   L1EBF
         PHY
         DEC
         DEC
         SEC
         LDY   #$0084
         SBC   [$3C],Y
         SEC
         STX   $02
         SBC   $02
         TXY
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         PLY
         INY
         INY
         LDA   [$E4],Y
         AND   #$00FF
         LDY   #$0086
         CMP   [$3C],Y
         BNE   L1EB2
         BRL   L21FC
L1EB2    PEA   $0045
         PHK
         PER   L1EB9+2
L1EB9    BRL   L3CE4
         BRL   L21FC
L1EBF    TXA
         CLC
         LDY   #$0084
         ADC   [$3C],Y
         STA   $17
         TXY
         LDA   #$FFFE
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         PER   L21FA+1
         BRL   L2165
         LDA   #$03F0
L1EDB    STA   [$CE]
         LDY   #$0002
         BRA   L1E6D
         LDA   #$03D0
         BRA   L1EDB
         LDY   #$0002
         LDA   [$28],Y
         TAY
         INY
         INY
         INY
         LDA   #$00F4
         STA   [$CE]
         LDA   [$E0],Y
         AND   #$00FF
         TYX
         LDY   #$0001
         STA   [$CE],Y
         INY
         INY
         LDA   #$00F4
         STA   [$CE],Y
         INY
         PHY
         TXY
         INY
         INY
         INY
         LDA   [$E0],Y
         TYX
         PLY
         STA   [$CE],Y
         INY
         INY
         LDA   #$00F4
         STA   [$CE],Y
         INY
         PHY
         TXY
         DEY
         DEY
         LDA   [$E0],Y
         PLY
         STA   [$CE],Y
         INY
         INY
         LDA   #$00F4
         STA   [$CE],Y
         INY
         LDA   #$0006
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         TXY
         INY
         INY
         LDA   #$000B
         AND   [$E0],Y
         ORA   #$0100
         STA   $08
         TXY
         DEY
         DEY
         DEY
         DEY
         LDA   #$0004
         AND   [$E0],Y
         TSB   $08
         PER   L1F51+2
L1F51    BRL   L256B
         BRL   L21FC
         LDA   $BC
         BEQ   L1F68
         PEA   $0045
         PHK
         PER   L1F62+2
L1F62    BRL   L3CE4
         BRL   L21FC
L1F68    LDY   #$0002
         LDA   [$28],Y
         INC
         INC
         INC
         INC
         TAY
         LDA   [$E0],Y
         PHA
         INY
         INY
         INY
         INY
         LDA   [$E0],Y
         AND   #$0004
         ORA   #$0700
         STA   $08
         LDY   $5C
         LDA   #$00F4
         STA   [$CE],Y
         INY
         PLA
         STA   [$CE],Y
         INY
         INY
         LDA   #$00F4
         STA   [$CE],Y
         INY
         TYX
         LDY   #$00C4
         LDA   [$3C],Y
         ASL
         ASL
         INC
         INC
         TXY
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         PER   L1FAA+2
L1FAA    BRL   L256B
         BRL   L21FC
         PER   L1FB3+2
L1FB3    BRL   L0C87
         LDY   #$0086
         LDA   [$3C],Y
         INC
         PHA
         LDY   #$0086
         STA   [$3C],Y
         ASL
         ASL
         ASL
         ASL
         TAX
         LDY   #$0004
         LDA   [$28],Y
         TAY
         INY
         INY
         LDA   [$E0],Y
         AND   #$FF00
         PHA
         INY
         INY
         INY
         INY
         INY
         INY
         LDA   [$E0],Y
         AND   #$0004
         LSR
         LSR
         XBA
         LSR
         ORA   $03,S
         ORA   $01,S
         PHY
         TXY
         STA   [$E4],Y
         TYA
         CLC
         ADC   #$000C
         TAY
         PLA
         INC
         STA   [$E4],Y
         PLA
         PLA
         LDA   $00
         LDY   #$0084
         STA   [$3C],Y
         PER   L2002+2
L2002    BRL   L0B62
         BRL   L21FC
         STZ   $1C
         LDY   #$0002
         LDA   [$28],Y
         CMP   #$0019
         BNE   L202A
         LDY   $5C
         LDA   #$0048
         STA   [$CE],Y
         INY
         LDA   #$04D4
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         LDA   #$0004
         STA   $1C
L202A    LDA   #$00F4
         LDY   $5C
         STA   [$CE],Y
         INY
         STY   $5C
         LDY   #$0004
         LDA   [$28],Y
         BNE   L2045
         LDY   $5C
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         BRA   L2052
L2045    CLC
         ADC   #$0004
         TAX
         STZ   $22
         PER   L204F+2
L204F    BRL   L1DDC
L2052    LDY   $5C
         LDA   #$00F4
         STA   [$CE],Y
         INY
         LDA   $1C
         INC
         INC
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         LDY   #$0002
         LDA   [$28],Y
         SEC
         SBC   #$0014
         ASL
         ASL
         ORA   #$9000
         STA   $08
         PER   L2077+2
L2077    BRL   L256B
         BRL   L21FC
         LDY   #$0002
         LDA   [$28],Y
         ASL
         STA   $1C
         BCS   L20E0
         CLC
         ADC   #$000F
         STA   $1E
         STZ   $20
         PER   L20C5
L2092    LSR   $1C
         LDY   $5C
         PER   L2099+2
L2099    BRL   L3B1E
         STY   $5C
         LDY   #$0004
         STY   $20
         STZ   $22
         DEC   $22
L20A7    LDY   $20
         LDA   [$28],Y
         CLC
         ADC   #$0004
         TAX
         PER   L20B3+2
L20B3    BRL   L1E0B
         INC   $22
         INC   $22
         INC   $20
         INC   $20
         DEC   $1C
         BNE   L20A7
         BRL   L21FC
L20C5    DEC
         BMI   L20CD
         CMP   #$0000
         BMI   L20D0
L20CD    BRL   L20D0
L20D0    ASL
         TAY
         PHK
         PLB
         PER   L20DF
         LDA   ($01,S),Y
         CLC
         ADC   $01,S
         STA   $01,S
         RTS

L20DF    DB    $FF
L20E0    CLC
         ADC   #$0013
         STA   $1E
         LDA   $1C
         CLC
         ADC   #$000E
         STA   $20
         STZ   $22
         PER   L20F5
         BRA   L2092
L20F5    DEC
         BMI   L20FD
         CMP   #$0000
         BMI   L2100
L20FD    BRL   L2100
L2100    PHK
         PER   L2104
L2104    ASL
         TAY
         PHK
         PLB
         PER   L2113
         LDA   ($01,S),Y
         CLC
         ADC   $01,S
         STA   $01,S
         RTS

L2113    DB    $FF
L2114    LDY   #$0036
         LDA   [$3C],Y
         BNE   L2156
         LDA   $5C
         BEQ   L2156
         CMP   #$0801
         BCS   L2159
         PEA   $0000
         PHA
         CLC
         LDY   #$0084
         ADC   [$3C],Y
         BCC   L213D
         PEA   $005B
         PHK
         PER   L2137+2
L2137    BRL   L3CE4
         BRL   L0C63
L213D    LDY   #$0084
         STA   [$3C],Y
         PEI   $D0
         PEI   $CE
         LDY   #$0006
         LDA   [$3C],Y
         PHA
         LDX   #$000A
         PHK
         PER   L2153+2
L2153    BRL   L047B
L2156    STZ   $5C
         RTS

L2159    PEA   $008C
         PHK
         PER   L2160+2
L2160    BRL   L3CE4
         BRA   L2156
L2165    BIT   $8F
         BPL   L2173
         PEA   $0091
         PHK
         PER   L2170+2
L2170    BRL   L3CE4
L2173    LDY   #$0036
         LDA   [$3C],Y
         BNE   L21EF
         PEI   $2A
         PEI   $28
         LDA   #$29D8
         CLC
         ADC   $3C
         STA   $28
         LDA   $00
         ADC   $3E
         STA   $2A
         LDY   #$00C6
         LDA   [$3C],Y
         TAY
         LDA   $16
         STA   [$28],Y
         INY
         INY
         LDA   $18
         STA   [$28],Y
         INY
         INY
         LDA   $1A
         STA   [$28],Y
         INY
         INY
         TYA
         CPY   #$01FE
         BCC   L21E4
         BNE   L21F0
         PEA   $0000
         PEA   $01FE
         PEI   $2A
         PEI   $28
         LDY   #$0004
         LDA   [$3C],Y
         BNE   L21CC
         LDA   #$0003
         PHK
         PER   L21C4+2
L21C4    BRL   L0406
         LDY   #$0004
         STA   [$3C],Y
L21CC    PHA
         LDX   #$000C
         PHK
         PER   L21D4+2
L21D4    BRL   L047B
         LDY   #$00C8
         LDA   [$3C],Y
         INC
         LDY   #$00C8
         STA   [$3C],Y
         LDA   $00
L21E4    LDY   #$00C6
         STA   [$3C],Y
L21E9    PLA
         STA   $28
         PLA
         STA   $2A
L21EF    RTS

L21F0    PEA   $0045
         PHK
         PER   L21F7+2
L21F7    BRL   L3CE4
L21FA    BRA   L21E9
L21FC    REP   #$20
         LDA   $40
         TCS
         PER   L2204+2
L2204    BRL   L2114
         LDA   $00
         LDY   #$0032
         STA   [$3C],Y
         LDY   #$0C8A
         STA   [$3C],Y
         LDA   #$0080
         TSB   $93
         BRL   L0AF4
L221B    STA   $0C
         TSC
         STA   $42
         STZ   $88
         LDY   $30
         BRA   L222E
L2226    LDA   $88
         LSR
         BCS   L222E
         BRL   L22B3
L222E    LDA   $00
         SEP   #$20
         LDA   #$01
         TRB   $88
L2236    LDA   [$28],Y
         BEQ   L22B3
         CMP   $0D
         BCC   L2244
         CMP   $0C
         BEQ   L2253
         BCC   L2253
L2244    CMP   #$0C
         BCC   L2250
         CMP   #$1F
         BCS   L2250
         LDA   #$40
         TSB   $88
L2250    INY
         BRA   L2236
L2253    PHY
         PHA
         CMP   #$12
         BNE   L2270
         PER   L225C+1
L225C    BRA   L22BA
         BCS   L2289
         DEY
         CPY   $30
         BMI   L227B
         LDA   [$28],Y
         INY
         CMP   #$0C
         BCC   L2270
         CMP   #$1F
         BCC   L2289
L2270    DEY
         CPY   $30
         BMI   L227B
         LDA   [$28],Y
         CMP   #$19
         BEQ   L2289
L227B    INY
         BIT   $8D
         BPL   L228D
L2280    INY
         LDA   [$28],Y
         BMI   L228D
         BEQ   L228D
         BRA   L2280
L2289    PLA
         PLY
         BRA   L2250
L228D    PLA
         PLY
         PHY
         PHA
         INY
         LDX   $00
L2294    LDA   [$28],Y
         BEQ   L22A8
         CMP   #$0C
         BCC   L22AD
         CMP   #$1F
         BCS   L22AD
         TXA
         TSB   $88
         BNE   L22A8
         INY
         BRA   L2294
L22A8    PLA
         PLY
         BRL   L264E
L22AD    INY
         LDX   #$0001
         BRA   L2294
L22B3    CLC
L22B4    REP   #$20
         LDA   $42
         TCS
         RTS

         MX    %10
L22BA    PHY
         PHX
         LDX   $00
         PHX
         INY
         LDA   [$28],Y
         CMP   #$6C
         BEQ   L22CA
         CMP   #$6D
         BNE   L22CD
L22CA    PLX
         INX
         PHX
L22CD    DEY
         DEY
         DEY
         LDA   [$28],Y
         CMP   #$6C
         BEQ   L22DA
         CMP   #$6D
         BNE   L22DB
L22DA    DEX
L22DB    PHX
         PLX
         BEQ   L22EC
         PEA   $007C
         PHK
         PER   L22E6+2
L22E6    BRL   L3CE4
         SEC
         BRA   L22B4
L22EC    CLC
         PLX
         BEQ   L22F1
         SEC
L22F1    PLX
         PLY
         RTS

L22F4    BIT   $88
         BPL   L232F
         LDA   $08
         XBA
         ASL
         ASL
         ASL
         ASL
         AND   #$00
         CPY   #$0885
         LDX   $64
         BNE   L230B
         BRL   L24AD
         MX    %00
L230B    CLC
         ROL
         ROL   $64
         ROL
         ROL   $64
         LDA   $64
         STZ   $64
         EOR   #$0040
         STA   $08
         LDA   #$000A
         STA   $0A
         PER   L2323+2
L2323    BRL   L25DE
         PER   L2329+2
L2329    BRL   L2584
         BRL   L24AD
L232F    LDA   #$000F
         AND   $08
         PER   L254B
         PHK
         PLB
         ASL
         TAY
         LDA   ($01,S),Y
         PLY
         TAY
         BPL   L2355
         INC
         BNE   L2347
         BRL   L2434
L2347    PEA   $000D
         PHK
         PER   L234E+2
L234E    BRL   L3CE4
         SEC
         BRL   L22B4
L2355    BEQ   L235A
         BRL   L2483
L235A    LDA   $0A
         CMP   #$0011
         BEQ   L236B
         CMP   #$0012
         BEQ   L236B
         LDA   $00
         BRL   L2483
L236B    LDY   $5C
         LDA   $64
         BEQ   L2399
         ASL
         LSR
         STA   $64
         AND   #$0007
         BEQ   L2390
         TRB   $64
         TAX
         STZ   $62
L237F    DEX
         BMI   L2399
         LDA   $64
         BNE   L2390
         INC   $64
         PER   L238B+2
L238B    BRL   L2420
         BRA   L237F
L2390    STZ   $64
         PER   L2395+1
L2395    BRA   L23DC
         BRA   L237F
L2399    STZ   $64
         LDA   #$0011
         CMP   $0A
         BNE   L23D0
         LDA   #$04A5
         STA   [$CE],Y
         INY
         INY
         LDA   #$6518
L23AC    STA   [$CE],Y
         INY
         INY
         LDA   #$5008
         STA   [$CE],Y
         INY
         INY
         LDA   #$0202
         STA   [$CE],Y
         INY
         INY
         LDA   #$8573
         STA   [$CE],Y
         INY
         INY
         LDA   #$0004
         STA   [$CE],Y
         INY
         STY   $5C
         BRL   L24AD
L23D0    LDA   #$04A5
         STA   [$CE],Y
         INY
         INY
         LDA   #$E538
         BRA   L23AC
L23DC    LDA   #$00A9
         STA   [$CE],Y
         INY
         INY
         LDA   #$3800
         STA   [$CE],Y
         INY
         INY
         LDA   #$08E5
         STA   [$CE],Y
         INY
         INY
         LDA   $62
         BNE   L2407
         LDA   #$0250
         STA   [$CE],Y
         INY
         INY
         LDA   #$7302
         STA   [$CE],Y
         STY   $62
         INY
         INY
         BRA   L2418
L2407    LDA   #$0070
         STA   [$CE],Y
         INY
         LDA   $62
         DEC
         SEC
         STY   $02
         SBC   $02
         STA   [$CE],Y
         INY
L2418    LDA   #$0885
         STA   [$CE],Y
         INY
         INY
         RTS

L2420    LDA   #$FFA9
         STA   [$CE],Y
         INY
         INY
         XBA
         STA   [$CE],Y
         INY
         LDA   #$0845
         STA   [$CE],Y
         INY
         INY
         BRA   L2418
L2434    LDA   #$000F
         STA   $08
         LDA   $0A
         SEC
         SBC   #$0011
         BEQ   L246B
         DEC
         DEC
         BMI   L245D
         CMP   #$0006
         BPL   L245D
         ASL
         ASL
         LSR   $08
         LSR   $08
         ORA   #$0600
         TSB   $08
         PER   L2458+2
L2458    BRL   L256B
         BRA   L24AD
L245D    PEA   $0045
         PHK
         PER   L2464+2
L2464    BRL   L3CE4
         SEC
         BRL   L22B4
L246B    PER   L246E+2
L246E    BRL   L25DE
         LDA   #$040F
         STA   $08
         PER   L2479+2
L2479    BRL   L256B
         LDA   #$C000
         TSB   $08
         BRA   L24AD
L2483    CLC
         ROR
         ROR
         ROR
         TSB   $08
         PHA
         PLA
         BNE   L24A1
         LDA   $0A
         AND   #$00FF
         CMP   #$000C
         BEQ   L249C
         CMP   #$000E
         BNE   L24A1
L249C    LDA   #$4000
         TSB   $08
L24A1    PER   L24A4+2
L24A4    BRL   L25DE
         PER   L24AA+2
L24AA    BRL   L2584
L24AD    PER   L24B0+2
L24B0    BRL   L2D64
         BCC   L24B8
         BRL   L22B4
L24B8    LDY   $10
         STA   $12
         PHY
         TYX
         INX
         INX
         STX   $10
         SEP   #$20
L24C4    LDA   [$28],Y
         BEQ   L24CD
         BMI   L24DB
         INY
         BRA   L24C4
L24CD    PEA   $0002
         PHK
         PER   L24D4+2
L24D4    BRL   L3CE4
         SEC
         BRL   L22B4
L24DB    INY
         BIT   $89
         BMI   L24E6
         LDA   #$80
         TSB   $89
         BRA   L24C4
L24E6    LDA   [$28],Y
         BEQ   L24F6
         PHX
         TYX
         PLY
         STA   [$28],Y
         PHX
         TYX
         PLY
         INX
         INY
         BRA   L24E6
L24F6    TXY
         STA   [$28],Y
         LDA   #$80
         TRB   $89
         REP   #$20
         PLY
         LDA   $12
         STA   [$28],Y
         BIT   $8A
         BMI   L250C
         STZ   $12
         BRA   L2546
L250C    BIT   $88
         BVS   L2546
         LDA   #$0080
         TSB   $8A
         LDX   $5E
         LDA   $60
         BEQ   L251D
         BPL   L252A
L251D    PEA   $0045
         PHK
         PER   L2524+2
L2524    BRL   L3CE4
         BRL   L0C63
L252A    STA   $04
         LDY   $00
L252E    LDA   [$D2],Y
         PHX
         TYX
         PLY
         STA   [$CE],Y
         PHX
         TYX
         PLY
         INX
         INY
         DEC   $04
         BEQ   L2544
         INX
         INY
         DEC   $04
         BNE   L252E
L2544    STX   $5C
L2546    LDY   $10
         BRL   L2226
L254B    DB    $00
         DB    $00
         DB    $01
         DB    $00
         DB    $02
         DB    $00
         DB    $FE
         DB    $FF
         DB    $01
         DB    $00
         DB    $01
         DB    $00
         DB    $02
         DB    $00
         DB    $FE
         DB    $FF
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $FE
         DB    $FF
         DB    $FE
         DB    $FF
         DB    $FE
         DB    $FF
         DB    $FE
         DB    $FF
         DB    $FF
         DB    $FF
L256B    PER   L256E+2
L256E    BRL   L2A55
         LDA   #$7002
         BIT   $92
         BPL   L2580
         LDA   #$0080
         TRB   $93
         LDA   #$7102
L2580    STA   $1C
         BRA   L259C
L2584    LDA   $0A
         CMP   #$002C
         BNE   L2590
         LDA   #$1500
         BRA   L2595
L2590    SEC
         SBC   #$000A
         XBA
L2595    TSB   $08
L2597    LDA   #$7202
         STA   $1C
L259C    BIT   $72
         BPL   L25A5
         LDA   #$0080
         TSB   $08
L25A5    LDY   $5C
         LDA   #$00A2
         LDX   $64
         BEQ   L25B1
         AND   #$00FD
L25B1    STA   [$CE],Y
         INY
         LDA   $08
         STA   [$CE],Y
         INY
         INY
         LDA   $64
         BEQ   L25CE
         ASL
         ASL
         PHA
         LDA   #$00A2
         STA   [$CE],Y
         INY
         PLA
         STA   [$CE],Y
         INY
         INY
         STZ   $64
L25CE    LDA   $1C
         STA   [$CE],Y
         INY
         INY
         LDA   #$0080
         TSB   $8B
         TRB   $8A
         STY   $5C
         RTS

L25DE    LDX   $00
         LDA   $0A
         CMP   #$0011
         BNE   L25F1
         LDA   #$000F
         AND   $08
         CMP   #$000F
         BEQ   L2621
L25F1    LDA   $0A
         CMP   #$002C
         BEQ   L2602
         CMP   #$0013
         BCS   L2603
         CMP   #$000A
         BEQ   L2603
L2602    TAX
L2603    LDA   #$0041
         BIT   $88
         BNE   L2630
         BNE   L2630
         BIT   $8D
         BMI   L2630
         LDA   #$0003
         AND   $14
L2615    CMP   #$0003
         BEQ   L262D
         BIT   $14
         BMI   L2621
         TXY
         BEQ   L2633
L2621    ASL   $08
         ASL   $08
         CLC
         ROR
         ROR   $08
         ROR
         ROR   $08
L262C    RTS

L262D    TXY
         BNE   L262C
L2630    TXY
         BNE   L263A
L2633    LDA   #$C000
         TRB   $08
         BRA   L262C
L263A    LDA   #$0003
         AND   $14
         BIT   $08
         BMI   L262C
         BVS   L2647
         BRA   L2615
L2647    CMP   #$0002
         BNE   L262C
         BRA   L2621
L264E    REP   #$20
         STA   $0A
         STY   $06
         STZ   $64
         LDA   #$8000
         STA   $08
         STZ   $60
         LDA   #$0040
         TRB   $89
         TRB   $8A
         LDA   $5C
         STA   $5E
         LDA   #$0011
         CMP   $0A
         BEQ   L267A
         INC
         CMP   $0A
         BEQ   L267A
         PER   L2677+2
L2677    BRL   L2A12
L267A    LDA   $06
         STA   $10
         DEC
         CMP   $30
         BMI   L26A9
         LDA   #$0019
         CMP   $0A
         BEQ   L26A9
         PER   L268D+2
L268D    BRL   L27F3
         BCC   L26A9
         DEC   $10
         DEC   $10
         LDA   #$0106
         STA   $36
         PER   L269E+2
L269E    BRL   L28B7
         BCC   L26A6
         BRL   L22B4
L26A6    BRL   L2781
L26A9    LDA   #$0080
         TSB   $89
         LDA   #$0012
         CMP   $0A
         BEQ   L26BF
         LDA   #$0019
         CMP   $0A
         BEQ   L26BF
         BRL   L22B4
L26BF    DEC   $06
         PER   L26C4+2
L26C4    BRL   L2819
         LDY   $06
         INY
         LDA   [$28],Y
         CMP   $12
         BNE   L2734
         AND   #$00FF
         SEC
         SBC   #$0072
         BEQ   L2734
         CMP   #$0003
         BNE   L26E1
         BRL   L2773
L26E1    STA   $08
         ASL
         ASL
         TSB   $08
         LDY   #$1094
         LDA   [$3C],Y
         LDY   #$1092
         STA   [$3C],Y
         LDY   #$1090
         LDA   [$3C],Y
         DEC
         DEC
         LDY   #$1090
         STA   [$3C],Y
         STZ   $12
         PER   L2702+2
L2702    BRL   L2A12
         PER   L2708+2
L2708    BRL   L2A55
         BIT   $87
         BMI   L2712
         BRL   L22F4
L2712    PER   L272C
         LDY   $5C
         LDA   #$8000
         STA   $1C
         PER   L271F+2
L271F    BRL   L3B1E
         STY   $5C
         PLA
         ASL   $87
         LSR   $87
         BRL   L22F4
L272C    LDA   #$0000
         EOR   $06
         STA   $06
         DB    $FF        ; LOGO BUG?
L2734    LDA   $12
         BEQ   L2754
         PEI   $64
         PEI   $88
         LDA   #$0080
         TRB   $88
         STZ   $64
         LDA   $12
         PER   L2748+2
L2748    BRL   L2C19
         PLA
         AND   #$0080
         TSB   $88
         PLA
         STA   $64
L2754    LDA   #$0106
         STA   $36
         INC   $06
         INC   $06
         INC   $06
         PER   L2762+2
L2762    BRL   L28B7
         DEC   $06
         DEC   $06
         DEC   $06
         BCC   L2770
         BRL   L22B4
L2770    BRL   L22F4
L2773    PEA   $032D
         PHK
         PER   L277A+2
L277A    BRL   L3CE4
         SEC
         BRL   L22B4
L2781    LDA   $08
         BMI   L2788
         BRL   L22F4
L2788    PER   L278B+2
L278B    BRL   L2819
         LDA   $08
         ASL
         LSR
         LSR
         LSR
         STA   $08
         DEC
         DEC
         BNE   L279F
         LDA   #$010E
         BRA   L27A2
L279F    LDA   #$010A
L27A2    STA   $36
         PER   L27A7+2
L27A7    BRL   L28B7
         BCC   L27AF
         BRL   L22B4
L27AF    BRL   L22F4
L27B2    LDY   $30
         PHP
         SEP   #$20
L27B7    LDA   [$28],Y
         BEQ   L27F1
         CMP   #$11
         BNE   L27DB
         DEY
         CPY   $30
         BMI   L27DE
         BEQ   L27DE
         LDA   [$28],Y
         BPL   L27DE
         DEY
         LDA   [$28],Y
         INY
         CMP   #$65
         BCC   L27DE
         CMP   #$6D
         BEQ   L27DE
         CMP   #$6D
         BEQ   L27DE
         INY
L27DB    INY
         BRA   L27B7
L27DE    INY
         PHY
L27E0    INY
         LDA   [$28],Y
         BEQ   L27EB
         DEY
         STA   [$28],Y
         INY
         BRA   L27E0
L27EB    DEY
         STA   [$28],Y
         PLY
         BRA   L27B7
L27F1    PLP
         RTS

         MX    %00
L27F3    LDA   #$0012
         CMP   $0A
         BNE   L2812
         LDY   $06
         DEY
         CPY   $30
         BMI   L2816
         BEQ   L2816
         SEP   #$20
         LDA   [$28],Y
         BPL   L2816
         DEY
         LDA   [$28],Y
         BMI   L2816
         CMP   #$65
         BCC   L2816
L2812    SEC
L2813    REP   #$20
         RTS

L2816    CLC
         BRA   L2813
L2819    LDY   $06
         INY
         STZ   $62
         STZ   $64
         SEP   #$20
L2822    LDA   [$28],Y
         BMI   L2875
         CMP   #$1F
         BCS   L2875
         CMP   #$11
         BEQ   L2842
         CMP   #$12
         BEQ   L2845
         CMP   #$19
         BEQ   L285F
         PEA   $0002
         PHK
         PER   L283D+2
L283D    BRL   L3CE4
L2840    SEP   #$20
L2842    INY
         BRA   L2822
L2845    REP   #$20
         BIT   $62
         BVC   L284D
         BMI   L2857
L284D    SEC
         ROR   $62
         SEC
         ROR   $62
         INC   $64
         BRA   L2840
L2857    ASL   $62
         ASL   $62
         DEC   $64
         BRA   L2840
L285F    REP   #$20
         LDA   #$8000
         TSB   $64
         BIT   $62
         BVC   L286C
         BPL   L2857
L286C    SEC
         ROR   $62
         LSR   $62
         INC   $64
         BRA   L2840
L2875    REP   #$20
         DEY
         STY   $06
         LDA   $64
         BEQ   L28AC
         ASL
         LSR
         CMP   #$0008
         BMI   L2893
         PEA   $0066
         PHK
         PER   L288C+2
L288C    BRL   L3CE4
         STZ   $64
         BRA   L28B6
L2893    DEC
         BNE   L289A
         BIT   $62
         BMI   L28A5
L289A    BIT   $62
         BPL   L28AC
         LDA   #$0008
         TSB   $64
         BRA   L28AC
L28A5    STZ   $64
         LDA   #$0080
         TSB   $88
L28AC    LDA   $64
         BEQ   L28B6
         PER   L28B3+2
L28B3    BRL   L2A12
L28B6    RTS

L28B7    STZ   $04
         LDY   $06
         BIT   $08
         SEP   #$20
         BMI   L28EA
         INY
         LDA   [$28],Y
         BPL   L28C9
         BRL   L2B27
L28C9    BNE   L28CE
         BRL   L2B27
L28CE    INY
         PER   L28D2+2
L28D2    BRL   L2A60
         BCC   L28DA
         BRL   L2B27
L28DA    LDA   [$28],Y
         BMI   L28E1
         BRL   L2B27
L28E1    AND   #$7F
         DEC
         STA   $04
         DEY
         BRL   L2AB1
L28EA    DEY
         PER   L28EE+2
L28EE    BRL   L2A60
         BCC   L28F6
         BRL   L2B27
L28F6    LDA   [$28],Y
         BMI   L28FD
         BRL   L2B27
L28FD    AND   #$7F
         DEC
         STA   $04
         DEY
         TYA
         BIT   $8B
         BMI   L290B
         BRL   L2AA9
L290B    REP   #$20
         LDA   [$28],Y
         CMP   $12
         BEQ   L2916
         BRL   L2AA9
L2916    PER   L2919+2
L2919    BRL   L2A55
         AND   #$00FF
         SEC
         SBC   #$0072
         BNE   L2929
         BIT   $89
         BMI   L292F
L2929    PER   L292C+2
L292C    BRL   L2A12
L292F    TAX
         CMP   #$0004
         BMI   L2938
         LDA   #$0001
L2938    ASL
         ASL
         TSB   $08
         LDY   #$1094
         LDA   [$3C],Y
         LDY   #$1092
         STA   [$3C],Y
         LDY   #$1090
         LDA   [$3C],Y
         DEC
         DEC
         LDY   #$1090
         STA   [$3C],Y
         LDA   #$0106
         CMP   $36
         BEQ   L2982
         TXA
         BMI   L29A6
         BEQ   L2965
         CMP   #$0004
         BPL   L2990
         BRA   L2971
L2965    BIT   $89
         BPL   L2971
         PER   L296C+2
L296C    BRL   L3145
         BRA   L2982
L2971    CLC
         ROR
         ROR
         ROR
         ORA   #$0106
         STA   $34
L297A    STZ   $12
         PER   L297F+2
L297F    BRL   L3151
L2982    STZ   $12
         BIT   $8A
         BVC   L298E
         PER   L298B+2
L298B    BRL   L2A38
L298E    CLC
         RTS

L2990    SEC
         SBC   #$0005
         BMI   L29A6
         CMP   #$0004
         BPL   L29A6
         CLC
         ROR
         ROR
         ROR
         ORA   #$0132
         STA   $34
         BRA   L297A
L29A6    PEA   $0045
         PHK
         PER   L29AD+2
L29AD    BRL   L3CE4
         SEC
         RTS

L29B2    PHP
         SEP   #$20
         LDA   $00
         XBA
         LDA   [$28],Y
         BMI   L29DD
         SEC
         SBC   #$6E
         BEQ   L29E3
         BMI   L29DD
         CMP   #$04
         BMI   L29D9
         SEC
         SBC   #$04
         CMP   #$04
         BMI   L29D9
         SEC
         SBC   #$05
         BMI   L29DD
         CMP   #$04
         BPL   L29DD
         LDA   #$01
L29D9    TAX
         PLP
         CLC
         RTS

L29DD    LDX   #$FFFF
         PLP
         SEC
         RTS

L29E3    INY
         LDA   [$28],Y
         BPL   L29DD
         AND   #$7F
         DEC
         REP   #$20
         ASL
         ASL
         TAY
         LDA   [$BE],Y
         AND   #$00FF
         CMP   #$00FF
         BEQ   L29FF
         AND   #$0003
         BRA   L29D9
L29FF    LDA   $00
         BRA   L29D9
L2A03    PHP
         REP   #$20
         LDA   $12
         BEQ   L2A10
         PER   L2A0D+2
L2A0D    BRL   L2C19
L2A10    PLP
         RTS

L2A12    PHP
         REP   #$20
         PHA
         BIT   $08
         BMI   L2A20
         BIT   $88
         BVC   L2A28
         BRA   L2A2D
L2A20    BIT   $89
         BPL   L2A2D
         LDA   $12
         BEQ   L2A2D
L2A28    PER   L2A2B+1
L2A2B    BRA   L2A38
L2A2D    PLA
         SEP   #$20
         PHA
         LDA   #$40
         TSB   $89
         PLA
         PLP
         RTS

         MX    %00
L2A38    PHA
         PHY
         BIT   $8A
         BPL   L2A52
         BIT   $89
         BPL   L2A52
         LDY   $5C
         LDA   #$0485
         STA   [$CE],Y
         INY
         INY
         STY   $5C
         LDA   #$0080
         TRB   $8A
L2A52    PLY
         PLA
         RTS

L2A55    PHP
         SEP   #$20
         PHA
         LDA   #$40
         TSB   $8A
         PLA
         PLP
         RTS

L2A60    PHP
         SEP   #$20
         LDA   [$28],Y
         BPL   L2A8B
         TAX
         DEY
         LDA   [$28],Y
         CMP   #$63
         BEQ   L2A98
         CMP   #$6B
         BEQ   L2A98
         CMP   #$69
         BEQ   L2A98
         CMP   #$6A
         BEQ   L2A98
         CMP   #$6C
         BEQ   L2A98
         CMP   #$6D
         BEQ   L2A98
         CMP   #$68
         BEQ   L2A98
L2A87    INY
         PLP
         CLC
         RTS

L2A8B    PEA   $0045
         PHK
         PER   L2A92+2
L2A92    BRL   L3CE4
         PLP
         SEC
         RTS

L2A98    REP   #$20
         PHY
         TXA
         AND   #$007F
         DEC
         ASL
         TAY
         LDA   [$C2],Y
         PLY
         STA   [$28],Y
         BRA   L2A87
L2AA9    PER   L2AAC+2
L2AAC    BRL   L2A03
         SEP   #$20
L2AB1    LDA   [$28],Y
         CMP   #$6E
         BNE   L2ABA
         BRL   L2BB4
L2ABA    CMP   #$71
         BNE   L2AC1
         BRL   L2B41
L2AC1    CMP   #$6F
         BNE   L2AC8
         BRL   L2B7D
L2AC8    CMP   #$70
         BNE   L2ACF
         BRL   L2B90
L2ACF    CMP   #$63
         BEQ   L2B1B
         CMP   #$6B
         BEQ   L2B1B
         CMP   #$6A
         BEQ   L2B1B
         CMP   #$69
         BEQ   L2B1B
         CMP   #$6C
         BEQ   L2B0F
         CMP   #$6D
         BEQ   L2B0F
         CMP   #$77
         BMI   L2B03
         PHA
         SEC
         SBC   #$05
         STA   $AD
         PLA
         CMP   #$7A
         BEQ   L2AFA
         BPL   L2B1B
         LDA   #$78
L2AFA    PHA
         LDA   #$40
         TSB   $90
         PLA
         SEC
         SBC   #$05
L2B03    SEC
         SBC   #$72
         BMI   L2B1B
         CMP   #$04
         BPL   L2B0F
         BRL   L2CDD
L2B0F    PEA   $007C
         PHK
         PER   L2B16+2
L2B16    BRL   L3CE4
         BRA   L2B3D
L2B1B    PEA   $0045
         PHK
         PER   L2B22+2
L2B22    BRL   L3CE4
         BRA   L2B3D
L2B27    PEA   $0002
         PHK
         PER   L2B2E+2
L2B2E    BRL   L3CE4
         BRA   L2B3D
L2B33    PEA   $001F
         PHK
         PER   L2B3A+2
L2B3A    BRL   L3CE4
L2B3D    REP   #$20
         SEC
         RTS

         MX    %10
L2B41    PER   L2B44+2
L2B44    BRL   L2A55
         LDA   $0A
         CMP   #$11
         BEQ   L2B55
         CMP   #$13
         BMI   L2B33
         CMP   #$19
         BPL   L2B33
L2B55    LDA   #$0C
         TSB   $08
         LDA   #$40
         REP   #$20
         LDA   $04
         BIT   $87
         BMI   L2B33
         ASL
         INC
         ASL
         CLC
         ADC   $C6
         STA   $38
         LDA   $00
         ADC   $C8
         STA   $3A
         LDA   #$C000
         STA   $34
         PER   L2B79+2
L2B79    BRL   L3151
         RTS

L2B7D    REP   #$20
         LDA   #$0004
         TSB   $08
         LDA   #$4000
         STA   $34
         LDA   $04
         ASL
         INC
         ASL
         BRA   L2BA2
L2B90    REP   #$20
         LDA   #$0008
         TSB   $08
         LDA   #$8000
         STA   $34
         LDA   $04
         INC
         ASL
         INC
         ASL
L2BA2    CLC
         ADC   $BE
         STA   $38
         LDA   $00
         ADC   $C0
         STA   $3A
         PER   L2BB0+2
L2BB0    BRL   L3151
         RTS

L2BB4    REP   #$20
         LDA   $04
         ASL
         ASL
         TAY
         LDA   [$BE],Y
         AND   #$00FF
         CMP   #$00FF
         BEQ   L2BD2
         AND   #$0003
         BEQ   L2BDB
         DEC
         DEC
         BEQ   L2BF1
         BMI   L2BEA
         BRA   L2BF8
L2BD2    LDA   $00
         STA   $34
         INY
         INY
         TYA
         BRA   L2BA2
L2BDB    PER   L2BDE+2
L2BDE    BRL   L2F1E
         BCS   L2BE9
         PER   L2BE6+2
L2BE6    BRL   L3151
L2BE9    RTS

L2BEA    LDA   #$0004
         TSB   $08
         BRA   L2BDB
L2BF1    LDA   #$0008
         TSB   $08
         BRA   L2BDB
L2BF8    LDA   $0A
         AND   #$00FF
         CMP   #$0011
         BEQ   L2C12
         CMP   #$0013
         BPL   L2C0A
         BRL   L2B33
L2C0A    CMP   #$0019
         BMI   L2C12
         BRL   L2B33
L2C12    LDA   #$000C
         TSB   $08
         BRA   L2BDB
L2C19    PHY
         PEI   $36
         PEI   $34
         AND   #$00FF
         SEC
         SBC   #$0072
         BPL   L2C2A
         BRL   L2CB2
L2C2A    CMP   #$0004
         BMI   L2C41
         SEC
         SBC   #$0005
         BMI   L2CB2
         CMP   #$0004
         BPL   L2CB2
         LDA   #$4132
         STA   $34
         BRA   L2C4B
L2C41    TAX
         CLC
         ROR
         ROR
         ROR
         ORA   #$0106
         STA   $34
L2C4B    LDA   $12
         XBA
         AND   #$007F
         DEC
         ASL
         TAY
         LDA   [$CA],Y
         CMP   #$0024
         BPL   L2CBF
         BIT   $34
         BMI   L2C63
         BVS   L2C63
         INC
         INC
L2C63    ORA   #$0100
         STA   $36
L2C68    LDA   $60
         BEQ   L2C72
         PER   L2C6F+2
L2C6F    BRL   L2A12
L2C72    BIT   $89
         BMI   L2C95
         BVS   L2C8D
         PER   L2C7B+2
L2C7B    BRL   L3151
         BIT   $89
         BVC   L2C9B
         BIT   $08
         BPL   L2C9B
         LDA   #$0040
         TRB   $8A
         BRA   L2C9B
L2C8D    PER   L2C90+2
L2C90    BRL   L3151
         BRA   L2C9B
L2C95    PER   L2C98+2
L2C98    BRL   L3145
L2C9B    LDA   $5C
         STA   $5E
         STZ   $12
         STZ   $60
         LDA   #$0080
         TRB   $8B
         TRB   $8A
         PLY
         STY   $34
         PLY
         STY   $36
         PLY
         RTS

L2CB2    PEA   $0045
         PHK
         PER   L2CB9+2
L2CB9    BRL   L3CE4
         BRL   L21FC
L2CBF    CLC
         ADC   #$FFDC
         PHA
         LDY   $5C
         LDA   #$00A0
         STA   [$CE],Y
         INY
         PLA
         STA   [$CE],Y
         INY
         INY
         LDA   #$0044
         ORA   #$0200
         STA   $36
         STY   $5C
         BRA   L2C68
L2CDD    REP   #$20
         AND   #$0003
         TAX
         CLC
         ROR
         ROR
         ROR
         STA   $34
         LDA   $04
         ASL
         TAY
         TXA
         AND   #$00FF
         TAX
         ASL
         ASL
         TSB   $08
         LDA   [$CA],Y
         CMP   #$0024
         BPL   L2D0E
         DEX
         BPL   L2D02
         INC
         INC
L2D02    ORA   #$0100
         TSB   $34
         PER   L2D0A+2
L2D0A    BRL   L3151
         RTS

L2D0E    LDA   #$0044
         ORA   #$0200
         TSB   $34
         LDA   [$CA],Y
         CLC
         ADC   #$FFDC
         PHA
         LDY   $5C
         LDA   #$00A0
         STA   [$CE],Y
         INY
         PLA
         STA   [$CE],Y
         INY
         INY
         BIT   $88
         BVS   L2D40
         PHY
         PHA
         LDY   $60
         LDA   #$00A0
         STA   [$D2],Y
         INY
         PLA
         STA   [$D2],Y
         INY
         INY
         STY   $60
         PLY
L2D40    STY   $5C
         BIT   $8E
         BPL   L2D5D
         PER   L2D49+2
L2D49    BRL   L33AC
         LDA   #$0080
         TRB   $8F
         PER   L2D54+2
L2D54    BRL   L3151
         LDA   #$0080
         TSB   $8F
         RTS

L2D5D    PER   L2D60+2
L2D60    BRL   L3151
         RTS

L2D64    LDA   #$0080
         TSB   $8B
         LDA   $5C
         CMP   $5E
         BNE   L2D74
         LDA   #$0040
         TSB   $8A
L2D74    BIT   $89
         BVS   L2D82
         PER   L2D7B+2
L2D7B    BRL   L2E33
         PHA
         BRL   L2E16
L2D82    LDY   #$1092
         LDA   [$3C],Y
         LDY   #$1094
         STA   [$3C],Y
         TAX
         CMP   #$0024
         BPL   L2DB5
         BIT   $8B
         BMI   L2DA1
         BIT   $08
         BMI   L2DA7
         BVS   L2DB0
         CMP   #$0023
         BMI   L2DB5
L2DA1    LDA   #$0024
         TAX
         BRA   L2DB5
L2DA7    BVS   L2DB0
         CMP   #$001D
         BMI   L2DB5
         BRA   L2DA1
L2DB0    CMP   #$0021
         BPL   L2DA1
L2DB5    LDY   #$1090
         LDA   [$3C],Y
         PHA
         INC
         INC
         LDY   #$1090
         STA   [$3C],Y
         PLY
         TXA
         CMP   #$0024
         BPL   L2DD5
         BIT   $8F
         BVS   L2DDF
         BIT   $08
         BMI   L2DDF
         BVS   L2DDF
         BRA   L2DEB
L2DD5    BIT   $8F
         BVS   L2DDF
         BIT   $08
         BMI   L2DE3
         BVC   L2DEB
L2DDF    INC
         INC
         BRA   L2DEB
L2DE3    BVS   L2DDF
         INC
         INC
         INC
         INC
         BRA   L2DDF
L2DEB    STA   [$CA],Y
         TYA
         LSR
         INC
         BIT   $8F
         BVC   L2DF9
         ORA   #$7780
         BRA   L2DFC
L2DF9    ORA   #$7280
L2DFC    XBA
         TAY
         TXA
         BIT   $08
         BMI   L2E1D
         BVS   L2E2E
L2E05    BIT   $8F
         BVC   L2E0C
         TXA
         INC
         INC
L2E0C    INC
         INC
         PHY
         LDY   #$1092
         STA   [$3C],Y
         CLC
         CLV
L2E16    LDA   #$0080
         TRB   $8A
         PLA
         RTS

L2E1D    BVS   L2E27
         CLC
         ADC   #$0006
         INY
         INY
         BRA   L2E05
L2E27    INC
         INC
         INY
         INY
         INY
         BRA   L2E05
L2E2E    INC
         INC
         INY
         BRA   L2E05
L2E33    LDY   $5C
         LDA   #$006B
         STA   [$CE],Y
         PHK
         PLB
         PER   L2E69
         LDA   $5E
         STA   $5C
         CLC
         ADC   $CE
         LDY   #$0001
         STA   ($01,S),Y
         LDA   $D0
         INY
         INY
         STA   ($01,S),Y
         PLA
         PEI   $06
         PEI   $04
         PEI   $0A
         PEI   $08
         PEI   $08
         PEI   $0E
         PEI   $0C
         PEI   $12
         PEI   $10
         CLV
         PHK
         PER   L2E6D
L2E69    JMPL  $000000

L2E6D    DB    $00
         PLY
         STY   $10
         PLY
         STY   $12
         PLY
         STY   $0C
         PLY
         STY   $0E
         BVS   L2ED2
         LDA   $04
         STA   $44
         LDA   $06
         STA   $46
         LDA   $08
         STA   $48
         LDA   $0A
         STA   $4A
         LDY   #$0C8A
         LDA   [$3C],Y
         TAX
         ASL
         ASL
         TAY
         PLA
         AND   #$C000
         BEQ   L2F05
         BMI   L2EE0
         LDA   $04
         STA   [$BE],Y
         INY
         INY
         LDA   $06
         STA   [$BE],Y
         TXA
         INC
         LDY   #$0C8A
         STA   [$3C],Y
         TXA
         INC
         ORA   #$6F80
L2EB3    XBA
         TAX
         CLC
         CLV
L2EB7    PLY
         STY   $08
         PLY
         STY   $0A
         PLY
         STY   $04
         PLY
         STY   $06
         LDA   #$0080
         TRB   $8B
         TRB   $8A
         TXA
         PER   L2ECE+2
L2ECE    BRL   L2A12
         RTS

L2ED2    PEI   $04
         PHK
         PER   L2ED8+2
L2ED8    BRL   L3CE4
         PLA
         SEP   #$41
         BRA   L2EB7
L2EE0    LDA   $08
         STA   [$BE],Y
         INY
         INY
         LDA   $0A
         STA   [$BE],Y
         INY
         INY
         LDA   $04
         STA   [$BE],Y
         INY
         INY
         LDA   $06
         STA   [$BE],Y
         TXA
         INC
         INC
         LDY   #$0C8A
         STA   [$3C],Y
         TXA
         INC
         ORA   #$7080
         BRA   L2EB3
L2F05    LDA   #$00FF
         STA   [$BE],Y
         INY
         INY
         LDA   $04
         STA   [$BE],Y
         TXA
         INC
         LDY   #$0C8A
         STA   [$3C],Y
         TXA
         INC
         ORA   #$6E80
         BRA   L2EB3
L2F1E    LDA   [$BE],Y
         AND   #$00FF
         CMP   #$00FF
         BNE   L2F34
         PEA   $0045
         PHK
         PER   L2F2F+2
L2F2F    BRL   L3CE4
         BRA   L2F4B
L2F34    AND   #$0003
         CLC
         ROR
         ROR
         ROR
         STA   $34
         STZ   $1A
         LDA   #$FF00
         AND   $36
         XBA
         DEC
         DEC
         BNE   L2F4B
         DEC   $1A
L2F4B    INY
         INY
         LDA   [$BE],Y
         TAX
         CLC
         ADC   #$0006
         TAY
         LDA   [$E0],Y
         BPL   L2F66
         PEA   $0064
         PHK
         PER   L2F60+2
L2F60    BRL   L3CE4
         BRL   L302C
L2F66    XBA
         AND   #$00FF
         STA   $0E
         LDA   [$E0],Y
         DEY
         DEY
         AND   #$00FF
         PHA
         BEQ   L2F79
         BRL   L302E
L2F79    LDA   [$E0],Y
         CMP   #$FFF9
         BCC   L2F83
         BRL   L3030
L2F83    STA   $01,S
         TXY
         INY
         INY
         LDA   [$E0],Y
         AND   #$0010
         BEQ   L2F92
         BRL   L30E4
L2F92    LDA   $0E
         CMP   #$007F
         BNE   L2FC5
         PLA
         CLC
         ADC   $B8
         BIT   $34
         BMI   L2FA5
         BVC   L2FAD
         BRA   L2FAB
L2FA5    BVS   L2FAB
         INC
         INC
         INC
         INC
L2FAB    INC
         INC
L2FAD    CMP   #$0100
         BCC   L2FBE
         PEA   $0065
         PHK
         PER   L2FB9+2
L2FB9    BRL   L3CE4
         BRA   L302C
L2FBE    ORA   #$0300
         TSB   $34
         BRA   L302A
L2FC5    DEC
         ASL
         ASL
         CLC
         ADC   #$0250
         TSB   $34
         LDY   $5C
         BIT   $1A
         BPL   L2FD9
         LDA   #$00A2
         BRA   L2FEE
L2FD9    LDA   #$00A0
         BIT   $91
         BMI   L2FEB
         BIT   $8E
         BPL   L2FEE
         LDX   #$0400
         CPX   $36
         BNE   L2FEE
L2FEB    LDA   #$00A9
L2FEE    STA   [$CE],Y
         INY
         PLA
         BIT   $91
         BMI   L300E
         BIT   $8E
         BPL   L2FFE
         CPX   $36
         BEQ   L300E
L2FFE    BIT   $34
         BMI   L3006
         BVC   L300E
         BRA   L300C
L3006    BVS   L300C
         INC
         INC
         INC
         INC
L300C    INC
         INC
L300E    STA   [$CE],Y
         INY
         INY
         BIT   $88
         BVS   L3028
         PHY
         PHA
         LDY   $60
         LDA   #$00A0
         STA   [$D2],Y
         INY
         PLA
         STA   [$D2],Y
         INY
         INY
         STY   $60
         PLY
L3028    STY   $5C
L302A    CLC
         RTS

L302C    SEC
         RTS

L302E    LDA   [$E0],Y
L3030    PER   L3033+2
L3033    BRL   L2A12
         PHA
         LDA   #$0238
         CMP   $36
         BNE   L3041
         LDA   #$0234
L3041    TSB   $34
         LDY   $5C
         LDA   $0E
         CMP   #$007F
         BCC   L3058
         PEA   $0065
         PHK
         PER   L3053+2
L3053    BRL   L3CE4
         BRA   L302C
L3058    DEC
         ASL
         ASL
         CLC
         ADC   #$A550
         XBA
         STA   [$CE],Y
         INY
         INY
         LDA   #$6918
         STA   [$CE],Y
         INY
         INY
         PLA
         STA   [$CE],Y
         INY
         INY
         LDA   $34
         AND   #$00FF
         XBA
         ORA   #$0085
         STA   [$CE],Y
         INY
         INY
         LDA   $0E
         DEC
         ASL
         ASL
         CLC
         ADC   #$A552
         XBA
         STA   [$CE],Y
         INY
         INY
         LDA   #$0069
         STA   [$CE],Y
         INY
         PLA
         STA   [$CE],Y
L3094    INY
         INY
         LDA   $34
         AND   #$00FF
         INC
         INC
         XBA
         ORA   #$0085
         STA   [$CE],Y
         INY
         INY
         LDA   #$00A2
         BIT   $1A
         BMI   L30C8
         LDA   #$00A0
         BIT   $91
         BMI   L30BE
         BIT   $8E
         BPL   L30C8
         LDX   #$0400
         CPX   $36
         BNE   L30C8
L30BE    LDA   #$00A9
         STA   [$CE],Y
         LDA   $00
         INY
         BRA   L30DD
L30C8    STA   [$CE],Y
         INY
         LDA   $00
         BIT   $34
         BMI   L30D5
         BVC   L30DD
         BRA   L30DB
L30D5    BVS   L30DB
         INC
         INC
         INC
         INC
L30DB    INC
         INC
L30DD    STA   [$CE],Y
         INY
         INY
         BRL   L3028
L30E4    PER   L30E7+2
L30E7    BRL   L2A12
         LDA   #$0238
         CMP   $36
         BNE   L30F4
         LDA   #$0234
L30F4    TSB   $34
         LDY   $5C
         BIT   $1A
         BPL   L3102
         LDA   #$005A
         STA   [$CE],Y
         INY
L3102    LDA   #$00A0
         STA   [$CE],Y
         INY
         PLA
         STA   [$CE],Y
         INY
         INY
         LDA   $0E
         DEC
         ASL
         ASL
         CLC
         ADC   #$B750
         XBA
         PHA
         STA   [$CE],Y
         INY
         INY
         LDA   $34
         AND   #$00FF
         XBA
         ORA   #$0085
         STA   [$CE],Y
         INY
         INY
         LDA   #$C8C8
         STA   [$CE],Y
         INY
         INY
         PLA
         STA   [$CE],Y
         BIT   $1A
         BMI   L313A
         BRL   L3094
L313A    INY
         INY
         LDA   #$007A
         STA   [$CE],Y
         DEY
         BRL   L3094
L3145    LDA   #$0007
         AND   $37
         ASL
         TAY
         PER   L31A5
         BRA   L3184
L3151    LDA   #$0007
         AND   $35
         BEQ   L315E
         PER   L315B+2
L315B    BRL   L2A55
L315E    ASL
         PHA
         ASL
         CLC
         ADC   $01,S
         STA   $01,S
         LDA   #$0007
         AND   $37
         DEC
         BEQ   L317A
         PER   L3171+2
L3171    BRL   L2A12
         PER   L3177+2
L3177    BRL   L2A55
L317A    INC
         CLC
         ADC   $01,S
         ASL
         TAY
         PLA
         PER   L31B1
L3184    PHK
         PLB
         LDA   ($01,S),Y
         CLC
         ADC   $01,S
         STA   $01,S
         LDY   $5C
         LDA   $36
         AND   #$00FF
         TAX
         BIT   $34
         BMI   L319C
         BVS   L319C
         RTS

L319C    PER   L319F+2
L319F    BRL   L2A12
         LDY   $5C
         RTS

L31A5    DW    $003B
         DW    $003E
         DW    $004B
         DW    $003B
         DW    $0052
         DW    $003B
L31B1    DW    $002F
         DW    $00AF
         DW    $015B
         DW    $002F
         DW    $01AC
         DW    $002F
         DW    $002F
         DW    $024C
         DW    $03B6
         DW    $002F
         DW    $0446
         DW    $002F
         DW    $002F
         DW    $0538
         DW    $0611
         DW    $002F
         DW    $06EE
         DW    $002F
         DW    $002F
         DW    $07A7
         DW    $0855
         DW    $002F
         DW    $08E2
         DW    $002F
         SEC
         BRA   L3217
         DEX
         DEX
         TXA
         XBA
         ORA   #$0085
L31EB    STA   [$CE],Y
         INY
         INY
         BRA   L3214
         TXA
         XBA
         ORA   #$0097
         BRA   L31EB
         BIT   $8E
         BPL   L3204
         STZ   $34
         PER   L3201+2
L3201    BRL   L33AC
L3204    LDA   #$0048
         STA   [$CE],Y
         INY
         INC   $B8
         INC   $B8
L320E    BRA   L3214
         DEY
L3211    DEY
L3212    DEY
L3213    DEY
L3214    STY   $5C
         CLC
L3217    PHP
         LDA   #$0080
         TRB   $88
         LSR
         TRB   $90
         PLP
         RTS

L3222    LDA   #$8000
         BIT   $87
         BMI   L3243
         BIT   $34
         BVS   L3260
         BMI   L3260
         CMP   $64
         BEQ   L323F
         INC
         CMP   $64
         BNE   L3260
         LDA   [$38]
         EOR   #$FFFF
         STA   [$38]
L323F    STZ   $64
         BRA   L3260
L3243    TRB   $87
         BIT   $34
         BVS   L325C
         BMI   L325C
         LDA   $00
         SEC
         SBC   [$38]
         BVC   L325E
         PEA   $0051
         PHK
         PER   L3259+2
L3259    BRL   L3CE4
L325C    EOR   [$38]
L325E    STA   [$38]
L3260    RTS

         PER   L3264+1
L3264    BRA   L3222
         BIT   $34
         BVS   L3273
         BMI   L3273
         DEX
         DEX
         PER   L3213
         BRA   L329F
L3273    PER   L3276+1
L3276    BRA   L329F
         DEC   $38
         DEC   $38
         DEX
         DEX
         PER   L3281+1
L3281    BRA   L329F
         BIT   $34
         BVS   L3214
         DEC   $38
         DEC   $38
         TXA
         CLC
         ADC   #$0006
         TAX
         PER   L3294+1
L3294    BRA   L329F
         DEC   $38
         DEC   $38
         DEX
         DEX
         PER   L3213
L329F    LDA   #$00A9
         STA   [$CE],Y
         LDA   [$38]
         BEQ   L3306
         INY
         STA   [$CE],Y
         INY
         INY
         TXA
         XBA
         ORA   #$0085
L32B2    STA   [$CE],Y
         INY
         INY
         BIT   $88
         BVC   L32BB
         RTS

L32BB    PHY
         LDY   $60
         BIT   $08
         BMI   L32F6
         LDA   $0A
         CMP   #$0011
         BEQ   L32D6
         CMP   #$0012
         BEQ   L32DD
         PER   L32D1+2
L32D1    BRL   L2A12
         BRA   L3304
L32D6    LDA   #$6918
         STA   [$D2],Y
         BRA   L32E2
L32DD    LDA   #$E938
         STA   [$D2],Y
L32E2    INY
         INY
         LDA   [$38]
         STA   [$D2],Y
         INY
         INY
         LDA   #$0250
         STA   [$D2],Y
         INY
         INY
         LDA   #$7302
         BRA   L32FE
L32F6    LDA   #$00A9
         STA   [$D2],Y
         INY
         LDA   [$38]
L32FE    STA   [$D2],Y
         INY
         INY
         STY   $60
L3304    PLY
         RTS

L3306    TXA
         XBA
         ORA   #$0064
         BRA   L32B2
         PER   L3310+2
L3310    BRL   L3222
         PER   L3316+1
L3316    BRA   L3341
         BIT   $34
         BVS   L3321
         BMI   L3321
         BRL   L3212
L3321    DEC   $38
         DEC   $38
         PER   L3328+1
L3328    BRA   L3341
         BIT   $34
         BVC   L3331
         BRL   L3212
L3331    DEC   $38
         DEC   $38
         PER   L3338+1
L3338    BRA   L3341
         DEC   $38
         DEC   $38
         PER   L3211
L3341    LDA   #$00A9
         STA   [$CE],Y
         LDA   [$38]
         INY
         STA   [$CE],Y
         INY
         INY
         TXA
         XBA
         ORA   #$0097
         STA   [$CE],Y
         INY
         INY
         LDA   #$8888
         STA   [$CE],Y
         INY
         INY
         RTS

         BIT   $8E
         BPL   L3367
         PER   L3365+1
L3365    BRA   L33AC
L3367    PER   L336A+2
L336A    BRL   L3222
         PER   L3370+1
L3370    BRA   L339B
         BIT   $34
         BVS   L337B
         BMI   L337B
         BRL   L3214
L337B    DEC   $38
         DEC   $38
         PER   L3382+1
L3382    BRA   L339B
         BIT   $34
         BVC   L338B
         BRL   L3214
L338B    DEC   $38
         DEC   $38
         PER   L3392+1
L3392    BRA   L339B
         DEC   $38
         DEC   $38
         PER   L3213
L339B    LDA   #$00F4
         STA   [$CE],Y
         INY
         LDA   [$38]
         STA   [$CE],Y
         INY
         INY
         INC   $B8
         INC   $B8
         RTS

L33AC    BIT   $8F
         BVS   L33D2
         LDA   #$FF00
         TRB   $AC
         LDA   #$6E00
         BIT   $34
         BMI   L33C6
         BVS   L33C1
L33BE    TSB   $AC
         RTS

L33C1    LDA   #$6F00
         BRA   L33BE
L33C6    BVS   L33CD
         LDA   #$7000
         BRA   L33BE
L33CD    LDA   #$7100
         BRA   L33BE
L33D2    LDA   #$0040
         TRB   $8F
         RTS

L33D8    BIT   $8F
         BVS   L33D2
         LDA   #$FF00
         TRB   $AC
         LDA   #$7200
         BIT   $34
         BMI   L33F2
         BVS   L33ED
L33EA    TSB   $AC
         RTS

L33ED    LDA   #$7300
         BRA   L33EA
L33F2    BVS   L33F9
         LDA   #$7400
         BRA   L33EA
L33F9    LDA   #$7500
         BRA   L33EA
         BIT   $34
         BMI   L344D
         BVS   L344D
         DEX
         DEX
         DEC   $34
         DEC   $34
         PER   L3213
         LDA   #$8000
         CMP   $64
         BEQ   L3430
         INC
         CMP   $64
         BNE   L3432
         PER   L341C+2
L341C    BRL   L3525
         LDA   $34
         AND   #$00FF
         XBA
         ORA   #$0045
         PER   L342B+2
L342B    BRL   L3536
         BRA   L3497
L3430    STZ   $64
L3432    BIT   $87
         BPL   L3480
         PER   L3439+2
L3439    BRL   L352A
         LDA   $34
         AND   #$00FF
         XBA
         ORA   #$00E5
         PER   L3448+2
L3448    BRL   L353D
         BRA   L3497
L344D    PER   L3450+1
L3450    BRA   L3480
         DEX
         DEX
         DEC   $34
         DEC   $34
         PER   L345B+1
L345B    BRA   L3480
         BIT   $34
         BVC   L3464
         BRL   L3214
L3464    TXA
         CLC
         ADC   #$0006
         TAX
         LDA   $34
         CLC
         ADC   #$0006
         STA   $34
         PER   L3475+1
L3475    BRA   L3480
         DEX
         DEX
         DEC   $34
         DEC   $34
         PER   L3213
L3480    LDA   $34
         AND   #$00FF
         XBA
         ORA   #$00A5
         STA   [$CE],Y
         INY
         INY
         BIT   $87
         BPL   L3497
         PER   L3494+2
L3494    BRL   L3558
L3497    TXA
         XBA
         ORA   #$0085
         STA   [$CE],Y
         INY
         INY
         BIT   $88
         BVS   L34B2
         LDA   $34
         AND   #$00FF
         XBA
         ORA   #$0005
         PER   L34B0+1
L34B0    BRA   L34B3
L34B2    RTS

L34B3    PHY
         PHA
         LDY   $60
         BIT   $08
         BPL   L34CC
         BIT   $87
         BPL   L350F
         LDA   #$00A9
         STA   [$D2],Y
         INY
         INY
         XBA
         STA   [$D2],Y
         INY
         BRA   L34F5
L34CC    LDA   #$0011
         CMP   $0A
         BEQ   L34E1
         INC
         CMP   $0A
         BEQ   L34F1
         PER   L34DB+2
L34DB    BRL   L2A12
         PLA
         PLY
         RTS

L34E1    BIT   $87
         BMI   L34F5
L34E5    LDA   #$0018
         STA   [$D2],Y
         INY
         PLA
         ORA   #$0060
         BRA   L34FF
L34F1    BIT   $87
         BMI   L34E5
L34F5    LDA   #$0038
         STA   [$D2],Y
         INY
         PLA
         ORA   #$00E0
L34FF    STA   [$D2],Y
         INY
         INY
         LDA   #$0250
         STA   [$D2],Y
         INY
         INY
         LDA   #$7302
         BRA   L3513
L350F    PLA
         ORA   #$00A0
L3513    STA   [$D2],Y
         INY
         INY
         STY   $60
         PLY
         RTS

L351B    TXA
         XBA
         ORA   #$00A5
         STA   [$CE],Y
         INY
         INY
         RTS

L3525    LDA   #$FFA9
         BRA   L352D
L352A    LDA   #$00A9
L352D    STA   [$CE],Y
         INY
         INY
         XBA
         STA   [$CE],Y
         INY
         RTS

L3536    STA   [$CE],Y
         INY
         INY
         STZ   $64
         RTS

L353D    PHA
         LDA   #$0038
         STA   [$CE],Y
         INY
         PLA
         STA   [$CE],Y
         INY
         INY
         LDA   #$0250
         STA   [$CE],Y
         INY
         INY
         LDA   #$7302
         STA   [$CE],Y
         INY
         INY
         RTS

L3558    LDA   #$0049
         STA   [$CE],Y
         INY
         LDA   #$8000
         TRB   $87
         STA   [$CE],Y
         INY
         INY
         RTS

         LDA   $34
         AND   #$00FF
         TAX
         BIT   $34
         BMI   L35AD
         BVS   L35AD
         DEX
         DEX
         PER   L3211
         LDA   #$8000
         CMP   $64
         BEQ   L3596
         INC
         CMP   $64
         BNE   L3598
         PER   L3588+1
L3588    BRA   L3525
         TXA
         XBA
         ORA   #$0045
         PER   L3592+1
L3592    BRA   L3536
         BRA   L35E3
L3596    STZ   $64
L3598    BIT   $87
         BPL   L35D0
         PER   L359F+1
L359F    BRA   L352A
         TXA
         XBA
         ORA   #$00E5
         PER   L35A9+1
L35A9    BRA   L353D
         BRA   L35E3
L35AD    PER   L35B0+1
L35B0    BRA   L35D0
         DEX
         DEX
         PER   L35B7+1
L35B7    BRA   L35D0
         BIT   $34
         BVC   L35C0
         BRL   L3212
L35C0    TXA
         CLC
         ADC   #$0006
         TAX
         PER   L35C9+1
L35C9    BRA   L35D0
         DEX
         DEX
         PER   L3211
L35D0    TXA
         XBA
         ORA   #$00A5
         STA   [$CE],Y
         INY
         INY
         BIT   $87
         BPL   L35E3
         PER   L35E0+2
L35E0    BRL   L3558
L35E3    LDA   $36
         AND   #$00FF
         XBA
         ORA   #$0097
         STA   [$CE],Y
         INY
         INY
         LDA   #$8888
         STA   [$CE],Y
         INY
         INY
         RTS

         BIT   $8E
         BPL   L361C
         LDA   $34
         AND   #$00FF
         CMP   #$0024
         BMI   L3616
         BNE   L360E
         BIT   $34
         BMI   L360E
         BVC   L3616
L360E    PER   L3611+2
L3611    BRL   L33D8
         BRA   L361C
L3616    PER   L3619+2
L3619    BRL   L33AC
L361C    LDA   $34
         AND   #$00FF
         CMP   #$0024
         BMI   L363A
         BNE   L362E
         BIT   $34
         BMI   L362E
         BVC   L363A
L362E    TAX
         LDA   $34
         AND   #$3FFF
         ORA   #$4000
         STA   $34
         TXA
L363A    TAX
         BIT   $34
         BMI   L3687
         BVS   L3687
         DEX
         DEX
         PER   L3213
         LDA   #$8000
         CMP   $64
         BEQ   L3665
         INC
         CMP   $64
         BNE   L3667
         PER   L3655+2
L3655    BRL   L3525
         TXA
         XBA
         ORA   #$0045
         PER   L3660+2
L3660    BRL   L3536
         BRA   L367C
L3665    STZ   $64
L3667    BIT   $87
         BPL   L36C6
         PER   L366E+2
L366E    BRL   L352A
         TXA
         XBA
         ORA   #$00E5
         PER   L3679+2
L3679    BRL   L353D
L367C    LDA   #$0048
         STA   [$CE],Y
         INY
         INC   $B8
         INC   $B8
         RTS

L3687    BIT   $87
         BPL   L36A3
         PER   L368E+2
L368E    BRL   L351B
         PER   L3694+2
L3694    BRL   L3558
         LDA   #$0048
         STA   [$CE],Y
         INY
         INC   $B8
         INC   $B8
         BRA   L36A8
L36A3    PER   L36A6+1
L36A6    BRA   L36C6
L36A8    DEX
         DEX
         PER   L36AD+1
L36AD    BRA   L36C6
         BIT   $34
         BVC   L36B6
         BRL   L3214
L36B6    TXA
         CLC
         ADC   #$0006
         TAX
         PER   L36BF+1
L36BF    BRA   L36C6
         DEX
         DEX
         PER   L3213
L36C6    TXA
         XBA
         ORA   #$00D4
         STA   [$CE],Y
         INY
         INY
         INC   $B8
         INC   $B8
         RTS

L36D4    CLC
         ADC   $00
         STA   $00
         LDA   $00
         BCC   L36DE
         INC
L36DE    STA   $00
         DB    $FF        ; LOGO BUG?
L36E1    LDA   $00
         STA   $00
         LDA   $00
         STA   $00
         DB    $FF        ; LOGO BUG?
         BIT   $91
         BPL   L371A
         LDA   $34
         AND   #$00FF
         STA   $1C
         INC
         INC
         DEX
         DEX
         STX   $1D
         STA   $1E
         INX
         INX
         STX   $1F
         PER   L3704+2
L3704    BRL   L388A
         PER   L36D4
         BCS   L3710
         PLA
         PER   L36E1
L3710    PER   L3713+2
L3713    BRL   L3B1E
         PLA
         BRL   L3214
L371A    BIT   $34
         BMI   L3765
         BVS   L3765
         DEX
         DEX
         PER   L3211
         LDA   #$8000
         CMP   $64
         BEQ   L3748
         INC
         CMP   $64
         BNE   L374A
         PER   L3734+2
L3734    BRL   L3525
         LDA   $34
         AND   #$00FF
         XBA
         ORA   #$0057
         PER   L3743+2
L3743    BRL   L3536
         BRA   L379F
L3748    STZ   $64
L374A    BIT   $87
         BPL   L3788
         PER   L3751+2
L3751    BRL   L352A
         LDA   $34
         AND   #$00FF
         XBA
         ORA   #$00F7
         PER   L3760+2
L3760    BRL   L353D
         BRA   L379F
L3765    PER   L3768+1
L3768    BRA   L3788
         DEX
         DEX
         PER   L376F+1
L376F    BRA   L3788
         BIT   $34
         BVC   L3778
         BRL   L3212
L3778    TXA
         CLC
         ADC   #$0006
         TAX
         PER   L3781+1
L3781    BRA   L3788
         DEX
         DEX
         PER   L3211
L3788    LDA   $34
         AND   #$00FF
         XBA
         ORA   #$00B7
         STA   [$CE],Y
         INY
         INY
         BIT   $87
         BPL   L379F
         PER   L379C+2
L379C    BRL   L3558
L379F    TXA
         XBA
         ORA   #$0085
         STA   [$CE],Y
         INY
         INY
         LDA   #$8888
         STA   [$CE],Y
         INY
         INY
         BIT   $88
         BVS   L37C2
         LDA   $34
         AND   #$00FF
         XBA
         ORA   #$0017
         PER   L37BF+2
L37BF    BRL   L34B3
L37C2    RTS

         PER   L320E+1
         BIT   $34
         BMI   L381A
         BVS   L381A
         LDA   #$8000
         CMP   $64
         BEQ   L37F6
         INC
         CMP   $64
         BNE   L37F8
         LDA   #$9B5A
         STA   [$CE],Y
         INY
         INY
         PER   L37E2+2
L37E2    BRL   L3525
         LDA   $34
         AND   #$00FF
         XBA
         ORA   #$0057
         PER   L37F1+2
L37F1    BRL   L3536
         BRA   L384C
L37F6    STZ   $64
L37F8    BIT   $87
         BPL   L382E
         PER   L37FF+2
L37FF    BRL   L352A
         LDA   #$9B5A
         STA   [$CE],Y
         INY
         INY
         LDA   $34
         AND   #$00FF
         XBA
         ORA   #$00F7
         PER   L3815+2
L3815    BRL   L353D
         BRA   L384C
L381A    PER   L381D+1
L381D    BRA   L382E
         BIT   $34
         BVS   L382E
         PER   L3826+1
L3826    BRA   L382E
         PER   L382B+1
L382B    BRA   L382E
         NOP
L382E    LDA   #$9B5A
         STA   [$CE],Y
         INY
         INY
         LDA   $34
         AND   #$00FF
         XBA
         ORA   #$00B7
         STA   [$CE],Y
         INY
         INY
         BIT   $87
         BPL   L384C
         PER   L3849+2
L3849    BRL   L3558
L384C    LDA   #$007A
         STA   [$CE],Y
         INY
         TXA
         XBA
         ORA   #$0097
         STA   [$CE],Y
         INY
         INY
         LDA   #$8888
         STA   [$CE],Y
         INY
         INY
         LDA   #$CACA
         STA   [$CE],Y
         INY
         INY
         RTS

L386A    LDA   #$0000
L386D    CLC
         ADC   $00
         TAY
         LDA   $00
         BCC   L3876
         INC
L3876    PHA
         PHY
         DB    $FF        ; LOGO BUG?
L3879    PEI   $00
         PEI   $00
         DB    $FF        ; LOGO BUG?
L387E    LDY   #$0000
         LDA   [$00],Y
         PHA
         DEY
         DEY
         LDA   [$00],Y
         PHA
         DB    $FF        ; LOGO BUG?
L388A    TYX
         DEY
         DEY
         BMI   L389D
         LDA   [$CE],Y
         BNE   L389D
         DEY
         LDA   [$CE],Y
         CMP   #$00A9
         BNE   L389D
         CLC
         RTS

L389D    TXY
         SEC
         RTS

         BIT   $8E
         BPL   L38AA
         PER   L38A7+2
L38A7    BRL   L33D8
L38AA    LDA   $34
         AND   #$00FF
         TAX
         BIT   $8E
         BPL   L38DF
         STA   $1C
         INC
         INC
         STA   $1D
         PER   L38BD+1
L38BD    BRA   L388A
         PER   L386D
         BCS   L38CD
         PLA
         PER   L3879
         LDA   $1C
         XBA
         STA   $1C
L38CD    PER   L38D0+2
L38D0    BRL   L3B1E
         PLA
         INC   $B8
         INC   $B8
         INC   $B8
         INC   $B8
         BRL   L3214
L38DF    PER   L3211
         BIT   $34
         BMI   L3920
         BVS   L3920
         LDA   #$8000
         CMP   $64
         BEQ   L3907
         INC
         CMP   $64
         BNE   L3909
         PER   L38F7+2
L38F7    BRL   L3525
         TXA
         XBA
         ORA   #$0057
         PER   L3902+2
L3902    BRL   L3536
         BRA   L3947
L3907    STZ   $64
L3909    BIT   $87
         BPL   L3934
         PER   L3910+2
L3910    BRL   L352A
         TXA
         XBA
         ORA   #$00F7
         PER   L391B+2
L391B    BRL   L353D
         BRA   L3947
L3920    PER   L3923+1
L3923    BRA   L3934
         BIT   $34
         BVS   L3934
         PER   L392C+1
L392C    BRA   L3934
         PER   L3931+1
L3931    BRA   L3934
         NOP
L3934    TXA
         XBA
         ORA   #$00B7
         STA   [$CE],Y
         INY
         INY
         BIT   $87
         BPL   L3947
         PER   L3944+2
L3944    BRL   L3558
L3947    LDA   #$0048
         STA   [$CE],Y
         INY
         LDA   #$8888
         STA   [$CE],Y
         INY
         INY
         INC   $B8
         INC   $B8
         RTS

         BIT   $34
         BMI   L39A4
         BVS   L39A4
         DEX
         DEX
         PER   L3213
         LDA   #$8000
         CMP   $64
         BEQ   L3987
         INC
         CMP   $64
         BNE   L3989
         PER   L3973+2
L3973    BRL   L3525
         LDA   $34
         AND   #$00FF
         XBA
         ORA   #$0043
         PER   L3982+2
L3982    BRL   L3536
         BRA   L39EA
L3987    STZ   $64
L3989    BIT   $87
         BPL   L39D3
         PER   L3990+2
L3990    BRL   L352A
         LDA   $34
         AND   #$00FF
         XBA
         ORA   #$00E3
         PER   L399F+2
L399F    BRL   L353D
         BRA   L39EA
L39A4    PER   L39A7+1
L39A7    BRA   L39D3
         DEX
         DEX
         DEC   $34
         DEC   $34
         PER   L39B2+1
L39B2    BRA   L39D3
         BIT   $34
         BVC   L39BB
         BRL   L3214
L39BB    TXA
         CLC
         ADC   #$0006
         TAX
         DEC   $34
         DEC   $34
         PER   L39C8+1
L39C8    BRA   L39D3
         DEC   $34
         DEC   $34
         DEX
         DEX
         PER   L3213
L39D3    LDA   $34
         AND   #$00FF
         XBA
         ORA   #$00A3
         STA   [$CE],Y
         INY
         INY
         BIT   $87
         BPL   L39EA
         PER   L39E7+2
L39E7    BRL   L3558
L39EA    TXA
         XBA
         ORA   #$0085
         STA   [$CE],Y
         INY
         INY
         BIT   $88
         BVS   L3A06
         LDA   $34
         AND   #$00FF
         XBA
         ORA   #$0003
         PER   L3A03+2
L3A03    BRL   L34B3
L3A06    RTS

         LDA   $34
         AND   #$00FF
         XBA
         TAX
         BIT   $34
         BMI   L3A51
         BVS   L3A51
         LDA   #$8000
         CMP   $64
         BEQ   L3A33
         INC
         CMP   $64
         BNE   L3A35
         PER   L3A23+2
L3A23    BRL   L3525
         TXA
         XBA
         ORA   #$0043
         PER   L3A2E+2
L3A2E    BRL   L3536
         BRA   L3A82
L3A33    STZ   $64
L3A35    BIT   $87
         BPL   L3A4C
         PER   L3A3C+2
L3A3C    BRL   L352A
         TXA
         XBA
         ORA   #$00E3
         PER   L3A47+2
L3A47    BRL   L353D
         BRA   L3A82
L3A4C    PER   L3211
         BRA   L3A6F
L3A51    PER   L3A54+1
L3A54    BRA   L3A6F
         DEX
         DEX
         PER   L3A5B+1
L3A5B    BRA   L3A6F
         BIT   $34
         BVC   L3A64
         BRL   L3212
L3A64    DEX
         DEX
         PER   L3A69+1
L3A69    BRA   L3A6F
         DEX
         DEX
         BRA   L3A4C
L3A6F    TXA
         XBA
         ORA   #$00A3
         STA   [$CE],Y
         INY
         INY
         BIT   $87
         BPL   L3A82
         PER   L3A7F+2
L3A7F    BRL   L3558
L3A82    LDA   $36
         AND   #$00FF
         ORA   #$0097
         STA   [$CE],Y
         LDA   #$8888
         STA   [$CE],Y
         INY
         INY
         RTS

         BIT   $8E
         BPL   L3A9E
         PER   L3A9B+2
L3A9B    BRL   L33AC
L3A9E    LDA   $34
         AND   #$00FF
         TAX
         BIT   $34
         BMI   L3AE8
         BVS   L3AE8
         LDA   #$8000
         CMP   $64
         BEQ   L3ACA
         INC
         CMP   $64
         BNE   L3ACC
         PER   L3AB9+2
L3AB9    BRL   L3525
         TXA
         XBA
         ORA   #$0043
         PER   L3AC4+2
L3AC4    BRL   L3536
         BRL   L379F
L3ACA    STZ   $64
L3ACC    BIT   $87
         BPL   L3AE3
         PER   L3AD3+2
L3AD3    BRL   L352A
         TXA
         XBA
         ORA   #$00E3
         PER   L3ADE+2
L3ADE    BRL   L353D
         BRA   L3B13
L3AE3    PER   L3213
         BRA   L3B00
L3AE8    PER   L3AEB+1
L3AEB    BRA   L3B00
         PER   L3AF0+1
L3AF0    BRA   L3B00
         BIT   $34
         BVC   L3AF9
         BRL   L3214
L3AF9    PER   L3AFC+1
L3AFC    BRA   L3B00
         BRA   L3AE3
L3B00    TXA
         XBA
         ORA   #$00A3
         STA   [$CE],Y
         INY
         INY
         BIT   $87
         BPL   L3B13
         PER   L3B10+2
L3B10    BRL   L3558
L3B13    LDA   #$0048
         STA   [$CE],Y
         INY
         INC   $B8
         INC   $B8
         RTS

L3B1E    PHP
         LDX   $00
         PHX
         PHY
         PHK
         PLB
         SEP   #$20
         LDA   $00
         XBA
L3B2A    LDA   $03,S
         TAY
         INC
         STA   $03,S
         LDA   ($08,S),Y
         BNE   L3B39
         LDA   $1C,X
         INX
         BRA   L3B3D
L3B39    INC
         BEQ   L3B44
         DEC
L3B3D    PLY
         STA   [$CE],Y
         INY
         PHY
         BRA   L3B2A
L3B44    PLY
         PLX
         PLP
         RTS

         MX    %00
L3B48    PHK
         PER   L3B4C+2
L3B4C    BRL   L8DCE
         LDA   #$03F6
         CLC
         ADC   $3C
         STA   $28
         LDA   $00
         ADC   $3E
         STA   $2A
         PER   L3B60+2
L3B60    BRL   L3C54
         BCS   L3B9B
         STA   [$28]
         STZ   $04
         DEC
         STA   $04
         TAX
         BMI   L3B9B
         BEQ   L3B9B
         CMP   #$0100
         BPL   L3B9B
         INC
         LDY   #$01B8
         CLC
         ADC   [$3C],Y
         STA   [$3C],Y
         BCC   L3B88
         INY
         INY
         LDA   [$3C],Y
         INC
         STA   [$3C],Y
L3B88    LDY   $00
L3B8A    INY
         DEC   $04
         BMI   L3BB6
         PHY
         PER   L3B93+2
L3B93    BRL   L3C54
         PLY
         STA   [$28],Y
         BCC   L3B8A
L3B9B    PEA   $0045
         PHK
         PER   L3BA2+2
L3BA2    BRL   L3CE4
         PHK
         PHK
         PER   L3C6F
         LDX   $F4
         PHK
         PER   L3BB0+2
L3BB0    BRL   LAF42
         BRL   L0C73
L3BB6    LDA   [$28]
         XBA
         AND   #$00FF
         CMP   #$00FF
         BNE   L3BCC
         LDY   #$0002
         PER   L3BC7+1
L3BC7    BRA   L3BCD
         BRL   L3B48
L3BCC    RTS

L3BCD    LDA   [$28],Y
         AND   #$00FF
         STA   $B0
         INY
         LDA   [$28],Y
         TAX
         INY
         INY
         LDA   [$28],Y
         INY
         INY
         PHA
         PHY
         LDY   #$004A
         STA   [$3C],Y
         TXA
         LDY   #$0046
         STA   [$3C],Y
         PLY
         LDA   $72
         LSR
         BCC   L3BF3
         PLA
         PHX
L3BF3    LDA   [$28],Y
         AND   #$00FF
         PLY
         PHA
         PHY
         LDY   #$0038
         STA   [$3C],Y
         LDA   $72
         LSR
         LSR
         BCS   L3C28
         LDA   #$0100
         BIT   $72
         BEQ   L3C11
         TRB   $72
         BRA   L3C28
L3C11    LDA   #$0040
         BIT   $72
         BNE   L3C1C
         PLA
         PLA
         BRA   L3C46
L3C1C    LDA   #$7602
         LDY   $5C
         STA   [$CE],Y
         INY
         PLA
         PLA
         BRA   L3C3E
L3C28    LDY   $5C
         LDA   #$7402
         STA   [$CE],Y
         INY
         INY
         LDA   $B0
         STA   [$CE],Y
         INY
         PLA
         STA   [$CE],Y
         INY
         INY
         PLA
         STA   [$CE],Y
L3C3E    INY
         STY   $5C
         LDA   #$0080
         TRB   $93
L3C46    PER   L3C49+2
L3C49    BRL   L2114
         PHK
         PER   L3C50+2
L3C50    BRL   L0580
         RTS

L3C54    LDA   $6A
         LDY   #$002C
         CMP   [$3C],Y
         BMI   L3C65
         PER   L3C60+1
L3C60    BRA   L3C9E
         BCC   L3C54
         RTS

L3C65    TAY
         LDA   [$24],Y
         AND   #$00FF
         INC   $6A
         CLC
         RTS

L3C6F    ASC   'Error on reading intermediate file (0F '
         ASC   'file).'0D00
L3C9E    LDA   #$179E
         CLC
         ADC   $3C
         STA   $24
         LDA   $00
         ADC   $3E
         STA   $26
         LDY   #$002C
         LDA   [$3C],Y
         BMI   L3CE2
         PEA   $0000
         PEA   $0800
         PEI   $26
         PEI   $24
         LDA   [$3C]
         PHA
         PHK
         PER   L3CC4+2
L3CC4    BRL   LA585
         BCC   L3CCB
         LDA   $00
L3CCB    PHA
         PLA
         BMI   L3CDA
         BEQ   L3CDA
         LDY   #$002C
         STA   [$3C],Y
         STZ   $6A
         CLC
         RTS

L3CDA    LDA   #$FFFF
         LDY   #$002C
         STA   [$3C],Y
L3CE2    SEC
         RTS

L3CE4    PHP
         PHB
         REP   #$20
         PEA   $0003
         PEI   $EE
         PEI   $EC
L3CEF    RTL

         TSC
         LDY   #$0082
         STA   [$3C],Y
         PER   L3CF9+2
L3CF9    BRL   L4CA9
         LDX   #$0016
         PHK
         PER   L3D0A
         PEA   $0009
         PEI   $EE
         PEI   $EC
L3D0A    RTL

         LDA   #$0020
         BIT   $72
         BEQ   L3D1F
         PHK
         PER   L3D16+2
L3D16    BRL   L08D6
         PER   L3D1C+2
L3D1C    BRL   L71DF
L3D1F    LDA   #$0000
         STA   [$24]
         INC   $24
         INC   $24
L3D28    REP   #$20
         LDA   $6C
         BEQ   L3D37
         STZ   $6C
         DEC
         BEQ   L3D37
         INC   $6C
         PHA
         RTS

L3D37    BIT   $8F
         BPL   L3D3E
         BRL   L4426
L3D3E    BIT   $8D
         BVC   L3D77
         BRL   L5466
L3D45    BIT   $8B
         BVS   L3D6B
         BIT   $8F
         BMI   L3D6B
         LDA   $6C
         BEQ   L3D56
         STZ   $6C
         DEC
         BNE   L3D6B
L3D56    PHK
         PER   L3D5A+2
L3D5A    BRL   L6C35
         PHP
         PER   L3D61+2
L3D61    BRL   L6B82
         LDA   #$2000
         TRB   $68
         BRA   L3D86
L3D6B    PEA   $0002
         PHK
         PER   L3D72+2
L3D72    BRL   L8D82
         BRA   L3D99
L3D77    PHK
         PER   L3D7B+2
L3D7B    BRL   L0580
         PHK
         PER   L3D82+2
L3D82    BRL   L6C35
         PHP
L3D86    STZ   $66
         LDA   #$0001
         TSB   $A4
         LDA   #$DBFF
         TRB   $68
         LDA   $B0
         STA   $C2
         PLP
         BRA   L3DFA
L3D99    REP   #$20
         LDY   #$0082
         LDA   [$3C],Y
         TCS
         STZ   $90
         LDA   #$00C0
         STZ   $6C
         AND   $8E
         BEQ   L3D77
         TRB   $8E
         BRA   L3D77
L3DB0    PER   L3DB3+2
L3DB3    BRL   L658A
L3DB6    STZ   $10
         LDA   [$28]
         AND   #$00FF
         BNE   L3DF9
         BIT   $8F
         BVS   L3DF9
         PEA   $0070
         PHK
         PER   L3DCA+2
L3DCA    BRL   L8D82
         BRA   L3D99
L3DCF    LDA   #$00FF
         TRB   $8F
         TRB   $92
         LSR
         TRB   $A5
         TRB   $93
         LDA   $00
         LDY   #$0BB2
         STA   [$3C],Y
         LDY   #$0032
         STA   [$3C],Y
         LDY   #$0C8A
         STA   [$3C],Y
         LDA   #$FFC0
         TRB   $88
         STZ   $8A
         STZ   $8C
         DEC
         STA   $CA
         RTS

L3DF9    CLC
L3DFA    PHP
         BIT   $8A
         BVC   L3E25
         LDX   #$0000
         PHK
         PER   L3E0D
         PEA   $0012
         PEI   $EE
         PEI   $EC
L3E0D    RTL

         LDX   #$000B
         PHK
         PER   L3E1C
         PEA   $0009
         PEI   $EE
         PEI   $EC
L3E1C    RTL

         LDA   $C8
         STA   [$24]
         INC   $24
         INC   $24
L3E25    PLP
         BCC   L3E2B
         BRL   L6A0A
L3E2B    PER   L3E2E+1
L3E2E    BRA   L3DCF
         BIT   $8F
         BVC   L3E37
         BRL   L4092
L3E37    BPL   L3E3C
         BRL   L4053
L3E3C    LDA   [$28]
         AND   #$00FF
         CMP   #$0027
         BNE   L3E49
         BRL   L49D4
L3E49    BIT   $92
         BPL   L3E50
         BRL   L3D28
L3E50    LDY   $28
         STY   $6A
         LDA   $10
         BMI   L3E81
         LDA   [$28]
         AND   #$00FF
         BNE   L3E62
         BRL   L3D28
L3E62    CMP   #$003F
         BNE   L3E6A
         BRL   L59D6
L3E6A    CMP   #$0030
         BCS   L3E72
         BRL   L3F68
L3E72    CMP   #$003A
         BCC   L3E7A
         BRL   L3F68
L3E7A    BIT   $8D
         BVC   L3E81
         BRL   L3F68
L3E81    PER   L3E84+2
L3E84    BRL   L67DD
         BCC   L3E8C
         BRL   L3D99
L3E8C    PER   L3E8F+2
L3E8F    BRL   L3F24
         BCS   L3E97
         BRL   L3F68
L3E97    STZ   $04
         INC   $04
         PHK
         PER   L3EA6
         PEA   $0006
         PEI   $EE
         PEI   $EC
L3EA6    RTL

         STY   $08
         LDA   $88
         LSR
         BCC   L3EED
         LDY   #$0002
         STZ   $04
L3EB3    LDA   [$38],Y
         INY
         AND   #$00FF
         BEQ   L3EE6
         SEC
         SBC   #$0030
         STA   $06
         ASL   $04
         BCS   L3ED9
         LDA   $04
         ASL
         BCS   L3ED9
         ASL
         BCS   L3ED9
         CLC
         ADC   $04
         BCS   L3ED9
         CLC
         ADC   $06
         STA   $04
         BCC   L3EB3
L3ED9    PEA   $0002
         PHK
         PER   L3EE0+2
L3EE0    BRL   L8D82
         BRL   L3D99
L3EE6    LDA   $04
         LDY   #$004A
         STA   [$3C],Y
L3EED    LDX   #$0001
         PHK
         PER   L3EFB
         PEA   $0009
         PEI   $EE
         PEI   $EC
L3EFB    RTL

         LDA   $08
         STA   [$24]
         INC   $24
         INC   $24
         PER   L3F07+2
L3F07    BRL   L467E
         PHA
         PER   L3F0E+2
L3F0E    BRL   L4525
         PLA
         BNE   L3F17
         BRL   L3D28
L3F17    PEA   $0045
         PHK
         PER   L3F1E+2
L3F1E    BRL   L8D82
         BRL   L3D28
L3F24    PHK
         PER   L3F2F
         PEA   $000C
         PEI   $EE
         PEI   $EC
L3F2F    RTL

         BCC   L3F67
         PHK
         PER   L3F3D
         PEA   $001B
         PEI   $EE
         PEI   $EC
L3F3D    RTL

         BCC   L3F67
         LDY   #$0008
         PHK
         PER   L3F4E
         PEA   $0015
         PEI   $EE
         PEI   $EC
L3F4E    RTL

         BCS   L3F67
         TYA
         CLC
         ADC   #$0008
         TAY
         LDA   [$E0],Y
         AND   #$003C
         LSR
         LSR
         CLC
         DEC
         DEC
         BEQ   L3F67
         DEC
         BEQ   L3F67
         SEC
L3F67    RTS

L3F68    PER   L3F6B+2
L3F6B    BRL   L4525
         LDY   $6A
         STY   $28
L3F72    LDY   $28
         STY   $6A
         PER   L3F79+2
L3F79    BRL   L67DD
         BCC   L3F81
         BRL   L3D99
L3F81    DEX
         BPL   L3F87
         BRL   L4027
L3F87    BEQ   L3FD3
         PHK
         PER   L3F94
         PEA   $000C
         PEI   $EE
         PEI   $EC
L3F94    RTL

         BCS   L3F9A
         BRL   L4746
L3F9A    BIT   $A5
         BVC   L3FD3
         LDA   [$38]
         TAY
         INY
         LDA   [$38],Y
         PHA
         LDA   $00
         STA   [$38],Y
         PHY
         PHK
         PER   L3FB5
         PEA   $0018
         PEI   $EE
         PEI   $EC
L3FB5    RTL

         PLY
         PLA
         STA   [$38],Y
         BCS   L3FD3
         LDY   $6A
         STY   $28
         PER   L3FC3+2
L3FC3    BRL   L658A
         PEA   $0002
         PHK
         PER   L3FCD+2
L3FCD    BRL   L8D82
         BRL   L3D99
L3FD3    LDA   [$28]
         AND   #$00FF
         BNE   L3FF6
L3FDA    BIT   $8D
         BVS   L3FE1
         BRL   L4393
L3FE1    PER   L3FE4+2
L3FE4    BRL   L3F24
         BCS   L3FEC
         BRL   L4393
L3FEC    LDA   $64
         BEQ   L3FF3
         BRL   L55AD
L3FF3    BRL   L4092
L3FF6    TAX
L3FF7    PHA
         PLA
         BNE   L3FFE
         BRL   L3D28
L3FFE    CMP   #$0020
         BNE   L4010
         INC   $28
         INC   $B0
         LDA   [$28]
         AND   #$00FF
         BEQ   L3FDA
         BRA   L3FF7
L4010    CMP   #$0028
         BEQ   L407B
         CMP   #$003D
         BEQ   L4053
         TXA
         CMP   #$0020
         BNE   L403C
         DEC   $28
         DEC   $B0
         BRL   L4393
L4027    LDA   [$28]
         AND   #$00FF
         BNE   L4031
         BRL   L3D28
L4031    CMP   #$0020
         BNE   L403C
         INC   $28
         INC   $B0
         BRA   L4027
L403C    LDY   $6A
         STY   $28
         PER   L4043+2
L4043    BRL   L658A
         PEA   $001B
         PHK
         PER   L404D+2
L404D    BRL   L8D82
         BRL   L3D99
L4053    LDA   #$0080
L4056    TSB   $89
         LDA   #$000B
L405B    STA   $20
L405D    PHK
         PER   L4061+2
L4061    BRL   L73C8
         BCC   L4069
         BRL   L3D99
L4069    BIT   $90
         BPL   L4070
         BRL   L4F24
L4070    BIT   $8E
         BPL   L40BA
         BIT   $68
         BVC   L40BA
         BRL   L3D28
L407B    LDY   $00
         LDA   #$003D
         PER   L4083+2
L4083    BRL   L46A1
         BCC   L408B
         BRL   L4393
L408B    LDA   #$0080
         TSB   $8D
         BRA   L4056
L4092    LDA   #$4040
         TSB   $88
         LDA   #$0013
         BRA   L405B
         LDX   $00
         BRA   L40A3
L40A0    LDX   #$0001
L40A3    TXA
         ORA   #$000C
         STA   $20
         LDA   #$0040
         TSB   $88
         BRA   L405D
L40B0    LDA   #$0040
         TSB   $93
         LDA   #$000D
         BRA   L405B
L40BA    LDY   #$0C8A
         LDA   [$3C],Y
         BEQ   L4112
         LDX   #$0004
         PHK
         PER   L40CF
         PEA   $0009
         PEI   $EE
         PEI   $EC
L40CF    RTL

         LDY   #$0C8A
         LDA   [$3C],Y
         LDY   $00
         TAX
         DEX
L40D9    LDA   #$0019
         STA   $0C
L40DE    DEC   $0C
         BPL   L40FB
         STY   $0C
         STX   $0E
         LDX   #$0003
         PHK
         PER   L40F4
         PEA   $0009
         PEI   $EE
         PEI   $EC
L40F4    RTL

         LDY   $0C
         LDX   $0E
         BRA   L40D9
L40FB    LDA   [$BE],Y
         STA   [$24]
         INC   $24
         INC   $24
         INY
         INY
         LDA   [$BE],Y
         STA   [$24]
         INC   $24
         INC   $24
         INY
         INY
         DEX
         BPL   L40DE
L4112    LDX   #$0005
         BIT   $8A
         BVC   L411C
         LDX   #$000A
L411C    PHK
         PER   L4127
         PEA   $0009
         PEI   $EE
         PEI   $EC
L4127    RTL

         LDY   $00
         BIT   $8A
         BVC   L4152
         LDA   $C8
         STA   [$24]
         INC   $24
         INC   $24
         LDA   $C2
         STA   [$24]
         INC   $24
         LDY   #$0046
         LDA   [$3C],Y
         STA   [$24]
         INC   $24
         INC   $24
         LDY   #$0038
         LDA   [$3C],Y
         STA   [$24]
         INC   $24
         LDY   $00
L4152    STZ   $0E
         LDA   #$0080
         TRB   $8A
         LDA   [$2C],Y
         TAX
         AND   #$FF00
         XBA
         SEC
         SBC   #$0008
         STA   $B0
         TXA
         STZ   $14
         AND   #$00C0
         BNE   L419E
         LDA   #$8080
         STA   $14
         TXA
         AND   #$00FF
         LSR
         LSR
         CMP   #$0008
         BNE   L418E
         LDA   #$0080
         TSB   $8A
         TXA
         AND   #$FFC3
         ORA   #$0004
         TAX
         LDA   #$0001
L418E    DEC
         BEQ   L419E
         SEC
         ROR   $0E
         DEC
         BEQ   L419E
         CMP   #$0003
         BEQ   L419E
         STZ   $14
L419E    INY
         INY
         LDA   [$2C],Y
         AND   #$007F
         BIT   $8A
         BVC   L41CE
         CMP   #$0002
         BNE   L41CE
         SEP   #$20
L41B0    LDA   [$2C],Y
         BEQ   L41B7
         INY
         BRA   L41B0
L41B7    INY
         LDA   [$2C],Y
         BNE   L41C9
         PEA   $0045
         PHK
         PER   L41C3+2
L41C3    BRL   L8D82
         BRL   L3D99
L41C9    INY
         REP   #$20
         BRA   L4152
L41CE    XBA
         TSB   $0E
         XBA
         DEC
         BNE   L4245
         BIT   $14
         BPL   L4245
         TXA
         AND   #$00FC
         TAX
         LDA   $CB
         AND   #$0003
         STX   $02
         ORA   $02
         TAX
         BIT   $8F
         BMI   L41EF
         BRL   L427F
L41EF    PHY
         TXA
         ROR
         ROR
         BPL   L420F
         BCC   L421B
         LDA   #$0003
         STA   $06
         LDY   #$00C0
         LDA   [$3C],Y
         CLC
         ADC   #$0004
         LDY   #$00C0
         STA   [$3C],Y
         LDA   #$0002
         BRA   L4234
L420F    BCS   L4216
         LDA   #$0002
         BRA   L421E
L4216    LDA   #$0008
         BRA   L421E
L421B    LDA   #$0004
L421E    STA   $04
         LSR
         LSR
         STA   $06
         LDY   #$00BC
         LDA   [$3C],Y
         CLC
         ADC   $04
         LDY   #$00BC
         STA   [$3C],Y
         LDA   #$0001
L4234    PLY
         INY
         INY
         XBA
         ORA   #$8077
         CLC
         ADC   $06
         STA   [$2C],Y
         TXA
         DEY
         DEY
         BRA   L427F
L4245    TXA
         AND   #$00FF
         TAX
         BIT   $14
         BMI   L4268
         CMP   #$0050
         BEQ   L4275
         CMP   #$0054
         BEQ   L4275
         CMP   #$0058
         BEQ   L4275
         AND   #$00F3
         CMP   #$0040
         BEQ   L4275
         TXA
         BRA   L427F
L4268    TXA
         BIT   $89
         BMI   L427F
         AND   #$0003
         BEQ   L4275
         TXA
         BRA   L427F
L4275    LDA   $CA
         AND   #$0003
         STX   $02
         ORA   $02
         TAX
L427F    ORA   $0E
         XBA
         STA   [$24]
         INC   $24
         INC   $24
         INY
         INY
         LDA   $00
         STZ   $10
         BIT   $8E
         BPL   L42A2
         BIT   $0E
         BPL   L42A2
         LDA   #$8062
         STA   [$24]
         INC   $24
         INC   $24
         BRL   L3D28
L42A2    SEP   #$20
L42A4    LDA   [$2C],Y
         CMP   #$20
         BNE   L42AD
         BRL   L4367
L42AD    CMP   #$19
         BNE   L42B8
         STA   [$24]
         STA   $12
         BRL   L4362
L42B8    LDA   [$2C],Y
         BEQ   L430A
         BPL   L42CF
         BIT   $10
         BMI   L42CF
         PHA
         LDA   #$6E
         STA   [$24]
         STA   $12
         LDX   $24
         INX
         STX   $24
         PLA
L42CF    CMP   #$28
         BNE   L42DE
         BIT   $10
         BVS   L42DA
         BRL   L4367
L42DA    LDA   #$2C
         BRA   L430A
L42DE    CMP   #$29
         BNE   L42E5
         BRL   L4367
L42E5    CMP   #$11
         BEQ   L42ED
         CMP   #$12
         BNE   L430A
L42ED    PHA
         LDA   $12
         CMP   #$11
         BEQ   L42F8
         CMP   #$12
         BNE   L4309
L42F8    CMP   $01,S
         BNE   L4300
         LDA   #$11
         BRA   L4302
L4300    LDA   #$12
L4302    STA   $01,S
         LDX   $24
         DEX
         STX   $24
L4309    PLA
L430A    STA   [$24]
         STA   $12
         LDA   #$80
         TRB   $10
         LDA   $12
         BEQ   L436D
         BMI   L4326
         CMP   #$61
         BCC   L4341
         CMP   #$7B
         BCS   L4341
         LDA   #$80
         TSB   $10
         BRA   L4362
L4326    LDA   #$40
         BIT   $10
         TSB   $10
         BVC   L4362
         BIT   $14
         BPL   L4362
         DEC   $B0
         PEA   $005F
         PHK
         PER   L433B+2
L433B    BRL   L8D82
         BRL   L3D99
L4341    BIT   $10
         BVS   L435E
         CMP   #$12
         BEQ   L4362
         CMP   #$11
         BEQ   L4362
         BIT   $14
         BPL   L4362
         PEA   $0060
         PHK
         PER   L4358+2
L4358    BRL   L8D82
         BRL   L3D99
L435E    LDA   #$40
         TRB   $10
L4362    LDX   $24
         INX
         STX   $24
L4367    INY
         INC   $B0
         BRL   L42A4
L436D    BIT   $10
         BVS   L437F
         BIT   $14
         BPL   L437F
         PEA   $0061
         PHK
         PER   L437C+2
L437C    BRL   L8D82
L437F    INY
         LDA   [$2C],Y
         REP   #$20
         BEQ   L438C
         INC   $24
         INY
         BRL   L4152
L438C    STA   [$24]
         INC   $24
         BRL   L3D28
L4393    PHK
         PER   L439E
         PEA   $001B
         PEI   $EE
         PEI   $EC
L439E    RTL

         BCS   L43FA
         STA   $10
         LDA   #$0005
         STA   [$38]
         LDY   #$0002
         LDA   #$8D62
         STA   [$38],Y
         INY
         INY
         LDA   $10
         AND   #$00FF
         ORA   #$0080
         XBA
         ORA   #$0064
         STA   [$38],Y
         INY
         INY
         LDA   #$0001
         STA   [$38],Y
         LDY   $00
         STZ   $12
L43CB    PER   L43CE+2
L43CE    BRL   L46A6
         BCS   L43D8
         INC   $12
         INY
         BRA   L43CB
L43D8    LDA   $10
         XBA
         AND   #$00FF
         DEC
         BPL   L43E3
         LDA   $00
L43E3    CMP   $12
         BEQ   L43F4
         PEA   $0019
         PHK
         PER   L43EE+2
L43EE    BRL   L8D82
         BRL   L3D99
L43F4    LDA   #$000D
         BRL   L405B
L43FA    LDA   [$28]
         AND   #$00FF
         BEQ   L440E
         CMP   #$0020
         BEQ   L440E
         DEC   $28
         XBA
         ORA   #$0020
         STA   [$28]
L440E    LDA   $00
         LDY   #$00BC
         STA   [$3C],Y
         LDY   #$00C0
         STA   [$3C],Y
         LDY   $28
         STY   $D4
         LDA   #$00C0
         TSB   $90
         BRL   L3DB0
L4426    BIT   $8F
         BVC   L445B
         LDA   #$0040
         TRB   $90
         LDY   $D4
         STY   $28
         LDA   $D2
         BNE   L444A
         PER   L443A+2
L443A    BRL   L75AD
         PEA   $0002
         PHK
         PER   L4444+2
L4444    BRL   L8D82
         BRL   L3D99
L444A    LDA   [$28]
         AND   #$00FF
         BEQ   L44AC
         LDA   [$28]
         AND   #$FF00
         ORA   #$002C
         STA   [$28]
L445B    LDY   $D4
         STY   $28
         PER   L4462+2
L4462    BRL   L44EA
         BMI   L44AC
         CLC
         ADC   $28
         STA   $28
         LDA   #$04F8
         CLC
         ADC   $3C
         STA   $38
         LDA   $00
         ADC   $3E
         STA   $3A
         LDA   #$0002
         TAY
         STA   [$38]
         SEP   #$20
         LDA   #$3D
         STA   [$28]
         LDA   #$7A
         STA   [$38],Y
         INY
         LDA   #$81
         STA   [$38],Y
         LDA   $00
         INY
         STA   [$38],Y
         REP   #$20
         LDY   #$0001
         PER   L449C+2
L449C    BRL   L46D6
         BCC   L44A4
         BRL   L3DB0
L44A4    LDA   #$0080
         TSB   $A5
         BRL   L3DB0
L44AC    STZ   $90
         LDY   #$00BC
         LDA   [$3C],Y
         LDY   $C8
         CMP   [$E0],Y
         BCC   L44BB
         STA   [$E0],Y
L44BB    LDY   #$00C0
         LDA   [$3C],Y
         CLC
         ADC   #$0004
         LDY   $C8
         INY
         INY
         CMP   [$E0],Y
         BCC   L44CE
         STA   [$E0],Y
L44CE    LDX   #$000F
         PHK
         PER   L44DC
         PEA   $0009
         PEI   $EE
         PEI   $EC
L44DC    RTL

         LDA   $D2
         STA   [$24]
         INC   $24
         INC   $24
         STZ   $04
         BRL   L3D28
L44EA    LDX   $00
         TXY
         STZ   $04
         DEC   $04
         SEP   #$20
L44F3    LDA   [$28],Y
         BEQ   L4520
         CMP   #$2C
         BNE   L4503
         PHX
         PLX
         BNE   L451D
         STY   $04
         BRA   L451D
L4503    CMP   #$3D
         BNE   L4511
         PHX
         PLX
         BNE   L451D
         LDA   $00
         STA   [$28],Y
         BRA   L4520
L4511    CMP   #$28
         BNE   L4518
         INX
         BRA   L451D
L4518    CMP   #$29
         BNE   L451D
         DEX
L451D    INY
         BRA   L44F3
L4520    REP   #$20
         LDA   $04
         RTS

L4525    LDA   $6C
         BNE   L457D
         BIT   $92
         BMI   L457D
         BIT   $8D
         BVS   L457D
         LDA   $A4
         LSR
         BCC   L457D
         ASL
         STA   $A4
         LDA   $C2
         XBA
         AND   #$FF00
         LDY   #$0038
         ORA   [$3C],Y
         PHA
         LDX   #$FFFF
         PHK
         PER   L4553
         PEA   $0009
         PEI   $EE
         PEI   $EC
L4553    RTL

         PLA
         LDY   #$003A
         STA   [$3C],Y
         TAX
         XBA
         STA   [$24]
         BVS   L457D
         LDY   #$0046
         LDA   [$3C],Y
         INC   $24
         STA   [$24]
         INC   $24
         INC   $24
         LDY   #$004A
         LDA   [$3C],Y
         STA   [$24]
         INC   $24
         INC   $24
         TXA
         STA   [$24]
         INC   $24
L457D    RTS

L457E    PHP
         SEP   #$20
         PHX
         PHK
         PLB
         LDX   $00
         TXY
L4587    LDA   ($01,S),Y
         BEQ   L459A
         STA   $04,X
         INY
         INX
         CPX   #$0008
         BMI   L4587
         LDA   #$00
         STA   $04,X
         DEX
         DEC
L459A    STA   $04,X
         PLX
         BRA   L45A2
L459F    PHP
         SEP   #$20
L45A2    LDY   $28
         STY   $2C
         LDY   $2A
         STY   $2E
         LDY   $00
         PHY
         TYA
         XBA
         STZ   $21
L45B1    PER   L45B4+1
L45B4    BRA   L45F8
         BCS   L45F4
         PLX
         PHY
         LDX   $00
L45BC    LDA   [$28],Y
         BEQ   L45C8
         CMP   $04,X
         BNE   L45CE
         INY
         INX
         BRA   L45BC
L45C8    LDA   $04,X
         BEQ   L45F0
         BRA   L45F4
L45CE    PHY
         PHA
         PLA
         BMI   L45E3
         TAY
         LDA   $04,X
         BNE   L45E3
         LDA   [$94],Y
         BMI   L45EF
         BEQ   L45EF
         DEC
         DEC
         DEC
         BEQ   L45EF
L45E3    PLY
         PER   L45E7+1
L45E7    BRA   L4635
         BCS   L45F4
         DEC   $21
         BRA   L45B1
L45EF    PLY
L45F0    PLX
         PLP
         CLC
         RTS

L45F4    PLX
         PLP
         SEC
         RTS

L45F8    LDA   $00
         XBA
L45FB    PHY
         LDA   [$28],Y
         BEQ   L4632
         BPL   L4604
         PLY
         RTS

L4604    TAY
         LDA   [$94],Y
         BPL   L460D
L4609    PLY
         INY
         BRA   L45FB
L460D    BNE   L4627
         TYA
         CMP   #$26
         BNE   L4609
L4614    PLY
         PHX
         LDX   #$FFFF
         PER   L461C+2
L461C    BRL   L8C28
         DEC   $21
         PLX
         LDA   $00
         XBA
         BRA   L45FB
L4627    DEC
         BEQ   L4614
         TYA
         CMP   #$2E
         BEQ   L4614
         PLY
         CLC
         RTS

L4632    PLY
         SEC
         RTS

L4635    LDA   $00
         XBA
L4638    PHY
         LDA   [$28],Y
         BEQ   L4656
         BMI   L4659
         TAY
         LDA   [$94],Y
         BNE   L464D
         TYA
         PLY
         CMP   #$26
         BEQ   L464B
         INY
L464B    CLC
         RTS

L464D    BPL   L4652
         PLY
         CLC
         RTS

L4652    PLY
         INY
         BRA   L4638
L4656    PLY
         SEC
         RTS

L4659    PLY
         INY
         CLC
         RTS

L465D    PER   L4660+2
L4660    BRL   L457E
         BCC   L4666
         RTS

L4666    PHP
         PHX
         PHY
         TXY
         LDX   $00
         SEP   #$20
L466E    LDA   $04,X
         BEQ   L467A
         LDA   #$20
         STA   [$28],Y
         INX
         INY
         BRA   L466E
L467A    PLY
         PLX
         PLP
         RTS

         MX    %00
L467E    LDA   [$28]
         AND   #$00FF
         CMP   #$0020
         BNE   L468C
         INC   $28
         BRA   L467E
L468C    PER   L468F+2
L468F    BRL   L658A
         RTS

L4693    LDA   [$28],Y
         AND   #$00FF
         CMP   #$0020
         BNE   L46A0
         INY
         BRA   L4693
L46A0    RTS

L46A1    PHP
         SEP   #$20
         BRA   L46AB
L46A6    PHP
         SEP   #$20
         LDA   #$2C
L46AB    LDX   $00
         PHY
         PHA
L46AF    LDA   [$28],Y
         BEQ   L46D0
         INY
         CMP   #$28
         BNE   L46BB
         INX
         BRA   L46AF
L46BB    CMP   #$29
         BNE   L46C2
         DEX
         BMI   L46D0
L46C2    CMP   $01,S
         BNE   L46AF
         PHX
         PLX
         BNE   L46AF
         DEY
         PLA
         PLX
         PLP
         CLC
         RTS

L46D0    TYX
         PLA
         PLY
         PLP
         SEC
         RTS

L46D6    PHY
         PHP
         SEP   #$20
         LDA   $00
         XBA
L46DD    LDA   [$28],Y
         BEQ   L473C
         INY
         CMP   #$20
         BEQ   L46DD
         TAX
         PHY
         TAY
         LDA   [$94],Y
         PLY
         DEC
         DEC
         BMI   L4741
         TXA
         CMP   #$2E
         BEQ   L4741
         CMP   #$46
         BNE   L46FF
         LDA   [$28],Y
         CMP   #$4E
         BEQ   L4741
L46FF    LDA   [$28],Y
         BEQ   L473C
         BMI   L4741
         PHY
         TAY
         LDA   [$94],Y
         BMI   L470F
         PLY
         INY
         BRA   L46FF
L470F    TYA
         PLY
         CMP   #$28
         BNE   L473C
         LDX   $00
L4717    INY
         LDA   [$28],Y
         BEQ   L473C
         CMP   #$28
         BNE   L4723
         INX
         BRA   L4717
L4723    CMP   #$29
         BNE   L4717
         DEX
         BPL   L4717
L472A    INY
         LDA   [$28],Y
         BEQ   L4737
         CMP   #$20
         BEQ   L472A
         CMP   #$2C
         BNE   L473C
L4737    PLP
         CLC
         CLV
         BRA   L4744
L473C    PLP
         CLV
         SEC
         BRA   L4744
L4741    PLP
         SEP   #$41
L4744    PLY
         RTS

         MX    %00
L4746    PHA
         LDA   #$0040
         TSB   $8F
         LDA   #$0003
         STA   [$38]
         LDA   $01,S
         AND   #$FF00
         LDY   #$0002
         ORA   #$8062
         STA   [$38],Y
         INY
         INY
         LDA   #$0001
         STA   [$38],Y
         PLA
         AND   #$00FF
         STA   $66
         PER   L477A
         ASL
         TAY
         PHK
         PLB
         LDA   ($01,S),Y
         CLC
         ADC   $01,S
         STA   $01,S
         RTS

L477A    DW    $009F
         DW    $00AC
         DW    $00D1
         DW    $0157
         DW    $015B
         DW    $0160
         DW    $0165
         DW    $01EF
         DW    $020F
         DW    $0259
         DW    $0592
         DW    $06C4
         DW    $0808
         DW    $081C
         DW    $089F
         DW    $089F
         DW    $089F
         DW    $089F
         DW    $089F
         DW    $089F
         DW    $089F
         DW    $08EE
         DW    $091A
         DW    $0946
         DW    $0B6B
         DW    $0D7D
         DW    $0DA7
         DW    $0DEB
         DW    $0E17
         DW    $0E27
         DW    $0E8B
         DW    $1111
         DW    $1111
         DW    $1181
         DW    $11E0
         DW    $11E6
         DW    $122D
         DW    $1235
         DW    $123B
         DW    $1241
         DW    $1241
         DW    $127F
         DW    $1456
         DW    $14CA
         DW    $14CD
         DW    $14F2
         DW    $1516
         DW    $1642
         DW    $1667
         DW    $1686
         DW    $1691
         DW    $16D4
         DW    $16F8
         DW    $1726
         DW    $17BC
         DW    $184A
         DW    $1860
         DW    $1957
         DW    $1996
         DW    $19DE
         DW    $19E4
         DW    $19E9
         DW    $1A56
         DW    $1A8D
         DW    $1ABD
         DW    $1AE5
         DW    $1BBE
         DW    $1BEC
         DW    $1C24
         DW    $1C4A
         DW    $1C6A
         DW    $1C8D
         DW    $1CA8
         DW    $1CCD
         DW    $1CE6
         DW    $1D0E
         DW    $1D2A
         DW    $1D69
         DW    $1DA4
         DW    $1DA4
         PEA   $0002
         PHK
         PER   L4821+2
L4821    BRL   L8D82
         BRL   L3D99
         LDA   [$28]
         BNE   L4838
         PEA   $004E
         PHK
         PER   L4832+2
L4832    BRL   L8D82
         BRL   L3D99
L4838    PER   L483B+2
L483B    BRL   L67DD
         PER   L4841+2
L4841    BRL   L583F
         BCC   L4849
         BRL   L3D99
L4849    BRL   L4393
         LDY   $28
         STY   $CE
         INC   $CE
         LDA   [$28]
         BEQ   L485C
         BRA   L486F
L4858    LDY   $CE
         STY   $28
L485C    PER   L485F+2
L485F    BRL   L658A
         PEA   $0002
         PHK
         PER   L4869+2
L4869    BRL   L8D82
         BRL   L3D99
L486F    PER   L4872+2
L4872    BRL   L67DD
L4875    LDA   [$28]
         AND   #$00FF
         BEQ   L485C
         CMP   #$0020
         BNE   L4885
         INC   $28
         BRA   L4875
L4885    CMP   #$0028
         BEQ   L4898
         CMP   #$003D
         BNE   L485C
         DEC   $28
         DEC   $28
         LDA   #$2928
         STA   [$28]
L4898    STZ   $B8
         LDY   #$04FA
         LDA   [$3C],Y
         CMP   #$4E46
         BNE   L4858
         LDY   #$0008
         PHK
         PER   L48B2
         PEA   $0015
         PEI   $EE
         PEI   $EC
L48B2    RTL

         BCS   L48C2
         TYA
         CLC
         ADC   #$000A
         TAY
         LDA   [$E0],Y
         ORA   #$8000
         STA   [$E0],Y
L48C2    LDA   #$00C0
         TSB   $8B
         LDA   #$8080
         TSB   $88
         LDA   #$0017
         BRL   L405B
         LDX   $00
         BRA   L48E3
         LDX   $00
         INX
         BRA   L48E3
         LDX   #$0002
         BRA   L48E3
         LDX   #$0003
L48E3    STX   $44
         LDA   #$01D4
         CLC
         ADC   $3C
         STA   $34
         LDA   $00
         ADC   $3E
         STA   $36
         LDA   $00
L48F5    SEP   #$20
         LDA   [$28]
         BEQ   L4965
         REP   #$20
         INC   $28
L48FF    SEP   #$20
         CMP   #$20
         BEQ   L48F5
         CMP   #$2C
         BEQ   L48F5
         CMP   #$5B
         BCC   L4920
L490D    PER   L4910+2
L4910    BRL   L658A
         PEA   $0008
         PHK
         PER   L491A+2
L491A    BRL   L8D82
         BRL   L3D99
L4920    SEC
         SBC   #$41
         BMI   L490D
         TAY
         LDA   $44
         STA   [$34],Y
L492A    LDA   [$28]
         BEQ   L4965
         REP   #$20
         INC   $28
         SEP   #$20
         CMP   #$20
         BEQ   L492A
         CMP   #$2D
         BNE   L48FF
L493C    LDA   [$28]
         REP   #$20
         INC   $28
         SEP   #$20
         CMP   #$20
         BEQ   L493C
         CMP   #$5B
         BCS   L490D
         SEC
         SBC   #$41
         BMI   L490D
         SEC
         STY   $02
         SBC   $02
         BEQ   L48F5
         BMI   L490D
         TAX
         LDA   $44
L495D    INY
         STA   [$34],Y
         DEX
         BNE   L495D
         BRA   L48F5
L4965    REP   #$20
         BRL   L3D99
         PER   L496D+2
L496D    BRL   L4F53
         BCS   L497F
         LDA   #$2020
         STA   [$28],Y
         INY
         INY
         STA   [$28],Y
         INY
         INY
         STA   [$28],Y
L497F    LDA   #$0080
         TSB   $8F
         LDA   #$000F
         BRL   L405B
         PER   L4994
         PLX
         PER   L4994+4
         BRL   L457E
L4994    ASC   'BASE'00
         TYA
         CLC
         ADC   $28
         STA   $28
         PER   L49A2+2
L49A2    BRL   L467E
         LDY   #$0400
         CMP   #$0030
         BEQ   L49C0
         CMP   #$0031
         BNE   L49C7
         TYA
         TSB   $72
         TSB   $68
L49B7    PER   L49BA+2
L49BA    BRL   L4CA9
         BRL   L3D28
L49C0    TYA
         TRB   $72
         TRB   $68
         BRA   L49B7
L49C7    PEA   $0002
         PHK
         PER   L49CE+2
L49CE    BRL   L8D82
         BRL   L3D99
L49D4    INC   $28
         PER   L49D9+2
L49D9    BRL   L467E
         CMP   #$0024
         BEQ   L49E4
         BRL   L3D28
L49E4    INC   $28
         PER   L49E9+2
L49E9    BRL   L67DD
         BCC   L49F1
         BRL   L3D28
L49F1    PER   L49F4+2
L49F4    BRL   L4525
         PHK
         PER   L4A02
         PEA   $001E
         PEI   $EE
         PEI   $EC
L4A02    RTL

         BCC   L4A08
         BRL   L3D99
L4A08    DEC
         ASL
         TAY
         PER   L4A1A
         PHK
         PLB
         LDA   ($01,S),Y
         CLC
         ADC   $01,S
         STA   $01,S
         BIT   $92
         RTS

L4A1A    DW    $0009
         DW    $0025
         DW    $01EB
         DW    $02A6      ; A6 02
         DW    $02B3      ; B3 02
         PER   L4A2E
         PLX
         PER   L4A2E+2
         BRL   L457E
L4A2E    ASC   'ON'00
         LDA   #$0080
         BCC   L4A3B
         TRB   $93
         BRL   L3D28
L4A3B    TSB   $93
         BRL   L3D28
         BPL   L4A45
         BRL   L3D28
L4A45    LDY   #$000A
         LDA   [$3C],Y
         BEQ   L4A59
         PEA   $007D
         PHK
         PER   L4A53+2
L4A53    BRL   L8D82
         BRL   L3D99
L4A59    LDY   $38
         STY   $30
         LDY   $3A
         STY   $32
         LDX   #$00A2
         PER   L4A67+2
L4A67    BRL   L4BBA
         BCC   L4A6F
         BRL   L3D99
L4A6F    XBA
         STA   [$38]
         PEI   $3A
         INC   $38
         PEI   $38
         PHK
         PER   L4A7C+2
L4A7C    BRL   LA2FC
         TAX
         DEC   $38
         LDA   [$38]
         XBA
         STA   [$38]
         TXA
         BCC   L4A97
         PEA   $007E
         PHK
         PER   L4A91+2
L4A91    BRL   L8D82
         BRL   L3D99
L4A97    TAX
         LDY   #$0008
         LDA   [$3C],Y
         LDY   #$000A
         STA   [$3C],Y
         TXA
         LDY   #$0008
         STA   [$3C],Y
         PHK
         PER   L4AB3
         PEA   $002D
         PEI   $EE
         PEI   $EC
L4AB3    RTL

         LDY   #$0038
         LDA   [$3C],Y
         LDY   #$003C
         STA   [$3C],Y
         TXA
         DEC
         LDY   #$0038
         STA   [$3C],Y
         LDY   #$0046
         LDA   [$3C],Y
         LDY   #$004A
         STA   [$3C],Y
         LDY   #$014E
         STA   [$3C],Y
         LDY   #$004C
         LDA   [$3C],Y
         LDY   #$004E
         STA   [$3C],Y
         LDY   #$002C
         LDA   [$3C],Y
         LDY   #$002E
         STA   [$3C],Y
         LDY   #$0024
         LDA   [$3C],Y
         LDY   #$0028
         STA   [$3C],Y
         LDY   #$0026
         LDA   [$3C],Y
         LDY   #$002A
         STA   [$3C],Y
         LDA   #$02F0
         CLC
         ADC   $3C
         LDX   $3E
         BCC   L4B07
         INX
L4B07    LDY   #$0020
         STA   [$3C],Y
         LDY   #$0024
         STA   [$3C],Y
         STA   $2C
         TXA
         STA   $2E
         LDY   #$0022
         STA   [$3C],Y
         LDY   #$0026
         STA   [$3C],Y
         LDY   #$01B4
         LDX   #$01C4
L4B26    LDA   [$3C],Y
         PHY
         TXY
         STA   [$3C],Y
         PLY
         LDA   $00
         STA   [$3C],Y
         INY
         INY
         INX
         INX
         CPY   #$01C4
         BCC   L4B26
         LDY   #$0008
         LDA   [$3C],Y
         PHA
         PHK
         PER   L4B44+2
L4B44    BRL   LA537
         LDY   #$01B4
         STA   [$3C],Y
         INY
         INY
         TXA
         STA   [$3C],Y
         LDA   $00
         STA   [$2C]
         LDY   #$002C
         STA   [$3C],Y
         LDY   #$0046
         STA   [$3C],Y
         INC
         LDY   #$004C
         STA   [$3C],Y
         LDA   $B2
         LDY   #$0030
         STA   [$3C],Y
         STZ   $B2
         LDA   #$00FF
         TRB   $71
         INC   $28
         PER   L4B78+2
L4B78    BRL   L467E
         LDX   $00
         CMP   #$002F
         BNE   L4B92
         INC   $28
         PER   L4B87+2
L4B87    BRL   L467E
         LDX   $00
         CMP   #$004C
         BNE   L4B92
         DEX
L4B92    LDY   #$001A
         LDA   [$3C],Y
         BIT   #$0010
         BEQ   L4B9D
         DEX
L4B9D    BIT   #$0020
         BNE   L4BAA
         TXA
         BEQ   L4BB5
         LDA   #$0040
         BRA   L4BB5
L4BAA    TXA
         BMI   L4BB2
         LDA   #$00C0
         BRA   L4BB5
L4BB2    LDA   #$0080
L4BB5    TSB   $71
         BRL   L3D28
L4BBA    PHX
         PER   L4BBE+2
L4BBE    BRL   L467E
         CMP   #$0022
         BNE   L4BF9
         INC   $28
         LDY   #$0002
         LDA   $00
         STA   [$30],Y
L4BCF    LDA   [$28]
         AND   #$00FF
         BEQ   L4BF1
         CMP   #$0022
         BEQ   L4BF1
         STA   [$30],Y
         INC   $28
         INY
         TYA
         CMP   $01,S
         BCC   L4BCF
         PEA   $000F
         PHK
         PER   L4BEC+2
L4BEC    BRL   L8D82
         BRA   L4C03
L4BF1    DEY
         DEY
         TYA
         STA   [$30]
         CLC
L4BF7    PLX
         RTS

L4BF9    PEA   $0002
         PHK
         PER   L4C00+2
L4C00    BRL   L8D82
L4C03    SEC
         BRA   L4BF7
         BPL   L4C0B
         BRL   L3D28
L4C0B    STZ   $14
         PER   L4C87
L4C10    PER   L4C13+2
L4C13    BRL   L467E
         STZ   $04
         CMP   #$002D
         BEQ   L4C26
         INC   $04
         CMP   #$002B
         BEQ   L4C26
         BRA   L4C28
L4C26    INC   $28
L4C28    PER   L4C2B+2
L4C2B    BRL   L467E
         INC   $28
         CMP   #$002C
         BEQ   L4C10
         TAY
         BEQ   L4C7A
         ORA   #$0020
         LDY   #$0000
         PHK
         PLB
         SEP   #$20
L4C42    CMP   ($01,S),Y
         BEQ   L4C51
         BCC   L4C4D
         INY
         INY
         INY
         BRA   L4C42
L4C4D    REP   #$20
         BRA   L4C10
L4C51    REP   #$20
         INY
         LDA   ($01,S),Y
         AND   #$FFFB
         CMP   ($01,S),Y
         BEQ   L4C5F
         INC   $14
L4C5F    LDX   $04
         BNE   L4C67
         TRB   $72
         BRA   L4C10
L4C67    TSB   $72
         CMP   #$0001
         BNE   L4C10
         LDY   #$001A
         ORA   [$3C],Y
         LDY   #$001A
         STA   [$3C],Y
         BRA   L4C10
L4C7A    PLA
         LDA   $14
         BEQ   L4C84
         PER   L4C82+1
L4C82    BRA   L4CA9
L4C84    BRL   L3D28
L4C87    DB    $38
         DB    $04
         DB    $20
         DB    $61
         DB    $01
         DB    $00
         DB    $62
         DB    $04
         DB    $04
         DB    $63
         DB    $44
         DB    $00
         DB    $64
         DB    $04
         DB    $80
         DB    $65
         DB    $08
         DB    $00
         DB    $69
         DB    $10
         DB    $00
         DB    $6C
         DB    $20
         DB    $00
         DB    $72
         DB    $80
         DB    $00
         DB    $73
         DB    $00
         DB    $01
         DB    $75
         DB    $04
         DB    $40
         DB    $FF
L4CA9    LDX   #$0017
         PHK
         PER   L4CB7
         PEA   $0009
         PEI   $EE
         PEI   $EC
L4CB7    RTL

         LDA   $72
         STA   [$24]
         INC   $24
         INC   $24
         RTS

         BPL   L4CC6
         BRL   L3D28
L4CC6    LDA   #$0020
         TSB   $71
         BRL   L3D28
         BPL   L4CD3
         BRL   L3D28
L4CD3    LDY   #$000A
         LDA   [$E0],Y
         INC
         INC
         CLC
         ADC   $E0
         STA   $30
         LDA   $00
         ADC   $E2
         STA   $32
         LDA   [$30]
         XBA
         STA   $04
         LDX   #$002F
         PER   L4CF0+2
L4CF0    BRL   L4BBA
         BCC   L4CF8
         BRL   L3D99
L4CF8    XBA
         STA   [$30]
         XBA
         SEC
         SBC   $04
         CLC
         LDY   #$0044
         ADC   [$3C],Y
         LDY   #$0044
         STA   [$3C],Y
         BRL   L3D28
         LDA   #$2000
         BIT   $68
         BNE   L4D2E
         PEA   $002C
         PHK
         PER   L4D1B+2
L4D1B    BRL   L8D82
         BRL   L3D99
L4D21    PEA   $0002
         PHK
         PER   L4D28+2
L4D28    BRL   L8D82
         BRL   L3D99
L4D2E    PER   L4D31+2
L4D31    BRL   L467E
         TAX
         BEQ   L4D63
         LDY   $00
         PER   L4D3C+2
L4D3C    BRL   L46D6
         BVS   L4D21
         BCS   L4D79
         LDY   #$0008
         PER   L4D49+1
L4D49    BRA   L4D94
         BCS   L4D66
         LDA   [$E0],Y
         AND   #$0030
         CMP   #$0020
         BEQ   L4D8A
L4D57    PEA   $002D
         PHK
         PER   L4D5E+2
L4D5E    BRL   L8D82
         BRA   L4D66
L4D63    BRL   L3D28
L4D66    LDY   $00
         PER   L4D6B+2
L4D6B    BRL   L46A6
         BCS   L4D63
         TYA
         INC
         CLC
         ADC   $28
         STA   $28
         BRA   L4D2E
L4D79    LDY   #$0006
         PER   L4D7F+1
L4D7F    BRA   L4D94
         BCS   L4D66
         LDA   [$E0],Y
         AND   #$003C
         BNE   L4D57
L4D8A    INY
         LDA   [$E0],Y
         AND   #$7FFF
         STA   [$E0],Y
         BRA   L4D66
L4D94    PHY
         PEI   $B0
         PER   L4D9A+2
L4D9A    BRL   L67DD
         LDA   [$38]
         STA   $12
         PLA
         STA   $B0
         BCC   L4DA9
         BRL   L4E3C
L4DA9    TXA
         BEQ   L4E26
         PLY
         PHY
         PHK
         PER   L4DB9
         PEA   $0015
         PEI   $EE
         PEI   $EC
L4DB9    RTL

         BCC   L4E32
         LDY   #$04FA
         LDA   [$3C],Y
         ORA   #$0080
         LDY   #$04FA
         STA   [$3C],Y
         PLY
         PHY
         PHK
         PER   L4DD6
         PEA   $0015
         PEI   $EE
         PEI   $EC
L4DD6    RTL

         BCC   L4E13
         LDY   #$04FA
         LDA   [$3C],Y
         AND   #$FF7F
         LDY   #$04FA
         STA   [$3C],Y
         PER   L4DE9+2
L4DE9    BRL   L8976
         BEQ   L4E26
         LDA   #$0080
         LDY   #$04FA
         ORA   [$3C],Y
         LDY   #$04FA
         STA   [$3C],Y
         PLY
         PHY
         PHK
         PER   L4E08
         PEA   $0015
         PEI   $EE
         PEI   $EC
L4E08    RTL

         BCC   L4E13
         PER   L4E0E+2
L4E0E    BRL   L8A04
         BRA   L4E26
L4E13    PLA
         PHY
         INY
         LDA   [$E0],Y
         AND   #$3800
         BNE   L4E26
         PLA
         CLC
         ADC   #$0008
         PHA
         CLC
         BRA   L4E3D
L4E26    PEA   $002D
         PHK
         PER   L4E2D+2
L4E2D    BRL   L8D82
         BRA   L4E3C
L4E32    PEA   $002E
         PHK
         PER   L4E39+2
L4E39    BRL   L8D82
L4E3C    SEC
L4E3D    PLY
         RTS

         LDA   #$2000
         BIT   $68
         BEQ   L4E50
         PEA   $002F
         PHK
         PER   L4E4D+2
L4E4D    BRL   L8D82
L4E50    LDY   #$0086
         LDA   [$3C],Y
         DEC
         BNE   L4E5E
         PER   L4E5B+2
L4E5B    BRL   L6B82
L4E5E    LDY   #$0086
         LDA   [$3C],Y
         INC
         LDY   #$0086
         STA   [$3C],Y
         CMP   #$007F
         BCC   L4E78
         PEA   $0082
         PHK
         PER   L4E75+2
L4E75    BRL   L8D82
L4E78    LDA   #$00FF
         TRB   $91
         LDA   #$00C0
         TSB   $91
         PER   L4E85+2
L4E85    BRL   L67DD
         LDA   #$0020
         BIT   $72
         BEQ   L4EAF
         PEI   $3A
         LDA   $38
         INC
         INC
         PHA
         PER   L4E99+2
L4E99    BRL   L08A4
         BIT   $70
         BPL   L4EAF
         BVS   L4EAF
         PHK
         PER   L4EA6+2
L4EA6    BRL   L08D6
         PER   L4EAC+2
L4EAC    BRL   L71DF
L4EAF    PER   L4EB2+2
L4EB2    BRL   L4F53
         PER   L4EBF
         PLX
         PER   L4EBF+6
         BRL   L465D
L4EBF    ASC   'SHARED'00
         BCS   L4ECE
         PER   L4ECB+2
L4ECB    BRL   L8FF6
L4ECE    SEP   #$20
L4ED0    DEY
         LDA   [$28],Y
         CMP   #$20
         BEQ   L4ED0
         INY
         LDA   $00
         STA   [$28],Y
L4EDC    LDA   [$28]
         BEQ   L4EEE
         SEP   #$20
         CMP   #$20
         BNE   L4EEE
         INC   $28
         BNE   L4EDC
         INC   $29
         BRA   L4EDC
L4EEE    REP   #$20
         BNE   L4EFE
         LDA   #$2928
         STA   [$28]
         LDA   $00
         LDY   #$0002
         STA   [$28],Y
L4EFE    LDA   $00
         LDY   #$00AC
         STA   [$3C],Y
         LDY   #$00AE
         STA   [$3C],Y
         LDY   #$00B0
         STA   [$3C],Y
         LDY   #$00B2
         STA   [$3C],Y
         LDA   #$0040
         TSB   $89
         LDA   #$1000
         TSB   $68
         LDA   #$0013
         BRL   L405B
L4F24    STZ   $90
         LDX   #$0010
         PHK
         PER   L4F34
         PEA   $0009
         PEI   $EE
         PEI   $EC
L4F34    RTL

         LDY   #$0086
         LDA   [$3C],Y
         STA   [$24]
         INC   $24
         INC   $24
         LDY   #$0002
         LDA   [$BE],Y
         STA   [$24]
         INC   $24
         INC   $24
         LDA   #$2000
         TSB   $68
         BRL   L3D28
L4F53    PER   L4F5D
         PLX
         PER   L4F5D+6
         BRL   L465D
L4F5D    ASC   'STATIC'00
         BCS   L4F6D
         TXY
         LDA   #$0001
         TSB   $91
         CLC
L4F6D    RTS

L4F6E    LDA   #$2000
         AND   $68
         BEQ   L4F82
         PEA   $0027
         PHK
         PER   L4F7C+2
L4F7C    BRL   L8D82
         BRL   L3D99
L4F82    RTS

         PER   L4F86+1
L4F86    BRA   L4F6E
         LDA   #$0080
         TSB   $8F
         LSR
         XBA
         TSB   $68
         LDA   #$000F
         BRL   L405B
         LDY   $00
         SEP   #$20
L4F9B    LDA   [$28],Y
         BEQ   L4FA5
         INY
         CMP   #$20
         BEQ   L4F9B
         DEY
L4FA5    REP   #$20
         TYA
         CLC
         ADC   $28
         STA   $28
         LDX   #$0013
         PHK
         PER   L4FBB
         PEA   $0009
         PEI   $EE
         PEI   $EC
L4FBB    RTL

         LDX   $00
         TXY
         SEP   #$20
L4FC1    LDA   [$28]
         BEQ   L4FFE
         CMP   #$2C
         BNE   L4FEA
         PHX
         PLX
         BNE   L4FF3
L4FCD    DEY
         BMI   L4FD6
         LDA   [$24],Y
         CMP   #$20
         BEQ   L4FCD
L4FD6    INY
L4FD7    INC   $28
         BNE   L4FDD
         INC   $29
L4FDD    LDA   [$28]
         CMP   #$20
         BEQ   L4FD7
         LDA   #$2C
         STA   [$24],Y
         INY
         BRA   L4FC1
L4FEA    CMP   #$22
         BNE   L4FF3
         DEX
         BEQ   L4FF3
         INX
         INX
L4FF3    STA   [$24],Y
         INY
         INC   $28
         BNE   L4FC1
         INC   $29
         BRA   L4FC1
L4FFE    LDA   #$2C
         STA   [$24],Y
         INY
         REP   #$20
         TYA
         CLC
         ADC   $24
         STA   $24
         TYA
         CLC
         LDY   #$008A
         ADC   [$3C],Y
         LDY   #$008A
         STA   [$3C],Y
         BRL   L3D28
         PER   L501D+2
L501D    BRL   L6750
         LDA   #$4649
         STA   $04
         STZ   $06
         PER   L502A+2
L502A    BRL   L459F
         BCC   L505C
         LDA   $00
         LDX   #$7FFF
         PER   L5037+2
L5037    BRL   L6650
         BCS   L504F
         PER   L503F+2
L503F    BRL   L66E3
         LDA   [$28]
         AND   #$00FF
         BNE   L504C
         BRL   L3D28
L504C    BRL   L3DB0
L504F    PEA   $006E
         PHK
         PER   L5056+2
L5056    BRL   L8D82
         BRL   L3D99
L505C    PEA   $0002
         PHK
         PER   L5063+2
L5063    BRL   L8D82
         BRL   L3D99
         PER   L506C+2
L506C    BRL   L6750
         LDX   #$7FFF
         LDA   $00
         PER   L5077+2
L5077    BRL   L6650
         BCS   L504F
         PER   L507F+2
L507F    BRL   L66E3
         DEC   $28
         DEC   $28
         LDA   #$4649
         STA   [$28]
         STA   $C4
         LDA   #$0002
         TSB   $8E
         BRL   L3DB0
L5095    PER   L5098+2
L5098    BRL   L66E3
         PER   L509E+2
L509E    BRL   L6749
         LDX   #$0002
         PER   L50A7+2
L50A7    BRL   L678F
         LDA   [$28]
         AND   #$00FF
         BNE   L50B4
         BRL   L3D28
L50B4    PEA   $006F
         PHK
         PER   L50BB+2
L50BB    BRL   L8D82
         BRL   L3D99
         LDY   #$00B4
         LDA   [$3C],Y
         INC
         INC
         LDY   #$00B4
         STA   [$3C],Y
         LDY   $28
         STY   $DA
         PER   L50D4+2
L50D4    BRL   L67DD
         BCC   L50DC
         BRL   L3D99
L50DC    STX   $12
         LDX   #$0002
         LDY   $DA
         STY   $28
         PER   L50E8+2
L50E8    BRL   L890F
         STX   $74
         LDA   #$4F54
         STA   $04
         STZ   $06
         PER   L50F7+2
L50F7    BRL   L459F
         BCC   L5109
         PEA   $006D
         PHK
         PER   L5103+2
L5103    BRL   L8D82
         BRL   L3D99
L5109    DEY
         DEY
         STY   $60
         DEY
         DEY
         LDA   [$28],Y
         STA   $5E
         LDX   $00
         PER   L5118+2
L5118    BRL   L8D95
         LDA   [$28],Y
         AND   #$FF00
         ORA   #$003D
         STA   [$28],Y
         STZ   $10
         PER   L5131
         PLX
         PER   L5136-1
         BRL   L457E
L5131    ASC   'STEP'00

L5136    BCS   L5143
         DEY
         DEY
         DEY
         DEY
         LDA   #$0000
         STA   [$28],Y
         STY   $10
L5143    LDA   $60
         DEC
         DEC
         CLC
         ADC   $28
         STA   $28
         PER   L515C
         PLA
         STA   $6C
         LDA   $10
         LDY   #$00BA
         STA   [$3C],Y
         BRL   L3DB0
L515C    LDA   $D2
         LDY   #$00B6
         STA   [$3C],Y
         LDY   $DA
         STY   $28
         LDY   #$00BA
         LDA   [$3C],Y
         BEQ   L5174
         TAY
         LDA   #$5453
         STA   [$28],Y
L5174    LDY   $60
         LDA   #$4F54
         STA   [$28],Y
         DEY
         DEY
         LDA   $5E
         STA   [$28],Y
         PER   L518B
         PLX
         PER   L518B+4
         BRL   L457E
L518B    ASC   'STEP'00
         BCS   L5196
         DEY
         DEY
         DEY
         DEY
L5196    PHY
         PHP
         LDX   #$0001
         PER   L519E+2
L519E    BRL   L8D95
         LDA   [$28],Y
         AND   #$FF00
         ORA   #$003D
         STA   [$28],Y
         PLP
         BCC   L51B4
         INY
         LDA   #$0031
         STA   [$28],Y
L51B4    PLA
         CLC
         ADC   $28
         STA   $28
         PER   L51C3
         PLA
         STA   $6C
         BRL   L3DB0
L51C3    LDA   $D2
         LDY   #$00B8
         STA   [$3C],Y
         LDY   $DA
         STY   $28
         LDY   $60
         LDA   $00
         STA   [$28],Y
         STY   $60
         PER   L51EC
         PLA
         STA   $6C
         BRL   L3DB0
L51DF    PEA   $0002
         PHK
         PER   L51E6+2
L51E6    BRL   L8D82
         BRL   L3D99
L51EC    LDX   #$0001
         PER   L51F2+2
L51F2    BRL   L676B
         LDX   #$0001
         TXA
         DEC
         PER   L51FD+2
L51FD    BRL   L6650
         BCS   L51DF
         PER   L5205+2
L5205    BRL   L66E3
         LDY   $DA
         STY   $28
         LDA   #$29D8
         CLC
         ADC   $3C
         STA   $48
         LDA   $00
         ADC   $3E
         STA   $4A
         LDY   $00
         SEP   #$20
L521E    LDA   [$28],Y
         BEQ   L51DF
         STA   [$48],Y
         INY
         CMP   #$3D
         BNE   L521E
         STY   $04
         LDX   $00
L522D    PHY
         TXY
         LDA   [$28],Y
         PLY
         CMP   #$3D
         BEQ   L523C
         STA   [$48],Y
         INY
         INX
         BRA   L522D
L523C    LDA   #$2B
         STA   [$48],Y
         INY
         REP   #$20
         PHY
         PER   L5247+2
L5247    BRL   L658A
         PLY
         LDX   $48
         STX   $28
         LDX   #$0001
         PER   L5255+2
L5255    BRL   L8D95
         LDA   $00
         STA   [$28],Y
         PER   L5265
         PLA
         STA   $6C
         BRL   L3DB6
L5265    PER   L5268+2
L5268    BRL   L66E3
         LDA   $DA
         STA   $28
         LDA   #$0003
         LDY   #$04F8
         STA   [$3C],Y
         LDA   #$8062
         LDY   #$04FA
         STA   [$3C],Y
         LDA   #$0001
         LDY   #$04FC
         STA   [$3C],Y
         LDY   $00
         SEP   #$20
L528B    INY
         LDA   [$28],Y
         CMP   #$3D
         BNE   L528B
         INY
         LDA   #$3C
         STA   [$28],Y
         INY
         REP   #$20
         LDX   $00
         PER   L529F+2
L529F    BRL   L8D95
         LDA   $00
         STA   [$28],Y
         PER   L52B8
         PLA
         STA   $6C
         PER   L52AF+2
L52AF    BRL   L3DCF
         LDA   #$0018
         BRL   L405B
L52B8    LDY   #$00BA
         LDA   [$3C],Y
         BEQ   L52D9
         LDX   #$0019
         PHK
         PER   L52CD
         PEA   $0009
         PEI   $EE
         PEI   $EC
L52CD    RTL

         LDY   #$00B8
         LDA   [$3C],Y
         STA   [$24]
         INC   $24
         INC   $24
L52D9    LDX   $00
         TXA
         INC
         PER   L52E0+2
L52E0    BRL   L6650
         BRL   L3D28
         BIT   $8D
         BVS   L534E
         LDA   #$4F47
         STA   $04
         LDA   #$4F54
         STA   $06
         STZ   $08
         PER   L52F9+2
L52F9    BRL   L459F
         BCC   L5356
         LDA   #$4854
         STA   $04
         LDA   #$4E45
         STA   $06
         PER   L530B+2
L530B    BRL   L459F
         BCS   L5325
L5310    LDA   [$28],Y
         AND   #$00FF
         BEQ   L531F
         INY
         CMP   #$0020
         BEQ   L5310
         BRA   L5356
L531F    DEY
         DEY
         DEY
         DEY
         STA   [$28],Y
L5325    LDA   #$0002
         TAX
         BIT   $8E
         BEQ   L5331
         TRB   $8E
         BRA   L5340
L5331    LDX   #$0002
         PER   L5337+2
L5337    BRL   L676B
         PER   L533D+2
L533D    BRL   L673D
L5340    LDA   #$FFFF
         STA   $64
         LDA   #$0041
         TRB   $8E
         LSR
         ASL
         TSB   $8E
L534E    STZ   $CA
         LDA   #$0018
         BRL   L405B
L5356    LDA   $62
         LDY   #$108C
         STA   [$3C],Y
         LDA   #$4649
L5360    STA   $64
         DEC   $28
         DEC   $28
         LDA   $00
         STA   [$28]
         LDA   #$0041
         TRB   $8E
         LSR
         ASL
         TSB   $8E
L5373    INC   $28
         INC   $28
         LDA   $00
         DEC
         DEC
         STA   $C4
         LSR
         STA   $0C
         LDA   #$4649
         STA   $04
         STZ   $06
         PER   L538A+2
L538A    BRL   L459F
         BCS   L5397
         INY
         INY
         STY   $0C
         LDA   $04
         STA   $C4
L5397    STZ   $08
         LDA   $64
         CMP   #$4649
         BNE   L53BC
         LDA   #$4F47
         STA   $04
         LDA   #$4F54
         STA   $06
         PER   L53AD+2
L53AD    BRL   L459F
         BCS   L53BC
         CPY   $0C
         BPL   L53BC
         STY   $0C
         LDA   $04
         STA   $C4
L53BC    LDA   #$4C45
         STA   $04
         LDA   #$4553
         STA   $06
         PER   L53C9+2
L53C9    BRL   L459F
         BCS   L53D8
         CPY   $0C
         BPL   L53D8
         STY   $0C
         LDA   $04
         STA   $C4
L53D8    LDA   #$4649
         STA   $08
         STZ   $0A
         PER   L53E2+2
L53E2    BRL   L459F
         BCS   L53F3
         DEY
         DEY
         CPY   $0C
         BPL   L53F3
         STY   $0C
         LDA   $04
         STA   $C4
L53F3    LDA   #$4854
         STA   $04
         LDA   #$4E45
         STA   $06
         STZ   $08
         PER   L5402+2
L5402    BRL   L459F
         BCS   L541C
         CPY   $0C
         BPL   L541C
         STY   $0C
         TYX
         DEY
         DEY
         LDA   #$2020
         STA   $C4
         STA   [$28],Y
         DEY
         DEY
         STA   [$28],Y
         TXY
L541C    LDX   $C4
         BMI   L5447
         LDA   $0C
         SEC
         SBC   #$0004
         TAY
         CLC
         ADC   $28
         STA   $5C
         LDA   $2A
         STA   $5E
         LDA   [$28],Y
         STX   $02
         CMP   $02
         BEQ   L5442
         PEA   $0045
         PHK
         PER   L543F+2
L543F    BRL   L8D82
L5442    LDA   #$0000
         STA   [$28],Y
L5447    DEC   $28
         DEC   $28
         LDA   $64
         STA   [$28]
         STA   $C4
         STX   $64
L5453    LDA   [$28]
         AND   #$00FF
         BEQ   L5466
         CMP   #$0020
         BEQ   L5462
         BRL   L3DB0
L5462    INC   $28
         BRA   L5453
L5466    LDA   $64
         BMI   L549E
         LDA   $5C
         STA   $28
         LDA   $5E
         STA   $2A
         LDA   $C4
         CMP   #$4649
         BNE   L549B
         LDA   #$0002
         BIT   $8E
         BEQ   L5484
         TRB   $8E
         BRA   L5491
L5484    TAX
         PER   L5488+2
L5488    BRL   L676B
         PER   L548E+2
L548E    BRL   L673D
L5491    LDX   $00
         TXA
         INC
         PER   L5498+2
L5498    BRL   L6650
L549B    BRL   L5373
L549E    INC
         BNE   L54AD
         LDX   $00
         TXA
         INC
         PER   L54A8+2
L54A8    BRL   L6650
         BRA   L54EE
L54AD    BIT   $A6
         BVC   L54C7
         PHK
         PER   L54B5+2
L54B5    BRL   L6C35
         LDA   $B0
         STA   $C2
         BCC   L54C1
         BRL   L6A0A
L54C1    LDA   #$2020
         BRL   L5360
L54C7    INC
         BNE   L54EE
         LDA   $62
         SEC
         LDY   #$108C
         SBC   [$3C],Y
L54D2    DEC
         BMI   L54EE
         PHA
         PER   L54D9+2
L54D9    BRL   L66E3
         PER   L54DF+2
L54DF    BRL   L6749
         LDX   #$0002
         PER   L54E8+2
L54E8    BRL   L678F
         PLA
         BRA   L54D2
L54EE    STZ   $64
         LDA   #$0041
         TRB   $8E
         BRL   L3D28
         LDX   #$0000
         PER   L54FE+2
L54FE    BRL   L676B
         PER   L5504+2
L5504    BRL   L66E3
         PER   L5515
         PLA
         STA   $6C
         STZ   $CA
         LDA   #$0018
         BRL   L405B
L5515    LDX   $00
         TXA
         INC
         PER   L551C+2
L551C    BRL   L6650
         BRL   L3D28
         SEP   #$20
         LDX   $00
         TXY
L5527    LDA   [$28],Y
         BEQ   L5533
         INY
         CMP   #$2C
         BNE   L5527
         INX
         BRA   L5527
L5533    REP   #$20
         PHX
         LDX   #$FFFE
         LDA   $00
         PER   L553E+2
L553E    BRL   L6650
         BCS   L5559
         PER   L5546+2
L5546    BRL   L66E3
         LDX   #$0001
         PER   L554F+2
L554F    BRL   L678F
         PLX
         DEX
         BPL   L5533
         BRL   L3D28
L5559    PEA   $004B
         PHK
         PER   L5560+2
L5560    BRL   L8D82
         BRL   L3D99
         LDX   #$FFFF
         LDA   $00
         PER   L556E+2
L556E    BRL   L6650
         BCS   L5585
         PER   L5576+2
L5576    BRL   L66E3
         LDX   #$0000
         PER   L557F+2
L557F    BRL   L678F
         BRL   L3D28
L5585    PEA   $004A
         PHK
         PER   L558C+2
L558C    BRL   L8D82
         BRL   L3D99
         PER   L5595+2
L5595    BRL   L67DD
         BCC   L559D
         BRL   L3D99
L559D    LDY   #$000D
         BRA   L55C3
         PER   L55A5+2
L55A5    BRL   L67DD
         BCC   L55AD
         BRL   L3D99
L55AD    LDA   [$38]
         TAX
L55B0    LDY   #$000C
         LDA   [$28]
         AND   #$00FF
         BEQ   L55C3
         CMP   #$0020
         BNE   L55C6
         INC   $28
         BRA   L55B0
L55C3    TXA
         BNE   L55D3
L55C6    PEA   $0002
         PHK
         PER   L55CD+2
L55CD    BRL   L8D82
         BRL   L3D99
L55D3    PHY
         STZ   $04
         PHK
         PER   L55E1
         PEA   $0006
         PEI   $EE
         PEI   $EC
L55E1    RTL

         PLX
         PHK
         PER   L55EE
         PEA   $0009
         PEI   $EE
         PEI   $EC
L55EE    RTL

         TYA
         STA   [$24]
         INC   $24
         INC   $24
         BIT   $8D
         BVC   L5603
         LDA   $64
         INC
         INC
         BNE   L5603
         INC
         TSB   $8E
L5603    BRL   L3D28
         LDY   $28
         STY   $CE
         LDY   #$04FA
         LDA   [$3C],Y
         STA   $D0
         PER   L5614+2
L5614    BRL   L67DD
         BCC   L561C
         BRL   L3D99
L561C    TXY
         BNE   L5622
         BRL   L56FD
L5622    PHK
         PER   L562D
         PEA   $0018
         PEI   $EE
         PEI   $EC
L562D    RTL

         BCC   L5633
         BRL   L56FD
L5633    STX   $10
         CPX   #$0019
         BNE   L563D
         BRL   L5809
L563D    LDA   [$28]
         AND   #$00FF
         CMP   #$0020
         BEQ   L564A
         BRL   L56FD
L564A    CPX   #$0014
         BMI   L5654
         CPX   #$0019
         BMI   L566C
L5654    LDY   $CE
         INY
         STY   $28
         PER   L565C+2
L565C    BRL   L658A
         PEA   $0078
         PHK
         PER   L5666+2
L5666    BRL   L8D82
         BRL   L3D99
L566C    LDY   $28
         STY   $CE
         PER   L5673+2
L5673    BRL   L658A
         PER   L5679+2
L5679    BRL   L67DD
         BCC   L5681
         BRL   L3D99
L5681    PHK
         PER   L568C
         PEA   $0018
         PEI   $EE
         PEI   $EC
L568C    RTL

         BCS   L5654
         TXA
         SEC
         SBC   #$000C
         STA   $12
         BEQ   L56A4
         DEC
         BNE   L5654
         LDA   $10
         CMP   #$0016
         BNE   L5654
         BRA   L56AB
L56A4    LDA   $10
         CMP   #$0016
         BEQ   L5654
L56AB    LDY   $28
         STY   $CE
         PER   L56B2+2
L56B2    BRL   L67DD
         BCC   L56BA
         BRL   L3D99
L56BA    LDY   #$04FA
         LDA   [$3C],Y
         LDY   $00
         CMP   #$0030
         BEQ   L56D8
         STZ   $04
         DEC   $04
         DEC   $04
         PHK
         PER   L56D7
         PEA   $0006
         PEI   $EE
         PEI   $EC
L56D7    RTL

L56D8    LDX   #$0011
         PHK
         PER   L56E6
         PEA   $0009
         PEI   $EE
         PEI   $EC
L56E6    RTL

         LDA   $10
         ASL
         LSR   $12
         ROR
         STA   [$24]
         INC   $24
         INC   $24
         TYA
         STA   [$24]
         INC   $24
         INC   $24
         BRL   L3D28
L56FD    LDY   $CE
         STY   $28
         PER   L5704+2
L5704    BRL   L658A
         LDA   #$4F47
         STA   $04
         LDA   #$4F54
         STA   $06
         STZ   $08
         STZ   $D2
         PER   L5718+2
L5718    BRL   L459F
         TYX
         BCC   L5738
         LDA   #$5553
         STA   $06
         LDA   #$0042
         STA   $08
         PER   L572B+2
L572B    BRL   L459F
         BCC   L5733
         BRL   L5654
L5733    TYX
         DEY
         SEC
         ROR   $D2
L5738    DEY
         DEY
         DEY
         DEY
         LDA   $00
         STA   [$28],Y
         TXA
         CLC
         ADC   $CE
         STA   $D4
         PER   L5773
         STZ   $CA
L574B    PER   L574E+2
L574E    BRL   L658A
         PLA
         STA   $6C
         LDA   #$0003
         LDY   #$04F8
         STA   [$3C],Y
         LDA   $D0
         LDY   #$04FA
         STA   [$3C],Y
         LDA   #$0001
         LDY   #$04FC
         STA   [$3C],Y
         LDA   $CA
         ORA   #$0018
         BRL   L405B
L5773    LDY   $D4
         STY   $28
         LDY   $00
         LDX   $00
         SEP   #$20
         LDA   [$28],Y
         BEQ   L578D
L5781    LDA   [$28],Y
         BEQ   L579C
         INY
         CMP   #$2C
         BNE   L5781
         INX
         BRA   L5781
L578D    REP   #$20
         PEA   $0070
         PHK
         PER   L5796+2
L5796    BRL   L8D82
         BRL   L3D99
L579C    REP   #$20
         INX
         STX   $10
         PER   L57A4+2
L57A4    BRL   L658A
         LDX   #$0012
         PHK
         PER   L57B5
         PEA   $0009
         PEI   $EE
         PEI   $EC
L57B5    RTL

         LDA   $10
         ORA   $D2
         STA   [$24]
         INC   $24
         INC   $24
L57C0    PER   L57C3+2
L57C3    BRL   L67DD
         BCC   L57CB
         BRL   L3D99
L57CB    LDA   [$38]
         BEQ   L578D
         STZ   $04
         PHK
         PER   L57DC
         PEA   $0006
         PEI   $EE
         PEI   $EC
L57DC    RTL

         TYA
         STA   [$24]
         INC   $24
         INC   $24
         DEC   $10
         BEQ   L5806
L57E8    LDA   [$28]
         AND   #$00FF
         INC   $28
         CMP   #$0020
         BEQ   L57E8
         CMP   #$002C
         BEQ   L57C0
         PEA   $0002
         PHK
         PER   L5800+2
L5800    BRL   L8D82
         BRL   L3D99
L5806    BRL   L3D28
L5809    PER   L580C+1
L580C    BRA   L583F
         BCC   L5813
         BRL   L3D99
L5813    TYA
         BNE   L5823
         PEA   $0002
         PHK
         PER   L581D+2
L581D    BRL   L8D82
         BRL   L3D99
L5823    INC
         CLC
         ADC   $28
         STA   $D4
         PER   L5833
         STZ   $CA
         INC   $CA
         BRL   L574B
L5833    LDY   $D4
         STY   $28
         LDA   #$0019
         STA   $10
         BRL   L566C
L583F    PHP
         SEP   #$20
         LDX   $00
         TXY
L5845    LDA   [$28]
         BEQ   L5889
         CMP   #$28
         BEQ   L586C
         CMP   #$20
         BNE   L5859
         INC   $28
         BNE   L5845
         INC   $29
         BRA   L5845
L5859    PER   L585C+2
L585C    BRL   L658A
         PEA   $0002
         PHK
         PER   L5866+2
L5866    BRL   L8D82
         PLP
         SEC
         RTS

L586C    LDA   #$20
         STA   [$28]
         TXY
L5871    LDA   [$28],Y
         BEQ   L5859
         INY
         CMP   #$28
         BNE   L587D
         INX
         BRA   L5871
L587D    CMP   #$29
         BNE   L5871
         DEX
         BPL   L5871
         DEY
         LDA   #$00
         STA   [$28],Y
L5889    PLP
         CLC
         RTS

         MX    %00
         PER   L588F+2
L588F    BRL   L467E
         AND   #$00FF
         BNE   L589A
         BRL   L59BC
L589A    PER   L58A4
         PLX
         PER   L58A4+3
         BRL   L457E
L58A4    ASC   'SUB'00
         BCC   L58D4
         PER   L58B4
         PLX
         PER   L58B4+2
         BRL   L457E
L58B4    EOR   #$0046
         BCS   L58C8
         TYA
         CLC
         ADC   $28
         STA   $28
         PER   L58C2+2
L58C2    BRL   L658A
         BRL   L5095
L58C8    PEA   $0002
         PHK
         PER   L58CF+2
L58CF    BRL   L8D82
         BRA   L58EE
L58D4    BIT   $20
         BMI   L58C8
         LDA   #$2000
         BIT   $68
         BNE   L58EB
         PEA   $0028
         PHK
         PER   L58E6+2
L58E6    BRL   L8D82
         BRA   L58EE
L58EB    BRL   L3D45
L58EE    PER   L58F1+2
L58F1    BRL   L6B82
         LDA   #$2000
         TRB   $68
         BRL   L3D99
         LDX   #$0015
         STZ   $08
L5901    PHK
         PER   L590C
         PEA   $0009
         PEI   $EE
         PEI   $EC
L590C    RTL

         LDY   $08
         BNE   L5944
         PER   L5914+2
L5914    BRL   L467E
         TAY
         BEQ   L5944
         PER   L591D+2
L591D    BRL   L67DD
         BCC   L5925
         BRL   L3D99
L5925    LDA   [$38]
         BEQ   L594E
         LDY   #$0002
         LDA   [$38],Y
         LDY   $00
         SEC
         SBC   #$0030
         BEQ   L5944
         STZ   $04
         PHK
         PER   L5943
         PEA   $0006
         PEI   $EE
         PEI   $EC
L5943    RTL

L5944    TYA
         STA   [$24]
         INC   $24
         INC   $24
         BRL   L3D28
L594E    PEA   $0002
         PHK
         PER   L5955+2
L5955    BRL   L8D82
         BRL   L3D99
L595B    LDA   #$001C
         BRL   L405B
         LDA   #$2000
         AND   $68
         BNE   L5975
         PEA   $002C
         PHK
         PER   L596F+2
L596F    BRL   L8D82
         BRL   L3D99
L5975    PER   L597F
         PLX
         PER   L597F+3
         BRL   L457E
L597F    ASC   'SUB'00
         BCS   L599B
         BIT   $20
         BMI   L599B
         LDX   #$0014
         PHK
         PER   L5997
         PEA   $0009
         PEI   $EE
         PEI   $EC
L5997    RTL

         BRL   L3D28
L599B    PEA   $0078
         PHK
         PER   L59A2+2
L59A2    BRL   L8D82
         BRL   L3D99
         STZ   $08
         LDX   #$0016
         BRL   L5901
         LDA   #$001F
         BRL   L405B
         LDA   #$001D
         BRL   L405B
L59BC    LDA   [$28]
         AND   #$00FF
         BEQ   L59D0
         PEA   $0002
         PHK
         PER   L59CA+2
L59CA    BRL   L8D82
         BRL   L3D99
L59D0    LDA   #$000C
         BRL   L405B
L59D6    PER   L59D9+2
L59D9    BRL   L4525
         INC   $28
         PER   L59E1+2
L59E1    BRL   L467E
         LDA   #$8162
         LDY   #$04FA
         STA   [$3C],Y
         LDA   $00
         LDY   #$04FC
         STA   [$3C],Y
         INC
         INC
         LDY   #$04F8
         STA   [$3C],Y
         LDY   $00
         PER   L59FF+2
L59FF    BRL   L4693
         CMP   #$0023
         BNE   L5A1B
         LDA   [$28],Y
         CLC
         ADC   #$FFFD
         STA   [$28],Y
         LDY   #$04FB
         LDA   [$3C],Y
         INC
         INC
         LDY   #$04FB
         STA   [$3C],Y
L5A1B    PER   L5A25
         PLX
         PER   L5A25+5
         BRL   L457E
L5A25    ASC   'USING'00
         BCS   L5A91
         PHY
         LDY   #$04FA
         LDA   [$3C],Y
         PLY
         CMP   #$8162
         BNE   L5A3F
L5A39    BIT   $20
         BMI   L5A84
         BRA   L5A4E
L5A3F    CMP   #$8262
         BEQ   L5A39
         LDA   $21
         AND   #$00FF
         CMP   #$00FF
         BNE   L5A84
L5A4E    LDA   #$003B
         PER   L5A54+2
L5A54    BRL   L46A1
         BCC   L5A8B
         SEP   #$20
         PER   L5A5E+2
L5A5E    BRL   L45F8
         BCS   L5A69
         PER   L5A66+2
L5A66    BRL   L4635
L5A69    REP   #$20
         TYA
L5A6C    CLC
         ADC   $28
         STA   $28
         PER   L5A74+2
L5A74    BRL   L658A
         PEA   $0002
         PHK
         PER   L5A7E+2
L5A7E    BRL   L8D82
         BRL   L3D99
L5A84    TYA
         SEC
         SBC   #$0005
         BRA   L5A6C
L5A8B    LDA   #$000D
         BRL   L405B
L5A91    LDY   #$0000
         SEP   #$20
         TYX
         DEX
         BRA   L5AF2
L5A9A    LDA   [$28],Y
         BNE   L5AA1
         BRL   L5B2B
L5AA1    INY
         CMP   #$20
         BNE   L5AA9
         INX
         BRA   L5A9A
L5AA9    XBA
         LDA   $00
         XBA
         BMI   L5AC1
         PHY
         TAY
         LDA   [$94],Y
         BPL   L5ABF
         TYA
         PLY
         CMP   #$28
         BEQ   L5B0F
         LDX   $00
         BRA   L5AF2
L5ABF    TYA
         PLY
L5AC1    PHX
         PLX
         BEQ   L5AEC
         PER   L5AC8+2
L5AC8    BRL   L5B8C
         BCS   L5AE1
L5ACD    LDA   [$28],Y
         INY
         CMP   #$20
         BEQ   L5ACD
         PER   L5AD7+2
L5AD7    BRL   L5B8C
         BCC   L5ACD
         DEY
         LDX   $00
         BRA   L5A9A
L5AE1    DEY
         DEY
         LDA   #$3B
         STA   [$28],Y
         LDX   $00
         INY
         BRA   L5A9A
L5AEC    CMP   #$28
         BEQ   L5B0F
         BRA   L5A9A
L5AF2    LDA   [$28],Y
         BEQ   L5B2B
         INY
         CMP   #$28
         BEQ   L5B0F
         CMP   #$20
         BEQ   L5AF2
         INX
         BNE   L5B0A
         PER   L5B05+2
L5B05    BRL   L5B8C
         BCC   L5ACD
L5B0A    DEY
         LDX   $00
         BRA   L5A9A
L5B0F    STZ   $CE
L5B11    LDA   [$28],Y
         BEQ   L5B2B
         INY
         CMP   #$29
         BNE   L5B23
         DEC   $CE
         BPL   L5B11
         LDX   $00
         BRL   L5A9A
L5B23    CMP   #$28
         BNE   L5B11
         INC   $CE
         BRA   L5B11
L5B2B    REP   #$20
         LDY   $28
         STY   $CE
         LDY   $2A
         STY   $D0
         LDA   #$4154
         STA   $04
         LDA   #$0042
         STA   $06
         LDA   #$0002
         STA   $1E
L5B44    PER   L5B47+2
L5B47    BRL   L459F
         BCS   L5B5C
         TYA
         CLC
         ADC   $28
         STA   $28
         STZ   $08
         PER   L5B57+2
L5B57    BRL   L65EF
         BRA   L5B44
L5B5C    LDY   $CE
         STY   $28
         LDY   $D0
         STY   $2A
         DEC   $1E
         BMI   L5B84
         BEQ   L5B78
         LDA   #$5450
         STA   $04
         LDA   #$4241
         STA   $06
         STZ   $08
         BRA   L5B44
L5B78    LDA   #$5053
         STA   $04
         LDA   #$0043
         STA   $06
         BRA   L5B44
L5B84    LDA   #$0040
         TSB   $8D
         BRL   L40A0
L5B8C    PHP
         PHY
         DEY
         REP   #$20
         LDA   [$28],Y
         PHK
         PLB
         LDY   #$0000
         PER   L8B47
L5B9B    CMP   ($01,S),Y
         BEQ   L5BAD
         INY
         INY
         INY
         INY
         CPY   #$001C
         BCC   L5B9B
         PLY
L5BA9    PLY
         PLP
         SEC
         RTS

L5BAD    INY
         INY
         SEP   #$20
         LDA   ($01,S),Y
         BNE   L5BC7
         PLY
         PLY
         PHY
L5BB8    INY
         LDA   [$28],Y
         CMP   #$41
         BCC   L5BC3
         CMP   #$5B
         BCC   L5BA9
L5BC3    PLX
         PLP
         CLC
         RTS

         MX    %00
L5BC7    PLY
         PLY
         PHY
         INY
         CMP   [$28],Y
         BNE   L5BA9
         BRA   L5BB8
L5BD1    LDY   #$0002
         LDA   [$38],Y
         STA   $20
         PER   L5BDB+2
L5BDB    BRL   L67DD
         BCC   L5BE3
         BRL   L3D99
L5BE3    LDA   [$28]
         AND   #$00FF
         BNE   L5BF8
         PHK
         PER   L5BF5
         PEA   $0018
         PEI   $EE
         PEI   $EC
L5BF5    RTL

         BCC   L5C05
L5BF8    PEA   $0078
         PHK
         PER   L5BFF+2
L5BFF    BRL   L8D82
         BRL   L3D99
L5C05    STA   $22
         DEC
         BEQ   L5C10
         DEC
         BEQ   L5C10
         DEC
         BNE   L5BF8
L5C10    LDX   #$0005
         PHK
         PER   L5C1E
         PEA   $0009
         PEI   $EE
         PEI   $EC
L5C1E    RTL

         LDA   #$0C81
         STA   [$24]
         INC   $24
         INC   $24
         LDA   $20
         STA   [$24]
         INC   $24
         INC   $24
         LDA   $22
         XBA
         ORA   #$8064
         STA   [$24]
         INC   $24
         INC   $24
         LDA   $00
         STA   [$24]
         INC   $24
         BRL   L3D28
         BRL   L40A0
         PER   L5C4B+2
L5C4B    BRL   L4F6E
         SEP   #$20
L5C50    LDA   [$28]
         BEQ   L5C68
         CMP   #$2C
         BEQ   L5C64
         CMP   #$20
         BNE   L5C68
         INC   $28
         BNE   L5C50
         INC   $29
         BRA   L5C50
L5C64    LDA   #$20
         STA   [$28]
L5C68    REP   #$20
         BRL   L40A0
         LDY   $00
L5C6F    PER   L5C72+2
L5C72    BRL   L4693
         CMP   #$0023
         BNE   L5C82
         LDA   [$28],Y
         SEC
         SBC   #$0003
         STA   [$28],Y
L5C82    PER   L5C85+2
L5C85    BRL   L46A6
         INY
         BCC   L5C6F
         LDA   #$000D
         BRL   L405B
         LDY   #$04FA
         LDA   [$3C],Y
         CMP   #$9F62
         BEQ   L5CBD
         LDY   $00
         PER   L5CA0+2
L5CA0    BRL   L4693
         CMP   #$0023
         BNE   L5CC9
         LDA   [$28],Y
         AND   #$FF00
         ORA   #$0020
         STA   [$28],Y
         LDY   #$04FB
         LDA   [$3C],Y
         INC
         LDY   #$04FB
         STA   [$3C],Y
L5CBD    LDY   $00
         PER   L5CC2+2
L5CC2    BRL   L46A6
         BCS   L5D01
         BRA   L5CF8
L5CC9    CMP   #$0071
         BNE   L5CE2
         INY
         INY
         PER   L5CD3+2
L5CD3    BRL   L4693
         CMP   #$002C
         BEQ   L5CF5
         CMP   #$003B
         BEQ   L5CF5
         BRA   L5D01
L5CE2    CMP   #$003B
         BNE   L5D10
         INY
         PER   L5CEB+2
L5CEB    BRL   L4693
         CMP   #$0071
         BEQ   L5CC9
         BRA   L5D10
L5CF5    INY
         BRA   L5D10
L5CF8    INY
         PER   L5CFC+2
L5CFC    BRL   L46D6
         BVC   L5D0E
L5D01    PEA   $0080
         PHK
         PER   L5D08+2
L5D08    BRL   L8D82
         BRL   L3D99
L5D0E    BCC   L5D1D
L5D10    PER   L5D13+2
L5D13    BRL   L46A6
         BCC   L5CF8
         LDX   #$000D
         BRA   L5D4A
L5D1D    PHY
         LDY   #$04FA
         LDA   [$3C],Y
         LDX   #$000F
         PLY
         CMP   #$9E62
         BEQ   L5D2F
         LDX   #$000D
L5D2F    PER   L5D63
         PLA
         STA   $6C
         DEY
         LDA   [$28],Y
         AND   #$FF00
         STA   [$28],Y
         STY   $D4
         LDA   $28
         STA   $D2
         LDY   #$04FA
         LDA   [$3C],Y
         STA   $CE
L5D4A    PHX
         PER   L5D4E+2
L5D4E    BRL   L3DCF
         PER   L5D54+2
L5D54    BRL   L658A
         PLX
         LDA   #$0040
         TSB   $8F
         TSB   $93
         TXA
         BRL   L405B
L5D63    LDA   #$0003
         LDY   #$04F8
         STA   [$3C],Y
         LDA   $CE
         LDY   #$04FA
         STA   [$3C],Y
         LDA   #$0020
         LDY   #$04FC
         STA   [$3C],Y
         LDY   $D2
         STY   $28
         LDY   $D4
         ORA   [$28],Y
         STA   [$28],Y
         TYA
         CLC
         ADC   $28
         STA   $28
         LDY   $00
L5D8C    PER   L5D8F+2
L5D8F    BRL   L46A6
         LDX   #$000F
         BCS   L5D4A
         INY
         PER   L5D9B+2
L5D9B    BRL   L46D6
         BVC   L5DA3
         BRL   L5D01
L5DA3    BCS   L5D8C
         PHY
         LDY   #$04FA
         LDA   [$3C],Y
         LDX   #$000D
         PLY
         CMP   #$9E62
         BNE   L5DB7
         BRL   L5D2F
L5DB7    LDX   #$000F
         BRL   L5D2F
         PER   L5DC0+2
L5DC0    BRL   L467E
         CMP   #$003D
         BNE   L5DD5
         EOR   [$28]
         ORA   #$0020
         STA   [$28]
         LDA   #$001F
         BRL   L405B
L5DD5    PEA   $0002
         PHK
         PER   L5DDC+2
L5DDC    BRL   L8D82
         BRL   L3D99
         PER   L5DEC
         PLX
         PER   L5DEC+5
         BRL   L465D
L5DEC    ASC   'FIELD'00
         BCC   L5DF7
         BRL   L599B
L5DF7    BIT   $20
         BMI   L5DFE
         BRL   L40A0
L5DFE    BRL   L599B
         LDA   #$0040
         TSB   $92
         LDA   #$000D
         BRL   L405B
         LDY   $00
         PER   L5E11+2
L5E11    BRL   L46A6
         BCS   L5E49
         PHY
         PER   L5E1A+2
L5E1A    BRL   L4693
         CMP   #$0052
         BEQ   L5E3B
L5E22    PLA
         CLC
         ADC   $28
         STA   $28
         PER   L5E2B+2
L5E2B    BRL   L658A
         PEA   $0002
         PHK
         PER   L5E35+2
L5E35    BRL   L8D82
         BRL   L3D99
L5E3B    INY
         LDA   [$28],Y
         AND   #$00FF
         BNE   L5E22
         PLY
         INY
         LDA   $00
         STA   [$28],Y
L5E49    LDA   #$000D
         BRL   L405B
         PER   L5E52+2
L5E52    BRL   L467E
         BRL   L3F72
L5E58    LDY   $00
         PER   L5E5D+2
L5E5D    BRL   L4693
         CMP   #$0023
         BNE   L5E6D
         LDA   [$28],Y
         SEC
         SBC   #$0003
         STA   [$28],Y
L5E6D    LDA   #$000D
         BRL   L405B
         PER   L5E76+2
L5E76    BRL   L652C
         BCS   L5E58
         STZ   $1C
L5E7D    LDY   $00
         PER   L5E82+2
L5E82    BRL   L46A6
         BCS   L5E92
         LDA   [$28],Y
         CLC
         ADC   #$0052
         STA   [$28],Y
         BRL   L40B0
L5E92    REP   #$20
         PEA   $0002
         PHK
         PER   L5E9B+2
L5E9B    BRL   L8D82
         BRL   L3D99
         PER   L5EA4+2
L5EA4    BRL   L652C
         BCS   L5E58
         LDY   $00
         PER   L5EAE+2
L5EAE    BRL   L46A6
         BCS   L5E92
         INY
         PER   L5EB7+2
L5EB7    BRL   L46A6
         BCS   L5E7D
         STZ   $0C
         LDY   $00
         PER   L5ECA
         PLX
         PER   L5ECA+4
         BRL   L465D
L5ECA    ASC   'PSET'00
         BCC   L5F2A
         INC   $0C
         LDY   $00
         PER   L5EDF
         PLX
         PER   L5EDF+6
         BRL   L465D
L5EDF    ASC   'PRESET'00
         BCC   L5F2A
         ASL   $0C
         LDY   $00
         PER   L5EF6
         PLX
         PER   L5EF6+3
         BRL   L465D
L5EF6    ASC   'AND'00
         BCC   L5F2A
         ASL   $0C
         INC   $0C
         LDY   $00
         PER   L5F0C
         PLX
         PER   L5F0C+3
         BRL   L465D
L5F0C    ASC   'XOR'00
         BCC   L5F2A
         INC   $0C
         INC   $0C
         LDY   $00
         PER   L5F22
         PLX
         PER   L5F22+2
         BRL   L465D
L5F22    ASC   'OR'00
         BCC   L5F2A
         BRL   L5E92
L5F2A    LDA   $0C
         XBA
         ORA   #$8064
         DEY
         DEY
         STA   [$28],Y
         BRL   L5E7D
         PER   L5F41
         PLX
         PER   L5F41+2
         BRL   L457E
L5F41    ASC   'AS'00
         BCS   L5F7B
         PHY
         LDY   $00
         PER   L5F53
         PLX
         PER   L5F53+5
         BRL   L457E
L5F53    ASC   'INPUT'00
         BCS   L5F63
         DEY
         LDA   [$28],Y
         ORA   #$0020
         STA   [$28],Y
L5F63    PLY
L5F64    PER   L5F67+2
L5F67    BRL   L4693
         CMP   #$0023
         BNE   L5F86
         LDA   [$28],Y
         AND   #$FF00
         ORA   #$0020
         STA   [$28],Y
         BRA   L5F86
L5F7B    LDY   $00
         PER   L5F80+2
L5F80    BRL   L46A6
         INY
         BCC   L5F64
L5F86    PER   L5F90
         PLX
         PER   L5F93
         BRL   L457E
L5F90    JMP   $4E45

L5F93    DB    $00
         BCS   L5FB2
         TYX
         DEY
         DEY
         LDA   #$4E65     ; eN
         STA   [$28],Y
         TXY
         PER   L5FA2+2
L5FA2    BRL   L4693
         CMP   #$003D
         BNE   L5FB8
         LDA   [$28],Y
         CLC
         ADC   #$FFE3
         STA   [$28],Y
L5FB2    LDA   #$000D
         BRL   L405B
L5FB8    PEA   $0002
         PHK
         PER   L5FBF+2
L5FBF    BRL   L8D82
         BRL   L3D99
         LDY   $00
         SEP   #$20
L5FC9    INY
         LDA   [$28],Y
         BEQ   L5FC9
         CMP   #$3D
         BNE   L5FC9
         LDA   #$3B
         STA   [$28],Y
         REP   #$20
         BRL   L40B0
         LDY   $00
         PER   L5FE0+2
L5FE0    BRL   L4693
         CMP   #$002D
         BNE   L5FFB
         PER   L5FEB+2
L5FEB    BRL   L6097
         PER   L5FF1+2
L5FF1    BRL   L652C
         BCC   L5FF9
         BRL   L608A
L5FF9    BRA   L6003
L5FFB    PER   L5FFE+2
L5FFE    BRL   L652C
         BCS   L605C
L6003    LDY   $00
         PER   L6008+2
L6008    BRL   L46A6
         BCS   L6059
         INY
         PER   L6011+2
L6011    BRL   L46A6
         BCS   L6059
         INY
         PER   L601A+2
L601A    BRL   L4693
         CMP   #$0042
         BEQ   L6036
         PER   L6025+2
L6025    BRL   L46A6
         BCS   L6059
         INY
         PER   L602E+2
L602E    BRL   L4693
         CMP   #$0042
         BNE   L608A
L6036    STY   $14
         INY
         PER   L603C+2
L603C    BRL   L4693
         LDX   #$6480
         INX
         CMP   #$0046
         BEQ   L604C
         DEX
         TAY
         BNE   L608A
L604C    LDY   $14
         TXA
         XBA
         STA   [$28],Y
         XBA
         AND   #$00FF
         INY
         STA   [$28],Y
L6059    BRL   L40A0
L605C    PER   L6066
         PLX
         PER   L6066+6
         BRL   L465D
L6066    ASC   'INPUT#'00
         BCS   L6078
         LDA   #$2023     ; '# '
         DEY
         DEY
         STA   [$28],Y
         BRA   L60A2
L6078    PER   L6082
         PLX
         PER   L6082+5
         BRL   L465D
L6082    ASC   'INPUT'00
         BCC   L60A2
L608A    PEA   $0002
         PHK
         PER   L6091+2
L6091    BRL   L8D82
         BRL   L3D99
L6097    LDA   [$28],Y
         AND   #$FF00
         ORA   #$0020
         STA   [$28],Y
         RTS

L60A2    LDY   #$04FB
         LDA   [$3C],Y
         INC
         LDY   #$04FB
         STA   [$3C],Y
         LDY   $00
         PER   L60B2+2
L60B2    BRL   L4693
         CMP   #$0023
         BNE   L60CF
         LDA   [$28],Y
         AND   #$FF00
         ORA   #$0020
         STA   [$28],Y
         LDY   #$04FB
         LDA   [$3C],Y
         INC
         LDY   #$04FB
         STA   [$3C],Y
L60CF    BRL   L40B0
         PER   L60DC
         PLX
         PER   L60DC+2
         BRL   L457E
L60DC    ASC   'ON'00
         BCS   L60E4
         BRL   L5BD1
L60E4    PER   L60EE
         PLX
         PER   L60EE+3
         BRL   L457E
L60EE    ASC   'OFF'00
         BCS   L60F7
         BRL   L5BD1
L60F7    PER   L6101
         PLX
         PER   L6101+4
         BRL   L457E
L6101    ASC   'STOP'00
         BCS   L610B
         BRL   L5BD1
L610B    LDA   #$000D
         BRL   L405B
         PER   L6114+2
L6114    BRL   L467E
         LDY   $28
         STY   $CE
         STZ   $08
         DEC   $08
         PER   L6122+2
L6122    BRL   L65EF
         BCC   L612A
         BRL   L3D99
L612A    INC   $28
         PER   L612F+2
L612F    BRL   L467E
         CMP   #$003D
         BNE   L614C
         SEP   #$20
         LDA   #$3B
         STA   [$28]
         REP   #$20
         LDY   $CE
         STY   $28
         PER   L6146+2
L6146    BRL   L658A
         BRL   L40B0
L614C    PEA   $0002
         PHK
         PER   L6153+2
L6153    BRL   L8D82
         BRL   L3D99
L6159    LDA   #$000D
         BRL   L405B
         LDY   $00
         BRL   L5D10
         PER   L616E
         PLX
         PER   L616E+4
         BRL   L457E
L616E    ASC   'NEXT'00
         LDY   $00
         BCS   L617A
         DEY
         BRA   L61B5
L617A    STY   $10
L617C    LDA   [$28]
         AND   #$00FF
         BEQ   L61B7
         CMP   #$0020
         BNE   L618C
         INC   $28
         BRA   L617C
L618C    PER   L618F+2
L618F    BRL   L67DD
         BCC   L6197
         BRL   L3D99
L6197    LDY   #$04FA
         LDA   [$3C],Y
         LDY   $00
         CMP   #$0030
         BEQ   L61B5
         STZ   $04
         DEC   $04
         DEC   $04
         PHK
         PER   L61B4
         PEA   $0006
         PEI   $EE
         PEI   $EC
L61B4    RTL

L61B5    STY   $10
L61B7    LDX   #$0018
         PHK
         PER   L61C5
         PEA   $0009
         PEI   $EE
         PEI   $EC
L61C5    RTL

         LDA   $10
         STA   [$24]
         INC   $24
         INC   $24
         BRL   L3D28
         LDY   $00
         PER   L61D6+2
L61D6    BRL   L46A6
         BCS   L61F5
         INY
         PER   L61DF+2
L61DF    BRL   L4693
         CMP   #$0052
         BNE   L61FB
         PHY
         INY
         PER   L61EC+2
L61EC    BRL   L4693
         PLY
         TAX
         BNE   L61FB
         STA   [$28],Y
L61F5    LDA   #$000D
         BRL   L405B
L61FB    PEA   $0002
         PHK
         PER   L6202+2
L6202    BRL   L8D82
         BRL   L3D99
         PER   L6212
         PLX
         PER   L6212+4
         BRL   L457E
L6212    ASC   'STEP'00
         BCS   L621D
         BIT   $20
         BMI   L622B
L621D    PER   L6220+2
L6220    BRL   L652C
         BCS   L622B
         LDA   #$000D
         BRL   L405B
L622B    PEA   $0002
         PHK
         PER   L6232+2
L6232    BRL   L8D82
         BRL   L3D99
         PER   L6242
         PLX
         PER   L6242+5
         BRL   L457E
L6242    ASC   'BYTES'00
         BCC   L6270
         LDY   $00
         PER   L624F+2
L624F    BRL   L46A6
         BCS   L622B
         INY
         PER   L6258+2
L6258    BRL   L46A6
         BCC   L622B
         BRL   L40B0
         PER   L626A
         PLX
         PER   L626A+3
         BRL   L457E
L626A    ASC   'GET'00
         BCS   L62B7
L6270    DEY
         DEY
         LDA   #$7845     ; Ex
         STA   [$28],Y
         INY
         INY
L6279    PER   L627C+2
L627C    BRL   L46A6
         BCS   L6289
         LDA   [$28],Y
         CLC
         ADC   #$0052
         BRA   L62B2
L6289    LDA   [$28],Y
         AND   #$00FF
         CMP   #$0020
         BEQ   L62AC
         TYA
         CLC
         ADC   $28
         STA   $28
         PER   L629C+2
L629C    BRL   L658A
         PEA   $0002
         PHK
         PER   L62A6+2
L62A6    BRL   L8D82
         BRL   L3D99
L62AC    LDA   [$28],Y
         CLC
         ADC   #$005E
L62B2    STA   [$28],Y
         BRL   L40B0
L62B7    LDY   $00
         PER   L62BC+2
L62BC    BRL   L46A6
         BCS   L6336
         INY
         STY   $14
         PER   L62CE
         PLX
         PER   L62CE+3
         BRL   L457E
L62CE    ASC   'SIN'00
         BCS   L62DF
L62D4    DEY
         LDA   [$28],Y
         CLC
         ADC   #$0020
         STA   [$28],Y
         BRA   L6313
L62DF    LDY   $14
         PER   L62EB
         PLX
         PER   L62EB+3
         BRL   L457E
L62EB    ASC   'SQR'00
         BCC   L62D4
         LDY   $14
         PER   L62FD
         PLX
         PER   L62FD+3
         BRL   L457E
L62FD    ASC   'TRI'00
         BCC   L62D4
         LDY   $00
         PER   L6308+2
L6308    BRL   L46A6
         LDA   [$28],Y
         CLC
         ADC   #$0052
         STA   [$28],Y
L6313    INY
         PER   L6317+2
L6317    BRL   L46A6
         BCS   L6336
         INY
         PER   L6320+2
L6320    BRL   L46A6
         BCS   L6336
         INY
         PER   L6329+2
L6329    BRL   L46A6
         BCS   L6336
         LDA   [$28],Y
         CLC
         ADC   #$0052
         STA   [$28],Y
L6336    BRL   L40B0
         LDY   #$04FB
         LDA   [$3C],Y
         PHA
         LDY   $00
         PER   L6344+2
L6344    BRL   L4693
         PLX
         CMP   #$0023
         BNE   L635C
         LDA   [$28],Y
         CLC
         ADC   #$FFFD
         STA   [$28],Y
         INX
         TXA
         LDY   #$04FB
         STA   [$3C],Y
L635C    CPX   #$01B9
         BNE   L6364
         BRL   L6489
L6364    BRL   L6159
         PER   L6371
         PLX
         PER   L6371+6
         BRL   L457E
L6371    ASC   'OUTPUT'00
         BCS   L6399
         STY   $14
         PER   L637F+2
L637F    BRL   L4693
         CMP   #$0023
         BNE   L63DD
         LDA   [$28],Y
         CLC
         ADC   #$FFFD
         STA   [$28],Y
         LDY   $14
         DEY
         LDA   [$28],Y
         ORA   #$0020
         STA   [$28],Y
L6399    LDA   #$000D
         BRL   L405B
         LDY   $00
         PER   L63A4+2
L63A4    BRL   L4693
         CMP   #$0023
         BNE   L6402
         LDA   [$28],Y
         SEC
         SBC   #$0003
         STA   [$28],Y
         LDY   #$04FB
         LDA   [$3C],Y
         INC
         LDY   #$04FB
         STA   [$3C],Y
         LDA   #$000D
         BRL   L405B
         LDY   #$0000
         PER   L63CB+2
L63CB    BRL   L4693
         CMP   #$0023
         BNE   L63DD
         LDA   [$28],Y
         AND   #$FF00
         ORA   #$0020
         STA   [$28],Y
L63DD    LDA   #$0040
         TSB   $A5
         BRL   L40B0
         LDY   #$0000
         PER   L63F2
         PLX
         PER   L63F2+5
         BRL   L457E
L63F2    ASC   'TIMER'00
         BCS   L6402
         DEY
         LDA   #$0020
         ORA   [$28],Y
         STA   [$28],Y
L6402    LDA   #$001C
         BRL   L405B
         LDY   $00
         PER   L640D+2
L640D    BRL   L4693
         CMP   #$002C
         BEQ   L6418
         BRL   L595B
L6418    LDA   [$28],Y
         CLC
         ADC   #$000F
         STA   [$28],Y
         BRL   L595B
         LDY   #$0000
         PER   L6430
         PLX
         PER   L6430+6
         BRL   L457E
L6430    ASC   'REPEAT'00
         BCS   L6442
         DEY
         LDA   [$28],Y
         CLC
         ADC   #$0020
         STA   [$28],Y
L6442    LDA   #$000D
         BRL   L405B
         LDA   #$0002
         BIT   $72
         BNE   L645E
         LDX   #$001A
         PHK
         PER   L645D
         PEA   $0009
         PEI   $EE
         PEI   $EC
L645D    RTL

L645E    BRL   L59BC
         PER   L646B
         PLX
         PER   L646B+3
         BRL   L457E
L646B    ASC   'GET'00
         BCS   L6474
         BRL   L6270
L6474    PER   L647E
         PLX
         PER   L647E+5
         BRL   L457E
L647E    ASC   'USING'00
         BCS   L6489
         BRL   L6279
L6489    LDY   #$0000
         PER   L648F+2
L648F    BRL   L4693
         CMP   #$002C
         BEQ   L649A
         BRL   L6159
L649A    LDA   [$28],Y
         CLC
         ADC   #$000F
         STA   [$28],Y
         BRL   L6159
         PER   L64A8+1
L64A8    BRA   L64CD
         LDY   #$0000
         PER   L64B0+2
L64B0    BRL   L46A6
         BCC   L64C2
         PEA   $0002
         PHK
         PER   L64BC+2
L64BC    BRL   L8D82
         BRL   L3D99
L64C2    LDA   [$28],Y
         CLC
         ADC   #$0052
         STA   [$28],Y
         BRL   L40B0
L64CD    LDY   #$0000
         PER   L64D3+2
L64D3    BRL   L4693
         CMP   #$0023
         BNE   L64E3
         LDA   [$28],Y
         SEC
         SBC   #$0003
         STA   [$28],Y
L64E3    RTS

         LDY   #$0000
         PER   L64EA+2
L64EA    BRL   L4693
         DEY
         BMI   L6512
         LDA   [$28],Y
         CLC
         ADC   #$005E
         STA   [$28],Y
         LDA   #$0005
         STA   $04
L64FD    PER   L6500+2
L6500    BRL   L46A6
         BCS   L651C
         LDA   [$28],Y
         CLC
         ADC   #$0052
         STA   [$28],Y
         INY
         DEC   $04
         BNE   L64FD
L6512    PEA   $0002
         PHK
         PER   L6519+2
L6519    BRL   L8D82
L651C    BRL   L40B0
         LDY   $00
         DEY
         SEP   #$20
L6524    INY
         LDA   [$28],Y
         BNE   L6524
         REP   #$20
         RTS

L652C    LDX   $00
         TXY
         STZ   $20
         SEP   #$20
L6533    LDA   [$28],Y
         INY
         CMP   #$20
         BEQ   L6533
         CMP   #$28
         BEQ   L6562
         CMP   #$53
         BNE   L657A
         LDA   [$28],Y
         INY
         CMP   #$54
         BNE   L657A
         LDA   [$28],Y
         INY
         CMP   #$45
         BNE   L657A
         LDA   [$28],Y
         INY
         CMP   #$50
         BNE   L657A
L6557    LDA   [$28],Y
         INY
         CMP   #$20
         BEQ   L6557
         CMP   #$28
         BNE   L657A
L6562    LDA   [$28],Y
         BEQ   L657A
         INY
         CMP   #$28
         BNE   L656E
         INX
         BRA   L6562
L656E    CMP   #$29
         BNE   L657E
         DEX
         BPL   L6562
         CLC
         DEC   $20
         BEQ   L657B
L657A    SEC
L657B    REP   #$20
         RTS

         MX    %10
L657E    CMP   #$2C
         BNE   L6562
         PHX
         PLX
         BNE   L6562
         INC   $20
         BRA   L6562
L658A    PHP
         REP   #$20
         PHA
         LDA   $28
         SEC
         SBC   #$03F6
         SEC
         SBC   $3C
         CLC
         ADC   $C2
         CMP   #$0100
         BCS   L65A1
         STA   $B0
L65A1    PLA
         PLP
         RTS

L65A4    LDA   #$2000
         AND   $68
         BNE   L65D1
         LDY   #$0090
         LDA   [$3C],Y
         STA   [$E4]
         LDY   #$0098
         LDA   [$3C],Y
         LDY   #$0002
         STA   [$E4],Y
         LDY   #$00A0
         LDA   [$3C],Y
         LDY   #$0014
         STA   [$E4],Y
         LDY   #$00A8
         LDA   [$3C],Y
         LDY   #$0016
         STA   [$E4],Y
         RTS

L65D1    LDY   #$0086
         LDA   [$3C],Y
         ASL
         ASL
         INC
         ASL
         ASL
         TAX
         LDY   #$00AC
         LDA   [$3C],Y
         TXY
         STA   [$E4],Y
         INX
         INX
         LDY   #$00B0
         LDA   [$3C],Y
         TXY
         STA   [$E4],Y
         RTS

L65EF    CLC
         PHP
         LDY   $00
         SEP   #$20
         TYX
         LDA   [$28]
         CMP   #$28
         BNE   L662F
         LDA   #$2C
         STA   [$28]
L6600    INX
L6601    INY
         LDA   [$28],Y
         BEQ   L6634
         CMP   #$28
         BEQ   L6600
         CMP   #$2C
         BNE   L6618
         BIT   $08
         BMI   L6618
         DEX
         BEQ   L662F
         INX
         BRA   L6601
L6618    CMP   #$29
         BNE   L6601
         DEX
         BNE   L6601
         LDA   #$2C
         STA   [$28],Y
         TYA
         CLC
         ADC   $28
         STA   $28
         BCC   L662D
         INC   $29
L662D    PLP
         RTS

L662F    PEA   $0002
         BRA   L6638
L6634    DEY
         PEA   $0015
L6638    REP   #$20
         TYA
         CLC
         ADC   $28
         STA   $28
         PER   L6643+2
L6643    BRL   L658A
         PHK
         PER   L664A+2
L664A    BRL   L8D82
         PLP
         SEC
         RTS

L6650    PEI   $20
         STZ   $20
         INX
         PHX
         LDX   #$0007
         PHA
         PLA
         BEQ   L6661
         BPL   L6660
         INX
L6660    INX
L6661    PHK
         PER   L666C
         PEA   $0009
         PEI   $EE
         PEI   $EC
L666C    RTL

         LDA   $62
         ASL
         CLC
         ADC   #$0050
         TAY
L6675    LDA   $62
         BMI   L66DD
         BEQ   L6691
         CMP   #$0010
         BCS   L6691
         CMP   #$0005
         BMI   L6694
         DEC
         DEC
         DEC
         DEC
         XBA
         LSR
         CLC
         ADC   #$0800
         BRA   L6696
L6691    SEC
         BRA   L66DE
L6694    XBA
         ASL
L6696    CLC
         ADC   [$3C],Y
         PLX
         PHX
         CPX   #$8000
         BNE   L66C2
         ASL
         ASL
         TAY
L66A3    LDA   [$E4],Y
         INC
         BEQ   L66BF
         DEY
         DEY
         DEY
         DEY
         CPY   #$0800
         BCS   L66A3
         PEA   $006C
         PHK
         PER   L66B8+2
L66B8    BRL   L8D82
         INY
         INY
         INY
         INY
L66BF    TYA
         BRA   L66CB
L66C2    CLC
         ADC   $01,S
         ASL
         ASL
         BIT   $20
         BMI   L66D1
L66CB    STA   [$24]
         INC   $24
         INC   $24
L66D1    TAY
         LDA   $00
         BIT   $20
         BVC   L66DD
         BPL   L66DB
         DEC
L66DB    STA   [$E4],Y
L66DD    CLC
L66DE    PLX
         PLY
         STY   $20
         RTS

L66E3    PEI   $20
         PEA   $0000
L66E8    LDX   #$4000
         STX   $20
         LDX   #$0006
         PHK
         PER   L66FB
         PEA   $0009
         PEI   $EE
         PEI   $EC
L66FB    RTL

L66FC    LDA   $62
         BMI   L66DD
         TAX
         ASL
         CLC
         ADC   #$0050
         TAY
         PLA
         PHA
         CMP   #$8000
         BEQ   L6713
         LDA   [$3C],Y
         INC
         STA   [$3C],Y
L6713    LDA   [$3C],Y
         CPX   #$0004
         BMI   L6733
         CMP   #$0080
         BPL   L6722
         BRL   L6675
L6722    PEA   $006C
         PHK
         PER   L6729+2
L6729    BRL   L8D82
         LSR
         LSR
         STA   [$3C],Y
         BRL   L6675
L6733    CMP   #$0200
         BPL   L673B
         BRL   L6675
L673B    BRA   L6722
L673D    PEI   $20
         LDX   #$C000
         STX   $20
         PEA   $0000
         BRA   L66FC
L6749    PEI   $20
         PEA   $8000
         BRA   L66E8
L6750    LDA   $62
         BMI   L678E
         DEC
         BMI   L6766
         CLC
         ADC   #$0072
         TAY
         LDA   [$3C],Y
         AND   #$00FF
         DEC
         DEC
         BNE   L6766
         RTS

L6766    PEA   $006E
         BRA   L6783
L676B    LDA   $62
         BMI   L678E
         CLC
         ADC   #$0072
         TAY
         TXA
         STA   [$3C],Y
         INC   $62
         LDX   $62
         CPX   #$0010
         BMI   L678E
         PEA   $0068
L6783    PHK
         PER   L6787+2
L6787    BRL   L8D82
         STZ   $62
         DEC   $62
L678E    RTS

L678F    LDA   $62
         BMI   L678E
         DEC
         BMI   L67C7
         STA   $62
         CLC
         ADC   #$0072
         TAY
         LDA   [$3C],Y
         ROR
         ROR
         BMI   L67B1
         BCS   L67BB
         TXA
         ROR
         ROR
         BMI   L67AC
         BCC   L678E
L67AC    PEA   $0069
         BRA   L6783
L67B1    TXA
         ROR
         ROR
         BMI   L678E
         PEA   $006A
         BRA   L6783
L67BB    TXA
         ROR
         ROR
         BMI   L67C2
         BCS   L678E
L67C2    PEA   $006B
         BRA   L6783
L67C7    TXA
         ROR
         ROR
         BMI   L67D8
         BCS   L67D3
         PEA   $004A
         BRA   L6783
L67D3    PEA   $006E
         BRA   L6783
L67D8    PEA   $004B
         BRA   L6783
L67DD    PER   L67E0+2
L67E0    BRL   L658A
         LDA   #$04F8
         CLC
         ADC   $3C
         STA   $38
         LDA   $00
         ADC   $3E
         STA   $3A
         LDX   $00
         LDY   $00
         LDA   #$0040
         TRB   $A6
         TXA
         STX   $0A
         SEP   #$20
L67FF    LDA   [$28],Y
         BEQ   L6876
         BMI   L680B
         INY
         CMP   #$20
         BEQ   L67FF
         DEY
L680B    TYA
         CLC
         ADC   $B0
         STA   $B0
L6811    STY   $0C
         LDA   [$28],Y
         BEQ   L6866
         BMI   L685B
         TAY
         LDA   [$94],Y
         BMI   L6866
         BNE   L6830
         TYA
         CMP   #$26
         BEQ   L682C
         LDA   #$40
         TSB   $A6
         TYA
         BRA   L685B
L682C    PHX
         PLX
         BNE   L6866
L6830    PHX
         PLX
         BEQ   L6839
         DEC
         DEC
         DEC
         BEQ   L6866
L6839    TYA
         TXY
         INY
         INY
         STA   [$38],Y
         LDY   $0C
         INY
         INX
         CPX   #$0029
         BMI   L6811
         BEQ   L684D
         DEX
         BRA   L6811
L684D    PEA   $000F
         PHK
         PER   L6854+2
L6854    BRL   L8D82
         INC   $0A
         BRA   L6811
L685B    LDY   $0C
         INY
         STY   $0C
         TXY
         INY
         INY
         STA   [$38],Y
         INX
L6866    LDY   $0C
         LDA   [$28],Y
         CMP   #$20
         BNE   L6876
L686E    INY
         LDA   [$28],Y
         CMP   #$20
         BEQ   L686E
         DEY
L6876    REP   #$20
         TYA
         CLC
         ADC   $28
         STA   $28
         TXY
         LDA   $00
         INY
         INY
         STA   [$38],Y
         TXA
         STA   [$38]
         LDA   $0A
         BNE   L688E
         CLC
         RTS

L688E    SEC
         RTS

L6890    CLC
         LDY   #$0036
         LDA   [$3C],Y
         BNE   L689B
         BRL   L69DF
L689B    BPL   L68A0
         BRL   L69DF
L68A0    TAX
         CMP   #$0032
         BCC   L68AE
         LDA   #$0031
         LDY   #$0036
         STA   [$3C],Y
L68AE    STA   $1E
         PEA   $0000
         PHX
         PEA   $0000
         PEI   $08
         PHK
         PHK
         PER   L6BDA
         PHK
         PER   L68C2+2
L68C2    BRL   L8F68
         LDX   $F4
         PHK
         PER   L68CB+2
L68CB    BRL   LAF42
         TSC
         CLC
         ADC   #$000C
         TCS
         STZ   $20
         LDA   #$0028
         BIT   $72
         BEQ   L68E0
         BRL   L69DF
L68E0    PER   L68E3+2
L68E3    BRL   L69E0
         BCC   L68EB
         BRL   L69C0
L68EB    LDA   $1E
         STA   $22
         LDA   #$059C
         CLC
         ADC   $3C
         STA   $44
         LDA   $00
         ADC   $3E
         STA   $46
         INC   $20
         LDX   $20
         INX
         LDY   #$000A
L6905    LDA   [$E0],Y
         BNE   L690C
         BRL   L69C0
L690C    TAY
         DEX
         BNE   L6905
         TYA
         CLC
         ADC   #$0004
         CLC
         ADC   $E0
         TAY
         LDA   $E2
         BCC   L691E
         INC
L691E    PHA
         PHY
         PHK
         PHK
         PER   L6C0C
         LDX   $F4
         PHK
         PER   L692B+2
L692B    BRL   LAF42
         TSC
         CLC
         ADC   #$0008
         TCS
L6934    PER   L6937+2
L6937    BRL   L69E0
         BCC   L693F
         BRL   L69C0
L693F    LDA   [$44]
         XBA
         AND   #$00FF
         CMP   $20
         BNE   L69AA
         LDY   #$0004
         LDA   [$44],Y
         AND   #$00FF
         PEA   $0000
         PHA
         DEY
         DEY
         LDA   [$44],Y
         PEA   $0000
         PHA
         LDA   [$44]
         AND   #$00FF
         STA   [$44]
         PEA   $0000
         PHA
         PHK
         PHK
         STA   $0C
         LDA   $08
         DEC
         BEQ   L6976
         PER   L6C01
         BRA   L6979
L6976    PER   L6BF1
L6979    LDX   $F4
         PHK
         PER   L697F+2
L697F    BRL   LAF42
         TSC
         CLC
         ADC   #$0010
         TCS
         LDA   $0C
         PHK
         PER   L6995
         PEA   $0039
         PEI   $EE
         PEI   $EC
L6995    RTL

         PHX
         PHA
         PHK
         PHK
         PER   L6C30
         LDX   $F4
         PHK
         PER   L69A3+2
L69A3    BRL   LAF42
         PLA
         PLA
         PLA
         PLA
L69AA    LDA   #$0005
         CLC
         ADC   $44
         STA   $44
         BCC   L69B6
         INC   $46
L69B6    DEC   $22
         BEQ   L69BD
         BRL   L6934
L69BD    BRL   L68E0
L69C0    PHK
         PHK
         PER   L6BC4
         LDX   $F4
         PHK
         PER   L69CB+2
L69CB    BRL   LAF42
         PLA
         PLA
         PEA   $0000
         PEA   $0000
         _ReadChar
         PLA
         SEC
L69DF    RTL

L69E0    STZ   $04
         BIT   $F4
         BVC   L6A04
         PEI   $00
         TDC
         CLC
         ADC   #$0004
         PHA
         _GetPen
         PEI   $00
         TDC
         CLC
         ADC   #$0004
         PHA
         _LocalToGlobal
L6A04    LDA   $04
         CMP   #$00BF
         RTS

L6A0A    LDY   #$000A
         LDA   [$3C],Y
         BNE   L6A14
         BRL   L6ACA
L6A14    PHY
         PHK
         PER   L6A19+2
L6A19    BRL   L8F68
         PLY
         LDA   [$3C],Y
         TAX
         LDA   $00
         STA   [$3C],Y
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         TXA
         STA   [$3C],Y
         PHK
         PER   L6A30+2
L6A30    BRL   LA472
         LDY   #$01C4
         LDX   #$01B4
L6A39    LDA   [$3C],Y
         PHY
         TXY
         STA   [$3C],Y
         PLY
         STA   [$3C],Y
         INY
         INY
         INX
         INX
         CPY   #$01D4
         BCC   L6A39
         LDY   #$004A
         LDA   [$3C],Y
         LDY   #$0046
         STA   [$3C],Y
         LDY   #$004E
         LDA   [$3C],Y
         LDY   #$004C
         STA   [$3C],Y
         LDY   #$002E
         LDA   [$3C],Y
         LDY   #$002C
         STA   [$3C],Y
         LDY   #$0028
         LDA   [$3C],Y
         LDY   #$0024
         STA   [$3C],Y
         LDY   #$002A
         LDA   [$3C],Y
         LDY   #$0026
         STA   [$3C],Y
         LDA   #$01EE
         CLC
         ADC   $3C
         LDX   $3E
         BCC   L6A88
         INX
L6A88    LDY   #$0020
         STA   [$3C],Y
         TXA
         LDY   #$0022
         STA   [$3C],Y
         LDY   #$003C
         LDA   [$3C],Y
         LDY   #$0038
         STA   [$3C],Y
         LDA   $00
         LDY   #$000A
         STA   [$3C],Y
         LDX   $70
         LDA   #$00FF
         TRB   $71
         LDA   $72
         BIT   #$0020
         BNE   L6ABA
         TXA
         BPL   L6AC7
         LDA   #$00C0
         BRA   L6AC5
L6ABA    TXA
         BMI   L6AC2
         LDA   #$0040
         BRA   L6AC5
L6AC2    LDA   #$0080
L6AC5    TSB   $71
L6AC7    BRL   L3D28
L6ACA    LDA   $62
         BEQ   L6ADB
         INC
         BEQ   L6ADB
         PEA   $0071
         PHK
         PER   L6AD8+2
L6AD8    BRL   L8D82
L6ADB    LDA   #$2000
         BIT   $68
         BEQ   L6AEC
         PEA   $002B
         PHK
         PER   L6AE9+2
L6AE9    BRL   L8D82
L6AEC    LDY   #$0086
         LDA   [$3C],Y
         DEC
         BNE   L6AFA
         PER   L6AF7+2
L6AF7    BRL   L6B82
L6AFA    LDY   #$01A4
         LDA   [$3C],Y
         BEQ   L6B07
         PER   L6B04+2
L6B04    BRL   L72B7
L6B07    PHK
         PER   L6B12
         PEA   $0030
         PEI   $EE
         PEI   $EC
L6B12    RTL

         STZ   $20
         DEC   $20
         PHK
         PER   L6B22
         PEA   $0027
         PEI   $EE
         PEI   $EC
L6B22    RTL

         LDX   $00
         PHK
         PER   L6B30
         PEA   $0009
         PEI   $EE
         PEI   $EC
L6B30    RTL

         LDA   $00
         INC
         INC
         STA   [$AC]
         CLC
         LDY   #$003E
         ADC   [$3C],Y
         LDY   #$003E
         STA   [$3C],Y
         PHK
         PER   L6B4D
         PEA   $0024
         PEI   $EE
         PEI   $EC
L6B4D    RTL

         LDY   #$0008
         LDA   [$3C],Y
         PHA
         LDA   $00
         LDY   #$0008
         STA   [$3C],Y
         PHK
         PER   L6B5F+2
L6B5F    BRL   LA472
         STZ   $08
         INC   $08
         PHK
         PER   L6B6A+2
L6B6A    BRL   L6890
         LDY   #$001A
         LDA   [$3C],Y
         ORA   #$4000
         BIT   $72
         BVS   L6B7C
         AND   #$BFFF
L6B7C    LDY   #$001A
         STA   [$3C],Y
         RTL

L6B82    STZ   $20
         PHK
         PER   L6B8F
         PEA   $0027
         PEI   $EE
         PEI   $EC
L6B8F    RTL

         PER   L6B93+2
L6B93    BRL   L65A4
         LDY   #$0036
         LDA   [$3C],Y
         TAX
         PEI   $72
         LDA   #$0020
         TXY
         BEQ   L6BA6
         TRB   $72
L6BA6    BIT   $72
         BEQ   L6BB1
         PHK
         PER   L6BAE+2
L6BAE    BRL   L08D6
L6BB1    LDX   #$FFFF
         PHK
         PER   L6BBF
         PEA   $0012
         PEI   $EE
         PEI   $EC
L6BBF    RTL

         PLA
         STA   $72
         RTS

L6BC4    ASC   'Type any key to exit.'00
L6BDA    ASC   'Pass %d: %d error(s).'0D00
L6BF1    ASC   'E%d, L%d, C%d: '00
L6C01    ASC   'E%d, L%d: '00
L6C0C    ASC   'File %s:'0D00
L6C16    ASC   '       Program Unit: %s'0D0D00
L6C30    ASC   '%s.'0D00
L6C35    PHK
         PER   L6C39+2
L6C39    BRL   L8DCE
         LDY   #$01B8
         LDA   [$3C],Y
         STA   $D6
         INY
         INY
         LDA   [$3C],Y
         STA   $D8
         LDA   #$03F6
         CLC
         ADC   $3C
         STA   $30
         LDA   $00
         ADC   $3E
         STA   $32
         LDY   $30
         STY   $28
         LDY   $32
         STY   $2A
         LDA   $00
         STA   [$30]
         STA   [$6E]
         LDA   #$0040
         TRB   $A7
         LDY   #$004C
         LDA   [$3C],Y
         BNE   L6C74
         BRL   L6D27
L6C74    LDX   $6E
         LDA   #$1298
         CLC
         ADC   $3C
         STA   $6E
         BIT   $70
         BMI   L6C92
         BVS   L6C87
         BRL   L6D1A
L6C87    LDA   #$0040
         TRB   $71
         ASL
         TSB   $71
         BRL   L6D1A
L6C92    TXA
         SEC
         SBC   $6E
         LDY   #$014C
         STA   [$3C],Y
         TAY
         BEQ   L6D11
         BIT   $92
         BMI   L6D11
         TAX
         LDY   #$002C
         LDA   [$3C],Y
         BPL   L6CB1
         LDA   [$6E]
         CMP   #$000D
         BEQ   L6D11
L6CB1    PEA   $0000
         PHX
         LDA   $3E
         AND   #$00FF
         PHA
         PEI   $6E
         PER   L6CC0+2
L6CC0    BRL   L733B
         PHA
         PER   L6CC7+2
L6CC7    BRL   L7186
         LDA   #$0020
         AND   $71
         BEQ   L6D01
         TRB   $71
         LDY   #$01A4
         LDA   [$3C],Y
         BEQ   L6CF3
         LDA   #$0006
         PHK
         PER   L6CE1+2
L6CE1    BRL   L047B
         PER   L6CE7+2
L6CE7    BRL   L720F
         PHK
         PER   L6CEE+2
L6CEE    BRL   L08D6
         BRA   L6D11
L6CF3    PHK
         PER   L6CF7+2
L6CF7    BRL   L08D6
         PLA
         PLA
         PLA
         PLA
         PLA
         BRA   L6D11
L6D01    LDX   #$0006
         PHK
         PER   L6D08+2
L6D08    BRL   L047B
         PER   L6D0E+2
L6D0E    BRL   L720F
L6D11    BIT   $70
         BVC   L6D1A
         LDA   #$00C0
         TRB   $71
L6D1A    LDA   #$0028
         BIT   $72
         BEQ   L6D27
         PER   L6D24+2
L6D24    BRL   L720F
L6D27    LDY   #$002C
         LDA   [$3C],Y
         BPL   L6D30
         SEC
         RTL

L6D30    LDA   $00
         STA   [$6E]
         LDY   #$004C
         LDA   [$3C],Y
         CLC
         LDY   #$0046
         ADC   [$3C],Y
         LDY   #$0046
         STA   [$3C],Y
         LDA   $00
         LDY   #$004C
         STA   [$3C],Y
         LDA   $B2
         STA   $10
         LDY   #$0024
         LDA   [$3C],Y
         STA   $34
         LDY   #$0026
         LDA   [$3C],Y
         STA   $36
L6D5D    LDA   [$34]
         INC   $34
         AND   #$00FF
         BNE   L6D78
         PER   L6D69+2
L6D69    BRL   L7359
         BCC   L6D5D
         LDA   #$000D
         STA   [$6E]
         INC   $6E
         BRL   L7114
L6D78    STA   [$6E]
         INC   $6E
         INC   $B2
         CMP   #$0009
         BNE   L6D88
         LDA   #$0020
         BRA   L6D90
L6D88    CMP   #$000A
         BNE   L6D90
         LDA   #$000D
L6D90    INC   $D6
         BNE   L6D96
         INC   $D8
L6D96    CMP   #$0020
         BEQ   L6D5D
         TAY
         LDA   $B2
         STA   $B0
         LDX   $88
         STZ   $88
         LDA   #$0080
         TSB   $88
         LDA   $10
         BEQ   L6DB5
         TXA
         LSR
         BCC   L6DC4
         STZ   $10
         BRA   L6DC4
L6DB5    CPY   #$0030
         BCC   L6DC4
         CPY   #$003A
         BCS   L6DC4
         LDA   #$8001
         TSB   $88
L6DC4    TYA
         BRA   L6E1C
L6DC7    CMP   #$0061
         BCC   L6DD4
         CMP   #$007B
         BCS   L6DD4
         AND   #$FFDF
L6DD4    STA   [$30]
         LDY   $B2
         CPY   #$0100
         BCC   L6DE1
         DEC   $6E
         BRA   L6DE3
L6DE1    INC   $30
L6DE3    LDA   [$34]
         INC   $34
         AND   #$00FF
         BNE   L6DFE
         PER   L6DEF+2
L6DEF    BRL   L7359
         BCC   L6DE3
         LDA   #$000D
         STA   [$6E]
         INC   $6E
         BRL   L7111
L6DFE    STA   [$6E]
         INC   $6E
         INC   $B2
         CMP   #$0009
         BNE   L6E0E
         LDA   #$0020
         BRA   L6E16
L6E0E    CMP   #$000A
         BNE   L6E16
         LDA   #$000D
L6E16    INC   $D6
         BNE   L6E1C
         INC   $D8
L6E1C    CMP   #$000D
         BNE   L6E24
         BRL   L7114
L6E24    STA   $12
         TAY
         CMP   #$003A
         BNE   L6E2F
         BRL   L6EF6
L6E2F    BIT   $88
         BPL   L6E43
         CMP   #$0030
         BCS   L6E3B
         BRL   L6EF2
L6E3B    CMP   #$003A
         BCC   L6E43
         BRL   L6EF2
L6E43    BIT   $87
         BVC   L6E60
         TAY
         LDA   $88
         LSR
         LSR
         TYA
         BCS   L6DD4
         CPY   #$0022
         BEQ   L6E57
         BRL   L6DC7
L6E57    LDA   #$0002
         TSB   $88
         TYA
         BRL   L6DD4
L6E60    LDA   [$94],Y
         XBA
         XBA
         BMI   L6E70
         LDA   $12
         CMP   #$0040
         BEQ   L6E77
         BRL   L6DC7
L6E70    ORA   #$FF00
         INC
         INC
         BPL   L6E8F
L6E77    PEI   $B0
         LDA   $B2
         STA   $B0
         PEA   $0002
         PHK
         PER   L6E84+2
L6E84    BRL   L8D82
         PLA
         STA   $B0
         LDA   #$0020
         STA   $12
L6E8F    LDA   $12
         BIT   $87
         BPL   L6EB4
         LDA   #$0080
         TRB   $88
         PER   L6EA4
         PLX
         PER   L6EA4+3
         BRL   L465D
L6EA4    ASC   'REM'00
         BCS   L6EC8
         LDA   #$2027     ; ' ''
         STA   [$28]
         LDA   #$0040
         TSB   $88
L6EB4    LDA   $12
         CMP   #$0022
         BEQ   L6F0E
         CMP   #$0027
         BEQ   L6EDE
         BRL   L6DC7
L6EC3    LDA   $12
         BRL   L6DC7
L6EC8    PER   L6ED2
         PLX
         PER   L6ED2+4
         BRL   L457E
L6ED2    ASC   'DATA'00
         BCS   L6EDC
         BRL   L7094
L6EDC    BRA   L6EB4
L6EDE    LDA   [$28]
         BNE   L6EE9
         LDA   #$0040
         TSB   $88
         BRA   L6EC3
L6EE9    DEC   $34
         DEC   $B2
         DEC   $6E
         BRL   L7114
L6EF2    DEC   $10
         BRA   L6EE9
L6EF6    BIT   $87
         BVC   L6EFD
         BRL   L6DC7
L6EFD    BMI   L6F02
         BRL   L7114
L6F02    LDY   $10
         BEQ   L6F09
         BRL   L7114
L6F09    DEC   $10
         BRL   L7114
L6F0E    LDX   $B2
         STX   $14
         BIT   $92
         BMI   L6F1A
         BIT   $87
         BVC   L6F85
L6F1A    STA   [$30]
         LDY   $B2
         CPY   #$0100
         BCC   L6F27
         DEC   $6E
         BRA   L6F29
L6F27    INC   $30
L6F29    LDA   [$34]
         INC   $34
         AND   #$00FF
         BNE   L6F43
         PER   L6F35+2
L6F35    BRL   L7359
         BCC   L6F29
         LDA   #$000D
         STA   [$6E]
         INC   $6E
         BRA   L6F6E
L6F43    STA   [$6E]
         INC   $6E
         INC   $B2
         CMP   #$0009
         BNE   L6F53
         LDA   #$0020
         BRA   L6F5B
L6F53    CMP   #$000A
         BNE   L6F5B
         LDA   #$000D
L6F5B    INC   $D6
         BNE   L6F61
         INC   $D8
L6F61    CMP   #$000D
         BEQ   L6F6E
         CMP   #$0022
         BNE   L6F1A
         BRL   L6DC7
L6F6E    PHA
         LDA   #$0022
         STA   [$30]
         LDY   $B2
         CPY   #$0100
         BCC   L6F7F
         DEC   $6E
         BRA   L6F81
L6F7F    INC   $30
L6F81    PLA
         BRL   L7111
L6F85    LDX   #$0002
         PHK
         PER   L6F93
         PEA   $0009
         PEI   $EE
         PEI   $EC
L6F93    RTL

         LDA   #$0BDE
         CLC
         ADC   $3C
         STA   $2C
         LDA   $00
         ADC   $3E
         STA   $2E
         LDY   #$0032
         LDA   [$3C],Y
         INC
         ASL
         TAY
         TYA
         CLC
         ADC   $2C
         STA   $2C
         LDA   $00
         ADC   $2E
         STA   $2E
         LDY   #$0034
         LDA   [$3C],Y
         STA   [$2C]
         INC   $2C
         INC   $2C
         LDA   #$169C
         CLC
         ADC   $3C
         STA   $98
         LDA   $00
         ADC   $3E
         STA   $9A
         STZ   $08
         BRA   L6FEB
L6FD3    STA   [$98]
         LDA   #$2020
         STA   [$30]
         LDY   $B2
         CPY   #$0100
         BCC   L6FE5
         DEC   $6E
         BRA   L6FEB
L6FE5    INC   $30
         INC   $98
         INC   $08
L6FEB    LDA   [$34]
         INC   $34
         AND   #$00FF
         BNE   L7005
         PER   L6FF7+2
L6FF7    BRL   L7359
         BCC   L6FEB
         LDA   #$000D
         STA   [$6E]
         INC   $6E
         BRA   L7031
L7005    STA   [$6E]
         INC   $6E
         INC   $B2
         CMP   #$0009
         BNE   L7015
         LDA   #$0020
         BRA   L701D
L7015    CMP   #$000A
         BNE   L701D
         LDA   #$000D
L701D    INC   $D6
         BNE   L7023
         INC   $D8
L7023    CMP   #$000D
         BEQ   L7031
         CMP   #$0022
         BNE   L6FD3
         LDX   $00
         BRA   L7032
L7031    TAX
L7032    LDA   #$0071
         STA   [$30]
         INC   $30
         LDY   #$0032
         LDA   [$3C],Y
         INC
         LDY   #$0032
         STA   [$3C],Y
         ORA   #$0080
         STA   [$30]
         INC   $30
         LDY   #$0034
         LDA   [$3C],Y
         CLC
         ADC   $08
         LDY   #$0034
         STA   [$3C],Y
         STA   [$2C]
         PHX
         PEI   $98
         LDA   #$169A
         CLC
         ADC   $3C
         STA   $98
         PLA
         SEC
         SBC   $98
         STA   [$24]
         INC   $24
         INC   $24
         TAX
         DEC
         DEC
         STA   [$98]
         PEA   $0000
         PHX
         PEI   $9A
         PEI   $98
         LDY   #$0002
         LDA   [$3C],Y
         PHA
         LDX   #$0008
         PHK
         PER   L7089+2
L7089    BRL   L047B
         PLA
         BNE   L7092
         BRL   L6DE3
L7092    BRA   L7111
L7094    LDA   $12
         STA   [$30]
         INC   $30
         STZ   $04
L709C    LDA   [$34]
         INC   $34
         AND   #$00FF
         BNE   L70B6
         PER   L70A8+2
L70A8    BRL   L7359
         BCC   L709C
         LDA   #$000D
         STA   [$6E]
         INC   $6E
         BRA   L7111
L70B6    STA   [$6E]
         INC   $6E
         INC   $B2
         CMP   #$0009
         BNE   L70C6
         LDA   #$0020
         BRA   L70CE
L70C6    CMP   #$000A
         BNE   L70CE
         LDA   #$000D
L70CE    INC   $D6
         BNE   L70D4
         INC   $D8
L70D4    STA   [$30]
         LDY   $B2
         CPY   #$0100
         BCC   L70E1
         DEC   $6E
         BRA   L70E3
L70E1    INC   $30
L70E3    TAX
         LDA   $04
         LSR
         TXA
         BCS   L70EF
         CMP   #$003A
         BEQ   L70FB
L70EF    CMP   #$0022
         BNE   L70F6
         INC   $04
L70F6    CMP   #$000D
         BNE   L709C
L70FB    DEC   $30
         PHA
         LSR   $04
         BCC   L7109
         LDA   #$0022
         STA   [$30]
         INC   $30
L7109    LDA   #$0000
         STA   [$30]
         PLA
         BRA   L7114
L7111    LDA   #$000D
L7114    LDY   $B2
         CPY   #$0100
         BCC   L7125
         PEA   $0017
         PHK
         PER   L7122+2
L7122    BRL   L8D82
L7125    CMP   #$000D
         BEQ   L7136
         CMP   #$003A
         BNE   L714A
         LDA   #$0040
         TSB   $A7
         BRA   L714A
L7136    LDY   #$004C
         LDA   [$3C],Y
         INC
         LDY   #$004C
         STA   [$3C],Y
         STZ   $B2
         LDA   $00
         LDY   #$014E
         STA   [$3C],Y
L714A    LDY   #$01B8
         LDA   $D6
         STA   [$3C],Y
         INY
         INY
         LDA   $D8
         STA   [$3C],Y
         LDY   #$0024
         LDA   $34
         STA   [$3C],Y
         LDA   $36
         INY
         INY
         STA   [$3C],Y
         LDA   [$28]
         BNE   L716B
         BRL   L6C35
L716B    DEC   $30
         LDA   [$30]
         AND   #$00FF
         CMP   #$0020
         BEQ   L716B
         INC   $30
         LDA   $00
         STA   [$30]
         LDA   [$28]
         BNE   L7184
         BRL   L6C35
L7184    CLC
         RTL

L7186    LDY   #$000A
         LDA   [$3C],Y
         BNE   L7194
         PHK
         PHK
         PER   L71D3
         BRA   L7199
L7194    PHK
         PHK
         PER   L71D6
L7199    LDY   #$014E
         LDA   [$3C],Y
         BNE   L71A5
         LDY   #$0046
         LDA   [$3C],Y
L71A5    PEA   $0000
         PHA
         PHK
         PHK
         PER   L71D9
         LDY   #$016A
         LDA   [$3C],Y
         CMP   #$003C
         BCC   L71BF
         PHK
         PER   L71BC+2
L71BC    BRL   L08D6
L71BF    LDY   #$000C
         LDA   [$3C],Y
         TAX
         PHK
         PER   L71C9+2
L71C9    BRL   LAF42
         TSC
         CLC
         ADC   #$000C
         TCS
         RTS

L71D3    ASC   '  '00
L71D6    ASC   '+ '00
L71D9    ASC   '%5d%s'00
L71DF    LDA   #$016C
         CLC
         ADC   $3C
         LDY   $3E
         BCC   L71EA
         INY
L71EA    PHY
         PHA
         PHK
         PHK
         PER   L6C16
         LDY   #$000C
         LDA   [$3C],Y
         TAX
         PHK
         PER   L71FB+2
L71FB    BRL   LAF42
         LDY   #$016A
         LDA   [$3C],Y
         INC
         INC
         LDY   #$016A
         STA   [$3C],Y
         PLA
         PLA
         PLA
         PLA
         RTS

L720F    LDY   #$004C
         LDA   [$3C],Y
         BNE   L7217
L7216    RTS

L7217    LDY   #$01A4
         LDA   [$3C],Y
         BEQ   L7216
         TSC
         STA   $DC
         LDY   #$016A
         LDA   [$3C],Y
         CMP   #$0037
         BCC   L7234
         PHK
         PER   L722F+2
L722F    BRL   L08D6
         BRA   L723A
L7234    PER   L7237+2
L7237    BRL   L0865
L723A    PER   L723D+2
L723D    BRL   L7186
         LDY   #$014C
         LDA   [$3C],Y
         PEA   $0000
         PHA
         PEI   $3E
         PEI   $6E
         PHK
         PHK
         PER   L732D
         PHK
         PER   L7256+2
L7256    BRL   L0845
         LDA   $DC
         TCS
         PHK
         PHK
         PER   L7330
         LDY   #$000C
         LDA   [$3C],Y
         TAX
         PHK
         PER   L726B+2
L726B    BRL   LAF42
         PLA
         PLA
         LDA   #$01A4
         CLC
         ADC   $3C
         STA   $DC
         LDA   $00
         ADC   $3E
         STA   $DE
         LDA   [$DC]
         TAX
         DEX
         LDA   #$FFFF
         PHA
L7286    PHX
         INC   $DC
         INC   $DC
         LDA   [$DC]
         XBA
         AND   #$00FF
         TAX
         SEC
         SBC   $03,S
         PEA   $0000
         PHA
         TXA
         STA   $07,S
         PHK
         PHK
         PER   L7337
         LDY   #$000C
         LDA   [$3C],Y
         TAX
         PHK
         PER   L72AB+2
L72AB    BRL   LAF42
         PLA
         PLA
         PLA
         PLA
         PLX
         DEX
         BPL   L7286
         PLA
L72B7    PER   L72BA+2
L72BA    BRL   L0865
         LDA   #$01A4
         CLC
         ADC   $3C
         STA   $DC
         LDA   $00
         ADC   $3E
         STA   $DE
         LDA   [$DC]
         TAX
         DEX
L72CF    PHX
         INC   $DC
         INC   $DC
         LDA   [$DC]
         AND   #$00FF
         PHK
         PER   L72E4
         PEA   $0039
         PEI   $EE
         PEI   $EC
L72E4    RTL

         PHX
         PHA
         LDA   [$DC]
         TAX
         XBA
         AND   #$00FF
         PEA   $0000
         PHA
         TXA
         AND   #$00FF
         PEA   $0000
         PHA
         PHK
         PHK
         PER   L731E
         PHK
         PER   L7303+2
L7303    BRL   L0845
         TSC
         CLC
         ADC   #$0010
         TCS
         PLX
         DEX
         BPL   L72CF
         LDA   $00
         LDY   #$01A4
         STA   [$3C],Y
         PER   L731A+2
L731A    BRL   L0865
         RTS

L731E    ASC   'E%d, c %d: %s'0D00
L732D    ASC   '%s'00
L7330    ASC   '*****>'00
L7337    ASC   '%c^'00
L733B    LDY   #$016A
         LDA   [$3C],Y
         TAX
         INC
         LDY   #$016A
         STA   [$3C],Y
         CPX   #$003C
         BCC   L7353
         PHK
         PER   L7350+2
L7350    BRL   L08D6
L7353    LDY   #$000C
         LDA   [$3C],Y
         RTS

L7359    LDY   #$0020
         LDA   [$3C],Y
         LDY   #$0024
         STA   [$3C],Y
         LDY   #$0022
         LDA   [$3C],Y
         LDY   #$0026
         STA   [$3C],Y
         LDY   #$002C
         LDA   [$3C],Y
         BMI   L73C6
         PEA   $0000
         PEA   $0100
         LDY   #$0022
         LDA   [$3C],Y
         PHA
         DEY
         DEY
         LDA   [$3C],Y
         PHA
         LDY   #$0008
         LDA   [$3C],Y
         PHA
         PHK
         PER   L738F+2
L738F    BRL   LA585
         BCC   L7396
         LDA   $00
L7396    DEC
         LDY   #$002C
         STA   [$3C],Y
         PHA
         PLA
         BMI   L73C6
         INC
         CLC
         LDY   #$0020
         ADC   [$3C],Y
         STA   $34
         LDA   $00
         LDY   #$0022
         ADC   [$3C],Y
         STA   $36
         LDA   $00
         STA   [$34]
         LDY   #$0024
         LDA   [$3C],Y
         STA   $34
         LDY   #$0026
         LDA   [$3C],Y
         STA   $36
         CLC
         RTS

L73C6    SEC
         RTS

L73C8    PER   L73CB+2
L73CB    BRL   L658A
         BIT   $A4
         BPL   L73DC
         LDA   #$0040
         TSB   $8F
         TSB   $93
         ASL
         TRB   $A5
L73DC    LDA   #$2000
         AND   $68
         BNE   L73F9
         LDY   #$0086
         LDA   [$3C],Y
         DEC
         BEQ   L73F9
         BIT   $90
         BMI   L73F9
         PEA   $0029
         PHK
         PER   L73F6+2
L73F6    BRL   L8D82
L73F9    TSC
         STA   $1C
         LDA   #$04F8
         CLC
         ADC   $3C
         STA   $30
         LDA   $00
         ADC   $3E
         STA   $32
         LDY   $30
         STY   $38
         LDY   $32
         STY   $3A
         LDA   [$30]
         TAX
         LDA   #$07AE
         CLC
         ADC   $3C
         STA   $2C
         LDA   $00
         ADC   $3E
         STA   $2E
         LDA   $B0
         BIT   $8E
         BMI   L7430
         SEC
         SBC   [$30]
         INC   $30
         INC   $30
L7430    STA   $C6
         CLC
         ADC   #$0008
         XBA
         AND   #$FF00
         ORA   $20
         STA   [$2C]
         INC   $2C
         INC   $2C
         LDY   #$0BB2
         LDA   [$3C],Y
         INC
         LDY   #$0BB2
         STA   [$3C],Y
         ORA   #$3D00
         STA   [$2C]
         INC   $2C
         INC   $2C
         LDA   $2C
         STA   $6A
         LDA   $00
         STZ   $1A
         TAY
         STZ   $12
         SEP   #$20
L7463    DEX
         BMI   L746F
         LDA   [$30],Y
         BEQ   L746F
         STA   [$2C],Y
         INY
         BRA   L7463
L746F    LDX   $00
         BIT   $88
         BVC   L748F
         DEY
         LDA   [$2C],Y
         CMP   #$20
         BNE   L7483
         LDA   #$28
         STA   [$2C],Y
         INY
         BRA   L748F
L7483    INY
         LDA   #$28
         STA   [$2C],Y
         LDA   [$28]
         CMP   #$20
         BEQ   L74F2
         INY
L748F    LDA   [$28]
         BNE   L7496
         BRL   L753A
L7496    CMP   #$7E
         BNE   L74AE
         PHX
         LDX   $12
         BEQ   L74A2
         STA   [$2C],Y
         INY
L74A2    LDX   $28
         INX
         STX   $12
         PLX
         LDA   #$2C
         STA   [$2C],Y
         BRA   L74C9
L74AE    STA   [$2C],Y
         CMP   #$2C
         BNE   L74C9
         PHX
         LDX   $12
         BEQ   L74C6
         LDA   #$7E
         STA   [$2C],Y
         LDA   #$2C
         INY
         STA   [$2C],Y
         STZ   $12
         STZ   $13
L74C6    PLX
         BRA   L74F2
L74C9    CMP   #$28
         BNE   L74D6
         PER   L74D0+2
L74D0    BRL   L7577
         INX
         BRA   L74F2
L74D6    CMP   #$29
         BNE   L7524
         DEX
         BEQ   L74EC
         BPL   L74F2
         PEA   $0092
         PHK
         PER   L74E6+2
L74E6    BRL   L8D82
         BRL   L75C5
L74EC    BIT   $89
         BPL   L74F2
         BRA   L7519
L74F2    REP   #$20
         INC   $28
         INY
         INC   $B0
         SEP   #$20
         BRA   L748F
L74FD    LDA   [$28]
         BEQ   L753A
         STA   [$2C],Y
         CMP   #$20
         BEQ   L7519
         CMP   #$3D
         BEQ   L7524
         PEA   $0046
         PHK
         PER   L7512+2
L7512    BRL   L8D82
         LDA   #$3D
         BRA   L7524
L7519    REP   #$20
         INC   $28
         INY
         INC   $B0
         SEP   #$20
         BRA   L74FD
L7524    CMP   #$3D
         BNE   L74F2
         PHX
         PLX
         BNE   L74F2
         LDA   #$80
         TRB   $89
         BIT   $8B
         BVC   L74F2
         LDA   #$28
         STA   [$2C],Y
         BRA   L74F2
L753A    DEY
         BEQ   L7543
         LDA   [$2C],Y
         CMP   #$20
         BEQ   L753A
L7543    INY
         PHX
         PLX
         BEQ   L756C
         BMI   L755B
         PER   L754D+1
L754D    BRA   L75A9
         PEA   $0015
         PHK
         PER   L7556+2
L7556    BRL   L8D82
         BRA   L75C5
L755B    PER   L755E+1
L755E    BRA   L75A9
         PEA   $0092
         PHK
         PER   L7567+2
L7567    BRL   L8D82
         BRA   L75C5
L756C    LDX   $12
         BEQ   L75CC
         LDA   #$7E
         STA   [$2C],Y
         INY
         BRA   L75CC
L7577    PHX
         LDX   $12
         BEQ   L758C
         PEI   $28
         STX   $28
         PER   L7583+1
L7583    BRA   L758E
         PLX
         STX   $28
         STZ   $12
         STZ   $13
L758C    PLX
         RTS

L758E    STA   $10
         LDA   #$7E
         STA   [$2C],Y
L7594    LDA   [$28]
         CMP   $10
         BEQ   L75A5
         INY
         STA   [$2C],Y
         INC   $28
         BNE   L7594
         INC   $29
         BRA   L7594
L75A5    INY
         STA   [$2C],Y
         RTS

L75A9    PHP
         PHY
         BRA   L75B2
L75AD    PHP
         PHY
         LDY   #$0000
L75B2    REP   #$20
         PHA
         TYA
         CLC
         ADC   $2C
         SEC
         SBC   $6A
         CLC
         ADC   $C6
         STA   $B0
         PLA
         PLY
         PLP
         RTS

L75C5    REP   #$20
         LDA   $1C
         TCS
         SEC
         RTL

         MX    %10
L75CC    BIT   $89
         BPL   L75E1
         PER   L75D3+1
L75D3    BRA   L75A9
         PEA   $0046
         PHK
         PER   L75DC+2
L75DC    BRL   L8D82
         BRA   L75C5
L75E1    BIT   $8B
         BVS   L75E9
         BIT   $88
         BVC   L75EE
L75E9    LDA   #$29
         STA   [$2C],Y
         INY
L75EE    LDA   $00
         STA   [$2C],Y
L75F2    DEY
         BMI   L75FB
         LDA   [$2C],Y
         CMP   #$20
         BEQ   L75F2
L75FB    INY
         REP   #$20
         LDA   $00
         STA   [$2C],Y
         LDA   $B0
         STA   $10
         LDA   #$07AE
         CLC
         ADC   $3C
         STA   $2C
         LDA   $00
         ADC   $3E
         STA   $2E
         LDA   #$09B0
         CLC
         ADC   $3C
         STA   $30
         LDA   $00
         ADC   $3E
         STA   $32
         LDA   #$04FA
         CLC
         ADC   $3C
         STA   $44
         LDA   $00
         ADC   $3E
         STA   $46
         STZ   $0C
         LDY   $2C
         STY   $14
         LDY   $2E
         STY   $16
         BIT   $88
         BVC   L7643
         LDA   #$0040
         TSB   $88
L7643    LDA   #$0080
         TRB   $A6
         LDA   [$2C]
         TAX
         XBA
         SEC
         SBC   #$0008
         AND   #$00FF
         STA   $B0
         STA   $C6
         INC   $2C
         INC   $2C
         LDA   [$2C]
         BPL   L7669
         AND   #$7FFF
         STA   [$2C]
         LDA   #$0080
         TSB   $A7
L7669    INC   $2C
         INC   $2C
         LDY   $2C
         STY   $6A
         STZ   $18
         LDA   #$00C0
         TRB   $8A
         TXA
         XBA
         ASL
         BCC   L7686
         BMI   L76C7
         LDA   #$0080
         TSB   $8A
         BRA   L76C7
L7686    BPL   L76C7
         TXA
         AND   #$00F0
         CMP   #$0070
         BNE   L76C7
         LDA   #$0040
         TSB   $8A
         BIT   $8A
         BVC   L76A8
         LDA   $B8
         BNE   L76A8
         LDA   #$0003
         STA   $B8
         LDA   #$0080
         TSB   $8B
L76A8    LDA   [$2C]
         XBA
         XBA
         BMI   L76C1
         PER   L76B1+2
L76B1    BRL   L75AD
         PEA   $0045
         PHK
         PER   L76BB+2
L76BB    BRL   L8D82
         BRL   L75C5
L76C1    PER   L76C4+2
L76C4    BRL   L8854
L76C7    TXA
         AND   #$00C0
         BNE   L76D9
         BIT   $87
         BVS   L76D4
         BRL   L777D
L76D4    LDA   #$0040
         TRB   $88
L76D9    INC   $18
         LDA   [$2C]
         CMP   #$A163
         BCC   L76FA
         CMP   #$A863
         BCC   L76F0
         BNE   L76FA
         LDA   #$0080
         TSB   $A7
         BRA   L76FA
L76F0    CMP   #$A264
         BCS   L76FA
         LDA   #$0080
         TSB   $A6
L76FA    BIT   $88
         BVC   L7745
         LDY   #$04F8
         LDA   [$3C],Y
         STA   $12
         TAY
         PER   L7709+2
L7709    BRL   L8A2B
         LDY   $12
         PER   L7711+2
L7711    BRL   L7FEE
         BCC   L7719
         BRL   L75C5
L7719    BIT   $8F
         BVC   L772E
         LDA   #$2928
         STA   [$2C],Y
         INY
         INY
         LDA   $00
         STA   [$2C],Y
         INY
         INY
         LDA   $00
         STA   [$2C],Y
L772E    BIT   $88
         BVC   L7745
         PER   L7735+2
L7735    BRL   L75AD
         PEA   $004C
         PHK
         PER   L773F+2
L773F    BRL   L8D82
         BRL   L75C5
L7745    LDA   [$2C]
         AND   #$00FF
         BNE   L775F
         PER   L774F+2
L774F    BRL   L75AD
         PEA   $0092
         PHK
         PER   L7759+2
L7759    BRL   L8D82
         BRL   L75C5
L775F    CMP   #$0001
         BNE   L776C
         LDA   #$001F
         CLC
         ADC   [$2C]
         STA   [$2C]
L776C    CMP   #$0028
         BEQ   L7777
         INC   $2C
         INC   $B0
         BRA   L7745
L7777    INC   $2C
         INC   $B0
         STA   $0E
L777D    STZ   $12
         STZ   $20
L7781    LDA   [$2C]
         AND   #$00FF
         CMP   #$0020
         BNE   L7791
         INC   $2C
         INC   $B0
         BRA   L7781
L7791    SEP   #$20
         LDY   $00
         LDA   #$13
         STA   $0E
L7799    LDA   $00
         XBA
         LDA   [$2C],Y
         BNE   L77A3
         BRL   L7906
L77A3    PHY
         BMI   L7802
         TAY
         LDA   [$94],Y
         BPL   L77AE
         BRL   L7872
L77AE    BNE   L781E
         LDX   $12
         BNE   L77DD
         TYA
         CMP   #$26
         BEQ   L782A
         BIT   $92
         BPL   L77C9
         LDA   #$80
         TRB   $92
         PLY
         LDA   #$20
         STA   [$2C],Y
         INY
         BRA   L7799
L77C9    PLY
         PER   L77CD+2
L77CD    BRL   L75A9
         PEA   $0002
         PHK
         PER   L77D7+2
L77D7    BRL   L8D82
         BRL   L75C5
L77DD    TYA
         CMP   #$26
         BNE   L77E7
         LDY   $00
         BRL   L7872
L77E7    PER   L77EA+2
L77EA    BRL   L7FD4
         BCS   L7802
         PER   L77F2+2
L77F2    BRL   L75A9
         PEA   $0047
         PHK
         PER   L77FC+2
L77FC    BRL   L8D82
         BRL   L75C5
L7802    LDY   $12
         STA   [$44],Y
         INY
         LDA   $00
         STA   [$44],Y
         STY   $12
         PLY
         INY
         PHY
         LDA   $00
         XBA
         LDA   [$2C],Y
         TAY
         LDA   [$94],Y
         BMI   L7872
         LDY   $00
         BRA   L7872
L781E    LDX   $12
         BNE   L7853
         DEC
         BEQ   L782A
         TYA
         CMP   #$2E
         BNE   L7854
L782A    PLY
         LDX   $12
         PER   L7830+2
L7830    BRL   L8C28
         STX   $12
         BVS   L783A
         BRL   L7799
L783A    LDX   $18
         BEQ   L784E
         PHA
         DEY
         LDA   [$2C],Y
         CMP   #$20
         BEQ   L784A
         INY
         PLA
         BRA   L784E
L784A    PLA
         BRL   L7799
L784E    PHY
         LDY   $00
         BRA   L7872
L7853    TYA
L7854    PLY
         INY
         PHY
         LDY   $12
         CPY   #$0029
         BMI   L7865
         BIT   $8F
         BMI   L7865
         LDY   #$0029
L7865    STA   [$44],Y
         INY
         LDA   $00
         STA   [$44],Y
         STY   $12
         PLY
         BRL   L7799
L7872    LDA   #$C0
         TRB   $8C
         TYA
         PLY
         CMP   #$20
         BNE   L7881
         PER   L787F+1
L787F    BRA   L78B3
L7881    CMP   #$01
         BNE   L7887
         LDA   #$20
L7887    CMP   #$2B
         BNE   L789D
         PER   L788E+2
L788E    BRL   L8A96
         BCC   L7896
         BRL   L7A9F
L7896    LDA   #$70
L7898    STA   [$2C],Y
         PHY
         BRA   L7854
L789D    CMP   #$2D
         BEQ   L78A4
         BRL   L7A9F
L78A4    PER   L78A7+2
L78A7    BRL   L8A96
         BCC   L78AF
         BRL   L7A9F
L78AF    LDA   #$6D
         BRA   L7898
L78B3    PHA
         PHY
         XBA
         LDA   $00
         XBA
L78B9    CMP   #$20
         BNE   L78C6
         INY
         LDA   [$2C],Y
         BEQ   L7903
         BPL   L78B9
         BRA   L7903
L78C6    TYX
         TAY
         LDA   [$94],Y
         BPL   L78D4
         TYA
         PLY
         PHX
         PLY
         PLA
         LDA   [$2C],Y
         RTS

L78D4    BNE   L7903
         PHX
         TYA
         LDY   $12
         STA   [$44],Y
         LDA   $00
         INY
         STA   [$44],Y
         REP   #$20
         PHK
         PER   L78EE
         PEA   $000F
         PEI   $EE
         PEI   $EC
L78EE    RTL

         PLX
         LDA   $00
         SEP   #$20
         BCS   L78FF
         TXY
         LDA   #$20
         STA   [$2C],Y
         INC   $12
         BRA   L78B9
L78FF    LDY   $12
         STA   [$44],Y
L7903    PLY
         PLA
         RTS

L7906    STZ   $20
         LDA   $12
         BEQ   L7928
         LDA   #$C0
         TRB   $8C
         LDA   #$40
         TRB   $8D
         PHY
         PER   L7918+2
L7918    BRL   L7FEE
         PLY
         BCC   L7921
         BRL   L75C5
L7921    BIT   $8C
         BPL   L7928
         BRL   L7D09
L7928    BIT   $A6
         BPL   L793C
         PER   L792F+2
L792F    BRL   L75AD
         PEA   $008D
         PHK
         PER   L7939+2
L7939    BRL   L8D82
L793C    LDA   #$80
         TRB   $8B
         LSR
         TRB   $8F
         INY
         LDA   [$2C],Y
         BEQ   L794B
         BRL   L7A3B
L794B    REP   #$20
         DEY
         LDA   $1A
         BNE   L7999
         LDA   $0C
         BEQ   L7974
         LDA   #$09B0
         CLC
         ADC   $3C
         STA   $2C
         LDA   $00
         ADC   $3E
         STA   $2E
         LDA   #$07AE
         CLC
         ADC   $3C
         STA   $30
         LDA   $00
         ADC   $3E
         STA   $32
         BRA   L7990
L7974    LDA   #$07AE
         CLC
         ADC   $3C
         STA   $2C
         LDA   $00
         ADC   $3E
         STA   $2E
         LDA   #$09B0
         CLC
         ADC   $3C
         STA   $30
         LDA   $00
         ADC   $3E
         STA   $32
L7990    LDA   $10
         STA   $B0
         LDA   $1C
         TCS
         CLC
         RTL

L7999    LDA   #$0100
         STA   [$30]
         INC   $30
         INC   $30
         LDA   [$14]
         STA   [$30]
         INC   $14
         INC   $14
         INC   $30
         INC   $30
         LDA   [$14]
         STA   [$30]
         INC
         INC
         INC   $30
         INC   $30
         INC   $14
         INC   $14
         LDY   $00
         SEP   #$20
L79C0    LDA   [$14],Y
         STA   [$30],Y
         BEQ   L79C9
L79C6    INY
         BRA   L79C0
L79C9    INY
         LDA   [$14],Y
         BEQ   L79D9
         LDA   #$01
         STA   [$30],Y
         INY
         LDA   [$14],Y
         STA   [$30],Y
         BRA   L79C6
L79D9    DEY
         REP   #$20
         LDA   $00
         STA   [$30],Y
         STA   $1A
         LDA   $0C
         BNE   L7A10
         INC
         STA   $0C
         LDA   #$09B0
         CLC
         ADC   $3C
         STA   $2C
         LDA   $00
         ADC   $3E
         STA   $2E
         LDA   #$07AE
         CLC
         ADC   $3C
         STA   $30
         LDA   $00
         ADC   $3E
         STA   $32
         LDY   $2C
         STY   $14
         LDY   $2E
         STY   $16
         BRL   L7643
L7A10    LDA   $00
         STA   $0C
         LDA   #$07AE
         CLC
         ADC   $3C
         STA   $2C
         LDA   $00
         ADC   $3E
         STA   $2E
         LDA   #$09B0
         CLC
         ADC   $3C
         STA   $30
         LDA   $00
         ADC   $3E
         STA   $32
         LDY   $2C
         STY   $14
         LDY   $2E
         STY   $16
         BRL   L7643
L7A3B    DEC
         BNE   L7A4D
         INY
L7A3F    INY
         LDA   [$2C],Y
         BNE   L7A3F
         INY
         LDA   [$2C],Y
         BNE   L7A3B
         DEY
         BRL   L7928
         MX    %10
L7A4D    LDA   #$01
         STA   [$2C],Y
         INY
         REP   #$20
         TYA
         CLC
         ADC   $2C
         STA   $2C
         LDA   $00
         ADC   $2E
         STA   $2E
         BRL   L7643
         MX    %10
L7A63    PHA
         PLA
         BEQ   L7A6A
         STA   [$2C],Y
         INY
L7A6A    DEY
         CMP   #$2C
         BNE   L7A75
         BIT   $8A
         BVC   L7A75
         INC   $B6
L7A75    INY
         LDA   [$2C],Y
         CMP   #$20
         BEQ   L7A75
         REP   #$20
         STZ   $20
         TYA
         CLC
         ADC   $B0
         STA   $B0
         TYA
         CLC
         ADC   $2C
         STA   $2C
         LDA   $00
         ADC   $2E
         STA   $2E
         STZ   $12
         LDY   $00
         SEP   #$20
         LDA   #$40
         TRB   $8C
         BRL   L7799
L7A9F    CMP   #$7E
         BNE   L7AA9
         PHA
         LDA   #$40
         TSB   $8C
         PLA
L7AA9    LDX   $18
         BNE   L7AB0
         BRL   L7BCD
L7AB0    LDX   $00
L7AB2    CMP   #$20
         BNE   L7ABE
         INY
         TYX
         LDA   [$2C],Y
         BNE   L7AB2
         BRA   L7B1A
L7ABE    BIT   $8D
         BVC   L7AC6
         CMP   #$3B
         BEQ   L7ACE
L7AC6    PHA
         PLA
         BEQ   L7ACE
         CMP   #$2C
         BNE   L7AE5
L7ACE    STZ   $20
         PER   L7AD3+2
L7AD3    BRL   L7FEE
         BCC   L7ADB
         BRL   L75C5
L7ADB    BIT   $8C
         BPL   L7AE2
         BRL   L7D09
L7AE2    BRL   L7A63
L7AE5    CMP   #$29
         BNE   L7B2D
L7AE9    INY
         LDA   [$2C],Y
         BEQ   L7B01
         PER   L7AF1+2
L7AF1    BRL   L75A9
         PEA   $005E
         PHK
         PER   L7AFB+2
L7AFB    BRL   L8D82
         BRL   L75C5
L7B01    DEY
         STZ   $20
         PER   L7B07+2
L7B07    BRL   L7FEE
         BCC   L7B0F
         BRL   L75C5
L7B0F    INY
         BIT   $8C
         BPL   L7B17
         BRL   L7D09
L7B17    BRL   L7928
L7B1A    PER   L7B1D+2
L7B1D    BRL   L75AD
         PEA   $0045
         PHK
         PER   L7B27+2
L7B27    BRL   L8D82
         BRL   L75C5
L7B2D    PHX
         PLX
         BEQ   L7B45
         PER   L7B34+2
L7B34    BRL   L7FD4
         BCS   L7B45
         CPX   #$0005
         BEQ   L7B45
         LDA   #$2C
         DEY
         STA   [$2C],Y
         BRA   L7ACE
L7B45    CMP   #$28
         BEQ   L7B4F
         LDX   #$0004
         BRL   L7D0B
L7B4F    BIT   $91
         BPL   L7B92
L7B53    INY
         LDA   [$2C],Y
         CMP   #$20
         BEQ   L7B53
         CMP   #$29
         BEQ   L7B79
         CMP   #$30
         BCC   L7B66
         CMP   #$3A
         BCC   L7B53
L7B66    PER   L7B69+2
L7B69    BRL   L75A9
         PEA   $0079
         PHK
         PER   L7B73+2
L7B73    BRL   L8D82
         BRL   L75C5
L7B79    LDA   #$40
         TSB   $8C
L7B7D    INY
         LDA   [$2C],Y
         BEQ   L7B66
         CMP   #$2C
         BNE   L7B89
         BRL   L7ACE
L7B89    CMP   #$29
         BNE   L7B90
         BRL   L7AE9
L7B90    BRA   L7B7D
L7B92    LDX   #$0004
         LDA   $12
         BEQ   L7BB8
         CMP   #$02
         BEQ   L7BA4
         CMP   #$04
         BEQ   L7BA4
         BRL   L7D0B
L7BA4    PER   L7BA7+2
L7BA7    BRL   L7F83
         LDX   #$0004
         BCC   L7BB2
         BRL   L7D0B
L7BB2    LDX   #$00C5
         BRL   L7D0B
L7BB8    PER   L7BBB+2
L7BBB    BRL   L8A2B
         LDA   #$02
         CMP   $20
         BEQ   L7BC7
         BRL   L7D0B
L7BC7    LDX   #$00C1
         BRL   L7D0B
L7BCD    LDX   $12
         CPX   #$0002
         BMI   L7BE7
         CPX   #$0004
         BPL   L7BE7
         PER   L7BDC+2
L7BDC    BRL   L8ABE
         BCS   L7BE7
         DEY
         LDA   [$2C],Y
         BRL   L7A63
L7BE7    STZ   $20
         STZ   $21
         PER   L7BEE+2
L7BEE    BRL   L7F83
         BCC   L7C39
         CMP   #$28
         BEQ   L7C29
         PER   L7BFA+2
L7BFA    BRL   L7FEE
         BCC   L7C02
         BRL   L75C5
L7C02    BIT   $8C
         BPL   L7C09
         BRL   L7D09
L7C09    CMP   #$2F
         BEQ   L7C11
         CMP   #$5E
         BNE   L7C20
L7C11    PHA
         REP   #$20
         LDA   #$0001
         PER   L7C1A+2
L7C1A    BRL   L8874
         SEP   #$20
         PLA
L7C20    PER   L7C23+2
L7C23    BRL   L8BA0
         BRL   L7A63
L7C29    PER   L7C2C+2
L7C2C    BRL   L8A2B
         LDA   #$02
         CMP   $20
         BNE   L7C59
         LDA   $12
         BNE   L7C59
L7C39    LDX   #$00C1
         LDA   $12
         BEQ   L7C43
         LDX   #$00C5
L7C43    BRL   L7D0B
L7C46    PER   L7C49+2
L7C49    BRL   L75AD
         PEA   $0012
         PHK
         PER   L7C53+2
L7C53    BRL   L8D82
         BRL   L75C5
L7C59    LDA   $12
         BNE   L7C9F
         LDX   #$0004
         XBA
         BIT   $8B
         BPL   L7C70
         LDA   #$03
         AND   $8B
         ORA   #$04
         TAX
         LDA   #$80
         TRB   $8B
L7C70    LDA   $20
         BEQ   L7C7A
         DEC   $20
         BEQ   L7C7A
         BRA   L7C46
L7C7A    LDA   #$28
         PHY
L7C7D    CMP   [$2C],Y
         BEQ   L7C98
         DEY
         BPL   L7C7D
         PLY
         PER   L7C88+2
L7C88    BRL   L75AD
         PEA   $0045
         PHK
         PER   L7C92+2
L7C92    BRL   L8D82
         BRL   L75C5
L7C98    LDA   #$20
         STA   [$2C],Y
         PLY
         BRA   L7D0B
L7C9F    PER   L7CA2+2
L7CA2    BRL   L7FEE
         BCC   L7CAA
         BRL   L75C5
L7CAA    BIT   $1E
         BPL   L7D09
         BVS   L7D09
         BIT   $90
         BPL   L7CC3
         BVS   L7CC3
         LDA   $20
         BNE   L7CC3
         STA   [$2C],Y
         INY
         STA   [$2C],Y
         DEY
         BRL   L7906
L7CC3    LDA   #$3C
         TRB   $1E
         LDA   #$03
         AND   $1E
         ASL
         ASL
         TSB   $1E
         BIT   $8F
         BPL   L7CD9
         LDA   #$10
         TSB   $1E
         BRA   L7D09
L7CD9    BIT   $93
         BVC   L7CE1
         BIT   $8F
         BVS   L7CE9
L7CE1    BIT   $A7
         BMI   L7CE9
         BIT   $8D
         BPL   L7D09
L7CE9    LDA   #$03
         AND   $1E
         TRB   $1E
         CMP   #$03
         BEQ   L7CF5
         LDA   #$01
L7CF5    BIT   $A7
         BMI   L7CFD
         BIT   $93
         BVC   L7CFF
L7CFD    ORA   #$10
L7CFF    ORA   #$20
         TSB   $1E
         LDA   #$80
         TRB   $8D
         TRB   $A7
L7D09    LDX   $1E
L7D0B    REP   #$20
         BIT   $89
         BPL   L7D22
         TXA
         AND   #$00FC
         CMP   #$0004
         BNE   L7D22
         TXA
         AND   #$FFC0
         ORA   #$0020
         TAX
L7D22    BIT   $89
         BVC   L7D3C
         LDA   $B4
         CLC
         ADC   $B6
         TAY
         LDA   [$E0],Y
         BIT   $62
         BPL   L7D34
         LDA   $00
L7D34    ORA   #$FFFC
         STX   $02
         AND   $02
         TAX
L7D3C    STX   $1E
         LDA   $00
         STA   $12
         LDY   $2C
         STY   $48
         LDY   $2E
         STY   $4A
         LDA   #$0200
         STA   [$30]
         LDA   $1A
         BEQ   L7D57
         INC   $30
         INC   $30
L7D57    LDA   [$2C]
         AND   #$00FF
         INC   $2C
         CMP   #$0020
         BEQ   L7D57
         DEC   $2C
         INC   $1A
         TXA
         XBA
         AND   #$FF00
         ORA   #$0008
         PER   L7D72+2
L7D72    BRL   L75AD
         CLC
         ADC   $B0
         XBA
         STA   [$30]
         INC   $30
         INC   $30
         LDY   #$0BB2
         LDA   [$3C],Y
         INC
         LDY   #$0BB2
         STA   [$3C],Y
         ORA   #$3D00
         BIT   $A6
         BPL   L7D94
         ORA   #$8000
L7D94    STA   [$30]
         INC   $30
         INC   $30
         STZ   $20
         LDA   $18
         BNE   L7DAD
         LDA   $1E
         AND   #$00C0
         BNE   L7DAD
         BIT   $8B
         BMI   L7DAD
         INC   $20
L7DAD    LDY   $00
         TYX
         SEP   #$20
L7DB2    LDA   [$2C],Y
         BNE   L7DC9
         PER   L7DB9+2
L7DB9    BRL   L75AD
         PEA   $0045
         PHK
         PER   L7DC3+2
L7DC3    BRL   L8D82
         BRL   L75C5
L7DC9    PHY
         TXY
         STA   [$30],Y
         PLY
         BIT   $8C
         BPL   L7DEC
         PHA
         PLA
         BPL   L7DEC
         PHY
         TXY
         INY
         LDA   #$28
         STA   [$30],Y
         INY
         LDA   #$29
         STA   [$30],Y
         TYX
         PLY
         LDA   #$20
         STA   [$2C],Y
         INX
         INY
         BRA   L7E52
L7DEC    BIT   $8D
         BVC   L7DF4
         CMP   #$3B
         BEQ   L7E3E
L7DF4    CMP   #$2D
         BEQ   L7E2C
         BCS   L7E00
         CMP   #$28
         BNE   L7E08
         INC   $20
L7E00    LDA   #$20
         STA   [$2C],Y
         INX
         INY
         BRA   L7DB2
L7E08    CMP   #$29
         BNE   L7E26
         DEC   $20
         BEQ   L7E14
         BPL   L7E00
         BRA   L7E52
L7E14    LDA   $18
         BNE   L7E00
         LDA   #$20
         STA   [$2C],Y
         INY
         LDA   $1E
         AND   #$C0
         BEQ   L7E52
         INX
         BRA   L7E52
L7E26    CMP   #$2C
         BNE   L7E00
         BRA   L7E3E
L7E2C    BIT   $1E
         BPL   L7E00
         BVC   L7E00
         LDA   $20
         BNE   L7E00
         LDA   $18
         BEQ   L7E00
         LDA   #$12
         STA   [$2C],Y
L7E3E    LDA   $20
         BNE   L7E00
         LDA   $18
         BEQ   L7E00
         INY
L7E47    LDA   [$2C],Y
         CMP   #$20
         BNE   L7E52
         STA   [$30],Y
         INY
         BRA   L7E47
L7E52    PHY
         LDY   #$0BB2
         LDA   [$3C],Y
         ORA   #$80
         XBA
         BIT   $1E
         BPL   L7E81
         BVC   L7E73
         LDA   #$3C
         AND   $1E
         BEQ   L7E6B
         LDA   #$6D
         BRA   L7E85
L7E6B    LDA   #$6C
         BRA   L7E85
L7E6F    LDA   #$6B
         BRA   L7E85
L7E73    LDA   $1E
         BIT   #$20
         BEQ   L7E7D
         LDA   #$68
         BRA   L7E85
L7E7D    LDA   #$6A
         BRA   L7E85
L7E81    BVS   L7E6F
         LDA   #$69
L7E85    PLY
         REP   #$20
         STA   [$48]
         PHY
         BIT   $8A
         BPL   L7E9F
         LDY   $B8
         BNE   L7E9F
         XBA
         AND   #$00FF
         ORA   #$1300
         LDY   #$0001
         STA   [$48],Y
L7E9F    PLY
         TYA
         CLC
         ADC   $B0
         STA   $B0
         TYA
         CLC
         ADC   $2C
         STA   $2C
         LDA   $00
         ADC   $2E
         STA   $2E
         PHX
         TYX
         PLY
L7EB5    DEY
         BMI   L7EC2
         LDA   [$30],Y
         AND   #$00FF
         CMP   #$0020
         BEQ   L7EB5
L7EC2    LDA   #$00C0
         AND   $1E
         BNE   L7EF5
         PHK
         PER   L7ECD+1
L7ECD    BRA   L7F0F
         PHY
         PLY
         BPL   L7EF5
         DEC   $1A
         BEQ   L7EDB
         DEC   $30
         DEC   $30
L7EDB    DEC   $30
         DEC   $30
         DEC   $30
         DEC   $30
         LDA   #$2020
         STA   [$48]
         LDY   #$0BB2
         LDA   [$3C],Y
         DEC
         LDY   #$0BB2
         STA   [$3C],Y
         BRA   L7F02
L7EF5    INY
         TYA
         CLC
         ADC   $30
         STA   $30
         LDA   $00
         ADC   $32
         STA   $32
L7F02    LDA   $00
         STA   [$30]
         STZ   $20
         SEP   #$20
         LDY   $00
         BRL   L7799
L7F0F    PHY
         SEP   #$20
L7F12    PHY
         PLY
         BMI   L7F7F
         LDA   [$30]
         CMP   #$20
         BNE   L7F20
         PLX
         INX
         BRA   L7F50
L7F20    LDA   [$30],Y
         CMP   #$29
         BNE   L7F7F
         LDA   [$30]
         CMP   #$28
         BNE   L7F7F
         TYX
         LDY   $00
         STZ   $20
         DEX
         BNE   L7F39
         PLY
         DEY
         DEY
         BRA   L7F69
L7F39    LDA   [$30],Y
         CMP   #$28
         BNE   L7F43
         INC   $20
         BRA   L7F4B
L7F43    CMP   #$29
         BNE   L7F4B
         DEC   $20
         BEQ   L7F7F
L7F4B    INY
         DEX
         BPL   L7F39
         PLX
L7F50    PHX
         LDY   #$0001
L7F54    LDA   [$30],Y
         DEY
         STA   [$30],Y
         INY
         INY
         DEX
         BNE   L7F54
         PLY
         DEY
L7F60    DEY
         BMI   L7F69
         LDA   [$30],Y
         CMP   #$20
         BEQ   L7F60
L7F69    PHY
         LDX   $30
         DEX
         DEX
         DEX
         STX   $30
         LDA   [$30]
         INC
         STA   [$30]
         LDX   $30
         INX
         INX
         INX
         STX   $30
         BRA   L7F12
L7F7F    REP   #$20
         PLY
         RTL

L7F83    PHA
         PHY
         CPY   #$0004
         BMI   L7FCE
         REP   #$20
         LDA   [$44]
         CMP   #$8564
         BEQ   L7FA2
         CMP   #$5453
         BNE   L7FCE
         LDY   #$0002
         LDA   [$44],Y
         CMP   #$5045
         BNE   L7FCE
L7FA2    PLY
         DEY
         PHY
         SEP   #$20
L7FA7    INY
         LDA   [$2C],Y
         CMP   #$20
         BEQ   L7FA7
         CMP   #$28
         BNE   L7FCE
         PER   L7FB5+2
L7FB5    BRL   L8A2B
         LDA   #$02
         CMP   $20
         BNE   L7FCE
         PLX
         PHY
         TXY
         LDA   #$20
L7FC3    STA   [$2C],Y
         DEY
         BPL   L7FC3
         PLY
         PLA
         LDA   #$28
         CLC
         RTS

L7FCE    SEP   #$20
         PLY
         PLA
         SEC
         RTS

L7FD4    LDX   $12
         BNE   L7FF0
         SEC
         RTS

L7FDA    PHK
         PER   L7FE5
         PEA   $0018
         PEI   $EE
         PEI   $EC
L7FE5    RTL

         BCC   L7FEB
         BRL   L884D
L7FEB    BRL   L8837
L7FEE    LDX   $00
L7FF0    PHP
         REP   #$20
         PHA
         PHY
         LDA   #$04F8
         CLC
         ADC   $3C
         STA   $38
         LDA   $00
         ADC   $3E
         STA   $3A
         LDA   $12
         BNE   L800A
         BRL   L8837
L800A    CMP   #$0029
         BMI   L801F
         PER   L8012+2
L8012    BRL   L75AD
         PEA   $000F
         PHK
         PER   L801C+2
L801C    BRL   L8D82
L801F    STA   [$38]
         INC
         INC
         TAY
         LDA   $00
         STA   [$38],Y
         LDY   #$0002
         TXA
         BNE   L7FDA
         SEP   #$20
L8030    LDA   [$38],Y
         BMI   L8067
         BEQ   L8067
         TYX
         TAY
         LDA   [$94],Y
         BNE   L8060
         TYA
         CMP   #$26
         BNE   L8048
         CPX   #$0002
         BNE   L804E
         BRA   L8060
L8048    TXY
         INY
         LDA   [$38],Y
         BEQ   L8067
L804E    PER   L8051+2
L8051    BRL   L75AD
         PEA   $0002
         PHK
         PER   L805B+2
L805B    BRL   L8D82
         BRA   L8067
L8060    TXY
         INY
         CPY   #$0029
         BMI   L8030
L8067    REP   #$20
         LDY   #$0001
         LDA   [$38],Y
         BPL   L8073
         BRL   L8837
L8073    XBA
         AND   #$00FF
         TAY
         CMP   #$002E
         BEQ   L808D
         CMP   #$0026
         BEQ   L808D
         LDA   [$94],Y
         AND   #$00FF
         DEC
         BEQ   L808D
         BRL   L8147
L808D    BIT   $8B
         BVS   L8095
         LDA   $20
         BEQ   L80A8
L8095    PER   L8098+2
L8098    BRL   L75AD
         PEA   $0049
         PHK
         PER   L80A2+2
L80A2    BRL   L8D82
         BRL   L884D
L80A8    BIT   $8A
         BPL   L80BC
         PER   L80AF+2
L80AF    BRL   L75AD
         PEA   $0062
         PHK
         PER   L80B9+2
L80B9    BRL   L8D82
L80BC    PEI   $3A
         PEI   $38
         LDA   $00
         BIT   $72
         BPL   L80C9
         LDA   #$0080
L80C9    ORA   #$0113
         TAX
         PHK
         PER   L80D5
         PEI   $FA
         PEI   $F8
L80D5    RTL

         PLY
         PLY
         BCC   L80DD
         BRL   L883E
L80DD    BIT   $72
         BPL   L80EA
         TXA
         DEC
         BNE   L80EA
         STZ   $08
         STZ   $0A
         INX
L80EA    TXA
         PER   L80EE+2
L80EE    BRL   L8874
         TXA
         BNE   L80FD
         LDX   #$00FF
         PEI   $04
         PHX
         BRL   L8363
L80FD    CLC
         ADC   #$816E
         PHA
         LDY   #$0C8A
         LDA   [$3C],Y
         ASL
         ASL
         TAY
         DEX
         BEQ   L8119
         LDA   $08
         STA   [$BE],Y
         INY
         INY
         LDA   $0A
         STA   [$BE],Y
         INY
         INY
L8119    LDA   $04
         STA   [$BE],Y
         INY
         INY
         LDA   $06
         STA   [$BE],Y
         LDY   #$0C8A
         LDA   [$3C],Y
         PHA
         INC
         DEX
         BMI   L812E
         INC
L812E    LDY   #$0C8A
         STA   [$3C],Y
         PLA
         XBA
         CLC
         ADC   $01,S
         PLY
         LDY   #$0002
         STA   [$38],Y
         PLY
         PHY
         DEY
         DEY
         STA   [$2C],Y
         BRL   L820D
L8147    DEC
         DEC
         BNE   L814E
         BRL   L8837
L814E    BIT   $91
         BVC   L8155
         BRL   L8437
L8155    PHK
         PER   L8160
         PEA   $000F
         PEI   $EE
         PEI   $EC
L8160    RTL

         BCC   L8166
         BRL   L821F
L8166    TAY
         AND   #$00FF
         CMP   #$001F
         BEQ   L8183
         CMP   #$0028
         BNE   L817E
         BIT   $72
         BPL   L8188
         LDX   #$0A28
         TXY
         BRA   L8188
L817E    CMP   #$002A
         BNE   L8188
L8183    LDA   #$0080
         TSB   $92
L8188    BIT   $8A
         BPL   L818F
         BRL   L8252
L818F    BIT   $8B
         BVS   L8198
         LDA   #$0080
         TSB   $8C
L8198    TYA
         LDX   #$8063
         AND   #$0F00
         XBA
         ASL
         ASL
         ORA   #$0040
         STA   $1E
         CMP   #$0050
         BEQ   L81E8
         CMP   #$0054
         BEQ   L81F8
         CMP   #$0058
         BEQ   L81F8
         LDA   #$000F
         TRB   $1E
         TYA
         XBA
         AND   #$0003
         CMP   #$0003
         BNE   L81C7
         TSB   $1E
L81C7    PER   L81CA+2
L81CA    BRL   L8874
         TYA
         AND   #$3000
         XBA
         LSR
         LSR
         TSB   $1E
         TYA
         AND   #$0C00
         CMP   #$0800
         BNE   L81F8
         TYA
         XBA
         AND   #$0003
         TSB   $1E
         BRA   L81F8
L81E8    PHY
         LDA   #$0001
         BIT   $72
         BPL   L81F1
         INC
L81F1    PER   L81F4+2
L81F4    BRL   L8874
         PLY
L81F8    TYA
         AND   #$00FF
         LDY   #$0002
         XBA
         CLC
         STX   $02
         ADC   $02
         STA   [$38],Y
         PLY
         PHY
         DEY
         DEY
         STA   [$2C],Y
L820D    SEP   #$20
         LDA   #$20
L8211    DEY
         BMI   L8218
         STA   [$2C],Y
         BRA   L8211
L8218    LDA   #$02
         STA   $12
         BRL   L8837
         MX    %00
L821F    PHK
         PER   L822A
         PEA   $0018
         PEI   $EE
         PEI   $EC
L822A    RTL

         BCS   L8240
         TAY
         BIT   $8E
         BVS   L823A
         LDA   $20
         BNE   L8252
         BIT   $8A
         BMI   L8252
L823A    TYA
         LDX   #$8064
         BRA   L81F8
L8240    BIT   $A5
         BMI   L8282
         PHK
         PER   L824F
         PEA   $000C
         PEI   $EE
         PEI   $EC
L824F    RTL

         BCS   L8265
L8252    PER   L8255+2
L8255    BRL   L75AD
         PEA   $0047
         PHK
         PER   L825F+2
L825F    BRL   L8D82
         BRL   L884D
L8265    BIT   $8B
         BVC   L826C
         BRL   L8437
L826C    LDY   #$0002
         LDA   [$38],Y
         CMP   #$4E46     ; FN
         BNE   L8279
         BRL   L8437
L8279    BIT   $88
         BVC   L8280
         BRL   L8437
L8280    BRA   L82C2
L8282    LDY   #$0008
         PHK
         PER   L8290
         PEA   $0015
         PEI   $EE
         PEI   $EC
L8290    RTL

         BCC   L82BA
         PER   L8296+2
L8296    BRL   L8976
         BEQ   L82B2
         LDY   #$0008
         PHK
         PER   L82A9
         PEA   $0015
         PEI   $EE
         PEI   $EC
L82A9    RTL

         BCC   L82BA
         PER   L82AF+2
L82AF    BRL   L8A04
L82B2    LDA   #$0040
         TSB   $8C
         BRL   L8437
L82BA    LDA   #$0080
         TRB   $A6
         BRL   L834A
L82C2    BIT   $8A
         BVC   L8315
         LDY   #$0002
         LDA   [$38],Y
         ORA   #$0020
         STA   [$38],Y
         LDY   #$0006
         PHK
         PER   L82DE
         PEA   $0015
         PEI   $EE
         PEI   $EC
L82DE    RTL

         PHY
         LDY   #$0002
         LDA   [$38],Y
         AND   #$FFDF
         STA   [$38],Y
         PLY
         BCC   L82FE
         BIT   $8A
         BPL   L8315
         PHY
         LDY   #$0002
         ORA   #$0020
         STA   [$38],Y
         PLY
         BRL   L83B2
L82FE    BIT   $8A
         BPL   L834A
         PER   L8305+2
L8305    BRL   L75AD
         PEA   $0063
         PHK
         PER   L830F+2
L830F    BRL   L8D82
         BRL   L884D
L8315    LDY   #$0006
         PHK
         PER   L8323
         PEA   $0015
         PEI   $EE
         PEI   $EC
L8323    RTL

         BCC   L834A
         PER   L8329+2
L8329    BRL   L8976
         BNE   L8331
         BRL   L83B2
L8331    LDY   #$0006
         PHK
         PER   L833F
         PEA   $0015
         PEI   $EE
         PEI   $EC
L833F    RTL

         BCC   L834A
         PER   L8345+2
L8345    BRL   L8A04
         BRA   L83B2
L834A    LDA   #$1000
         BIT   $68
         BEQ   L8361
         PER   L8354+2
L8354    BRL   L75AD
         PEA   $0079
         PHK
         PER   L835E+2
L835E    BRL   L8D82
L8361    PHY
         PHX
L8363    LDA   $01,S
         ASL
         ASL
         STA   $1E
         LSR
         LSR
         AND   #$0003
         PER   L8371+2
L8371    BRL   L8874
         TSB   $1E
         LDY   #$0C8A
         LDA   [$3C],Y
         ASL
         ASL
         TAY
         PLA
         STA   [$BE],Y
         INY
         INY
         PLA
         STA   [$BE],Y
         BIT   $8F
         BVS   L838E
         BIT   $8D
         BPL   L8395
L838E    STA   $D2
         LDA   #$0080
         TRB   $8E
L8395    LDY   #$0C8A
         LDA   [$3C],Y
         INC
         LDY   #$0C8A
         STA   [$3C],Y
         ORA   #$0080
         LDY   #$0002
         STA   [$38],Y
         PLY
         PHY
         DEY
         SEP   #$20
         STA   [$2C],Y
         BRL   L820D
         MX    %00
L83B2    LDA   $12
         CLC
         ADC   #$000A
         TAX
         PHK
         PER   L83C4
         PEA   $0021
         PEI   $EE
         PEI   $EC
L83C4    RTL

         PHY
         LDX   #$0002
         PER   L83CC+2
L83CC    BRL   L890F
         PHX
         INY
         INY
         PHY
         LDA   $68
         XBA
         PLY
         STA   [$E0],Y
         LDA   $00
         PER   L83DE+2
L83DE    BRL   L888B
         INY
         INY
         STA   [$E0],Y
         INY
         INY
         TXA
         STA   [$E0],Y
         PLX
         INY
         INY
         PHY
         BIT   $90
         BMI   L83F6
         BIT   $8A
         BPL   L840D
L83F6    LDA   $B4
         BIT   $62
         BMI   L840B
         CLC
         ADC   $B6
         TAY
         LDA   [$E0],Y
         AND   #$FF00
         STX   $02
         ORA   $02
         STA   [$E0],Y
L840B    PLY
         PHY
L840D    LDY   $38
         STY   $48
         LDY   $3A
         STY   $4A
         PLY
         TXA
         PHX
         STA   [$E0],Y
         INY
         LDA   $12
         TAX
         STA   [$E0],Y
         INY
         LDA   #$0001
         STA   [$48]
         INC   $48
         INC   $48
L842A    LDA   [$48]
         STA   [$E0],Y
         INY
         INC   $48
         DEX
         BNE   L842A
         BRL   L8363
L8437    BIT   $8A
         BPL   L8442
         LDY   $B8
         BEQ   L8442
         BRL   L8252
L8442    BIT   $8B
         BVS   L846A
         LDY   #$0006
         PHK
         PER   L8454
         PEA   $0015
         PEI   $EE
         PEI   $EC
L8454    RTL

         BCS   L846A
         PER   L845A+2
L845A    BRL   L75AD
         PEA   $004D
         PHK
         PER   L8464+2
L8464    BRL   L8D82
         BRL   L884D
L846A    LDY   #$0008
         PHK
         PER   L8478
         PEA   $0015
         PEI   $EE
         PEI   $EC
L8478    RTL

         BCC   L84A7
         BIT   $8F
         BVC   L8482
         BRL   L86A5
L8482    PER   L8485+2
L8485    BRL   L8976
         BNE   L848D
         BRL   L86A5
L848D    LDY   #$0008
         PHK
         PER   L849B
         PEA   $0015
         PEI   $EE
         PEI   $EC
L849B    RTL

         BCC   L84A7
         PER   L84A1+2
L84A1    BRL   L8A04
         BRL   L86A5
L84A7    LDA   #$1000
         BIT   $68
         BEQ   L84C2
         BIT   $90
         BVS   L84C2
         PER   L84B5+2
L84B5    BRL   L75AD
         PEA   $0079
         PHK
         PER   L84BF+2
L84BF    BRL   L8D82
L84C2    PHY
         PHX
         BIT   $88
         BVS   L84CB
         BRL   L8577
L84CB    INY
         INY
         INY
         LDA   [$E0],Y
         AND   #$00FF
         CMP   $20
         BEQ   L84E7
         PER   L84DA+2
L84DA    BRL   L75AD
         PEA   $0019
         PHK
         PER   L84E4+2
L84E4    BRL   L8D82
L84E7    CLC
         STY   $02
         ADC   $02
         CLC
         ADC   #$0007
         PHA
         INY
         INY
         INY
         INY
         INY
         INY
         LDA   [$E0],Y
         AND   #$00FF
         CLC
         ADC   $01,S
         STA   $C8
         PLA
         LDA   #$4000
         TRB   $88
         DEY
         LDA   [$E0],Y
         AND   #$003C
         LSR
         LSR
         DEC
         DEC
         BEQ   L8529
         DEC
         BEQ   L8529
         PER   L8519+2
L8519    BRL   L75AD
         PEA   $004D
         PHK
         PER   L8523+2
L8523    BRL   L8D82
         BRL   L8363
L8529    BIT   $90
         BVC   L8584
         LDA   $91
         AND   #$0001
         ASL
         ASL
         ORA   $01,S
         STA   $01,S
         AND   #$0004
         ORA   [$E0],Y
         STA   [$E0],Y
         DEY
         DEY
         DEY
         DEY
         LDA   [$E0],Y
         BEQ   L8557
         PER   L854A+2
L854A    BRL   L75AD
         PEA   $0021
         PHK
         PER   L8554+2
L8554    BRL   L8D82
L8557    PHY
         LDY   #$0086
         LDA   [$3C],Y
         PLY
         STA   [$E0],Y
         LDA   #$0040
         TRB   $91
         TSB   $8A
         LDA   $03,S
         CLC
         ADC   #$000A
         CLC
         ADC   $12
         STA   $B4
         STZ   $B6
         BRL   L8363
L8577    BIT   $8B
         BVS   L8584
         BIT   $91
         BVS   L8584
         LDA   #$0080
         TSB   $8C
L8584    LDA   $03,S
         TAY
         INY
         INY
         INY
         BIT   $91
         BVC   L8591
         BRL   L8661
L8591    LDA   [$E0],Y
         AND   #$00FF
         BIT   $8E
         BPL   L85E8
         LDA   [$E0],Y
         AND   #$00FF
         BEQ   L85CB
         CMP   #$00FF
         BNE   L85D6
         BIT   $68
         BVS   L85E5
         PHY
         INY
         INY
         INY
         INY
         INY
         LDA   [$E0],Y
         AND   #$FFF3
         STA   [$E0],Y
         LDA   #$0024
         LSR   $91
         BCS   L85C1
         ORA   #$0004
L85C1    ROR   $91
         ORA   [$E0],Y
         STA   [$E0],Y
         PLY
         BRL   L864E
L85CB    BIT   $68
         BVS   L85D6
         LDA   $91
         LSR
         BCS   L85E5
         BRA   L864E
L85D6    BIT   $68
         BVC   L85E5
         LDA   #$0040
         DEY
         ORA   [$E0],Y
         STA   [$E0],Y
         BRL   L8363
L85E5    BRL   L8363
L85E8    LDA   [$E0],Y
         AND   #$00FF
         BEQ   L864E
         CMP   #$00FF
         BEQ   L864E
         SEC
         SBC   $20
         BNE   L85FC
         BRL   L8363
L85FC    DEY
         LDA   [$E0],Y
         AND   #$0002
         BEQ   L8607
         BRL   L8363
L8607    INY
         INY
         INY
         INY
         INY
         INY
         LDA   [$E0],Y
         AND   #$003C
         LSR
         LSR
         DEC
         DEC
         BEQ   L863B
         DEC
         BEQ   L863B
         LDY   #$0002
         LDA   [$38],Y
         CMP   #$4E46
         BNE   L8638
         PER   L8628+2
L8628    BRL   L75AD
         PEA   $0095
         PHK
         PER   L8632+2
L8632    BRL   L8D82
         BRL   L8363
L8638    BRL   L8363
L863B    PER   L863E+2
L863E    BRL   L75AD
         PEA   $0019
         PHK
         PER   L8648+2
L8648    BRL   L8D82
         BRL   L8363
L864E    BIT   $8B
         BPL   L8655
         BRL   L8363
L8655    LDA   #$FF00
         AND   [$E0],Y
         ORA   $20
         STA   [$E0],Y
         BRL   L8363
L8661    PHY
         DEY
         LDA   [$E0],Y
         BIT   #$0020
         BNE   L8674
         PHY
         LDY   #$0086
         LDA   [$3C],Y
         PLY
         DEC
         BNE   L868A
L8674    INY
         INY
         INY
         INY
         INY
         INY
         LDA   [$E0],Y
         LSR
         LSR
         AND   #$000F
         SEC
         SBC   #$000A
         BEQ   L869A
         DEC
         BEQ   L869A
L868A    PER   L868D+2
L868D    BRL   L75AD
         PEA   $007B
         PHK
         PER   L8697+2
L8697    BRL   L8D82
L869A    PLY
         LDA   [$E0],Y
         AND   #$FF00
         STA   [$E0],Y
         BRL   L8363
L86A5    BIT   $91
         BVC   L86AB
         INC   $20
L86AB    TYX
         LDY   #$0002
         LDA   [$38],Y
         CMP   #$4E46
         BNE   L86CD
         BIT   $8A
         BMI   L86CD
         PER   L86BD+2
L86BD    BRL   L75AD
         PEA   $0048
         PHK
         PER   L86C7+2
L86C7    BRL   L8D82
         BRL   L884D
L86CD    TXY
         LDA   $20
         INC
         INC
         INC
         INC
         BIT   $8A
         BMI   L86DE
         BIT   $88
         BVS   L86DE
         LDA   $00
L86DE    CLC
         ADC   $12
         CLC
         ADC   #$000A
         STA   $C8
         TAX
         PHK
         PER   L86F3
         PEA   $0021
         PEI   $EE
         PEI   $EC
L86F3    RTL

         PHY
         LDX   $00
         BIT   $88
         BVS   L870A
         LDX   #$0002
         BIT   $8A
         BPL   L8704
         INX
         INX
L8704    PER   L8707+2
L8707    BRL   L890F
L870A    LDA   $01,S
         TAY
         CLC
         ADC   $C8
         DEC
         DEC
         DEC
         DEC
         STA   $C8
         BIT   $88
         BVC   L8728
         PHY
         TAY
         LDA   $00
         STA   [$E0],Y
         INY
         INY
         LDA   #$0004
         STA   [$E0],Y
         PLY
L8728    LDA   $68
         PHX
         BIT   $90
         BVS   L873C
         BMI   L8739
         BIT   $8E
         BPL   L873C
         BIT   $68
         BVC   L873C
L8739    ORA   #$00FF
L873C    INY
         INY
         ORA   $20
         XBA
         STA   [$E0],Y
         INY
         INY
         LDA   $00
         BIT   $90
         BVC   L8752
         PHY
         LDY   #$0086
         LDA   [$3C],Y
         PLY
L8752    LDX   #$FF00
         BIT   $88
         BVS   L876A
         LDA   $00
         LDX   #$7E00
         BIT   $8A
         BMI   L876A
         LDA   $20
         PER   L8767+2
L8767    BRL   L888B
L876A    STA   [$E0],Y
         INY
         INY
         TXA
         STA   [$E0],Y
         PLX
         INY
         INY
         PHY
         BIT   $8A
         BPL   L877C
         BRL   L8810
L877C    BIT   $88
         BVC   L87B2
         LDA   #$4000
         TRB   $88
         LDX   #$0008
         BIT   $90
         BVS   L878F
         BRL   L840D
L878F    LDA   #$0001
         AND   $91
         ASL
         ASL
         STX   $02
         ORA   $02
         TAX
         LDA   #$0040
         TRB   $91
         TSB   $8A
         LDA   $03,S
         CLC
         ADC   #$000A
         CLC
         ADC   $12
         STA   $B4
         STZ   $B6
         BRL   L840D
L87B2    LDA   $20
         BNE   L87C7
         BIT   $90
         BMI   L87C7
         BIT   $68
         BVS   L87C7
         BIT   $A5
         BPL   L87C7
         LDA   #$0080
         TRB   $A6
L87C7    TXA
         ORA   #$0020
         TAX
         BIT   $8E
         BPL   L8809
         BIT   $68
         BVS   L8809
         ORA   #$0004
         TAX
         LDA   $91
         LSR
         BCS   L87E2
         TXA
         ORA   #$0008
         TAX
L87E2    BIT   $90
         BMI   L87E9
         BRL   L840D
L87E9    BIT   $62
         BPL   L87F0
         BRL   L840D
L87F0    PHY
         LDA   $B4
         CLC
         ADC   $B6
         TAY
         LDA   [$E0],Y
         AND   #$FF00
         STX   $02
         ORA   $02
         AND   #$FF03
         STA   [$E0],Y
         PLY
         BRL   L840D
L8809    TXA
         ORA   #$0008
         TAX
         BRA   L87E2
L8810    TXA
         ORA   #$001C
         TAX
         LDA   #$0003
         TRB   $8B
         STX   $02
         AND   $02
         TSB   $8B
         LDY   $C8
         LDA   $00
         STA   [$E0],Y
         INY
         INY
         PHY
         LDY   #$0086
         LDA   [$3C],Y
         ORA   #$7E00
         PLY
         STA   [$E0],Y
         BRL   L840D
L8837    REP   #$20
         PLY
         PLA
         PLP
         CLC
         RTS

L883E    PER   L8841+2
L8841    BRL   L75AD
         PEI   $04
         PHK
         PER   L884A+2
L884A    BRL   L8D82
L884D    REP   #$20
         PLY
         PLA
         PLP
         SEC
         RTS

L8854    PHY
         AND   #$007F
         ASL
         DEC
         ASL
         TAY
         LDA   [$BE],Y
         CLC
         ADC   #$0009
         TAY
         LDA   [$E0],Y
         AND   #$00FF
         INC
         CLC
         STY   $02
         ADC   $02
         STA   $B4
         STZ   $B6
         PLY
         RTS

L8874    BIT   $CA
         BPL   L887C
         XBA
         STA   $CA
         XBA
L887C    SEP   #$20
         CMP   $CA
         BCC   L8888
         CMP   #$03
         BEQ   L8888
         STA   $CA
L8888    REP   #$20
         RTS

L888B    PHY
         BIT   $8A
         BPL   L88B1
         LDA   $B8
         INC   $B8
         INC   $B8
         DEX
         BNE   L88A2
L8899    INC   $B8
         INC   $B8
L889D    LDX   #$7F00
         BRA   L88F0
L88A2    BMI   L889D
         DEX
         BNE   L8899
         INC   $B8
         INC   $B8
         INC   $B8
         INC   $B8
         BRA   L8899
L88B1    BIT   $90
         BPL   L88C2
         LDA   $B6
         ASL
         ASL
         CLC
         ADC   #$000B
         LDX   #$0700
         BRA   L88F0
L88C2    DEX
         BNE   L88CA
         LDX   #$0004
         BRA   L88DC
L88CA    BPL   L88D1
         LDX   #$0002
         BRA   L88DC
L88D1    DEX
         BEQ   L88D9
         LDX   #$0004
         BRA   L88F8
L88D9    LDX   #$0008
L88DC    PHA
         PLA
         BEQ   L88E5
         LDX   #$0004
         BRA   L88F8
L88E5    LDA   #$2000
         AND   $68
         BNE   L88F2
         TXA
         LDX   #$0800
L88F0    PLY
         RTS

L88F2    TXA
         LDX   #$0A00
         BRA   L88F0
L88F8    LDA   #$2000
         AND   $68
         BNE   L8905
         TXA
         LDX   #$0900
         BRA   L88F0
L8905    TXA
         LDX   #$0B00
         BRA   L88F0
L890B    PHY
         TXY
         BRA   L893C
L890F    PHY
         PHX
         LDA   #$0080
         TRB   $8E
         LDX   $00
         LDY   $12
         INY
         LDA   [$38],Y
         AND   #$00FF
         STA   [$38],Y
         CMP   #$0025
         BEQ   L8955
         BPL   L893B
         INX
         CMP   #$0021
         BEQ   L8955
         INX
         CMP   #$0023
         BEQ   L8955
         INX
         CMP   #$0024
         BEQ   L8955
L893B    PLY
L893C    LDA   [$38],Y
         AND   #$00DF
         SEC
         SBC   #$0041
         BMI   L8959
         CLC
         ADC   #$01D4
         TAY
         LDA   [$3C],Y
         AND   #$00FF
         TAX
         PLY
         SEC
         RTS

L8955    PLY
         PLY
         CLC
         RTS

L8959    INC
         BEQ   L896C
         PER   L895F+2
L895F    BRL   L75AD
         PEA   $0002
         PHK
         PER   L8969+2
L8969    BRL   L8D82
L896C    LDA   #$0080
         TSB   $8E
         PLY
         LDX   $74
         SEC
         RTS

L8976    PHY
         STZ   $76
         LDY   #$0002
         TYX
         LDA   [$38],Y
         CMP   #$4E46
         BNE   L899A
         CPX   $12
         BNE   L8998
         PER   L898B+2
L898B    BRL   L75AD
         PEA   $0002
         PHK
         PER   L8995+2
L8995    BRL   L8D82
L8998    INX
         INX
L899A    AND   #$00FF
         CMP   #$0041
         BCC   L89D8
         CMP   #$005B
         BCS   L89D8
         PEI   $8E
         TXY
         PER   L89AD+2
L89AD    BRL   L890F
         BCC   L89DC
         LDA   [$38]
         INC
         STA   [$38]
         TAY
         INY
         LDA   #$0025
         DEX
         BMI   L89CF
         BEQ   L89CC
         LDA   #$0023
         DEX
         BEQ   L89CF
         LDA   #$0024
         BRA   L89CF
L89CC    LDA   #$0021
L89CF    STA   [$38],Y
         INC   $12
         STA   $76
L89D5    PLA
         STA   $8E
L89D8    PLY
         LDA   $76
         RTS

L89DC    PHX
         TYX
         PER   L89E1+2
L89E1    BRL   L890B
         TXA
         CMP   $01,S
         BEQ   L89EC
         PLA
         BRA   L89D5
L89EC    PLA
         LDA   [$38]
         INC
         TAY
         LDA   [$38],Y
         ORA   #$8000
         STA   $76
         ASL
         STA   [$38],Y
         TYA
         DEC
         DEC
         STA   [$38]
         DEC   $12
         BRA   L89D5
L8A04    PHY
         LDA   $76
         BEQ   L8A18
         BMI   L8A1A
         LDA   [$38]
         TAY
         DEC
         STA   [$38]
         INY
         LDA   $00
         STA   [$38],Y
         DEC   $12
L8A18    PLY
         RTS

L8A1A    ASL
         LSR
         TAX
         LDA   [$38]
         INC
         STA   [$38]
         TAY
         INY
         TXA
         STA   [$38],Y
         INC   $12
         BRA   L8A18
L8A2B    PHP
         PHY
         SEP   #$20
         STZ   $20
         STZ   $22
         LDA   #$40
         TRB   $8C
L8A37    INY
         LDA   [$2C],Y
         BEQ   L8A83
         CMP   #$20
         BEQ   L8A4A
         CMP   #$29
         BEQ   L8A6D
         LDA   #$40
         TSB   $8C
         LDA   [$2C],Y
L8A4A    CMP   #$28
         BEQ   L8A56
         CMP   #$2C
         BNE   L8A37
         INC   $20
         BRA   L8A37
L8A56    INC   $22
L8A58    INY
         LDA   [$2C],Y
         CMP   #$28
         BEQ   L8A69
         CMP   #$29
         BNE   L8A58
         DEC   $22
         BEQ   L8A37
         BRA   L8A58
L8A69    INC   $22
         BRA   L8A58
L8A6D    LDA   $20
         BNE   L8A77
         BIT   $8C
         BVS   L8A77
         DEC   $20
L8A77    INC   $20
         LDA   #$40
         TSB   $8C
         INY
         LDA   [$2C],Y
         PLY
         PLP
         RTS

L8A83    PER   L8A86+2
L8A86    BRL   L75AD
         PEA   $0015
         PHK
         PER   L8A90+2
L8A90    BRL   L8D82
         BRL   L75C5
L8A96    PHY
         PHA
         LDA   [$44]
         BMI   L8ABB
         CMP   #$2E
         BEQ   L8AA8
         CMP   #$30
         BCC   L8ABB
         CMP   #$3A
         BCS   L8ABB
L8AA8    LDY   $12
         BEQ   L8ABB
         DEY
         LDA   [$44],Y
         CMP   #$45
         BEQ   L8AB7
         CMP   #$44
         BNE   L8ABB
L8AB7    CLC
L8AB8    PLA
         PLY
         RTS

L8ABB    SEC
         BRA   L8AB8
L8ABE    PHP
         SEP   #$20
         PHA
         PHY
         LDA   [$44]
         CMP   #$41
         BCC   L8B0C
         REP   #$20
         PHK
         PHK
         PER   L8B47
         PLY
         STY   $48
         PLY
         STY   $4A
         LDY   $00
         SEP   #$20
         LDA   #$03
         STA   $20
L8ADE    LDX   $00
         PHK
         PER   L8AE4+1
L8AE4    BRA   L8B65
         BEQ   L8AF0
         BMI   L8B0C
         INY
         INY
         INY
         INY
         BRA   L8ADE
L8AF0    INY
         INY
         INY
         LDA   [$48],Y
         PLX
         PHX
         LDY   $00
L8AF9    STA   [$2C],Y
         INY
         LDA   #$20
         DEX
         BNE   L8AF9
         LDA   $00
         STA   [$44]
         STA   $12
         PLY
         PLA
         PLP
         CLC
         RTS

L8B0C    PLY
         PLA
         PLP
         SEC
         RTS

         MX    %00
         PHX
         TAX
         SEC
         SBC   #$0064
         BMI   L8B3F
         TAX
         LDA   #$0031
         STA   [$2C],Y
         INY
L8B20    TXA
         LDX   #$0030
L8B24    CMP   #$000A
         BMI   L8B30
         SEC
         SBC   #$000A
         INX
         BRA   L8B24
L8B30    PHA
         TXA
         STA   [$2C],Y
         INY
         PLA
L8B36    CLC
         ADC   #$0030
         STA   [$2C],Y
         INY
         PLX
         RTS

L8B3F    TXA
         CMP   #$000A
         BPL   L8B20
         BRA   L8B36
L8B47    ASC   'AND'
         DB    $1A
         ASC   'EQV'
         DB    $1D
         ASC   'IMP'
         DB    $1E
         ASC   'MOD'
         DB    $10
         ASC   'NOT'
         DB    $19
         ASC   'OR'
         DB    $00
         DB    $1B
         ASC   'XOR'
         DB    $1C
         DB    $7F
         DB    $7F
L8B65    PHP
         PHX
         PHY
         SEP   #$20
         LDA   $20
         STA   $22
L8B6E    PHX
         TYX
         PLY
         LDA   [$44],Y
         PHX
         TYX
         PLY
         CMP   [$48],Y
         BEQ   L8B90
         BPL   L8B88
         LDA   #$80
         ORA   $05,S
         AND   #$FD
         STA   $05,S
L8B84    PLY
         PLX
         PLP
         RTL

L8B88    LDA   #$7D
         AND   $05,S
         STA   $05,S
         BRA   L8B84
L8B90    INX
         INY
         DEC   $22
         BNE   L8B6E
         LDA   #$02
         ORA   $05,S
         AND   #$7F
         STA   $05,S
         BRA   L8B84
L8BA0    PHP
         REP   #$20
         PHY
         PHK
         PHK
         PER   L8C01
         PLX
         STX   $48
         PLX
         STX   $4A
         AND   #$00FF
         TAX
         SEP   #$20
L8BB5    INY
         LDA   [$2C],Y
         CMP   #$20
         BEQ   L8BB5
         REP   #$20
         PHY
         AND   #$00FF
         XBA
         STX   $02
         ORA   $02
         LDY   $00
L8BC9    CMP   [$48],Y
         BEQ   L8BD4
         BCC   L8BE5
         INY
         INY
         INY
         BRA   L8BC9
L8BD4    INY
         INY
         LDA   [$48],Y
         TAX
         PLY
         SEP   #$20
         LDA   #$20
         STA   [$2C],Y
         TXA
         REP   #$20
         BRA   L8BFE
L8BE5    PLY
         PER   L8C15
         PLA
         STA   $48
         TXA
         LDY   $00
         SEP   #$20
L8BF1    CMP   [$48],Y
         BEQ   L8BFB
         BCC   L8BFE
         INY
         INY
         BRA   L8BF1
L8BFB    INY
         LDA   [$48],Y
L8BFE    PLY
         PLP
         RTS

L8C01    ASC   '=<'
         DB    $17
         ASC   '><'
         DB    $14
         ASC   '<='
         DB    $17
         ASC   '>='
         DB    $18
         ASC   '<>'
         DB    $14
         ASC   '=>'
         DB    $18
         DB    $FF
         DB    $FF
L8C15    ASC   '*'0D
         ASC   '+'11
         ASC   '-'12
         ASC   '/'0E
         ASC   '<'15
         ASC   '='13
         ASC   '>'16
         ASC   '\'0F
         ASC   '^'0C
         DB    $FF
L8C28    PHP
         REP   #$20
         PEI   $04
         STZ   $04
         SEP   #$20
         PER   L8C34+2
L8C34    BRL   L8D57
         BCS   L8C43
         BVC   L8CA1
         CMP   #$26
         BEQ   L8C4B
         CMP   #$2E
         BEQ   L8C9B
L8C43    REP   #$20
         PLA
         STA   $04
         PLP
         SEC
         RTS

         MX    %10
L8C4B    INY
         PER   L8C4F+2
L8C4F    BRL   L8D4D
         BCC   L8C57
         BRL   L8D27
L8C57    BVC   L8C64
         CMP   #$4F
         BEQ   L8C64
         CMP   #$48
         BEQ   L8C7C
         BRL   L8D27
L8C64    INY
         PER   L8C68+2
L8C68    BRL   L8D4D
         BCC   L8C70
         BRL   L8D27
L8C70    BVC   L8C75
         BRL   L8D27
L8C75    CMP   #$38
         BCC   L8C64
         BRL   L8D38
L8C7C    SEC
         ROL   $04
L8C7F    INY
         PER   L8C83+2
L8C83    BRL   L8D4D
         BCC   L8C8B
         BRL   L8D27
L8C8B    BVC   L8C7F
         CMP   #$41
         BCS   L8C94
         BRL   L8D27
L8C94    CMP   #$47
         BCC   L8C7F
         BRL   L8D27
L8C9B    PHA
         LDA   #$80
         TSB   $04
         PLA
L8CA1    INY
         PER   L8CA5+2
L8CA5    BRL   L8D4D
         BCS   L8D11
         BVC   L8CA1
         CMP   #$2E
         BNE   L8CB8
         BIT   $04
         BVS   L8D11
         BPL   L8C9B
         BRA   L8D11
L8CB8    CMP   #$45
         BNE   L8CF0
L8CBC    BIT   $04
         BVS   L8D11
         PHA
         LDA   #$40
         TSB   $04
         PHY
         PHX
         LDX   #$FFFF
         INY
         PER   L8CCE+1
L8CCE    BRA   L8D4D
         BCS   L8CDC
         BVC   L8CEB
         CMP   #$2B
         BEQ   L8CE1
         CMP   #$2D
         BEQ   L8CE1
L8CDC    PLX
         PLY
         PLA
         BRA   L8D11
L8CE1    INY
         PER   L8CE5+1
L8CE5    BRA   L8D4D
         BCS   L8CDC
         BVS   L8CDC
L8CEB    PLX
         PLY
         PLA
         BRA   L8CA1
L8CF0    CMP   #$44
         BEQ   L8CBC
         CMP   #$2B
         BEQ   L8CFC
         CMP   #$2D
         BNE   L8D11
L8CFC    BIT   $04
         BVC   L8D11
         PHA
         LDA   $05
         CMP   #$45
         BEQ   L8D0E
         CMP   #$44
         BEQ   L8D0E
         PLA
         BRA   L8D11
L8D0E    PLA
         BRA   L8CA1
L8D11    CMP   #$21
         BEQ   L8D1D
         CMP   #$25
         BEQ   L8D1D
         CMP   #$23
         BNE   L8D27
L8D1D    INY
         PER   L8D21+1
L8D21    BRA   L8D4D
         BCS   L8D44
         BVC   L8D38
L8D27    CLV
         CMP   #$26
         BEQ   L8D38
         CMP   #$2E
         BEQ   L8D38
         CMP   #$41
         BCC   L8D44
         CMP   #$5B
         BCS   L8D44
L8D38    SEP   #$40
         REP   #$20
         PLA
         STA   $04
         PLP
         SEP   #$40
         CLC
         RTS

L8D44    REP   #$20
         PLA
         STA   $04
         PLP
         CLC
         CLV
         RTS

         MX    %10
L8D4D    STA   $05
         PHY
         TXY
         BMI   L8D56
         STA   [$44],Y
         INX
L8D56    PLY
L8D57    LDA   [$2C],Y
         BEQ   L8D80
         CMP   #$09
         BEQ   L8D65
         CMP   #$20
         BCC   L8D80
         BNE   L8D6D
L8D65    LDA   $04
         LSR
         BCS   L8D80
         INY
         BRA   L8D57
L8D6D    CMP   #$61
         BCC   L8D73
         AND   #$DF
L8D73    SEP   #$40
         CMP   #$30
         BCC   L8D7E
         CMP   #$3A
         BCS   L8D7E
         CLV
L8D7E    CLC
         RTS

L8D80    SEC
         RTS

L8D82    PHP
         PHB
         REP   #$20
         PHA
         LDA   $00
         DEC
         STA   $62
         PLA
         PEA   $0003
         PEI   $EE
         PEI   $EC
         RTL

L8D95    LDA   #$0040
         STA   [$28],Y
         INY
         PHY
         TXA
         CLC
         LDY   #$00B4
         ADC   [$3C],Y
         TAX
         PLY
         XBA
         AND   #$000F
         CLC
         ADC   #$0041
         STA   [$28],Y
         INY
         TXA
         AND   #$000F
         CLC
         ADC   #$0041
         XBA
         PHA
         TXA
         LSR
         LSR
         LSR
         LSR
         AND   #$000F
         CLC
         ADC   #$0041
         ORA   $01,S
         STA   [$28],Y
         INY
         INY
         PLA
         RTS

L8DCE    BIT   $F4
         BVS   L8DD3
         RTL

L8DD3    PEI   $0A
         PEI   $08
         PEI   $0E
         PEI   $0C
         PEI   $10
         PER   L8DE0+2
L8DE0    BRL   L8FD4
         PHA
         PHX
L8DE5    LDY   #$01BE
         LDA   [$3C],Y
         STA   $10
         BNE   L8DF6
         PER   L8DF1+2
L8DF1    BRL   L8ECD
         BRA   L8DE5
L8DF6    LDY   #$01B4
         LDX   #$0000
L8DFC    LDA   [$3C],Y
         STA   $04,X
         INX
         INX
         INY
         INY
         CPX   #$0008
         BCC   L8DFC
         INX
         STZ   $0C
         STZ   $0E
L8E0E    LDA   $08
         SEC
         SBC   $04
         TAY
         LDA   $0A
         SBC   $06
         BCC   L8E1E
         STA   $0A
         STY   $08
L8E1E    ROL   $0C
         ROL   $0E
         DEX
         BEQ   L8E2B
         LSR   $06
         ROR   $04
         BRA   L8E0E
L8E2B    LSR   $0C
         LDX   $10
         LDY   #$01BC
         LDA   [$3C],Y
         STA   $10
         CMP   #$0048
         BCC   L8E3D
         LSR   $0C
L8E3D    LDA   #$0096
         SEC
         SBC   $0C
         STA   $0E
         STX   $0C
L8E47    LDA   $0E
         CMP   $0C
         BCS   L8E8E
         LDA   $10
         CMP   $0C
         BCS   L8E8E
         LDA   #$0238
         STA   $06
         LDA   #$0246
         STA   $0A
         LDA   $10
         CMP   #$0048
         BCC   L8E74
         LDA   $06
         SEC
         SBC   #$0028
         STA   $06
         LDA   $0A
         SEC
         SBC   #$0028
         STA   $0A
L8E74    LDA   $0C
         STA   $08
         DEC
         STA   $04
         STA   $0C
         PEI   $00
         TDC
         CLC
         ADC   #$0004
         PHA
         _PaintRect
         BRA   L8E47
L8E8E    LDA   $0C
         LDY   #$01BE
         STA   [$3C],Y
         PLX
         PLA
         PER   L8E9A+2
L8E9A    BRL   L8FEC
         PLA
         STA   $10
         PLA
         STA   $0C
         PLA
         STA   $0E
         PLA
         STA   $08
         PLA
         STA   $0A
         RTL

L8EAD    DB    $94
         DB    $00
         DB    $2E
         DB    $02
         DB    $A2
         DB    $00
         DB    $50
         DB    $02
L8EB5    DB    $94
         DB    $00
         DB    $06
         DB    $02
         DB    $A2
         DB    $00
         DB    $28
         DB    $02
L8EBD    DB    $16
         DB    $00
         DB    $35
         DB    $02
         DB    $96
         DB    $00
         DB    $49
         DB    $02
L8EC5    DB    $56
         DB    $00
         DB    $0D
         DB    $02
         DB    $96
         DB    $00
         DB    $21
         DB    $02
L8ECD    LDY   #$000A
         LDA   [$3C],Y
         STA   $04
         BEQ   L8EE2
         LDA   #$0049
         STA   $06
         PHK
         PHK
         PER   L8EB5
         BRA   L8EF4
L8EE2    LDX   #$0031
         LDY   #$0008
         LDA   [$3C],Y
         BNE   L8EED
         INX
L8EED    STX   $06
         PHK
         PHK
         PER   L8EAD
L8EF4    PEA   $0014
         PEA   $0140
         _FrameArc
         LDA   #$023B
         LDX   $06
         CPX   #$0049
         BNE   L8F0F
         SEC
         SBC   #$0028
L8F0F    LDX   #$009F
         PER   L8F15+2
L8F15    BRL   L8FEC
         PEI   $06
         _DrawChar
         LDA   $06
         CMP   #$0049
         BNE   L8F32
         PHK
         PHK
         PER   L8EC5
         LDA   #$0056
         BRA   L8F53
L8F32    LDX   #$0055
         LDA   #$0231
         PER   L8F3B+2
L8F3B    BRL   L8FEC
         PEA   $001C
         PEA   $0000
         _Line
         PHK
         PHK
         PER   L8EBD
         LDA   #$0016
L8F53    LDY   #$01BC
         STA   [$3C],Y
         _FrameRect
         LDA   #$0096
         LDY   #$01BE
         STA   [$3C],Y
         RTS

L8F68    BIT   $F4
         BVC   L8F9B
         LDY   #$01BE
         LDA   [$3C],Y
         BEQ   L8F9B
         LDY   #$0008
         LDA   [$3C],Y
         BEQ   L8F88
         LDY   #$000A
         LDA   [$3C],Y
         BEQ   L8F88
         PHK
         PHK
         PER   L8FC4
         BRA   L8F8D
L8F88    PHK
         PHK
         PER   L8FCC
L8F8D    _EraseRect
         LDA   $00
         LDY   #$01BE
         STA   [$3C],Y
L8F9B    RTL

L8F9C    BIT   $F4
         BVC   L8FC3
         PER   L8FA3+1
L8FA3    BRA   L8FD4
         PHA
         PHX
         LDA   #$023B
         LDX   #$009F
         PER   L8FB0+1
L8FB0    BRA   L8FEC
         PEA   $0032
         _DrawChar
         PLX
         PLA
         PER   L8FC1+1
L8FC1    BRA   L8FEC
L8FC3    RTL

L8FC4    DB    $56
         DB    $00
         DB    $03
         DB    $02
         DB    $A3
         DB    $00
         DB    $2B
         DB    $02
L8FCC    DB    $16
         DB    $00
         DB    $2B
         DB    $02
         DB    $A3
         DB    $00
         DB    $53
         DB    $02
L8FD4    LDX   #$0000
         PHX
         PHX
         TSC
         INC
         PHX
         PHA
         _GetPen
         PLX
         BCS   L8FE9
         PLA
         RTS

L8FE9    PLX
         SEC
         RTS

L8FEC    PHA
         PHX
         _MoveTo
         RTS

L8FF6    LDY   #$0008
         PER   L8FFC+1
L8FFC    BRA   L9007
         LDY   #$0006
         PER   L9004+1
L9004    BRA   L9007
         RTS

L9007    PHY
L9008    PLY
         LDA   [$E0],Y
         BEQ   L903D
         TAY
         PHA
         INY
         LDA   [$E0],Y
         AND   #$3800
         BNE   L9008
         TYA
         CLC
         ADC   #$0008
         TAY
         LDA   [$E0],Y
         BPL   L9008
         DEY
         LDA   [$E0],Y
         AND   #$003C
         BEQ   L9033
         BIT   #$0020
         BEQ   L9008
         BIT   #$0010
         BNE   L9008
L9033    INY
         LDA   [$E0],Y
         AND   #$7FFF
         STA   [$E0],Y
         BRA   L9008
L903D    RTS

         BRA   L9097
L9040    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0A
         DB    $04
         DB    $01
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
         DB    $00
         DB    $00
         DB    $00
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
         DB    $2C
         DB    $00
         DB    $40
         DB    $00
         DB    $20
         DB    $20
         DB    $00
         DB    $00
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
         DB    $20
L9080    DB    $F2
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L9085    NOP
         CLC
         XCE
         REP   #$38
         LDA   #$0000
         PER   L9093
         BRL   L9093
L9093    DB    $00
         DB    $00
         DB    $00
         DB    $00
L9097    TSC
         STA   $40
         LDY   #$000C
         LDA   [$3C],Y
         BEQ   L90CA
         PHA
         TAX
         LDY   #$0036
         LDA   [$3C],Y
         PEA   $0000
         PHA
         PHK
         PHK
         PER   L9A97
         PHK
         PER   L90B5+2
L90B5    BRL   LAF42
         PLA
         PLA
         PLA
         PLA
         PHK
         PER   L90C0+2
L90C0    BRL   LA472
         LDA   $00
         LDY   #$000C
         STA   [$3C],Y
L90CA    LDY   #$0036
         LDA   [$3C],Y
         BEQ   L90D4
         BRL   L94F6
L90D4    BIT   $F4
         BVC   L90EC
         PEI   $00
         TDC
         CLC
         ADC   #$00D6
         PHA
         _GetPen
         LDA   #$0003
         STA   $D8
L90EC    PHK
         PHK
         PER   L9AC6
         PER   L90F4+2
L90F4    BRL   L99B8
         PHK
         PER   L90FB+2
L90FB    BRL   *-L0580
         LDA   #$01D4
         CLC
         ADC   $3C
         STA   $CE
         LDA   $00
         ADC   $3E
         STA   $D0
         STZ   $0A
         LDA   $CE
         STA   $28
         CLC
         ADC   #$1402
         STA   $5C
         LDA   $D0
         STA   $2A
         BCC   L911F
         INC
L911F    STA   $5E
         STZ   $60
         STZ   $0C
         STZ   $0E
         LDA   #$29D8
         CLC
         ADC   $3C
         STA   $2C
         LDA   $00
         ADC   $3E
         STA   $2E
         STZ   $10
         STZ   $12
         STZ   $1C
         STZ   $1E
         STZ   $20
         PEA   $0000
         PEA   $0000
         LDY   #$0006
         LDA   [$3C],Y
         PHA
         LDA   $00
         PHK
         PER   L9151+2
L9151    BRL   LA49E
         PEA   $0000
         PEA   $0000
         LDY   #$0002
         LDA   [$3C],Y
         PHA
         LDA   $00
         PHK
         PER   L9166+2
L9166    BRL   LA49E
         LDY   #$00C8
         LDA   [$3C],Y
         BNE   L9181
         LDY   #$00C6
         LDA   [$3C],Y
         STA   $0E
         LDA   #$0000
         LDY   #$00C6
         STA   [$3C],Y
         BRA   L91B2
L9181    LDY   #$00C6
         LDA   [$3C],Y
         BEQ   L919D
         PEA   $0000
         PHA
         PEI   $2E
         PEI   $2C
         LDY   #$0004
         LDA   [$3C],Y
         PHA
         PHK
         PER   L919A+2
L919A    BRL   LA580
L919D    PEA   $0000
         PEA   $0000
         LDY   #$0004
         LDA   [$3C],Y
         PHA
         LDA   $00
         PHK
         PER   L91AF+2
L91AF    BRL   LA49E
L91B2    LDA   #$072D
         CLC
         ADC   $3C
         STA   $44
         LDA   $00
         ADC   $3E
         STA   $46
         LDA   $44
         LDY   #$001C
         STA   [$3C],Y
         LDA   $46
         LDY   #$001E
         STA   [$3C],Y
         LDY   #$5552
         LDX   #$004E
         PHK
         PER   L91D8+2
L91D8    BRL   *-L0319
         PEI   $46
         PEI   $44
         LDA   #$00B3
         LDX   #$0100
         PHK
         PER   L91E9+2
L91E9    BRL   LA354
         BCC   L91F1
         BRL   *-L049C
L91F1    LDY   #$000E
         STA   [$3C],Y
         LDY   $28
         STY   $38
         LDY   $2A
         STY   $3A
         PER   L9201+2
L9201    BRL   L9510
         PHK
         PHK
         PER   L9080
         PLY
         STY   $34
         PLY
         STY   $36
         LDA   #$1372
         CLC
         ADC   #$0012
         CLC
         LDY   #$0044
         ADC   [$3C],Y
         LDY   #$0008
         STA   [$38],Y
         LDY   #$0041
         STA   [$38],Y
         CLC
         ADC   #$0245
         AND   #$FE00
         XBA
         LSR
         STA   [$38]
         LDA   #$4E49     ; IN
         LDY   #$0036
         STA   [$38],Y
         LDA   #$5449     ; IT
         LDY   #$0038
         STA   [$38],Y
         LDA   #$0045
         STA   $0A
         STA   $1C
         PHK
         PHK
         PER   L9085
         PLY
         STY   $34
         PLY
         STY   $36
         LDY   #$0044
         LDA   [$3C],Y
         INC
         INC
         INC
         INC
         LDY   #$000C
         STA   [$34],Y
         LDA   #$0012
         PER   L9267+2
L9267    BRL   L9886
         PER   L926D+2
L926D    BRL   L952D
         PHK
         PHK
         PER   L9BD0
         PLA
         STA   $34
         PLA
         STA   $36
         TDC
         CLC
         ADC   #$0100
         PHA
         LDX   $00
         TXY
         PHK
         PER   L9288+2
L9288    BRL   LAA4C
         LDX   #$0001
         LDY   #$001A
         LDA   [$3C],Y
         TAY
         ASL
         BPL   L929A
         LDX   #$4001
L929A    TYA
         BIT   #$0100
         BEQ   L92A5
         TXA
         ORA   #$0008
         TAX
L92A5    TYA
         BIT   #$0200
         BEQ   L92B0
         TXA
         ORA   #$8000
         TAX
L92B0    TYA
         BIT   #$0080
         BEQ   L92B8
         INX
         INX
L92B8    STY   $72
         LDY   #$0088
         LDA   [$3C],Y
         CLC
         LDY   #$008A
         ADC   [$3C],Y
         BEQ   L92CC
         TXA
         ORA   #$0004
         TAX
L92CC    TXA
         PHK
         PER   L92D1+2
L92D1    BRL   LA875
         LDA   #$1372
         PER   L92DA+2
L92DA    BRL   L9886
         PLA
         LDX   $00
         TXY
         DEY
         PHK
         PER   L92E6+2
L92E6    BRL   LAA4C
         PER   L92EC+2
L92EC    BRL   L983E
         PER   L92F2+2
L92F2    BRL   L95F7
L92F5    PHK
         PER   L92F9+2
L92F9    BRL   *-L0580
         LDY   $28
         STY   $38
         LDY   $2A
         STY   $3A
         LDA   $20
         ASL
         ASL
         ASL
         ASL
         TAY
         CLC
         ADC   #$000C
         TAX
         INY
         INY
         LDA   [$E4],Y
         STA   $24
         TXY
         LDA   [$E4],Y
         STA   $26
         PER   L931E+2
L931E    BRL   L9510
         LDX   $20
         DEX
         DEX
         BNE   L9334
         PHK
         PHK
         PER   L9ADD
         PER   L932F+2
L932F    BRL   L99B8
         BRA   L935D
L9334    LDY   $26
         LDA   [$E0],Y
         AND   #$00FF
         INC
         CLC
         STY   $02
         ADC   $02
         TAY
         LDA   [$E0],Y
         PHA
         PHY
         LDA   $00
         STA   [$E0],Y
         LDA   $26
         INC
         CLC
         ADC   $E0
         PEI   $E2
         PHA
         PER   L9356+2
L9356    BRL   L99B8
         PLY
         PLA
         STA   [$E0],Y
L935D    LDA   $24
         LDY   #$0008
         STA   [$38],Y
         LDY   #$0041
         STA   [$38],Y
         CLC
         ADC   #$0245
         AND   #$FE00
         XBA
         LSR
         STA   [$38]
         LDA   $20
         DEC
         DEC
         BEQ   L9380
         PER   L937D+2
L937D    BRL   L9559
L9380    LDA   #$0045
         STA   $0A
         CLC
         ADC   $1C
         STA   $1C
         BCC   L938E
         INC   $1E
L938E    STZ   $14
         LDA   #$0005
         PER   L9396+2
L9396    BRL   L96AE
         BCC   L939E
         BRL   L9B18
L939E    PER   L93A1+2
L93A1    BRL   L959C
         BCC   L93A9
         BRL   L9B1D
L93A9    LDA   $24
         STA   $42
         PER   L93B0+2
L93B0    BRL   L95E0
         LDA   $20
         DEC
         DEC
         BNE   L93F7
         LDA   #$0010
         PER   L93BF+2
L93BF    BRL   L96AE
         BCC   L93C7
         BRL   L9B22
L93C7    PER   L93CA+2
L93CA    BRL   L959C
         BCC   L93D2
         BRL   L9B27
L93D2    LDY   #$0088
         LDA   [$3C],Y
         STA   $42
         PER   L93DC+2
L93DC    BRL   L95E0
         PER   L93E2+2
L93E2    BRL   L959C
         BCC   L93EA
         BRL   L9B2C
L93EA    LDY   #$008A
         LDA   [$3C],Y
         STA   $42
         PER   L93F4+2
L93F4    BRL   L95E0
L93F7    LDA   $20
         CMP   $70
         BEQ   L9430
         BCC   L9402
         BRL   L9B68
L9402    LDA   $24
         SEC
         SBC   $14
         PER   L940A+2
L940A    BRL   L96AE
         BCC   L9412
         BRL   L9B31
L9412    PER   L9415+2
L9415    BRL   L983E
         LDY   #$0086
         LDA   [$3C],Y
         DEC
         LDY   #$0086
         STA   [$3C],Y
         TAX
         BPL   L9429
         BRL   L9B36
L9429    BEQ   L942E
         BRL   L92F5
L942E    BRA   L9479
L9430    LDA   $6E
         SEC
         SBC   $14
         PER   L9438+2
L9438    BRL   L96AE
         PER   L943E+2
L943E    BRL   L959C
         LDY   $6C
         LDA   $66
         BEQ   L946F
         DEC
         BEQ   L946B
         DEC
         BEQ   L9459
         DEC
         BEQ   L9453
         BRL   L9B6D
L9453    TYA
         SEC
         SBC   $6E
         BRA   L945B
L9459    LDA   [$E0],Y
L945B    STA   $42
         PER   L9460+2
L9460    BRL   L95E0
         PER   L9466+2
L9466    BRL   L95F7
         BRA   L93F7
L946B    LDA   [$E0],Y
         BRA   L9471
L946F    LDA   [$E4],Y
L9471    SEC
         SBC   $14
         CLC
         ADC   $42
         BRA   L945B
L9479    LDY   #$0088
         LDA   [$3C],Y
         CLC
         LDY   #$008A
         ADC   [$3C],Y
         STA   $24
         TAX
         BEQ   L94A3
         PHK
         PHK
         PER   L9AEA
         PER   L9491+2
L9491    BRL   L99B8
         LDY   #$0002
         LDA   [$3C],Y
         STA   $6A
         STZ   $66
         PER   L94A0+2
L94A0    BRL   L995D
L94A3    LDA   #$0080
         BIT   $72
         BEQ   L94C7
         PHK
         PHK
         PER   L9B02
         PER   L94B2+2
L94B2    BRL   L99B8
         PER   L99E7
         PER   L94BB+2
L94BB    BRL   L9918
         PER   L99F3
         PER   L94C4+2
L94C4    BRL   L9918
L94C7    LDA   $40
         TCS
L94CA    PER   L94CD+2
L94CD    BRL   L990D
         PHK
         PHK
         PER   L9B16
         LDX   $F4
         PHK
         PER   L94DB+2
L94DB    BRL   LAF42
         PLA
         PLA
         LDY   #$000E
         LDA   [$3C],Y
         BEQ   L94F6
         PHA
         LDA   $00
         LDY   #$000E
         STA   [$3C],Y
         PHK
         PER   L94F3+2
L94F3    BRL   LA472
L94F6    LDY   #$0006
         LDA   [$3C],Y
         BEQ   L950C
         PHA
         LDA   $00
         LDY   #$0006
         STA   [$3C],Y
         PHK
         PER   L9509+2
L9509    BRL   LA472
L950C    LDA   $40
         TCS
         RTL

L9510    PER   L9040
         LDY   $00
         LDX   #$0045
         PHK
         PLB
L951A    LDA   ($01,S),Y
         STA   [$38],Y
         INY
         INY
         DEX
         DEX
         BMI   L9526
         BNE   L951A
L9526    PLX
         PER   L952A+1
L952A    BRA   L9560
         RTS

L952D    LDY   #$000A
         PHY
L9531    PLY
         LDA   [$E0],Y
         BEQ   L9558
         PHA
         INC
         INC
         INC
         TAY
         LDA   [$E0],Y
         AND   #$00FF
         TAX
         TYA
         CLC
         ADC   $E0
         STA   $34
         LDA   $00
         ADC   $E2
         STA   $36
         TXA
         INC
         INC
         PER   L9553+2
L9553    BRL   L9886
         BRA   L9531
L9558    RTS

L9559    LDX   #$0036
         LDY   $26
         BRA   L9578
L9560    INC   $20
         LDA   $20
         LDY   #$0022
         STA   [$38],Y
         LDY   #$000A
         LDX   #$002C
         LDA   [$E0],Y
         TAY
         LDA   [$E0],Y
         TAY
         INY
         INY
         INY
L9578    LDA   [$E0],Y
         AND   #$00FF
         CMP   #$000A
         BMI   L9585
         LDA   #$000A
L9585    STA   $04
         INY
         SEP   #$20
L958A    DEC   $04
         BMI   L9599
         LDA   [$E0],Y
         PHY
         TXY
         STA   [$38],Y
         PLY
         INY
         INX
         BRA   L958A
L9599    REP   #$20
         RTS

L959C    LDA   $12
         BMI   L95DE
         SEC
         SBC   $10
         BPL   L95A8
         BRL   L9B3B
L95A8    BNE   L95B2
         PER   L95AD+2
L95AD    BRL   L973D
         BRA   L959C
L95B2    LDY   $10
         LDA   [$30],Y
         STA   $42
         INY
         TYA
         CMP   $12
         BMI   L95D9
         PER   L95C1+2
L95C1    BRL   L973D
         LDA   $12
         BMI   L95DE
         BEQ   L95DE
         INC   $10
         LDA   #$FF00
         TRB   $42
         XBA
         AND   [$30]
         XBA
         TSB   $42
         BRA   L95DC
L95D9    INY
         STY   $10
L95DC    CLC
         RTS

L95DE    SEC
         RTS

L95E0    TDC
         CLC
         ADC   #$0042
         STA   $34
         STZ   $36
         LDA   #$0002
         INC   $14
         INC   $14
         PER   L95F3+2
L95F3    BRL   L9886
         RTS

L95F7    PER   L95FA+1
L95FA    BRA   L9638
         BCS   L9630
         STA   $66
         PER   L9603+1
L9603    BRA   L9638
         BCS   L9635
         STA   $6E
         PER   L960C+1
L960C    BRA   L9638
         BCS   L9635
         STA   $6F
         PER   L9615+1
L9615    BRA   L9638
         BCS   L9635
         INC
         STA   $70
         PER   L961F+1
L961F    BRA   L9638
         BCS   L9635
         STA   $6C
         PER   L9628+1
L9628    BRA   L9638
         BCS   L9635
         XBA
         TSB   $6C
         RTS

L9630    STZ   $70
         DEC   $70
         RTS

L9635    BRL   L9B40
L9638    LDA   $0E
         BMI   L9658
         SEC
         SBC   $0C
         BPL   L9644
         BRL   L9B45
L9644    BNE   L964D
         PER   L9649+1
L9649    BRA   L965A
         BRA   L9638
L964D    LDY   $0C
         LDA   #$00FF
         AND   [$2C],Y
         INC   $0C
         CLC
         RTS

L9658    SEC
         RTS

L965A    LDA   $0E
         BMI   L96AD
         STZ   $0C
         LDY   #$00C8
         LDA   [$3C],Y
         BEQ   L9672
         DEC
         LDY   #$00C8
         STA   [$3C],Y
         LDX   #$01FE
         BRA   L9685
L9672    LDY   #$00C6
         LDA   [$3C],Y
         BNE   L967D
         STZ   $0E
         BRA   L96AB
L967D    TAX
         LDA   $00
         LDY   #$00C6
         STA   [$3C],Y
L9685    PEA   $0000
         STX   $0E
         PHX
         PEI   $2E
         PEI   $2C
         LDY   #$0004
         LDA   [$3C],Y
         PHA
         PHK
         PER   L9699+2
L9699    BRL   LA585
         BCC   L96A1
         BRL   L9B4A
L96A1    CMP   $0E
         BEQ   L96A8
         BRL   L9B4A
L96A8    TAX
         BNE   L96AD
L96AB    DEC   $0E
L96AD    RTS

L96AE    STA   $1A
         TAX
         BEQ   L970D
         CLC
         ADC   $14
         STA   $14
L96B8    LDA   $12
         BMI   L970B
         SEC
         SBC   $10
         BPL   L96C4
         BRL   L9B4F
L96C4    BNE   L96CD
         PER   L96C9+1
L96C9    BRA   L973D
         BRA   L96B8
L96CD    CMP   $1A
         BCC   L96D3
         LDA   $1A
L96D3    PHA
         LDA   $1A
         SEC
         SBC   $01,S
         STA   $1A
         LDA   $10
         TAX
         CLC
         ADC   $01,S
         STA   $10
         TXA
         CLC
         ADC   $30
         STA   $34
         LDA   $32
         STA   $36
         PLA
         PER   L96F1+2
L96F1    BRL   L9886
         LDA   $1A
         BEQ   L970D
         STZ   $10
         STZ   $12
         LDY   #$0006
         LDA   [$3C],Y
         PER   L9704+1
L9704    BRA   L977F
         SEC
         SBC   $18
         BEQ   L970D
L970B    SEC
         RTS

L970D    CLC
         RTS

L970F    PEA   $0000
         PEA   $1400
         PEI   $5E
         PEI   $5C
         LDY   #$0006
         LDA   [$3C],Y
         PHA
         PHK
         PER   L9723+2
L9723    BRL   LA585
         BCC   L972B
         BRL   L9B54
L972B    STA   $60
         TAX
         BNE   L9732
         DEC   $60
L9732    STZ   $62
         LDY   $5C
         STY   $30
         LDY   $5E
         STY   $32
         RTS

L973D    LDA   $12
         BMI   L977C
L9741    LDA   $60
         BPL   L9749
         STA   $12
         BRA   L977C
L9749    BNE   L9752
         PER   L974E+1
L974E    BRA   L970F
         BRA   L9741
L9752    LDA   $62
         STZ   $62
         CLC
         ADC   $30
         STA   $30
         BCC   L975F
         INC   $32
L975F    LDA   $60
         CMP   #$0200
         BPL   L976E
         STZ   $60
         DEC   $60
         STZ   $62
         BRA   L9773
L976E    LDA   #$0200
         STA   $62
L9773    STA   $12
         LDA   $60
         SEC
         SBC   $62
         STA   $60
L977C    STZ   $10
         RTS

L977F    STZ   $18
         PHA
L9782    LDA   #$0200
         SEC
         SBC   $0A
         BMI   L97E9
         BNE   L9794
L978C    PER   L978F+2
L978F    BRL   L98CE
         BRA   L9782
L9794    PEA   $0000
         PHA
         LDA   $1A
         SEC
         SBC   $18
         BEQ   L97E5
         CMP   $01,S
         BCS   L97A5
         STA   $01,S
L97A5    LDA   $0A
         CLC
         ADC   $28
         TAY
         LDA   $00
         ADC   $2A
         PHA
         PHY
         LDA   $09,S
         LDY   #$0006
         CMP   [$3C],Y
         BEQ   L97EF
         PHA
         PHK
         PER   L97BF+2
L97BF    BRL   LA585
         BCS   L97EC
L97C4    TAX
         CLC
         ADC   $1C
         STA   $1C
         BCC   L97CE
         INC   $1E
L97CE    TXA
         CLC
         ADC   $18
         STA   $18
         TXA
         BEQ   L97E1
         CLC
         ADC   $0A
         STA   $0A
         CMP   #$0200
         BEQ   L978C
L97E1    LDA   $18
         PLX
         RTS

L97E5    PLA
         PLA
         BRA   L97E1
L97E9    BRL   L9B59
L97EC    BRL   L9B7C
L97EF    PLA
         STA   $B4
         PLA
         STA   $B6
         LDX   $00
L97F7    PLY
         DEY
         PHY
         BMI   L9839
L97FC    LDA   $12
         BMI   L9839
         SEC
         SBC   $10
         BNE   L9811
         PHY
         PHX
         PER   L980A+2
L980A    BRL   L973D
         PLX
         PLY
         BRA   L97FC
L9811    DEC
         BEQ   L9829
         DEY
         BMI   L9829
         PLY
         DEY
         PHY
         LDY   $10
         INC   $10
         INC   $10
         LDA   [$30],Y
         TXY
         STA   [$B4],Y
         INX
         INX
         BRA   L97F7
L9829    SEP   #$20
         LDY   $10
         LDA   [$30],Y
         TXY
         STA   [$B4],Y
         INX
         REP   #$20
         INC   $10
         BRA   L97F7
L9839    PLA
         PLA
         TXA
         BRA   L97C4
L983E    TDC
         CLC
         ADC   #$0042
         STA   $34
         STZ   $36
         STZ   $42
         LDA   #$0001
         PER   L984F+1
L984F    BRA   L9886
         LDX   #$6161
         LDY   $0A
         BEQ   L9885
         TYA
         LSR
         BCC   L9866
         TXA
         STA   [$28],Y
         INY
         INC   $1C
         BNE   L9866
         INC   $1E
L9866    TXA
L9867    CPY   #$0200
         BPL   L987E
         STA   [$28],Y
         INY
         INY
         INC   $1C
         BNE   L9876
         INC   $1E
L9876    INC   $1C
         BNE   L9867
         INC   $1C
         BRA   L9867
L987E    STY   $0A
         PER   L9883+1
L9883    BRA   L98CE
L9885    RTS

L9886    STA   $08
         CLC
         ADC   $1C
         STA   $1C
         BCC   L9891
         INC   $1E
L9891    LDY   $0A
         LDX   $00
         TYA
         LSR
         BCC   L98A3
         LDA   [$34]
         STA   [$28],Y
         INY
         INX
         DEC   $08
         BEQ   L98CB
L98A3    CPY   #$0200
         BMI   L98B8
         BEQ   L98AD
         BRL   L9B5E
L98AD    STY   $0A
         PER   L98B2+1
L98B2    BRA   L98CE
         LDY   $0A
         BRA   L98A3
L98B8    PHY
         TXY
         LDA   [$34],Y
         PLY
         STA   [$28],Y
         INX
         INX
         INY
         DEC   $08
         BEQ   L98CB
         INY
         DEC   $08
         BNE   L98A3
L98CB    STY   $0A
         RTS

L98CE    PHY
         PHX
         CLC
         LDA   $0A
         BEQ   L9908
         CLC
         ADC   $28
         STA   $28
         BCC   L98DE
         INC   $2A
L98DE    SEC
         SBC   $CE
         CMP   #$1200
         BCC   L9908
L98E6    PEA   $0000
         PHA
         PEI   $D0
         PEI   $CE
         LDY   #$000E
         LDA   [$3C],Y
         PHA
         PHK
         PER   L98F8+2
L98F8    BRL   LA580
         BCC   L9900
         BRL   L9B63
L9900    LDY   $CE
         STY   $28
         LDY   $D0
         STY   $2A
L9908    STZ   $0A
         PLX
         PLY
         RTS

L990D    PHY
         PHX
         LDA   $28
         SEC
         SBC   $CE
         BEQ   L9908
         BRA   L98E6
L9918    PLX
         PLA
         PHX
         STA   $24
         PHK
         PHK
         PLA
         STA   $26
         PHK
         PER   L9926+2
L9926    BRL   LA005
         BCS   L9956
         STA   $6A
         PHA
         PHK
         PER   L9932+2
L9932    BRL   LA537
         BCS   L994D
         STA   $24
         LDA   #$0080
         STA   $66
         PER   L9941+1
L9941    BRA   L995D
         PEI   $6A
         PHK
         PER   L9949+2
L9949    BRL   LA472
         RTS

L994D    PEI   $6A
         PHK
         PER   L9953+2
L9953    BRL   LA472
L9956    PLA
         PER   L99FF
         BRL   L9B8D
L995D    LDY   $28
         STY   $38
         LDY   $2A
         STY   $3A
         PER   L9968+2
L9968    BRL   L9510
         LDA   $66
         LDY   #$000C
         ORA   [$38],Y
         LDY   #$000C
         STA   [$38],Y
         LDA   $24
         LDY   #$0008
         STA   [$38],Y
         LDY   #$0041
         STA   [$38],Y
         CLC
         ADC   #$0244
         AND   #$FE00
         XBA
         LSR
         STA   [$38]
         LDA   #$0045
         STA   $0A
         CLC
         ADC   $1C
         STA   $1C
         BCC   L999C
         INC   $1E
L999C    LDA   $24
         STA   $1A
         LDA   $6A
         PER   L99A5+2
L99A5    BRL   L977F
         SEC
         SBC   $1A
         BEQ   L99B1
         PLA
         BRL   L9B72
L99B1    PER   L99B4+2
L99B4    BRL   L983E
         RTS

L99B8    PLX
         PLY
         PLA
         PHX
         PHA
         PHY
         BIT   $F4
         BVS   L99C9
         PHK
         PHK
         PER   L9ABA
         BRA   L99D9
L99C9    PHK
         PHK
         PER   L9AAD
         PEI   $D8
         PEI   $D6
         _MoveTo
L99D9    LDX   $F4
         PHK
         PER   L99DF+2
L99DF    BRL   LAF42
         PLA
         PLA
         PLA
         PLA
         RTS

L99E7    STR   '0/BASIC.1L'
         DB    $00
L99F3    STR   '0/BASIC.2L'
         DB    $00
L99FF    ASC   'Could not load Library files.'0D00
L9A1E    ASC   'Volume full writing final file.'0D00
L9A3F    ASC   'Prodos error %x writing final file.'0D00
         ASC   'Compilation completed. File %s, length '
         ASC   '%d blocks.'0D00
L9A97    ASC   0D
         ASC   '*****  %d error(s).'0D00
L9AAD    ASC   'Writing'1A
         ASC   ' %s.'00
L9ABA    ASC   'Writing %s'0D00
L9AC6    ASC   'Initialization Segment'00
L9ADD    ASC   'Main Program'00
L9AEA    ASC   'String and Data Segment'00
L9B02    ASC   'Run Time Libraries.'00
L9B16    ASC   0D00
L9B18    PEA   $0001
         BRA   L9B7F
L9B1D    PEA   $0002
         BRA   L9B7F
L9B22    PEA   $0003
         BRA   L9B7F
L9B27    PEA   $0004
         BRA   L9B7F
L9B2C    PEA   $0005
         BRA   L9B7F
L9B31    PEA   $0006
         BRA   L9B7F
L9B36    PEA   $0007
         BRA   L9B7F
L9B3B    PEA   $0008
         BRA   L9B7F
L9B40    PEA   $0009
         BRA   L9B7F
L9B45    PEA   $000A
         BRA   L9B7F
L9B4A    PEA   $000B
         BRA   L9B7F
L9B4F    PEA   $000C
         BRA   L9B7F
L9B54    PEA   $000D
         BRA   L9B7F
L9B59    PEA   $000E
         BRA   L9B7F
L9B5E    PEA   $000F
         BRA   L9B7F
L9B63    PEA   $0010
         BRA   L9B7F
L9B68    PEA   $0011
         BRA   L9B7F
L9B6D    PEA   $0012
         BRA   L9B7F
L9B72    PEA   $0013
         BRA   L9B7F
         PEA   $0015
         BRA   L9B7F
L9B7C    PEA   $0016
L9B7F    CMP   #$0048
         BNE   L9B89
         PER   L9A1E
         BRA   L9B8D
L9B89    PHA
         PER   L9A3F
L9B8D    PLA
         PHK
         PHK
         PHA
         LDX   $F4
         PHK
         PER   L9B97+2
L9B97    BRL   LAF42
         PEA   $0000
         PEA   $0000
         _ReadChar
         PLA
         BRL   LA3FA
         LDA   $40
         TCS
         LDA   #$0004
         TRB   $72
         LDY   #$000E
         LDA   [$3C],Y
         BEQ   L9BCC
         PEA   $0000
         PEA   $0000
         PHA
         PHK
         PER   L9BC8-1
         BRL   LA487
L9BC8    LDA   $CE
         STA   $28
L9BCC    BRL   L94CA
         DB    $00
L9BD0	 PER   L9BD6-1
         BRL   L9F37
L9BD6    STZ   $00
         PHA
         LDA   $01,S
         BPL   L9C15
         PHK
         PER   L9BE4-1
         BRL   LA89B
L9BE4    AND   #$8000
         PHA
         LDX   $00
         TDC
         CLC
         ADC   #$0100
         TXY
         DEY
         PHK
         PER   L9BF5+2
L9BF5    BRL   LAA4C
         PHK
         PER   L9BFC+2
L9BFC    BRL   LA89B
         TAX
         AND   #$8000
         CMP   $01,S
         BNE   L9C0B
         PLA
         BRL   L9CA0
L9C0B    PLA
         PHK
         PER   L9C10+2
L9C10    BRL   LACE1
         BRA   L9C75
         MX    %00
L9C15    TDC
         PHA
         LDA   #$1B00
         LDX   $00
         LDY   $00
         PHK
         PER   L9C22+2
L9C22    BRL   LA622
         BCC   L9C2A
         BRL   L9F59
L9C2A    PHA
         PEA   $0000
         PLB
         PLB
         LDY   #$0000
         TYA
         LDX   #$0D80
L9C37    STA   ($01,S),Y
         INY
         INY
         DEX
         BEQ   L9C40
         BPL   L9C37
L9C40    PLA
         PLY
         TCD
         STZ   $00
         STY   $FC
         PLX
         STX   $26
         PLA
         STA   $28
         LDA   $26
         BEQ   L9C59
         PLA
         STA   $1C
         PHK
         PLA
         XBA
         STA   $1E
L9C59    TSC
         STA   $FE
         TDC
         CLC
         ADC   #$0F7E
         TCS
         PEA   $0000
         PEA   $0000
         TSC
         STA   $94
         PEI   $28
         PEI   $26
         LDA   $26
         LSR
         LSR
         BCS   L9CA0
L9C75    PHK
         PER   L9C79+2
L9C79    BRL   LAA83
         BCC   L9C81
         BRL   L9F65
L9C81    PHK
         PER   L9C85+2
L9C85    BRL   LA89B
         LDY   #$0100
         BIT   #$0008
         BEQ   L9C93
         LDY   #$0500
L9C93    ASL
         TAX
         TYA
         TXY
         BPL   L9C9C
         ORA   #$0200
L9C9C    ORA   $01,S
         STA   $01,S
L9CA0    PER   L9CA3+2
L9CA3    BRL   LA008
         PHK
         PER   L9CAA+2
L9CAA    BRL   LA8A5
         STA   $BC
         STZ   $BA
         PLA
         XBA
         STA   $EC
         BIT   $EB
         BPL   L9CC6
         PEA   $0000
         _MMStartUp
         PLX
         STX   $BA
L9CC6    PHK
         PLB
         LDY   #$0000
         TDC
         STA   ($01,S),Y
         INY
         INY
         TSC
         INC
         INC
         STA   ($01,S),Y
         PLA
         STA   $6C
         PHK
         PHK
         PER   LA1C7
         PLA
         STA   $F0
         PLA
         STA   $F2
         STA   $6E
         STA   $26
         BIT   $EB
         BPL   L9CEE
         BRL   L9DE3
L9CEE    LDA   $ED
         LSR
         BCS   L9D5D
         PHK
         PER   L9CF7+2
L9CF7    BRL   LA89B
         LSR
         LSR
         BCC   L9D5D
         STZ   $B4
         LSR
         BCC   L9D05
         INC   $B4
L9D05    LDX   #$0002
         PER   L9D0B+2
L9D0B    BRL   LA19D
         BCC   L9D13
         BRL   L9F59
L9D13    LDY   #$0003
         LDA   [$34],Y
         INC
         INC
         CLC
         ADC   $B4
         STA   $A4
         AND   #$FF00
         BEQ   L9D27
         BRL   L9F5F
L9D27    PER   L9D2A+1
L9D2A    BRA   L9D3E
         STA   $F8
         STX   $FA
         INC   $A4
         PER   L9D35+1
L9D35    BRA   L9D3E
         STA   $F4
         STX   $F6
         BRL   L9DCB
L9D3E    PEA   $0000
         PEA   $0000
         PEI   $BC
         PEA   $0001
         PEI   $A4
         _LoadSegNum
         PLA
         PLX
         BCS   L9D57
         RTS

L9D57    PER   LA0A8
         BRL   LA160
L9D5D    PER   L9FDB
         PLY
         STY   $24
         PER   L9D66+2
L9D66    BRL   LA05F
         LDY   $28
         STY   $F8
         LDY   $2A
         STY   $FA
         PER   L9FE7
         PLX
         LDA   $ED
         LSR
         BCC   L9DBB
         PER   L9FCF
         PLX
         STX   $24
         PER   L9D83+2
L9D83    BRL   LA05F
         LDY   $28
         STY   $EC
         LDY   $2A
         STY   $EE
         PHK
         PHK
         PER   LA001
         PLY
         STY   $28
         PLY
         STY   $2A
         LDY   #$0001
         LDA   [$24],Y
         STA   [$28],Y
         PEI   $2A
         PEI   $28
         PEA   $0007
         PHK
         PER   L9DAB+2
L9DAB    BRL   LA57B
         PEI   $1D
         PLB
         PEI   $1C
         TDC
         CLC
         ADC   #$0F7E
         STA   $A2
         RTL

L9DBB    STX   $24
         PER   L9DC0+2
L9DC0    BRL   LA05F
         LDY   $28
         STY   $F4
         LDY   $2A
         STY   $F6
L9DCB    LDX   #$1700
         PHK
         PER   L9DD6
         PEI   $FA
         PEI   $F8
L9DD6    RTL

         LDX   #$0E00
         PHK
         PER   L9DE2
         PEI   $F6
         PEI   $F4
L9DE2    RTL

L9DE3    LDX   #$0002
         PER   L9DE9+2
L9DE9    BRL   LA19D
         BCC   L9DF1
         BRL   L9F59
L9DF1    LDY   $34
         STY   $B6
         LDY   $36
         STY   $B8
         LDY   #$0003
         LDA   [$34],Y
         STA   $A4
         AND   #$FF00
         BEQ   L9E08
         BRL   L9F5F
L9E08    LDA   $AA
         STA   $14
         LDA   $AC
         STA   $16
         LDA   $BA
         BNE   L9E18
         STZ   $14
         STZ   $16
L9E18    INY
         INY
         INY
         INY
         LDA   [$34],Y
         STA   $AE
         INY
         INY
         LDA   [$34],Y
         STA   $B0
         LDY   #$0013
         LDA   [$34],Y
         STA   $AA
         INY
         INY
         LDA   [$34],Y
         STA   $AC
         INY
         INY
         LDA   [$34],Y
         STA   $B2
         INY
         INY
         LDA   [$34],Y
         STA   $B4
         CLC
         ADC   $B2
         BEQ   L9E68
         LDX   $A4
         INX
         INX
         PER   L9E4B+2
L9E4B    BRL   LA19D
         BCC   L9E53
         BRL   L9F5F
L9E53    LDY   $34
         STY   $80
         LDY   $36
         STY   $82
         LDA   $34
         CLC
         ADC   $B2
         STA   $84
         LDA   $00
         ADC   $36
         STA   $86
L9E68    LDX   $00
         LDA   $AC
         LDY   #$8054
         PHK
         PER   L9E73+2
L9E73    BRL   L9F6B
         BCC   L9E7B
         BRL   L9F59
L9E7B    LDA   $16
         CLC
         ADC   $54
         STA   $24
         LDA   $56
         BCC   L9E87
         INC
L9E87    STA   $26
         LDA   $AC
         SEC
         SBC   $16
         BCC   L9E96
         PER   L9E93+2
L9E93    BRL   L9F7A
L9E96    LDX   $00
         LDA   $AA
         LDY   #$8050
         PHK
         PER   L9EA1+2
L9EA1    BRL   L9F6B
         BCC   L9EA9
         BRL   L9F59
L9EA9    LDA   $14
         CLC
         ADC   $50
         STA   $24
         LDA   $52
         BCC   L9EB5
         INC
L9EB5    STA   $26
         LDA   $AA
         SEC
         SBC   $16
         BCC   L9EC4
         PER   L9EC1+2
L9EC1    BRL   L9F7A
L9EC4    LDX   $00
         LDA   $B0
         LDY   #$805C
         PER   L9ECE+2
L9ECE    BRL   L9F6B
         BCC   L9ED6
         BRL   L9F59
L9ED6    LDY   $5C
         STY   $24
         LDY   $5E
         STY   $26
         LDA   $B0
         PER   L9EE3+2
L9EE3    BRL   L9F7A
         LDX   $00
         LDA   $AE
         LDY   #$8058
         PER   L9EF0+1
L9EF0    BRA   L9F6B
         BCS   L9F59
         LDY   $58
         STY   $24
         LDY   $5A
         STY   $26
         LDA   $AE
         PER   L9F01+1
L9F01    BRA   L9F7A
         LDX   $BA
         BNE   L9F2A
         PEA   $0000
         PEA   $0000
         _MaxBlock
         PLY
         PLA
         LSR
         TAX
         TYA
         ROR
         STX   $A8
         STA   $A6
         LDY   #$803C
         PHK
         PER   L9F25+2
L9F25    BRL   LA622
         BCS   L9F59
L9F2A    LDA   $94
         TCS
         PHK
         PER   L9F56+2
         PEI   $F6
         PEI   $F4
         BRA   L9F38
L9F37    RTS

L9F38    LDA   $F4
         CLC
         ADC   #$6D60
         BCS   L9F4C
         LDA   $F8
         CLC
         ADC   #$61A8
         BCS   L9F4C
         LDX   #$0B00
         RTL

L9F4C    PHK
         PER   L9F50+2
L9F50    BRL   LACE1
         PER   LA0CC
L9F56    BRL   LA160
L9F59    PER   LA0F0
         BRL   LA160
L9F5F    PER   LA10D
         BRL   LA160
L9F65    PER   LA142
         BRL   LA160
L9F6B    PHA
         PLA
         BNE   L9F72
         LDA   #$0100
L9F72    PHK
         PER   L9F76+2
L9F76    BRL   LA622
         RTS

L9F7A    TAX
         BEQ   L9F9D
         LDY   #$0000
         LSR
         BCC   L9F92
         TYA
         DEX
         BNE   L9F8F
         SEP   #$20
         STA   [$24]
         REP   #$20
         BRA   L9F9D
L9F8F    STA   [$24],Y
         INY
L9F92    LDA   #$0000
L9F95    STA   [$24],Y
         INY
         INY
         DEX
         DEX
         BNE   L9F95
L9F9D    RTS

L9F9E    STR   '4/BASIC.OVERLAYS/'
         DB    $00
L9FB1    STR   '*/SYSTEM/'
         DB    $00
L9FBC    STR   '1/BASIC.OVERLAYS/'
         DB    $00
L9FCF    STR   '0/BASIC.0L'
         DB    $00
L9FDB    STR   '0/BASIC.1L'
         DB    $00
L9FE7    STR   '0/BASIC.2L'
         DB    $00
L9FF3    ASC   '0/'
         ASC   '1/'
         ASC   '3/'
         ASC   '4/'
         ASC   '5/'
         ASC   '*/'
         DB    $00
         DB    $00
LA001    STR   '0/'
         DB    $00
LA005    PER   LA036
LA008    PHK
         PHK
         PER   L9FBC
         PEA   $0003
         PHK
         PER   LA014+2
LA014    BRL   LA57B
         PHK
         PHK
         PER   L9FB1
         PEA   $0004
         PHK
         PER   LA023+2
LA023    BRL   LA57B
         PHK
         PHK
         PER   L9F9E
         PEA   $0005
         PHK
         PER   LA032+2
LA032    BRL   LA57B
         RTS

LA036    NOP
LA037    LDY   #$0000
LA03A    PER   L9FF3
         PHK
         PLB
         LDA   ($01,S),Y
         BEQ   LA05C
         PLX
         PHY
         LDY   #$0001
         STA   [$24],Y
         PEI   $26
         PEI   $24
         PHK
         PER   LA052+2
LA052    BRL   LA2FC
         PLY
         BCC   LA05E
         INY
         INY
         BRA   LA03A
LA05C    PLX
         SEC
LA05E    RTL

LA05F    PHK
         PER   LA063+1
LA063    BRA   LA037
         STA   $04
         BCC   LA06F
LA069    PER   LA0A8
         BRL   LA160
LA06F    PHA
         PHK
         PER   LA074+2
LA074    BRL   LA537
         BCS   LA069
         PHX
         PHA
         LDY   #$4000
         PHK
         PER   LA082+2
LA082    BRL   LA622
         BCC   LA08D
         PER   LA0F0
         BRL   LA160
LA08D    STA   $28
         STX   $2A
         PHX
         PHA
         PEI   $04
         PHK
         PER   LA099+2
LA099    BRL   LA585
         BCS   LA069
         PEI   $04
         PHK
         PER   LA0A4+2
LA0A4    BRL   LA472
         RTS

LA0A8    ASC   'Failing read of run-time libraries.'00
LA0CC    ASC   'Run-time lib crosses bank boundary.'00
LA0F0    ASC   'Not enough memory available.'00
LA10D    ASC   'Chained file has wrong format.'00
LA12C    ASC   'Type any key to exit.'00
LA142    ASC   'Failing load of system tools.'00
LA160    LDA   #$0014
         TAY
LA164    PLX
         PHA
         PHK
         PHK
         PHX
         PER   LA16C+1
LA16C    BRA   LA193
         _DrawCString
         PLA
         TAY
         CMP   #$0014
         BNE   LA182
         ASL
         PER   LA12C
         BRA   LA164
LA182    PEA   $0000
         PEA   $0000
         _ReadChar
         PLA
         BRL   LA3FA
LA193    PHY
         PHA
         _MoveTo
         RTS

LA19D    LDA   $BA
         BNE   LA1A3
         LDA   $BC
LA1A3    PHA
         PEA   $0001
         PHX
         PEI   $00
         TDC
         CLC
         ADC   #$0032
         PHA
         _GetLoadSegInfo
         BCS   LA1C6
         LDY   #$0002
         LDA   [$34]
         TAX
         LDA   [$34],Y
         STA   $36
         TXA
         STA   $34
LA1C6    RTS

LA1C7    PHB
         PLB
         PHA
         PER   LA1D4
         PLA
         CLC
         ADC   $03,S
         STA   $03,S
         PLA
LA1D4    RTS

         BRL   LA2FC
         BRL   LA354
         BRL   LA455
         BRL   LA472
         BRL   LA487
         BRL   LA49E
         BRL   LA580
         BRL   LA585
         BRL   LA622
         BRL   LA8A5
         BRL   LAF44
         BRL   LAF42
         BRL   LA3FA
         BRL   LA3F0
         BRL   LA537
         BRL   LA8B6
         BRL   LAA4C
         BRL   LA23B
         BRL   LA9CF
         BRL   LA98C
         BRL   LA966
         BRL   LAA83
         BRL   LACE1
         BRL   LB6E0
         BRL   LA8A0
         BRL   LB803
         BRL   LA875
         BRL   LA89B
         BRL   LA850
         BRL   LADE3
         BRL   LA565
         BRL   LA57B
         BRL   LAA7E
         BRL   LAC38
LA23B    PHP
         REP   #$20
         PHY
         PHX
         PHA
         PHB
         LDA   $0A,S
         PHA
         LDA   $02,S
         LDX   #$3D42
         PER   LA24D+1
LA24D    BRA   LA2B0
         PLA
         LDA   $09,S
         LDX   #$3D50
         PER   LA258+1
LA258    BRA   LA2B0
         TDC
         LDX   #$3D44
         PER   LA261+1
LA261    BRA   LA2B0
         TSC
         CLC
         ADC   #$000B
         LDX   #$3D53
         PER   LA26E+1
LA26E    BRA   LA2B0
         LDA   $06,S
         LDX   #$3D59
         PER   LA278+1
LA278    BRA   LA2B0
         LDA   $04,S
         LDX   #$3D58
         PER   LA282+1
LA282    BRA   LA2B0
         LDA   $02,S
         LDX   #$3D41
         PER   LA28C+1
LA28C    BRA   LA2B0
         LDA   #$0A0D
         PER   LA294+1
LA294    BRA   LA2A2
         XBA
         PER   LA29A+1
LA29A    BRA   LA2A2
         PLB
         PLA
         PLX
         PLY
         PLP
         RTL

LA2A2    PHA
         AND   #$007F
         PHA
         _WriteChar
         PLA
         RTS

LA2B0    PHA
         TXA
         PER   LA2B5+1
LA2B5    BRA   LA2A2
         XBA
         PER   LA2BB+1
LA2BB    BRA   LA2A2
         LDA   $01,S
         XBA
         LSR
         LSR
         LSR
         LSR
         PER   LA2C7+1
LA2C7    BRA   LA2E9
         LDA   $01,S
         XBA
         PER   LA2CF+1
LA2CF    BRA   LA2E9
         LDA   $01,S
         LSR
         LSR
         LSR
         LSR
         PER   LA2DA+1
LA2DA    BRA   LA2E9
         LDA   $01,S
         PER   LA2E1+1
LA2E1    BRA   LA2E9
         PLA
         LDA   #$0020
         BRA   LA2A2
LA2E9    AND   #$000F
         CMP   #$000A
         BPL   LA2F6
         ORA   #$0030
         BRA   LA2FA
LA2F6    CLC
         ADC   #$0037
LA2FA    BRA   LA2A2
LA2FC    LDA   $06,S
         AND   #$00FF
         STA   $06,S
         LDY   #$0000
         PHY
         PLB
         PHK
         PHK
         PLB
         PER   LA34A
         PER   LA338
         LDA   $03,S
         STA   ($01,S),Y
         INY
         INY
         LDA   $05,S
         STA   ($01,S),Y
         PLA
         LDA   $08,S
         STA   ($01,S),Y
         INY
         INY
         LDA   $0A,S
         STA   ($01,S),Y
         LDA   $06,S
         STA   $0A,S
         LDA   $04,S
         STA   $08,S
         PLA
         PLA
         PLA
         PLA
         JSL   GSOS
         DW    $0010
LA338    ADRL  $00000000
         BCS   LA349
         PER   LA34A
         PHK
         PLB
         LDY   #$0000
         LDA   ($01,S),Y
         PLY
LA349    RTL

LA34A    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LA354    TAY
         LDA   $06,S
         AND   #$00FF
         STA   $06,S
         TYA
         LDY   #$0002
         PHY
         PLB
         PHK
         PHK
         PLB
         PER   LA3DE
         PHA
         PER   LA3D9
         LDA   $07,S
         STA   ($01,S),Y
         DEY
         DEY
         LDA   $05,S
         STA   ($01,S),Y
         PLA
         LDA   $0A,S
         STA   ($03,S),Y
         INY
         INY
         LDA   $0C,S
         AND   #$00FF
         STA   ($03,S),Y
         INY
         INY
         INY
         INY
         PLA
         STA   ($01,S),Y
         INY
         INY
         TXA
         STA   ($01,S),Y
         PLA
         PLA
         LDA   #$0001
         PER   LA398+1
LA398    BRA   LA3C9
         BCS   LA39F
         BRL   LA2FC
LA39F    CMP   #$0047
         SEC
         BNE   LA3BC
         LDA   #$0002
         PER   LA3AB+1
LA3AB    BRA   LA3C9
         BCS   LA3BC
         LDA   #$0001
         PER   LA3B5+1
LA3B5    BRA   LA3C9
         BCS   LA3BC
         BRL   LA2FC
LA3BC    TAX
         LDA   $01,S
         STA   $05,S
         LDA   $02,S
         STA   $06,S
         PLA
         PLA
         TXA
         RTL

LA3C9    PHK
         PLB
         PER   LA3D7
         LDY   $00
         STA   ($01,S),Y
         PLA
         JSL   GSOS
LA3D7    DW    $0001
LA3D9    ADRL  $00000000
         RTS

LA3DE    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $C3
         DB    $00
         DB    $B0
         DB    $00
         DB    $03
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LA3F0    STA   $08
         TXA
         AND   #$00FF
         STA   $0A
         BRA   LA3FE
LA3FA    STZ   $08
         STZ   $0A
LA3FE    PHK
         PER   LA402+2
LA402    BRL   LACE1
         PEA   $0000
         _MMStartUp
         PLA
         PEA   $0000
         PHA
         PEA   $0000
         PHA
         PHA
         PER   LA41F-1
         BRL   LA942
LA41F    _DisposeAll
         _MMShutDown
         _UserShutDown
         PLA
         _TLShutDown
         LDA   #$0000
         PHA
         PHA
         PEA   $0000
         PEI   $0A
         PEI   $08
         PHK
         PHA
         LDA   #$0029
         PER   LA453-1
         BRL   LA5CB
LA453    BRK   $F0
LA455    LDA   $06,S
         AND   #$00FF
         STA   $06,S
         LDA   #$0002
         PER   LA465-1
LA465    BRL   LA5CB
         TAY
         LDA   $02,S
         STA   $06,S
         LDA   $01,S
         STA   $05,S
         PLA
         PLA
         TYA
         RTL

LA472    LDA   #$0014
         PER   LA47B-1
         BRL   LA5CB
LA47B    TAY
         LDA   $02,S
         STA   $04,S
         LDA   $01,S
         STA   $03,S
         PLA
         TYA
         RTL

LA487    LDA   #$0018
         PER   LA490-1
         BRL   LA5CB
LA490    TAY
         LDA   $02,S
         STA   $08,S
         LDA   $01,S
         STA   $07,S
         PLA
         PLA
         PLA
         TYA
         RTL

LA49E    TAX
         BMI   LA500
         DEC
         BEQ   LA4B1
         BPL   LA4DF
         LDA   #$0016
         PER   LA4AC+2
LA4AC    BRL   LA5CB
         BRA   LA4EA
LA4B1    LDA   #$0017
         PER   LA4B7+2
LA4B7    BRL   LA5CB
         BCS   LA4EA
LA4BC    PER   LA616
         PHK
         PLB
         LDY   #$0000
         LDA   ($01,S),Y
         CLC
         ADC   $08,S
         STA   $08,S
         INY
         INY
         LDA   ($01,S),Y
         ADC   $0A,S
         STA   $0A,S
         PLA
         LDA   #$0016
         PER   LA4DA+2
LA4DA    BRL   LA5CB
         BRA   LA4EA
LA4DF    LDA   #$0019
         PER   LA4E5+2
LA4E5    BRL   LA5CB
         BCC   LA4BC
LA4EA    BCS   LA4F2
         PER   LA4EF+1
LA4EF    BRA   LA554
         CLC
LA4F2    TAY
         LDA   $02,S
         STA   $08,S
         LDA   $01,S
         STA   $07,S
         PLA
         PLA
         PLA
         TYA
         RTL

LA500    LDA   #$0017
         PER   LA506+2
LA506    BRL   LA5CB
         BCS   LA4F2
         PER   LA50E+1
LA50E    BRA   LA554
         STA   $06,S
         TXA
         STA   $08,S
         LDA   #$0019
         PER   LA51B+2
LA51B    BRL   LA5CB
         BCS   LA4F2
         PER   LA523+1
LA523    BRA   LA554
         LDY   #$0000
         SEC
         SBC   $06,S
         BNE   LA533
         TXA
         SBC   $08,S
         BNE   LA533
         DEY
LA533    TYA
         CLC
         BRA   LA4F2
LA537    LDA   #$0019
         PER   LA53D+2
LA53D    BRL   LA5CB
         TAY
         LDA   $02,S
         STA   $04,S
         LDA   $01,S
         STA   $03,S
         PLA
         TYA
         BCC   LA54E
         RTL

LA54E    PER   LA551+1
LA551    BRA   LA554
         RTL

LA554    PER   LA616
         PHK
         PLB
         LDY   #$0002
         LDA   ($01,S),Y
         TAX
         DEY
         DEY
         LDA   ($01,S),Y
         PLY
         RTS

LA565    LDA   #$000A
LA568    PER   LA56B+1
LA56B    BRA   LA5CB
         TAY
         LDA   $02,S
         STA   $08,S
         LDA   $01,S
         STA   $07,S
         TYA
         PLY
         PLY
         PLY
         RTL

LA57B    LDA   #$0009
         BRA   LA568
LA580    LDX   #$0013
         BRA   LA588
LA585    LDX   #$0012
LA588    LDA   $08,S
         AND   #$00FF
         STA   $08,S
         TXA
         PER   LA593+1
LA593    BRA   LA5CB
         TAX
         LDA   $02,S
         STA   $0C,S
         LDA   $01,S
         STA   $0B,S
         BCS   LA5B8
         TSC
         CLC
         ADC   #$000A
         TCS
         LDY   #$0002
         PER   LA61E
         PHK
         PLB
         LDA   ($01,S),Y
         TAX
         DEY
         DEY
         LDA   ($01,S),Y
         PLY
         CLC
         RTL

LA5B8    TSC
         CLC
         ADC   #$000A
         TCS
         TXA
         CMP   #$004C
         SEC
         BNE   LA5CA
         CLC
         LDA   #$0000
         TAX
LA5CA    RTL

LA5CB    LDY   #$0000
         PHY
         PLB
         PHK
         PHK
         PLB
         PER   LA614
         PER   LA60D
         STA   ($01,S),Y
         INY
         INY
         LDA   $03,S
         STA   ($01,S),Y
         INY
         INY
         LDA   $05,S
         STA   ($01,S),Y
         PLA
         LDY   #$0000
         LDA   $0A,S
         STA   ($01,S),Y
         INY
         INY
         LDA   $0C,S
         STA   ($01,S),Y
         INY
         INY
         LDA   $0E,S
         STA   ($01,S),Y
         INY
         INY
         LDA   $10,S
         STA   ($01,S),Y
         INY
         INY
         LDA   $12,S
         STA   ($01,S),Y
         PLA
         PLA
         JSL   GSOS
LA60D    DW    $0000
         ADRL  $00000000
         RTS

LA614    DB    $00
         DB    $00
LA616    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LA61E    DB    $00
         DB    $00
         DB    $00
         DB    $00
LA622    PEI   $04
         PHA
         TSC
         STA   $04
         TYA
         AND   #$00FF
         BEQ   LA66B
         PHX
         PHY
         PER   LA633+2
LA633    BRL   LA909
         BCS   LA669
         PHY
         PER   LA63C+2
LA63C    BRL   LA7D6
         PLY
         INY
         INY
         PLA
         PLX
         PLA
         PHX
         PHA
         PER   LA794
         PHK
         PLB
         LDA   ($01,S),Y
         TAX
         INY
         INY
         LDA   ($01,S),Y
         PLY
         PHA
         PHX
         _SetHandleSize
         PHP
         PHA
         PER   LA662+2
LA662    BRL   LA7DF
         PLX
         PLP
         BRA   LA6B0
LA669    PLY
         PLX
LA66B    PLA
         PEA   $0000
         PEA   $0000
         PHX
         PHA
         TYA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PER   LA794
         PHK
         PLB
         LDY   #$0000
         STA   ($01,S),Y
         INY
         INY
         LDA   ($01,S),Y
         BNE   LA6B9
         _TLStartUp
         PEA   $0000
         _MMStartUp
         TAX
         PLA
         BCS   LA6AF
         LDY   #$0004
         PHK
         PLB
         STA   ($01,S),Y
         BRA   LA6C7
LA6AF    SEC
LA6B0    LDA   $04
         TCS
         PLA
         PLA
         STA   $04
         TXA
         RTL

LA6B9    CMP   #$003C
         BMI   LA6C3
         LDX   #$0201
         BRA   LA6AF
LA6C3    INY
         INY
         LDA   ($01,S),Y
LA6C7    STA   $09,S
         LDY   #$0000
         LDA   ($01,S),Y
         LDX   #$C000
         AND   #$00FF
         BEQ   LA6D9
         LDX   #$8000
LA6D9    LDA   ($01,S),Y
         BMI   LA6E6
         ASL
         BMI   LA6E9
         TXA
         ORA   #$0005
         BRA   LA6ED
LA6E6    TXA
         BRA   LA6ED
LA6E9    TXA
         ORA   #$0010
LA6ED    STA   $07,S
         LDY   #$0002
         TAX
         LDA   #$0006
         CLC
         ADC   ($01,S),Y
         TAY
         TXA
         AND   #$FF00
         STA   ($01,S),Y
         TYX
         LDY   #$0000
         LDA   ($01,S),Y
         AND   #$00FF
         TXY
         ORA   ($01,S),Y
         STA   ($01,S),Y
         PLA
         PER   LA712+2
LA712    BRL   LA7D6
         LDY   #$AAA0
         LDA   $05,S
         TAX
         _NewHandle
         PHP
         PHA
         PER   LA727+2
LA727    BRL   LA7DF
         PLX
         PLP
         PER   LA794
         BCC   LA734
         BRL   LA6AF
LA734    PHK
         PLB
         LDA   #$0006
         LDY   #$0002
         CLC
         ADC   ($01,S),Y
         TAX
         LDA   #$0006
         CLC
         ADC   ($01,S),Y
         STA   ($01,S),Y
         TXY
         INY
         INY
         LDA   $03,S
         STA   ($01,S),Y
         INY
         INY
         LDA   $05,S
         STA   ($01,S),Y
         XBA
         STA   $01,S
         PLB
         PLB
         LDY   #$0002
         LDA   ($01,S),Y
         STA   $03,S
         DEY
         DEY
         LDA   ($01,S),Y
         STA   $01,S
         PER   LA794
         PHK
         PLB
         LDA   #$00FF
         AND   ($01,S),Y
         BEQ   LA77F
         TAX
         LDA   $03,S
         STA   $00,X
         LDA   $05,S
         AND   #$00FF
         STA   $02,X
LA77F    PLA
         LDA   $03,S
         LDA   $01,S
         PLA
         PLX
         PLY
         STY   $04
         RTL

LA78A    DB    $00
         DB    $00
         DB    $00
         DB    $00
LA78E    DB    $00
         DB    $00
LA790    DB    $00
         DB    $00
         DB    $00
         DB    $00
LA794    DB    $00
         DB    $00
         DB    $00
         DB    $00
LA798    DB    $00
         DB    $00
LA79A    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LA7D6    LDX   #$2202
         PER   LA7DC+1
LA7DC    BRA   LA7F0
         RTS

LA7DF    LDX   #$2002
         PER   LA7E5+1
LA7E5    BRA   LA7F0
         LDX   #$0000
         PER   LA7ED+1
LA7ED    BRA   LA7F0
         RTS

LA7F0    PHX
         PER   LA794
         PHK
         PLB
         LDY   #$0002
         LDA   ($01,S),Y
         PER   LA79A
         TAY
LA7FF    DEY
         DEY
         BMI   LA828
         LDA   ($01,S),Y
         PHA
         DEY
         DEY
         LDA   ($03,S),Y
         PHA
         DEY
         DEY
         LDA   ($05,S),Y
         TAX
         ASL
         BMI   LA824
         TYA
         STA   $07,S
         LDA   $09,S
         BEQ   LA82C
         TAX
         JSL   $E10000
         LDA   $03,S
         TAY
         BRA   LA7FF
LA824    PLA
         PLA
         BRA   LA7FF
LA828    PLA
         PLA
         PLA
         RTS

LA82C    TXA
         AND   #$00FF
         BEQ   LA824
         TAX
         LDA   $03,S
         XBA
         PHA
         PLB
         PLB
         LDY   #$0000
         LDA   ($01,S),Y
         STA   $00,X
         INY
         INY
         LDA   ($01,S),Y
         AND   #$00FF
         STA   $02,X
         PHK
         PLB
         LDA   $07,S
         TAY
         BRA   LA824
LA850    PER   LA78E
         PEA   $0000
         _GetMasterSCB
         PHK
         PLB
         LDY   #$0000
         PLX
         BEQ   LA86C
         LDA   #$7FFF
         AND   ($01,S),Y
         BRA   LA871
LA86C    LDA   #$8000
         ORA   ($01,S),Y
LA871    STA   ($01,S),Y
         PLY
         RTL

LA875    PER   LA78E
         PHK
         PLB
         LDY   #$0000
         STA   ($01,S),Y
         PLY
         RTL

LA881    PHY
         PHA
         PER   LA78E
         PHK
         PLB
         LDY   #$0000
         CLV
         LDA   ($01,S),Y
         LSR
         BCC   LA893
         SEP   #$40
LA893    ASL
         ASL
         STA   $05,S
         PLY
         PLA
         PLY
         RTS

LA89B    PER   LA78E
         BRA   LA8A8
LA8A0    PER   LA790
         BRA   LA8A8
LA8A5    PER   LA798
LA8A8    LDY   #$0002
         PHK
         PLB
         LDA   ($01,S),Y
         TAX
         DEY
         DEY
         LDA   ($01,S),Y
         PLY
         RTL

LA8B6    PER   LA8B9+1
LA8B9    BRA   LA909
         BCC   LA8BE
         RTL

LA8BE    PHA
         PER   LA794
         PHK
         PLB
         INY
         INY
         LDA   ($01,S),Y
         PHX
         TAX
         INY
         INY
         LDA   ($03,S),Y
         PHY
         PHA
         PHX
         _DisposeHandle
         PLY
         PLX
         PER   LA78E
         INY
         INY
LA8DF    DEX
         DEX
         DEX
         BEQ   LA8FA
         BMI   LA8FA
         LDA   ($03,S),Y
         STA   ($01,S),Y
         INY
         INY
         LDA   ($03,S),Y
         STA   ($01,S),Y
         INY
         INY
         LDA   ($03,S),Y
         STA   ($01,S),Y
         INY
         INY
         BRA   LA8DF
LA8FA    PLY
         LDY   #$0002
         LDA   ($01,S),Y
         SEC
         SBC   #$0006
         STA   ($01,S),Y
         PLY
         PLY
         RTL

LA909    PHA
         PER   LA794
         PHK
         PLB
         LDY   #$0002
         LDA   ($01,S),Y
         BEQ   LA93F
         BMI   LA93F
         CMP   #$003D
         BPL   LA93F
         LSR
         TAX
         INY
         INY
         INY
         INY
LA923    LDA   ($01,S),Y
         AND   #$00FF
         CMP   $03,S
         BEQ   LA93B
         INY
         INY
         INY
         INY
         INY
         INY
         DEX
         DEX
         DEX
         BEQ   LA93F
         BMI   LA93F
         BRA   LA923
LA93B    CLC
LA93C    PLA
         PLA
         RTS

LA93F    SEC
         BRA   LA93C
LA942    PER   LA794
         PHK
         PLB
         LDY   #$0004
         CMP   ($01,S),Y
         BEQ   LA964
         LDA   ($01,S),Y
         STA   $01,S
         BEQ   LA964
         PHA
         PHA
         _DisposeAll
         _MMShutDown
LA964    PLA
         RTS

LA966    LDA   $06,S
         AND   #$00FF
         STA   $06,S
         LDA   $0A,S
         AND   #$00FF
         STA   $0A,S
         LDA   #$0004
         PER   LA97A+2
LA97A    BRL   LA5CB
         TAX
         LDA   $02,S
         STA   $0A,S
         LDA   $01,S
         STA   $09,S
         PLA
         PLA
         PLA
         PLA
         TXA
         RTL

LA98C    LDA   $06,S
         PHA
         LDA   $06,S
         PHA
         LDA   $06,S
         STA   $0A,S
         LDA   $05,S
         STA   $09,S
         TXA
         STA   $07,S
         TYA
         STA   $05,S
         PHK
         PER   LA9A4+1
LA9A4    BRA   LA9CF
         PLY
         PLX
         BCS   LA9CE
         PER   LAA32
         PHK
         PLB
         TYA
         INY
         BEQ   LA9B8
         LDY   #$0008
         STA   ($01,S),Y
LA9B8    LDY   #$0006
         TXA
         INX
         BEQ   LA9C1
         STA   ($01,S),Y
LA9C1    PLA
         PER   LAA2B
         LDA   #$0005
         PER   LA9CB+1
LA9CB    BRA   LAA22
         PLX
LA9CE    RTL

LA9CF    PER   LAA32
         PHK
         PLB
         LDY   #$0000
         LDA   $06,S
         STA   ($01,S),Y
         LDA   $08,S
         AND   #$00FF
         INY
         INY
         STA   ($01,S),Y
         PLA
         PER   LAA2B
         LDY   #$0002
         STA   ($01,S),Y
         INY
         INY
         PHK
         PHK
         PLA
         AND   #$00FF
         STA   ($01,S),Y
         LDA   #$0006
         PER   LA9FD+1
LA9FD    BRA   LAA22
         PLX
         BCS   LAA13
         PER   LAA32
         PHK
         PLB
         LDY   #$0006
         LDA   ($01,S),Y
         TAX
         INY
         INY
         LDA   ($01,S),Y
         TAY
         PLA
LAA13    PHA
         LDA   $04,S
         STA   $08,S
         LDA   $03,S
         STA   $07,S
         PLA
         STA   $03,S
         PLA
         PLA
         RTL

LAA22    LDY   #$0000
         STA   ($03,S),Y
         JSL   GSOS
LAA2B    DW    $0006
         ADRL  $00000000
         RTS

LAA32    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
LAA4C    PEI   $3E
         PEI   $3C
         STA   $3C
         STX   $3E
         PHK
         PLB
         PER   LA78A
         TYX
         LDY   #$0000
LAA5D    TXA
         BPL   LAA66
         LDA   [$3C],Y
         STA   ($01,S),Y
         BRA   LAA6F
LAA66    LDA   ($01,S),Y
         STA   [$3C],Y
         TXA
         BNE   LAA6F
         STA   ($01,S),Y
LAA6F    INY
         INY
         CPY   #$004C
         BMI   LAA5D
         PLA
         PLA
         STA   $3C
         PLA
         STA   $3E
         RTL

LAA7E    LDA   #$8000
         BRA   LAA86
LAA83    LDA   #$0000
LAA86    PEI   $06
         PEI   $04
         STZ   $04
         STA   $06
         PER   LA78A
         PHK
         PLB
         LDY   #$000E
         LDA   ($01,S),Y
         STA   $01,S
         _MTStartUp
         BCC   LAAA6
         BRL   LAC27
LAAA6    LDA   #$0008
         TSB   $04
         _QDShutDown
         _CtlShutDown
         LDA   $01,S
         TAX
         TDC
         CLC
         ADC   #$1000
         PHA
         LDA   #$0080
         PER   LAAC8+2
LAAC8    BRL   LA881
         BCC   LAAD0
         LDA   #$0000
LAAD0    PHA
         PEA   $00A0
         PHX
         _QDStartUp
         BCC   LAAE1
         BRL   LAC27
LAAE1    LDA   $01,S
         TAX
         LDA   #$0010
         TSB   $04
         TDC
         CLC
         ADC   #$1300
         PHA
         PEA   $0014
         PEA   $0000
         LDA   #$0280
         PER   LAAFB+2
LAAFB    BRL   LA881
         BCC   LAB01
         LSR
LAB01    PHA
         PEA   $0000
         PEA   $00C8
         PHX
         _EMStartUp
         BCC   LAB15
         BRL   LAC27
LAB15    LDA   #$0040
         TSB   $04
         BIT   $06
         BMI   LAB2F
         PHK
         PHK
         PER   LAC9F
         _LoadTools
         BCC   LAB2F
         BRL   LAC27
LAB2F    PLX
         PHX
         PHX
         _WindStartUp
         LDA   #$4000
         TSB   $04
         PEA   $0000
         PEA   $0000
         _RefreshDesktop
         PLX
         PHX
         PHX
         TDC
         CLC
         ADC   #$1400
         PHA
         _CtlStartUp
         BCC   LAB60
         BRL   LAC27
LAB60    PLX
         PHX
         PHX
         LDA   #$0001
         TSB   $06
         TDC
         CLC
         ADC   #$1600
         PHA
         _MenuStartUp
         BCC   LAB7A
         BRL   LAC27
LAB7A    LDA   #$8000
         TSB   $04
         PLX
         PHX
         PHX
         TDC
         CLC
         ADC   #$1500
         PHA
         _LEStartUp
         BCC   LAB94
         BRL   LAC27
LAB94    LDA   #$0010
         TSB   $06
         PEA   $0100
         _LESetScrapLen
         PLX
         PHX
         PHX
         _DialogStartUp
         BCS   LAC27
         LDA   #$0020
         TSB   $06
         _ScrapStartUp
         BCS   LAC27
         LDA   #$0040
         TSB   $06
         _DeskStartUp
         BCS   LAC27
         LDA   #$0020
         TSB   $04
         _QDAuxStartUp
         BCS   LAC27
         LDA   #$0004
         TSB   $06
         TDC
         CLC
         ADC   #$1800
         PHA
         _SoundStartUp
         BCS   LAC27
         LDA   #$0100
         TSB   $04
         LDA   #$0200
         TSB   $06
         _ShowCursor
         PEA   $0014
         PEA   $0014
         _MoveTo
         PEA   $0000
         _SetBackColor
         PEA   $0007
         _SetForeColor
         PLY
         PER   LAC23+1
LAC23    BRA   LAC81
         CLC
         RTL

LAC27    PLY
         PHA
         PER   LAC2C+1
LAC2C    BRA   LAC81
         PHK
         PER   LAC32+2
LAC32    BRL   LACE1
         PLA
         SEC
         RTL

LAC38    PER   LA78A
         LDY   #$0002
         PHK
         PLB
         LDA   ($01,S),Y
         BIT   #$0800
         CLC
         BNE   LAC7C
         PHK
         PER   LAC4C+2
LAC4C    BRL   LA8A5
         PHA
         PHA
         TDC
         CLC
         ADC   #$1700
         PHA
         _FMStartUp
         BCS   LAC7E
         TDC
         CLC
         ADC   #$1A00
         PHA
         _PMStartUp
         BCS   LAC7C
         PHK
         PLB
         LDY   #$0002
         LDA   ($01,S),Y
         ORA   #$0808
         STA   ($01,S),Y
         CLC
LAC7C    PLY
         RTL

LAC7E    PLY
         BRA   LAC7C
LAC81    PER   LA78A
         PHK
         PLB
         LDY   #$0000
         LDA   $04
         STA   ($01,S),Y
         INY
         INY
         LDA   $06
         ASL
         LSR
         STA   ($01,S),Y
         PLX
         PLX
         PLA
         STA   $04
         PLA
         STA   $06
         PHX
         RTS

LAC9F    DB    $10
         DB    $00
         DB    $04
         DB    $00
         DB    $00
         DB    $00
         DB    $05
         DB    $00
         DB    $00
         DB    $00
         DB    $06
         DB    $00
         DB    $00
         DB    $00
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $0E
         DB    $00
         DB    $00
         DB    $00
         DB    $10
         DB    $00
         DB    $00
         DB    $00
         DB    $0F
         DB    $00
         DB    $00
         DB    $00
         DB    $12
         DB    $00
         DB    $00
         DB    $00
         DB    $13
         DB    $00
         DB    $00
         DB    $00
         DB    $14
         DB    $00
         DB    $00
         DB    $00
         DB    $15
         DB    $00
         DB    $00
         DB    $00
         DB    $16
         DB    $00
         DB    $00
         DB    $00
         DB    $17
         DB    $00
         DB    $00
         DB    $00
         DB    $19
         DB    $00
         DB    $00
         DB    $00
         DB    $1B
         DB    $00
         DB    $00
         DB    $00
         DB    $1C
         DB    $00
         DB    $00
         DB    $00
LACE1    PEI   $04
         STZ   $04
         PHK
         PLB
         PER   LA78A
         LDY   #$0002
         LDX   #$000F
         LDA   ($01,S),Y
         LSR
         BCC   LACF7
         INC   $04
LACF7    ASL
         PHA
         LDA   #$0000
         STA   ($03,S),Y
         PLA
LACFF    BEQ   LAD17
         INX
         LSR
         BCC   LACFF
         PHA
         CPX   #$0011
         BEQ   LAD14
         PHX
         TXA
         PHK
         PER   LAD11+1
LAD11    BRA   LAD68
         PLX
LAD14    PLA
         BRA   LACFF
LAD17    PHK
         PLB
         LDY   #$0000
         LDA   ($01,S),Y
         AND   #$FFF8
         TSB   $04
         TYA
         STA   ($01,S),Y
         PLA
         PER   LAD4A
LAD2A    LDA   ($01,S),Y
         BEQ   LAD44
         INY
         INY
         AND   $04
         BEQ   LAD40
         LDA   ($01,S),Y
         PHY
         PHK
         PER   LAD3B+1
LAD3B    BRA   LAD68
         PLY
         PHK
         PLB
LAD40    INY
         INY
         BRA   LAD2A
LAD44    PLA
         PLA
         STA   $04
         CLC
         RTL

LAD4A    DB    $00
         DB    $01
         DB    $08
         DB    $00
         DB    $20
         DB    $00
         DB    $05
         DB    $00
         DB    $00
         DB    $80
         DB    $0F
         DB    $00
         DB    $00
         DB    $40
         DB    $0E
         DB    $00
         DB    $01
         DB    $00
         DB    $10
         DB    $00
         DB    $40
         DB    $00
         DB    $06
         DB    $00
         DB    $10
         DB    $00
         DB    $04
         DB    $00
         DB    $00
         DB    $00
LAD68    ASC   'b>'00
         PHK
         PLB
         ASL
         TAY
         LDA   ($01,S),Y
         BEQ   LADA6
         PLY
         TAX
         INC
         BEQ   LAD80
         INC
         BEQ   LAD90
         JSL   $E10000
         RTL

LAD80    PHK
         PER   LAD84+2
LAD84    BRL   LA8A5
         PHA
         _MMShutDown
         RTL

LAD90    PHK
         PER   LAD94+2
LAD94    BRL   LA8A5
         PEA   $0000
         PHA
         PEA   $0000
         _LoaderShutDown
         RTL

LADA6    PLA
         CLC
         RTL

         DB    $00
         DB    $00
         DB    $01
         DB    $03
         DB    $FF
         DB    $FF
         DB    $00
         DB    $00
         DB    $04
         DB    $03
         DB    $05
         DB    $03
         DB    $06
         DB    $03
         DB    $00
         DB    $00
         DB    $08
         DB    $03
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0E
         DB    $03
         DB    $0F
         DB    $03
         DB    $10
         DB    $03
         DB    $FE
         DB    $FF
         DB    $12
         DB    $03
         DB    $13
         DB    $03
         DB    $14
         DB    $03
         DB    $15
         DB    $03
         DB    $16
         DB    $03
         DB    $17
         DB    $03
         DB    $00
         DB    $00
         DB    $19
         DB    $03
         DB    $00
         DB    $00
         DB    $1B
         DB    $03
         DB    $1C
         DB    $03
LADE3    PHD
         PHY
         PHX
         PHA
         TSC
         SEC
         SBC   #$001B
         TCD
         DEC
         TCS
         STZ   $00
         PEA   $0000
         PEA   $0000
         _GetPort
         PLY
         PLX
         BCC   LAE05
         BRL   LAEC6
LAE05    STY   $04
         STX   $06
         PHK
         PER   LAE0D+2
LAE0D    BRL   LA850
         STA   $1A
         PHK
         PLB
         PER   LAECF
         PER   LAEF6
         LDY   #$0000
         LDA   ($03,S),Y
         STA   ($01,S),Y
         PLA
         PER   LAF2E+2
         INY
         INY
         TYX
LAE28    LDA   ($03,S),Y
         STA   ($01,S),Y
         INY
         INY
         LDA   ($03,S),Y
         BIT   $1A
         BPL   LAE35
         LSR
LAE35    STA   ($01,S),Y
         INY
         INY
         DEX
         BNE   LAE28
         PLA
         PER   LAF2E
         TXY
         TXA
         STA   ($01,S),Y
         INY
         INY
         STA   ($01,S),Y
         STA   $01,S
         STA   $03,S
         PHK
         PHK
         PER   LAEF4
         _NewWindow
         BCS   LAEBB
         PLA
         PLX
         PHX
         PHA
         PHX
         PHA
         _SetPort
         LDA   #$0028
         BIT   $1A
         BPL   LAE70
         LSR
         LSR
LAE70    PHA
         LDY   $20
         BNE   LAE7A
         LDX   #$0017
         BRA   LAE93
LAE7A    PHA
         PEA   $000F
         _MoveTo
         PEI   $1E
         PEI   $1C
         _DrawString
         LDX   #$001E
LAE93    PHX
         _MoveTo
         LDA   $1C
         CLC
         ADC   $20
         TAX
         LDA   $1E
         BCC   LAEA6
         INC
LAEA6    PHA
         PHX
         _DrawString
         PER   LAEB2+1
LAEB2    BRA   LAED9
         _CloseWindow
LAEBB    PEI   $06
         PEI   $04
         _SetPort
LAEC6    TDC
         CLC
         ADC   #$0021
         TCS
         PLD
         CLC
         RTL

LAECF    DW    $0020
         DW    $003C
         DW    $0064
         DW    $0064
         DW    $0208
LAED9    PEA   $0000
         PEA   $000A
         PEI   $00
         TDC
         CLC
         ADC   #$000C
         PHA
         _GetNextEvent
         PLA
         LDA   $0C
         BEQ   LAED9
         RTS

LAEF4    DW    $004E
LAEF6    DW    $D4A0      ; frame bits
         ADRL  $00000000  ; title ptr
         ADRL  $00000101  ; refcon
         DW    $0000      ; zoom rect
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  $00000000  ; color table ptr
         DW    $0000      ; origin
         DW    $0000
         DW    $00AE      ; data size
         DW    $0280
         DW    $00AE      ; max size
         DW    $0280
         DW    $0000      ; scroll size
         DW    $0000
         DW    $0000      ; page size
         DW    $0000
         ADRL  $00000000  ; info bar refcon
         DW    $0000      ; info bar hite
         ADRL  $00000000  ; window defproc
         ADRL  $00000000  ; info bar defproc
LAF2E    ADRL  $00000000  ; content defproc
         DW    $0019      ; content rect
         DW    $0002
         DW    $00C7
         DW    $026A
         ADRL  $FFFFFFFF  ; starting plane
         ADRL  $00000000  ; storage ptr
LAF42    BRA   LAF47
LAF44    LDX   #$8FF1
LAF47    TSC
         TAY
         SEC
         SBC   #$00BA
         TCS
         PEI   $26
         PEI   $24
         PEI   $04
         PHD
         INC
         INC
         TCD
         PLA
         STA   $26
         PLA
         STA   $50
         INC
         STA   $52
         PLA
         STA   $4C
         PLA
         STA   $4E
         STY   $24
         STX   $44
         INY
         INY
         INY
         INY
         STY   $18
         STZ   $1A
         LDA   [$18]
         STA   $14
         INC   $18
         INC   $18
         LDA   [$18]
         STA   $16
         INC   $18
         INC   $18
         TDC
         CLC
         ADC   #$0054
         STA   $20
         STZ   $22
         LDA   #$0050
         CLC
         ADC   $20
         STA   $04
         STZ   $00
         STZ   $48
LAF98    LDA   $04
         CMP   $20
         BCS   LAFA4
         PER   LAFA1+2
LAFA1    BRL   LB166
LAFA4    LDA   [$14]
         INC   $14
         BNE   LAFAC
         INC   $16
LAFAC    AND   #$00FF
         CMP   #$0025
         BEQ   LAFF9
         STA   [$20]
         PHA
         PLA
         BMI   LAFC9
         BEQ   LAFC9
         INC   $20
         INC   $48
         CMP   #$000D
         BNE   LAF98
         STZ   $48
         BRA   LAF98
LAFC9    LDA   $00
         STA   [$20]
         PER   LAFD0+2
LAFD0    BRL   LB166
         LDX   $44
         CPX   #$FFF6
         BNE   LAFF2
         LDY   $52
         LDA   $00
         STA   [$4C],Y
         TYA
         SEC
         SBC   $50
         DEC
         STA   $04
         LDY   $50
         LDA   #$FF00
         AND   [$4C],Y
         ORA   $04
         STA   [$4C],Y
LAFF2    LDA   $24
         TCS
         LDA   $26
         TCD
         RTL

LAFF9    STZ   $10
         STZ   $12
LAFFD    LDA   [$14]
         INC   $14
         BNE   LB005
         INC   $16
LB005    AND   #$00FF
         SEP   #$20
         CMP   #$44
         BEQ   LB07F
         CMP   #$63
         BNE   LB015
         BRL   LB0DE
LB015    CMP   #$64
         BEQ   LB086
         CMP   #$58
         BNE   LB020
         BRL   LB0B3
LB020    CMP   #$30
         BNE   LB02C
         TAX
         LDA   [$14]
         CMP   #$78
         BEQ   LB0A9
         TXA
LB02C    CMP   #$53
         BNE   LB033
         BRL   LB115
LB033    CMP   #$43
         BNE   LB03A
         BRL   LB0F6
LB03A    CMP   #$73
         BNE   LB041
         BRL   LB130
LB041    CMP   #$78
         BEQ   LB0C2
         CMP   #$62
         BNE   LB04C
         BRL   LB14B
LB04C    CMP   #$3A
         BPL   LB06B
         CMP   #$30
         BMI   LB06B
         SEC
         SBC   #$30
         REP   #$20
         PHA
         ASL   $10
         LDA   $10
         ASL
         ASL
         CLC
         ADC   $10
         CLC
         ADC   $01,S
         STA   $10
         PLA
         BRA   LAFFD
LB06B    XBA
         SEP   #$20
         LDA   #$25
         REP   #$20
         STA   [$20]
         INC   $20
         INC   $20
         INC   $48
         INC   $48
         BRL   LAF98
LB07F    REP   #$20
         LDA   #$0020
         BRA   LB08D
LB086    REP   #$20
         LDA   #$0030
         STA   $0C
LB08D    STA   $0C
         LDA   [$18]
         STA   $08
         INC   $18
         INC   $18
         LDA   [$18]
         STA   $0A
         INC   $18
         INC   $18
         PHK
         PER   LB0A6-1
         BRL   LB5A7
LB0A6    BRL   LAF98
LB0A9    REP   #$20
         STA   $12
         INC   $14
         BNE   LB0B3
         INC   $16
LB0B3    REP   #$20
         LDA   #$7830
         STA   [$20]
         INC   $20
         INC   $20
         INC   $48
         INC   $48
LB0C2    REP   #$20
         LDA   [$18]
         STA   $08
         INC   $18
         INC   $18
         LDA   [$18]
         STA   $0A
         INC   $18
         INC   $18
         PHK
         PER   LB0DB-1
         BRL   LB458
LB0DB    BRL   LAF98
LB0DE    REP   #$20
         LDA   [$18]
         INC   $18
         INC   $18
         INC   $18
         INC   $18
         LDX   $10
         BEQ   LB0FA
         CMP   $10
         BCC   LB0FA
         LDA   $10
         BRA   LB0FA
LB0F6    REP   #$20
         LDA   $10
LB0FA    SEC
         SBC   $48
         DEC
         BPL   LB103
         BRL   LAF98
LB103    BNE   LB108
         BRL   LAF98
LB108    STA   $08
         STZ   $0A
         PER   LB112-1
         BRL   LB4C8
LB112    BRL   LAF98
LB115    REP   #$20
         LDA   [$18]
         STA   $08
         INC   $18
         INC   $18
         LDA   [$18]
         STA   $0A
         INC   $18
         INC   $18
         PER   LB12D-1
         BRL   LB4C8
LB12D    BRL   LAF98
LB130    REP   #$20
         LDA   [$18]
         STA   $1C
         INC   $18
         INC   $18
         LDA   [$18]
         STA   $1E
         INC   $18
         INC   $18
         PER   LB148-1
         BRL   LB4F7
LB148    BRL   LAF98
LB14B    REP   #$20
         LDA   [$18]
         STA   $1C
         INC   $18
         INC   $18
         LDA   [$18]
         STA   $1E
         INC   $18
         INC   $18
         PER   LB163-1
         BRL   LB538
LB163    BRL   LAF98
LB166    LDA   $20
         STA   $46
         TDC
         CLC
         ADC   #$0054
         STA   $20
         STZ   $22
         LDA   $46
         SEC
         SBC   $20
         STA   $04
         STZ   $06
         LDX   $44
         BPL   LB1A0
         CPX   #$FFF6
         BNE   LB1A0
         LDY   $52
LB187    DEC   $04
         BMI   LB19C
         LDA   [$20]
         AND   #$007F
         CMP   #$000D
         BEQ   LB198
         STA   [$4C],Y
         INY
LB198    INC   $20
         BRA   LB187
LB19C    STY   $52
         BRA   LB1E1
LB1A0    CPX   #$8FF1
         BNE   LB1C9
LB1A5    DEC   $04
         BMI   LB1E1
         LDA   [$20]
         AND   #$007F
         PHA
         CMP   #$000D
         BNE   LB1BE
         PEA   $000A
         _WriteChar
LB1BE    _WriteChar
         INC   $20
         BRA   LB1A5
LB1C9    INX
         BEQ   LB1F3
         DEX
         PEI   $06
         PEI   $04
         PEI   $00
         TDC
         CLC
         ADC   #$0054
         PHA
         PHX
         PHK
         PER   LB1E1-1
         BRL   LA580
LB1E1    TDC
         CLC
         ADC   #$0054
         STA   $20
         STZ   $22
         LDA   #$0050
         CLC
         ADC   $20
         STA   $04
         RTS

LB1F3    LDAL  $00FFE6	; LOGO BUG?
         INC
         BEQ   LB1A5
         PEA   $0000
         _WindVersion
         PLA
         BCS   LB1A5
LB207    DEC   $04
         BMI   LB1E1
         LDA   [$20]
         AND   #$00FF
         CMP   #$000D
         BNE   LB21F
         PER   LB21A-1
         BRA   LB22B
LB21A    BCS   LB1A5
         LDA   #$000A
LB21F    PER   LB224-1
         BRA   LB22B
LB224    INC   $20
         BCC   LB207
         BRL   LB1A5
LB22B    STA   $42
         PER   LB233-1
         BRL   LB40E
LB233    LDA   $42
         INC
         BEQ   LB264
         DEC
         AND   #$007F
         CMP   #$007F
         BNE   LB264
         LDA   #$0008
         STA   $42
         PER   LB24B-1
         BRA   LB264
LB24B    BCC   LB250
         BRL   LB40C
LB250    LDA   #$0020
         STA   $42
         PER   LB25A-1
         BRA   LB264
LB25A    BCC   LB25F
         BRL   LB40C
LB25F    LDA   #$0008
         STA   $42
LB264    PEI   $00
         TDC
         CLC
         ADC   #$0028
         PHA
         _GetFontInfo
         BCC   LB278
         BRL   LB40C
LB278    LDA   $28
         CLC
         ADC   $2A
         CLC
         ADC   $2E
         STA   $2E
         PEI   $00
         TDC
         CLC
         ADC   #$0030
         PHA
         _GetPen
         BCC   LB296
         BRL   LB40C
LB296    LDA   #$001A
         CMP   $42
         BNE   LB2C4
         LDA   $32
         STA   $2A
         LDA   $30
         SEC
         SBC   $28
         STA   $28
         CLC
         ADC   $2E
         STA   $2C
         LDA   #$0280
         STA   $2E
         PEI   $00
         TDC
         CLC
         ADC   #$0028
         PHA
         _EraseRect
         BRL   LB3FD
LB2C4    LDA   $32
         BNE   LB2E1
         LDA   #$0003
         STA   $32
         LDA   $28
         STA   $30
         PEI   $32
         PEI   $30
         _MoveTo
         BCC   LB2E1
         BRL   LB40C
LB2E1    PEI   $00
         TDC
         CLC
         ADC   #$0034
         PHA
         _GetPortRect
         BCC   LB2F5
         BRL   LB40C
LB2F5    LDA   $38
         SEC
         SBC   $34
         STA   $38
         LDA   $3A
         SEC
         SBC   $36
         STA   $3A
         LDA   $42
         INC
         BNE   LB30B
         BRL   LB3F4
LB30B    DEC
         AND   #$007F
         CMP   #$000A
         BNE   LB37A
         LDA   $38
         SEC
         SBC   $30
         SEC
         SBC   $2E
         SEC
         SBC   $2A
         BPL   LB370
         PHA
         PEA   $0000
         PEA   $0000
         PEA   $0000
         PEA   $0000
         _GetPort
         _GetWControls
         PLA
         PLX
         BNE   LB343
         TAY
         BEQ   LB347
LB343    PLA
         BRL   LB40A
LB347    PLX
         PEI   $00
         TDC
         CLC
         ADC   #$0034
         PHA
         PEA   $0000
         PHX
         PEA   $0000
         PEA   $0000
         _ScrollRect
         BCC   LB366
         BRL   LB40C
LB366    LDA   $38
         SEC
         SBC   $2A
         STA   $30
         BRL   LB3FD
LB370    LDA   $30
         CLC
         ADC   $2E
         STA   $30
         BRL   LB3FD
LB37A    CMP   #$0008
         BNE   LB3A0
         PEA   $0000
         PEA   $0030
         _CharWidth
         BCS   LB40C
         LDA   $32
         SEC
         SBC   $01,S
         CMP   #$0003
         BPL   LB39B
         LDA   #$0003
LB39B    STA   $32
         PLA
         BRA   LB3FD
LB3A0    CMP   #$000D
         BNE   LB3AC
         LDA   #$0003
         STA   $32
         BRA   LB3FD
LB3AC    CMP   #$0007
         BNE   LB3BD
         PHA
         _WriteChar
         BCS   LB40C
         BRA   LB40A
LB3BD    LDX   $32
         CPX   $3A
         BCS   LB40A
         STZ   $34
         CMP   #$0020
         BCS   LB3D0
         CLC
         ADC   #$0040
         DEC   $34
LB3D0    STA   $38
         BIT   $34
         BPL   LB3DB
         PEA   $8000
         BRA   LB3DE
LB3DB    PEA   $0000
LB3DE    _SetTextMode
         BCS   LB40C
         PEI   $38
         _DrawChar
         BCS   LB40C
         BRA   LB40A
LB3F4    LDA   #$0003
         STA   $32
         LDA   $28
         STA   $30
LB3FD    PEI   $32
         PEI   $30
         _MoveTo
         BCS   LB40C
LB40A    CLC
         RTS

LB40C    SEC
         RTS

LB40E    PEA   $0000
         PEA   $0008
         PEI   $00
         TDC
         CLC
         ADC   #$0028
         PHA
         _EventAvail
         PLA
         LDA   $28
         BEQ   LB43C
         LDA   $2A
         AND   #$00FF
         CMP   #$0013
         BNE   LB43C
         PER   LB437-1
         BRA   LB43D
LB437    PER   LB43C-1
         BRA   LB43D
LB43C    RTS

LB43D    PEA   $0000
         PEA   $0008
         PEI   $00
         TDC
         CLC
         ADC   #$0028
         PHA
         _GetNextEvent
         PLA
         LDA   $28
         BEQ   LB43D
         RTS

LB458    PHK
         PHK
         PER   LB4B8
         PLY
         STY   $1C
         PLY
         STY   $1E
         LDA   #$0008
         STA   $0C
         LDA   $10
         BEQ   LB474
         BMI   LB474
         CMP   $0C
         BPL   LB474
         STA   $0C
LB474    LDX   #$0003
         LDA   #$00FF
         STA   $0E
LB47C    LDA   $0E
         XBA
         STA   $0E
         LDA   $08,X
         DEX
         LDY   $0E
         BPL   LB48D
         LSR
         LSR
         LSR
         LSR
         INX
LB48D    AND   #$000F
         BNE   LB4A4
         LDY   $12
         BEQ   LB4A4
         DEC   $0C
         BNE   LB47C
         LDA   #$0030
         STA   [$20]
         INC   $20
         INC   $48
         RTL

LB4A4    STZ   $12
         TAY
         LDA   [$1C],Y
         STA   [$20]
         INC   $20
         INC   $48
         DEC   $0C
         BNE   LB47C
         LDA   $00
         STA   [$20]
         RTL

LB4B8    ASC   '0123456789ABCDEF'

LB4C8    LDA   $10
         BMI   LB4CE
         BNE   LB4D1
LB4CE    LDA   #$09C4
LB4D1    CMP   $08
         BCS   LB4D7
         STA   $08
LB4D7    LDA   $04
         CMP   $20
         BPL   LB4E3
         PER   LB4E3-1
LB4E0    BRL   LB166
LB4E3    DEC   $08
         BMI   LB4F2
         LDA   #$0020
         STA   [$20]
         INC   $20
         INC   $48
         BRA   LB4D7
LB4F2    LDA   $00
         STA   [$20]
         RTS

LB4F7    LDA   $10
         BMI   LB4FD
         BNE   LB502
LB4FD    LDA   #$09C4
         STA   $10
LB502    LDA   $04
         CMP   $20
         BPL   LB50E
         PER   LB50E-1
         BRL   LB166
LB50E    DEC   $10
         BMI   LB533
         LDA   [$1C]
         INC   $1C
         BNE   LB51A
         INC   $1E
LB51A    AND   #$00FF
         STA   [$20]
         BEQ   LB533
         INC   $20
         INC   $48
         CMP   #$000D
         BNE   LB52C
         STZ   $48
LB52C    XBA
         BPL   LB502
         DEC   $20
         DEC   $48
LB533    LDA   $00
         STA   [$20]
         RTS

LB538    PHK
         PHK
         PER   LB4B8
         PLY
         STY   $08
         PLY
         STY   $0A
         LDA   $10
         BEQ   LB549
         BPL   LB54A
LB549    RTS

LB54A    CMP   #$0050
         BCC   LB554
         LDA   #$0050
         STA   $10
LB554    LDA   #$FF00
         STA   $0E
LB559    LDA   $04
         CMP   $20
         BPL   LB565
         PER   LB565-1
         BRL   LB166
LB565    LDA   #$0004
         STA   $0C
LB56A    LDA   $0E
         XBA
         STA   $0E
         BPL   LB579
         LDA   [$1C]
         LSR
         LSR
         LSR
         LSR
         BRA   LB581
LB579    LDA   [$1C]
         INC   $1C
         BNE   LB581
         INC   $1E
LB581    AND   #$000F
         TAY
         LDA   [$08],Y
         STA   [$20]
         INC   $20
         INC   $48
         DEC   $0C
         BNE   LB56A
         LDA   #$2020
         STA   [$20]
         INC   $20
         INC   $48
         DEC   $10
         DEC   $10
         BEQ   LB5A2
         BPL   LB559
LB5A2    LDA   $00
         STA   [$20]
         RTS

LB5A7    REP   #$71
         PHK
         PHK
         PER   LB691
         PLY
         STY   $1C
         PLY
         STY   $1E
LB5B4    LDY   #$000E
         LDA   $0A
         BEQ   LB5FC
         BPL   LB620
         LDA   #$2D2D
         STA   [$20]
         INC   $20
         INC   $48
         LDA   $08
         EOR   #$FFFF
         CLC
         ADC   #$0001
         STA   $08
         LDA   $0A
         EOR   #$FFFF
         ADC   #$0000
         STA   $0A
         BPL   LB5B4
         LDA   #$6E69
         STA   [$20]
         INC   $20
         INC   $20
         LDA   #$2D66
         STA   [$20]
         INC   $20
         INC   $20
         INC   $48
         INC   $48
         INC   $48
         INC   $48
LB5F7    LDA   $00
         STA   [$20]
         RTL

LB5FC    LDA   $08
         CMP   #$000A
         BCS   LB623
         ORA   #$3030
         LDX   $10
         DEX
         TAY
         LDA   $0C
LB60C    DEX
         BMI   LB617
         STA   [$20]
         INC   $20
         INC   $48
         BRA   LB60C
LB617    TYA
         STA   [$20]
         INC   $20
         INC   $48
         BRA   LB5F7
LB620    LDY   #$0022
LB623    LDA   [$1C],Y
         DEY
         DEY
         CMP   $0A
         BEQ   LB631
         BCC   LB63D
         DEY
         DEY
         BRA   LB623
LB631    LDA   [$1C],Y
         CMP   $08
         BEQ   LB63D
         BCC   LB63D
         DEY
         DEY
         BRA   LB623
LB63D    TYA
         LSR
         LSR
         INC
         INC
         CMP   $10
         BCS   LB654
         TAX
         LDA   $0C
LB649    STA   [$20]
         INC   $20
         INX
         INC   $48
         CPX   $10
         BCC   LB649
LB654    LDX   #$0003
         CPY   #$0020
         BEQ   LB65F
         LDX   #$0004
LB65F    PHY
         LDA   [$1C],Y
         STA   $10
         INY
         INY
         LDA   [$1C],Y
         STA   $12
         PER   LB66F-1
         BRA   LB6B5
LB66F    TYA
         ORA   #$3030
         STA   [$20]
         INC   $20
         INC   $48
         LDX   #$0004
         PLY
         DEY
         DEY
         DEY
         DEY
         BPL   LB65F
         LDA   $08
         ORA   #$3030
         STA   [$20]
         INC   $20
         INC   $48
         BRL   LB5F7

LB691    DB    $0A
         DB    $00
         DB    $00
         DB    $00
         DB    $64
         DB    $00
         DB    $00
         DB    $00
         DB    $E8
         DB    $03
         DB    $00
         DB    $00
         DB    $10
         DB    $27
         DB    $00
         DB    $00
         DB    $A0
         DB    $86
         DB    $01
         DB    $00
         DB    $40
         DB    $42
         DB    $0F
         DB    $00
         DB    $80
         DB    $96
         DB    $98
         DB    $00
         DB    $00
         DB    $E1
         DB    $F5
         DB    $05
         DB    $00

         DEX
         TXS
         TSC
LB6B5    LDY   #$0000
         STX   $02
         DEX
LB6BB    ASL   $10
         ROL   $12
         DEX
         BNE   LB6BB
LB6C2    LDA   $08
         SEC
         SBC   $10
         TAX
         LDA   $0A
         SBC   $12
         BCC   LB6D2
         STA   $0A
         STX   $08
LB6D2    TYA
         ROL
         TAY
         DEC   $02
         BEQ   LB6DF
         LSR   $12
         ROR   $10
         BRA   LB6C2
LB6DF    RTS

LB6E0    PER   LAEF4
         PHK
         PLB
         LDY   #$0004
         STA   ($01,S),Y
         INY
         INY
         TXA
         AND   #$00FF
         STA   ($01,S),Y
         DEY
         DEY
         ORA   ($01,S),Y
         PHA
         PHK
         PER   LB6FE-1
         BRL   LA850
LB6FE    LDA   #$94A4     ; )$
         PER   LB707-1
         BRL   LA881
LB707    BVS   LB715
         BPL   LB710
         LDA   #$8080
         BRA   LB71A
LB710    LDA   #$80A0
         BRA   LB71A
LB715    BPL   LB71A
         LDA   #$9484
LB71A    PLX
         BNE   LB720
         AND   #$7FFF
LB720    LDY   #$0002
         STA   ($01,S),Y
         LDA   #$0266
         PER   LB72E-1
         BRL   LA881
LB72E    BVS   LB738
         LDA   #$027E
         BCC   LB73F
         LSR
         BRA   LB73F
LB738    BCC   LB73F
         LSR
         DEC
         DEC
         DEC
         DEC
LB73F    PHX
         LDY   #$0019
         PLX
         BNE   LB749
         LDY   #$000D
LB749    PHY
         LDY   #$003E
         TAX
         PLA
         STA   ($01,S),Y
         INY
         INY
         LDA   #$0002
         CPX   #$0190
         BCS   LB75C
         LSR
LB75C    STA   ($01,S),Y
         INY
         INY
         LDA   #$00C7
         STA   ($01,S),Y
         INY
         INY
         TXA
         STA   ($01,S),Y
         LDY   #$001E
         STA   ($01,S),Y
         INY
         INY
         INY
         INY
         STA   ($01,S),Y
         PHK
         PHK
         PER   LB7CD
         PLA
         PLX
         LDY   #$003A
         STA   ($01,S),Y
         INY
         INY
         TXA
         AND   #$00FF
         STA   ($01,S),Y
         PLA
         PHA
         PHA
         PHK
         PHK
         PER   LAEF4
         _NewWindow
         BCS   LB7CA
         PLA
         PLX
         PHX
         PHA
         PHX
         PHA
         _SetPort
         BCS   LB7CA
         PEA   $0000
         PEA   $000A
         _MoveTo
         PHK
         PLB
         PER   LA790
         LDY   #$0000
         LDA   $03,S
         STA   ($01,S),Y
         INY
         INY
         LDA   $05,S
         STA   ($01,S),Y
         PLA
         CLC
LB7CA    PLA
         PLX
         RTL

LB7CD    LDA   #$0000
         PHA
         PHA
         PHA
         PHA
         _GetPort
         _GetWControls
         PLA
         PLX
         BCS   LB802
         BNE   LB7EB
         TAX
         BEQ   LB802
LB7EB    INX
         BEQ   LB802
         PEA   $0000
         PEA   $0000
         _GetPort
         _DrawControls
LB802    RTL

LB803    PHX
         PHA
         PER   LA790
         LDY   #$0002
         PHK
         PLB
         LDA   ($01,S),Y
         TAX
         DEY
         DEY
         LDA   ($01,S),Y
         BNE   LB819
         TXY
         BEQ   LB823
LB819    PLY
         PHX
         PHA
         _SetWTitle
LB823    RTL

