
*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

	mx	%00
	rel
	lst	off

*-----------------------

	use	4/Int.Macs
	use	4/Mem.Macs
	use	4/SANE.Macs
	use	4/Util.Macs
	
	use	KERNEL.E
	use	KERNEL.X
	
*-----------------------

L040000  HEX   10111213141516170001020304050607
         HEX   18191A1B1C0D1D1E0001020304050607
         HEX   1F202122231516170001020304050607
         HEX   08090A0B0C0D0E0F0001020304050607
         HEX   2425262728292A2B0001020320050607
         HEX   08090A0B2C2D2E2F3031323334353637
         HEX   1F203838231516170001020304050607
         HEX   08090A0B0C0D0E0F0001020304050607
         HEX   393A3B3C3D3E3F400001020304050607
         HEX   00010203040506070001020304050607
         HEX   41204222231543440001020304050607
         HEX   08090A0B0C0D0E0F0001020304050607
         HEX   45464748494A4B4C0001020304050607
         HEX   4D4E4F505152535455565758595A5B5C
         HEX   4120383822155D110001020304050607
         HEX   08090A0B220D0E0F0001020304050607

L040100  HEX   40800000706868685252525252525252
         HEX   40C040B0B06864644444444444444444
         HEX   40408040404040404040404040404040
         HEX   40404040404040404141414141414141
         HEX   00000000000000006060606060606060
         HEX   00000000000000000000000000000000
         HEX   80808082808080808080808080808080
         HEX   8080808080808080C0C0C0C0C0C0C0C0
         HEX   70707070707070704A4A4A4A4A4A4A4A
         HEX   42424242424242424E4E4E4E4E4E4E4E
         HEX   40508050505040805050505050505050
         HEX   50505050484850504949494949494949
         HEX   00000000000000008888888888888888
         HEX   00000000000000000000000000000000
         HEX   8090C092809082929090909090909090
         HEX   9090909090889090D0D0D0D0D0D0D0D0

L040200  ASC   "ORAANDEORADCSTALDACMPSBCASLROLLSRRORSTXL"
         ASC   "DXDECINCBRKJSRRTIRTSBRALDYCPYCPXCOPJSLWD"
         ASC   "MPERBRLREPSEPTSBBITMVPSTZSTYPHPPLPPHAPLA"
         ASC   "DEYTAYINYINXTXATAXDEXNOPPHDPLDPHKRTLPHBP"
         ASC   "LBWAIXBAJMPBPLBMIBVCBVSBCCBCSBNEBEQTRBMV"
         ASC   "NPEIPEACLCSECCLISEITYACLVCLDSEDINCDECPHY"
         ASC   "PLYTXSTSXPHXPLXTCSTSCTCDTDCTXYTYXSTPXCEJ"
         ASC   "ML"

L04031A  ADRL  L040326
         ADRL  L040358
         ADRL  L04036A

L040326  ENT
         ASC   "D"	; 0
         ASC   'B'
         ASC   "D"	; 1
         ASC   'W'
         ASC   "DD"	; 2
         ASC   'B'
         ASC   "D"	; 3
         ASC   'A'
         ASC   "ADR"	; 4
         ASC   'L'
         ASC   "AD"	; 5
         ASC   'R'
         ASC   "FL"	; 6
         ASC   'O'
         ASC   "HE"	; 7
         ASC   'X'
         ASC   "D"	; 8
         ASC   'S'
         ASC   "AS"	; 9
         ASC   'C'
         ASC   "DC"	; 10
         ASC   'I'
         ASC   "RE"	; 11
         ASC   'V'
         ASC   "IN"	; 12
         ASC   'V'
         ASC   "FL"	; 13
         ASC   'S'
         ASC   "STR"	; 14
         ASC   'L'
         ASC   "ST"	; 15
         ASC   'R'
         ASC   "CH"	; 16
         ASC   'K'
         ASC   "REC"	; 17 - AV 202303 - RECT
         ASC   'T'
         ASC   00

L040358  ENT
         ASC   "LA"	; 0
         ASC   'B'
         ASC   "EN"	; 1
         ASC   'T'
         ASC   "EX"	; 2
         ASC   'T'
         ASC   "EX"	; 3
         ASC   'D'
         ASC   "EQ"	; 4
         ASC   'U'
         ASC   "D"	; 5
         ASC   'P'00

L04036A  ENT
         ASC   "OR"	; 0
         ASC   'G'
         ASC   "M"	; 1
         ASC   'X'
         ASC   "OR"	; 2
         ASC   'G'
	 ASC   ' '	; 3
         ASC   "DB"	; 4
         ASC   'R'
         ASC   "B="	; 5
         ASC   'K'00

L04037A  ENT
         PHP
         SEP   #$30
         LDX   #$03
L04037F  ASL
         PHP
         LSR
         PLP
         ROL
         DEX
         BNE   L04037F
         TAX
         LDAL  L040100,X
         PHA
         LSR
         LSR
         LSR
         LSR
         LSR
         LSR
         TAY
         PLA
         PHA
         BIT   #$C0
         BEQ   L0403B3
         BIT   #$20
         BEQ   L0403B3
         BIT   #$10
         BNE   L0403B3
         BIT   #$04
         BNE   L0403B3
         BIT   #$08
         BNE   L0403AE
         LDA   $30
         BRA   L0403B0
L0403AE  LDA   $31
L0403B0  BNE   L0403B3
         INY
L0403B3  PLA
         PLP
         RTL

L0403B6  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDA   $06,S
         STA   $00
         LDA   $08,S
         STA   $02
         LDA   $0A,S
         TAX
         LDA   $04,S
         STA   $0A,S
         LDA   $02,S
         STA   $08,S
         LDA   $01,S
         STA   $07,S
         TSC
         CLC
         ADC   #$0006
         TCS
         TXA
         SEP   #$30
         LDX   #$03
L0403DE  ASL
         PHP
         LSR
         PLP
         ROL
         DEX
         BNE   L0403DE
         TAX
         LDA   L040000,X
         REP   #$30
         PHX
         AND   #$00FF
         STA   $04
         ASL
         ADC   $04
         TAX
         LDA   [$00]
         AND   #$00FF
         INC
         TAY
         SEP   #$20
         LDA   #$03
         STA   $04
L040403  LDA   L040200,X
         JSR   L04043D
         INX
         STA   [$00],Y
         INY
         DEC   $04
         BNE   L040403
         PLX
         LDA   L040100,X
         AND   #$C0
         BEQ   L040436
         CMP   #$C0
         BNE   L04042F
         CPX   #$00E6
         BEQ   L04042F
         CPX   #$0011
         BEQ   L04042F
         LDA   #$CC
         JSR   L04043D
         STA   [$00],Y
         INY
L04042F  TYA
         DEC
         STA   [$00]
         PLP
         PLB
         RTL

L040436  TYA
         DEC
         STA   [$00]
         PLP
         PLB
         RTL

L04043D  PHA
         LDA   $5F
         AND   #$20
         BEQ   L040454
         LDA   $01,S
         AND   #$7F
         CMP   #$41
         BCC   L040454
         CMP   #$5B
         BCS   L040454
         PLA
         ORA   #$20
         RTS

L040454  PLA
         RTS

L040456  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDA   $06,S
         STA   $00
         LDA   $08,S
         STA   $02
         LDA   $0A,S
         STA   $04
         LDA   $0C,S
         STA   $06
         LDA   $0E,S
         TAX
         LDA   $04,S
         STA   $0E,S
         LDA   $02,S
         STA   $0C,S
         LDA   $01,S
         STA   $0B,S
         TSC
         CLC
         ADC   #$000A
         TCS
         TXA
         SEP   #$30
         LDX   #$03
L040486  ASL
         PHP
         LSR
         PLP
         ROL
         DEX
         BNE   L040486
         TAX
         LDA   L040100,X
         TAX
         AND   #$C0
         BEQ   L040501
         LDA   [$00]
         INC
         TAY
         TXA
         BIT   #$01
         BEQ   L0404B4
         PHA
         LDA   #$DB
         STA   [$00],Y
         INY
         JSR   L040504
         LDA   #$DD
         STA   [$00],Y
         INY
L0404AE  PLA
         JSR   L040535
         BRA   L0404FD
L0404B4  BIT   #$02
         BEQ   L0404E0
         PHA
         PHY
         JSR   L040504
         TYX
         PLY
         LDA   [$00],Y
         CMP   #$FC
         BNE   L0404CC
         LDA   #$A8
         STA   [$00],Y
         TXY
         BRA   L0404D4
L0404CC  LDA   #$A8
         STA   [$00],Y
         INY
         JSR   L040504
L0404D4  PLA
         PHA
         JSR   L04051A
         LDA   #$A9
         STA   [$00],Y
         INY
         BRA   L0404AE
L0404E0  BIT   #$20
         BEQ   L0404F2
         BIT   #$10
         BNE   L0404ED
         LDA   #$A3
         STA   [$00],Y
         INY
L0404ED  JSR   L040504
         BRA   L0404FD
L0404F2  PHA
         JSR   L040504
         PLA
         JSR   L04051A
         JSR   L040535
L0404FD  TYA
         DEC
         STA   [$00]
L040501  PLP
         PLB
         RTL

L040504  LDA   [$04]
         BEQ   L040519
         STA   $08
         LDX   #$01
L04050C  PHY
         TXY
         LDA   [$04],Y
         INX
         PLY
         STA   [$00],Y
         INY
         DEC   $08
         BNE   L04050C
L040519  RTS

L04051A  BIT   #$14
         BEQ   L040534
         PHA
         LDA   #$AC
         STA   [$00],Y
         INY
         PLA
         PHA
         BIT   #$10
         BNE   L04052E
         LDA   #$D3
         BRA   L040530
L04052E  LDA   #$D8
L040530  STA   [$00],Y
         INY
         PLA
L040534  RTS

L040535  BIT   #$08
         BEQ   L040534
         PHA
         LDA   #$AC
         STA   [$00],Y
         INY
         LDA   #$D9
         STA   [$00],Y
         INY
         PLA
         RTS

         PHP
         SEP   #$30
         LDA   [$00]
         TAY
L04054C  INY
         TYA
         STA   [$00]
         LDA   #$A0
         STA   [$00],Y
         TYA
         CMP   $44,X
         BCC   L04054C
         PLP
         RTS

L04055B  PHP
         SEP   #$30
         LDX   #$FF
         CMP   #$E2
         BEQ   L040577
         CMP   #$C2
         BNE   L040575
         XBA
         BIT   #$20
         BEQ   L04056F
         STZ   $30
L04056F  BIT   #$10
         BEQ   L040575
         STZ   $31
L040575  PLP
         RTL

L040577  XBA
         BIT   #$20
         BEQ   L04057E
         STX   $30
L04057E  BIT   #$10
         BEQ   L040575
         STX   $31
         BRA   L040575
L040586  ENT
         PHP
         REP   #$30
         STAL  L0405F0
         PHA
         PEI   $42
         PHA
         JSL   L04349E
         BCS   L0405B1
         SEC
         SBCL  L0405F0
         STAL  L0405F2
         TYA
         CLC
         ADCL  L0405F2
         TAY
         TXA
         ORA   #$0020
         TAX
         TYA
         TXY
         PLX
         BRA   L0405ED
L0405B1  PLY
         LDA   [$3A],Y
         PHA
         AND   #$00FF
         CMP   #$00A2
         BNE   L0405DB
         INY
         INY
         INY
         LDA   [$3A],Y
         CMP   #$0022
         BNE   L0405D9
         INY
         INY
         LDA   [$3A],Y
         CMP   #$E100
         BNE   L0405D9
         PLA
         LDY   #$0000
         LDA   #$0007
         BRA   L0405EA
L0405D9  PLA
         PHA
L0405DB  JSL   L04037A
         INY
         PLA
         PHY
         JSL   L04055B
         PLA
         LDY   #$0000
L0405EA  PLP
         CLC
         RTL

L0405ED  PLP
         SEC
         RTL

L0405F0  DB    $00
         DB    $00
L0405F2  DB    $00
         DB    $00
L0405F4  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         STA   $4A
         STY   $52
         JSL   L0300EE
         LDX   #$0000
         JSL   L0300E2
L040609  JSL   L0300F7
         PEI   $42
         PEI   $4A
         JSL   L042A5C
         PHA
         PHY
         JSL   L03065A
         LDA   #$00AF
         JSL   L03022D
         JSL   L030670
         JSL   L0302E1
         STR   ": "
         BIT   $48
         BMI   L040634
         BRL   L0406C1
L040634  LDY   $4A
         LDX   #$0010
         STX   $50
L04063B  LDA   [$3A],Y
         PHY
         PHX
         PHA
         TYA
         BIT   $5E
         BVS   L040652
         BPL   L040669
         JSL   L0410BB
         BIT   #$1800
         BEQ   L040669
         BRA   L04065B
L040652  JSL   L0410BB
         BIT   #$8000
         BEQ   L040669
L04065B  JSL   L030579
         JSL   L03065A
         JSL   L030585
         BRA   L04066D
L040669  JSL   L03065A
L04066D  LDA   #$00A0
         JSL   L03022D
         PLX
         PLY
         INY
         BEQ   L040684
         BIT   $5C
         BMI   L040681
         CPY   $3E
         BCS   L040684
L040681  DEX
         BNE   L04063B
L040684  JSL   L0300EE
         LDX   #$003C
         JSL   L0300E2
         LDY   $4A
         LDX   #$0010
L040694  LDA   [$3A],Y
         PHY
         PHX
         PHA
         AND   #$007F
         CMP   #$0020
         BCS   L0406A6
         LDA   #$00AE
         STA   $01,S
L0406A6  PLA
         ORA   #$0080
         JSL   L03022D
         PLX
         PLY
         INY
         BEQ   L0406BE
         BIT   $5C
         BMI   L0406BB
         CPY   $3E
         BCS   L0406BE
L0406BB  DEX
         BNE   L040694
L0406BE  BRL   L0409DD
L0406C1  LDA   $5A
         CMP   #$0004
         BCC   L0406CB
         BRL   L040776
L0406CB  ASL
         TAX
         JSR   (L0406EF,X)
         PHP
         PEI   $4A
         PEI   $5A
         JSL   L0415A4
         STX   $5A
         PLP
         BCS   L0406C1
         DEC   $52
         BNE   L0406E5
         BRL   L040A1D
L0406E5  LDA   #$008D
         JSL   L03022D
         BRL   L040609

L0406EF  DA    L0406F7
         DA    L04071C
         DA    L04072F
         DA    L040747

L0406F7  PEI   $42
         PEI   $4A
         JSL   L042D12
         BVS   L040715
         LDX   #$0060
         STX   $4C
         STA   $4E
         SEP   #$10
         STY   $50
         REP   #$10
L04070E  JSR   L0407E5
         CLC
         RTS

L040713  SEC
         RTS

L040715  LDX   #$0062
         STX   $4C
         BRA   L04070E
L04071C  PEI   $42
         PEI   $4A
         JSL   L042DD9
         BCS   L040713
         STA   $4E
         LDX   #$0061
         STX   $4C
         BRA   L04070E
L04072F  PEI   $42
         PEI   $4A
         JSL   L042F5B
         BVS   L040740
         STA   $4E
         LDX   #$0064
         BRA   L040743
L040740  LDX   #$0065
L040743  STX   $4C
         BRA   L04070E
L040747  PEI   $42
         PEI   $4A
         STZ   L040A25
         PEA   ^L040A25
         PEA   L040A25
         JSL   L0428B4
         CPX   #$0001
         BNE   L040713
         JSL   L0300EE
         LDX   #$0016
         JSL   L0300E2
         JSL   L030314
         ADR   L040A25
         LDA   #$0041
         STA   $4C
         BRA   L04070E
L040776  LDA   $4A
         JSL   L041719
         LDA   $4A
         JSL   L040586
         STY   $4C
         STA   $50
         CMP   #$0000
         BEQ   L0407A5
         CMP   #$0006
         BCC   L040793
         LDA   #$0005
L040793  TAX
         LDY   $4A
L040796  LDA   [$3A],Y
         INY
         PHY
         PHX
         PHA
         JSL   L03065A
         PLX
         PLY
         DEX
         BNE   L040796
L0407A5  JSL   L0300EE
         LDX   #$0016
         JSL   L0300E2
         STZ   L040A25
         LDA   $4A
         JSL   L0410BB
         BIT   #$6000
         BEQ   L0407E2
         BIT   #$2000
         BNE   L0407E2
         BIT   #$0080
         BEQ   L0407E2
         PEI   $42
         PEI   $4A
         STZ   L040A25
         PEA   ^L040A25
         PEA   L040A25
         JSL   L0428B4
         BVS   L0407E2
         JSL   L030314
         ADR   L040A25
L0407E2  PER   L040976-1
L0407E5  SEP   #$30
         LDA   #$A0
         JSL   L03022D
         JSL   L0300EE
         CPX   $44
         BCS   L0407FB
         LDX   $44
         JSL   L0300E2
L0407FB  REP   #$30
         LDA   $4C
         AND   #$00FF
         BEQ   L040807
         BRL   L0408D3
L040807  LDY   $4A
         LDA   [$3A],Y
         AND   #$00FF
         CMP   #$00A2
         BNE   L04084A
         INY
         INY
         INY
         LDA   [$3A],Y
         CMP   #$0022
         BNE   L040843
         INY
         INY
         LDA   [$3A],Y
         CMP   #$E100
         BNE   L040843
         LDY   $4A
         INY
         LDA   [$3A],Y
         PHA
         STZ   L040A25
         PEA   ^L040A25
         PEA   L040A25
         JSL   L044C72
         BCS   L040843
         JSL   L030314
         ADR   L040A25
         RTS

L040843  LDY   $4A
         LDA   [$3A],Y
         AND   #$00FF
L04084A  STZ   L040A25
         PHA
         PEA   ^L040A25
         PEA   L040A25
         JSL   L0403B6
         JSL   L030314
         ADR   L040A25
         LDA   $50
         DEC
         BNE   L040865
         RTS

L040865  LDA   #$00A0
         JSL   L03022D
         STZ   L040A25
         STZ   L040A55
         SEP   #$10
         JSL   L0300EE
         CPX   $45
         BCS   L040882
         LDX   $45
         JSL   L0300E2
L040882  REP   #$10
         LDY   $4A
         LDA   [$3A],Y
         AND   #$00EF
         CMP   #$0044
         BNE   L0408A0
         PEI   $42
         INY
         PHY
         PEA   ^L040A55
         PEA   L040A55
         JSL   L045887
         BRA   L0408CB
L0408A0  TYA
         INC
         LDY   $50
         DEY
         PEI   $42
         PHA
         PHY
         PEA   ^L040A25
         PEA   L040A25
         JSL   L04397A
         LDY   $4A
         LDA   [$3A],Y
         AND   #$00FF
         PHA
         PEA   ^L040A25
         PEA   L040A25
         PEA   ^L040A55
         PEA   L040A55
         JSL   L040456
L0408CB  JSL   L030314
         ADR   L040A55
         RTS

L0408D3  LDA   $4C
         AND   #$00FF
         PHA
         SEC
         SBC   #$0020
         LSR
         LSR
         LSR
         AND   #$000C
         TAY
         LDA   L04031A+1,Y
         STA   $01
         LDA   L04031A,Y
         STA   $00
         PLA
         AND   #$001F
         TAX
         LDY   #$0000
         SEP   #$20
L0408F8  DEX
         BMI   L040905
L0408FB  LDA   [$00],Y
         BPL   L040902
         INY
         BRA   L0408FB
L040902  INY
         BRA   L0408F8
L040905  LDX   #$0001
L040908  LDA   [$00],Y
         BPL   L040916
         JSR   L04043D
         STA   L040A25,X
         INY
         INX
         BRA   L040908
L040916  ORA   #$80
         JSR   L04043D
         STA   L040A25,X
         TXA
         STA   L040A25
         REP   #$30
         JSL   L030314
         ADR   L040A25
         LDA   #$00A0
         JSL   L03022D
         SEP   #$10
         JSL   L0300EE
         CPX   $45
         BCS   L040942
         LDX   $45
         JSL   L0300E2
L040942  REP   #$10
         LDA   $4C
         AND   #$00FF
         PHA
         SEC
         SBC   #$0020
         LSR
         LSR
         LSR
         AND   #$000C
         TAY
         LDA   L040A85+1,Y
         STA   $01
         LDA   L040A85,Y
         STA   $00
         PLA
         AND   #$001F
         ASL
         TAY
         PEI   $4A
         STZ   L040A25
         PER   L040972-1
         LDA   [$00],Y
         DEC
         PHA
         RTS

L040972  PLA
         STA   $4A
         RTS

L040976  LDA   $4A
         JSL   L0410BB
         BIT   #$0400
         BEQ   L0409DD
         SEP   #$30
         LDA   #$A0
         JSL   L03022D
         JSL   L0300EE
         STX   L040A23
         CPX   $46
         BCS   L04099D
         LDX   $46
         STX   L040A23
         JSL   L0300E2
L04099D  REP   #$30
         LDA   #$004F
         SEC
         SBC   L040A23
         DEC
         DEC
         BMI   L0409DD
         STA   L040A23
         JSL   L0302E1
         STR   "; "
         PEI   $42
         PEI   $4A
         STZ   L040A25
         PEA   ^L040A25
         PEA   L040A25
         JSL   L04392C
         BCS   L0409DD
         SEP   #$20
         LDA   L040A23
         CMP   L040A25
         BCS   L0409D4
         STA   L040A25
L0409D4  REP   #$20
         JSL   L030314
         ADR   L040A25
L0409DD  STZ   $5A
         LDA   $50
         CLC
         ADC   $4A
         BCS   L040A05
         STA   $4A
         BIT   $5C
         BMI   L0409F0
         CMP   $3E
         BCS   L040A05
L0409F0  PHA
         JSL   L04155D
         STX   $5A
         LDY   #$0000
         DEC   $52
         BEQ   L040A1D
         JSL   L0302C3
         BRL   L040609
L040A05  STZ   $4A
L040A07  DEC   $52
         BEQ   L040A13
         INC   $4A
         JSL   L0302C3
         BRA   L040A07
L040A13  JSL   L0300F7
         LDY   #$00EF
         LDX   #$6502
L040A1D  LDA   $4A
         PLP
         PLB
         CLC
         RTL

L040A23  DB    $00
         DB    $00
L040A25  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L040A55  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L040A85  ADR   L040A91
         DB    $00
         ADR   L040AB3
         DB    $00
         ADR   L040ABD
         DB    $00
L040A91  DA    L040B1C
         DA    L040B34
         DA    L040B50
         DA    L040B1C
         DA    L040B1C
         DA    L040B1C
         DA    L040B57
         DA    L040BA4
         DA    L040BCB
         DA    L040C14
         DA    L040BEE
         DA    L040C20
         DA    L040AC9
         DA    L040AC9
         DA    L040C46
         DA    L040C2C
         DA    L040C60
L040AB3  DA    L040ACA
         DA    L040ACA
         DA    L040ACA
         DA    L040ACA
         DA    L040ACA
L040ABD  DA    L040AEC
         DA    L040ACC
         DA    L040ACB
         DW    $0000
         DA    L040B0B
         DA    L040ACB
L040AC9  RTS
L040ACA  RTS
L040ACB  RTS

L040ACC  LDA   #$00A5
         JSL   L03022D
         PEI   $4E
         JSL   L03065A
         SEP   #$20
         LDA   $4E
         PHA
         AND   #$0F
         STA   $31
         PLA
         LSR
         LSR
         LSR
         LSR
         STA   $30
         REP   #$20
         RTS

L040AEC  LDA   $50
         AND   #$00FF
         PHA
         PEI   $4E
         PEA   $0003
         PEA   ^L040A25
         PEA   L040A25
         JSL   L044315
         JSL   L030314
         ADR   L040A25
         STZ   $50
         RTS

L040B0B  LDA   #$00A4
         JSL   L03022D
         LDA   $4E
         PHA
         JSL   L03065A
         STZ   $50
         RTS

L040B1C  PEI   $42
         PEI   $4A
         PEI   $50
         PEA   ^L040A25
         PEA   L040A25
         JSL   L04397A
         JSL   L030314
         ADR   L040A25
         RTS

L040B34  LDY   $4A
         LDA   [$3A],Y
L040B38  PEA   $0000
         PHA
         PEI   $50
         PEA   ^L040A25
         PEA   L040A25
         JSL   L044315
         JSL   L030314
         ADR   L040A25
         RTS

L040B50  LDY   $4A
         LDA   [$3A],Y
         XBA
         BRA   L040B38
L040B57  CLC
         LDA   $4A
         ADC   $3A
         PHA
         PHA
         LDA   #$0000
         ADC   $3C
         STA   $03,S
         PEA   ^L040B85
         PEA   L040B85
         JSL   L040D34
         LDA   #$00A2
         JSL   L03022D
         JSL   L030314
         ADR   L040B85
         LDA   #$00A2
         JSL   L03022D
         RTS

L040B85  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L040BA4  LDX   $50
         CPX   #$0011
         BCC   L040BB1
         PER   L040BC3-1
         LDX   #$000F
L040BB1  LDY   $4A
L040BB3  LDA   [$3A],Y
         PHY
         PHX
         PHA
         JSL   L03065A
         PLX
         PLY
         INY
         DEX
         BNE   L040BB3
         RTS

L040BC3  LDA   #$0049
         JSL   L03022D
         RTS

L040BCB  LDA   #$00A4
         JSL   L03022D
         PEI   $50
         JSL   L030670
         LDY   $4A
         LDA   [$3A],Y
         AND   #$00FF
         BEQ   L040BED
         PHA
         JSL   L0302E1
         STR   ",$"
         JSL   L03065A
L040BED  RTS

L040BEE  PHP
         REP   #$30
         LDY   $4A
         LDA   $50
         CMP   #$0001
         BEQ   L040BFF
         JSR   L040C7F
         PLP
         RTS

L040BFF  LDA   [$3A],Y
         PHA
         EOR   #$0080
         STA   [$3A],Y
         PHY
         LDA   #$0001
         JSR   L040C7F
         PLY
         PLA
         STA   [$3A],Y
         PLP
         RTS

L040C14  PHP
         REP   #$30
         LDY   $4A
         LDA   $50
         JSR   L040C7F
         PLP
         RTS

L040C20  PHP
         REP   #$30
         LDY   $4A
         LDA   $50
         JSR   L040C61
         PLP
         RTS

L040C2C  PHP
         REP   #$30
         LDY   $4A
         LDA   [$3A],Y
         AND   #$00FF
         INC
         CMP   $50
         PHP
         LDA   $50
         PLP
         BNE   L040C41
         INY
         DEC
L040C41  JSR   L040C7F
         PLP
         RTS

L040C46  PHP
         REP   #$30
         LDY   $4A
         LDA   [$3A],Y
         INC
         INC
         CMP   $50
         PHP
         LDA   $50
         PLP
         BNE   L040C5B
         INY
         INY
         DEC
         DEC
L040C5B  JSR   L040C7F
         PLP
         RTS
L040C60  RTS

L040C61  PHP
         REP   #$30
         TAX
         PHA
         TYA
         CLC
         ADC   $01,S
         DEC
         STA   $01,S
         PLY
         SEP   #$20
         LDA   #$1F
         STA   L040D2F
         STZ   L040D31
         LDA   #$FF
         STA   L040D32
         BRA   L040CA0
L040C7F  PHP
         REP   #$30
         TAX
         SEP   #$20
         LDA   #$1F
         STA   L040D2F
         STZ   L040D31
         STZ   L040D32
         CPX   #$0000
         BNE   L040CA0
         JSL   L0302E1
         STR   "''"
         LDA   #$02
         PLP
         RTS

L040CA0  LDA   [$3A],Y
         AND   #$7F
         CMP   #$20
         BCC   L040CBF
         LDA   [$3A],Y
         BPL   L040CBB
         LDA   #$A2
L040CAE  STA   L040D30
         PHX
         PHY
         JSL   L03022D
         PLY
         PLX
         BRA   L040CEB
L040CBB  LDA   #$A7
         BRA   L040CAE
L040CBF  LDA   [$3A],Y
         PHX
         PHY
         PHA
         PHA
         JSL   L03065A
         PLY
         PLX
         INC   L040D31
         INY
         BIT   L040D32
         BPL   L040CD6
         DEY
         DEY
L040CD6  DEX
         BEQ   L040D15
         DEC   L040D2F
         DEC   L040D2F
         BEQ   L040CE3
         BPL   L040CA0
L040CE3  LDA   #$49
         JSL   L03022D
         BRA   L040D15
L040CEB  DEC   L040D2F
         BEQ   L040CE3
         LDA   [$3A],Y
         ORA   #$80
         CMP   #$A0
         BCC   L040D1D
         PHX
         PHY
         JSL   L03022D
         PLY
         PLX
         INC   L040D31
         INY
         BIT   L040D32
         BPL   L040D0B
         DEY
         DEY
L040D0B  DEX
         BNE   L040CEB
         LDA   L040D30
         JSL   L03022D
L040D15  LDA   #$00
         XBA
         LDA   L040D31
         PLP
         RTS

L040D1D  LDA   L040D30
         PHX
         PHY
         JSL   L03022D
         PLY
         PLX
         DEC   L040D2F
         BEQ   L040CE3
         BRA   L040CBF
L040D2F  DB    $00
L040D30  DB    $00
L040D31  DB    $00
L040D32  DB    $00
         DB    $00
