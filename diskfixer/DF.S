*
* DISK FIXER
*
* SOURCE CODE LOGO 2007
*

              MX    %11
              ORG   $800
              TYP   BIN
              DSK   DF
              LST   OFF

*
*
*

L0200         =     $0200
L02FE         =     $02FE
L02FF         =     $02FF
L0300         =     $0300          ; FOR NEW COMMAND Execute

SOFTEV        EQU   $03F2
PWREDUP       EQU   $03F4
USRADR        EQU   $03F8

L0400         =     $0400
L040C         =     $040C
L040D         =     $040D
L040E         =     $040E
L0480         =     $0480
L04BD         =     $04BD
L0500         =     $0500
L0580         =     $0580
L05D0         =     $05D0
L0600         =     $0600
L0650         =     $0650
L0680         =     $0680
L0700         =     $0700
L0750         =     $0750
L0780         =     $0780
L07D0         =     $07D0
L07E1         =     $07E1

TXT_BUFFER    =     $0657
TXT_SLOT      =     $065F
TXT_DRIVE     =     $0667
TXT_MASK      =     $066F
TXT_MODE      =     $0672
TXT_ORDER     =     $0676

L6000         =     $6000
L8000         =     $8000
L8A00         =     $8A00
L8B00         =     $8B00
L8C00         =     $8C00
L8D00         =     $8D00
L8E00         =     $8E00
L8F00         =     $8F00
L9000         =     $9000
L9100         =     $9100
L9200         =     $9200
L9300         =     $9300

MLI           =     $BF00

KBD           EQU   $C000
KBDSTROBE     EQU   $C010
SPKR          EQU   $C030
HOME          EQU   $FC58
WAIT          EQU   $FCA8
COUT1         EQU   $FDF0
OLDRST        EQU   $FF59

*
*
*

L0800         JMP   L139B
L0803         JMP   L14A9
L0806         JMP   L0CD4
L0809         JMP   L0836
L080C         JMP   L084B
L080F         JMP   L0D2E
L0812         JMP   L0F98
L0815         JMP   L0FCA
L0818         JMP   L1063
L081B         JMP   L1058
L081E         JMP   L103C
L0821         JMP   L103E
L0824         JMP   L12BC
L0827         JMP   L0DA3
L082A         JMP   L0FE5
L082D         JMP   L3533
L0830         JMP   L1325

L0833         JSR   L0CDC
L0836         LDX   #$27
              LDA   #$A0
L083A         STA   L07D0,X
              DEX
              BNE   L083A
              LDX   #$0A
L0842         LDA   L0D98,X
              STA   L07D0,X
              DEX
              BPL   L0842
L084B         LDA   #$20
              STA   $26
L084F         DEC   $27
              BNE   L0862
              DEC   $26
              BNE   L0862
              LDA   $07DA
              EOR   #$7F
              STA   $07DA
              JMP   L084B

L0862         LDA   KBD
              BPL   L084F
              BIT   KBDSTROBE
              CMP   #$E0
              BCC   L0871
              SEC
              SBC   #$20
L0871         CMP   #$C9
              BNE   L0891
              JSR   L0F98
              LDA   $E4
              BNE   L0884
              LDA   $E6
              SEC
              SBC   #$08
              JMP   L0889

L0884         LDA   $E6
              SEC
              SBC   #$10
L0889         STA   $E6
              JSR   L0FCA
              JMP   L084B

L0891         CMP   #$CD
              BNE   L08B1
              JSR   L0F98
              LDA   $E4
              BNE   L08A4
              LDA   $E6
              CLC
              ADC   #$08
              JMP   L08A9

L08A4         LDA   $E6
              CLC
              ADC   #$10
L08A9         STA   $E6
              JSR   L0FCA
              JMP   L084B

L08B1         CMP   #$CA
              BNE   L08C0
              JSR   L0F98
              DEC   $E6
              JSR   L0FCA
              JMP   L084B

L08C0         CMP   #$CB
              BNE   L08CF
              JSR   L0F98
              INC   $E6
              JSR   L0FCA
              JMP   L084B

L08CF         CMP   #$C1
              BNE   L08EA
              LDA   $E4
              BMI   L08E4
              JSR   L0F7C
              LDA   #$FF
              STA   $E4
              JSR   L0EA4
              JSR   L0FE5
L08E4         JSR   L0FCA
              JMP   L084B

L08EA         CMP   #$C2
              BNE   L0905
              LDA   $E4
              BEQ   L08FF
              JSR   L0F7C
              LDA   #$00
              STA   $E4
              JSR   L0E16
              JSR   L0FE5
L08FF         JSR   L0FCA
              JMP   L084B

L0905         CMP   #$C8
              BNE   L0922
              LDA   $E4
              BEQ   L090F
              BPL   L091C
L090F         JSR   L0F7C
              LDA   #$01
              STA   $E4
              JSR   L0EFD
              JSR   L0FE5
L091C         JSR   L0FCA
              JMP   L084B

L0922         CMP   #$D5
              BNE   L0933
              JSR   L0F98
              LDA   $E5
              STA   $E6
              JSR   L0FCA
              JMP   L084B

L0933         CMP   #$CE
              BNE   L094D
              LDA   $E0
              BNE   L093D
              LDA   #$FF
L093D         EOR   $E0
              STA   $E0
              JSR   L0FE5
              JSR   L082D
              JSR   L0FCA
              JMP   L084B

L094D         CMP   #$D3
              BEQ   L0954
              JMP   L0A0F

L0954         LDA   #$A0
              STA   $07DA
              LDA   TXT_SLOT
              EOR   #$DF
              STA   $E2
L0960         LDA   #$20
              STA   $26
L0964         DEC   $27
              BNE   L0976
              DEC   $26
              BNE   L0976
              LDA   TXT_SLOT
              EOR   $E2
              STA   TXT_SLOT
              BNE   L0960
L0976         LDA   KBD
              BPL   L0964
              BIT   KBDSTROBE
              CMP   #$8D
              BNE   L098D
              LDA   TXT_SLOT
              CMP   #$DF
              BNE   L09A7
              EOR   $E2
              BNE   L09A7
L098D         CMP   #$9B
              BNE   L0997
              JSR   L0DA3
              JMP   L084B

L0997         CMP   #$B1
              BCC   L099F
              CMP   #$B8
              BCC   L09A7
L099F         LDA   #$87
              JSR   L1DD0
              JMP   L0960

L09A7         STA   TXT_SLOT
              LDA   TXT_DRIVE
              EOR   #$DF
              STA   $E2
L09B1         LDA   #$20
              STA   $26
L09B5         DEC   $27
              BNE   L09C7
              DEC   $26
              BNE   L09C7
              LDA   TXT_DRIVE
              EOR   $E2
              STA   TXT_DRIVE
              BNE   L09B1
L09C7         LDA   KBD
              BPL   L09B5
              BIT   KBDSTROBE
              CMP   #$8D
              BNE   L09DE
              LDA   TXT_DRIVE
              CMP   #$DF
              BNE   L09F8
              EOR   $E2
              BNE   L09F8
L09DE         CMP   #$9B
              BNE   L09E8
              JSR   L0DA3
              JMP   L084B

L09E8         CMP   #$B1
              BEQ   L09F8
              CMP   #$B2
              BEQ   L09F8
              LDA   #$87
              JSR   L1DD0
              JMP   L09B1

L09F8         STA   TXT_DRIVE
              AND   #$03
              STA   RWTS_DRIVE
              LDA   TXT_SLOT
              AND   #$07
              ASL
              ASL
              ASL
              ASL
              STA   RWTS_SLOT
              JMP   L084B

L0A0F         CMP   #$D4
              BNE   L0A39
              LDA   $E8
              BPL   L0A25
              LDA   #$3F
              STA   $E8
              LDA   #$00
              STA   $E9
L0A1F         JSR   L0DA3
              JMP   L084B

L0A25         LDA   $E9
              BNE   L0A2F
              LDA   #$40
              STA   $E9
              BNE   L0A1F
L0A2F         LDA   #$00
              STA   $E9
              LDA   #$FF
              STA   $E8
              BNE   L0A1F
L0A39         CMP   #$83
              BNE   L0A55

              LDA   $E8
              BPL   L0A4B
              LDA   $E9
              BEQ   L0A4B
              LDA   #$00
              STA   $E9
              BEQ   L0A1F
L0A4B         LDA   #$FF
              STA   $E8
              LDA   #$20
              STA   $E9
              BNE   L0A1F

*
* SET BUFFER
*

L0A55         CMP   #$B1           ; 0..9 SET BUFFER ADDRESS
              BCC   L0A6A
              CMP   #$B3
              BCS   L0A6A

              dec   $ef
              cmp   #$b1           ; if 1, the buffer is already <
              beq   L0A56

              inc   $ef            ; otherwise if 2, > it twice
              inc   $ef

L0A56         jsr   printBUFFER

              JSR   L0D2E
              JMP   L084B

*
* Z : CANCEL ALL MODIFICATIONS
*

L0A6A         CMP   #$DA
              BNE   L0A7E

              LDY   #$00
L0A70         LDA   L8A00,Y
              STA   ($EE),Y
              INY
              BNE   L0A70
              JSR   L0D2E
              JMP   L084B

*
* / : FILL BUFFER
*

L0A7E         CMP   #$BD
              BNE   L0AD7

              LDX   #$12
L0A84         LDA   L0AC4,X
              STA   L07D0,X
              DEX
              BPL   L0A84
L0A8D         LDA   #$20
              STA   $26
L0A91         DEC   $27
              BNE   L0AA3
              DEC   $26
              BNE   L0AA3
              LDA   $07E2
              EOR   #$7F
              STA   $07E2
              BNE   L0A8D
L0AA3         LDA   KBD
              BPL   L0A91
              BIT   KBDSTROBE
              CMP   #$D9
              BEQ   L0AB3
              CMP   #$F9
              BNE   L0AC1
L0AB3         LDY   $E6
              LDA   ($EE),Y
L0AB7         STA   ($EE),Y
              INY
              CPY   $E5
              BNE   L0AB7
              JSR   L0D2E
L0AC1         JMP   L0836

L0AC4         ASC   "FILL BUFFER (Y/N):_"

L0AD7         CMP   #$BC
              BNE   L0AF1
              LDY   $E6
L0ADD         INY
              CPY   $E5
              BEQ   L0AEB
              LDA   ($EE),Y
              DEY
              STA   ($EE),Y
              INY
              JMP   L0ADD

L0AEB         JSR   L0D2E
              JMP   L084B

L0AF1         CMP   #$BE
              BNE   L0B0B
              LDY   $E5
L0AF7         DEY
              CPY   $E6
              BEQ   L0B05
              DEY
              LDA   ($EE),Y
              INY
              STA   ($EE),Y
              JMP   L0AF7

L0B05         JSR   L0D2E
              JMP   L084B

L0B0B         CMP   #$AD
              BNE   L0B3D
              LDY   $E6
              LDA   L8A00,Y
              STA   ($EE),Y
              LDA   $E4
              BNE   L0B20
              JSR   L128D
              JMP   L0B32

L0B20         BPL   L0B32
              LDA   ($EE),Y
              LDY   $24
              ORA   $EA
              BPL   L0B30
              CMP   #$A0
              BCS   L0B30
              LDA   #$AE
L0B30         STA   ($28),Y
L0B32         JSR   L0F98
              INC   $E6
              JSR   L0FCA
              JMP   L084B

L0B3D         CMP   #$93
              BNE   L0BA4
              LDX   #$0E
L0B43         LDA   L0B95,X
              STA   L07D0,X
              DEX
              BPL   L0B43
              LDA   $EB
              AND   #$07
              ORA   #$B0
              EOR   #$DF
              STA   $E2
L0B56         LDA   #$20
              STA   $26
L0B5A         DEC   $27
              BNE   L0B6C
              DEC   $26
              BNE   L0B6C
              LDA   $07DE
              EOR   $E2
              STA   $07DE
              BNE   L0B56
L0B6C         LDA   KBD
              BPL   L0B5A
              BIT   KBDSTROBE
              CMP   #$8D
              BEQ   L0B92
              CMP   #$9B
              BEQ   L0B92
              CMP   #$B1
              BCC   L0B84
              CMP   #$B8
              BCC   L0B8C
L0B84         LDA   #$87
              JSR   L1DD0
              JMP   L0B56

L0B8C         AND   #$07
              ORA   #$C0
              STA   $EB
L0B92         JMP   L0836

L0B95         ASC   "PRINTER SLOT #_"

*
* CTRL-Q : PRODOS QUIT
*

L0BA4         CMP   #$91
              BNE   L0BAA

              JSR   MLI
              DFB   $65
              DA    QUIT
              JMP   OLDRST

QUIT          dfb   $04
              dfb   $00
              dw    $0
              dfb   $0
              dw    $0

*
* Q : QUIT TO MONITOR
*

L0BAA         CMP   #$D1
              BNE   L0BDC
              JSR   HOME
              LDA   #$8D
              JSR   COUT1
              LDX   #$17
L0BB8         LDA   L0BC4,X
              STA   $0750,X
              DEX
              BPL   L0BB8
              JMP   OLDRST

L0BC4         ASC   "TYPE '800G' TO CONTINUE."

*
* RETURN
*

L0BDC         CMP   #$8D
              BNE   L0BE9
              JSR   L10BA
              JSR   L0FCA
              JMP   L084B

L0BE9         CMP   #$D9
              BNE   L0C03
              LDA   $EA
              BNE   L0BF3
              LDA   #$80
L0BF3         EOR   $EA
              STA   $EA
              LDA   $E4
              BEQ   L0BFD
              BPL   L0C00
L0BFD         JSR   L0D2E
L0C00         JMP   L084B

L0C03         CMP   #$D0
              BNE   L0C21
              JSR   L0F98
              LDA   #$01
              JSR   L103C
              LDY   #$25
              JSR   L12BC
              BCS   L0C18
              STA   $E6
L0C18         JSR   L0FE5
              JSR   L0FCA
              JMP   L084B

L0C21         CMP   #$AE
              BNE   L0C42
              JSR   L0F98
              LDA   #$03
              JSR   L103C
              LDY   #$00
              JSR   L12BC
              BCS   L0C39
              STA   $E5
              JSR   L0D2E
L0C39         JSR   L0FE5
              JSR   L0FCA
              JMP   L084B

L0C42         CMP   #$AC
              BNE   L0C5D
              LDA   $E5
              BEQ   L0C5A
              JSR   L0F98
              LDA   #$00
              STA   $E5
              JSR   L0FE5
              JSR   L0D2E
              JSR   L0FCA
L0C5A         JMP   L084B

L0C5D         CMP   #$90
              BNE   L0C9F
              LDA   $EB
              STA   L0C9C+2
              JSR   L0F98
              LDA   #$03
              JSR   L103C
L0C6E         LDY   #$00
L0C70         STY   $24
              LDA   ($28),Y
              ORA   #$80
              CMP   #$A0
              BCS   L0C7C
              ORA   #$40
L0C7C         JSR   L0C9C
              LDY   $24
              INY
              CPY   #$28
              BNE   L0C70
              LDA   #$8D
              JSR   L0C9C
              INC   $25
              JSR   L103E
              LDA   $25
              CMP   #$13
              BNE   L0C6E
              JSR   L0FCA
              JMP   L084B
L0C9C         JMP   $C100

L0C9F         CMP   #$89
              BNE   L0CD1
              JSR   L0F98
              LDA   $E4
              BNE   L0CBA
              LDA   $E6
              CLC
              ADC   #$08
              AND   #$F8
              STA   $00
              LDA   $E5
              AND   #$07
              JMP   L0CC7

L0CBA         LDA   $E6
              CLC
              ADC   #$10
              AND   #$F0
              STA   $00
              LDA   $E5
              AND   #$0F
L0CC7         ORA   $00
              STA   $E6
              JSR   L0FCA
              JMP   L084B
L0CD1         JMP   L0803

L0CD4         LDA   #$87
              JSR   L1DD0
              JMP   L084B

L0CDC         LDX   #$77
              LDA   #$A0
L0CE0         STA   L0400,X
              STA   L0480,X
              STA   L0500,X
              STA   L0580,X
              STA   L0600,X
              STA   L0680,X
              STA   L0700,X
              STA   L0780,X
              DEX
              BPL   L0CE0
              LDX   #$27
L0CFD         LDA   #$AD
              STA   L0400,X
              STA   L0500,X
              STA   L05D0,X
              STA   L0750,X
              LDA   L0D3D,X
              STA   L0480,X
              LDA   L0D65,X
              STA   L0650,X
              DEX
              BPL   L0CFD
              LDX   #$0A
L0D1C         LDA   L0D8D,X
              STA   L040E,X
              DEX
              BPL   L0D1C
              JSR   L0FE5
              JSR   L0DA3
              JSR   L082D
L0D2E         LDA   $E4
              BNE   L0D35
              JMP   L0E16

L0D35         BMI   L0D3A
              JMP   L0EFD
L0D3A         JMP   L0EA4

L0D3D         ASC   "TRACK    /SECTOR    /VOLUME    /BYTE    "
L0D65         ASC   "BUFFER   /SLOT  /DRIVE  /MASK O  /   /A/"
L0D8D         ASC   " DISK EDIT "
L0D98         ASC   "COMMAND : _"
              MX    %11

printHEXA     ora   #$b0
              cmp   #$ba
              bcc   printHEXA1
              adc   #$06
printHEXA1    rts

printBUFFER   lda   $ef
              pha
              and   #$F0
              lsr
              lsr
              lsr
              lsr
              jsr   printHEXA
              sta   TXT_BUFFER

              pla
              and   #$0F
              jsr   printHEXA
              sta   TXT_BUFFER+1
              rts

*
*
*

L0DA3         jsr   printBUFFER

              LDA   RWTS_SLOT
              LSR
              LSR
              LSR
              LSR
              ORA   #$B0
              STA   TXT_SLOT

              LDA   RWTS_DRIVE
              ORA   #$B0
              STA   TXT_DRIVE

              LDA   $E7
              BNE   L0DCD
              LDA   #$C6           ; F
              STA   TXT_MASK
              STA   TXT_MASK+1
              JMP   L0DD7

L0DCD         LDA   #$CE           ; N
              STA   TXT_MASK
              LDA   #$A0
              STA   TXT_MASK+1

L0DD7         LDX   #$02
              LDA   $E8
              BPL   L0DE5
              LDA   $E9
              BEQ   L0DED
              LDX   #$0B
              BNE   L0DED
