*
* Bubble Bobble
*
* (c) 1988, Taito
* (s) 2024, Antoine Vignau
*

	mx	%11
	org	$6000
	lst	off

*-----------------------------------
* ENTRY POINT
*-----------------------------------

L6000    JMP   L6310

*-----------------------------------
* DATA
*-----------------------------------

L6003    DB    $07	; This is the delta for the sprites at $9B00 - $6003 = $9400. Why?
L6004    DB    $11
L6005    DB    $00
L6006    DB    $00
L6007    DB    $00
L6008    DB    $00
L6009    DB    $7F
         DB    $77
         DB    $6B
         DB    $55
         DB    $6B
         DB    $77
         DB    $7F
         DB    $00
         DB    $FF
         DB    $D5
         DB    $EB
         DB    $D5
         DB    $EB
         DB    $D5
         DB    $FF
         DB    $00
         DB    $AA
         DB    $D5
         DB    $D5
         DB    $AA
         DB    $D5
         DB    $D5
         DB    $AA
         DB    $00
         DB    $55
         DB    $5D
         DB    $63
         DB    $6B
         DB    $63
         DB    $5D
         DB    $55
         DB    $00
         DB    $D5
         DB    $D5
         DB    $D5
         DB    $D5
         DB    $D5
         DB    $D5
         DB    $D5
         DB    $00
         DB    $AA
         DB    $AA
         DB    $AA
         DB    $AA
         DB    $AA
         DB    $AA
         DB    $AA
         DB    $00
L6039    DB    $00
         DB    $FF
         DB    $02
         DB    $FF
         DB    $00
         DB    $FF
         DB    $02
         DB    $FF
         DB    $00
         DB    $FF
         DB    $02
         DB    $FF
L6045    DB    $04
         DB    $FF
         DB    $04
         DB    $FF
         DB    $04
         DB    $FF
         DB    $04
         DB    $FF
         DB    $04
         DB    $FF
         DB    $04
         DB    $FF
L6051    DB    $06
         DB    $FF
         DB    $06
         DB    $FF
         DB    $06
         DB    $FF
         DB    $06
         DB    $FF
         DB    $06
         DB    $FF
         DB    $06
         DB    $FF
L605D    DB    $08
         DB    $FF
         DB    $0A
         DB    $FF
         DB    $08
         DB    $FF
         DB    $0A
         DB    $FF
         DB    $08
         DB    $FF
         DB    $0A
         DB    $FF
L6069    DB    $04
         DB    $00
         DB    $04
         DB    $00
L606D    DB    $00
         DB    $FE
         DB    $02
L6070    DB    $00
         DB    $FD
         DB    $03
L6073    DB    $00
         DB    $FF
         DB    $01
L6076    DB    $05
         DB    $04
         DB    $03
         DB    $02
         DB    $01
         DB    $00
         DB    $FF
         DB    $FE
         DB    $FD
         DB    $FC
         DB    $FB
L6081    DB    $80
         DB    $00
         DB    $00
         DB    $80
         DB    $FF
         DB    $80
         DB    $80
         DB    $80
         DB    $01
L608A    DB    $80
         DB    $FF
         DB    $01
         DB    $80
         DB    $00
         DB    $80
         DB    $80
         DB    $80
         DB    $00
L6093    DB    $0F
         DB    $0F
         DB    $0F
         DB    $0F
         DB    $10
         DB    $10
         DB    $10
         DB    $11
         DB    $11
         DB    $12
         DB    $16
L609E    DB    $13
         DB    $13
         DB    $13
         DB    $13
         DB    $14
         DB    $14
         DB    $14
         DB    $15
         DB    $15
         DB    $12
         DB    $16
L60A9    DB    $80
         DB    $80
         DB    $80
         DB    $80
         DB    $60
         DB    $60
         DB    $60
         DB    $10
         DB    $10
         DB    $02
         DB    $00
L60B4    DB    $40
         DB    $40
         DB    $40
         DB    $40
         DB    $30
         DB    $30
         DB    $30
         DB    $08
         DB    $08
         DB    $01
         DB    $00
L60BF    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L60D3    DB    $00
         DB    $F9
         DB    $07
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $F9
         DB    $07
L60DC    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $FE
         DB    $02
         DB    $00
L60E3    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L60EB    DB    $00
         DB    $00
         DB    $00
         DB    $00
L60EF    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L60F7    DB    $00
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
         DB    $01
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
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $04
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $06
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $03
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $06
         DB    $04
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $05
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $03
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $05
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $06
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $07
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $02
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
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
         DB    $05
L6196    DB    $00
         DB    $00
         DB    $00
         DB    $03
         DB    $03
         DB    $07
         DB    $07
         DB    $03
         DB    $03
         DB    $03
         DB    $07
         DB    $03
         DB    $07
         DB    $07
         DB    $03
         DB    $07
         DB    $00
         DB    $0B
         DB    $03
         DB    $09
         DB    $07
         DB    $03
         DB    $09
         DB    $03
         DB    $00
         DB    $11
         DB    $03
         DB    $03
         DB    $03
         DB    $03
         DB    $0B
         DB    $00
         DB    $00
         DB    $11
         DB    $03
         DB    $03
         DB    $00
         DB    $11
         DB    $11
         DB    $11
         DB    $03
         DB    $00
         DB    $00
         DB    $03
         DB    $00
         DB    $00
         DB    $00
         DB    $11
         DB    $00
         DB    $03
         DB    $00
         DB    $00
         DB    $00
         DB    $0B
         DB    $00
         DB    $03
         DB    $03
         DB    $03
         DB    $03
         DB    $03
         DB    $03
         DB    $03
         DB    $03
         DB    $11
         DB    $07
         DB    $03
         DB    $03
         DB    $11
         DB    $03
         DB    $00
         DB    $11
         DB    $11
         DB    $00
         DB    $07
         DB    $00
         DB    $00
         DB    $03
         DB    $03
         DB    $03
         DB    $00
         DB    $03
         DB    $11
         DB    $03
         DB    $03
         DB    $03
         DB    $00
         DB    $00
         DB    $03
         DB    $11
         DB    $00
         DB    $11
         DB    $00
         DB    $00
         DB    $00
         DB    $03
         DB    $01
         DB    $10
         DB    $10
         DB    $00
         DB    $11
L61FA    DB    $00
         DB    $00
         DB    $00
         DB    $03
         DB    $03
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $0C
         DB    $03
         DB    $03
         DB    $03
         DB    $08
         DB    $00
         DB    $0C
         DB    $0C
         DB    $03
         DB    $03
         DB    $04
         DB    $03
         DB    $0C
         DB    $00
         DB    $0C
         DB    $0C
         DB    $03
         DB    $0C
         DB    $03
         DB    $03
         DB    $00
         DB    $00
         DB    $03
         DB    $0C
         DB    $0C
         DB    $00
         DB    $04
         DB    $03
         DB    $03
         DB    $03
         DB    $00
         DB    $00
         DB    $01
         DB    $00
         DB    $00
         DB    $00
         DB    $03
         DB    $00
         DB    $03
         DB    $00
         DB    $00
         DB    $00
         DB    $03
         DB    $00
         DB    $03
         DB    $03
         DB    $0C
         DB    $02
         DB    $03
         DB    $03
         DB    $0C
         DB    $08
         DB    $0C
         DB    $08
         DB    $0C
         DB    $03
         DB    $0C
         DB    $03
         DB    $00
         DB    $0C
         DB    $03
         DB    $00
         DB    $02
         DB    $00
         DB    $00
         DB    $03
         DB    $03
         DB    $0C
         DB    $00
         DB    $03
         DB    $03
         DB    $0C
         DB    $03
         DB    $03
         DB    $00
         DB    $00
         DB    $03
         DB    $03
         DB    $00
         DB    $0C
         DB    $00
         DB    $00
         DB    $00
         DB    $02
         DB    $03
         DB    $03
         DB    $08
         DB    $00
         DB    $0C
         DB    $00
L625F    DB    $01
         DB    $02
         DB    $04
         DB    $08
         DB    $10
         DB    $20
         DB    $40
         DB    $80
L6267    DB    $0F
         DB    $FF
         DB    $1D
         DB    $1E
         DB    $1F
         DB    $00
         DB    $00
         DB    $00
L626F    DB    $17
         DB    $18
         DB    $19
         DB    $1A
         DB    $1B
         DB    $1C
         DB    $1A
         DB    $18
L6277    DB    $C0
         DB    $C0
         DB    $F4
         DB    $F4
         DB    $C0
         DB    $C0
         DB    $F4
         DB    $F4
L627F    DB    $2C
         DB    $56
         DB    $2C
         DB    $56
         DB    $2C
         DB    $56
         DB    $2C
         DB    $56
L6287    DB    $FF
         DB    $FF
         DB    $01
         DB    $01
         DB    $FF
         DB    $FF
         DB    $01
         DB    $01
L628F    DB    $5C
         DB    $6A
         DB    $78
         DB    $86
         DB    $94
         DB    $A2
L6295    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L629D    DB    $00
         DB    $00
         DB    $00
         DB    $00
L62A1    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $04
         DB    $04
         DB    $FC
         DB    $FC
         DB    $03
         DB    $03
         DB    $FD
         DB    $FD
L62AD    DB    $03
         DB    $03
         DB    $03
         DB    $03
         DB    $05
         DB    $05
         DB    $05
         DB    $05
         DB    $05
         DB    $05
         DB    $05
         DB    $05
         DB    $05
         DB    $05
         DB    $03
         DB    $03
         DB    $03
         DB    $03
         DB    $00
L62C0    DB    $FD
         DB    $FD
         DB    $FD
         DB    $FD
         DB    $FB
         DB    $FB
         DB    $FB
         DB    $FB
         DB    $FB
         DB    $FB
         DB    $FB
         DB    $FB
         DB    $FB
         DB    $FB
         DB    $FD
         DB    $FD
         DB    $FD
         DB    $FD
         DB    $00
L62D3    DB    $F9
         DB    $F9
         DB    $F9
         DB    $F9
         DB    $F9
         DB    $F9
         DB    $F9
         DB    $F9
         DB    $F9
         DB    $F9
         DB    $F9
         DB    $07
         DB    $07
         DB    $07
         DB    $07
         DB    $07
         DB    $07
         DB    $07
         DB    $07
L62E6    DB    $60
         DB    $58
         DB    $50
         DB    $48
         DB    $40
         DB    $38
         DB    $30
         DB    $28
         DB    $20
         DB    $18
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L630E    DB    $00
L630F    DB    $00

*-----------------------------------
* CODE
*-----------------------------------

L6310    JSR   moveDATA	; move data
         JSR   clearHGRPAGES	; clear HGR pages
L6316    LDA   L6004
         STA   L6007
         STA   L6008
         LDA   #$00
         STA   L630E
         STA   L630F
         STA   $00
         STA   curPLAYER	; player to play
         STA   $90
         STA   L0F60
         STA   L0F5C
         STA   fgSOUND
         STA   L7B2E
         STA   L7B2F
         STA   L7B30
         STA   L7B31
         LDA   #$3C	; 60
         STA   L6005
         STA   L6006

         LDX   #$07
         LDA   #$00
L634D    STA   L6295,X
         STA   L629D,X
         DEX
         BPL   L634D

         STA   SETSTDZP
         LDA   LCBANK2
         LDA   LCBANK2
         JSR   LD000	; load and show welcome title and high scores
         STA   SETSTDZP
         LDA   LCBANK1
         LDA   LCBANK1
         JSR   L7EFE

         LDA   #$00
         STA   P1_LEVEL	; level for P1
         STA   P2_LEVEL	; level for P2
         JSR   L9632

L6377    LDA   #$AA
         STA   L0F52
         STA   L0F53
         LDA   #$0F
         STA   L0F50
         STA   L0F51

         LDA   #$00
         JSR   L8D6A
         LDX   curPLAYER
         LDA   P1_LEVEL,X
         TAX
         STA   SETSTDZP
         LDA   LCBANK2
         LDA   LCBANK2
         LDA   #$02		; load level X
         JSR   loadLEVEL
         STA   SETSTDZP
         LDA   LCBANK1
         LDA   LCBANK1
         LDA   #$00
         STA   KBDSTROBE
         STA   L7B3D
         STA   L0F5B
         STA   L0F5E
         STA   L0F5F
         STA   $80
         STA   L0F62
         STA   $F7
         STA   $DC
         STA   $D9
         STA   $91
         STA   L7B32
         STA   L7B33
         STA   L0F5D
         STA   L102F
         STA   L7D5F
         STA   L7B34
         STA   L7B42
         STA   L7B41
         STA   L7B45
         STA   L7B46
         STA   L7B44
         LDA   #$02
         STA   L7B43
         LDA   #$04
         STA   L0F61
         LDA   #$01
         STA   $9A
         LDA   #$40
         STA   $94
         LDA   #$80
         STA   $DD
         JSR   L678F
         LDA   #$00
         JSR   L7858
         LDA   #$01
         JSR   L7858
         JSR   L81E0
         JSR   L7878
         JSR   switchHGRPAGE
         LDA   #$00
         JSR   L7858
         LDA   #$01
         JSR   L7858
         JSR   L81E0
         JSR   L7878
         JSR   switchHGRPAGE
         JSR   L668C
         JSR   L832F
         LDX   curPLAYER
         LDA   $D7
         CMP   #$64
         BNE   L6437
         LDA   L6005,X
L6437    JSR   L782F
         JSR   switchHGRPAGE
         LDX   curPLAYER
         LDA   $D7
         CMP   #$64
         BNE   L6448
         LDA   L6005,X
L6448    JSR   L782F
         JSR   L832F
         JSR   L671E
         JSR   L68A2
         JSR   L722F
         JSR   switchHGRPAGE
         JSR   L68A2
         JSR   L722F

L6460    LDA   KBD
         BPL   L6488
         CMP   #$9B	; escape?
         BNE   L647B

         LDA   #$00	; PAUSE
         STA   KBDSTROBE
L646E    LDA   KBD
         BPL   L646E
L6473    LDA   #$00
         STA   KBDSTROBE
         JMP   L6488

L647B    CMP   #"S"	; Sound
         BNE   L6473
         LDA   fgSOUND
         EOR   #$01
         STA   fgSOUND
         JMP   L6473

L6488    LDA   L0F5D
         BEQ   L6497
         DEC   L0F5D
         BNE   L6497
         LDA   #$00
         STA   L0F60
L6497    LDA   #$00
         STA   $D5
         JSR   switchHGRPAGE
         LDA   L7B34
         BEQ   L64B7
         JSR   L8D0A
         DEC   L7B34
         LDA   L7B34
         BNE   L64B7
         JSR   switchPAGE
         JSR   L8D0A
         JSR   switchPAGE
L64B7    JSR   L68C7
         JSR   L8876
         JSR   L92F9
         JSR   L6CEA
         JSR   L7269
         JSR   L808E
         JSR   L8E8C
         JSR   L8BBF
         JSR   L8A7B
         JSR   L9044
         JSR   L90A3
         JSR   L8EC2
         JSR   L88AF
         JSR   L932E
         JSR   L8A9D
         JSR   L8C34
         JSR   L6D88
         JSR   L9416
         LDA   $91
         BNE   L6506
         JSR   L68E9
         JSR   L7126
         LDA   $DC
         CMP   #$02
         BNE   L6500
         JMP   L6637

L6500    JSR   L7722
         JSR   L71B9
L6506    JSR   L72B9
         JSR   L6EA5
         JSR   L778D
         JSR   L8D9D
         JSR   L80C4
         JSR   L8150
         LDA   $DC
         CMP   #$03
         BNE   L6521
         JMP   L6655

L6521    JSR   L7F78
         JSR   L7446
         JSR   L84AF
         LDA   curPLAYER
         JSR   L7858
         JSR   L7878
         JSR   L81E0
         JSR   L8211
         LDA   $91
         BNE   L6543
         JSR   L8F32
         LDA   $91
         BEQ   L65BE
L6543    DEC   $92
         BEQ   L6558
         LDA   $92
         AND   #$01
         BNE   L65BE
         LDA   L0F5A
         EOR   #$3E
         STA   L0F5A
         JMP   L65BE

L6558    JSR   switchPAGE
         JSR   L68C7
         LDX   curPLAYER
         LDA   $DE,X
         BPL   L6578
         JSR   clearHGRPAGES
         JSR   L965C
         JSR   L96A3
         BCS   L6578
         LDA   curPLAYER
         EOR   #$01
         TAX
         LDA   $DE,X
         BMI   L6583
L6578    LDA   curPLAYER
         EOR   #$01
         TAX
         LDA   $DE,X
         BMI   L658C
         STX   curPLAYER
L6583    JSR   clearHGRPAGES
         JSR   L9632
         JMP   L6377

L658C    LDX   curPLAYER
         LDA   $DE,X
         BPL   L6595
         JMP   L6316

L6595    LDA   #$AA
         STA   L0F52
         STA   L0F53
         LDA   #$0E
         STA   L0F50
         STA   L0F51
         LDA   #$00
         STA   L0F5A
         JSR   L68A2
         JSR   switchPAGE
         LDA   #$00
         STA   $91
         STA   $80
         LDA   #$40
         STA   $94
         LDA   #$01
         STA   $9A
L65BE    LDA   L7B35
         BEQ   L65C9
         DEC   L7B35
         JSR   L8D22
L65C9    LDA   $D7
         CMP   #$64
         BNE   L65D7
         LDX   curPLAYER
         LDA   L6005,X
         JSR   L782F
L65D7    JSR   L8A7B
         JSR   L8B88
         JSR   L8E52
         JSR   L8057
         JSR   L722F
         JSR   L6CB5
         JSR   L92C3
         JSR   L883C
         JSR   L68A2
         LDA   L7B34
         BEQ   L65FA
         JSR   L8CEB
L65FA    INC   $4E
         LDA   $9A
         CMP   #$02
         BEQ   L6614
         LDA   $D7
         CMP   #$64
         BEQ   L6614
         LDX   $F7
         BMI   L6614
         LDA   L62E6,X
         BEQ   L6614
         JSR   L954E
L6614    LDA   $DC
         BEQ   L6689
         DEC   $DD
         BNE   L6689
         JSR   L68C7
         JSR   L8876
         JSR   L92F9
         JSR   L6CEA
         JSR   L7269
         JSR   L808E
         JSR   L8E8C
         JSR   L8BBF
         JSR   L8A7B
L6637    JSR   switchHGRPAGE
         JSR   L68C7
         JSR   L8876
         JSR   L92F9
         JSR   L6CEA
         JSR   L7269
         JSR   L808E
         JSR   L8E8C
         JSR   L8BBF
         JSR   L8A7B
L6655    LDX   curPLAYER
         INC   P1_LEVEL,X
         INC   $90
         LDA   $90
         CMP   #$04
         BCC   L6665
         LDA   #$00
         STA   $90
L6665    LDA   $D7
         CMP   #$64
         BNE   L6677
         LDX   curPLAYER
         LDA   #$FF
         STA   $DE,X
         JSR   L967F
         JMP   L6578

L6677    LDA   $DC
         CMP   #$02
         BNE   L6686
         JSR   clearHGRPAGES
         JSR   L8C82
         JSR   clearHGRPAGES
L6686    JMP   L6377
L6689    JMP   L6460

L668C    LDA   #$00
         STA   $F0
L6690    LDY   #$08
         LDX   #$0F
L6694    LDA   L1200,Y
         CLC
         ADC   HPAG
         STA   L66BD+2
         LDA   L1300,Y
         STA   L66BD+1
         LDA   L1200,X
         CLC
         ADC   HPAG
         EOR   #$60
         STA   L66BA+2
         LDA   L1300,X
         STA   L66BA+1
         STX   $F3
         LDX   #$26
L66BA    LDA   $FFFF,X
L66BD    STA   $FFFF,X
         DEX
         BNE   L66BA
         LDX   $F3
         INY
         INX
         CPX   #$BF
         BNE   L6694
         LDY   $F0
         LDA   L0EC8,Y
         STA   L66DF+2
         LDA   L0EE4,Y
         STA   L66DF+1
         LDX   #$25
         STX   $E5
         INC   $E5
