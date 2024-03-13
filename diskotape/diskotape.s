*
* Disk-o-Tape
* (c) 1980, Dann McCreary
*

            TYP   BIN
            ORG   $005100
            MX    %11

*-----------------------------------

CSWL	=	$36
CSWH	=	$37
A1L	=	$3C
A1H	=	$3D

KBD         EQU   $C000
KBDSTROBE   EQU   $C010
PRBL2       EQU   $F94A
HOME        EQU   $FC58
WAIT        EQU   $FCA8
RDCHAR      EQU   $FD35
GETLN       EQU   $FD6A
CROUT       EQU   $FD8E
PRBYTE      EQU   $FDDA
COUT        EQU   $FDED
WRITE       EQU   $FECD
READ        EQU   $FEFD
BELL        EQU   $FF3A

L1000	=	$1000
L5000	=	$5000	; Where the VTOC is loaded

*-----------------------------------

L5100       JMP   L510A

            LDY   $8034
            LDA   #$02
            BNE   L510C

L510A       LDA   #$01	; Read command
L510C       PHA
            LDX   #$14
L510F       LDA   IOB_DFT,X
            STA   IOB,X
            DEX
            BNE   L510F
            PLA
            STA   IOB_COMMAND
            JSR   L5259
            JSR   HOME
            LDA   IOB_COMMAND
            LSR
            BNE   L5131
            JSR   L54E1
            JSR   CROUT
            JMP   L514D

L5131       LDY   #$0A
            JSR   PRINTSTRING
            JSR   CROUT
            LDY   #$25
L513B       LDA   #$FF
            JSR   WAIT
            DEY
            BNE   L513B
            LDY   #$1A
            JSR   PRINTSTRING
            LDY   #$1E
            JSR   PRINTSTRING
L514D       LDY   #$1C
            JSR   PRINTSTRING
            JSR   L52AA
            LDA   #$01
            STA   L55FB
            JSR   CROUT
            LDY   #$0C
            JSR   PRINTSTRING
L5162       JSR   L51D8
            JSR   L51A5
            LDA   IOB_TRACK
            BMI   L5175
            CLC
            ADC   IOB_SECTOR
            CMP   #$00
            BNE   L5162
L5175       LDA   IOB_COMMAND
            LSR
            BNE   L517E
            JMP   L554E

L517E       JSR   CROUT
            LDY   #$08
L5183       JSR   CROUT
            JSR   PRINTSTRING
            JSR   L518F
            JMP   $03D0

L518F       BIT   KBDSTROBE
L5192       LDY   #$07
L5194       LDA   #$FF
            JSR   WAIT
            DEY
            BNE   L5194
            JSR   BELL
            LDA   KBD
            BPL   L5192
            RTS

L51A5       LDA   IOB_COMMAND
            LSR
            BNE   L51DE
L51AB       LDY   #$00
L51AD       LDX   #$03
L51AF       LDA   L52FC,Y
            STA   A1L,X
            INY
            DEX
            BPL   L51AF
            LDA   IOB_COMMAND
            AND   #$01
            BNE   L51D5
            JSR   L5250
            JSR   READ
            PHP
            JSR   L5259
            PLP
            BEQ   L51D4
            JSR   CROUT
            LDY   #$18
            JMP   L52A2
L51D4       RTS
L51D5       JMP   WRITE

L51D8       LDA   IOB_COMMAND
            LSR
            BNE   L51AB
L51DE       LDA   #>L1000
            STA   IOB_BUFFER+1
            STA   A1H
            LDA   #<L1000
            STA   IOB_BUFFER
            STA   A1L
            LDA   IOB_COMMAND
            LSR
            BNE   L5206
            LDA   #$20
            STA   L55F7
            LDY   #$00
            TYA
L51FA       STA   ($3C),Y
            INY
            BNE   L51FA
            INC   A1H
            DEC   L55F7
            BNE   L51FA
L5206       LDA   #$20
            STA   L55F7
            LDA   L55FB
            BEQ   L5215
            DEC   L55FB
            BEQ   L522F
L5215       JSR   L52D5
            LDA   IOB_TRACK
            SEC
            SBC   #$00
            BPL   L522F
            STA   IOB_TRACK
            LDY   L55F7
L5226       LDA   #$D7
            JSR   WAIT
            DEY
            BNE   L5226
            RTS

L522F       JSR   GO_RWTS
            LDA   IOB_TRACK
            JSR   PRBYTE
            LDX   #$01
            JSR   PRBL2
            LDA   IOB_SECTOR
            JSR   PRBYTE
            LDA   #$00
            STA   $24
            INC   IOB_BUFFER+1
            DEC   L55F7
            BNE   L5215
            RTS

L5250       LDA   #<L5262
            STA   CSWL
            LDA   #>L5262
            STA   CSWH
            RTS

L5259       LDA   #$F0
            STA   CSWL
            LDA   #$FD
            STA   CSWH
            RTS