L040D34  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         TSC
         PHD
         CLC
         ADC   #$0006
         TCD
         STZ   L040E46
         LDA   #$0014
         STA   L040E48
         PEA   ^L040E46
         PEA   L040E46
         PEI   $06
         PEI   $04
         PEA   ^L040E4A
         PEA   L040E4A
         PEA   $000B
         _SANEFP816
         CLC
         LDA   L040E4C
         ADC   #$0013
         CMP   #$0014
         BCS   L040D73
         INC   L040E46
L040D73  SEP   #$30
         LDX   L040E4E
L040D78  LDA   L040E4E,X
         CMP   #$30
         BNE   L040D82
         DEX
         BNE   L040D78
L040D82  REP   #$31
         STX   L040E48
         LDA   L040E46
         BNE   L040DB1
         LDA   L040E4F
         AND   #$007F
         CMP   #$0030
         BEQ   L040DAC
         LDA   L040E4C
         ADC   #$0013
         EOR   #$FFFF
         INC
         BMI   L040DC2
         CLC
         ADC   L040E48
         CMP   #$0014
         BCS   L040DC2
L040DAC  INC   L040E46
         BRA   L040DC2
L040DB1  LDA   L040E4C
         ADC   #$0014
         SEC
         SBC   L040E48
         EOR   #$FFFF
         INC
         STA   L040E48
L040DC2  PEA   ^L040E46
         PEA   L040E46
         PEI   $06
         PEI   $04
         PEA   ^L040E4A
         PEA   L040E4A
         PEA   $000B
         _SANEFP816
         PEA   ^L040E46
         PEA   L040E46
         PEA   ^L040E4A
         PEA   L040E4A
         PEA   ^L040E63
         PEA   L040E63
         PEA   $0001
         _SANEDecStr816
         LDX   #$0001
L040DFB  LDA   L040E63,X
         ORA   #$8080
         STA   L040E63,X
         INX
         INX
         CPX   #$001E
         BCC   L040DFB
         SEP   #$30
         LDA   L040E64
         CMP   #$A0
         BNE   L040E24
         LDX   #$01
L040E16  LDA   L040E64,X
         STA   L040E63,X
         INX
         CPX   #$1E
         BCC   L040E16
         DEC   L040E63
L040E24  LDY   L040E63
L040E27  LDA   L040E63,Y
         STA   [$00],Y
         DEY
         BPL   L040E27
         REP   #$30
         PLD
         LDA   $04,S
         STA   $0C,S
         LDA   $02,S
         STA   $0A,S
         LDA   $01,S
         STA   $09,S
         PLA
         PLA
         PLA
         PLA
         PLP
         PLB
         CLC
         RTL

L040E46  DB    $00
         DB    $00
L040E48  DB    $14
         DB    $00
L040E4A  DB    $00
         DB    $00
L040E4C  DB    $00
         DB    $00
L040E4E  DB    $00
L040E4F  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L040E63  DB    $00
L040E64  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L040E82  DB    $00
         DB    $00
L040E84  DB    $00
         DB    $00
L040E86  DB    $00
L040E87  DB    $00
L040E88  DB    $00
L040E89  DB    $00
         DB    $00
L040E8B  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L040E95  DB    $00
         DB    $00
L040E97  REP   #$30
         CPX   #$0000
         BEQ   L040ED3
         PLA
         STA   L040ED4
         PLA
         STA   L040E82
         PLA
         STA   L040E84
         SEP   #$20
         PLA
         STA   L040E86
         CPX   #$0000
         BEQ   L040EC1
         TXY
         LDX   #$0000
L040EB9  PLA
         STA   L040E87,X
         INX
         DEY
         BNE   L040EB9
L040EC1  LDA   L040E86
         PHA
         REP   #$20
         LDA   L040E84
         PHA
         LDA   L040E82
         PHA
         LDA   L040ED4
         PHA
L040ED3  RTS

L040ED4  DW    $0000

L040ED6  PHP
         REP   #$30
         LDA   $05,S
         STA   L040EEE+1
         LDA   $06,S
         STA   L040EEE+2
         LDA   $03,S
         STA   $07,S
         LDA   $01,S
         STA   $05,S
         PLA
         PLA
         PLP
L040EEE  JMPL  $000000

L040EF2  PHP
         REP   #$20
         STA   L040F12
         SEP   #$20
         PLA
         AND   #$CF
         STA   L040F11
         LDA   $01,S
         AND   #$30
         ORA   L040F11
         STA   $01,S
         REP   #$20
         LDA   L040F12
         PLP
         PLB
         RTL

L040F11  DB    $00
L040F12  DB    $00
         DB    $00
L040F14  BIT   L040E95
         BPL   L040F1B
         CLC
         RTS

L040F1B  PHP
         REP   #$30
         LDA   $70
         ORA   $72
         BEQ   L040F4A
         LDY   #$0002
         LDA   [$70]
         STA   $74
         LDA   [$70],Y
         STA   $76
         ORA   $74
         BEQ   L040F4A
         SEC
         LDA   $3E
         ADC   $74
         STA   $78
         LDA   #$0000
         ADC   $76
         STA   $7A
         BIT   $5C
         BPL   L040F47
         INC   $7A
L040F47  PLP
         CLC
         RTS

L040F4A  PLP
         SEC
         RTS

L040F4D  PHB
         PHK
         PLB
         PHP
         REP   #$30
         JSR   L040F1B
         BCS   L040F6F
         LDA   L040E95
         BNE   L040F68
         PEI   $72
         PEI   $70
         _HLock
L040F68  DEC   L040E95
         PLP
         PLB
         CLC
         RTL

L040F6F  PLP
         PLB
         SEC
         RTL

L040F73  PHB
         PHK
         PLB
         PHP
         REP   #$30
         JSR   L040F1B
         BCS   L040F97
         LDA   L040E95
         BEQ   L040F93
         INC   L040E95
         BNE   L040F93
         PEI   $72
         PEI   $70
         _HUnlock
L040F93  PLP
         PLB
         CLC
         RTL

L040F97  PLP
         PLB
         SEC
         RTL

L040F9B  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         JSL   L040FF1
         LDY   #$0000
         LDX   $3E
         BNE   L040FAD
         INY
L040FAD  INX
         BNE   L040FB1
         INY
L040FB1  TXA
         ASL
         TAX
         TYA
         ROL
         TAY
         PHA
         PHA
         PHY
         PHX
         LDA   $FE
         ORA   #$0300
         PHA
         PEA   $0008
         PHA
         PHA
         _NewHandle
         PLX
         PLY
         BCS   L040FED
         STX   $70
         STY   $72
         JSR   L040F14
         BCS   L040FED
         PEA   $0000
         PEI   $3E
         PEA   $FFFF
         JSL   L041015
         STZ   L040E95
         PLP
         PLB
         CLC
         RTL

L040FED  PLP
         PLB
         SEC
         RTL

L040FF1  ENT
         PHP
         REP   #$30
         JSR   L040F14
         BCS   L041012
         LDA   $FE
         ORA   #$0300
         PHA
         _DisposeAll
         STZ   $70
         STZ   $72
         STZ   $74
         STZ   $76
         STZ   $78
         STZ   $7A
L041012  PLP
         CLC
         RTL

L041015  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0006
         JSR   L040E97
         JSR   L040F14
         BCS   L041055
         LDA   #$FFFF
         EOR   L040E87
         STA   L040E87
         LDY   L040E8B
L041032  SEP   #$20
         BIT   $5D
         BMI   L04103C
         CPY   $3E
         BCS   L041054
L04103C  LDA   [$74],Y
         AND   L040E87
         STA   [$74],Y
         LDA   [$78],Y
         AND   L040E88
         STA   [$78],Y
         INY
         BEQ   L041054
         REP   #$20
         DEC   L040E89
         BNE   L041032
L041054  CLC
L041055  JMP   L040EF2

L041058  PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0006
         JSR   L040E97
         JSR   L040F14
         BCS   L04108F
         LDY   L040E8B
L04106C  SEP   #$20
         BIT   $5D
         BMI   L041076
         CPY   $3E
         BCS   L04108E
L041076  LDA   [$74],Y
         ORA   L040E87
         STA   [$74],Y
         LDA   [$78],Y
         ORA   L040E88
         STA   [$78],Y
         INY
         BEQ   L04108E
         REP   #$20
         DEC   L040E89
         BNE   L04106C
L04108E  CLC
L04108F  JMP   L040EF2

         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0002
         JSR   L040E97
         JSR   L040F14
         BCS   L0410B8
         LDY   L040E87
         BIT   $5C
         BMI   L0410AE
         CPY   $3E
         BCS   L0410B8
L0410AE  SEP   #$20
         LDA   [$78],Y
         XBA
         LDA   [$74],Y
         REP   #$20
         CLC
L0410B8  JMP   L040EF2

L0410BB  ENT
         PHP
         REP   #$30
         PHA
         JSR   L040F14
         PLY
         BCC   L0410C8
         PLP
         SEC
         RTL

L0410C8  BIT   $5C
         BMI   L0410D0
         CPY   $3E
         BCS   L0410DA
L0410D0  SEP   #$20
         LDA   [$78],Y
         XBA
         LDA   [$74],Y
         PLP
         CLC
         RTL

L0410DA  PLP
         SEC
         RTL

L0410DD  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         JSR   L040F14
         BCS   L0410FC
         LDY   #$0000
L0410EB  JSR   L041118
         BCS   L0410F8
         BIT   $5C
         BMI   L0410EB
         CPY   $3E
         BCC   L0410EB
L0410F8  PLP
         CLC
         PLB
         RTL

L0410FC  PLP
         SEC
         PLB
         RTL

         PHB
         PHK
         PLB
         PHP
         REP   #$30
         PHY
         JSR   L040F14
         PLY
         BCS   L041114
         JSR   L041118
         PLP
         CLC
         PLB
         RTL

L041114  PLP
         SEC
         PLB
         RTL

L041118  PHP
         REP   #$30
         STY   $7C
         LDA   [$3A],Y
         AND   #$00FF
         CMP   #$00A2
         BNE   L041146
         INY
         INY
         INY
         LDA   [$3A],Y
         CMP   #$0022
         BNE   L04113F
         INY
         INY
         LDA   [$3A],Y
         CMP   #$E100
         BNE   L04113F
         LDY   #$0007
         BRA   L04114B
L04113F  LDY   $7C
         LDA   [$3A],Y
         AND   #$00FF
L041146  JSL   L04037A
         INY
L04114B  TYX
         TYA
         LDY   $7C
         CLC
         ADC   $7C
         STA   $7C
         SEP   #$20
         LDA   $30
         LSR
         LDA   #$00
         ROR
         LSR
         STA   L0411CF
         LDA   $31
         LSR
         LDA   #$00
         ROR
         LSR
         LSR
         ORA   L0411CF
         STA   L0411CF
         LDA   [$74],Y
         AND   #$1E
         ORA   #$80
         ORA   L0411CF
         STA   [$74],Y
         LDA   [$3A],Y
         AND   #$DF
         CMP   #$C2
         BNE   L0411C3
         INY
         LDA   [$3A],Y
         DEY
         AND   #$30
         BEQ   L0411C3
         ASL
         PHA
         LDA   [$3A],Y
         CMP   #$C2
         BEQ   L041197
         PLA
         TSB   L0411CF
         BRA   L04119B
L041197  PLA
         TRB   L0411CF
L04119B  LDA   L0411CF
         ASL
         ASL
         PHA
         LDA   #$00
         ROL
         STA   $30
         PLA
         ASL
         LDA   #$00
         ROL
         STA   $31
         LDA   [$74],Y
         AND   #$9E
         ORA   #$01
         ORA   L0411CF
         STA   [$74],Y
         BRA   L0411C3
L0411BA  LDA   [$74],Y
         AND   #$1E
         ORA   L0411CF
         STA   [$74],Y
L0411C3  INY
         BEQ   L0411CC
         DEX
         BNE   L0411BA
         PLP
         CLC
         RTS

L0411CC  PLP
         SEC
         RTS

L0411CF  DB    $00
L0411D0  PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0002
         JSR   L040E97
         JSR   L040F14
         BCS   L041216
         SEP   #$20
         LDY   L040E87
         LDA   [$3A],Y
         AND   #$DF
         CMP   #$C2
         BEQ   L041215
         LDA   [$74],Y
         BPL   L041215
         AND   #$FE
         STA   [$74],Y
         DEY
         CPY   #$FFFF
         BNE   L041201
         STZ   L041219
         BRA   L041208
L041201  LDA   [$74],Y
         AND   #$60
         STA   L041219
L041208  INY
         LDA   [$74],Y
         AND   #$9F
         ORA   L041219
         STA   [$74],Y
         JMP   L0412D0

L041215  CLC
L041216  JMP   L040EF2

L041219  DB    $00
L04121A  PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L040E97
         JSR   L040F14
         BCS   L041268
         LDA   L040E87
         AND   #$0011
         ASL
         ASL
         PHA
         ASL
         ASL
         ASL
         ORA   $01,S
         PLX
         AND   #$0060
         SEP   #$20
         STA   L04126B
         LDY   L040E89
         LDA   [$3A],Y
         AND   #$DF
         CMP   #$C2
         BNE   L041257
         INY
         LDA   [$3A],Y
         DEY
         AND   #$30
         CMP   #$30
         BEQ   L041267
L041257  LDA   [$74],Y
         BPL   L041267
         AND   #$9E
         ORA   #$01
         ORA   L04126B
         STA   [$74],Y
         JMP   L0412D0

L041267  CLC
L041268  JMP   L040EF2

L04126B  DB    $00
L04126C  PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L040E97
         JSR   L040F14
         BCS   L0412B5
         LDA   L040E87
         AND   #$0011
         ASL
         ASL
         PHA
         ASL
         ASL
         ASL
         ORA   $01,S
         PLX
         AND   #$0060
         SEP   #$20
         STA   L0412B8
         LDY   L040E89
         LDA   [$3A],Y
         AND   #$DF
         CMP   #$C2
         BNE   L0412A9
         INY
         LDA   [$3A],Y
         DEY
         AND   #$30
         CMP   #$30
         BEQ   L0412B4
L0412A9  LDA   [$74],Y
         AND   #$9E
         ORA   #$01
         ORA   L0412B8
         STA   [$74],Y
L0412B4  CLC
L0412B5  JMP   L040EF2

L0412B8  DB    $00
L0412B9  PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0002
         JSR   L040E97
         JSR   L040F14
         BCC   L0412CD
         BRL   L040EF2
L0412CD  LDY   L040E87
L0412D0  SEP   #$20
         STY   $7C
         STY   $7E
         LDA   [$74],Y
         AND   #$60
         STA   L0413FA
         JSR   L0413E7
L0412E0  REP   #$20
         TYA
         BIT   $5C
         BMI   L0412EE
         CMP   $3E
         BCC   L0412EE
         BRL   L0413E3
L0412EE  CMP   $7E
         BCS   L0412F5
         BRL   L0413E3
L0412F5  SEP   #$20
         LDA   [$78],Y
         AND   #$63
         STA   L0413FB
         REP   #$20
         TYA
         JSL   L040586
         TAX
         SEP   #$20
         CPY   #$0000
         BEQ   L041312
         LDA   #$80
         TSB   L0413FB
L041312  LDY   $7C
         LDA   [$78],Y
         EOR   L0413FB
         AND   #$7F
         EOR   L0413FB
         STA   [$78],Y
         REP   #$20
         TXA
         STY   $7E
         CLC
         ADC   $7C
         STA   $7C
         BCC   L041331
         CMP   #$0000
         BNE   L04133B
L041331  BIT   $5C
         BMI   L041340
         CMP   $3E
         BEQ   L041340
         BCC   L041340
L04133B  LDA   $3E
         SBC   $7E
         TAX
L041340  SEP   #$20
         LDA   [$3A],Y
         AND   #$DF
         CMP   #$C2
         BNE   L04136D
         INY
         LDA   [$3A],Y
         DEY
         AND   #$30
         BEQ   L04136D
         ASL
         PHA
         LDA   [$74],Y
         ORA   #$01
         STA   [$74],Y
         LDA   [$3A],Y
         CMP   #$C2
         BEQ   L041366
         PLA
         TSB   L0413FA
         BRA   L04136A
L041366  PLA
         TRB   L0413FA
L04136A  JSR   L0413E7
L04136D  LDA   [$74],Y
         AND   #$1F
         ORA   #$80
         ORA   L0413FA
         STA   [$74],Y
         BRA   L04138C
L04137A  LDA   [$74],Y
         AND   #$1F
         ORA   L0413FA
         STA   [$74],Y
         LDA   [$78],Y
         AND   #$9C
         ORA   L0413FB
         STA   [$78],Y
L04138C  INY
         DEX
         BNE   L04137A
         CPY   #$0000
         BEQ   L0413E3
         BIT   $5D
         BMI   L04139D
         CPY   $3E
         BCS   L0413E3
L04139D  LDA   [$74],Y
         BMI   L0413A4
         BRL   L0412E0
L0413A4  REP   #$20
         PHY
         TYA
         JSL   L040586
         CLC
         ADC   $01,S
         TAY
         SEP   #$20
         LDA   [$74],Y
         PLY
         AND   #$80
         BNE   L0413BC
         BRL   L0412E0
L0413BC  LDA   [$74],Y
         AND   #$60
         CMP   L0413FA
         BEQ   L0413E3
         LDA   [$74],Y
         BIT   #$01
         BNE   L0413CE
         BRL   L0412E0
L0413CE  LDA   [$3A],Y
         AND   #$DF
         CMP   #$C2
         BNE   L0413E3
         INY
         LDA   [$3A],Y
         DEY
         AND   #$30
         CMP   #$30
         BEQ   L0413E3
         BRL   L0412E0
L0413E3  CLC
         JMP   L040EF2

L0413E7  LDA   L0413FA
         ASL
         ASL
         PHA
         LDA   #$00
         ROL
         STA   $30
         PLA
         ASL
         LDA   #$00
         ROL
         STA   $31
         RTS

L0413FA  DB    $00
L0413FB  DB    $00
L0413FC  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L040E97
         JSR   L040F14
         BCS   L04145F
         SEP   #$20
         LDX   #$0000
         LDY   L040E89
L041415  LDA   [$74],Y
         BMI   L04144F
         DEY
         CPY   #$FFFF
         BEQ   L04145A
         BRA   L041415
L041421  LDA   [$74],Y
         BMI   L04142D
         DEY
         CPY   #$FFFF
         BEQ   L04145A
         BRA   L041421
L04142D  BIT   #$01
         BEQ   L041442
         LDA   [$3A],Y
         AND   #$DF
         CMP   #$C2
         BNE   L041441
         INY
         LDA   [$3A],Y
         DEY
         AND   #$30
         BNE   L041442
L041441  INX
L041442  LDA   [$74],Y
         BIT   #$18
         BEQ   L041449
         INX
L041449  BIT   #$04
         BEQ   L04144E
         INX
L04144E  INX
L04144F  DEY
         CPY   #$FFFF
         BEQ   L04145A
         DEC   L040E87
         BPL   L041421
L04145A  INY
         REP   #$20
         TYA
         CLC
L04145F  JMP   L040EF2

L041462  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0006
         JSR   L040E97
         JSR   L040F14
         BCC   L041476
         BRL   L040EF2
L041476  LDA   L040E87
         STA   L041511
         LDA   L040E89
         STA   L04150F
         LDA   L040E8B
         STA   L04150D
L041488  LDA   L04150F
         ASL
         TAX
         LDA   L04149D,X
         DEC
         PHA
         LDX   L04150F
         LDY   L04150D
         SEP   #$20
         LDA   [$74],Y
         RTS

L04149D  DA    L0414D1
         DA    L0414CA
         DA    L0414B5
         DA    L0414AE
         DA    L0414A7
L0414A7  DEX
         LDA   [$78],Y
         BIT   #$20
         BNE   L0414F8
L0414AE  DEX
         LDA   [$74],Y
         BIT   #$04
         BNE   L0414F8
L0414B5  DEX
         BIT   #$01
         BEQ   L0414CA
         LDA   [$3A],Y
         AND   #$DF
         CMP   #$C2
         BNE   L0414F8
         INY
         LDA   [$3A],Y
         DEY
         AND   #$30
         BEQ   L0414F8
L0414CA  DEX
         LDA   [$74],Y
         BIT   #$18
         BNE   L0414F8
L0414D1  SEP   #$20
         LDX   #$0004
         LDY   L04150D
L0414D9  DEY
         CPY   #$FFFF
         BEQ   L0414E5
         LDA   [$74],Y
         BPL   L0414D9
         BRA   L0414F8
L0414E5  PEA   $0000
         PEA   ^L04155D
         PEA   L04155D
         LDX   #$0002
         JSL   L040ED6
         LDY   L04150D
L0414F8  REP   #$20
         STY   L04150D
         STX   L04150F
         DEC   L041511
         BEQ   L041508
         BRL   L041488
L041508  TYA
         CLC
         JMP   L040EF2

L04150D  DB    $00
         DB    $00
L04150F  DB    $00
         DB    $00
L041511  DB    $00
         DB    $00
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0002
         JSR   L040E97
         JSR   L040F14
         BCS   L04155A
         SEP   #$20
         LDY   L040E87
         LDA   [$74],Y
         LDX   #$0001
         BIT   #$01
         BEQ   L041543
         LDA   [$3A],Y
         AND   #$DF
         CMP   #$C2
         BNE   L041542
         INY
         LDA   [$3A],Y
         DEY
         AND   #$30
         BNE   L041543
L041542  INX
L041543  LDA   [$74],Y
         BIT   #$18
         BEQ   L04154A
         INX
L04154A  BIT   #$04
         BEQ   L04154F
         INX
L04154F  LDA   [$78],Y
         BIT   #$20
         BEQ   L041556
         INX
L041556  REP   #$20
         TXA
         CLC
L04155A  JMP   L040EF2

L04155D  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0002
         JSR   L040E97
         JSR   L040F14
         BCS   L0415A1
         SEP   #$20
         LDX   #$0000
         LDY   L040E87
         LDA   [$74],Y
         BIT   #$18
         BNE   L0415A0
         INX
         BIT   #$01
         BEQ   L041591
         LDA   [$3A],Y
         AND   #$DF
         CMP   #$C2
         BNE   L0415A0
         INY
         LDA   [$3A],Y
         DEY
         AND   #$30
         BEQ   L0415A0
L041591  INX
         LDA   [$74],Y
         BIT   #$04
         BNE   L0415A0
         INX
         LDA   [$78],Y
         BIT   #$20
         BNE   L0415A0
         INX
L0415A0  CLC
L0415A1  JMP   L040EF2

L0415A4  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L040E97
         JSR   L040F14
         BCS   L041609
         LDA   L040E87
         ASL
         TAX
         LDA   L0415CA,X
         DEC
         PHA
         LDX   L040E87
         SEP   #$20
         LDY   L040E89
         LDA   [$74],Y
         RTS

L0415CA  DA    L0415DF
         DA    L0415F4
         DA    L0415FB
         DA    L041602
         DA    L04160C
L0415D4  LDX   #$0000
         SEP   #$20
         LDA   [$74],Y
         BIT   #$18
         BNE   L041603
L0415DF  INX
         BIT   #$01
         BEQ   L0415F4
         LDA   [$3A],Y
         AND   #$DF
         CMP   #$C2
         BNE   L041603
         INY
         LDA   [$3A],Y
         DEY
         AND   #$30
         BEQ   L041603
L0415F4  INX
         LDA   [$74],Y
         BIT   #$04
         BNE   L041603
L0415FB  INX
         LDA   [$78],Y
         BIT   #$20
         BNE   L041603
L041602  INX
L041603  REP   #$20
         LDA   L040E89
         CLC
L041609  JMP   L040EF2

L04160C  JSR   L041622
         REP   #$20
         LDA   L040E89
         JSL   L040586
         CLC
         ADC   L040E89
         STA   L040E89
         TAY
L041620  BRA   L0415D4
L041622  PHP
         SEP   #$20
         LDA   [$74],Y
         AND   #$60
         ASL
         ASL
         PHA
         LDA   #$00
         ROL
         STA   $30
         PLA
         ASL
         LDA   #$00
         ROL
         STA   $31
         PLP
         RTS

L04163A  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L040E97
         JSR   L040F14
         BCC   L04164E
         BRL   L040EF2
L04164E  LDA   L040E89
         STA   L0416D3
         LDA   L040E87
         STA   L0416D5
         ASL
         TAX
         LDA   L04166C,X
         DEC
         PHA
         LDX   L0416D5
         LDY   L0416D3
         SEP   #$20
         LDA   [$74],Y
         RTS

L04166C  DA    L0416A0
         DA    L041699
         DA    L041684
         DA    L04167D
         DA    L041676
L041676  DEX
         LDA   [$78],Y
         BIT   #$20
         BNE   L0416CC
L04167D  DEX
         LDA   [$74],Y
         BIT   #$04
         BNE   L0416CC
L041684  DEX
         BIT   #$01
         BEQ   L041699
         LDA   [$3A],Y
         AND   #$DF
         CMP   #$C2
         BNE   L0416CC
         INY
         LDA   [$3A],Y
         DEY
         AND   #$30
         BEQ   L0416CC
L041699  DEX
         LDA   [$74],Y
         BIT   #$18
         BNE   L0416CC
L0416A0  SEP   #$20
         LDX   #$0004
         LDY   L0416D3
L0416A8  DEY
         CPY   #$FFFF
         BNE   L0416B3
         LDY   $3E
         BNE   L0416B9
         DEY
L0416B3  LDA   [$74],Y
         BPL   L0416A8
         BRA   L0416CC
L0416B9  PEA   $0000
         PEA   ^L04155D
         PEA   L04155D
         LDX   #$0002
         JSL   L040ED6
         LDY   L0416D3
L0416CC  REP   #$20
         TYA
         CLC
         JMP   L040EF2

L0416D3  DB    $00
         DB    $00
L0416D5  DB    $00
         DB    $00
L0416D7  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0002
         JSR   L040E97
         JSR   L040F14
         BCS   L0416F0
         LDY   L040E87
         JSR   L041707
         CLC
         TYA
L0416F0  JMP   L040EF2

L0416F3  ENT
         PHP
         REP   #$30
         PHA
         JSR   L040F14
         PLY
         BCS   L041704
         JSR   L041707
         TYA
         PLP
         CLC
         RTL

L041704  PLP
         SEC
         RTL

L041707  PHP
         SEP   #$20
         REP   #$10
L04170C  LDA   [$74],Y
         BMI   L041717
         DEY
         CPY   #$FFFF
         BNE   L04170C
         INY
L041717  PLP
         RTS

L041719  ENT
         PHP
         REP   #$30
         PHA
         JSR   L040F14
         PLY
         BCS   L041729
         JSR   L041622
         PLP
         CLC
         RTL

L041729  PLP
         SEC
         RTL

L04172C  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         STA   L041762
         STY   $7C
         JSR   L040F14
         BCS   L04175A
         LDY   $7C
L04173E  SEP   #$20
         LDA   [$78],Y
         XBA
         LDA   [$74],Y
         REP   #$20
         AND   L041762
         CMP   L041762
         BEQ   L04175E
         INY
         BEQ   L04175A
         BIT   $5C
         BMI   L04173E
         CPY   $3E
         BCC   L04173E
L04175A  PLP
         SEC
         PLB
         RTL

L04175E  PLP
         CLC
         PLB
         RTL

L041762  DB    $00
         DB    $00
L041764  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         STA   L041797
         STY   $7C
         JSR   L040F14
         BCS   L04178F
         LDY   $7C
L041776  SEP   #$20
         LDA   [$78],Y
         XBA
         LDA   [$74],Y
         REP   #$20
         AND   L041797
         BNE   L041793
         INY
         BEQ   L04178F
         BIT   $5C
         BMI   L041776
         CPY   $3E
         BCC   L041776
L04178F  PLP
         SEC
         PLB
         RTL

L041793  PLP
         CLC
         PLB
         RTL

L041797  DB    $00
         DB    $00
L041799  PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDA   $AA
         ORA   $AC
         BNE   L0417A8
L0417A5  PLP
         PLB
         RTL

L0417A8  LDY   #$0002
         LDA   [$AA]
         TAX
         LDA   [$AA],Y
         TAY
         BNE   L0417B6
         TXA
         BEQ   L0417A5
L0417B6  STX   $AE
         STY   $B0
         JSR   L040F14
         BCS   L0417A5
L0417BF  LDA   [$AE]
         INC   $AE
         BNE   L0417C7
         INC   $B0
L0417C7  AND   #$00FF
         BEQ   L0417A5
         CMP   #$00E0
         BCS   L0417DC
         CLC
         ADC   $AE
         STA   $AE
         BCC   L0417BF
         INC   $B0
         BRA   L0417BF
L0417DC  ASL
         TAX
         JMP   (L0417E1-$1C0,X)

L0417E1  DA    L041821
         DA    L041821
         DA    L041832
         DA    L041842
         DA    L041821
         DA    L041821
         DA    L041821
         DA    L0418F9
         DA    L041821
         DA    L041821
         DA    L041821
         DA    L041916
         DA    L041916
         DA    L041916
         DA    L041901
         DA    L041821
         DA    L0418F9
         DA    L041821
         DA    L041821
         DA    L041916
         DA    L041821
         DA    L04183A
         DA    L04184A
         DA    L041853
         DA    L041821
         DA    L041821
         DA    L041821
         DA    L041821
         DA    L041821
         DA    L041821
         DA    L041821
         DA    L041821

L041821  PLP
         RTS

         PLP
         CLC
         RTS

L041826  CLC
         ADC   $AE
         STA   $AE
         BCC   L04182F
         INC   $B0
L04182F  BRL   L0417BF
L041832  JSR   L0418DB
         LDA   #$000A
         BRA   L041826
L04183A  JSR   L0418DB
         LDA   #$0006
         BRA   L041826