L66DF    LDA   $FFFF,X
         STA   $EB
         LDY   #$B7
         JSR   L95F2
         DEC   $E5
         DEX
         BPL   L66DF
         JSR   switchHGRPAGE
         INC   $F0
         LDA   $F0
         CMP   #$1A
         BEQ   L66FC
         JMP   L6690

L66FC    LDX   #$20
         LDA   HPAG
         STA   L670E+2
         EOR   #$60
         STA   L670B+2
L6709    LDY   #$00
L670B    LDA   $FF00,Y
L670E    STA   $FF00,Y
         DEY
         BNE   L670B
         INC   L670B+2
         INC   L670E+2
         DEX
         BNE   L6709
         RTS

L671E    LDA   #$5C
         STA   L0F5A
         LDA   #$00
         STA   L0F52
         STA   L0F53
         LDA   #$0E
         STA   L0F50
         STA   L0F51
         LDA   #$04
         STA   L0F59
         JSR   L68A2
         JSR   switchHGRPAGE
         JSR   L68A2
L6741    JSR   L68C7
         LDX   fgPAGE
         LDA   fgPAGE
         EOR   #$01
         TAY
         LDA   L0F52,Y
         CLC
         ADC   L0F59
         STA   L0F52,X
         CMP   #$9A
         BCC   L6763
         LDA   #$AA
         STA   L0F52,X
         LDA   #$00
         STA   L0F59
L6763    JSR   L68A2
         LDA   #$A0
         JSR   L954E
         JSR   switchHGRPAGE
         LDA   L0F52
         CMP   #$AA
         BCC   L6741
         LDA   L0F53
         CMP   #$AA
         BCC   L6741
         LDA   #$80
         STA   $F1
         JSR   L68C7
         JSR   switchHGRPAGE
         JSR   L68C7
         LDA   #$00
         STA   L0F5A
         RTS

L678F    LDY   #$00
         LDX   #$00
L6793    LDA   $0BE0,X
         STA   L0F70,Y
         STA   L0F71,Y
         LDA   $0BE8,X
         STA   L0F80,Y
         STA   L0F81,Y
         LDA   $0BF0,X
         STA   L0FB0,X
         LDA   #$0A
         STA   L0FD8,X
         LDA   #$00
         STA   L0FC8,X
         STA   L0FB8,X
         STA   L0FC0,X
         LDA   L0FB0,X
         CMP   #$C0
         BCS   L67CF
         CMP   #$40
         BCC   L67F3
         CMP   #$50
         BCS   L67EA
         LDA   #$01
         STA   L0FB8,X
L67CF    AND   #$02
         BNE   L67D8
         LDA   #$FF
         STA   L0FB8,X
L67D8    LDA   #$04
         STA   L0FC0,X
         LDA   $0BF8,X
         BPL   L67F3
         LDA   #$FC
         STA   L0FC0,X
         JMP   L67F3

L67EA    CMP   #$B8
         BCC   L67F3
         LDA   #$FE
         STA   L0FB8,X
L67F3    LDA   #$00
         STA   L0FD0,X
         STA   L60E3,X
         STA   L60EB,X
         STA   L60EF,X
         STA   L10A8,X
         STA   L10B0,X
         STA   L10B8,X
         STA   L10C0,X
         STA   L10C8,X
         STA   L10D0,X
         STA   LFCDC,X
         STA   LFCE4,X
         STA   LFCEC,X
         STA   LFCF4,X
         STA   LFCF6,X
         STA   L0C00,X
         STA   L0C08,X
         STA   L0C10,X
         STA   L0C18,X
         STA   L0C20,X
         STA   L1000,X
         STA   L1008,X
         STA   L1020,X
         STA   L1028,X
         STA   L1030,X
         STA   L1038,X
         STA   L1040,X
         STA   L1048,X
         STA   L1050,X
         STA   L1150,X
         STA   L1158,X
         STA   L1170,X
         STA   L1178,X
         STA   L1180,X
         STA   LFCB0,X
         STA   LFCB4,X
         STA   LFCC8,X
         STA   LFCD0,X
         STA   LFCD2,X
         STA   LFF00,X
         STA   LFF08,X
         STA   LFF10,X
         STA   LFF18,X
         LDA   #$FF
         STA   L7B3E
         STA   L0FE0,X
         STA   L0FE8,X
         STA   L0FEC,X
         TXA
         ASL
         ASL
         CLC
         ADC   #$20
         STA   L0FF8,X
         INX
         INY
         INY
         CPX   #$08
         BEQ   L6897
         JMP   L6793

L6897    LDA   $0BDF
         STA   $00
         LDA   $0BDE
         STA   $D7
         RTS

L68A2    LDX   fgPAGE
         LDA   L0F50,X
         STA   $E3
         LDA   L0F52,X
         STA   $E4
         LDA   L0F5A
         CLC
         ADC   fgPAGE
         STA   $E0
         LDA   L0F54,X
         STA   $E8
         LDA   L0F56,X
         STA   $E7
         JSR   L7A88
         JSR   L796A
         RTS

L68C7    LDX   fgPAGE
         LDA   L0F50,X
         STA   $E3
         LDA   L0F52,X
         STA   $E4
         LDA   L0F5A
         CLC
         ADC   fgPAGE
         STA   $E0
         LDA   L0F54,X
         STA   $E8
         LDA   L0F56,X
         STA   $E7
         JSR   L7ADB
         RTS

L68E9    JSR   readINPUT
         LDA   #$00
         STA   L0F59
         LDA   L0F5E
         BNE   L6909
         LDX   theMOVE
         LDA   L0F5C
         BNE   L6903
         LDA   L606D,X
         JMP   L6906

L6903    LDA   L6070,X
L6906    STA   L0F58
L6909    LDA   L0F5B
         BEQ   L6923
         DEC   L0F5B
         LDA   #$F9
         STA   L0F59
         LDA   L0F5B
         BNE   L692F
         LDA   #$02
         STA   L0F5E
         JMP   L692F

L6923    LDA   L0F5E
         CMP   #$02
         BNE   L692F
         LDA   #$07
         STA   L0F59
L692F    LDX   fgPAGE
         LDA   fgPAGE
         EOR   #$01
         TAY
         LDA   L0F52,Y
         CLC
         ADC   L0F59
         CMP   #$BF
         BNE   L6943
         LDA   #$C3
L6943    CMP   #$05
         BNE   L6949
         LDA   #$02
L6949    STA   L0F52,X
         LDA   L0F50,Y
         CLC
         ADC   L0F58
         STA   L0F50,X
         LDA   L0F5E
         BEQ   L696D
         CMP   #$03
         BCS   L696D
         LDX   fgPAGE
         LDY   theMOVE
         LDA   L0F50,X
         CLC
         ADC   L6073,Y
         STA   L0F50,X
L696D    JSR   L6B26
         LDX   fgPAGE
         LDA   L0F50,X
         STA   $E3
         LDA   L0F52,X
         STA   $E4
         CMP   #$B3
         BCS   L69B1
         LDA   #$0A
         STA   $E1
         LDA   L0F5E
         JSR   L69B2
         LDX   fgPAGE
         LDA   $E3
         STA   L0F50,X
         LDA   #$0C
         STA   $E2
         LDA   L0F5E
         JSR   L6A75
         STA   L0F5E
         CMP   #$02
         BNE   L69A7
         LDA   #$00
         STA   L0F58
L69A7    LDA   L0F5F
         CMP   #$01
         BNE   L69B1
         JSR   L6C0D
L69B1    RTS

L69B2    STA   $95
         LDA   #$00
         STA   $D1
         LDA   $E3
         CMP   #$0E
         BCS   L69C3
         LDA   #$0E
         JMP   L69C9

L69C3    CMP   #$75
         BCC   L69CE
         LDA   #$74
L69C9    STA   $E3
         INC   $D1
         RTS

L69CE    LDA   $E4
         CLC
         ADC   #$0B
         TAY
         LDA   L0E00,Y
         TAY
         LDA   L0EC8,Y
         STA   L69FD+2
         STA   L6A11+2
         STA   L6A3E+2
         STA   L6A52+2
         LDA   L0EE4,Y
         STA   L69FD+1
         STA   L6A11+1
         STA   L6A3E+1
         STA   L6A52+1
         LDY   $E3
         LDA   L1400,Y
         TAY
         DEY
L69FD    LDA   $FFFF,Y
         CMP   #$FE
         BEQ   L6A24
         CMP   #$02
         BEQ   L6A10
         CMP   #$10
         BCS   L6A10
         LDA   $95
         BEQ   L6A24
L6A10    INY
L6A11    LDA   $FFFF,Y
         CMP   #$FE
         BEQ   L6A24
         CMP   #$02
         BEQ   L6A33
         CMP   #$10
         BCS   L6A33
         LDA   $95
         BNE   L6A33
L6A24    TYA
         CLC
         ADC   #$02
         TAY
         LDA   L0F00,Y
         STA   $E3
         INC   $D1
         JMP   L6A74

L6A33    LDA   $E3
         CLC
         ADC   $E1
         TAY
         LDA   L1400,Y
         TAY
         DEY
L6A3E    LDA   $FFFF,Y
         CMP   #$FE
         BEQ   L6A65
         CMP   #$02
         BEQ   L6A51
         CMP   #$10
         BCS   L6A51
         LDA   $95
         BEQ   L6A65
L6A51    DEY
L6A52    LDA   $FFFF,Y
         CMP   #$FE
         BEQ   L6A65
         CMP   #$02
         BEQ   L6A74
         CMP   #$10
         BCS   L6A74
         LDA   $95
         BNE   L6A74
L6A65    TYA
         CLC
         ADC   #$01
         TAY
         LDA   L0F00,Y
         SEC
         SBC   $E1
         STA   $E3
         INC   $D1
L6A74    RTS

L6A75    CMP   #$02
         BNE   L6A90
L6A79    STA   $95
         LDA   $E4
         CMP   #$B3
         BCS   L6A8A
         CLC
         ADC   $E2
         TAY
         JSR   L6AD0
         BCS   L6A8D
L6A8A    LDA   $95
         RTS

L6A8D    LDA   #$00
L6A8F    RTS

L6A90    CMP   #$00
         BNE   L6A8F
         LDX   fgPAGE
         LDA   $E4
         CLC
         ADC   $E2
         TAX
         INX
         LDY   L0E00,X
         LDA   L0EC8,Y
         STA   L6AB8+2
         LDA   L0EE4,Y
         STA   L6AB8+1
         LDY   $E3
         LDA   #$03
         STA   theINDEX
         LDX   L1400,Y
         DEX
         LDA   #$00
L6AB8    ORA   $FFFF,X
         INX
         DEC   theINDEX
         BNE   L6AB8
         AND   #$0F
         CMP   #$01
         BEQ   L6ACD
         CMP   #$03
         BCS   L6ACD
         LDA   #$02
         RTS

L6ACD    LDA   #$00
         RTS

L6AD0    LDX   L0E00,Y
         LDA   L0EC8,X
         STA   L6AF8+2
         LDA   L0EE4,X
         STA   L6AF8+1
         INX
         LDA   L0EC8,X
         STA   L6B10+2
         LDA   L0EE4,X
         STA   L6B10+1
         LDY   $E3
         LDA   #$03
         STA   theINDEX
         LDX   L1400,Y
         DEX
         LDA   #$00
L6AF8    ORA   $FFFF,X
         INX
         DEC   theINDEX
         BNE   L6AF8
         AND   #$0F
         BEQ   L6B06
         CLC
         RTS

L6B06    LDY   $E3
         LDA   #$03
         STA   theINDEX
         LDX   L1400,Y
         DEX
L6B10    LDA   $FFFF,X
         AND   #$0F
         CMP   #$01
         BEQ   L6B24
         CMP   #$03
         BCS   L6B24
         INX
         DEC   theINDEX
         BNE   L6B10
         CLC
         RTS

L6B24    SEC
         RTS

L6B26    LDX   L0F5A
         LDA   L0F5F
         CMP   #$01
         BNE   L6B37
         LDA   L605D,X
         STA   L0F5A
         RTS

L6B37    LDA   theMOVE
         BNE   L6B42
         LDA   L6039,X
         STA   L0F5A
         RTS

L6B42    CMP   #$01
         BEQ   L6B4D
         LDA   L6045,X
         STA   L0F5A
         RTS

L6B4D    LDA   L6051,X
         STA   L0F5A
         RTS

*-----------------------
* READ INPUT
*-----------------------

readINPUT
         STA   SETSTDZP
         LDA   RDROM1
         LDA   #$00
         STA   theMOVE
         LDA   $91
         BEQ   L6B65
         JMP   L6BFE

L6B65    LDX   fgPAGE
         LDA   L0F52,X
         CMP   #$B3
         BCC   L6B71
         JMP   L6BFE

L6B71    LDX   #$00	; read joystick X
         JSR   PREAD
         CPY   #$32
         BCS   L6B81
L6B7A    LDA   #$01	; go left
         STA   theMOVE
         JMP   L6B99
L6B81    CPY   #$CD
         BCC   L6B8C
L6B85    LDA   #$02	; go right
         STA   theMOVE
         JMP   L6B99

L6B8C    LDA   KBD
         BPL   L6B99
         CMP   #$88	; left arrow, go left
         BEQ   L6B7A
         CMP   #$95	; right arrow, go right
         BEQ   L6B85

L6B99    LDA   L0F5E
         BNE   L6BCA
         LDA   BUTN0	; jump
         BMI   L6BB0
         LDA   KBD
         BPL   L6BC5
         CMP   #$E1	; a
         BEQ   L6BB0
         CMP   #$C1	; A
         BNE   L6BC5

L6BB0    LDA   L0F62	; activate jump
         BNE   L6BCA
         LDA   #$05
         STA   L0F5B
         LDA   #$01
         STA   L0F5E
         STA   L0F62
         JMP   L6BCA

L6BC5    LDA   #$00	; not a jump
         STA   L0F62

L6BCA    LDA   L0F61
         BEQ   L6BD5
         DEC   L0F61
         JMP   L6BFE

L6BD5    LDA   BUTN1	; blow bubbles?
         BMI   L6BE3
         LDA   KBD
         BPL   L6BF9
         CMP   #" "
         BNE   L6BF9
L6BE3    LDA   L0F5F
         BNE   L6BFE
         LDX   L0F60
         LDA   L6069,X
         STA   L0F61
         LDA   #$01
         STA   L0F5F
         JMP   L6BFE

L6BF9    LDA   #$00
         STA   L0F5F
L6BFE    STA   SETSTDZP
         LDA   LCBANK1
         LDA   LCBANK1
         LDA   #$00
         STA   KBDSTROBE
         RTS

L6C0D    LDA   fgPAGE
         BEQ   L6C12
L6C11    RTS

L6C12    LDA   $D7
         CMP   #$64	; 100
         BNE   L6C1C
         LDA   $80
         BEQ   L6C11
L6C1C    LDA   #$02
         STA   L0F5F
         LDX   #$00
         LDY   #$00
L6C25    LDA   L0C00,X
         ORA   L0C00+1,X
         BEQ   L6C64
         INX
         INX
         INY
         CPX   #$18
         BNE   L6C25
         LDA   #$00
         STA   $F5
         LDY   #$00
L6C3A    LDA   L0FE0,Y
         BPL   L6C4A
         LDA   L0D00,Y
         CMP   $F5
         BCC   L6C4A
         STA   $F5
         TYA
         TAX
L6C4A    INY
         CPY   #$0C
         BNE   L6C3A
         LDA   #$12
         STA   L0CD0,X
         LDA   #$09
         STA   L0D00,X
         LDA   #$00
         STA   L60E3,X
         LDA   #$01
         STA   L0CE8,X
         RTS

L6C64    LDA   #$07
         JSR   LF800
         INC   $F7
         LDA   #$A0
         STA   L0CD0,Y
         LDA   L0F60
         CMP   #$04
         BEQ   L6C7C
         LDA   #$0C
         STA   L0CD0,Y
L6C7C    LDA   #$03
         CLC
         ADC   L0F60
         STA   L0CE8,Y
         LDA   #$00
         STA   L0CB8,Y
         STA   L0D00,Y
         STX   $F3
         LDX   L0F5A
         LDA   L629D,X
         STA   L0CA0,Y
         LDY   fgPAGE
         LDA   L0F50,Y
         CLC
         ADC   L62A1,X
         LDX   $F3
         STA   L0C00,X
         LDA   #$00
         STA   L0C00+1,X
         LDA   L0F52,Y
         STA   L0C28,X
         STA   L0C28+1,X
         RTS

L6CB5    LDY   #$00
         LDX   fgPAGE
L6CB9    LDA   L0C00,X
         BEQ   L6CE2
         STA   $E3
         LDA   L0C28,X
         STA   $E4
         LDA   L0CD0,Y
         STA   $E0
         LDA   L0C50,X
         STA   $E8
         LDA   L0C78,X
         STA   $E7
         STX   $F3
         STY   $F4
         JSR   L7A88
         JSR   L796A
         LDY   $F4
         LDX   $F3
L6CE2    INY
         INX
         INX
         CPY   #$14
         BNE   L6CB9
         RTS

L6CEA    LDY   #$13
         LDA   #$26
         CLC
         ADC   fgPAGE
         TAX
L6CF2    LDA   L0C00,X
         BEQ   L6D18
         STA   $E3
         LDA   L0C28,X
         STA   $E4
         LDA   L0C50,X
         STA   $E8
         LDA   L0C78,X
         STA   $E7
         LDA   L0CD0,Y
         STA   $E0
         STX   $F3
         STY   $F4
         JSR   L7ADB
         LDY   $F4
         LDX   $F3
L6D18    DEY
         DEX
         DEX
         BPL   L6CF2
         JSR   L6D21
         RTS

L6D21    LDY   #$00
         LDX   fgPAGE
L6D25    LDA   L0C00,X
         BEQ   L6D80
         LDA   L0CD0,Y
         CMP   #$0F
         BCC   L6D80
         CMP   #$A0
         BEQ   L6D80
         STY   $F4
         STX   $F3
         LDA   L0C28,X
         CMP   #$C0
         BCS   L6D80
         CLC
         ADC   #$03
         TAX
         LDY   L0E00,X
         LDA   L0EC8,Y
         STA   L6D62+2
         LDA   L0EE4,Y
         STA   L6D62+1
         LDX   $F3
         LDA   L0C00,X
         CLC
         ADC   #$05
         TAY
         LDA   L1400,Y
         STX   $F3
         TAX
L6D62    LDA   $FFFF,X
         AND   #$F0
         LSR
         LSR
         LSR
         LSR
         TAX
         LDY   $F4
         LDA   L6081,X
         CMP   #$80
         BEQ   L6D7E
         STA   L0CA0,Y
         LDA   L608A,X
         STA   L0CB8,Y
L6D7E    LDX   $F3
L6D80    INY
         INX
         INX
         CPY   #$14
         BNE   L6D25
         RTS

L6D88    LDA   #$00
         STA   $F1
         LDY   fgPAGE
         LDA   fgPAGE
         EOR   #$01
         TAX
L6D93    STX   $F3
         LDX   $F1
         LDA   L0D00,X
         CMP   #$09
         BCS   L6DF9
         LDX   $F3
         LDA   L0C00,X
         BEQ   L6DFB
         STX   $F3
         LDX   $F1
         CLC
         ADC   L0CA0,X
         STA   L0C00,Y
         LDX   $F3
         LDA   L0C28,X
         STX   $F3
         LDX   $F1
         CLC
         ADC   L0CB8,X
         STA   L0C28,Y
         LDA   L0CD0,X
         CMP   #$0F
         BCS   L6DF9
         DEC   L0CE8,X
         BNE   L6DF9
         INC   L0CD0,X
         LDA   #$03
         CLC
         ADC   L0F60
         STA   L0CE8,X
         LDA   L0CD0,X
         CMP   #$0F
         BCC   L6DF9
         LDA   #$00
         STA   L0CA0,X
         LDA   #$FE
         STA   L0CB8,X
         LDA   #$80
         STA   L0CE8,X
         LDA   $D7
         CMP   #$64
         BNE   L6DF9
         LDA   #$1E
         STA   L0CD0,X
L6DF9    LDX   $F3
L6DFB    INC   $F1
         INY
         INY
         INX
         INX
         LDA   $F1
         CMP   #$14
         BNE   L6D93
         JSR   L6E0E
         JSR   L766A
         RTS