L5262       CMP   #$87
            BEQ   L526A
            PLA
            PLA
            LDA   #$FF
L526A       RTS

*-----------------------------------

PRINTSTRING LDA   L5329,Y	; PRINT STRING
            STA   $01
            LDA   L532A,Y
            STA   $00
            LDY   #$FF
L5277       INY
            LDA   ($00),Y
            ORA   #$80
            JSR   COUT
            LDA   ($00),Y
            BMI   L5277
            RTS

*-----------------------------------

GO_RWTS     LDA   #>IOB
            LDY   #<IOB
            JSR   $03D9
            BCC   L5290
            JSR   L5291
L5290       RTS

L5291       LDA   IOB_ERRCODE
            LDY   #$0E
            CMP   #$10
            BEQ   L52A2
            LDY   #$10
            CMP   #$80
            BEQ   L52A2
            LDY   #$12
L52A2       JSR   PRINTSTRING
            LDY   #$16
            JMP   L5183

*-----------------------------------

L52AA       LDA   #$23
            NOP
            STA   IOB_TRACK
            ASL
            ASL
            CLC
            ADC   #$38
            STA   L55F9
L52B8       LDA   #$00
            STA   L55F8
            LDA   L55F9
            SEC
            SBC   #$04
            TAX
            STX   L55F9
            STX   L55FA
            DEC   IOB_TRACK
            BMI   L52FB
            LDA   #$10
            NOP
            STA   IOB_SECTOR
L52D5       LDX   L55FA
            DEC   IOB_SECTOR
            BMI   L52B8
L52DD       CLC
            LDA   L55F8
            BNE   L52E4
            SEC
L52E4       ROR
            BNE   L52EB
            INX
            STX   L55FA
L52EB       STA   L55F8
            LDA   L55F8
            BEQ   L52DD
            AND   $5000,X
            NOP
            NOP
            STX   L55FA
L52FB       RTS

*---------- Read/Write Tape commands
* Put at A1/A2 ($3C..$3F)
* Code puts it inverted

L52FC       DB    $2F         ;  0 1000/3000
            DB    $FF
            DB    $10
            DB    $00
            DB    $4F         ;  4 3000/5000
            DB    $FF
            DB    $30
            DB    $00
            DB    $54         ;  8 5000/5461
            DB    $60
            DB    $50
            DB    $00
            DB    $34         ;  C 3000/3461
            DB    $60
            DB    $30
            DB    $00
            DB    $54         ; 10 53FE/543F
            DB    $3E
            DB    $53
            DB    $FE
            DB    $30         ; 14 3000/3041
            DB    $40
            DB    $30
            DB    $00

*---------- Default IOB table

IOB_DFT     DB    $01
            DB    $60
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DA    $54DD
            DA    $1000
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $01
            DB    $EF
            DB    $D8

*---------- Pointers to strings (all inverted...)

L5329       DB    >L53C3	; 0 DISK-O-TAPE/PASCAL
L532A       DB    <L53C3
            DB    >L543C	; 1 PLEASE INSERT DISK TO BE COPIED
            DB    <L543C
            DB    >L5418	; 2 COPYRIGHT
            DB    <L5418
            DB    >L5498	; 3 PLEASE REWIND TAPE...
            DB    <L5498
            DB    >L536A	; 4 COPY DONE
            DB    <L536A
            DB    >L5374	; 5 COPY TAPE -> DISK
            DB    <L5374
            DB    >L5386	; 6 TK/SC
            DB    <L5386
            DB    >L538C	; 7 DISK WRITE PROTECTED
            DB    <L538C
            DB    >L53A1	; 8 DISK READ ERROR
            DB    <L53A1
            DB    >L53B1	; 9 DISK DRIVE ERROR
            DB    <L53B1
            DB    >L545C	; A COPY DISK -> TAPE
            DB    <L545C
            DB    >L534F	; B COPY ABORT
            DB    <L534F
            DB    >L535A	; C TAPE READ ERROR
            DB    <L535A
            DB    >L53D6	; D DISK NAME
            DB    <L53D6
            DB    >L53DF	; E " "
            DB    <L53DF
            DB    >L53C2	; F :
            DB    <L53C2
            DB    >L546E	; 10 ERROR DURING
            DB    <L546E
            DB    >L547B	; 11 TAPE VERIFY
            DB    <L547B
            DB    >L5488	; 12 VERIFY COMPLETE
            DB    >L5488

L534F       ASC   "COPY ABORT"0D
L535A       ASC   "TAPE READ ERROR"0D
L536A       ASC   "COPY DONE"0D
L5374       ASC   "COPY TAPE -> DISK"0D
L5386       ASC   "TK/SC"0D
L538C       ASC   "DISK WRITE PROTECTED"0D
L53A1       ASC   "DISK READ ERROR"0D
L53B1       ASC   "DISK DRIVE ERROR"0D
L53C2       ASC   ':'
L53C3       ASC   "DISK-O-TAPE/PASCAL"0D
L53D6       ASC   "DISK NAM"
            ASC   'E'
