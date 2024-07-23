*
* Donkey Kong
*
* (c) 1982, Nintendo
* (c) 1984, Atari
* (s) 2020, Antoine Vignau
*

*-----------------------

	 MX    %11
         ORG   $4000
	 LST   OFF

*-----------------------

SOFTEV EQU $03F2
PWREDUP EQU $03F4
KBD EQU $C000
KBDSTROBE EQU $C010
SPKR EQU $C030
TXTCLR EQU $C050
TXTSET EQU $C051
MIXCLR EQU $C052
HIRES EQU $C057
BUTN0 EQU $C061
BUTN1 EQU $C062
PADDL0 EQU $C064
PADDL1 EQU $C065
PTRIG EQU $C070
HOME EQU $FC58
WAIT EQU $FCA8

*-----------------------

L4000    JMP   L4103

L4003    DB    $00
         DB    $00
         DB    $00
L4006    DB    $00
         DB    $00
         DB    $00
L4009    DB    $00
         DB    $00
         DB    $00
L400C    DB    $00
         DB    $00
         DB    $00
L400F    DB    $00
         DB    $00
         DB    $00
L4012    DB    $00
         DB    $00
         DB    $00
L4015    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L401D    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L4023    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L4029    DB    $00
         DB    $00
L402B    DB    $00
L402C    DB    $00
L402D    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L4039    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L4043    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L404D    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L4057    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L4061    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L406B    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L4070    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L4075    DB    $00
L4076    DB    $00
         DB    $00
         DB    $00
         DB    $00
L407A    DB    $00
L407B    DB    $00
         DB    $00
         DB    $00
         DB    $00
L407F    DB    $00
L4080    DB    $00
         DB    $00
         DB    $00
         DB    $00
L4084    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L4089    DB    $00
L408A    DB    $00
         DB    $00
         DB    $00
         DB    $00
L408E    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L4093    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L4098    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L409D    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L40A2    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L40A7    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L40AC    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L40B1    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L40B6    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L40BB    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L40C0    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L40C5    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L40CA    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L40CF    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L40DF    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L40E7    DB    $00
         DB    $00
L40E9    DB    $00
         DB    $00
L40EB    DB    $00
L40EC    DB    $00
L40ED    DB    $00
         DB    $00
         DB    $00
         DB    $00
L40F1    DB    $00
L40F2    DB    $00
L40F3    DB    $00
L40F4    DB    $00
L40F5    DB    $00
L40F6    DB    $00
L40F7    DB    $00
L40F8    DB    $00
L40F9    DB    $00
L40FA    DB    $00
L40FB    DB    $00
L40FC    DB    $00
L40FD    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $A2
         DB    $00

*-----------------------

L4103    LDX   #$00
L4105    LDA   #$00
         STA   L40FD,X
         INX
         CPX   #$06
         BNE   L4105

         LDA   #$00
         STA   $B8
         STA   SOFTEV
         LDA   #$C6
         STA   SOFTEV+1
         EOR   #$A5
         STA   PWREDUP
         JSR   HOME
         LDA   #$32
         STA   $AE
         BIT   KBDSTROBE
L412A    LDA   KBD
         BMI   L4136
         JSR   L6B8A
         DEC   $AE
         BNE   L412A
L4136    BIT   KBDSTROBE
         JMP   L7C59

L413C    LDA   #$00
         STA   L40F7
         STA   L40F8
         STA   L40F3
         STA   L40F4
         STA   $AB
         STA   $AA
         LDX   $A9
         LDA   L805A,X
         STA   L40F9
         STA   L40FA
         STA   L40FB
         STA   L40FC
         LDA   L805D,X
         STA   L40F5
         STA   L40F6
         LDA   $B1
         BEQ   L4170
         LDA   #$01
         STA   $AC
L4170    LDX   #$00
L4172    LDA   #$00
         STA   L4029,X
         INX
         CPX   #$10
         BNE   L4172
         LDA   #$02
         STA   L40F1
         STA   L40F2
L4184    LDA   #$00
         STA   $02
         STA   $10
         STA   $12
         STA   $11
         STA   $13
         STA   $18
         STA   $57
         STA   $5A
         STA   $5B
         STA   $5E
         STA   $64
         STA   $6B
         STA   $5F
         STA   $60
         STA   $6D
         STA   $BD
         STA   $75
         STA   $77
         STA   $82
         STA   $83
         STA   $84
         STA   $88
         STA   $8B
         STA   $8C
         STA   $B4
         STA   $8D
         STA   $8E
         STA   $9C
         STA   $97
         STA   $9E
         STA   $9D
         STA   $A0
         STA   $A1
         STA   $A2
         STA   $A3
         STA   $A8
         STA   $A7
         STA   $B3
         STA   $B5
         STA   $B6
         STA   $B7
         STA   $B9
         STA   $BB
         LDX   $AB
         LDA   L40F5,X
         TAX
         LDA   L80E1,X
         STA   $5C
         LDA   #$FF
         STA   $BE
         BIT   TXTCLR
         BIT   MIXCLR
         BIT   HIRES
         JSR   L7B92
         BIT   TXTSET
         JSR   L6BDB
         BIT   TXTCLR
         BIT   MIXCLR
         BIT   HIRES
         LDA   #$40
         STA   $B2
         LDX   #$00
L420C    LDA   #$00
         LDA   L8151,X
         STA   L401D,X
         STA   L4023,X
         INX
         CPX   #$06
         BNE   L420C
         LDX   #$00
L421E    LDA   #$00
         STA   L40CF,X
         INX
         CPX   #$10
         BNE   L421E
         LDX   #$00
L422A    LDA   #$FF
         STA   L4043,X
         STA   L4039,X
         LDA   #$00
         STA   L40E7,X
         INX
         CPX   #$0A
         BNE   L422A
         LDX   #$00
L423E    LDA   #$00
         STA   L4015,X
         STA   L40DF,X
         INX
         CPX   #$08
         BNE   L423E
         LDX   #$00
L424D    LDA   #$FF
         STA   L4075,X
         STA   L407A,X
         STA   L4084,X
         STA   L40A7,X
         STA   L40A2,X
         STA   L40B1,X
         STA   L40C0,X
         STA   L40C5,X
         LDA   #$00
         STA   L4093,X
         STA   L4098,X
         STA   L408E,X
         STA   L40B6,X
         STA   L406B,X
         STA   L4070,X
         INX
         CPX   #$05
         BNE   L424D
         LDX   #$00
L4282    LDA   #$FF
         STA   L4003,X
         STA   L4009,X
         INX
         CPX   #$03
         BNE   L4282
         LDA   #$FF
         STA   $16
         LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   L7F7D,X
         STA   $A6
         JSR   L7A12
         JSR   L7A5F
         JSR   L6FC6
         JSR   L71CB
         JSR   L7BFF
         JSR   L701E
         LDX   $5C
         LDA   L7F9C,X
         STA   $0D
         STA   $04
         LDA   #$01
         STA   $07
         LDA   #$03
         STA   $0E
         LDX   $5C
         LDA   L7F98,X
         STA   $05
         STA   $0A
         LDA   #$10
         STA   $08
         LDA   #$F0
         STA   $19
         STA   $1D
         LDA   #$0B
         STA   $1A
         STA   $1E
         JSR   L5828
         LDX   $5C
         LDA   #$20
         STA   $08
         LDA   #$10
         STA   $19
         LDA   #$19
         STA   $1A
         LDA   #$06
         STA   $0E
         LDA   L7F90,X
         STA   $0D
         STA   $98
         LDA   L7F94,X
         STA   $0A
         STA   $99
         LDA   $5C
         BNE   L4314
         LDX   #$03
         STX   $97
         LDA   L82D5,X
         CLC
         ADC   #$10
         STA   $19
         LDA   L82DC,X
         ADC   #$19
         STA   $1A
L4314    JSR   L5828
         JSR   L640F
         LDA   $5C
         ASL
         ASL
         TAX
         LDY   #$00
         STX   $AD
         STY   $56
L4325    LDA   L8181,X
         CMP   #$FF
         BEQ   L4356
         STA   $0D
         INC   $0D
         LDA   L8191,X
         STA   $0A
         LDA   #$10
         STA   $08
         LDA   #$02
         STA   $0E
         CPY   #$02
         BNE   L4349
         LDA   $5C
         CMP   #$02
         BNE   L4349
         LDY   #$04
L4349    LDA   L81A1,Y
         STA   $19
         LDA   L81A6,Y
         STA   $1A
         JSR   L5828
L4356    INC   $AD
         INC   $56
         LDX   $AD
         LDY   $56
         CPY   #$04
         BNE   L4325
         LDX   $5C
         LDA   #$01
         STA   $0E
         LDA   L7F39,X
         CMP   #$FF
         BEQ   L43B8
         STA   $0D
         INC   $0D
         LDA   L7F25,X
         CLC
         ADC   #$0F
         STA   $0A
         LDA   #$B2
         STA   $19
         LDA   #$82
         STA   $1A
         LDA   #$08
         STA   $08
         JSR   L5828
         LDX   $5C
         LDA   #$01
         STA   $0E
         LDA   L7F35,X
         CMP   #$FF
         BEQ   L43B8
         STA   $0D
         INC   $0D
         LDA   L7F2D,X
         CLC
         ADC   #$0F
         STA   $0A
         LDA   #$B2
         STA   $19
         LDA   #$82
         STA   $1A
         LDA   #$08
         STA   $08
         JSR   L5828
         JMP   L43B8
L43B5    JMP   L448C

L43B8    LDX   $5C
         LDA   L7FE8,X
         CMP   #$FF
         BEQ   L43DB
         STA   $0D
         LDA   L7FEC,X
         STA   $0A
         LDA   #$0D
         STA   $08
         LDA   #$02
         STA   $0E
         LDA   #$CC
         STA   $19
         LDA   #$83
         STA   $1A
         JSR   L5828
L43DB    LDA   $5C
         CMP   #$02
         BNE   L43B5
         LDA   #$00
         STA   $56
L43E5    LDX   $56
         LDA   L4023,X
         STA   $0A
         LDA   #$C6
         STA   $19
         LDA   #$82
         STA   $1A
         LDA   L8157,X
         STA   $0D
         LDA   #$03
         STA   $0E
         LDA   #$05
         STA   $08
         JSR   L5828
         INC   $56
         LDA   $56
         CMP   #$06
         BNE   L43E5
         LDA   #$00
         STA   $56
L4410    LDX   $56
         LDA   L8280,X
         STA   $0A
         LDA   L8258,X
         STA   $19
         LDA   L825C,X
         STA   $1A
         LDA   #$03
         STA   $0E
         LDA   L8284,X
         STA   $0D
         LDA   #$0A
         STA   $08
         JSR   L5828
         INC   $56
         LDA   $56
         CMP   #$04
         BNE   L4410
         LDA   #$10
         STA   $08
         LDA   #$03
         STA   $0E
         LDA   #$02
         STA   $75
         LDA   #$3D
         STA   $0A
         STA   L407F
         LDA   #$0A
         STA   $0D
         STA   L407A
         LDA   #$00
         STA   L4089
         STA   L4075
         STA   L4076
         STA   L408A
         LDA   #$00
         STA   $19
         LDA   #$A7
         STA   $1A
         JSR   L5828
         LDA   #$10
         STA   $08
         LDA   #$43
         STA   $0A
         STA   L4080
         LDA   #$22
         STA   $0D
         STA   L407B
         LDA   #$00
         STA   $19
         LDA   #$A7
         STA   $1A
         JSR   L5828
         JMP   L44BB

L448C    CMP   #$01
         BNE   L44BB
         LDA   #$00
         STA   $56
L4494    LDX   $56
         LDA   L8149,X
         STA   $0A
         LDA   #$BA
         STA   $19
         LDA   #$82
         STA   $1A
         LDA   L8141,X
         STA   $0D
         LDA   #$02
         STA   $0E
         LDA   #$06
         STA   $08
         JSR   L5828
         INC   $56
         LDA   $56
         CMP   #$08
         BNE   L4494
L44BB    LDA   $5C
         CMP   #$03
         BNE   L44C4
         JSR   L7D47
L44C4    LDA   $5C
         CMP   #$02
         BNE   L44CD
         JSR   L5778
L44CD    LDA   $5C
         BNE   L44D4
         JSR   L5002
L44D4    INC   $5F
         BNE   L44DA
         INC   $8D
L44DA    INC   $6B
         LDA   $6B
         CMP   #$02
         BNE   L44E6
         LDA   #$00
         STA   $6B
L44E6    LDA   $5C
         BEQ   L44F1
         CMP   #$03
         BEQ   L44F1
         JSR   L5376
L44F1    LDA   $5C
         CMP   #$01
         BEQ   L4502
         CMP   #$02
         BEQ   L4502
         LDA   $6B
         BNE   L4502
         JSR   L585B
L4502    LDA   $5C
         CMP   #$02
         BNE   L450B
         JSR   L5C6A
L450B    INC   $8C
         LDA   $8C
         CMP   #$03
         BCC   L452A
         LDA   #$00
         STA   $8C
         LDA   $5C
         CMP   #$03
         BNE   L452A
         JSR   L5ECE
         JSR   L6268
         LDA   $6B
         BNE   L452A
         JSR   L7D72
L452A    LDA   $6B
         BNE   L4535
         LDA   $5C
         BNE   L4535
         JSR   L6100
L4535    LDA   $5C
         CMP   #$03
         BNE   L455A
         LDA   $8C
         BNE   L455A
         LDA   $16
         CMP   #$FF
         BNE   L455A
         LDA   $10
         BNE   L455A
         LDA   $05
         CMP   #$9A
         BCS   L455A
         CMP   #$5A
         BCC   L4557
         CMP   #$78
         BCC   L455A
L4557    JMP   L6340

L455A    LDA   $6C
         CLC
         ADC   $5F
         CLC
         ADC   $6D
         STA   $6C
         AND   #$07
         CMP   #$07
         BNE   L4579
         LDX   $5C
         LDA   L7FE8,X
         CMP   #$FF
         BEQ   L4580
         JSR   L63BB
         JMP   L4580

L4579    CMP   #$06
         BNE   L4580
         JSR   L6437
L4580    LDA   $5C
         BEQ   L458B
         CMP   #$03
         BEQ   L458B
         JSR   L6550
L458B    JSR   L7A95
         INC   $B4
         LDA   $B4
         CMP   #$04
         BCC   L459A
         LDA   #$00
         STA   $B4
L459A    LDA   $BB
         BEQ   L45A0
         DEC   $BB
L45A0    JSR   L6DF2
         JSR   L7128
         JSR   L71A3
         JSR   L730B
         LDA   $10
         BEQ   L45B3
         JMP   L4EBC

L45B3    LDA   $57
         BEQ   L45CE
         INC   $5A
         LDA   $5A
         CMP   #$0A
         BNE   L45CE
         LDA   #$00
         STA   $5A
         INC   $5B
         LDA   $5B
         CMP   #$23
         BNE   L45CE
         JMP   L4BD6

L45CE    LDA   $B8
         BEQ   L45EE
         LDX   $B5
         LDA   L8065,X
         STA   $15
         LDX   $B6
         LDA   L8065,X
         STA   $14
         LDA   $5C
         CMP   #$02
         BEQ   L45EB
         LDA   #$24
         JSR   WAIT
L45EB    JMP   L462A

L45EE    LDX   #$00
         STX   $14
         STX   $15
         LDX   #$7F
         LDA   PTRIG
L45F9    LDA   PADDL0
         AND   #$80
         ASL
         ROL
         ADC   $15
         STA   $15
         LDA   PADDL1
         AND   #$80
         ASL
         ROL
         ADC   $14
         STA   $14
         CLC
         ADC   $6C
         STA   $6C
         DEX
         BNE   L45F9
         LDA   #$7F
         SEC
         SBC   $15
         STA   $15
         LDA   #$7F
         SEC
         SBC   $14
         STA   $14
         CLC
         ADC   $6C
         STA   $6C
L462A    LDA   $16
         CMP   #$FF
         BNE   L463E
         LDY   $15
         CPY   #$6E
         BCS   L4687
         CPY   #$50
         BCC   L469A
         LDA   $57
         BNE   L466F
L463E    LDA   $14
         CMP   #$6E
         BCS   L46AD
         CMP   #$50
         BCC   L46BB
L4648    LDA   $B8
         BEQ   L4657
         LDA   $B7
         BEQ   L466F
         LDA   #$00
         STA   $B7
         JMP   L465C

L4657    LDA   BUTN0
         BPL   L466F
L465C    LDA   $16
         CMP   #$FF
         BNE   L466F
         LDA   $BB
         BNE   L466F
         LDA   #$01
         STA   $10
         STA   $12
         JMP   L4EBC

L466F    LDA   $57
         BNE   L467D
         LDA   $07
         BNE   L467A
         JMP   L4794
L467A    JMP   L47BA

L467D    LDA   $07
         BNE   L4684
         JMP   L4E6A
L4684    JMP   L4E96

L4687    LDA   $16
         CMP   #$FF
         BEQ   L4690
         JMP   L4CB1

L4690    LDA   $57
         BEQ   L4697
         JMP   L4D8B
L4697    JMP   L46CB

L469A    LDA   $16
         CMP   #$FF
         BEQ   L46A3
         JMP   L4CB1

L46A3    LDA   $57
         BEQ   L46AA
         JMP   L4E01
L46AA    JMP   L4736

L46AD    LDA   $16
         CMP   #$FF
         BEQ   L46B6
         JMP   L4C48

L46B6    LDA   #$01
         JMP   L46C6

L46BB    LDA   $16
         CMP   #$FF
         BEQ   L46C4
         JMP   L4C8C

L46C4    LDA   #$00
L46C6    STA   $17
         JMP   L4D24

L46CB    LDA   #$00
         STA   $07
         LDA   $B8
         BEQ   L46DE
         LDA   $B7
         BEQ   L46EE
         LDA   #$00
         STA   $B7
         JMP   L46E3

L46DE    LDA   BUTN0
         BPL   L46EE
L46E3    LDA   $BB
         BNE   L46EE
         LDA   #$01
         STA   $10
         JMP   L4EBC

L46EE    LDA   $B4
         BNE   L46F5
         JSR   L7D96
L46F5    LDA   $04
         STA   $03
         LDA   $05
         STA   $06
         LDA   $02
         CMP   #$04
         BEQ   L4712
         CMP   #$00
         BNE   L4714
         LDA   $03
         BNE   L470E
         JMP   L479B

L470E    LDA   #$07
         STA   $02
L4712    DEC   $03
L4714    DEC   $02
L4716    LDX   $02
         LDA   #<L0800
         CLC
         ADC   L7FA9,X
         STA   $EB
         STA   $0C
         LDA   #>L0800
L4724    ADC   L7FB0,X
         STA   $EC
         STA   $0F
         LDA   #$10
         STA   $08
         LDA   #$03
         STA   $58
         JMP   L4813

L4736    LDA   #$01
         STA   $07
         LDA   $B8
         BEQ   L4749
         LDA   $B7
         BEQ   L4759
         LDA   #$00
         STA   $B7
         JMP   L474E

L4749    LDA   BUTN0
         BPL   L4759
L474E    LDA   $BB
         BNE   L4759
         LDA   #$01
         STA   $10
         JMP   L4EBC

L4759    LDA   $B4
         BNE   L4760
         JSR   L7D96
L4760    LDA   $04
         STA   $03
         LDA   $05
         STA   $06
         LDA   $02
         CMP   #$03
         BEQ   L477F
         CMP   #$06
         BNE   L4781
         LDA   $03
         CMP   #$25
         BCC   L477B
         JMP   L47C1

L477B    LDA   #$FF
         STA   $02
L477F    INC   $03
L4781    INC   $02
L4783    LDX   $02
         LDA   #$50
         CLC
         ADC   L7FA9,X
         STA   $EB
         STA   $0C
         LDA   #$09
         JMP   L4724

L4794    LDA   $B4
         BNE   L479B
         JSR   L7DF6
L479B    LDA   $04
         STA   $03
         LDA   $05
         STA   $06
         LDA   $16
         CMP   #$FF
         BNE   L47EB
         LDX   $02
         LDA   #$A0
         CLC
         ADC   L7FA9,X
         STA   $EB
         STA   $0C
         LDA   #$0A
         JMP   L4724

L47BA    LDA   $B4
         BNE   L47C1
         JSR   L7DF6
L47C1    LDA   $04
         STA   $03
         LDA   $05
         STA   $06
         LDA   $16
         CMP   #$FF
         BNE   L47EB
         LDX   $02
         LDA   #$F0
         CLC
         ADC   L7FA9,X
         STA   $EB
         STA   $0C
         LDA   #$0B
         JMP   L4724

L47E0    LDA   $04
         STA   $03
         LDA   $B4
         BNE   L47EB
         JSR   L7D96
L47EB    LDA   $18
         CMP   #$03
         BCC   L4802
         LDX   $02
         LDA   #$E0
         CLC
         ADC   L7FA9,X
         STA   $EB
         STA   $0C
         LDA   #$0F
         JMP   L4724

L4802    LDX   $02
         LDA   #$30
         CLC
         ADC   L7FA9,X
         STA   $EB
         STA   $0C
         LDA   #$11
         JMP   L4724

L4813    LDX   #$00
         LDA   $05
         STA   $0A
         LDA   $06
         STA   $0B
         LDA   $08
         STA   $9F
