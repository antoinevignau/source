* Picnic

	mx	%11
	org	$20f
	lst	off

*-----------------------
* Zero page
*-----------------------

LENGTH     EQU $69
VOICE      EQU $71
UPTIME     EQU $72
DNTIME     EQU $73
NOTENUM    EQU $74
ANTMOV4    EQU $75
ANTMOV3    EQU $76
ANTMOV2    EQU $77
ANTMOV1    EQU $78
SWTRCOUNT  EQU $79
TEMP6      EQU $7A
HISCORELO  EQU $7B
HISCOREHI  EQU $7C
POINTER5   EQU $7D
SET_CAN1   EQU $7F
CAN_KEY_PRESSED EQU $80
SET_CAN2   EQU $81
CANXX      EQU $82
CANY       EQU $83
CANX       EQU $84
FOOTSTEP   EQU $85
GRAB_SQUELCH EQU $86
ALL_FOOD_OFF EQU $87
INIT_K7    EQU $88
K7         EQU $89
NO_OF_FOODS1 EQU $8A
TEMPRND    EQU $8B
NO_OF_FOODS2 EQU $8C
SECONDS    EQU $8D
MINUTES    EQU $8E
NO_OF_PLAYERS EQU $8F
TEMP5      EQU $94
WASPDEST   EQU $95
FLAP       EQU $96
WASP_CHANCE EQU $97
WASP_SPLAT_COUNT EQU $98
DESTX      EQU $99
DESTY      EQU $9A
WASPXX     EQU $9B
INIT_K4    EQU $9C
K4         EQU $9D
INIT_K5    EQU $9E
K5         EQU $9F
INIT_K6    EQU $A0
K6         EQU $A1
PARALYZE   EQU $A2
SPIDERNUM  EQU $A3
SPIDERY    EQU $A4
SPIDERX    EQU $A5
ORIENT     EQU $A6
ANTPOS     EQU $A7
FOOD_HEIGHT EQU $A8
WIDTH      EQU $A9
BYTE3      EQU $AA
FOODY      EQU $AB
FOODX      EQU $AC
FOODNUM    EQU $AD
INIT_K8    EQU $AE
K8         EQU $AF
WASPX      EQU $B0
WASPY      EQU $B1
WASPSTATE  EQU $B2
PLAYERNUM  EQU $B3
ROUND      EQU $B4
SET_CAN    EQU $B5
BYFOOD     EQU $B6
GRAB_FOOD  EQU $B7
INIT_K3    EQU $B8
K3         EQU $B9
MANYOLD    EQU $BA
MANXXOLD   EQU $BB
MANXOLD    EQU $BC
SWTRY      EQU $BD
SWTRXX     EQU $BE
SWTRX      EQU $BF
MANX3      EQU $C0
MANY10     EQU $C1
MANY8      EQU $C2
SWATLEGAL  EQU $C3
MOD2       EQU $C4
SWAT       EQU $C5
NEXTSTATE  EQU $C6
MANSTATE   EQU $C7
MANDIR     EQU $C8
MANY       EQU $C9
MANXX      EQU $CA
MANX       EQU $CB
ENDINDEX   EQU $CC
COUNT4ANTS EQU $CD
INIT_K2    EQU $CE
K2         EQU $CF
INIT_K1    EQU $D0
K1         EQU $D1
ANTYYOLD   EQU $D2
ANTXXOLD   EQU $D3
ANTYOLD    EQU $D4
ANTXOLD    EQU $D5
ANTORIENT  EQU $D6
ANTCOUNT   EQU $D7
ANTNUM     EQU $D8
ANTYY      EQU $D9
ANTXX      EQU $DA
ANTY       EQU $DB
ANTX       EQU $DC
ANTDEST    EQU $DD
PITCH      EQU $DF
ANTDIR     EQU $E0
P1         EQU $E1
P2         EQU $E2
P3         EQU $E3
P4         EQU $E4
M1         EQU $E5
M2         EQU $E6
M3         EQU $E7
M4         EQU $E8
HPDL       EQU $E9
VPDL       EQU $EA
PDLSEL     EQU $EB
PATINDEX   EQU $EC
HEIGHT     EQU $ED
POINTER4   EQU $EE
TEMP1      EQU $F0
TEMP2      EQU $F1
TEMP3      EQU $F2
RNDBYTE1   EQU $F3
RNDBYTE2   EQU $F4
SCRPNT1    EQU $F5
SCRPNT2    EQU $F7
POINTER1   EQU $F9
POINTER2   EQU $FB
POINTER3   EQU $FD
TEMP4      EQU $FF

*-----------------------
* Firmware equates
*-----------------------

SOFTEV	EQU	$03F2
PWREDUP	EQU	$03F4
KBD	EQU	$C000
KBDSTROBE	EQU	$C010
SPKR	EQU	$C030
TXTCLR	EQU	$C050
MIXCLR	EQU	$C052
TXTPAGE1	EQU	$C054
LORES	EQU	$C056
HIRES	EQU	$C057
BUTN0	EQU	$C061
BUTN1	EQU	$C062
PADDL0	EQU	$C064
PADDL1	EQU	$C065
PTRIG	EQU	$C070

*-----------------------
* Other equates
*-----------------------

L8000	=	$8000	; this is where the background gameplay image is
L8228	=	$8228
L9800	=	$9800	; this is the RAM area of the background gameplay
LA000	=	$A000	; this is where the title picture is copied

COUNT1	=	$d033

*-----------------------
* Code
*-----------------------

* We are at $020F

       *or $20F
       *ta $220F
SETUP2
       LDA #<SCRAMBLE_Z
       STA $20
       LDA #>SCRAMBLE_Z
       STA $20+1
       LDA #<CHECK
       STA $22
       LDA #>CHECK
       STA $22+1
       LDY #$00
:1     STA SETUP,Y
       INY
       CPY #$3D
       BNE :1
       LDA #$FF
       STA $7FD
       STA $7FE
       STA $7FF

       LDA #$84	; STY
       STA MASTER_PATCH
       LDA #$F5	; $F5
       STA MASTER_PATCH+1
       LDA #$EA	; NOP
       STA MASTER_PATCH+2

TESTRAM
       LDA #$F0
       STA POINTER1
       STA POINTER2
       LDY #$91
       TYA
       CLC
       ADC #$2E
       STA POINTER1+1
       LDA (POINTER1),Y
       ROR
       STA TEMP1
       LDA (POINTER1),Y
       STA TEMP2
       LDX #$DF
       STX POINTER2+1
       LDY #$10
       DEX
       DEX
       TXA
       STA (POINTER2),Y
       LDY #$90
       LDA (POINTER1),Y
       LDA (POINTER1),Y
       LDY #$10
       LDA (POINTER2),Y
       CMP #$DD
       BNE :1
       STA RAMCARD
:1     LDY #$92
       LDA (POINTER1),Y
       ROR
       STA TEMP4
       LDA (POINTER1),Y
       ROL
       STA TEMP5
CLEAR
       LDX #$95
       LDA RAMCARD
       BEQ SKIP
       LDA $C081-$95,X
       LDA $C081-$95,X
       LDA #$53
       STA COUNT0
       LDA #$AD
       STA COUNT1
       BNE X1
SKIP
       LDA $C082-$95,X
       LDA $C082-$95,X
X1
       LDY #$00
       LDA #$FF
:1     STA SETUP2,Y   
       INY
       CPY #$95
       BNE :1
       RTS

* We are at $02AF

       hex ff

       *or $2AF
       *ta $2AF

CHECK
       LDX #$95
       LDA $C081-$95,X
       LDA $C081-$95,X
       LDA #$DD
       STA $E000-$95,X
       LDA $C080-$95,X
       LDA $C080-$95,X
       LDA $E000-$95,X
       CMP #$DD
       BNE :1
       CMP RAMCARD
       BEQ :2
       JMP DIE
:2     LDA $C083-$95,X
       LDA $C083-$95,X
       INC COUNT0
       DEC COUNT1
       LDA COUNT0
       CLC
       ADC COUNT1
       BEQ SKIP2
       JMP DIE
:1     LDA RAMCARD
       BEQ SKIP2
       JMP DIE
SKIP2
       LDA $C082-$95,X
       LDA $C082-$95,X
       RTS

*--- New from the DOS 3.3 disk


*---------------------------------------------------------*
*     Disassembled with The Flaming Bird Disassembler     *
*    (c) Phoenix corp. 1992,93  -  All rights reserved    *
*---------------------------------------------------------*

	TYP	BIN

	ORG	$0002AF
	MX	%11
	DB	$A2
	DB	$95
	DB	$BD
	DB	$5C
	DB	$0F
	DB	$0D
	DB	$5C
	DB	$0F
	DB	$19
	DB	$6D
	DB	$2D
	DB	$DB
	DB	$6F
	DB	$0D
	DB	$5B
	DB	$0F
	DB	$0D
	DB	$5B
	DB	$0F
	DB	$0D
	DB	$DB
	DB	$6F
	DB	$79
	DB	$6D
	DB	$60
	DB	$90
	DB	$7D
	DB	$E3
	DB	$BF
	DB	$40
	DB	$B3
	DB	$FC
	DB	$85
	DB	$D5
	DB	$0D
	DB	$5E
	DB	$0F
	DB	$0D
	DB	$5E
	DB	$0F
	DB	$5E
	DB	$14
	DB	$F1
	DB	$7E
	DB	$83
	DB	$60
	DB	$1D
	DB	$14
	DB	$F1
	DB	$A8
	DB	$DD
	DB	$83
	DB	$60
	DB	$40
	DB	$BB
	DB	$FC
	DB	$85
	DB	$D5
	DB	$1D
	DB	$E3
	DB	$BF
	DB	$40
	DB	$B3
	DB	$FC
	DB	$85
	DB	$D5
	DB	$0D
	DB	$5D
	DB	$0F
	DB	$0D
	DB	$5D
	DB	$BF
	DB	$60

* We are at $02F8

       *or $2F8
       *ta $2F8

TABLE132   hex 0007060504030201
TABLE133   hex 00F9FAFBFCFDFEFF     
           hex 0008080000000000  

*--- The table is set as follows in the latest source code

*TABLE132   hex 000706050403020100F9FAFBFCFDFEFF     
*TABLE133   hex 0008080000000000  

* We are at $0310

NOTES.OF.THE.SONG
       *or $310
       *ta $1310
BAR1   hex 1F0013000A000C000D000E0002000E00
BAR2   hex 070013000A000C000D000E0002000E00 
BAR3   hex 070013000A000C000D000E0002000E00
BAR4   hex 070013000A000C000D000E0002000E00  
BAR5   hex 1A191817161B1A191A19181716171819
BAR6   hex 1A191817161B1A191A19181716171819    
BAR7   hex 1A19181718171615161718191A1B1A19
BAR8   hex 1A19181718171615161718191A1B1D1E
BAR9   hex 1F1E1D1C1B201F1E1F1E1D1C1B1C1D1E
BAR10  hex 1F1E1D1C1B201F1E1F1E1D1C1B1C1D1E  
BAR11  hex 1F1E1D1C1D1C1B1A1B1C1D1E1F201F1E
BAR12  hex 1F1E1D1C1D1C1B1A1B1C1D1E1F201F1D
BAR13  hex 1A000E00000011001200150017001A00

JUMP.TO.PAGE2
       hex FF
       ds  \
       
* We are at $0400

	put	lores.s

* We are at $0800

L0800    hex   003C02CF20F0008300E7000300E400E7
         hex   003C20F3020F00E000F300F000C30033
L0820    hex   00F3003300C000F300C0020F20F3003C
         hex   00CC00C3000F00CF000320F002CF003D
L0840    hex   003F00CC00F30203080C00CF003300FC
         hex   00FC003300CF080C020300F300CC003F
L0860    hex   00FC003300CF20E0203000F300CC003F
         hex   003F00CC00F3203020E000CF003300FC

* We are at $0880

       *or $880
       *ta $1880
NOTES
       hex 0000F6F6E8E8DBDBCFCFC3C3B8B8AEAEA4A49B9B92928A8A82827B7B74746D6E
       hex 676861625C5C575752524D4E4949454541413D3E3A3A3637333430312E2E2B2C
       hex 292926272425222320211E1F1D1D1B1C1A1A1819171715161415131412121111
       hex 10100F100E0F

* We are at $08E6

       *or $8E6
       *ta $18E6

Z4_Z
       JMP Z4

MUSIC_Z
MUSIC
       LDY NOTENUM
Z1     LDA (POINTER2),Y
       CMP #$FF
       BEQ Z2
       CMP #$FE
       BEQ Z4
       INC NOTENUM 
       JMP LOOKUP
Z2     LDY #>BAR14
       LDX #<BAR14
       BNE Z5
Z4     LDY #>BAR1
       LDX #<BAR1
Z3     LDA #$10
       STA VOICE
Z5     STY POINTER2+1
       STX POINTER2
       LDY #$00
       STY NOTENUM
       BEQ Z1

* We are at $0912

       hex 0785DE84FC86FBA0008474F0CC57
       hex 415350591009B2000957415350535441
       hex 54451A099B000657415350585800009D
       hex 00024B3471099C0007494E49542E4B34

* We are at $0950

       *or $950
       *ta $1950

BAR14  hex 1B000F0000001B00130000001B001600
BAR15  hex 1A000E00000011001200150017001A00
BAR16  hex 1B000F0000001B00130000001B001600 
BAR17  hex 13141312131413121314131213141312
BAR18  hex 13141516171615141314151617000000
BAR19  hex 18000C0000000F001000130015001800  
BAR20  hex 19000D00000019001100000019001400
BAR21  hex 18000C0000000F001000130015001800  
BAR22  hex 19000D00000019001100000019001400 
BAR23  hex 18191817181918171819181718191817
BAR24  hex 18191A1B1C1B1A1918191A1B1C000000
BAR25  hex 191A1918191A1918191A1918191A1918
BAR26  hex 191A1B1C1D1C1B1A191A1B1C1D000000
BAR27  hex 1A1B1A191A1B1A191A1B1A191A1B1A19
BAR28  hex 0E0F101112131415161718191A1B1C1E

JUMP.TO.PAGE1
       hex FEFE
       ds 6

* We are at $0A48

       *or $A48
       *ta $1A48

THE_END_Z
THE_END
       JSR INITIALIZE_1_Z
       LDA #$70
       STA WASPY
       STA MANY
       LDA #$04
       STA WASPX
       STA MANX
       LDA L460C+1
       PHA
       LDA #<PP6	; patched for JOYSTICK at L460C
       STA L460C+1
       LDA #$00
       STA WASPXX
       STA MANXX
       STA ENDINDEX
       LDA #$02
       STA WASPSTATE
       JSR DRAW_GREEN_Z
       LDA #$40
       STA TEMP1
       LDA #<L2000	; from $2000 to $8000
       LDX #>L8000
       LDY #>L2000
       JSR MOVE_MEMORY_Z
       LDA #$00
       STA PATINDEX
       LDA #>L8228
       STA POINTER4+1
       LDA #<L8228
       STA POINTER4
       LDA #$06
       STA HEIGHT
:7     LDY #$0A
:8     LDX PATINDEX
       LDA TABLE703,X
       STA (POINTER4),Y
       INC PATINDEX
       INY
       CPY #$1D
       BNE :8
       LDX HEIGHT
       LDA PLAYERNUM
       BEQ :9
       TXA
       CLC
       ADC #$07
       TAX
:9     LDA TABLE704,X
       STA (POINTER4),Y
       INY
       LDA TABLE705,X
       STA (POINTER4),Y
       LDA POINTER4+1
       CLC
       ADC #$04
       STA POINTER4+1
       DEC HEIGHT
       BPL :7
       LDA #$2B
       STA L8000+$1E42
       LDA #$0C
       STA INIT_K4
       STA K4
       LDA #$18
       STA INIT_K3
       STA K3
       LDA #$60		; That is a RTS
       STA STING_MAN_Z
:1     JSR MAN_MASTER_Z
       LDA #$10
       JSR DELAY_Z
       LDA MANX
       CMP #$10
       BNE :1
:2     LDA MANX
       CMP #$2C
       BEQ :5
       JSR MAN_MASTER_Z
:5     DEC K4
       BNE :4
       LDA INIT_K4
       STA K4
       INC FLAP
       JSR MOVE_RIGHT_Z
       JSR ERASE_LEFT_Z
:4     LDX ENDINDEX
       LDA TABLE706,X
       BEQ :10
       LDY PITCH
       STY TEMP1
       JSR R1_Z
       LDA PITCH
       ADC #$02
       STA PITCH
       BNE :11
:10    LDA #$05
       STA PITCH
:11    LDA MANX
       CMP TABLE700,X
       BNE :2
       LDA TABLE701,X
       STA MANDIR
       LDA TABLE702,X
       STA INIT_K3
       INX
       CPX #$07
       BNE :6
       DEX
:6     STX ENDINDEX
       LDA #$2B
       CMP WASPX
       BCS :5
       LDX #$05
:3     JSR DELAY_Z
       DEX
       BNE :3
       LDA #$4C		; That is a JMP
       STA STING_MAN_Z
       PLA
       STA L460C+1
       RTS

TABLE700   hex 181A1C2022242C
TABLE701   hex B0BBD0B0BBD0
TABLE702   hex 020218020210
TABLE703   hex 2E552A552A553A552A552A553E752A552A552A3B552A552A556E552A552A556E5D2B552A552A2B5D3A572E556E5D6B752A556F5D6B752E572B2F776E5D3B556E5D3B772F556E5D3B776E5D3F
           hex 3B776E5D3B556E5D3B772E553E5D3B776E5D3B7B776E5D2E556E5D6B5D2E552E7D3E572B773A2E7D6F7D3B553A753E572E556E776B5F7B5D3A 
TABLE704   hex 7D757575757D757D5D7555555D75
TABLE705   hex 2B2A2A2A2A2A2A2B2A2A2B2B2B2A
TABLE706   hex 00084000084000

* We are at $0C00

       *or $C00
       *ta $C00

CAN_MASTER_Z
       JMP CAN_MASTER
C4_Z
       JMP C4

PLOT_CAN
       JSR PLOT_NOZZLE
       LDA #>L4EA2
       STA POINTER1+1
       LDA #<L4EA2
       STA POINTER1
       LDA #$1F
       STA HEIGHT
       LDA #$00
       STA PATINDEX
       LDX CANXX
       LDA CANY
       STA TEMP3
:2     LDA CANX
       STA TEMP4
       LDY TEMP3
       LDA (SCRPNT1),Y
       STA POINTER2+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER2
       STA POINTER4
       LDY TEMP4
       LDA (POINTER4),Y
       AND TABLE600,X
       STA TEMP1
       LDY PATINDEX
       LDA (POINTER1),Y
       STA TEMP2
       LDY TABLE601,X
       LDA #$00
:1     LSR TEMP2
       ROR
       DEY
       BNE :1
       LSR
       ORA TEMP1
       LDY TEMP4
       STA (POINTER2),Y
       INC PATINDEX
       INC TEMP4
       LDY PATINDEX
       LDA (POINTER1),Y
       STA TEMP1
       LDY TABLE601,X
       LDA #$00
:3     LSR TEMP1
       ROR
       DEY
       BNE :3
       LSR
       ORA TEMP2
       LDY TEMP4
       STA (POINTER2),Y
       INC PATINDEX
       INC TEMP4
       LDY PATINDEX
       LDA (POINTER1),Y
       STA TEMP2
       LDY TABLE601,X
       LDA #$00
:4     LSR TEMP2
       ROR
       DEY
       BNE :4
       LSR
       ORA TEMP1
       LDY TEMP4
       STA (POINTER2),Y
       INY
       LDA (POINTER4),Y
       AND TABLE602,X
       ORA TEMP2
       STA (POINTER2),Y
       INC TEMP3
       INC PATINDEX
       DEC HEIGHT
       BNE :2
       JMP PLOT_SPRAY

TABLE600   hex 80838FBF81879F
TABLE601   hex 07050301060402
TABLE602   hex FFFCF0C0FEF8E0

PLOT_NOZZLE
       LDY CANX
       INY
       STY TEMP1 
       LDA CANY
       SEC 
       SBC #$07
       STA TEMP2
       LDA #>L4E9B
       STA POINTER1+1
       LDA #<L4E9B
       STA POINTER1
       LDA #$00
       STA PATINDEX
       LDA #$07
       STA HEIGHT
       LDX CANXX
:2     LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER2+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER2
       STA POINTER4
       LDY TEMP1
       LDA (POINTER4),Y
       AND TABLE600,X
       STA TEMP3
       LDY PATINDEX
       LDA (POINTER1),Y
       STA TEMP4
       LDY TABLE601,X
       LDA #$00
:1     LSR TEMP4
       ROR
       DEY
       BNE :1
       LSR
       ORA TEMP3
       LDY TEMP1
       STA (POINTER2),Y
       INC PATINDEX
       INY
       LDA (POINTER4),Y
       AND TABLE602,X
       ORA TEMP4
       STA (POINTER2),Y
       INC TEMP2
       DEC HEIGHT
       BNE :2
       RTS

ERASE_LEFT_CAN
       LDA CANY
       SEC
       SBC #$07
       STA TEMP2
       LDY CANX
       INY
       STY TEMP1 
       LDA #$07
       JSR :2    
       DEC TEMP1
       LDA #$1F
:2     STA HEIGHT
:1     LDY TEMP2
       LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDY TEMP1
       LDA (POINTER4),Y
       STA (POINTER1),Y
       INC TEMP2
       DEC HEIGHT
       BNE :1
       RTS

ERASE_ALL
       LDA CANY
       SEC
       SBC #$17
       STA TEMP2
       LDA #$36
       STA HEIGHT
:2     LDA CANX
       STA TEMP1
       LDA #$08
       STA WIDTH
       LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
:1     LDY TEMP1
       LDA (POINTER4),Y
       STA (POINTER1),Y
       INC TEMP1
       DEC WIDTH
       BNE :1
       INC TEMP2
       DEC HEIGHT
       BNE :2
       RTS

CAN_MASTER
       LDA KBDSTROBE
       LDA #$33
       JSR C2
       LDA #$5B
       JSR C2
       LDA #$84
       JSR C2
       LDA #$AD
       JSR C2
       LDY #$07
:5     LDA FOODBYT3_2,Y		; LoGo: beware it is using the second table
       AND #$FD
       STA FOODBYT3_2,Y
       DEY
       BPL :5
       LDY #$1B
:6     LDA DESTBYT1,Y
       AND #$BF
       STA DESTBYT1,Y
       DEY
       BPL :6
       JSR CLEAR_AA
       LDY #$10
       LDA PLAYERNUM
       CMP #$02
       BNE C1
C3     LDY #$17
C1     LDA #$00
       STA $2000,Y
       STA $2400,Y
       STA $2800,Y
       STA $2C00,Y
       STA $3000,Y
       STA $3400,Y
       STA $3800,Y
       STA $3C00,Y
       RTS
C2     STA CANY
       LDA #$04
       STA CANX
       STA CANXX
       JSR ERASE_ALL
:2     JSR PLOT_CAN
       JSR RANDOM1_Z
       STA TEMP1
       LDA #$06
       JSR R1_Z
       INC CANXX
       LDA CANXX
       CMP #$04
       BEQ :1
       CMP #$07
       BNE :2
       LDA #$00
       STA CANXX
:1     JSR ERASE_SPRAY
       JSR ERASE_LEFT_CAN
       INC CANX
:4     LDA CANX
       CMP #$26
       BCC :2
       JMP ERASE_ALL

C4     LDY #$10
       JSR C1
       JMP C3

PLOT_SPRAY
       LDX CANXX
       LDA CANY
       SEC
       SBC #$08
       STA TEMP2
       LDA CANX
       CLC
       ADC #$03
       STA TEMP1
       LDA #$7F
       STA TEMP3
       LDA #$07
       JSR :2
       INC TEMP1
       LDA CANY
       SEC
       SBC #$0B
       STA TEMP2
       LDA #$0D
       JSR :2
       INC TEMP2
       LDA CANY
       SEC
       SBC #$0E
       STA TEMP2
       LDA #$13
       JSR :2
       INC TEMP1
       LDA CANY
       SEC
       SBC #$11
       STA TEMP2
       LDA #$19
       JSR :2
       INC TEMP1
       LDA CANY
       SEC
       SBC #$14
       STA TEMP2
       LDA #$1F
       JSR :2
       INC TEMP1
       LDA CANY
       SEC
       SBC #$17
       STA TEMP2
       LDA TABLE606,X
       STA TEMP3
       LDA #$25
:2     STA HEIGHT
:1     LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       JSR RANDOM1_Z
       AND TEMP3
       LDY TEMP1
       ORA (POINTER4),Y
       STA (POINTER1),Y 
       INC TEMP2
       DEC HEIGHT
       BNE :1
       RTS

TABLE606   hex 01071F7F030F3F  

ERASE_SPRAY
       LDA #$00
       STA TEMP4
       LDA CANX
       CLC
       ADC #$03
       STA TEMP1
       LDA CANY
       SEC
       SBC #$0B
       JSR :1
       INC TEMP1
       LDA CANY
       SEC
       SBC #$0E
       JSR :1
       INC TEMP1
       LDA CANY
       SEC
       SBC #$11
       JSR :1
       INC TEMP1
       LDA CANY
       SEC
       SBC #$14
       JSR :1
       INC TEMP1
       LDA CANY
       SBC #$17
:1     JSR :2
       LDA TEMP4
       CLC
       ADC #$06
       STA TEMP4
       CLC
       ADC TEMP2
:2     STA TEMP2
       LDA #$04
       STA HEIGHT
:3     LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER4
       STA POINTER1
       LDY TEMP1
       LDA (POINTER4),Y
       STA (POINTER1),Y
       INC TEMP2
       DEC HEIGHT
       BNE :3
       RTS

CLEAR_AA
       LDA #>L1A90
       STA POINTER1+1
       LDA #<L1A90-$90	; LOGO
       STA POINTER1
       LDY #$90
:4     LDA (POINTER1),Y
       AND #$7F
       STA TEMP1
       CMP #$03
       BEQ :1
       AND #$3F
       CMP #$20
       BCS :2
       CMP #$10
       BCS :3
:2     LDA TEMP1
       AND #$40
:1     STA (POINTER1),Y
       INY
       BNE :4
       INC POINTER1+1
       LDA POINTER1+1
       CMP #$20
       BNE :4
       RTS
:3     STA TEMP2
       LDA TEMP1
       AND #$40
       ORA TEMP2
       BNE :1
       RTS

* We are at $0F52

L0F52  hex 02
RAMCARD hex 00

* We are at $0F54

       *or $F54
       *ta $1F54
FLIP
       STY TEMP1
       LDA #$14
       STA HEIGHT
       LDA #$B6
       STA TEMP2
:3     LDA #$0F
       STA WIDTH
       LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER1+1
       LDA (SCRPNT2),Y
       STA POINTER1
       LDY TEMP1
:2     LDA (POINTER1),Y
       BEQ :1
       EOR #$FF
       STA (POINTER1),Y
:1     INY
       DEC WIDTH
       BNE :2
       INC TEMP2
       DEC HEIGHT
       BNE :3
       JMP SELECT3

* We are at $0F84