L53DF       ASC   " "
L53E0       ASC   "SPACE RESERVED FOR DISK NAME "0D
L53FE       ASC   "200.240R 5000.5460R 5103G"8D
L5418       ASC   "COPYRIGHT (C) 1980 BY DANN MCCREARY"0D
L543C       ASC   "PLEASE INSERT DISK TO BE COPIED"0D
L545C       ASC   "COPY DISK -> TAPE"0D
L546E       ASC   "ERROR DURING "
L547B       ASC   "TAPE VERIFY"8D0D
L5488       ASC   "VERIFY COMPLETE"0D
L5498       ASC   "PLEASE REWIND TAPE, START"8D
            ASC   "RECORDER AND PRESS RETURN"0D

*-----------------------------------

IOB         DB    $01	; 0 IOB type
            DB    $60	; 1 Slot number * 16
            DB    $01	; 2 Disk drive
            DB    $00	; 3 Expected volume number
IOB_TRACK   DB    $00	; 4 Track
IOB_SECTOR  DB    $00	; 5 Sector
            DA    L54DD
IOB_BUFFER  DA    $1000	; 8 Buffer
            DB    $00
            DB    $00
IOB_COMMAND DB    $00	; Command
IOB_ERRCODE DB    $00	; Error code
            DB    $00
            DB    $60
            DB    $01
L54DD       DB    $00	; DCT
            DB    $01
            DB    $EF
            DB    $D8

*-----------------------------------

            MX    %11

L54E1       LDY   #$00
            JSR   PRINTSTRING
            LDY   #$04
            JSR   PRINTSTRING
            JSR   CROUT
            LDY   #$02
            JSR   PRINTSTRING
            JSR   CROUT
            LDY   #$1A
            JSR   PRINTSTRING
            LDA   #$BF
            STA   |$0033
            JSR   GETLN
            CPX   #$1D
            BCC   L5509
            LDX   #$1D
L5509       LDA   #$0D
            STA   L53E0,X
L550E       LDA   $0200,X
            STA   L53DF,X
            DEX
            BPL   L550E
            JSR   CROUT
            LDY   #$06
            JSR   PRINTSTRING
            JSR   RDCHAR
            JSR   CROUT
            LDY   #$14
            JSR   PRINTSTRING
            LDY   #$10
            JSR   L51AD
            JSR   L5537	; read VTOC
            LDY   #$08
            JMP   L51AD

*---------- Read (write?) VTOC

L5537       LDA   #$00
            STA   IOB_SECTOR
            LDA   #$11
            STA   IOB_TRACK
            LDA   #>L5000
            STA   IOB_BUFFER+1
            LDA   #<L5000
            STA   IOB_BUFFER
            JMP   GO_RWTS

*----------

L554E       JSR   HOME
            LDY   #$22
            JSR   PRINTSTRING
            LDY   #$06
            JSR   PRINTSTRING
            JSR   L518F
            LDA   #$01
            STA   IOB_COMMAND
            JSR   L5537
            LDY   #$14
            JSR   L55B9
            LDY   #$0C
            JSR   L55B9
            JSR   L52AA
            LDA   #$01
            STA   L55FB
            JSR   CROUT
            LDY   #$1C
            JSR   PRINTSTRING
            LDY   #$0C
            JSR   PRINTSTRING
L5585       LDA   #$01
            STA   IOB_COMMAND
            JSR   L51DE
            LDY   #$04
            JSR   L55B9
            LDA   IOB_TRACK
            BMI   L559F
            CLC
            ADC   IOB_SECTOR
            CMP   #$00
            BNE   L5585
L559F       JSR   CROUT
            LDY   #$24
            JMP   L5183

L55A7       LDX   #$07
L55A9       CPX   #$05
            BNE   L55AF
            DEX
            DEX
L55AF       LDA   L52FC,Y
            STA   A1L,X
            INY
            DEX
            BPL   L55A9
            RTS

L55B9       STY   L55FE
            LDA   #$02
            STA   IOB_COMMAND
            JSR   L51AD
            LDY   L55FE
            DEY
            DEY
            JSR   L55A7
            JSR   L55E4
            LDY   #$00
            JSR   $FE36
            PHP
            JSR   L5259
            PLP
            BCS   L55E3
            JSR   CROUT
            LDY   #$20
            JMP   L52A2
L55E3       RTS

L55E4       LDA   #<L55ED
            STA   CSWL
            LDA   #>L55ED
            STA   CSWH
            RTS

L55ED       CMP   #$87
            BEQ   L55F5
            PLA
            PLA
            PLA
            PLA
L55F5       CLC
            RTS

L55F7       DB    $00
L55F8       DB    $00
L55F9       DB    $00
L55FA       DB    $00
L55FB       DB    $00
            DB    $00
            DB    $00
L55FE       DB    $00
            DB    $51