L6E0E    LDY   #$00
         LDX   fgPAGE
L6E12    LDA   L0CD0,Y
         CMP   #$A0
         BNE   L6E33
         LDA   L0D00,Y
         CMP   #$0A
         BEQ   L6E9A
         LDA   L0C00,X
         CMP   #$0E
         BCC   L6E2B
         CMP   #$75
         BCC   L6E9A
L6E2B    LDA   #$0A
         STA   L0D00,Y
         JMP   L6E9A

L6E33    LDA   L0C00,X
         BEQ   L6E9A
         STA   $E3
         LDA   L0C28,X
         STA   $E4
         CMP   #$B3
         BCS   L6E9A
         LDA   L0CD0,Y
         CMP   #$0F
         BCC   L6E5F
         LDA   L0C00,X
         CMP   #$0E
         BCS   L6E53
         LDA   #$0E
L6E53    CMP   #$75
         BCC   L6E59
         LDA   #$74
L6E59    STA   L0C00,X
         JMP   L6E9A

L6E5F    LDA   #$09
         STA   $E1
         STX   $F3
         STY   $F4
         LDA   #$00
         JSR   L69B2
         LDX   $F3
         LDY   $F4
         LDA   $D1
         BEQ   L6E9A
         LDA   $E3
         STA   L0C00,X
         LDA   L0CD0,Y
         CMP   #$0F
         BCS   L6E9A
         LDA   #$0F
         STA   L0CD0,Y
         LDA   #$00
         STA   L0CA0,Y
         LDA   #$FE
         STA   L0CB8,Y
         LDA   $D7
         CMP   #$64
         BNE   L6E9A
         LDA   #$1E
         STA   L0CD0,Y
L6E9A    INY
         INX
         INX
         CPY   #$14
         BEQ   L6EA4
         JMP   L6E12
L6EA4    RTS

L6EA5    LDY   fgPAGE
         LDX   #$00
L6EA9    LDA   L0C00,Y
         BNE   L6EB1
         JMP   L6F32

L6EB1    LDA   L0CD0,X
         CMP   #$A0
         BEQ   L6EC0
         CMP   #$0F
         BCC   L6F32
         CMP   #$17
         BCS   L6F32
L6EC0    LDA   L0D00,X
         CMP   #$0A
         BCC   L6F32
         LDA   #$04
         JSR   LF800
         STY   $F4
         STX   $F3
         LDA   L60E3,X
         BEQ   L6EDC
         JSR   L7074
         LDX   $F3
         LDY   $F4
L6EDC    TYA
         EOR   #$01
         TAX
         LDA   L0C00,Y
         STA   $E3
         LDA   L0C28,Y
         STA   $E4
         LDA   #$00
         STA   L0C00,Y
         LDA   L0C00,X
         BNE   L6EF6
         DEC   $F7
L6EF6    LDX   $F3
         LDY   $F4
         LDA   L0FE0,X
         BMI   L6F28
         INC   $D5
         DEC   $00
         STX   $F3
         STY   $F4
         TAX
         LDA   #$00
         STA   L0F70,X
         STA   L0F71,X
         LDY   $F3
         LDA   L60E3,Y
         BEQ   L6F1D
         JSR   L6FAF
         JMP   L6F24

L6F1D    JSR   L7026
         DEC   $D5
         INC   $00
L6F24    LDX   $F3
         LDY   $F4
L6F28    LDA   #$00
         STA   L60E3,X
         LDA   #$FF
         STA   L0FE0,X
L6F32    INY
         INY
         INX
         CPX   #$14
         BEQ   L6F3C
         JMP   L6EA9

L6F3C    LDY   fgPAGE
         LDX   #$00
L6F40    LDA   L0C00,Y
         BEQ   L6F9A
         LDA   L0CD0,X
         CMP   #$0F
         BCC   L6F9A
         CMP   #$16
         BCS   L6F9A
         DEC   L0CE8,X
         BNE   L6F9A
         INC   L0D00,X
         STY   $F4
         LDY   L0D00,X
         LDA   L0CD0,X
         CMP   #$13
         BCC   L6F73
         LDA   L609E,Y
         STA   L0CD0,X
         LDA   L60B4,Y
         STA   L0CE8,X
         JMP   L6F7F

L6F73    LDA   L6093,Y
         STA   L0CD0,X
         LDA   L60A9,Y
         STA   L0CE8,X
L6F7F    LDY   $F4
         LDA   L60E3,X
         BEQ   L6F9A
         LDA   L0D00,X
         CMP   #$0A
         BNE   L6F9A
         STX   $F3
         STY   $F4
         LDA   #$00
         JSR   L9473
         LDY   $F4
         LDX   $F3
L6F9A    INY
         INY
         INX
         CPX   #$14
         BNE   L6F40
         LDA   $D5
         BEQ   L6FAE
         CLC
         ADC   #$01
         JSR   L9473
         JSR   L9136
L6FAE    RTS

L6FAF    LDA   #$00
         STA   L0F70,X
         STA   L0F71,X
         LDA   $E4
         CMP   #$BF
         BCS   L6FCB
         STY   $F5
         TAY
         LDA   L0D20,Y
         CLC
         ADC   #$01
         LDY   $F5
         JMP   L6FCD

L6FCB    LDA   #$02
L6FCD    STA   L0F81,X
         STA   L0F80,X
         TXA
         CLC
         ADC   fgPAGE
         TAX
         LDA   $E3
         STA   L0F70,X
         TXA
         LSR
         TAX
L6FE0    LDA   #$F9
         STA   L0FC0,X
         LDA   #$FE
         STA   L0FB8,X
         LDA   $E3
         CMP   #$46
         BCC   L6FF5
         LDA   #$02
         STA   L0FB8,X
L6FF5    LDY   L0FB0,X
         LDA   #$D6
         CPY   #$B8
         BCS   L7001
         LDA   L7B33,Y
L7001    STA   L0FB0,X
         LDA   #$07
         STA   L0FC8,X
         LDA   #$00
         STA   L0FD8,X
         LDA   #$00
         STA   L0FF8,X
         LDA   L7B3D
         BNE   L7022
         LDA   L7B33
         BNE   L7022
         LDA   $D5
         CLC
         ADC   #$66
L7022    STA   L1114,X
         RTS

L7026    LDY   $F4
         TXA
         CLC
         ADC   fgPAGE
         TAX
         LDA   $E3
         STA   L0F70,X
         LDA   L0C28,Y
         CMP   #$C0
         BCS   L7047
         STY   $F5
         TAY
         LDA   L0D20,Y
         CLC
         ADC   #$01
         LDY   $F5
         JMP   L7049

L7047    LDA   #$FB
L7049    STA   L0F80,X
         TXA
         LSR
         TAX
         LDA   #$00
         STA   L0FC8,X
         LDA   #$07
         STA   L0FC0,X
         LDA   #$0A
         STA   L0FD8,X
         LDA   L0FB0,X
         CMP   #$40
         BCC   L7069
         CMP   #$50
         BCC   L7073
L7069    LDA   #$00
         STA   L0FB8,X
         LDA   #$02
         STA   L0FC8,X
L7073    RTS

L7074    LDY   #$00
         LDA   #$FF
L7078    STA   L60BF,Y
         INY
         CPY   #$14
         BNE   L7078
         STX   L60BF
         LDA   #$00
         STA   $F1
         STA   $D0
L7089    LDY   $D0
         LDA   L60BF,Y
         BPL   L7091
         RTS

L7091    ASL
         CLC
         ADC   fgPAGE
         TAX
         LDA   L0C00,X
         STA   $F8
         LDA   L0C28,X
         STA   $F9
         LDA   #$0A
         STA   $FA
         LDA   #$0C
         STA   $FB
         LDY   #$00
         LDX   fgPAGE
L70AC    LDA   L0D00,Y
         CMP   #$09
         BCS   L711A
         LDA   L0CD0,Y
         CMP   #$A0
         BEQ   L711A
         LDA   L0C00,X
         BEQ   L711A
         STA   $FC
         LDA   L0C28,X
         STA   $FD
         LDA   #$0A
         STA   $FE
         LDA   #$0C
         STA   $FF
         JSR   L9513
         BCC   L711A
         LDA   L0CD0,Y
         CMP   #$1D
         BNE   L70E0
         JSR   L87E7
         JMP   L70F7

L70E0    CMP   #$1E
         BNE   L70EA
         JSR   L8A28
         JMP   L70F7

L70EA    CMP   #$1F
         BNE   L70F4
         JSR   L9275
         JMP   L70F7

L70F4    JSR   L82CC
L70F7    LDA   #$12
         STA   L0CD0,Y
         LDA   #$01
         STA   L0CE8,Y
         STA   L60E3,Y
         LDA   #$09
         STA   L0D00,Y
         LDA   #$00
         STA   L0CB8,Y
         STX   $F5
         INC   $F1
         LDX   $F1
         TYA
         STA   L60BF,X
         LDX   $F5
L711A    INX
         INX
         INY
         CPY   #$14
         BNE   L70AC
         INC   $D0
         JMP   L7089

L7126    LDX   fgPAGE
         BEQ   L712B
         RTS

L712B    LDA   L0F52,X
         STA   $F9
         LDA   L0F50,X
         STA   $F8
         LDA   L0F5A
         AND   #$02
         BEQ   L7144
         LDA   L0F50,X
         CLC
         ADC   #$05
         STA   $F8
L7144    LDA   #$05
         STA   $FA
         LDA   #$09
         STA   $FB
         LDA   #$0A
         STA   $FE
         LDA   #$0C
         STA   $FF
         LDX   fgPAGE
         LDY   #$00
L7158    LDA   L0D00,Y
         CMP   #$09
         BCS   L71B1
         LDA   L0CD0,Y
         CMP   #$0F
         BCC   L71B1
         CMP   #$A0
         BEQ   L71B1
         LDA   L0C00,X
         BEQ   L71B1
         STA   $FC
         LDA   L0C28,X
         STA   $FD
         JSR   L9513
         BCC   L71B1
         LDA   L0CD0,Y
         CMP   #$1D
         BNE   L7188
         JSR   L87E7
         JMP   L719F

L7188    CMP   #$1E
         BNE   L7192
         JSR   L8A28
         JMP   L719F

L7192    CMP   #$1F
         BNE   L719C
         JSR   L9275
         JMP   L719F

L719C    JSR   L82CC
L719F    LDA   #$12
         STA   L0CD0,Y
         LDA   #$09
         STA   L0D00,Y
         LDA   #$01
         STA   L0CE8,Y
         STA   L60E3,Y
L71B1    INX
         INX
         INY
         CPY   #$14
         BNE   L7158
         RTS

L71B9    LDX   fgPAGE
         LDA   L0F52,X
         STA   $F9
         LDA   L0F50,X
         STA   $F8
         LDA   #$05
         STA   $FA
         LDA   #$0C
         STA   $FB
         LDA   L0F5A
         AND   #$02
         BNE   L71DC
         LDA   L0F50,X
         CLC
         ADC   #$05
         STA   $F8
L71DC    LDY   #$00
         LDX   fgPAGE
L71E0    LDA   L0CD0,Y
         CMP   #$16
         BEQ   L7227
         CMP   #$0F
         BCC   L7227
         CMP   #$A0
         BEQ   L7227
         LDA   L0C00,X
         BEQ   L7227
         STA   $FC
         LDA   L0C28,X
         STA   $FD
         LDA   #$0A
         STA   $FE
         LDA   #$0C
         STA   $FF
         JSR   L9513
         BCC   L7227
         LDA   L0C00,X
         CLC
         ADC   L0F58
         STA   L0C00,X
         LDA   L0F58
         BNE   L7227
         STX   $F3
         LDX   fgPAGE
         LDA   L0CA0,Y
         CLC
         ADC   L0F50,X
         STA   L0F50,X
         LDX   $F3
L7227    INX
         INX
         INY
         CPY   #$14
         BNE   L71E0
         RTS

L722F    LDX   fgPAGE
         LDY   #$00
L7233    LDA   L0F70,X
         BEQ   L7261
         BMI   L7261
         STA   $E3
         LDA   L0F80,X
         STA   $E4
         LDA   L0FB0,Y
         CLC
         ADC   fgPAGE
         STA   $E0
         LDA   L0F90,X
         STA   $E8
         LDA   L0FA0,X
         STA   $E7
         STX   $F3
         STY   $F4
         JSR   L7A88
         JSR   L796A
         LDY   $F4
         LDX   $F3
L7261    INX
         INX
         INY
         CPY   #$07
         BNE   L7233
         RTS

L7269    LDA   #$0C
         CLC
         ADC   fgPAGE
         TAX
         LDY   #$06
L7271    LDA   L0F70,X
         BEQ   L72B3
         BMI   L72B3
         STA   $E3
         LDA   L0F80,X
         STA   $E4
         LDA   L0FB0,Y
         CLC
         ADC   fgPAGE
         STA   $E0
         LDA   L0F90,X
         STA   $E8
         LDA   L0FA0,X
         STA   $E7
         STX   $F3
         STY   $F4
         JSR   L7ADB
         LDY   $F4
         LDX   $F3
         CPY   #$06
         BNE   L72B3
         LDA   $F3
         EOR   #$01
         TAX
         LDA   L0F70,X
         BNE   L72B1
         LDX   $F3
         LDA   #$00
         STA   L0F70,X
L72B1    LDX   $F3
L72B3    DEX
         DEX
         DEY
         BPL   L7271
         RTS

L72B9    LDA   #$00
         STA   $F1
         LDY   fgPAGE
         LDA   fgPAGE
         EOR   #$01
         TAX
L72C4    STX   $F3
         LDX   $F1
         LDA   L0FC8,X
         LDX   $F3
         CMP   #$09
         BEQ   L72D5
         CMP   #$03
         BNE   L72DD
L72D5    LDA   #$FF
         STA   L0F70,Y
L72DA    JMP   L7367

L72DD    LDA   L0F70,X
         BEQ   L72DA
         BMI   L72DA
         STX   $F3
         LDX   $F1
         LDA   L0FC8,X
         CMP   #$07
         BCS   L7308
         LDA   L0FF8,X
         BEQ   L7308
         DEC   L0FF8,X
         LDX   $F3
         LDA   L0F70,X
         STA   L0F70,Y
         LDA   L0F80,X
         STA   L0F80,Y
         JMP   L7365

L7308    LDX   $F3
         LDA   L0F80,X
         LDX   $F1
         CLC
         ADC   L0FC0,X
         STA   $F5
         LDA   L0FC0,X
         CMP   #$04
         BEQ   L7331
         CMP   #$FC
         BEQ   L7331
         LDA   $F5
         CMP   #$BF
         BNE   L7328
         LDA   #$C3
L7328    CMP   #$05
         BNE   L7333
         LDA   #$02
         JMP   L7333

L7331    LDA   $F5
L7333    STA   L0F80,Y
         LDA   L0FC8,X
         CMP   #$07
         BCS   L7344
         LDA   L0F80,Y
         CMP   #$B3
         BCS   L7354
L7344    LDX   $F3
         LDA   L0F70,X
         STX   $F3
         LDX   $F1
         CLC
         ADC   L0FB8,X
         STA   L0F70,Y
L7354    LDA   L0FC8,X
         CMP   #$01
         BNE   L7365
         DEC   L0FD0,X
         BNE   L7365
         LDA   #$02
         STA   L0FC8,X
L7365    LDX   $F3
L7367    INC   $F1
         INX
         INX
         INY
         INY
         LDA   $F1
         CMP   #$07
         BEQ   L7376
         JMP   L72C4

L7376    JSR   L7380
         JSR   L74D2
         JSR   L83A6
         RTS

L7380    LDA   $D7
         CMP   #$64
         BNE   L7387
         RTS

L7387    LDX   #$00
         LDY   fgPAGE
L738B    LDA   L0FC8,X
         CMP   #$07
         BCS   L7397
         LDA   L0FF8,X
         BEQ   L739A
L7397    JMP   L743B

L739A    LDA   L0FB0,X
         CMP   #$40
         BCC   L73A5
         CMP   #$50
         BCC   L7397
L73A5    LDA   L0F70,Y
         BMI   L7397
         BEQ   L7397
         STA   $E3
         LDA   L0F80,Y
         STA   $E4
         CMP   #$B3
         BCS   L7397
         LDA   #$09
         STA   $E1
         LDA   L0FC8,X
         STX   $F3
         STY   $F4
         JSR   L69B2
         LDY   $F4
         LDX   $F3
         LDA   $D1
         BEQ   L73F6
         LDA   L0FB0,X
         CMP   #$50
         BCC   L73D8
         CMP   #$58
         BCC   L73DD
L73D8    LDA   L0FC8,X
         BNE   L73F6
L73DD    STX   $F3
         LDA   L0FB8,X
         CLC
         ADC   #$05
         TAX
         LDA   L6076,X
         LDX   $F3
         STA   L0FB8,X
         LDA   L0FB0,X
         EOR   #$02
         STA   L0FB0,X
L73F6    LDA   $E3
         STA   L0F70,Y
         LDA   #$0C
         STA   $E2
         LDA   L0FC8,X
         STA   $EB
         STX   $F3
         STY   $F4
         JSR   L6A75
         LDY   $F4
         LDX   $F3
         STA   L0FC8,X
         CMP   #$02
         BNE   L7424
         LDA   $EB
         CMP   #$01
         BCS   L743B
         LDA   #$00
         STA   L0FB8,X
         JMP   L743B

L7424    CMP   #$00
         BNE   L743B
         LDA   #$00
         STA   L0FC0,X
         LDA   $EB
         CMP   #$02
         BNE   L743B
         LDA   L0FB8,X
         BNE   L743B
         JSR   L7541
L743B    INY
         INY
         INX
         CPX   #$06
         BEQ   L7445
         JMP   L738B
L7445    RTS

L7446    LDY   fgPAGE
         LDX   #$00
L744A    LDA   L0FC8,X
         CMP   #$07
         BNE   L7498
         LDA   L0F70,Y
         BEQ   L74C7
         BMI   L74C7
         CMP   #$10
         BCC   L7460
         CMP   #$73
         BCC   L7468
L7460    LDA   L0FB8,X
         EOR   #$80
         STA   L0FB8,X
L7468    STY   $F4
         LDY   L0FD8,X
         LDA   L62D3,Y
         STA   L0FC0,X
         LDA   L0FB8,X
         BMI   L747E
         LDA   L62AD,Y
         JMP   L7481

L747E    LDA   L62C0,Y
L7481    STA   L0FB8,X
         LDY   $F4
         INC   L0FD8,X
         LDA   L0FD8,X
         CMP   #$13
         BNE   L74C7
         LDA   #$08
         STA   L0FC8,X
         JMP   L74C7

L7498    CMP   #$08
         BNE   L74C7
         LDA   L0F70,Y
         STA   $E3
         LDA   L0F80,Y
         STA   $E4
         CMP   #$B3
         BCS   L74C7
         LDA   #$0C
         STA   $E2
         LDA   #$08
         STX   $F3
         STY   $F4
         JSR   L6A79
         LDX   $F3
         LDY   $F4
         CMP   #$00
         BNE   L74C7
         LDA   #$09
         STA   L0FC8,X
         JSR   L8020
L74C7    INY
         INY
         INX
         CPX   #$06
         BEQ   L74D1
         JMP   L744A
L74D1    RTS

L74D2    LDA   $D7
         CMP   #$64
         BNE   L74D9
         RTS

L74D9    LDX   fgPAGE
         LDA   L0F50,X
         STA   $E3
         LDA   L0F52,X
         STA   $E4
         LDX   #$00
         LDY   fgPAGE
L74E9    LDA   L0F70,Y
         BEQ   L7539
         LDA   L0FF8,X
         BNE   L7539
         LDA   L0F80,Y
         CMP   #$B3
         BCS   L7539
         LDA   L0FB0,X
         CMP   #$40
         BCC   L7509
         CMP   #$50
         BCC   L7539
         CMP   #$B8
         BCS   L752B
L7509    LDA   L0FC8,X
         BEQ   L7519
         CMP   #$07
         BCS   L7539
         CMP   #$04
         BCC   L752B
         JMP   L7528