TABLE399 hex 400F30600C600C0C030367002A00000000000000600F183006307E0F

         hex   9F00CC00C90094D494D4C900CC009F00
         hex   FF00FC00930094D49495E4009F00FF00
         hex   9F00FC00E300E9AAE9A8E3009F00FC00
         hex   FF009C00E300E9AAE9A8E3009C00FF00
         hex   99009900E700E1808780E70099009900
         hex   9C009C00F300E780F380E7009C009C00

* We are at $1000

ANTBYT1  hex   00000000000000000000000000000000
         hex   00000000000000000033000000000000
ANTBYT2  hex   00000000000000000000000000000000
         hex   00000000000000000000000000000000
ANTBYT3  hex   00000000000000000000000000000000
         hex   00000000000000000000000000000000
ANTBYT4  hex   00000000000000000000000000000000
         hex   00000000000000000000000000000000

* We are at $1080

       *or $1080
DESTBYT1 hex 8E8E8E8E919293949B9C9DA0A0A08F8F8F9293949B9C9D9EA1A1A1A100000000
       *or $10A0
DESTBYT2 hex 444C545C505450545054504C545C88909894909490949094889098A000000000
       *or $10C0
AAMSBYT  hex 1A1A1A1B1B1B1B1B1C1C1C1C1C1D1D1D1D1D1D1E1E1E1E1E1F1F1F1F1F000000
       *or $10E0
AALSBYT  hex 90C0F0205080B0E0104070A0D000306090C0F0205080B0E0104070A0D0

* We are at $10FD

       *or $10FD

PLOT_SPLAT_Z
       JMP PLOT_SPLAT
MOVE_4_ANTS_Z
       JMP MOVE_4_ANTS

PLOT_SPLAT
       LDY ANTNUM
       LDA ANTBYT3,Y
       STA ANTXX
       STA ANTXXOLD
       LDA ANTBYT1,Y
       AND #$3F
       STA ANTX
       STA ANTXOLD
       LDA ANTBYT2,Y
       STA ANTY
       STA ANTYOLD
       JSR ERASE_ANT_Z
       LDA #>L40F0
       STA POINTER1+1
       LDA #<L40F0
       STA POINTER1
       JMP PLOT_ANT_3_Z

MOVE_4_ANTS
       DEC K1
       BEQ :5
       RTS
:5     LDA INIT_K1
       STA K1
       JSR CREATE_ANT_Z
       LDA #$04
       STA COUNT4ANTS
:1     LDY ANTNUM
:2     DEY
       STY ANTNUM
       DEC COUNT4ANTS
       BMI :3
       LDA ANTBYT1,Y
       BEQ :6
       JSR MOVE_1_ANT
       JMP :1
:3     INY
       BNE :4
       LDA ANTORIENT
       EOR #$80
       STA ANTORIENT
       JSR RANDOM1_Z
       JSR RANDOM2_Z
       LDY #$20
:4     STY ANTNUM
       RTS
:6     LDA #$15
       JSR DELAY_Z
       JMP :2

MOVE_1_ANT
       LDA ANTBYT4,Y
       BMI :13
       CMP #$20
       AND #$1F
       TAX
       BCC :1
       STX TEMP1
       JSR RANDOM2_Z
       LDX ROUND
       CMP TABLE399_2,X
       LDX TEMP1
       BCS :1
       LDA DESTBYT1,X
       AND #$40
       BEQ :1
       DEX
       BPL :23
       LDX #$02
:23    JSR PICK_DEST2_Z
:1     LDA ANTBYT1,Y
       AND #$3F
       STA ANTX
       STA ANTXOLD
       LDA ANTBYT2,Y
       STA ANTY
       STA ANTYOLD
:2     LDA ANTBYT3,Y
       STA ANTXX
       STA ANTXXOLD
       LDA ANTBYT4,Y
       AND #$20
       BNE :11
       LDA ANTBYT4,Y
       LSR
       BEQ :12
       STA ANTBYT4,Y
       JMP PLOT_SPLAT
:12    JSR ERASE_ANT_Z
       LDA #$00
       LDY ANTNUM
       STA ANTBYT1,Y
:13    RTS
:11    LDA ANTBYT1,Y
       AND #$C0
       STA ANTDIR
       CLC
       ADC #$80
       STA ANTMOV4
       ASL
       BMI :21
       LDA ANTY
       AND #$07
       BEQ :22
       LDA ANTDIR
       JMP :6
:21    LDA ANTXX
       BEQ :3
       CMP #$04
       BEQ :3
       LDA ANTDIR
       JMP :6
:22    LDA DESTBYT1,X
       AND #$3F
       CMP ANTX
       BEQ :4
       LDX ANTDIR
       BCC :5
       LDA #$40
       LDY #$C0
       BNE :6
:5     LDA #$C0
       LDY #$40
       BNE :6
:4     LDA DESTBYT2,X
       AND #$F8
       CMP ANTY
       BEQ :10
       BCC :14
       LDA #$00
       STA ANTMOV4
       LDA #$80
       LDX #$C0
       LDY #$40
       BNE :6
:14    LDA #$80
       STA ANTMOV4
       LDA #$00
       LDX #$40
       LDY #$C0
       BNE :6
:10    LDA DESTBYT1,X
       ORA #$40
       STA DESTBYT1,X
       LDA ANTBYT4,Y
       ORA #$80
       STA ANTBYT4,Y
       AND #$1F
       TAX
       LDA TABLE9A,X
       STA FOODNUM
       JMP ERASE_ANT_Z
:3     LDA DESTBYT2,X
       AND #$F8
       CMP ANTY
       BEQ :7
       LDX ANTDIR
       BCC :8
       LDA #$80
       LDY #$00
       BEQ :6
:8     LDA #$00
       LDY #$80
       BNE :6
:7     LDA DESTBYT1,X
       AND #$3F
       CMP ANTX
       BEQ :10
       BCC :9
       LDA #$C0
       STA ANTMOV4
       LDA #$40
       LDX #$00
       LDY #$80
       BNE :6
:9     LDA #$40
       STA ANTMOV4
       LDA #$C0
       LDX #$80
       LDY #$00
:6     STA ANTMOV1
       STX ANTMOV2
       STY ANTMOV3
       LDA ANTMOV1
       JSR ANT_MOVE_LEVEL_CHECK
       BMI :15
       BEQ :16
:18    RTS
:16    LDA ANTMOV1
       JMP :20
:15    LDA ANTMOV2
       JSR ANT_MOVE_LEVEL_CHECK
       BMI :17
       BNE :18
       LDA ANTMOV2
       JMP :20
:17    LDA ANTMOV3
       JSR ANT_MOVE_LEVEL_CHECK
       BMI :19
       BNE :18
       LDA ANTMOV3
       JMP :20
:19    LDA ANTMOV4
       JSR ANT_MOVE_LEVEL_CHECK
       BNE :18
       LDA ANTMOV4
:20    STA ANTDIR
       JSR ERASE_ANT_Z
       JSR PLOT_ANT_Z
       LDY ANTNUM
       LDA ANTDIR
       ORA ANTX
       STA ANTBYT1,Y
       LDA ANTY
       STA ANTBYT2,Y
       LDA ANTXX
       STA ANTBYT3,Y
       RTS

TABLE399_2   hex 0006090C0F1215181B1E

ANT_MOVE_LEVEL_CHECK
       BEQ AUP
       BPL AR
       ASL
       BMI ANTLEFT
       JMP ANTDOWN
AUP    JMP ANTUP
AR     JMP ANTRIGHT

ANTLEFT
       LDA ANTXX
       BEQ :1
       CMP #$04
       BEQ :4
       SEC
       SBC #$01
       STA ANTXX
       BEQ :2
       CMP #$04
       BEQ :2
       LDA #$00
       RTS
:2     INC ANTX
:11    JSR SET_BLOCK_VACANT_Z
       LDA ANTY
       AND #$07
       BNE :3
       DEC ANTX
       LDA #$00
       RTS
:3     LDA ANTY
       CLC
       ADC #$08
       STA ANTY
       JSR SET_BLOCK_VACANT_Z
       LDA ANTY
       SEC
       SBC #$08
       STA ANTY
       DEC ANTX
       LDA #$00
       RTS
:4     LDA ANTX
       CMP #$02
       BNE :1
       JSR VACATE_ANTS_BLOCKS_Z
       LDA #$00
       LDY ANTNUM
       STA ANTBYT1,Y
       LDA #$01
       RTS
:1     DEC ANTX
       JSR GET_BLOCK_Z
       AND #$BF
       BEQ :5
       CMP #$03
       BEQ :6
       INC ANTX
       LDA #$80
       RTS
:6     JSR ERASE_WEB_Z
:5     LDA ANTY
       AND #$07
       BEQ :7
       LDA ANTY
       CLC
       ADC #$08
       STA ANTY
       JSR GET_BLOCK_Z
       AND #$BF
       BEQ :8
       CMP #$03
       BEQ :9
       LDA ANTY
       SEC
       SBC #$08
       STA ANTY
       INC ANTX
       LDA #$80
       RTS
:9     JSR ERASE_WEB_Z
:8     JSR SET_BLOCK_ANT_Z
       LDA ANTY
       SEC
       SBC #$08
       STA ANTY
:7     LDA ANTXX
       SEC
       SBC #$01
       BPL :10
       LDA #$06
:10    STA ANTXX
       JSR SET_BLOCK_ANT_Z
       LDA #$00
       RTS

ANTRIGHT 
       LDA ANTXX
       BEQ :2
       CMP #$04
       BEQ :1
       CLC
       ADC #$01
       STA ANTXX
       CMP #$07
       BEQ :12
       CMP #$04
       BEQ :3
       LDA #$00
       RTS
:12    LDA #$00
       STA ANTXX
:3     JSR SET_BLOCK_VACANT_Z
       LDA ANTY
       AND #$07
       BEQ :4
       LDA ANTY
       CLC
       ADC #$08
       STA ANTY
       JSR SET_BLOCK_VACANT_Z
       LDA ANTY
       SEC
       SBC #$08
       STA ANTY
:4     INC ANTX
       LDA #$00
       RTS
:1     LDA ANTX
       CMP #$2C
       BNE :2
       JSR VACATE_ANTS_BLOCKS_Z
       LDA #$00
       LDY ANTNUM
       STA ANTBYT1,Y
       LDA #$01
       RTS
:2     INC ANTX
       JSR GET_BLOCK_Z
       AND #$BF
       BEQ :5
       CMP #$03
       BEQ :6
       DEC ANTX
       LDA #$80
       RTS
:6     JSR ERASE_WEB_Z
:5     LDA ANTY
       AND #$07
       BEQ :10
       LDA ANTY
       CLC
       ADC #$08
       STA ANTY
       JSR GET_BLOCK_Z
       AND #$BF
       BEQ :8
       CMP #$03
       BEQ :9
       LDA ANTY
       SEC
       SBC #$08
       STA ANTY
       DEC ANTX
       LDA #$80
       RTS
:9     JSR ERASE_WEB_Z
:8     JSR SET_BLOCK_ANT_Z
       LDA ANTY
       SEC
       SBC #$08
       STA ANTY
:10    LDA ANTXX
       CLC
       ADC #$01
       STA ANTXX
       CMP #$07
       BNE :11
       LDA #$00
       STA ANTXX
:11    JSR SET_BLOCK_ANT_Z
       DEC ANTX
       LDA #$00
       RTS

ANTUP
       LDA ANTY
       CMP #$13
       BNE :1
       LDY ANTNUM
       LDA #$00
       STA ANTBYT1,Y
       JSR VACATE_ANTS_BLOCKS_Z
       LDA #$01
       RTS
:1     SEC
       SBC #$01
       STA ANTY
       AND #$07
       BEQ :2
       CMP #$07
       BEQ :3
       LDA #$00
       RTS
:2     LDA ANTY
       CLC
       ADC #$08
       STA ANTY
:11    JSR SET_BLOCK_VACANT_Z
       LDA ANTXX
       BEQ :4
       CMP #$04
       BEQ :4
       INC ANTX
       JSR SET_BLOCK_VACANT_Z
       DEC ANTX
:4     LDA ANTY
       SEC
       SBC #$08
       STA ANTY
       LDA #$00
       RTS
:3     JSR GET_BLOCK_Z
       AND #$BF
       BEQ :6
       CMP #$03
       BEQ :5
       INC ANTY
       LDA #$80
       RTS
:5     JSR ERASE_WEB_Z
:6     LDA ANTXX
       BNE :7
:8     JSR SET_BLOCK_ANT_Z
       LDA #$00
       RTS
:7     CMP #$04
       BEQ :8
       INC ANTX
       JSR GET_BLOCK_Z
       AND #$BF
       BEQ :10
       CMP #$03
       BEQ :9
       DEC ANTX
       INC ANTY
       LDA #$80
       RTS
:9     JSR ERASE_WEB_Z
:10    JSR SET_BLOCK_ANT_Z
       DEC ANTX
       JSR SET_BLOCK_ANT_Z
       LDA #$00
       RTS

ANTDOWN
       LDA ANTY
       CMP #$CC
       BNE :1
       LDA #$00
       LDY ANTNUM
       STA ANTBYT1,Y
       JSR VACATE_ANTS_BLOCKS_Z
       LDA #$01
       RTS
:1     CLC
       ADC #$01
       STA ANTY
       AND #$07
       BEQ :2
       CMP #$01
       BEQ :3
       LDA #$00
       RTS
:2     DEC ANTY
:11    JSR SET_BLOCK_VACANT_Z
       LDA ANTXX
       BEQ :4
       CMP #$04
       BEQ :4
       INC ANTX
       JSR SET_BLOCK_VACANT_Z
       DEC ANTX
:4     INC ANTY
       LDA #$00
       RTS
:3     LDA ANTY
       CLC
       ADC #$08
       STA ANTY
       JSR GET_BLOCK_Z
       AND #$BF
       BEQ :6
       CMP #$03
       BEQ :5
       LDA ANTY
       SEC
       SBC #$09
       STA ANTY
       LDA #$80
       RTS
:5     JSR ERASE_WEB_Z
:6     LDA ANTXX
       BNE :7
:8     JSR SET_BLOCK_ANT_Z
       LDA ANTY
       SEC
       SBC #$08
       STA ANTY
       LDA #$00
       RTS
:7     CMP #$04
       BEQ :8
       INC ANTX
       JSR GET_BLOCK_Z
       AND #$BF
       BEQ :10
       CMP #$03
       BEQ :9
       DEC ANTX
       LDA ANTY
       SEC
       SBC #$09
       STA ANTY
       LDA #$80
       RTS
:9     JSR ERASE_WEB_Z
:10    JSR SET_BLOCK_ANT_Z
       DEC ANTX
       JSR SET_BLOCK_ANT_Z
       LDA ANTY
       SEC
       SBC #$08
       STA ANTY
       LDA #$00
       RTS

* The following two tables are NOT used

TABLE9.2 hex 01010101000100010001000000000000000100010001000100000000  
TABLE8.2 hex 2020202000000000000000B0B0B0A0A0A01010101010101030303030  

TABLE9A hex 01010101020202020303030404040505050606060707070708080808

* We are at $15BC

       *or $15BC
       *ta $15BC

SET_FOOD_STATUS
       STX TEMP2
       LDA #<L1C00
       STA PATINDEX
       STA POINTER1
       LDA #>L1C00
       STA POINTER1+1
:14    DEX
       BPL :11
:12    LDY PATINDEX
       LDA TABLE350,Y
       BEQ :8
       CMP #$FA
       BEQ :9
       CMP #$FF
       BEQ :10
       TAY
       LDA TEMP1
       STA (POINTER1),Y
:13    INC PATINDEX
       BNE :12
:9     INC POINTER1+1
       BNE :13
:10    DEC POINTER1+1
       BNE :13
:11    LDY PATINDEX
       LDA TABLE350,Y
       BEQ :15
       CMP #$FA
       BEQ :16
       CMP #$FF
       BEQ :17
       INC PATINDEX
       BNE :11
:15    INC PATINDEX
       BNE :14
:16    INC POINTER1+1
       INC PATINDEX
       BNE :11
:17    DEC POINTER1+1
       INC PATINDEX
       BNE :11
:8     LDX TEMP2
       RTS

TABLE350   hex 1C1D4C4D7C7DACAD002122232451525354002B2C2D5B5C5D00616263919293C1C2C300FACCCDCEFCFDFEFA2C2D2E00323334626364003B3C3D3E6B6C6D6E00FFE2E3FA12134243727300   
TABLE380   hex E0C7B4A79583746D
TABLE381   hex 0303050505050303
TABLE382   hex 0606101010100606
TABLE383   hex 808F9EADBCCBDAE9

POINTS_FOR_FOOD
       LDX #$00
       STX ALL_FOOD_OFF
:2     LDA FOODBYT3,X
       BMI :1
:7     INX
       CPX #$08
       BCC :2
       RTS
:1     STX TEMP5
       LDA TABLE380,X
       STA TEMP1
       LDA #$50
       STA TEMP2
:4     LDY TEMP1
       LDA SPKR
:3     DEY
       BNE :3
       DEC TEMP2
       BNE :4
       LDA FOODBYT3,X
       AND #$04
       BEQ :5
       LDA TABLE381,X
       BNE :6
:5     INC ALL_FOOD_OFF
       LDA TABLE382,X
:6     JSR SCORE_Z
       LDX TEMP5
       LDA TABLE383,X
       JSR DELAY_Z
       JMP :7

DAZZLE
       STA TEMP1
       LDX #$03
:3     LDY #$00
       STY POINTER1
       LDA #$04
       STA POINTER1+1
:2     LDA (POINTER1),Y
       BEQ :1
       JSR RANDOM1_Z
       STA (POINTER1),Y
:1     INY
       BNE :2
       INC POINTER1+1
       LDA POINTER1+1
       CMP #$08
       BNE :2
       DEX
       BEQ :4
:7     DEC TEMP1
       BNE :3
       RTS
:4     LDX #$03
       LDA #$22
       STA TEMP2
       LDA #$2A
       STA TEMP3
:6     LDY TEMP2
       LDA SPKR
:5     DEY
       BNE :5
       DEC TEMP3
       BNE :6
       BEQ :7

* We are at $1700

       *or $1700

SET_BLOCK_VACANT_Z
       JMP SET_BLOCK_VACANT
PLOT_ANT_3_Z
PLOT_ANT4_Z
       JMP PLOT_ANT_4
RANDOM1_Z
       JMP RANDOM1
RANDOM2_Z
       JMP RANDOM2
PLOT_ANT_2_Z
       JMP PLOT_ANT_2
ERASE_ANT_Z
       JMP ERASE_ANT
PLOT_ANT_Z
       JMP PLOT_ANT
GET_BLOCK_Z
       JMP GET_BLOCK
SET_BLOCK_ANT_Z
       JMP SET_BLOCK_ANT
PICK_DEST2_Z
*       JMP PICK_DEST	; for ANT@@ F
       JMP PICK_DEST2	; for ANT@@ E
CREATE_ANT_Z
       JMP CREATE_ANT

GET_BLOCK
       LDY ANTX
       LDA ANTY
       LSR
       LSR
       LSR
       TAX
       LDA AALSBYT,X
       STA POINTER3
       LDA AAMSBYT,X
       STA POINTER3+1
       LDA (POINTER3),Y
       RTS

SET_BLOCK_VACANT
       JSR GET_BLOCK
       AND #$C0
       STA (POINTER3),Y
       RTS

SET_BLOCK_ANT
       JSR GET_BLOCK
       AND #$C0
       ORA #$20
       ORA ANTNUM
       STA (POINTER3),Y
       RTS

PLOT_ANT
       LDA ANTDIR
       BEQ PLOT_ANT_2
       BPL :2
       ROL
       BMI :3
       LDA #<L0820
       BNE PLOT_ANT_2
:2     LDA #<L0860
       BNE PLOT_ANT_2
:3     LDA #<L0840

PLOT_ANT_2
       LDY #>L0800
       STY POINTER1+1  
       LDY ANTORIENT     
       BPL PLOT_ANT_3
       CLC
       ADC #$10

PLOT_ANT_3
       STA POINTER1

PLOT_ANT_4
       LDX ANTXX
       LDA #$08
       STA HEIGHT
       LDA #$00
       STA PATINDEX
:11    LDY ANTY
       LDA (SCRPNT1),Y
       STA POINTER2+1
       LDA (SCRPNT2),Y
       STA POINTER2
       LDY ANTX
       CPY #$2C
       BCS :7
       CPY #$04
       BCC :7
       LDA (POINTER2),Y
       STA TEMP1
       LDY PATINDEX
       LDA (POINTER1),Y
       STA TEMP2
       INY
       LDA (POINTER1),Y
       LDY TABLE2,X
       BEQ :6
:5     SEC
       ROL
       ASL TEMP2
       DEY
       BNE :5
:6     ORA #$80
       AND TEMP1
       STA TEMP1
       LDA TEMP2
       AND #$7F
       ORA TEMP1
       LDY ANTX
       STA (POINTER2),Y
:7     INY
       CPY #$2C
       BCS :10
       CPY #$04
       BCC :10
       LDA (POINTER2),Y
       STA TEMP1
       LDY PATINDEX
       LDA (POINTER1),Y
       STA TEMP2
       INY
       LDA (POINTER1),Y
       LDY TABLE4,X
:8     SEC
       ROR
       LSR TEMP2
       DEY
       BNE :8
       AND TEMP1
       STA TEMP1
       LDA TEMP2
       AND #$7F
       ORA TEMP1
       LDY ANTX
       INY
       STA (POINTER2),Y
:10    INC ANTY
       INC PATINDEX
       INC PATINDEX
       DEC HEIGHT
       BNE :11
       LDA ANTY
       SEC
       SBC #$08
       STA ANTY
       RTS

ERASE_ANT
       LDA #$08
       STA HEIGHT
       LDX ANTXXOLD
:3     LDY ANTYOLD
       LDA (SCRPNT1),Y
       STA POINTER3+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER3
       STA POINTER4
       LDY ANTXOLD
       CPY #$2C
       BCS :1
       CPY #$04
       BCC :1
       LDA (POINTER3),Y
       AND TABLE1,X
       STA TEMP5
       LDA TABLE1,X
       EOR #$FF
       AND (POINTER4),Y
       ORA TEMP5
       STA (POINTER3),Y
:1     INY
       CPY #$2C
       BCS :2
       CPY #$04
       BCC :2
       LDA (POINTER3),Y
       AND TABLE3,X
       STA TEMP5
       LDA TABLE3,X
       EOR #$FF
       AND (POINTER4),Y
       ORA TEMP5
       STA (POINTER3),Y
:2     INC ANTYOLD
       DEC HEIGHT
       BNE :3
       RTS

CREATE_ANT
       DEC K2
       BEQ :1
:3     RTS
:1     LDA INIT_K2
       STA K2

*--- The following two lines are in ANT@@ F but not in ANT@@ E

*       LDA #$01	; was added in F - not in original binary
*       STA TEMP3	; was added in F - not in original binary

       LDY #$20
:2     DEY
       BMI :3
       LDA ANTBYT1,Y
       BNE :2
       JSR PICK_DEST
       JSR RANDOM2
       CMP #$C0
       BCS :9
       CMP #$80
       BCS :10
       CMP #$40
       BCS :11
       LDA #$03
       STA ANTBYT3,Y
       LDA #$EB
       STA ANTBYT1,Y
       LDA #$2B
       STA TEMP2
       BNE :12
:9     LDA #$01
       STA ANTBYT3,Y
       LDA #$43
       STA ANTBYT1,Y
       LDA #$04
       STA TEMP2
       BNE :12
:10    LDA #$D0
       STA ANTBYT2,Y
       JSR PICKX
       STA TEMP2
       STA ANTBYT1,Y
       ROR
       LDA #$00
       BCS :15
       LDA #$04
:15    STA ANTBYT3,Y
       LDA #$1A
       BNE :16
:11    LDA #$10
       STA ANTBYT2,Y
       JSR PICKX
       STA TEMP2
       ORA #$80
       STA ANTBYT1,Y
       ROR
       LDA #$00
       BCS :17
       LDA #$04
:17    STA ANTBYT3,Y
       LDA #$02
       BNE :16
:12    JSR RANDOM2
       CMP #$C0
       BCS :18
       CMP #$20
       BCS :13
:18    JSR RANDOM1
       CMP #$C0
       BCS :12
       CMP #$20
       BCC :12

*--- The following three lines are in ANT@@ E but not in ANT@@ F

       LDA #$48
       BNE :13
       JMP MOVE_MEMORY-1	; LoGo: beware of the BUG

:13    AND #$F8
       STA ANTBYT2,Y
       LSR
       LSR
       LSR
:16    TAX
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       STY TEMP1
       LDY TEMP2
       LDA (POINTER1),Y
       AND #$BF
       BEQ :14
       LDY TEMP1
       LDA #$00
       STA ANTBYT1,Y
       RTS
:14    LDA TEMP1
       ORA #$20
       ORA (POINTER1),Y
       STA (POINTER1),Y
       RTS

PICKX
       JSR RANDOM2
       AND #$3F
       CLC
       ADC #$05
       CMP #$2B
       BCC :1
       JSR RANDOM1
       AND #$3F
       CLC
       ADC #$05
       CMP #$2B
       BCS PICKX
:1     RTS

RANDOM1
       STX TEMPRND
       LDA #$20
       TAX
       BIT RNDBYTE1
       BVC :1
       BEQ :5
       INX
:1     BEQ :2
:5     INX
:2     LDA #$08
       BIT RNDBYTE1
       BEQ :3
       INX
:3     LDA #$01
       BIT RNDBYTE1
       BEQ :4
       INX
:4     TXA
       ROR
       ROR RNDBYTE1
       LDX TEMPRND
       LDA RNDBYTE1
       RTS

*--- The following code is in ANT@@ E

PICK_DEST
       JSR RANDOM1
       AND #$1F
       CMP #$1C
       BCC :1
       JSR RANDOM2 
       AND #$1F
       CMP #$1C
       BCS PICK_DEST
:1     TAX

PICK_DEST2
       LDA #$01
       STA TEMP3
:8     LDA DESTBYT1,X
       BMI :7
:20    INX
       INX
       INX
       CPX #$1C
       BCC :8
       JSR RANDOM1
       AND #$03
       TAX
       BPL :8
:7     AND #$40
       BEQ :19
       DEC TEMP3
       BPL :20
:19    TXA
       ORA #$20
       STA ANTBYT4,Y
       RTS

*--- The following code is in ANT@@ F

*PICK_DEST
*       JSR RANDOM1
*       AND #$1F
*       CMP #$1C
*       BCC :4
*:6     JSR RANDOM2
*       AND #$1F
*       CMP #$1C
*       BCS PICK_DEST
*:4     TAX
*:8     LDA DESTBYT1,X
*       BMI :7
*:20    INX
*       INX
*       INX
*       CPX #$1C
*       BCC :8
*       JSR RANDOM1
*       AND #$03
*       BPL :4
*:7     AND #$40
*       BEQ :19
*       DEC TEMP3
*       BPL :20
*:19    TXA
*       ORA #$20
*       STA ANTBYT4,Y
*       RTS