L041842  JSR   L0418DB
         LDA   #$000E
         BRA   L041826
L04184A  JSR   L0418DB
         LDA   #$0007
         BRL   L041826
L041853  LDA   [$AE]
         DEC
         STA   L0418F5
         LDA   #$FF00
         STA   L0418F7
         LDY   #$0002
         LDA   [$AE],Y
         BEQ   L041869
         BRL   L0417A5
L041869  LDY   #$0004
         LDA   [$AE],Y
         AND   #$00FF
         STA   L0418F3
         LDA   #$0005
         CLC
         ADC   $AE
         STA   $AE
         BCC   L041880
         INC   $B0
L041880  DEC   L0418F5
         BPL   L041888
         BRL   L0417BF
L041888  LDA   [$AE]
         INC   $AE
         BNE   L041890
         INC   $B0
L041890  AND   #$00FF
         CMP   #$0080
         BCC   L0418A5
         AND   #$007F
         XBA
         CLC
         ADC   L0418F7
         STA   L0418F7
         BRA   L041880
L0418A5  SEP   #$20
         INC   L0418F8
         REP   #$20
         TAX
L0418AD  DEC   L0418F5
         LDA   [$AE]
         INC   $AE
         BNE   L0418B8
         INC   $B0
L0418B8  AND   #$00FF
         CLC
         ADC   L0418F7
         PHX
         LDX   #$0002
         LDY   L0418F3
         CPY   #$0001
         BNE   L0418CC
         INX
L0418CC  CPY   #$0002
         BNE   L0418D2
         INX
L0418D2  JSR   L0418E6
         PLX
         DEX
         BPL   L0418AD
         BRA   L041880
L0418DB  LDA   [$AE]
         AND   #$00FF
         TAX
         LDY   #$0002
         LDA   [$AE],Y
L0418E6  TAY
L0418E7  LDA   [$78],Y
         ORA   #$0008
         STA   [$78],Y
         INY
         DEX
         BNE   L0418E7
         RTS

L0418F3  DB    $00
         DB    $00
L0418F5  DB    $00
         DB    $00
L0418F7  DB    $00
L0418F8  DB    $00
L0418F9  JSR   L041971
         LDA   #$0004
         BRA   L041928
L041901  LDA   [$AE]
         AND   #$00FF
         TAX
         LDY   #$0005
         LDA   [$AE],Y
         TAY
         JSR   L0418E7
         CLC
         LDA   #$0007
         BRA   L041928
L041916  LDY   #$0002
         LDA   [$AE],Y
         AND   #$00FF
         TAX
         LDA   [$AE]
         TAY
         JSR   L0418E7
         LDA   #$0003
L041928  CLC
         ADC   $AE
         STA   $AE
         BCC   L041931
         INC   $B0
L041931  LDA   [$AE]
         INC   $AE
         BNE   L041939
         INC   $B0
L041939  AND   #$00FF
         BEQ   L04194F
         CMP   #$0080
         BCC   L041931
         AND   #$007F
         BEQ   L041931
         CMP   #$0008
         BCC   L041952
         PLP
         RTS

L04194F  BRL   L0417BF
L041952  ASL
         TAX
         JMP   (L041957,X)

L041957  DA    $0000
         DA    L041967
         DA    L04196C
         DA    L04196C
         DA    L04196C
         DA    L04196C
         DA    L04196C
         DA    L041967

L041967  LDA   #$0004
         BRA   L041928
L04196C  JSR   L041971
         BRA   L041931
L041971  LDA   [$AE]
         AND   #$00FF
         INC
         ADC   $AE
         STA   $AE
         BCC   L04197F
         INC   $B0
L04197F  RTS

         PHP
         REP   #$30
         PHA
         JSR   L040F14
         PLY
         BCS   L041990
         JSR   L041707
         BRL   L0410C8
L041990  PLP
         SEC
         RTL

L041993  ENT
         PHP
         REP   #$30
         PHA
         JSR   L040F14
         PLY
         BCS   L0419BA
         LDX   #$0000
         SEP   #$20
L0419A2  INX
         INY
         BEQ   L0419B4
         BIT   $5D
         BMI   L0419AE
         CPY   $3E
         BCS   L0419B4
L0419AE  LDA   [$74],Y
         BMI   L0419B4
         BRA   L0419A2
L0419B4  REP   #$20
         TXA
         PLP
         CLC
         RTL

L0419BA  PLP
         SEC
         RTL

L0419BD  PHB
         PHK
         PLB
         PHP
         REP   #$30
         JSR   L040F14
         BCC   L0419CC
         PLP
         PLB
         SEC
         RTL

L0419CC  SEP   #$20
         STZ   $30
         STZ   $31
         STZ   L041AB4
         LDY   #$0000
L0419D8  SEP   #$20
         STY   $7C
         LDA   [$78],Y
         BMI   L041A49
         LDA   [$74],Y
         BIT   #$01
         BNE   L041A59
L0419E6  LDY   $7C
         STZ   L041AB3
         LDA   [$3A],Y
         CMP   #$A2
         BNE   L041A12
         REP   #$20
         INY
         INY
         INY
         LDA   [$3A],Y
         CMP   #$0022
         BNE   L041A0F
         INY
         INY
         LDA   [$3A],Y
         CMP   #$E100
         BNE   L041A0D
         SEP   #$20
         LDY   #$0007
         BRA   L041A44
L041A0D  DEY
         DEY
L041A0F  DEY
         DEY
         DEY
L041A12  SEP   #$20
         LDA   [$3A],Y
         PHA
         AND   #$DF
         CMP   #$C2
         BNE   L041A3E
         INY
         LDA   [$3A],Y
         DEY
         AND   #$30
         BEQ   L041A3E
         ASL
         XBA
         PLA
         CMP   #$C2
         BEQ   L041A32
         XBA
         TSB   L041AB4
         BRA   L041A36
L041A32  XBA
         TRB   L041AB4
L041A36  JSR   L041A63
         LDY   #$0002
         BRA   L041A44
L041A3E  PLA
         JSL   L04037A
         INY
L041A44  STY   L041AB5
         BRA   L041A76
L041A49  PEI   $42
         PHY
         LDA   #$80
         STA   L041AB3
         JSL   L04349E
         BCC   L041A44
         BCS   L0419E6
L041A59  AND   #$60
         STA   L041AB4
         JSR   L041A63
         BRA   L0419E6
L041A63  LDA   L041AB4
         ASL
         ASL
         STZ   $30
         BCC   L041A6E
         ROL   $30
L041A6E  ASL
         STZ   $31
         BCC   L041A75
         ROL   $31
L041A75  RTS

L041A76  LDY   $7C
         LDA   [$74],Y
         AND   #$1F
         ORA   #$80
         ORA   L041AB4
         STA   [$74],Y
L041A83  INY
         BEQ   L041AAF
         REP   #$20
         DEC   L041AB5
         SEP   #$20
         BEQ   L041AA1
         LDA   [$78],Y
         ORA   L041AB3
         STA   [$78],Y
         LDA   [$74],Y
         AND   #$1E
         ORA   L041AB4
         STA   [$74],Y
         BRA   L041A83
L041AA1  BIT   $5D
         BPL   L041AA8
         BRL   L0419D8
L041AA8  CPY   $3E
         BCS   L041AAF
         BRL   L0419D8
L041AAF  PLP
         PLB
         CLC
         RTL

L041AB3  DB    $00
L041AB4  DB    $00
L041AB5  DB    $00
         DB    $00
L041AB7  DB    $00
         DB    $00
L041AB9  DB    $00
         DB    $00
L041ABB  DB    $00
L041ABC  DB    $00
         DB    $00
L041ABE  DB    $00
         DB    $00
L041AC0  DB    $00
         DB    $00
L041AC2  DB    $00
         DB    $00
L041AC4  DB    $00
         DB    $00
L041AC6  DB    $00
         DB    $00
         DB    $00
         DB    $00
L041ACA  ENT
         DB    $00
         DB    $00
L041ACC  DB    $00
         DB    $01
L041ACE  ENT
         DB    $00
         DB    $00
L041AD0  ENT
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L041BD0  DW    $0002      ; Parms for ExpandPath
L041BD2  ADRL  $00000000  ;  path name
         ADRL  L041ACC    ;  new pathname
L041BDA  DW    $0004      ; Parms for Create
         ADRL  L041ACE    ;  file name
         DW    $00E3      ;  access
         DW    $005E      ;  file type
         ADRL  $00008002  ;  aux type
L041BE8  DW    $0002      ; Parms for Open
L041BEA  DW    $0000      ;  ref num
         ADRL  L041ACE    ;  path name
L041BF0  DW    $0004      ; Parms for Write
L041BF2  DW    $0000      ;  ref num
L041BF4  ADRL  $00000000  ;  buffer ptr
L041BF8  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L041C00  DW    $0004      ; Parms for Write
L041C02  DW    $0000      ;  ref num
         ADRL  L041C10    ;  buffer ptr
         ADRL  $00000002  ;  request count
         ADRL  $00000000  ;  transfer count
L041C10  DB    $00
         DB    $00
L041C12  DW    $0001      ; Parms for Close
L041C14  DW    $0000      ;  ref num
L041C16  DW    $0009      ; Parms for GetFileInfo
         ADRL  L041ACE    ;  file name
         DW    $0000      ;  access
L041C1E  DW    $0000      ;  file type
L041C20  ADRL  $00000000  ;  aux type
         DW    $0000      ;  storage
         DS    8          ;  creation date
         DS    8          ;  modification date
         ADRL  $00000000  ;  option list
L041C3A  ADRL  $00000000  ;  end of file
L041C3E  DW    $0002      ; Parms for GetMark
L041C40  DW    $0000      ;  ref num
L041C42  ADRL  $00000000  ;  position
L041C46  DW    $0003      ; Parms for SetEOF
L041C48  DW    $0000      ;  ref num
         DW    $0000      ;  base
L041C4C  ADRL  $00000000  ;  displacement
L041C50  PHP
         REP   #$30
         PHA
         PHA
         PHY
         PHX
         PEI   $80
         PHA
         PHA
         PHA
         JSR   L041C73
         _NewHandle
         JSR   L041CC1
         PLX
         PLY
         BCS   L041C70
         PLP
         CLC
         RTS

L041C70  PLP
         SEC
         RTS

L041C73  PHP
         REP   #$30
         LDY   #$0004
         LDA   $8A
         BNE   L041C81
         LDA   $8C
         BEQ   L041C8B
L041C81  LDA   [$8A],Y
         STA   L041D00
         ORA   #$8000
         STA   [$8A],Y
L041C8B  LDA   $9E
         BNE   L041C93
         LDA   $A0
         BEQ   L041C9D
L041C93  LDA   [$9E],Y
         STA   L041D02
         ORA   #$8000
         STA   [$8A],Y
L041C9D  LDA   $B2
         BNE   L041CA5
         LDA   $B4
         BEQ   L041CAF
L041CA5  LDA   [$B2],Y
         STA   L041D04
         ORA   #$8000
         STA   [$B2],Y
L041CAF  PLP
         CLC
         RTS

L041CB2  PHP
         REP   #$30
         PEI   $80
         _HLockAll
         PLP
         CLC
         RTS

L041CC1  PHP
         REP   #$30
         LDY   #$0004
         LDA   $8A
         BNE   L041CCF
         LDA   $8C
         BEQ   L041CD4
L041CCF  LDA   L041D00
         STA   [$8A],Y
L041CD4  LDA   $9E
         BNE   L041CDC
         LDA   $A0
         BEQ   L041CE1
L041CDC  LDA   L041D02
         STA   [$9E],Y
L041CE1  LDA   $B2
         BNE   L041CE9
         LDA   $B4
         BEQ   L041CEE
L041CE9  LDA   L041D04
         STA   [$B2],Y
L041CEE  PLP
         CLC
         RTS

L041CF1  PHP
         REP   #$30
         PEI   $80
         _HUnlockAll
         PLP
         CLC
         RTS

L041D00  DB    $00
         DB    $00
L041D02  DB    $00
         DB    $00
L041D04  DB    $00
         DB    $00
L041D06  PHP
         REP   #$30
         LDA   $BA
         AND   #$00E0
         LSR
         LSR
         LSR
         TAX
         LDA   $8A,X
         STA   $8A
         LDA   $8C,X
         STA   $8C
         LDY   #$0002
         LDA   [$8A]
         TAX
         LDA   [$8A],Y
         TAY
         BNE   L041D28
         TXA
         BEQ   L041D3C
L041D28  STX   $9A
         STY   $9C
         STY   $A4
         TXA
         CLC
         ADC   #$0010
         STA   $A2
         BCC   L041D39
         INC   $A4
L041D39  PLP
         CLC
         RTS

L041D3C  PLP
         SEC
         RTS

L041D3F  PHP
         REP   #$30
         LDY   #$0008
         LDA   [$9A],Y
         TAX
         INY
         INY
         LDA   [$9A],Y
         TAY
         BNE   L041D52
         TXA
         BEQ   L041D71
L041D52  STY   $A0
         STX   $9E
         LDY   #$0002
         LDA   [$9E],Y
         TAX
         LDA   [$9E]
         STA   $9A
         STX   $9C
         STX   $A4
         CLC
         ADC   #$0010
         STA   $A2
         BCC   L041D6E
         INC   $A4
L041D6E  PLP
         CLC
         RTS

L041D71  PLP
         SEC
         RTS

L041D74  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         JSL   L041DDC
         LDA   $FE
         AND   #$F0FF
         ORA   #$0200
         STA   $80
         STZ   $BA
         LDA   #$0020
L041D8D  STA   L041DDA
         LDY   #$0000
         LDX   #$0800
         LDA   #$0008
         JSR   L041C50
         BCS   L041DD6
         STX   $8A
         STY   $8C
         JSR   L041D06
         LDY   #$07FE
         LDA   #$0000
L041DAB  STA   [$9A],Y
         DEY
         DEY
         BPL   L041DAB
         LDA   L041DDA
         PHA
         LSR
         LSR
         LSR
         TAX
         LDA   $8A
         STA   $8A,X
         LDA   $8C
         STA   $8C,X
         TXA
         LSR
         TAX
         STZ   $82,X
         PLA
         CLC
         ADC   #$0020
         CMP   #$0080
         BCC   L041D8D
         STZ   $82
         PLP
         PLB
         CLC
         RTL

L041DD6  PLP
         PLB
         SEC
         RTL

L041DDA  DW    $0000

L041DDC  ENT
         PHP
         REP   #$30
         LDA   $80
         BEQ   L041E04
         PHA
         _DisposeAll
         LDA   #$0006
L041DEE  TAX
         STZ   $82,X
         ASL
         TAX
         LSR
         STZ   $8A,X
         STZ   $8C,X
         DEC
         DEC
         BPL   L041DEE
         STZ   $9E
         STZ   $A0
         STZ   $AA
         STZ   $AC
L041E04  LDA   #$0000
         STAL  L041ACA
         PLP
         RTL

L041E0D  PHP
         REP   #$30
         LDY   #$0000
         LDX   #$0800
         LDA   #$0008
         JSR   L041C50
         BCS   L041E5D
         PHY
         PHX
         JSR   L041D06
L041E23  JSR   L041D3F
         BCC   L041E23
         PLA
         LDY   #$0008
         STA   [$9A],Y
         STA   $9E
         INY
         INY
         PLA
         STA   [$9A],Y
         STA   $A0
         LDY   #$0002
         LDA   [$9E],Y
         STA   $9C
         STA   $A4
         LDA   [$9E]
         STA   $9A
         CLC
         ADC   #$0010
         STA   $A2
         BCC   L041E4E
         INC   $A4
L041E4E  LDY   #$07FE
         LDA   #$0000
L041E54  STA   [$9A],Y
         DEY
         DEY
         BPL   L041E54
         PLP
         CLC
         RTS

L041E5D  PLP
         SEC
         RTS

L041E60  PHP
         REP   #$30
         JSR   L041D06
         BCS   L041E85
L041E68  LDX   #$007F
         LDY   #$0000
L041E6E  LDA   [$A2],Y
         BEQ   L041E88
         TYA
         CLC
         ADC   #$0010
         TAY
         DEX
         BNE   L041E6E
         JSR   L041D3F
         BCC   L041E68
         JSR   L041E0D
         BCC   L041E68
L041E85  PLP
         SEC
         RTS

L041E88  TYA
         CLC
         ADC   $A2
         STA   $A2
         LDA   #$0000
         ADC   $A4
         STA   $A4
         LDY   #$000E
         LDA   #$0000
L041E9B  STA   [$A2],Y
         DEY
         DEY
         BPL   L041E9B
         PLP
         CLC
         RTS

L041EA4  PHP
         REP   #$30
         PHY
         PHA
         LDY   #$000C
         LDA   [$A2],Y
         TAX
         INY
         INY
         LDA   [$A2],Y
         TAY
         BNE   L041EB9
         TXA
         BEQ   L041ED4
L041EB9  STX   $B2
         STY   $B4
         LDY   #$0002
         LDA   [$B2]
         TAX
         LDA   [$B2],Y
         TAY
         BNE   L041ECB
         TXA
         BEQ   L041ED4
L041ECB  STX   $B6
         STY   $B8
         PLA
         PLY
         PLP
         CLC
         RTS

L041ED4  PLA
         PLY
         PLP
         SEC
         RTS

L041ED9  REP   #$30
         CPX   #$0000
         BEQ   L041F15
         PLA
         STA   L041F16
         PLA
         STA   L041AB7
         PLA
         STA   L041AB9
         SEP   #$20
         PLA
         STA   L041ABB
         CPX   #$0000
         BEQ   L041F03
         TXY
         LDX   #$0000
L041EFB  PLA
         STA   L041ABC,X
         INX
         DEY
         BNE   L041EFB
L041F03  LDA   L041ABB
         PHA
         REP   #$20
         LDA   L041AB9
         PHA
         LDA   L041AB7
         PHA
         LDA   L041F16
         PHA
L041F15  RTS

L041F16  DW    $0000

L041F18  PHP
         REP   #$30
         LDA   $05,S
         STA   L041F30+1
         LDA   $06,S
         STA   L041F30+2
         LDA   $03,S
         STA   $07,S
         LDA   $01,S
         STA   $05,S
         PLA
         PLA
         PLP
L041F30  JMPL  $000000

L041F34  PHP
         REP   #$20
         STA   L041F54
         SEP   #$20
         PLA
         AND   #$CF
         STA   L041F53
         LDA   $01,S
         AND   #$30
         ORA   L041F53
         STA   $01,S
         REP   #$20
         LDA   L041F54
         PLP
         PLB
         RTL

L041F53  DB    $00
L041F54  DB    $00
         DB    $00
L041F56  PHP
         REP   #$30
         LDA   L041BEA
         STA   L041BF2
         STA   L041C02
         STA   L041C40
         STA   L041C48
         STA   L041C14
         PLP
         RTS

L041F6D  PHP
         REP   #$30
         JSL   GSOS
         DW    $2006      ; GetFileInfo
         ADRL  L041C16
         BCS   L041F92
         LDA   L041C1E
         CMP   #$005E
         BNE   L041F8F
         LDA   L041C20
         CMP   #$8002
         BNE   L041F8F
         PLP
         CLC
         RTS

L041F8F  LDA   #$0000
L041F92  PLP
         SEC
         RTS

L041F95  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   L041ABC
         STA   L041BD2
         LDA   L041ABE
         STA   L041BD2+2
         ORA   L041ABC
         BEQ   L041FC1
         JSL   GSOS
         DW    $200E      ; ExpandPath
         ADRL  L041BD0
         BCC   L041FC1
         BRL   L042125
L041FC1  JSL   L041D74
         BCC   L041FCA
         BRL   L04211C
L041FCA  JSR   L041F6D
         BCC   L041FD2
         BRL   L042125
L041FD2  JSL   GSOS
         DW    $2010      ; Open
         ADRL  L041BE8
         BCC   L041FE1
         BRL   L042125
L041FE1  JSR   L041F56
         LDY   L041C3A+2
         LDX   L041C3A
         TXA
         ORA   L041C3A+2
         BNE   L041FF3
         BRL   L042121
L041FF3  STY   L041BF8+2
         STX   L041BF8
         LDA   #$0008
         JSR   L041C50
         BCC   L042004
         BRL   L04211C
L042004  STY   L04215A
         STX   L042158
         PHB
         PHY
         PLB
         LDA   |$0000,X
         STA   $00
         STAL  L041BF4
         LDA   |$0002,X
         STA   $02
         STAL  L041BF4+2
         PLB
         PLB
         JSL   GSOS
         DW    $2012      ; Read
         ADRL  L041BF0
         BCC   L042030
         BRL   L04211F
L042030  LDA   #$0020
         STA   $BA
         LDA   [$00]
         STA   $82
         BNE   L04203E
         BRL   L042121
L04203E  LDY   #$0002
L042041  PHY
         JSR   L041D06
         PLY
         LDA   $BA
         LSR
         LSR
         LSR
         LSR
         TAX
         LDA   L04215E,X
         INC
         INC
         STA   L04215C
         LDA   [$00],Y
         PHP
         INY
         INY
         PLP
         STA   $82,X
         STA   L041C10
L042060  BNE   L042065
         BRL   L042104
L042065  CMP   #$007F
         BCC   L04206D
         LDA   #$007F
L04206D  STA   L042154
L042070  LDA   #$FFFF
         STA   [$A2]
         CLC
         TYA
         ADC   $00
         STA   $00
         BCC   L04207F
         INC   $02
L04207F  LDY   #$0000
         LDX   #$0002
L042085  LDA   [$00],Y
         INY
         INY
         PHY
         TXY
         STA   [$A2],Y
         PLY
         INX
         INX
         CPX   L04215C
         BCC   L042085
         PHY
         LDY   #$0003
         LDA   [$A2],Y
         PLY
         AND   #$00FF
         BEQ   L0420E0
         INC
         STA   L042156
         PHY
         LDY   #$0000
         TAX
         LDA   #$0008
         JSR   L041C50
         PHB
         PHY
         PLB
         LDA   |$0000,X
         STA   $B6
         LDA   |$0002,X
         STA   $B8
         PLB
         PLB
         TYA
         LDY   #$000E
         STA   [$A2],Y
         DEY
         DEY
         TXA
         STA   [$A2],Y
         PLY
         SEP   #$20
         LDX   #$0000
L0420D0  LDA   [$00],Y
         INY
         PHY
         TXY
         STA   [$B6],Y
         PLY
         INX
         DEC   L042156
         BNE   L0420D0
         REP   #$20
L0420E0  LDA   $A2
         CLC
         ADC   #$0010
         STA   $A2
         BCC   L0420EC
         INC   $A4
L0420EC  DEC   L041C10
         BEQ   L042104
         DEC   L042154
         BEQ   L0420F9
         BRL   L042070
L0420F9  PHY
         JSR   L041E0D
         PLY
         LDA   L041C10
         BRL   L042060
L042104  LDA   $BA
         CLC
         ADC   #$0020
         STA   $BA
         CMP   #$0080
         BCS   L042114
         BRL   L042041
L042114  LDA   #$FFFF
         STA   L041ACA
         BRA   L042121
L04211C  LDA   #$0000
L04211F  SEC
         HEX   90
L042121  CLC
         JSR   L042128
L042125  JMP   L041F34

L042128  PHP
         PHA
         JSL   GSOS
         DW    $2014      ; Close
         ADRL  L041C12
         LDA   L04215A
         ORA   L042158
L04213A  BEQ   L042151
         LDA   L04215A
         PHA
         LDA   L042158
         PHA
         _DisposeHandle
         STZ   L04215A
         STZ   L042158
L042151  PLA
         PLP
         RTS

L042154  DB    $00
         DB    $00
L042156  DB    $00
         DB    $00
L042158  DB    $00
         DB    $00
L04215A  DB    $00
         DB    $00
L04215C  DB    $00
         DB    $00
L04215E  DB    $00
         DB    $00
         DB    $08
         DB    $00
         DB    $08
         DB    $00
         DB    $0E
         DB    $00
L042166  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   L041ABC
         STA   L041BD2
         STA   $00
         LDA   L041ABE
         STA   L041BD2+2
         STA   $02
         ORA   $00
         BEQ   L0421B8
         JSL   GSOS
         DW    $200E      ; ExpandPath
         ADRL  L041BD0
         BCC   L042195
         BRL   L0422FF
L042195  LDA   [$00]
         TAY
         INY
         LDX   L041ACE
         INX
         SEP   #$20
L04219F  LDA   [$00],Y
         AND   #$7F
         JSR   L04231D
         CMP   L041ACE,X
         BNE   L0421B6
         LDA   [$00],Y
         AND   #$7F
         STA   L041ACE,X
         DEX
         DEY
         BNE   L04219F
L0421B6  REP   #$20
L0421B8  JSL   GSOS
         DW    $2001      ; Create
         ADRL  L041BDA
         BCC   L0421D4
         CMP   #$0047
         BEQ   L0421CC
         BRL   L0422FF
L0421CC  JSR   L041F6D
         BCC   L0421D4
         BRL   L0422FC
L0421D4  JSL   GSOS
         DW    $2010      ; Open
         ADRL  L041BE8
         BCC   L0421E3
         BRL   L0422FF
L0421E3  JSR   L041F56
         JSR   L041CB2
         LDA   $82
         STA   L041C10
         JSL   GSOS
         DW    $2013      ; Write
         ADRL  L041C00
         BCC   L0421FD
         BRL   L042305
L0421FD  LDA   #$0020
         STA   $BA
L042202  JSR   L041D06
         LDA   $BA
         LSR
         LSR
         LSR
         LSR
         TAX
         LDA   $82,X
         STA   L041C10
         JSL   GSOS
         DW    $2013      ; Write
         ADRL  L041C00
         BCC   L042220
         BRL   L042305
L042220  LDA   L041C10
         BNE   L042228
         BRL   L0422AF
L042228  LDA   #$007F
         STA   L04231B
L04222E  LDA   [$A2]
         BEQ   L04228E
         DEC   L041C10
         BMI   L0422AF
         LDA   $A2
         CLC
         ADC   #$0002
         STA   L041BF4
         LDA   $A4
         ADC   #$0000
         STA   L041BF4+2
         LDA   $BA
         LSR
         LSR
         LSR
         LSR
         TAX
         STZ   L041BF8+2
         LDA   L042313,X
         STA   L041BF8
         JSL   GSOS
         DW    $2013      ; Write
         ADRL  L041BF0
         BCC   L042267
         BRL   L042305
L042267  LDY   #$0003
         LDA   [$A2],Y
         AND   #$00FF
         BEQ   L04228E
         INC
         STA   L041BF8
         JSR   L041EA4
         LDA   $B6
         STA   L041BF4
         LDA   $B8
         STA   L041BF4+2
         JSL   GSOS
         DW    $2013      ; Write
         ADRL  L041BF0
         BCS   L042305
L04228E  CLC
         LDA   L041C10
         BEQ   L0422AF
         LDA   $A2
         ADC   #$0010
         STA   $A2
         LDA   #$0000
         ADC   $A4
         STA   $A4
         DEC   L04231B
         BNE   L04222E
         JSR   L041D3F
         BCS   L042302
         BRL   L042228
L0422AF  LDA   $BA
         CLC
         ADC   #$0020
         STA   $BA
         CMP   #$0080
         BCS   L0422BF
         BRL   L042202
L0422BF  JSL   GSOS
         DW    $2017      ; GetMark
         ADRL  L041C3E
         LDA   L041C42
         STA   L041C4C
         LDA   L041C42+2
         STA   L041C4C+2
         JSL   GSOS
         DW    $2018      ; SetEOF
         ADRL  L041C46
         BCS   L042305
         JSL   GSOS
         DW    $2014      ; Close
         ADRL  L041C12
         LDA   #$FFFF
         STA   L041ACA
         CLC
L0422F2  PHP
         PHA
         JSR   L041CF1
         PLA
         PLP
         JMP   L041F34

L0422FC  LDA   #$0000
L0422FF  SEC
         BRA   L0422F2
L042302  LDA   #$0000
L042305  PHA
         JSL   GSOS
         DW    $2014      ; Close
         ADRL  L041C12
         PLA
         BRA   L0422FF
L042313  DB    $00
         DB    $00
         DB    $08
         DB    $00
         DB    $08
         DB    $00
         DB    $0E
         DB    $00
L04231B  DB    $00
         DB    $00
         MX    %11
L04231D  CMP   #$61
         BCC   L042327
         CMP   #$7B
         BCS   L042327
         AND   #$5F
L042327  RTS

         MX    %00
L042328  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         PEA   $0000
         PEI   $3E
         PEA   $FFFF
         JSL   L041015
         JSL   L041799
         LDA   #$E020
L042341  STA   $BA
         JSR   L041D06
         LDA   $9A
         STA   $A2
         LDA   $9C
         STA   $A4
L04234E  JSR   L0424F2
         BCC   L042369
         LDA   $BA
         CLC
         ADC   #$0020
         CMP   #$E080
         BCC   L042341
         JSL   L0419BD
         JSL   L0424A8
         PLP
         PLB
         RTL

L042369  LDY   #$0004
         LDA   [$A2],Y
         STA   $BC
         INY
         INY
         LDA   [$A2],Y
         STA   $BE
         EOR   $42
         BNE   L04234E
         INY
         INY
         LDA   [$A2],Y
         STA   $C2
         PEI   $9C
         PEI   $9A
         PEI   $A4
         PEI   $A2
         PEI   $BA
         LDY   #$0002
         LDA   [$A2],Y
         PHA
         AND   #$00E0
         SEC
         SBC   #$0020
         LSR
         LSR
         LSR
         LSR
         TAX
         LDA   L0423C4,X
         TAX
         PLA
         AND   #$001F
         ASL
         PHX
         ADC   $01,S
         PLX
         TAX
         LDA   |$0000,X
         DEC
         PER   L0423B3-1
         PHA
         RTS