L4821    LDY   $0A
         LDA   L871B,Y
         CLC
         ADC   $04
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         LDA   $58
         STA   $09
         LDY   $0B
         LDA   L871B,Y
         CLC
         ADC   $03
         STA   $19
         LDA   L87DB,Y
         STA   $1A
         LDY   #$00
L4845    LDA   ($1D,X)
         EOR   ($1B),Y
         STA   ($1B),Y
         LDA   ($EB,X)
         EOR   ($19),Y
         STA   ($19),Y
         INC   $1D
         BNE   L4857
         INC   $1E
L4857    INC   $EB
         BNE   L485D
         INC   $EC
L485D    INY
         DEC   $09
         BNE   L4845
         INC   $0A
         INC   $0B
         DEC   $08
         BNE   L4821
         LDA   $06
         STA   $05
         LDA   $0C
         STA   $1D
         LDA   $0F
         STA   $1E
         LDA   $03
         STA   $04
         LDA   $10
         BNE   L4894
         LDA   #$FF
         STA   $BE
         JSR   L696C
         JSR   L56A9
         LDA   $A3
         CMP   #$08
         BNE   L4891
         JMP   L664E

L4891    JSR   L6444
L4894    LDA   $9D
         BNE   L48DE
         LDA   $5C
         BNE   L48A4
         LDX   $60
         LDA   L812F,X
         JMP   L48D7

L48A4    CMP   #$03
         BEQ   L48D5
         CMP   #$02
         BEQ   L48CD
         LDX   $75
         LDA   L8137,X
         STA   $0E
         LDA   $AF00
         BEQ   L48C8
         LDA   #$00
         STA   $AF00
         LDA   $0E
         CMP   #$11
         BCC   L48DE
         SEC
         SBC   #$10
         STA   $0E
L48C8    LDA   $0E
         JMP   L48D7

L48CD    LDX   $83
         LDA   L813D,X
         JMP   L48D7

L48D5    LDA   #$28
L48D7    CMP   #$01
         BEQ   L48DE
         JSR   WAIT
L48DE    LDA   #$00
         STA   $9D
         LDA   $16
         CMP   #$FF
         BNE   L4932
         LDX   $58
         LDA   L7F8B,X
         STA   $59
         LDA   $10
         BNE   L4945
         JSR   L4A80
         LDA   $13
         BEQ   L4906
         LDA   $06
         SEC
         SBC   #$04
         STA   $06
         INC   $9D
         JMP   L4911

L4906    JSR   L4A34
         LDA   $13
         BEQ   L4924
         DEC   $06
         INC   $9D
L4911    LDA   $0C
         STA   $1D
         STA   $EB
         LDA   $0F
         STA   $1E
         STA   $EC
         LDA   $9F
         STA   $08
         JMP   L4813

L4924    JSR   L498A
         LDA   $13
         BEQ   L4932
         INC   $06
         INC   $9E
         JMP   L4911

L4932    JSR   L56DB
         LDA   $9E
         CMP   #$03
         BCC   L493E
         JMP   L720B

L493E    LDA   #$00
         STA   $9E
         JMP   L44C4

L4945    JSR   L4A34
         LDA   $13
         BEQ   L4967
         LDA   $11
         CMP   #$04
         BCC   L4967
         LDA   #$00
         STA   $11
         STA   $10
         STA   $12
         STA   $B5
         DEC   $06
         INC   $9D
         LDA   #$05
         STA   $BB
         JMP   L4911

L4967    JSR   L4A0D
         LDA   $13
         BEQ   L4981
         LDA   #$00
         STA   $11
         STA   $10
         STA   $12
         STA   $B5
         INC   $9D
         LDA   #$05
         STA   $BB
         JMP   L4911

L4981    JSR   L4AF0
         JSR   L56DB
         JMP   L44C4

L498A    LDX   #$00
         STX   $13
         LDA   $9E
         CMP   #$03
         BCS   L49CD
         LDA   $05
         CLC
         ADC   $9F
         TAY
         LDA   $04
         STA   $0D
         INC   $0D
         JSR   L5847
         LDA   ($1B),Y
         AND   #$6F
         BNE   L49AF
         INC   $13
         LDA   $57
         BNE   L49B0
L49AF    RTS

L49B0    LDA   $05
         CLC
         ADC   $9F
         TAY
         LDA   $04
         STA   $0D
         INC   $0D
         INC   $0D
         JSR   L5847
         LDA   ($1B),Y
         AND   #$6F
         BNE   L49C8
         RTS

L49C8    LDA   #$00
         STA   $13
         RTS

L49CD    JSR   L4A6D
         LDA   $05
         CLC
         ADC   $9F
         TAY
         LDA   $04
         STA   $0D
         INC   $0D
         JSR   L5847
         LDA   ($1B),Y
         AND   #$7F
         CMP   $AD
         BEQ   L49ED
         INC   $13
         LDA   $57
         BNE   L49EE
L49ED    RTS

L49EE    LDA   $05
         CLC
         ADC   $9F
         TAY
         LDA   $04
         STA   $0D
         INC   $0D
         INC   $0D
         JSR   L5847
         LDA   ($1B),Y
         AND   #$7F
         CMP   $AD
         BEQ   L4A08
         RTS

L4A08    LDA   #$00
         STA   $13
         RTS

L4A0D    LDX   #$00
         STX   $13
         LDA   $11
         CMP   #$04
         BCC   L4A33
         LDA   $05
         CLC
         ADC   $9F
         TAY
         LDA   $04
         STA   $0D
         INC   $0D
         JSR   L4A6D
         JSR   L5847
         LDA   ($1B),Y
         AND   #$7F
         CMP   $AD
         BNE   L4A33
         INC   $13
L4A33    RTS

L4A34    LDX   #$00
         STX   $13
         JSR   L4A6D
         LDA   $05
         CLC
         ADC   $9F
         TAY
         DEY
         LDA   $1D
         STA   $19
         LDA   $1E
         STA   $1A
         LDA   $19
         CLC
         ADC   $59
         STA   $19
         BCC   L4A55
         INC   $1A
L4A55    LDA   $04
         STA   $0D
         INC   $0D
         JSR   L5847
         LDX   #$00
         LDA   ($19,X)
         EOR   ($1B),Y
         AND   #$7F
         CMP   $AD
         BNE   L4A6C
         INC   $13
L4A6C    RTS

L4A6D    LDA   $5C
         ASL
         STA   $0E
         LDA   $04
         AND   #$01
         CLC
         ADC   $0E
         TAX
         LDA   L7FE0,X
         STA   $AD
         RTS

L4A80    LDA   #$00
         STA   $13
         LDA   $57
         BNE   L4ABC
         JSR   L4A6D
         LDA   $05
         CLC
         ADC   #$0C
         TAY
         LDA   $1D
         STA   $19
         LDA   $1E
         STA   $1A
         LDA   $19
         CLC
         ADC   #$25
         STA   $19
         BCC   L4AA4
         INC   $1A
L4AA4    LDA   $04
         STA   $0D
         INC   $0D
         JSR   L5847
         LDX   #$00
         LDA   ($19,X)
         EOR   ($1B),Y
         AND   #$7F
         CMP   $AD
         BNE   L4ABB
         INC   $13
L4ABB    RTS

L4ABC    JSR   L4A6D
         LDA   $05
         CLC
         ADC   #$10
         TAY
         LDA   $1D
         STA   $19
         LDA   $1E
         STA   $1A
         LDA   $19
         CLC
         ADC   #$41
         STA   $19
         BCC   L4AD8
         INC   $1A
L4AD8    LDA   $04
         STA   $0D
         INC   $0D
         JSR   L5847
         LDX   #$00
         LDA   ($19,X)
         EOR   ($1B),Y
         AND   #$7F
         CMP   $AD
         BNE   L4AEF
         INC   $13
L4AEF    RTS

L4AF0    LDX   $5C
         LDA   L7F39,X
         CMP   $04
         BEQ   L4AFC
L4AF9    JMP   L4BA2

L4AFC    LDA   $05
         CMP   L7F25,X
         BCC   L4AF9
         CMP   L7F29,X
         BCS   L4AF9
         LDA   L406B,X
         BNE   L4AF9
         INC   L406B,X
         LDA   #$01
         STA   $57
         LDA   L7F39,X
         STA   $0D
         INC   $0D
         LDA   L7F25,X
         CLC
         ADC   #$0F
         STA   $0A
L4B23    LDA   #$B2
         STA   $19
         LDA   #$82
         STA   $1A
         LDA   #$01
         STA   $0E
         LDA   #$08
         STA   $08
         JSR   L5828
         LDA   $1D
         STA   $19
         LDA   $1E
         STA   $1A
         LDA   #$10
         STA   $08
         LDA   #$03
         STA   $0E
         LDA   $05
         STA   $0A
         LDA   $04
         STA   $0D
         JSR   L5828
         LDA   #$14
         STA   $08
         STA   $9F
         LDA   #$04
         STA   $0E
         STA   $58
         LDA   $05
         SEC
         SBC   #$04
         STA   $05
         STA   $0A
         LDA   $04
         STA   $0D
         LDA   #$00
         STA   $5A
         LDX   $02
         LDA   $07
         BNE   L4B8B
         LDA   #$80
         CLC
         ADC   L7FBC,X
         STA   $19
         STA   $1D
         LDA   #$12
         ADC   L7FC3,X
         STA   $1A
         STA   $1E
         JSR   L5828
         RTS

L4B8B    LDA   #$B0
         CLC
         ADC   L7FBC,X
         STA   $19
         STA   $1D
         LDA   #$14
         ADC   L7FC3,X
         STA   $1A
         STA   $1E
         JSR   L5828
         RTS

L4BA2    LDX   $5C
         LDA   L7F35,X
         CMP   $04
         BEQ   L4BAC
L4BAB    RTS

L4BAC    LDA   $05
         CMP   L7F2D,X
         BCC   L4BAB
         CMP   L7F31,X
         BCS   L4BAB
         LDA   L4070,X
         BNE   L4BAB
         INC   L4070,X
         LDA   #$01
         STA   $57
         LDA   L7F35,X
         STA   $0D
         INC   $0D
         LDA   L7F2D,X
         CLC
         ADC   #$0F
         STA   $0A
         JMP   L4B23

L4BD6    LDA   $1D
         STA   $19
         LDA   $1E
         STA   $1A
         LDA   #$04
         STA   $0E
         LDA   #$14
         STA   $08
         LDA   $04
         STA   $0D
         LDA   $05
         STA   $0A
         JSR   L5828
         LDA   #$03
         STA   $0E
         LDA   #$10
         STA   $08
         LDA   $04
         STA   $0D
         LDA   $05
         CLC
         ADC   #$04
         STA   $05
         STA   $0A
         LDA   #$00
         STA   $57
         STA   $5A
         STA   $5B
         LDA   $07
         BNE   L4C2D
         LDX   $02
         LDA   #$00
         CLC
         ADC   L7FA9,X
         STA   $19
         STA   $1D
         LDA   #$08
         ADC   L7FB0,X
         STA   $1A
         STA   $1E
         JSR   L5828
         JMP   L44C4

L4C2D    LDX   $02
         LDA   #$50
         CLC
         ADC   L7FA9,X
         STA   $19
         STA   $1D
         LDA   #$09
         ADC   L7FB0,X
         STA   $1A
         STA   $1E
         JSR   L5828
         JMP   L44C4

L4C48    LDX   $16
         LDA   L7EA5,X
         CMP   $05
         BNE   L4C67
         CPX   #$03
         BEQ   L4C64
         CPX   #$06
         BEQ   L4C64
         CPX   #$09
         BEQ   L4C64
         LDA   #$FF
         STA   $16
         JMP   L44C4
L4C64    JMP   L4CD4

L4C67    LDA   $05
         STA   $06
         LDA   $16
         CMP   #$30
         BCC   L4C87
         CMP   #$32
         BCS   L4C87
         LDA   $B2
         CMP   #$44
         BCC   L4C87
         LDA   $05
         CMP   #$3F
         BCC   L4C87
         CMP   $B2
         BEQ   L4C89
         BCC   L4C89
L4C87    DEC   $06
L4C89    JMP   L4CA2

L4C8C    LDX   $16
         LDA   L7EE5,X
         CMP   $05
         BNE   L4C9C
         LDA   #$FF
         STA   $16
         JMP   L44C4

L4C9C    LDA   $05
         STA   $06
         INC   $06
L4CA2    LDA   $18
         CMP   #$06
         BCC   L4CAC
         LDA   #$FF
         STA   $18
L4CAC    INC   $18
         JMP   L47E0

L4CB1    LDX   $16
         LDA   L7EA5,X
         CMP   $05
         BEQ   L4CC4
         LDA   L7EE5,X
         CMP   $05
         BEQ   L4CD0
         JMP   L4CD4

L4CC4    CPX   #$03
         BEQ   L4CD4
         CPX   #$06
         BEQ   L4CD4
         CPX   #$09
         BEQ   L4CD4
L4CD0    LDA   #$FF
         STA   $16
L4CD4    LDA   $5C
         BNE   L4CE0
         LDX   $60
         LDA   L812F,X
         JMP   L4D13

L4CE0    CMP   #$03
         BEQ   L4D11
         CMP   #$02
         BEQ   L4D09
         LDX   $75
         LDA   L8137,X
         STA   $0E
         LDA   $AF00
         BEQ   L4D04
         LDA   #$00
         STA   $AF00
         LDA   $0E
         CMP   #$11
         BCC   L4D1A
         SEC
         SBC   #$10
         STA   $0E
L4D04    LDA   $0E
         JMP   L4D13

L4D09    LDX   $83
         LDA   L813D,X
         JMP   L4D13

L4D11    LDA   #$28
L4D13    CMP   #$01
         BEQ   L4D1A
         JSR   WAIT
L4D1A    LDA   $B4
         BNE   L4D21
         JSR   L7DF6
L4D21    JMP   L44C4

L4D24    LDX   $5C
         LDA   L7FA0,X
         TAY
         LDX   #$00
L4D2C    LDA   L7F3D,Y
         CMP   $04
         BEQ   L4D3C
L4D33    INX
         INY
         CPX   #$10
         BNE   L4D2C
L4D39    JMP   L4648

L4D3C    LDA   L7EA5,Y
         STA   $0E
         SEC
         SBC   #$01
         STA   $AD
         CLC
         ADC   #$02
         STA   $56
         LDA   $05
         CMP   $0E
         BEQ   L4D82
         CMP   $AD
         BEQ   L4D82
         CMP   $56
         BEQ   L4D82
         LDA   L7EE5,Y
         STA   $0E
         SEC
         SBC   #$01
         STA   $AD
         CLC
         ADC   #$02
         STA   $56
         LDA   $05
         CMP   $0E
         BEQ   L4D79
         CMP   $AD
         BEQ   L4D79
         CMP   $56
         BEQ   L4D79
         JMP   L4D33

L4D79    LDA   $17
         BEQ   L4D39
         STY   $16
         JMP   L4C48

L4D82    LDA   $17
         BNE   L4D39
         STY   $16
         JMP   L4C8C

L4D8B    LDA   #$00
         STA   $07
         LDA   $B4
         BNE   L4D96
         JSR   L7D96
L4D96    LDA   $04
         STA   $03
         LDA   $05
         STA   $06
         LDA   $02
         CMP   #$04
         BEQ   L4DB3
         CMP   #$00
         BNE   L4DB5
         LDA   $03
         BNE   L4DAF
         JMP   L4E71

L4DAF    LDA   #$07
         STA   $02
L4DB3    DEC   $03
L4DB5    DEC   $02
L4DB7    LDX   $02
         LDA   $5A
         CMP   #$05
         BCS   L4DDD
         LDA   #<L1280
         CLC
         ADC   L7FBC,X
         STA   $EB
         STA   $0C
         LDA   #>L1280
L4DCB    ADC   L7FC3,X
         STA   $EC
         STA   $0F
         LDA   #$14
         STA   $08
         LDA   #$04
         STA   $58
         JMP   L4813

L4DDD    LDA   $5B
         CMP   #$19
         BCS   L4DF2
         LDA   #$E0
         CLC
         ADC   L7FBC,X
         STA   $EB
         STA   $0C
         LDA   #$16
         JMP   L4DCB

L4DF2    LDA   #$1F
         CLC
         ADC   L7FBC,X
         STA   $EB
         STA   $0C
         LDA   #$8D
         JMP   L4DCB

L4E01    LDA   #$01
         STA   $07
         LDA   $B4
         BNE   L4E0C
         JSR   L7D96
L4E0C    LDA   $04
         STA   $03
         LDA   $05
         STA   $06
         LDA   $02
         CMP   #$03
         BEQ   L4E2B
         CMP   #$06
         BNE   L4E2D
         LDA   $03
         CMP   #$23
         BCC   L4E27
         JMP   L4E9D

L4E27    LDA   #$FF
         STA   $02
L4E2B    INC   $03
L4E2D    INC   $02
L4E2F    LDX   $02
         LDA   $5A
         CMP   #$05
         BCS   L4E46
         LDA   #$B0
         CLC
         ADC   L7FBC,X
         STA   $EB
         STA   $0C
         LDA   #$14
         JMP   L4DCB

L4E46    LDA   $5B
         CMP   #$19
         BCS   L4E5B
         LDA   #$9B
         CLC
         ADC   L7FBC,X
         STA   $EB
         STA   $0C
         LDA   #$88
         JMP   L4DCB

L4E5B    LDA   #$4F
         CLC
         ADC   L7FBC,X
         STA   $EB
         STA   $0C
         LDA   #$8F
         JMP   L4DCB

L4E6A    LDA   $B4
         BNE   L4E71
         JSR   L7DF6
L4E71    LDA   $04
         STA   $03
         LDA   $05
         STA   $06
         LDX   $02
         LDA   $5A
         CMP   #$05
         BCS   L4E90
         LDA   #$80
         CLC
         ADC   L7FBC,X
         STA   $EB
         STA   $0C
         LDA   #$12
         JMP   L4DCB
L4E90    JMP   L4DDD
L4E93    JMP   L4E46

L4E96    LDA   $B4
         BNE   L4E9D
         JSR   L7DF6
L4E9D    LDA   $04
         STA   $03
         LDA   $05
         STA   $06
         LDX   $02
         LDA   $5A
         CMP   #$05
         BCS   L4E93
         LDA   #$B0
         CLC
         ADC   L7FBC,X
         STA   $EB
         STA   $0C
         LDA   #$14
         JMP   L4DCB

L4EBC    LDX   $11
         LDA   L80F5,X
         STA   $0E
         LDA   $04
         STA   $03
         LDA   $05
         STA   $06
         LDA   $1D
         STA   $EB
         LDA   $1E
         STA   $EC
         LDA   $07
         BNE   L4EE1
         JSR   L4F85
         LDA   $12
         BEQ   L4EEB
         JMP   L4F03

L4EE1    JSR   L4FCC
         LDA   $12
         BEQ   L4EF7
         JMP   L4F03

L4EEB    LDA   $0E
         BEQ   L4F03
         JSR   L4F6C
         DEC   $0E
         JMP   L4EEB

L4EF7    LDA   $0E
         BEQ   L4F03
         JSR   L4FB1
         DEC   $0E
         JMP   L4EF7

L4F03    LDX   $11
         LDA   L8110,X
         STA   $0E
         CPX   #$0B
         BCS   L4F19
L4F0E    LDA   $0E
         BEQ   L4F24
         DEC   $06
         DEC   $0E
         JMP   L4F0E

L4F19    LDA   $0E
         BEQ   L4F24
         INC   $06
         DEC   $0E
         JMP   L4F19

L4F24    LDA   #$10
         STA   $08
         LDA   #$03
         STA   $58
         LDA   $57
         BEQ   L4F36
         INC   $58
         LDA   #$14
         STA   $08
L4F36    INC   $11
         LDA   $11
         CMP   #$1B
         BNE   L4F51
         LDA   #$00
         STA   $11
         STA   $10
         STA   $12
         STA   $B5
         LDA   #$03
         STA   $9E
         STA   $BB
         JMP   L4813

L4F51    LDX   $11
         LDA   L8701,X
         STA   $00
         LDA   #$03
         STA   $01
         JSR   L7DC4
         LDX   #$00
         LDY   #$03
L4F63    INX
         BNE   L4F63
         DEY
         BNE   L4F63
         JMP   L4813

L4F6C    LDA   $02
         CMP   #$04
         BEQ   L4F81
         CMP   #$00
         BNE   L4F83
         LDA   $03
         BNE   L4F7D
         INC   $07
         RTS

L4F7D    LDA   #$07
         STA   $02
L4F81    DEC   $03
L4F83    DEC   $02
L4F85    LDX   $02
         LDA   $57
         BNE   L4F9F
         LDA   #<L0D40
         CLC
         ADC   L7FA9,X
         STA   $EB
         STA   $0C
         LDA   #>L0D40
L4F97    ADC   L7FB0,X
L4F9A    STA   $EC
         STA   $0F
         RTS

L4F9F    LDA   #<L1280
         CLC
         ADC   L7FBC,X
         STA   $EB
         STA   $0C
         LDA   #>L1280
         ADC   L7FC3,X
         JMP   L4F9A

L4FB1    LDA   $02
         CMP   #$03
         BEQ   L4FC8
         CMP   #$06
         BNE   L4FCA
         LDA   $03
         CMP   #$24
         BCC   L4FC4
         DEC   $07
         RTS

L4FC4    LDA   #$FF
         STA   $02