TABLEDEST1 hex 8E8E8E8E919293949B9C9DA0A0A08F8F8F9293949B9C9D9EA1A1A1A1
TABLEDEST2 hex 444C545C505450545054504C545C88909894909490949094889098A0
TABLE1 hex 80838FBF81879F
TABLE2 hex 00020406010305
TABLE3 hex FEF8E080FCF0C0
TABLE4 hex 07050301060402   
TABLE8 hex 2020202000000000000000B0B0B0A0A0A01010101010101030303030  
TABLE9 hex 01010101000100010001000000000000000100010001000100000000

* We are at $1A14

       *or $1A14
       *ta $1A14
PLOT_HISCORE
       LDA #$00
       TAY
       TAX
:3     STA $27D0,Y  
       STA $2BD0,Y
       STA $2FD0,Y
       STA $33D0,Y
       STA $37D0,Y
       STA $3BD0,Y
       STA $3FD0,Y
       INY
       CPY #$26
       BNE :3
       LDA HISCOREHI
       LSR
       LSR
       LSR
       LSR
       LDY #$E7
       JSR PLOT_NUM2_Z
       LDA HISCOREHI
       AND #$0F
       LDY #$E8
       JSR PLOT_NUM2_Z
       LDA HISCORELO
       LSR
       LSR
       LSR
       LSR
       LDY #$E9
       JSR PLOT_NUM2_Z
       LDA HISCORELO
       AND #$0F
       LDY #$EA
       JSR PLOT_NUM2_Z
       LDA ROUND
       LDY #$F4
       JSR PLOT_NUM2_Z
       LDA #$23
       STA POINTER1+1
       LDA #$DC
       STA POINTER1
       LDA #$07
       STA HEIGHT
:2     LDY #$0F
       LDA TABLE395,X
       STA (POINTER1),Y
       LDY #$09 
       INX
:1     LDA TABLE395,X
       STA (POINTER1),Y
       INX
       DEY
       BPL :1
       LDA POINTER1+1
       ADC #$04
       STA POINTER1+1
       DEC HEIGHT
       BNE :2
       LDA #$0C
       STA $3FDE
       RTS

* We are at $1A90 with a long table until $1FFF

L1A90    hex   00000000000000000000000000000000
         hex   00000000004000000000400000000000
         hex   00000000000000000000000000000000
L1AC0    hex   00000000000000000000000000000000
         hex   00000000004000000000400000000000
         hex   00000000000000000000000000000000
L1AF0    hex   00000000000000000000000000000000
L1B00    hex   00000000004000000000400000000000
         hex   00000000000000000000000000000000
         hex   00000000404040404040404040404040
         hex   40404040404000000000404040404040
         hex   40404040404040404040404000000000
         hex   00000000400000000000000000000000
         hex   00000000000000000000000000000000
         hex   00000000000000000000004000000000
         hex   00000000400000000000000000000000
         hex   00000000000000000000000000000000
         hex   00000000000000000000004000000000
         hex   00000000400000000000000000000000
         hex   00000000000000000000000000000000
         hex   00000000000000000000004000000000
         hex   00000000400000000000004040404040
         hex   40404040404000000000404040404040
L1C00    hex   40404040400000000000004000000000
L1C10    hex   00000000400000000000004050504040
         hex   40515151514000000000405252524040
         hex   40404040400000000000004000000000
L1C40    hex   00000000400000000000004050504040
         hex   40515151514000000000405252524040
         hex   40535353400000000000004000000000
L1C70    hex   00000000400000000000004050504040
         hex   40404040404000000000404040404040
         hex   40535353400000000000004000000000
L1CA0    hex   00000000400000000000004050504040
         hex   40404040404000000000404040404040
         hex   40535353400000000000004000000000
         hex   40404040400000000000004040404040
         hex   40404040404000000000404040404040
         hex   40404040400000000000004040404040
L1D00    hex   00000000000000000000000000000000
         hex   00000000000000000000000000000000
         hex   00000000000000000000000000000000
         hex   00000000000000000000000000000000
         hex   00000000000000000000000000000000
         hex   00000000000000000000000000000000
         hex   00000000000000000000000000000000
         hex   00000000000000000000000000000000
         hex   00000000000000000000000000000000
         hex   40404040400000000000004040404040
         hex   40404040404000000000404040404040
         hex   40404040400000000000004040404040
L1DC0    hex   00000000400000000000004054545440
         hex   40404040404000000000404040404040
         hex   40405757400000000000004000000000
L1DF0    hex   00000000400000000000004054545440
L1E00    hex   40404040404000000000404040404040
         hex   40405757400000000000004000000000
L1E20    hex   00000000400000000000004054545440
         hex   40405555554000000000405656565640
         hex   40405757400000000000004000000000
L1E50    hex   00000000400000000000004040404040
         hex   40405555554000000000405656565640
         hex   40405757400000000000004000000000
         hex   00000000400000000000004040404040
         hex   40404040404000000000404040404040
         hex   40404040400000000000004000000000
         hex   00000000400000000000000000000000
         hex   00000000000000000000000000000000
         hex   00000000000000000000004000000000
         hex   00000000400000000000000000000000
         hex   00000000000000000000000000000000
L1F00    hex   00000000000000000000004000000000
         hex   00000000400000000000000000000000
         hex   00000000000000000000000000000000
         hex   00000000000000000000004000000000
         hex   00000000404040404040404040404040
         hex   40404040404000000000404040404040
         hex   40404040404040404040404000000000
L1F70    hex   00000000000000000000000000000000
         hex   00000000004000000000400000000000
         hex   00000000000000000000000000000000
L1FA0    hex   00000000000000000000000000000000
         hex   00000000004000000000400000000000
         hex   00000000000000000000000000000000
         hex   00000000000000000000000000000000
         hex   00000000004000000000400000000000
         hex   00000000000000000000000000000000

* We are at $2000, the HGR screen

L2000	=	*

	put	img.title.s

* We are at $4000

L4000    hex   2A552F2A75302A1D302A1D2C2A072B2B
         hex   672A176A2A166A2A56282C2A29542A14
         hex   2A2A552A2A552A2A552A2A752F2A1D30
         hex   2B0730177E2F166A2A56282C2A295424
         hex   142A0000000000000000000000000000
         hex   00000000000000000000000000000000
         hex   7A552A06572A065C2A1A5C2A6A502A2A
         hex   736A2A2B742A2B341A0A35154A2A2A14
         hex   2A2A552A2A552A2A552A7A572A065C2A
         hex   06706A7A3F742A2B341A0A35154A2A2A
         hex   142A2A552A2A552A6A752A7A752B7E75
         hex   2F2A552A7E752F7A752B6A752A2A552A
         hex   2A552A00000F00603F00783F00780F00
         hex   7E03037E007F3F007C3F007C7F07007C
         hex   7F406301114541054511110808222002
L40F0    hex   00CC003F00FC003F00FC003F00FC0033

* We are at $4100

SPIDERBYT1
         hex   0000000000000000
SPIDERBYT2
	 hex   0000000000000000
SPIDERBYT3
         hex   0000000000000000
SPIDERBYT4
	 hex   0000000000000000
         hex   00000000000000000000600F00783F03
         hex   7E3F7F7F0F7C3F007C7F07007C7F4063
         hex   017800007E03007E0F00780F00601F00
         hex   003F60007E7F007E1F707F1F7F3F0040
         hex   63010000000000000000007803007F0F
         hex   007E3F60787F7F007E1F707F1F7F3F00
         hex   4063010000000000006071007871037E
         hex   710F0000007E710F7871036071000000
         hex   00000000

COUNT0   hex   CC

* We are at $41A5

       *or $41A5
       *ta $11A5
LOOKUP
       ASL
       TAY
       LDA NOTES,Y
       STA DNTIME
       LDA VOICE
SHIFT
       LSR
       BEQ DONE
       LSR DNTIME
       BNE SHIFT
DONE   
       LDA NOTES,Y
       SEC
       SBC DNTIME
       STA UPTIME
       INY
       LDA NOTES,Y
       ADC DNTIME
       STA DNTIME
       LDA #$00
       STA LENGTH
       SEC
       SBC #$0D
       STA LENGTH+1
       LDA UPTIME
       BNE PLAY
REST
       NOP
       NOP
       JMP REST2
REST2  
       INC LENGTH
       BNE REST3
       INC LENGTH+1
       BNE REST4
       RTS
REST3
       NOP
       JMP REST4
REST4
       BNE REST
PLAY
       LDY UPTIME
       LDA SPKR
PLAY2
       INC LENGTH
       BNE PATH1
       INC LENGTH+1
       BNE PATH2
       RTS
PATH1
       NOP
       JMP PATH2
PATH2
       DEY
       BEQ DOWN
       JMP PATH3

       hex A94C587A	; LOGO
       
* We are at $4202

       *or $4202
       *ta $1202
PATH3
       BNE PLAY2
DOWN
       LDY DNTIME
       LDA SPKR
PLAY3
       INC LENGTH
       BNE PATH4
       INC LENGTH+1
       BNE PATH5
       RTS
PATH4
       NOP
       JMP PATH5
PATH5
       DEY
       BEQ PLAY
       JMP PATH6
PATH6
       BNE PATH3	; Latest source code goes to PLAY3

* We are at $421E

       *or $421E
       *ta $121E

SCRAMBLE_Z
SCRAMBLE
       LDY #>CHECK
       STY POINTER3+1
:1     LDA #<CHECK+1
       STA POINTER3
       EOR (POINTER3),Y  
       STA (POINTER3),Y  
       INY
       CPY #$46
       BNE :1
       RTS

PROTECT_Z
PROTECT
       JSR SCRAMBLE2
       JSR CHECK2
SCRAMBLE2
       JMP ($20)
CHECK2
       JMP ($22)

* We are at $423c

         hex   FDFDFEFF
         hex   0A500200021F7E117E1F7A176A576A56
         hex   5A5A566A5FFA5A5A5A5A5A5A0A500A40
         hex   0A500200021F7E117E1F7A176A576A56
         hex   5A5A566A5FFA5A5A5A5A366D22450205
         hex   0A5000407841087F787F685F6A576A56
         hex   5A5A565A5FFA5A5A5A5A5A5A0A500250
         hex   0A5000407841087F787F685F6A576A56
         hex   5A5A565A5FFA5A5A5A5A366D22452041
         hex   0A500240025F7E637E7F7A576A576A56
         hex   5AEA565657565256565A366D22450205
         hex   0A5002407A41467F7E7F6A5F6A576A56
         hex   575A6A6A6AEA6A4A5A6A366D22452041

* We are at $4300

         hex   0A500240025F7E637E7F7AD76AB76AAA
         hex   5A6A565A5F5A565A565A366D22450205
         hex   0A5002407A41467F7E7F6B5F6D575556
         hex   565A5A6A5AFA5A6A5A6A366D22452041
         hex   2A550A500A4002437E4F7E517E4F7A59
         hex   5A565A5A565A566B56ED565502540250
         hex   2A550A5402506241727F0A7F7A7F1A5F
         hex   6A5A5A5A5A6A566B376B2A6B2A400A40
         hex   0A50024C025B7E4B7E7B7A4B6A5A5A5A
         hex   565A6D5A6B5A6A5A5A6A366D22450205
         hex   2A550A5402506251725F665F7A5F7A57
         hex   6A5A6A5A5A6A566A36AB36AB2E212A40

L43C0    hex   09090909090909090909090909090909
         hex   090909090909090909090909

L43DC    hex   2024282C3034383C
         hex   2024282C3034383C
         hex   2125292D3135393D
         hex   2125292D3135393D
         hex   22262A2E32363A3E
         hex   22262A2E32363A3E
         hex   23272B2F33373B3F
         hex   2024282C3034383C
         hex   2024282C3034383C
         hex   2125292D3135393D
         hex   2125292D3135393D
         hex   22262A2E32363A3E
         hex   22262A2E32363A3E
         hex   23272B2F33373B3F
         hex   23272B2F33373B3F
         hex   2024282C3034383C
         hex   2024282C3034383C
         hex   2125292D3135393D
         hex   2125292D3135393D
         hex   22262A2E32363A3E
         hex   22262A2E32363A3E
         hex   23272B2F33373B3F

L448C    hex   09090909090909090909090909090909
         hex   090909090909090909090909

L44A8    hex   2020202020202020
         hex   2020202020202020
         hex   2020202020202020
         hex   202020207C7C7C7C
         hex   7C7C7C7CFCFCFCFC
         hex   FCFCFCFC7C7C7C7C
         hex   7C7C7C7CFCFCFCFC
         hex   FCFCFCFC7C7C7C7C
         hex   7C7C7C7CFCFCFCFC
         hex   FCFCFCFC7C7C7C7C
         hex   7C7C7C7C24242424

* We are at $4500

         hex   24242424A4A4A4A4
         hex   A4A4A4A424242424
         hex   24242424A4A4A4A4
         hex   A4A4A4A424242424
         hex   24242424A4A4A4A4
         hex   A4A4A4A424242424
         hex   24242424A4A4A4A4
         hex   A4A4A4A44C4C4C4C
         hex   4C4C4C4CCCCCCCCC
         hex   CCCCCCCC4C4C4C4C
         hex   4C4C4C4CCCCCCCCC
         hex   CCCCCCCC4C4C4C4C
         hex   4C4C4C4CCCCCCCCC
         hex   CCCCCCCC

L456C	 hex   4C4C4C4C4C4C4C4C2020202020202020
	 hex   20202020202020202020202020202020
L458C    hex   20202020AA552A552A552AD5
L4598    hex   FD000000F50000000000BE00FA
L45A5	 hex   DF00DF00FDAFD7EB0000AF00BE
	 hex   0000D70000EBF5FA

* We are at $45BA

       *or $45BA
       *ta $25BA

INITIALIZE_1_Z
	JMP INITIALIZE_1
DRAW_GREEN_Z
	JMP DRAW_GREEN
MOVE_MEMORY_Z
       JMP MOVE_MEMORY

SETUP
       STY SOFTEV+1
       LDA #>L43C0
       STA SCRPNT1+1
       LDA #<L43C0
       STA SCRPNT1
       LDA #>L44A8
       STA SCRPNT2+1
       STA $48
       LDA #<L44A8
       STA SCRPNT2
       LDA HIRES
       LDA TXTPAGE1
       LDA MIXCLR
       LDA TXTCLR
       LDA #<L0F52
       STA SOFTEV
       LDA #>L0F52
       STA SOFTEV+1
       LDA #$AA
       STA PWREDUP
       LDA #<RESTART
       STA $28
       LDA #>RESTART
       STA $28+1
       JMP SETUP2

       hex 6030
       
* We are at $4600

       *or $4600
       *ta $2600

MAN_MASTER_Z
       JMP MAN_MASTER
MAN_RIGHT_Z
       JMP MAN_RIGHT
JOYSTICK_Z
       JMP JOYSTICK
KYBD_Z
       JMP KYBD
L460C			; That address is patched, search for L460C
       JMP JOYSTICK_Z	; LOGO $4606
PLOT_MAN_Z
       JMP PLOT_MAN
ERASE_LEFT_MAN_Z
       JMP ERASE_LEFT_MAN
SWTR_SOUND_Z
       JMP SWTR_SOUND

JOYSTICK
       LDY #$00
       INC PDLSEL
       LDA PDLSEL
       AND #$01
       BEQ :1
       STY HPDL
       LDA PTRIG
:3     LDA #$08		; is #$11 on latest source code
       JSR DELAY_Z
       LDA PADDL0
       BPL :2
       INC HPDL
       LDA #$19		; is #$11 on latest source code
       JSR DELAY_Z
       LDA PADDL0
       BPL :2
       INC HPDL
       BNE :2
:1     STY VPDL
       LDA PTRIG
       LDA #$08		; is #$11 on latest source code
       JSR DELAY_Z
       LDA PADDL1
       BPL :2
       INC VPDL
       LDA #$19		; is #$11 on latest source code
       JSR DELAY_Z
       LDA PADDL1
       BPL :2
       INC VPDL
:2     LDA BUTN1
       BPL :4
       LDA #$80
       STA GRAB_FOOD
       LDA BYFOOD
       BEQ :4
       LDA GRAB_SQUELCH
       BNE :7
       JSR GRAB_FOOD_SOUND
       BNE :7
:4     LDA #$00
       STA GRAB_SQUELCH
:7     LDX #$80
       LDA BUTN0
       BPL :8
       LDA #$00
       STA GRAB_FOOD
       LDA #$80
       BMI :9
:8     LDA #$00
:9     STA SWAT
       BEQ :10
       LDA MOD2
       AND #$02
       BEQ :10
       LDX #$00
:10    STX SWATLEGAL
       LDY VPDL
       LDA HPDL
       CLC
       ADC TABLEJ1,Y
       TAY
       LDA TABLEJ2,Y
       STA MANDIR
       LDA KBD
       CMP #$D8
       BNE :11
       STA CAN_KEY_PRESSED
:11    CMP #$9B
       BNE :12
       LDA KBDSTROBE
:13    LDA KBD
       BPL :13
       LDA KBDSTROBE
:12    JMP KYBD2

TABLEJ1    hex 00030606
TABLEJ2    hex B8B9B0C941D0CBCCBB 

KYBD
       LDA KBD
       STA KBDSTROBE
       BPL PP3
       CMP #$9B
       BNE PP1
PP7    LDA KBD
       BPL PP7
       STA KBDSTROBE
PP1    CMP #$A0
       BNE PP2
       LDA #$80
       STA GRAB_FOOD
       LDA BYFOOD
       BEQ PP6
       JSR GRAB_FOOD_SOUND
PP6    LDA #$00		; patched for JOYSTICK, see L460C
       STA SWAT
       BEQ PP3
PP2    CMP #$8D
       BNE PP4
       LDA SWAT
       EOR #$80
       STA SWAT
       LDA #$00
       STA GRAB_FOOD
PP3    LDA MANDIR
PP4    STA MANDIR
       LDX #$80
       LDA SWAT
       BEQ PP5
       LDA MOD2
       AND #$02
       BEQ PP5
       LDX #$00
PP5    STX SWATLEGAL

KYBD2
       LDY MANSTATE
       LDA MANDIR
       CMP #$B9
       BEQ B1
       CMP #$B0
       BEQ B2
       CMP #$D0
       BEQ B3
       CMP #$BB
       BEQ B4
       CMP #$CC
       BEQ B5
       CMP #$CB
       BEQ B6
       CMP #$C9
       BEQ B7
       CMP #$B8
       BEQ B8
       CMP #$D8
       BNE :1
       STA CAN_KEY_PRESSED
:1     LDA #$41
       STA MANDIR
       RTS

B1     JSR A1
       STA NEXTSTATE
       JMP MAN_UP  
B2     JSR A5
       STA NEXTSTATE
       JSR MAN_UP
       BNE :C1
       JSR MAN_RIGHT
       BNE B2A
       RTS
B2A    JSR MAN_DOWN
       LDA #$40
       RTS
B3     JSR A8
       STA NEXTSTATE
       JMP MAN_RIGHT
B4     JSR A9
       STA NEXTSTATE
       JSR MAN_DOWN
       BNE :C1
       JSR MAN_RIGHT
       BNE B4A
       RTS
B4A    JSR MAN_UP
       LDA #$40
       RTS
B5     JSR A10
       STA NEXTSTATE
       JMP MAN_DOWN
B6     JSR A13
       STA NEXTSTATE
       JSR MAN_DOWN
       BNE :C1
       JSR MAN_LEFT
       BNE B4A
       RTS
B7     JSR A17
       STA NEXTSTATE
       JMP MAN_LEFT
B8     JSR A18
       STA NEXTSTATE
       JSR MAN_UP
       BNE :C1
       JSR MAN_LEFT
       BNE B2A
:C1     RTS
A1     TXA
       BPL A4
       CPY #$02
       BNE A3
A2     LDA #$01
       RTS
A3     LDA #$02
       RTS
A4     LDA #$0B
       RTS
A5     TXA
       BPL A7
A6     CPY #$01
       BNE A2
       LDA #$02
       RTS
A7     LDA #$07
       RTS
A8     TXA
       BMI A6
       LDA #$05
       RTS
A9     TXA
       BMI A6
       LDA #$09
       RTS
A10    TXA 
       BPL A12
       CPY #$04
       BNE A11
       LDA #$03
       RTS
A11    LDA #$04
       RTS
A12    LDA #$0C
       RTS
A13    TXA
       BPL A16
A14    CPY #$03
       BNE A15
       LDA #$04
       RTS
A15    LDA #$03
       RTS
A16    LDA #$0A
       RTS
A17    TXA
       BMI A14
       LDA #$06
       RTS
A18    TXA
       BMI A14
       LDA #$08
       RTS
PLOT_MAN
       LDX MANSTATE
       LDA TABLE11,X
       STA POINTER1+1
       LDA TABLE12,X
       STA POINTER1
       LDX MANXX
       LDA #$10
       STA HEIGHT
       LDA #$00
       STA PATINDEX
:6     LDY MANY
       LDA (SCRPNT1),Y
       STA POINTER2+1
       LDA (SCRPNT2),Y
       STA POINTER2
       LDY MANX
       LDA (POINTER2),Y
       AND TABLE13,X
       STA TEMP1
       LDY PATINDEX
       LDA (POINTER1),Y
       STA TEMP2
       LDY TABLE14,X
       LDA #$00
:1     LSR TEMP2
       ROR
       DEY
       BNE :1
       LSR
       ORA TEMP1
       LDY MANX
       CPY #$04
       BCC :2
       CPY #$2C
       BCS :2
       STA (POINTER2),Y
:2     INC MANX
       INC PATINDEX
       LDY PATINDEX
       LDA (POINTER1),Y
       STA TEMP1
       LDY TABLE14,X
       LDA #$00
:3     LSR TEMP1
       ROR
       DEY
       BNE :3
       LSR
       ORA TEMP2
       LDY MANX
       CPY #$04
       BCC :4
       CPY #$2C
       BCS :4
       STA (POINTER2),Y
:4     INY
       CPY #$04
       BCC :5
       CPY #$2C
       BCS :5
       LDA (POINTER2),Y
       AND TABLE15,X
       ORA TEMP1
       STA (POINTER2),Y
:5     DEC MANX
       INC MANY
       INC PATINDEX
       DEC HEIGHT
       BNE :7
       LDA MANY
       SEC
       SBC #$10
       STA MANY
       RTS
:7     JMP :6
       JMP :6

ERASE_LEFT_MAN
       LDA MANY
       STA TEMP2
       LDA MANX
       STA TEMP1
       LDA #$10
       STA HEIGHT
       LDX MANXX
       BEQ :3
       CPX #$04
       BNE :1
:3     DEC TEMP1
:1     LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER2+1
       LDA (SCRPNT2),Y
       STA POINTER2
       LDY TEMP1
       CPY #$2C
       BCS :2
       CPY #$04
       BCC :4
       LDA (POINTER2),Y
       AND TABLE16,X
       ORA TABLE17,X
       STA (POINTER2),Y
:4     CPX #$04
       BNE :2
       INY
       CPY #$2C
       BCS :2
       CPY #$04
       BCC :2
       LDA (POINTER2),Y
       ORA #$01
       STA (POINTER2),Y
:2     INC TEMP2
       DEC HEIGHT
       BNE :1
       RTS

ERASE_RIGHT_MAN
       LDA MANY
       STA TEMP2
       LDA MANX
       CLC
       ADC #$02
       STA TEMP1
       LDA #$10
       STA HEIGHT
       LDX MANXX
       CPX #$03
       BEQ :3
       CPX #$06
       BNE :1
:3     INC TEMP1
:1     LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER2+1
       LDA (SCRPNT2),Y
       STA POINTER2
       LDY TEMP1
       CPY #$2C
       BCS :4
       CPY #$04
       BCC :2
       LDA (POINTER2),Y
       AND TABLE18,X
       ORA TABLE19,X
       STA (POINTER2),Y
:4     CPX #$06
       BNE :2
       DEY
       CPY #$2C
       BCS :2
       CPY #$04
       BCC :2
       LDA (POINTER2),Y
       ORA #$40
       STA (POINTER2),Y
:2     INC TEMP2
       DEC HEIGHT
       BNE :1
       RTS

ERASE_UP
       LDY MANY
       DEY
E1     LDA (SCRPNT1),Y
       STA POINTER2+1
       LDA (SCRPNT2),Y
       STA POINTER2
       LDX MANXX
       LDY MANX
       CPY #$2C
       BCS :1
       CPY #$04
       BCC :2
       LDA (POINTER2),Y
       AND TABLE13,X
       ORA TABLE20,X
       STA (POINTER2),Y
:2     INY
       CPY #$2C
       BCS :1
       CPY #$04
       BCC :3
       LDA TABLE22,X
       STA (POINTER2),Y
:3     INY
       CPY #$2C
       BCS :1
       CPY #$04
       BCC :1
       LDA (POINTER2),Y
       AND TABLE15,X
       ORA TABLE21,X
       STA (POINTER2),Y
:1     LDA #$00
       RTS

ERASE_DOWN
       LDA MANY
       CLC
       ADC #$10
       TAY
       BNE E1

GET_BLOCK2
       LDY MANX
       LDA MANY
       LSR
       LSR
       LSR
       TAX
       LDA AALSBYT,X
       STA POINTER3
       LDA AAMSBYT,X
       STA POINTER3+1
       LDA (POINTER3),Y
       RTS

SET_VACANT
       JSR GET_BLOCK2
       LDA #$00
       STA (POINTER3),Y
       RTS

SET_MAN
       JSR GET_BLOCK2
       LDA #$01
       STA (POINTER3),Y
       RTS

MAN_MOVE_LEGAL_CHECK
MAN_LEFT
       JSR :3
       BNE :9
       JMP ERASE_RIGHT_MAN
:3     LDA MANXX
       BEQ :4
       CMP #$04
       BEQ :5
       DEC MANXX
       LDA #$00
:9     RTS
:5     LDA MANX
       CMP #$01
       BNE :4
       LDA MANY
       AND #$07
       BEQ :6
       JSR V3
       LDA #$2C
       STA MANX
       LDA #$00
       STA MANXX
       JMP V6
:6     JSR V1
       LDA #$2C
       STA MANX
       LDA #$00
       STA MANXX
       JMP V4
:4     LDA MANY
       STA TEMP2
       CLC
       ADC #$08
       STA MANY8
       ADC #$08
       STA MANY10
       DEC MANX
       LDA MANX
       STA TEMP1
       CLC
       ADC #$03
       STA MANX3
       JSR V7
       BNE :1
       LDA MANY8
       JSR V7A
       BNE :2
       LDA TEMP2
       AND #$07
       BEQ :7
       LDA MANY10
       JSR V7A
       BNE :2
       JSR SET_MAN
       LDA MANX3
       STA MANX
       JSR SET_VACANT
       LDA TEMP1
       STA MANX
       LDA MANY8
       STA MANY
:7     JSR SET_MAN
       LDA TEMP2
       STA MANY
       JSR SET_MAN
       LDA MANX3
       STA MANX
       DEC MANXX
       BPL :8
       LDA #$06
       STA MANXX
:8     JSR SET_VACANT
       LDA MANY8
       STA MANY
       JSR SET_VACANT
       LDA TEMP1
       STA MANX
       LDA TEMP2
       STA MANY
       LDA #$00
       RTS