L0423B3  PLA
         STA   $BA
         PLA
         STA   $A2
         PLA
         STA   $A4
         PLA
         STA   $9A
         PLA
         STA   $9C
         BRA   L04234E

L0423C4  DA    L0423CA
         DA    L0423EC
         DA    L0423F8

L0423CA  DA    L042427
         DA    L042427
         DA    L042427
         DA    L042427
         DA    L042427
         DA    L042427
         DA    L042427
         DA    L042427
         DA    L042427
         DA    L042427
         DA    L042427
         DA    L042427
         DA    L042427
         DA    L042427
         DA    L042427
         DA    L042427
         DA    L042427

L0423EC  DA    L042407
         DA    L042417
         DA    L042406
         DA    L042406
         DA    L042406
         DA    L042406

L0423F8  DA    L042433
         DA    L042450
         DA    L042467
         DA    L042467
         DA    L042473
         DA    L04245D
         DA    L04249B

L042406  RTS

L042407  PEI   $BC
         LDA   $C2
         BNE   L04240E
         INC
L04240E  PHA
         PEA   $4000
         JSL   L041058
         RTS

L042417  PEI   $BC
         LDA   $C2
         BNE   L04241E
         INC
L04241E  PHA
         PEA   $6000
         JSL   L041058
         RTS

L042427  PEI   $BC
         PEI   $C2
         PEA   $8000
         JSL   L041058
         RTS

L042433  PEI   $BC
         PEA   $0001
         PEA   $0010
         JSL   L041058
         LDA   $BC
         CLC
         ADC   $C2
         PHA
         PEA   $0001
         PEA   $0008
         JSL   L041058
         RTS

L042450  LDY   #$000C
         LDA   [$A2],Y
         PEI   $BC
         PHA
         JSL   L04126C
         RTS

L04245D  PEI   $BC
         LDA   $C2
         BNE   L042464
         INC
L042464  PHA
         BRA   L04246B
L042467  PEI   $BC
         PEI   $C2
L04246B  PEA   $1000
         JSL   L041058
         RTS

L042473  PEI   $BC
         PEA   $0001
         PEA   $0004
         JSL   L041058
         LDA   $BC
         CLC
         ADC   $C2
         PHA
         PEA   $0001
         PEA   $0004
         JSL   L041058
         PEI   $BC
         PEI   $C2
         PEA   $0002
         JSL   L041058
         RTS

L04249B  PEI   $BC
         PEA   $0001
         PEA   $0400
         JSL   L041058
         RTS

L0424A8  ENT
         JSR   L044DE1
         JSR   L045685
         RTL

L0424AF  PHP
         REP   #$30
         JSR   L041D06
L0424B5  LDX   #$0080
         LDY   #$0000
L0424BB  TYA
         CLC
         ADC   #$0010
         TAY
         DEX
         BNE   L0424CC
         JSR   L041D3F
         BCC   L0424B5
         PLP
         SEC
         RTS

L0424CC  LDA   [$9A],Y
         BPL   L0424BB
         INY
         INY
         SEP   #$20
         LDA   [$9A],Y
         AND   $BB
         CMP   $BA
         REP   #$20
         PHP
         DEY
         DEY
         PLP
         BNE   L0424BB
         TYA
         CLC
         ADC   $9A
         STA   $A2
         LDA   #$0000
         ADC   $9C
         STA   $A4
         PLP
         CLC
         RTS

L0424F2  PHP
         REP   #$30
         SEC
         LDA   $A4
         SBC   $9C
         LDA   $A2
         SBC   $9A
         TAY
         LSR
         LSR
         LSR
         LSR
         SEC
         SBC   #$0080
         EOR   #$FFFF
         INC
         TAX
         BRA   L0424BB
L04250E  PHP
         REP   #$30
         JSR   L041D06
L042514  LDX   #$0080
         LDY   #$0000
L04251A  TYA
         CLC
         ADC   #$0010
         TAY
         DEX
         BNE   L042533
         JSR   L041D3F
         BCC   L042514
         LDA   #$0000
         PLP
         SEP   #$40
         SEC
         RTS

L042530  PLY
         BRA   L04251A
L042533  CLC
         ADC   $9A
         STA   $A2
         LDA   #$0000
         ADC   $9C
         STA   $A4
         PHY
         LDY   #$0000
         LDA   [$A2],Y
         BPL   L042530
         INY
         INY
         SEP   #$20
         LDA   [$A2],Y
         AND   $BB
         CMP   $BA
         REP   #$20
         BNE   L042530
         LDY   #$0006
         LDA   [$A2],Y
         CMP   $BE
         BNE   L042530
         DEY
         DEY
         LDA   [$A2],Y
         CMP   $BC
         CLV
         BEQ   L04257B
         BCS   L042530
         LDY   #$0008
         CLC
         ADC   [$A2],Y
         BCS   L042579
         BEQ   L042579
         CMP   $BC
         BEQ   L042530
         BCC   L042530
L042579  SEP   #$40
L04257B  LDY   #$0002
         LDA   [$A2],Y
         AND   #$001F
         TAX
         INY
         INY
         LDA   [$A2],Y
         PLY
         BVS   L04258F
         PLP
         CLV
         CLC
         RTS

L04258F  PLP
         SEP   #$40
         CLC
         RTS

L042594  PHP
         REP   #$30
         JSR   L041D06
         BCC   L04259F
         PLP
         SEC
         RTS

L04259F  CLC
         LDA   $BC
         ADC   $C2
         DEC
         STA   $C0
L0425A7  LDX   #$0080
         LDA   $9A
         STA   $A2
         LDA   $9C
         STA   $A4
L0425B2  LDA   $A2
         CLC
         ADC   #$0010
         STA   $A2
         BCC   L0425BE
         INC   $A4
L0425BE  DEX
         BNE   L0425C9
         JSR   L041D3F
         BCC   L0425A7
         PLP
         SEC
         RTS

L0425C9  LDA   [$A2]
         BEQ   L0425B2
         LDY   #$0002
         SEP   #$20
         LDA   [$A2],Y
         AND   $BB
         CMP   $BA
         REP   #$20
         BNE   L0425B2
         LDY   #$0006
         LDA   [$A2],Y
         CMP   $BE
         BNE   L0425B2
         DEY
         DEY
         LDA   [$A2],Y
         STA   L04264F
         LDY   #$0008
         CLC
         ADC   [$A2],Y
         DEC
         STA   L042651
         CMP   $BC
         BCC   L0425B2
         CMP   $C0
         BCC   L042619
         LDA   L04264F
         CMP   $BC
         BEQ   L04260D
         BCC   L042628
         CMP   $C0
         BEQ   L04260D
         BCS   L0425B2
L04260D  LDA   L042651
         SEC
         SBC   $C0
         TAY
         LDX   #$0000
         BRA   L042642
L042619  LDA   L04264F
         CMP   $BC
         BCC   L042638
         LDX   #$0000
         LDY   #$0000
         BRA   L042642
L042628  LDA   $BC
         SEC
         SBC   L04264F
         TAX
         LDA   L042651
         SEC
         SBC   $C0
         TAY
         BRA   L042642
L042638  LDY   #$0000
         LDA   $BC
         SEC
         SBC   L04264F
         TAX
L042642  PHY
         LDY   #$0002
         LDA   [$A2],Y
         AND   #$001F
         PLY
         PLP
         CLC
         RTS

L04264F  BRK   $00
L042651  BRK   $00

L042653  PHP
         REP   #$30
         SEC
         LDA   $A4
         SBC   $9C
         LDA   $A2
         SBC   $9A
         LSR
         LSR
         LSR
         LSR
         SEC
         SBC   #$0080
         EOR   #$FFFF
         INC
         TAX
         BRL   L0425B2
L04266F  PHP
         REP   #$30
         LDA   $82
         INC
         BEQ   L042688
         STA   $82
         LDA   $BA
         AND   #$00E0
         LSR
         LSR
         LSR
         LSR
         TAX
         INC   $82,X
         PLP
         CLC
         RTS

L042688  PLP
         SEC
         RTS

L04268B  PHP
         REP   #$30
         LDA   $82
         BEQ   L0426A4
         DEC
         STA   $82
         LDA   $BA
         AND   #$00E0
         LSR
         LSR
         LSR
         LSR
         TAX
         DEC   $82,X
         PLP
         CLC
         RTS

L0426A4  PLP
         SEC
         RTS

L0426A7  PHP
         REP   #$30
         LDY   #$0000
         LDA   #$FFFF
         STA   [$A2],Y
         LDY   #$0004
         LDA   $BC
         STA   [$A2],Y
         INY
         INY
         LDA   $BE
         STA   [$A2],Y
         INY
         INY
         LDA   $C2
         STA   [$A2],Y
         PLP
         RTS

L0426C7  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   L041ABC
         STA   $A6
         LDA   L041ABE
         STA   $A8
         LDA   #$E040
         STA   $BA
         JSR   L041D06
         LDA   $9A
         STA   $A2
         LDA   $9C
         STA   $A4
L0426ED  REP   #$20
         JSR   L0424F2
         BCS   L042740
         LDY   #$000C
         LDA   [$A2],Y
         STA   $B2
         INY
         INY
         LDA   [$A2],Y
         STA   $B4
         LDY   #$0002
         LDA   [$B2]
         STA   $B6
         LDA   [$B2],Y
         STA   $B8
         LDA   #$0000
         TAY
         LDA   [$A6]
         AND   #$00FF
         INC
         TAX
         SEP   #$20
L042719  LDA   [$A6],Y
         CMP   [$B6],Y
         BNE   L0426ED
         INY
         DEX
         BNE   L042719
         LDY   #$0002
         LDA   [$A2],Y
         AND   #$1F
         TAX
         REP   #$20
         INY
         INY
         LDA   [$A2],Y
         PHA
         INY
         INY
         LDA   [$A2],Y
         TAY
         PLA
         CLC
L042739  STZ   $B2
         STZ   $B4
         JMP   L041F34

L042740  LDA   #$0000
         TAX
         TAY
         SEC
         BRA   L042739
L042748  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$000C
         JSR   L041ED9
         LDA   L041AC0
         CMP   #$0004
         BEQ   L0427AF
         LDA   L041AC6
         STA   $BE
         EOR   $42
         BNE   L0427AF
         LDA   L041AC4
         STA   $BC
         JSL   L0410BB
         BIT   #$6000
         BEQ   L042776
         BRL   L04286C
L042776  LDX   L041AC0
         CPX   #$0004
         BCS   L0427AF
         LDX   L041AC2
         BNE   L0427AF
         BIT   #$8000
         BNE   L042797
         LDY   L041AC4
         LDA   [$3A],Y
         JSL   L04037A
         INY
         STY   L041AC2
         BRA   L0427AF
L042797  LDA   #$E020
         STA   $BA
         JSR   L04250E
         LDA   $BC
         JSR   L042FF8
         SEC
         SBC   $BC
         PHY
         CLC
         ADC   $01,S
         STA   L041AC2
         PLA
L0427AF  LDA   L041ABC
         STA   $A6
         LDA   L041ABE
         STA   $A8
         LDA   [$A6]
         AND   #$00FF
         BNE   L0427C3
         BRL   L04286C
L0427C3  PHA
         INC
         TAX
         LDY   #$0000
         LDA   #$0008
         JSR   L041C50
         BCC   L0427D4
         BRL   L042870
L0427D4  STX   $B2
         STY   $B4
         LDY   #$0002
         LDA   [$B2]
         STA   $B6
         LDA   [$B2],Y
         STA   $B8
         PLY
         PHY
         SEP   #$20
L0427E7  LDA   [$A6],Y
         ORA   #$80
         STA   [$B6],Y
         DEY
         BNE   L0427E7
         LDA   [$A6]
         STA   [$B6]
         REP   #$20
         LDA   #$0040
         STA   $BA
         JSR   L041E60
         PLA
         BCS   L042873
         XBA
         ORA   L041AC0
         ORA   #$0040
         LDY   #$0002
         STA   [$A2],Y
         DEY
         DEY
         JSR   L04266F
         BCS   L042873
         LDA   #$FFFF
         STA   [$A2],Y
         LDY   #$0004
         LDA   L041AC4
         STA   [$A2],Y
         INY
         INY
         LDA   L041AC6
         STA   [$A2],Y
         INY
         INY
         LDA   L041AC2
         BNE   L042830
         INC
L042830  STA   [$A2],Y
         LDY   #$000C
         LDA   $B2
         STA   [$A2],Y
         INY
         INY
         LDA   $B4
         STA   [$A2],Y
         LDA   L041AC0
         CMP   #$0004
         BEQ   L04286C
         LDA   L041AC6
         EOR   $42
         BNE   L04286C
         LDA   L041AC4
         PHA
         LDA   L041AC2
         BNE   L042858
         INC
L042858  PHA
         LDX   #$4000
         LDA   L041AC0
         CMP   #$0001
         BNE   L042867
         LDX   #$6000
L042867  PHX
         JSL   L041058
L04286C  CLC
L04286D  JMP   L041F34

L042870  PLA
         BRA   L04286D
L042873  PEI   $B4
         PEI   $B2
         _DisposeHandle
         STZ   $B2
         STZ   $B4
         SEC
         BRA   L042870
L042885  PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0008
         JSR   L041ED9
         LDA   #$FF44
         STA   $BA
         LDA   L041AC2
         STA   $BE
         LDA   L041AC0
         STA   $BC
         LDA   L041ABE
         STA   $A8
         LDA   L041ABC
         STA   $A6
         JSR   L044D31
         LDA   $BE
         BCS   L0428DE
         JMP   L041F34

L0428B4  ENT
         BRL   L0428C3
         DW    $7771
         STR   'TGetLabel'
L0428C3  PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0008
         JSR   L041ED9
         LDA   #$FC40
         STA   $BA
         LDA   L041AC0
         STA   $BC
         LDA   L041AC2
         STA   $BE
L0428DE  EOR   $42
         BNE   L0428F7
         LDA   $BA
         AND   #$001F
         CMP   #$0004
         BEQ   L0428F7
         LDA   $BC
         JSL   L0410BB
         BIT   #$4000
         BEQ   L04294E
L0428F7  JSR   L04250E
         BCS   L04294E
         PHX
         PHA
         JSR   L041EA4
         BCS   L04294C
         LDY   #$000E
         LDA   [$A2],Y
         ORA   #$8000
         STA   [$A2],Y
         PEI   $B8
         PEI   $B6
         LDA   L041ABE
         STA   $A8
         PHA
         LDA   L041ABC
         STA   $A6
         PHA
         JSL   L0307DD
         PLA
         PHA
         SEC
         SBC   $BC
         BEQ   L04293F
         EOR   #$FFFF
         INC
         PHA
         SEP   #$30
         LDA   [$A6]
         INC
         STA   [$A6]
         TAY
         LDA   #$AB
         STA   [$A6],Y
         REP   #$30
         PLA
         JSR   L042953
L04293F  PLA
         CLV
         CMP   $BC
         BEQ   L042947
         SEP   #$40
L042947  PLX
         CLC
L042949  JMP   L041F34

L04294C  PLA
         PLX
L04294E  SEC
         SEP   #$40
         BRA   L042949
L042953  PHP
         REP   #$30
         PHA
         LSR   L0429B4
         LDA   [$A6]
         AND   #$00FF
         TAY
         SEP   #$20
         LDA   $01,S
         ORA   $02,S
         CMP   #$0A
         BCC   L04296F
         INY
         LDA   #$A4
         STA   [$A6],Y
L04296F  INY
         REP   #$20
         PLA
         PHA
         JSR   L04298D
         PLA
         PHA
         JSR   L042991
         PLA
         PHA
         JSR   L042995
         PLA
         JSR   L042999
         SEP   #$20
         DEY
         TYA
         STA   [$A6]
         PLP
         RTS

         MX    %00
L04298D  LSR
         LSR
         LSR
         LSR
L042991  LSR
         LSR
         LSR
         LSR
L042995  LSR
         LSR
         LSR
         LSR
L042999  PHY
         JSL   L030823
         PLY
         BIT   L0429B4
         BMI   L0429AC
         CMP   #$00B0
         BEQ   L0429B3
         ROR   L0429B4
L0429AC  SEP   #$20
         STA   [$A6],Y
         REP   #$20
         INY
L0429B3  RTS

L0429B4  DB    $00
         DB    $00
L0429B6  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   #$FF44
         STA   $BA
         LDA   L041ABC
         STA   $BC
         LDA   L041ABE
         STA   $BE
         BRA   L0429EE
L0429D3  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   #$FC40
         STA   $BA
         LDA   L041ABC
         STA   $BC
         LDA   L041ABE
         STA   $BE
L0429EE  JSR   L04250E
         BCS   L042A23
         BVS   L042A26
         LDA   $BA
         AND   #$001F
         CMP   #$0004
         BEQ   L042A1B
         LDA   $BE
         EOR   $42
         BNE   L042A1B
         LDY   #$0004
         LDA   [$A2],Y
         PHA
         LDY   #$0008
         LDA   [$A2],Y
         BNE   L042A13
         INC
L042A13  PHA
         PEA   $6000
         JSL   L041015
L042A1B  LDA   #$0000
         STA   [$A2]
         JSR   L04268B
L042A23  JMP   L041F34

L042A26  SEC
         LDY   #$0004
         LDA   $BC
         SBC   [$A2],Y
         PHA
         LDY   #$0008
         LDA   [$A2],Y
         TAX
         LDA   $01,S
         STA   [$A2],Y
         TXA
         SEC
         SBC   $01,S
         TAX
         PLA
         LDA   $BA
         AND   #$001F
         CMP   #$0004
         BEQ   L042A59
         LDA   $BE
         EOR   $42
         BNE   L042A59
         PEI   $BC
         PHX
         PEA   $6000
         JSL   L041015
L042A59  CLC
         BRA   L042A23
L042A5C  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   L041ABC
         STA   $BC
         LDA   L041ABE
         STA   $BE
         BIT   $F6
         BMI   L042A9C
         LDA   #$FF60
         STA   $BA
         JSR   L04250E
         BCS   L042AA5
         LDY   #$0004
         LDA   $BC
         SEC
         SBC   [$A2],Y
         LDY   #$000C
         CLC
         ADC   [$A2],Y
         PHA
         INY
         INY
         LDA   #$0000
         ADC   [$A2],Y
         TAY
         PLA
L042A98  CLC
         JMP   L041F34

L042A9C  CLC
         ADC   #$00FD
         TAY
         LDA   $BC
         BRA   L042A98
L042AA5  LDA   $BC
         LDY   $BE
         BNE   L042A98
         CLC
         ADC   $32
         PHA
         TYA
         CLC
         SEP   #$20
         ADC   $34
         REP   #$20
         TAY
         PLA
         BRA   L042A98
L042ABB  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         BIT   $F6
         BPL   L042ACE
         BRL   L042B48
L042ACE  LDA   #$FF60
         STA   $BA
         JSR   L0424AF
         BRA   L042ADB
L042AD8  JSR   L0424F2
L042ADB  BCC   L042AE0
         BRL   L042B69
L042AE0  LDY   #$000E
         LDA   [$A2],Y
         CMP   L041ABE
         BEQ   L042AEC
         BCS   L042AD8
L042AEC  DEY
         DEY
         LDA   [$A2],Y
         BCC   L042AF9
         CMP   L041ABC
         BEQ   L042AF9
         BCS   L042AD8
L042AF9  LDY   #$0008
         CLC
         ADC   [$A2],Y
         PHA
         LDY   #$000E
         LDA   #$0000
         ADC   [$A2],Y
         TAX
         PLA
         SEC
         SBC   #$0001
         BCS   L042B11
         DEX
L042B11  CPX   L041ABE
         BEQ   L042B18
         BCS   L042B1F
L042B18  BCC   L042AD8
         CMP   L041ABC
         BCC   L042AD8
L042B1F  DEY
         DEY
         LDA   L041ABC
         SEC
         SBC   [$A2],Y
         TAX
         INY
         INY
         LDA   L041ABE
         SBC   [$A2],Y
         BNE   L042AD8
         PHX
         TAX
         PLA
         LDY   #$0004
         CLC
         ADC   [$A2],Y
         BCS   L042B97
         PHA
         TXA
         INY
         INY
         ADC   [$A2],Y
         TAY
         PLA
L042B44  CLC
L042B45  JMP   L041F34

L042B48  LDA   L041ABE
         BNE   L042B5A
         LDY   #$0002
         LDA   L041ABC
         CMP   #$C100
         BCC   L042B97
         BRA   L042B44
L042B5A  CMP   #$00FE
         BCC   L042B97
         AND   #$0001
         INC
         TAY
         LDA   L041ABC
         BRA   L042B44
L042B69  LDA   $42
         BNE   L042BA0
         SEC
         LDA   L041ABC
         SBC   $32
         PHA
         LDA   L041ABE
         SEP   #$20
         SBC   $34
         REP   #$20
         TAY
         PLA
         TYX
         BNE   L042B97
         BIT   $5C
         BMI   L042B8A
         CMP   $3E
         BCS   L042B97
L042B8A  STY   $BE
         STA   $BC
         JSR   L04250E
         LDY   $BE
         LDA   $BC
         BCS   L042B44
L042B97  LDA   L041ABC
         LDY   L041ABE
         SEC
         BRA   L042B45
L042BA0  LDY   L041ABE
         BEQ   L042BAD
         CPY   $40
         BEQ   L042BAF
         BCC   L042BAF
         BRA   L042B97
L042BAD  LDY   $42
L042BAF  LDA   L041ABC
         CPY   $42
         BNE   L042B44
         BIT   $5C
         BMI   L042B44
         CMP   $3E
         BCS   L042B97
         BRA   L042B44
L042BC0  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$000A
         JSR   L041ED9
         LDA   L041AC4
         STA   $BE
         LDA   L041AC2
         STA   $BC
         LDA   L041AC0
         STA   $C2
         BNE   L042BE4
         LDA   $3E
         SEC
         SBC   $BC
         STA   $C2
L042BE4  LDA   #$FF60
         STA   $BA
         JSR   L041D06
         LDA   $9A
         STA   $A2
         LDA   $9C
         STA   $A4
L042BF4  JSR   L0424F2
         BCS   L042C53
         LDY   #$0004
         LDA   [$A2],Y
         SEC
         SBC   $BC
         BEQ   L042C40
         BPL   L042C3C
         EOR   #$FFFF
         INC
         LDY   #$0008
         CMP   [$A2],Y
         BCS   L042BF4
         PHA
         LDA   [$A2],Y
         CLC
         LDY   #$0004
         ADC   [$A2],Y
         PHA
         PEA   $0001
         PEA   $0008
         JSL   L041015
         PLA
         PHA
         CLC
         LDY   #$0004
         ADC   [$A2],Y
         PHA
         PEA   $0001
         PEA   $0008
         JSL   L041058
         PLA
         STA   [$A2],Y
         BRA   L042BF4
L042C3C  STA   $C2
         BRA   L042BF4
L042C40  LDY   #$000C
         LDA   L041ABC
         STA   [$A2],Y
         INY
         INY
         LDA   L041ABE
         STA   [$A2],Y
         CLC
L042C50  JMP   L041F34

L042C53  JSR   L041E60
         BCS   L042C50
         JSR   L04266F
         BCS   L042C50
         JSR   L0426A7
         LDY   #$0002
         LDA   #$0060
         STA   [$A2],Y
         PEI   $BC
         PEA   $0001
         PEA   $0010
         JSL   L041058
         LDA   $BC
         ADC   $C2
         PHA
         PEA   $0001
         PEA   $0008
         JSL   L041058
         BRA   L042C40
L042C85  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   L041ABC
         STA   $BC
         LDA   L041ABE
         STA   $BE
         LDA   #$FF60
         STA   $BA
         JSR   L04250E
         BCS   L042CDB
         BVS   L042CDE
         LDA   #$0000
         STA   [$A2]
         JSR   L04268B
         BCS   L042CDB
         LDA   $42
         CMP   $BE
         BNE   L042CDA
         PEI   $BC
         PEA   $0001
         PEA   $0010
         JSL   L041015
         LDY   #$0008
         LDA   [$A2],Y
         CLC
         ADC   $BC
         CMP   $3E
         BEQ   L042CDA
         PHA
         PEA   $0001
         PEA   $0008
         JSL   L041015
L042CDA  CLC
L042CDB  JMP   L041F34

L042CDE  LDY   #$0008
         LDA   [$A2],Y
         CLC
         ADC   $BC
         CMP   $3E
         BEQ   L042CF5
         PHA
         PEA   $0001
         PEA   $0008
         JSL   L041015
L042CF5  LDY   #$0004
         LDA   $BC
         SEC
         SBC   [$A2],Y
         LDY   #$0008
         STA   [$A2],Y
         CLC
         ADC   $BC
         PHA
         PEA   $0001
         PEA   $0008
         JSL   L041058
         BRA   L042CDA
L042D12  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   L041ABC
         STA   $BC
         LDA   L041ABE
         STA   $BE
         LDA   #$FF60
         STA   $BA
         JSR   L04250E
         BCS   L042D40
         TAX
         LDY   #$000C
         LDA   [$A2],Y
         PHA
         INY
         INY
         LDA   [$A2],Y
         TAY
         PLA
         CLC
L042D40  JMP   L041F34

L042D43  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0006
         JSR   L041ED9
         LDA   L041ABE
         STA   $BC
         LDA   L041AC0
         STA   $BE
         LDA   #$FF61
         STA   $BA
         JSR   L04250E
         BVS   L042D8A
L042D63  LDY   #$000C
         LDA   L041ABC
         STA   [$A2],Y
         LDY   #$0002
         LDA   #$0061
         STA   [$A2],Y
         PEI   $BC
         LDA   L041ABC
         PHA
         PEA   ^L04121A
         PEA   L04121A
         LDX   #$0004
         JSL   L041F18
         CLC
L042D87  JMP   L041F34

L042D8A  JSR   L041E60
         BCS   L042D87
         JSR   L04266F
         BCS   L042D87
         LDA   #$0001
         STA   $C2
         JSR   L0426A7
         BRA   L042D63
L042D9E  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   L041ABC
         STA   $BC
         LDA   L041ABE
         STA   $BE
         LDA   #$FF61
         STA   $BA
         JSR   L04250E
         BCS   L042DD5
         LDA   #$0000
         STA   [$A2]
         JSR   L04268B
         PEI   $BC
         PEA   ^L0411D0
         PEA   L0411D0
         LDX   #$0002
         JSL   L041F18
L042DD5  CLC
         JMP   L041F34

L042DD9  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   L041ABC
         STA   $BC
         LDA   L041ABE
         STA   $BE
         LDA   #$FF61
         STA   $BA
         JSR   L04250E
         BCS   L042DFE
         LDY   #$000C
         LDA   [$A2],Y
L042DFE  JMP   L041F34

L042E01  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0006
         JSR   L041ED9
         LDA   #$FF64
         STA   $BA
         JSR   L041D06
         BCS   L042E89
         LDA   L041ABE
         STA   $BC
         LDA   L041AC0
         STA   $BE
         LDA   $3E
         SEC
         SBC   $BC
         STA   $C2
         JSR   L0424AF
         BRA   L042E30
L042E2D  JSR   L0424F2
L042E30  BCS   L042E8C
         LDY   #$0006
         LDA   [$A2],Y
         EOR   $BE
         BNE   L042E2D
         DEY
         DEY
         LDA   [$A2],Y
         CMP   $BC
         BEQ   L042E80
         BCS   L042E75
         LDY   #$0008
         CLC
         ADC   [$A2],Y
         BEQ   L042E55
         BCS   L042E55
         CMP   $BC
         BEQ   L042E2D
         BCC   L042E2D
L042E55  TAX
         LDY   #$0004
         LDA   $BC
         SBC   [$A2],Y
         LDY   #$0008
         STA   [$A2],Y
         LDA   $BE
         EOR   $42
         BNE   L042E2D
         PHX
         PEA   $0001
         PEA   $0004
         JSL   L041015
         BRA   L042E2D
L042E75  SEC
         SBC   $BC
         CMP   $C2
         BCS   L042E2D
         STA   $C2
         BRA   L042E2D
L042E80  LDA   L041ABC
         LDY   #$000A
         STA   [$A2],Y
         CLC
L042E89  JMP   L041F34

L042E8C  JSR   L041E60
         BCS   L042E89
         JSR   L04266F
         BCS   L042E89
         LDA   $BE
         EOR   $42
         BNE   L042EC7
         PEI   $BC
         PEA   $0001
         PEA   $0004
         JSL   L041058
         LDA   $BC
         CLC
         ADC   $C2
         BEQ   L042EBC
         BCS   L042EBC
         PHA
         PEA   $0001
         PEA   $0004
         JSL   L041058
L042EBC  PEI   $BC
         PEI   $C2
         PEA   $0002
         JSL   L041058
L042EC7  JSR   L0426A7
         LDA   #$0064
         LDY   #$0002
         STA   [$A2],Y
         BRA   L042E80
L042ED4  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   #$FF64
         STA   $BA
         JSR   L041D06
         BCS   L042F33
         LDA   L041ABC
         STA   $BC
         LDA   L041ABE
         STA   $BE
         JSR   L04250E
         BCS   L042F32
         BVC   L042F36
         LDA   $BE
         EOR   $42
         BNE   L042F25
         LDY   #$0004
         LDA   [$A2],Y
         CLC
         LDY   #$0008
         ADC   [$A2],Y
         SEC
         SBC   $BC
         PEI   $BC
         PHA
         PEA   $0006
         JSL   L041015
         PEI   $BC
         PEA   $0001
         PEA   $0004
         JSL   L041058