L4FC8    INC   $03
L4FCA    INC   $02
L4FCC    LDX   $02
         LDA   $57
         BNE   L4FE1
         LDA   #$90
         CLC
         ADC   L7FA9,X
         STA   $EB
         STA   $0C
         LDA   #$0E
         JMP   L4F97

L4FE1    LDA   #$B0
         CLC
         ADC   L7FBC,X
         STA   $EB
         STA   $0C
         LDA   #$14
         ADC   L7FC3,X
         JMP   L4F9A

         BIT   KBDSTROBE
L4FF6    LDA   KBD
         BMI   L4FFE
         JMP   L4FF6

L4FFE    BIT   KBDSTROBE
         RTS

L5002    LDA   #$00
         STA   $65
         STA   $64
         LDA   $5F
         BNE   L502E
         LDA   $A2
         BNE   L5059
         LDA   $8D
         AND   #$01
         BNE   L502E
         LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   L802F,X
         STA   $92
         LDA   $8D
         BEQ   L502B
         LDA   $92
         EOR   #$01
         STA   $92
L502B    JSR   L609D
L502E    LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   $60
         CMP   L7FFF,X
         BCS   L50AE
         LDA   L7FFF,X
         STA   $AD
         LDA   $6B
         BNE   L50B1
         LDA   $6D
         CMP   L8005,X
         BCC   L504E
         JMP   L5059

L504E    LDA   $5F
         CLC
         ADC   $6C
         STA   $6C
         AND   #$1F
         BNE   L50B1
L5059    JMP   L64DE

L505C    LDX   #$00
L505E    LDA   L4043,X
         CMP   #$FF
         BEQ   L506D
         INX
         CPX   $AD
         BNE   L505E
         JMP   L50B1

L506D    LDA   $5F
         EOR   $14
         CLC
         ADC   $6C
         STA   $6C
         AND   #$07
         BNE   L507F
         LDA   #$13
         JMP   L5081

L507F    LDA   #$14
L5081    STA   L4043,X
         STA   $0D
         LDA   #$1F
         STA   L404D,X
         STA   $0A
         LDA   #$00
         STA   L4039,X
         STA   L4057,X
         LDA   #$08
         STA   $08
         LDA   #$03
         STA   $0E
         LDA   #$20
         STA   $19
         LDA   #$AB
         STA   $1A
         JSR   L5828
         INC   $60
         LDA   #$00
         STA   $6D
L50AE    JMP   L5337

L50B1    INC   $6D
         JMP   L5337

L50B6    LDX   $65
         LDA   L404D,X
         STA   $0E
         LDX   #$00
L50BF    LDA   $0E
         CMP   L815D,X
         BCC   L50CB
         INX
         CPX   #$04
         BNE   L50BF
L50CB    LDA   L7FA4,X
         STA   $66
         LDX   $65
         LDA   L404D,X
         CLC
         ADC   #$08
         TAY
         LDA   L4043,X
         CLC
         ADC   #$01
         STA   $0D
         JSR   L5847
         LDA   ($1B),Y
         AND   #$7F
         BNE   L5104
L50EA    LDX   $65
         LDA   L404D,X
         CLC
         ADC   #$01
         STA   $61
L50F4    INC   L4057,X
         LDA   L4043,X
         STA   $62
         LDA   L4039,X
         STA   $63
         JMP   L5259

L5104    STA   $0E
         LDX   $65
         LDA   L4057,X
         BEQ   L5124
         LDA   L4043,X
         AND   #$01
         TAX
         LDA   L7FE0,X
         CMP   $0E
         BNE   L50EA
         LDX   $65
         LDA   #$00
         STA   L4057,X
L5121    JMP   L51B0

L5124    LDX   $65
         LDA   L404D,X
         STA   $0E
         LDX   #$00
L512D    LDA   $0E
         CMP   L815D,X
         BCC   L5139
         INX
         CPX   #$04
         BNE   L512D
L5139    STX   $AD
         LDX   $65
         LDA   L4043,X
         CMP   #$03
         BCC   L5121
         STA   $0E
         LDX   $AD
         LDA   L82AD,X
         TAX
         LDY   #$00
L514E    LDA   L829E,X
         CMP   #$28
         BCS   L5159
         CMP   $0E
         BEQ   L5162
L5159    INX
         INY
         CPY   #$03
         BNE   L514E
         JMP   L51B0

L5162    LDA   $5F
         AND   #$0F
         CLC
         ADC   $6C
         CLC
         ADC   $6D
         STA   $6C
         AND   #$1F
         STA   $A9
         LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   $A9
         CMP   L8029,X
         BCS   L51B0
         LDA   $66
         BEQ   L518F
         LDA   $04
         LDX   $65
         CMP   L4043,X
         BCS   L51B0
         JMP   L5198

L518F    LDA   $04
         LDX   $65
         CMP   L4043,X
         BCC   L51B0
L5198    LDX   $65
         LDA   L4043,X
         CMP   #$03
         BCC   L51B0
         CMP   #$28
         BCS   L51B0
         LDA   L404D,X
         CLC
         ADC   #$05
         STA   $61
         JMP   L50F4

L51B0    LDX   $65
         LDA   L4039,X
         STA   $63
         LDA   L404D,X
         STA   $61
         LDA   L4043,X
         STA   $62
         LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   L7FFF,X
         STA   $0E
         LDX   #$00
L51CE    CPX   $65
         BEQ   L51EC
         LDA   L4043,X
         CMP   #$FE
         BCS   L51EC
         STA   $AD
         DEC   $AD
         LDY   #$00
L51DF    LDA   $62
         CMP   $AD
         BEQ   L51F4
         INC   $AD
         INY
         CPY   #$03
         BNE   L51DF
L51EC    INX
         CPX   $0E
         BNE   L51CE
         JMP   L520E

L51F4    LDA   $61
         CLC
         ADC   #$03
         CMP   L404D,X
         BCS   L51EC
         CLC
         ADC   #$06
         CMP   L404D,X
         BCC   L51EC
         LDA   L404D,X
         SEC
         SBC   #$01
         STA   $61
L520E    LDA   $66
         BNE   L5234
         DEC   $63
         LDA   $63
         CMP   #$FF
         BNE   L522D
         LDA   #$06
         STA   $63
L521E    DEC   $62
         LDA   $62
         CMP   #$D0
         BCC   L522A
         LDA   #$00
         STA   $62
L522A    JMP   L5259

L522D    CMP   #$03
         BEQ   L521E
         JMP   L5259

L5234    INC   $63
         LDA   $63
         CMP   #$07
         BNE   L524F
         LDA   #$00
         STA   $63
L5240    INC   $62
         LDA   $62
         CMP   #$27
         BCC   L524C
         LDA   #$25
         STA   $62
L524C    JMP   L5259

L524F    CMP   #$04
         BEQ   L5240
         JMP   L5259
L5256    JMP   L5335

L5259    LDX   $65
         LDA   L4043,X
         CMP   #$FE
         BEQ   L5256
         LDA   L4039,X
         CMP   #$FF
         BEQ   L5256
         TAX
         LDA   L7FD2,X
         CLC
         ADC   #$20
         STA   $ED
         LDA   #$00
         ADC   #$AB
         STA   $EE
         LDX   $63
         LDA   L7FD2,X
         CLC
         ADC   #$20
         STA   $F9
         LDA   #$00
         ADC   #$AB
         STA   $FA
         LDA   #$08
         STA   $08
         LDX   $65
         LDA   L404D,X
         STA   $0A
         LDA   $61
         STA   $0B
         LDX   #$00
L5299    LDY   $0A
         LDA   L871B,Y
         CLC
         LDX   $65
         ADC   L4043,X
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         LDA   #$03
         STA   $09
         LDX   #$00
         LDY   $0B
         LDA   L871B,Y
         CLC
         ADC   $62
         STA   $19
         LDA   L87DB,Y
         STA   $1A
         LDY   #$00
L52C2    LDA   ($ED,X)
         EOR   ($1B),Y
         STA   ($1B),Y
         LDA   ($F9,X)
         EOR   ($19),Y
         STA   ($19),Y
         INC   $ED
         BNE   L52D4
         INC   $EE
L52D4    INC   $F9
         BNE   L52DA
         INC   $FA
L52DA    INY
         DEC   $09
         BNE   L52C2
         INC   $0A
         INC   $0B
         DEC   $08
         BNE   L5299
         LDA   $61
         LDX   $65
         STA   L404D,X
         LDA   $63
         STA   L4039,X
         LDA   $62
         STA   L4043,X
         LDA   L404D,X
         CMP   #$96
         BCC   L5335
         LDA   $62
         CMP   #$03
         BCS   L5335
         STA   $0D
         LDX   $65
         LDA   #$FF
         STA   L4043,X
         STA   L404D,X
         STA   L4039,X
         LDA   #$08
         STA   $08
         LDA   #$03
         STA   $0E
         LDA   $61
         STA   $0A
         LDX   $63
         LDA   L7FD2,X
         CLC
         ADC   #$20
         STA   $19
         LDA   #$00
         ADC   #$AB
         STA   $1A
         JSR   L5828
         DEC   $60
L5335    INC   $65
L5337    LDX   $65
         LDY   $AB
         LDA   L40F9,Y
         TAY
         LDA   L7FFF,Y
         STA   $0E
         INC   $0E
         CPX   $0E
         BEQ   L5358
         LDA   L4043,X
         CMP   #$FF
         BEQ   L5335
         CMP   #$FE
         BEQ   L5335
         JMP   L50B6

L5358    LDA   #$00
         STA   $65
         INC   $5F
         LDA   $6B
         BNE   L5375
         INC   $64
         LDA   $64
         CMP   #$02
         BEQ   L5375
         LDX   $60
         LDA   L812F,X
         JSR   WAIT
         JMP   L50B6
L5375    RTS

L5376    LDA   #$00
         STA   $74
         LDX   $5C
         LDA   $75
         CMP   L8165,X
         BEQ   L539C
         LDA   $6D
         CMP   L800B,X
         BCC   L539C
         LDA   #$00
         STA   $6D
         LDX   #$00
L5390    LDA   L407A,X
         CMP   #$FF
         BEQ   L539F
         INX
         CPX   #$05
         BNE   L5390
L539C    JMP   L5403

L539F    LDA   #$10
         STA   $08
         LDA   #$03
         STA   $0E
         LDA   #$FF
         STA   L4084,X
         LDA   $04
         CMP   #$13
         BCC   L53C9
         LDA   #$00
         STA   L4075,X
         STA   L4093,X
         STA   L408E,X
         LDA   #$06
         STA   L407A,X
         STA   $0D
         LDA   #$01
         JMP   L53DB

L53C9    LDA   #$20
         STA   L407A,X
         STA   $0D
         LDA   #$00
         STA   L4075,X
         STA   L4093,X
         STA   L408E,X
L53DB    STA   L4089,X
         ASL
         CLC
         ADC   #$A7
         STA   $1A
         LDA   #$00
         STA   $19
         LDA   $5F
         CLC
         ADC   $6C
         STA   $6C
         AND   #$03
         TAY
         LDA   L8161,Y
         STA   L407F,X
         STA   $0A
         TYA
         STA   L4061,X
         INC   $75
         JSR   L5828
L5403    INC   $6D
         JMP   L54CD
L5408    JMP   L54CB

L540B    LDX   $74
         LDA   L4093,X
         TAY
         LDA   L4075,X
         CMP   #$FF
         BEQ   L5408
         TAX
         LDA   L7FA9,X
         CLC
         ADC   L81AB,Y
         STA   $ED
         LDA   L81AD,Y
         STA   $EE
         LDY   $74
         LDA   L4089,Y
         ADC   $EE
         CLC
         ADC   L4089,Y
         CLC
         ADC   L7FB0,X
         STA   $EE
         LDX   $72
         LDY   $57
         LDA   L7FA9,X
         CLC
         ADC   L81AB,Y
         STA   $F9
         LDA   $6E
         ADC   L81AD,Y
         CLC
         ADC   $6E
         CLC
         ADC   L7FB0,X
         STA   $FA
         LDA   #$10
         STA   $08
         LDX   $74
         LDA   L407F,X
         STA   $0A
         LDA   $71
         STA   $0B
L5462    LDY   $0A
         LDA   L871B,Y
         CLC
         LDX   $74
         ADC   L407A,X
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         LDA   #$03
         STA   $09
         LDX   #$00
         LDY   $0B
         LDA   L871B,Y
         CLC
         ADC   $73
         STA   $19
         LDA   L87DB,Y
         STA   $1A
         LDY   #$00
L548B    LDA   ($ED,X)
         EOR   ($1B),Y
         STA   ($1B),Y
         LDA   ($F9,X)
         EOR   ($19),Y
         STA   ($19),Y
         INC   $ED
         BNE   L549D
         INC   $EE
L549D    INC   $F9
         BNE   L54A3
         INC   $FA
L54A3    INY
         DEC   $09
         BNE   L548B
         INC   $0A
         INC   $0B
         DEC   $08
         BNE   L5462
         LDA   $71
         LDX   $74
         STA   L407F,X
         LDA   $72
         STA   L4075,X
         LDA   $73
         STA   L407A,X
         LDA   $6E
         STA   L4089,X
         LDA   $57
         STA   L4093,X
L54CB    INC   $74
L54CD    LDA   $74
         LDX   $5C
         CMP   L8165,X
         BEQ   L54E1
         TAX
         LDA   L407A,X
         CMP   #$FF
         BEQ   L54CB
         JMP   L54E2
L54E1    RTS

L54E2    LDX   $74
         LDA   L407F,X
         STA   $71
         LDA   L4075,X
         STA   $72
         LDA   L407A,X
         STA   $73
         LDA   L4089,X
         STA   $6E
         LDA   L4084,X
         CMP   #$FF
         BEQ   L554B
         LDA   L408E,X
         BEQ   L554B
         CMP   #$02
         BEQ   L552D
         DEC   $71
         LDA   L4084,X
         LDX   $5C
         CLC
         ADC   L7FA0,X
         TAX
         LDA   $71
         CMP   L7EA5,X
         BNE   L552A
         LDX   $74
         DEC   L4061,X
L5520    LDA   #$FF
         STA   L4084,X
         LDA   #$00
         STA   L408E,X
L552A    JMP   L540B

L552D    INC   $71
         LDA   L4084,X
         LDX   $5C
         CLC
         ADC   L7FA0,X
         TAX
         LDA   $71
         CMP   L7EE5,X
         BNE   L552A
         LDX   $74
         INC   L4061,X
         JMP   L5520
L5548    JMP   L55F4

L554B    LDA   $5F
         CLC
         ADC   $6C
         CLC
         ADC   $6D
         STA   $6C
         AND   #$03
         BNE   L5548
         LDX   $74
         LDA   L407A,X
         STA   $0E
         LDX   $5C
         LDA   L7FA0,X
         TAX
         LDY   #$00
L5568    LDA   L7F3D,X
         CMP   $0E
         BEQ   L5578
L556F    INX
         INY
         CPY   #$10
         BNE   L5568
         JMP   L55F4

L5578    STX   $AD
         LDX   $74
         LDA   L407F,X
         LDX   $AD
         CMP   L7EA5,X
         BEQ   L558E
         CMP   L7EE5,X
         BEQ   L55C1
         JMP   L556F

L558E    LDA   $5F
         CLC
         ADC   $6C
         CLC
         ADC   $6D
         CLC
         ADC   #$17
         STA   $6C
         AND   #$1F
         CMP   #$10
         BCS   L55F4
         CMP   #$04
         BCS   L55B1
         LDX   $74
         LDA   L407F,X
         CMP   $05
         BCC   L55B1
         JMP   L55F4

L55B1    LDX   $74
         TYA
         STA   L4084,X
         LDA   #$02
         STA   L408E,X
         INC   $71
         JMP   L540B

L55C1    LDA   $5F
         CLC
         ADC   $6C
         CLC
         ADC   $6D
         CLC
         ADC   #$17
         STA   $6C
         AND   #$1F
         CMP   #$10
         BCS   L55F4
         CMP   #$04
         BCS   L55E4
         LDX   $74
         LDA   L407F,X
         CMP   $05
         BCS   L55E4
         JMP   L55F4

L55E4    LDX   $74
         TYA
         STA   L4084,X
         LDA   #$01
         STA   L408E,X
         DEC   $71
         JMP   L540B

L55F4    LDA   $5F
         CLC
         ADC   $6C
         CLC
         ADC   #$11
         STA   $6C
         LSR
         AND   #$1F
         BNE   L561C
         LDX   $74
         LDA   L407F,X
         CMP   $05
         BNE   L561C
         LDA   L407A,X
         CMP   $04
         BCS   L5618
L5613    LDA   #$01
         JMP   L561A

L5618    LDA   #$00
L561A    STA   $6E
L561C    LDA   $6E
         BEQ   L5650
         LDA   $72
         CMP   #$03
         BNE   L5637
L5626    JSR   L56A2
         BCC   L562E
         JMP   L5618

L562E    LDA   $73
         CMP   #$25
         BEQ   L5618
         JMP   L563B

L5637    CMP   #$06
         BEQ   L5626
L563B    INC   $72
         LDA   $72
         CMP   #$04
         BEQ   L564B
         CMP   #$07
         BNE   L564D
         LDA   #$00
         STA   $72
L564B    INC   $73
L564D    JMP   L540B

L5650    LDA   $72
         CMP   #$00
         BNE   L5667
L5656    JSR   L5680
         BCC   L565E
         JMP   L5613

L565E    LDA   $73
         CMP   #$00
         BEQ   L5613
         JMP   L566B

L5667    CMP   #$04
         BEQ   L5656
L566B    DEC   $72
         LDA   $72
         CMP   #$03
         BEQ   L567B
         CMP   #$FF
         BNE   L567D
         LDA   #$06
         STA   $72
L567B    DEC   $73
L567D    JMP   L540B

L5680    LDA   #$00
         STA   $AD
L5684    LDX   $74
         LDA   L407F,X
         CLC
         ADC   #$10
         TAY
         LDA   L407A,X
         CLC
         ADC   $AD
         STA   $0D
         JSR   L5847
         LDA   ($1B),Y
         AND   #$7F
         BNE   L56A0
         SEC
         RTS

L56A0    CLC
         RTS

L56A2    LDA   #$02
         STA   $AD
         JMP   L5684

L56A9    LDA   $5C
         CMP   #$01
         BNE   L56D7
         LDX   #$00
         LDA   $05
         STA   $0E
         LDA   $57
         BEQ   L56C0
         LDA   $05
         CLC
         ADC   #$04
         STA   $0E
L56C0    LDA   L812B,X
         CMP   $0E
         BEQ   L56D8
         SEC
         SBC   #$01
         CMP   $0E
         BEQ   L56D8
         INX
         CPX   #$04
         BNE   L56C0
         LDA   #$FF
         STA   $BE
L56D7    RTS

L56D8    STX   $BE
         RTS

L56DB    LDA   $BE
         CMP   #$FF
         BEQ   L56F3
         LDA   $04
         CMP   #$1D
         BEQ   L574F
         CMP   #$07
         BEQ   L56F6
         CMP   #$08
         BEQ   L5707
         CMP   #$1E
         BEQ   L5707
L56F3    JMP   L5758

L56F6    LDX   $BE
L56F8    LDA   L4015,X
         BNE   L5707
         LDA   L40DF,X
         BNE   L5707
         LDA   #$01
         STA   L40DF,X
L5707    RTS

L5708    LDA   L8149,X
         STA   $0A
         LDA   L8141,X
         STA   $0D
         LDA   #$02
         STA   $0E
         LDA   #$06
         STA   $08
         LDA   #$BA
         STA   $19
         LDA   #$82
         STA   $1A
         STX   $A4
         JSR   L5828
         LDX   $A4
         LDA   L8149,X
         CLC
         ADC   #$07
         STA   $0A
         LDA   L8141,X
         STA   $0D
         LDA   #$01
         STA   $0E
         JSR   L70F7
         LDA   $AB
         ASL
         ASL
         ASL
         TAX
         INC   L402B,X
         JSR   L6FA1
         JSR   L6FC6
         INC   $A3
         RTS

L574F    LDA   $BE
         CLC
         ADC   #$04
         TAX
         JMP   L56F8

L5758    LDX   #$00
         LDA   $5C
         CMP   #$01
         BNE   L5777
L5760    LDA   L40DF,X
         BEQ   L5772
         LDA   #$00
         STA   L40DF,X
         LDA   #$FF
         STA   L4015,X
         JMP   L5708

L5772    INX
         CPX   #$08
         BNE   L5760
L5777    RTS

L5778    INC   $5E
         LDA   $5E
         CMP   #$02
         BEQ   L5781
         RTS

L5781    LDX   #$00
         STX   $5E
L5785    DEC   L401D,X
         LDA   L401D,X
         CMP   #$37
         BNE   L5794
         LDA   #$A0
         STA   L401D,X
L5794    INX
         CPX   #$03
         BNE   L5785
L5799    INC   L401D,X
         LDA   L401D,X
         CMP   #$A0
         BNE   L57A8
         LDA   #$37
         STA   L401D,X
L57A8    INX
         CPX   #$06
         BNE   L5799
         LDA   #$00
         STA   $0E
L57B1    LDX   $0E
         LDA   L4023,X
         STA   $0A
         LDA   L401D,X
         STA   $0B
         LDA   #$C6
         STA   $ED
         LDA   #$82
         STA   $EE
         LDA   #$05
         STA   $08