L7519    LDA   $E4
         CMP   L0F80,Y
         BCC   L7528
         BEQ   L7528
         JSR   L7541
         JMP   L752B

L7528    JSR   L7583
L752B    STY   $F4
         LDA   L0FC8,X
         TAY
         LDA   L60D3,Y
         STA   L0FC0,X
         LDY   $F4
L7539    INY
         INY
         INX
         CPX   #$06
         BNE   L74E9
         RTS

L7541    LDA   L0FB0,X
         AND   #$02
         BNE   L754D
         LDA   #$FE
         JMP   L754F

L754D    LDA   #$02
L754F    STA   L0FB8,X
         LDA   L0FB0,X
         AND   #$04
         BEQ   L7568
         LDA   L0FB8,X
         BPL   L7563
         LDA   #$FD
         JMP   L7565

L7563    LDA   #$03
L7565    STA   L0FB8,X
L7568    LDA   L0FB0,X
         CMP   #$50
         BCC   L7582
         CMP   #$B8
         BCS   L7582
         AND   #$02
         BNE   L757D
         LDA   #$04
         STA   L0FC8,X
         RTS

L757D    LDA   #$05
         STA   L0FC8,X
L7582    RTS

L7583    LDA   L0FC8,X
         BEQ   L758B
         JMP   L7607

L758B    STX   $F3
         STY   $F4
         LDA   L0F80,Y
         CLC
         ADC   #$0D
         TAX
         LDY   L0E00,X
         LDA   L0EC8,Y
         STA   L75B0+2
         LDA   L0EE4,Y
         STA   L75B0+1
         LDY   $F4
         LDX   L0F70,Y
         DEX
         DEX
         LDY   L1400,X
         DEY
L75B0    LDA   $FFFF,Y
         AND   #$0F
         LDX   $F3
         LDY   $F4
         CMP   #$03
         BNE   L75D1
         LDA   L0FB0,X
         AND   #$02
         BNE   L75EF
         LDA   L0FB0,X
         AND   #$FD
         STA   L0FB0,X
         LDA   #$04
         JMP   L75E6

L75D1    CMP   #$04
         BNE   L75EF
         LDA   L0FB0,X
         AND   #$02
         BEQ   L75EF
         LDA   L0FB0,X
         ORA   #$02
         STA   L0FB0,X
         LDA   #$05
L75E6    STA   L0FC8,X
         LDA   #$00
         STA   L0FB8,X
         RTS

L75EF    DEC   L0FD8,X
         BMI   L75F7
         JMP   L7541

L75F7    LDA   #$06
         STA   L0FC8,X
         LDA   #$00
         STA   L0FB8,X
         LDA   #$05
         STA   L0FD8,X
         RTS

L7607    LDA   L0FC8,X
         CMP   #$06
         BNE   L7634
         DEC   L0FD8,X
         BMI   L7634
         LDA   L0FD8,X
         CMP   #$02
         BNE   L7669
         LDA   L0F70,Y
         CMP   $E3
         BCC   L7629
         LDA   L0FB0,X
         AND   #$FD
         JMP   L762E

L7629    LDA   L0FB0,X
         ORA   #$02
L762E    STA   L0FB0,X
         JMP   L7669

L7634    STY   $F4
         LDY   L0FC8,X
         LDA   L60DC,Y
         STA   L0FB8,X
         LDA   #$01
         STA   L0FC8,X
         LDA   #$06
         STA   L0FD0,X
         LDA   #$0A
         STA   L0FD8,X
         LDY   $F4
         LDA   L0FB0,X
         CMP   #$50
         BCC   L7669
         LDA   L0FC8,X
         CMP   #$06
         BEQ   L7669
         DEC   L0FD0,X
         DEC   L0FD0,X
         LDA   #$05
         STA   L0FD8,X
L7669    RTS

L766A    LDA   fgPAGE
         BEQ   L766F
         RTS

L766F    LDA   #$0E
         STA   $FA
         STA   $FE
         LDA   #$0D
         STA   $FB
         STA   $FF
         LDY   #$00
         LDX   #$00
L767F    LDA   L0FE0,Y
         BMI   L7687
         JMP   L7717

L7687    LDA   L0CD0,Y
         CMP   #$A0
         BEQ   L7695
         CMP   #$0F
         BCC   L7695
         JMP   L7717

L7695    LDA   L0C00,X
         BEQ   L7717
         STA   $F8
         DEC   $F8
         LDA   L0C28,X
         STA   $F9
         STX   $F3
         STY   $F4
         LDY   #$00
         LDX   #$00
L76AB    LDA   L0F70,X
         STA   $FC
         DEC   $FC
         STA   $E3
         BEQ   L76D7
         ORA   L0F71,X
         BMI   L76D7
         LDA   L0FC8,Y
         CMP   #$07
         BCS   L76D7
         CMP   #$03
         BEQ   L76D7
         LDA   L0FB0,Y
         CMP   #$C0
         BCS   L76D7
         LDA   L0F80,X
         STA   $FD
         JSR   L9513
         BCS   L76E1
L76D7    INX
         INX
         INY
         CPX   #$0C
         BNE   L76AB
         JMP   L7713

L76E1    LDY   $F4
         LDA   L0CD0,Y
         CMP   #$A0
         BNE   L76F7
         TXA
         LSR
         TAX
         INC   $D5
         DEC   $00
         JSR   L6FE0
         JMP   L7713

L76F7    TXA
         STA   L0FE0,Y
         LSR
         TAX
         LDA   #$03
         STA   L0FC8,X
         LDA   #$13
         STA   L0CD0,Y
         LDA   #$80
         STA   L0CE8,Y
         LDX   $F3
         LDA   $FC
         STA   L0C00,X
L7713    LDX   $F3
         LDY   $F4
L7717    INX
         INX
         INY
         CPY   #$0C
         BEQ   L7721
         JMP   L767F
L7721    RTS

L7722    LDA   L0F5E
         CMP   #$02
         BNE   L778C
         LDA   BUTN0
         BPL   L778C
         LDA   #$08
         STA   $FA
         STA   $FE
         LDA   #$06
         STA   $FB
         STA   $FF
         LDX   fgPAGE
         LDA   L0F50,X
         STA   $F8
         INC   $F8
         LDA   L0F52,X
         CLC
         ADC   #$0D
         STA   $F9
         LDX   #$00
         LDY   fgPAGE
L774F    LDA   L0D00,X
         CMP   #$09
         BCS   L7785
         LDA   L0CD0,X
         CMP   #$0F
         BCC   L7785
         CMP   #$A0
         BEQ   L7785
         LDA   L0C00,Y
         BEQ   L7785
         STA   $FC
         LDA   L0C28,Y
         STA   $FD
         JSR   L9513
         BCC   L7785
         LDA   #$05
         STA   L0F5B
         LDA   #$01
         STA   L0F5E
         STA   L0F62
         LDA   #$00
         STA   L0F58
         RTS

L7785    INY
         INY
         INX
         CPX   #$14
         BNE   L774F
L778C    RTS

L778D    LDA   $00
         BEQ   L77B5
         BMI   L77B5
         LDA   fgPAGE
         BNE   L77B5
         INC   $D9
         LDA   $D9
         CMP   #$30
         BNE   L77B5
         LDA   #$00
         STA   $D9
         LDX   #$18
L77A5    LDA   L0C00,X
         BNE   L77AF
         LDA   L0C00+1,X
         BEQ   L77B6
L77AF    INX
         INX
         CPX   #$28
         BNE   L77A5
L77B5    RTS

L77B6    STX   $F3
         LDX   $D7
         LDA   L6196,X
         BEQ   L77B5
L77BF    JSR   L953B
         AND   #$07
         TAX
         STX   $EB
         LDA   L625F,X
         LDX   $D7
         AND   L6196,X
         BEQ   L77BF
         LDX   $EB
         LDA   L6267,X
         STA   $EB
         BPL   L77E5
         JSR   L953B
         AND   #$07
         TAX
         LDA   L626F,X
         STA   $EB
L77E5    JSR   L953B
         AND   #$07
         TAX
         STX   $F5
         LDA   L625F,X
         LDX   $D7
         AND   L61FA,X
         BEQ   L77E5
         LDY   $F5
         LDX   $F3
         LDA   L627F,Y
         STA   L0C00,X
         LDA   L6277,Y
         STA   L0C28,X
         STA   L0C28+1,X
         LDA   #$00
         STA   L0C00+1,X
         TXA
         LSR
         TAX
         LDA   $EB
         STA   L0CD0,X
         LDA   #$00
         STA   L0CA0,X
         LDA   L6287,Y
         STA   L0CB8,X
         LDA   #$80
         STA   L0CE8,X
         LDA   #$00
         STA   L0D00,X
         INC   $F7
         RTS

L782F    LDY   #$00
         STY   theINDEX
L7833    CMP   #$0A
         BCC   L783F
         INC   theINDEX
         SEC
         SBC   #$0A
         JMP   L7833

L783F    STA   $F5
         LDY   #$08
         LDA   #$13
         STA   $E5
         LDA   theINDEX
         LDY   #$08
         JSR   L955A
         INC   $E5
         LDY   #$08
         LDA   $F5
         JSR   L955A
         RTS

L7858    ASL
         ASL
         ASL
         TAX
         ASL
         ASL
         STA   $E5
         LDA   #$08
         STA   theINDEX
L7864    LDY   #$00
         LDA   L0F30,X
         STX   $F3
         JSR   L955A
         LDX   $F3
         INC   $E5
         INX
         DEC   theINDEX
         BNE   L7864
         RTS

L7878    LDX   #$00
         LDA   #$10
         STA   $E5
L787E    LDY   #$00
         LDA   L0F40,X
         STX   $F3
         JSR   L955A
         LDX   $F3
         INC   $E5
         INX
         CPX   #$08
         BNE   L787E
         RTS

*-------------------------------
* MOVE DATA ONCE
*-------------------------------

moveDATA LDX   #$20	; move $2000..$3FFF
         LDA   #$20	; to $9700..$B6FF
         STA   L78A0+2
         LDA   #$97
         STA   L78A3+2
L789E    LDY   #$00
L78A0    LDA   $FF00,Y
L78A3    STA   $FF00,Y
         DEY
         BNE   L78A0
         INC   L78A0+2
         INC   L78A3+2
         DEX
         BNE   L789E

         STA   SETSTDZP
         LDA   LCBANK2	; move $5000..$5FFF
         LDA   LCBANK2	; to $D000..$DFFF
         LDX   #$10
         LDA   #$50
         STA   L78C9+2
         LDA   #$D0
         STA   L78CC+2
L78C7    LDY   #$00
L78C9    LDA   $FF00,Y
L78CC    STA   $FF00,Y
         DEY
         BNE   L78C9
         INC   L78C9+2
         INC   L78CC+2
         DEX
         BNE   L78C7

         STA   SETSTDZP
         LDA   LCBANK1	; move $4500..$47FF
         LDA   LCBANK1	; to $F800..$FAFF
         LDX   #$03
         LDA   #$45	; move $4300..$45FF
         STA   L78FC+2	; to $FB00..$FDFF
         LDA   #$F8
         STA   L78FF+2
         LDA   #$43
         STA   L7902+2
         LDA   #$FB
         STA   L7905+2
L78FA    LDY   #$00
L78FC    LDA   $FF00,Y
L78FF    STA   $FF00,Y
L7902    LDA   $FF00,Y
L7905    STA   $FF00,Y
         DEY
         BNE   L78FC
         INC   L78FC+2
         INC   L78FF+2
         INC   L7902+2
         INC   L7905+2
         DEX
         BNE   L78FA
         RTS

*-------------------------------
* CLEAR HGR PAGES
*-------------------------------

clearHGRPAGES
         LDX   #$40	; clear $40 pages
         LDA   #>HGR1	; from $2000 to $5fff
         STA   L7926+2
         LDA   #$00
L7924    LDY   #$00
L7926    STA   $FF00,Y
         DEY
         BNE   L7926
         INC   L7926+2
         DEX
         BNE   L7924

         LDA   TXTCLR	; show HGR
         LDA   HIRES
         LDA   MIXCLR
         LDA   TXTPAGE1

         LDA   #$00	; index page 1
         STA   fgPAGE
         LDA   #>HGR2	; next is page 2
         STA   HPAG
         RTS

*-------------------------------
* SWITCH PAGE AND HGR
*-------------------------------

switchHGRPAGE
         LDA   fgPAGE	; switch page and HGR page
         EOR   #$01
         STA   fgPAGE
         TAX
         LDA   TXTPAGE1,X
         LDA   HPAG
         EOR   #$60
         STA   HPAG
         RTS

*-------------------------------
* SWITCH PAGE
*-------------------------------

switchPAGE
         LDA   fgPAGE	; switch page only
         EOR   #$01
         STA   fgPAGE
         LDA   HPAG
         EOR   #$60
         STA   HPAG
         RTS

*-------------------------------
* 
*-------------------------------

L796A    LDX   $E0
         LDA   L9700,X	; RAM pointer high
         CLC
         ADC   L6003	; 9400 + 700 = 9B00
         STA   L79C4+2
         LDA   L9800,X	; RAM pointer low
         STA   L79C4+1
         LDA   L9900,X	; X
         STA   $E1
         LDA   L9A00,X	; Y
         STA   $E2
         LDX   $E3
         LDA   L1500,X
         CLC
         ADC   #>L1600
         STA   L79D0+2
         STA   L79D7+2
         LDA   L1400,X
         STA   $E5
L7999    LDX   $E5
         LDA   L1F00,X
         STA   L79DE+1
         LDY   $E4
         LDA   L1200,Y
         CLC
         ADC   HPAG
         STA   $E8
         LDA   L1300,Y
         CLC
         ADC   $E5
         STA   $E7
         LDA   $E1
         STA   theINDEX
         LDA   #$00
         STA   $E6
         LDY   #$00
L79BE    LDA   $E4
         CMP   #$BF
         BCS   L79F5
L79C4    LDA   $FFFF
         TAX
         AND   #$80
         STA   $EF
         TXA
         AND   #$7F
         TAX
L79D0    LDA   $FF00,X
         ORA   $E6
         STA   $EB
L79D7    LDA   $FF80,X
         STA   $E6
         LDX   $EB
L79DE    LDA   L1D00+$FF,X
         AND   ($E7),Y
         ORA   $EB
         ORA   $EF
         STA   ($E7),Y
         INY
         LDA   L79DE+1
         EOR   #$80
         STA   L79DE+1
         STA   L7A09+1
L79F5    INC   L79C4+1
         BNE   L79FD
         INC   L79C4+2
L79FD    DEC   theINDEX
         BNE   L79BE
         LDA   $E4
         CMP   #$BF	; LOGO - 191 lines
         BCS   L7A14
         LDX   $E6
L7A09    LDA   L1D00+$FF,X
         AND   ($E7),Y
         ORA   $E6
         ORA   $EF
         STA   ($E7),Y
L7A14    INC   $E4
         DEC   $E2
         BEQ   L7A1D
         JMP   L7999
L7A1D    RTS

*-------------------------------
* 
*-------------------------------

L7A1E    LDX   $E0
         LDA   L9700,X
         CLC
         ADC   L6003
         STA   L7A5D+2
         LDA   L9800,X
         STA   L7A5D+1
         LDA   L9900,X
         STA   $E1
         LDA   L9A00,X
         STA   $E2
         LDA   #>L1600
         STA   L7A6B+2
         LDA   $E3
         AND   #$01
         BEQ   L7A48
         INC   L7A6B+2
L7A48    LDY   $E4
         LDA   L1200,Y
         CLC
         ADC   HPAG
         STA   $E8
         LDA   L1300,Y
         CLC
         ADC   $E3
         STA   $E7
         LDY   #$00
L7A5D    LDA   $FFFF
         TAX
         AND   #$80
         STA   $EF
         TXA
         AND   #$7F
         TAX
         LDA   $EB
L7A6B    LDA   $FF00,X
         EOR   ($E7),Y
         ORA   $EF
         STA   ($E7),Y
         INC   L7A5D+1
         BNE   L7A7C
         INC   L7A5D+2
L7A7C    INY
         CPY   $E1
         BNE   L7A5D
         INC   $E4
         DEC   $E2
         BNE   L7A48
         RTS

*-------------------------------
* 
*-------------------------------

L7A88    LDX   $E3
         LDA   L1400,X
         STA   $E5
         LDY   $E4
         LDX   $E0
         LDA   L9900,X
         STA   $E1
         INC   $E1
         LDA   L9A00,X
         STA   $E2
         LDA   $E8
         STA   L7AC5+2
         LDA   $E7
         STA   L7AC5+1
L7AA9    LDX   #$00
         CPY   #$BF
         BCS   L7AD5
         LDA   L1200,Y
         CLC
         ADC   HPAG
         STA   L7AC2+2
         LDA   L1300,Y
         CLC
         ADC   $E5
         STA   L7AC2+1
L7AC2    LDA   $FFFF,X
L7AC5    STA   $FFFF
         INC   L7AC5+1
         BNE   L7AD0
         INC   L7AC5+2
L7AD0    INX
         CPX   $E1
         BCC   L7AC2
L7AD5    INY
         DEC   $E2
         BNE   L7AA9
         RTS

*-------------------------------
* 
*-------------------------------

L7ADB    LDX   $E3
         LDA   L1400,X
         STA   $E5
         LDY   $E4
         LDX   $E0
         LDA   L9900,X
         STA   $E1
         INC   $E1
         LDA   L9A00,X
         STA   $E2
         LDA   $E8
         STA   L7B15+2
         LDA   $E7
         STA   L7B15+1
L7AFC    LDX   #$00
         CPY   #$BF
         BCS   L7B28
         LDA   L1200,Y
         CLC
         ADC   HPAG
         STA   L7B18+2
         LDA   L1300,Y
         CLC
         ADC   $E5
         STA   L7B18+1
L7B15    LDA   $FFFF
L7B18    STA   $FFFF,X
         INC   L7B15+1
         BNE   L7B23
         INC   L7B15+2
L7B23    INX
         CPX   $E1
         BCC   L7B15
L7B28    INY
         DEC   $E2
         BNE   L7AFC
         RTS

*-----------------------------------
* DATA
*-----------------------------------

L7B2E    DB    $00
L7B2F    DB    $00
L7B30    DB    $00
L7B31    DB    $00
L7B32    DB    $00
L7B33    DB    $00
L7B34    DB    $00
L7B35    DB    $00
L7B36    DB    $00
         DB    $00
         DB    $00
L7B39    DB    $00
L7B3A    DB    $00
L7B3B    DB    $00
L7B3C    DB    $00
L7B3D    DB    $00
L7B3E    DB    $00
L7B3F    DB    $00
L7B40    DB    $00
L7B41    DB    $00
L7B42    DB    $00
L7B43    DB    $00
L7B44    DB    $00
L7B45    DB    $00
L7B46    DB    $00
L7B47    DB    $00
L7B48    DB    $6D
         DB    $6D
         DB    $6D
         DB    $6D
         DB    $6D
         DB    $70
         DB    $70
         DB    $68
         DB    $6A
         DB    $72
         DB    $6E
         DB    $C8
         DB    $C8
         DB    $C8
         DB    $C8
         DB    $C8
         DB    $C8
         DB    $C8
         DB    $C8
         DB    $CA
         DB    $CA
         DB    $CA
         DB    $CA
         DB    $CA
         DB    $CA
         DB    $CA
         DB    $CA
         DB    $CC
         DB    $CC
         DB    $CC
         DB    $CC
         DB    $CC
         DB    $CC
         DB    $CC
         DB    $CC
         DB    $CE
         DB    $CE
         DB    $CE
         DB    $CE
         DB    $CE
         DB    $CE
         DB    $CE
         DB    $CE
         DB    $D0
         DB    $D0
         DB    $D0
         DB    $D0
         DB    $D0
         DB    $D0
         DB    $D0
         DB    $D0
L7B7B    DB    $D2
         DB    $D2
         DB    $D2
         DB    $D2
         DB    $D2
         DB    $D2
         DB    $D2
         DB    $D2
         DB    $D4
         DB    $D4
         DB    $D4
         DB    $D4
         DB    $D4
         DB    $D4
         DB    $D4
         DB    $D4