L042F25  SEC
         LDY   #$0004
         LDA   $BC
         SBC   [$A2],Y
         LDY   #$0008
         STA   [$A2],Y
L042F32  CLC
L042F33  JMP   L041F34

L042F36  LDA   #$0000
         STA   [$A2]
         JSR   L04268B
         BCS   L042F33
         LDA   $BE
         EOR   $42
         BNE   L042F32
         LDY   #$0004
         LDA   [$A2],Y
         PHA
         LDY   #$0008
         LDA   [$A2],Y
         PHA
         PEA   $0006
         JSL   L041015
         BRA   L042F33
L042F5B  PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDA   $06,S
         STA   $BC
         LDA   $08,S
         STA   $BE
         TAX
         LDA   $04,S
         STA   $08,S
         LDA   $02,S
         STA   $06,S
         LDA   $01,S
         STA   $05,S
         TSC
         CLC
         ADC   #$0004
         TCS
         CPX   $42
         BNE   L042F8B
         LDA   $BC
         JSL   L0410BB
         BIT   #$0002
         BEQ   L042FB7
L042F8B  LDA   #$FF64
         STA   $BA
         JSR   L04250E
         BCS   L042FB7
         LDY   #$000A
         LDA   [$A2],Y
L042F9A  PHP
         AND   #$00FF
         SEP   #$20
         PHA
         LDA   $02,S
         AND   #$CF
         STA   L042FB6
         LDA   $03,S
         AND   #$30
         ORA   L042FB6
         STA   $03,S
         PLA
         PLP
         PLP
         PLB
         RTL

L042FB6  DB    $00
L042FB7  PEI   $BE
         PEI   $BC
         JSL   L042A5C
         TYA
         SEP   #$40
         BRA   L042F9A
         MX    %00
L042FC4  STA   L042FF4
         STZ   L042FF6
         LDX   #$0008
L042FCD  LDA   #$0000
         ASL   L042FF4
         ROL
         ASL   L042FF4
         ROL
         ADC   L042FF6
         STA   L042FF6
         DEX
         BNE   L042FCD
         LDA   L042FF6
         BEQ   L042FEF
         CMP   #$0003
         BEQ   L042FEF
         BCS   L042FC4
         SEC
         RTS

L042FEF  LDA   #$0000
         CLC
         RTS

L042FF4  DB    $00
         DB    $00
L042FF6  DB    $00
         DB    $00
L042FF8  STA   L043063
         SEC
         LDY   #$0004
         SBC   [$A2],Y
         STA   L043065
         LDY   #$0008
         LDA   [$A2],Y
         STA   L043067
         CPX   #$0006
         BCS   L043023
         LDA   L04305D,X
         AND   #$00FF
         STA   L043067
         TXA
         ASL
         TAX
         LDA   L043065
         JMP   (L043037,X)

L043023  LDY   #$0004
         LDA   [$A2],Y
         LDY   L043067
         CLC
         RTS

L04302D  CLC
         LDY   #$0004
         ADC   [$A2],Y
         LDY   L043067
         RTS

L043037  DA    L04302D
         DA    L043043
         DA    L043043
         DA    L043043
         DA    L04304B
         DA    L043053

L043043  BIT   #$0001
         BEQ   L04302D
         DEC
         BRA   L04302D
L04304B  BIT   #$0003
         BEQ   L04302D
         DEC
         BRA   L04304B
L043053  PHA
         JSR   L042FC4
         PLA
         BCC   L04302D
         DEC
         BRA   L043053
L04305D  DB    $01
         DB    $02
         DB    $02
         DB    $02
         DB    $04
         DB    $03
L043063  DB    $00
         DB    $00
L043065  DB    $00
         DB    $00
L043067  DB    $00
         DB    $00
L043069  ENT
         BRL   L043078
         DW    $7771
         STR   'TSetConst'
L043078  PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0008
         JSR   L041ED9
         LDA   L041ABE
         BNE   L04308A
         INC
L04308A  STA   $C2
         STA   L0433DB
         LDA   L041AC0
         STA   $BC
         STA   L0433D9
         STA   L0433D7
         CLC
         ADC   $C2
         DEC
         STA   $C0
         LDA   L041AC2
         STA   $BE
         LDX   #$E020
         STX   $BA
         EOR   $42
         BNE   L0430C3
         LDA   $BC
L0430B0  PHA
         JSL   L0410BB
         BIT   #$8000
         BNE   L0430C2
         PLA
         INC
         CMP   $C0
         BCC   L0430B0
         BRA   L0430DC
L0430C2  PLA
L0430C3  JSR   L042594
         BRA   L0430CB
L0430C8  JSR   L042653
L0430CB  BCS   L0430DC
         PEI   $A4
         PEI   $A2
         JSR   L043147
         PLA
         STA   $A2
         PLA
         STA   $A4
         BRA   L0430C8
L0430DC  JSR   L041E60
         BCS   L043144
         JSR   L0426A7
         LDY   #$0002
         LDA   L041ABC
         AND   #$001F
         ORA   #$0020
         STA   [$A2],Y
         JSR   L04266F
         BCS   L043144
         LDA   $BE
         EOR   $42
         BNE   L04312C
         PEI   $BC
         PEI   $C2
         PEA   $8000
         JSL   L041058
         PEI   $BC
         PEI   $C2
         PEA   $0080
         JSL   L041015
         BCS   L043144
         LDA   L0433D7
         JSL   L0416F3
         PHA
         PEA   ^L0412B9
         PEA   L0412B9
         LDX   #$0002
         JSL   L041F18
         BCS   L043144
L04312C  LDA   L0433D9
         STA   $BC
         LDA   #$FC40
         STA   $BA
         JSR   L04250E
         BVS   L043143
         LDY   #$0008
         LDA   L0433DB
         STA   [$A2],Y
L043143  CLC
L043144  JMP   L041F34

L043147  STX   L0433DD
         STY   L0433DF
         STA   L0433E1
         LDY   #$000E
L043153  LDA   [$A2],Y
         STA   L0433E7,Y
         STA   L0433F7,Y
         STA   L043407,Y
         DEY
         DEY
         BPL   L043153
         STZ   L0433F7
         STZ   L043407
         LDA   #$0000
         STA   [$A2]
         JSR   L04268B
         LDX   L0433EF
         BEQ   L043193
         LDA   $BE
         EOR   $42
         BNE   L043193
         LDA   L0433EB
         PHA
         PHX
         LDX   #$8000
         LDA   L0433E1
         CMP   #$0006
         BCC   L04318E
         LDX   #$8080
L04318E  PHX
         JSL   L041015
L043193  LDA   L0433DD
         ORA   L0433DF
         BNE   L04319C
         RTS

L04319C  LDA   L0433E1
         ASL
         TAX
         CMP   #$000C
         BCS   L0431B1
         LDA   L0433EF
         CMP   L043460,X
         BEQ   L0431B1
         BRL   L043299
L0431B1  LDA   L0433DD
         BEQ   L0431F3
         DEC
         CMP   L043417,X
         BCS   L0431F3
         LDA   L0433DD
         STA   L0433FF
         STA   L0433DB
         LDA   L0433FB
         STA   L0433D7
         STA   L0433D9
         DEC   L0433F7
         LDA   L043417,X
         BPL   L0431DC
         LDA   #$0001
         STA   L0433DD
L0431DC  CLC
         LDA   L04346C,X
         BEQ   L0431F3
         ADC   L0433DD
         DEC
         TAX
         LDA   |$0000,X
         AND   #$001F
         ORA   #$0020
         STA   L0433F9
L0431F3  LDA   L0433E1
         ASL
         TAX
         LDA   L0433DF
         BEQ   L04323C
         DEC
         CMP   L043439,X
         BCS   L04323C
         CLC
         LDA   L04340B
         ADC   L04340F
         SEC
         SBC   L0433DF
         STA   L04340B
         LDA   L0433DF
         STA   L04340F
         DEC   L043407
         LDA   L043439,X
         BPL   L043225
         LDA   #$0001
         STA   L0433DF
L043225  CLC
         LDA   L04346C,X
         BEQ   L04323C
         ADC   L0433DF
         DEC
         TAX
         LDA   |$0000,X
         AND   #$001F
         ORA   #$0020
         STA   L043409
L04323C  LDA   L0433F7
         BPL   L04326A
         JSR   L041E60
         LDY   #$000E
L043247  LDA   L0433F7,Y
         STA   [$A2],Y
         DEY
         DEY
         BPL   L043247
         JSR   L04266F
         LDA   $BE
         EOR   $42
         BNE   L04326A
         LDX   L0433FF
         BEQ   L04326A
         LDA   L0433FB
         PHA
         PHX
         PEA   $8000
         JSL   L041058
L04326A  LDA   L043407
         BPL   L043298
         JSR   L041E60
         LDY   #$000E
L043275  LDA   L043407,Y
         STA   [$A2],Y
         DEY
         DEY
         BPL   L043275
         JSR   L04266F
         LDA   $BE
         EOR   $42
         BNE   L043298
         LDX   L04340F
         BEQ   L043298
         LDA   L04340B
         PHA
         PHX
         PEA   $8000
         JSL   L041058
L043298  RTS

L043299  STZ   L0433E3
         STZ   L0433E5
         JMP   (L0432A2,X)

L0432A2  DA    L0432AE
         DA    L043326
         DA    L043326
         DA    L043326
         DA    L043357
         DA    L043387

L0432AE  LDA   L0433DD
         BEQ   L0432C2
         STA   L0433FF
         STA   L0433DB
         LDA   L0433FB
         STA   L0433D9
         DEC   L0433F7
L0432C2  CLC
         LDA   L04340B
         ADC   L04340F
         SEC
         SBC   L0433DF
         STA   L04340B
         LDA   L0433DF
         BEQ   L0432DB
         STA   L04340F
         DEC   L043407
L0432DB  JSR   L04323C
         STZ   L0433F7
         STZ   L043407
         LDX   L0433E3
         BEQ   L043305
         STX   L0433FF
         CLC
         LDA   L0433FB
         ADC   L0433DD
         STA   L0433FB
         STA   L0433D7
         LDA   L04345B,X
         AND   #$00FF
         STA   L0433F9
         DEC   L0433F7
L043305  LDX   L0433E5
         BEQ   L043323
         STX   L04340F
         SEC
         LDA   L04340B
         SBC   L0433E5
         STA   L04340B
         LDA   L04345B,X
         AND   #$00FF
         STA   L043409
         DEC   L043407
L043323  BRL   L04323C
L043326  LDA   L0433DD
         JSR   L0433B7
         PHA
         SEC
         SBC   L0433DD
         EOR   #$FFFF
         INC
         STA   L0433E3
         PLA
         STA   L0433DD
         LDA   L0433DF
         BEQ   L043354
         JSR   L0433B7
         PHA
         SEC
         SBC   L0433DF
         EOR   #$FFFF
         INC
         STA   L0433E5
         PLA
         STA   L0433DF
L043354  BRL   L0432AE
L043357  LDA   L0433DD
         JSR   L0433BE
         PHA
         SEC
         SBC   L0433DD
         EOR   #$FFFF
         INC
         STA   L0433E3
         PLA
         STA   L0433DD
         LDA   L0433DF
         BEQ   L043354
         JSR   L0433BE
         PHA
         SEC
         SBC   L0433DF
         EOR   #$FFFF
         INC
         STA   L0433E5
         PLA
         STA   L0433DF
         BRA   L043354
L043387  LDA   L0433DD
         JSR   L0433C7
         PHA
         SEC
         SBC   L0433DD
         EOR   #$FFFF
         INC
         STA   L0433E3
         PLA
         STA   L0433DD
         LDA   L0433DF
         BEQ   L043354
         JSR   L0433C7
         PHA
         SEC
         SBC   L0433DF
         EOR   #$FFFF
         INC
         STA   L0433E5
         PLA
         STA   L0433DF
         BRA   L043354
L0433B7  BIT   #$0001
         BEQ   L0433BD
         DEC
L0433BD  RTS

L0433BE  BIT   #$0003
         BEQ   L0433C6
         DEC
         BRA   L0433BE
L0433C6  RTS

L0433C7  PHA
         JSR   L042FC4
         BCC   L0433D5
         SBC   $01,S
         EOR   #$FFFF
         INC
         STA   $01,S
L0433D5  PLA
         RTS

L0433D7  DB    $00
         DB    $00
L0433D9  DB    $00
         DB    $00
L0433DB  DB    $00
         DB    $00
L0433DD  DB    $00
         DB    $00
L0433DF  DB    $00
         DB    $00
L0433E1  DB    $00
         DB    $00
L0433E3  DB    $00
         DB    $00
L0433E5  DB    $00
         DB    $00
L0433E7  DB    $00
         DB    $00
         DB    $00
         DB    $00
L0433EB  DB    $00
         DB    $00
         DB    $00
         DB    $00
L0433EF  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0433F7  DB    $00
         DB    $00
L0433F9  DB    $00
         DB    $00
L0433FB  DB    $00
         DB    $00
         DB    $00
         DB    $00
L0433FF  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L043407  DB    $00
         DB    $00
L043409  DB    $00
         DB    $00
L04340B  DB    $00
         DB    $00
         DB    $00
         DB    $00
L04340F  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L043417  DB    $00
         DB    $00
         DB    $01
         DB    $00
         DB    $01
         DB    $00
         DB    $01
         DB    $00
         DB    $03
         DB    $00
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L043439  DB    $00
         DB    $00
         DB    $01
         DB    $00
         DB    $01
         DB    $00
         DB    $01
         DB    $00
         DB    $03
         DB    $00
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $00
         DB    $00
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L04345B  DB    $00
         DB    $20
         DB    $23
         DB    $25
         DB    $24
L043460  DB    $01
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $04
         DB    $00
         DB    $03
         DB    $00
L04346C  DB    $00
         DB    $00
         DA    L04348E
         DA    L04348F
         DA    L043490
         DA    L043491
         DA    L043494
         DA    L043496
         DA    L043497
         DA    L043498
         DA    L043499
         DA    L04349A
         DA    L04349B
         DA    L04349C
         DA    L04349D
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L04348E  DB    $00
L04348F  DB    $00
L043490  DB    $00
L043491  DB    $00
         DB    $03
         DB    $05
L043494  DB    $00
         DB    $03
L043496  DB    $07
L043497  DB    $07
L043498  DB    $08
L043499  DB    $09
L04349A  DB    $0A
L04349B  DB    $0B
L04349C  DB    $0C
L04349D  DB    $0D
L04349E  ENT
         BRL   L0434AD
         DW    $7771
         STR   'TGetConst'
L0434AD  PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   L041ABC
         STA   $BC
         LDA   L041ABE
         STA   $BE
         EOR   $42
         BNE   L0434D2
         LDA   $BC
         JSL   L0410BB
         BIT   #$8000
         BEQ   L0434ED
L0434D2  LDA   #$E020
         STA   $BA
         JSR   L04250E
         BCS   L0434EA
         CPX   #$0006
         BCC   L0434F0
         PHA
         LDY   #$0008
         LDA   [$A2],Y
         TAY
         PLA
         CLC
L0434EA  JMP   L041F34

L0434ED  SEC
         BRA   L0434EA
L0434F0  STA   L04354F
         STX   L043553
         TXA
         ASL
         TAX
         LDA   L043557,X
         STA   L043555
         BVC   L043510
         LDY   #$0004
         LDA   [$A2],Y
         SEC
         SBC   $BC
         EOR   #$FFFF
         INC
         JMP   (L04351C,X)

L043510  LDX   L043553
         LDA   $BC
         LDY   L043555
         CLC
         CLV
         BRA   L0434EA

L04351C  DA    L043510
         DA    L043528
         DA    L043528
         DA    L043528
         DA    L043541
         DA    L043548

L043528  AND   #$0001
         BEQ   L043510
L04352D  STA   L043551
         LDY   L043555
         LDX   L043553
         LDA   $BC
         SEC
         SBC   L043551
         SEP   #$40
         CLC
         BRA   L0434EA
L043541  AND   #$0003
         BEQ   L043510
         BRA   L04352D
L043548  JSR   L042FC4
         BCC   L043510
         BRA   L04352D
L04354F  DB    $00
         DB    $00
L043551  DB    $00
         DB    $00
L043553  DB    $00
         DB    $00
L043555  DB    $00
         DB    $00
L043557  DB    $01
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $02
         DB    $00
         DB    $04
         DB    $00
         DB    $03
         DB    $00
L043563  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   L041ABC
         STA   $BC
         LDA   L041ABE
         STA   $BE
         LDA   #$E020
         STA   $BA
         JSR   L04250E
         BCS   L0435B8
         LDA   #$0000
         STA   [$A2]
         JSR   L04268B
         LDA   $BE
         EOR   $42
         BNE   L0435B8
         LDY   #$0004
         LDA   [$A2],Y
         PHA
         PHA
         LDY   #$0008
         LDA   [$A2],Y
         PHA
         PEA   $8000
         JSL   L041015
         PLA
         JSL   L0416F3
         PHA
         PEA   ^L0412B9
         PEA   L0412B9
         LDX   #$0002
         JSL   L041F18
L0435B8  CLC
         JMP   L041F34

         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   L041ABC
         STA   $B6
         LDA   L041ABE
         STA   $B8
         LDY   #$0002
         LDA   [$B6],Y
         AND   #$00E0
         STA   $BA
         JSR   L041E60
         BCS   L0435F8
         LDA   #$FFFF
         STA   [$A2]
         LDX   #$0007
         LDY   #$0000
L0435EC  LDA   [$B6],Y
         INY
         INY
         STA   [$A2],Y
         DEX
         BNE   L0435EC
         JSR   L04266F
L0435F8  JMP   L041F34

L0435FB  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0008
         JSR   L041ED9
         LDA   L041ABC
         STA   $BA
         LDA   L041ABE
         STA   $C2
         LDA   L041AC0
         STA   $BC
         LDA   L041AC2
         STA   $BE
         JSR   L041D06
         LDA   $9A
         STA   $A2
         LDA   $9C
         STA   $A4
L043626  JSR   L042653
         BCS   L043632
         JSR   L043636
         BCS   L043633
         BRA   L043626
L043632  CLC
L043633  JMP   L041F34

L043636  PHP
         REP   #$30
         LDY   #$0003
         LDA   [$A2],Y
         AND   #$00FF
         BEQ   L043657
         JSR   L041EA4
         BCS   L043657
         PEI   $B4
         PEI   $B2
         _DisposeHandle
         STZ   $B4
         STZ   $B2
L043657  LDA   #$0000
         STA   [$A2]
         JSR   L04268B
         BCS   L043664
         PLP
         CLC
         RTS

L043664  PLP
         SEC
         RTS

L043667  LDA   [$A2]
         BEQ   L0436A6
         LDY   #$0008
         LDA   [$A2],Y
         BNE   L043673
         INC
L043673  STA   $C2
         DEY
         DEY
         LDA   [$A2],Y
         STA   $BE
         DEY
         DEY
         LDA   [$A2],Y
         STA   $BC
         DEY
         DEY
         LDA   [$A2],Y
         TAX
         AND   #$001F
         ASL
         PHA
         TXA
         AND   #$00E0
         LSR
         LSR
         LSR
         LSR
         TAX
         LDA   L0436AC,X
         BEQ   L0436A7
         CLC
         ADC   $01,S
         PLX
         TAX
         LDA   |$0000,X
         BEQ   L0436A8
         JSR   ($0000,X)
L0436A6  RTS

L0436A7  PLA
L0436A8  JSR   L043636
         RTS

L0436AC  DA    $0000
         DA    L0436B4
         DA    L0436D6
         DA    L0436E2

L0436B4  DA    L0436F0
         DA    L0436F0
         DA    L0436F0
         DA    L0436F0
         DA    L0436F0
         DA    L0436F0
         DA    L0436F0
         DA    L0436F0
         DA    L0436F0
         DA    L0436F0
         DA    L0436F0
         DA    L0436F0
         DA    L0436F0
         DA    L0436F0
         DA    L0436F0
         DA    L0436F0
         DA    L0436F0

L0436D6  DA    L043702
         DA    L043702
         DA    $0000
         DA    $0000
         DA    $0000
         DA    $0000

L0436E2  DA    L043714
         DA    L043738
         DA    L04375F
         DA    L04375F
         DA    L043726
         DA    L04375F
         DA    L04374A

         MX    %00
L0436F0  PEI   $BE
         PEI   $BC
         PEA   ^L043563
         PEA   L043563
         LDX   #$0004
         JSL   L041F18
         RTS

L043702  PEI   $BE
         PEI   $BC
         PEA   ^L0429D3
         PEA   L0429D3
         LDX   #$0004
         JSL   L041F18
         RTS

L043714  PEI   $BE
         PEI   $BC
         PEA   ^L042C85
         PEA   L042C85
         LDX   #$0004
         JSL   L041F18
         RTS

L043726  PEI   $BE
         PEI   $BC
         PEA   ^L042ED4
         PEA   L042ED4
         LDX   #$0004
         JSL   L041F18
         RTS

L043738  PEI   $BE
         PEI   $BC
         PEA   ^L042D9E
         PEA   L042D9E
         LDX   #$0004
         JSL   L041F18
         RTS

L04374A  LDA   $BE
         EOR   $42
         BNE   L04375B
         PEI   $BC
         PEI   $C2
         PEA   $0400
         JSL   L041015
L04375B  JSR   L043636
         RTS

L04375F  LDA   $BE
         EOR   $42
         BNE   L04375B
         PEI   $BC
         PEI   $C2
         PEA   $1000
         JSL   L041015
         BRA   L04375B
L043772  ENT
         CLC
	 HEX   B0
L043774  ENT
         SEC
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDA   #$FF62
         BCS   L043781
         INC
L043781  STA   $BA
         LDX   #$000C
         JSR   L041ED9
         LDA   L041AC2
         STA   $C2
         LDA   L041AC4
         STA   $BC
         LDA   L041AC6
         STA   $BE
         JSR   L04250E
         BCC   L0437A7
         JSR   L041E60
         BCS   L0437CE
         JSR   L04266F
         BCS   L0437CE
L0437A7  JSR   L0426A7
         LDY   #$0002
L0437AD  LDA   $BA
         AND   #$00FF
         STA   [$A2],Y
         LDY   #$000A
         LDA   L041AC0
         STA   [$A2],Y
         INY
         INY
         LDA   L041ABC
         STA   [$A2],Y
         INY
         INY
         LDA   L041ABE
         STA   [$A2],Y
         JSR   L0437D1
         CLC
L0437CE  JMP   L041F34

L0437D1  LDA   $BE
         EOR   $42
         BNE   L0437E2
         PEI   $BC
         PEI   $C2
         PEA   $1000
         JSL   L041058
L0437E2  CLC
         RTS

L0437E4  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0004
         JSR   L041ED9
         LDA   L041ABC
         STA   $AA
         LDA   L041ABE
         STA   $AC
         ORA   $AA
         BEQ   L04380F
         LDY   #$0002
         LDA   [$AA]
         TAX
         LDA   [$AA],Y
         BNE   L04380F
         TXA
         BNE   L04380F
         STZ   $AA
         STZ   $AC
L04380F  CLC
         JMP   L041F34

L043813  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0008
         JSR   L041ED9
         LDA   #$0065
         STA   $BA
         JSR   L041E60
         BCS   L043867
         JSR   L04266F
         BCS   L043867
         LDA   #$FFFF
         STA   [$A2]
         LDY   #$0002
         LDA   #$0065
         STA   [$A2],Y
         INY
         INY
         LDA   L041AC0
         STA   $BC
         STA   [$A2],Y
         INY
         INY
         LDA   L041AC2
         STA   $BE
         STA   [$A2],Y
         INY
         INY
         LDA   #$0002
         STA   $C2
         STA   [$A2],Y
         INY
         INY
         LDA   L041ABC
         STA   [$A2],Y
         INY
         INY
         LDA   L041ABE
         STA   [$A2],Y
         JSR   L0437D1
L043867  JMP   L041F34

L04386A  ENT
         BRL   L04387B
         DW    $7771
         STR   'TAddComment'
L04387B  PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0008
         JSR   L041ED9
         LDA   L041ABC
         STA   $A6
         LDA   L041ABE
         STA   $A8
         LDA   L041AC0
         STA   $BC
         LDA   L041AC2
         STA   $BE
         LDA   #$0001
         STA   $C2
         LDA   #$FF66
         STA   $BA
         LDA   $BE
         EOR   $42
         BNE   L0438B6
         LDA   $BC
         JSL   L0410BB
         BIT   #$0400
         BEQ   L0438BE
L0438B6  JSR   L04250E
         BCS   L0438BE
         JSR   L043636
L0438BE  JSR   L041E60
         BCS   L04391B
         JSR   L04266F
         BCS   L04391B
         LDA   [$A6]
         AND   #$00FF
         TAX
         INX
         LDY   #$0000
         LDA   #$0008
         JSR   L041C50
         BCS   L04391B
         TYA
         LDY   #$000E
         STA   [$A2],Y
         DEY
         DEY
         TXA
         STA   [$A2],Y
         JSR   L041EA4
         BCS   L04391E
         JSR   L0426A7
         LDA   [$A6]
         AND   #$00FF
         PHA
         XBA
         ORA   #$0066
         LDY   #$0002
         STA   [$A2],Y
         PLY
         SEP   #$20
L0438FF  LDA   [$A6],Y
         STA   [$B6],Y
         DEY
         BPL   L0438FF
         REP   #$20
         LDA   $BE
         EOR   $42
         BNE   L04391A
         PEI   $BC
         PEA   $0001
         PEA   $0400
         JSL   L041058
L04391A  CLC
L04391B  JMP   L041F34

L04391E  PEI   $B4
         PEI   $B2
         _DisposeHandle
         SEC
         BRA   L04391B
L04392C  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0008
         JSR   L041ED9
         LDA   L041AC0
         STA   $BC
         LDA   #$0001
         STA   $C2
         LDA   #$FF66
         STA   $BA
         LDA   L041AC2
         STA   $BE
         EOR   $42
         BNE   L04395C
         LDA   $BC
         JSL   L0410BB
         SEC
         BIT   #$0400
         BEQ   L043977
L04395C  JSR   L04250E
         BCS   L043977
         JSR   L041EA4
         BCS   L043977
         PEI   $B8
         PEI   $B6
         LDA   L041ABE
         PHA
         LDA   L041ABC
         PHA
         JSL   L0307DD
         CLC
L043977  JMP   L041F34

L04397A  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$000A
         JSR   L041ED9
         LDA   L041ABC
         STA   $A6
         LDA   L041ABE
         STA   $A8
         LDA   L041AC0
         STA   $C2
         LDA   L041AC2
         STA   $BC
         LDY   L041AC4
         STY   $BE
         STZ   $C4
         JSL   L0410BB
         STA   L0439DD
         BIT   #$1000
         BEQ   L0439C5
         JSR   L044019
         BCS   L0439B5
         BRL   L043A2F
L0439B5  JSR   L044017
         BCS   L0439BD
         BRL   L043A51
L0439BD  JSR   L04404D
         BCC   L0439DF
         LDA   L0439DD
L0439C5  BIT   #$0800
         BEQ   L0439D7
         JSR   L043B44
         BCS   L0439D7
L0439CF  BVS   L0439D4
         BRL   L043A4A
L0439D4  BRL   L043A2F
L0439D7  JSR   L044071
         BRL   L043A4A
L0439DD  DW    $0000
L0439DF  LDX   #$0002
         STX   $C2
         STA   L043AFB
         STY   L043AFD
         BIT   #$8000
         BNE   L043A06
         TYA
         CLC
         ADC   $BC
         LDY   $BE
         JSR   L043AFF
         LDA   #$00AD
         JSR   L043AEC
         LDA   #$00AA
         JSR   L043AEC
         BRA   L043A4D
L043A06  LDA   #$00AA
         JSR   L043AEC
         LDA   #$00AB
         BIT   L043AFD
         BPL   L043A21
         LDA   L043AFD
         EOR   #$FFFF
         INC
         STA   L043AFD
         LDA   #$00AD
L043A21  JSR   L043AEC
         LDA   L043AFD
         LDY   #$0000
         JSR   L04433D
         BRA   L043A4D
L043A2F  PHY
         PHA
         LDX   #$0002
         CPY   $42
         BEQ   L043A39
         INX
L043A39  CPX   $C2
         BCC   L043A3F
         STX   $C2
L043A3F  JSR   L043A77
         PLA
         PLY
         JSR   L043AFF
L043A47  JSR   L043ACC
L043A4A  JSR   L043A9A
L043A4D  CLC
         JMP   L041F34

L043A51  PHY
         PHA
         PHY
         PHA
         JSR   L043A77
         PEI   $A8
         PEI   $A6
         PEA   ^L042885
         PEA   L042885
         LDX   #$0008
         JSL   L041F18
         PLA
         PLY
         BCC   L043A47
         LDX   #$0003
         STX   $C2
         JSR   L04433D
         BRA   L043A47
L043A77  SEP   #$30
         LDA   $C4
         BEQ   L043A97
         LDY   #$DE
         CMP   #$F0
         BEQ   L043A89
         LDY   #$BE
         CMP   #$F8
         BNE   L043A97
L043A89  SEP   #$30
         PHY
         LDA   [$A6]
         INC
         STA   [$A6]
         TAY
         PLA
         STA   [$A6],Y
         STZ   $C4
L043A97  REP   #$30
         RTS