:1     STA TEMP3
       LDA TEMP1
       CLC
       ADC #$01
       STA MANX
       LDA TEMP3
       RTS
:2     STA TEMP3
       LDA TEMP2
       STA MANY
       LDA MANX
       CLC
       ADC #$01
       STA MANX
       LDA TEMP3
       RTS

MAN_RIGHT
       JSR :3
       BNE :9
       JMP ERASE_LEFT_MAN
:3     LDA MANXX 
       CMP #$06
       BEQ :4
       CMP #$03
       BEQ :5
       INC MANXX
       LDA #$00
:9     RTS
:5     LDA MANX
       CMP #$2C
       BNE :4
       LDA MANY
       AND #$07
       BEQ :6
       JSR V3
       LDA #$01
       STA MANX
       LDA #$06
       STA MANXX
       JMP V6
:6     JSR V1
       LDA #$01
       STA MANX
       LDA #$06
       STA MANXX
       JMP V4
:4     LDA MANY
       STA TEMP2
       CLC
       ADC #$08
       STA MANY8
       ADC #$08
       STA MANY10
       LDA MANX
       STA TEMP1
       CLC
       ADC #$03
       STA MANX3
       STA MANX
       JSR V7
       BNE :1
       LDA MANY8
       JSR V7A
       BNE :2
       LDA TEMP2
       AND #$07
       BEQ :7
       LDA MANY10
       JSR V7A
       BNE :2
       JSR SET_MAN
       LDA TEMP1
       STA MANX
       JSR SET_VACANT
       LDA MANY8
       STA MANY
       LDA MANX3
       STA MANX
:7     JSR SET_MAN
       LDA TEMP2
       STA MANY
       JSR SET_MAN
       LDA TEMP1
       STA MANX
       LDX MANXX
       INX
       CPX #$07
       BNE :8
       LDX #$00
:8     STX MANXX
       JSR SET_VACANT
       LDA MANY8
       STA MANY
       JSR SET_VACANT
       LDA TEMP2
       STA MANY
       LDX TEMP1
       INX
       STX MANX
       LDA #$00
       RTS
:1     STA TEMP3
       LDA TEMP1
       STA MANX
       LDA TEMP3
       RTS
:2     STA TEMP3
       LDA TEMP2
       STA MANY
       LDA TEMP1
       STA MANX
       LDA TEMP3
       RTS

MAN_UP
       JSR :6
       BNE :4
       JMP ERASE_DOWN
:6     LDA MANY 
       CMP #$0A
       BNE :1
       JSR V3
       LDA #$D0
       STA MANY
       JMP V4
:1     SEC
       SBC #$01
       STA MANY
       AND #$07
       BEQ :5
       CMP #$07
       BEQ :3
       LDA #$00
       RTS
:3     JSR V8
       BEQ :4
       INC MANY
       TAX
:4     RTS
:5     LDA MANY
       CLC
       ADC #$10
       STA MANY
       JSR SET_VACANT
       INC MANX
       JSR SET_VACANT
       INC MANX
       JSR SET_VACANT
       DEC MANX
       DEC MANX
       LDA MANY
       SEC
       SBC #$10
       STA MANY
       LDA #$00
       RTS

MAN_DOWN
       JSR :5
       BNE :9
       JMP ERASE_UP
:5     LDA MANY
       CMP #$CE
       BNE :1
       JSR V3
       LDA #$0A
       STA MANY
       JMP V4
:1     CLC
       ADC #$01
       STA MANY
       AND #$07
       BEQ :4
       CMP #$01
       BEQ :2
       LDA #$00
:9     RTS
:2     LDA MANY
       CLC
       ADC #$10
       STA MANY
       JSR V8
       STA TEMP1
       BEQ :3
       LDA MANY
       SEC
       SBC #$11
       STA MANY
       LDA TEMP1
       RTS
:3     LDA MANY
       SEC
       SBC #$10
       STA MANY
       LDA TEMP1
       RTS
:4     DEC MANY
       JSR SET_VACANT
       INC MANX
       JSR SET_VACANT
       INC MANX
       JSR SET_VACANT
       DEC MANX
       DEC MANX
       INC MANY
       LDA #$00
       RTS
V1     JSR SET_VACANT
       INC MANX
       JSR SET_VACANT
       INC MANX
       JSR SET_VACANT
       LDA MANY
       CLC
       ADC #$08
V2     STA MANY
       JSR SET_VACANT
       DEC MANX
       JSR SET_VACANT
       DEC MANX
       JSR SET_VACANT
       LDA MANY
       SEC
       SBC #$08
       STA MANY
       RTS
V3     JSR V1
       CLC
       ADC #$10
       INC MANX
       INC MANX
       JSR V2
       SEC
       SBC #$08
       STA MANY
       RTS
V4     JSR SET_MAN
       INC MANX
       JSR SET_MAN
       INC MANX
       JSR SET_MAN
       LDA MANY
       CLC
       ADC #$08
V5     STA MANY
       JSR SET_MAN
       DEC MANX
       JSR SET_MAN
       DEC MANX
       JSR SET_MAN
       LDA MANY
       SEC
       SBC #$08
       STA MANY
       LDX #$00
       RTS
V6     JSR V4
       LDA MANY
       CLC
       ADC #$10
       INC MANX
       INC MANX
       JSR V5
       SEC
       SBC #$08
       STA MANY
       LDA #$00
       RTS
V7A    STA MANY
V7     JMP GET_BLOCK2
V8     JSR V7
       BNE :1
       INC MANX
       JSR V7
       BNE :2
       INC MANX
       JSR V7
       BEQ :3
       DEC MANX
:2     DEC MANX
       TAX
:1     RTS
:3     JSR SET_MAN
       DEC MANX
       JSR SET_MAN
       DEC MANX
       JSR SET_MAN
       LDA #$00
       RTS

MAN_MASTER
       DEC K3
       BEQ :11
       RTS
:4     JMP EXT5
:11    LDA INIT_K3
       STA K3
       LDY PARALYZE
       BNE :4
       LDA MANX
       STA MANXOLD
       LDA MANY
       STA MANYOLD
       LDA MANXX
       STA MANXXOLD
       INC MOD2
       JSR $460C
       BNE EXT6
       INC FOOTSTEP
       LDA #$03
       BIT FOOTSTEP
       BNE :3
       JSR FOOTSTEP_SOUND
:3     LDA GRAB_FOOD
       BNE :1
       STA BYFOOD
       BEQ EXT2
:1     LDA BYFOOD
       BNE :2
       STA GRAB_FOOD
       BEQ EXT2
:2     JSR CARRY_FOOD_Z

EXT2   LDA NEXTSTATE
       CMP #$05
       BCS :4
       LDY MANSTATE
       CPY #$05
       BCS :4
       CPY #$03
       BCC :6
       LDA NEXTSTATE
       CMP #$03
       BCS :5
:4     JSR ERASE_OLD_SWTR_Z
:5     JSR PLOT_NEW_SWTR_Z
       JSR PROTECT_Z
       LDA NEXTSTATE
       STA MANSTATE
       JMP PLOT_MAN
:6     LDA NEXTSTATE
       CMP #$03
       BCS :4
       BCC :5

EXT6   STA TEMP1
       AND #$40
       BNE EXT9
       LDA TEMP1
       CMP #$03
       BNE EXT4

EXT9   LDA TEMP1
       AND #$3F
       CMP #$20
       BCS EXT3
       CMP #$10
       BCC EXT3
       STA BYFOOD

EXT3   LDA TEMP1
       CMP #$41
       BEQ :2
:1     JSR ERASE_OLD_SWTR_Z
       LDA NEXTSTATE
       STA MANSTATE
:2     JSR PLOT_MAN
       JMP PLOT_NEW_SWTR_Z

EXT5   LDA #$2A
       JSR DELAY_Z
       DEY
       STY PARALYZE
       JSR PLOT_MAN
       JSR PLOT_NEW_SWTR_Z
       LDA PARALYZE
       BNE EXT8
       RTS

EXT4   AND #$20
       BEQ EXT7

EXT10  JMP EXT2

EXT8   AND #$08
       BEQ :14
       LDY #$F0
       STY TEMP1
       LDA #$02
       STA TEMP2
:2     LDY TEMP1
       LDA SPKR
:1     DEY
       BNE :1
       DEC TEMP2
       BNE :2
       LDA #$A2
       STA $31BC
       LDA #$95
       STA $2DBB
       LDA #$D5
       STA $31BB
       STA $35BB
:14    LDA #$22
       STA $31BC
       LDA $48
       STA SCRPNT2+1
       RTS
EXT7   LDA TEMP1
       CMP #$01
       BNE :10
       RTS
:10    LDA TEMP1
       BMI EXT10
:15    CMP #$10
       BCS :19
       JSR ERASE_OLD_SWTR_Z
       LDA #$60   
       JMP STING_MAN_Z
:19    STA BYFOOD
       JMP EXT3

TABLE11    hex 00424242424242434343434343
TABLE12    hex 00406080A0C0E00020406080A0
TABLE13    hex 80838FBF81879F
TABLE14    hex 07050301060402
TABLE15    hex FEF8E080FCF0C0
TABLE16    hex 9FFCF3CFBFF9E7
TABLE17    hex 40020820000410
TABLE18    hex F9E79FFCF3CFFE
TABLE19    hex 02082001041000
TABLE20    hex 2A282000545040
TABLE21    hex 00020A2A010515
TABLE22    hex 555555552A2A2A

GRAB_FOOD_SOUND
       LDY #$D0
G1     STY TEMP1
:1     LDY TEMP1
       LDA SPKR
:2     DEY
       BNE :2
       DEC TEMP1
       DEC TEMP1
       BNE :1
       LDA #$01
       STA GRAB_SQUELCH
       RTS

FOOTSTEP_SOUND
       LDA #$FF
       STA TEMP1
       LDA #$02
       STA TEMP2
:1     LDY TEMP1
       LDA SPKR
:2     DEY
       BNE :2
       DEC TEMP2
       BNE :1
       RTS

SWTR_SOUND
       LDA L460C+1
       CMP #$09
       BNE :1
       RTS
:1     LDY #$80
       JMP G1

* We are at $4E40

       hex 0B4E191A0C0000000000

* We are at $4E4A

       *or $4E4A
       *ta $1E4A

TABLE395
       hex 0C0000000003000600014C3300000000
       hex 0C600600014C33180313000060060C19
       hex 4C33663F0C6703001E33017F3366330C
       hex 614C006633194C3318314C614C60674F
       hex 194C0C6760031E33006660660C

L4E97  hex 0CFFFF00

L4E9B  hex 00003000002222                            

L4EA2  hex 0000000000000000000000000000
       hex 00000000003C000E7F714E7F73787F1F
       hex 707F0F601907601907407F03407F0300
       hex 6701007F00407F01603D073C183C0C00
       hex 300C0030000000000000000000000000
       hex 00000000000000000000000000000000

* We are at $4F00

       *or $4F00
       *ta $2F00

PLOT_NEW_SWTR_Z
       JMP PLOT_NEW_SWTR
ERASE_OLD_SWTR_Z
       JMP ERASE_OLD_SWTR
VACATE_ANTS_BLOCKS_Z
       JMP VACATE_ANTS_BLOCKS
SCORE_Z
       JMP SCORE
K1_Z
       JMP K1_CODE
SWAT_ANT_SOUND_Z
       JMP SWAT_ANT_SOUND
SWAT_SPIDER_SOUND_Z
       JMP SWAT_SPIDER_SOUND
PLOT_NUM2_Z
       JMP PLOT_NUM2
R1_Z
       JMP R1

       NOP

SWTR_HEAD
       LDX SWTRXX
       JSR S1
       JSR S2
       JSR S1
       JSR S2
S1     LDY SWTRY
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDY SWTRX
       CPY #$2C
       BCS S3
       LDA TEMP3
       BEQ :1
       CPY #$04
       BCC :3
       EOR TABLE23,X
       AND (POINTER1),Y
       STA (POINTER1),Y
:3     INY
       CPY #$2C
       BCS :2
       CPY #$04
       BCC :2
       LDA #$FF
       EOR TABLE24,X
       AND (POINTER1),Y
       STA (POINTER1),Y
:2     INC SWTRY
       RTS
:1     CPY #$04
       BCC :4
       LDA (POINTER4),Y
       AND TABLE23,X
       ORA (POINTER1),Y
       STA (POINTER1),Y
:4     INY
       CPY #$2C
       BCS :2
       CPY #$04
       BCC :2
       LDA (POINTER4),Y
       AND TABLE24,X
       ORA (POINTER1),Y
       STA (POINTER1),Y
       INC SWTRY
       RTS
S3     INC SWTRY
       INY
       RTS
S2
       LDY SWTRY
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDY SWTRX
       CPY #$2C
       BCS S3
       LDA TEMP3
       BEQ :1
       CPY #$04
       BCC :3
       EOR TABLE25,X
       AND (POINTER1),Y
       ORA TABLE25A,X
       STA (POINTER1),Y
:3     INY
       CPY #$2C
       BCS :2
       CPY #$04
       BCC :2
       LDA #$FF
       EOR TABLE26,X
       AND (POINTER1),Y
       ORA TABLE26A,X
       STA (POINTER1),Y
:2     INC SWTRY
       RTS
:1     CPY #$04
       BCC :4
       LDA (POINTER4),Y
       AND TABLE25,X
       ORA (POINTER1),Y
       STA (POINTER1),Y
       LDA TABLE25A,X
       EOR #$FF
       AND (POINTER1),Y
       STA (POINTER1),Y
       LDA (POINTER4),Y
       AND TABLE25A,X
       ORA (POINTER1),Y
       STA (POINTER1),Y
:4     INY
       CPY #$2C
       BCS :2
       CPY #$04
       BCC :2
       LDA (POINTER4),Y
       AND TABLE26,X
       ORA (POINTER1),Y
       STA (POINTER1),Y
       LDA TABLE26A,X
       EOR #$FF
       AND (POINTER1),Y
       STA (POINTER1),Y
       LDA (POINTER4),Y
       AND TABLE26A,X
       ORA (POINTER1),Y
       STA (POINTER1),Y
       INC SWTRY
       RTS

TABLE23    hex 155450402A2820
TABLE24    hex 0000020A000105
TABLE25    hex 11441040220820
TABLE25A   hex 04104000082000
TABLE26    hex 00000208000104
TABLE26A   hex 00000002000001

SWTR_POS_1_2
       LDY MANY
       STY SWTRY
       LDY MANX
       INY
       LDX MANXX
       BEQ :1
       INY
:1     STY SWTRX
       LDA TABLE28,X
       STA SWTRXX
       TAX
       LDA TEMP3
       STA TEMP1
       LDA #$00
       STA TEMP3
       JSR S1
       LDA TEMP1
       STA TEMP3
       JSR SWTR_HEAD
       LDA #$00
       STA TEMP3
       JSR S2
       LDA TEMP1
       STA TEMP3
       DEC SWTRY
       LDA TABLE31,X
       STA TEMP2
       CMP #$03
       BCC :2
       DEY
:2     STY TEMP1
       LDX #$05
:5     JSR P_E
       INC SWTRY
       DEX
       BNE :5
:3     STX TEMP3
       JMP P_E

TABLE28    hex 03040506000102  
TABLE31    hex 04104002082001

SWTR_POS_3_4
       LDY MANY
       STY SWTRY
       LDX MANXX
       LDA TABLE30,X
       CLC
       ADC MANX
       STA SWTRX
       LDA TABLE29,X
       STA SWTRXX
       TAX
       LDA TEMP3
       STA TEMP1
       LDA #$00
       STA TEMP3
       JSR S1
       LDA TEMP1
       STA TEMP3
       JSR SWTR_HEAD
       LDA #$00
       STA TEMP3
       JSR S2
       LDA TEMP1
       STA TEMP3
       DEC SWTRY
       LDA TABLE31,X
       STA TEMP2
       CMP #$03
       BCC :1
       DEY
:1     STY TEMP1
       LDX #$05
:2     JSR P_E
       INC SWTRY
       DEX
       BNE :2
:3     STX TEMP3
       JSR P_E
       LDA SWTRY
       SEC
       SBC #$0B
       STA SWTRY
       JMP P_E

TABLE29    hex 02030405060001
TABLE30    hex FFFF0000FF0000

SWTR_POS_5
       LDA TEMP3
       BEQ :2
       LDA MANX
       CLC
       ADC #$03
       TAY
       LDA MANY
       CLC
       ADC #$06
       STA SWTRY
       JSR GET_BLOCK3
       LDA MANX
       CLC
       ADC #$03
       TAY
       LDA MANY
       CLC
       ADC #$0A
       STA SWTRY
       JSR GET_BLOCK3
:2     LDA MANY
       CLC
       ADC #$06
       STA SWTRY
       LDX MANXX
       LDA TABLE27,X
       STA SWTRXX
       LDA TABLE33,X
       CLC
       ADC MANX
       STA SWTRX
       JSR SWTR_HEAD
       LDA MANY
       CLC
       ADC #$08
       TAY
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDY MANX
       INY
       INY
       CPY #$2C
       BCS :3
       LDA TEMP3
       BEQ :1
       CPY #$04
       BCC :4
       EOR TABLE34,X
       AND (POINTER1),Y
       STA (POINTER1),Y
:4     INY
       CPY #$2C
       BCS :3
       CPY #$04
       BCC :3
       LDA TABLE35,X
       EOR #$FF
       AND (POINTER1),Y
       STA (POINTER1),Y
:3     RTS
:1     CPY #$04
       BCC :5
       LDA TABLE34,X
       ORA (POINTER4),Y
       STA (POINTER1),Y
:5     INY
       CPY #$2C
       BCS :3
       CPY #$04
       BCC :3
       LDA TABLE35,X
       ORA (POINTER4),Y
       STA (POINTER1),Y
       RTS

TABLE27    hex 06000102030405
TABLE33    hex 02030303020303
TABLE34    hex 2820001450400A
TABLE35    hex 00010500000200

SWTR_POS_6
       LDA TEMP3
       BEQ :3
       LDY MANX
       DEY
       STY SWTRX
       LDA MANY
       CLC
       ADC #$06
       STA SWTRY
       JSR GET_BLOCK3
       LDY MANX
       DEY
       STY SWTRX
       LDA MANY
       CLC
       ADC #$0A
       STA SWTRY
       JSR GET_BLOCK3
:3     LDA MANY
       CLC
       ADC #$06
       STA SWTRY
       LDX MANXX
       LDA TABLE27,X
       STA SWTRXX
       LDY MANX
       DEY
       TXA
       AND #$03
       BNE :1
       DEY
:1     STY SWTRX
       JSR SWTR_HEAD
       LDA MANY
       CLC
       ADC #$08
       TAY
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDY MANX
       DEY
       CPY #$2C
       BCS :4
       LDA TEMP3
       BEQ :2
       CPY #$04
       BCC :5
       EOR TABLE36,X
       AND (POINTER1),Y
       STA (POINTER1),Y
:5     INY
       CPY #$2C
       BCS :4
       CPY #$04
       BCC :4
       LDA TABLE37,X
       EOR #$FF
       AND (POINTER1),Y
       STA (POINTER1),Y
:4     RTS
:2     CPY #$04
       BCC :6
       LDA TABLE36,X
       ORA (POINTER4),Y
       STA (POINTER1),Y
:6     INY
       CPY #$2C
       BCS :4
       CPY #$04
       BCC :4
       LDA TABLE37,X
       ORA (POINTER4),Y
       STA (POINTER1),Y
       RTS

TABLE36    hex 40000020000005
TABLE37    hex 020A2801051400

SWTR_POS_7
       LDA TEMP3
       BEQ :6
       LDX MANXX
       LDA TABLE43,X
       CLC
       ADC MANX
       TAY
       LDA MANY
       ADC #$FB
       STA SWTRY
       JSR GET_BLOCK3
       LDA MANX
       CLC
       ADC #$02
       TAY
       LDA SWTRY
       JSR GET_BLOCK3
:6     LDA MANY
       SEC
       SBC #$05
       STA SWTRY
       LDX MANXX
       LDY MANX
       INY
       INY
       LDA TABLE32,X
       STA SWTRXX
       BNE :1
       INY
:1     STY SWTRX
       JSR SWTR_HEAD
       LDA TABLE31,X
       STA TEMP2
       CMP #$03
       BCC :2
       DEY
:2     STY TEMP1
       JSR P_E
       INC SWTRY
       JSR P_E
       INC SWTRY
:3     LDA TABLE38,X
       STA TEMP2
       LDY MANX
       INY
       INY
       CMP #$01
       BNE :5
       INY
:5     STY TEMP1
       JSR P_E
       INC SWTRY
       JSR P_E
       INC SWTRY
       JMP P_E
:4     RTS

TABLE38    hex 01041040020820

SWTR_POS_8
       LDA TEMP3
       BEQ :3
       LDX MANXX
       LDA TABLE50,X
       CLC
       ADC MANX
       TAY
       LDA MANY
       CLC
       ADC #$FB
       STA SWTRY
       JSR GET_BLOCK3
       LDY MANX
       LDA SWTRY
       JSR GET_BLOCK3
:3     LDA MANY
       SEC
       SBC #$05
       STA SWTRY
       LDY MANX
       LDX MANXX
       LDA TABLE39,X
       STA SWTRXX
       AND #$03
       BEQ :1
       DEY
:1     STY SWTRX
       JSR SWTR_HEAD
       LDA TABLE31,X
       STA TEMP2
       LDA MANX
       CLC
       ADC TABLE40,X
       STA TEMP1
       JSR P_E
       INC SWTRY
       JSR P_E
       INC SWTRY
       LDA TABLE41,X
       LDY MANX
       CMP #$40
       BNE :2
       DEY
:2     STA TEMP2
       STY TEMP1
       JSR P_E
       INC SWTRY
       JSR P_E
       INC SWTRY
       JMP P_E

TABLE39    hex 01020304050600
TABLE40    hex 00FFFF0000FF00
TABLE41    hex 10400208200104
TABLE50    hex FFFF0000FFFF00

SWTR_POS_9
       LDA TEMP3
       BEQ :1
       LDX MANXX
       LDA TABLE30A,X
       CLC
       ADC MANX
       TAY
       LDA MANY
       CLC
       ADC #$14
       STA SWTRY
       JSR GET_BLOCK3
       LDY MANX
       INY
       INY
       INY
       LDA SWTRY
       JSR GET_BLOCK3
:1     LDA MANY
       CLC
       ADC #$10
       STA SWTRY
       LDX MANXX
       LDA TABLE42,X
       STA SWTRXX
       LDA TABLE43,X
       CLC
       ADC MANX
       STA SWTRX
       JSR SWTR_HEAD
       LDA MANY
       CLC
       ADC #$0D
       STA SWTRY
       LDA MANX
       ADC TABLE44,X
       STA TEMP1
       LDA TABLE45,X
       STA TEMP2
       JSR P_E
       INC SWTRY
       CLC
       LDA MANX
       ADC TABLE46,X
       STA TEMP1
       LDA TABLE38,X
       STA TEMP2
       JSR P_E
       INC SWTRY
       LDA MANX
       CLC
       ADC TABLE47,X
       STA TEMP1
       LDA TABLE31,X
       STA TEMP2
       JMP P_E

TABLE30A   hex 02020303020203
TABLE42    hex 05060001020304
TABLE43    hex 02020303020203
TABLE44    hex 02030202020202
TABLE45    hex 20010410400208
TABLE46    hex 03030202030202
TABLE47    hex 03030203030203

SWTR_POS_A
       LDA TEMP3
       BEQ :2
       LDX MANXX
       LDA TABLE51,X
       CLC
       ADC MANX
       TAY
       LDA MANY
       CLC
       ADC #$15
       STA SWTRY
       JSR GET_BLOCK3
       LDY MANX
       DEY
       LDA SWTRY
       JSR GET_BLOCK3
:2     LDA MANY
       CLC
       ADC #$10
       STA SWTRY
       LDX MANXX
       STX SWTRXX
       LDY MANX
       DEY
       STY SWTRX
       JSR SWTR_HEAD
       LDA MANY
       CLC
       ADC #$0D
       STA SWTRY
       LDY MANX
       LDA MANXX
       BNE :1
       DEY
:1     STY TEMP1
       LDA TABLE48,X
       STA TEMP2
       JSR P_E
       INC SWTRY
       LDA MANX
       CLC
       ADC TABLE30,X
       STA TEMP1
       LDA TABLE41,X
       STA TEMP2
       JSR P_E
       INC SWTRY
       LDA MANX
       CLC
       ADC TABLE49,X
       STA TEMP1
       LDA TABLE31,X
       STA TEMP2
       JMP P_E

TABLE48    hex 40020820010410
TABLE49    hex FFFFFF00FFFF00
TABLE51    hex FFFF0000FF0000

SWTR_POS_B
       LDA TEMP3
       BEQ :4
       LDX MANXX
       LDA TABLE52,X
       CLC
       ADC MANX
       TAY
       LDA MANY
       ADC #$F9
       JSR GET_BLOCK3
       LDY MANX
       INY
       LDA MANY
       CLC
       ADC #$F9
       JSR GET_BLOCK3
:4     LDA MANY
       SEC
       SBC #$08
       STA SWTRY
       LDX MANXX
       STX SWTRXX
       LDY MANX
       INY
       STY SWTRX
       JSR SWTR_HEAD
       LDA TABLE31,X
       STA TEMP2
       CMP #$03
       BCC :1
       DEY
:1     STY TEMP1
       LDX #$05
:2     JSR P_E
       INC SWTRY
       DEX
       BNE :2
:3     RTS

TABLE52    hex 01010202010202

SWTR_POS_C
       LDA TEMP3
       BEQ :5
       LDX MANXX
       LDA TABLE53,X
       CLC
       ADC MANX
       TAY
       LDA MANY
       ADC #$16
       JSR GET_BLOCK3
       LDY MANX
       INY
       LDA MANY
       CLC
       ADC #$16
       JSR GET_BLOCK3
:5     LDA MANY
       CLC
       ADC #$14
       STA SWTRY
       LDY MANX
       LDX MANXX
       LDA TABLE32,X
       STA SWTRXX
       BNE :1
       INY
:1     STY SWTRX
       JSR SWTR_HEAD
       LDA MANY
       CLC
       ADC #$0F
       STA SWTRY
       LDA TABLE31,X
       STA TEMP2
       CMP #$03
       BCC :2
       DEY
:2     STY TEMP1
       LDX #$05
:3     JSR P_E
       INC SWTRY
       DEX
       BNE :3

       LDA PROTECT
       CMP #$20
       BEQ :97
       INC SCRPNT2+1
:97    RTS

TABLE32    hex 04050600010203
TABLE53    hex 00000101000001

P_E
       LDY SWTRY
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDY TEMP1
       CPY #$2C
       BCS :2
       CPY #$04
       BCC :2
       LDA TEMP3
       BEQ :1
       LDA TEMP2
       EOR #$FF
       AND (POINTER1),Y
       STA (POINTER1),Y
       RTS
:1     LDA (POINTER4),Y
       AND TEMP2
       ORA (POINTER1),Y
       STA (POINTER1),Y
:2     RTS

PLOT_NEW_SWTR
       LDA #$FF
       STA TEMP3
       LDX NEXTSTATE