L7B8B    DB    $ED
         DB    $ED
         DB    $ED
         DB    $ED
         DB    $ED
         DB    $ED
         DB    $EE
         DB    $EE
         DB    $EE
         DB    $EE
         DB    $EE
         DB    $EE
L7B97    DB    $00
         DB    $28
         DB    $50
         DB    $78
         DB    $A0
         DB    $C8
         DB    $00
         DB    $28
         DB    $50
         DB    $78
         DB    $A0
         DB    $C8
         DB    $D8
         DB    $D8
         DB    $D8
         DB    $D8
         DB    $D8
         DB    $D8
         DB    $D8
         DB    $D8
         DB    $DA
         DB    $DA
         DB    $DA
         DB    $DA
         DB    $DA
         DB    $DA
         DB    $DA
         DB    $DA
         DB    $DC
         DB    $DC
         DB    $DC
         DB    $DC
         DB    $DC
         DB    $DC
         DB    $DC
         DB    $DC
L7BBB    DB    $08
         DB    $0F
         DB    $16
         DB    $1D
         DB    $24
         DB    $2B
         DB    $32
         DB    $39
         DB    $40
         DB    $47
         DB    $4E
         DB    $55
         DB    $5C
         DB    $63
         DB    $6A
         DB    $71
         DB    $78
         DB    $7F
         DB    $86
         DB    $8D
         DB    $94
         DB    $9B
         DB    $A2
         DB    $A9
         DB    $B0
         DB    $B7
L7BD5    DB    $DF
         DB    $DF
         DB    $DF
         DB    $DF
         DB    $DF
         DB    $DF
         DB    $DF
         DB    $E0
         DB    $E0
         DB    $E0
         DB    $E0
         DB    $E0
         DB    $E0
         DB    $E1
         DB    $E1
         DB    $E1
         DB    $E1
         DB    $E1
         DB    $E1
         DB    $E1
         DB    $E2
         DB    $E2
         DB    $E2
         DB    $E2
         DB    $E2
         DB    $E2
         DB    $E3
         DB    $E3
         DB    $E3
         DB    $E3
         DB    $E3
         DB    $E3
         DB    $E4
         DB    $E4
         DB    $E4
         DB    $E4
         DB    $E4
         DB    $E4
         DB    $E4
         DB    $E5
         DB    $E5
         DB    $E5
         DB    $E6
         DB    $E6
L7C01    DB    $00
         DB    $28
         DB    $50
         DB    $78
         DB    $A0
         DB    $C8
         DB    $F0
         DB    $18
         DB    $40
         DB    $68
         DB    $90
         DB    $B8
         DB    $E0
         DB    $08
         DB    $30
         DB    $58
         DB    $80
         DB    $A8
         DB    $D0
         DB    $F8
         DB    $20
         DB    $48
         DB    $70
         DB    $98
         DB    $C0
         DB    $E8
         DB    $10
         DB    $38
         DB    $60
         DB    $88
         DB    $B0
         DB    $D8
         DB    $00
         DB    $28
         DB    $50
         DB    $78
         DB    $A0
         DB    $C8
         DB    $F0
         DB    $18
         DB    $40
         DB    $C0
         DB    $00
         DB    $80
L7C2D    DB    $EF
         DB    $EF
         DB    $EF
         DB    $EF
         DB    $F0
         DB    $F0
         DB    $F0
         DB    $F0
         DB    $F1
         DB    $F1
         DB    $F1
         DB    $F1
         DB    $F2
         DB    $F2
         DB    $F2
         DB    $F2
L7C3D    DB    $00
         DB    $40
         DB    $80
         DB    $C0
         DB    $00
         DB    $40
         DB    $80
         DB    $C0
         DB    $00
         DB    $40
         DB    $80
         DB    $C0
         DB    $00
         DB    $40
         DB    $80
L7C4C    DB    $C0
L7C4D    DB    $F4
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $F4
         DB    $F5
         DB    $F5
         DB    $F5
         DB    $F5
         DB    $F5
         DB    $F5
         DB    $F5
         DB    $F5
         DB    $F6
         DB    $F6
         DB    $F6
         DB    $F6
         DB    $F6
         DB    $F6
         DB    $F6
         DB    $F6
         DB    $F7
         DB    $F7
         DB    $F7
         DB    $F7
         DB    $F7
         DB    $F7
L7C6B    DB    $00
         DB    $20
         DB    $40
         DB    $60
         DB    $80
         DB    $A0
         DB    $C0
         DB    $E0
         DB    $00
         DB    $20
         DB    $40
         DB    $60
         DB    $80
         DB    $A0
         DB    $C0
         DB    $E0
         DB    $00
         DB    $20
         DB    $40
         DB    $60
         DB    $80
         DB    $A0
         DB    $C0
         DB    $E0
         DB    $00
         DB    $20
         DB    $40
         DB    $60
         DB    $80
         DB    $A0
L7C89    DB    $E6
         DB    $E6
         DB    $E6
         DB    $E6
         DB    $E6
         DB    $E6
         DB    $E6
         DB    $E6
         DB    $E6
         DB    $E6
L7C93    DB    $40
         DB    $50
         DB    $60
         DB    $70
         DB    $80
         DB    $90
         DB    $A0
         DB    $B0
         DB    $C0
         DB    $D0
L7C9D    DB    $E6
         DB    $E7
L7C9F    DB    $F0
L7CA0    DB    $70
         DB    $AA
         DB    $AE
         DB    $AF
         DB    $B1
         DB    $B4
         DB    $B4
         DB    $B4
         DB    $B4
         DB    $AC
         DB    $B0
         DB    $B2
         DB    $B3
         DB    $AD
         DB    $AB
         DB    $B4
         DB    $B4
         DB    $B4
         DB    $0D
         DB    $09
         DB    $02
         DB    $02
         DB    $0A
         DB    $04
         DB    $0B
         DB    $0C
         DB    $0D
         DB    $0D
         DB    $0D
         DB    $0D
         DB    $0D
         DB    $0D
         DB    $0D
         DB    $0D
         DB    $0D
         DB    $0D
         DB    $0D
         DB    $0D
         DB    $0D
         DB    $0D
         DB    $0D
         DB    $01
         DB    $01
         DB    $01
         DB    $01
         DB    $0E
         DB    $0E
         DB    $0E
         DB    $0E
         DB    $0E
         DB    $0F
         DB    $0F
         DB    $0F
         DB    $0F
         DB    $0F
         DB    $0A
         DB    $0A
         DB    $0A
         DB    $0A
         DB    $03
         DB    $03
         DB    $03
         DB    $03
         DB    $04
         DB    $01
         DB    $02
         DB    $02
         DB    $02
         DB    $02
         DB    $02
         DB    $09
         DB    $09
         DB    $09
         DB    $09
         DB    $09
         DB    $09
         DB    $01
         DB    $01
         DB    $01
         DB    $11
         DB    $01
         DB    $01
L7CF2    DB    $02
         DB    $66
         DB    $00
         DB    $00
         DB    $00
         DB    $6E
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $6F
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $70
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $71
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $72
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $73
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $74
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $75
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $76
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $77
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L7D3C    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $78
         DB    $79
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $7A
         DB    $7B
         DB    $7C
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L7D57    DB    $09
         DB    $1E
L7D59    DB    $0B
         DB    $1C
L7D5B    DB    $04
         DB    $7E
L7D5D    DB    $01
         DB    $24
L7D5F    DB    $00
L7D60    DB    $0E
         DB    $12
         DB    $15
         DB    $19
         DB    $1C
         DB    $20
         DB    $23
         DB    $27
         DB    $2A
         DB    $2E
         DB    $31
         DB    $35
         DB    $38
         DB    $3C
         DB    $3F
         DB    $43
         DB    $46
         DB    $4A
         DB    $4D
         DB    $51
         DB    $54
         DB    $58
         DB    $5B
         DB    $5F
         DB    $62
         DB    $66
         DB    $69
         DB    $6D
         DB    $70
         DB    $74
         DB    $31
         DB    $3C
L7D80    DB    $12
         DB    $19
         DB    $20
         DB    $27
         DB    $2E
         DB    $35
         DB    $3C
         DB    $43
         DB    $4A
         DB    $51
         DB    $58
         DB    $5F
         DB    $66
         DB    $6D
         DB    $74
         DB    $7B
         DB    $82
         DB    $89
         DB    $90
         DB    $97
         DB    $9E
         DB    $A5
         DB    $AC
         DB    $B3
         DB    $27
         DB    $3C
         DB    $51
         DB    $66
         DB    $7C
         DB    $90
         DB    $A5
         DB    $58
L7DA0    DB    $7D
         DB    $7E
         DB    $7F
         DB    $80
         DB    $81
         DB    $82
         DB    $83
         DB    $84
         DB    $85
         DB    $86
         DB    $87
         DB    $88
         DB    $89
         DB    $8A
         DB    $8B
         DB    $8C
         DB    $8D
         DB    $8E
         DB    $8F
         DB    $90
         DB    $91
         DB    $92
         DB    $95
         DB    $96
         DB    $97
         DB    $98
         DB    $99
         DB    $9A
         DB    $9B
         DB    $9C
         DB    $9D
         DB    $9E
         DB    $9F
         DB    $A6
         DB    $A7
         DB    $A7
         DB    $A8
         DB    $A9
         DB    $78
L7DC7    DB    $20
         DB    $0D
         DB    $0E
         DB    $16
         DB    $20
         DB    $08
         DB    $13
         DB    $20
         DB    $08
         DB    $12
         DB    $20
         DB    $13
         DB    $07
         DB    $04
         DB    $20
         DB    $01
         DB    $04
         DB    $06
         DB    $08
         DB    $0D
         DB    $0D
         DB    $08
         DB    $0D
         DB    $06
         DB    $20
         DB    $0E
         DB    $05
         DB    $20
         DB    $00
         DB    $20
         DB    $20
         DB    $FE
         DB    $05
         DB    $00
         DB    $0D
         DB    $13
         DB    $00
         DB    $12
         DB    $13
         DB    $08
         DB    $02
         DB    $20
         DB    $12
         DB    $13
         DB    $0E
         DB    $11
         DB    $18
         DB    $1C
         DB    $1C
         DB    $20
         DB    $20
         DB    $0B
         DB    $04
         DB    $13
         DB    $1B
         DB    $12
         DB    $20
         DB    $0C
         DB    $00
         DB    $0A
         DB    $04
         DB    $20
         DB    $00
         DB    $FE
         DB    $09
         DB    $0E
         DB    $14
         DB    $11
         DB    $0D
         DB    $04
         DB    $18
         DB    $20
         DB    $13
         DB    $0E
         DB    $20
         DB    $13
         DB    $07
         DB    $04
         DB    $20
         DB    $02
         DB    $00
         DB    $15
         DB    $04
         DB    $20
         DB    $0E
         DB    $05
         DB    $20
         DB    $0C
         DB    $0E
         DB    $0D
         DB    $12
         DB    $13
         DB    $04
         DB    $11
         DB    $12
         DB    $FE
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
         DB    $06
         DB    $0E
         DB    $0E
         DB    $03
         DB    $20
         DB    $0B
         DB    $14
         DB    $02
         DB    $0A
         DB    $1C
         DB    $1C
         DB    $FF
L7E3D    DB    $39
         DB    $3C
         DB    $3F
         DB    $42
         DB    $45
         DB    $45
         DB    $45
         DB    $45
         DB    $42
         DB    $3F
         DB    $3C
         DB    $39
         DB    $36
         DB    $33
         DB    $30
         DB    $2D
         DB    $2D
         DB    $2D
         DB    $2D
         DB    $30
         DB    $33
         DB    $36
L7E53    DB    $3C
         DB    $3C
         DB    $3C
         DB    $41
         DB    $46
         DB    $4B
         DB    $50
         DB    $55
         DB    $5A
         DB    $5F
         DB    $5F
         DB    $5F
         DB    $5F
         DB    $5F
         DB    $5A
         DB    $55
         DB    $50
         DB    $4B
         DB    $46
         DB    $41
         DB    $3C
         DB    $3C
L7E69    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
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
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L7ECD    DB    $0F
         DB    $17
         DB    $1F
         DB    $27
         DB    $2F
         DB    $54
         DB    $5C
         DB    $64
         DB    $6C
         DB    $74
         DB    $12
         DB    $1A
         DB    $22
         DB    $15
         DB    $1D
         DB    $60
         DB    $68
         DB    $70
         DB    $66
         DB    $6E
L7EE1    DB    $8A
         DB    $8A
         DB    $8A
         DB    $8A
         DB    $8A
         DB    $8A
         DB    $8A
         DB    $8A
         DB    $8A
         DB    $8A
         DB    $67
         DB    $67
         DB    $67
         DB    $44
         DB    $44
         DB    $67
         DB    $67
         DB    $67
         DB    $44
         DB    $44
L7EF5    DB    $07
         DB    $14
         DB    $11
         DB    $11
         DB    $18
         DB    $1D
         DB    $14
         DB    $0F
         DB    $FF

*-----------------------------------
* CODE
*-----------------------------------

L7EFE    JSR   clearHGRPAGES
         LDA   L7E3D
         STA   L0F50
         STA   L0F51
         LDA   L7E53
         STA   L0F52
         STA   L0F53
         LDA   #$5C
         STA   L0F5A
         JSR   L7F64
         JSR   L68A2
         JSR   switchHGRPAGE
         JSR   L7F64
         JSR   L68A2

         LDA   #$03	; counters
         STA   $F1
         LDA   #$00
         STA   $93
L7F2F    JSR   L68C7
         INC   $93
         LDA   $93
         CMP   #$16
         BNE   L7F42
         LDA   #$00
         STA   $93
         DEC   $F1
         BMI   L7F60	; exit

L7F42    LDY   fgPAGE
         LDX   $93
         LDA   L7E3D,X
         STA   L0F50,Y
         LDA   L7E53,X
         STA   L0F52,Y
         JSR   L68A2
         LDA   #$A0
         JSR   L954E
         JSR   switchHGRPAGE
         JMP   L7F2F

L7F60    JSR   clearHGRPAGES
         RTS

L7F64    LDA   #$0A
         STA   $E4
         LDA   #$04
         STA   $E5
         LDA   #>L7DC7
         STA   $E8
         LDA   #<L7DC7
         STA   $E7
         JSR   L95AA
         RTS

L7F78    LDA   $00
         BEQ   L7F7F
         BMI   L7F7F
L7F7E    RTS

L7F7F    LDA   $DC
         BNE   L7F7E
         LDA   fgPAGE
         BNE   L7F7E
         LDA   #$01
         STA   $DC
         LDA   L7B42
         BEQ   L7F93
         STA   L7B32
L7F93    LDY   #$00
         LDX   #$00
L7F97    LDA   L0C00,X
         BEQ   L8007
         LDA   L0D00,Y
         CMP   #$0A
         BCS   L8007
         LDA   L0CD0,Y
         CMP   #$A0
         BEQ   L8007
         CMP   #$1E
         BNE   L7FB4
         JSR   L8A28
         JMP   L8007

L7FB4    LDA   #$12
         STA   L0CD0,Y
         LDA   #$09
         STA   L0D00,Y
         LDA   #$01
         STA   L0CE8,Y
         LDA   L7B32
         BNE   L7FD8
         STY   $F4
         LDY   $D7
         LDA   L7CF2,Y
         LDY   $F4
         CMP   #$00
         BEQ   L8007
         STA   L7B32
L7FD8    CPY   #$0C
         BCS   L8007
         LDA   L0C00,X
         STA   L10A8,X
         STY   $F4
         LDY   L0C28,X
         LDA   L0D20,Y
         CLC
         ADC   #$04
         STA   L10D8,X
         STA   L10D9,X
         LDA   L7B32
         LDY   $F4
         STA   L1108,Y
         LDA   #$07
         STA   L1120,Y
         LDA   #$80
         STA   L1138,Y
         INC   $F7
L8007    INX
         INX
         INY
         CPY   #$14
         BNE   L7F97
         LDA   #$01
         STA   L114C
         LDA   L0F60
         CMP   #$03
         BNE   L801F
         LDA   #$00
         STA   L0F60
L801F    RTS

L8020    STY   $F4
         LDA   L0F70,Y
         STA   $E3
         LDA   L0F80,Y
         CLC
         ADC   #$03
         STA   $E4
         TYA
         CLC
         ADC   #$18
         TAY
         LDA   $E3
         STA   L10A8,Y
         TYA
         LSR
         ASL
         TAY
         LDA   $E4
         STA   L10D8,Y
         STA   L10D9,Y
         TYA
         LSR
         TAY
         LDA   #$00
         STA   L1120,Y
         INC   $F7
         LDA   #$3C
         STA   L1138,Y
         LDY   $F4
         RTS

L8057    LDX   #$00
         LDY   fgPAGE
L805B    LDA   L10A8,Y
         BMI   L8086
         BEQ   L8086
         STA   $E3
         LDA   L10D8,Y
         STA   $E4
         LDA   L1108,X
         STA   $E0
         LDA   L7BD5,Y
         STA   $E8
         LDA   L7C01,Y
         STA   $E7
         STX   $F3
         STY   $F4
         JSR   L7A88
         JSR   L796A
         LDY   $F4
         LDX   $F3
L8086    INY
         INY
         INX
         CPX   #$16
         BNE   L805B
         RTS

L808E    LDA   #$2A
         CLC
         ADC   fgPAGE
         TAY
         LDX   #$15
L8096    LDA   L10A8,Y
         BEQ   L80BE
         BMI   L80BE
         STA   $E3
         LDA   L10D8,Y
         STA   $E4
         LDA   L1108,X
         STA   $E0
         LDA   L7BD5,Y
         STA   $E8
         LDA   L7C01,Y
         STA   $E7
         STX   $F3
         STY   $F4
         JSR   L7ADB
         LDY   $F4
         LDX   $F3
L80BE    DEY
         DEY
         DEX
         BPL   L8096
         RTS

L80C4    LDA   #$00
         STA   $F1
         LDX   fgPAGE
         LDA   fgPAGE
         EOR   #$01
         TAY
L80CF    LDA   L10A8,Y
         CMP   #$FF
         BNE   L80F3
         LDA   #$00
         STA   L10A8,X
         STA   L10A8,Y
         STX   $F3
         LDX   $F1
         STA   L1120,X
         CPX   #$14
         BNE   L80EE
         LDA   #$00
         STA   L7D5F
L80EE    LDX   $F3
         JMP   L8109

L80F3    STX   $F3
         LDX   $F1
         LDA   L10D8,Y
         CLC
         ADC   L1120,X
         LDX   $F3
         STA   L10D8,X
         LDA   L10A8,Y
         STA   L10A8,X
L8109    INX
         INX
         INY
         INY
         INC   $F1
         LDA   $F1
         CMP   #$16
         BNE   L80CF
         LDX   #$00
         LDY   fgPAGE
L8119    LDA   L1120,X
         BEQ   L8148
         LDA   L10A8,Y
         STA   $E3
         INC   $E3
         LDA   L10D8,Y
         STA   $E4
         LDA   #$06
         STA   $E1
         LDA   #$09
         STA   $E2
         LDA   #$02
         STX   $F3
         STY   $F4
         JSR   L6A75
         LDX   $F3
         LDY   $F4
         CMP   #$02
         BEQ   L8148
         LDA   #$00
         STA   L1120,X
L8148    INY
         INY
         INX
         CPX   #$0C
         BNE   L8119
         RTS

L8150    LDY   fgPAGE
         BEQ   L8155
         RTS

L8155    LDA   L0F50,Y
         STA   $F8
         INC   $F8
         INC   $F8
         LDA   L0F52,Y
         STA   $F9
         LDA   #$06
         STA   $FA
         LDA   #$0C
         STA   $FB
         LDY   #$00
         LDX   fgPAGE
L816F    LDA   L10A8,X
         BEQ   L81D8
         STA   $FC
         LDA   L10D8,X
         STA   $FD
         LDA   #$09
         STA   $FE
         LDA   #$0A
         STA   $FF
         JSR   L9513
         BCC   L81C6
         LDA   #$FF
         STA   L10A8,X
         LDA   L7B3E
         BPL   L81A8
         STX   $F3
         STY   $F4
         LDX   L1108,Y
         LDA   L7C4C,X
         JSR   L8BF5
         JSR   L9473
         LDY   $F4
         LDX   $F3
         DEC   $F7