L043A9A  SEP   #$30
         LDY   #$AA
         LDA   $C4
         BEQ   L043A97
         BPL   L043AA9
         LDY   #$AF
         AND   #$FF
         INC
L043AA9  PHA
         JSR   L043A89
         SEP   #$10
         PLY
         PHY
         CPY   #$04
         BCC   L043ABC
         LDY   #$A4
         JSR   L043A89
         SEP   #$10
L043ABC  PLY
         LDA   #$0000
         SEC
         ROL
L043AC2  ASL
         DEY
         BNE   L043AC2
         JSR   L042953
L043AC9  REP   #$30
         RTS

L043ACC  SEP   #$30
         LDY   #$AB
         LDA   $C5
         BEQ   L043AC9
         BPL   L043ADD
         LDY   #$AD
         EOR   #$FF
         INC
         STA   $C5
L043ADD  TYA
         JSR   L043AEC
         REP   #$20
         LDA   $C5
         AND   #$00FF
         JSR   L042953
         RTS

L043AEC  PHP
         SEP   #$30
         PHA
         LDA   [$A6]
         INC
         STA   [$A6]
         TAY
         PLA
         STA   [$A6],Y
         PLP
         RTS

L043AFB  DB    $00
         DB    $00
L043AFD  DB    $00
         DB    $00
L043AFF  PHP
         REP   #$30
         PHY
         PHA
         PHY
         PHA
         CPY   $42
         BNE   L043B19
         JSL   L0410BB
         BIT   #$6000
         BNE   L043B19
         PLA
         PLY
         PLA
         PLY
         BRA   L043B30
L043B19  PEI   $A8
         PEI   $A6
         PEA   ^L0428B4
         PEA   L0428B4
         LDX   #$0008
         JSL   L041F18
         PLA
         PLY
         BCS   L043B30
         PLP
         RTS

L043B30  PHY
         PHA
         PEA   ^L042A5C
         PEA   L042A5C
         LDX   #$0004
         JSL   L041F18
         JSR   L04433D
         PLP
         RTS

L043B44  PHP
         REP   #$30
         LDA   $AB
         BNE   L043B50
L043B4B  PLP
         SEP   #$40
         SEC
         RTS

L043B50  LDY   #$0002
         LDA   [$AA]
         TAX
         LDA   [$AA],Y
         TAY
         BNE   L043B5E
         TXA
         BEQ   L043B4B
L043B5E  STX   $AE
         STY   $B0
         STZ   $C0
L043B64  LDA   [$AE]
         INC   $AE
         BNE   L043B6C
         INC   $B0
L043B6C  AND   #$00FF
         BEQ   L043B4B
         CMP   #$00E0
         BCS   L043B8A
         PHA
         CLC
         ADC   $AE
         STA   $AE
         LDA   #$0000
         ADC   $B0
         STA   $B0
         PLA
         ADC   $C0
         STA   $C0
         BRA   L043B64
L043B8A  ASL
         TAX
         JMP   (L043B8F-$1C0,X)

L043B8F  DA    L043BCF
         DA    L043BCF
         DA    L043BE8
         DA    L043C38
         DA    L043BCF
         DA    L043BCF
         DA    L043BCF
         DA    L043DA2
         DA    L043BCF
         DA    L043BCF
         DA    L043BCF
         DA    L043DBB
         DA    L043DBB
         DA    L043DBB
         DA    L043DAA
         DA    L043BCF
         DA    L043DA2
         DA    L043BCF
         DA    L043BCF
         DA    L043DBB
         DA    L043BCF
         DA    L043C10
         DA    L043C66
         DA    L043C97
         DA    L043BCF
         DA    L043BCF
         DA    L043BCF
         DA    L043BCF
         DA    L043BCF
         DA    L043BCF
         DA    L043BCF
         DA    L043BCF
L043BCF  PLP
         SEP   #$40
         SEC
         RTS

L043BD4  PLP
         SEP   #$40
         CLC
         RTS

L043BD9  CLC
         ADC   $AE
         STA   $AE
         LDA   #$0000
         ADC   $B0
         STA   $B0
         BRL   L043B64
L043BE8  LDY   #$0002
         LDA   [$AE],Y
         CMP   $BC
         BEQ   L043BF6
         LDA   #$000A
         BRA   L043BD9
L043BF6  SEP   #$20
         DEY
         LDA   [$AE],Y
         STA   $C4
         REP   #$20
         DEY
         LDA   [$AE],Y
         AND   #$00FF
         STA   $C2
         LDY   #$0006
         LDA   [$AE],Y
         LDY   $BE
         BRA   L043BD4
L043C10  LDY   #$0002
         LDA   [$AE],Y
         CMP   $BC
         BEQ   L043C1E
         LDA   #$0006
         BRA   L043BD9
L043C1E  SEP   #$20
         DEY
         LDA   [$AE],Y
         STA   $C4
         REP   #$20
         DEY
         LDA   [$AE],Y
         AND   #$00FF
         STA   $C2
         LDY   #$0004
         LDA   [$AE],Y
         LDY   $BE
         BRA   L043BD4
L043C38  LDY   #$0002
         LDA   [$AE],Y
         CMP   $BC
         BEQ   L043C46
         LDA   #$000E
         BRA   L043BD9
L043C46  SEP   #$20
         DEY
         LDA   [$AE],Y
         STA   $C4
         REP   #$20
         DEY
         LDA   [$AE],Y
         AND   #$00FF
         STA   $C2
         LDY   #$000A
         LDA   [$AE],Y
         PHA
         DEY
         DEY
         LDA   [$AE],Y
         TAY
         PLA
         BRL   L043BD4
L043C66  LDY   #$0002
         LDA   [$AE],Y
         CMP   $BC
         BEQ   L043C75
         LDA   #$0007
         BRL   L043BD9
L043C75  SEP   #$20
         DEY
         LDA   [$AE],Y
         STA   $C4
         REP   #$20
         DEY
         LDA   [$AE],Y
         AND   #$00FF
         STA   $C2
         LDY   #$0005
         LDA   [$AE],Y
         PHA
         DEY
         LDA   [$AE],Y
         AND   #$00FF
         TAY
         PLA
         BRL   L043BD4
L043C97  LDA   [$AE]
         DEC
         STA   L043D8D
         LDA   #$FF00
         STA   L043D8F
         LDY   #$0002
         LDA   [$AE],Y
         BEQ   L043CAD
         BRL   L043B4B
L043CAD  LDY   #$0004
         LDA   [$AE],Y
         AND   #$00FF
         STA   L043D91
         LDA   #$0005
         CLC
         ADC   $AE
         STA   $AE
         LDA   #$0000
         ADC   $B0
         STA   $B0
L043CC7  DEC   L043D8D
         BPL   L043CCF
         BRL   L043B64
L043CCF  LDA   [$AE]
         INC   $AE
         BNE   L043CD7
         INC   $B0
L043CD7  AND   #$00FF
         CMP   #$0080
         BCC   L043CEC
         AND   #$007F
         XBA
         CLC
         ADC   L043D8F
         STA   L043D8F
         BRA   L043CC7
L043CEC  SEP   #$20
         INC   L043D90
         REP   #$20
         TAX
L043CF4  DEC   L043D8D
         LDA   [$AE]
         INC   $AE
         BNE   L043CFF
         INC   $B0
L043CFF  AND   #$00FF
         CLC
         ADC   L043D8F
         CMP   $BC
         BEQ   L043D0F
         DEX
         BPL   L043CF4
         BRA   L043CC7
L043D0F  LDX   #$0002
         STX   $C2
         TAY
         LDA   L043D91
         CMP   #$001A
         BCS   L043D75
         CMP   #$000E
         BCS   L043D5F
         CMP   #$0002
         BCS   L043D48
         CMP   #$0001
         BEQ   L043D39
         SEP   #$20
         STZ   $C4
         REP   #$20
         LDA   [$3A],Y
         LDY   $BE
         BRL   L043BD4
L043D39  SEP   #$20
         STZ   $C4
         REP   #$20
         INC   $C2
         LDA   [$3A],Y
         LDY   $BE
         BRL   L043BD4
L043D48  SEP   #$20
         STZ   $C4
         REP   #$20
         INC   $C2
         LDA   [$3A],Y
         PHA
         INY
         INY
         LDA   [$3A],Y
         AND   #$00FF
         TAY
         PLA
         BRL   L043BD4
L043D5F  SBC   #$000D
         PHA
         CMP   $42
         BEQ   L043D69
         INC   $C2
L043D69  SEP   #$20
         STZ   $C4
         REP   #$20
         LDA   [$3A],Y
         PLY
         BRL   L043BD4
L043D75  SBC   #$0019
         PHA
         CMP   $42
         BEQ   L043D7F
         INC   $C2
L043D7F  SEP   #$20
         LDA   #$F0
         STA   $C4
         REP   #$20
         LDA   [$3A],Y
         PLY
         BRL   L043BD4
L043D8D  DB    $00
         DB    $00
L043D8F  DB    $00
L043D90  DB    $00
L043D91  DB    $00
         DB    $00
L043D93  LDA   [$AE]
         AND   #$00FF
         INC
         ADC   $AE
         STA   $AE
         BCC   L043DA1
         INC   $B0
L043DA1  RTS

L043DA2  JSR   L043D93
         LDA   #$0004
         BRA   L043DD6
L043DAA  LDY   #$0005
         LDA   [$AE],Y
         CMP   $BC
         BNE   L043DCB
         JSR   L045923
         BVS   L043DC8
L043DB8  BRL   L043BD4
L043DBB  LDA   [$AE]
         CMP   $BC
         BNE   L043DD3
         JSR   L04591F
         BVS   L043DD0
         BRA   L043DB8
L043DC8  BRL   L043E22
L043DCB  LDA   #$0007
         BRA   L043DD6
L043DD0  BRL   L043E3E
L043DD3  LDA   #$0003
L043DD6  CLC
         ADC   $AE
         STA   $AE
         BCC   L043DDF
         INC   $B0
L043DDF  LDA   [$AE]
         INC   $AE
         BNE   L043DE7
         INC   $B0
L043DE7  AND   #$00FF
         BEQ   L043DFE
         CMP   #$0080
         BCC   L043DDF
         AND   #$007F
         BEQ   L043DDF
         CMP   #$0008
         BCC   L043E01
         PLP
         SEC
         RTS

L043DFE  BRL   L043B64
L043E01  ASL
         TAX
         JMP   (L043E06,X)

L043E06  DA    $0000
         DA    L043E16
         DA    L043E1B
         DA    L043E1B
         DA    L043E1B
         DA    L043E1B
         DA    L043E1B
         DA    L043E16

L043E16  LDA   #$0004
         BRA   L043DD6
L043E1B  JSR   L043D93
         BRA   L043DDF
L043E20  DW    $0000
L043E22  BRL   L043E31
         DW    $7771
         STR   ':RExpr_EA'
L043E31  LDA   [$AE]
         AND   #$00FF
         STA   L043E20
         LDA   #$0007
         BRA   L043E5A
L043E3E  BRL   L043E4C
         DW    $7771
         STR   ':Expr_EA'
L043E4C  LDY   #$0002
         LDA   [$AE],Y
         AND   #$00FF
         STA   L043E20
         LDA   #$0003
L043E5A  CLC
         ADC   $AE
         STA   $AE
         BCC   L043E63
         INC   $B0
L043E63  LDA   [$AE]
         AND   #$00FF
         BEQ   L043E77
         CMP   #$0080
         BCS   L043E7B
         INC   $AE
         BNE   L043E75
         INC   $B0
L043E75  BRA   L043E63
L043E77  PLP
         CLV
         CLC
         RTS

L043E7B  JSR   L043F36
         BCC   L043E83
         PLP
         SEC
         RTS

L043E83  LDA   [$AE]
         INC   $AE
         BNE   L043E8B
         INC   $B0
L043E8B  AND   #$007F
         ASL
         TAX
         JMP   (L043E93,X)

L043E93  DA    L043EA3
         DA    L043EB1
         DA    L043F21
         DA    L043F21
         DA    L043F21
         DA    L043F21
         DA    L043F21
         DA    L043F0B

L043EA3  LDA   #$0003
         STA   $C2
         LDY   $42
         LDA   $BC
         JSR   L043AFF
         BRA   L043E63
L043EB1  LDA   L043FD3
         CMP   #$0007
         BEQ   L043F01
         LDA   [$AE]
         STA   L043F07
         LDY   #$0002
         LDA   [$AE],Y
         STA   L043F09
         BPL   L043EE3
         EOR   #$FFFF
         STA   L043F09
         LDA   #$FFFF
         EOR   L043F07
         INC
         STA   L043F07
         BNE   L043EDD
         INC   L043F09
L043EDD  LDA   #$00AD
         JSR   L043FEE
L043EE3  LDA   #$0004
         STA   $C2
         SEP   #$30
         LDX   #$03
L043EEC  LDA   L043F07,X
         BNE   L043EF6
         DEC   $C2
         DEX
         BNE   L043EEC
L043EF6  REP   #$30
         LDY   L043F09
         LDA   L043F07
         JSR   L04433D
L043F01  LDA   #$0004
         BRL   L043E5A
L043F07  BRK   $00
L043F09  BRK   $00
L043F0B  LDA   #$0002
         STA   $C2
         LDY   #$0002
         LDA   [$AE],Y
         TAY
         LDA   [$AE]
         JSR   L043AFF
         LDA   #$0004
         BRL   L043E5A
L043F21  PEI   $B0
         PEI   $AE
         PEI   $A8
         PEI   $A6
         JSL   L0307DD
         LDA   [$AE]
         AND   #$00FF
         INC
         BRL   L043E5A
L043F36  AND   #$007F
         CMP   #$0008
         BCC   L043F3F
         RTS

L043F3F  ASL
         TAX
         JMP   (L043F44,X)

L043F44  DA    L043F54
         DA    L043F59
         DA    L043F5E
         DA    L043F5E
         DA    L043F5E
         DA    L043F5E
         DA    L043F5E
         DA    L043F59

L043F54  LDY   #$0001
         BRA   L043F69
L043F59  LDY   #$0005
         BRA   L043F69
L043F5E  LDY   #$0001
         LDA   [$AE],Y
         AND   #$00FF
         INC
         INC
         TAY
L043F69  LDA   [$AE],Y
         AND   #$00FF
         BEQ   L043F89
         CMP   #$0080
         BCC   L043F77
         CLC
         RTS

L043F77  STA   L043FD3
         CMP   #$0007
         BEQ   L043F8B
         TAX
         LDA   L043FD8,X
         AND   #$00FF
         JSR   L043FEE
L043F89  CLC
         RTS

L043F8B  LDY   #$0001
         LDA   [$AE],Y
         CMP   #$FFF0
         BEQ   L043FCB
         CMP   #$FFF8
         BEQ   L043FC7
         STZ   L043FD7
         STA   L043FD5
         LDA   [$AE],Y
         BPL   L043FA8
         EOR   #$FFFF
         INC
L043FA8  SEC
L043FA9  DEC
         BMI   L043FB1
         ROL   L043FD7
         BRA   L043FA9
L043FB1  LDA   #$00AA
         BIT   L043FD5
         BPL   L043FBC
         LDA   #$00AF
L043FBC  JSR   L043FEE
         LDA   L043FD7
         JSR   L042953
         CLC
         RTS

L043FC7  LDA   #$00BE
         HEX   CF
L043FCB  LDA   #$00DE
         JSR   L043FFD
         CLC
         RTS

L043FD3  DB    $00
         DB    $00
L043FD5  DB    $00
         DB    $00
L043FD7  DB    $00
L043FD8  DB    $00
         ASC   "+-*/?-|&.!????<>=&.!?"
L043FEE  PHP
         SEP   #$30
         PHA
         LDA   [$A6]
         INC
         STA   [$A6]
         TAY
         PLA
         STA   [$A6],Y
         PLP
         RTS

L043FFD  PHP
         SEP   #$30
         PHA
         LDA   [$A6]
         INC
         STA   [$A6]
         TAY
         DEY
L044008  LDA   [$A6],Y
         INY
         STA   [$A6],Y
         DEY
         DEY
         BNE   L044008
         INY
         PLA
         STA   [$A6],Y
         PLP
         RTS

L044017  CLC
         HEX   B0
L044019  SEC
         PHP
         REP   #$30
         LDA   #$FF62
         BCS   L044023
         INC
L044023  STA   $BA
         JSR   L04250E
         BCS   L04404A
         BVS   L04404A
         LDY   #$0008
         LDA   [$A2],Y
         AND   #$00FF
         STA   $C2
         INY
         INY
         LDA   [$A2],Y
         STA   $C4
         INY
         INY
         LDA   [$A2],Y
         PHA
         INY
         INY
         LDA   [$A2],Y
         TAY
         PLA
         PLP
         CLC
         RTS

L04404A  PLP
         SEC
         RTS

L04404D  PHP
         REP   #$30
L044050  LDA   #$FF65
         STA   $BA
         JSR   L04250E
         BCS   L04406E
         SEP   #$20
         STZ   $C4
         REP   #$20
         LDY   #$000C
         LDA   [$A2],Y
         PHA
         DEY
         DEY
         LDA   [$A2],Y
         PLY
         PLP
         CLC
         RTS

L04406E  PLP
         SEC
         RTS

L044071  PHP
         REP   #$30
         LDA   $BC
         JSL   L041993
         STA   $C2
         LDA   $BC
         JSL   L0410BB
         ASL
         BCS   L0440A1
         LDY   $BC
         DEY
         LDA   [$3A],Y
         AND   #$001F
         STA   L0440AF
         ASL
         TAX
         LDA   [$3A],Y
         LSR
         LSR
         LSR
         LSR
         LSR
         AND   #$0007
         JSR   (L0440B1,X)
         PLP
         RTS

L0440A1  JSR   L0442E7
         STA   L0442E3
         STY   L0442E5
         JSR   L0442C8
         PLP
         RTS

L0440AF  DB    $00
         DB    $00
L0440B1  DA    L044156
         DA    L04413D
         DA    L04416E
         DA    L04413D
         DA    L044112
         DA    L04413D
         DA    L04413D
         DA    L04413D
         DA    L044111
         DA    L04413D
         DA    L044111
         DA    L044111
         DA    L04418A
         DA    L0441C5
         DA    L0441C5
         DA    L044208
         DA    L04421A
         DA    L04413D
         DA    L04413D
         DA    L04413D
         DA    L044112
         DA    L04413D
         DA    L04413D
         DA    L04413D
         DA    L044111
         DA    L0441C5
         DA    L044111
         DA    L044111
         DA    L0441B1
         DA    L0441C5
         DA    L0441C5
         DA    L044208
L0440F1  DB    $00
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
         DB    $00
         DB    $00
         DB    $01
         DB    $01
         DB    $00
         DB    $00
         DB    $01
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $01
         DB    $01
L044111  RTS

L044112  CMP   #$0002
         BNE   L04413D
         LDA   #$0003
         STA   $C2
         STZ   L0442E3
         INY
         LDA   [$3A],Y
         PHA
         XBA
         AND   #$00FF
         STA   L0442E5
         JSR   L0442C8
         LDA   #$00AC
         JSR   L0442D2
         PLA
         AND   #$00FF
         STA   L0442E5
         BRL   L0442C8
L04413D  INY
         LDA   [$3A],Y
         STA   L0442E3
         STZ   L0442E5
         LDA   $C2
         CMP   #$0002
         BNE   L044150
         BRL   L0442C8
L044150  STZ   L0442E4
         BRL   L0442C8
L044156  CMP   #$0005
         BCS   L04413D
         CMP   #$0001
         BEQ   L044194
         CMP   #$0000
         BEQ   L04413D
         CMP   #$0004
         BNE   L04416D
         BRL   L04421A
L04416D  RTS

L04416E  CMP   #$0000
         BEQ   L04413D
         CMP   #$0001
         BNE   L04417B
         BRL   L044208
L04417B  CMP   #$0002
         BEQ   L04413D
         CMP   #$0005
         BCS   L044188
         BRL   L04424E
L044188  BCS   L04413D
L04418A  CMP   #$0002
         BEQ   L044194
         CMP   #$0003
         BNE   L0441C5
L044194  INY
         LDA   [$3A],Y
         STA   L0442E3
         PEI   $42
         DEY
         PHY
         PEA   ^L042A5C
         PEA   L042A5C
         LDX   #$0004
         JSL   L041F18
         STY   L0442E5
         BRL   L044257
L0441B1  CMP   #$0002
         BEQ   L044208
         CMP   #$0003
         BEQ   L044194
         CMP   #$0006
         BEQ   L044194
         CMP   #$0007
         BEQ   L044194
L0441C5  INY
         LDA   [$3A],Y
         STA   L0442E3
         AND   #$FF00
         BNE   L0441D6
         LDA   #$00FC
         JSR   L0442D2
L0441D6  PEI   $42
         DEY
         PHY
         PEA   ^L042F5B
         PEA   L042F5B
         LDX   #$0004
         JSL   L041F18
         STA   L0442E5
         TAY
         LDA   L0442E3
         CMP   #$C100
         BCS   L044257
         CMP   #$C000
         BCC   L044257
         TYA
         AND   #$00FE
         BEQ   L044203
         EOR   #$00E0
         BNE   L044257
L044203  STZ   L0442E5
         BRA   L044257
L044208  INY
         LDA   [$3A],Y
         STA   L0442E3
         INY
         INY
         LDA   [$3A],Y
         AND   #$00FF
         STA   L0442E5
         BRA   L044257
L04421A  LDA   #$0002
         STA   $C2
         INY
         LDA   #$0000
         SEP   #$20
         LDA   [$3A],Y
         REP   #$20
         BPL   L04422E
         ORA   #$FF00
L04422E  SEC
         ADC   $BC
L044231  LDY   $42
         PHY
         PHA
         PHY
         PHA
         PEA   ^L042A5C
         PEA   L042A5C
         LDX   #$0004
         JSL   L041F18
         STA   L0442E3
         STY   L0442E5
         PLA
         PLY
         BRA   L0442A1
L04424E  INY
         LDA   [$3A],Y
         INC
         SEC
         ADC   $BC
         BRA   L044231
L044257  LDAL  L0283C6
         BMI   L044263
         LDAL  L0283CA
         BMI   L044285
L044263  LDA   L0442E5
         PHA
         LDA   L0442E3
         PHA
         PEA   ^L042ABB
         PEA   L042ABB
         LDX   #$0004
         JSL   L041F18
         BCC   L0442A1
         LDX   L0440AF
         LDA   L0440F1,X
         AND   #$00FF
         BNE   L0442C8
L044285  LDA   L0442E5
         PHA
         LDA   L0442E3
         PHA
         PEI   $A8
         PEI   $A6
         PEA   ^L042885
         PEA   L042885
         LDX   #$0008
         JSL   L041F18
         BCS   L0442C8
         RTS

L0442A1  CPY   $42
         BNE   L0442B3
         PHY
         PHA
         JSL   L0410BB
         PLX
         PLY
         BIT   #$6000
         BEQ   L0442C8
         TXA
L0442B3  PHY
         PHA
         PEI   $A8
         PEI   $A6
         PEA   ^L0428B4
         PEA   L0428B4
         LDX   #$0008
         JSL   L041F18
         BCC   L0442D1
L0442C8  LDY   L0442E5
         LDA   L0442E3
         JSR   L04433D
L0442D1  RTS

L0442D2  PHY
         PHP
         SEP   #$30
         PHA
         LDA   [$A6]
         INC
         STA   [$A6]
         TAY
         PLA
         STA   [$A6],Y
         PLP
         PLY
         RTS

L0442E3  DB    $00
L0442E4  DB    $00
L0442E5  DB    $00
         DB    $00
L0442E7  PHP
         REP   #$30
         LDY   $BC
         LDA   [$3A],Y
         PHA
         INY
         INY
         LDA   [$3A],Y
         TAY
         LDA   $C2
         DEC
         ASL
         TAX
         PLA
         CPX   #$0006
         BCS   L044312
         JMP   (L044302,X)

L044302  DA    L044308
         DA    L04430B
         DA    L04430E

L044308  AND   #$00FF
L04430B  LDY   #$0000
L04430E  SEP   #$10
         REP   #$10
L044312  PLP
         CLC
         RTS

L044315  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$000A
         JSR   L041ED9
         LDA   L041ABC
         STA   $A6
         LDA   L041ABE
         STA   $A8
         LDA   L041AC0
         STA   $C2
         LDA   L041AC2
         LDY   L041AC4
         JSR   L04433D
         CLC
         JMP   L041F34

L04433D  PHP
         REP   #$30
         LDX   $C2
         BEQ   L04439C
         PHX
         PHY
         PHA
         SEP   #$30
         LDA   [$A6]
         INC
         TAY
         LDA   #$A4
         STA   [$A6],Y
         TYA
         STA   [$A6]
         REP   #$30
         PLA
         PLY
         PLX
         CPX   #$0005
         BCC   L044361
         LDX   #$0004
L044361  PHA
         TXA
         DEC
         ASL
         TAX
         PLA
         JMP   (L04436A,X)

L04436A  DA    L044395
         DA    L04438B
         DA    L04437F
         DA    L044372

L044372  PHA
         PHY
         TYA
         XBA
         JSL   L030837
         JSR   L04439F
         PLY
         PLA
L04437F  PHA
         PHY
         TYA
         JSL   L030837
         JSR   L04439F
         PLY
         PLA
L04438B  PHA
         XBA
         JSL   L030837
         JSR   L04439F
         PLA
L044395  JSL   L030837
         JSR   L04439F
L04439C  PLP
         CLC
         RTS

L04439F  PHA
         LDA   [$A6]
         AND   #$00FF
         INC
         TAY
         PLA
         STA   [$A6],Y
         TYA
         INC
         SEP   #$20
         STA   [$A6]
         REP   #$20
         RTS

L0443B3  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDA   $42
         STA   $BE
         STZ   $BC
         LDA   #L0443E2
         STA   $A6
         LDA   #^L0443E2
         STA   $A8
         STZ   L044980
         JSR   L04442B
         JSR   L044483
         LDA   #$1000
         STA   L044980
         JSR   L044638
         JSR   L0444DA
         PLP
         CLC
         PLB
         RTL

L0443E2  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L04442B  PHP
         REP   #$30
         LDA   #$FF62
         STA   $BA
         JSR   L0424AF
         BRA   L04444C
L044438  PLA
         STA   $A2
         PLA
         STA   $A4
         PLA
         STA   $9A
         PLA
         STA   $9C
         LDA   #$FF62
         STA   $BA
         JSR   L0424F2
L04444C  BCC   L044450
         PLP
         RTS

L044450  PEI   $9C
         PEI   $9A
         PEI   $A4
         PEI   $A2
         LDY   #$0004
         LDA   [$A2],Y
         STA   $BC
         INY
         INY
         LDY   #$0006
         LDA   [$A2],Y
         EOR   $42
         BNE   L044438
         LDY   #$000E
         LDA   [$A2],Y
         PHA
         DEY
         DEY
         LDA   [$A2],Y
         PLY
         CPY   $42
         BNE   L04447E
         JSR   L044982
         BRA   L044438
L04447E  JSR   L044987
         BRA   L044438
L044483  PHP
         REP   #$30
         LDA   #$FF65
         STA   $BA
         JSR   L0424AF
         BRA   L0444A2
L044490  PLA
         STA   $A2
         PLA
         STA   $A4
         PLA
         STA   $9A
         PLA
         STA   $9C
         PLA
         STA   $BA
         JSR   L0424F2
L0444A2  BCS   L0444D8
         PEI   $BA
         PEI   $9C
         PEI   $9A
         PEI   $A4
         PEI   $A2
         LDY   #$0006
         LDA   [$A2],Y
         CMP   $42
         BNE   L044490
         DEY
         DEY
         LDA   [$A2],Y
         STA   $BC
         CLC
         LDY   #$000C
         ADC   [$A2],Y
         PHA
L0444C4  JSL   L0410BB
         BIT   #$6000
         BNE   L0444D5
         PLA
         LDY   $42
         JSR   L044982
         BRA   L044490
L0444D5  PLA
         BRA   L044490
L0444D8  PLP
         RTS

L0444DA  PHP
         REP   #$30
         JSL   L040F4D
         LDA   #$0000
L0444E4  STA   L044577
         PHA
         JSL   L041719
         PLA
         JSL   L040586
         STA   L044579
         CPY   #$0000
         BNE   L044520
         LDA   L044577
         INC
         JSL   L0410BB
         AND   #$1800
         BNE   L044520
         LDY   L044577
         LDA   [$3A],Y
         AND   #$001F
         ASL
         TAX
         LDA   [$3A],Y
         LSR
         LSR
         LSR
         LSR
         LSR
         AND   #$0007
         INY
         STY   $BC
         JSR   (L044537,X)
L044520  LDA   L044577
         CLC
         ADC   L044579
         BCS   L044531
         BIT   $5C
         BMI   L0444E4
         CMP   $3E
         BCC   L0444E4
L044531  JSL   L040F73
         PLP
         RTS

L044537  DA    L044580
         DA    L04457F
         DA    L04458B
         DA    L04457F
         DA    L04457F
         DA    L04457F
         DA    L04457F
         DA    L04457F
         DA    L04457F
         DA    L04457F
         DA    L04457F
         DA    L04457F
         DA    L04459B
         DA    L0445CB
         DA    L0445CB
         DA    L0445DD
         DA    L0445EE
         DA    L04457F
         DA    L04457F
         DA    L04457F
         DA    L04457F
         DA    L04457F
         DA    L04457F
         DA    L04457F
         DA    L04457F
         DA    L0445CB
         DA    L04457F
         DA    L04457F
         DA    L0445B7
         DA    L0445CB
         DA    L0445CB
         DA    L0445DD