L0DE5         LDX   #$05
              LDA   $E9
              BEQ   L0DED
              LDX   #$08
L0DED         LDY   #$02
L0DEF         LDA   L0DFA,X
              STA   TXT_MODE,Y
              DEX
              DEY
              BPL   L0DEF

* READ/WRITE ORDER

              LDA   RW_ORDER
              STA   TXT_ORDER

              RTS

L0DFA         ASC   "NOR"
              ASC   "INV"
              ASC   "FLA"
              ASC   "LOW"

L0E16         LDA   $E5
              STA   $00
              LDA   #$03
              JSR   L103C
L0E1F         LDA   #$05
              STA   $24
              LDA   #$20
              STA   $1F
L0E27         LDY   $00
              LDA   ($EE),Y
              CMP   L8A00,Y
              BNE   L0E38
              LDY   $24
              JSR   L1063
              JMP   L0E3D

L0E38         LDY   $24
              JSR   L107B
L0E3D         INY
              STY   $24
              LDY   $00
              LDA   ($EE),Y
              ORA   $EA
              BPL   L0E4E
              CMP   #$A0
              BCS   L0E4E
              LDA   #$AE
L0E4E         LDY   $1F
              STA   ($28),Y
              INC   $00
              INY
              STY   $1F
              CPY   #$28
              BNE   L0E27
              INC   $25
              JSR   L103E
              LDA   $25
              CMP   #$13
              BNE   L0E1F
L0E66         LDA   $E6
              SEC
              SBC   $E5
              ORA   #$00
              BPL   L0E7B
              LDA   $E5
              EOR   #$80
              STA   $E5
              JSR   L0FE5
              JMP   L0E16

L0E7B         PHA
              LSR
              LSR
              LSR
              CLC
              ADC   #$03
              JSR   L103C
              PLA
              AND   #$07
              TAX
              LDA   L0E9C,X
              STA   $24
              TAY
              DEY
              LDA   #$7E
              STA   ($28),Y
              INY
              INY
              INY
              LDA   #$7C
              STA   ($28),Y
              RTS

L0E9C         HEX   05080B0E1114171A
L0EA4         LDA   $E5
              STA   $00
              LDA   #$03
              JSR   L103C
L0EAD         LDA   #$07
              STA   $24
L0EB1         LDY   $00
              LDA   ($EE),Y
              ORA   $EA
              BPL   L0EBF
              CMP   #$A0
              BCS   L0EBF
              LDA   #$AE
L0EBF         LDY   $24
              STA   ($28),Y
              INC   $00
              INY
              INY
              STY   $24
              CPY   #$27
              BNE   L0EB1
              INC   $25
              JSR   L103E
              LDA   $25
              CMP   #$13
              BNE   L0EAD
L0ED8         LDA   $E6
              SEC
              SBC   $E5
              PHA
              LSR
              LSR
              LSR
              LSR
              CLC
              ADC   #$03
              JSR   L103C
              PLA
              AND   #$0F
              ASL
              ADC   #$07
              STA   $24
              TAY
              DEY
              LDA   #$7E
              STA   ($28),Y
              INY
              INY
              LDA   #$7C
              STA   ($28),Y
              RTS

L0EFD         LDA   $E5
              STA   $00
              LDA   #$03
              JSR   L103C
L0F06         LDA   #$05
              STA   $24
L0F0A         LDY   $00
              LDA   ($EE),Y
              CMP   L8A00,Y
              BNE   L0F1B
              LDY   $24
              JSR   L1063
              JMP   L0F20

L0F1B         LDY   $24
              JSR   L107B
L0F20         CPY   #$0D
              BEQ   L0F2C
              CPY   #$16
              BEQ   L0F2C
              CPY   #$1F
              BNE   L0F2D
L0F2C         INY
L0F2D         STY   $24
              INC   $00
              CPY   #$28
              BNE   L0F0A
              INC   $25
              JSR   L103E
              LDA   $25
              CMP   #$13
              BNE   L0F06
L0F40         LDA   $E6
              SEC
              SBC   $E5
              PHA
              LSR
              LSR
              LSR
              LSR
              CLC
              ADC   #$03
              JSR   L103C
              PLA
              AND   #$0F
              TAX
              LDA   L0F6C,X
              STA   $24
              TAY
              LDA   ($28),Y
              AND   #$3F
              ORA   #$40
              STA   ($28),Y
              INY
              LDA   ($28),Y
              AND   #$3F
              ORA   #$40
              STA   ($28),Y
              RTS

L0F6C         HEX   0507090B0E10121417191B1D20222426
L0F7C         LDA   #$03
              JSR   L103C
L0F81         LDY   #$27
              LDA   #$A0
L0F85         STA   ($28),Y
              DEY
              CPY   #$03
              BNE   L0F85
              INC   $25
              JSR   L103E
              LDA   $25
              CMP   #$13
              BNE   L0F81
              RTS

L0F98         LDA   $E4
              BNE   L0FA9
              LDY   $24
              DEY
              LDA   #$A0
              STA   ($28),Y
              INY
              INY
              INY
              STA   ($28),Y
              RTS

L0FA9         BPL   L0FB7
              LDY   $24
              DEY
              LDA   #$A0
              STA   ($28),Y
              INY
              INY
              STA   ($28),Y
              RTS

L0FB7         LDY   $E6
              LDA   ($EE),Y
              CMP   L8A00,Y
              BNE   L0FC5
              LDY   $24
              JMP   L1063

L0FC5         LDY   $24
              JMP   L107B

L0FCA         LDA   #$01
              JSR   L103C
              LDY   #$25
              LDA   $E6
              JSR   L1058
              LDA   $E4
              BNE   L0FDD
              JMP   L0E66

L0FDD         BMI   L0FE2
              JMP   L0F40
L0FE2         JMP   L0ED8

L0FE5         LDA   #$01
              JSR   L103C
              LDY   #$06
              LDA   RWTS_TRACK
              JSR   L1058
              LDY   #$11
              LDA   RWTS_SECTOR
              JSR   L1058
              LDY   #$1C
              LDA   RWTS_OVOLUME
              JSR   L1058
              LDY   #$25
              LDA   $E6
              JSR   L1058
              LDA   #$03
              JSR   L103C
              LDA   $E5
              STA   $00
L1012         LDY   #$00
              LDA   $00
              JSR   L1058
              LDA   #$BA
              STA   ($28),Y
              LDA   $E4
              BNE   L1029
              LDA   $00
              CLC
              ADC   #$08
              JMP   L102E

L1029         LDA   $00
              CLC
              ADC   #$10
L102E         STA   $00
              INC   $25
              JSR   L103E
              LDA   $25
              CMP   #$13
              BNE   L1012
              RTS

L103C         STA   $25
L103E         LDA   $25
              PHA
              LSR
              AND   #$03
              ORA   #$04
              STA   $29
              PLA
              AND   #$18
              BCC   L104F
              ORA   #$80
L104F         STA   $28
              ASL
              ASL
              ORA   $28
              STA   $28
              RTS

L1058         PHA
              LDA   $E0
              BNE   L1093
              LDA   #$A4
              STA   ($28),Y
              INY
              PLA
L1063         PHA
              LSR
              LSR
              LSR
              LSR
              JSR   L106C
              PLA
L106C         AND   #$0F
              ORA   #$B0
              CMP   #$BA
              BCC   L1077
              CLC
              ADC   #$07
L1077         STA   ($28),Y
              INY
              RTS

L107B         PHA
              LSR
              LSR
              LSR
              LSR
              JSR   L1084
              PLA
L1084         AND   #$0F
              ORA   #$30
              CMP   #$3A
              BCC   L108F
              CLC
              ADC   #$C7
L108F         STA   ($28),Y
              INY
              RTS

L1093         PLA
              LDX   #$AF
              SEC
L1097         INX
              SBC   #$64
              BCS   L1097
              ADC   #$64
              PHA
              TXA
              STA   ($28),Y
              INY
              PLA
              LDX   #$AF
              SEC
L10A7         INX
              SBC   #$0A
              BCS   L10A7
              ADC   #$0A
              ORA   #$B0
              PHA
              TXA
              STA   ($28),Y
              INY
              PLA
              STA   ($28),Y
              INY
              RTS

L10BA         LDA   $E4
              BEQ   L10C1
              JMP   L1150

L10C1         LDY   $E6
              LDA   ($EE),Y
              LDY   $24
              JSR   L1063
              LDY   $24
              JSR   L1325
              BMI   L10FE
              ASL
              ASL
              ASL
              ASL
              STA   $00
              INY
              JSR   L1325
              BMI   L10F1
              ORA   $00
L10DF         LDY   $E6
              STA   ($EE),Y
              JSR   L128D
              JSR   L0F98
              INC   $E6
              JSR   L0FCA
              JMP   L10C1

L10F1         CMP   #$8D
              BNE   L10FE
              LDA   $00
              LSR
              LSR
              LSR
              LSR
              JMP   L10DF

L10FE         PHA
              JSR   L128D
              PLA
              CMP   #$9B
              BNE   L1108
              RTS

L1108         CMP   #$8D
              BNE   L110E
              LDA   #$95
L110E         CMP   #$88
              BNE   L111D
              JSR   L0F98
              DEC   $E6
              JSR   L0FCA
              JMP   L10C1

L111D         CMP   #$95
              BNE   L112C
              JSR   L0F98
              INC   $E6
              JSR   L0FCA
              JMP   L10C1

L112C         CMP   #$8A
              BNE   L1140
              JSR   L0F98
              LDA   $E6
              CLC
              ADC   #$08
              STA   $E6
              JSR   L0FCA
              JMP   L10C1

L1140         JSR   L0F98
              LDA   $E6
              SEC
              SBC   #$08
              STA   $E6
              JSR   L0FCA
              JMP   L10C1

L1150         BPL   L1155
              JMP   L11D5

L1155         LDY   $E6
              LDA   ($EE),Y
              LDY   $24
              JSR   L1063
              LDY   $24
              JSR   L1325
              BMI   L118F
              ASL
              ASL
              ASL
              ASL
              STA   $00
              INY
              JSR   L1325
              BMI   L1182
              ORA   $00
L1173         LDY   $E6
              STA   ($EE),Y
              JSR   L0F98
              INC   $E6
              JSR   L0FCA
              JMP   L1155

L1182         CMP   #$8D
              BNE   L118F
              LDA   $00
              LSR
              LSR
              LSR
              LSR
              JMP   L1173

L118F         PHA
              JSR   L0F98
              PLA
              CMP   #$9B
              BNE   L1199
              RTS

L1199         CMP   #$8D
              BNE   L119F
              LDA   #$95
L119F         CMP   #$88
              BNE   L11AB
              DEC   $E6
              JSR   L0FCA
              JMP   L1155

L11AB         CMP   #$95
              BNE   L11B7
              INC   $E6
              JSR   L0FCA
              JMP   L1155

L11B7         CMP   #$8A
              BNE   L11C8
              LDA   $E6
              CLC
              ADC   #$10
              STA   $E6
              JSR   L0FCA
              JMP   L1155

L11C8         LDA   $E6
              SEC
              SBC   #$10
              STA   $E6
              JSR   L0FCA
              JMP   L1155

L11D5         LDY   $24
              LDA   ($28),Y
              EOR   #$DF
              STA   $E2
L11DD         LDA   #$20
              STA   $26
L11E1         DEC   $27
              BNE   L11F2
              DEC   $26
              BNE   L11F2
              LDA   ($28),Y
              EOR   $E2
              STA   ($28),Y
              JMP   L11DD

L11F2         LDA   KBD
              BPL   L11E1
              BIT   KBDSTROBE
              CMP   #$9B
              BNE   L1201
              JMP   L127A

L1201         CMP   #$8D
              BNE   L1207
              LDA   #$95
L1207         CMP   #$88
              BNE   L1219
              JSR   L0F98
              JSR   L127A
              DEC   $E6
              JSR   L0FCA
              JMP   L11D5

L1219         CMP   #$95
              BNE   L122B
              JSR   L0F98
              JSR   L127A
              INC   $E6
              JSR   L0FCA
              JMP   L11D5

L122B         CMP   #$8A
              BNE   L1242
              JSR   L0F98
              JSR   L127A
              LDA   $E6
              CLC
              ADC   #$10
              STA   $E6
              JSR   L0FCA
              JMP   L11D5

L1242         CMP   #$8B
              BNE   L1259
              JSR   L0F98
              JSR   L127A
              LDA   $E6
              SEC
              SBC   #$10
              STA   $E6
              JSR   L0FCA
              JMP   L11D5

L1259         AND   $E8
              BMI   L1262
              ORA   $E9
              JMP   L1268

L1262         CMP   #$C0
              BCC   L1268
              ORA   $E9
L1268         LDY   $E6
              STA   ($EE),Y
              JSR   L127A
              JSR   L0F98
              INC   $E6
              JSR   L0FCA
              JMP   L11D5

L127A         LDY   $E6
              LDA   ($EE),Y
              ORA   $EA
              BPL   L1288
              CMP   #$A0
              BCS   L1288
              LDA   #$AE
L1288         LDY   $24
              STA   ($28),Y
              RTS

L128D         LDY   $E6
              LDA   ($EE),Y
              PHA
              CMP   L8A00,Y
              BNE   L129F
              LDY   $24
              JSR   L1063
              JMP   L12A4

L129F         LDY   $24
              JSR   L107B
L12A4         LDY   #$1E
              LDA   $24
              SEC
L12A9         INY
              SBC   #$03
              BCS   L12A9
              PLA
              ORA   $EA
              BPL   L12B9
              CMP   #$A0
              BCS   L12B9
              LDA   #$AE
L12B9         STA   ($28),Y
              RTS

L12BC         LDA   $E0
              BNE   L12DA
              INY
              JSR   L1325
              BPL   L12C8
              SEC
              RTS

L12C8         ASL
              ASL
              ASL
              ASL
              STA   $00
              INY
              JSR   L1325
              BPL   L12D6
              SEC
              RTS

L12D6         ORA   $00
              CLC
              RTS

L12DA         JSR   L1310
              BPL   L12E1
              SEC
              RTS

L12E1         BEQ   L12EC
              TAX
              LDA   #$00
L12E6         CLC
              ADC   #$64
              DEX
              BNE   L12E6
L12EC         STA   $00
              INY
              JSR   L1310
              BPL   L12F6
              SEC
              RTS

L12F6         BEQ   L1303
              TAX
              LDA   $00
L12FB         CLC
              ADC   #$0A
              DEX
              BNE   L12FB
              STA   $00
L1303         INY
              JSR   L1310
              BPL   L130B
              SEC
              RTS

L130B         CLC
              ADC   $00
              CLC
              RTS

L1310         JSR   L1325
              BPL   L1316
              RTS

L1316         CMP   #$0A
              BCC   L1322
              LDA   #$87
              JSR   L1DD0
              JMP   L1310

L1322         ORA   #$00
              RTS

L1325         LDA   ($28),Y
              STA   $E1
              EOR   #$DF
              STA   $E2
              LDA   #$DF
              STA   ($28),Y
L1331         LDA   #$20
              STA   $26
L1335         DEC   $27
              BNE   L1346
              DEC   $26
              BNE   L1346
              LDA   ($28),Y
              EOR   $E2
              STA   ($28),Y
              JMP   L1331

L1346         LDA   KBD
              BPL   L1335
              BIT   KBDSTROBE
              CMP   #$9B
              BEQ   L1392
              CMP   #$8D
              BEQ   L1392
              CMP   #$88
              BEQ   L1392
              CMP   #$95
              BEQ   L1392
              CMP   #$8A
              BEQ   L1392
              CMP   #$8B
              BEQ   L1392
              CMP   #$B0
              BCC   L138A
              CMP   #$BA
              BCS   L1373
              STA   ($28),Y
              AND   #$0F
              RTS

L1373         CMP   #$E1
              BCC   L137A
              SEC
              SBC   #$20
L137A         CMP   #$C1
              BCC   L138A
              CMP   #$C7
              BCS   L138A
              STA   ($28),Y
              SEC
              SBC   #$B7
              AND   #$0F
              RTS

L138A         LDA   #$87
              JSR   L1DD0
              JMP   L1331

L1392         PHA
              LDA   $E1
              STA   ($28),Y
              PLA
              ORA   #$00
              RTS

L139B         LDA   #<L0833
              STA   L0800+1
              LDA   #>L0833
              STA   L0800+2

              LDA   #$60           ; FOR NEW COMMAND Execute
              STA   L0300

              JSR   HOME
              LDA   #$00
              STA   $E0
              STA   $E3
              STA   $E4
              STA   $E5
              STA   $E6
              STA   $E7
              STA   $E9
              STA   $EA
              STA   $EE
              STA   $EC
              STA   $ED
              STA   RWTS_TRACK
              STA   RWTS_SECTOR
              STA   RWTS_OVOLUME
              STA   $00
              STA   $F2
              STA   $F3
              STA   $F4
              LDA   #$FF
              STA   $E8
              STA   $F5
              LDA   #>L8000
              STA   $EF
              STA   $01
              LDA   #$C1
              STA   $EB
              LDY   #$00
L13E3         TYA
L13E4         STA   ($00),Y
              INY
              BNE   L13E4
              INC   $01
              LDA   $01
              CMP   #>L8C00
              BNE   L13E3
              BIT   KBDSTROBE
              LDX   #$00
L13F6         LDA   L1410,X
              NOP
              NOP
              BEQ   L1403
              JSR   COUT1
              INX
              BNE   L13F6
L1403         LDX   #$01
L1405         LDA   #$00
              JSR   WAIT
              DEX
              BPL   L1405
              JMP   L1480

L1410         ASC   8D8D8D8D8D8D8D8D8D8D
              ASC   "             DiskFixer V4.1"8D8D
              ASC   "            L-Booted by LoGo       "8D8D8D8D
              ASC   8D8D
              ASC   "                               "00

L1480         LDA   #<L0800
              STA   SOFTEV
              STA   USRADR+1
              LDA   #>L0800
              STA   SOFTEV+1
              STA   USRADR+2
              EOR   #$A5
              STA   PWREDUP
              LDA   #$4C
              STA   USRADR
              JMP   L0800

              DB    $FF
              DB    $00
              DB    $00

L14A0         JMP   L2DF9
L14A3         JMP   L3530
L14A6         JMP   L1862

RW_ORDER      ASC   "A"
RW_INCREMENT  DB    $01
RW_PAGES      DB    $10