L81A8    DEC   L7B3C
         LDA   #$02
         JSR   LF800
         CPY   #$14
         BNE   L81D8
         STX   $F3
         STY   $F4
         JSR   L8610
         LDA   $DC
         BNE   L81DF
         LDX   $F3
         LDY   $F4
         JMP   L81D8

L81C6    LDA   L1138,Y
         BMI   L81D8
         SEC
         SBC   #$01
         STA   L1138,Y
         BNE   L81D8
         LDA   #$FF
         STA   L10A8,X
L81D8    INX
         INX
         INY
         CPX   #$2C
         BCC   L816F
L81DF    RTS

L81E0    LDA   #$00
         STA   theINDEX
L81E4    LDX   theINDEX
         LDA   L7D59,X
         STA   $E5
         LDA   $DE,X
         BMI   L8208
         CMP   #$05
         BCC   L81F5
         LDA   #$05
L81F5    LDY   #$00
         JSR   L955A
         LDX   theINDEX
         LDA   L7D57,X
         STA   $E5
         LDA   #$0A
         LDY   #$00
         JSR   L955A
L8208    INC   theINDEX
         LDA   theINDEX
         CMP   nbPLAYERS
         BNE   L81E4
         RTS

L8211    LDA   $94
         BEQ   L821E
         DEC   $94
         LDA   $9A
         CMP   #$02
         BEQ   L8222
         RTS

L821E    LDA   #$00
         STA   $9A
L8222    LDA   $91
         BNE   L822A
         LDA   fgPAGE
         BEQ   L822B
L822A    RTS

L822B    LDA   L0F50
         STA   $F8
         INC   $F8
         LDA   L0F52
         STA   $F9
         INC   $F9
         LDA   #$0A
         STA   $FA
         STA   $FB
         LDY   #$00
         LDX   #$00
L8243    LDA   L0FC8,Y
         CMP   #$07
         BCS   L82C1
         LDA   L0F70,X
         BMI   L82C1
         BEQ   L82C1
         STA   $E3
         STA   $FC
         LDA   L0F80,X
         STA   $FD
         LDA   #$0A
         STA   $FE
         LDA   #$0C
         STA   $FF
         LDA   $D7
         CMP   #$64
         BNE   L8270
         LDA   #$20
         STA   $FE
         LDA   #$1E
         STA   $FF
L8270    JSR   L9513
         BCC   L82C1
         LDA   $9A
         BEQ   L8297
         STX   L7B3A
         STY   L7B3B
         TXA
         LSR
         TAX
         INC   $D5
         DEC   $00
         JSR   L6FE0
         LDA   #$02
         JSR   L9473
         LDX   L7B3A
         LDY   L7B3B
         JMP   L82C1

L8297    LDA   L0F51
         STA   L0F50
         LDA   L0F53
         STA   L0F52
         INC   $91
         LDA   #$28
         STA   $92
         LDA   #$5E
         STA   L0F5A
         LDX   curPLAYER
         DEC   $DE,X
         INC   L630E,X
         LDA   #$00
         STA   L0F5E
         STA   L0F60
         JSR   L9136
         RTS

L82C1    INX
         INX
         INY
         CPX   #$0E
         BEQ   L82CB
         JMP   L8243
L82CB    RTS

L82CC    LDA   L0CD0,Y
         CMP   #$17
         BCS   L82D4
L82D3    RTS

L82D4    CMP   #$1D
         BCS   L82D3
         STA   $E0
         STX   $98
         STY   $99
         LDA   #$02
         JSR   LF800
         JSR   L8361
         JSR   switchPAGE
         JSR   L8361
         JSR   switchPAGE
         LDA   curPLAYER
         ASL
         ASL
         ASL
         CLC
         ADC   $E0
         SEC
         SBC   #$17
         TAX
         LDA   $E0
         STA   L6295,X
         LDA   curPLAYER
         ASL
         ASL
         ASL
         TAX
         LDY   #$05
L8308    LDA   L6295,X
         BEQ   L832A
         INX
         DEY
         BPL   L8308
         LDA   curPLAYER
         ASL
         ASL
         ASL
         TAX
         LDY   #$08
         LDA   #$00
L831B    STA   L6295,X
         INX
         DEY
         BNE   L831B
         LDX   curPLAYER
         INC   $DE,X
         LDA   #$02
         STA   $DC
L832A    LDX   $98
         LDY   $99
         RTS

L832F    LDA   curPLAYER
         STA   $F5
         LDX   #$07
L8335    LDA   L6295,X
         BEQ   L8347
         STA   $E0
         LDA   #$00
         STA   curPLAYER
         STX   $F3
         JSR   L8361
         LDX   $F3
L8347    LDA   L629D,X
         BEQ   L8359
         STA   $E0
         LDA   #$01
         STA   curPLAYER
         STX   $F3
         JSR   L8361
         LDX   $F3
L8359    DEX
         BPL   L8335
         LDA   $F5
         STA   curPLAYER
         RTS

L8361    LDA   $E0
         SEC
         SBC   #$17
         TAX
         LDA   L628F,X
         STA   $E4
         LDX   curPLAYER
         LDA   L7D5B,X
         STA   $E3
         LDA   L7D5D,X
         STA   $E5
         LDA   #$0E
         STA   $E2
         LDY   $E4
L837E    LDA   L1200,Y
         CLC
         ADC   HPAG
         STA   L8395+2
         LDA   L1300,Y
         CLC
         ADC   $E5
         STA   L8395+1
         LDA   #$00
         LDX   #$00
L8395    STA   $FFFF,X
         INX
         CPX   #$03
         BNE   L8395
         INY
         DEC   $E2
         BNE   L837E
         JSR   L796A
         RTS

L83A6    LDY   #$00
         LDX   fgPAGE
L83AA    LDA   L0FB0,Y
         CMP   #$40
         BCC   L83B9
         CMP   #$50
         BCC   L83BC
         CMP   #$C0
         BCS   L83BC
L83B9    JMP   L84A4

L83BC    LDA   L0FC8,Y
         BNE   L83B9
         LDA   L0FF8,Y
         BNE   L83B9
         LDA   L0F70,X
         BEQ   L83B9
         BMI   L83B9
         STA   $E3
         LDA   L0F80,X
         CMP   #$B3
         BCS   L83B9
         STA   $E4
         LDA   #$09
         STA   $E1
         LDA   $D7
         CMP   #$64
         BNE   L83E6
         LDA   #$1C
         STA   $E1
L83E6    STX   $F3
         STY   $F4
         JSR   L69B2
         LDX   $F3
         LDY   $F4
         LDA   $D1
         BEQ   L8411
         LDA   $E3
         STA   L0F70,X
         LDA   L0FB8,Y
         CLC
         ADC   #$05
         TAX
         LDA   L6076,X
         STA   L0FB8,Y
         LDA   L0FB0,Y
         EOR   #$02
         STA   L0FB0,Y
         LDX   $F3
L8411    STX   $F3
         STY   $F4
         LDX   $E4
         LDY   L0E00,X
         LDA   L0EC8,Y
         STA   L843C+2
         LDA   L0EE4,Y
         STA   L843C+1
         LDY   $E3
         LDA   #$03
         STA   theINDEX
         LDA   $D7
         CMP   #$64
         BNE   L8436
         LDA   #$08
         STA   theINDEX
L8436    LDX   L1400,Y
         DEX
         LDA   #$00
L843C    ORA   $FFFF,X
         INX
         DEC   theINDEX
         BNE   L843C
         CMP   #$FF
         BEQ   L8453
         AND   #$0F
         BEQ   L8453
         LDY   $F4
         LDA   #$04
         STA   L0FC0,Y
L8453    LDA   $E4
         CLC
         ADC   #$0C
         TAX
         LDA   $D7
         CMP   #$64
         BNE   L8464
         TXA
         CLC
         ADC   #$11
         TAX
L8464    LDY   L0E00,X
         LDA   L0EC8,Y
         STA   L8489+2
         LDA   L0EE4,Y
         STA   L8489+1
         LDY   $E3
         LDA   #$03
         STA   theINDEX
         LDA   $D7
         CMP   #$64
         BNE   L8483
         LDA   #$08
         STA   theINDEX
L8483    LDX   L1400,Y
         DEX
         LDA   #$00
L8489    ORA   $FFFF,X
         INX
         DEC   theINDEX
         BNE   L8489
         CMP   #$FF
         BEQ   L84A0
         AND   #$0F
         BEQ   L84A0
         LDY   $F4
         LDA   #$FC
         STA   L0FC0,Y
L84A0    LDX   $F3
         LDY   $F4
L84A4    INX
         INX
         INY
         CPY   #$07
         BEQ   L84AE
         JMP   L83AA
L84AE    RTS

L84AF    LDA   L7D5F
         BNE   L84FF
         LDA   $00
         BEQ   L84FF
         BMI   L84FF
         LDA   $D7
         CMP   #$64
         BNE   L84D5
         LDA   $80
         BNE   L84FF
         LDA   #$44
         STA   $E4
         LDA   #$1E
         STA   $E3
         LDA   #$94
         STA   L7D5F
         JSR   L856F
         RTS

L84D5    LDX   curPLAYER
         LDA   L630E,X
         BNE   L84E8
         LDY   P1_LEVEL,X
         LDA   L7E69,Y
         BEQ   L84E8
         LDX   #$21
         JMP   L8500

L84E8    LDA   L7B41
         BNE   L84FF
         JSR   L953B
         CMP   #$21
         BCS   L84FF
         TAX
         INC   LFCDC,X
         LDA   LFCDC,X
         CMP   #$03
         BCS   L8500
L84FF    RTS

L8500    LDA   L7DA0,X
         STA   L7D5F
         STA   L7B41
         JSR   L850D
         RTS

L850D    JSR   L953B
         AND   #$1F
         TAX
         LDA   L7D60,X
         STA   $E3
         JSR   L953B
         AND   #$1F
         TAX
         LDA   L7D80,X
         STA   $E4
         CLC
         ADC   #$0A
         TAY
         LDX   L0E00,Y
         LDA   L0EC8,X
         STA   L854B+2
         LDA   L0EC8+1,X
         STA   L8560+2
         LDA   L0EE4,X
         STA   L854B+1
         LDA   L0EE4+1,X
         STA   L8560+1
         LDY   $E3
         LDX   L1400,Y
         LDA   #$02
         STA   $F1
L854B    LDA   $FFFF,X
         AND   #$0F
         BNE   L850D
         INX
         DEC   $F1
         BPL   L854B
         LDY   $E3
         LDX   L1400,Y
         LDA   #$02
         STA   $F1
L8560    LDA   $FFFF,X
         AND   #$0F
         BNE   L856F
         INX
         DEC   $F1
         BPL   L8560
         JMP   L850D

L856F    LDX   fgPAGE
         LDA   $E3
         STA   L10D0,X
         LDA   $E4
         STA   L1100
         STA   L1101
         LDA   #$50
         STA   L114C
         LDA   L7D5F
         STA   L111C
         LDA   #$00
         STA   L1134
         INC   $F7
         RTS

L8591    LDY   #$00
         LDX   fgPAGE
L8595    LDA   L0F70,X
         BMI   L85B4
         BEQ   L85B4
         STA   $E3
         STX   L7B3A
         TXA
         LSR
         TAX
         INC   $D5
         DEC   $00
         STY   L7B3B
         JSR   L6FE0
         LDY   L7B3B
         LDX   L7B3A
L85B4    INX
         INX
         INY
         CPY   #$07
         BNE   L8595
         LDX   fgPAGE
         LDY   #$00
L85BF    LDA   L0FE0,Y
         BMI   L85FE
         LDA   L0C00,X
         BEQ   L85FE
         LDA   #$12
         STA   L0CD0,Y
         LDA   #$09
         STA   L0D00,Y
         LDA   #$01
         STA   L0CE8,Y
         LDA   #$00
         STA   L60E3,Y
         LDA   L0C00,X
         STA   $E3
         LDA   L0C28,X
         STA   $E4
         STX   $98
         STY   $99
         LDX   L0FE0,Y
         INC   $D5
         DEC   $00
         JSR   L6FAF
         LDX   $98
         LDY   $99
         LDA   #$FF
         STA   L0FE0,Y
L85FE    INX
         INX
         INY
         CPY   #$0C
         BNE   L85BF
         LDA   $D5
         BEQ   L860F
         CLC
         ADC   #$01
         JSR   L9473
L860F    RTS

L8610    LDA   L1108,Y
         CMP   #$7D
         BCC   L8621
         CMP   #$80
         BCS   L8622
         SEC
         SBC   #$7C
         STA   L0F60
L8621    RTS

L8622    CMP   #$80
         BNE   L862C
         LDA   #$01
         STA   L0F5C
         RTS

L862C    CMP   #$81
         BNE   L863B
L8630    LDX   #$06
         LDA   #$80
L8634    STA   L0FF8,X
         DEX
         BPL   L8634
         RTS

L863B    CMP   #$82
         BNE   L866B
         LDA   #$6D
         STA   L7B32
         STA   L7B3D
         JSR   switchPAGE
         JSR   L8CEB
         JSR   switchPAGE
         JSR   L8591
         LDA   #$01
         STA   $9A
         LDA   #$FF
         STA   $94
         LDA   #$32
         STA   L7B34
         LDX   #$10
L8662    LDA   #$05
         JSR   LF800
         DEX
         BNE   L8662
         RTS

L866B    CMP   #$86
         BCS   L8681
         SEC
         SBC   #$82
         ASL
         LDX   curPLAYER
         CLC
         ADC   P1_LEVEL,X
         STA   P1_LEVEL,X
         LDA   #$01
         STA   $DC
         STA   $DD
         RTS

L8681    CMP   #$8B
         BNE   L8691
         JSR   L8630
         LDA   #$FF
         STA   $94
         LDA   #$02
         STA   $9A
         RTS

L8691    CMP   #$90
         BNE   L86A0
L8695    LDA   #$03
         STA   L0F60
         LDA   #$01
         STA   L0F5C
         RTS

L86A0    CMP   #$92
         BEQ   L8695
         CMP   #$8E
         BEQ   L86AC
         CMP   #$91
         BNE   L86B7
L86AC    LDA   #$04
         STA   L0F60
         LDA   #$96
         STA   L0F5D
         RTS

L86B7    CMP   #$8C
         BNE   L86D9
         LDA   #$6D
         STA   L7B3D
         STA   L7B32
         JSR   L8591
         LDA   #$02
         STA   L7B35
         LDA   #$01
         STA   $9A
         LDA   #$FF
         STA   $94
         LDA   #$01
         JSR   L8D6A
         RTS

L86D9    CMP   #$94
         BNE   L86E2
         LDA   #$01
         STA   $80
         RTS

L86E2    CMP   #$A6
         BEQ   L86E9
         JMP   L876D

L86E9    JSR   clearHGRPAGES
         STA   SETSTDZP
         LDA   LCBANK2
         LDA   LCBANK2
         LDA   fgPAGE		; load boss1/boss2 picture
         EOR   #$01
         JSR   loadLEVEL
         JSR   switchHGRPAGE
         LDA   fgPAGE
         EOR   #$01
         JSR   loadLEVEL	; load boss2/boss1 picture
         LDA   #$02
         LDX   #$65
         JSR   loadLEVEL	; load level boss
         STA   SETSTDZP
         LDA   LCBANK1
         LDA   LCBANK1
         JSR   L678F
         LDA   #$87
         STA   L0F52
         STA   L0F53
         LDA   #$41
         STA   L0F50
         STA   L0F51
         LDA   #$00
         STA   L0F5E
         LDA   #$14
         STA   L7B3C
         LDY   #$00
         LDX   #$00
L8737    LDA   L7ECD,Y
         STA   L10A8,X
         STA   L10A9,X
         LDA   L7EE1,Y
         STA   L10D8,X
         STA   L10D9,X
         LDA   #$A3
         STA   L1108,Y
         LDA   #$FF
         STA   L1138,Y
         INX
         INX
         INY
         CPY   #$14
         BNE   L8737
         LDA   #$01
         JSR   L8D6A
         JSR   L8F9C
         JSR   L8FEB
         JSR   clearHGRPAGES
         LDA   #$03
         STA   $DC
         RTS

L876D    CMP   #$95
         BCC   L8780
         CMP   #$A0
         BCS   L8780
         SEC
         SBC   #$95
         TAX
         LDA   L7B48,X
         STA   L7B42
         RTS

L8780    CMP   #$86
         BCC   L87E6
         CMP   #$8B
         BCS   L87E6
         TAX
         LDA   L7D3C,X
         STA   L7B40
         JSR   switchHGRPAGE
         JSR   L678F
         LDA   #>HGR2
         STA   L87A3+2
         LDA   #>HGR1
         STA   L87A6+2
         LDX   #$20
L87A1    LDY   #$00
L87A3    LDA   $FF00,Y
L87A6    STA   $FF00,Y
         INY
         BNE   L87A3
         INC   L87A3+2
         INC   L87A6+2
         DEX
         BNE   L87A1
         JSR   L914E
         JSR   L8F9C
         JSR   L8FD1
         LDA   L7B3C
         BNE   L87CB
         LDA   #$12
         JSR   L9473
         JMP   L87DE

L87CB    LDA   #$15
         SEC
         SBC   L7B3C
         STA   L7B3C
L87D4    LDA   #$13
         JSR   L9473
         DEC   L7B3C
         BNE   L87D4
L87DE    JSR   clearHGRPAGES
         LDA   #$03
         STA   $DC
         RTS
L87E6    RTS

L87E7    LDA   L102F
         BEQ   L87ED
         RTS

L87ED    STX   $98
         STY   $99
         LDA   L0C28,X
         CLC
         ADC   #$07
         TAY
         LDA   L0D20,Y
         STA   $E4
         LDY   L0C00,X
         LDA   L1400,Y
         STA   $E3
         INC   $E3
         LDX   #$00
L8809    LDA   $E3
         STA   L1000,X
         LDA   $E4
         STA   L1010,X
         INX
         INX
         CPX   #$08
         BNE   L8809
         LDX   $98
         LDY   $99
         LDA   #$00
         STA   L102E
         LDA   #$07
         STA   L101F
         LDA   #$01
         STA   L100F
         LDA   L0F5A
         AND   #$02
         BNE   L8838
         LDA   #$FF
         STA   L100F
L8838    INC   L102F
         RTS

L883C    LDA   L102F
         BNE   L8842
         RTS

L8842    LDX   fgPAGE
L8844    LDY   L1000,X
         BEQ   L886F
         LDA   L0F01,Y
         STA   $E3
         LDA   L1010,X
         STA   $E4
         LDA   #$A1
         STA   $E0
         LDA   L7C89,X
         STA   $E8
         LDA   L7C93,X
         STA   $E7
         STX   $F3
         STY   $F4
         JSR   L7A88
         JSR   L796A
         LDY   $F4
         LDX   $F3
L886F    INX
         INX
         CPX   #$0A
         BCC   L8844
         RTS

L8876    LDA   L102F
         BNE   L887C
         RTS

L887C    LDA   fgPAGE
         CLC
         ADC   #$08
         TAX
L8882    LDY   L1000,X
         BEQ   L88AA
         LDA   L0F01,Y
         STA   $E3
         LDA   L1010,X
         STA   $E4
         LDA   #$A1
         STA   $E0
         LDA   L7C89,X
         STA   $E8
         LDA   L7C93,X
         STA   $E7
         STX   $F3
         STY   $F4
         JSR   L7ADB
         LDY   $F4
         LDX   $F3
L88AA    DEX
         DEX
         BPL   L8882
         RTS

L88AF    LDA   L102F
         BEQ   L88C3
         LDA   fgPAGE
         EOR   #$01
         TAX
         LDA   L1000,X
         BNE   L88C4
         LDA   #$00
         STA   L102F
L88C3    RTS

L88C4    LDX   fgPAGE
         LDA   fgPAGE
         EOR   #$01
         TAY
         LDA   L102E
         BNE   L88D6
         LDA   L1000,Y
         JMP   L88DD

L88D6    LDA   L1000,Y
         CLC
         ADC   L100F
L88DD    STA   L1000,X
         LDA   L1010,Y
         CLC
         ADC   L101F
         STA   L1010,X
         LDX   fgPAGE