L044577  DB    $00
         DB    $00
L044579  DB    $00
         DB    $00
L04457B  DB    $00
         DB    $00
L04457D  DB    $00
         DB    $00
L04457F  RTS

L044580  CMP   #$0001
         BEQ   L0445A5
         CMP   #$0004
         BEQ   L0445EE
         RTS

L04458B  CMP   #$0001
         BEQ   L0445DD
         CMP   #$0003
         BEQ   L044606
         CMP   #$0004
         BEQ   L044606
         RTS

L04459B  CMP   #$0002
         BEQ   L0445A5
         CMP   #$0003
         BNE   L0445CB
L0445A5  LDA   [$3A],Y
         STA   L04457B
         PEI   $42
         DEY
         PHY
         JSL   L042A5C
         STY   L04457D
         BRA   L044611
L0445B7  CMP   #$0002
         BEQ   L0445DD
         CMP   #$0003
         BEQ   L0445A5
         CMP   #$0006
         BEQ   L0445A5
         CMP   #$0007
         BEQ   L0445A5
L0445CB  LDA   [$3A],Y
         STA   L04457B
         PEI   $42
         DEY
         PHY
         JSL   L042F5B
         STA   L04457D
         BRA   L044611
L0445DD  LDA   [$3A],Y
         STA   L04457B
         INY
         INY
         LDA   [$3A],Y
         AND   #$00FF
         STA   L04457D
         BRA   L044611
L0445EE  LDA   #$0000
         SEP   #$20
         LDA   [$3A],Y
         REP   #$20
         BPL   L0445FC
         ORA   #$FF00
L0445FC  INC
         INC
         CLC
         ADC   L044577
L044602  LDY   $42
         BRA   L04462D
L044606  LDA   [$3A],Y
         INC
         INC
         INC
         CLC
         ADC   L044577
         BRA   L044602
L044611  LDAL  L0283C6
         BMI   L04461E
         LDAL  L0283CA
         BPL   L04461E
         RTS

L04461E  LDA   L04457D
         PHA
         LDA   L04457B
         PHA
         JSL   L042ABB
         BCC   L04462D
         RTS

L04462D  PHY
         PHA
         JSL   L0416D7
         PLY
         JSR   L044982
         RTS

L044638  PHP
         REP   #$30
         LDA   $AA
         ORA   $AC
         BNE   L044643
L044641  PLP
         RTS

L044643  LDY   #$0002
         LDA   [$AA]
         TAX
         LDA   [$AA],Y
         TAY
         BNE   L044651
         TXA
         BEQ   L044641
L044651  STX   $AE
         STY   $B0
         STZ   $C0
         LDA   #$0003
         STA   $C2
L04465C  LDA   [$AE]
         INC   $AE
         BNE   L044664
         INC   $B0
L044664  AND   #$00FF
         BEQ   L044641
         CMP   #$00E0
         BCS   L044682
         PHA
         CLC
         ADC   $AE
         STA   $AE
         LDA   #$0000
         ADC   $B0
         STA   $B0
         PLA
         ADC   $C0
         STA   $C0
         BRA   L04465C
L044682  ASL
         TAX
         JMP   (L044687-$1C0,X)

L044687  DA    L0446C7
         DA    L0446C7
         DA    L0446DB
         DA    L044707
         DA    L0446C7
         DA    L0446C7
         DA    L0446C7
         DA    L04481E
         DA    L0446C7
         DA    L0446C7
         DA    L0446C7
         DA    L04482E
         DA    L04482E
         DA    L04482E
         DA    L044826
         DA    L0446C7
         DA    L04481E
         DA    L0446C7
         DA    L0446C7
         DA    L04482E
         DA    L0446C7
         DA    L0446F1
         DA    L044722
         DA    L044740
         DA    L0446C7
         DA    L0446C7
         DA    L0446C7
         DA    L0446C7
         DA    L0446C7
         DA    L0446C7
         DA    L0446C7
         DA    L0446C7

L0446C7  PLP
         RTS

         PLP
         CLC
         RTS

L0446CC  CLC
         ADC   $AE
         STA   $AE
         LDA   #$0000
         ADC   $B0
         STA   $B0
         BRL   L04465C
L0446DB  LDY   #$0002
         LDA   [$AE],Y
         STA   $BC
         LDY   #$0006
         LDA   [$AE],Y
         LDY   $42
         JSR   L044982
         LDA   #$000A
         BRA   L0446CC
L0446F1  LDY   #$0002
         LDA   [$AE],Y
         STA   $BC
         LDY   #$0004
         LDA   [$AE],Y
         LDY   $42
         JSR   L044982
         LDA   #$0006
         BRA   L0446CC
L044707  LDY   #$0002
         LDA   [$AE],Y
         STA   $BC
         LDY   #$000A
         LDA   [$AE],Y
         PHA
         DEY
         DEY
         LDA   [$AE],Y
         TAY
         PLA
         JSR   L044987
         LDA   #$000E
         BRA   L0446CC
L044722  LDY   #$0002
         LDA   [$AE],Y
         STA   $BC
         LDY   #$0005
         LDA   [$AE],Y
         PHA
         DEY
         LDA   [$AE],Y
         AND   #$00FF
         TAY
         PLA
         JSR   L044987
         LDA   #$0007
         BRL   L0446CC
L044740  LDA   [$AE]
         DEC
         STA   L044809
         LDA   #$FF00
         STA   L04480B
         LDY   #$0002
         LDA   [$AE],Y
         BEQ   L044756
         BRL   L044641
L044756  LDY   #$0004
         LDA   [$AE],Y
         AND   #$00FF
         STA   L04480D
         LDA   #$0005
         CLC
         ADC   $AE
         STA   $AE
         LDA   #$0000
         ADC   $B0
         STA   $B0
L044770  DEC   L044809
         BPL   L044778
         BRL   L04465C
L044778  LDA   [$AE]
         INC   $AE
         BNE   L044780
         INC   $B0
L044780  AND   #$00FF
         CMP   #$0080
         BCC   L044795
         AND   #$007F
         XBA
         CLC
         ADC   L04480B
         STA   L04480B
         BRA   L044770
L044795  SEP   #$20
         INC   L04480C
         REP   #$20
         TAX
L04479D  DEC   L044809
         LDA   [$AE]
         INC   $AE
         BNE   L0447A8
         INC   $B0
L0447A8  AND   #$00FF
         CLC
         ADC   L04480B
         STA   $BC
         PHX
         JSR   L0447BB
         PLX
         DEX
         BPL   L04479D
         BRA   L044770
L0447BB  TAY
         LDA   L04480D
         CMP   #$001A
         BCS   L0447FE
         CMP   #$000E
         BCS   L0447F3
         CMP   #$0002
         BCS   L0447E3
         CMP   #$0001
         BEQ   L0447DB
         LDA   [$3A],Y
         LDY   $42
         JSR   L044982
         RTS

L0447DB  LDA   [$3A],Y
         LDY   $BE
         JSR   L044982
         RTS

L0447E3  LDA   [$3A],Y
         PHA
         INY
         INY
         LDA   [$3A],Y
         AND   #$00FF
         TAY
         PLA
         JSR   L044987
         RTS

L0447F3  SBC   #$000D
         PHA
         LDA   [$3A],Y
         PLY
         JSR   L044987
         RTS

L0447FE  SBC   #$0019
         PHA
         LDA   [$3A],Y
         PLY
         JSR   L044987
         RTS

L044809  DB    $00
         DB    $00
L04480B  DB    $00
L04480C  DB    $00
L04480D  DB    $00
         DB    $00
L04480F  LDA   [$AE]
         AND   #$00FF
         INC
         ADC   $AE
         STA   $AE
         BCC   L04481D
         INC   $B0
L04481D  RTS

L04481E  JSR   L04480F
         LDA   #$0004
         BRA   L044836
L044826  LDY   #$0005
         LDX   #$0007
         BRA   L044893
L04482E  LDY   #$0000
         LDX   #$0003
         BRA   L044893
L044836  CLC
         ADC   $AE
         STA   $AE
         BCC   L04483F
         INC   $B0
L04483F  LDA   [$AE]
         INC   $AE
         BNE   L044847
         INC   $B0
L044847  AND   #$00FF
         BEQ   L04485D
         CMP   #$0080
         BCC   L04483F
         AND   #$007F
         BEQ   L04483F
         CMP   #$0008
         BCC   L044860
         PLP
         RTS

L04485D  BRL   L04465C
L044860  ASL
         TAX
         JMP   (L044865,X)

L044865  DA    $0000
         DA    L044875
         DA    L04487A
         DA    L04487A
         DA    L04487A
         DA    L04487A
         DA    L04487A
         DA    L044875

L044875  LDA   #$0004
         BRA   L044836
L04487A  JSR   L04480F
         BRA   L04483F
L04487F  BIT   L04496E
         BPL   L04485D
         LDA   L044978
         BNE   L04485D
         LDA   L044976
         LDY   $42
         JSR   L044982
         BRA   L04485D
L044893  LDA   [$AE],Y
         STA   L044970
         STZ   L044972
         STZ   L04496E
         STZ   L044974
         STZ   L04497A
         TXA
L0448A5  CLC
         ADC   $AE
         STA   $AE
         BCC   L0448AE
         INC   $B0
L0448AE  LDA   [$AE]
         INC   $AE
         BNE   L0448B6
         INC   $B0
L0448B6  AND   #$00FF
         BEQ   L04487F
         CMP   #$0080
         BCC   L044929
         AND   #$007F
         CMP   #$0008
         BCC   L0448CA
         PLP
         RTS

L0448CA  ASL
         TAX
         JMP   (L0448CF,X)

L0448CF  DA    L0448DF
         DA    L0448F6
         DA    L04487A
         DA    L04487A
         DA    L04487A
         DA    L04487A
         DA    L04487A
         DA    L0448F0

L0448DF  LDX   L044970
         LDY   L044972
         STZ   L04496C
         LDA   #$FFFF
         STA   L04496E
         BRA   L044905
L0448F0  LDA   #$FFFF
         STA   L04496E
L0448F6  LDA   [$AE]
         TAX
         LDY   #$0002
         LDA   [$AE],Y
         TAY
         LDA   #$0004
         STA   L04496C
L044905  BIT   L044974
         BPL   L04491B
         STX   L04497C
         STY   L04497E
         LDA   #$FFFF
         STA   L04497A
L044916  LDA   L04496C
         BRA   L0448A5
L04491B  STX   L044976
         STY   L044978
         LDA   #$FFFF
         STA   L044974
         BRA   L044916
L044929  BIT   L04497A
         BMI   L044931
L04492E  BRL   L04483F
L044931  CMP   #$0007
         BEQ   L044966
         CMP   #$0001
         BEQ   L044953
         CMP   #$0002
         BNE   L04492E
         SEC
         LDA   #$0000
         SBC   L04497C
         STA   L04497C
         LDA   #$0000
         SBC   L04497E
         STA   L04497E
L044953  CLC
         LDA   L04497C
         ADC   L044976
         STA   L044976
         LDA   L04497E
         ADC   L044978
         STA   L044978
L044966  STZ   L04497A
         BRL   L0448AE
L04496C  DB    $00
         DB    $00
L04496E  DB    $00
         DB    $00
L044970  DB    $00
         DB    $00
L044972  DB    $00
         DB    $00
L044974  DB    $00
         DB    $00
L044976  DB    $00
         DB    $00
L044978  DB    $00
         DB    $00
L04497A  DB    $00
         DB    $00
L04497C  DB    $00
         DB    $00
L04497E  DB    $00
         DB    $00
L044980  DB    $00
         DB    $00
L044982  LDX   #$0000
         BRA   L04498A
L044987  LDX   #$0001
L04498A  STX   L044A2B
         PHY
         PHA
         PHY
         PHA
         LDA   $BC
         JSL   L0410BB
         BIT   L044980
         BEQ   L04499F
         BRL   L044A26
L04499F  PLA
         PLY
         PHY
         PHA
         CPY   $42
         BEQ   L0449CC
         PHY
         PHA
         LDA   #$0000
         STA   [$A6]
         PEI   $A8
         PEI   $A6
         JSL   L0428B4
         BCS   L0449DD
         CPX   L044A2B
         BEQ   L044A26
         LDY   #$0002
         LDA   [$A2],Y
         AND   #$FFE0
         ORA   L044A2B
         STA   [$A2],Y
         BRA   L044A26
L0449CC  JSL   L0416F3
         STA   $01,S
         STA   $05,S
         JSL   L0410BB
         BIT   #$6000
         BNE   L044A26
L0449DD  LDA   #$0000
         STA   [$A6]
         JSL   L042A5C
         LDX   #$0002
         BIT   $CE
         BMI   L0449F0
         INX
         BRA   L0449F8
L0449F0  PHA
         TXA
         CLC
         ADC   L044A2B
         TAX
         PLA
L0449F8  STX   $C2
         JSR   L04433D
         SEP   #$30
         LDA   #$CC
         LDY   #$01
         STA   [$A6],Y
         REP   #$30
         LDA   $03,S
         CMP   $42
         BEQ   L044A12
         LDA   #$0001
         BRA   L044A18
L044A12  PLA
         PHA
         JSL   L041993
L044A18  PHA
         LDA   L044A2B
         PHA
         PEI   $A8
         PEI   $A6
         JSL   L042748
         RTS

L044A26  PLA
         PLY
         PLA
         PLY
         RTS

L044A2B  DB    $00
         DB    $00
L044A2D  ENT
         PHP
         REP   #$30
         LDA   #$FE40
         STA   $BA
         JSR   L0424AF
         BRA   L044A3D
L044A3A  JSR   L0424F2
L044A3D  BCS   L044A6E
         LDY   #$0006
         LDA   [$A2],Y
         EOR   $42
         BNE   L044A3A
         DEY
         DEY
         LDA   [$A2],Y
         PHY
         JSL   L0416F3
         PLY
         EOR   [$A2],Y
         BEQ   L044A3A
         LDA   [$A2],Y
         PHA
         LDY   #$0008
         LDA   [$A2],Y
         BNE   L044A61
         INC
L044A61  PHA
         PEA   $6000
         JSL   L041015
         JSR   L043636
         BCC   L044A3A
L044A6E  PLP
         CLC
         RTL

L044A71  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         PEA   $0000
         PEI   $3E
         PEA   $6000
         JSL   L041015
         LDA   #$FE40
         STA   $BA
         JSR   L0424AF
         BRA   L044A9F
L044A8D  PLA
         STA   $A2
         PLA
         STA   $A4
         PLA
         STA   $9A
         PLA
         STA   $9C
         PLA
         STA   $BA
L044A9C  JSR   L0424F2
L044A9F  BCS   L044B17
         LDY   #$0006
         LDA   [$A2],Y
         STA   $BE
         EOR   $42
         BNE   L044A9C
         PEI   $BA
         PEI   $9C
         PEI   $9A
         PEI   $A4
         PEI   $A2
         DEY
         DEY
         LDA   [$A2],Y
         STA   $BC
         JSL   L0410BB
         BIT   #$8000
         BEQ   L044AE0
         LDA   #$E020
         STA   $BA
         JSR   L04250E
         BCS   L044AD4
         LDA   $BC
         JSR   L042FF8
L044AD4  PHY
         LDA   $03,S
         STA   $A2
         LDA   $05,S
         STA   $A4
         PLA
         BCC   L044AF7
L044AE0  LDA   $BC
         JSL   L041719
         LDY   #$0004
         LDA   [$A2],Y
         TAY
         LDA   [$3A],Y
         AND   #$00FF
         JSL   L04037A
         INY
         TYA
L044AF7  LDY   #$0008
         STA   [$A2],Y
         PEI   $BC
         PHA
         LDX   #$4000
         LDY   #$0002
         LDA   [$A2],Y
         AND   #$001F
         BEQ   L044B0F
         LDX   #$6000
L044B0F  PHX
         JSL   L041058
         BRL   L044A8D
L044B17  PLP
         PLB
         CLC
         RTL

L044B1B  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         PHY
         PHX
         LDA   $C7
         BEQ   L044B41
         LDA   $01,S
         ORA   $03,S
         BNE   L044B32
         PLX
         PLY
         BRL   L044BCA
L044B32  LDA   $C8
         PHA
         LDA   $C6
         PHA
         _DisposeHandle
         STZ   $C7
L044B41  LDA   $01,S
         ORA   $03,S
         BNE   L044B4B
         PLX
         PLY
         BRA   L044B59
L044B4B  PLX
         PLY
         STX   L044BFC
         STY   L044BFC+2
         STX   L044C26
         STY   L044C26+2
L044B59  JSL   GSOS
         DW    $2006      ; GetFileInfo
         ADRL  L044BFA
         BCS   L044BCA
         LDY   L044C1E+2
         STY   L044C32+2
         LDX   L044C1E
         STX   L044C32
         PHA
         PHA
         PHY
         PHX
         PEI   $FC
         PEA   $8008
         PHA
         PHA
         _NewHandle
         PLX
         PLY
         BCS   L044BCA
         STY   $C8
         STX   $C6
         PHB
         PHY
         PLB
         LDA   |$0000,X
         STAL  L044C2E
         LDA   |$0002,X
         STAL  L044C2E+2
         PLB
         PLB
         JSL   GSOS
         DW    $2010      ; Open
         ADRL  L044C22
         BCS   L044BDC
         LDA   L044C24
         STA   L044C2C
         STA   L044C3C
         JSL   GSOS
         DW    $2012      ; Read
         ADRL  L044C2A
         BCS   L044BD9
         LDA   #$0008
         LDY   #$0004
         STA   [$C6],Y
         JSR   L044BCE
L044BCA  PLP
         PLB
         CLC
         RTL

L044BCE  JSL   GSOS
         DW    $2014      ; Close
         ADRL  L044C3A
         RTS

L044BD9  JSR   L044BCE
L044BDC  PEI   $C8
         PEI   $C6
         _DisposeHandle
         STZ   $C8
         STZ   $C6
         BRA   L044BCA
L044BED  STRL  '9:TFBD.Data'
L044BFA  DW    $0009      ; Parms for GetFileInfo
L044BFC  ADRL  L044BED    ;  file name
         DW    $0000      ;  access
         DW    $0000      ;  file type
         ADRL  $00000000  ;  aux type
         DW    $0000      ;  storage
         DS    8          ;  creation date
         DS    8          ;  modification date
         ADRL  $00000000  ;  option list
L044C1E  ADRL  $00000000  ;  end of file
L044C22  DW    $0002      ; Parms for Open
L044C24  DW    $0000      ;  ref num
L044C26  ADRL  L044BED    ;  path name
L044C2A  DW    $0004      ; Parms for Read
L044C2C  DW    $0000      ;  ref num
L044C2E  ADRL  $00000000  ;  buffer ptr
L044C32  ADRL  $00000000  ;  request count
         ADRL  $00000000  ;  transfer count
L044C3A  DW    $0001      ; Parms for Close
L044C3C  DW    $0000      ;  ref num
L044C3E  ENT
         PHP
         REP   #$30
         JSR   L044C50
         BCS   L044C4D
         LDY   $CC
         LDA   $CA
         PLP
         CLC
         RTL

L044C4D  PLP
         SEC
         RTL

L044C50  PHP
         REP   #$30
         LDA   $C8
         ORA   $C6
         BEQ   L044C6F
         LDY   #$0002
         LDA   [$C6],Y
         STA   $CC
         LDA   [$C6]
         STA   $CA
         ORA   $CC
         BEQ   L044C6B
         PLP
         CLC
         RTS

L044C6B  STZ   $C6
         STZ   $C8
L044C6F  PLP
         SEC
         RTS

L044C72  ENT
         PHP
         REP   #$30
         JSR   L044C50
         BCC   L044C7D
         BRL   L044CB4
L044C7D  PEI   $CC
         PEI   $CA
         TSC
         INC
         PHD
         TCD
         LDY   #$0004
         LDA   [$00],Y
         CLC
         ADC   $00
         STA   $00
         BCC   L044C93
         INC   $02
L044C93  LDY   #$0000
L044C96  LDA   [$00],Y
         BEQ   L044CB1
         CMP   $0C
         BNE   L044CA1
         BRL   L044CF0
L044CA1  INY
         INY
         LDA   [$00],Y
         AND   #$00FF
         INC
         PHY
         CLC
         ADC   $01,S
         PLY
         TAY
         BRA   L044C96
L044CB1  PLD
         PLA
         PLA
L044CB4  PEA   ^L044D2A
         PEA   L044D2A
         LDA   $0B,S
         STA   $A8
         PHA
         LDA   $0B,S
         STA   $A6
         PHA
         JSL   L0307DD
         LDA   [$A6]
         AND   #$00FF
         TAY
         LDA   $09,S
         PHA
         PHY
         XBA
         JSL   L030837
         PLY
         INY
         STA   [$A6],Y
         INY
         PLA
         PHY
         JSL   L030837
         PLY
         INY
         STA   [$A6],Y
         INY
         SEP   #$30
         TYA
         STA   [$A6]
         REP   #$30
         BRA   L044D19
L044CF0  INY
         INY
         TYA
         CLC
         ADC   $00
         STA   $00
         BCC   L044CFC
         INC   $02
L044CFC  PLD
         LDA   $0B,S
         STA   $A8
         PHA
         LDA   $0B,S
         STA   $A6
         PHA
         SEP   #$30
         LDA   [$A6]
         INC
         STA   [$A6]
         TAY
         LDA   #$DF
         STA   [$A6],Y
         REP   #$30
         JSL   L0307DD
L044D19  LDA   $03,S
         STA   $09,S
         LDA   $01,S
         STA   $07,S
         TSC
         CLC
         ADC   #$0006
         TCS
         PLP
         CLC
         RTL

L044D2A  STR   "Tool $"
L044D31  PHP
         REP   #$30
         JSR   L044C50
         BCS   L044D55
         LDY   $BE
         LDA   #$0003
         CPY   #$00E1
         BEQ   L044D58
         INC
         CPY   #$00E0
         BEQ   L044D58
         INC
         CPY   #$0001
         BEQ   L044D58
         INC
         CPY   #$0000
         BEQ   L044D58
L044D55  PLP
         SEC
         RTS

L044D58  ASL
         TAY
         LDA   [$CA],Y
         ADC   $CA
         STA   $CA
         BCC   L044D64
         INC   $CC
L044D64  LDY   #$0000
L044D67  LDA   [$CA],Y
         BEQ   L044D55
         CMP   $BC
         BEQ   L044D94
         BCS   L044D82
         INY
         INY
         LDA   [$CA],Y
         AND   #$7FFF
         DEY
         DEY
         CLC
         ADC   [$CA],Y
         DEC
         CMP   $BC
         BCS   L044D94
L044D82  INY
         INY
         INY
         INY
         LDA   [$CA],Y
         AND   #$00FF
         INC
         PHY
         CLC
         ADC   $01,S
         PLY
         TAY
         BRA   L044D67
L044D94  TYA
         CLC
         ADC   $CA
         STA   $CA
         BCC   L044D9E
         INC   $CC
L044D9E  PEI   $CC
         CLC
         LDA   $CA
         ADC   #$0004
         PHA
         BCC   L044DAE
         LDA   $03,S
         INC
         STA   $03,S
L044DAE  PEI   $A8
         PEI   $A6
         JSL   L0307DD
         LDY   #$0002
         LDA   [$CA],Y
         ORA   #$8000
         STA   [$CA],Y
         LDA   [$CA]
         SEC
         SBC   $BC
         BEQ   L044DDE
         EOR   #$FFFF
         INC
         PHA
         SEP   #$30
         LDA   [$A6]
         INC
         STA   [$A6]
         TAY
         LDA   #$AB
         STA   [$A6],Y
         REP   #$30
         PLA
         JSR   L042953
L044DDE  PLP
         CLC
         RTS

L044DE1  PHP
         REP   #$30
         JSR   L044C50
         BCC   L044DEB
         PLP
         RTS

L044DEB  LDA   #$0003
L044DEE  STA   L044E34
         ASL
         ADC   #$0006
         TAY
         PHD
         PEI   $CC
         LDA   [$CA],Y
         ADC   $CA
         PHA
         BCC   L044E05
         LDA   $03,S
         INC
         STA   $03,S
L044E05  TSC
         INC
         TCD
         LDY   #$0000
L044E0B  LDA   [$00],Y
         BEQ   L044E29
         INY
         INY
         LDA   [$00],Y
         AND   #$7FFF
         STA   [$00],Y
         INY
         INY
         LDA   [$00],Y
         AND   #$00FF
         INC
         PHA
         TYA
         CLC
         ADC   $01,S
         PLY
         TAY
         BRA   L044E0B
L044E29  PLA
         PLA
         PLD
         LDA   L044E34
         DEC
         BPL   L044DEE
         PLP
         RTS

L044E34  DB    $00
         DB    $00
L044E36  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0006
         JSR   L041ED9
         LDA   L041ABC
         STA   $C2
         LDA   L041ABE
         STA   $BC
         CLC
         ADC   $C2
         DEC
         STA   $C0
         LDA   L041AC0
         STA   $BE
         LDA   #$E060
         STA   $BA
         JSR   L0424AF
         BRA   L044E64
L044E61  JSR   L0424F2
L044E64  BCS   L044E96
         LDY   #$0006
         LDA   [$A2],Y
         EOR   $BE
         BNE   L044E61
         DEY
         DEY
         LDA   [$A2],Y
         CMP   $C0
         BEQ   L044E79
         BCS   L044E61
L044E79  CMP   $BC
         BCC   L044E61
         PEI   $BE
         PEI   $BC
         PEI   $C2
         PEI   $C0
         JSR   L043667
         PLA
         STA   $C0
         PLA
         STA   $C2
         PLA
         STA   $BC
         PLA
         STA   $BE
         BRA   L044E61
L044E96  LDA   $BE
         CMP   $42
         BNE   L044EA7
         PEI   $BC
         PEI   $C2
         PEA   $141F
         JSL   L041015
L044EA7  CLC
         BRL   L041F34
L044EAB  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         STZ   L044F83
         LDA   #$E020
L044EB7  STA   $BA
         STZ   L044F85
         JSR   L0424AF
         BRA   L044EC4
L044EC1  JSR   L0424F2
L044EC4  BCS   L044F38
         LDA   [$A2]
         CMP   #$FFFF
         BNE   L044F33
         LDY   #$0002
         LDA   [$A2],Y
         EOR   $BA
         AND   #$00E0
         BNE   L044F33
         LDA   $BA
         AND   #$00FF
         LSR
         LSR
         LSR
         LSR
         TAX
         LDA   [$A2],Y
         AND   #$001F
         CMP   L044F87,X
         BCS   L044F33
         INY
         LDA   [$A2],Y
         AND   #$00FF
         BEQ   L044F29
         LDY   #$000C
         LDA   [$A2],Y
         TAX
         INY
         INY
         LDA   [$A2],Y
         TAY
         BNE   L044F05
         TXA
         BEQ   L044F33
L044F05  PHB
         PHY
         PLB
         LDA   |$0002,X
         TAY
         LDA   |$0000,X
         PLB
         PLB
         TAX
         BNE   L044F17
         TYA
         BEQ   L044F33
L044F17  PHB
         PHY
         PLB
         LDA   |$0000,X
         PLB
         PLB
         LDY   #$0003
         EOR   [$A2],Y
         AND   #$00FF
         BNE   L044F33
L044F29  JSR   L044F64
         BCS   L044F33
         INC   L044F85
         BRA   L044EC1
L044F33  JSR   L043636
         BRA   L044EC1
L044F38  LDA   $BA
         PHA
         AND   #$00FF
         LSR
         LSR
         LSR
         LSR
         TAX
         LDA   L044F85
         STA   $82,X
         CLC
         ADC   L044F83
         STA   L044F83
         PLA
         ADC   #$0020
         CMP   #$E080
         BCS   L044F5B
         BRL   L044EB7
L044F5B  LDA   L044F83
         STA   $82
         PLP
         PLB
         CLC
         RTL

L044F64  LDY   #$0002
         LDA   [$A2],Y
         PHA
         AND   #$00E0
         LSR
         LSR
         LSR
         LSR
         TAX
         LDA   L044F8F,X
         TAX
         PLA
         AND   #$001F
         ASL
         PHX
         ADC   $01,S
         PLX
         TAX
         JMP   ($0000,X)

L044F83  DB    $00
         DB    $00
L044F85  DB    $00
         DB    $00
L044F87  DB    $00
         DB    $00
         DB    $11
         DB    $00
         DB    $06
         DB    $00
         DB    $07
         DB    $00

L044F8F  DA    $0000
         DA    L044F97
         DA    L044FB9
         DA    L044FC5

L044F97  DA    L044FF2
         DA    L044FF2
         DA    L044FF2
         DA    L044FF2
         DA    L044FF2
         DA    L044FF2
         DA    L044FF2
         DA    L044FF2
         DA    L044FF2
         DA    L044FF2
         DA    L044FF2
         DA    L044FF2
         DA    L044FF2
         DA    L044FF2
         DA    L044FF2
         DA    L044FF2
         DA    L044FF2

L044FB9  DA    L044FF9
         DA    L044FF9
         DA    L044FF9
         DA    L04500A
         DA    L04501F
         DA    L04500A

L044FC5  DA    L04505C
         DA    L045048
         DA    L045062
         DA    L044FFE
         DA    L04506B
         DA    L045021
         DA    L04505C

L044FD3  LDY   #$000E
         LDA   [$A2],Y
         DEY
         DEY
         ORA   [$A2],Y
         CMP   #$0001
         RTS

L044FE0  JSR   L044FD3
         BCS   L045046
         JSR   L044FE9
         RTS