*
* CTRL-O : CHANGE READ/WRITE ORDER
*

L14A9         CMP   #$8F           ; CTRL-O / CHANGE RW ORDER
              BNE   L14AA

              LDX   #$C4           ; Descending
              LDA   RW_ORDER
              CMP   #$C1
              BEQ   L14A91
              LDX   #$C1           ; Ascending
L14A91        STX   RW_ORDER

              JSR   L0827
              JMP   L0809

*
*
*

CTRLRW        LDX   #$01           ; ADD 1
              LDY   #$00           ; FIRST SECTOR
              LDA   RW_ORDER
              CMP   #$C1
              BEQ   CTRLRW1
              LDX   #$FF           ; ADD -1
              LDY   #$0F           ; FIRST SECTOR

CTRLRW1       STX   RW_INCREMENT
              STY   RWTS_SECTOR
              RTS

*
* CTRL-R : READ A TRACK
*

L14AA         CMP   #$92           ; CTRL-R / READ
              BEQ   CTRLR
              JMP   L14AB

CTRLR         LDA   #$01
              STA   RWTS_COMMAND
              BNE   CTRLRWNOW

*
* CTRL-W : WRITE A TRACK
*

L14AB         CMP   #$97           ; CTRL-W / WRITE A TRACK
              BEQ   CTRLW
              JMP   L14AC

CTRLW         LDA   #$02
              STA   RWTS_COMMAND

*

CTRLRWNOW     JSR   CTRLRW

              LDA   #$10
              STA   RW_PAGES

              LDA   #0
              STA   RWTS_BUFFER

]LP           LDA   $EF            ; SET BUFFER ADDRESS
              STA   RWTS_BUFFER+1

              LDA   #>RWTS
              LDY   #<RWTS
              JSR   RWTS_ENTRY     ; READ/WRITE
              BCS   CTRLRWERR

              INC   $EF            ; NEXT BUFFER PAGE

              LDA   RWTS_SECTOR    ; NEXT SECTOR +/-
              CLC
              ADC   RW_INCREMENT
              STA   RWTS_SECTOR

              DEC   RW_PAGES       ; LOOP
              LDA   RW_PAGES
              BNE   ]LP
              BEQ   CTRLRWEXIT

CTRLRWERR     LDA   #$87
              JSR   L1DD0

CTRLRWEXIT    JSR   CTRLRW
              INC   RWTS_TRACK
              JMP   L0800

*
* R : READ A SECTOR
*

L14AC         CMP   #$D2           ; READ COMMAND
              BNE   L14B5
              LDA   #$01
              STA   RWTS_COMMAND
              JMP   L1739

*
* W : WRITE A SECTOR
*

L14B5         CMP   #$D7           ; WRITE COMMAND
              BNE   L14C1
              LDA   #$02
              STA   RWTS_COMMAND
              JMP   L1739

L14C1         CMP   #$88           ; LEFT ARROW
              BNE   L14CA
              LDA   #$FF
              JMP   L180A

L14CA         CMP   #$95           ; RIGHT ARROW
              BNE   L14D3
              LDA   #$01
              JMP   L180A

L14D3         CMP   #$8B           ; UP ARROW
              BNE   L14DC
              LDA   #$F0
              JMP   L180A

L14DC         CMP   #$8A           ; DOWN ARROW
              BNE   L14E5
              LDA   #$10
              JMP   L180A

L14E5         CMP   #$D8           ; X
              BNE   L1534
              JSR   L0812
              JSR   L195F
              LDY   #$0E
              JSR   L0824
              BCC   L14FC
              CMP   #$9B
              BEQ   L152E
              LDA   $F2
L14FC         STA   $F2
              JSR   L195F
              LDY   #$16
              JSR   L0824
              BCC   L150E
              CMP   #$9B
              BEQ   L152E
              LDA   $F3
L150E         STA   $F3
              JSR   L195F
              LDY   #$1E
              JSR   L0824
              BCC   L1520
              CMP   #$9B
              BEQ   L152E
              LDA   $F5
L1520         STA   $F5
              JSR   L195F
              LDY   #$25
              JSR   L0824
              BCS   L152E
              STA   $F4
L152E         JSR   L0815
              JMP   L0809

L1534         CMP   #$94
              BNE   L155F
              LDA   $E7
              BNE   L1546
              LDA   #$FF
              STA   $E7
              JSR   L1923
              JMP   L154D

L1546         LDA   #$00
              STA   $E7
              JSR   L1945
L154D         JSR   L0812
              JSR   L0827
              JSR   L080F
              JSR   L0815
              JMP   L080C

              JSR   L0815
L155F         CMP   #$C3
              BEQ   L1566
              JMP   L1634

L1566         LDX   #$27
L1568         LDA   L160C,X
              STA   L07D0,X
              DEX
              BPL   L1568
              LDA   TXT_SLOT
              STA   $07E5
              LDA   TXT_DRIVE
              EOR   #$03
              STA   $07ED
L157F         LDA   #$20
              STA   $26
L1583         DEC   $27
              BNE   L1595
              DEC   $26
              BNE   L1595
              LDA   $07F7
              EOR   #$7F
              STA   $07F7
              BNE   L157F
L1595         LDA   KBD
              BPL   L1583
              BIT   KBDSTROBE
              PHA
              LDX   #$27
              LDA   #$A0
L15A2         STA   L07D0,X
              DEX
              BPL   L15A2
              PLA
              CMP   #$F9
              BNE   L15AF
              LDA   #$D9
L15AF         CMP   #$D9
              BEQ   L15B6
              JMP   L0809

L15B6         LDA   #$02
              STA   RWTS_COMMAND
              LDA   #$00
              STA   RWTS_VOLUME
              STA   RWTS_BUFFER
              LDA   $EF
              STA   RWTS_BUFFER+1
              LDA   RWTS_DRIVE
              EOR   #$03
              STA   RWTS_DRIVE
              LDA   #>RWTS
              LDY   #<RWTS
              JSR   RWTS_ENTRY
              BCC   L15EC
              LDX   #$11
L15DB         LDA   L15FA,X
              STA   L07D0,X
              DEX
              BPL   L15DB
L15E4         LDA   KBD
              BPL   L15E4
              BIT   KBDSTROBE
L15EC         JSR   L082A
              LDA   RWTS_DRIVE
              EOR   #$03
              STA   RWTS_DRIVE
              JMP   L0809

L15FA         ASC   "CAN'T COPY SECTOR!"
L160C         ASC   "CONFIRM COPY TO SLOT X/DRIVE X (Y/N) : _"

*
* E : EXECUTE CODE AT $0300
*

L1634         CMP   #$E5
              BEQ   L1635

              CMP   #$C5           ; E
              BNE   L1636

L1635         JSR   L0300          ; execute code

              LDA   #$87           ; beep
              JSR   L1DD0
              BIT   KBDSTROBE      ; reset kbd
              JMP   L0809          ; loop

*
* CTRL-F : ERASE/FORMAT
*

L1636         CMP   #$86           ; WAS E = $C5
              BEQ   L163B
              JMP   L16D8

L163B         LDX   #$25
L163D         LDA   L16B2,X
              STA   L07D0,X
              DEX
              BPL   L163D
              JSR   L0812
              LDA   #$17
              JSR   L081E
              LDA   LBEFD+1
              LDY   #$07
              JSR   L081B
              LDA   RWTS_OVOLUME
              LDY   #$23
              JSR   L081B
              LDY   #$23
              JSR   L0824
              BCC   L166C
              CMP   #>L8D00
              BNE   L169A
              LDA   RWTS_OVOLUME
L166C         STA   RWTS_VOLUME
              LDA   #$04
              STA   RWTS_COMMAND
              LDA   #>RWTS
              LDY   #<RWTS
              JSR   RWTS_ENTRY
              BCC   L169A
              LDX   #$27
              LDA   #$A0
L1681         STA   L07D0,X
              DEX
              BPL   L1681
              LDX   #$11
L1689         LDA   L16A0,X
              STA   L07D0,X
              DEX
              BPL   L1689
L1692         LDA   KBD
              BPL   L1692
              BIT   KBDSTROBE
L169A         JSR   L082A
              JMP   L0809

L16A0         ASC   "CAN'T FORMAT DISK!"
L16B2         ASC   "FORMAT $XX TRACKS WITH DISK VOLUME $XX"

*
* F : FIND
*

L16D8         CMP   #$C6
              BNE   L16E2
              JSR   L19EF
              JMP   L0800

*
* ? : HELP
*

L16E2         CMP   #$BF
              BNE   L1700

              LDA   #>L1E00
              JSR   L1703
              CMP   #$BF
              BNE   L16FD
              LDA   #>L2200
              JSR   L1703
              CMP   #$BF
              BNE   L16FD
              LDA   #>L2600
              JSR   L1703
L16FD         JMP   L0800

L1700         JMP   L14A0

L1703         STA   $01
              LDA   #$00
              STA   $00
              STA   $02
              LDA   #$04
              STA   $03
L170F         LDY   #$77
L1711         LDA   ($00),Y
              STA   ($02),Y
              DEY
              BPL   L1711
              LDA   $00
              EOR   #$80
              STA   $00
              LDA   $02
              EOR   #$80
              STA   $02
              BMI   L170F
              INC   $01
              INC   $03
              LDA   $03
              CMP   #$08
              BNE   L170F
L1730         LDA   KBD
              BPL   L1730
              BIT   KBDSTROBE
              RTS

*
*
*

L1739         JSR   L0812
              LDA   #$01
              JSR   L081E
L1741         LDY   #$06
              JSR   L0824
              BCC   L1796
              CMP   #$8D
              BNE   L178D
              LDA   $E0
              BNE   L1763
              CPY   #$07
              BNE   L175A
              LDA   RWTS_TRACK
              JMP   L1796

L175A         LDA   $00
              LSR
              LSR
              LSR
              LSR
              JMP   L1796

L1763         CPY   #$06
              BNE   L176D
              LDA   RWTS_TRACK
              JMP   L1796

L176D         CPY   #$07
              BNE   L177F
              LDY   #$FF
              LDA   $00
              SEC
L1776         INY
              SBC   #$64
              BCS   L1776
              TYA
              JMP   L1796

L177F         LDY   #$FF
              LDA   $00
              SEC
L1784         INY
              SBC   #$0A
              BCS   L1784
              TYA
              JMP   L1796

L178D         JSR   L082A
              JSR   L0815
              JMP   L080C

*
*
*

L1796         CMP   LBEFD+1        ; END OF DISK ?
              BCC   L17A3
              LDA   #$87
              JSR   L1DD0
              JMP   L1741

L17A3         STA   $DF
              LDY   #$06
              JSR   L081B
L17AA         LDY   #$11
              JSR   L0824
              BCC   L17F3
              CMP   #$8D
              BNE   L178D
              LDA   $E0
              BNE   L17CC
              CPY   #$12
              BNE   L17C3
              LDA   RWTS_SECTOR
              JMP   L17F3

L17C3         LDA   $00
              LSR
              LSR
              LSR
              LSR
              JMP   L17F3

L17CC         CPY   #$11
              BNE   L17D6
              LDA   RWTS_SECTOR
              JMP   L17F3

L17D6         CPY   #$12
              BNE   L17E8
              LDY   #$FF
              LDA   $00
              SEC
L17DF         INY
              SBC   #$64
              BCS   L17DF
              TYA
              JMP   L17F3

L17E8         LDY   #$FF
              LDA   $00
              SEC
L17ED         INY
              SBC   #$0A
              BCS   L17ED
              TYA
L17F3         CMP   #$10
              BCC   L17FF
              LDA   #$87
              JSR   COUT1
              JMP   L17AA

L17FF         STA   RWTS_SECTOR
              LDA   $DF
              STA   RWTS_TRACK
              JMP   L1862

L180A         PHA
              JSR   L0812
              LDA   #$01
              STA   RWTS_COMMAND
              LDA   $F1
              CMP   $E3
              BEQ   L1822
              LDA   #$00
              STA   $F1
              STA   $EC
              JSR   L082D
L1822         LDA   $EC
              BEQ   L1829
              JMP   L14A3

L1829         PLA
L182A         CLC
              ADC   RWTS_SECTOR
              STA   RWTS_SECTOR
              BPL   L1846
              DEC   RWTS_TRACK
              BPL   L1841
              LDA   LBEFD+1
              STA   RWTS_TRACK
              DEC   RWTS_TRACK
L1841         LDA   #$10
              JMP   L182A

L1846         AND   #$F0
              BEQ   L185F
              INC   RWTS_TRACK
              LDA   RWTS_TRACK
              CMP   LBEFD+1
              BCC   L185A
              LDA   #$00
              STA   RWTS_TRACK
L185A         LDA   #$F0
              JMP   L182A
L185F         JMP   L1862

L1862         JSR   L082A
              LDA   #$00
              STA   RWTS_VOLUME
              STA   RWTS_BUFFER
              LDA   $EF
              STA   RWTS_BUFFER+1
              LDA   #>RWTS
              LDY   #<RWTS
              JSR   RWTS_ENTRY
              BCS   L189F
              JSR   L082A
              LDY   #$00
L1880         LDA   ($EE),Y
              STA   L8A00,Y
              INY
              BNE   L1880
              LDA   RWTS_COMMAND
              CMP   #$02
              BEQ   L1896
              LDA   $E7
              BEQ   L1896
              JSR   L1923
L1896         JSR   L080F
              JSR   L0815
              JMP   L0809

*
* CANNOT WRITE
*

L189F         LDA   #$87
              JSR   L1DD0
              LDX   #$19
L18A6         LDA   L1909,X
              STA   L07D0,X
              DEX
              BPL   L18A6
              LDA   RWTS_COMMAND
              CMP   #$01
              BNE   L18CA
              LDA   #$A0
              STA   $07D6
              LDA   #$C5
              STA   $07D8
              LDA   #$C1
              STA   $07D9
              LDA   #$C4
              STA   $07DA
L18CA         LDA   #$20
              STA   $26
L18CE         DEC   $27
              BNE   L18E1
              DEC   $26
              BNE   L18E1
              LDA   $07E9
              EOR   #$7F
              STA   $07E9
              JMP   L18CA

L18E1         LDA   KBD
              BPL   L18CE
              BIT   KBDSTROBE
              PHA
              LDX   #$27
              LDA   #$A0
L18EE         STA   L07D0,X
              DEX
              BPL   L18EE
              PLA
              CMP   #$F9           ; y
              BNE   L18FC
              JMP   L1862

L18FC         CMP   #$D9           ; Y
              BNE   L1903
              JMP   L1862

L1903         JSR   L0815
              JMP   L0809

L1909         ASC   "CAN'T WRITE. RETRY (Y/N):_"

L1923         LDY   #$00
L1925         LDA   ($EE),Y
              CLC
              ADC   $F2
              EOR   $F3
              AND   $F5
              ORA   $F4
              STA   ($EE),Y
              LDA   L8A00,Y
              CLC
              ADC   $F2
              EOR   $F3
              AND   $F5
              ORA   $F4
              STA   L8A00,Y
              INY
              BNE   L1925
              RTS

L1945         LDY   #$00
L1947         LDA   ($EE),Y
              EOR   $F3
              SEC
              SBC   $F2
              STA   ($EE),Y
              LDA   L8A00,Y
              EOR   $F3
              SEC
              SBC   $F2
              STA   L8A00,Y
              INY
              BNE   L1947
              RTS

L195F         LDX   #$27
L1961         LDA   L198B,X
              STA   L07D0,X
              DEX
              BPL   L1961
              LDA   #$17
              JSR   L081E
              LDY   #$0E
              LDA   $F2
              JSR   L081B
              LDY   #$16
              LDA   $F3
              JSR   L081B
              LDY   #$1E
              LDA   $F5
              JSR   L081B
              LDY   #$25
              LDA   $F4
              JMP   L081B

L198B         ASC   "MASK WITH ADD $00/EOR $00/AND $00/OR $00"

L19B3         LDX   #$77
              LDA   #$A0
L19B7         STA   L0400,X
              STA   L0480,X
              STA   L0500,X
              STA   L0580,X
              STA   L0600,X
              STA   L0680,X
              STA   L0700,X
              STA   L0780,X
              DEX
              BPL   L19B7
              LDX   #$27
L19D4         LDA   #$AD
              STA   L0400,X
              DEX
              BPL   L19D4
              LDX   #$0C
L19DE         LDA   L1D9A,X
              STA   L040D,X
              DEX
              BPL   L19DE
              INX
              STX   $24
              LDA   #$02
              JMP   L081E

L19EF         JSR   L19B3
              LDX   #$27
L19F4         LDA   L1DA7,X
              STA   L0600,X
              DEX
              BPL   L19F4
L19FD         LDA   #$20
              STA   $26
L1A01         DEC   $27
              BNE   L1A13
              DEC   $26
              BNE   L1A13
              LDA   $0627
              EOR   #$7F
              STA   $0627
              BNE   L19FD
L1A13         LDA   KBD
              BPL   L1A01
              BIT   KBDSTROBE
              CMP   #$F3           ; s
              BNE   L1A21
              LDA   #$D3           ; S
L1A21         CMP   #$E8           ; h
              BNE   L1A27
              LDA   #$C8           ; H
L1A27         CMP   #$E1           ; a
              BNE   L1A2D
              LDA   #$C1           ; A
L1A2D         CMP   #$D3           ; S
              BEQ   L1A34
              JMP   L1B15

* SECTOR SEARCH

L1A34         JSR   L19B3
              LDA   #$01
              STA   RWTS_COMMAND
              LDA   #$00
              STA   RWTS_VOLUME
              STA   RWTS_TRACK
              STA   RWTS_SECTOR
              STA   RWTS_BUFFER
              LDA   #>L8B00
              STA   RWTS_BUFFER+1
L1A4F         LDA   KBD
              CMP   #$9B
              BNE   L1A59
              JMP   L1AFC

L1A59         LDA   #>RWTS
              LDY   #<RWTS
              JSR   RWTS_ENTRY
              BCC   L1A65
              JMP   L1AFC

L1A65         LDY   #$00
L1A67         LDA   ($EE),Y
              CMP   L8B00,Y
              BNE   L1AC3
              INY
              BNE   L1A67
              LDY   $24
              LDA   RWTS_TRACK
              JSR   L081B
              LDA   #$AF
              STA   ($28),Y
              INY
              LDA   RWTS_SECTOR
              JSR   L081B
              INY
              STY   $24
              CPY   #$28
              BNE   L1AC3
              LDA   #$00
              STA   $24
              INC   $25
              LDA   $25
              CMP   #$16
              BNE   L1AC0
              LDA   #$A8
              STA   $07E1
              LDA   #$D7
              STA   $07E2
              LDA   #$C1
              STA   $07E3
              LDA   #$C9
              STA   $07E4
              LDA   #$D4
              STA   $07E5
              LDA   #$A9
              STA   $07E6