L88EC    INX
         INX
         LDA   L1000,Y
         STA   L1000,X
         LDA   L1010,Y
         STA   L1010,X
         INY
         INY
         CPY   #$0A
         BCC   L88EC
         JSR   L898A
         LDX   fgPAGE
         LDA   L1018,X
         CMP   #$B9
         BCC   L891A
         LDX   fgPAGE
         LDA   #$00
L8910    STA   L1000,X
         INX
         INX
         CPX   #$0A
         BCC   L8910
         RTS

L891A    LDA   #$01
         STA   $FA
         LDA   #$07
         STA   $FB
         LDA   #$0A
         STA   $FE
         LDA   #$0C
         STA   $FF
         LDY   fgPAGE
L892C    LDX   L1000,Y
         BEQ   L8979
         LDA   L0F01,X
         STA   $F8
         LDA   L1010,Y
         STA   $F9
         STY   $99
         LDX   #$00
         LDY   fgPAGE
L8941    LDA   L0F70,Y
         BEQ   L8970
         BMI   L8970
         STA   $FC
         STA   $E3
         LDA   L0FC8,X
         CMP   #$07
         BCS   L8970
         LDA   L0F80,Y
         STA   $FD
         JSR   L9513
         BCC   L8970
         INC   $D5
         DEC   $00
         STX   L7B3A
         STY   L7B3B
         JSR   L6FE0
         LDY   L7B3B
         LDX   L7B3A
L8970    INY
         INY
         INX
         CPX   #$07
         BNE   L8941
         LDY   $99
L8979    INY
         INY
         CPY   #$0A
         BCC   L892C
         LDA   $D5
         BEQ   L8989
         CLC
         ADC   #$01
         JSR   L9473
L8989    RTS

L898A    LDX   fgPAGE
         LDY   L1010,X
         CPY   #$BE
         BCC   L8994
         RTS

L8994    LDX   L0E00,Y
         LDA   L0EC8,X
         STA   L89C5+2
         STA   L8A15+2
         LDA   L0EC8+1,X
         STA   L89CC+2
         STA   L89F6+2
         LDA   L0EE4,X
         STA   L89C5+1
         STA   L8A15+1
         LDA   L0EE4+1,X
         STA   L89CC+1
         STA   L89F6+1
         LDA   L102E
         BNE   L89DE
         LDY   fgPAGE
         LDX   L1000,Y
L89C5    LDA   $FFFF,X
         AND   #$0F
         BNE   L89DD
L89CC    LDA   $FFFF,X
         AND   #$0F
         BEQ   L89DD
         LDA   #$01
         STA   L102E
         LDA   #$00
         STA   L101F
L89DD    RTS

L89DE    LDY   fgPAGE
         LDX   L1000,Y
         LDA   L100F
         BNE   L89F6
         LDA   #$01
         STA   L100F
         CPX   #$14
         BCS   L89F6
         LDA   #$FF
         STA   L100F
L89F6    LDA   $FFFF,X
         AND   #$0F
         BNE   L8A0B
         LDA   #$00
         STA   L102E
         STA   L100F
         LDA   #$07
         STA   L101F
         RTS

L8A0B    LDY   fgPAGE
         LDA   L1000,Y
         CLC
         ADC   L100F
         TAX
L8A15    LDA   $FFFF,X
         AND   #$0F
         BEQ   L89DD
         LDA   L100F
         EOR   #$FF
         STA   L100F
         INC   L100F
         RTS

L8A28    STX   $98
         STY   $99
         LDY   L0C00,X
         LDA   L1400,Y
         STA   $E3
         DEC   $E3
         LDA   L0C28,X
         STA   $E4
         INC   $E4
         LDX   #$00
L8A3F    LDA   L1030,X
         ORA   L1031,X
         BEQ   L8A50
         INX
         INX
         CPX   #$28
         BNE   L8A3F
         JMP   L8A76

L8A50    LDA   $E4
         STA   L1058,X
         STA   L1059,X
         TXA
         CLC
         ADC   fgPAGE
         TAX
         LDA   $E3
         STA   L1030,X
         TXA
         LSR
         TAX
         LDA   #$01
         STA   L1080,X
         LDA   L0F5A
         AND   #$02
         BNE   L8A76
         LDA   #$FF
         STA   L1080,X
L8A76    LDX   $98
         LDY   $99
         RTS

L8A7B    LDX   fgPAGE
L8A7D    LDA   L1030,X
         BEQ   L8A96
         BMI   L8A96
         STA   $E3
         LDA   L1058,X
         STA   $E4
         LDA   #$A2
         STA   $E0
         STX   $F3
         JSR   L7A1E
         LDX   $F3
L8A96    INX
         INX
         CPX   #$28
         BCC   L8A7D
         RTS

L8A9D    LDA   #$00
         STA   $F1
         LDX   fgPAGE
         LDA   fgPAGE
         EOR   #$01
         TAY
L8AA8    LDA   L1030,Y
         BEQ   L8AD4
         BPL   L8ABA
         LDA   #$00
         STA   L1030,X
         STA   L1030,Y
         JMP   L8AD4

L8ABA    STX   $F3
         LDX   $F1
         CLC
         ADC   L1080,X
         LDX   $F3
         STA   L1030,X
         CMP   #$03
         BCC   L8ACF
         CMP   #$23
         BCC   L8AD4
L8ACF    LDA   #$FF
         STA   L1030,X
L8AD4    INX
         INX
         INY
         INY
         INC   $F1
         CPX   #$28
         BCC   L8AA8
         LDA   #$0A
         STA   $FA
         STA   $FE
         LDA   #$0C
         STA   $FB
         STA   $FF
         LDA   $D7
         CMP   #$64
         BNE   L8AF8
         LDA   #$1C
         STA   $FE
         LDA   #$1E
         STA   $FF
L8AF8    LDY   fgPAGE
L8AFA    LDX   L1030,Y
         BEQ   L8B74
         BMI   L8B74
         LDA   L0F01,X
         STA   $F8
         LDA   L1058,Y
         STA   $F9
         STY   $99
         LDX   #$00
         LDY   fgPAGE
L8B11    LDA   L0F70,Y
         BEQ   L8B6B
         BMI   L8B6B
         STA   $FC
         STA   $E3
         LDA   L0FC8,X
         CMP   #$07
         BCS   L8B6B
         LDA   L0F80,Y
         STA   $FD
         JSR   L9513
         BCC   L8B6B
         LDA   $D7
         CMP   #$64
         BNE   L8B5D
         STX   L7B39
         LDX   curPLAYER
         DEC   L6005,X
         LDA   L6005,X
         LDX   L7B39
         CMP   #$00
         BNE   L8B53
         LDA   #$09
         STA   L0FC8,X
         INC   $D5
         DEC   $00
         LDA   #$10
         JSR   L9473
L8B53    LDY   $99
         LDA   #$FF
         STA   L1030,Y
         JMP   L8B72

L8B5D    INC   $D5
         DEC   $00
         STX   $98
         JSR   L6FE0
         LDX   $98
         JMP   L8B72

L8B6B    INX
         INY
         INY
         CPX   #$07
         BNE   L8B11
L8B72    LDY   $99
L8B74    INY
         INY
         CPY   #$28
         BCS   L8B7D
         JMP   L8AFA

L8B7D    LDA   $D5
         BEQ   L8B87
         CLC
         ADC   #$01
         JSR   L9473
L8B87    RTS

L8B88    LDX   #$00
         LDY   fgPAGE
L8B8C    LDA   L1150,Y
         BEQ   L8BB7
         BMI   L8BB7
         STA   $E3
         LDA   L1160,Y
         STA   $E4
         LDA   L1170,X
         STA   $E0
         LDA   L7C2D,Y
         STA   $E8
         LDA   L7C3D,Y
         STA   $E7
         STX   $F3
         STY   $F4
         JSR   L7A88
         JSR   L796A
         LDY   $F4
         LDX   $F3
L8BB7    INY
         INY
         INX
         CPX   #$08
         BNE   L8B8C
         RTS

L8BBF    LDA   #$0E
         CLC
         ADC   fgPAGE
         TAY
         LDX   #$07
L8BC7    LDA   L1150,Y
         BEQ   L8BEF
         BMI   L8BEF
         STA   $E3
         LDA   L1160,Y
         STA   $E4
         LDA   L1170,X
         STA   $E0
         LDA   L7C2D,Y
         STA   $E8
         LDA   L7C3D,Y
         STA   $E7
         STX   $F3
         STY   $F4
         JSR   L7ADB
         LDY   $F4
         LDX   $F3
L8BEF    DEY
         DEY
         DEX
         BPL   L8BC7
         RTS

L8BF5    STA   $F5
         LDX   #$00
         LDY   fgPAGE
L8BFB    LDA   L1150,Y
         BNE   L8C2A
         LDA   L1151,Y
         BNE   L8C2A
         LDA   $FC
         STA   L1150,Y
         LDA   $FD
         SEC
         SBC   #$03
         STA   L1160,Y
         STA   L1161,Y
         LDY   $F5
         LDA   L7CA0,Y
         STA   L1170,X
         LDA   #$0A
         STA   L1178,X
         LDA   #$FE
         STA   L1180,X
         JMP   L8C31

L8C2A    INY
         INY
         INX
         CPX   #$08
         BNE   L8BFB
L8C31    LDA   $F5
         RTS

L8C34    LDA   #$00
         STA   $F1
         LDX   fgPAGE
         LDA   fgPAGE
         EOR   #$01
         TAY
L8C3F    LDA   L1150,Y
         BEQ   L8C77
         BPL   L8C51
         LDA   #$00
         STA   L1150,X
         STA   L1150,Y
         JMP   L8C77

L8C51    STA   L1150,X
         LDA   L1160,Y
         STX   $F3
         LDX   $F1
         CLC
         ADC   L1180,X
         LDX   $F3
         STA   L1160,X
         LDX   $F1
         DEC   L1178,X
         LDA   L1178,X
         LDX   $F3
         CMP   #$00
         BNE   L8C77
         LDA   #$FF
         STA   L1150,X
L8C77    INX
         INX
         INY
         INY
         INC   $F1
         CPX   #$10
         BCC   L8C3F
         RTS

L8C82    LDY   #$00
L8C84    LDA   #$00
         STA   $E3
         LDA   #$0B
         STA   $F1
         TYA
         AND   #$01
         BEQ   L8C99
         LDA   #$06
         STA   $E3
         LDA   #$0A
         STA   $F1
L8C99    STY   $E4
         LDA   #$A7
         STA   $E0
         STY   $F4
         JSR   L796A
         LDY   $F4
         LDA   $E3
         CLC
         ADC   #$0C
         STA   $E3
         DEC   $F1
         BNE   L8C99
         TYA
         CLC
         ADC   #$05
         TAY
         CPY   #$B4
         BNE   L8C84
         LDA   curPLAYER
         CLC
         ADC   #$81
         STA   L1300+$EF
         LDA   #$0B
         STA   $E5
         LDA   #$55
         STA   $E4
         LDA   #>L13E8
         STA   $E8
         LDA   #<L13E8
         STA   $E7
         JSR   L95AA
         JSR   switchHGRPAGE
         LDA   #$30
         STA   $F1
L8CDC    LDX   #$00
L8CDE    LDY   #$00
L8CE0    DEY
         BNE   L8CE0
         DEX
         BNE   L8CDE
         DEC   $F1
         BNE   L8CDC
         RTS

L8CEB    LDX   fgPAGE
         LDA   L7C9D,X
         STA   $E8
         LDA   L7C9F,X
         STA   $E7
         LDA   #$41
         STA   $E3
         LDA   #$46
         STA   $E4
         LDA   #$B7
         STA   $E0
         JSR   L7A88
         JSR   L796A
         RTS

L8D0A    LDX   fgPAGE
         LDA   L7C9D,X
         STA   $E8
         LDA   L7C9F,X
         STA   $E7
         LDA   #$41
         STA   $E3
         LDA   #$46
         STA   $E4
         JSR   L7ADB
         RTS

L8D22    LDA   #$FF
         STA   $EB
         LDA   #$19
         STA   L7B36
L8D2B    LDY   L7B36
         LDA   L0EC8,Y
         STA   L8D45+2
         LDA   L0EE4,Y
         STA   L8D45+1
         LDA   #$04
         STA   $E5
L8D3E    LDX   $E5
         CPX   #$25
         BCS   L8D64
         DEX
L8D45    LDA   $FFFF,X
         AND   #$0F
         BNE   L8D5F
         LDX   L7B36
         LDY   L7BBB,X
         LDX   #$28
         LDA   $E5
         AND   #$01
         BNE   L8D5C
         LDX   #$20
L8D5C    JSR   L960A
L8D5F    INC   $E5
         JMP   L8D3E

L8D64    DEC   L7B36
         BNE   L8D2B
         RTS

L8D6A    STA   $F5
         LDA   #>L9400
         CLC
         ADC   L6003
         STA   L8D7C+2
         STA   L8D8D+2
         LDY   #$02
L8D7A    LDX   #$00
L8D7C    LDA   $FF00,X
         PHA
         LDA   $F5
         BEQ   L8D8A
         PLA
         EOR   #$80
         JMP   L8D8D

L8D8A    PLA
         AND   #$7F
L8D8D    STA   $FF00,X
         DEX
         BNE   L8D7C
         INC   L8D7C+2
         INC   L8D8D+2
         DEY
         BNE   L8D7A
         RTS

L8D9D    LDX   fgPAGE
         BEQ   L8DA2
         RTS

L8DA2    LDY   #$00
L8DA4    LDA   L0FC8,Y
         BEQ   L8DB1
         CMP   #$06
         BCS   L8DB6
         CMP   #$04
         BCC   L8DB6
L8DB1    LDA   L0FF8,Y
         BEQ   L8DB9
L8DB6    JMP   L8E47

L8DB9    LDA   LFCB0,X
         ORA   LFCB1,X
         BNE   L8DB6
         LDA   L0FB0,Y
         CMP   #$28
         BCC   L8DB6
         CMP   #$40
         BCC   L8DD7
         CMP   #$B8
         BCC   L8DB6
         CMP   #$C0
         BCS   L8DB6
         JMP   L8DDF

L8DD7    LDA   L0F80,X
         CMP   L0F52
         BNE   L8E47
L8DDF    LDA   L0F70,X
         BEQ   L8E47
         BMI   L8E47
         SEC
         SBC   L0F50
         BMI   L8DFA
         CMP   #$28
         BCS   L8E47
         LDA   L0FB0,Y
         AND   #$02
         BNE   L8E47
         JMP   L8E05

L8DFA    CMP   #$D8
         BCC   L8E47
         LDA   L0FB0,Y
         AND   #$02
         BEQ   L8E47
L8E05    LDA   L0F80,X
         STA   LFCBC,X
         STA   LFCBD,X
         LDA   L0F70,X
         STA   LFCB0,X
         LDA   L0FB0,Y
         CMP   #$B8
         BCC   L8E28
         LDA   #$06
         STA   LFCCE,Y
         LDA   #$DE
         STA   LFCD4,Y
         JMP   L8E47

L8E28    LDA   #$04
         STA   LFCC8,Y
         LDA   L0F70,X
         CMP   L0F50
         BCC   L8E3A
         LDA   #$FC
         STA   LFCC8,Y
L8E3A    STX   $F3
         LDX   L0FB0,Y
         LDA   L7B7B,X
         LDX   $F3
         STA   LFCD4,Y
L8E47    INX
         INX
         INY
         CPY   #$06
         BEQ   L8E51
         JMP   L8DA4
L8E51    RTS

L8E52    LDX   #$00
         LDY   fgPAGE
L8E56    LDA   LFCB0,Y
         BEQ   L8E84
         BMI   L8E84
         STA   $E3
         LDA   LFCBC,Y
         STA   $E4
         LDA   LFCD4,X
         CLC
         ADC   fgPAGE
         STA   $E0
         LDA   L7B8B,Y
         STA   $E8
         LDA   L7B97,Y
         STA   $E7
         STX   $F3
         STY   $F4
         JSR   L7A88
         JSR   L796A
         LDY   $F4
         LDX   $F3
L8E84    INY
         INY
         INX
         CPX   #$06
         BNE   L8E56
         RTS

L8E8C    LDA   #$0A
         CLC
         ADC   fgPAGE
         TAY
         LDX   #$05
L8E94    LDA   LFCB0,Y
         BEQ   L8EBC
         BMI   L8EBC
         STA   $E3
         LDA   LFCBC,Y
         STA   $E4
         LDA   LFCD4,X
         STA   $E0
         LDA   L7B8B,Y
         STA   $E8
         LDA   L7B97,Y
         STA   $E7
         STX   $F3
         STY   $F4
         JSR   L7ADB
         LDY   $F4
         LDX   $F3
L8EBC    DEY
         DEY
         DEX
         BPL   L8E94
         RTS

L8EC2    LDA   #$00
         STA   $F1
         LDX   fgPAGE
         LDA   fgPAGE
         EOR   #$01
         TAY
L8ECD    LDA   LFCB0,Y
         BEQ   L8F25
         CMP   #$FF
         BNE   L8EE1
         LDA   #$00
         STA   LFCB0,X
         STA   LFCB0,Y
         JMP   L8F25

L8EE1    STX   $F3
         LDX   $F1
         LDA   LFCBC,Y
         CLC
         ADC   LFCCE,X
         LDX   $F3
         STA   LFCBC,X
         STA   $E4
         CMP   #$BE
         BCC   L8EFF
         LDA   #$FF
         STA   LFCB0,X
         JMP   L8F25

L8EFF    LDX   $F1
         LDA   LFCB0,Y
         CLC
         ADC   LFCC8,X
         STA   $E3
         STY   $99
         LDA   #$09
         STA   $E1
         JSR   L69B2
         LDY   $99
         LDX   $F3
         LDA   $D1
         BNE   L8F20
         LDA   $E3
         JMP   L8F22

L8F20    LDA   #$FF
L8F22    STA   LFCB0,X
L8F25    INX
         INX
         INY
         INY
         INC   $F1
         LDA   $F1
         CMP   #$06
         BNE   L8ECD
         RTS

L8F32    LDA   $9A
         BEQ   L8F37
L8F36    RTS

L8F37    LDA   fgPAGE
         BNE   L8F36
         LDA   #$08
         STA   $FA
         STA   $FE
         STA   $FF
         LDA   #$0C
         STA   $FB
         LDX   fgPAGE
         LDA   L0F50,X
         STA   $F8
         LDA   L0F52,X
         STA   $F9
L8F53    LDA   LFCB0,X
         BEQ   L8F95
         BMI   L8F95
         STA   $FC
         LDA   LFCBC,X
         STA   $FD
         JSR   L9513
         BCC   L8F95
         LDA   #$FF
         STA   LFCB0,X
         LDA   L0F51
         STA   L0F50
         LDA   L0F53
         STA   L0F52
         INC   $91
         LDA   #$28
         STA   $92
         LDA   #$5E
         STA   L0F5A
         LDX   curPLAYER
         DEC   $DE,X
         INC   L630E,X
         LDA   #$00
         STA   L0F5E
         STA   L0F60
         JSR   L9136
         RTS

L8F95    INX
         INX
         CPX   #$0C
         BCC   L8F53
         RTS

L8F9C    LDA   #$00
         JSR   L7858
         LDA   #$01
         JSR   L7858
         JSR   L7878
         JSR   L81E0
         JSR   L8057
         JSR   L68A2
         JSR   switchHGRPAGE
         LDA   #$00
         JSR   L7858
         LDA   #$01
         JSR   L7858
         JSR   L7878
         JSR   L8057
         JSR   L68A2
         JSR   switchHGRPAGE
         LDA   #$FF
         STA   L7B3E
         RTS

L8FD1    LDA   #$01
         STA   L7B39
L8FD6    LDA   #$02
         STA   L7B3F
         LDA   #$1E
         STA   L7B3E
         JSR   L782F
         JSR   switchHGRPAGE
         DEC   L7B39
         BPL   L8FD6