L57C9    LDY   $0A
         LDA   L871B,Y
         LDX   $0E
         CLC
         ADC   L8157,X
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         LDY   $0B
         LDA   L871B,Y
         CLC
         ADC   L8157,X
         STA   $19
         LDA   L87DB,Y
         STA   $1A
         LDX   #$00
         LDY   #$00
         LDA   #$03
         STA   $09
L57F3    LDA   ($ED,X)
         EOR   ($1B),Y
         STA   ($1B),Y
         LDA   ($ED,X)
         EOR   ($19),Y
         STA   ($19),Y
         INC   $ED
         BNE   L5805
         INC   $EE
L5805    INY
         DEC   $09
         BNE   L57F3
         INC   $0A
         INC   $0B
         DEC   $08
         BNE   L57C9
         INC   $0E
         LDA   $0E
         CMP   #$06
         BNE   L57B1
         LDX   #$00
L581C    LDA   L401D,X
         STA   L4023,X
         INX
         CPX   #$06
         BNE   L581C
         RTS

L5828    LDX   #$00
L582A    LDY   $0A
         JSR   L5847
L582F    LDA   ($19,X)
         EOR   ($1B),Y
         STA   ($1B),Y
         INC   $19
         BNE   L583B
         INC   $1A
L583B    INY
         DEC   $09
         BNE   L582F
         INC   $0A
         DEC   $08
         BNE   L582A
         RTS

L5847    LDA   L871B,Y
         CLC
         ADC   $0D
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         LDA   $0E
         STA   $09
         LDY   #$00
         RTS

L585B    LDA   #$00
         STA   $76
         LDA   $5C
         BNE   L5879
         LDA   $77
         CMP   #$02
         BCS   L58A5
         LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   $BD
         CMP   L8011,X
         BCC   L58A5
         JMP   L5893

L5879    LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   $77
         CMP   L8169,X
         BCS   L58A5
         LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   $BD
         CMP   L8017,X
         BCC   L58A5
L5893    LDA   #$00
         STA   $BD
         LDX   #$00
L5899    LDA   L40A2,X
         CMP   #$FF
         BEQ   L58A8
         INX
         CPX   #$05
         BNE   L5899
L58A5    JMP   L5910

L58A8    LDA   #$10
         STA   $08
         LDA   #$03
         STA   $0E
         LDA   $5C
         BNE   L58C0
         LDA   #$02
         STA   L40A2,X
         STA   $0D
         LDA   #$01
         JMP   L58DB

L58C0    LDA   $04
         CMP   #$13
         BCC   L58D2
         LDA   #$16
         STA   L40A2,X
         STA   $0D
         LDA   #$01
         JMP   L58DB

L58D2    LDA   #$10
         STA   L40A2,X
         STA   $0D
         LDA   #$00
L58DB    STA   L40AC,X
         LDA   #$A7
         STA   $1A
         LDA   #$00
         STA   $19
         LDA   #$00
         STA   L40A7,X
         STA   L4098,X
         STA   L40B6,X
         LDA   $5C
         BNE   L58FF
         LDA   #$8F
         STA   L409D,X
         STA   $0A
         JMP   L5906

L58FF    LDA   #$44
         STA   L409D,X
         STA   $0A
L5906    LDA   #$FF
         STA   L40B1,X
         INC   $77
         JSR   L5828
L5910    INC   $BD
         JMP   L59C6
L5915    JMP   L59C4

L5918    LDX   $76
         LDA   L4098,X
         TAY
         LDA   L40A7,X
         CMP   #$FF
         BEQ   L5915
         TAX
         LDA   L7FA9,X
         CLC
         ADC   L81AF,Y
         STA   $ED
         LDA   L81B1,Y
         ADC   L7FB0,X
         STA   $EE
         LDX   $7A
         LDY   $57
         LDA   L7FA9,X
         CLC
         ADC   L81AF,Y
         STA   $F9
         LDA   L81B1,Y
         ADC   L7FB0,X
         STA   $FA
         LDA   #$10
         STA   $08
         LDX   $76
         LDA   L409D,X
         STA   $0A
         LDA   $78
         STA   $0B
L595B    LDY   $0A
         LDA   L871B,Y
         CLC
         LDX   $76
         ADC   L40A2,X
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         LDA   #$03
         STA   $09
         LDY   $0B
         LDA   L871B,Y
         CLC
         ADC   $79
         STA   $19
         LDA   L87DB,Y
         STA   $1A
         LDY   #$00
         LDX   #$00
L5984    LDA   ($ED,X)
         EOR   ($1B),Y
         STA   ($1B),Y
         LDA   ($F9,X)
         EOR   ($19),Y
         STA   ($19),Y
         INC   $ED
         BNE   L5996
         INC   $EE
L5996    INC   $F9
         BNE   L599C
         INC   $FA
L599C    INY
         DEC   $09
         BNE   L5984
         INC   $0A
         INC   $0B
         DEC   $08
         BNE   L595B
         LDA   $78
         LDX   $76
         STA   L409D,X
         LDA   $7A
         STA   L40A7,X
         LDA   $79
         STA   L40A2,X
         LDA   $7B
         STA   L40AC,X
         LDA   $57
         STA   L4098,X
L59C4    INC   $76
L59C6    LDA   $76
         LDX   $5C
         CPX   #$00
         BEQ   L59E7
         LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   $76
         CMP   L8169,X
         BEQ   L59E6
L59DB    TAX
         LDA   L40A2,X
         CMP   #$FF
         BEQ   L59C4
         JMP   L59EE
L59E6    RTS

L59E7    CMP   #$02
         BEQ   L59E6
         JMP   L59DB

L59EE    LDX   $76
         LDA   L409D,X
         STA   $78
         LDA   L40A7,X
         STA   $7A
         LDA   L40A2,X
         STA   $79
         LDA   L40AC,X
         STA   $7B
         LDA   L40B1,X
         CMP   #$FF
         BEQ   L5A4C
         LDA   L40B6,X
         BEQ   L5A4C
         CMP   #$02
         BEQ   L5A36
         DEC   $78
         LDA   L40B1,X
         LDX   $5C
         CLC
         ADC   L7FA0,X
         TAX
         LDA   $78
         CMP   L7EA5,X
         BNE   L5A33
L5A27    LDX   $76
         LDA   #$FF
         STA   L40B1,X
         LDA   #$00
         STA   L40B6,X
L5A33    JMP   L5918

L5A36    INC   $78
         LDA   L40B1,X
         LDX   $5C
         CLC
         ADC   L7FA0,X
         TAX
         LDA   $78
         CMP   L7EE5,X
         BNE   L5A33
         JMP   L5A27

L5A4C    LDA   $5F
         CLC
         ADC   $6C
         CLC
         ADC   #$17
         STA   $6C
         AND   #$07
         CMP   #$03
         BCS   L5A78
         LDX   $76
         LDA   L40A2,X
         STA   $0E
         LDX   $5C
         LDA   L7FA0,X
         TAX
         LDY   #$00
L5A6B    LDA   L7F3D,X
         CMP   $0E
         BEQ   L5A7B
L5A72    INX
         INY
         CPY   #$0C
         BNE   L5A6B
L5A78    JMP   L5AEB

L5A7B    STX   $AD
         LDX   $76
         LDA   L409D,X
         LDX   $AD
         CMP   L7EA5,X
         BEQ   L5A91
         CMP   L7EE5,X
         BEQ   L5ABB
         JMP   L5A72

L5A91    LDA   $5F
         CLC
         ADC   $6C
         CLC
         ADC   $BD
         STA   $6C
         AND   #$1F
         CMP   #$10
         BCS   L5AEB
         CMP   #$0A
         BCS   L5AAB
         LDA   $78
         CMP   $05
         BCS   L5A78
L5AAB    LDX   $76
         TYA
         STA   L40B1,X
         LDA   #$02
         STA   L40B6,X
         INC   $78
         JMP   L5918

L5ABB    LDA   $5F
         CLC
         ADC   $6C
         CLC
         ADC   $BD
         STA   $6C
         AND   #$1F
         CMP   #$10
         BCS   L5AEB
         CMP   #$0A
         BCS   L5AD5
         LDA   $78
         CMP   $05
         BCC   L5AEB
L5AD5    LDA   $78
         CMP   #$1B
         BCC   L5AEB
         LDX   $76
         TYA
         STA   L40B1,X
         LDA   #$01
         STA   L40B6,X
         DEC   $78
         JMP   L5918

L5AEB    LDA   $5C
         ASL
         STA   $0E
         LDA   $79
         AND   #$01
         CLC
         ADC   $0E
         TAX
         LDA   L7FE0,X
         STA   $56
         LDA   #$00
         STA   $1A
         LDY   $76
         LDA   L40A7,Y
         TAX
         LDA   L7FA9,X
         CLC
         ADC   #$00
         BCC   L5B11
         INC   $1A
L5B11    CLC
         ADC   #$25
         STA   $19
         LDA   #$A7
         ADC   L7FB0,X
         CLC
         ADC   $1A
         STA   $1A
         LDA   L409D,Y
         CLC
         ADC   #$0C
         TAX
         LDA   L40A2,Y
         CLC
         ADC   #$01
         STA   $0D
         TXA
         TAY
         JSR   L5847
         LDX   #$00
         LDA   ($1B),Y
         EOR   ($19,X)
         AND   #$7F
         CMP   $56
         BNE   L5B4A
         LDA   $78
         SEC
         SBC   #$04
         STA   $78
         JMP   L5918

L5B4A    LDA   $19
         CLC
         ADC   #$09
         STA   $19
         BCC   L5B55
         INC   $1A
L5B55    LDX   $76
         LDA   L409D,X
         CLC
         ADC   #$0F
         TAY
         LDA   L40A2,X
         CLC
         ADC   #$01
         STA   $0D
         JSR   L5847
         LDX   #$00
         LDA   ($1B),Y
         EOR   ($19,X)
         AND   #$7F
         CMP   $56
         BNE   L5B7A
         DEC   $78
         JMP   L5918

L5B7A    LDX   $76
         LDA   L409D,X
         CLC
         ADC   #$10
         TAY
         LDA   L40A2,X
         CLC
         ADC   #$01
         STA   $0D
         JSR   L5847
         LDA   ($1B),Y
         AND   #$7F
         CMP   $56
         BEQ   L5B9B
         INC   $78
         JMP   L5918

L5B9B    LDA   $5F
         CLC
         ADC   $6C
         CLC
         ADC   $BD
         STA   $6C
         LSR
         AND   #$3F
         BNE   L5BBA
         LDA   $79
         CMP   #$0E
         BCC   L5BB4
         CMP   #$18
         BCC   L5BBA
L5BB4    LDA   $7B
         EOR   #$01
         STA   $7B
L5BBA    LDA   $7B
         BEQ   L5C15
         LDA   $7A
         CMP   #$03
         BNE   L5C02
L5BC4    LDA   $79
         CMP   #$23
         BEQ   L5BB4
         CMP   #$0E
         BCC   L5BE0
         CMP   #$12
         BCS   L5BE0
         LDA   $5C
         BEQ   L5BFD
         LDA   $78
         CMP   #$3F
         BCC   L5BE0
         CMP   #$50
         BCC   L5BFA
L5BE0    LDA   $79
         CMP   #$08
         BEQ   L5BEA
         CMP   #$1A
         BNE   L5BFD
L5BEA    LDA   $78
         CMP   #$5B
         BCC   L5BFD
         CMP   #$6B
         BCS   L5BFD
         LDA   $7A
         CMP   #$02
         BCC   L5BFD
L5BFA    JMP   L5BB4

L5BFD    INC   $79
         JMP   L5C06

L5C02    CMP   #$06
         BEQ   L5BC4
L5C06    INC   $7A
         LDA   $7A
         CMP   #$07
         BNE   L5C12
         LDA   #$00
         STA   $7A
L5C12    JMP   L5918

L5C15    LDA   $7A
         BNE   L5C57
L5C19    LDA   $79
         CMP   #$01
         BEQ   L5BB4
         CMP   #$18
         BCS   L5C35
         CMP   #$13
         BCC   L5C35
         LDA   $5C
         BEQ   L5C52
         LDA   $78
         CMP   #$3F
         BCC   L5C35
         CMP   #$50
         BCC   L5C4F
L5C35    LDA   $79
         CMP   #$0C
         BEQ   L5C3F
         CMP   #$1E
         BNE   L5C52
L5C3F    LDA   $78
         CMP   #$5B
         BCC   L5C52
         CMP   #$6B
         BCS   L5C52
         LDA   $7A
         CMP   #$02
         BCS   L5C52
L5C4F    JMP   L5BB4

L5C52    DEC   $79
         JMP   L5C5B

L5C57    CMP   #$04
         BEQ   L5C19
L5C5B    DEC   $7A
         LDA   $7A
         CMP   #$FF
         BNE   L5C67
         LDA   #$06
         STA   $7A
L5C67    JMP   L5918

L5C6A    LDA   #$00
         STA   $7C
         STA   $64
         LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   $6D
         CMP   L801D,X
         BCC   L5CE3
         LDA   $83
         CMP   #$03
         BEQ   L5CE3
         LDA   #$00
         STA   $6D
         LDX   #$00
L5C89    LDA   L4003,X
         CMP   #$FF
         BEQ   L5C98
         INX
         CPX   #$03
         BNE   L5C89
         JMP   L5CE3

L5C98    LDA   $5F
         CLC
         ADC   $6C
         CLC
         ADC   #$17
         STA   $6C
         AND   #$03
         CMP   #$03
         BNE   L5CAA
         LDA   #$00
L5CAA    STA   L4012,X
         TAY
         LDA   #$00
         STA   L4009,X
         STA   L400F,X
         LDA   L7FCA,Y
         STA   L4003,X
         STA   $0D
         LDA   $84
         STA   L400C,X
         LDA   #$1A
         STA   L4006,X
         STA   $0A
         LDA   #$10
         STA   $08
         LDA   #$03
         STA   $0E
         LDA   #$00
         STA   $19
         LDA   $84
         ASL
         CLC
         ADC   #$B3
         STA   $1A
         JSR   L5828
         INC   $83
L5CE3    INC   $6D
         JMP   L5D9A
L5CE8    JMP   L5D98

L5CEB    LDX   $7C
         LDA   L4009,X
         CMP   #$FF
         BEQ   L5CE8
         TAX
         LDA   L7FA9,X
         STA   $ED
         LDY   $7C
         LDA   L400C,Y
         ASL
         CLC
         ADC   #$B3
         CLC
         ADC   L7FB0,X
         STA   $EE
         LDX   $7F
         LDA   L7FA9,X
         STA   $F9
         LDA   $84
         ASL
         CLC
         ADC   #$B3
         CLC
         ADC   L7FB0,X
         STA   $FA
         LDA   #$10
         STA   $08
         LDX   $7C
         LDA   L4006,X
         STA   $0A
         LDA   $7E
         STA   $0B
L5D2B    LDY   $0A
         LDX   $7C
         LDA   L4003,X
         AND   #$7F
         CLC
         ADC   L871B,Y
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         LDY   $0B
         LDA   $7D
         AND   #$7F
         CLC
         ADC   L871B,Y
         STA   $19
         LDA   L87DB,Y
         STA   $1A
         LDX   #$00
         LDY   #$00
         LDA   #$03
         STA   $09
L5D58    LDA   ($ED,X)
         EOR   ($1B),Y
         STA   ($1B),Y
         LDA   ($F9,X)
         EOR   ($19),Y
         STA   ($19),Y
         INC   $ED
         BNE   L5D6A
         INC   $EE
L5D6A    INC   $F9
         BNE   L5D70
         INC   $FA
L5D70    INY
         DEC   $09
         BNE   L5D58
         INC   $0A
         INC   $0B
         DEC   $08
         BNE   L5D2B
         LDA   $7E
         LDX   $7C
         STA   L4006,X
         LDA   $7F
         STA   L4009,X
         LDA   $7D
         STA   L4003,X
         LDA   $84
         STA   L400C,X
         LDA   $80
         STA   L400F,X
L5D98    INC   $7C
L5D9A    LDA   $7C
         CMP   #$03
         BEQ   L5DAB
         TAX
         LDA   L4003,X
         CMP   #$FF
         BEQ   L5D98
         JMP   L5DC5

L5DAB    LDA   #$00
         STA   $7C
         INC   $5F
         INC   $64
         LDA   $64
         CMP   #$02
         BEQ   L5DC4
         LDX   $83
         LDA   L813D,X
         JSR   WAIT
         JMP   L5D9A
L5DC4    RTS

L5DC5    LDX   $7C
         LDA   L4006,X
         STA   $7E
         LDA   L4003,X
         STA   $7D
         LDA   L4009,X
         STA   $7F
         LDA   L400F,X
         STA   $80
         LDA   L4012,X
         STA   $81
         LDA   $7D
         BMI   L5DFF
         LDA   $5F
         CLC
         ADC   $82
         CLC
         ADC   $6C
         STA   $6C
         AND   #$01
         CLC
         ADC   #$1E
         STA   $0E
         LDA   $7D
         CMP   $0E
         BCC   L5E02
         ORA   #$80
         STA   $7D
L5DFF    JMP   L5E5C

L5E02    INC   $80
         LDA   $80
         CMP   #$1B
         BNE   L5E11
         JSR   L7E77
         LDA   #$00
         STA   $80
L5E11    LDX   $81
         CLC
         ADC   L8255,X
         TAX
         LDA   L8204,X
         STA   $85
         LDA   L81B3,X
         STA   $86
L5E22    LDA   $85
         AND   #$7F
         BEQ   L5E2E
         JSR   L5E3B
         JMP   L5E22

L5E2E    LDA   $86
         BEQ   L5E38
         JSR   L5E47
         JMP   L5E2E
L5E38    JMP   L5EB3

L5E3B    DEC   $85
         LDA   $85
         BMI   L5E44
         DEC   $7E
         RTS

L5E44    INC   $7E
         RTS

L5E47    INC   $7F
         LDA   $7F
         CMP   #$04
         BEQ   L5E57
         CMP   #$07
         BNE   L5E59
         LDA   #$00
         STA   $7F
L5E57    INC   $7D
L5E59    DEC   $86
         RTS

L5E5C    LDA   $7E
         CMP   #$A7
         BCC   L5E9A
         STA   $0A
         LDA   $7D
         AND   #$7F
         STA   $0D
         LDA   #$10
         STA   $08
         LDA   #$03
         STA   $0E
         LDX   $7F
         LDA   L7FA9,X
         STA   $19
         LDY   $7C
         LDA   L400C,Y
         ASL
         CLC
         ADC   L7FB0,X
         CLC
         ADC   #$B3
         STA   $1A
         JSR   L5828
         DEC   $83
         LDX   $7C
         LDA   #$FF
         STA   L4003,X
         STA   L4009,X
         JMP   L5D98

L5E9A    INC   $7E
         INC   $7E
         INC   $82
         LDA   $82
         CMP   #$18
         BNE   L5EB0
         LDA   #$00
         STA   $82
         LDA   #$01
         EOR   $84
         STA   $84
L5EB0    JMP   L5CEB

L5EB3    LDA   $80
         CMP   #$07
         BCC   L5EC4
         CMP   #$13
         BCS   L5EC4
         LDA   #$01
         STA   $84
         JMP   L5CEB

L5EC4    LDA   #$00
         STA   $84
         JMP   L5CEB
L5ECB    JMP   L5F69

L5ECE    LDA   #$00
         STA   $87
         LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   $82
         CMP   L8023,X
         BCC   L5ECB
         LDA   $88
         CMP   #$05
         BEQ   L5ECB
         LDA   #$00
         STA   $82
         LDX   #$00
L5EEB    LDA   L40C0,X
         CMP   #$FF
         BEQ   L5EFA
         INX
         CPX   #$05
         BNE   L5EEB
         JMP   L5F69

L5EFA    LDA   $5F
         CLC
         ADC   $6C
         CLC
         ADC   #$17
         STA   $6C
         STA   $0E
         AND   #$01
         BNE   L5F13
         LDA   $0E
         LSR
         AND   #$01
         TAY
         JMP   L5F1C

L5F13    LDA   $0E
         LSR
         AND   #$01
         CLC
         ADC   #$02
         TAY
L5F1C    LDA   L817B,Y
         CPY   #$02
         BCC   L5F25
         EOR   $8B
L5F25    CMP   #$00
         BNE   L5F33
         INY
         CPY   #$04
         BNE   L5F1C
         LDY   #$00
         JMP   L5F1C

L5F33    LDA   L8177,Y
         STA   L40BB,X
         STA   $0A
         LDA   L8173,Y
         STA   L40C0,X
         STA   $0D
         LDA   #$08
         STA   $08
         LDA   #$04
         STA   $0E
         LDA   #$00
         STA   $19
         LDA   #$AA
         STA   $1A
         LDA   #$00
         STA   L40C5,X
         LDA   L816F,Y
         CPY   #$02
         BCC   L5F61
         EOR   $8B
L5F61    STA   L40CA,X
         JSR   L5828
         INC   $88
L5F69    INC   $82
         JMP   L5FED
L5F6E    JMP   L5FEB

L5F71    LDX   $87
         LDA   L40C5,X
         CMP   #$FF
         BEQ   L5F6E
         TAX
         LDA   L7FD9,X
         STA   $ED
         LDA   #$AA
         STA   $EE
         STA   $FA
         LDX   $8A
         LDA   L7FD9,X
         STA   $F9
         LDA   #$08
         STA   $08
         LDX   $87
         LDA   L40BB,X
         STA   $0A