K1_CODE
       LDA TABLE54,X
       STA POINTER1+1
       LDA TABLE55,X
       STA POINTER1
       JMP (POINTER1)

ERASE_OLD_SWTR
       LDA MANX
       PHA
       LDA MANXOLD
       STA MANX
       LDA MANY
       PHA
       LDA MANYOLD
       STA MANY
       LDA MANXX
       PHA
       LDA MANXXOLD
       STA MANXX
       LDA #$00
       STA TEMP3
       LDX MANSTATE
       JSR K1_CODE
       PLA
       STA MANXX
       PLA
       STA MANY
       PLA
       STA MANX
       RTS

TABLE54    dfb 00
	dfb	>SWTR_POS_1_2,>SWTR_POS_1_2,>SWTR_POS_3_4,>SWTR_POS_3_4,>SWTR_POS_5,>SWTR_POS_6,
	dfb	>SWTR_POS_7,>SWTR_POS_8,>SWTR_POS_9,>SWTR_POS_A,>SWTR_POS_B,>SWTR_POS_C
TABLE55    dfb 00
	dfb	<SWTR_POS_1_2,<SWTR_POS_1_2,<SWTR_POS_3_4,<SWTR_POS_3_4,<SWTR_POS_5,<SWTR_POS_6,
	dfb	<SWTR_POS_7,<SWTR_POS_8,<SWTR_POS_9,<SWTR_POS_A,<SWTR_POS_B,<SWTR_POS_C
	
VACATE_ANTS_BLOCKS
       LDA ANTY
       AND #$07
       BEQ :2
       JSR SET_BLOCK_VACANT_Z
       LDA ANTY
       CLC
       ADC #$08
       STA ANTY
       JSR SET_BLOCK_VACANT_Z
       LDA ANTXX
       AND #$03
       BNE :1
       RTS
:1     INC ANTX
       JSR SET_BLOCK_VACANT_Z
       LDA ANTY
       SEC
       SBC #$08
       STA ANTY
       JMP SET_BLOCK_VACANT_Z
:2     JSR SET_BLOCK_VACANT_Z
       LDA ANTXX
       AND #$03
       BNE :3
       RTS
:3     INC ANTX
       JMP SET_BLOCK_VACANT_Z

GET_BLOCK3
       LSR
       LSR
       LSR
       TAX
       INC SWTRCOUNT
       LDA SWTRCOUNT
       AND #$03
       BNE :9
       LDA MANDIR
       BPL :9
       JSR SWTR_SOUND_Z
:9     LDA AALSBYT,X
       STA POINTER3
       LDA AAMSBYT,X
       STA POINTER3+1
       LDA (POINTER3),Y
       STA TEMP1
       AND #$40
       STA (POINTER3),Y
       LDA TEMP1
       AND #$BF
       BNE :1
       RTS  
:1     BPL :2
       LDA TEMP1
       AND #$7F
       STA (POINTER3),Y
       LDA #$04
       JSR VACATE_WASPS_BLOCKS_Z
       JSR SWAT_WASP_SOUND
       JSR PLOT_WASP_Z
       LDA #$04
       JMP SCORE
:3     STA (POINTER3),Y
       RTS
:2     CMP #$01
       BEQ :3
       CMP #$20
       BCC :4
       TAY
       LDA ANTNUM
       PHA
       TYA
       AND #$1F
       STA ANTNUM
       TAY
       LDA ANTBYT4,Y
       BPL :7
       AND #$1F
       TAX
       LDA DESTBYT1,X
       AND #$BF
       STA DESTBYT1,X
       LDA #$07
       STA ANTBYT4,Y
       LDA DESTBYT1,X
       AND #$3F
       TAY
       LDA DESTBYT2,X
       LSR
       LSR
       LSR
       TAX
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$40
       STA (POINTER1),Y
       JSR PLOT_SPLAT_Z
       JMP :8
:7     LDA #$07
       STA ANTBYT4,Y
       JSR PLOT_SPLAT_Z
       JSR VACATE_ANTS_BLOCKS
:8     PLA
       STA ANTNUM
       LDA #$01
       JSR SCORE
       JMP SWAT_ANT_SOUND
:4     CMP #$03
       BEQ :6
       CMP #$10
       BCS :5
       AND #$07
       TAY
       LDA #$02
       STA SPIDERBYT4,Y
       LDA SPIDERNUM
       PHA
       STY SPIDERNUM
       JSR PLOT_SPIDER_Z
       PLA
       STA SPIDERNUM
       LDA #$02
       JSR SCORE
       JMP SWAT_SPIDER_SOUND
:6     JMP ERASE_WEB_Z
:5     STA BYFOOD
       LDA TEMP1
       STA (POINTER3),Y
       RTS

TABLE56    hex 02030303020303

SCORE
       SED
       STA TEMP1
       LDY ROUND
:2     DEY
       BEQ :1
       CLC
       ADC TEMP1
       BNE :2
:1     STA TEMP1
       LDX PLAYERNUM
       CLC
       ADC $90,X
       STA $90,X  
       BCC :3
       INX
       LDA $90,X  
       CLC
       ADC #$01
       STA $90,X
       AND #$0F
       CMP #$05
       BNE :3
       JSR SET_SPRAY_CAN
:3     CLD
       LDX PLAYERNUM
       JSR :4
       INX
:4     LDA $90,X  
       AND #$0F
       STA TEMP1
       LDY TABLE300,X
       JSR PLOT_NUM
       LDA $90,X   
       LSR
       LSR
       LSR
       LSR
       STA TEMP1
       LDY TABLE300,X
       DEY
PLOT_NUM
       LDA #$38
       BNE PLOT_NUM3
PLOT_NUM2
       STA TEMP1
       LDA #$3B
PLOT_NUM3
       STA POINTER1+1 
       LDA #$06
       STA HEIGHT
       STY TEMP2
       TXA
       PHA
       LDA #<L9800
       STA POINTER1
       STA POINTER4
       LDA #>L9800
       STA POINTER4+1
       LDX TEMP1
       LDA #>L658A
       STA POINTER2+1
       LDA TABLE301,X
       STA POINTER2
:1     LDY HEIGHT
       LDA (POINTER2),Y
       LDY TEMP2
       STA (POINTER1),Y
       STA (POINTER4),Y
       LDA POINTER1+1
       SEC
       SBC #$04
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       DEC HEIGHT
       BPL :1
       PLA
       TAX
       RTS

TABLE300   hex 0D0B2624
TABLE301   dfb <L65C9,<L658A,<L6591,<L6598,<L659F,<L65A6,<L65AD,<L65B4,<L65BB,<L65C2

SWAT_WASP_SOUND
       LDY #$80
       JSR :1
       LDY #$50
       JSR :1
       LDY #$20
       JSR :1
       LDY #$50
       JSR :1
       LDY #$80
:1     STY TEMP1
       LDA #$18
       BNE R1

SWAT_ANT_SOUND
       LDY #$6D
       JSR :1
       LDY #$74
       JSR :1
       LDY #$83
:1     STY TEMP1
       LDA #$18
R1     STA TEMP2  
:2     LDY TEMP1  
       LDA SPKR
:3     DEY
       BNE :3
       DEC TEMP2
       BNE :2
       RTS

SWAT_SPIDER_SOUND
       LDY #$50
       JSR :1
       LDY #$30
       JSR :1
       LDY #$50
:1     STY TEMP1
       LDA #$30
       BNE R1
       RTS

SET_SPRAY_CAN
       LDX PLAYERNUM
       STA SET_CAN1,X
       LDY #$10
       CPX #$02
       BNE :1
       LDY #$17
:1     LDA #$18
       STA $2000,Y
       LDA #$7F
       STA $2400,Y
       STA $3C00,Y
       LDA #$3E
       STA $2800,Y
       STA $3C00,Y
       LDA #$3E
       STA $2800,Y
       STA $3800,Y
       LDA #$49
       STA $2C00,Y
       STA $3400,Y
       LDA #$63
       STA $3000,Y
       LDA #$70
:2     STA TEMP1
       LDA #$10
       JSR R1
       LDA TEMP1
       SBC #$10
       BPL :2
       RTS

       hex 00
       
* We are at $5800

       *or $5800
       *ta $3800
DELAY_Z
       JMP DELAY
MOVE_RIGHT_Z
       JMP MOVE_RIGHT
WASP_MASTER_Z
       JMP WASP_MASTER
ERASE_LEFT_Z
       JMP ERASE_LEFT
VACATE_WASPS_BLOCKS_Z
       JMP VACATE_WASPS_BLOCKS
PLOT_WASP_Z
       JMP PLOT_WASP

       hex 010101010101
       
PLOT_WASP
       LDA #$0B
       STA HEIGHT
       LDA WASPSTATE
       CMP #$05
       BNE :1
       LDY WASPY
       STY TEMP1
:5     LDA #$04
       STA WIDTH
       LDY TEMP1
       LDA (SCRPNT1),Y
       STA POINTER2+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER2
       STA POINTER4
       LDY WASPX
:4     CPY #$2C
       BCS :10
       CPY #$04
       BCC :9
       LDA (POINTER4),Y
       STA (POINTER2),Y
:9     INY
       DEC WIDTH
       BNE :4
:10    INC TEMP1
       DEC HEIGHT
       BNE :5
       RTS
:1     CMP #$04
       BNE :2
       LDA #$00
       STA FLAP
:2     LDA FLAP
       AND #$01
       CLC
       ADC WASPSTATE
       TAX
       LDA #$40
       STA POINTER2+1
       LDA TABLE60,X
       STA POINTER2
       LDA TABLE74,X
       STA POINTER3+1
       LDA TABLE75,X
       STA POINTER3
       LDA WASPY
       STA TEMP1
       LDA #$00
       STA PATINDEX
:3     LDY TEMP1
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDY PATINDEX
       LDA (POINTER2),Y
       STA P2
       LDA (POINTER3),Y
       STA M2
       INY
       LDA (POINTER2),Y
       STA P3
       LDA (POINTER3),Y
       STA M3
       INY
       LDA (POINTER2),Y
       STA P4
       LDA (POINTER3),Y
       STA M4
       LDA #$00
       STA P1
       STA M1
       LDX WASPXX
       LDY TABLE62,X
       BNE :6
       DEC WASPX
       JMP :7
:6     JSR ROTATE
       DEY
       BNE :6
:7     LDA M1
       AND P1
       STA P1
       LDA M2
       AND P2
       STA P2
       LDA M3
       AND P3
       STA P3
       LDA M4
       AND P4
       STA P4
       LDY WASPX
       CPY #$2C
       BCS :15
       CPY #$04
       BCC :12
       LDA M1
       EOR #$FF
       AND (POINTER4),Y
       ORA P1
       STA (POINTER1),Y
:12    INY
       CPY #$2C
       BCS :11
       CPY #$04
       BCC :13
       LDA M2
       EOR #$FF
       AND (POINTER4),Y
       ORA P2
       STA (POINTER1),Y
:13    INY
       CPY #$2C
       BCS :11
       CPY #$04
       BCC :14
       LDA M3
       EOR #$FF
       AND (POINTER4),Y
       ORA P3
       STA (POINTER1),Y
:14    INY
       CPY #$2C
       BCS :11
       CPY #$04
       BCC :11
       LDA M4
       EOR #$FF
       AND (POINTER4),Y
       ORA P4
       STA (POINTER1),Y
:11    LDA PATINDEX
       CLC
       ADC #$03
       STA PATINDEX
       INC TEMP1
:15    LDY TABLE62,X
       BNE :16
       INC WASPX
:16    DEC HEIGHT
       BNE :8
       RTS
:8     JMP :3

ROTATE
       LSR P4
       LDA P3
       BCC :1
       ORA #$80
       STA P3
:1     LSR P3
       LDA P2
       BCC :2
       ORA #$80
       STA P2
:2     LSR P2
       LDA P1
       BCC :3
       ORA #$80
       STA P1
:3     LSR P1
       LSR M4
       LDA M3
       BCC :4
       ORA #$80
       STA M3
:4     LSR M3
       LDA M2
       BCC :5
       ORA #$80
       STA M2
:5     LSR M2
       LDA M1
       BCC :6
       ORA #$80
       STA M1
:6     LSR M1
       RTS

TABLE60    hex 00216081A2
TABLE62    hex 00050301060402 
TABLE74    hex 4041414141
TABLE75    hex C320416283  

ERASE_LEFT
       LDA WASPY
       STA TEMP2
       LDY WASPX
       LDA #$0B
       STA HEIGHT
       LDX WASPXX
       BEQ :3
       CPX #$04
       BNE :1
:3     DEY
:1     STY TEMP1
       CPY #$2C
       BCS :2
:4     LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER2+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER4
       STA POINTER2
       LDY TEMP1
       CPY #$04
       BCC :5
       LDA (POINTER2),Y
       AND TABLE64,X
       STA TEMP3
       LDA TABLE64,X
       EOR #$FF
       AND (POINTER4),Y
       ORA TEMP3
       STA (POINTER2),Y
:5     CPX #$04
       BNE :6
       INY
       CPY #$2C
       BCS :6
       CPY #$04
       BCC :2
       LDA (POINTER2),Y
       AND #$FE
       STA TEMP3
       LDA (POINTER4),Y
       AND #$01
       ORA TEMP3
       STA (POINTER2),Y
:6     INC TEMP2
       DEC HEIGHT
       BNE :4
:2     LDA #$00
       RTS

TABLE64    hex 9FFCF3CFBFF9E7
TABLE65    hex 40020820000410

ERASE_RIGHT
       LDA WASPY
       STA TEMP2
       LDA #$0B
       STA HEIGHT
       LDX WASPXX
       LDA WASPX
       CLC
       ADC #$03
       CMP #$2C
       BCS :1
       STA TEMP1
:2     LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER2+1
       CLC
       ADC #$60		; POINTER
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER2
       STA POINTER4
       LDY TEMP1
       CPY #$04
       BCC :3
       LDA (POINTER2),Y
       AND TABLE66,X
       STA TEMP3
       LDA TABLE66,X
       EOR #$FF
       AND (POINTER4),Y
       ORA TEMP3
       STA (POINTER2),Y
:3     CPX #$03
       BNE :4
       INY
       CPY #$2C
       BCS :4
       CPY #$04
       BCC :1
       LDA (POINTER2),Y
       AND #$FE
       STA TEMP3
       LDA (POINTER4),Y
       AND #$01
       ORA TEMP3
       STA (POINTER2),Y
:4     INC TEMP2
       DEC HEIGHT
       BNE :2
:1     LDA #$00
       RTS

TABLE66    hex FCF3CFBFF9E79F
TABLE67    hex 01041040020820

ERASE_TOP
       LDY WASPY
       DEY
E2     LDA (SCRPNT1),Y
       STA POINTER2+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER2
       STA POINTER4
       LDX WASPXX
       LDY WASPX
       CPY #$2C
       BCS :1
       CPY #$04
       BCC :2
       LDA (POINTER4),Y
       STA (POINTER2),Y
:2     INY
       CPY #$2C
       BCS :1
       CPY #$04
       BCC :3
       LDA (POINTER4),Y
       STA (POINTER2),Y
:3     INY
       CPY #$2C
       BCS :1
       CPY #$04
       BCC :4
       LDA (POINTER4),Y
       STA (POINTER2),Y
:4     INY
       CPY #$2C
       BCS :1
       CPY #$04
       BCC :1
       LDA (POINTER4),Y
       STA (POINTER2),Y
:1     LDA #$00
       RTS

ERASE_BOTTOM
       LDA WASPY
       CLC
       ADC #$0B
       TAY
       BNE E2

TABLE68    hex 2A282000545040
TABLE69    hex 555555552A2A2A
TABLE70    hex 2A2A2A2A555555
TABLE71    hex 0001051500020A 

CREATE_WASP
       LDA WASPSTATE
       BMI :1
       RTS
:1     LDA PARALYZE
       BEQ :2
       RTS
:2     JSR RANDOM1_Z
       CMP WASP_CHANCE
       BCC :3
       RTS
:3     JSR RANDOM2_Z
       AND #$03
       STA WASPDEST
       LDA MANX
       CMP #$18
       BCC :4
       LDA #$01
       STA WASPX
       LDA #$04
       STA WASPXX
       LDA #$02
       STA WASPSTATE
       LDA MANY
       CMP #$75
       BCC :5
       LDA #$38
       STA WASPY
       LDA #$C0
       ORA L1B00+$E4
       STA L1B00+$E4
       RTS
:5     LDA #$A8
       STA WASPY
       LDA #$C0
       ORA L1E00+$84
       STA L1E00+$84
       RTS
:4     LDA #$2B
       STA WASPX
       LDA #$06
       STA WASPXX
       LDA #$00
       STA WASPSTATE
       LDA MANY
       CMP #$75
       BCC :6
       LDA #$38
       STA WASPY
       LDA #$C0
       ORA L1C00+$0B
       STA L1C00+$0B
       RTS
:6     LDA #$A8
       STA WASPY
       LDA #$C0
       ORA L1E00+$AB
       STA L1E00+$AB
       RTS

VACATE_WASPS_BLOCKS
       STA WASPSTATE
       LDX #$02
       LDA WASPY
       AND #$07
       CMP #$06
       BCC :1
       INX
:1     STX TEMP1
       LDA WASPY
       LSR
       LSR
       LSR
       TAX
:3     LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDY WASPX
       LDA #$05
       STA TEMP2
:2     LDA (POINTER1),Y
       AND #$7F
       STA (POINTER1),Y
       INY
       DEC TEMP2
       BNE :2
       INX
       DEC TEMP1
       BNE :3
       RTS

HITMAN
       LDA WASPX
       SEC
       SBC MANX
       CLC
       ADC #$03
       CMP #$05
       BCC :1
       RTS
:1     LDA WASPY
       SEC
       SBC MANY
       CLC
       ADC #$09
       CMP #$19
       RTS

DELAY
       SEC
:1     PHA
:2     SBC #$01
       BNE :2
       PLA
       SBC #$01
       BNE :1
       RTS

MOVE_UP
       DEC WASPY
       JSR HITMAN
       BCS :1
       LDA #$90
       JSR STING_MAN_Z
:1     LDA WASPY
       CMP #$04
       BCC N4  
       AND #$07
       CMP #$07
       BEQ N5
       CMP #$05
       BEQ N6
N2     JSR PLOT_WASP    
       JMP ERASE_BOTTOM
N4     INC WASPY  
       LDA #$80
       JMP VACATE_WASPS_BLOCKS
N5     LDA WASPY 
       LSR
       LSR
       LSR
       TAX
N1     LDA AAMSBYT,X  
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDX #$04
       LDY WASPX
:1     LDA (POINTER1),Y
       ORA #$80
       STA (POINTER1),Y
       INY
       DEX
       BNE :1
       BEQ N2
N6     JSR PLOT_WASP  
       JSR ERASE_BOTTOM
       LDA WASPY
       LSR
       LSR
       LSR
       TAX
       INX
       INX
N8     LDA AAMSBYT,X  
       STA POINTER2+1
       LDA AALSBYT,X
       STA POINTER2
       LDA #$04
       STA TEMP1
       LDY WASPX
:6     LDA (POINTER2),Y
       AND #$7F
       STA (POINTER2),Y
:8     INY
       DEC TEMP1
       BNE :6
       LDA DIE
       CMP #$20
       BEQ :98
       INC SCRPNT2+1
:98    RTS
       RTS

MOVE_DOWN
       INC WASPY
       JSR HITMAN
       BCS :1
       LDA #$90
       JSR STING_MAN_Z
:1     LDA WASPY
       CMP #$DB
       BCS :2
       AND #$07
       BEQ :4
       CMP #$06
       BEQ :3
       JSR PLOT_WASP
       JMP ERASE_TOP
:2     DEC WASPY
       LDA #$80
       JMP VACATE_WASPS_BLOCKS
:4     JSR PLOT_WASP
       JSR ERASE_TOP
       LDA WASPY
       LSR
       LSR
       LSR
       TAX
       DEX
:9     LDA AAMSBYT,X
       STA POINTER2+1
       LDA AALSBYT,X
       STA POINTER2
       LDA #$04
       STA TEMP1
       LDY WASPX
:6     LDA (POINTER2),Y
       AND #$7F
       STA (POINTER2),Y
:8     INY
       DEC TEMP1
       BNE :6
       RTS
:3     LDA WASPY
       LSR
       LSR
       LSR
       TAX
       INX
       INX
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDX #$04
       LDY WASPX
:10    LDA (POINTER1),Y
       ORA #$80
       STA (POINTER1),Y
       INY
       DEX
       BNE :10
       JSR PLOT_WASP
       JMP ERASE_TOP

MOVE_LEFT
       DEC WASPXX
       BMI :1
       LDA WASPXX
       CMP #$03
       BEQ :2
       JSR PLOT_WASP
       JMP ERASE_RIGHT
:1     LDA #$06
       STA WASPXX
:2     DEC WASPX
       BPL :3
       INC WASPX
       LDA #$80
       JMP VACATE_WASPS_BLOCKS
:3     JSR HITMAN
       BCS :4
       LDA #$90
       JSR STING_MAN_Z
:4     JSR PLOT_WASP
       JSR ERASE_RIGHT
       LDA WASPY
       LSR
       LSR
       LSR
       TAX
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDY WASPX
       LDA (POINTER1),Y
       ORA #$80
       STA (POINTER1),Y
       INX
       LDA AAMSBYT,X
       STA POINTER2+1
       LDA AALSBYT,X
       STA POINTER2
       LDA (POINTER2),Y
       ORA #$80
       STA (POINTER2),Y
       LDA WASPY
       AND #$07
       CMP #$06
       BCC :5
       INX
       LDA AAMSBYT,X
       STA POINTER3+1
       LDA AALSBYT,X
       STA POINTER3
       LDA (POINTER3),Y
       ORA #$80
       STA (POINTER3),Y
       DEX
:5     LDA WASPX
       CLC
       ADC #$04
       STA TEMP1
       TAY
N7     DEX
       LDA (POINTER1),Y
       AND #$7F
       STA (POINTER1),Y
:6     INX
       LDY TEMP1
       LDA (POINTER2),Y
       AND #$7F
       STA (POINTER2),Y
:7     INX
       LDA WASPY
       AND #$07
       CMP #$06
       BCC :8
       LDY TEMP1
       LDA (POINTER3),Y
       AND #$7F
       STA (POINTER3),Y
:8     RTS

MOVE_RIGHT
       INC WASPXX
       LDA WASPXX
       CMP #$04
       BEQ :1
       CMP #$07
       BEQ :2
       JSR PLOT_WASP
       JMP ERASE_LEFT
:2     LDA #$00
       STA WASPXX
:1     INC WASPX
       LDA WASPX
       CMP #$2D
       BCC :3
       DEC WASPX
       LDA #$80
       JMP VACATE_WASPS_BLOCKS
:3     JSR HITMAN
       BCS :4
       LDA #$90
       JSR STING_MAN_Z
:4     JSR PLOT_WASP
       JSR ERASE_LEFT
       LDA WASPY
       LSR
       LSR
       LSR
       TAX
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDY WASPX
       INY
       INY
       INY
       LDA (POINTER1),Y
       ORA #$80
       STA (POINTER1),Y
       INX
       LDA AAMSBYT,X
       STA POINTER2+1
       LDA AALSBYT,X
       STA POINTER2
       LDA (POINTER2),Y
       ORA #$80
       STA (POINTER2),Y
       LDA WASPY
       AND #$07
       CMP #$06
       BCC :5
       INX
       LDA AAMSBYT,X
       STA POINTER3+1
       LDA AALSBYT,X
       STA POINTER3
       LDA (POINTER3),Y
       ORA #$80
       STA (POINTER3),Y
       DEX
:5     LDY WASPX
       DEY
       STY TEMP1
       JMP N7

WASP_MASTER
       DEC K4
       BEQ :1
       RTS
:1     LDA INIT_K4
       STA K4
       LDA PARALYZE
       BNE :5
       JSR CREATE_WASP
       LDX WASPSTATE
       BPL :2
       LDA #$40
       JMP DELAY
:2     CPX #$04
       BNE :3
       DEC WASP_SPLAT_COUNT
       BEQ :4
       JMP PLOT_WASP
:4     LDA #$04
       STA WASP_SPLAT_COUNT
       LDA #$05
       STA WASPSTATE
       JSR PLOT_WASP
       LDA #$80
       STA WASPSTATE
       RTS
:5     LDA WASPSTATE
       BPL :6
       RTS
:6     INC FLAP
       LDA WASPX
       CMP #$18
       BCC :7
       LDA #$02
       STA WASPSTATE
       JMP MOVE_RIGHT
:7     LDA #$00
       STA WASPSTATE
       JMP MOVE_LEFT
:3     LDX WASPDEST
       LDA MANX
       CLC
       ADC TABLE72,X
       BPL :14
       LDA #$00
:14    STA DESTX
       CMP WASPX
       BNE :8
       LDA MANY
       CLC
       ADC TABLE73,X
       CMP WASPY
       BNE :9
       JSR RANDOM2_Z
       AND #$03
       STA WASPDEST
       BPL :3
:8     LDA MANY
       CLC
       ADC TABLE73,X
:9     CMP #$F0
       BCC :15
       LDA #$04
:15    STA DESTY
       INC FLAP
       LDA DESTX
       CMP WASPX
       BCC :10
       BEQ :11
       LDA #$02
       STA WASPSTATE
       JSR MOVE_RIGHT
       LDA WASPSTATE
       BPL :11
:12    RTS
:10    LDA #$00
       STA WASPSTATE
       JSR MOVE_LEFT
       LDA WASPSTATE
       BMI :12
:11    LDA DESTY
       CMP WASPY
       BCS :13
       JMP MOVE_UP
:13    BEQ :12
       JMP MOVE_DOWN

TABLE72 hex FA0505FA
TABLE73 hex E4E42121
       hex E6
       
* We are at $5E8A

RANDOM2
       STX TEMPRND
       LDA #$20
       TAX
       BIT RNDBYTE2
       BVC :1
       BEQ :5
       INX
:1     BEQ :2
:5     INX
:2     LDA #$08
       BIT RNDBYTE2
       BEQ :3
       INX
:3     LDA #$01
       BIT RNDBYTE2
       BEQ :4
       INX
:4     TXA
       ROR
       ROR RNDBYTE2
       LDX TEMPRND
       LDA RNDBYTE2
       RTS

* We are at $5EB0

       *or $5EB0
       *ta $1DB0 

SELECT2
       JSR Z4_Z
SELECT3
       LDA KBDSTROBE
SELECT
       JSR PROTECT_Z
       JSR :4
       JSR MUSIC_Z
       LDA KBD
       STA TEMP1
:1     INC RNDBYTE1
       BEQ :1
:2     DEC RNDBYTE2
       BEQ :2
       LDA TEMP1
       BPL SELECT
       STA KBDSTROBE
       CMP #$CB
       BEQ :10
       CMP #$B1
       BEQ :7
       CMP #$B2
       BEQ :8
       CMP #$CA
       BEQ :9
:15    CMP #$8D  
       BNE SELECT
       RTS
:4     LDA #$6D
       STA POINTER1
       LDA #$20
       STA POINTER1+1
       LDA #$07
       STA HEIGHT
       LDX #$00
       INC FLAP
       LDA FLAP
       AND #$01
       BEQ :6
       LDX #$0E