L1AB5         LDA   KBD
              BPL   L1AB5
              BIT   KBDSTROBE
              JSR   L19B3
L1AC0         JSR   L0821
L1AC3         INC   RWTS_SECTOR
              LDA   RWTS_SECTOR
              AND   #$0F
              BNE   L1A4F
              STA   RWTS_SECTOR
              INC   RWTS_TRACK
              LDA   RWTS_TRACK
              CMP   LBEFD+1
              BEQ   L1ADE
              JMP   L1A4F

L1ADE         LDA   #$00
              STA   RWTS_TRACK
              BIT   KBDSTROBE
              LDX   #$0D
L1AE8         LDA   L1D7E,X
              STA   $07DD,X
              DEX
              BPL   L1AE8
L1AF1         LDA   KBD
              CMP   #$8D
              BNE   L1AF1
              BIT   KBDSTROBE
              RTS

L1AFC         BIT   KBDSTROBE
              LDX   #$0D
L1B01         LDA   L1D8C,X
              STA   $07DD,X
              DEX
              BPL   L1B01
L1B0A         LDA   KBD
              CMP   #$9B
              BNE   L1B0A
              BIT   KBDSTROBE
              RTS

* ASCII SEARCH

L1B15         CMP   #$C1
              BEQ   L1B1C
              JMP   L1B9C

L1B1C         JSR   L19B3
              LDX   #$27
L1B21         LDA   L1D56,X
              STA   L0600,X
              DEX
              BPL   L1B21
              INX
L1B2B         LDA   #$20
              STA   $26
L1B2F         DEC   $27
              BNE   L1B41
              DEC   $26
              BNE   L1B41
              LDA   L0700,X
              EOR   #$7F
              STA   L0700,X
              BNE   L1B2B
L1B41         LDA   KBD
              BPL   L1B2F
              BIT   KBDSTROBE
              CMP   #$9B
              BNE   L1B4E
              RTS

L1B4E         CMP   #$8D
              BEQ   L1B7B
              CMP   #$88
              BNE   L1B66
              CPX   #$00
              BEQ   L1B41
              LDA   #$A0
              STA   L0700,X
              DEX
              STA   L0700,X
              JMP   L1B2F

L1B66         CPX   #$27
              BEQ   L1B41
              AND   $E8
              BPL   L1B72
              CMP   #$C1
              BCC   L1B74
L1B72         ORA   $E9
L1B74         STA   L0700,X
              INX
              JMP   L1B2F

L1B7B         CPX   #$00
              BNE   L1B80
              RTS

L1B80         STX   L02FF
              TXA
              EOR   #$FF
              STA   L02FE
              INC   L02FE
              INC   L02FE
              DEX
L1B90         LDA   L0700,X
              STA   L0200,X
              DEX
              BPL   L1B90
              JMP   L1C61

* HEXA SEARCH

L1B9C         CMP   #$C8
              BEQ   L1BA1
              RTS

L1BA1         JSR   L19B3
              LDX   #$27
L1BA6         LDA   L1D2E,X
              STA   L0600,X
              DEX
              BPL   L1BA6
              LDX   #$00
L1BB1         LDA   #$20
              STA   $26
L1BB5         DEC   $27
              BNE   L1BC7
              DEC   $26
              BNE   L1BC7
              LDA   L0700,X
              EOR   #$7F
              STA   L0700,X
              BNE   L1BB1
L1BC7         LDA   KBD
              BPL   L1BB5
              BIT   KBDSTROBE
              CMP   #$9B
              BNE   L1BD4
              RTS

L1BD4         CMP   #$8D
              BEQ   L1C16
              CMP   #$88
              BNE   L1BEC
              CPX   #$00
              BEQ   L1BB5
              LDA   #$A0
              STA   L0700,X
              DEX
              STA   L0700,X
              JMP   L1BB5

L1BEC         CMP   #$B0
              BCC   L1C0E
              CMP   #$BA
              BCC   L1C03
              CMP   #$E1
              BCC   L1BFB
              SEC
              SBC   #$20
L1BFB         CMP   #$C1
              BCC   L1C0E
              CMP   #$C7
              BCS   L1C0E
L1C03         CPX   #$27
              BEQ   L1BB5
              STA   L0700,X
              INX
              JMP   L1BB5

L1C0E         LDA   #$87
              JSR   L1DD0
              JMP   L1BB5

L1C16         TXA
              BNE   L1C1A
              RTS

L1C1A         AND   #$01
              BNE   L1C0E
              TXA
              LSR
              STA   L02FF
              EOR   #$FF
              STA   L02FE
              DEC   L02FE
              DEC   L02FE
              LDX   #$00
              LDY   #$00
L1C32         LDA   L0700,Y
              SEC
              SBC   #$B0
              CMP   #$0A
              BCC   L1C3F
              SEC
              SBC   #$07
L1C3F         ASL
              ASL
              ASL
              ASL
              STA   L0200,X
              INY
              LDA   L0700,Y
              SEC
              SBC   #$B0
              CMP   #$0A
              BCC   L1C54
              SEC
              SBC   #$07
L1C54         ORA   L0200,X
              STA   L0200,X
              INX
              INY
              CPX   L02FF
              BNE   L1C32
L1C61         JSR   L19B3
              LDA   #$00
              STA   RWTS_VOLUME
              STA   RWTS_TRACK
              STA   RWTS_SECTOR
              STA   RWTS_BUFFER
              LDA   #$01
              STA   RWTS_COMMAND
              LDA   #>L8B00
              STA   RWTS_BUFFER+1

L1C7C         LDA   KBD
              CMP   #$9B
              BNE   L1C86
              JMP   L1AFC

L1C86         LDA   #>RWTS
              LDY   #<RWTS
              JSR   RWTS_ENTRY
              BCC   L1C92
              JMP   L1AFC

L1C92         LDY   #$00
L1C94         STY   $DF
              LDX   #$00
L1C98         LDA   L8B00,Y
              CMP   L0200,X
              BNE   L1D05
              INY
              INX
              CPX   L02FF
              BNE   L1C98
              LDY   $24
              LDA   RWTS_TRACK
              JSR   L081B
              LDA   #$AF
              STA   ($28),Y
              INY
              LDA   RWTS_SECTOR
              JSR   L081B
              LDA   #$AD
              STA   ($28),Y
              INY
              LDA   $DF
              JSR   L081B
              INY
              INY
              INY
              STY   $24
              CPY   #$23
              BCC   L1D05
              LDA   #$00
              STA   $24
              INC   $25
              JSR   L0821
              LDA   $25
              CMP   #$16
              BNE   L1D05
              LDA   #$A8
              STA   $07E1
              LDA   #$D7
              STA   $07E2
              LDA   #$C1
              STA   $07E3
              LDA   #$C9
              STA   $07E4
              LDA   #$D4
              STA   $07E5
              LDA   #$A9
              STA   $07E6
L1CFA         LDA   KBD
              BPL   L1CFA
              BIT   KBDSTROBE
              JSR   L19B3
L1D05         LDY   $DF
              INY
              CPY   L02FE
              BNE   L1C94
              INC   RWTS_SECTOR
              LDA   RWTS_SECTOR
              AND   #$0F
              BEQ   L1D1A
              JMP   L1C7C

L1D1A         STA   RWTS_SECTOR
              INC   RWTS_TRACK
              LDA   RWTS_TRACK
              CMP   LBEFD+1
              BEQ   L1D2B
              JMP   L1C7C
L1D2B         JMP   L1ADE

L1D2E         ASC   "TYPE IN THE HEXADECIMAL BYTES TO SEARCH:"
L1D56         ASC   "TYPE IN THE SEARCH STRING (MAX 40 CHARS)"
L1D7E         ASC   "PRESS <RETURN>"
L1D8C         ASC   "PRESS <ESCAPE>"
L1D9A         ASC   " DISK SEARCH "
L1DA7         ASC   "DO <S>ECTOR, <H>EXA OR <A>SCII SEARCH: _"
              HEX   00

L1DD0         LDA   #$40
              JSR   L1DF0
              STY   L1DF3
              LDY   #$08
L1DDA         LDA   #$25
              JSR   L1DF4
              LDA   SPKR
              LDA   #$20
              JSR   L1DF4
              LDA   SPKR
              DEY
              BNE   L1DDA
              LDY   L1DF3
L1DF0         RTS

              DB    $00
              DB    $00
L1DF3         DB    $00

L1DF4         SEC
L1DF5         PHA
L1DF6         SBC   #$01
              BNE   L1DF6
              PLA
              SBC   #$01
              BNE   L1DF5
              RTS

              DS    \

L1E00         ASC   "------------ DISK EDIT HELP ------------"
              ASC   " [G] GO TO A SPECIFIC SECTOR IN A FILE. "
              ASC   " [L] 6502 OP-CODES VIEW MODE.           "04
              ASC   "     "08
              ASC   "  PRESS [?] KEY FOR THE NEXT HELP SCREEN"
              ASC   "  [R] READ A SPECIFIC TRACK/SECTOR.     "
              ASC   "  [X] HEXA MASK AND/OR/XOR SELECTION.   "
              ASC   " "04
              ASC   "  "FF"  "00
              ASC   " ---------------------------------------"
              ASC   "- [W] REWRITE A SPECIFIC TRACK/SECTOR.  "
              ASC   "                                        "
              ASC   " "
              ASC   '&'
              ASC   "       SECTOR SELECTION:                "
              ASC   "                                        "
              ASC   "       BYTE SELECTION:                  "
              ASC   "       "
              ASC   '`'
              ASC   "        [LEFT ARROW]  PREVIOUS SECTOR.  "
              ASC   "       SECTOR VIEW:                     "
              ASC   "        [I] UP A LINE.      [M] DOWN A L"
              ASC   "INE.   "
              ASC   '`'
              ASC   "        [RIGHT ARROW] NEXT SECTOR.      "
              ASC   "        [A] ASCII CHARACTERS VIEW MODE. "
              ASC   "        [J] LEFT A BYTE.    [K] RIGHT A "
              ASC   "BYTE.  "02
              ASC   "        [UP ARROW]    PREVIOUS TRACK.   "
              ASC   "        [B] MODE ASCII-HEXA (HALF SCREEN"
              ASC   " EACH). [P] POSITION CURSOR AT A SPECIFI"
              ASC   "C BYTE.         [DOWN ARROW]  NEXT TRACK"
              ASC   ".               [H] HEXADECIMAL BYTES VI"
              ASC   "EW MODE.        [U] GO TO THE TOP OF THE"
              ASC   " SCREEN.       "0D0F
              ASC   'RESTAR'
L2200         ASC   "------------ DISK EDIT HELP ------------"
              ASC   " [-] RESTORE THE CURRENT BYTE.          "
              ASC   " [CTRL-F] ERASE/FORMAT TRACK/DISK.      "03
              ASC   "     "06
              ASC   "  PRESS [?] KEY FOR THE NEXT HELP SCREEN"
              ASC   "  [<] REMOVE THE CURRENT BYTE.          "
              ASC   "  [F] FIND A BYTE/STRING PATTERN.       "
              ASC   " "04
              ASC   "  "FF"  "00
              ASC   " ---------------------------------------"
              ASC   "- [=] FILL END OF BUFFER WITH BYTE.     "
              ASC   "  [N] TOGGLE HEXA/DECIMAL NUMBERING.    "
              ASC   " "
              ASC   '&'
              ASC   "       EDITION:                         "
              ASC   "        [>] ADD A BYTE (AT CURRENT POSIT"
              ASC   "ION).   [O] INPUT/OUTPUT PARAMETERS SELE"
              ASC   "CTION. "
              ASC   '`'
              ASC   "        [1 OR 2] SELECT AN EDITION BUFFE"
              ASC   "R.                                      "
              ASC   "        [Q] MONITOR  [CTRL-Q] PRODOS QUI"
              ASC   "T.     "
              ASC   '`'
              ASC   "        [ENTER]  ENTER EDITION MODE.    "
              ASC   "       GENERAL MODE:                    "
              ASC   "        [S] SLOT AND DRIVE SPECIFICATION"
              ASC   ".      "02
              ASC   "        [ESCAPE] LEAVE EDITION MODE.    "
              ASC   "        [C] COPY THE SECTOR ON THE OTHER"
              ASC   " DRIVE. [T] TYPEFACE MASK SELECTION (FLS"
              ASC   "H/INV).         [Z] CANCEL ALL MODIFICAT"
              ASC   "IONS.           [D] DIRECTORY COMMAND MO"
              ASC   "DE.             [V] VTOC EDITION MODE.  "
              ASC   "               "
              ASC   'RS'0D0A
              ASC   "J"01
              ASC   'CM'
L2600         ASC   "------------ DISK EDIT HELP ------------"
              ASC   " [CTRL-H] <===> [LEFT ARROW] KEY        "
              ASC   "SPECIAL COMMANDS:                       "12
              ASC   "     "
              ASC   '$'
              ASC   " GENERAL COMMANDS (CONTINUED):          "
              ASC   "  [CTRL-I] <===> [-->!] KEY             "
              ASC   "  [CTRL-C] TOGGLE LW CASE/NORMAL MODE.  "
              ASC   " "04
              ASC   "  "FF"  "00
              ASC   "  [Y]    TOGGLE ASCII FILTER.           "
              ASC   "  [CTRL-J] <===> [DOWN ARROW] KEY       "
              ASC   "  [CTRL-P] SCREEN HARDCOPY ON PRINTER.  "
              ASC   " "
              ASC   '0'
              ASC   "        [.]    SPECIFY WINDOW ORIGIN.   "
              ASC   "        [CTRL-K] <===> [UP ARROW] KEY   "
              ASC   "        [CTRL-S] PRINTER SLOT NUMBER.   "
              ASC   "       "
              ASC   '`'
              ASC   "        [?]    CALL FOR HELP. (DISPLAY T"
              ASC   "HIS)    [CTRL-M] <===> [RETURN] KEY     "
              ASC   "        [CTRL-T] TOGGLE MASK/UNMASK COMM"
              ASC   "AND.   "
              ASC   '`'
              ASC   "        [-->!] GO TO BEGINNING OF NEXT L"
              ASC   "INE.    [CTRL-Q] <===> [Q] KEY          "
              ASC   "                                        "
              ASC   "       "02
              ASC   "                                        "
              ASC   "        [CTRL-U] <===> [RIGHT ARROW] KEY"
              ASC   "       (C) 2007 FROM THE SOFTWARE FACTOR"
              ASC   "Y, LOGO        KEYBOARD EQUIVALENTS:    "
              ASC   "                                        "
              ASC   "               ------------- END OF HELP"
              ASC   " --------------"
              ASC   '$7D0,X'0D03
L2A00         ASC   "--------- INPUT/OUTPUT CONTROL ---------"
              ASC   "                                        "
              ASC   " !XXX: XX  XX  XX  XX  XX  XX  XX  XX ! "13
              ASC   "     "
              ASC   '&'
              ASC   " "
L2A80         ASC   "                                        "
              ASC   "DOS TYPE           : XXXXXX   (DOS3.3)  "
              ASC   " !XXX: XX  XX  XX  XX  XX  XX  XX  XX ! "04
              ASC   "  "FF"  "00
              ASC   " "
L2B00         ASC   "ADRESS FIELD MARK  : XX-XX-XX (D5-AA-96)"
              ASC   "                                        "
              ASC   " !XXX: XX  XX  XX  XX  XX  XX  XX  XX ! "
              ASC   '0'
              ASC   "       "
L2B80         ASC   "ADRESS FIELD EPILOG: XX-XX-XX (DE-AA-EB)"
              ASC   " +--------- SECTOR NUMBERING ---------+ "
              ASC   " !XXX: XX  XX  XX  XX  XX  XX  XX  XX ! "
              ASC   '`'
              ASC   "       "
L2C00         ASC   "DATA FIELD MARK    : XX-XX-XX (D5-AA-AD)"
              ASC   " !XXX: XXX XXX XXX XXX XXX XXX XXX XXX! "
              ASC   " !XXX: XX  XX  XX  XX  XX  XX  XX  XX ! "
              ASC   '`'
              ASC   "       "
L2C80         ASC   "DATA FIELD EPILOG  : XX-XX-XX (DE-AA-EB)"
              ASC   " !XXX: XXX XXX XXX XXX XXX XXX XXX XXX! "
              ASC   " !XXX: XX  XX  XX  XX  XX  XX  XX  XX ! "02
              ASC   "       "
L2D00         ASC   "CHECKSUM ENABLED   : XXX      (YES)     "
              ASC   " +------------- NIBBLES: -------------+ "
              ASC   " !XXX: XX  XX  XX  XX  XX  XX  XX  XX ! "
              ASC   "X       "
L2D80         ASC   "NUMBER OF TRACKS   : XXX      (XXX)     "
              ASC   " !XXX: XX  XX  XX  XX  XX  XX  XX  XX ! "
              ASC   " +------------------------------------+ "
              ASC   "K"

L2DF9         CMP   #$CF           ; OPTIONS
              BEQ   L2E00
              JMP   L3536

L2E00         LDX   #$77
L2E02         LDA   L2A00,X
              STA   L0400,X
              LDA   L2A80,X
              STA   L0480,X
              LDA   L2B00,X
              STA   L0500,X
              LDA   L2B80,X
              STA   L0580,X
              LDA   L2C00,X
              STA   L0600,X
              LDA   L2C80,X
              STA   L0680,X
              LDA   L2D00,X
              STA   L0700,X
              LDA   L2D80,X
              STA   L0780,X
              DEX
              BPL   L2E02
              JSR   L33B3
              JSR   L3407
              JSR   L335F
              JSR   L3386
              LDA   #$02
              JSR   L081E
              LDA   #$15
              STA   $24
              JSR   L332C
L2E4D         LDA   KBD
              BPL   L2E4D
              BIT   KBDSTROBE
              CMP   #$E0
              BCC   L2E5C
              SEC
              SBC   #$20
L2E5C         CMP   #$CD
              BNE   L2E6C
              JSR   L330B
              JSR   L2FF1
              JSR   L332C
              JMP   L2E4D