L5F98    LDY   $0A
         LDA   L871B,Y
         CLC
         LDX   $87
         ADC   L40C0,X
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         STA   $1A
         LDA   L871B,Y
         CLC
         ADC   $89
         STA   $19
         LDX   #$00
         LDY   #$00
         LDA   #$04
         STA   $09
L5FBC    LDA   ($ED,X)
         EOR   ($1B),Y
         STA   ($1B),Y
         LDA   ($F9,X)
         EOR   ($19),Y
         STA   ($19),Y
         INC   $ED
         BNE   L5FCE
         INC   $EE
L5FCE    INC   $F9
         BNE   L5FD4
         INC   $FA
L5FD4    INY
         DEC   $09
         BNE   L5FBC
         INC   $0A
         DEC   $08
         BNE   L5F98
         LDX   $87
         LDA   $89
         STA   L40C0,X
         LDA   $8A
         STA   L40C5,X
L5FEB    INC   $87
L5FED    LDA   $87
         CMP   #$05
         BEQ   L5FFE
         TAX
         LDA   L40C0,X
         CMP   #$FF
         BEQ   L5FEB
         JMP   L5FFF
L5FFE    RTS

L5FFF    LDX   $87
         LDA   L40C0,X
         STA   $89
         LDA   L40C5,X
         STA   $8A
         LDA   L40CA,X
         BNE   L603E
         DEC   $8A
         LDA   $8A
         CMP   #$03
         BEQ   L6020
         CMP   #$FF
         BNE   L603B
         LDA   #$06
         STA   $8A
L6020    DEC   $89
         LDA   $89
         CMP   #$FF
         BNE   L602B
         JMP   L606C

L602B    LDA   L40BB,X
         CMP   #$4F
         BNE   L603B
         LDA   $89
         CMP   #$12
         BNE   L603B
         JMP   L606C
L603B    JMP   L5F71

L603E    INC   $8A
         LDA   $8A
         CMP   #$04
         BEQ   L604E
         CMP   #$07
         BNE   L6069
         LDA   #$00
         STA   $8A
L604E    INC   $89
         LDA   $89
         CMP   #$25
         BNE   L6059
         JMP   L606C

L6059    LDA   L40BB,X
         CMP   #$4F
         BNE   L6069
         LDA   $89
         CMP   #$12
         BNE   L6069
         JMP   L606C
L6069    JMP   L5F71

L606C    LDX   $87
         LDA   L40C5,X
         TAY
         LDA   L7FD9,Y
         STA   $19
         LDA   #$AA
         STA   $1A
         LDA   #$08
         STA   $08
         LDA   #$04
         STA   $0E
         LDA   L40BB,X
         STA   $0A
         LDA   L40C0,X
         STA   $0D
         LDA   #$FF
         STA   L40C0,X
         STA   L40C5,X
         DEC   $88
         JSR   L5828
         JMP   L5FEB

L609D    INC   $5F
         LDA   $8E
         BEQ   L60A4
         RTS

L60A4    LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   L7FFF,X
         STA   $0E
         INC   $0E
         LDX   #$00
L60B3    LDA   L4043,X
         CMP   #$FF
         BEQ   L60C0
         INX
         CPX   $0E
         BNE   L60B3
         RTS

L60C0    LDA   #$FE
         STA   L4043,X
         INC   $8E
         LDA   #$1F
         STA   $8F
         STA   $0A
         LDA   #$08
         STA   $08
         LDA   #$03
         STA   $0E
         LDA   #$00
         STA   $93
         STA   $91
         LDA   #$20
         STA   $19
         LDA   #$AC
         STA   $1A
         LDA   #$19
         STA   $90
         STA   $0D
         LDA   $60
         BEQ   L60FA
         LDA   $6C
         CLC
         ADC   $14
         AND   #$07
         BEQ   L60FA
         INC   $90
         INC   $0D
L60FA    JSR   L5828
         INC   $60
         RTS

L6100    LDA   $8E
         BNE   L6105
         RTS

L6105    LDA   $91
         STA   $96
         LDA   $90
         STA   $94
         LDA   $8F
         STA   $95
         LDX   $92
         CMP   L7FF0,X
         BCC   L611B
         JMP   L61D3

L611B    INC   $93
         LDA   $93
         CMP   #$29
         BNE   L6126
         JMP   L61D3

L6126    LDX   $92
         LDA   L8387,X
         CLC
         ADC   $93
         TAX
         LDA   L82E3,X
         STA   $86
         LDA   L8335,X
         STA   $85
L6139    LDA   $86
         AND   #$7F
         BEQ   L6145
         JSR   L6235
         JMP   L6139

L6145    LDA   $85
         BEQ   L614F
         JSR   L6261
         JMP   L6145

L614F    LDX   $91
         LDA   L8389,X
         CLC
         ADC   #$20
         STA   $ED
         LDA   #$AC
         ADC   #$00
         STA   $EE
         LDX   $96
         LDA   L8389,X
         CLC
         ADC   #$20
         STA   $F9
         LDA   #$AC
         ADC   #$00
         STA   $FA
         LDA   #$08
         STA   $08
         LDA   $8F
         STA   $0A
         LDA   $95
         STA   $0B
         LDX   #$00
L617D    LDY   $0A
         LDA   L871B,Y
         CLC
         ADC   $90
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         LDY   $0B
         LDA   L871B,Y
         CLC
         ADC   $94
         STA   $19
         LDA   L87DB,Y
         STA   $1A
         LDY   #$00
         LDA   #$03
         STA   $09
L61A1    LDA   ($ED,X)
         EOR   ($1B),Y
         STA   ($1B),Y
         LDA   ($F9,X)
         EOR   ($19),Y
         STA   ($19),Y
         INC   $ED
         BNE   L61B3
         INC   $EE
L61B3    INC   $F9
         BNE   L61B9
         INC   $FA
L61B9    INY
         DEC   $09
         BNE   L61A1
         INC   $0A
         INC   $0B
         DEC   $08
         BNE   L617D
         LDA   $95
         STA   $8F
         LDA   $94
         STA   $90
         LDA   $96
         STA   $91
         RTS

L61D3    LDA   $8F
         STA   $0A
         LDA   $90
         STA   $0D
         LDA   #$08
         STA   $08
         LDA   #$03
         STA   $0E
         LDX   $91
         LDA   L8389,X
         CLC
         ADC   #$20
         STA   $19
         LDA   #$AC
         ADC   #$00
         STA   $1A
         JSR   L5828
         DEC   $8E
         LDX   #$00
L61FA    LDA   L4043,X
         CMP   #$FE
         BEQ   L6207
         INX
         CPX   #$06
         BNE   L61FA
         RTS

L6207    LDA   $8F
         STA   L404D,X
         STA   $0A
         LDA   $90
         STA   L4043,X
         STA   $0D
         LDA   $91
         STA   L4039,X
         TAX
         LDA   L7FD2,X
         CLC
         ADC   #$20
         STA   $19
         LDA   #$00
         ADC   #$AB
         STA   $1A
         LDA   #$03
         STA   $0E
         LDA   #$08
         STA   $08
         JSR   L5828
         RTS

L6235    DEC   $86
         LDA   $86
         BMI   L624E
         DEC   $96
         LDA   $96
         CMP   #$03
         BEQ   L624B
         CMP   #$FF
         BNE   L624D
         LDA   #$06
         STA   $96
L624B    DEC   $94
L624D    RTS

L624E    INC   $96
         LDA   $96
         CMP   #$04
         BEQ   L625E
         CMP   #$07
         BNE   L6260
         LDA   #$00
         STA   $96
L625E    INC   $94
L6260    RTS

L6261    DEC   $85
         INC   $95
         INC   $95
         RTS

L6268    LDA   $98
         STA   $9A
         LDA   $97
         STA   $9B
         LDA   $9C
         BNE   L62AD
         DEC   $9B
         LDA   $9B
         CMP   #$03
         BEQ   L6284
         CMP   #$FF
         BNE   L62AA
         LDA   #$06
         STA   $9B
L6284    DEC   $9A
         LDA   $9A
         CMP   #$04
         BNE   L62C9
         LDA   #$01
         STA   $9C
         EOR   $8B
         STA   $8B
         LDX   #$00
L6296    LDA   L40BB,X
         CMP   #$80
         BCC   L62A5
         LDA   L40CA,X
         EOR   #$01
         STA   L40CA,X
L62A5    INX
         CPX   #$05
         BNE   L6296
L62AA    JMP   L62C9

L62AD    INC   $9B
         LDA   $9B
         CMP   #$04
         BEQ   L62BD
         CMP   #$07
         BNE   L62C9
         LDA   #$00
         STA   $9B
L62BD    INC   $9A
         LDA   $9A
         CMP   #$1E
         BNE   L62C9
         LDA   #$00
         STA   $9C
L62C9    LDX   $97
         LDA   L82D5,X
         CLC
         ADC   #$10
         STA   $ED
         LDA   L82DC,X
         ADC   #$19
         STA   $EE
         LDX   $9B
         LDA   L82D5,X
         CLC
         ADC   #$10
         STA   $F9
         LDA   L82DC,X
         ADC   #$19
         STA   $FA
         LDA   $99
         STA   $0A
         LDA   #$20
         STA   $08
         LDX   #$00
L62F5    LDY   $0A
         LDA   L871B,Y
         CLC
         ADC   $98
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         STA   $1A
         LDA   L871B,Y
         CLC
         ADC   $9A
         STA   $19
         LDY   #$00
         LDA   #$06
         STA   $09
L6314    LDA   ($ED,X)
         EOR   ($1B),Y
         STA   ($1B),Y
         LDA   ($F9,X)
         EOR   ($19),Y
         STA   ($19),Y
         INC   $ED
         BNE   L6326
         INC   $EE
L6326    INC   $F9
         BNE   L632C
         INC   $FA
L632C    INY
         DEC   $09
         BNE   L6314
         INC   $0A
         DEC   $08
         BNE   L62F5
         LDA   $9A
         STA   $98
         LDA   $9B
         STA   $97
         RTS

L6340    LDA   $04
         STA   $03
         LDA   $05
         STA   $06
         LDA   $8B
         STA   $0E
         LDA   $05
         CMP   #$47
         BNE   L6362
         LDA   #$01
         STA   $0E
         LDA   $03
         CMP   #$12
         BCC   L6362
         LDA   #$01
         EOR   $0E
         STA   $0E
L6362    LDA   $0E
         BNE   L6385
         LDA   $02
         CMP   #$04
         BEQ   L6370
         CMP   #$00
         BNE   L6380
L6370    LDA   $03
         BEQ   L63A3
         LDA   $02
         CMP   #$04
         BEQ   L637E
         LDA   #$07
         STA   $02
L637E    DEC   $03
L6380    DEC   $02
         JMP   L63A3

L6385    LDA   $02
         CMP   #$03
         BEQ   L638F
         CMP   #$06
         BNE   L63A1
L638F    LDA   $03
         CMP   #$24
         BCS   L63A3
         LDA   $02
         CMP   #$03
         BEQ   L639F
         LDA   #$FF
         STA   $02
L639F    INC   $03
L63A1    INC   $02
L63A3    LDA   $57
         BNE   L63B1
         LDA   $07
         BNE   L63AE
         JMP   L4716
L63AE    JMP   L4783

L63B1    LDA   $07
         BNE   L63B8
         JMP   L4DB7
L63B8    JMP   L4E2F

L63BB    LDX   $A0
         LDA   L817F,X
         CLC
         ADC   #$CC
         STA   $19
         LDA   #$83
         ADC   #$00
         STA   $1A
         LDX   $5C
         LDA   L7FE8,X
         STA   $0D
         LDA   L7FEC,X
         STA   $0A
         LDA   #$02
         STA   $0E
         LDA   #$0D
         STA   $08
         JSR   L5828
         LDA   #$01
         EOR   $A0
         STA   $A0
         TAX
         LDA   L817F,X
         CLC
         ADC   #$CC
         STA   $19
         LDA   #$83
         ADC   #$00
         STA   $1A
         LDX   $5C
         LDA   L7FE8,X
         STA   $0D
         LDA   L7FEC,X
         STA   $0A
         LDA   #$02
         STA   $0E
         LDA   #$0D
         STA   $08
         JSR   L5828
         RTS

L640F    LDX   $5C
         LDA   L84DE,X
         STA   $0D
         LDA   L84E2,X
         STA   $0A
         LDA   #$0F
         STA   $08
         LDA   #$02
         STA   $0E
         LDX   $A1
         LDA   L84DC,X
         CLC
         ADC   #$A0
         STA   $19
         LDA   #$84
         ADC   #$00
         STA   $1A
         JSR   L5828
         RTS

L6437    JSR   L640F
         LDA   #$01
         EOR   $A1
         STA   $A1
         JSR   L640F
         RTS

L6444    LDA   $5C
         ASL
         ASL
         TAX
         LDY   #$00
         LDA   $05
         STA   $0E
         LDA   $57
         BEQ   L645A
         LDA   $05
         CLC
         ADC   #$04
         STA   $0E
L645A    LDA   L8181,X
         CMP   $04
         BEQ   L646F
         CLC
         ADC   #$01
         CMP   $04
         BEQ   L646F
L6468    INX
         INY
         CPY   #$04
         BNE   L645A
         RTS

L646F    LDA   L8191,X
         CMP   $0E
         BNE   L6468
         LDA   L40CF,X
         BNE   L6468
         INC   L40CF,X
         LDA   L8181,X
         STA   $0D
         INC   $0D
         LDA   L8191,X
         STA   $0A
         LDA   #$10
         STA   $08
         LDA   #$02
         STA   $0E
         CPY   #$02
         BNE   L649E
         LDA   $5C
         CMP   #$02
         BNE   L649E
         LDY   #$04
L649E    LDA   L81A1,Y
         STA   $19
         LDA   L81A6,Y
         STA   $1A
         STX   $A4
         JSR   L5828
         LDX   $A4
         LDA   L8191,X
         CLC
         ADC   #$04
         STA   $0A
         LDA   L8181,X
         STA   $0D
         LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   $AB
         ASL
         ASL
         ASL
         TAY
         LDA   L8051,X
         STA   $0E
         CLC
         ADC   L402B,Y
         STA   L402B,Y
         JSR   L70F7
         JSR   L6FA1
         JSR   L6FC6
         RTS

L64DE    INC   $A2
         LDA   $A2
         CMP   #$01
         BNE   L64F3
         JSR   L651B
         LDA   #$C0
         STA   $19
         JSR   L6540
         JMP   L5337

L64F3    CMP   #$05
         BNE   L6508
         LDA   #$C0
         STA   $19
         JSR   L6540
         LDA   #$00
         STA   $19
         JSR   L6540
L6505    JMP   L5337

L6508    CMP   #$09
         BNE   L6505
         LDA   #$00
         STA   $19
         STA   $A2
         JSR   L6540
         JSR   L651B
         JMP   L505C

L651B    LDX   #$03
         LDA   L82D5,X
         CLC
         ADC   #$10
         STA   $19
         LDA   L82DC,X
         ADC   #$19
         STA   $1A
L652C    LDA   #$06
         STA   $0E
         LDA   #$20
         STA   $08
         LDA   #$17
         STA   $0D
         LDA   #$06
         STA   $0A
         JSR   L5828
         RTS

L6540    LDA   #$A0
         CLC
         ADC   $19
         STA   $19
         LDA   #$A9
         ADC   #$00
         STA   $1A
         JMP   L652C

L6550    LDA   $A2
         BNE   L6562
         LDA   $5F
         CLC
         ADC   $6C
         STA   $6C
         AND   #$3F
         CMP   #$3F
         BEQ   L6562
         RTS

L6562    INC   $A2
         LDA   $A2
         CMP   #$01
         BNE   L6595
         JSR   L65EE
         LDA   $19
         STA   $ED
         LDA   $1A
         STA   $EE
         LDA   #$00
         STA   $19
         JSR   L6607
         LDA   $19
         STA   $F9
         LDA   $1A
         STA   $FA
         JSR   L6617
         INC   $B9
         LDA   #$08
         STA   $01
         LDA   #$DC
         STA   $00
         JSR   L7DC4
         RTS

L6595    CMP   #$0C
         BNE   L65C8
         LDA   #$00
         STA   $19
         JSR   L6607
         LDA   $19
         STA   $ED
         LDA   $1A
         STA   $EE
         LDA   #$C0
         STA   $19
         JSR   L6607
         LDA   $19
         STA   $F9
         LDA   $1A
         STA   $FA
         JSR   L6617
         INC   $B9
         LDA   #$08
         STA   $01
         LDA   #$FA
         STA   $00
         JSR   L7DC4
         RTS

L65C8    CMP   #$17
         BNE   L65ED
         LDA   #$C0
         STA   $19
         JSR   L6607
         LDA   $19
         STA   $ED
         LDA   $1A
         STA   $EE
         JSR   L65EE
         LDA   $19
         STA   $F9
         LDA   $1A
         STA   $FA
         JSR   L6617
         LDA   #$00
         STA   $A2
L65ED    RTS

L65EE    LDA   #$10
         STA   $19
         LDA   #$19
         STA   $1A
L65F6    LDA   #$20
         STA   $08
         LDX   $5C
         LDA   L7F90,X
         STA   $0D
         LDA   L7F94,X
         STA   $0A
         RTS

L6607    LDA   #$00
         CLC
         ADC   $19
         STA   $19
         LDA   #$AF
         ADC   #$00
         STA   $1A
         JMP   L65F6

L6617    LDY   $0A
         LDA   L871B,Y
         CLC
         ADC   $0D
         STA   $19
         LDA   L87DB,Y
         STA   $1A
         LDY   #$00
         LDX   #$00
L662A    LDA   ($ED,X)
         EOR   ($19),Y
         STA   ($19),Y
         LDA   ($F9,X)
         EOR   ($19),Y
         STA   ($19),Y
         INC   $ED
         BNE   L663C
         INC   $EE
L663C    INC   $F9
         BNE   L6642
         INC   $FA
L6642    INY
         CPY   #$06
         BNE   L662A
         INC   $0A
         DEC   $08
         BNE   L6617
         RTS

L664E    LDA   $05
         STA   $0A
         LDA   $58
         STA   $0E
         LDA   $9F
         STA   $08
         LDA   $04
         STA   $0D
         LDA   $1D
         STA   $19
         LDA   $1E
         STA   $1A
         JSR   L5828
         LDA   #$00
         STA   $74
L666D    LDX   $74
         LDA   L407F,X
         STA   $0A
         LDA   L407A,X
         STA   $0D
         CMP   #$FF
         BEQ   L66B3
         LDA   #$10
         STA   $08
         LDA   #$03
         STA   $0E
         LDA   L4093,X
         TAY
         LDA   L4075,X
         CMP   #$FF
         BEQ   L66B3
         TAX
         LDA   L7FA9,X
         CLC
         ADC   L81AB,Y
         STA   $19
         LDA   L81AD,Y
         STA   $1A
         LDY   $74
         LDA   L4089,Y
         ADC   $1A
         CLC
         ADC   L4089,Y
         CLC
         ADC   L7FB0,X
         STA   $1A
         JSR   L5828
L66B3    INC   $74
         LDA   $74
         CMP   #$05
         BNE   L666D
L66BB    LDA   $A2
         BEQ   L66C5
         JSR   L6562
         JMP   L66BB

L66C5    JSR   L7128
         LDA   L40EB
         BNE   L66C5
         LDA   L40EC
         BNE   L66C5
         LDA   #$35
         STA   $0A
         LDA   #$AC
         STA   $0B
         JSR   L68EC
         LDA   #$A8
         JSR   L690F
         LDA   #$A3
         JSR   L690F
         LDA   #$9E
         JSR   L690F
         LDA   #$99
         JSR   L690F
         JSR   L6B8A
         LDA   #$00
         STA   $A2
         STA   $AD
L66FA    JSR   L6562
         JSR   L694B
         LDA   $A2
         BNE   L66FA
         INC   $AD
         LDA   $AD
         CMP   #$08
         BNE   L66FA
         JSR   L6B8A
         JSR   L6B8A
         JSR   L6B8A
         JSR   L65EE
         LDA   #$06
         STA   $0E
         JSR   L6C64
         LDA   #$1A
         STA   $AD
         STA   $0A
         LDX   $5C
         LDA   L7F90,X
         STA   $0D
         LDA   #$05
         STA   $0E
         LDA   #$20
         STA   $08
         LDA   #$90
         STA   $19
         LDA   #$B0
         STA   $1A
         JSR   L5828
         JSR   L694B
L6742    LDA   $AD
         STA   $0A
         CLC
         ADC   #$01
         STA   $0B
         LDA   #$20
         STA   $08
         LDA   #$90
         STA   $ED
         LDA   #$B0
         STA   $EE
L6757    LDY   $0A
         LDA   L871B,Y
         CLC
         ADC   $0D
         STA   $19
         LDA   L87DB,Y
         STA   $1A
         LDY   $0B
         LDA   L871B,Y
         CLC
         ADC   $0D
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         LDY   #$00
         LDX   #$00
L6779    LDA   ($ED,X)
         EOR   ($19),Y
         ORA   #$80
         STA   ($19),Y
         LDA   ($ED,X)
         EOR   ($1B),Y
         STA   ($1B),Y
         INC   $ED
         BNE   L678D
         INC   $EE