:6     LDY #$00
       LDA TABLE399,X
       STA (POINTER1),Y
       INY
       INX
       LDA TABLE399,X
       STA (POINTER1),Y
       LDA POINTER1+1
       CLC
       ADC #$04
       STA POINTER1+1
       INX
       DEC HEIGHT
       BNE :6
       RTS
:7     LDA #$01
:11    CMP NO_OF_PLAYERS
       BEQ SELECT
       STA NO_OF_PLAYERS
       LDY #$0A
       JMP FLIP
:8     LDA #$02
       BNE :11
:10    LDA #$09
       BNE :12
:9     LDA #$06
:12    CMP L460C+1
       BEQ :15
       STA L460C+1
       LDY #$1C
       JMP FLIP

       hex AC
       
* We are at $5F40

       *or $5F40 
       *ta $2F40 

ERASE_ROW
       LDY #$08
       STY HEIGHT
       ASL
       ASL
       ASL
       STA TEMP2
       CMP #$70
       BCS :4
       CMP #$38
       BCC :5
       LDA #$10
       BNE :3
:4     CMP #$B0
       BCS :14
       LDA #$F0
:3     STA TEMP4
:2     LDA WIDTH
       STA TEMP1
       LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDA TEMP2
       CLC
       ADC TEMP4
       TAY
       LDA (SCRPNT1),Y
       CLC
       ADC #$60
       STA POINTER2+1
       LDA (SCRPNT2),Y
       STA POINTER2
       LDY TEMP3
:1     LDA (POINTER2),Y
       STA (POINTER1),Y
       STA (POINTER4),Y
       INY
       DEC TEMP1
       BNE :1
       INC TEMP2
       DEC HEIGHT
       BNE :2
       RTS
:6     LDA #$80
       BNE :12
:5     CMP #$20
       BCC :6
:14    CMP #$C8
       BCS :6
       LDA #$00
:12    STA TEMP4  
       STA TEMP5
:8     LDA TEMP3
       CMP #$12
       BEQ :7
       LDA #$55
       LDY #$2A
       JSR :13
:9     LDA WIDTH
       STA TEMP1
       LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDY TEMP3
:11    LDA TEMP4
       STA (POINTER1),Y
       STA (POINTER4),Y
       INY
       DEC TEMP1
       BEQ :10
       LDA TEMP5
       STA (POINTER1),Y
       STA (POINTER4),Y
       INY
       DEC TEMP1
       BNE :11
:10    INC TEMP2
       DEC HEIGHT
       BNE :9
       RTS
:7     LDA #$2A
       LDY #$55
       JSR :13
       BNE :9
:13    ORA TEMP4
       STA TEMP4
       TYA
       ORA TEMP5
       STA TEMP5
       RTS

       hex FF0000
       
* We are at $6000

       *or $6000
       *ta $2000
       
       hex FFFFFF

SPIDER_MASTER_Z
       JMP SPIDER_MASTER
PLOT_SPIDER_Z
       JMP PLOT_SPIDER
PLOT_WEB_Z
       JMP PLOT_WEB
ERASE_WEB_Z
       JMP ERASE_WEB
STING_MAN_Z
       JMP STING_MAN

       hex FFFFFFFFFFFF

ERASE_WEB
       STY TEMP1
       LDA TEMP3
       PHA
       TYA
       ROR
       BCS :1
       LDA #$2A
       BNE :2
:1     LDA #$55
:2     STA TEMP3
:3     TXA
       ASL
       ASL
       ASL
       STA TEMP2
       LDA #$08
       STA HEIGHT
:4     LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDY TEMP1
       LDA TEMP3
       STA (POINTER1),Y
       STA (POINTER4),Y
       INC TEMP2
       DEC HEIGHT
       BNE :4
       PLA
       STA TEMP3
       RTS

PLOT_WEB
       TXA
       PHA
       ASL
       ASL
       ASL
       STA TEMP3
       TYA
       PHA
       STA TEMP2
       LDA #$08
       STA HEIGHT
       LDX #$00
:1     LDY TEMP3
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDA TEMP2
       ROR
       BCS :2
       LDA TABLE80,X
       LDY TEMP2
       STA (POINTER1),Y
       STA (POINTER4),Y
       INX
       INC TEMP3
       DEC HEIGHT
       BNE :1
       PLA
       TAY
       PLA
       TAX
       RTS
:2     LDA TABLE81,X
       LDY TEMP2
       STA (POINTER1),Y
       STA (POINTER4),Y
       INX
       INC TEMP3
       DEC HEIGHT
       BNE :1
       PLA
       TAY
       PLA
       TAX
       RTS

TABLE80    hex 6B2A3A3A2E2E2A6B
TABLE81    hex 7755575775755577

STING_MAN
       STA PARALYZE
       LDY #$80
       STY TEMP1
:15    LDY TEMP1
       LDA SPKR
:16    DEY
       BNE :16
       INC TEMP1
       BNE :15
       LDA #$00
       STA TEMP3
       STA GRAB_FOOD
       STA BYFOOD
       LDX MANSTATE
       JSR K1_Z
       LDX MANXX
       LDA #$10
       STA HEIGHT
       LDA MANY
       STA TEMP2
       LDA MANX
       STA TEMP1
:1     LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER1+1
       LDA (SCRPNT2),Y
       STA POINTER1
       LDY TEMP1
       CPY #$2C
       BCS :11
       CPY #$04
       BCC :12
       LDA TABLE74_2,X
       STA (POINTER1),Y
:12    INY
       CPY #$2C
       BCS :13
       CPY #$04
       BCC :13
       LDA TABLE75_2,X
       STA (POINTER1),Y
:13    INY
       CPY #$2C
       BCS :14
       CPY #$04
       BCC :11
       LDA TABLE74_2,X
       STA (POINTER1),Y
:14    INC TEMP2
       DEC HEIGHT
       BNE :1
:11    LDA MANY
       AND #$07
       BEQ :2
       LDA #$03
       BNE :3
:2     LDA #$02
:3     STA TEMP1
       LDA MANY
       LSR
       LSR
       LSR
       TAX
:4     LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDY MANX
       LDA #$00
       STA (POINTER1),Y
       INY
       STA (POINTER1),Y
       INY
       STA (POINTER1),Y
       INX
       DEC TEMP1
       BNE :4
       LDA #$16
       STA MANX
       LDA #$6C
       STA MANY
       LDA #$02
       STA MANXX
       LDA #$01
       STA MANSTATE
       STA NEXTSTATE
       LDX #$0D
       JSR :5
       LDX #$0E
       JSR :5
       LDX #$0F
:5     LDY #$16
       JSR :10
       LDY #$17
       JSR :10
       LDY #$18
:10    LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$3F
       STA TEMP1
       LDA #$01
       STA (POINTER1),Y
       LDA TEMP1
       CMP #$20
       BCS :6
       CMP #$08
       BCS :8
       CMP #$03
       BEQ :7
       RTS
:6     AND #$1F
       STY TEMP1
       TAY
       STY TEMP2
       LDA ANTBYT1,Y
       AND #$3F
       STA ANTXOLD
       STA ANTX
       LDA ANTBYT2,Y
       STA ANTYOLD
       STA ANTY
       LDA ANTBYT3,Y
       STA ANTXXOLD
       STA ANTXX
       JSR ERASE_ANT_Z
       JSR VACATE_ANTS_BLOCKS_Z
       LDA #$00
       LDY TEMP2
       STA ANTBYT1,Y
       LDY TEMP1
       LDA #$01
       STA (POINTER1),Y
       RTS
:7     JMP ERASE_WEB
:8     AND #$07
       STA TEMP3
       JSR ERASE_SPIDER
       LDY TEMP3
       LDA #$00
       STA SPIDERBYT4,Y
       RTS

* 61DF & 61E6

TABLE74_2    hex 2A2A2A2A555555
TABLE75_2    hex 555555552A2A2A

GET_BLOCK4
       STY TEMP1
       LDX SPIDERBYT2,Y
       LDA SPIDERBYT1,Y
       TAY
       LDA AALSBYT,X
       STA POINTER3
       LDA AAMSBYT,X
       STA POINTER3+1
       LDA (POINTER3),Y
       LDY TEMP1
       AND #$BF
       RTS

GET_BLOCK6
       LDY SPIDERX
       LDX SPIDERY

GET_BLOCK5
       LDA AALSBYT,X
       STA POINTER3
       LDA AAMSBYT,X
       STA POINTER3+1
       LDA (POINTER3),Y
       RTS

SET_BLOCK_WEB
       JSR GET_BLOCK6
       LDA #$03
       STA (POINTER3),Y
       RTS

SET_BLOCK_VACANT2
       JSR GET_BLOCK6
       AND #$40
       STA (POINTER3),Y
       RTS

SET_BLOCK_SPIDER
       JSR GET_BLOCK6
       AND #$C0
       ORA SPIDERNUM
       ORA #$08
       STA (POINTER3),Y
       RTS

RANDOM3
       JSR RANDOM1_Z
       CMP #$55
       BCC :1
       CMP #$AA
       BCC :2
       LDA #$E1
       RTS
:1     LDA #$E2
       RTS
:2     LDA #$E3
       RTS

CREATE_SPIDER
       DEC K6
       BEQ :7
       RTS
:7     LDA INIT_K6
       STA K6
       LDY #$08
:2     DEY
       BPL :1
       RTS
:1     LDA SPIDERBYT4,Y
       BNE :2
       STY TEMP1
       JSR RANDOM1_Z
       CMP #$C0
       BCS :3
       CMP #$80
       BCS :4
       CMP #$40
       BCS :5
       LDA #$2B
       STA SPIDERBYT1,Y
       JSR RANDOM2_Z
       AND #$1F
       CMP #$1A
       BCS :6
       CMP #$03
       BCC :6
       STA SPIDERBYT2,Y
       JSR GET_BLOCK4
       BNE :6
       JSR RANDOM3
       CLC
       ADC #$04
       STA SPIDERBYT3,Y
       LDA #$80
       STA SPIDERBYT4,Y
       RTS
:3     LDA #$04
       STA SPIDERBYT1,Y
       JSR RANDOM2_Z
       AND #$1F
       CMP #$1A
       BCS :6
       CMP #$03
       BCC :6
       STA SPIDERBYT2,Y
       JSR GET_BLOCK4
       BNE :6
       JSR RANDOM3
       STA SPIDERBYT3,Y
       LDA #$80
       STA SPIDERBYT4,Y
:6     RTS
:4     LDA #$03
       STA SPIDERBYT2,Y
       JSR RANDOM2_Z
       AND #$3F
       CMP #$2C
       BCS :6
       CMP #$04
       BCC :6
       STA SPIDERBYT1,Y
       JSR GET_BLOCK4
       BNE :6
       JSR RANDOM3
       CLC
       ADC #$02
       STA SPIDERBYT3,Y
       LDA #$80
       STA SPIDERBYT4,Y
       RTS
:5     LDA #$19
       STA SPIDERBYT2,Y
       JSR RANDOM2_Z
       AND #$3F
       CMP #$2C
       BCS :6
       CMP #$04
       BCC :6
       STA SPIDERBYT1,Y
       JSR RANDOM3
       CLC
       ADC #$06
       AND #$F7
       STA SPIDERBYT3,Y
       LDA #$80
       STA SPIDERBYT4,Y
       RTS

PLOT_SPIDER
       LDA #$0F
       STA POINTER1+1
       LDY SPIDERNUM
       LDA SPIDERBYT4,Y
       BPL :6
       LDA SPIDERBYT3,Y
       AND #$40
       BEQ :1
       LDA SPIDERBYT1,Y
       STA SPIDERX
       ROR
       BCS :2
       LDA #$C0
       BNE :4
:2     LDA #$A0
       BNE :4
:1     LDA SPIDERBYT1,Y
       STA SPIDERX
       ROR
       BCS :3
       LDA #$D0
       BNE :4
:3     LDA #$B0
:4     STA POINTER1
       LDA #$08
       STA HEIGHT
       LDA #$00
       STA PATINDEX
       LDA SPIDERBYT2,Y
       STA SPIDERY
       ASL
       ASL
       ASL
       STA TEMP1
:5     LDY TEMP1
       LDA (SCRPNT1),Y
       STA POINTER2+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER4
       STA POINTER2
       LDY SPIDERX
       LDA (POINTER4),Y
       LDY PATINDEX
       AND (POINTER1),Y
       INY
       CMP #$80
       BCS :8
       ORA (POINTER1),Y
:8     INY
       STY PATINDEX
       LDY SPIDERX
       STA (POINTER2),Y
       INC TEMP1
       DEC HEIGHT
       BNE :5
       RTS
:6     LDA SPIDERBYT1,Y
       STA SPIDERX
       ROR
       BCS :7
       LDA #$F0
       BNE :4
:7     LDA #$E0
       BNE :4

SPIDER_MASTER
       DEC K5
       BEQ :1
:2     RTS
:1     LDA INIT_K5
       STA K5
       JSR CREATE_SPIDER
       LDY #$08
:3     DEY
       STY SPIDERNUM
       BMI :2
       LDA SPIDERBYT4,Y
       BEQ :3
       JSR MOVE_1_SPIDER
       LDY SPIDERNUM
       BPL :3

MOVE_1_SPIDER
       LDA SPIDERBYT1,Y
       STA SPIDERX
       LDA SPIDERBYT2,Y
       STA SPIDERY
       LDA SPIDERBYT4,Y
       BMI :1
       SEC
       SBC #$01
       STA SPIDERBYT4,Y
       BEQ :2
       JMP PLOT_SPIDER
:2     LDX SPIDERY
       LDY SPIDERX
       JMP ERASE_SPIDER
:1     LDA SPIDERBYT3,Y
       AND #$40
       BEQ :3
       LDA SPIDERBYT3,Y
       AND #$BF
       STA SPIDERBYT3,Y
       JMP PLOT_SPIDER
:3     LDX SPIDERY
       LDY SPIDERX
       JSR GET_BLOCK5
       LDY SPIDERNUM
       AND #$40
       BEQ :4
       LDA SPIDERBYT3,Y
       AND #$7F
       ORA #$20
       STA SPIDERBYT3,Y
       BPL :5
:4     LDA SPIDERBYT3,Y
       BPL :6
       JSR RANDOM1_Z
       CMP #$18
       BCS :7
       LDA SPIDERBYT3,Y
       AND #$7F
       STA SPIDERBYT3,Y
       BPL :7
:6     AND #$20
       BEQ :5
       LDA SPIDERBYT3,Y
       ORA #$80
       STA SPIDERBYT3,Y
:7     LDA SPIDERBYT3,Y
       AND #$DF
       STA SPIDERBYT3,Y
:5     LDX SPIDERY
       LDA SPIDERBYT3,Y
       BPL :8
       LDY SPIDERX
       JSR PLOT_WEB
       JSR SET_BLOCK_WEB
       JMP :9
:8     LDY SPIDERX
       JSR GET_BLOCK5
       AND #$40
       BEQ :14
       JSR ERASE_SPIDER
       JMP :15
:14    JSR ERASE_WEB
:15    JSR SET_BLOCK_VACANT2
:9     LDY SPIDERNUM
       LDA SPIDERBYT3,Y
       AND #$07
       TAX
       CLC
       LDA TABLE90,X
       ADC SPIDERX
       CMP #$04
       BCC :10
       CMP #$2C
       BCS :10
       TAY
       LDA TABLE91,X
       CLC
       ADC SPIDERY
       CMP #$1A
       BCS :10
       CMP #$03
       BCC :10
       TAX
       JSR GET_BLOCK5
       STA TEMP1
       AND #$BF
       BEQ :11
       CMP #$03
       BEQ :11
       CMP #$01
       BEQ :12
       JSR RANDOM2_Z
       AND #$07
       LDY SPIDERNUM
       STA TEMP1
       LDA SPIDERBYT3,Y
       AND #$F8
       ORA TEMP1
       STA SPIDERBYT3,Y
       JSR PLOT_SPIDER
       JMP SET_BLOCK_SPIDER
:10    LDY SPIDERNUM
       LDA #$00
       STA SPIDERBYT4,Y
       RTS
:11    TYA
       LDY SPIDERNUM
       STA SPIDERBYT1,Y
       TXA
       STA SPIDERBYT2,Y
       LDA SPIDERBYT3,Y
       ORA #$40
       STA SPIDERBYT3,Y
       JSR PLOT_SPIDER
       JMP SET_BLOCK_SPIDER
:12    TYA
       LDY SPIDERNUM
       STA SPIDERBYT1,Y
       STA SPIDERX
       TXA
       STA SPIDERBYT2,Y
       STA SPIDERY
       LDA SPIDERBYT3,Y
       ORA #$40
       STA SPIDERBYT3,Y
       LDA #$60
       JSR STING_MAN
       JSR GET_BLOCK6
       CMP #$01
       BEQ :13
       JSR PLOT_SPIDER
       JMP SET_BLOCK_SPIDER
:13    LDY SPIDERX    
       LDX SPIDERY
       JSR ERASE_SPIDER
       LDY SPIDERNUM
       LDA #$00
       STA SPIDERBYT4,Y
       RTS

TABLE90    hex 0001010100FFFFFF
TABLE91    hex FFFF0001010100FF

ERASE_SPIDER
       JSR GET_BLOCK5
       AND #$40
       BEQ :2
       STY TEMP1
       TXA
       ASL
       ASL
       ASL
       STA TEMP2
       LDA #$08
       STA HEIGHT
:1     LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDY TEMP1
       LDA (POINTER4),Y
       STA (POINTER1),Y
       INC TEMP2
       DEC HEIGHT
       BNE :1
       RTS
:2     JMP ERASE_WEB

       hex FF
       
* We are at $6535

       *or $6535
       *ta $1535
DIE
       JSR SCRAMBLE2
       LDX #$00
       STX RNDBYTE1
       STX RNDBYTE2
       INC MANXX
       INC SCRPNT1+1
:1     STA DIE,X
       INX
       CPX #$0E
       BNE :1
       RTS

* We are at $654b

L654B	hex	00FFFF0000
	hex	FFFF0000FFFFD7AFDFBEFDFAF5EBD7AF
	hex	DF2A552A55BEFDFAF5EBD7AFDFBEFDFA
L6570	hex	FDFAF5EBD7AFDFBEFDFAF52A552A55EB
	hex	D7AFDFBEFDFAF5EBD7AF
L658A	hex	0C0F0C0C0C0C3F
L6591	hex	0C3330300C033F
L6598	hex	0C33300C30330C
L659F	hex	3333333F303030
L65A6	hex	3F030F3030330C
L65AD	hex	0C33030F33330C
L65B4	hex	3F30300C0C0303
L65BB	hex	0C33330C33330C
L65C2	hex	0C33330C30300E
L65C9	hex	0C33333333330C

FOODBYT1
	hex	000FC409874C4441
FOODBYT2
	hex	81414E5444495200
FOODBYT3
	hex	0DCE09874F524181
ANTHOLD
	hex	414E54580012D809
ANTPOSITIONS
	hex	8753544181414E54
ANT_ORIENTATIONS
	hex	425954312C59000D

L6600	hex	7F7F7F7F7F7F7F7F4763291429150911
	hex	291527642765276749193937691D3936
	hex	691D1933691D3137691C393749193917
	hex	6764276747611F787F7F7F7F7F7F7F7F
	hex	7F7F7F7F7F7F7F7F6378144A544A544A
	hex	544A537213725373644C5C4B744E1C4B
	hex	744E4C49744E5C4B344E5C4B644C5C4B
	hex	3372537363700F7C7F7F7F7F7F7F7F7F
	hex	7F7F7F7F7F7F7F7F7FBBF77F7FEEDD7F
	hex	DFBBF7FEFFEEDDFBDFBBF7EEF7EEDDFB
	hex	83A083E0830000E05702406A5F2A557F
	hex	572A557ADFBBF7FEDFAAD5FE7F7F7F7F
	hex	7F7F7F5F7A7E575A7A575A6A576A6A57
	hex	6A6A010040595B4B737E66475B711F3E
	hex	7C7F007F7F637F7F637F3F007E7F7F7F
	hex	17874C4441814D414E593130000CC017

L6700	hex	7F7F7F7F787F3F607F1F007F07007C03
	hex	0070730360737F61737F67737F67437F
	hex	67037867030067330060730760737F60
	hex	737F67637F670F7E677F70677F0F667F
	hex	7F617F7F7F7F7F7F7F7F7F7F787F3F60
	hex	7F1F007F07007C030070730360737F61
	hex	737F67737F67437F6703786703006733
	hex	0060730760737F60737F67637F670F7E
	hex	677F70677F0F667F7F617F7F7F7F7F7F
	hex	FFFFFF8FFEFFE3FCFFD9F9FFACF0FF8C
	hex	E7FFC9CEFFA39BFFE386FEA7B1FEE7E8
	hex	FCCFDCF88FB6F89FC6F2BFD2CABF92CA
	hex	FFD0CAFFD1C8FFD1CAFF93EAFFC7F2FF
	hex	CFF2FFFFFFFFFFFFFFFFFF87FFFFB1FE
	hex	FFECFCFF96F9FFC6FCFFA4E7FFD1CDFF
	hex	B183FFD398FFB3B4FEA7AEFC879BFC8F

L6800	hex	A3F99FA9E59F89E5BFA8E5FFA8E4FFA8
	hex	E5FF89F5FFA3F9FFA7F9FFFFFFFFFFFF
	hex	7F7F7F7F4F7F7F737FAFF3FEA7D1F2AF
	hex	D5EAEBD5EAABD5EAABD5EAABD5EAABD5
	hex	EAAFD5EAAFD5FABFD5FEFFDDFFFFFFFF
	hex	7F7F7F7F7F7F7F7F7F7F7F7F03000070
	hex	D3AAD5F2D3A8D1F2D3AAD5F0D3AAC5F2
	hex	D3A8D4F2D3AAD5F24F2A557C4F2A557C
	hex	3F00007F7F7F7F7F7F7F7F7F7F7F7F7F
	hex	7F7F7F7F0F7867796779077807786779
	hex	6779677963715162544A544A544A544A
	hex	544ABCCFECC6DCCBBCCBECCDBCCBBCCF
	hex	ECCDD4CA544A544A544A00407F7F7F7F
	hex	7F7F7F7F1F704F774F770F700F704F77
	hex	4F774F77476323052915291529152915
	hex	2915F99ED98DB997F996D99BF996F99E

L6900	hex	D99B291529152915291501007F7F7F7F
	hex	FFFF0000FFFF0000FFFF0000FFFF0000
	hex	FFFF0000FFFF0000FFFF0000FFFF0000
FOODBYT3_2
	hex	FFFF0000FFFF0000FFFF0000FFFF0000
	hex	FFFF0000FFFF0000FFFF0000FFFF0000

* We are at $6950

       *or $6950
       *ta $1950

PUSH_FOOD_SOUND_Z
       JMP PUSH_FOOD_SOUND
MASTER_FOOD_Z
       JMP MASTER_FOOD
UPDATE_HORIZ_DESTBYTS2_Z
       JMP UPDATE_HORIZ_DESTBYTS2
PLOT_FOOD_Z
       JMP PLOT_FOOD
CHKBLK_Z
       JMP CHKBLK
SET_OFF_SCREEN_Z
       JMP SET_OFF_SCREEN
PLOT_FOOD2_Z
       JMP PLOT_FOOD2

       hex 0EE8E8E8E01C

PLOT_FOOD
       LDX FOODNUM

PLOT_FOOD2
       LDA TABLE100,X
       STA POINTER1+1
       LDA FOODX
       LSR
       BCS :1
       LDA TABLE101,X
       BCC :2
:1     LDA TABLE102,X
:2     STA POINTER1
       LDA TABLE103,X
       STA FOOD_HEIGHT
       LDA TABLE104,X
       STA WIDTH
       LDA #$00
       STA PATINDEX
       LDA FOODY
       ASL
       ASL
       ASL
       STA TEMP1
:3     LDA WIDTH
       STA TEMP2
       LDA FOODX
       STA TEMP3
       LDY TEMP1
       LDA (SCRPNT1),Y
       STA POINTER3+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER3
       STA POINTER4
:4     LDY PATINDEX
       LDA (POINTER1),Y
       LDY TEMP3
       CPY #$2C
       BCS :5
       CPY #$04
       BCC :5
       STA (POINTER3),Y
       STA (POINTER4),Y
:5     INC PATINDEX
       INC TEMP3
       DEC TEMP2
       BNE :4
       INC TEMP1
       DEC FOOD_HEIGHT
       BNE :3
       RTS

CHKBLK
       LDA AAMSBYT,X
       STA POINTER5+1  
       LDA AALSBYT,X
       STA POINTER5
       LDA (POINTER5),Y   
       CMP #$01
       BNE :1
       STY TEMP6
       JSR STING_MAN_Z
       LDA FOODNUM
       ORA #$10
       LDY TEMP6
       STA (POINTER5),Y
       RTS
:1     AND #$20
       BEQ :2
       LDA (POINTER5),Y   
       AND #$1F
       STY TEMP3
       TAY
       LDA ANTBYT1,Y
       AND #$3F
       STA ANTX
       STA ANTXOLD
       LDA ANTBYT3,Y
       STA ANTXX
       STA ANTXXOLD
       LDA ANTBYT2,Y
       STA ANTY
       STA ANTYOLD
       LDA #$00
       STA ANTBYT1,Y
       JSR ERASE_ANT_Z
       JSR VACATE_ANTS_BLOCKS_Z
       LDY TEMP3
       LDA (POINTER5),Y  
       AND #$C0
       ORA #$10
       ORA FOODNUM
       STA (POINTER5),Y   
       RTS
:2     LDA (POINTER5),Y  
       AND #$08
       BEQ :3
       LDA (POINTER5),Y  
       AND #$07
       TAX
       LDA #$00
       STA SPIDERBYT4,X
:3     LDA (POINTER5),Y   
       AND #$C0
       ORA #$10
       ORA FOODNUM
       STA (POINTER5),Y  
       RTS

HORIZ_FOOD
       LDX FOODNUM   
       LDY TABLE122,X
       LDA TABLE105,X
       STA TEMP1
       LDA TABLE107,X

HORIZ_FOOD2
       STA TEMP2
       LDA BYTE3
       BMI :1
       RTS
:1     LDA TABLE106,X
       TAX
       LDA #$00
       STA TEMP3
:3     LDA DESTBYT1,X
       AND #$40
       STA ANTHOLD,Y
       BEQ :2
       INC TEMP3
:2     DEY
       DEX
       CPX TEMP1
       BNE :3
       LDY TEMP3
       CPY TEMP2
       BCS :4
       JSR PLOT_VERT_ANTS
       LDA BYTE3
       AND #$FD
       LDX FOODNUM
       STA FOODBYT3,X
       LSR
       BCC :5
       RTS
:5     JMP PLOT_FOOD
:4     INC ORIENT
       LDA ORIENT
       LDX FOODNUM
       STA ANT_ORIENTATIONS,X
       LDA BYTE3
       AND #$84
       ORA #$02
       STA BYTE3
       STA FOODBYT3,X
       JSR ERASE_VERT_ANTS
       LDX ANTPOS
       DEX
       BPL :6
       LDX #$07