L2E6C         CMP   #$C9
              BNE   L2E7C
              JSR   L330B
              JSR   L2FBD
              JSR   L332C
              JMP   L2E4D

L2E7C         CMP   #$CB
              BNE   L2E8C
              JSR   L330B
              JSR   L2F8D
              JSR   L332C
              JMP   L2E4D

L2E8C         CMP   #$CA
              BNE   L2E9C
              JSR   L330B
              JSR   L2F4E
              JSR   L332C
              JMP   L2E4D

L2E9C         CMP   #$CE
              BNE   L2EBA
              LDA   $25
              PHA
              LDA   $E0
              BNE   L2EA9
              LDA   #$FF
L2EA9         EOR   $E0
              STA   $E0
              JSR   L3407
              PLA
              JSR   L081E
              JSR   L332C
              JMP   L2E4D

L2EBA         CMP   #$8D
              BNE   L2ECA
              JSR   L330B
              JSR   L302D
              JSR   L332C
              JMP   L2E4D

L2ECA         CMP   #$DA
              BNE   L2F28
              LDA   #$00
              STA   $E3
              LDA   #$38
              STA   LB942
              LDA   #$23
              STA   LBEFD+1
              JSR   setIDOS
              LDX   #$3F
L2EE1         LDA   L34B1,X
              STA   LBA29,X
              DEX
              BPL   L2EE1
              LDX   #$00
              LDY   #$00
L2EEE         STX   $08
              LDX   #$00
L2EF2         LDA   L34F1,Y
              STA   $00,X
              INX
              INY
              CPX   #$04
              BNE   L2EF2
              LDX   $08
              LDA   L3485,X
              LDX   #$00
              STA   ($00,X)
              STA   ($02,X)
              LDX   $08
              INX
              CPX   #$0C
              BNE   L2EEE
              LDA   $25
              PHA
              JSR   L33B3
              JSR   L3407
              JSR   L3386
              JSR   L335F
              PLA
              JSR   L081E
              JSR   L332C
              JMP   L2E4D

L2F28         CMP   #$9B
              BNE   L2F46
              LDX   #$96
L2F2E         TXA
              STA   LBA00,X
              INX
              BMI   L2F2E
              LDX   #$3F
L2F37         LDY   LBA29,X
              BPL   L2F40
              TXA
              STA   LBA00,Y
L2F40         DEX
              BPL   L2F37
              JMP   L0800

L2F46         LDA   #$87
              JSR   L1DD0
              JMP   L2E4D

L2F4E         LDA   $25
              CMP   #$0B
              BCC   L2F67
              LDA   $24
              SEC
              SBC   #$04
              STA   $24
              CMP   #$03
              BEQ   L2F60
              RTS

L2F60         LDA   #$23
              STA   $24
              JMP   L2FBD

L2F67         CMP   #$07
              BCS   L2F8A
              LDA   $24
              SEC
              SBC   #$03
              STA   $24
              CMP   #$12
              BEQ   L2F77
              RTS

L2F77         LDA   #$1B
              STA   $24
              LDA   $25
              CMP   #$02
              BNE   L2F8A
              LDA   #$23
              STA   $24
              LDA   #$16
              JMP   L081E
L2F8A         JMP   L2FBD

L2F8D         LDA   $25
              CMP   #$0B
              BCC   L2FA6
              LDA   $24
              CLC
              ADC   #$04
              STA   $24
              CMP   #$27
              BEQ   L2F9F
              RTS

L2F9F         LDA   #$07
              STA   $24
              JMP   L2FF1

L2FA6         CMP   #$06
              BCS   L2FBA
              LDA   $24
              CLC
              ADC   #$03
              STA   $24
              CMP   #$1E
              BEQ   L2FB6
              RTS

L2FB6         LDA   #$15
              STA   $24
L2FBA         JMP   L2FF1

L2FBD         DEC   $25
              JSR   L0821
              LDA   $25
              CMP   #$01
              BNE   L2FD1
              LDA   #$07
              STA   $24
              LDA   #$16
              JMP   L081E

L2FD1         CMP   #$08
              BNE   L2FDA
              LDA   #$07
              JMP   L081E

L2FDA         CMP   #$0B
              BNE   L2FE7
              LDA   #$15
              STA   $24
              LDA   #$09
              JMP   L081E

L2FE7         CMP   #$0E
              BNE   L2FF0
              LDA   #$0D
              JMP   L081E
L2FF0         RTS

L2FF1         INC   $25
              JSR   L0821
              LDA   $25
              CMP   #$17
              BNE   L3005
              LDA   #$15
              STA   $24
              LDA   #$02
              JMP   L081E

L3005         CMP   #$0E
              BNE   L300E
              LDA   #$0F
              JMP   L081E

L300E         CMP   #$0A
              BNE   L301B
              LDA   #$07
              STA   $24
              LDA   #$0C
              JMP   L081E

L301B         CMP   #$08
              BNE   L3024
              LDA   #$09
              JMP   L081E

L3024         CMP   #$06
              BNE   L302C
              LDA   #$15
              STA   $24
L302C         RTS

L302D         LDA   $25
              CMP   #$06
              BEQ   L3036
              JMP   L30CC

L3036         LDA   #$20
              STA   $26
L303A         DEC   $27
              BNE   L3066
              DEC   $26
              BNE   L3066
              LDA   $0715
              CMP   #$DF
              BNE   L304F
              JSR   L335F
              JMP   L3036

L304F         LDA   #$DF
              STA   $0715
              STA   $0716
              LDA   $0717
              CMP   #$A0
              BEQ   L3036
              LDA   #$DF
              STA   $0717
              JMP   L3036

L3066         LDA   KBD
              BPL   L303A
              BIT   KBDSTROBE
              CMP   #$F9
              BEQ   L3074
              CMP   #$D9
L3074         BNE   L3084
              LDA   #$38
L3078         STA   LB942
              JSR   L335F
              JSR   L2F8D
              JMP   L302D

L3084         CMP   #$EE
              BEQ   L308A
              CMP   #$CE
L308A         BNE   L3091
              LDA   #$18
              JMP   L3078

L3091         CMP   #$8D
              BEQ   L3097
              CMP   #$8A
L3097         BEQ   L309B
              CMP   #$95
L309B         BNE   L30A3
              LDA   LB942
              JMP   L3078

L30A3         CMP   #$88
              BNE   L30B0
              JSR   L335F
              JSR   L2F4E
              JMP   L302D

L30B0         CMP   #$8B
              BNE   L30BD
              JSR   L335F
              JSR   L2FBD
              JMP   L302D

L30BD         CMP   #$9B
              BNE   L30C4
              JMP   L335F

L30C4         LDA   #$87
              JSR   L1DD0
              JMP   L3036

L30CC         CMP   #$07
              BNE   L3118
              LDY   $24
              JSR   L0824
              BCS   L30E0
              STA   LBEFD+1
              JSR   L2F8D
              JMP   L302D

L30E0         CMP   #$8D
              BEQ   L30E6
              CMP   #$8A
L30E6         BEQ   L30EA
              CMP   #$95
L30EA         BNE   L30FA
              JSR   L3407
              LDA   #$07
              JSR   L081E
              JSR   L2FF1
              JMP   L302D

L30FA         CMP   #$8B
              BEQ   L3100
              CMP   #$88
L3100         BNE   L3110
              JSR   L3407
              LDA   #$07
              JSR   L081E
              JSR   L2FBD
              JMP   L302D

L3110         JSR   L3407
              LDA   #$07
              JMP   L081E

L3118         CMP   #$09
              BEQ   L311F
              JMP   L31C1

L311F         LDA   #$20
              STA   $26
L3123         DEC   $27
              BNE   L3145
              DEC   $26
              BNE   L3145
              LDA   L04BD
              CMP   #$DF
              BNE   L3138
              JSR   L3386
              JMP   L311F

L3138         LDA   #$DF
              LDX   #$05
L313C         STA   L04BD,X
              DEX
              BPL   L313C
              JMP   L311F

L3145         LDA   KBD
              BPL   L3123
              BIT   KBDSTROBE
              CMP   #$E0
              BCC   L3154
              SEC
              SBC   #$20

L3154         CMP   #$C3           ; CP/M
              BNE   L3155
              LDA   #$20
              STA   $E3
              JSR   setICPM

L315F         JSR   L3386
              JSR   L3407
              LDA   #$09
              JSR   L081E
              JSR   L2FF1
              JMP   L302D

L3155         CMP   #$C4           ; DOS 3.3
              BNE   L3170
              LDA   #$00
              STA   $E3
              JSR   setIDOS
              JMP   L315F

L3170         CMP   #$D0           ; ProDOS
              BNE   L317E
              LDA   #$7F
L3171         STA   $E3
              JSR   setIPRO
              JMP   L315F

L317E         CMP   #$D5           ; UCSD Pascal
              BNE   L318C
              LDA   #$FF
              BNE   L3171          ; L315F
* STA $E3
* JSR setIPRO
* JMP L315F

L318C         CMP   #$8D
              BEQ   L3192
              CMP   #$8A
L3192         BEQ   L3196
              CMP   #$95
L3196         BNE   L31A1
              JSR   L3386
              JSR   L2FF1
              JMP   L302D

L31A1         CMP   #$8B
              BEQ   L31A7
              CMP   #$88
L31A7         BNE   L31B2
              JSR   L3386
              JSR   L2FBD
              JMP   L302D

L31B2         CMP   #$9B
              BNE   L31B9
              JMP   L3386

L31B9         LDA   #$87
              JSR   L1DD0
              JMP   L311F

L31C1         CMP   #$06
              BCC   L31C8
              JMP   L324C

L31C8         SEC
              SBC   #$02
              STA   $01
              ASL
              ADC   $01
              STA   $01
              LDA   $24
              SEC
              SBC   #$15
              BEQ   L31DF
              AND   #$01
              BNE   L31DF
              LDA   #$02
L31DF         CLC
              ADC   $01
              ASL
              ASL
              TAX
              LDA   L34F1,X
              STA   $02
              LDA   L34F1+1,X
              STA   $03
              LDA   L34F3,X
              STA   $04
              LDA   L34F3+1,X
              STA   $05
              LDY   $24
              JSR   L0830
              BMI   L321A
              ASL
              ASL
              ASL
              ASL
              STA   $00
              INY
              JSR   L0830
              BMI   L321A
              ORA   $00
              LDY   #$00
              STA   ($02),Y
              STA   ($04),Y
L3214         JSR   L2F8D
              JMP   L302D

L321A         PHA
              LDY   #$00
              LDA   ($02),Y
              LDY   $24
              JSR   L0818
              PLA
              CMP   #$8D
              BEQ   L3214
              CMP   #$95
              BEQ   L3214
              CMP   #$88
              BNE   L3237
              JSR   L2F4E
              JMP   L302D

L3237         CMP   #$8A
              BNE   L3241
              JSR   L2FF1
              JMP   L302D

L3241         CMP   #$8B
              BEQ   L3246
              RTS

L3246         JSR   L2FBD
              JMP   L302D

L324C         CMP   #$0F
              BCS   L32A6
              LDY   $24
              JSR   L0824
              BCS   L3273
              PHA
              LDA   $25
              AND   #$01
              ASL
              ASL
              ASL
              STA   $00
              LDA   $24
              LSR
              LSR
              ORA   $00
              TAX
              DEX
              PLA
              STA   LBFB8,X
L326D         JSR   L2F8D
              JMP   L302D

L3273         PHA
              LDA   $25
              PHA
              JSR   L3407
              PLA
              JSR   L081E
              PLA
              CMP   #$8D
              BEQ   L326D
              CMP   #$95
              BEQ   L326D
              CMP   #$88
              BNE   L3291
              JSR   L2F4E
              JMP   L302D

L3291         CMP   #$8A
              BNE   L329B
              JSR   L2FF1
              JMP   L302D

L329B         CMP   #$8B
              BNE   L32A5
              JSR   L2FBD
              JMP   L302D
L32A5         RTS

L32A6         LDY   $24
              JSR   L0830
              BMI   L32D8
              ASL
              ASL
              ASL
              ASL
              STA   $00
              INY
              JSR   L0830
              BMI   L32D8
              ORA   $00
              PHA
              LDA   $25
              SEC
              SBC   #$0F
              ASL
              ASL
              ASL
              STA   $01
              LDA   $24
              LSR
              LSR
              ORA   $01
              TAX
              DEX
              PLA
              STA   LBA29,X
L32D2         JSR   L2F8D
              JMP   L302D

L32D8         PHA
              LDA   $25
              PHA
              JSR   L33B3
              PLA
              JSR   L081E
              PLA
              CMP   #$8D
              BEQ   L32D2
              CMP   #$95
              BEQ   L32D2
              CMP   #$88
              BNE   L32F6
              JSR   L2F4E
              JMP   L302D

L32F6         CMP   #$8A
              BNE   L3300
              JSR   L2FF1
              JMP   L302D

L3300         CMP   #$8B
              BNE   L330A
              JSR   L2FBD
              JMP   L302D
L330A         RTS

L330B         LDY   $24
              LDA   $25
              CMP   #$09
              BNE   L3316
              JSR   L3316
L3316         JSR   L331C
              JSR   L331C
L331C         LDA   ($28),Y
              AND   #$3F
              ORA   #$80
              CMP   #$A0
              BCS   L3328
              ORA   #$40
L3328         STA   ($28),Y
              INY
              RTS

L332C         LDY   $24
              LDA   $25
              CMP   #$09
              BNE   L3337
              JSR   L3337
L3337         LDA   ($28),Y
              CMP   #$A4
              BEQ   L3343
              AND   #$3F
              ORA   #$40
              STA   ($28),Y
L3343         INY
              LDA   ($28),Y
              AND   #$3F
              ORA   #$40
              STA   ($28),Y
              INY
              LDA   ($28),Y
              CMP   #$A0
              BEQ   L335D
              CMP   #$AD
              BEQ   L335D
              AND   #$3F
              ORA   #$40
              STA   ($28),Y
L335D         INY
              RTS

L335F         LDA   LB942
              CMP   #$38
              BNE   L3376
              LDA   #$D9           ; Y
              STA   $0715
              LDA   #$C5           ; E
              STA   $0716
              LDA   #$D3           ; S
              STA   $0717
              RTS

L3376         LDA   #$CE           ; N
              STA   $0715
              LDA   #$CF           ; O
              STA   $0716
              LDA   #$A0           ;
              STA   $0717
              RTS

L3386         LDX   #$05           ; DOS 3.3
              LDY   #$05
              LDA   $E3
              BEQ   L3396
              LDX   #$17           ; CP/M
              CMP   #$20
              BEQ   L3396
              LDX   #$0B           ; ProDOS
              ORA   #$00
              BPL   L3396
              LDX   #$11           ; PASCAL

L3396         LDA   L33A1,X
              STA   L04BD,Y
              DEX
              DEY
              BPL   L3396
              RTS

L33A1         ASC   "DOS3.3"
              ASC   "PRODOS"
              ASC   "PASCAL"
              ASC   "CP/M  "

L33B3         LDA   #$02
              JSR   L081E
              LDX   #$00
L33BA         LDY   #$15
L33BC         LDA   L34F1,X
              STA   $00
              INX
              LDA   L34F1,X
              STA   $01
              INX
              INX
              INX
              STX   $02
              LDX   #$00
              LDA   ($00,X)
              JSR   L0818
              LDX   $02
              INY
              CPY   #$1E
              BNE   L33BC
              INC   $25
              JSR   L0821
              LDA   $25
              CMP   #$06
              BNE   L33BA
              LDX   #$00
              LDA   #$0F
              JSR   L081E
L33EC         LDY   #$07
L33EE         LDA   LBA29,X
              JSR   L0818
              INX
              INY
              INY
              CPY   #$27
              BNE   L33EE
              INC   $25
              JSR   L0821
              LDA   $25
              CMP   #$17
              BNE   L33EC
              RTS

L3407         LDA   #$07
              JSR   L081E
              LDY   #$15
              LDA   LBEFD+1
              JSR   L081B
              LDY   #$1F
              LDA   #$23
              JSR   L081B
              LDA   #$0C
              JSR   L081E
              LDX   #$00
L3422         LDY   #$02
              LDA   $25
              AND   #$01
              ASL
              ASL
              ASL
              STX   $00
              JSR   L081B
              LDX   $00
              LDY   #$07
L3434         LDA   LBFB8,X
              STX   $00
              JSR   L081B
              LDX   $00
              INY
              INX
              CPY   #$27
              BNE   L3434
              INC   $25
              JSR   L0821
              LDA   $25
              CMP   #$0E
              BNE   L3422
              LDA   #$0F
              JSR   L081E
L3454         LDY   #$02
              LDA   $25
              SEC
              SBC   #$0F
              ASL
              ASL
              ASL
              JSR   L081B
              INC   $25
              JSR   L0821
              LDA   $25
              CMP   #$17
              BNE   L3454
              RTS

setIDOS       LDX   #$0F
]lp           LDA   INTER_DOS,X
              STA   LBFB8,X
              DEX
              BPL   ]lp
              RTS

setIPRO       LDX   #$0F
]lp           LDA   INTER_PRO,X
              STA   LBFB8,X
              DEX
              BPL   ]lp
              RTS

setICPM       LDX   #$0F
]lp           LDA   INTER_CPM,X
              STA   LBFB8,X
              DEX
              BPL   ]lp
              RTS


* MARKERS

L3485         HEX   D5AA96
              HEX   DEAAEB
              HEX   D5AAAD
              HEX   DEAAEB

* DOS 3.3 INTERLEAVING

INTER_DOS     HEX   000D0B09070503010E0C0A080604020F

* PRODOS INTERLEAVING

INTER_PRO     HEX   00020406080A0C0E01030507090B0D0F

* CP/M INTERLEAVING

INTER_CPM     HEX   000306090C0F0205080B0E0104070A0D

* NIBBLES

L34B1         HEX   96979A9B9D9E9FA6A7ABACADAEAFB2B3
              HEX   B4B5B6B7B9BABBBCBDBEBFCBCDCECFD3
              HEX   D6D7D9DADBDCDDDEDFE5E6E7E9EAEBEC
              HEX   EDEEEFF2F3F4F5F6F7F9FAFBFCFDFEFF

* ADDRESSES IN RWTS FOR THE MARKERS