L678D    INY
         CPY   #$05
         BNE   L6779
         INC   $0A
         INC   $0B
         DEC   $08
         BNE   L6757
         JSR   L694B
         INC   $AD
         LDA   $AD
         STA   $00
         LDA   #$06
         STA   $01
         JSR   L7DC4
         LDA   $AD
         CMP   #$79
         BNE   L6742
         LDA   #$96
         STA   $01
         LDA   #$FF
         STA   $00
         JSR   L7DC4
         LDA   #$06
         STA   $AE
L67BF    JSR   L6B8A
         DEC   $AE
         BNE   L67BF
         LDA   #$00
         STA   $0A
         LDA   #$35
         STA   $0B
         JSR   L68EC
         LDA   #$AD
         STA   $0A
         LDA   #$35
         STA   $0B
         LDX   #$05
L67DB    LDY   $0A
         LDA   L871B,Y
         CLC
         ADC   #$08
         STA   $19
         LDA   L87DB,Y
         STA   $1A
         LDY   $0B
         LDA   L871B,Y
         CLC
         ADC   #$08
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         LDY   #$00
L67FB    LDA   ($19),Y
         STA   ($1B),Y
         INY
         CPY   #$18
         BNE   L67FB
         INC   $0A
         INC   $0B
         DEX
         BNE   L67DB
         LDA   #$0F
         STA   $08
         LDA   #$0E
         STA   $0D
         LDA   #$02
         STA   $0E
         LDA   #$26
         STA   $0A
         LDA   #$A0
         STA   $19
         LDA   #$84
         STA   $1A
         JSR   L5828
         LDA   #$25
         STA   $0A
         LDA   #$16
         STA   $0D
         LDA   #$03
         STA   $0E
         LDA   #$10
         STA   $08
         LDA   #$A0
         STA   $19
         LDA   #$0A
         STA   $1A
         JSR   L5828
         LDA   #$16
         STA   $0A
         LDA   #$04
         STA   $0E
         LDA   #$11
         STA   $0D
         LDA   #$10
         STA   $08
         LDA   #$16
         STA   $19
         LDA   #$85
         STA   $1A
         JSR   L5828
         LDX   $AB
         INC   L40F5,X
         INC   L40F9,X
         LDA   L40FB,X
         CMP   #$63
         BCS   L686E
         INC   L40FB,X
L686E    LDA   #$00
         STA   L40F7,X
         LDA   L7DB1+2
         CMP   #$C0
         BNE   L68A0
         LDA   #$00
         STA   $AE
L687E    LDX   $AE
         LDA   L80B3,X
         STA   $00
         LDA   L80C8,X
         STA   $01
         JSR   L7DC4
         LDA   #$01
         STA   $00
         LDA   #$08
         STA   $01
         JSR   L7DC4
         INC   $AE
         LDA   $AE
         CMP   #$15
         BNE   L687E
L68A0    JSR   L6B8A
         JSR   L6B8A
L68A6    JSR   L6B8A
         JSR   L6B8A
         LDA   $AB
         ASL
         ASL
         ASL
         TAX
         LDA   $A6
         CLC
         ADC   L402C,X
         STA   L402C,X
         LDA   $A7
         CLC
         ADC   L402B,X
         STA   L402B,X
         JSR   L6FA1
         JSR   L6B8A
         JSR   L6B8A
         LDX   $AB
         LDA   L40F9,X
         CMP   #$06
         BCC   L68DB
         LDA   #$05
         STA   L40F9,X
L68DB    LDX   $AB
         LDA   L40F5,X
         CMP   #$14
         BCC   L68E9
         LDA   #$0E
         STA   L40F5,X
L68E9    JMP   L4184

L68EC    LDY   $0A
         LDA   L871B,Y
         CLC
         ADC   #$09
         STA   $19
         LDA   L87DB,Y
         STA   $1A
         LDY   #$00
L68FD    LDA   #$00
         STA   ($19),Y
         INY
         CPY   #$16
         BNE   L68FD
         INC   $0A
         LDA   $0A
         CMP   $0B
         BNE   L68EC
         RTS

L690F    STA   $0B
         LDA   #$AD
         STA   $0A
         LDA   #$05
         STA   $08
L6919    LDY   $0A
         LDA   L871B,Y
         CLC
         ADC   #$0A
         STA   $19
         LDA   L87DB,Y
         STA   $1A
         LDY   $0B
         LDA   L871B,Y
         CLC
         ADC   #$0A
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         LDY   #$00
L6939    LDA   ($19),Y
         STA   ($1B),Y
         INY
         CPY   #$14
         BNE   L6939
         INC   $0A
         INC   $0B
         DEC   $08
         BNE   L6919
         RTS

L694B    LDX   #$00
         LDY   #$0A
L694F    INX
         BNE   L694F
         DEY
         BNE   L694F
         RTS

L6956    LDX   #$00
         LDY   #$6E
L695A    INX
         BNE   L695A
         DEY
         BNE   L695A
         RTS

L6961    LDX   #$00
         LDY   #$46
L6965    INX
         BNE   L6965
         DEY
         BNE   L6965
         RTS

L696C    LDX   $5C
         CPX   #$01
         BNE   L6973
L6972    RTS

L6973    LDA   $05
         CMP   L829A,X
         BNE   L6972
         LDA   $05
         STA   $0A
         LDA   $04
         STA   $0D
         LDA   #$03
         STA   $0E
         LDA   #$10
         STA   $08
         LDA   $1D
         STA   $19
         LDA   $1E
         STA   $1A
         JSR   L5828
         LDA   #$03
         STA   $0E
         LDA   #$10
         STA   $08
         LDA   $05
         STA   $0A
         LDX   $02
         LDA   $5C
         BEQ   L69B9
         LDA   #$A0
         CLC
         ADC   L7FA9,X
         STA   $19
         LDA   #$0A
         ADC   L7FB0,X
         STA   $1A
         JMP   L69C8

L69B9    LDA   #$F0
         CLC
         ADC   L7FA9,X
         STA   $19
         LDA   #$0B
         ADC   L7FB0,X
         STA   $1A
L69C8    JSR   L5828
         LDX   $5C
         LDA   L8288,X
         STA   $0A
         LDA   L828C,X
         STA   $0D
         LDA   #$10
         STA   $08
         LDA   #$04
         STA   $0E
         LDA   #$16
         STA   $19
         LDA   #$85
         STA   $1A
         JSR   L5828
         JSR   L6B8A
         JSR   L6B8A
         LDA   #$20
         STA   $08
         LDA   $98
         STA   $0D
         LDA   $99
         STA   $0A
         LDA   #$06
         STA   $0E
         LDA   $5C
         CMP   #$03
         BNE   L6A1D
         LDX   $97
         LDA   L82D5,X
         CLC
         ADC   #$10
         STA   $19
         LDA   L82DC,X
         ADC   #$19
         STA   $1A
         JSR   L5828
         JMP   L6A20

L6A1D    JSR   L6C64
L6A20    LDX   $5C
         LDA   L8292,X
         STA   $0A
         STA   $AD
         LDA   L8296,X
         STA   $0D
         STA   $98
         LDA   #$00
         STA   $97
         STA   $56
         LDA   #$05
         STA   $0E
         LDA   #$20
         STA   $08
         LDA   #$90
         STA   $19
         LDA   #$B0
         STA   $1A
         JSR   L5828
L6A49    LDA   $AD
         STA   $0A
         BEQ   L6A52
         SEC
         SBC   #$01
L6A52    STA   $0B
         LDA   #$20
         SEC
         SBC   $56
         STA   $08
         LDA   $97
         LSR
         LSR
         TAX
         LDA   L8290,X
         CLC
         ADC   #$90
         STA   $ED
         LDA   #$B0
         ADC   #$00
         STA   $EE
         LDX   $56
         CPX   #$00
         BEQ   L6A81
         DEX
         LDA   $ED
         CLC
         ADC   L8260,X
         STA   $ED
         BCC   L6A81
         INC   $EE
L6A81    INC   $97
         LDA   $97
         CMP   #$08
         BNE   L6A8D
         LDA   #$00
         STA   $97
L6A8D    LDA   $97
         LSR
         LSR
         TAX
         LDA   L8290,X
         CLC
         ADC   #$90
         STA   $F9
         LDA   #$B0
         ADC   #$00
         STA   $FA
         LDX   $56
         LDA   $F9
         CLC
         ADC   L8260,X
         STA   $F9
         BCC   L6AAE
         INC   $FA
L6AAE    LDY   $0A
         LDA   L871B,Y
         CLC
         ADC   $98
         STA   $19
         LDA   L87DB,Y
         STA   $1A
         LDY   $0B
         LDA   L871B,Y
         CLC
         ADC   $98
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         LDY   #$00
         LDX   #$00
L6AD0    LDA   ($ED,X)
         EOR   ($19),Y
         ORA   #$80
         STA   ($19),Y
         LDA   ($F9,X)
         EOR   ($1B),Y
         ORA   #$80
         STA   ($1B),Y
         INC   $ED
         BNE   L6AE6
         INC   $EE
L6AE6    INC   $F9
         BNE   L6AEC
         INC   $FA
L6AEC    INY
         CPY   #$05
         BNE   L6AD0
         INC   $0A
         INC   $0B
         DEC   $08
         BNE   L6AAE
         LDA   $56
         BEQ   L6B1D
         LDA   $98
         STA   $0D
         LDY   $0A
         JSR   L5847
         LDY   #$00
         LDX   #$00
L6B0A    LDA   ($ED,X)
         EOR   ($1B),Y
         ORA   #$80
         STA   ($1B),Y
         INC   $ED
         BNE   L6B18
         INC   $EE
L6B18    INY
         CPY   #$05
         BNE   L6B0A
L6B1D    JSR   L6961
         LDA   $AD
         BNE   L6B33
         INC   $56
         LDA   $56
         CMP   #$01
         BEQ   L6B43
         CMP   #$20
         BEQ   L6B38
         JMP   L6A49

L6B33    DEC   $AD
         JMP   L6A49

L6B38    LDX   $AB
         INC   L40F5,X
         INC   L40F7,X
         JMP   L68A6

L6B43    LDX   $5C
         LDA   L8288,X
         STA   $0A
         LDA   L828C,X
         STA   $0D
         LDA   #$10
         STA   $08
         LDA   #$04
         STA   $0E
         LDA   #$16
         STA   $19
         LDA   #$85
         STA   $1A
         JSR   L5828
         LDX   $5C
         LDA   L8288,X
         STA   $0A
         LDA   L828C,X
         STA   $0D
         LDA   #$10
         STA   $08
         LDA   #$04
         STA   $0E
         LDA   #$56
         STA   $19
         LDA   #$85
         STA   $1A
         JSR   L5828
         JSR   L640F
         JSR   L7E24
         JMP   L6A49

L6B8A    LDY   #$A0
         LDX   #$00
L6B8E    INX
         BNE   L6B8E
         DEY
         BNE   L6B8E
         RTS

L6B95    BIT   KBDSTROBE
         LDA   #$00
         STA   $AE
         STA   $BA
L6B9E    LDA   KBD
         BMI   L6BB6
         JSR   L694B
         INC   $AE
         BNE   L6B9E
         LDA   $BA
         EOR   #$01
         STA   $BA
         JSR   L6BC1
         JMP   L6B9E

L6BB6    BIT   KBDSTROBE
         LDA   $BA
         BEQ   L6BC0
         JSR   L6BC1
L6BC0    RTS

L6BC1    LDY   #$00
         STY   $19
         LDA   #$20
         STA   $1A
         STA   $08
L6BCB    LDA   ($19),Y
         EOR   #$FF
         STA   ($19),Y
         INY
         BNE   L6BCB
         INC   $1A
         DEC   $08
         BNE   L6BCB
         RTS

L6BDB    LDA   #$01
         STA   $B7F4
         STA   $B7EA
         STA   $B7E8
         LDA   #$00
         BIT   $B7EB
         STA   $AD
         LDX   $5C
         LDA   L7F83,X
         STA   $B7EC
         LDA   #$0F
         STA   $B7ED
         LDA   #$00
         STA   $B7F0
         LDA   #$20
         STA   $B7F1
L6C04    LDA   #$B7
         LDY   #$E8
         JSR   $B7B5
         INC   $B7F1
         DEC   $B7ED
         LDA   $B7ED
         CMP   #$FF
         BNE   L6C20
         LDA   #$0F
         STA   $B7ED
         DEC   $B7EC
L6C20    INC   $AD
         LDA   $AD
         CMP   #$20
         BNE   L6C04
         LDA   #$01
         STA   $B7F4
         STA   $B7EA
         STA   $B7E8
         LDA   #$00
         BIT   $B7EB
         LDX   $5C        ; LOGO: LEVEL
         LDA   L7F87,X
         STA   $B7EC
         LDA   #$0F
         STA   $B7ED
         LDA   #$00
         STA   $B7F0
         LDA   #$A7
         STA   $B7F1
L6C4F    LDA   #$B7
         LDY   #$E8
         JSR   $B7B5
         INC   $B7F1
         DEC   $B7ED
         LDA   $B7ED
         CMP   #$FF
         BNE   L6C4F
         RTS

L6C64    LDY   $0A
         LDA   L871B,Y
         CLC
         ADC   $0D
         STA   $19
         LDA   L87DB,Y
         STA   $1A
         LDA   $0E
         STA   $09
         LDY   #$00
L6C79    LDA   #$00
         STA   ($19),Y
         INY
         DEC   $09
         BNE   L6C79
         INC   $0A
         DEC   $08
         BNE   L6C64
         RTS

L6C89    LDX   #$20
         STX   $1A
         LDY   #$00
         STY   $19
L6C91    LDA   #$00
         STA   ($19),Y
         INY
         BNE   L6C91
         INC   $1A
         DEX
         BNE   L6C91
         LDA   #$00
         STA   $AD
L6CA1    LDA   #$10
         STA   $19
         LDA   #$19
         STA   $1A
         LDA   #$06
         STA   $0E
         LDA   #$20
         STA   $08
         LDA   #$1B
         STA   $0D
         LDX   $AD
         LDA   L8047,X
         STA   $0A
         JSR   L5828
         LDA   $AD
         LDX   $AB
         CMP   L40F7,X
         BEQ   L6CCD
         INC   $AD
         JMP   L6CA1

L6CCD    LDA   #$00
         STA   $AD
L6CD1    LDX   $AD
         LDA   L8047,X
         CLC
         ADC   #$18
         STA   $0A
         STA   $56
         LDA   #$16
         STA   $0D
         LDA   L8035,X
         BEQ   L6CE9
         JSR   L6DC1
L6CE9    INC   $0D
         LDX   $AD
         LDA   $56
         STA   $0A
         LDA   L803B,X
         JSR   L6DC1
         INC   $0D
         LDX   $AD
         LDA   $56
         STA   $0A
         LDA   L8041,X
         JSR   L6DC1
         INC   $0D
         LDA   $56
         STA   $0A
         LDA   #$0A
         JSR   L6DC1
         LDA   $AD
         LDX   $AB
         CMP   L40F7,X
         BEQ   L6D1E
         INC   $AD
         JMP   L6CD1

L6D1E    LDA   #$16
         STA   $19
         LDA   #$86
         STA   $1A
         LDA   #$B8
         STA   $0A
         LDA   #$00
         STA   $0D
         LDA   #$06
         STA   $0E
         LDA   #$07
         STA   $08
         JSR   L5828
         LDA   #$40
         STA   $19
         LDA   #$86
         STA   $1A
         LDA   #$B8
         STA   $0A
         LDA   #$06
         STA   $0D
         LDA   #$07
         STA   $08
         JSR   L5828
         LDA   #$6A
         STA   $19
         LDA   #$86
         STA   $1A
         LDA   #$B8
         STA   $0A
         LDA   #$0C
         STA   $0D
         LDA   #$07
         STA   $08
         JSR   L5828
         LDA   #$94
         STA   $19
         LDA   #$86
         STA   $1A
         LDA   #$B8
         STA   $0A
         LDA   #$03
         STA   $0E
         LDA   #$07
         STA   $08
         LDA   #$12
         STA   $0D
         JSR   L5828
         JSR   L6FF3
         JSR   L7C02
         LDA   L7DB1+2
         CMP   #$C0
         BNE   L6DB5
         LDA   #$00
         STA   $A9
L6D93    LDX   $A9
         LDA   L8099,X
         STA   $00
         LDA   L80A6,X
         STA   $01
         JSR   L7DC4
         LDA   #$01
         STA   $00
         LDA   #$04
         STA   $01
         JSR   L7DDF
         INC   $A9
         LDA   $A9
         CMP   #$0D
         BNE   L6D93
L6DB5    LDA   #$05
         STA   $A4
L6DB9    JSR   L6B8A
         DEC   $A4
         BNE   L6DB9
         RTS

L6DC1    ASL
         ASL
         ASL
         CLC
         ADC   #$96
         STA   $19
         LDA   #$85
         ADC   #$00
         STA   $1A
         LDX   #$08
L6DD1    LDY   $0A
         LDA   L871B,Y
         CLC
         ADC   $0D
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         LDY   #$00
         LDA   ($19),Y
         STA   ($1B),Y
         INC   $19
         BNE   L6DEC
         INC   $1A
L6DEC    INC   $0A
         DEX
         BNE   L6DD1
         RTS

L6DF2    LDA   $10
         BEQ   L6DFC
         LDA   $11
         CMP   #$0B
         BEQ   L6DFD
L6DFC    RTS

L6DFD    LDA   #$00
         STA   $A5
         LDA   $5C
         BNE   L6E0B
         JSR   L6E4F
         JMP   L6E12

L6E0B    CMP   #$03
         BNE   L6E18
         JSR   L6F56
L6E12    JSR   L6EF8
         JMP   L6E1B

L6E18    JSR   L6EA6
L6E1B    LDA   $A5
         CMP   #$04
         BCC   L6E23
         LDA   #$03
L6E23    TAX
         LDA   L804D,X
         BEQ   L6E4E
         STA   $0E
         LDA   $AB
         ASL
         ASL
         ASL
         TAX
         LDA   $0E
         CLC
         ADC   L402B,X
         STA   L402B,X
         LDA   $05
         CLC
         ADC   #$18
         STA   $0A
         LDA   $04
         STA   $0D
         JSR   L70F7
         JSR   L6FA1
         JSR   L6FC6
L6E4E    RTS

L6E4F    LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   L7FFF,X
         STA   $65
         LDA   #$00
         STA   $56
L6E5E    LDX   $56
         CPX   $65
         BEQ   L6E70
         LDA   L4043,X
         CMP   #$FF
         BNE   L6E71
L6E6B    INC   $56
         JMP   L6E5E
L6E70    RTS

L6E71    LDA   $05
         CLC
         ADC   #$0C
         STA   $0E
         LDA   L404D,X
         CMP   $0E
         BCC   L6E6B
         LDA   $0E
         CLC
         ADC   #$0C
         CMP   L404D,X
         BCC   L6E6B
         LDA   $04
         SEC
         SBC   #$03
         STA   $0E
         LDY   #$07
L6E92    LDA   L4043,X
         CMP   $0E
         BEQ   L6EA1
         INC   $0E
         DEY
         BNE   L6E92
         JMP   L6E6B

L6EA1    INC   $A5
         JMP   L6E6B

L6EA6    LDX   $5C
         LDA   L8165,X
         STA   $74
         LDA   #$00
         STA   $56
L6EB1    LDX   $56
         CPX   $74
         BEQ   L6EC3
         LDA   L407A,X
         CMP   #$FF
         BNE   L6EC4
L6EBE    INC   $56
         JMP   L6EB1
L6EC3    RTS

L6EC4    LDA   $05
         CLC
         ADC   #$0C
         STA   $0E
         LDA   L407F,X
         CMP   $0E
         BCC   L6EBE
         LDA   $0E
         CLC
         ADC   #$0A
         CMP   L407F,X
         BCC   L6EBE
         LDY   #$03
         LDA   $04
         STA   $0E
         DEC   $0E
L6EE4    LDA   L407A,X
         CMP   $0E
         BEQ   L6EF3
         INC   $0E
         DEY
         BNE   L6EE4
         JMP   L6EBE

L6EF3    INC   $A5
         JMP   L6EBE

L6EF8    LDA   #$01
         STA   $76
         LDA   $5C
         BEQ   L6F0B
         LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   L8169,X
         STA   $76
L6F0B    LDA   #$00
         STA   $56
L6F0F    LDX   $56
         CPX   $76
         BEQ   L6F21
         LDA   L40A2,X
         CMP   #$FF
         BNE   L6F22
L6F1C    INC   $56
         JMP   L6F0F
L6F21    RTS

L6F22    LDA   $05
         CLC
         ADC   #$0C
         STA   $0E
         LDA   L409D,X
         CMP   $0E
         BCC   L6F1C
         LDA   $0E
         CLC
         ADC   #$0A
         CMP   L409D,X
         BCC   L6F1C
         LDA   $04
         STA   $0E
         DEC   $0E
         LDY   #$03
L6F42    LDA   L40A2,X
         CMP   $0E
         BEQ   L6F51
         INC   $0E
         DEY
         BNE   L6F42
         JMP   L6F1C

L6F51    INC   $A5
         JMP   L6F1C

L6F56    LDA   #$00
         STA   $56
L6F5A    LDX   $56
         CPX   #$05
         BEQ   L6F6C
         LDA   L40C0,X
         CMP   #$FF
         BNE   L6F6D