L8FEB    JSR   L68C7
         JSR   L808E
         JSR   L8BBF
         JSR   L8C34
         JSR   L68E9
         JSR   L80C4
         JSR   L8150
         LDA   L7B3E
         BMI   L9021
         JSR   L782F
         DEC   L7B3F
         BNE   L9021
         DEC   L7B3E
         LDA   #$15
         SEC
         SBC   L7B3C
         STA   L7B3F
         ASL
         CLC
         ADC   L7B3F
         STA   L7B3F
L9021    LDA   curPLAYER
         JSR   L7858
         JSR   L7878
         JSR   L81E0
         LDA   L7B3C
         BNE   L9032
         RTS

L9032    JSR   L8B88
         JSR   L8057
         JSR   L68A2
         JSR   switchHGRPAGE
         LDA   L7B3E
         BNE   L8FEB
         RTS

L9044    LDA   $D7
         CMP   #$64
         BEQ   L905D
         LDA   $00
         BEQ   L905D
         BMI   L905D
         LDA   $91
         BNE   L905D
         LDA   L7B46
         CMP   #$02
         BEQ   L907E
         BCC   L905E
L905D    RTS

L905E    DEC   L7B44
         BNE   L905D
         DEC   L7B43
         BNE   L905D
         INC   L7B46
         LDA   #$50
         STA   L7B44
         INC   L7B43
         LDA   L7B46
         CMP   #$01
         BNE   L905D
         JSR   L91DA
         RTS

L907E    LDX   fgPAGE
         LDA   #$0F
         STA   L0F7C,X
         LDA   #$5D
         STA   L0F8C,X
         LDA   #$00
         STA   L0FBE
         STA   L0FC6
         LDA   #$5A
         STA   L0FB6
         LDA   #$01
         STA   L7B47
         STA   L7B45
         INC   L7B46
         RTS

*-------------------------------
* 
*-------------------------------

L90A3    LDA   L7B45
         BNE   L90A9
L90A8    RTS

L90A9    DEC   L7B47
         BEQ   L90D1
         LDA   L0FBE
         ORA   L0FC6
         BEQ   L90A8
         LDX   fgPAGE
         LDA   L0F52,X
         CMP   L0F8C,X
         BEQ   L90D9
         LDA   L0F50,X
         CMP   L0F7C,X
         BCS   L90D0
         CLC
         ADC   #$0A
         CMP   L0F7C,X
         BCS   L90D9
L90D0    RTS

L90D1    LDA   L0FBE
         ORA   L0FC6
         BEQ   L90E7
L90D9    LDA   #$00
         STA   L0FBE
         STA   L0FC6
         LDA   #$03
         STA   L7B47
         RTS

L90E7    LDA   #$20
         STA   L7B47
         LDA   L7B45
         EOR   #$03
         STA   L7B45
         CMP   #$02
         BNE   L911C
         LDA   #$03
         STA   L0FBE
         LDA   #$00
         STA   L0FC6
         LDA   #$5A
         STA   L0FB6
         LDX   fgPAGE
         LDA   L0F50,X
         CMP   L0F7C,X
         BCS   L911B
         LDA   #$58
         STA   L0FB6
         LDA   #$FD
         STA   L0FBE
L911B    RTS

*-------------------------------
* 
*-------------------------------

L911C    LDA   #$07
         STA   L0FC6
         LDA   #$00
         STA   L0FBE
         LDX   fgPAGE
         LDA   L0F52,X
         CMP   L0F8C,X
         BCS   L9135
         LDA   #$F9
         STA   L0FC6
L9135    RTS

*-------------------------------
* 
*-------------------------------

L9136    LDA   #$00
         STA   L7B44
         LDA   #$02
         STA   L7B43
         LDX   fgPAGE
         LDA   #$00
         STA   L0F7C,X
         STA   L0F8C,X
         STA   L7B45
         RTS

*-------------------------------
* 
*-------------------------------

L914E    LDA   #$00
         STA   L7B3C
         LDA   #$03
         STA   $E3
         LDA   #$08
         STA   $E4
L915B    LDY   $E4
         LDX   L0E00,Y
         LDA   L0EC8,X
         STA   L9180+2
         LDA   L0EC8+1,X
         STA   L9183+2
         LDA   L0EE4,X
         STA   L9180+1
         LDA   L0EE4+1,X
         STA   L9183+1
         LDA   #$03
         STA   theINDEX
         LDX   $E3
         LDA   #$00
L9180    ORA   $FFFF,X
L9183    ORA   $FFFF,X
         INX
         DEC   theINDEX
         BNE   L9180
         AND   #$0F
         BNE   L91BF
         LDA   L7B3C
         ASL
         TAY
         LDX   $E3
         LDA   L0F01,X
         STA   L10A8,Y
         STA   L10A9,Y
         LDA   $E4
         STA   L10D8,Y
         STA   L10D9,Y
         LDY   L7B3C
         LDA   L7B40
         STA   L1108,Y
         LDA   #$FF
         STA   L1138,Y
         INC   L7B3C
         LDA   L7B3C
         CMP   #$14
         BEQ   L91D9
L91BF    LDA   $E3
         CLC
         ADC   #$03
         STA   $E3
         CMP   #$24
         BNE   L915B
         LDA   #$03
         STA   $E3
         LDA   $E4
         CLC
         ADC   #$0E
         STA   $E4
         CMP   #$B0
         BNE   L915B
L91D9    RTS

*-------------------------------
* 
*-------------------------------

L91DA    JSR   switchPAGE
         LDX   #$00
         LDA   #$55
         STA   $E4
L91E3    LDY   $E4
         LDA   L1200,Y
         CLC
         ADC   HPAG
         STA   L9200+2
         STA   L9208+2
         LDA   L1300,Y
         CLC
         ADC   #$0F
         STA   L9200+1
         STA   L9208+1
         LDY   #$00
L9200    LDA   $FFFF,Y
         STA   $F300,X
         LDA   #$00
L9208    STA   $FFFF,Y
         INX
         INY
         CPY   #$0A
         BNE   L9200
         INC   $E4
         LDA   $E4
         CMP   #$69
         BNE   L91E3
         LDA   #$5B
         STA   $E4
         LDA   #$10
         STA   $E5
         LDA   #>L7EF5
         STA   $E8
         LDA   #<L7EF5
         STA   $E7
         JSR   L95AA
         LDA   #$40
         STA   L7B39
L9231    LDA   #$03
         JSR   LF800
         LDA   #$20
         JSR   L954E
         DEC   L7B39
         BNE   L9231
         LDX   #$00
         LDA   #$55
         STA   $E4
L9246    LDY   $E4
         LDA   L1200,Y
         CLC
         ADC   HPAG
         STA   L9260+2
         LDA   L1300,Y
         CLC
         ADC   #$0F
         STA   L9260+1
         LDY   #$00
L925D    LDA   $F300,X
L9260    STA   $FFFF,Y
         INX
         INY
         CPY   #$0A
         BNE   L925D
         INC   $E4
         LDA   $E4
         CMP   #$69
         BNE   L9246
         JSR   switchPAGE
         RTS

*-------------------------------
* 
*-------------------------------

L9275    STX   $98
         STY   $99
         LDX   #$00
L927B    LDA   LFF00,X
         ORA   LFF00+2,X
         ORA   LFF00+4,X
         BEQ   L9290
         TXA
         CLC
         ADC   #$06
         TAX
         CPX   #$1E
         BNE   L927B
         RTS

*-------------------------------
* 
*-------------------------------

L9290    LDY   $98
         LDA   L0C00,Y
         CLC
         ADC   #$03
         STA   LFF00,X
         LDA   L0C28,Y
         TAY
         LDA   L0D20,Y
         CLC
         ADC   #$04
         STA   LFF20,X
         STA   LFF20+1,X
         TXA
         LSR
         TAX
         LDA   #$07
         STA   LFF40,X
         LDA   #$80
         STA   LFF50,X
         STA   LFF50+1,X
         STA   LFF50+2,X
         LDX   $98
         LDY   $99
         RTS

*-------------------------------
* 
*-------------------------------

L92C3    LDX   fgPAGE
L92C5    LDA   LFF00,X
         BEQ   L92F2
         BMI   L92F2
         STA   $E3
         LDA   LFF20,X
         STA   $E4
         LDA   #$A4
         CLC
         ADC   fgPAGE
         STA   $E0
         LDA   L7C4D,X
         STA   $E8
         LDA   L7C6B,X
         STA   $E7
         STX   $F3
         STY   $F4
         JSR   L7A88
         JSR   L796A
         LDX   $F4
         LDX   $F3
L92F2    INX
         INX
         CPX   #$1E
         BCC   L92C5
         RTS

*-------------------------------
* 
*-------------------------------

L92F9    LDA   #$1C
         CLC
         ADC   fgPAGE
         TAX
L92FF    LDA   LFF00,X
         BEQ   L9329
         BMI   L9329
         STA   $E3
         LDA   LFF20,X
         STA   $E4
         LDA   #$A4
         CLC
         ADC   fgPAGE
         STA   $E0
         LDA   L7C4D,X
         STA   $E8
         LDA   L7C6B,X
         STA   $E7
         STX   $F3
         STY   $F4
         JSR   L7ADB
         LDY   $F4
         LDX   $F3
L9329    DEX
         DEX
         BPL   L92FF
         RTS

*-------------------------------
* 
*-------------------------------

L932E    LDA   #$00
         STA   $F1
         LDX   fgPAGE
         LDA   fgPAGE
         EOR   #$01
         TAY
L9339    LDA   LFF00,Y
         CMP   #$FF
         BNE   L9354
         LDA   #$00
         STA   LFF00,X
         STA   LFF00,Y
         STX   $F3
         LDX   $F1
         STA   LFF40,X
         LDX   $F3
         JMP   L9382

L9354    STX   $F3
         LDX   $F1
         LDA   LFF20,Y
         CLC
         ADC   LFF40,X
         LDX   $F3
         CMP   #$F4
         BCC   L9367
         LDA   #$05
L9367    STA   LFF20,X
         LDA   LFF00,Y
         STA   LFF00,X
         STX   $F3
         LDX   $F1
         DEC   LFF50,X
         BNE   L9380
         LDX   $F3
         LDA   #$FF
         STA   LFF00,X
L9380    LDX   $F3
L9382    INX
         INX
         INY
         INY
         INC   $F1
         LDA   $F1
         CMP   #$0F
         BNE   L9339
         LDX   #$00
         LDY   fgPAGE
L9392    LDA   LFF40,X
         BEQ   L940B
         LDA   LFF00,Y
         SEC
         SBC   #$03
         STA   $E3
         LDA   LFF20,Y
         STA   $E4
         LDA   #$03
         STA   $E1
         LDA   #$09
         STA   $E2
         LDA   #$02
         STX   $F3
         STY   $F4
         JSR   L6A75
         LDX   $F3
         LDY   $F4
         CMP   #$02
         BEQ   L940B
         LDA   #$00
         STA   LFF40,X
         DEC   $E3
         DEC   $E3
         DEC   $E3
         LDA   #$02
         STX   $F3
         STY   $F4
         JSR   L6A75
         LDX   $F3
         LDY   $F4
         CMP   #$02
         BEQ   L93E6
         LDA   $E3
         CLC
         ADC   #$03
         STA   LFF00+2,Y
         LDA   $E4
         STA   LFF20+2,Y
L93E6    LDA   $E3
         CLC
         ADC   #$06
         STA   $E3
         LDA   #$02
         STX   $F3
         STY   $F4
         JSR   L6A75
         LDX   $F3
         LDY   $F4
         CMP   #$02
         BEQ   L940B
         LDA   $E3
L9400    CLC		; LOGO - I am ashamed. To be corrected when sprites pointers will be corrected
         ADC   #$03
         STA   LFF00+4,Y
         LDA   $E4
         STA   LFF20+4,Y
L940B    INY
         INY
         INX
         CPX   #$0F
         BEQ   L9415
         JMP   L9392
L9415    RTS

L9416    LDA   #$0A
         STA   $FA
         STA   $FE
         STA   $FB
         STA   $FF
         LDY   fgPAGE
L9422    LDA   LFF00,Y
         BEQ   L946C
         BMI   L946C
         STA   $F8
         TYA
         LSR
         TAX
         LDA   LFF40,X
         BNE   L946C
         LDA   LFF20,Y
         STA   $F9
         STY   $99
         LDX   #$00
         LDY   fgPAGE
L943E    LDA   L0F70,Y
         BEQ   L9463
         BMI   L9463
         STA   $FC
         LDA   L0FC8,X
         CMP   #$07
         BCS   L9463
         LDA   L0F80,Y
         STA   $FD
         JSR   L9513
         BCC   L9463
         INC   $D5
         DEC   $00
         STX   $98
         JSR   L6FE0
         LDX   $98
L9463    INX
         INY
         INY
         CPX   #$06
         BNE   L943E
         LDY   $99
L946C    INY
         INY
         CPY   #$1E
         BCC   L9422
         RTS

L9473    ASL
         ASL
         ASL
         CLC
         ADC   #$07
         TAX
         LDA   curPLAYER
         ASL
         ASL
         ASL
         CLC
         ADC   #$07
         TAY
         LDA   #$08
         STA   $F1
L9487    LDA   L0F30,Y
         CLC
         ADC   L60F7,X
         CMP   #$0A
         BCC   L94A8
         DEC   $F1
         BEQ   L94A3
         DEY
         PHA
         LDA   L0F30,Y
         CLC
         ADC   #$01
         STA   L0F30,Y
         PLA
         INY
L94A3    INC   $F1
         SEC
         SBC   #$0A
L94A8    STA   L0F30,Y
         DEY
         DEX
         DEC   $F1
         BNE   L9487
         LDA   curPLAYER
         ASL
         ASL
         ASL
         TAY
         LDX   #$00
L94B9    LDA   L0F30,Y
         CMP   L0F40,X
         BEQ   L94C6
         BCS   L94CF
         JMP   L94DB

L94C6    INY
         INX
         CPX   #$08
         BNE   L94B9
         JMP   L94DB

L94CF    LDA   L0F30,Y
         STA   L0F40,X
         INY
         INX
         CPX   #$08
         BNE   L94CF
L94DB    LDA   curPLAYER
         ASL
         ASL
         ASL
         TAY
         LDA   curPLAYER
         ASL
         TAX
         LDA   L7B2E,X
         BNE   L94FF
         LDA   L0F32,Y
         BEQ   L94FF
         INC   L7B2E,X
         STX   $F1
         LDX   curPLAYER
         INC   $DE,X
         LDX   $F1
         LDA   L7B2F,X
         BEQ   L950B
L94FF    LDA   L7B2F,X
         BNE   L9512
         LDA   L0F33,Y
         CMP   #$03
         BCC   L9512
L950B    INC   L7B2F,X
         LDX   curPLAYER
         INC   $DE,X
L9512    RTS

L9513    LDA   $FC
         CLC
         ADC   $FE
         CMP   $F8
         BCC   L9539
         LDA   $F8
         CLC
         ADC   $FA
         CMP   $FC
         BCC   L9539
         LDA   $FD
         CLC
         ADC   $FF
         CMP   $F9
         BCC   L9539
         LDA   $F9
         CLC
         ADC   $FB
         CMP   $FD
         BCC   L9539
         SEC
         RTS

L9539    CLC
         RTS

L953B    LDY   #$0B
L953D    LDA   $4F
         ASL
         CLC
         ADC   #$40
         ASL
         ROL   $4E
         ROL   $4F
         DEY
         BNE   L953D
         LDA   $4E
         RTS

L954E    SEC
L954F    PHA
L9550    SBC   #$01
         BNE   L9550
         PLA
         SBC   #$01
         BNE   L954F
         RTS

L955A    ASL
         ASL
         ASL
         TAX
         LDA   #$07
         STA   $F1
L9562    LDA   L1200,Y
         CLC
         ADC   HPAG
         STA   L9578+2
         LDA   L1300,Y
         CLC
         ADC   $E5
         STA   L9578+1
         LDA   LFC00,X
L9578    STA   $FFFF
         INX
         INY
         DEC   $F1
         BNE   L9562
         RTS

L9582    ASL
         ASL
         ASL
         TAX
         LDA   #$07
         STA   $F1
L958A    LDA   L1200,Y
         CLC
         ADC   HPAG
         STA   L95A0+2
         LDA   L1300,Y
         CLC
         ADC   $E5
         STA   L95A0+1
         LDA   LFB00,X
L95A0    STA   $FFFF
         INX
         INY
         DEC   $F1
         BNE   L958A
         RTS

L95AA    LDA   $E5
         STA   $E3
         LDA   $E8
         STA   L95BA+2
         LDA   $E7
         STA   L95BA+1
L95B8    LDY   $E4
L95BA    LDA   $FFFF
         BPL   L95DD
         CMP   #$FF
         BEQ   L95F1
         CMP   #$FE
         BNE   L95D5
         LDA   $E4
         CLC
         ADC   #$0F
         STA   $E4
         LDA   $E3
         STA   $E5
         JMP   L95E6

L95D5    AND   #$7F
         JSR   L955A
         JMP   L95E4

L95DD    CMP   #$20
         BEQ   L95E4
         JSR   L9582
L95E4    INC   $E5
L95E6    INC   L95BA+1
         BNE   L95B8
         INC   L95BA+2
         JMP   L95B8
L95F1    RTS

L95F2    STX   $F3
         LDA   #$FF
         LDX   $EB
         CPX   #$05
         BCC   L9602
         CPX   #$FE
         BCS   L9602
         LDA   #$00
L9602    STA   $EB
         LDA   $90
         ASL
         ASL
         ASL
         TAX
L960A    LDA   #$07
         STA   theINDEX
L960E    LDA   L1200,Y
         CLC
         ADC   HPAG
         STA   L9626+2
         LDA   L1300,Y
         CLC
         ADC   $E5
         STA   L9626+1
         LDA   L6009,X
         AND   $EB
L9626    STA   $FFFF
         INY
         INX
         DEC   theINDEX
         BNE   L960E
         LDX   $F3
         RTS

L9632    LDA   nbPLAYERS
         CMP   #$02
         BEQ   L9639
         RTS

L9639    JSR   switchPAGE
         LDA   curPLAYER
         CLC
         ADC   #$81
         STA   LFC60
         LDA   #$32
         STA   $E4
         LDA   #$11
         STA   $E5
         LDA   #>LFC60
         STA   $E8
         LDA   #<LFC60
         STA   $E7
         JSR   L95AA
         LDX   #$08
         JMP   L9697

L965C    LDA   curPLAYER
         CLC
         ADC   #$81
         STA   LFC81
         JSR   switchPAGE
         LDA   #$32
         STA   $E4
         LDA   #$0B
         STA   $E5
         LDA   #>LFC70
         STA   $E8
         LDA   #<LFC70
         STA   $E7
         JSR   L95AA
         LDX   #$0C
         JMP   L9697

L967F    JSR   switchPAGE
         LDA   #$32
         STA   $E4
         LDA   #$09
         STA   $E5
         LDA   #>LFC88
         STA   $E8
         LDA   #<LFC88
         STA   $E7
         JSR   L95AA
         LDX   #$20
L9697    LDA   #$FF
         JSR   L954E
         DEX
         BNE   L9697
         JSR   clearHGRPAGES
         RTS

L96A3    LDX   curPLAYER
         LDA   L6007,X
         BMI   L96EB
         JSR   switchPAGE
         LDA   #$28
         STA   $E4
         LDA   #$00
         STA   $E5
         LDA   #>L14A0
         STA   $E7+1
         LDA   #<L14A0
         STA   $E7
         JSR   L95AA
         LDA   #$00
         STA   KBDSTROBE
         LDA   #$09
         STA   L7B3E
L96CA    LDA   L7B3E
         JSR   L782F
         LDX   #$06
L96D2    LDA   #$FF
         JSR   L954E
         LDA   BUTN0
         BMI   L96ED
         LDA   KBD
         CMP   #$8D
         BEQ   L96ED
         DEX
         BPL   L96D2
         DEC   L7B3E
         BPL   L96CA
L96EB    SEC
         RTS

L96ED    LDX   curPLAYER
         LDA   #$03
         STA   $DE,X
         DEC   L6007,X
         CLC
         RTS

*-----------------------------------
* GARBAGE DATA
*-----------------------------------

         DB    $07
         DB    $60
         DB    $18
         DB    $60
         DB    $95
         DB    $DE
         DB    $DE
         DB    $07