L34F1         DA    LB954+1
L34F3         DA    LBC79+1
              DA    LB95E+1
              DA    LBC7E+1
              DA    LB969+1
              DA    LBC83+1
              DA    LB990+1
              DA    LBCAD+1
              DA    LB99A+1
              DA    LBCB2+1
              DA    LBCB7+1
              DA    LBCB7+1
              DA    LB852+1
              DA    LB8E6+1
              DA    LB857+1
              DA    LB8F0+1
              DA    LB85C+1
              DA    LB8FB+1
              DA    LB89D+1
              DA    LB934+1
              DA    LB8A2+1
              DA    LB93E+1
              DA    LB8A7+1
              DA    LB8A7+1

              DS    15

L3530         JMP   L3D3B
L3533         JMP   L3B75

L3536         CMP   #$C4
              BNE   L353D
              JMP   L35FE

L353D         CMP   #$C7
              BEQ   L3544
              JMP   L3FB6

L3544         LDA   $EC
              BNE   L354B
              JMP   L0806

L354B         JSR   L0812
              LDA   #$15
              JSR   L081E
              LDY   #$25
              JSR   L0824
              BCC   L3563
              JSR   L3F7F
              JSR   L0815
              JMP   L080C

L3563         PHA
              LDA   #$01
              STA   RWTS_COMMAND
              LDA   $F1
              BNE   L359C
              PLA
              CMP   #$7A
              BCS   L3593
              TAY
              ASL
              ADC   #$0C
              TAX
              LDA   L8C00,X
              ORA   L8C00+1,X
              BEQ   L3593
              LDA   L8C00,X
              STA   RWTS_TRACK
              LDA   L8C00+1,X
              STA   RWTS_SECTOR
              STY   $F9
              JSR   L3F7F
              JMP   L14A6

L3593         JSR   L3F7F
              JSR   L0815
              JMP   L0806

L359C         BPL   L35C9
              PLA
              STA   $02
              CLC
              ADC   $FA
              STA   $00
              LDA   $FB
              ADC   #$00
              STA   $01
              CMP   $FD
              BCC   L35BA
              BNE   L3593
              LDA   $00
              CMP   $FC
              BCC   L35BA
              BNE   L3593
L35BA         LDA   $00
              STA   $FE
              LDA   $01
              STA   $FF
              LDA   $02
              STA   $F9
              JMP   L3F8B

L35C9         LDA   $DE
              CMP   #$10
              BNE   L35E3
              PLA
              CMP   #$02
              BCS   L3593
              ORA   $FA
              STA   $FE
              AND   #$01
              STA   $F9
              LDA   $FB
              STA   $FF
              JMP   L3F8B

L35E3         PLA
              TAX
              LDA   L8C00,X
              ORA   L8D00,X
              BEQ   L3593
              STX   $F9
              LDA   L8C00,X
              ASL
              STA   $FE
              LDA   L8D00,X
              ROL
              STA   $FF
              JMP   L3F8B

L35FE         JSR   L3A03
              LDX   #$27
              LDA   #$AD
L3605         STA   L0400,X
              STA   L07D0,X
              DEX
              BPL   L3605
              LDX   #$05
              LDY   #$05
              LDA   $E3
              BEQ   L361E
              LDY   #$0B
              ORA   #$00
              BPL   L361E
              LDY   #$11
L361E         LDA   L373D,Y
              STA   L07E1,X
              DEY
              DEX
              BPL   L361E
              LDX   #$0F
L362A         LDA   L372D,X
              STA   L040C,X
              DEX
              BPL   L362A
              LDA   $F0
              CMP   $E3
              BEQ   L363D
              LDA   #$00
              STA   $ED
L363D         LDA   $ED
              BNE   L3644
              JSR   L3778
L3644         JSR   L388D
              JSR   L374F
L364A         LDA   KBD
              BPL   L364A
              BIT   KBDSTROBE
              CMP   #$9B
              BNE   L3659
              JMP   L0800

L3659         CMP   #$D2
              BNE   L3664
              LDA   #$00
              STA   $ED
              JMP   L35FE

L3664         CMP   #$C4
              BNE   L367A
              LDX   #$0F
L366A         LDA   L3B55,X
              STA   LBFB8,X
              DEX
              BPL   L366A
              LDA   #$00
              STA   $E3
              JMP   L35FE

L367A         CMP   #$D0
              BNE   L3690
              LDX   #$0F
L3680         LDA   L3B65,X
              STA   LBFB8,X
              DEX
              BPL   L3680
              LDA   #$7F
              STA   $E3
              JMP   L35FE

L3690         CMP   #$D5
              BNE   L36A6
              LDX   #$0F
L3696         LDA   L3B65,X
              STA   LBFB8,X
              DEX
              BPL   L3696
              LDA   #$FF
              STA   $E3
              JMP   L35FE

L36A6         CMP   #$8A
              BEQ   L36AC
              CMP   #$95
L36AC         BNE   L36D5
              JSR   L3766
              LDA   $F7
              CMP   #$FF
              BEQ   L36CF
              CLC
              ADC   #$01
              JSR   L3ABE
              BEQ   L36CF
              INC   $F7
              LDA   $F7
              SEC
              SBC   $F8
              CMP   #$16
              BCC   L36CF
              INC   $F8
              JSR   L388D
L36CF         JSR   L374F
              JMP   L364A

L36D5         CMP   #$88
              BEQ   L36DB
              CMP   #$8B
L36DB         BNE   L36F5
              JSR   L3766
              LDA   $F7
              BEQ   L36CF
              CMP   $F8
              BNE   L36ED
              DEC   $F8
              JSR   L388D
L36ED         DEC   $F7
              JSR   L374F
              JMP   L364A

L36F5         CMP   #$D8
              BNE   L3700
              LDA   #$00
              STA   $EC
              JMP   L0800

L3700         CMP   #$8D
              BEQ   L3706
              CMP   #$C7
L3706         BNE   L3725
              LDA   #$00
              STA   $F9
              LDA   #$FF
              STA   $EC
              LDA   $F7
              STA   $F6
              LDA   $E3
              STA   $F1
              BMI   L3722
              BNE   L371F
              JMP   L3BC3
L371F         JMP   L3C1B
L3722         JMP   L3CD5

L3725         LDA   #$87
              JSR   L1DD0
              JMP   L364A

L372D         ASC   " DIRECTORY MODE "
L373D         ASC   "DOS3.3"
L3743         ASC   "PRODOS"
L3749         ASC   "PASCAL"

L374F         LDA   $F7
              SEC
              SBC   $F8
              CLC
              ADC   #$01
              JSR   L081E
              LDY   #$27
L375C         LDA   ($28),Y
              AND   #$3F
              STA   ($28),Y
              DEY
              BPL   L375C
              RTS

L3766         LDY   #$27
L3768         LDA   ($28),Y
              ORA   #$80
              CMP   #$A0
              BCS   L3772
              ORA   #$40
L3772         STA   ($28),Y
              DEY
              BPL   L3768
              RTS

L3778         LDA   #$00
              STA   $EC
              STA   $F6
              STA   $F7
              STA   $F8
              LDA   RWTS_TRACK
              STA   $1F
              LDA   RWTS_SECTOR
              STA   $1E
              LDA   $E3
              BMI   L37DB
              BNE   L3808
              LDA   #$11
              STA   RWTS_TRACK
              LDA   #$00
              STA   RWTS_SECTOR
              STA   RWTS_BUFFER
              STA   $00
              LDA   #>L6000
              STA   RWTS_BUFFER+1
              STA   $01
              JSR   L3A60
L37AB         LDY   #$01
              LDA   ($00),Y
              STA   RWTS_TRACK
              INY
              LDA   ($00),Y
              STA   RWTS_SECTOR
              ORA   RWTS_TRACK
              BEQ   L37CE
              JSR   L3A60
              LDA   RWTS_BUFFER+1
              STA   $01
              INC   RWTS_BUFFER+1
              LDY   #$DD
              LDA   ($00),Y
              BNE   L37AB
L37CE         INC   $01
              LDY   #$00
              TYA
L37D3         STA   ($00),Y
              INY
              BNE   L37D3
              JMP   L3872

L37DB         LDA   #$00
              STA   RWTS_TRACK
              STA   RWTS_VOLUME
              STA   RWTS_BUFFER
              LDA   #$04
              STA   RWTS_SECTOR
              LDA   #$01
              STA   RWTS_COMMAND
              LDA   #>L6000
              STA   RWTS_BUFFER+1
L37F5         JSR   L3A60
              INC   RWTS_BUFFER+1
              INC   RWTS_SECTOR
              LDA   RWTS_SECTOR
              CMP   #$0C
              BNE   L37F5
              JMP   L3872

L3808         LDA   #$00
              STA   $01
              LDA   #$02
              STA   $00
              LDA   #>L6000
              STA   RWTS_BUFFER+1
L3815         LDA   $00
              ASL
              AND   #$0F
              STA   RWTS_SECTOR
              LDA   $00
              LSR
              LSR
              LSR
              STA   RWTS_TRACK
              LDA   $01
              ASL
              ASL
              ASL
              ASL
              ASL
              ORA   RWTS_TRACK
              STA   RWTS_TRACK
              LDA   #$00
              STA   RWTS_VOLUME
              STA   RWTS_BUFFER
              LDA   #$01
              STA   RWTS_COMMAND
              JSR   L3A60
              INC   RWTS_BUFFER+1
              INC   RWTS_SECTOR
              JSR   L3A60
              LDA   #$00
              STA   $02
              LDA   RWTS_BUFFER+1
              STA   $03
              DEC   $03
              INC   RWTS_BUFFER+1
              LDY   #$02
              LDA   ($02),Y
              STA   $00
              INY
              LDA   ($02),Y
              STA   $01
              ORA   $00
              BNE   L3815
              TYA
              INC   $03
              INC   $03
L386D         STA   ($02),Y
              INY
              BNE   L386D
L3872         LDA   $1E
              STA   RWTS_SECTOR
              LDA   $1F
              STA   RWTS_TRACK
              LDA   #$FF
              STA   $ED
              LDA   $E3
              STA   $F0
              LDA   #$00
              STA   $F7
              STA   $EC
              STA   $F8
              RTS

L388D         LDA   #$01
              JSR   L081E
              LDA   $F8
              STA   $1D
              LDA   $E3
              BMI   L38EC
              BEQ   L389F
              JMP   L3964

L389F         JSR   L0821
              LDA   $1D
              JSR   L3AE3
              LDY   #$00
              LDA   ($1E),Y
              BEQ   L38DA
              LDY   #$00
              JSR   L081B
              LDA   #$BA
              STA   ($28),Y
              LDY   #$01
              LDA   ($1E),Y
              LDY   #$04
              JSR   L081B
              LDA   $28
              ORA   #$06
              STA   $28
              LDY   #$03
L38C7         LDA   ($1E),Y
              CMP   #$A0
              BCS   L38CF
              LDA   #$AE
L38CF         STA   ($28),Y
              INY
              CPY   #$21
              BNE   L38C7
              INC   $1D
              BNE   L38E3
L38DA         LDY   #$27
              LDA   #$A0
L38DE         STA   ($28),Y
              DEY
              BPL   L38DE
L38E3         INC   $25
              LDA   $25
              CMP   #$17
              BNE   L389F
              RTS

L38EC         JSR   L0821
              LDA   $1D
              JSR   L3AFE
              LDA   $1D
              BEQ   L392B
              LDY   #$01
              LDA   ($1E),Y
              DEY
              ORA   ($1E),Y
              BEQ   L394E
              INY
              LDA   ($1E),Y
              ASL
              ASL
              ASL
              ASL
              ASL
              STA   $00
              DEY
              LDA   ($1E),Y
              LSR
              LSR
              LSR
              ORA   $00
              LDY   #$00
              JSR   L081B
              LDA   #$BA
              STA   ($28),Y
              LDY   #$00
              LDA   ($1E),Y
              ASL
              AND   #$0F
              LDY   #$04
              JSR   L081B
              JMP   L392E

L392B         JSR   L39F1
L392E         LDA   $28
              ORA   #$02
              STA   $28
              LDY   #$06
              LDA   ($1E),Y
              AND   #$1F
              TAX
L393B         INY
              DEX
              BMI   L394E
              LDA   ($1E),Y
              ORA   #$80
              CMP   #$A0
              BCS   L3949
              LDA   #$AE
L3949         STA   ($28),Y
              JMP   L393B

L394E         CPY   #$26
              BCS   L3959
              LDA   #$A0
              STA   ($28),Y
              INY
              BNE   L394E
L3959         INC   $1D
              INC   $25
              LDA   $25
              CMP   #$17
              BNE   L38EC
              RTS

L3964         JSR   L0821
              LDA   $1D
              JSR   L3B2D
              LDY   #$05
              LDA   ($1E),Y
              BEQ   L39D4
              DEY
              LDA   ($1E),Y
              BEQ   L39D6
              AND   #$E0
              CMP   #$E0
              BEQ   L39A8
              LDY   #$16
              LDA   ($1E),Y
              ASL
              ASL
              ASL
              ASL
              ASL
              STA   $00
              DEY
              LDA   ($1E),Y
              LSR
              LSR
              LSR
              ORA   $00
              LDY   #$00
              JSR   L081B
              LDA   #$BA
              STA   ($28),Y
              LDY   #$15
              LDA   ($1E),Y
              ASL
              AND   #$0F
              LDY   #$04
              JSR   L081B
              JMP   L39AB

L39A8         JSR   L39F1
L39AB         LDA   $28
              ORA   #$04
              STA   $28
              LDY   #$04
              LDA   ($1E),Y
              BPL   L39BF
              INC   $28
              LDA   #$AF
              STA   ($28),Y
              LDA   ($1E),Y
L39BF         AND   #$0F
              TAX
L39C2         INY
              LDA   ($1E),Y
              ORA   #$80
              CMP   #$A0
              BCS   L39CD
              LDA   #$AE
L39CD         STA   ($28),Y
              DEX
              BPL   L39C2
              BMI   L39D8
L39D4         DEC   $1D
L39D6         LDY   #$00
L39D8         CPY   #$22
              BCS   L39E3
              LDA   #$A0
              STA   ($28),Y
              INY
              BNE   L39D8
L39E3         INC   $1D
              INC   $25
              LDA   $25
              CMP   #$17
              BEQ   L39F0
              JMP   L3964
L39F0         RTS

L39F1         LDY   #$06
L39F3         LDA   L39FC,Y
              STA   ($28),Y
              DEY
              BPL   L39F3
              RTS

L39FC         ASC   "NAME IS"
L3A03         LDX   #$77
              LDA   #$A0
L3A07         STA   L0400,X
              STA   L0480,X
              STA   L0500,X
              STA   L0580,X
              STA   L0600,X
              STA   L0680,X
              STA   L0700,X
              STA   L0780,X
              DEX
              BPL   L3A07
              RTS

L3A23         LDA   #>L8C00
              STA   RWTS_BUFFER+1
              LDA   #$00
              STA   RWTS_BUFFER
              JMP   L3A60

L3A30         STA   RWTS_BUFFER+1
              LDA   #$00
              STA   RWTS_BUFFER
              LDA   $FC
              AND   #$0F
              STA   RWTS_SECTOR
              LDA   $FC
              LSR
              LSR
              LSR
              LSR
              STA   RWTS_TRACK
              LDA   $FD
              ASL
              ASL
              ASL
              ASL
              ORA   RWTS_TRACK
              STA   RWTS_TRACK
              JSR   L3A60
              INC   RWTS_BUFFER+1
              INC   RWTS_SECTOR
              JMP   L3A60

L3A60         LDA   #$00
              STA   RWTS_VOLUME
              LDA   #$01
              STA   RWTS_COMMAND
              LDA   #>RWTS
              LDY   #<RWTS
              JSR   RWTS_ENTRY
              BCS   L3A74
              RTS

L3A74         LDX   #$27
L3A76         LDA   #$A0
              STA   $0750,X
              LDA   L3A96,X
              STA   L07D0,X
              DEX
              BPL   L3A76
L3A84         LDA   KBD
              BPL   L3A84
              BIT   KBDSTROBE
              LDA   #$00
              STA   $EC
              LDX   #$FF
              TXS
              JMP   L0800

L3A96         ASC   "I/O ERROR WHILE READING DIRECTORY OR TSL"
L3ABE         PHA
              LDA   $F0
              BMI   L3ACE
              BNE   L3ADA
              PLA
              JSR   L3AE3
              LDY   #$00
              LDA   ($1E),Y
              RTS

L3ACE         PLA
              JSR   L3AFE
              LDY   #$00
              LDA   ($1E),Y
              INY
              ORA   ($1E),Y
              RTS

L3ADA         PLA
              JSR   L3B2D
              LDY   #$05
              LDA   ($1E),Y
              RTS

L3AE3         LDX   #$60
              DEX
              SEC
L3AE7         INX
              SBC   #$07
              BCS   L3AE7
              ADC   #$07
              TAY
              LDA   L3AF7,Y
              STA   $1E
              STX   $1F
              RTS

L3AF7         HEX   0B2E517497BADD
L3AFE         LDX   #$60
              CMP   #$27
              BCC   L3B09
              LDX   #$64
              SEC
              SBC   #$27
L3B09         STX   $1F
              DEC   $1F
              LDX   #$FF
              SEC
L3B10         INC   $1F
              INX
              SBC   #$0A
              BCS   L3B10
              ADC   #$0A
              TAY
              TXA
              ASL
              ASL
              ADC   L3B23,Y
              STA   $1E
              RTS

L3B23         HEX   001A344E68829CB6D0EA
L3B2D         LDX   #$60
              DEX
              DEX
              SEC
L3B32         INX
              INX
              SBC   #$0D
              BCS   L3B32
              ADC   #$0D
              CMP   #$07
              BCC   L3B3F
              INX
L3B3F         STX   $1F
              TAX
              LDA   L3B48,X
              STA   $1E
              RTS

L3B48         HEX   00274E759CC3EA11385F86ADD4
L3B55         HEX   000D0B09070503010E0C0A080604020F
L3B65         HEX   00020406080A0C0E01030507090B0D0F
L3B75         LDA   $E3
              CMP   $F1
              BEQ   L3B7F
              LDA   #$00
              STA   $EC
L3B7F         LDA   $EC
              BNE   L3B84
              RTS

L3B84         LDX   #$27
L3B86         LDA   L3B9B,X
              STA   $06D0,X
              DEX
              BPL   L3B86
              LDA   #$15
              JSR   L081E
              LDY   #$25
              LDA   $F9
              JMP   L081B