L044FE9  LDY   #$000A
         LDA   [$A2],Y
         CMP   #$0001
         RTS

L044FF2  JSR   L044FE0
         BCS   L045046
         BRA   L045028
L044FF9  JSR   L044FE9
L044FFC  BCS   L045046
L044FFE  LDY   #$0008
         LDA   [$A2],Y
         BNE   L045028
         INC
         STA   [$A2],Y
         BRA   L045028
L04500A  LDY   #$0004
         LDA   [$A2],Y
         BNE   L045046
         DEY
         DEY
         LDA   [$A2],Y
         AND   #$FF00
         BNE   L045046
         JSR   L044FE9
         BCS   L045046
L04501F  CLC
         RTS

L045021  LDY   #$000E
         LDA   [$A2],Y
         BNE   L045046
L045028  LDY   #$0004
L04502B  LDA   [$A2],Y
         TAX
         INY
         INY
         LDA   [$A2],Y
         TAY
         CPY   $40
         BEQ   L045039
         BCS   L045046
L045039  TYA
         EOR   $42
         BNE   L04501F
         BIT   $5C
         BMI   L04501F
         CPX   $3E
         BCC   L04501F
L045046  SEC
         RTS

L045048  LDY   #$000C
         LDA   [$A2],Y
         AND   #$FFEE
         INY
         INY
         ORA   [$A2],Y
         BNE   L045046
         JSR   L044FE9
         BCC   L045028
         RTS

L04505C  JSR   L044FE9
         BCC   L045028
         RTS

L045062  LDY   #$000C
         JSR   L04502B
         BCC   L044FFE
         RTS

L04506B  JSR   L044FD3
         BCS   L045046
         LDY   #$000A
         LDA   [$A2],Y
         AND   #$FF00
         CMP   #$0001
         BCC   L045028
         RTS

L04507E  ENT
         PHP
         REP   #$20
         CMP   #$0001
         ROR   $CE
         PLP
         CLC
         RTL

L045089  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0008
         JSR   L041ED9
         LDA   L041ABE
         STA   L045170
         LDA   L041ABC
         STA   L04516E
         LDX   L041AC2
         STX   $BE
         LDA   L041AC0
         STA   $BC
         STZ   $C4
         CPX   $42
         BEQ   L0450B5
         SEC
         BRL   L041F34
L0450B5  JSL   L0410BB
         STA   L04516C
         BIT   #$1800
         BNE   L0450CE
         TAX
         AND   #$8080
         CMP   #$0080
         BNE   L0450CE
L0450CA  SEC
         BRL   L041F34
L0450CE  TXA
         BIT   #$1000
         BEQ   L0450E3
         JSR   L044019
         BCC   L0450F7
         JSR   L044017
         BCC   L04512B
         JSR   L04404D
         BCC   L045130
L0450E3  LDA   L04516C
         BIT   #$0800
         BEQ   L0450F0
         JSR   L04517C
         BCC   L0450F7
L0450F0  JSR   L0454D9
         BCS   L0450CA
         BRA   L0450FA
L0450F7  LDX   #$0000
L0450FA  STX   L045172
         STA   L045178
         STY   L04517A
         LDA   $C4
         SEP   #$30
         STA   L045176
         REP   #$30
         XBA
         AND   #$00FF
         BIT   #$0080
         BEQ   L045118
         ORA   #$FF00
L045118  CLC
         ADC   L045178
         STA   L045178
         LDA   $C2
         STA   L045174
         JSR   L04513B
         CLC
         BRL   L041F34
L04512B  LDX   #$0003
         BRA   L0450FA
L045130  CLC
         TYA
         ADC   $BC
         LDY   $42
         LDX   #$0002
         BRA   L0450FA
L04513B  PHD
         LDA   L045170
         PHA
         LDA   L04516E
         PHA
         TSC
         TCD
         LDA   L045172
         STA   [$01]
         LDY   #$0002
         LDA   L045174
         STA   [$01],Y
         INY
         INY
         LDA   L045176
         STA   [$01],Y
         INY
         INY
         LDA   L045178
         STA   [$01],Y
         INY
         INY
         LDA   L04517A
         STA   [$01],Y
         PLA
         PLA
         PLD
         RTS

L04516C  DB    $00
         DB    $00
L04516E  DB    $00
         DB    $00
L045170  DB    $00
         DB    $00
L045172  DB    $00
         DB    $00
L045174  DB    $00
         DB    $00
L045176  DB    $00
         DB    $00
L045178  DB    $00
         DB    $00
L04517A  DB    $00
         DB    $00
L04517C  PHP
         REP   #$30
         LDA   $AB
         BNE   L045186
L045183  PLP
         SEC
         RTS

L045186  LDY   #$0002
         LDA   [$AA]
         TAX
         LDA   [$AA],Y
         TAY
         BNE   L045194
         TXA
         BEQ   L045183
L045194  STX   $AE
         STY   $B0
L045198  LDA   [$AE]
         INC   $AE
         BNE   L0451A0
         INC   $B0
L0451A0  AND   #$00FF
         BEQ   L045183
         CMP   #$00E0
         BCS   L0451B8
         CLC
         ADC   $AE
         STA   $AE
         LDA   #$0000
         ADC   $B0
         STA   $B0
         BRA   L045198
L0451B8  ASL
         TAX
         JMP   (L0451BD-$1C0,X)

L0451BD  DA    L0451FD
         DA    L0451FD
         DA    L045212
         DA    L045262
         DA    L0451FD
         DA    L0451FD
         DA    L0451FD
         DA    L0453FD
         DA    L0451FD
         DA    L0451FD
         DA    L0451FD
         DA    L0453CF
         DA    L0453CF
         DA    L0453CF
         DA    L0453B5
         DA    L0451FD
         DA    L0453FD
         DA    L0451FD
         DA    L0451FD
         DA    L0453CF
         DA    L0451FD
         DA    L04523A
         DA    L045290
         DA    L0452C1
         DA    L0451FD
         DA    L0451FD
         DA    L0451FD
         DA    L0451FD
         DA    L0451FD
         DA    L0451FD
         DA    L0451FD
         DA    L0451FD

L0451FD  PLP
         SEC
         RTS

L045200  PLP
         CLC
         RTS

L045203  CLC
         ADC   $AE
         STA   $AE
         LDA   #$0000
         ADC   $B0
         STA   $B0
         BRL   L045198
L045212  LDY   #$0002
         LDA   [$AE],Y
         CMP   $BC
         BEQ   L045220
         LDA   #$000A
         BRA   L045203
L045220  SEP   #$20
         DEY
         LDA   [$AE],Y
         STA   $C4
         REP   #$20
         DEY
         LDA   [$AE],Y
         AND   #$00FF
         STA   $C2
         LDY   #$0006
         LDA   [$AE],Y
         LDY   $BE
         BRA   L045200
L04523A  LDY   #$0002
         LDA   [$AE],Y
         CMP   $BC
         BEQ   L045248
         LDA   #$0006
         BRA   L045203
L045248  SEP   #$20
         DEY
         LDA   [$AE],Y
         STA   $C4
         REP   #$20
         DEY
         LDA   [$AE],Y
         AND   #$00FF
         STA   $C2
         LDY   #$0004
         LDA   [$AE],Y
         LDY   $BE
         BRA   L045200
L045262  LDY   #$0002
         LDA   [$AE],Y
         CMP   $BC
         BEQ   L045270
         LDA   #$000E
         BRA   L045203
L045270  SEP   #$20
         DEY
         LDA   [$AE],Y
         STA   $C4
         REP   #$20
         DEY
         LDA   [$AE],Y
         AND   #$00FF
         STA   $C2
         LDY   #$000A
         LDA   [$AE],Y
         PHA
         DEY
         DEY
         LDA   [$AE],Y
         TAY
         PLA
         BRL   L045200
L045290  LDY   #$0002
         LDA   [$AE],Y
         CMP   $BC
         BEQ   L04529F
         LDA   #$0007
         BRL   L045203
L04529F  SEP   #$20
         DEY
         LDA   [$AE],Y
         STA   $C4
         REP   #$20
         DEY
         LDA   [$AE],Y
         AND   #$00FF
         STA   $C2
         LDY   #$0005
         LDA   [$AE],Y
         PHA
         DEY
         LDA   [$AE],Y
         AND   #$00FF
         TAY
         PLA
         BRL   L045200
L0452C1  LDA   [$AE]
         DEC
         STA   L0453AF
         LDA   #$FF00
         STA   L0453B1
         LDY   #$0002
         LDA   [$AE],Y
         BEQ   L0452D7
         BRL   L045183
L0452D7  LDY   #$0004
         LDA   [$AE],Y
         AND   #$00FF
         STA   L0453B3
         LDA   #$0005
         CLC
         ADC   $AE
         STA   $AE
         LDA   #$0000
         ADC   $B0
         STA   $B0
L0452F1  DEC   L0453AF
         BPL   L0452F9
         BRL   L045198
L0452F9  LDA   [$AE]
         INC   $AE
         BNE   L045301
         INC   $B0
L045301  AND   #$00FF
         CMP   #$0080
         BCC   L045316
         AND   #$007F
         XBA
         CLC
         ADC   L0453B1
         STA   L0453B1
         BRA   L0452F1
L045316  SEP   #$20
         INC   L0453B2
         REP   #$20
         TAX
L04531E  DEC   L0453AF
         LDA   [$AE]
         INC   $AE
         BNE   L045329
         INC   $B0
L045329  AND   #$00FF
         CLC
         ADC   L0453B1
         CMP   $BC
         BEQ   L045339
         DEX
         BPL   L04531E
         BRA   L0452F1
L045339  LDX   #$0002
         STX   $C2
         TAY
         LDA   L0453B3
         CMP   #$001A
         BCS   L04539B
         CMP   #$000E
         BCS   L045389
         CMP   #$0002
         BCS   L045372
         CMP   #$0001
         BEQ   L045363
         SEP   #$20
         STZ   $C4
         REP   #$20
         LDA   [$3A],Y
         LDY   $BE
         BRL   L045200
L045363  SEP   #$20
         STZ   $C4
         REP   #$20
         INC   $C2
         LDA   [$3A],Y
         LDY   $BE
         BRL   L045200
L045372  SEP   #$20
         STZ   $C4
         REP   #$20
         INC   $C2
         LDA   [$3A],Y
         PHA
         INY
         INY
         LDA   [$3A],Y
         AND   #$00FF
         TAY
         PLA
         BRL   L045200
L045389  SBC   #$000D
         PHA
         SEP   #$20
         STZ   $C4
         REP   #$20
         INC   $C2
         LDA   [$3A],Y
         PLY
         BRL   L045200
L04539B  SBC   #$0019
         PHA
         SEP   #$20
         LDA   #$F0
         STA   $C4
         REP   #$20
         INC   $C2
         LDA   [$3A],Y
         PLY
         BRL   L045200
L0453AF  DB    $00
         DB    $00
L0453B1  DB    $00
L0453B2  DB    $00
L0453B3  DB    $00
         DB    $00
L0453B5  LDA   [$AE]
         AND   #$00FF
         STA   $C2
         LDY   #$0005
         LDA   [$AE],Y
         PHA
         LDA   #$0007
         JSR   L0453F3
         PLA
         CMP   $BC
         BEQ   L04543D
         BRA   L04541B
L0453CF  LDA   [$AE]
         PHA
         LDY   #$0002
         LDA   [$AE],Y
         AND   #$00FF
         STA   $C2
         TYA
         INC
         JSR   L0453F3
         PLA
         CMP   $BC
         BEQ   L04543D
         BRA   L04541B
L0453E8  LDA   #$0004
         BRA   L0453F3
L0453ED  LDA   [$AE]
         AND   #$00FF
         INC
L0453F3  CLC
         ADC   $AE
         STA   $AE
         BCC   L0453FC
         INC   $B0
L0453FC  RTS

L0453FD  JSR   L0453ED
         JSR   L0453E8
         BRA   L04541B

L045405  DA    L0453E8
         DA    L0453ED
         DA    L0453ED
         DA    L0453ED
         DA    L0453ED
         DA    L0453ED
         DA    L0453E8

L045413  LDA   L0454D5
         LDY   $42
         PLP
         CLC
         RTS

L04541B  LDA   [$AE]
         INC   $AE
         BNE   L045423
         INC   $B0
L045423  AND   #$00FF
         BNE   L04542B
         BRL   L045198
L04542B  CMP   #$0080
         BCC   L04541B
         AND   #$007F
         BEQ   L04541B
         DEC
         ASL
         TAX
         JSR   (L045405,X)
         BRA   L04541B
L04543D  LDA   [$AE]
         AND   #$00FF
         CMP   #$0080
         BCC   L04541B
         INC   $AE
         BNE   L04544D
         INC   $B0
L04544D  AND   #$007F
         BEQ   L045461
         DEC
         BEQ   L04545A
         CMP   #$0006
         BNE   L045485
L04545A  LDA   [$AE]
         STA   L0454D5
         BRA   L045493
L045461  LDA   $BC
         STA   L0454D5
L045466  LDA   [$AE]
         INC   $AE
         BNE   L04546E
         INC   $B0
L04546E  AND   #$00FF
         BEQ   L045413
         CMP   #$0080
         BCC   L045498
         AND   #$007F
         BEQ   L04548E
         DEC
         BEQ   L04548A
         CMP   #$0006
         BEQ   L04548A
L045485  JSR   L0453ED
L045488  BRA   L04541B
L04548A  LDA   [$AE]
         BRA   L045490
L04548E  LDA   $BC
L045490  STA   L0454D7
L045493  JSR   L0453E8
         BRA   L045466
L045498  CMP   #$0008
         BCS   L045488
         DEC
         ASL
         TAX
         JMP   (L0454C7,X)

L0454A3  SEP   #$20
         LDA   L0454D7
         STA   $C5
         REP   #$20
         BRA   L045466
L0454AE  SEP   #$20
         LDA   L0454D7
         EOR   #$FF
         INC
         STA   $C5
         REP   #$20
         BRA   L045466
L0454BC  SEP   #$20
         LDA   L0454D7
         STA   $C4
         REP   #$20
         BRA   L045466

L0454C7  DA    L0454A3
         DA    L0454AE
         DA    L04541B
         DA    L04541B
         DA    L04541B
         DA    L04541B
         DA    L0454BC

L0454D5  DB    $00
         DB    $00
L0454D7  DB    $00
         DB    $00

L0454D9  LDA   $BC
         JSL   L041993
         STA   $C2
         LDA   $BC
         JSL   L0410BB
         ASL
         BCS   L045508
         LDA   $BC
         JSL   L0416F3
         TAY
         LDA   [$3A],Y
         AND   #$001F
         STA   L045527
         ASL
         TAX
         LDA   [$3A],Y
         LSR
         LSR
         LSR
         LSR
         LSR
         AND   #$0007
         JMP   (L045529,X)

L045508  JSR   L0442E7
         STY   L045683
         STA   L045681
         LDX   $C2
         CPX   #$0002
         BCC   L045522
         JSR   L0455F8
         CPX   #$0000
         BNE   L045522
         CLC
         RTS

L045522  LDX   #$0005
         CLC
         RTS

L045527  DB    $00
         DB    $00
L045529  DA    L04559F
         DA    L04559D
         DA    L0455B8
         DA    L04559D
         DA    L04556B
         DA    L04559D
         DA    L04559D
         DA    L04559D
         DA    L045569
         DA    L04559D
         DA    L045569
         DA    L045569
         DA    L0455D4
         DA    L045633
         DA    L045633
         DA    L04564F
         DA    L045668
         DA    L04559D
         DA    L04559D
         DA    L04559D
         DA    L04556B
         DA    L04559D
         DA    L04559D
         DA    L04559D
         DA    L045569
         DA    L045633
         DA    L045569
         DA    L045569
         DA    L04561F
         DA    L045633
         DA    L045633
         DA    L04564F

L045569  SEC
         RTS

L04556B  CMP   #$0002
         BNE   L04558F
         SEP   #$20
         LDA   #$F0
         STA   $C4
         STZ   $C5
         REP   #$20
         LDA   #$0001
         STA   $C2
         LDY   $BC
         LDA   [$3A],Y
         AND   #$00FF
         TAY
         LDA   #$0000
         LDX   #$0003
         CLC
         RTS

L04558F  INY
         LDA   [$3A],Y
         AND   #$00FF
         LDY   #$0000
         LDX   #$0004
         CLC
         RTS

L04559D  SEC
         RTS

L04559F  CMP   #$0005
         BCS   L04559D
         CMP   #$0001
         BEQ   L0455DE
         CMP   #$0000
         BEQ   L04558F
         CMP   #$0004
         BNE   L0455B6
         BRL   L045668
L0455B6  SEC
         RTS

L0455B8  CMP   #$0000
         BEQ   L04558F
         CMP   #$0001
         BNE   L0455C5
         BRL   L04564F
L0455C5  CMP   #$0002
         BEQ   L04558F
         CMP   #$0005
         BCS   L0455D2
         BRL   L045662
L0455D2  BCS   L04559D
L0455D4  CMP   #$0002
         BEQ   L0455DE
         CMP   #$0003
         BNE   L045633
L0455DE  INY
         LDA   [$3A],Y
         STA   L045681
         PEI   $42
         DEY
         PHY
         PEA   ^L042A5C
         PEA   L042A5C
         LDX   #$0004
         JSL   L041F18
         STY   L045683
L0455F8  LDY   L045683
         LDA   L045681
         PHY
         PHA
         PEA   ^L042ABB
         PEA   L042ABB
         LDX   #$0004
         JSL   L041F18
         BCS   L045614
         LDX   #$0001
         CLC
         RTS

L045614  LDY   L045683
         LDA   L045681
         LDX   #$0003
         CLC
         RTS

L04561F  CMP   #$0002
         BEQ   L04564F
         CMP   #$0003
         BEQ   L0455DE
         CMP   #$0006
         BEQ   L0455DE
         CMP   #$0007
         BEQ   L0455DE
L045633  INY
         LDA   [$3A],Y
         STA   L045681
         PEI   $42
         DEY
         PHY
         PEA   ^L042F5B
         PEA   L042F5B
         LDX   #$0004
         JSL   L041F18
         STA   L045683
         BRA   L0455F8
L04564F  INY
         LDA   [$3A],Y
         STA   L045681
         INY
         INY
         LDA   [$3A],Y
         AND   #$00FF
         STA   L045683
         BRL   L0455F8
L045662  INY
         LDA   [$3A],Y
         INC
         BRA   L045677
L045668  INY
         LDA   #$0000
         SEP   #$20
         LDA   [$3A],Y
         REP   #$20
         BPL   L045677
         ORA   #$FF00
L045677  SEC
         ADC   $BC
         LDY   $42
         LDX   #$0001
         CLC
         RTS

L045681  DB    $00
         DB    $00
L045683  DB    $00
         DB    $00
L045685  PHP
         REP   #$30
         LDA   #$E040
         STA   $BA
         JSR   L0424AF
         BRA   L045695
L045692  JSR   L0424F2
L045695  BCS   L0456A3
         LDY   #$000E
         LDA   [$A2],Y
         AND   #$7FFF
         STA   [$A2],Y
         BRA   L045692
L0456A3  PLP
         CLC
         RTS

L0456A6  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0002
         JSR   L041ED9
         LDA   L041ABC
         STA   $BE
         STZ   L045863
         LDA   #$E040
         STA   $BA
         JSR   L0424AF
         BRA   L0456C7
L0456C4  JSR   L0424F2
L0456C7  BCS   L04572F
         LDY   #$000E
         LDA   [$A2],Y
         BPL   L0456C4
         LDY   #$0002
         LDA   [$A2],Y
         AND   #$001F
         BEQ   L045723
         CMP   #$0003
         BCS   L0456EA
         LDY   #$0006
         LDA   [$A2],Y
         CMP   $BE
         BEQ   L045723
         BRA   L045707
L0456EA  LDX   L045863
         INX
         INX
         INX
         LDY   #$0006
         LDA   [$A2],Y
         BEQ   L0456F9
         INX
         INX
L0456F9  DEY
         DEY
         LDA   [$A2],Y
         AND   #$FF00
         BEQ   L045704
         INX
         INX
L045704  STX   L045863
L045707  LDY   #$0003
         LDA   [$A2],Y
         AND   #$00FF
         BEQ   L045723
         ADC   #$0007
         ADC   L045863
         CMP   #$FF00
         BCS   L04572F
         STA   L045863
         BCC   L0456C4
         BRA   L04572F
L045723  LDY   #$000E
         LDA   [$A2],Y
         AND   #$7FFF
         STA   [$A2],Y
         BRA   L0456C4
L04572F  STZ   L045867
         STZ   L045869
         STZ   L045865
         LDY   #$0000
         LDX   L045863
         BNE   L045743
         BRL   L0457C8
L045743  LDA   #$8008
         JSR   L041C50
         BCC   L04574E
         BRL   L0457CC
L04574E  STX   L045867
         STY   L045869
         PHB
         PHY
         PLB
         LDA   |$0000,X
         STA   $A6
         LDA   |$0002,X
         STA   $A8
         PLB
         PLB
         JSR   L0424AF
         BRA   L04576B
L045768  JSR   L0424F2
L04576B  BCS   L0457AE
         LDY   #$000E
         LDA   [$A2],Y
         BPL   L045768
         JSR   L041EA4
         BCS   L045768
         LDY   #$0002
         LDA   [$A2],Y
         AND   #$001F
         DEC
         ASL
         ASL
         TAX
         LDY   L045865
         CMP   #$000C
         BCC   L04579A
         PHX
         JSR   L0457E4
         PLX
         JSR   L0457CF
         JSR   L0457FF
         BRA   L0457A0
L04579A  JSR   L0457CF
         JSR   L0457E4
L0457A0  SEP   #$20
         LDA   #$8D
         STA   [$A6],Y
         INY
         REP   #$20
         STY   L045865
         BRA   L045768
L0457AE  LDX   L045867
         LDY   L045869
         PHY
         PHX
         PEA   $0000
         LDA   L045865
         PHA
         PHY
         PHX
         _SetHandleSize
         PLX
         PLY
L0457C8  CLC
         LDA   L045865
L0457CC  JMP   L041F34

L0457CF  LDA   #$00A0
         STA   [$A6],Y
         INY
         LDA   L04586B,X
         STA   [$A6],Y
         INY
         INY
         LDA   L04586B+2,X
         STA   [$A6],Y
         INY
         INY
         RTS

L0457E4  SEP   #$20
         LDA   [$B6]
         STA   L045861
         LDX   #$0001
L0457EE  PHY
         TXY
         LDA   [$B6],Y
         PLY
         STA   [$A6],Y
         INX
         INY
         DEC   L045861
         BNE   L0457EE
         REP   #$20
         RTS

L0457FF  PHY
         LDY   #$0006
         LDA   [$A2],Y
         PHA
         PHA
         PHA
         _HexIt
         PLA
         PLA
         ORA   #$8080
         STA   L04585B
         LDY   #$0004
         LDA   [$A2],Y
         PHA
         PHA
         PHA
         _HexIt
         PLA
         ORA   #$8080
         STA   L04585D
         PLA
         ORA   #$8080
         STA   L04585F
         PLY
         LDA   #$00A4
         STA   [$A6],Y
         INY
         LDA   L04585B
         CMP   #$B0B0
         BEQ   L045847
         STA   [$A6],Y
         INY
         INY
L045847  LDA   L04585D
         CMP   #$B0B0
         BEQ   L045853
         STA   [$A6],Y
         INY
         INY
L045853  LDA   L04585F
         STA   [$A6],Y
         INY
         INY
         RTS

L04585B  DB    $00
         DB    $00
L04585D  DB    $00
         DB    $00
L04585F  DB    $00
         DB    $00
L045861  DB    $00
         DB    $00
L045863  DB    $00
         DB    $00
L045865  DB    $00
         DB    $00
L045867  DB    $00
         DB    $00
L045869  DB    $00
         DB    $00
L04586B  ASC   "EXT "
         ASC   "EXT "
         ASC   "EXD "
         ASC   "EQU "
         ASC   "EQU "
         ASC   "EQU "
         ASC   "EQU "
L045887  ENT
         PHB
         PHK
         PLB
         PHP
         REP   #$30
         LDX   #$0008
         JSR   L041ED9
         LDA   L041ABC
         STA   $A6
         LDA   L041ABE
         STA   $A8
         LDA   L041AC0
         STA   L045913
         LDY   L041AC2
         STY   L045911
         PHY
         INC
         PHA
         PEA   ^L045915
         PEA   L045915
         PEA   ^L045089
         PEA   L045089
         LDX   #$0008
         JSL   L041F18
         JSR   L0458F4
         LDY   L045911
         PHY
         LDA   L045913
         PHA
         PEA   ^L045915
         PEA   L045915
         PEA   ^L045089
         PEA   L045089
         LDX   #$0008
         JSL   L041F18
         JSR   L0458E4
         CLC
         JMP   L041F34

L0458E4  LDA   [$A6]
         AND   #$00FF
         TAY
         SEP   #$20
         LDA   #$AC
         INY
         STA   [$A6],Y
         TYA
         STA   [$A6]
L0458F4  REP   #$20
         LDA   #$0003
         STA   $C2
         LDY   L04591D
         LDA   L04591B
         LDX   L045915
         CPX   #$0003
         BCS   L04590D
         JSR   L043AFF
         RTS

L04590D  JSR   L04433D
         RTS

L045911  DB    $00
         DB    $00
L045913  DB    $00
         DB    $00
L045915  DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L04591B  DB    $00
         DB    $00
L04591D  DB    $00
         DB    $00

L04591F  LDX   #$0000
         HEX   CF
L045923  LDX   #$0006
         LDA   $AE
         STA   L045A67
         LDA   $B0
         STA   L045A69
         LDA   L04594D,X
         TAY
         LDA   [$AE],Y
         STA   L045A73
         STZ   L045A75
         LDA   L04594F,X
         TAY
         LDA   [$AE],Y
         AND   #$00FF
         STA   L045A71
         LDA   L045951,X
         BRA   L045989
L04594D  DB    $00
         DB    $00
L04594F  DB    $01
         DB    $00
L045951  DB    $03
         DB    $00
         DB    $05
         DB    $00
         DB    $00
         DB    $00
         DB    $07
         DB    $00
L045959  LDA   L045A67
         STA   $AE
         LDA   L045A69
         STA   $B0
         SEP   #$40
         CLC
         RTS

L045967  BIT   L045A6D
         BPL   L045959
         LDA   L045A7D
         BNE   L045959
         SEP   #$20
         LDA   L045A6F
         STA   $C4
         STZ   $C5
         REP   #$20
         LDA   L045A71
         STA   $C2
         LDA   L045A7B
         LDY   $42
         CLV
         CLC
         RTS

L045989  STZ   L045A6D
         STZ   L045A6F
         STZ   L045A79
         STZ   L045A7F
L045995  CLC
         ADC   $AE
         STA   $AE
         BCC   L04599E
         INC   $B0
L04599E  LDA   [$AE]
         INC   $AE
         BNE   L0459A6
         INC   $B0
L0459A6  AND   #$00FF
         BEQ   L045967
         CMP   #$0080
         BCC   L045A1C
         AND   #$007F
         CMP   #$0008
         BCC   L0459BD
         JSR   L045959
         SEC
         RTS

L0459BD  ASL
         TAX
         JMP   (L0459C2,X)

L0459C2  DA    L0459D2
         DA    L0459E9
         DA    L045959
         DA    L045959
         DA    L045959
         DA    L045959
         DA    L045959
         DA    L0459E3

L0459D2  LDX   L045A73
         LDY   L045A75
         STZ   L045A6B
         LDA   #$FFFF
         STA   L045A6D
         BRA   L0459F8
L0459E3  LDA   #$FFFF
         STA   L045A6D
L0459E9  LDA   [$AE]
         TAX
         LDY   #$0002
         LDA   [$AE],Y
         TAY
         LDA   #$0004
         STA   L045A6B
L0459F8  BIT   L045A79
         BPL   L045A0E
         STX   L045A81
         STY   L045A83
         LDA   #$FFFF
         STA   L045A7F
L045A09  LDA   L045A6B
         BRA   L045995
L045A0E  STX   L045A7B
         STY   L045A7D
         LDA   #$FFFF
         STA   L045A79
         BRA   L045A09
L045A1C  BIT   L045A7F
         BMI   L045A24
L045A21  BRL   L045959
L045A24  CMP   #$0007
         BEQ   L045A5F
         CMP   #$0001
         BEQ   L045A46
         CMP   #$0002
         BNE   L045A21
         SEC
         LDA   #$0000
         SBC   L045A81
         STA   L045A81
         LDA   #$0000
         SBC   L045A83
         STA   L045A83
L045A46  CLC
         LDA   L045A81
         ADC   L045A7B
         STA   L045A7B
         LDA   L045A83
         ADC   L045A7D
         STA   L045A7D
L045A59  STZ   L045A7F
         BRL   L04599E
L045A5F  LDA   L045A81
         STA   L045A6F
         BRA   L045A59
L045A67  DB    $00
         DB    $00
L045A69  DB    $00
         DB    $00
L045A6B  DB    $00
         DB    $00
L045A6D  DB    $00
         DB    $00
L045A6F  DB    $00
         DB    $00
L045A71  DB    $00
         DB    $00
L045A73  DB    $00
         DB    $00
L045A75  DB    $00
         DB    $00
         DB    $00
         DB    $00
L045A79  DB    $00
         DB    $00
L045A7B  DB    $00
         DB    $00
L045A7D  DB    $00
         DB    $00
L045A7F  DB    $00
         DB    $00
L045A81  DB    $00
         DB    $00
L045A83  DB    $00
         DB    $00
	 