L6F67    INC   $56
         JMP   L6F5A
L6F6C    RTS

L6F6D    LDA   $05
         CLC
         ADC   #$0C
         STA   $0E
         LDA   L40BB,X
         CMP   $0E
         BCC   L6F67
         LDA   $0E
         CLC
         ADC   #$0C
         CMP   L40BB,X
         BCC   L6F67
         LDA   $04
         STA   $0E
         DEC   $0E
         LDY   #$03
L6F8D    LDA   L40C0,X
         CMP   $0E
         BEQ   L6F9C
         INC   $0E
         DEY
         BNE   L6F8D
         JMP   L6F67

L6F9C    INC   $A5
         JMP   L6F67

L6FA1    LDY   #$00
         LDA   $AB
         ASL
         ASL
         ASL
         TAX
L6FA9    LDA   L4029,X
         CMP   #$0A
         BCC   L6FBF
         SEC
         SBC   #$0A
         STA   L4029,X
         CPY   #$05
         BEQ   L6FC5
         INX
         INC   L4029,X
         DEX
L6FBF    INX
         INY
         CPY   #$06
         BNE   L6FA9
L6FC5    RTS

L6FC6    LDA   $AB
         ASL
         ASL
         ASL
         TAY
         LDA   L402D,Y
         BNE   L6FDB
         LDA   L402C,Y
         CMP   #$07
         BCS   L6FDB
         JMP   L6FF0

L6FDB    LDX   $AB
         LDA   L40F3,X
         BNE   L6FF0
         INC   L40F3,X
         JSR   L7A5F
         LDX   $AB
         INC   L40F1,X
         JSR   L7A5F
L6FF0    JSR   L7C29
L6FF3    LDA   $AB
         ASL
         ASL
         ASL
         CLC
         ADC   #$05
         STA   $56
         LDA   #$05
         STA   $5D
         LDA   #$00
         STA   $0D
L7005    LDA   #$00
         STA   $0A
         LDX   $56
         LDA   L4029,X
         JSR   L6DC1
         INC   $0D
         DEC   $56
         DEC   $5D
         LDA   $5D
         CMP   #$FF
         BNE   L7005
         RTS

L701E    LDA   #$05
         STA   $56
         LDA   #$12
         STA   $0D
L7026    LDA   #$B4
         STA   $0A
         LDX   $56
         LDA   L40FD,X
         JSR   L6DC1
         INC   $0D
         DEC   $56
         LDA   $56
         CMP   #$FF
         BNE   L7026
         RTS

L703D    LDA   $B1
         BNE   L7044
         JMP   L70A8

L7044    LDA   $AB
         EOR   #$01
         ASL
         ASL
         ASL
         CLC
         ADC   #$05
         STA   $56
         LDA   #$05
         STA   $5D
         LDA   #$22
         STA   $0D
L7058    LDA   #$B4
         STA   $0A
         LDX   $56
         LDA   L4029,X
         JSR   L6DC1
         INC   $0D
         DEC   $56
         DEC   $5D
         LDA   $5D
         CMP   #$FF
         BNE   L7058
         LDA   #$1A
         STA   $0D
         LDA   #$B4
         STA   $0A
         LDA   #$06
         STA   $0E
         LDA   #$07
         STA   $08
         LDA   #$A9
         STA   $19
         LDA   #$86
         STA   $1A
         JSR   L5828
         LDA   #$B4
         STA   $0A
         LDA   #$20
         STA   $0D
         LDA   $AB
         EOR   #$01
         CLC
         ADC   #$01
         JSR   L6DC1
         INC   $0D
         LDA   #$B4
         STA   $0A
         LDA   #$0F
         JSR   L6DC1
L70A8    LDA   #$0D
         STA   $0D
         LDA   #$B4
         STA   $0A
         LDA   #$05
         STA   $0E
         LDA   #$07
         STA   $08
         LDA   #$D3
         STA   $19
         LDA   #$86
         STA   $1A
         JSR   L5828
         RTS

L70C4    ASL
         ASL
         ASL
         CLC
         ADC   #$96
         STA   $19
         LDA   #$85
         ADC   #$00
         STA   $1A
         LDX   #$08
L70D4    LDY   $0A
         LDA   L871B,Y
         CLC
         ADC   $0D
         STA   $1B
         LDA   L87DB,Y
         STA   $1C
         LDY   #$00
         LDA   ($19),Y
         EOR   ($1B),Y
         STA   ($1B),Y
         INC   $19
         BNE   L70F1
         INC   $1A
L70F1    INC   $0A
         DEX
         BNE   L70D4
         RTS

L70F7    LDX   #$00
L70F9    LDA   L40E7,X
         BNE   L7122
         LDA   $0D
         CMP   #$FF
         BNE   L7109
         LDA   #$00
         JMP   L710F

L7109    CMP   #$26
         BCC   L710F
         LDA   #$25
L710F    STA   L40E7,X
         LDA   $0A
         STA   L40E9,X
         LDA   #$14
         STA   L40EB,X
         LDA   $0E
         STA   L40ED,X
         RTS

L7122    INX
         CPX   #$02
         BNE   L70F9
         RTS

L7128    LDX   #$00
L712A    LDA   L40EB,X
         BEQ   L7170
         DEC   L40EB,X
         LDA   L40EB,X
         CMP   #$13
         BNE   L7143
         STX   $A4
         JSR   L7176
         LDX   $A4
         JMP   L7153

L7143    CMP   #$00
         BNE   L7153
         STX   $A4
         JSR   L7176
         LDX   $A4
         LDA   #$00
         STA   L40E7,X
L7153    LDA   L40EB,X
         AND   #$03
         BNE   L7170
         STX   $A4
         LDA   L40EB,X
         LSR
         LSR
         TAX
         LDA   L8072,X
         STA   $00
         LDA   #$04
         STA   $01
         JSR   L7DC4
         LDX   $A4
L7170    INX
         CPX   #$02
         BNE   L712A
         RTS

L7176    LDA   L40E9,X
         STA   $0A
         LDA   L40E7,X
         STA   $0D
         LDA   L40ED,X
         JSR   L70C4
         LDX   $A4
         INC   $0D
         LDA   L40E9,X
         STA   $0A
         LDA   #$00
         JSR   L70C4
         LDX   $A4
         INC   $0D
         LDA   L40E9,X
         STA   $0A
         LDA   #$00
         JSR   L70C4
         RTS

L71A3    INC   $A8
         LDA   $A8
         CMP   #$2D
         BEQ   L71AC
         RTS

L71AC    LDA   #$00
         STA   $A8
         LDA   $A7
         BEQ   L71B9
         DEC   $A7
         JMP   L71C3

L71B9    LDA   $A6
         BEQ   L71C6
         LDA   #$09
         STA   $A7
         DEC   $A6
L71C3    JMP   L71CB

L71C6    PLA
         PLA
         JMP   L720B

L71CB    LDA   #$22
         STA   $0D
         LDA   #$0D
         STA   $0A
         LDA   $A6
         JSR   L6DC1
         INC   $0D
         LDA   #$0D
         STA   $0A
         LDA   $A7
         JSR   L6DC1
         INC   $0D
         LDA   #$0D
         STA   $0A
         LDA   #$00
         JSR   L6DC1
         INC   $0D
         LDA   #$0D
         STA   $0A
         LDA   #$00
         JSR   L6DC1
         LDA   $A6
         BNE   L720A
         LDA   #$06
         STA   $01
         LDA   #$50
         STA   $00
         JSR   L7DC4
         INC   $B9
L720A    RTS

L720B    LDA   $AA
         BEQ   L7212
         JMP   L44C4

L7212    LDA   $9F
         STA   $08
         LDA   $58
         STA   $0E
         LDA   $04
         STA   $0D
         LDA   $05
         STA   $0A
         LDA   $1D
         STA   $19
         LDA   $1E
         STA   $1A
         JSR   L5828
         LDA   $57
         BEQ   L7238
         LDA   $05
         CLC
         ADC   #$04
         STA   $05
L7238    LDA   #$00
         STA   $AD
         STA   $56
         STA   $AE
L7240    JSR   L72E1
         LDX   #$00
         LDY   #$0A
L7247    DEX
         BNE   L7247
         DEY
         BNE   L7247
         LDX   $AE
         LDA   L8077,X
         STA   $00
         LDA   #$14
         STA   $01
         JSR   L7DC4
         INC   $AE
         JSR   L72E1
         INC   $AD
         LDA   $AD
         CMP   #$04
         BNE   L7240
         LDA   #$00
         STA   $AD
         INC   $56
         LDA   $56
         CMP   #$03
         BNE   L7240
         LDA   #$04
         STA   $AD
         JSR   L72E1
         LDA   #$00
         STA   $AE
L727F    LDX   $AE
         LDA   L8084,X
         STA   $00
         LDA   L8088,X
         STA   $01
         JSR   L7DC4
         INC   $AE
         LDA   $AE
         CMP   #$04
         BNE   L727F
         JSR   L6B8A
         LDX   $AB
         DEC   L40F1,X
         LDA   #$00
         STA   $AE
L72A2    LDX   $AB
         LDA   L40F1,X
         CMP   #$FE
         BEQ   L72BD
         INC   $AC
         CMP   #$FF
         BNE   L72BF
         DEC   L40F1,X
         LDA   #$5A
         JSR   L7B2E
         LDA   $B1
         BEQ   L72DB
L72BD    INC   $AE
L72BF    LDA   $AE
         CMP   #$02
         BEQ   L72DB
         LDA   $B1
         BEQ   L72CF
         LDA   $AB
         EOR   #$01
         STA   $AB
L72CF    LDX   $AB
         LDA   L40F1,X
         CMP   #$FE
         BCC   L72DE
         JMP   L72A2
L72DB    JMP   L7C56
L72DE    JMP   L4184

L72E1    LDX   $AD
         LDA   L7FB7,X
         CLC
         ADC   #$00
         STA   $19
         LDA   #$00
         ADC   #$1F
         STA   $1A
         LDA   #$10
         STA   $08
         LDA   #$03
         STA   $0E
         LDA   $05
         STA   $0A
         LDA   $04
         STA   $0D
         AND   #$01
         BEQ   L7307
         INC   $0D
L7307    JSR   L5828
         RTS

L730B    LDA   $57
         BEQ   L7312
         JMP   L75A3

L7312    LDA   $AA
         BEQ   L7317
         RTS

L7317    LDA   #$00
         STA   $A5
         LDA   $5C
         BNE   L7328
         JSR   L7352
         JSR   L74D4
         JMP   L732F

L7328    CMP   #$03
         BNE   L7335
         JSR   L73D6
L732F    JSR   L740F
         JMP   L7342

L7335    CMP   #$02
         BNE   L733F
         JSR   L745B
         JSR   L7537
L733F    JSR   L7494
L7342    JSR   L7506
         JSR   L757A
         LDA   $A5
         BEQ   L7351
         PLA
         PLA
         JMP   L720B
L7351    RTS

L7352    LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   L7FFF,X
         STA   $65
         JSR   L7396
L7360    LDX   $56
         CPX   $65
         BEQ   L7372
         LDA   L4043,X
         CMP   #$FF
         BNE   L7373
L736D    INC   $56
         JMP   L7360
L7372    RTS

L7373    LDA   L404D,X
         CMP   $0E
         BCC   L736D
         CMP   $AD
         BCS   L736D
         LDA   L4043,X
         STA   $A4
         LDY   #$03
L7385    LDA   $A4
         CMP   $0D
         BEQ   L7393
         INC   $A4
         DEY
         BNE   L7385
         JMP   L736D

L7393    INC   $A5
         RTS

L7396    LDA   #$00
         STA   $56
         LDA   $04
         STA   $0D
         INC   $0D
         LDX   $10
         LDA   $05
         SEC
         SBC   L7FF3,X
         BCS   L73AC
         LDA   #$00
L73AC    STA   $0E
         LDA   $05
         CLC
         ADC   #$0C
         STA   $AD
         RTS

L73B6    LDA   #$00
         STA   $56
         LDA   $04
         STA   $0D
         INC   $0D
         LDX   $10
         LDA   $05
         SEC
         SBC   L7FF5,X
         BCS   L73CC
         LDA   #$00
L73CC    STA   $0E
         LDA   $05
         CLC
         ADC   #$0C
         STA   $AD
         RTS

L73D6    JSR   L7396
L73D9    LDX   $56
         CPX   #$05
         BEQ   L73EB
         LDA   L40C0,X
         CMP   #$FF
         BNE   L73EC
L73E6    INC   $56
         JMP   L73D9
L73EB    RTS

L73EC    LDA   L40BB,X
         CMP   $0E
         BCC   L73E6
         CMP   $AD
         BCS   L73E6
         LDA   L40C0,X
         STA   $A4
         LDY   #$04
L73FE    LDA   $A4
         CMP   $0D
         BEQ   L740C
         INC   $A4
         DEY
         BNE   L73FE
         JMP   L73E6

L740C    INC   $A5
         RTS

L740F    JSR   L73B6
         LDA   #$02
         STA   $76
         LDA   $5C
         BEQ   L7425
         LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   L8169,X
         STA   $76
L7425    LDX   $56
         CPX   $76
         BEQ   L7437
         LDA   L40A2,X
         CMP   #$FF
         BNE   L7438
L7432    INC   $56
         JMP   L7425
L7437    RTS

L7438    LDA   L409D,X
         CMP   $0E
         BCC   L7432
         CMP   $AD
         BCS   L7432
         LDA   L40A2,X
         STA   $A4
         LDY   #$03
L744A    LDA   $A4
         CMP   $0D
         BEQ   L7458
         INC   $A4
         DEY
         BNE   L744A
         JMP   L7432

L7458    INC   $A5
         RTS

L745B    JSR   L73B6
L745E    LDX   $56
         CPX   #$03
         BEQ   L7470
         LDA   L4003,X
         CMP   #$FF
         BNE   L7471
L746B    INC   $56
         JMP   L745E
L7470    RTS

L7471    LDA   L4006,X
         CMP   $0E
         BCC   L746B
         CMP   $AD
         BCS   L746B
         LDA   L4003,X
         STA   $A4
         LDY   #$03
L7483    LDA   $A4
         CMP   $0D
         BEQ   L7491
         INC   $A4
         DEY
         BNE   L7483
         JMP   L746B

L7491    INC   $A5
         RTS

L7494    LDX   $5C
         LDA   L8165,X
         STA   $74
         JSR   L73B6
L749E    LDX   $56
         CPX   $74
         BEQ   L74B0
         LDA   L407A,X
         CMP   #$FF
         BNE   L74B1
L74AB    INC   $56
         JMP   L749E
L74B0    RTS

L74B1    LDA   L407F,X
         CMP   $0E
         BCC   L74AB
         CMP   $AD
         BCS   L74AB
         LDA   L407A,X
         STA   $A4
         LDY   #$03
L74C3    LDA   $A4
         CMP   $0D
         BEQ   L74D1
         INC   $A4
         DEY
         BNE   L74C3
         JMP   L74AB

L74D1    INC   $A5
         RTS

L74D4    JSR   L7396
         LDX   $56
         CPX   $8E
         BEQ   L74E4
         LDA   $90
         CMP   #$FF
         BNE   L74E5
L74E3    RTS
L74E4    RTS

L74E5    LDA   $8F
         CMP   $0E
         BCC   L74E3
         CMP   $AD
         BCS   L74E3
         LDA   $90
         STA   $A4
         LDY   #$03
L74F5    LDA   $A4
         CMP   $0D
         BEQ   L7503
         INC   $A4
         DEY
         BNE   L74F5
         JMP   L74E3

L7503    INC   $A5
         RTS

L7506    JSR   L7396
         LDA   $05
         SEC
         SBC   #$1B
         BCS   L7512
         LDA   #$00
L7512    STA   $0E
         JMP   L7518
L7517    RTS

L7518    LDA   $99
         CMP   $0E
         BCC   L7517
         CMP   $AD
         BCS   L7517
         LDA   $98
         STA   $A4
         LDY   #$06
L7528    LDA   $A4
         CMP   $0D
         BEQ   L7534
         INC   $A4
         DEY
         BNE   L7528
         RTS

L7534    INC   $A5
         RTS

L7537    JSR   L7396
         LDA   $0E
         CLC
         ADC   #$05
         STA   $0E
         LDA   $AD
         CLC
         ADC   #$03
         STA   $AD
L7548    LDX   $56
         CPX   #$04
         BEQ   L7556
         JMP   L7557

L7551    INC   $56
         JMP   L7548
L7556    RTS

L7557    LDA   L8280,X
         CMP   $0E
         BCC   L7551
         CMP   $AD
         BCS   L7551
         LDA   L8284,X
         STA   $A4
         LDY   #$03
L7569    LDA   $A4
         CMP   $0D
         BEQ   L7577
         INC   $A4
         DEY
         BNE   L7569
         JMP   L7551

L7577    INC   $A5
         RTS

L757A    LDX   $5C
         LDA   L7FE8,X
         CMP   #$FF
         BEQ   L759B
         CMP   $04
         BNE   L759B
L7587    LDA   L7FEC,X
         SEC
         SBC   #$0F
         CMP   $05
         BCS   L75A2
         CLC
         ADC   #$16
         CMP   $05
         BCC   L75A2
         INC   $A5
         RTS

L759B    SEC
         SBC   #$01
         CMP   $04
         BEQ   L7587
L75A2    RTS

L75A3    LDA   #$00
         STA   $A5
         STA   $BC
         LDA   $5C
         BNE   L75C4
         JSR   L763D
         LDA   $05
         CLC
         ADC   #$04
         STA   $05
         JSR   L74D4
         LDA   $05
         SEC
         SBC   #$04
         STA   $05
         JMP   L75CB

L75C4    CMP   #$03
         BNE   L75D1
         JSR   L7710
L75CB    JSR   L77BC
         JMP   L75D4

L75D1    JSR   L7885
L75D4    LDA   $A5
         BEQ   L75DD
         PLA
         PLA
         JMP   L720B
L75DD    RTS

L75DE    LDA   #$00
         STA   $59
         LDA   $04
         STA   $0D
         INC   $0D
         LDX   #$00
         LDA   $5A
         CMP   #$05
         BCC   L75F1
         INX
L75F1    LDA   $05
         SEC
         SBC   L8068,X
         BCS   L75FB
         LDA   #$00
L75FB    STA   $0E
         LDA   $05
         STA   $AD
         INC   $AD
         LDA   $05
         CLC
         ADC   #$14
         STA   $56
         RTS

L760B    LDA   #$00
         STA   $59
         LDA   $04
         STA   $0D
         INC   $0D
         LDX   #$00
         LDA   $5A
         CMP   #$05
         BCC   L761E
         INX
L761E    LDA   $05
         SEC
         SBC   L806A,X
         BCS   L7628
         LDA   #$00
L7628    STA   $0E
         LDA   $05
         SEC
         SBC   #$06
         BCS   L7633
         LDA   #$00
L7633    STA   $AD
         LDA   $05
         CLC
         ADC   #$14
         STA   $56
         RTS

L763D    LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   L7FFF,X
         STA   $65
         JSR   L75DE
L764B    LDX   $59
         CPX   $65
         BEQ   L765D
         LDA   L4043,X
         CMP   #$FF
         BNE   L765E
L7658    INC   $59
         JMP   L764B
L765D    RTS

L765E    LDA   L404D,X
         CMP   $0E
         BCC   L7658
         CMP   $56
         BCS   L7658
         LDA   L4043,X
         STA   $A4
         LDY   #$03
L7670    LDA   $A4
         CMP   $0D
         BEQ   L767E
         INC   $A4
         DEY
         BNE   L7670
         JMP   L768C

L767E    LDA   $07
         BEQ   L76B3
         LDA   L404D,X
         CMP   $AD
         BCC   L76B3
         INC   $A5
         RTS

L768C    LDA   L4043,X
         STA   $A4
         INC   $0D
         LDY   #$03
L7695    LDA   $A4
         CMP   $0D
         BEQ   L76A3
         INC   $A4
         DEY
         BNE   L7695
         JMP   L7658

L76A3    LDA   $07
         CMP   #$01
         BEQ   L76B3
         LDA   L404D,X
         CMP   $AD
         BCC   L76B3
         INC   $A5
         RTS

L76B3    LDA   L404D,X
         STA   $0A
         LDA   L4043,X
         STA   $0D
         AND   #$01
         BNE   L76CD
         LDA   L4039,X
         CMP   #$04
         BCC   L76D6
         INC   $BC
         JMP   L76D6

L76CD    LDA   L4039,X
         CMP   #$04
         BCS   L76D6
         INC   $BC
L76D6    LDA   #$08
         STA   $08
         LDA   #$03
         STA   $0E
         LDA   L4039,X
         TAX
         LDA   L7FD2,X
         CLC
         ADC   #$20
         STA   $19
         LDA   #$00
         ADC   #$AB
         STA   $1A
         JSR   L5828
         LDX   $59
         LDA   L404D,X
         SEC
         SBC   #$02
         STA   $A4
         LDA   L4043,X
         STA   $A9
         LDA   #$FF
         STA   L4043,X
         STA   L4039,X
         DEC   $60
         JSR   L7946
         RTS

L7710    JSR   L75DE
L7713    LDX   $59
         CPX   #$05
         BEQ   L7725
         LDA   L40C0,X
         CMP   #$FF
         BNE   L7726
L7720    INC   $59
         JMP   L7713
L7725    RTS