L3B9B         ASC   "DOSXXX:0123456789ABCDEF0123456789ABC/XXX"
L3BC3         LDX   #$05
L3BC5         LDA   L373D,X
              STA   L3B9B,X
              DEX
              BPL   L3BC5
              LDA   $F6
              JSR   L3AE3
              LDY   #$00
              LDA   ($1E),Y
              BEQ   L3C0F
              CMP   #$FF
              BEQ   L3C0F
              STA   $FA
              STA   $FC
              INY
              LDA   ($1E),Y
              STA   $FB
              STA   $FD
              DEC   $F9
              LDY   #$03
L3BEC         LDA   ($1E),Y
              CMP   #$A0
              BCS   L3BF4
              LDA   #$AE
L3BF4         STA   L3B9B+4,Y
              INY
              CPY   #$20
              BNE   L3BEC
              LDA   $FC
              STA   RWTS_TRACK
              LDA   $FD
              STA   RWTS_SECTOR
              JSR   L3A23
              JSR   L0CDC
              JMP   L3E5F

L3C0F         LDA   #$87
              JSR   L1DD0
              LDA   #$00
              STA   $EC
              JMP   L364A

L3C1B         LDX   #$05
L3C1D         LDA   L3743,X
              STA   L3B9B,X
              DEX
              BPL   L3C1D
              LDA   $F6
              JSR   L3B2D
              LDY   #$04
              LDA   ($1E),Y
              BEQ   L3C0F
              AND   #$E0
              CMP   #$E0
              BEQ   L3C0F
              CMP   #$C0
              BNE   L3C64
              JSR   L3766
              LDY   #$15
              LDA   ($1E),Y
              STA   $00
              INY
              LDA   ($1E),Y
              STA   $01
              LDA   #>L6000
              STA   RWTS_BUFFER+1
              LDA   RWTS_TRACK
              STA   $1F
              LDA   RWTS_SECTOR
              STA   $1E
              JSR   L3815
              JSR   L388D
              JSR   L374F
              JMP   L364A

L3C64       LDA   ($1E),Y
            AND   #$0F
            TAX
L3C69       INY
            LDA   ($1E),Y
            ORA   #$80
            CMP   #$A0
            BCS   L3C74
            LDA   #$AE
L3C74       STA   L3B9B+2,Y
            DEX
            BNE   L3C69
            LDA   #$A0
L3C7C       STA   L3B9B+3,Y
            INY
            CPY   #$21
            BNE   L3C7C
            LDY   #$15
            LDA   ($1E),Y
            INY
            ASL
            STA   $FA
            STA   $FC
            LDA   ($1E),Y
            ROL
            STA   $FB
            STA   $FD
            LDY   #$04
            LDA   ($1E),Y
            AND   #$30
            STA   $DE
            CMP   #$10
            BNE   L3CB5
            INC   $FC
            BNE   L3CA7
            INC   $FD
L3CA7       LDA   $FA
            STA   $FE
            LDA   $FB
            STA   $FF
            JSR   L0CDC
            JMP   L3F8B

L3CB5       CMP   #$20
            BNE   L3CC6
            LDA   #$8C
            JSR   L3A30
            JSR   L0CDC
            LDX   #$00
            JMP   L3E9E

L3CC6       LDA   #$8E
            JSR   L3A30
            LDA   #$FF
            STA   $DD
            JSR   L0CDC
            JMP   L3EC3

L3CD5       LDX   #$05
L3CD7       LDA   L3749,X
            STA   L3B9B,X
            DEX
            BPL   L3CD7
            LDA   $F6
            BNE   L3CE7
            JMP   L3C0F

L3CE7       JSR   L3AFE
            LDY   #$06
            LDA   ($1E),Y
            TAX
L3CEF       INY
            LDA   ($1E),Y
            ORA   #$80
            CMP   #$A0
            BCS   L3CFA
            LDA   #$AE
L3CFA       STA   L3B9B,Y
            DEX
            BNE   L3CEF
            LDA   #$A0
L3D02       INY
            STA   L3B9B,Y
            CPY   #$23
            BNE   L3D02
            LDY   #$00
            LDA   ($1E),Y
            INY
            ASL
            STA   $FA
            LDA   ($1E),Y
            ROL
            STA   $FB
            INY
            LDA   ($1E),Y
            INY
            ASL
            STA   $FC
            LDA   ($1E),Y
            ROL
            STA   $FD
            DEC   $FC
            LDA   $FC
            CMP   #$FF
            BNE   L3D2D
            DEC   $FD
L3D2D       JSR   L0CDC
            LDA   $FA
            STA   $FE
            LDA   $FB
            STA   $FF
            JMP   L3F8B

L3D3B       PLA
            ORA   #$00
            BMI   L3D43
            JMP   L3E5F

L3D43       LDA   $F1
            BPL   L3D65
L3D47       LDA   $FE
            CMP   $FA
            BNE   L3D56
            LDA   $FF
            CMP   $FB
            BNE   L3D56
            JMP   L3F39

L3D56       DEC   $FE
            DEC   $F9
            LDA   $FE
            CMP   #$FF
            BNE   L3D62
            DEC   $FF
L3D62       JMP   L3F8B

L3D65       BEQ   L3DDE
            LDA   $DE
            CMP   #$10
            BEQ   L3D47
            LDA   $FE
            AND   #$01
            BEQ   L3D78
            DEC   $FE
            JMP   L3F8B

L3D78       LDX   $F9
            BNE   L3D89
            LDA   $DE
            CMP   #$20
            BEQ   L3D84
            LDA   $DD
L3D84       BNE   L3DB6
            JMP   L3F39

L3D89       DEX
            LDA   L8C00,X
            ORA   L8D00,X
            BNE   L3DA3
            CPX   #$00
            BNE   L3D89
            LDA   $DE
            CMP   #$20
            BEQ   L3D9E
            LDA   $DD
L3D9E       BNE   L3DB6
            JMP   L3F39

L3DA3       LDA   L8C00,X
            ASL
            ORA   #$01
            STA   $FE
            LDA   L8D00,X
            ROL
            STA   $FF
            STX   $F9
            JMP   L3F8B

L3DB6       LDX   $DD
L3DB8       DEX
            BPL   L3DBE
            JMP   L3F39

L3DBE       LDA   L8E00,X
            ORA   L8F00,X
            BEQ   L3DB8
            LDA   L8E00,X
            ASL
            STA   $FC
            LDA   L8F00,X
            ROL
            STA   $FD
            STX   $DD
            LDA   #$8C
            JSR   L3A30
            LDX   #$00
            JMP   L3D89

L3DDE       LDA   $F9
            ASL
            CLC
            ADC   #$0C
            TAX
L3DE5       DEX
            DEX
            CPX   #$0C
            BCC   L3E0C
            LDA   L8C00,X
            ORA   L8C00+1,X
            BEQ   L3DE5
            LDA   L8C00,X
            STA   RWTS_TRACK
            LDA   L8C00+1,X
            STA   RWTS_SECTOR
            TXA
            SEC
            SBC   #$0C
            LSR
            STA   $F9
            JSR   L3F7F
            JMP   L14A6

L3E0C       LDA   $FA
            CMP   $FC
            BNE   L3E1B
            LDA   $FB
            CMP   $FD
            BNE   L3E1B
            JMP   L3F39

L3E1B       LDA   $FC
            STA   RWTS_TRACK
            LDA   $FD
            STA   RWTS_SECTOR
L3E25       JSR   L3A23
            LDA   L8C00+1
            ORA   L8C00+2
            BNE   L3E33
            JMP   L3F39

L3E33       LDA   L8C00+1
            CMP   $FA
            BNE   L3E50
            LDA   L8C00+2
            CMP   $FB
            BNE   L3E50
            LDA   RWTS_TRACK
            STA   $FA
            LDA   RWTS_SECTOR
            STA   $FB
            LDX   #$00
            JMP   L3DE5

L3E50       LDA   L8C00+1
            STA   RWTS_TRACK
            LDA   L8C00+2
            STA   RWTS_SECTOR
            JMP   L3E25

L3E5F       LDA   $F1
            BPL   L3E7D
L3E63       LDA   $FE
            CMP   $FC
            BNE   L3E72
            LDA   $FF
            CMP   $FD
            BNE   L3E72
            JMP   L3F39

L3E72       INC   $FE
            BNE   L3E78
            INC   $FF
L3E78       INC   $F9
            JMP   L3F8B

L3E7D       BEQ   L3EEB
            LDA   $DE
            CMP   #$10
            BEQ   L3E63
            LDA   $FE
            AND   #$01
            BNE   L3E90
            INC   $FE
            JMP   L3F8B

L3E90       LDX   $F9
            INX
            BNE   L3E9E
            LDA   $DE
            CMP   #$20
            BNE   L3EC3
            JMP   L3F39

L3E9E       LDA   L8C00,X
            ORA   L8D00,X
            BNE   L3EB2
            INX
            BNE   L3E9E
            LDA   $DE
            CMP   #$20
            BNE   L3EC3
            JMP   L3F39

L3EB2       LDA   L8C00,X
            ASL
            STA   $FE
            LDA   L8D00,X
            ROL
            STA   $FF
            STX   $F9
            JMP   L3F8B

L3EC3       LDX   $DD
L3EC5       INX
            BPL   L3ECB
            JMP   L3F39

L3ECB       LDA   L8E00,X
            ORA   L8F00,X
            BEQ   L3EC5
            LDA   L8E00,X
            ASL
            STA   $FC
            LDA   L8F00,X
            ROL
            STA   $FD
            STX   $DD
            LDA   #$8C
            JSR   L3A30
            LDX   #$00
            JMP   L3E9E

L3EEB       LDA   $F9
            ASL
            CLC
            ADC   #$0C
            TAX
L3EF2       INX
            INX
            BEQ   L3F17
            LDA   L8C00,X
            ORA   L8C00+1,X
            BEQ   L3EF2
            LDA   L8C00,X
            STA   RWTS_TRACK
            LDA   L8C00+1,X
            STA   RWTS_SECTOR
            TXA
            SEC
            SBC   #$0C
            LSR
            STA   $F9
            JSR   L3F7F
            JMP   L14A6

L3F17       LDA   L8C00+1
            ORA   L8C00+2
            BNE   L3F22
            JMP   L3F39

L3F22       LDA   L8C00+1
            STA   $FA
            STA   RWTS_TRACK
            LDA   L8C00+2
            STA   RWTS_SECTOR
            STA   $FB
            JSR   L3A23
            LDX   #$0A
            BNE   L3EF2
L3F39       LDX   #$27
L3F3B       LDA   L3F57,X
            STA   L07D0,X
            DEX
            BPL   L3F3B
            LDA   #$87
            JSR   L1DD0
L3F49       LDA   KBD
            BPL   L3F49
            BIT   KBDSTROBE
            JSR   L0815
            JMP   L0809

L3F57       ASC   "OUT OF FILE BOUNDARIES. PRESS [RETURN]  "

L3F7F       LDA   #$15
            JSR   L081E
            LDY   #$25
            LDA   $F9
            JMP   L081B

L3F8B       JSR   L3F7F
            LDA   $FE
            AND   #$0F
            STA   RWTS_SECTOR
            LDA   $FE
            LSR
            LSR
            LSR
            LSR
            STA   RWTS_TRACK
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ORA   RWTS_TRACK
            STA   RWTS_TRACK
            LDA   #$01
            STA   RWTS_COMMAND
            JMP   L14A6

            DB    $00
            DB    $00
            DB    $00
            DB    $00
L3FB6       CMP   #$CC
            BEQ   L3FBD
            JMP   L4580

L3FBD       LDA   #$00
            STA   $DB
            STA   $DC
            LDX   #$77
            LDA   #$A0
L3FC7       STA   L0400,X
            STA   L0480,X
            STA   L0500,X
            STA   L0580,X
            STA   L0600,X
            STA   L0680,X
            STA   L0700,X
            STA   L0780,X
            DEX
            BPL   L3FC7
            LDX   #$27
            LDA   #$AD
L3FE6       STA   L0400,X
            DEX
            BPL   L3FE6
            LDX   #$11
L3FEE       LDA   L41A6,X
            STA   $040B,X
            DEX
            BPL   L3FEE
L3FF7       LDA   $E6
            STA   $10
            LDA   $EF
            STA   $11
            LDA   #$00
            STA   $12
            STA   $13
L4005       LDA   $12
            CMP   $DB
            BNE   L4011
            LDA   $13
            CMP   $DC
            BEQ   L402C
L4011       LDY   #$00
            LDA   ($10),Y
            TAX
            LDA   L4480,X
            AND   #$03
            CLC
            ADC   $10
            STA   $10
            BCC   L4024
            INC   $11
L4024       INC   $12
            BNE   L4005
            INC   $13
            BNE   L4005
L402C       LDA   #$01
            JSR   L081E
L4031       JSR   L0821
            LDA   $11
            CMP   #$8A
            BNE   L403F
            LDY   #$00
            JMP   L40FE

L403F       LDY   #$00
            LDA   ($10),Y
            STA   L41B8
            INY
            LDA   ($10),Y
            STA   L41B9
            INY
            LDA   ($10),Y
            STA   L41BA
            LDY   #$00
            LDA   $11
            AND   #$0F
            JSR   L0818
            LDA   $10
            JSR   L0818
            LDA   #$BA
            STA   ($28),Y
            INY
            LDA   #$A0
            STA   ($28),Y
            LDA   L41B8
            TAX
            JSR   L0818
            LDA   L4480,X
            AND   #$03
            STA   $DF
            CLC
            ADC   $10
            STA   $10
            BCC   L4080
            INC   $11
L4080       DEC   $DF
            BEQ   L409E
            LDA   #$A0
            STA   ($28),Y
            INY
            LDA   L41B9
            JSR   L0818
            DEC   $DF
            BEQ   L409E
            LDA   #$A0
            STA   ($28),Y
            INY
            LDA   L41BA
            JSR   L0818
L409E       LDA   #$A0
            STA   ($28),Y
            INY
            CPY   #$14
            BNE   L409E
            LDX   L41B8
            LDA   L4280,X
            LSR
            LSR
            AND   #$1F
            ORA   #$C0
            STA   ($28),Y
            INY
            LDA   L4280,X
            AND   #$03
            ASL
            ASL
            ASL
            ORA   #$C0
            STA   $00
            LDA   L4380,X
            ASL
            ROL
            ROL
            ROL
            AND   #$07
            ORA   $00
            STA   ($28),Y
            INY
            LDA   L4380,X
            AND   #$1F
            ORA   #$C0
            STA   ($28),Y
            INY
            LDA   #$A0
            STA   ($28),Y
            INY
            STA   ($28),Y
            INY
            STA   ($28),Y
            INY
            LDX   L41B8
            LDA   L4480,X
            LSR
            AND   #$1E
            TAX
            LDA   L41BB,X
            STA   L41D7+1
            LDA   L41BB+1,X
            STA   L41D7+2
            JSR   L41D7
L40FE       LDA   #$A0
            STA   ($28),Y
            INY
            CPY   #$28
            BNE   L40FE
            INC   $25
            LDA   $25
            CMP   #$18
            BEQ   L4112
            JMP   L4031

L4112       LDA   KBD
            BPL   L4112
            BIT   KBDSTROBE
            CMP   #$9B
            BNE   L4121
            JMP   L0800

L4121       CMP   #$8B
            BEQ   L4127
            CMP   #$C9
L4127       BNE   L414C
            LDA   $DC
            BNE   L413C
            LDA   $DB
            BEQ   L419E
            CMP   #$14
            BCS   L413C
            LDA   #$00
            STA   $DB
            JMP   L3FF7

L413C       LDA   $DB
            SEC
            SBC   #$14
            STA   $DB
            LDA   $DC
            SBC   #$00
            STA   $DC
            JMP   L3FF7

L414C       CMP   #$88
            BEQ   L4152
            CMP   #$CA
L4152       BNE   L4167
            LDA   $DB
            ORA   $DC
            BEQ   L419E
            DEC   $DB
            LDA   $DB
            CMP   #$FF
            BNE   L4164
            DEC   $DC
L4164       JMP   L3FF7

L4167       CMP   #$95
            BEQ   L416D
            CMP   #$CB
L416D       BNE   L417E
            LDA   $11
            CMP   #$8A
            BEQ   L419E
            INC   $DB
            BNE   L417B
            INC   $DC
L417B       JMP   L3FF7

L417E       CMP   #$8D
            BEQ   L4184
            CMP   #$CD
L4184       BEQ   L4188
            CMP   #$8A
L4188       BNE   L419E
            LDA   $11
            CMP   #$8A
            BEQ   L419E
            LDA   $DB
            CLC
            ADC   #$14
            STA   $DB
            BCC   L419B
            INC   $DC
L419B       JMP   L3FF7

L419E       LDA   #$87
            JSR   L1DD0
            JMP   L4112

L41A6       ASC   " DISASSEMBLY MODE "

L41B8       DB    $00
L41B9       DB    $20
L41BA       DB    $91

L41BB       DA    L4201
            DA    L41DA
            DA    L41DF
            DA    L41EA
            DA    L41F2
            DA    L4202
            DA    L423C
            DA    L4248
            DA    L4250
            DA    L4258
            DA    L4210
            DA    L4221
            DA    L4229
            DA    L4231

L41D7       JMP   L4201

L41DA       LDA   #$A3
            STA   ($28),Y
            INY
L41DF       LDA   #$A4
            STA   ($28),Y
            INY
            LDA   L41B9
            JMP   L0818

L41EA       JSR   L41DF
            LDA   #$D8
            JMP   L41F7

L41F2       JSR   L41DF
            LDA   #$D9
L41F7       INY
            STA   ($28),Y
            DEY
            LDA   #$AC
            STA   ($28),Y
            INY
            INY
L4201       RTS

L4202       LDA   #$A8
            STA   ($28),Y
            INY
            JSR   L41DF
L420A       LDA   #$A9
            STA   ($28),Y
            INY
            RTS

L4210       LDA   #$A4
            STA   ($28),Y
            INY
            LDA   L41BA
            JSR   L0818
            LDA   L41B9
            JMP   L0818

L4221       JSR   L4210
            LDA   #$D8
            JMP   L41F7

L4229       JSR   L4210
            LDA   #$D9
            JMP   L41F7

L4231       LDA   #$A8
            STA   ($28),Y
            INY
            JSR   L4210
            JMP   L420A

L423C       JSR   L4202
            DEY
            LDA   #$D8
            JSR   L41F7
            JMP   L420A