:6     STX ANTPOS
       JSR UPDATE_VERT_ANTBYTS
       LDY FOODNUM
       LDA ANTPOS
       STA ANTPOSITIONS,Y
       BEQ :7
       CMP #$04
       BEQ :7
       JSR PLOT_VERT_ANTS
       JMP PLOT_FOOD
:7     JSR PUSH_FOOD_SOUND
       JSR UPDATE_HORIZ_DESTBYTS
       LDA FOODX
       CLC
       ADC TABLE114,X
       STA FOODX
       STA FOODBYT1,X
       CMP TABLE131,X 
       BNE :8
       LDA #$86
       STA FOODBYT3,X
       LDA FOODX
:8     CLC
       ADC TABLE113,X
       STA TEMP4
       TAY
       LDX FOODY
       JSR CHKBLK
       LDX FOODY
       INX
       LDY TEMP4
       JSR CHKBLK
       LDX FOODY
       INX
       INX
       LDY TEMP4
       JSR CHKBLK
       LDA FOODNUM
       CMP #$03
       BEQ :18
       CMP #$04
       BEQ :18
       LDX FOODY
       INX
       INX
       INX
       LDY TEMP4
       JSR CHKBLK
:18    JSR MOVE_VERT_ANTS_BLOCKS
       JSR PLOT_FOOD
       LDX FOODNUM
       LDA FOODX
       CLC
       ADC TABLE120,X
       STA TEMP3
       LDA TABLE103,X
       STA HEIGHT
       LDA FOODY
       JSR ERASE_COLUMN
       JSR PLOT_VERT_ANTS
       LDX FOODNUM
       LDA TABLE116,X
       CMP FOODX
       BEQ :19
       RTS
:19    LDY #$01
       LDX #$2C
       LDA #$03
       STA WIDTH
       LDA #$00
:20    STA L1C10,Y
       STA L1C40,Y
       STA L1C40,X
       STA L1C70,Y
       STA L1C70,X
       STA L1CA0,Y
       STA L1CA0,X
       STA L1DC0,Y
       STA L1DC0,X
       STA L1DF0,Y
       STA L1DF0,X
       STA L1E20,Y
       STA L1E20,X
       STA L1E50,X
       INY
       INX
       DEC WIDTH
       BNE :20

SET_OFF_SCREEN
       LDX FOODNUM
       LDY TABLE118,X
       STY TEMP3
       LDA TABLE117,X
       STA TEMP1
       LDA #$00
       STA FOODBYT3,X
:2     LDX FOODNUM
       LDA DESTBYT1,Y
       STA TEMP2
       LDA TABLE119,X
       STA DESTBYT1,Y
       LDA TEMP2
       AND #$40
       BEQ :1
       LDX TABLE129,Y
       LDA TABLE130,Y
       TAY
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$1F
       TAY
       LDA ANTBYT4,Y
       AND #$7F
       STA ANTBYT4,Y
:1     INC TEMP3
       LDY TEMP3
       CPY TEMP1
       BNE :2
       LDX PLAYERNUM
       DEC NO_OF_FOODS1,X
       RTS

PLOT_VERT_ANTS
       LDA #$08
       STA POINTER1+1
       LDX FOODNUM
       LDA TABLE108,X
       STA POINTER1
       LDA ORIENT
       AND #$01
       BEQ :8
       LDA #$10
       CLC
       ADC POINTER1
       STA POINTER1
:8     LDA TABLE109,X
       CLC
       ADC ANTPOS
       TAX
       LDA TABLE111,X
       STA ANTXX
       LDA TABLE110,X
       CLC
       ADC FOODX
       STA ANTX
       LDX FOODNUM
       LDA TABLE112,X
       STA ANTY
       LDY #$00
       LDA ANTHOLD,Y
       BEQ :3
       JSR PLOT_ANT4_Z  
:3     LDA ANTY
       CLC
       ADC #$08
       STA ANTY
       LDY #$01
       LDA ANTHOLD,Y
       BEQ :4
       JSR PLOT_ANT4_Z  
:4     LDA ANTY
       CLC
       ADC #$08
       STA ANTY
       LDY #$02
       LDA ANTHOLD,Y
       BEQ :5
       JSR PLOT_ANT4_Z   
:5     LDA FOODNUM
       BEQ :6
       CMP #$07
       BEQ :6
:7     RTS
:6     LDA ANTY
       CLC
       ADC #$08
       STA ANTY
       LDY #$03
       LDA ANTHOLD,Y
       BEQ :7
       JMP PLOT_ANT4_Z 

ERASE_VERT_ANTS
       LDX FOODNUM
       LDA TABLE109,X
       CLC
       ADC ANTPOS
       TAX
       LDA TABLE111,X
       STA ANTXXOLD
       LDA TABLE110,X
       CLC
       ADC FOODX
       STA ANTXOLD
       LDX FOODNUM
       LDA TABLE112,X
       STA ANTYOLD
       LDY #$00
       LDA ANTHOLD,Y
       BEQ :3
       JSR ERASE_ANT_Z
       BEQ :10
:3     LDA ANTYOLD
       CLC
       ADC #$08
       STA ANTYOLD
:10    LDY #$01
       LDA ANTHOLD,Y
       BEQ :4
       JSR ERASE_ANT_Z
       BEQ :8
:4     LDA ANTYOLD
       CLC
       ADC #$08
       STA ANTYOLD
:8     LDY #$02
       LDA ANTHOLD,Y
       BEQ :1
       JSR ERASE_ANT_Z
       BEQ :5
:1     LDA ANTYOLD
       CLC
       ADC #$08
       STA ANTYOLD
:5     LDA FOODNUM
       BEQ :6
       CMP #$07
       BEQ :6
:7     RTS
:6     LDY #$03
       LDA ANTHOLD,Y
       BEQ :7
       JMP ERASE_ANT_Z

MOVE_VERT_ANTS_BLOCKS
       LDX FOODNUM
       LDA FOODX
       CLC
       ADC TABLE128,X
       STA TEMP4
       LDA TABLE122,X
       STA TEMP1
       CLC
       ADC FOODY
       STA TEMP2
:3     LDX TEMP1
       LDA ANTHOLD,X
       BEQ :1
       JSR :4
       BNE :2
:1     JSR :5
:2     DEC TEMP2
       DEC TEMP1
       LDA TEMP2
       CMP FOODY
       BCS :3
       RTS
:4     LDY TEMP4
       LDX TEMP2
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$3F
       STA TEMP3
       LDA (POINTER1),Y
       AND #$C0
       STA (POINTER1),Y
       TYA
       CLC
       LDX FOODNUM
       ADC TABLE114,X
       TAY
       LDA (POINTER1),Y
       AND #$C0
       ORA TEMP3
       STA (POINTER1),Y
       RTS
:5     LDX FOODNUM
       LDA TEMP4
       CLC
       ADC TABLE114,X
       TAY
       LDX TEMP2
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$C0
       STA (POINTER1),Y
       RTS

MASTER_FOOD
       DEC K8
       BEQ :3
       RTS
:3     LDA INIT_K8
       STA K8
:1     LDX FOODNUM
       DEX
       BPL :2
       LDX #$07
:2     STX FOODNUM
:9     LDA FOODBYT1,X
       STA FOODX
       LDA FOODBYT2,X
       STA FOODY
       LDA FOODBYT3,X
       STA BYTE3
       LDA ANTPOSITIONS,X
       STA ANTPOS
       LDA ANT_ORIENTATIONS,X
       STA ORIENT
       LDY #$07
       LDA #$00
       STA TEMP1
:5     LDA FOODBYT3,Y
       AND #$02
       BEQ :4
       INC TEMP1
:4     DEY
       BPL :5
       LDY TEMP1
       LDA TABLE123,X
       BNE :6
       CPY #$02
       BNE :7
       LDA BYTE3
       AND #$02
       BNE :7
       LDY TABLE122,X
       LDA TABLE105,X
       STA TEMP1
       LDA #$05
       JMP HORIZ_FOOD2
:7     JMP HORIZ_FOOD
:6     CPY #$02
       BNE :8
       LDA BYTE3
       AND #$02
       BNE :8
       LDY TABLE122,X
       LDA TABLE105,X
       STA TEMP1
       LDA #$05
       JMP VERT_FOOD2_Z
:8     JMP VERT_FOOD_Z

UPDATE_VERT_ANTBYTS
       LDX FOODNUM
       LDA FOODX
       CLC
       ADC TABLE120,X
       STA TEMP4
       LDA TABLE122,X
       STA TEMP1
       CLC
       ADC FOODY
       STA TEMP2
:3     LDX TEMP1
       LDA ANTHOLD,X
       BEQ :1
       JSR :2
:1     DEC TEMP2
       DEC TEMP1
       LDA TEMP2
       CMP FOODY
       BCS :3
       RTS
:2     LDY TEMP4
       LDX TEMP2
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$1F
       TAY
       LDX FOODNUM
       LDA TABLE109,X
       CLC
       ADC ANTPOS
       TAX
       LDA TABLE111,X
       STA ANTBYT3,Y
       LDA ANTBYT1,Y
       AND #$C0
       STA TEMP3
       LDA FOODX
       CLC
       ADC TABLE124,X
       ORA TEMP3
       STA ANTBYT1,Y
       RTS

UPDATE_HORIZ_DESTBYTS
       LDX FOODNUM
       LDA TABLE114,X

UPDATE_HORIZ_DESTBYTS2
       STA TEMP2
       LDA TABLE122,X
       STA HEIGHT
       LDY TABLE118,X
:6     JSR :5
       INY
       DEC HEIGHT
       BPL :6
       RTS
:5     LDA DESTBYT2,Y
       EOR #$04
       STA DESTBYT2,Y
       LDA DESTBYT1,Y
       AND #$C0
       STA TEMP1
       LDA DESTBYT1,Y
       CLC
       ADC TEMP2
       STA DESTBYT1,Y
       RTS

PUSH_FOOD_SOUND
       JSR RANDOM2_Z
:1     ORA #$80
       SEC
       SBC #$30
       STA TEMP1
       SBC #$90
       STA TEMP2
       LDA #$50
       SEC
       SBC TEMP2
       STA TEMP2
:2     LDY TEMP1
       LDA SPKR
:3     DEY
       BNE :3
       DEC TEMP2
       BNE :2
       RTS

ERASE_COLUMN
       ASL
       ASL
       ASL
       STA TEMP2
       LDA TEMP3
       CMP #$04
       BCC :6
       CMP #$2C
       BCS :6
       CMP #$17
       BCS :4
:1     LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDY TEMP3
       LDA L458C,Y
       CPY #$0B
       BCC :3
       INY
       INY
       INY
       LDA (POINTER4),Y
       DEY
       DEY
       DEY
       AND #$1F
       SBC #$0B
       TAX
       LDA L4598,X
:3     STA (POINTER1),Y
       STA (POINTER4),Y
       INC TEMP2
       DEC HEIGHT
       BNE :1
:6     RTS
:4     LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDY TEMP3
       LDA L456C,Y
       CPY #$25
       BCS :5
       DEY
       DEY
       DEY
       LDA (POINTER4),Y
       INY
       INY
       INY
       AND #$1F
       SEC
       SBC #$0B
       TAX
       LDA L45A5,X
:5     STA (POINTER1),Y
       STA (POINTER4),Y
       INC TEMP2
       DEC HEIGHT
       BNE :4
       RTS

       hex 00000000
       
* We are at $6EC0

       *or $6EC0
       *ta $1EC0

TABLE93    hex 0C111B210C121B22
TABLE94    hex 0808080911131311
TABLE95    hex 0400000004000004
TABLE100   hex 6666666767686868
TABLE101   hex 0080C00090205090
TABLE102   hex 4080C048D82050D0
TABLE103   hex 2010101818101020
TABLE104   hex 0204030303030402
TABLE105   hex FF03070A0D101317
TABLE106   hex 03070A0D1013171B
TABLE107   hex 0303020202020303
TABLE108   hex 4000006040202060
TABLE109   hex 0000080810101818
TABLE110   hex 0201010102010101FEFFFFFFFFFFFFFF0302020203020202FEFFFFFFFFFFFFFF    
TABLE111   hex 0001020304040506030302010006050404040506000102030303020100060504   
TABLE112   hex 40111B4888121B88
TABLE113   hex 0000000200010101
TABLE114   hex FFFFFF01FF010101
TABLE115   hex 0C00000C14000015
TABLE116   hex 0201012C011A1A2C
TABLE117   hex 04080B0E1114181C
TABLE118   hex 0004080B0E111418
TABLE119   hex 0117172F0117172F
TABLE120   hex 020202FF03FFFFFF
TABLE121   hex 7008087070E0E070
TABLE122   hex 0303020202020303
TABLE123   hex 00FFFF0000FFFF00 
TABLE124   hex 0101010101010101FFFFFFFF00FFFFFF0202020202020202FFFFFFFF00FFFFFF
TABLE125   hex 0303032B0219192B
TABLE126   hex 10090A0B0C0D0E0F10090A0B0C0D0E0FF8FFFEFDFCFBFAF9F8FFFEFDFCFBFAF9

*--- Different table in the two source codes

*TABLE127   hex 00F8F80000080800
TABLE127   hex 03F8F803FE0808FE

TABLE128   hex 030303FE04FEFEFE
TABLE129   hex 08090A0B03030303030303090A0B1112131919191919191911121314
TABLE130   hex 04040404111213141B1C1D2B2B2B0404041213141B1C1D1E2B2B2B2B
TABLE131   hex 0905052508161625

* We are at $7060

       *or $7060
       *ta $2060

VERT_FOOD_Z
       JMP VERT_FOOD
VERT_FOOD2_Z
       JMP VERT_FOOD2
UPDATE_VERT_DESTBYTS2_Z
       JMP UPDATE_VERT_DESTBYTS2
       hex FFFFFF

VERT_FOOD
       LDX FOODNUM   
       LDY TABLE122,X
       LDA TABLE105,X
       STA TEMP1
       LDA TABLE107,X

VERT_FOOD2
       STA TEMP2
       LDA BYTE3
       BMI :1
       RTS
:1     LDA TABLE106,X
       TAX
       LDA #$00
       STA TEMP3
:3     LDA DESTBYT1,X
       AND #$40
       STA ANTHOLD,Y
       BEQ :2
       INC TEMP3
:2     DEY
       DEX
       CPX TEMP1
       BNE :3
       LDY TEMP3
       CPY TEMP2
       BCS :4
       JSR UPDATE_HORIZ_ANTBYTS
       JSR PLOT_HORIZ_ANTS
       LDA BYTE3
       AND #$FD
       LDX FOODNUM
       STA FOODBYT3,X
       LSR
       BCC :5
       RTS
:5     JMP PLOT_FOOD_Z
:4     INC ORIENT
       LDA ORIENT
       LDX FOODNUM
       STA ANT_ORIENTATIONS,X
       LDA BYTE3
       AND #$84
       ORA #$02
       STA BYTE3
       STA FOODBYT3,X
       JSR ERASE_HORIZ_ANTS
       LDX ANTPOS
       DEX
       BPL :6
       LDX #$07
:6     STX ANTPOS
       LDY FOODNUM
       LDA ANTPOS
       STA ANTPOSITIONS,Y
       BEQ :7
       JSR PLOT_HORIZ_ANTS
       JSR UPDATE_HORIZ_ANTBYTS
       JMP PLOT_FOOD_Z
:7     JSR PUSH_FOOD_SOUND_Z
       JSR UPDATE_VERT_DESTBYTS 
       LDA FOODY
       CLC
       ADC TABLE114,X
       STA FOODY
       STA FOODBYT2,X
       CMP TABLE131,X
       BNE :14
       LDA #$86
       STA FOODBYT3,X
       LDA FOODY
:14    CLC
       ADC TABLE113,X
       STA TEMP4
       TAX
       LDY FOODX
       JSR CHKBLK_Z
       LDY FOODX
       INY
       LDX TEMP4
       JSR CHKBLK_Z
       LDY FOODX
       INY
       INY
       LDX TEMP4
       JSR CHKBLK_Z
       LDA FOODNUM
       CMP #$02
       BEQ :18
       CMP #$05
       BEQ :18
       LDY FOODX
       INY
       INY
       INY
       LDX TEMP4
       JSR CHKBLK_Z
:18    JSR MOVE_HORIZ_ANTS_BLOCKS
       JSR PLOT_FOOD_Z
       JSR UPDATE_HORIZ_ANTBYTS
       LDA FOODX
       STA TEMP3
       LDX FOODNUM
       LDA TABLE104,X
       STA WIDTH
       LDA FOODY
       CLC
       ADC TABLE120,X
       JSR ERASE_ROW
       JSR PLOT_HORIZ_ANTS
       LDX FOODNUM
       LDA TABLE116,X
       CMP FOODY
       BEQ :19
       RTS
:19    LDY TABLE118,X
       LDA TABLE117,X
       STA TEMP1
       LDA TABLE121,X
:20    STA DESTBYT2,Y
       INY
       CPY TEMP1
       BNE :20
       LDA #$00
       STA FOODBYT3,X
       LDY #$11
       JSR :21
       LDY #$1B
       JSR :21
       JMP SET_OFF_SCREEN_Z
:21    LDA #$04
       STA WIDTH
       LDA #$00
:22    STA L1AC0,Y
       STA L1AF0,Y
       STA L1F70,Y
       STA L1FA0,Y
       INY
       DEC WIDTH
       BNE :22
       RTS
       
UPDATE_HORIZ_ANTBYTS
       LDX FOODNUM
       LDA FOODY
       CLC
       ADC TABLE120,X
       STA TEMP4
       LDA TABLE122,X
       STA TEMP1
       CLC
       ADC FOODX
       STA TEMP2
:3     LDX TEMP1
       LDA ANTHOLD,X
       BEQ :1
       JSR :2
:1     DEC TEMP2
       DEC TEMP1
       LDA TEMP2
       CMP FOODX
       BCS :3
       RTS
:2     LDX TEMP4
       LDY TEMP2
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$1F
       TAY
       TXA
       ASL
       ASL
       ASL
       STA TEMP3
       LDX FOODNUM
       LDA ANTPOS
       CLC
       ADC TABLE132,X	; swapped 132/133 in latest source code
       TAX
       LDA TABLE133,X
       ADC TEMP3
       STA ANTBYT2,Y
       RTS

UPDATE_VERT_DESTBYTS
       LDX FOODNUM
       LDA TABLE127,X

UPDATE_VERT_DESTBYTS2
       STA TEMP1
       LDA TABLE122,X
       STA WIDTH
       LDY TABLE118,X
:6     JSR :5
       INY
       DEC WIDTH
       BPL :6
       RTS
:5     LDA DESTBYT2,Y
       CLC
       ADC TEMP1
       STA DESTBYT2,Y
       RTS

PLOT_HORIZ_ANTS
       LDA #$08
       STA POINTER1+1
       LDX FOODNUM
       LDA TABLE108,X
       STA POINTER1
       LDA ORIENT
       AND #$01
       BEQ :4
       LDA #$10
       CLC
       ADC POINTER1
       STA POINTER1
:4     LDA #$00
       CPX #$05
       BNE :1
       LDA #$04
:1     STA ANTXX
       LDA TABLE112,X
       STA ANTX
       LDA FOODY
       ASL
       ASL
       ASL
       STA TEMP1
       LDA ANTPOS
       CLC
       ADC TABLE109,X
       TAY
       LDA TABLE126,Y
       CLC
       ADC TEMP1
       STA ANTY
       LDY #$00
       STY TEMP4
       LDA TABLE104,X
       STA WIDTH
:3     LDY TEMP4
       LDA ANTHOLD,Y
       BEQ :2
       JSR PLOT_ANT4_Z 
:2     INC ANTX
       LDA ANTXX
       EOR #$04
       STA ANTXX
       INC TEMP4
       DEC WIDTH
       BNE :3
       RTS

MOVE_HORIZ_ANTS_BLOCKS
       LDX FOODNUM
       LDA FOODY
       CLC
       ADC TABLE128,X
       STA TEMP4
       LDA TABLE122,X
       STA TEMP1
       CLC
       ADC FOODX
       STA TEMP2
:3     LDX TEMP1
       LDA ANTHOLD,X
       BEQ :1
       JSR :4
       BNE :2
:1     JSR :5
:2     DEC TEMP2
       DEC TEMP1
       LDA TEMP2
       CMP FOODX
       BCS :3
       RTS
:5     LDX FOODNUM
       LDA TEMP4
       CLC
       ADC TABLE114,X
       TAX
       LDY TEMP2
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$C0
       STA (POINTER1),Y
       RTS
:4     LDY TEMP2
       LDX TEMP4
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$3F
       STA TEMP3
       LDA (POINTER1),Y
       AND #$C0
       STA (POINTER1),Y
       TXA
       LDX FOODNUM
       CLC
       ADC TABLE114,X
       TAX
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$C0
       ORA TEMP3
       STA (POINTER1),Y
       RTS

ERASE_HORIZ_ANTS
       LDX FOODNUM
       LDA #$00
       CPX #$05
       BNE :1
       LDA #$04
:1     STA ANTXXOLD
       LDA TABLE112,X
       STA ANTXOLD
       LDA FOODY
       ASL
       ASL
       ASL
       STA TEMP1
       LDA ANTPOS
       CLC
       ADC TABLE109,X
       TAY
       LDA TABLE126,Y
       CLC
       ADC TEMP1
       STA ANTYOLD
       STA TEMP4  
       LDY #$00
       STY TEMP1
       LDA TABLE104,X
       STA WIDTH
:3     LDY TEMP1
       LDA ANTHOLD,Y
       BEQ :2
       LDA TEMP4
       STA ANTYOLD
       JSR ERASE_ANT_Z
:2     INC ANTXOLD
       LDA ANTXXOLD
       EOR #$04
       STA ANTXXOLD
       INC TEMP1
       DEC WIDTH
       BNE :3
       RTS

* We are at $7340

       *or $7340
       *ta $1340

CARRY_FOOD_Z
       JMP CARRY_FOOD

CARRY_FOOD
       AND #$07
       TAX
       STA TEMP4
       LDA #$00
       STA SWAT
       LDA MANDIR
       CMP TABLE150A,X
       BEQ :1
       CMP TABLE150B,X
       BEQ :9
       CMP TABLE150C,X
       BEQ :9
       LDA #$00
       STA GRAB_FOOD
       STA BYFOOD
:9     RTS
:1     LDA TABLE151,X
       BPL :2
       CMP #$80
       BEQ :3
       LDA FOODBYT1,X
       CMP TABLE171,X
       BCC :9  
       LDA MANSTATE
       CMP #$06
       BNE :4
       LDA #$04
       STA MANSTATE
:4     LDA MANXX
       CMP #$02
       BEQ :5
       CMP #$05
       BEQ :5
:8     RTS
:2     JMP CARRY_VERT
:3     LDA FOODBYT1,X
       CMP TABLE171,X
       BCS :9 
       LDA MANSTATE
       CMP #$05
       BNE :4
       LDA #$02
       STA MANSTATE
       BNE :4
:5     LDA TABLE152,X
:7     STA HEIGHT
       LDA FOODBYT1,X
       STA FOODX
       CLC
       ADC TABLE155,X
       TAY
       LDA FOODBYT2,X
       STA FOODY
       TAX
       JSR CHECK_VERT_BLOCKS
       BNE :8
       LDX TEMP4
       LDA FOODX
       CMP TABLE156,X
       BEQ :6
       CLC
       ADC TABLE157,X
       STA FOODBYT1,X
       STA FOODX
       CLC
       ADC TABLE153,X
       TAY
       LDX TEMP4
       LDA TABLE152,X
       STA HEIGHT
       LDX FOODY
       JSR VACATE_COLUMN
       LDX TEMP4
       LDA FOODX
       CLC
       ADC TABLE153,X
       STA TEMP2
       LDA TABLE154,X
       STA HEIGHT
       LDA FOODY
       JSR ERASE_VERT_BLOCKS
       LDX TEMP4
       TXA
       ORA #$10
       STA TEMP4
       LDA TABLE152,X
       STA FOOD_HEIGHT
       LDA #$01
       STA WIDTH
       LDA FOODX
       PHA
       CLC
       ADC TABLE161,X
       STA FOODX
       JSR CHECK_ROWS
       PLA
       STA FOODX
       JSR PLOT_FOOD2_Z
       LDA FOODX
       ROR
       BCS :10
       LDA #$03
:12    STA ANTPOS
       STA ANTPOSITIONS,X
       LDA TABLE167,X
       JMP UPDATE_HORIZ_DESTBYTS2_Z
:10    LDA #$07
       BNE :12
:6     TAY
       LDX TEMP4
       LDA TABLE152,X
       STA HEIGHT
       STA TEMP1
       LDX FOODY
       JSR VACATE_COLUMN
       INY
       LDX FOODY
       LDA TEMP1
       STA HEIGHT
       JSR VACATE_COLUMN
       LDA TEMP4
       BEQ L7
       CMP #$07
       BEQ L7
       INY
       LDX FOODY
       LDA #$03
       STA HEIGHT
       JSR VACATE_COLUMN
L7     LDX TEMP4
       LDA TABLE154,X
       STA HEIGHT
       PHA
       LDA FOODX
       STA TEMP2
       LDA FOODY
       JSR ERASE_VERT_BLOCKS
       PLA
       STA HEIGHT
       PHA
       INC TEMP2
       LDA FOODY
       JSR ERASE_VERT_BLOCKS
       PLA
       LDX TEMP4
       BEQ :8
       CPX #$07
       BEQ :8
       STA HEIGHT
       INC TEMP2
       LDA FOODY
       JSR ERASE_VERT_BLOCKS
:8     LDA TABLE158,X
       STA FOODX
       STA FOODBYT1,X
       TXA
       ORA #$50
       STA TEMP4
       LDA TABLE160,X
       STA WIDTH
       LDA TABLE152,X
       STA FOOD_HEIGHT
       JSR CHECK_ROWS
       JSR PLOT_FOOD2_Z
       LDX TEMP4
       LDA #$81
       STA FOODBYT3,X
       LDA TABLE152,X
       STA HEIGHT
       LDY TABLE164,X
:13    LDA TABLE165,Y
       STA DESTBYT1,Y
       LDA TABLE166,Y
       STA DESTBYT2,Y
       INY
       DEC HEIGHT
       BNE :13
       LDA #$00
       STA GRAB_FOOD
       STA BYFOOD
       CPX #$03
       BNE :14
       STA ANTPOSITIONS,X
       RTS
:14    LDA #$04
       STA ANTPOSITIONS,X
       RTS

CHECK_ONE_ROW
       LDX FOODY
       LDY FOODX
       LDA AAMSBYT,X
       STA POINTER5+1   
       LDA AALSBYT,X
       STA POINTER5
       LDA (POINTER5),Y  
       AND #$3F
       STA TEMP3
       CMP #$20
       BCS :1
       CMP #$08
       BCS :2
:3     LDA TEMP4
       LDY FOODX
       STA (POINTER5),Y  
       INC FOODX
       DEC WIDTH
       BNE CHECK_ONE_ROW
       INC FOODY
       RTS