L7726    LDA   L40BB,X
         CMP   $0E
         BCC   L7720
         CMP   $56
         BCS   L7720
         LDA   L40C0,X
         STA   $A4
         LDY   #$04
L7738    LDA   $A4
         CMP   $0D
         BEQ   L7746
         INC   $A4
         DEY
         BNE   L7738
         JMP   L7754

L7746    LDA   $07
         BEQ   L777B
         LDA   L40BB,X
         CMP   $AD
         BCC   L777B
         INC   $A5
         RTS

L7754    LDA   L40C0,X
         STA   $A4
         INC   $0D
         LDY   #$04
L775D    LDA   $A4
         CMP   $0D
         BEQ   L776B
         INC   $A4
         DEY
         BNE   L775D
         JMP   L7720

L776B    LDA   $07
         CMP   #$01
         BEQ   L777B
         LDA   L40BB,X
         CMP   $AD
         BCC   L777B
         INC   $A5
         RTS

L777B    LDA   L40BB,X
         STA   $0A
         LDA   L40C0,X
         STA   $0D
         LDA   #$08
         STA   $08
         LDA   #$04
         STA   $0E
         LDA   L40C5,X
         TAX
         LDA   L7FD9,X
         STA   $19
         LDA   #$AA
         STA   $1A
         JSR   L5828
         LDX   $59
         LDA   L40BB,X
         SEC
         SBC   #$02
         STA   $A4
         LDA   L40C0,X
         STA   $A9
         LDA   #$FF
         STA   L40C0,X
         STA   L40C5,X
         DEC   $88
         INC   $BC
         JSR   L7946
         RTS

L77BC    JSR   L760B
         LDA   #$02
         STA   $76
         LDA   $5C
         BEQ   L77D2
         LDX   $AB
         LDA   L40F9,X
         TAX
         LDA   L8169,X
         STA   $76
L77D2    LDX   $59
         CPX   $76
         BEQ   L77E4
         LDA   L40A2,X
         CMP   #$FF
         BNE   L77E5
L77DF    INC   $59
         JMP   L77D2
L77E4    RTS

L77E5    LDA   L409D,X
         CMP   $0E
         BCC   L77DF
         CMP   $56
         BCS   L77DF
         LDA   L40A2,X
         STA   $A4
         LDY   #$03
L77F7    LDA   $A4
         CMP   $0D
         BEQ   L7805
         INC   $A4
         DEY
         BNE   L77F7
         JMP   L7813

L7805    LDA   $07
         BEQ   L783A
         LDA   L409D,X
         CMP   $AD
         BCC   L783A
         INC   $A5
         RTS

L7813    LDA   L40A2,X
         STA   $A4
         INC   $0D
         LDY   #$03
L781C    LDA   $A4
         CMP   $0D
         BEQ   L782A
         INC   $A4
         DEY
         BNE   L781C
         JMP   L77DF

L782A    LDA   $07
         CMP   #$01
         BEQ   L783A
         LDA   L409D,X
         CMP   $AD
         BCC   L783A
         INC   $A5
         RTS

L783A    LDA   L409D,X
         STA   $0A
         LDA   L40A2,X
         STA   $0D
         LDA   #$10
         STA   $08
         LDA   #$03
         STA   $0E
         LDA   L4098,X
         TAY
         LDA   L40A7,X
         TAX
         LDA   L7FA9,X
         CLC
         ADC   L81AF,Y
         STA   $19
         LDA   L81B1,Y
         ADC   L7FB0,X
         STA   $1A
         JSR   L5828
         LDX   $59
         LDA   L409D,X
         CLC
         ADC   #$03
         STA   $A4
         LDA   L40A2,X
         STA   $A9
         LDA   #$FF
         STA   L40A2,X
         STA   L40A7,X
         DEC   $77
         JSR   L7946
         RTS

L7885    JSR   L760B
L7888    LDX   $59
         CPX   #$05
         BEQ   L789A
         LDA   L407A,X
         CMP   #$FF
         BNE   L789B
L7895    INC   $59
         JMP   L7888
L789A    RTS

L789B    LDA   L407F,X
         CMP   $0E
         BCC   L7895
         CMP   $56
         BCS   L7895
         LDA   L407A,X
         STA   $A4
         LDY   #$03
L78AD    LDA   $A4
         CMP   $0D
         BEQ   L78BB
         INC   $A4
         DEY
         BNE   L78AD
         JMP   L78C9

L78BB    LDA   $07
         BEQ   L78F0
         LDA   L407F,X
         CMP   $AD
         BCC   L78F0
         INC   $A5
         RTS

L78C9    LDA   L407A,X
         STA   $A4
         INC   $0D
         LDY   #$03
L78D2    LDA   $A4
         CMP   $0D
         BEQ   L78E0
         INC   $A4
         DEY
         BNE   L78D2
         JMP   L7895

L78E0    LDA   $07
         CMP   #$01
         BEQ   L78F0
         LDA   L407F,X
         CMP   $AD
         BCC   L78F0
         INC   $A5
         RTS

L78F0    LDA   L407F,X
         STA   $0A
         LDA   L407A,X
         STA   $0D
         LDA   #$10
         STA   $08
         LDA   #$03
         STA   $0E
         LDA   L4075,X
         TAX
         LDA   L7FA9,X
         CLC
         ADC   #$00
         STA   $19
         LDA   #$AB
         ADC   #$00
         STA   $1A
         LDY   $59
         LDA   L4089,Y
         CLC
         ADC   $1A
         CLC
         ADC   L4089,Y
         CLC
         ADC   L7FB0,X
         STA   $1A
         JSR   L5828
         LDX   $59
         LDA   L407F,X
         CLC
         ADC   #$03
         STA   $A4
         LDA   L407A,X
         STA   $A9
         LDA   #$FF
         STA   L407A,X
         STA   L4075,X
         DEC   $75
         JSR   L7946
         RTS

L7946    LDA   #$00
         STA   $AD
L794A    JSR   L79D5
         JSR   L6956
         LDX   $AD
         LDA   L808C,X
         STA   $00
         LDA   #$08
         STA   $01
         JSR   L7DC4
         JSR   L79D5
         INC   $AD
         LDA   $AD
         CMP   #$05
         BNE   L794A
         LDA   $A4
         STA   $0A
         LDA   $A9
         STA   $0D
         LDA   $07
         BNE   L797A
         DEC   $0D
         JMP   L797C

L797A    INC   $0D
L797C    LDA   #$03
         STA   $0E
         STA   $BA
         LDA   $BC
         BEQ   L799A
         LDA   $5F
         CLC
         ADC   $6C
         CLC
         ADC   $6D
         STA   $6C
         AND   #$03
         TAX
         LDA   L7FFB,X
         STA   $0E
         STA   $BA
L799A    JSR   L70F7
         JSR   L7128
         LDA   $AB
         ASL
         ASL
         ASL
         TAX
         LDA   L402B,X
         CLC
         ADC   $BA
         STA   L402B,X
         JSR   L6FA1
         JSR   L6FC6
         JSR   L6B8A
         LDA   L40EB
         CMP   #$13
         BNE   L79C4
         LDA   #$01
         STA   L40EB
L79C4    LDA   L40EC
         CMP   #$13
         BNE   L79D0
         LDA   #$01
         STA   L40EC
L79D0    LDA   #$00
         STA   $BC
         RTS

L79D5    LDA   $A9
         AND   #$01
         BNE   L79EE
         LDX   $AD
         LDA   L7FCD,X
         CLC
         ADC   #$CB
         STA   $19
         LDA   #$8A
         ADC   #$00
         STA   $1A
         JMP   L79FE

L79EE    LDX   $AD
         LDA   L7FCD,X
         CLC
         ADC   #$61
         STA   $19
         LDA   #$8B
         ADC   #$00
         STA   $1A
L79FE    LDA   #$03
         STA   $0E
         LDA   #$0A
         STA   $08
         LDA   $A4
         STA   $0A
         LDA   $A9
         STA   $0D
         JSR   L5828
         RTS

L7A12    LDA   #$00
         STA   $A9
         LDA   #$23
         STA   $0D
L7A1A    LDX   $A9
         LDA   #$1C
         STA   $0A
         LDA   L8057,X
         JSR   L6DC1
         INC   $0D
         INC   $A9
         LDA   $A9
         CMP   #$02
         BNE   L7A1A
         LDA   #$1C
         STA   $0A
         LDA   #$00
         STA   $0E
         LDX   $AB
         LDA   L40FB,X
         CLC
         ADC   #$01
L7A40    CMP   #$0A
         BCC   L7A4C
         SEC
         SBC   #$0A
         INC   $0E
         JMP   L7A40

L7A4C    STA   $BF
         LDA   $0E
         JSR   L6DC1
         INC   $0D
         LDA   #$1C
         STA   $0A
         LDA   $BF
         JSR   L6DC1
         RTS

L7A5F    LDX   $AB
         LDA   L40F1,X
         CMP   #$07
         BCC   L7A6A
         LDA   #$06
L7A6A    STA   $A9
         LDA   #$00
         STA   $0D
L7A70    LDA   $A9
         BEQ   L7A94
         DEC   $A9
         LDA   #$B4
         STA   $0A
         LDA   #$01
         STA   $0E
         LDA   #$0B
         STA   $08
         LDA   #$F6
         STA   $19
         LDA   #$86
         STA   $1A
         JSR   L5828
         INC   $0D
         INC   $0D
         JMP   L7A70
L7A94    RTS

L7A95    LDA   KBD
         BPL   L7AA1
         CMP   #$9B	; escape
         BNE   L7AA4
         JSR   L6B95
L7AA1    JMP   L7B28

L7AA4    CMP   #$92	; ctrl-r
         BNE   L7AB0
         PLA
         PLA
         BIT   KBDSTROBE
         JMP   L7C56

L7AB0    CMP   #$93	; ctrl-s
         BNE   L7ACB
         LDA   L7DB1+2
         EOR   #$E0	; 1100_0000 eor 1110_0000 = 0010_0000 => $C030 => $2030
         STA   L7DB1+2
         STA   L7DCC+2
         STA   L7E41+2
         STA   L7E92+2
         STA   L7E49+2
         JMP   L7B28

L7ACB    CMP   #$8A	; down
         BNE   L7AD6
         LDA   #$00
         STA   $B8
         JMP   L7B28

L7AD6    CMP   #$8B	; up
         BNE   L7AE1
         LDA   #$01
         STA   $B8
         JMP   L7B28

L7AE1    STA   $0E
         LDA   $B8
         BEQ   L7B28
         LDA   $0E
         CMP   #$88	; left arrow
         BNE   L7AF4
         LDA   #$01
         STA   $B5
         JMP   L7B28

L7AF4    CMP   #$95	; right arrow
         BNE   L7AFF
         LDA   #$02
         STA   $B5
         JMP   L7B28

L7AFF    CMP   #"A"	; A
         BNE   L7B0E
         LDA   #$01
         STA   $B6
         LDA   #$00
         STA   $B5
         JMP   L7B28

L7B0E    CMP   #"Z"	; Z
         BNE   L7B1D
         LDA   #$02
         STA   $B6
         LDA   #$00
         STA   $B5
         JMP   L7B28

L7B1D    CMP   #" "	; space
         BNE   L7B28
         LDA   #$01
         STA   $B7
         JMP   L7B28

L7B28    BIT   KBDSTROBE
         RTS

         LDA   #$50
L7B2E    STA   $0A
         STA   $A9
         LDA   #$06
         STA   $0E
         LDA   #$18
         STA   $08
         LDA   #$0E
         STA   $0D
         LDA   #$F7
         STA   $19
         LDA   #$8B
         STA   $1A
         JSR   L7B75
         LDA   $A9
         STA   $0A
         LDA   #$18
         STA   $08
         LDA   #$14
         STA   $0D
         LDA   #$87
         STA   $19
         LDA   #$8C
         STA   $1A
         JSR   L7B75
         LDA   #$14
         STA   $5D
L7B64    JSR   L6B8A
         DEC   $5D
         BNE   L7B64
         LDA   $A9
         CMP   #$5A
         BEQ   L7B74
         JMP   L7C56
L7B74    RTS

L7B75    LDY   $0A
         JSR   L5847
         LDX   #$00
L7B7C    LDA   ($19,X)
         STA   ($1B),Y
         INC   $19
         BNE   L7B86
         INC   $1A
L7B86    INY
         DEC   $09
         BNE   L7B7C
         INC   $0A
         DEC   $08
         BNE   L7B75
         RTS

L7B92    LDA   #$00
         STA   $AD
         LDA   $AC
         BEQ   L7BEF
         LDA   #$00
         STA   $AC
         LDY   #$00
         STY   $19
         LDA   #$20       ; LOGO: HGR
         STA   $1A
         LDA   $B1
         BEQ   L7BE4
L7BAA    LDA   #$00
         STA   ($19),Y
         INY
         BNE   L7BAA
         INC   $1A
         LDA   $1A
         CMP   #$40
         BNE   L7BAA
         LDA   #$10
         STA   $0D
         LDA   #$50
         STA   $0A
         LDA   #$06
         STA   $0E
         LDA   #$07
         STA   $08
         LDA   #$A9
         STA   $19
         LDA   #$86
         STA   $1A
         JSR   L5828
         LDA   #$17
         STA   $0D
         LDA   #$50
         STA   $0A
         LDA   $AB
         CLC
         ADC   #$01
         JSR   L6DC1
L7BE4    LDA   $AD
         BNE   L7BFE
         LDA   $B1
         BEQ   L7BEF
         JSR   L7BF2
L7BEF    JMP   L6C89

L7BF2    LDA   #$08
         STA   $A9
L7BF6    JSR   L6B8A
         DEC   $A9
         BNE   L7BF6
         RTS
L7BFE    RTS

L7BFF    JSR   L703D
L7C02    LDA   #$07
         STA   $0D
         LDA   #$00
         STA   $0A
         LDA   $AB
         CLC
         ADC   #$01
         JSR   L6DC1
         INC   $0D
         LDA   #$00
         STA   $0A
         LDA   #$0D
         JSR   L6DC1
         LDA   #$00
         STA   $0A
         INC   $0D
         LDA   #$0E
         JSR   L6DC1
         RTS

L7C29    LDA   $AB
         ASL
         ASL
         ASL
         CLC
         ADC   #$05
         TAX
         LDY   #$05
L7C34    LDA   L40FD,Y
         CMP   L4029,X
         BEQ   L7C3F
         BCC   L7C46
         RTS

L7C3F    DEX
         DEY
         CPY   #$FF
         BNE   L7C34
         RTS

L7C46    LDA   L4029,X
         STA   L40FD,Y
         DEX
         DEY
         CPY   #$FF
         BNE   L7C46
         JSR   L701E
         RTS

L7C56    BIT   TXTSET
L7C59    LDA   #$01
         STA   $B7F4
         STA   $B7EA
         STA   $B7E8
         LDA   #$00
         BIT   $B7EB
         STA   $AD
         LDA   #$10
         STA   $B7EC
         LDA   #$0F
         STA   $B7ED
         LDA   #$00
         STA   $B7F0
         LDA   #$20
         STA   $B7F1
L7C7F    LDA   #$B7
         LDY   #$E8
         JSR   $B7B5
         INC   $B7F1
         DEC   $B7ED
         LDA   $B7ED
         CMP   #$FF
         BNE   L7C9B
         LDA   #$0F
         STA   $B7ED
         DEC   $B7EC
L7C9B    INC   $AD
         LDA   $AD
         CMP   #$20
         BNE   L7C7F
         BIT   TXTCLR
         BIT   MIXCLR
         BIT   HIRES
         LDA   #$00
         STA   $A9
         BIT   KBDSTROBE
         JSR   L7D28
         LDA   #$00
         STA   $BA
         STA   $B8
         LDA   BUTN0
         BPL   L7CCA
         LDA   BUTN1
         BPL   L7CCA
         INC   $BA
         INC   $B8
L7CCA    LDA   KBD
         BPL   L7CE6
         BIT   KBDSTROBE
         CMP   #"1"
         BEQ   L7D14
         CMP   #"2"
         BEQ   L7D1E
         CMP   #"N"
         BEQ   L7CF7
         CMP   #"H"
         BEQ   L7CFF
         CMP   #"E"
         BEQ   L7D07
L7CE6    LDA   $BA
         BNE   L7CCA
         LDA   BUTN0
         BMI   L7D14
         LDA   BUTN1
         BMI   L7D1E
         JMP   L7CCA

L7CF7    JSR   L7D28
         LDA   #$00
         JMP   L7D0C

L7CFF    JSR   L7D28
         LDA   #$01
         JMP   L7D0C

L7D07    JSR   L7D28
         LDA   #$02
L7D0C    STA   $A9
         JSR   L7D28
         JMP   L7CCA

L7D14    LDA   #$00
         STA   $B1
         BIT   KBDSTROBE
         JMP   L413C

L7D1E    LDA   #$01
         STA   $B1
         BIT   KBDSTROBE
         JMP   L413C

L7D28    LDA   #$08
         STA   $0D
         LDA   #$0B
         STA   $08
         LDA   #$01
         STA   $0E
         LDX   $A9
         LDA   L8060,X
         STA   $0A
         LDA   #$F6
         STA   $19
         LDA   #$86
         STA   $1A
         JSR   L5828
         RTS

L7D47    LDA   #$00
         STA   $A9
L7D4B    LDX   $A9
         LDA   $B2
         STA   $0A
         LDA   L8063,X
         STA   $0D
         LDA   #$03
         STA   $0E
         LDA   #$E6
         STA   $19
         LDA   #$84
         STA   $1A
         LDA   #$0B
         STA   $08
         JSR   L5828
         INC   $A9
         LDA   $A9
         CMP   #$02
         BNE   L7D4B
         RTS

L7D72    JSR   L7D47
         LDA   $B3
         BNE   L7D8A
         INC   $B2
         LDA   $B2
         CMP   #$4C
         BCC   L7D92
L7D81    LDA   $B3
         EOR   #$01
         STA   $B3
         JMP   L7D92

L7D8A    DEC   $B2
         LDA   $B2
         CMP   #$42
         BCC   L7D81
L7D92    JSR   L7D47
         RTS

L7D96    LDA   #$00
         STA   $0E
         JMP   L7D9F

L7D9D    INC   $0E
L7D9F    LDX   $0E
         CPX   #$05
         BEQ   L7DC3
         LDA   L806C,X
         STA   $00
         TAX
         LDY   #$00
         LDA   #$02
         STA   $01
L7DB1    LDA   SPKR
L7DB4    DEY
         BNE   L7DBB
         DEC   $01
         BEQ   L7D9D
L7DBB    DEX
         BNE   L7DB4
         LDX   $00
         JMP   L7DB1
L7DC3    RTS

L7DC4    LDX   $00
         CPX   #$01
         BEQ   L7DDF
         LDY   #$00
L7DCC    LDA   SPKR
L7DCF    DEY
         BNE   L7DD6
         DEC   $01
         BEQ   L7DDE
L7DD6    DEX
         BNE   L7DCF
         LDX   $00
         JMP   L7DCC
L7DDE    RTS

L7DDF    LDX   #$01
         LDY   #$00
L7DE3    LDA   L2000
L7DE6    DEY
         BNE   L7DED
         DEC   $01
         BEQ   L7DF5
L7DED    DEX
         BNE   L7DE6
         LDX   $00
         JMP   L7DE3
L7DF5    RTS

L7DF6    LDA   #$00
         STA   $0E
         JMP   L7DFF

L7DFD    INC   $0E
L7DFF    LDX   $0E
         CPX   #$05
         BEQ   L7E23
         LDA   L806C,X
         STA   $00
         TAX
         LDY   #$00
         LDA   #$02
         STA   $01
L7E11    LDA   L2000
L7E14    DEY
         BNE   L7E1B
         DEC   $01
         BEQ   L7DFD
L7E1B    DEX
         BNE   L7E14
         LDX   $00
         JMP   L7E11
L7E23    RTS

L7E24    JSR   L7E5B
         JSR   L694B
         JSR   L7E5B
         JSR   L6B8A
         JSR   L6B8A
         JSR   L7E3D
         JSR   L6B8A
         JSR   L7E3D
         RTS

L7E3D    LDA   #$16
         STA   $0E
L7E41    LDA   SPKR
         LDX   #$70
L7E46    DEX
         BNE   L7E46
L7E49    LDA   SPKR
         LDX   #$00
         LDY   #$12
L7E50    DEX
         BNE   L7E50
         DEY
         BNE   L7E50
         DEC   $0E
         BNE   L7E41
         RTS

L7E5B    LDA   #$00
         STA   $A9
L7E5F    LDX   $A9
         LDA   L8091,X
         STA   $00
         LDA   L8095,X
         STA   $01
         JSR   L7DC4
         INC   $A9
         LDA   $A9
         CMP   #$04
         BNE   L7E5F
         RTS

L7E77    LDA   #$00
         STA   $0E
         JMP   L7E80

L7E7E    INC   $0E
L7E80    LDX   $0E
         CPX   #$04
         BEQ   L7EA4
         LDA   L80DD,X
         STA   $00
         TAX
         LDY   #$00
         LDA   #$02
         STA   $01
L7E92    LDA   SPKR
L7E95    DEY
         BNE   L7E9C
         DEC   $01
         BEQ   L7E7E
L7E9C    DEX
         BNE   L7E95
         LDX   $00
         JMP   L7E92
L7EA4    RTS

*-----------------------

	 PUT   DONKEY.DATA.S