L4248       JSR   L4202
            LDA   #$D8
            JMP   L41F7

L4250       JSR   L4202
            LDA   #$D9
            JMP   L41F7

L4258       LDA   $11
            AND   #$0F
            STA   L41BA
            LDA   L41B9
            BMI   L4272
            CLC
            ADC   $10
            STA   L41B9
            BCC   L426F
            INC   L41BA
L426F       JMP   L4210

L4272       CLC
            ADC   $10
            STA   L41B9
            BCS   L426F
            DEC   L41BA
            JMP   L4210

L4280       HEX   0A3E0000523E0600413E0600523E0600
            HEX   0A3E3E00523E06000D3E2500523E0600
            HEX   2A050000090549004105490009054900
            HEX   09050500000549004C05100000054900
            HEX   4A150000001532004115320029153200
            HEX   0A151500001532000D15410000153200
            HEX   4A0400004E0449004104490029044900
            HEX   0A0404004E0449004C04410000044900
            HEX   0A4E00004E4E4E00100053004E4E4E00
            HEX   084E4E004E4E4E00534E53004E4E4E00
            HEX   30303000303030005030500030303000
            HEX   08303000303030000D30520030303000
            HEX   0E0D00000E0D1000250D105C0E0D1000
            HEX   090D0D00000D10000D30414E000D1000
            HEX   0E4C00000E4C2500254C39000E4C2500
            HEX   084C4C00004C25004C4C4100004C2500

L4380       HEX   4B41000062416C0010416C0062416C00
            HEX   0C41410042416C008341C10042416C00
            HEX   72C4000034C4EC0090C4EC0034C4EC00
            HEX   A9C4C40000C4EC00A3C4A10000C4EC00
            HEX   89F2000000F2720001F27200B0F27200
            HEX   C3F2F20000F2720089F2190000F27200
            HEX   938300009A83F2008183F200B083F200
            HEX   D38383009A83F200A98399000083F200
            HEX   4181000099819800B900010099819800
            HEX   6381810099819800218113009A819A00
            HEX   99819800998198003981380099819800
            HEX   73818100998198009681780099819800
            HEX   19B0000019B0A300D9B0B82919B0A300
            HEX   C5B0B00000B0A3008481189000B0A300
            HEX   184300001843C300D843F0001843C300
            HEX   B14343000043C300A44398000043C300

L4480       HEX   011A01010A0A0A01010601012B2B2B01
            HEX   262216010A0E0E01013301012B2F2F01
            HEX   2B1A01010A0A0A01010601012B2B2B01
            HEX   26221601010E0E0101330101012F2F01
            HEX   011A0101010A0A01010601012B2B2B01
            HEX   26221601010E0E0101330101012F2F01
            HEX   011A01010A0A0A0101060101372B2B01
            HEX   262216010E0E0E0101330101012F2F01
            HEX   261A01010A0A0A01010101012B2B2B01
            HEX   262216010E0E1201013301012B2F2F01
            HEX   061A06010A0A0A01010601012B2B2B01
            HEX   262216010E0E1201013301012F2F3301
            HEX   061A01010A0A0A01010601012B2B2B01
            HEX   26221601010E0E0101330101012F2F01
            HEX   061A01010A0A0A01010601012B2B2B01
            HEX   26221601010E0E01010E0101012F2F01

*
* V: VTOC
*

L4580       CMP   #$D6	; VTOC MODE
            BEQ   L4587
            JMP   L0806

L4587       LDA   RWTS_TRACK
            STA   $DB
            STA   $D9
            LDA   RWTS_SECTOR
            STA   $DC
            STA   $DA
L4595       LDA   #$00
            STA   RWTS_VOLUME
            STA   RWTS_BUFFER
            LDA   #>L8B00
            STA   RWTS_BUFFER+1
            LDA   #$01
            STA   RWTS_COMMAND
            LDA   $E3
            BPL   L45C6
            LDX   #$27
L45AD       LDA   L4A64,X
            STA   L07D0,X
            DEX
            BPL   L45AD
            LDA   #$87
            JSR   L1DD0
L45BB       LDA   KBD
            BPL   L45BB
            BIT   KBDSTROBE
            JMP   L0809

L45C6       BNE   L45D5
            LDA   #$11
            STA   RWTS_TRACK
            LDA   #$00
            STA   RWTS_SECTOR
            JMP   L4620

L45D5       LDA   #$00
            STA   RWTS_TRACK
            LDA   #$04
            STA   RWTS_SECTOR
L45DF       JSR   L480B
            LDA   L8B00+2
            ORA   L8B00+3
            BEQ   L460D
            LDA   L8B00+2
            ASL
            AND   #$0F
            STA   RWTS_SECTOR
            LDA   L8B00+2
            LSR
            LSR
            LSR
            STA   RWTS_TRACK
            LDA   L8B00+3
            ASL
            ASL
            ASL
            ASL
            ASL
            ORA   RWTS_TRACK
            STA   RWTS_TRACK
            JMP   L45DF

L460D       INC   RWTS_SECTOR
            INC   RWTS_SECTOR
            LDA   RWTS_SECTOR
            AND   #$0F
            BNE   L4620
            STA   RWTS_SECTOR
            INC   RWTS_TRACK
L4620       JSR   L480B
            LDX   #$77
            LDA   #$A0
L4627       STA   L0400,X
            STA   L0480,X
            STA   L0500,X
            STA   L0580,X
            STA   L0600,X
            STA   L0680,X
            STA   L0700,X
            STA   L0780,X
            DEX
            BPL   L4627
            LDX   #$27
L4644       LDA   #$AD
            STA   L0400,X
            STA   L0580,X
            STA   $0650,X
            LDA   L4A8C,X
            STA   L0480,X
            LDA   L4AB4,X
            STA   L0500,X
            LDA   L4ADC,X
            STA   $06D0,X
            LDA   L4B04,X
            STA   $0750,X
            LDA   L4B2C,X
            STA   L07D0,X
            DEX
            BPL   L4644
            LDX   #$0F
L4672       LDA   L4B54,X
            STA   $040C,X
            DEX
            BPL   L4672
            LDX   LBEFD+1
            CPX   #$26
            BCS   L4691
            INX
            INX
            LDA   #$A0
L4686       STA   L0480,X
            STA   L0500,X
            INX
            CPX   #$28
            BCC   L4686
L4691       LDA   #$04
            JSR   L081E
L4696       LDA   $25
            CLC
            ADC   #$AC
            CMP   #$BA
            BCC   L46A2
            CLC
            ADC   #$07
L46A2       LDY   #$00
            STA   ($28),Y
            INY
            LDA   #$BA
            STA   ($28),Y
            INY
L46AC       TYA
            SEC
            SBC   #$02
            CMP   LBEFD+1
            BCS   L46CD
            JSR   L483D
            LDA   L8B00,X
            AND   $1D
            BEQ   L46C4
            LDA   #$AE
            JMP   L46C6

L46C4       LDA   #$AA
L46C6       STA   ($28),Y
            INY
            CPY   #$28
            BNE   L46AC
L46CD       INC   $25
            JSR   L0821
            LDA   $25
            CMP   #$14
            BNE   L4696
            JSR   L47EB
L46DB       LDA   #$20
            STA   $26
L46DF       DEC   $27
            BNE   L46F2
            DEC   $26
            BNE   L46F2
            LDA   $07D3
            EOR   #$7F
            STA   $07D3
            JMP   L46DB

L46F2       LDA   KBD
            BPL   L46DF
            BIT   KBDSTROBE
            CMP   #$E0
            BCC   L4700
            AND   #$DF
L4700       CMP   #$9B	; ESCAPE
            BEQ   L4706
            CMP   #$D8	; X-IT VTOC MODE
L4706       BNE   L4715
            LDA   $DB
            STA   RWTS_TRACK
            LDA   $DC
            STA   RWTS_SECTOR
            JMP   L0800

L4715       CMP   #$D2	; R-EAD NEW VTOC
            BNE   L471C
            JMP   L4595

L471C       CMP   #$D7	; W-RITE VTOC
            BNE   L472B
            LDA   #$02
            STA   RWTS_COMMAND
            JSR   L480B
            JMP   L46DB

L472B       CMP   #$8D	; RETURN
            BEQ   L4731	; OR
            CMP   #$A0	; SPACE
L4731       BNE   L4743
            LDA   $D9
            JSR   L483D
            LDA   L8B00,X
            EOR   $1D
            STA   L8B00,X
            JMP   L4691

L4743       CMP   #$C9	; I
            BEQ   L4749	; OR
            CMP   #$8B	; UP ARROW
L4749       BNE   L4767
            JSR   L47E0
            DEC   $DA
            BPL   L4761
            LDA   #$0F
            STA   $DA
            DEC   $D9
            BPL   L4761
            LDA   LBEFD+1
            STA   $D9
            DEC   $D9
L4761       JSR   L47EB
            JMP   L46DB

L4767       CMP   #$CD	; M
            BEQ   L476D	; OR
            CMP   #$8A	; DOWN ARROW
L476D       BNE   L478C
            JSR   L47E0
            INC   $DA
            LDA   $DA
            AND   #$0F
            BNE   L4761
            STA   $DA
            INC   $D9
            LDA   $D9
            CMP   LBEFD+1
            BCC   L4761
            LDA   #$00
            STA   $D9
            JMP   L4761

L478C       CMP   #$CA	; J
            BEQ   L4792	; OR
            CMP   #$88	; LEFT ARROW
L4792       BNE   L47A5
            JSR   L47E0
            DEC   $D9
            BPL   L4761
            LDA   LBEFD+1
            STA   $D9
            DEC   $D9
            JMP   L4761

L47A5       CMP   #$CB	; K
            BEQ   L47AB	; OR
            CMP   #$95	; RIGHT ARROW
L47AB       BNE   L47C0
            JSR   L47E0
            INC   $D9
            LDA   $D9
            CMP   LBEFD+1
            BCC   L4761
            LDA   #$00
            STA   $D9
            JMP   L4761

L47C0       CMP   #$BF	; ? FILE MAP
            BNE   L47D8
            LDA   $EC
            BEQ   L47D8
            LDA   $E3
            BNE   L47D2
            JSR   L486F
            JMP   L4691

L47D2       JSR   L4945
            JMP   L4691

L47D8       LDA   #$87
            JSR   L1DD0
            JMP   L46DB

L47E0       LDY   $24
            LDA   ($28),Y
            AND   #$3F
            ORA   #$80
            STA   ($28),Y
            RTS

L47EB       LDA   $DA
            CLC
            ADC   #$04
            JSR   L081E
            LDA   $D9
            CMP   #$26
            BCC   L47FD
            LDA   #$25
            STA   $D9
L47FD       TAY
            INY
            INY
            STY   $24
            LDA   ($28),Y
            AND   #$3F
            ORA   #$40
            STA   ($28),Y
            RTS

L480B       LDA   #>RWTS
            LDY   #<RWTS
            JSR   RWTS_ENTRY
            BCS   L4815
            RTS

L4815       LDX   #$FF
            TXS
            LDX   #$27
L481A       LDA   L4A3C,X
            STA   L07D0,X
            DEX
            BPL   L481A
            LDA   #$87
            JSR   L1DD0
L4828       LDA   KBD
            BPL   L4828
            BIT   KBDSTROBE
            LDA   $DB
            STA   RWTS_TRACK
            LDA   $DC
            STA   RWTS_SECTOR
            JMP   L0800

L483D       PHA
            LDA   $E3
            BNE   L4858
            PLA
            ASL
            ASL
            ADC   #$39
            TAX
            LDA   $25
            SEC
            SBC   #$04
            CMP   #$08
            BCC   L4862
            DEX
            SEC
            SBC   #$08
            JMP   L4862

L4858       PLA
            TAX
            LDA   $25
            SEC
            SBC   #$04
            LSR
            EOR   #$07
L4862       STA   $1D
            LDA   #$00
            SEC
L4867       ROL
            DEC   $1D
            BPL   L4867
            STA   $1D
            RTS

L486F       LDA   RWTS_TRACK
            STA   $1E
            LDA   RWTS_SECTOR
            STA   $1F
            LDA   $FC
            STA   RWTS_TRACK
            LDA   $FD
            STA   RWTS_SECTOR
            LDA   #>L9000
            STA   RWTS_BUFFER+1
            LDA   #<L9000
            STA   RWTS_BUFFER
            STA   RWTS_VOLUME
            LDA   #$01
            STA   RWTS_COMMAND
L4895       JSR   L4929
            JSR   L480B
            LDX   #$0C
L489D       LDA   L9000,X
            ORA   L9000+1,X
            BEQ   L48B4
            LDA   L9000,X
            STA   RWTS_TRACK
            LDA   L9000+1,X
            STA   RWTS_SECTOR
            JSR   L4929
L48B4       INX
            INX
            BNE   L489D
            LDA   L9000+1
            ORA   L9000+2
            BEQ   L48CF
            LDA   L9000+1
            STA   RWTS_TRACK
            LDA   L9000+2
            STA   RWTS_SECTOR
            JMP   L4895

L48CF       LDA   #$CF
            STA   L07D0
            LDA   #$D5
            STA   $07D1
            LDA   #$D4
            STA   $07D2
            LDA   #$BA
            STA   $07D3
L48E3       LDA   #$20
            STA   $26
L48E7       DEC   $27
            BNE   L48FA
            DEC   $26
            BNE   L48FA
            LDA   $07D4
            EOR   #$7F
            STA   $07D4
            JMP   L48E3

L48FA       LDA   KBD
            BPL   L48E7
            BIT   KBDSTROBE
            LDA   #$A0
            STA   $07D4
            STA   $07D3
            LDA   #$BA
            STA   $07D2
            LDA   #$CE
            STA   $07D1
            LDA   #$C9
            STA   L07D0
            LDA   $1E
            STA   RWTS_TRACK
            LDA   $1F
            STA   RWTS_SECTOR
            LDA   #>L8B00
            STA   RWTS_BUFFER+1
            RTS

L4929       LDA   RWTS_SECTOR
            CLC
            ADC   #$04
            JSR   L081E
            LDY   RWTS_TRACK
            CPY   #$26
            BCS   L4944
            CPY   LBEFD+1
            BCS   L4944
            INY
            INY
            LDA   #$20
            STA   ($28),Y
L4944       RTS

L4945       LDA   RWTS_TRACK
            STA   $1E
            LDA   RWTS_SECTOR
            STA   $1F
            LDA   $DE
            CMP   #$10
            BNE   L4963
            LDA   $FA
            STA   $00
            LDA   $FB
            STA   $01
            JSR   L4A08
            JMP   L48CF

L4963       LDA   $FA
            STA   $00
            LDA   $FB
            STA   $01
            LDA   #>L9000
            STA   RWTS_BUFFER+1
            LDA   #<L9000
            STA   RWTS_BUFFER
            STA   RWTS_VOLUME
            LDA   #$01
            STA   RWTS_COMMAND
            JSR   L49BD
            LDA   $DE
            CMP   #$20
            BNE   L4989
            JMP   L48CF

L4989       LDX   #$00
L498B       LDA   L9000,X
            STA   L9200,X
            LDA   L9100,X
            STA   L9300,X
            INX
            BNE   L498B
            LDX   #$00
L499C       LDA   L9200,X
            ORA   L9300,X
            BEQ   L49B7
            LDA   L9200,X
            ASL
            STA   $00
            LDA   L9300,X
            ROL
            STA   $01
            STX   $1D
            JSR   L49BD
            LDX   $1D
L49B7       INX
            BPL   L499C
            JMP   L48CF

L49BD       JSR   L4A08
            LDA   $00
            AND   #$0F
            STA   RWTS_SECTOR
            LDA   $00
            LSR
            LSR
            LSR
            LSR
            STA   RWTS_TRACK
            LDA   $01
            ASL
            ASL
            ASL
            ASL
            ORA   RWTS_TRACK
            STA   RWTS_TRACK
            JSR   L480B
            INC   RWTS_BUFFER+1
            INC   RWTS_SECTOR
            JSR   L480B
            DEC   RWTS_BUFFER+1
            LDX   #$00
L49ED       LDA   L9000,X
            ORA   L9100,X
            BEQ   L4A04
            LDA   L9000,X
            ASL
            STA   $00
            LDA   L9100,X
            ROL
            STA   $01
            JSR   L4A08
L4A04       INX
            BNE   L49ED
            RTS

L4A08       LDA   $00
            AND   #$0F
            CLC
            ADC   #$04
            JSR   L081E
            LDA   $00
            LSR
            LSR
            LSR
            LSR
            STA   $02
            LDA   $01
            ASL
            ASL
            ASL
            ASL
            ORA   $02
            TAY
            CPY   #$26
            BCS   L4A3B
            CPY   LBEFD+1
            BCS   L4A3B
            INY
            INY
            LDA   #$20
            STA   ($28),Y
            INC   $25
            JSR   L0821
            LDA   #$20
            STA   ($28),Y
L4A3B       RTS

L4A3C       ASC   "A DISK ERROR HAS OCCURED DURING VTOC I/O"
L4A64       ASC   "THERE IS NO PASCAL VTOC TO SHOW/EDIT!   "
L4A8C       ASC   "T 00000000000000001111111111111111222222"
L4AB4       ASC   "R 0123456789ABCDEF0123456789ABCDEF012345"
L4ADC       ASC   "COMMANDS: [R]EAD NEW VTOC, [W]RITE VTOC "
L4B04       ASC   "          [X]-IT VTOC MODE [?]FILE MAP  "
L4B2C       ASC   "IN:_      [SPACE]UN/USED   [I/J/K/M]MOVE"
L4B54       ASC   " VTOC EDIT MODE "

            DS    $58

            INC   PWREDUP
            LDA   #$50
            STA   $BC75
            LDA   #$D3
            STA   $BCD5
            LDA   #$4B
            STA   $BCF5
            LDY   #$15
            JMP   $BB6D

L4BD3       LDX   #$00
L4BD5       LDA   $5000,X
L4BD8       STA   $9800,X
            INX
            BNE   L4BD5
            INC   L4BD5+2
            INC   L4BD8+2
            LDA   L4BD8+2
            CMP   #$C0
            BNE   L4BD3
            LDX   #$00
L4BED       LDA   $9E51,X
            STA   $03D0,X
            INX
            CPX   #$22
            BNE   L4BED
            LDA   #$22
            STA   $047E
            JMP   L139B

*
* DF.RWTS
*

              PUT   DF.RWTS