:1     LDA #$01
       JSR SCORE_Z
       JSR SWAT_ANT_SOUND_Z
       LDA TEMP3
       AND #$1F
       PHA
       TAY
       LDA ANTBYT1,Y
       AND #$3F
       STA ANTX
       STA ANTXOLD
       LDA ANTBYT2,Y
       STA ANTY
       STA ANTYOLD
       LDA ANTBYT3,Y
       STA ANTXX
       STA ANTXXOLD
       JSR ERASE_ANT_Z
       JSR VACATE_ANTS_BLOCKS_Z
       PLA
       TAY
       LDA #$00
       STA ANTBYT1,Y
       BEQ :3
:2     LDA #$02
       JSR SCORE_Z
       JSR SWAT_SPIDER_SOUND_Z
       LDA TEMP3
       AND #$07
       PHA
       JSR ERASE_WEB_Z
       PLA
       TAY
       LDA #$00
       STA SPIDERBYT4,Y
       BEQ :3

CHECK_VERT_BLOCKS
       STY TEMP3
:2     LDY TEMP3
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$3F
       BNE :1
:3     INX
       DEC HEIGHT
       BNE :2
       RTS
:1     CMP #$01
       BEQ NOT_LEGAL
       CMP #$20
       BCC :3
       AND #$1F
       TAY
       LDA ANTBYT4,Y  
       BPL :3
       RTS
       
CHECK_HORIZ_BLOCKS
       STX TEMP3
:2     LDX TEMP3
       LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$3F
       BNE :1
:3     INY
       DEC WIDTH
       BNE :2
       RTS
:1     CMP #$01
       BEQ NOT_LEGAL
       CMP #$20
       BCC :3
       AND #$1F
       TAX
       LDA ANTBYT4,X
       BPL :3
       RTS

NOT_LEGAL
       LDA #$FF
       RTS

VACATE_COLUMN
:1     LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$C0
       STA (POINTER1),Y
       INX
       DEC HEIGHT
       BNE :1
       RTS

SET_COLUMN
       LDA TEMP4
       ORA #$10
       STA TEMP1
:1     LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$C0
       ORA TEMP1
       STA (POINTER1),Y
       INX
       DEC HEIGHT
       BNE :1
       RTS

ERASE_VERT_BLOCKS
       LDY TEMP2
       CPY #$2C
       BCS :1
       CPY #$04
       BCC :1
       ASL
       ASL
       ASL
       STA TEMP3
       TYA
       LSR
       BCS :2
       LDA #$AA
       BNE :3
:2     LDA #$D5
:3     CPY #$05
       BCC :4
       CPY #$2B
       BEQ :4
       CPY #$0B
       BCC :5
       CPY #$25
       BCC :4
:5     AND #$7F
:4     STA TEMP1
:6     LDY TEMP3
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDY TEMP2
       LDA TEMP1
       STA (POINTER1),Y
       STA (POINTER4),Y
       INC TEMP3
       DEC HEIGHT
       BNE :6
:1     RTS

TABLE150A  hex D0CCCCC9D0B9B9C9
TABLE150B  hex B0BBBBCBB0B0B0CB
TABLE150C  hex BBCBCBB8BBB8B8B8
TABLE151   hex 8000009080010190
TABLE152   hex 0404030303030404
TABLE153   hex FFFFFF03FF020202
TABLE154   hex 2010101818101020
TABLE155   hex 020202FF03FFFFFF
TABLE156   hex 0905052508161625
TABLE157   hex 010101FF01FFFFFF
TABLE158   hex 0C0808210C131322
TABLE159   hex 0000000300000002
TABLE160   hex 0204030303030402
TABLE161   hex 0101010002000000
TABLE164   hex 0004080B0E111418
TABLE165   hex 8E8E8E8E919293949B9C9DA0A0A08F8F8F9293949B9C9D9EA1A1A1A1
TABLE166   hex 444C545C505450545054504C545C88909894909490949094889098A0  
TABLE167   hex 010808FF01F8F8FF
TABLE171   hex 0A06062509161625

VACATE_ROW
:1     LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$C0
       STA (POINTER1),Y
       INY
       DEC WIDTH
       BNE :1
       RTS

SET_ROW
       LDA TEMP4
       ORA #$10
       STA TEMP1
:1     LDA AAMSBYT,X
       STA POINTER1+1
       LDA AALSBYT,X
       STA POINTER1
       LDA (POINTER1),Y
       AND #$C0
       ORA TEMP1
       STA (POINTER1),Y
       INY
       DEC WIDTH
       BNE :1
       RTS

ERASE_HORIZ_BLOCKS
       TAY
       ASL
       ASL
       ASL
       STA TEMP3
       LDA FOODX
       LSR
       BCS :2
       LDA #$AA
       BNE :3
:2     LDA #$D5
:3     CPY #$04
       BCC :4
       CPY #$19
       BCS :4
       CPY #$07
       BCC :5
       CPY #$16
       BCC :4
:5     AND #$7F
:4     STA TEMP1
       LDA #$08
       STA HEIGHT
:1     LDY TEMP3
       LDA (SCRPNT1),Y
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       LDA (SCRPNT2),Y
       STA POINTER1
       STA POINTER4
       LDY FOODX
       LDA TEMP1
       STA (POINTER1),Y
       STA (POINTER4),Y
       INY
       EOR #$7F
       STA (POINTER1),Y
       STA (POINTER4),Y
       INY
       EOR #$7F
       STA (POINTER1),Y
       STA (POINTER4),Y
       LDX TEMP4
       CPX #$02
       BEQ :6
       CPX #$05
       BEQ :6
       INY
       EOR #$7F
       STA (POINTER1),Y
       STA (POINTER4),Y
:6     INC TEMP3
       DEC HEIGHT
       BNE :1
       RTS
       
CARRY_VERT
       BEQ :3
       LDA FOODBYT2,X
       CMP TABLE171,X
       BCC :8
       LDA MANSTATE
       CMP #$0B
       BNE :4
       LDA #$02
       STA MANSTATE
:4     LDA MANY
       AND #$07
       BEQ :5
       CMP #$04
       BEQ :5
:8     RTS
:3     LDA FOODBYT2,X
       CMP TABLE171,X
       BCS :8
       LDA MANSTATE
       CMP #$0C
       BNE :4
       LDA #$04
       STA MANSTATE
       BNE :4
:5     LDA TABLE152,X
       STA WIDTH
       LDA FOODBYT1,X
       STA FOODX
       TAY
       LDA FOODBYT2,X
       STA FOODY
       CLC
       ADC TABLE155,X
       TAX
       JSR CHECK_HORIZ_BLOCKS
       BNE :8
       LDX TEMP4
       LDA TABLE152,X
       STA WIDTH
       LDA FOODY
       CMP TABLE156,X
       BEQ :6
       CLC
       ADC TABLE157,X
       STA FOODBYT2,X
       STA FOODY
       CLC
       ADC TABLE153,X
       TAX
       LDY FOODX
       JSR VACATE_ROW
       LDX TEMP4
       LDA FOODY
       CLC
       ADC TABLE153,X
       JSR ERASE_HORIZ_BLOCKS
       LDX TEMP4
       TXA
       ORA #$10
       STA TEMP4
       LDA TABLE152,X
       STA WIDTH
       LDA FOODX
       PHA
       LDA FOODY
       PHA
       CLC
       ADC TABLE161,X
       STA FOODY
       JSR CHECK_ONE_ROW
       PLA
       STA FOODY
       PLA
       STA FOODX
       LDA TEMP4
       AND #$07
       STA TEMP4
       TAX
       JSR PLOT_FOOD2_Z
       LDA TABLE167,X
       JMP UPDATE_VERT_DESTBYTS2_Z
:6     LDA TABLE152,X
       STA WIDTH
       STA TEMP1
       LDX FOODY
       LDY FOODX
       JSR VACATE_ROW
       INX
       LDY FOODX
       LDA TEMP1
       STA WIDTH
       JSR VACATE_ROW
       LDA FOODY
       JSR ERASE_HORIZ_BLOCKS
       LDY FOODY
       INY
       TYA
       JSR ERASE_HORIZ_BLOCKS
       LDX TEMP4
       LDA TABLE158,X
       STA FOODY
       STA FOODBYT2,X
       LDA TABLE160,X
       STA WIDTH
       PHA
       LDA FOODX
       PHA
       LDA TEMP4
       ORA #$50
       STA TEMP4
       JSR CHECK_ONE_ROW
       PLA
       STA FOODX
       PLA
       STA WIDTH
       LDA FOODX
       PHA
       JSR CHECK_ONE_ROW
       PLA
       STA FOODX
       DEC FOODY
       LDA TEMP4
       AND #$07
       STA TEMP4
       TAX
       LDA TABLE158,X
       STA FOODY
       JSR PLOT_FOOD2_Z
       LDA #$81
       STA FOODBYT3,X
       LDA TABLE152,X
       STA WIDTH
       LDY TABLE164,X
:13    LDA TABLE165,Y
       STA DESTBYT1,Y
       LDA TABLE166,Y
       STA DESTBYT2,Y
       INY
       DEC WIDTH
       BNE :13
       LDA #$00
       STA GRAB_FOOD
       STA BYFOOD
       STA ANTPOSITIONS,X
       RTS

CHECK_ROWS
       LDA FOODX
       PHA
       LDA WIDTH
       PHA
       JSR CHECK_ONE_ROW
       PLA
       STA WIDTH
       PLA
       STA FOODX
       PHA
       LDA WIDTH
       PHA
       DEC FOOD_HEIGHT
       JSR CHECK_ONE_ROW
       PLA
       STA WIDTH
       PLA
       STA FOODX
       DEC FOOD_HEIGHT
       BEQ :9
       PHA
       LDA WIDTH
       PHA
       JSR CHECK_ONE_ROW
       PLA
       STA WIDTH
       PLA
       STA FOODX
       DEC FOOD_HEIGHT
       BEQ :9
       PHA
       JSR CHECK_ONE_ROW
       PLA
       STA FOODX
:9     LDA TEMP4
       AND #$07
       STA TEMP4
       TAX
       LDA FOODBYT2,X
       STA FOODY
       RTS

* We are at $78FB (the init code)

       *or $78FB
       *ta $28FB

MASTER
       LDA #$01
       STA ROUND
       STA NO_OF_PLAYERS
       LDY #$00
       STY HISCOREHI
       STY HISCORELO

MASTER_PATCH		; that JSR is patched
       JSR SETUP

M1_2   JSR SELECT2 
       JSR C4_Z
       LDA #$00
       STA $90
       STA $91
       STA $92
       STA $93
       STA PLAYERNUM
       STA SET_CAN1
       STA SET_CAN2
       LDY #$08       
       STY NO_OF_FOODS1     
       STY NO_OF_FOODS2  
       LDY #$40  
       STY TEMP1   
       LDX #>LA000	; from $2000 to $a000
       LDY #>L2000
       JSR MOVE_MEMORY

M2_2   LDA LORES
:3     LDA KBDSTROBE
       LDA #$20
       STA TEMP5
:4     JSR PLOT_LORES_NUMS
       LDA KBD
       BPL :2
       SEC
       SBC #$B0
       BEQ :2
       CMP #$06
       BCS :2
       STA ROUND
       JMP :3
:2     LDA #$03
       JSR DAZZLE
       DEC TEMP5
       BNE :4
       JSR INITIALIZE_1
       JSR DRAW_SCREEN
       JSR PLOT_HISCORE
       LDA HIRES
       LDA TXTPAGE1
       LDA #$40
       STA TEMP1
       LDA #$00
       STA CAN_KEY_PRESSED
       LDX #>L8000	; from $2000 to $8000
       LDY #>L2000
:25    JSR MOVE_MEMORY  
:12    LDX ROUND
       LDA TABLE412,X
       JSR DELAY_Z
       JSR MOVE_4_ANTS_Z
       LDA KBD
       AND #$7F
       CMP #$52
       BNE :30
       JMP ($28)
:30    JSR MAN_MASTER_Z
       JSR SPIDER_MASTER_Z
       JSR WASP_MASTER_Z
       JSR MASTER_FOOD_Z
       LDA CAN_KEY_PRESSED
       BNE :21
:22    LDX PLAYERNUM
       LDA $7D0
       BNE :25
       LDA NO_OF_FOODS1,X
       BEQ :14
       DEC K7
       BNE :12
       LDA INIT_K7
       STA K7
       SED
       LDA SECONDS
       SEC
       SBC #$01
       STA SECONDS
       CLD
       BPL :13
       LDA #$59
       STA SECONDS
       DEC MINUTES
       BMI :11
:13    JSR PLOT_CLOCK
       BMI :12
:11    JSR POINTS_FOR_FOOD
       LDA ALL_FOOD_OFF
       BEQ :14
       LDY NO_OF_PLAYERS   
       CPY #$02
       BEQ :15
:17    INC ROUND
       LDA ROUND
       CMP #$0A
       BCC :16
       DEC ROUND
:16    JSR DELAY_Z
       JMP M2_2
:21    LDA #$00
       STA CAN_KEY_PRESSED
       LDX PLAYERNUM
       LDY SET_CAN1,X   
       BEQ :22
       STA SET_CAN1,X
       LDA #$01
       JSR STING_MAN_Z
       JSR INITIALIZE_2
       JSR CAN_MASTER_Z
       JMP :22
:15    LDA PLAYERNUM
       BEQ :18
       LDA NO_OF_FOODS1
       BEQ :17
       LDA #$00
       STA PLAYERNUM
       BEQ :17  
:18    LDA NO_OF_FOODS2
       BEQ :17
       STY PLAYERNUM
       BNE :16
:14    LDX PLAYERNUM
       LDA #$00
       STA NO_OF_FOODS1,X
       LDA $91,X
       CMP HISCOREHI
       BCC :23
       BNE :24
       LDA $90,X
       CMP HISCORELO
       BCC :23
:24    LDA $90,X
       STA HISCORELO
       LDA $91,X
       STA HISCOREHI
       JSR PLOT_HISCORE
:23    JSR THE_END_Z
       LDA NO_OF_PLAYERS
       CMP #$02
       BNE :19
       LDA PLAYERNUM
       EOR #$02
       STA PLAYERNUM
       TAX
       LDA NO_OF_FOODS1,X
       BEQ :19
       TXA
       NOP
       NOP
       BEQ :17
       BNE :16
:19    LDA KBDSTROBE
:20    LDA KBD
       BPL :20

RESTART
       LDA TXTCLR
       LDA HIRES
       LDA #$C0
       STA TEMP1
       LDA #<L2000	; move $A000 to $2000
       LDY #>LA000
       LDX #>L2000
       JSR MOVE_MEMORY
       LDA #$01
       STA ROUND 
       JMP M1_2

TABLE412   hex 00090807060504030201

INITIALIZE_1
       LDA #>L1A90
       STA L1+2
       STA L2+2
       LDA #<L1A90
       STA L1+1
       STA L2+1
L1     LDA L1A90
       AND #$40
L2     STA L1A90
       INC L1+1
       INC L2+1
       BNE L1
       INC L1+2
       INC L2+2
       LDA L1+2
       CMP #$20
       BNE L1
       LDX ROUND
       LDA TABLE400,X
       STA K1
       STA INIT_K1
       LDA TABLE401,X
       STA K2
       STA INIT_K2
       LDA TABLE402,X
       STA K3
       STA INIT_K3
       LDA TABLE403,X
       STA K4
       STA INIT_K4
       LDA TABLE404,X
       STA WASP_CHANCE
       LDA TABLE405,X
       STA K5
       STA INIT_K5
       LDA TABLE406,X
       STA K6
       STA INIT_K6
       LDA TABLE408,X
       STA K8
       STA INIT_K8
       LDA TABLE407,X
       STA K7
       STA INIT_K7
       LDX #$07
:3     LDA TABLE409,X
       STA FOODBYT1,X
       LDA TABLE410,X
       STA FOODBYT2,X
       LDA TABLE411,X
       STA ANTPOSITIONS,X
       LDA #$00
       STA ANT_ORIENTATIONS,X
       DEX
       BPL :3
       LDY #$BF
       BNE INITIALIZE_3

INITIALIZE_2
       LDY #$7F

INITIALIZE_3
       LDA #$20
       STA ANTNUM
       LDA #$00
:1     STA ANTBYT1,Y
       DEY
       BNE :1
       STA ANTBYT1
       LDA #$80
       STA SWATLEGAL
       STA WASPSTATE
       LDA #$16
       STA MANX
       STA MANXOLD
       LDA #$02
       STA MANXX
       STA MANXXOLD
       LDA #$6C
       STA MANY
       STA MANYOLD
       LDA #$01
       STA MANSTATE
       STA NEXTSTATE
       LDA #$D0
       STA MANDIR
       LDA #$00
       STA PARALYZE
       STA SWAT
       STA GRAB_FOOD
       STA BYFOOD
       STA FOODNUM
       LDX #$1F
:2     STA SPIDERBYT1,X
       DEX
       BPL :2
       LDA #$04
       STA WASP_SPLAT_COUNT
       RTS

TABLE400   hex 00010101010101010101
TABLE401   hex 00B0AAA49E98928C8680 
TABLE402   hex 00030303030303030303
TABLE403   hex 00040404030303030303 
TABLE404   hex 00010203040405050506
TABLE405   hex 002C2824201C1814100C
TABLE406   hex 00100F0E0D0C0B0A0908
TABLE407   hex 004F4C49484746454543
TABLE408   hex 00040403030302020202  
TABLE409   hex 0C111B210C121B22
TABLE410   hex 0808080911131311
TABLE411   hex 0400000004000004

DRAW_GREEN
       LDA #$1C
       STA TEMP1
:2     LDY TEMP1
       LDA (SCRPNT1),Y
       STA POINTER2+1
       LDA (SCRPNT2),Y
       STA POINTER2
       LDY #$04
:1     LDA #$2A
       STA (POINTER2),Y
       INY
       LDA #$55
       STA (POINTER2),Y
       INY
       CPY #$2C
       BCC :1
       INC TEMP1
       LDA TEMP1
       CMP #$CC
       BCC :2
       RTS

DRAW_SCREEN
       JSR DRAW_GREEN
       LDY #$1C
       JSR D1
       LDY #$C8
       JSR D1
       LDY #$20
       JSR D2
       LDY #$80
       JSR D2
       LDA #>L6570
       STA POINTER2+1
       LDA #<L6570
       STA POINTER2
       LDX #$38
       JSR D3
       LDX #$80 
       JSR D3
       LDA #$56
       STA POINTER2
       LDX #$3A
       JSR D3
       LDX #$82
       JSR D3
       JSR DRAW_LETTERS
       LDA PLAYERNUM
       PHA
       LDA #$00
       STA PLAYERNUM
       JSR SCORE_Z
       LDA NO_OF_PLAYERS
       CMP #$01
       BEQ :8
       STA PLAYERNUM
       LDA #$00
       JSR SCORE_Z
:8     PLA
       STA PLAYERNUM
       LDA #$02
       STA MINUTES
       LDA #$00
       STA SECONDS
       JSR PLOT_CLOCK
       LDX PLAYERNUM
       LDY NO_OF_FOODS1,X
       LDA TABLE330,Y
       STA TEMP1
       JSR RANDOM1_Z
       AND #$07
       TAY
       LDA TEMP1
:4     LSR
       BCC :3
       ORA #$80
:3     DEY
       BNE :4
       STA TEMP5
       LDX #$07
:6     LSR TEMP5
       BCC :5
       LDA TABLE409,X
       STA FOODX
       LDA TABLE410,X
       STA FOODY
       JSR PLOT_FOOD2_Z
       TXA
       ORA #$50
       STA TEMP1
       JSR SET_FOOD_STATUS
       JSR SET_DESTBYTS
       LDA #$81
:7     STA FOODBYT3,X
       DEX
       BPL :6
       RTS
:5     LDA #$00
       BEQ :7

SET_DESTBYTS
       LDY TABLE351,X
       LDA TABLE352,X
       STA HEIGHT
:1     LDA TABLE353,Y
       STA DESTBYT1,Y
       LDA TABLE354,Y
       STA DESTBYT2,Y
       INY
       DEC HEIGHT
       BNE :1
       RTS

TABLE351   hex 0004080B0E111418
TABLE352   hex 0404030303030404
TABLE353   hex 8E8E8E8E919293949B9C9DA0A0A08F8F8F9293949B9C9D9EA1A1A1A1
TABLE354   hex 444C545C505450545054504C545C88909894909490949094889098A0
TABLE330   hex 00048892AAABBBBFFF

D3     JSR :3
       INX
:3     STX TEMP2
       LDA #$0C
       STA HEIGHT
:1     LDA #$00
       STA PATINDEX
       LDY TEMP2
       LDA (SCRPNT1),Y
       STA POINTER1+1
       LDA (SCRPNT2),Y
       STA POINTER1
       LDA #$0B
       STA TEMP1
:2     LDY PATINDEX
       LDA (POINTER2),Y
       LDY TEMP1
       STA (POINTER1),Y
       INC PATINDEX
       INY
       STY TEMP1
       CPY #$25
       BCC :2
       LDA TEMP2
       CLC
       ADC #$04
       STA TEMP2
       DEC HEIGHT
       BNE :1
       RTS

PLOT_CLOCK
       LDA #>L658A
       STA POINTER2+1
       LDX MINUTES
       LDA #$12
       LDY TABLE301A,X
       JSR :1
       LDA SECONDS
       AND #$0F
       TAX
       LDA #$15
       LDY TABLE301A,X
       JSR :1
       LDA SECONDS
       LSR
       LSR
       LSR
       LSR
       TAX
       LDA #$14
       LDY TABLE301A,X
:1     STA TEMP1
       STY POINTER2
       LDA #$38
       STA POINTER1+1
       LDA #>L9800
       STA POINTER4+1
       LDA #<L9800
       STA POINTER1
       STA POINTER4
       LDA #$06
       STA HEIGHT
:2     LDY HEIGHT
       LDA (POINTER2),Y
       LDY TEMP1
       STA (POINTER1),Y
       STA (POINTER4),Y
       LDA POINTER1+1
       SEC
       SBC #$04
       STA POINTER1+1
       CLC
       ADC #$60
       STA POINTER4+1
       DEC HEIGHT
       BPL :2
       RTS

TABLE301A  dfb <L65C9,<L658A,<L6591,<L6598,<L659F,<L65A6,<L65AD,<L65B4,<L65BB,<L65C2

PLOT_LORES_NUMS
       LDY #$00
       STY TEMP3
       LDA PLAYERNUM
       BNE :3
       LDX #$08
       BNE :4
:3     LDX #$10
:4     JSR :2
       LDY #$07
       STY TEMP3
       LDA ROUND
       ASL
       ASL
       ASL
       TAX
:2     LDA #$07
       STA HEIGHT
:1     LDY TEMP3
       LDA TABLE310,Y
       STA POINTER1+1
       LDA TABLE311,Y
       STA POINTER1
       LDY #$23
       LDA TABLE312,X
       STA TEMP2
       LDA #$00
       ASL TEMP2
       ROR
       STA (POINTER1),Y
       INY
       ASL TEMP2
       LDA #$00
       ROR
       STA (POINTER1),Y
       INY
       ASL TEMP2
       LDA #$00
       ROR
       STA (POINTER1),Y
       INY
       ASL TEMP2
       LDA #$00
       ROR
       STA (POINTER1),Y
       INC TEMP3
       INX
       DEC HEIGHT
       BNE :1
       RTS

*--- Pointers to the GR screen

TABLE310   hex 0606070704040507040405050606
TABLE311   hex 0080008028A828A850D050D050D0
TABLE312   hex 000000000000000060E060606060F00060F0103060C0F000F01010701010F00080809090F0101000F08080F01010F000F08080F09090F000F0103060C0808000F09090F09090F000F090F01010101000  

D1     
       STY TEMP1
       LDA #$04
       STA HEIGHT
:5     LDY TEMP1
       LDA (SCRPNT1),Y
       STA POINTER2+1
       LDA (SCRPNT2),Y
       STA POINTER2
       LDY #$04
:3     LDA (POINTER2),Y
       ORA #$80
       STA (POINTER2),Y
       INY
       CPY #$16
       BCC :3
       LDY #$1A
:4     LDA (POINTER2),Y
       ORA #$80
       STA (POINTER2),Y
       INY
       CPY #$2C
       BCC :4
       INC TEMP1
       DEC HEIGHT
       BNE :5
       RTS
D2
       STY TEMP1
       LDA #$48
       STA HEIGHT
:1     LDY TEMP1
       LDA (SCRPNT1),Y
       STA POINTER2+1
       LDA (SCRPNT2),Y
       STA POINTER2
       LDY #$04
       LDA (POINTER2),Y
       ORA #$80
       STA (POINTER2),Y
       LDY #$2B
       LDA (POINTER2),Y
       ORA #$80
       STA (POINTER2),Y
       INC TEMP1
       DEC HEIGHT
       BNE :1
       RTS

DRAW_LETTERS
       LDA #$07
       STA HEIGHT
       LDA #$3C
       STA POINTER1+1
       LDA #$00
       STA POINTER1
:8     LDY #$00
       TYA
:7     STA (POINTER1),Y
:9     INY
       CPY #$10
       BEQ :9
       CPY #$17
       BEQ :9
       CPY #$28
       BCC :7
       LDA POINTER1+1
       SEC
       SBC #$04
       STA POINTER1+1
       DEC HEIGHT
       BPL :8
       LDA #$06
       STA HEIGHT
       LDA #$38
       STA POINTER1+1
       LDX #$00 
       STX POINTER1    
:3     LDY #$00
:1     LDA TABLE390,X
       STA (POINTER1),Y
       INX
       INY
       CPY #$09
       BCC :1
       LDY #$0E
       LDA TABLE390,X
       STA (POINTER1),Y
       INX
       LDY #$13
:2     LDA TABLE390,X
       STA (POINTER1),Y
       INX
       LDA NO_OF_PLAYERS
       CMP #$02
       BEQ :5
       TXA
       CLC
       ADC #$0A
       TAX
       BNE :6
:5     LDA #$06
       STA $3C1D
       LDY #$19
:4     LDA TABLE390,X
       STA (POINTER1),Y
       INX
       INY
       CPY #$22
       BCC :4
       LDY #$27
       LDA TABLE390,X
       STA (POINTER1),Y
       INX
:6     LDA POINTER1+1   
       SEC
       SBC #$04
       STA POINTER1+1
       DEC HEIGHT
       BPL :3
       LDA #$0C
       STA $3C04
       LDA #$18
       STA $3C13
       RTS

TABLE390   hex 301E0F7E4C6740610F0C66184F073F66336070070C306073190C1843010333181870790C064C61300033
           hex 70614C1933664C010333007830664C19336640013330664C1933667C010333001833664C19337E000633
           hex 3C660C0633180C000333181E330643190C0600063330660C000000006003336618330600000000300633
           hex 7001030000000000030C187840010000000040010C

*
* MOVE_MEMORY
*  A: low pointer
*  Y: high pointer source
*  X: high pointer destination
*

MOVE_MEMORY
       STA L3+1
       STA L4+1
       STY L3+2
       STX L4+2
L3     LDA L2000
L4     STA L4000
       INC L3+1
       INC L4+1
       BNE L3
       INC L3+2
       INC L4+2
       LDA L3+2
       CMP TEMP1
       BNE L3
       RTS

* End of code - We must be close to $7FFF
