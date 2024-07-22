*
* Moon Patrol
*
* (c) 1982, Williams
* (c) 1983, Atari
* (s) 2024, Antoine Vignau
*

            ORG   $0800
            MX    %11

*-----------------------------------
* FIRMWARE EQUATES
*-----------------------------------

KBD         EQU   $C000
KBDSTROBE   EQU   $C010
TAPEOUT     EQU   $C020
SPKR        EQU   $C030
TXTCLR      EQU   $C050
TXTSET      EQU   $C051
MIXCLR      EQU   $C052
TXTPAGE1    EQU   $C054
TXTPAGE2    EQU   $C055
HIRES       EQU   $C057
BUTN0       EQU   $C061
RESET       EQU   $FA62
PREAD       EQU   $FB1E
WAIT        EQU   $FCA8

*-----------------------------------
* GAME VARIABLES
*-----------------------------------

NB_LIVES	=	4	; which are 3+1 as the programmer uses BNE and not BPL for the end

P1_courseTYPE =	$200	; byte - beginner or champion course for P1
P2_courseTYPE =	$201	; byte - beginner or champion course for P2
P1_point	=	$202	; byte - point reached by P1
P2_point	=	$203	; byte - point reached by P2
P1_score	=	$204	; adr  - $204 and $206 and $208
P2_score	=	$205	; adr  - $205 and $207 and $209
coursePTR1	=	$20a	; word - $20a and $20c
coursePTR2	=	$20b	; word - $20b and $20d
P1_basePOINT =	$20e	; byte - current base point of P1
P2_basePOINT =	$20f	; byte - current base point of P2
P1_plrCOURSE =	$210	; word - $210 and $212
P2_plrCOURSE =	$211	; word - $211 and $213
P1_nbLIVES	=	$214	; byte
P2_nbLIVES	=	$215	; byte
courseTYPE	=	$216	; byte - 0 = beginner, 1 = champion
nbPLAYERS	=	$217	; byte - 0 = 1 player, 1 = 2 players
nbLIVES	=	$218	; byte - nb lives + 1
fgINPUT	=	$219	; byte - 0 = keyboard, 1 = joystick
theBONUS	=	$21a	; adr  - $21a and $21b and $21c - bonus to add to score
charWAIT	=	$21d	; byte - time to wait between drawing two chars
curRANGE	=	$21e	; byte - 0/2/4/6/8 mean A/E/J/O/T
fgBONUS	=	$21f	; byte - 0 = bonus, 1 = no bonus
fgBESTTIME	=	$220	; byte - 0 = no best time, 1 = best time
* $221 is not used
fgDEMO	=	$222	; byte - 0 = game mode, 1 = demo mode (replay?)
demoINDEX	=	$223	; byte - index for demo data
demoCNT	=	$224	; byte - demo frame counter * $224
fgDEMO2	=	$225	; byte - 0 = game mode, 1 = demo mode
coursePTR3	=	$226	; word - pointer to course data
coursePTR4	=	$228	; word - pointer to course data 
curPLAYER	=	$22a	; byte - 0 = player 1, 1 = player 2
P1_time	=	$22b	; word - and $22d
P2_time	=	$22c	; word - and $22e
highSCORE	=	$22f	; adr  - the high score
timePLAYER	=	$232	; word - player time on course range (A to E, E to J...)
courseTYPE_unused =	$234	; byte - copy of courseTYPE (unused)
fgBLINK	=	$235	; byte -0/1 = blinks 1UP/2UP

L0300	=	$300

*-----------------------------------
* GAME ZERO PAGE
*-----------------------------------

ptrSCREEN	=	00	; word - pointer to the HGR screen
ptrSTRING	=	$05	; word - pointer to a character string
theACCEL	=	$10	; byte - the car acceleration
fgSOUND	=	$35	; byte - 0 = $C030, 1 = $C020
mountX1	=	$41	; byte - x-index within mountain
mountX2	=	$42	; byte - data to determine where to
mountX3	=	$43	; byte - start drawing, that makes the move
frameCNT	=	$49	; byte - frame counter
groundSTARTX = 	$6e	; byte - x-col where to start drawing ground (0 or 34 if moon base)
plrPOINT	=	$78	; byte - point reached by the current player
plrSCORE	=	$7a	; adr  - score of player
plrTIME	=	$7d	; word - time of player
avgTIME	=	$7f	; word - average time
basePOINT	=	$98	; byte - start point (0 for A, 4 for E...)
plrCOURSE	=	$99	; word - player's pointer within the course
charX	=	$a6
charY	=	$a7
slot16	=	$d0
fgINPUT2	=	$ef
courseTYPE2	=	$f0
nbPLAYERS2	=	$f1

*-----------------------------------
* DISK ROUTINES
*-----------------------------------

L0800       JMP   L0919

L0803       STX   $E0	; move arm
            STA   $E1
            CMP   |$00FF
L080A       BEQ   L085F
            LDA   #$00
            STA   $E2
L0810       LDA   |$00FF
            STA   $E3
            SEC
            SBC   $E1
L0818       BEQ   L084D
            BCS   L0823
            EOR   #$FF
            INC   |$00FF
            BCC   L0828
L0823       ADC   #$FE
            DEC   |$00FF
L0828       CMP   $E2
            BCC   L082E
            LDA   $E2
L082E       CMP   #$0C
            BCS   L0833
            TAY
L0833       SEC
            JSR   L0851
            LDA   L08F8,Y
            JSR   L0863
            LDA   $E3
            CLC
            JSR   L0854
            LDA   L0904,Y
            JSR   L0863
            INC   $E2
            BNE   L0810
L084D       JSR   L0863
            CLC
L0851       LDA   |$00FF
L0854       AND   #$03
            ROL
            ORA   $E0
            TAX
            LDA   $C080,X
            LDX   $E0
L085F       RTS

            TAX	; or "*  "
            LDY   #$A0

L0863       LDX   #$11
L0865       DEX
            BNE   L0865
            INC   $E4
            BNE   L086E
            INC   $E5
L086E       SEC
            SBC   #$01
            BNE   L0863
            RTS

*-----------------------------------
* LOAD MOON BASE FROM DISK
*-----------------------------------

loadMOONBASEPIC
            LDA   $26
            PHA
            LDA   $26+1
            PHA
            LDA   $2B
            PHA
            LDA   $3D
            PHA
            LDA   $41
            PHA
            LDA   $FE
            PHA
            LDA   slot16
            STA   $2B
            LSR
            LSR
            LSR
            LSR
            ORA   #$C0
            STA   L08D8+2
            LDA   #$00
            STA   $E8
L0897       LDA   $E8
            ASL
            TAX
            LDA   L0910+1,X	; RAM
            STA   $26+1
            LDA   #$00
            STA   $26
            LDA   L0910,X	; phase
            BNE   L08C1
            LDX   slot16
            STA   $C088,X
            PLA
            STA   $FE
            PLA
            STA   $41
            PLA
            STA   $3D
            PLA
            STA   $2B
            PLA
            STA   $26+1
            PLA
            STA   $26
            RTS

L08C1       PHA
            LSR	; phase / 2 =
            STA   $41	; track
            PLA
            LDX   slot16
            JSR   L0803	; move head
            LDA   #$00	; sector 0
            STA   $FE
L08CF       LDY   $FE
            LDA   L08E8,Y ; take interleaving
            STA   $3D
            LDX   slot16
L08D8       JSR   $FF5C	; read sector
            INC   $FE
            LDA   $FE
            CMP   #$08	; until sector 8
            BNE   L08CF
            INC   $E8	; next phase
            JMP   L0897

L08E8       HEX   000D0B09070503010E0C0A080604020F
L08F8       HEX   01302824201E1D1C1C1C1C1C
L0904       HEX   702C26221F1E1D1C1C1C1C1C
L0910       HEX   2C402E483050325800	; phase 2C++, RAM $4000++

*-----------------------------------
* ENTRY POINT
*-----------------------------------

L0919       LDA   #$2A
            STA   |$00FF
            LDA   #$00
            STA   highSCORE
            STA   highSCORE+1
            STA   highSCORE+2

            STA   $00	; move $8000..$83ff to $bc00..$bfff
            LDA   #$80
            STA   $00+1
            LDA   #$00
            STA   $02
            LDA   #$BC
            STA   $02+1
            LDY   #$00
L0939       LDA   ($00),Y
            STA   ($02),Y
            INY
            BNE   L0939
            INC   $00+1
            INC   $02+1
            LDA   $02+1
            CMP   #$C0
            BNE   L0939

            LDA   #$00	; move $8500..$90ff to $b000..$bbff
            STA   $00
            LDA   #$85
            STA   $00+1
            LDA   #$00
            STA   $02
            LDA   #$B0
            STA   $02+1
            LDY   #$00
L095C       LDA   ($00),Y
            STA   ($02),Y
            INY
            BNE   L095C
            INC   $00+1
            INC   $02+1
            LDA   $02+1
            CMP   #$BC
            BNE   L095C
            JSR   L1A52
            JSR   L0A29
            JMP   entryPOINT	; go to the game

*-----------------------------------
* COURSE ENTRY POINT
*-----------------------------------

goCOURSE    LDX   #$08		; erase "xxx COURSE GO"
            LDY   #$4E
            JSR   printSTRING
            ASC   "                        @"

*--- This is the main game loop

L0996       LDX   #$00
            TXS
            JSR   L0C27
            LDA   frameCNT
            AND   #$07
            BNE   L09A5
            JSR   L32DF
L09A5       INC   frameCNT
            LDA   frameCNT
            AND   #$01
            BNE   L09B0
            JSR   drawMOUNTAINS
L09B0       DEC   $F3
            BPL   L09BB
            LDA   #$16
            STA   $F3
            JSR   printTIME
L09BB       LDA   $DD
            BNE   L09C6
            LDA   $96
            BNE   L09C6
            JMP   L09CC

L09C6       JSR   L3158
            JSR   L0FB2
L09CC       JSR   L1471
            JSR   L0E9A
            JSR   L164F
            JSR   L1FB0
            JSR   L2FD8
            JSR   L3693
            JSR   L3713
            JSR   L103E
            JSR   L35DD
            JSR   L13AD
            JSR   L2474
            JSR   L227E
            JSR   L21C0
            LDA   $70
            BEQ   L09FA
            JMP   L2D02

L09FA       JSR   L0AC5
            JSR   L11E7
            JSR   L18C5
            JSR   L2148
            JSR   L3B32
            JSR   L1797
            JSR   L12DE
            BEQ   L0A26
            JSR   L3333
            JSR   L1371
            JSR   L3898
            JSR   L37C7
            JSR   L37A2
            JSR   L12DE
            JSR   L383B
L0A26       JMP   L0996

*-----------------------------------
* 
*-----------------------------------

L0A29       LDA   #$00
            STA   fgDEMO
            LDA   #$00
            STA   curPLAYER

L0A33       LDA   #$22
            STA   groundSTARTX
            LDA   #$15
            STA   mountX1
            STA   mountX3
            LDA   #$00
            STA   $28
            STA   $29
            STA   $C0
            STA   $BB
            STA   $BD
            LDA   #$0E
            STA   $46
            LDA   #$10
            STA   $6D
            LDA   #$01
            STA   $6F
            STA   $67
            STA   $54
            STA   $97
            LDA   #$04
            STA   $AF
            LDA   #$FF
            STA   plrPOINT
            LDA   #$FF
            STA   $4A
            LDA   #$00
            STA   basePOINT
            STA   $DD
            STA   $96
            STA   $70
            STA   frameCNT
            STA   $39
            STA   $31
            STA   $23
            STA   $48
            LDA   #$70
            STA   $5B
            SEC
            SBC   #$04
            STA   $57
            LDA   #$7A
            STA   $5D
            LDA   #$8A
            STA   $5F
            LDA   #$85
            STA   $58
            LDA   #$8E
            STA   $5C
            STA   $5E
            STA   $60
            LDA   #$70
            STA   $0F
            LDA   #$02
            STA   $07
            LDA   #$00
            STA   theACCEL
            STA   $13
            STA   $1A
            JSR   L0AAC
            RTS

*-----------------------------------
* 
*-----------------------------------

L0AAC       LDX   #$02
            LDA   #$00
L0AB0       STA   $E8,X		; $E8..$E9..$EA
            STA   $EB,X		; $EB..$EC..$ED
            DEX
            BPL   L0AB0
            RTS

*-----------------------------------
* SHOW HGR PAGE2
*-----------------------------------

showHGRPAGE2
            BIT   HIRES
            BIT   MIXCLR
            BIT   TXTCLR
            BIT   TXTPAGE2
            RTS

*-----------------------------------
* 
*-----------------------------------

L0AC5       LDA   $59
            ORA   courseTYPE
            TAX
            LDA   #$01
            LDY   $5A
            JSR   undrawSPRITE
            LDA   $61
            ORA   courseTYPE
            TAX
            LDA   #$00
            LDY   $62
            JSR   undrawSPRITE
            LDA   $63
            ORA   courseTYPE
            TAX
            LDA   #$00
            LDY   $64
            JSR   undrawSPRITE
            LDA   $65
            ORA   courseTYPE
            TAX
            LDA   #$00
            LDY   $66
            JSR   undrawSPRITE
L0AF9       LDA   $57
            ORA   courseTYPE
            TAX
            LDY   $58
            LDA   #$01
            JSR   drawSPRITE
            LDA   $5B
            ORA   courseTYPE
            TAX
            LDA   #$00
            LDY   $5C
            JSR   drawSPRITE
            LDA   $5D
            ORA   courseTYPE
            TAX
            LDA   #$00
            LDY   $5E
            JSR   drawSPRITE
            LDA   $5F
            ORA   courseTYPE
            TAX
            LDA   #$00
            LDY   $60
            JSR   drawSPRITE
            LDA   $67
            BNE   L0B78
            LDA   $0F
            CLC
            ADC   theACCEL
            CMP   #$2C
            BCS   L0B49
            LDA   #$2C
            STA   $0F
            LDA   #$00
            STA   theACCEL
            LDA   #$02
            STA   $07
            JMP   L0B78

L0B49       CMP   #$6D
            BCC   L0B5C
            LDA   #$6C
            STA   $0F
            LDA   #$02
            STA   $07
            LDA   #$00
            STA   theACCEL
            JMP   L0B78

L0B5C       STA   $0F
            CMP   #$37
            BCS   L0B69
            LDA   #$04
            STA   $AF
            JMP   L0B78

L0B69       CMP   #$56
            BCS   L0B74
            LDA   #$06
            STA   $AF
            JMP   L0B78

L0B74       LDA   #$06
            STA   $AF

L0B78       LDA   $57
            STA   $59
            LDA   $58
            STA   $5A
            LDA   $5B
            STA   $61
            LDA   $5D
            STA   $63
            LDA   $5F
            STA   $65
            LDA   $5C
            STA   $62
            LDA   $5E
            STA   $64
            LDA   $60
            STA   $66
            LDA   $0F
            STA   $5B
            SEC
            SBC   #$04
            STA   $57
            CLC
            ADC   #$0E
            STA   $5D
            CLC
            ADC   #$10
            STA   $5F
            LDA   $6D
            BMI   L0BB2
            JMP   L238D

L0BB2       LDA   $13
            BEQ   L0BB9
            JMP   L0F7D

L0BB9       LDA   #$02
            JSR   L26EC
            SEC
            SBC   #$01
            ADC   $5C
            STA   $5C
            LDA   #$02
            JSR   L26EC
            SEC
            SBC   #$01
            ADC   $60
            STA   $60
            LDA   #$02
            JSR   L26EC
            SEC
            SBC   #$01
            ADC   $5E
            STA   $5E
            LDA   $5C
            CMP   #$8D
            BNE   L0BE7
            LDA   #$8F
            STA   $5C
L0BE7       LDA   $5C
            CMP   #$92
            BNE   L0BF1
            LDA   #$8F
            STA   $5C
L0BF1       LDA   $5E
            CMP   #$8D
            BNE   L0BFB
            LDA   #$8F
            STA   $5E
L0BFB       LDA   $5E
            CMP   #$92
            BNE   L0C05
            LDA   #$8F
            STA   $5E
L0C05       LDA   $60
            CMP   #$8D
            BNE   L0C0F
            LDA   #$8F
            STA   $60
L0C0F       LDA   $60
            CMP   #$92
            BNE   L0C19
            LDA   #$8F
            STA   $60
L0C19       LDA   $5E
            SEC
            SBC   $5C
            CLC
            ADC   #$86
            STA   $58
            RTS
L0C24       JMP   L2773

*-----------------------------------
* 
*-----------------------------------

L0C27       LDA   fgDEMO2
            BEQ   L0C6E
            LDA   KBD
            BPL   L0C47
            CMP   #" "
            BNE   L0C47

            LDA   fgINPUT2	; save parms
            STA   fgINPUT
            LDA   courseTYPE2
            STA   courseTYPE
            LDA   nbPLAYERS2
            STA   nbPLAYERS
            JMP   L2773

L0C47       DEC   demoCNT
            BNE   L0C6D
            INC   demoINDEX
            LDX   demoINDEX
            LDA   demoDATA,X
            CMP   #$FF
            BEQ   L0C24
            PHA
            INC   demoINDEX
            LDX   demoINDEX
            LDA   demoDATA,X
            CLC
            ADC   #$01
            STA   demoCNT
            PLA
            JMP   L0C80
L0C6D       RTS

*-----------------------------------
* 
*-----------------------------------

L0C6E       LDA   KBD		; is key pressed?
            BMI   L0C80		; yes

            LDA   fgDEMO
            BEQ   L0C7B
            INC   demoINDEX
L0C7B       LDA   #$FF
            JMP   L0CDA

L0C80       BIT   KBDSTROBE	; yes, handle keypress
            STA   $00	; save key

            LDA   fgDEMO	; are we in demo mode?
            BEQ   L0CA6		; no

            LDA   demoINDEX	; yes, grab the data
            LDX   demoCNT
            STA   L0300,X	; save value
            INC   demoCNT
            LDX   demoCNT
            LDA   $00
            STA   L0300,X	; save key
            INC   demoCNT
            LDA   #$00
            STA   demoINDEX

L0CA6       LDA   $00
            CMP   #$9B	; esc
            BNE   L0CB2
            JSR   doPAUSE
            JMP   L0CDA

L0CB2       CMP   #"R"
            BNE   L0CC6
            LDA   #$01
            STA   fgDEMO
            LDA   #$00
            STA   demoINDEX
            STA   demoCNT
            JMP   L0CDA

L0CC6       CMP   #$8F	; ctrl-o
            BNE   L0CD3
            JSR   L3666
            JSR   showHGRPAGE2
            JMP   L2773

L0CD3       CMP   #$91	; ctrl-q
            BNE   L0CDA
            JMP   RESET

L0CDA       PHA
            LDA   fgINPUT
            BEQ   L0CE4
            PLA
            JMP   L0DC1

L0CE4       PLA
            CMP   #" "	; space to fire
            BNE   L0CEC
            JMP   L0E26

L0CEC       CMP   #"A"	; A to jump
            BNE   L0CF3
            JMP   L0D3F

L0CF3       CMP   #$88	; left arrow
            BNE   L0CFA
            JMP   L0D1D

L0CFA       CMP   #$95	; right arrow
            BNE   L0D01
            JMP   L0D2E

L0D01       CMP   #$FF	; delete
            BEQ   L0D09

            LDA   #$00	; all other keys stop the vehicle
            STA   theACCEL

L0D09       CMP   #$91	; ctrl-q
            BNE   L0D10
            JMP   $C600

L0D10       RTS

*--- Dead code

            LDA   #$00
            STA   fgINPUT
            RTS

            LDA   #$01
            STA   fgINPUT
            RTS

*-----------------------------------
* Hand
*-----------------------------------

L0D1D       LDA   $13
            BNE   L0D2D
            LDA   #$FC
            STA   theACCEL
            LDA   #$00
            STA   $9C
            LDA   #$01
            STA   $07
L0D2D       RTS

L0D2E       LDA   $13
            BNE   L0D3E
            LDA   #$04
            STA   theACCEL
            LDA   #$00
            STA   $9C
            LDA   #$03
            STA   $07
L0D3E       RTS

L0D3F       LDA   $13
            BNE   L0D55
            LDA   #$00
            STA   theACCEL
            STA   $15
            LDA   #$04
            STA   $14
            LDA   #$02
            STA   $07
            LDA   #$01
            STA   $13
L0D55       RTS

*-----------------------------------
* PAUSE MODE
*-----------------------------------

doPAUSE     BIT   KBDSTROBE	; reset keyboard
            LDA   #$DB		; set counters
            STA   $00
            LDA   #$98
            STA   $01
            LDA   #$EA
            STA   $02
L0D65       LDA   KBD		; exit if keypress
            BMI   L0D99
            DEC   $00		; or decrease counters
            BNE   L0D70
            DEC   $01
L0D70       BNE   L0D74
            DEC   $02
L0D74       BNE   L0D65
L0D76       JSR   invertSCREEN	; invert screen at 0

            LDA   #$E4		; set counters
            STA   $00
            LDA   #$C4
            STA   $01
            LDA   #$08
            STA   $02
L0D85       LDA   KBD		; exit if keypress
            BMI   L0D99
            DEC   $00		; or decrease counters
            BNE   L0D90
            DEC   $01
L0D90       BNE   L0D94
            DEC   $02
L0D94       BNE   L0D85
            JMP   L0D76		; and loop

L0D99       LDA   L4000		; on exit, check if
            BPL   L0DA1		; the screen was inverted
            JSR   invertSCREEN	; restore to normal
L0DA1       BIT   KBDSTROBE
            RTS

*-----------------------------------
* INVERT THE SCREEN
*-----------------------------------

invertSCREEN
            LDA   #<L4000
            STA   $00
            LDA   #>L4000
            STA   $00+1
            LDY   #$00
L0DAF       LDA   ($00),Y
            EOR   #$FF
            STA   ($00),Y
            INY
            BNE   L0DAF
            INC   $00+1
            LDA   $00+1
            CMP   #>tblXINDEX
            BNE   L0DAF
L0DC0       RTS

*-----------------------------------
* READ JOYSTICK
*-----------------------------------

L0DC1       LDX   #$01		; read Y
            JSR   PREAD
            TYA
            CMP   #$76
            BCS   L0DCE
            JSR   L0D3F
L0DCE       LDA   BUTN0
            STA   $00
            EOR   $9E
            BPL   L0DE3
            LDA   $00
            BPL   L0DE3
            STA   $9E
            JSR   L0E26
            JMP   L0DE7

L0DE3       LDA   $00
            STA   $9E
L0DE7       LDX   #$00
            JSR   PREAD
            TYA
            CMP   #$76
            BCS   L0DF5
            JSR   L0D1D
            RTS

L0DF5       LDX   #$00		; read X
            JSR   PREAD
            TYA
            CMP   #$8A
            BCC   L0E03
            JSR   L0D2E
            RTS

L0E03       LDA   $0F
            CMP   #$4A
            BEQ   L0E1D
            BCC   L0E14
            LDA   $13
            BNE   L0E1D
            LDA   #$FE
            STA   theACCEL
            RTS
L0E14       LDA   $13
            BNE   L0E1D
            LDA   #$02
            STA   theACCEL
            RTS
L0E1D       LDA   #$00		; no decrease/increase in speed
            STA   theACCEL
            RTS

*-----------------------------------
* BEEPS THE SPEAKER OR THE TAPE
*-----------------------------------

doBEEP      STA   SPKR
            RTS

*-----------------------------------
* 
*-----------------------------------

L0E26       LDA   $1A
            BNE   L0E4B
            LDA   #$00
            STA   $9D
            LDA   $57
            CLC
            ADC   #$2E
            BCS   L0E4B
            STA   $1A
            LDA   $58
            CLC
            ADC   #$09
            STA   $1B
            LDA   #$04
            STA   $1C
            LDA   #$03
            LDX   $1A
            LDY   $1B
            JSR   drawSPRITE
L0E4B       LDX   #$00
L0E4D       LDA   LB049,X
            BEQ   L0E58
            INX
            CPX   #$04
            BNE   L0E4D
            RTS

L0E58       LDA   #$00
            STA   LB059,X
            LDA   $57
            CLC
            ADC   #$05
            STA   LB049,X
            STA   LB051,X
            LDA   $58
            SEC
            SBC   #$0B
            STA   LB04D,X
            STA   LB055,X
            TAY
            LDA   LB049,X
            TAX
            LDA   #$02
            JSR   drawSPRITE
            LDY   #$00
            LDA   #$1A
            STA   $00
L0E83       JSR   doBEEP
L0E86       DEY
            BNE   L0E91
            DEC   $00
            LDA   $00
            CMP   #$10
            BEQ   L0E99
L0E91       DEX
            BNE   L0E86
            LDX   $00
            JMP   L0E83
L0E99       RTS

L0E9A       LDA   $1A
            BEQ   L0F19
            LDA   $1C
            BPL   L0EF5
            CMP   #$FF
            BNE   L0ECF
            LDA   #$03
            LDX   $1A
            LDY   $1B
            JSR   undrawSPRITE
            LDA   #$04
            STA   $11
            LDA   $1B
            SEC
            SBC   #$05
            STA   $1B
            LDA   $1A
            SEC
            SBC   #$04
            STA   $1A
            LDA   $11
            LDX   $1A
            LDY   $1B
            JSR   drawSPRITE
            DEC   $1C
            JMP   L0F19

L0ECF       LDX   $1A
            LDY   $1B
            LDA   $11
            JSR   undrawSPRITE
            LDA   $11
            CMP   #$07
            BNE   L0EE5
            LDA   #$00
            STA   $1A
            JMP   L0F19

L0EE5       STA   $11
            INC   $11
            LDX   $1A
            LDY   $1B
            JSR   drawSPRITE
            DEC   $1C
            JMP   L0F19

L0EF5       LDA   #$03
            LDX   $1A
            LDY   $1B
            JSR   undrawSPRITE
            LDA   $1A
            CLC
            ADC   #$0C
            STA   $1A
            TAX
            LDY   $1B
            LDA   #$03
            JSR   drawSPRITE
            LDA   $1A
            CMP   #$F5
            BCC   L0F17
            LDA   #$00
            STA   $1C
L0F17       DEC   $1C
L0F19       LDX   #$00
L0F1B       LDA   LB051,X
            BNE   L0F28
L0F20       INX
            CPX   #$04
            BNE   L0F1B
            JMP   L0F5A

L0F28       STX   $16
            PHA
            LDA   LB055,X
            TAY
            PLA
            TAX
            LDA   #$02
            JSR   undrawSPRITE
            LDX   $16
            LDA   LB059,X
            BNE   L0F4F
            LDA   LB04D,X
            TAY
            LDA   LB049,X
            TAX
            LDA   #$02
            JSR   drawSPRITE
            LDX   $16
            JMP   L0F20

L0F4F       LDA   #$00
            STA   LB049,X
            STA   LB051,X
            JMP   L0F20

L0F5A       LDX   #$00
L0F5C       LDA   LB049,X
            STA   LB051,X
            LDA   LB04D,X
            STA   LB055,X
            SEC
            SBC   #$09
            CMP   #$25
            BCS   L0F74
            LDA   #$01
            STA   LB059,X
L0F74       STA   LB04D,X
            INX
            CPX   #$04
            BNE   L0F5C
            RTS

L0F7D       LDA   $58
            SEC
            SBC   $14
            STA   $58
            CLC
            ADC   #$08
            STA   $5C
            STA   $5E
            STA   $60
            LDA   $15
            SEC
            SBC   #$04
            BPL   L0F99
            DEC   $14
            CLC
            ADC   #$0A
L0F99       STA   $15
            LDA   $58
            CMP   #$86
            BCC   L0FB1
            LDA   #$00
            STA   $13
            LDA   #$86
            STA   $58
            LDA   #$8F
            STA   $5C
            STA   $5E
            STA   $60
L0FB1       RTS

L0FB2       LDA   $96
            SEC
            SBC   $AF
            STA   $96
            BCS   L0FC1
            LDA   $DD
            BEQ   L0FC2
            DEC   $DD
L0FC1       RTS

L0FC2       LDA   #$00
            STA   $96
            STA   $DD
            RTS

*-----------------------------------
* DRAW GAME AREA
*-----------------------------------

L0FC9       LDA   #$00
            STA   groundSTARTX
            JSR   drawGROUNDLINES	; draw ground lines

            LDA   #$98		; clear screen middle area
            STA   $00
L0FD4       LDX   $00
            LDA   tblHGRH,X
            STA   $26+1
            LDA   tblHGRL,X
            STA   $26
            LDY   #$27
            LDA   #$80
            CPX   #$55
            BCS   L0FEA
            LDA   #$00
L0FEA       STA   ($26),Y
            DEY
            BPL   L0FEA
            DEC   $00
            LDA   $00
            CMP   #$23
            BNE   L0FD4

            LDA   #$BF		; make orange ground
            STA   $00
L0FFB       LDX   $00
            LDA   tblHGRH,X
            STA   $26+1
            LDA   tblHGRL,X
            STA   $26
            LDY   #$00
L1009       LDA   #$AA
            STA   ($26),Y
            INY
            LDA   #$D5
            STA   ($26),Y
            INY
            CPY   #$28
            BNE   L1009
            DEC   $00
            LDA   $00
            CMP   #$9B
            BNE   L0FFB

            LDA   #$00
            STA   $1A
            LDX   #$03
L1025       STA   LB34B,X
            STA   LB3DE,X
            STA   LB413,X
            STA   LB049,X
            STA   LB051,X
            STA   LB42A,X
            STA   LB387,X
            DEX
            BPL   L1025
            RTS

*-----------------------------------
* 
*-----------------------------------

L103E       LDX   #$02
L1040       LDA   $E8,X
            BNE   L1048
L1044       DEX
            BPL   L1040
            RTS

L1048       STX   $DE
            LDY   $E5,X
            LDA   $E8,X
            PHA
            LDA   $E2,X
            TAX
            PLA
            JSR   drawSPRITE3
            LDX   $DE
            DEC   $EB,X
            BEQ   L106D
            LDY   $E5,X
            LDA   $E8,X
            PHA
            LDA   $E2,X
            TAX
            PLA
            JSR   drawSPRITE2
            LDX   $DE
            JMP   L1044

L106D       LDA   #$00
            STA   $E8,X
            JMP   L1044

*-----------------------------------
* 
*-----------------------------------

L1074       STX   $50
            SEC
            SBC   #$0F
            TAX
            LDA   LB05D,X
            PHA
            LDA   LB061,X
            PHA
            LDA   LB065,X
            TAY
            PLA
            TAX
            PLA
            JSR   addTOSCORE
            LDX   $50
            RTS

*-----------------------------------
* 
*-----------------------------------

L108F       CMP   #$0C
            BCC   L10C7
            LDA   $E0
            BEQ   L10A6
            DEC   $E0
            BNE   L10A6
            STX   $50
            LDX   #$02
L109F       LDA   $E8,X
            BEQ   L10A9
            DEY
            BPL   L109F
L10A6       LDX   $50
            RTS

L10A9       LDA   LB343,Y
            STA   $E2,X
            LDA   LB347,Y
            STA   $E5,X
            LDA   #$10
            SEC
            SBC   #$03
            CLC
            ADC   $E1
            STA   $E8,X
            JSR   L1074
            LDA   #$0D
            STA   $EB,X
            JMP   L10A6

L10C7       LDA   $DF
            BEQ   L10A6
            DEC   $DF
            BNE   L10A6
            LDX   #$02
L10D1       LDA   $E8,X
            BEQ   L10DB
            DEX
            BPL   L10D1
            JMP   L10A6
L10DB       JMP   L10A9

*-----------------------------------
* SHOW CONGRATULATIONS FOR GAME END
*-----------------------------------

showCONGRATULATIONS
            LDX   #$07
            LDY   #$35
            JSR   printSTRING
            ASC   "                   @"
            LDX   #$07
            LDY   #$3C
            JSR   printSTRING
            ASC   " CONGRATULATIONS ! @"
            LDX   #$07
            LDY   #$43
            JSR   printSTRING
            ASC   "                   @"
            RTS

*-----------------------------------
* PLAY A MUSIC WHILE DOING OTHER THINGS
*-----------------------------------

playASYNCMUSIC		; used for the intro and game parts
            LDX   #$00
            LDA   ($75,X)
            STA   $54
            LDA   #$E0
            STA   $55
            LDA   #$0B
            STA   $56
            LDA   #$00
            STA   $51
            STA   $52
            LDA   ($73,X)
            BNE   L114B
            JMP   L11B0

L114B       STA   $53
            STA   $00
            LDX   #$10
L1151       ASL   $55
            ROL   $56
            ROL   $51
            ROL   $52
            LDA   $51
            SEC
            SBC   $00
            TAY
            LDA   $52
            SBC   #$00
            BCC   L116B
            STY   $51
            STA   $52
            INC   $55
L116B       DEX
            BNE   L1151
            LDA   $55
            STA   $4C
            LDA   $56
            STA   $4D
L1176       LDX   $4C
            LDY   $4D
            INY
L117B       LDA   $00
L117D       STX   $50
            LDX   #$03
L1181       DEX
            BNE   L1181
            LDX   $50
            SEC
            SBC   #$01
            BCS   L117D
            JSR   doBEEP
            DEX
            BNE   L1192
            DEY
L1192       BNE   L117B
            LDA   #$0A
            STA   $06
            LDX   #$00
            JSR   L2F1E
            DEC   $54
            BNE   L1176
            INC   $75
            BNE   L11A7
            INC   $75+1
L11A7       INC   $73
            BNE   L11AD
            INC   $73+1
L11AD       JMP   playASYNCMUSIC
L11B0       RTS

*-----------------------------------
* 
*-----------------------------------

L11B1       LDA   $44
            STA   plrCOURSE
            LDA   $44+1
            STA   plrCOURSE+1
            LDA   #$00
            STA   $97
            LDA   #$18
            STA   $96
            LDA   #$02
            STA   $DD
            LDA   #$00
            STA   $01
            LDA   plrPOINT
            CLC
            ADC   #$01
            ASL
            ASL
            ASL
            ROL   $01
            CLC
            ADC   #<fontDATA
            STA   $D5
            LDA   $01
            ADC   #>fontDATA
            STA   $D5+1
            LDA   #$28
            STA   $D7
            LDA   #$00
            STA   $D8
            RTS

L11E7       LDA   $97
            BEQ   L11EE
            JMP   L1225

L11EE       LDA   $DD
            CMP   #$01
            BEQ   L11F7
            JMP   L1225

L11F7       LDA   $57
            CMP   $96
            BCC   L1225
            LDA   plrCOURSE
            STA   $83
            LDA   plrCOURSE+1
            STA   $83+1
            LDX   #$7F
L1207       JSR   doBEEP
            LDA   #$06
            JSR   WAIT
            DEX
            BPL   L1207
            LDA   #$01
            STA   $97
            INC   plrPOINT
            LDA   #$D5
            STA   $04
            JSR   drawXPOINT
            JSR   L21B6
            JSR   L1CBD
L1225       RTS

*-----------------------------------
* PRINT CHAR
*-----------------------------------

printCHAR   STX   L1260+1
            STY   $3B
            PHA
            LDA   #$00
            STA   $01
            PLA
            ASL
            ASL
            ASL
            ROL   $01
            CLC
            ADC   #<fontDATA
            STA   L1262+1
            LDA   $01
            ADC   #>fontDATA
            STA   L1262+2
            LDA   $3B
            CLC
            ADC   #$06
            STA   $3B
            SEC
            SBC   #$07
            STA   L1272+1
            LDX   #$00
L1252       LDY   $3B
            LDA   tblHGRH,Y
            STA   L1265+2
            LDA   tblHGRL,Y
            STA   L1265+1
L1260       LDY   #$FF
L1262       LDA   $FFFF,X
L1265       STA   $FFFF,Y
            INX
            BNE   L126E
            INC   L1262+2
L126E       DEC   $3B
            LDA   $3B
L1272       CMP   #$FF
            BNE   L1252
            RTS

*-----------------------------------
* DRAW ADVANCEMENT LINE
*-----------------------------------

drawXPOINT  STX   $16		; draws the horizontal line
            LDX   plrPOINT	; where the player is
            LDA   #$13
            STA   $00
            LDA   #$01
            STA   $01
            LDY   tblXPOINT,X
            LDA   tblXBYTE,Y
            STA   $02
            LDA   tblXINDEX,Y
            LSR
            SEC
            SBC   #$01
            STA   $03
            LDA   $00
            STA   $09
            LDA   $01
            STA   $08
            LDY   $09
            LDX   $08
L12A0       LDA   L5D80,Y
            ORA   tblPX2LIT,X
            AND   $04
            ORA   #$80
            STA   L5D80,Y
            LDA   L4000+200,Y	; $40C8
            ORA   tblPX2LIT,X
            AND   $04
            ORA   #$80
            STA   L4000+200,Y	; $40C8
            INX
            CPX   #$07
            BNE   L12D3
            LDX   #$00
            INY
            LDA   $04
            BEQ   L12D1
            CMP   #$D5
            BNE   L12CF
            LDA   #$AA
            JMP   L12D1

L12CF       LDA   #$D5
L12D1       STA   $04
L12D3       CPX   $03
            BNE   L12A0
            CPY   $02
            BNE   L12A0
            LDX   $16
            RTS

*-----------------------------------
* 
*-----------------------------------

L12DE       LDX   #$03
L12E0       LDA   LB42A,X
            BNE   L12EB
L12E5       DEX
            BPL   L12E0
            JMP   L1330

L12EB       STX   $50
            LDA   $1B
            CMP   #$88
            BCC   L12E5
            CMP   #$98
            BCS   L12E5
            LDA   LB42A,X
            SEC
            SBC   #$06
            CMP   $1A
            BCS   L12E5
            LDA   LB42A,X
            CLC
            ADC   #$19
            CMP   $1A
            BCC   L12E5
            LDA   $9D
            BNE   L12E5
            LDA   #$01
            STA   $9D
            LDA   LB42A,X
            TAX
            LDA   #$0B
            LDY   #$8F
            JSR   drawSPRITE3
            JSR   L2FCE
            LDX   $50
            LDA   $1C
            BMI   L1329
            LDA   #$FF
L1329       STA   $1C
            LDA   #$00
            STA   LB42A,X

L1330       LDX   #$03
L1332       LDA   LB42A,X
            BNE   L133B
L1337       DEX
            BPL   L1332
            RTS

L133B       STX   $50
            LDA   LB42A,X
            CLC
            ADC   #$08
            CMP   $57
            BCC   L1337
            LDA   $57
            CLC
            ADC   #$24
            CMP   LB42A,X
            BCC   L1337
            LDA   $58
            CLC
            ADC   #$12
            CMP   #$90
            BCC   L1337
            LDA   #$01
            STA   $70
            LDA   LB42A,X
            TAX
            LDA   #$0B
            LDY   #$8F
            JSR   drawSPRITE3
            LDX   $50
            LDA   #$00
            STA   LB42A,X
            RTS

*-----------------------------------
* 
*-----------------------------------

L1371       LDX   #$03
L1373       LDA   LB42A,X
            BNE   L137C
L1378       DEX
            BPL   L1373
            RTS

L137C       STX   $50
            LDA   LB42A,X
            TAX
            LDA   #$0B
            LDY   #$8F
            JSR   drawSPRITE3
            LDX   $50
            LDA   LB42A,X
            SEC
            SBC   #$08
            CMP   #$0A
            BCC   L13A5
            STA   LB42A,X
            TAX
            LDA   #$0B
            LDY   #$8F
            JSR   drawSPRITE2
            LDX   $50
            JMP   L1378

L13A5       LDA   #$00
            STA   LB42A,X
            JMP   L1378

L13AD       LDX   #$03
L13AF       LDA   LB34B,X
            BEQ   L13D6
            BMI   L13D6
            CMP   #$0E
            BCS   L13D6
            SEC
            SBC   #$08
            TAY
            LDA   LB393,Y
            STA   LB3B3,X
            LDA   LB39B,Y
            STA   LB3B7,X
            LDA   LB3A3,Y
            STA   LB3BB,X
            LDA   LB3AB,Y
            STA   LB3BF,X
L13D6       DEX
            BPL   L13AF
            LDX   #$03
L13DB       LDA   LB051,X
            BNE   L13E4
L13E0       DEX
            BPL   L13DB
            RTS

*-----------------------------------
* 
*-----------------------------------

L13E4       LDY   #$03
L13E6       LDA   LB34B,Y
            BEQ   L13F4
            BMI   L13F4
            CMP   #$0E
            BCS   L13F4
            JMP   L13FA

L13F4       DEY
            BPL   L13E6
            JMP   L13E0

L13FA       LDA   LB343,Y
            CLC
            ADC   LB3BF,Y
            CMP   LB049,X
            BCC   L146E
            LDA   LB049,X
            CLC
            ADC   #$01
            ADC   LB3BB,Y
            CMP   LB343,Y
            BCC   L146E
            LDA   LB347,Y
            CLC
            ADC   LB3B7,Y
            SEC
            SBC   #$04
            CMP   LB04D,X
            BCC   L146E
            LDA   LB04D,X
            CLC
            ADC   #$06
            ADC   LB3B3,Y
            CMP   LB347,Y
            BCC   L146E
            LDA   #$01
            STA   LB37F,Y
            STA   LB059,X
            LDA   LB34B,Y
            PHA
            JSR   L108F
            PLA
            CMP   #$0C
            BCC   L144E

            LDA   #$00	; 100
            LDX   #$01
            LDY   #$00
            JMP   L1454
L144E       LDA   #$00	; 200
            LDX   #$02
            LDY   #$00
L1454       JSR   addTOSCORE

            LDA   #$07
            JSR   L2FBE
            LDA   #$06
            JSR   L2FBE
            LDA   #$05
            JSR   L2FBE
            LDA   #$08
            JSR   L2FBE
            JMP   L13E0
L146E       JMP   L13F4

*-----------------------------------
* GET COURSE DATA
*-----------------------------------

L1471       LDA   $AF
            LSR
            SEC
            SBC   #$01
            STA   $00
            LDA   $46
            SEC
            SBC   $00
            BCC   L1483
            STA   $46
            RTS

L1483       INC   $44
            BNE   L1489
            INC   $44+1

L1489       LDX   #$00
            LDA   ($44,X)
            LSR
            LSR
            LSR
            TAY
            LDA   ($44,X)
            AND   #$F8	; 11111000
            CMP   #$00
            BNE   L14A8
            LDA   ($44,X)
            AND   #$07
            LDX   #$0B
            JSR   L2F2D
            TXA
            LDX   #$00
            STA   $46
            RTS

L14A8       LDA   ($44,X)
            AND   #$07
            LDX   #$0B
            JSR   L2F2D
            TXA
            LDX   #$00
            STA   $46
            CMP   #$0B
            BNE   L14C6

            LDA   ($44,X)
            AND   #$F8
            CMP   #$88
            BNE   L14C6
            LDA   #$05
            STA   $46

L14C6       LDA   ($44,X)
            AND   #$F8	; 11111000
            CMP   #$10
            BNE   L14D1
            JMP   L15D5

L14D1       CMP   #$18
            BNE   L14D8
            JMP   L15D5

L14D8       CMP   #$20
            BNE   L14DF
            JMP   L15D5

L14DF       CMP   #$58
            BNE   L14EE
            PHA
            LDA   #$03
            STA   $DF
            STA   $E1
            PLA
            JMP   L15D5

L14EE       CMP   #$60
            BNE   L14FD
            PHA
            LDA   #$04
            STA   $DF
            STA   $E1
            PLA
            JMP   L15D5

L14FD       CMP   #$68
            BNE   L150C
            PHA
            LDA   #$05
            STA   $DF
            STA   $E1
            PLA
            JMP   L15D5

L150C       CMP   #$70
            BNE   L151B
            PHA
            LDA   #$03
            STA   $E0
            STA   $E1
            PLA
            JMP   L15D5

L151B       CMP   #$78
            BNE   L152A
            PHA
            LDA   #$04
            STA   $E0
            STA   $E1
            PLA
            JMP   L15D5

L152A       CMP   #$80
            BNE   L1539
            PHA
            LDA   #$05
            STA   $E0
            STA   $E1
            PLA
            JMP   L15D5

L1539       CMP   #$38
            BNE   L1542
            LDA   #$15
            JMP   L173F

L1542       CMP   #$30
            BNE   L154B
            LDA   #$14
            JMP   L173F

L154B       CMP   #$28
            BNE   L1554
            LDA   #$13
            JMP   L173F

L1554       CMP   #$48
            BNE   L155B
            JMP   L1839

L155B       CMP   #$40
            BNE   L1562
            JMP   L1839

L1562       CMP   #$C0
            BNE   L1569
            JMP   L1839

L1569       CMP   #$88
            BNE   L1570
            JMP   L1839

L1570       CMP   #$50
            BNE   L1578
            JSR   L11B1
            RTS

L1578       CMP   #$E8		; Set bonus time to 80
            BNE   L1587
            LDA   #$00
            STA   avgTIME+1
            LDA   #$80
            STA   avgTIME
            JMP   L11B1

L1587       CMP   #$98		; Set bonus time to 100
            BNE   L1596
            LDA   #$01
            STA   avgTIME+1
            LDA   #$00
            STA   avgTIME
            JMP   L11B1

L1596       CMP   #$90		; Set bonus time to 120
            BNE   L15A5
            LDA   #$01
            STA   avgTIME+1
            LDA   #$20
            STA   avgTIME
            JMP   L11B1

L15A5       CMP   #$D8		; Set bonus time to 120
            BNE   L15B4
            LDA   #$01
            STA   avgTIME+1
            LDA   #$20
            STA   avgTIME
            JMP   L11B1

L15B4       CMP   #$D0
            BNE   L15BD
            LDA   #$16
            JMP   L173F

L15BD       CMP   #$C8
            BNE   L15C4
            JMP   L3819

L15C4       CMP   #$E0
            BNE   L15D4
            LDA   #<courseCHAMPION
            STA   $44
            STA   $83
            LDA   #>courseCHAMPION
            STA   $44+1
            STA   $83+1
L15D4       RTS

L15D5       STA   $47
            LDX   #$03
L15D9       LDA   LB34B,X
            BEQ   L15E6
            DEX
            BPL   L15D9
            LDA   #$01
            STA   $48
            RTS

L15E6       STX   $50
            LDA   $47
            CMP   #$10
            BEQ   L1605
            CMP   #$70
            BEQ   L1605
            CMP   #$78
            BEQ   L1605
            CMP   #$80
            BEQ   L1605
            CMP   #$18
            BEQ   L160C
            LDA   #$08
            STA   $47
            JMP   L1613

L1605       LDA   #$0D
            STA   $47
            JMP   L1613

L160C       LDA   #$0C
            STA   $47
            JMP   L1613

L1613       LDA   $47
            STA   LB34B,X
            LDA   #$00
            STA   LB36F,X
            STA   LB373,X
            JSR   L2507
            JSR   L2548
            LDA   LB347,X
            TAY
            LDA   LB343,X
            TAX
            LDA   $47
            JSR   drawSPRITE
            LDA   #$0A
            JSR   L26EC
            LDX   $50
            CLC
            ADC   #$82
            STA   LB377,X
            LDA   #$28
            JSR   L26EC
            CLC
            ADC   #$0A
            LDX   $50
            STA   LB37B,X
            CLC
            RTS

L164F       LDX   #$03
L1651       LDA   LB34B,X
            BNE   L165A
L1656       DEX
            BPL   L1651
            RTS

L165A       STX   $50
            LDA   LB34B,X
            STA   $B0
            LDA   LB343,X
            STA   $B1
            LDA   LB347,X
            STA   $B2
            LDA   LB373,X
            STA   $B3
            JSR   L2548
            DEC   LB377,X
            BNE   L167D
            LDA   #$01
            STA   LB36F,X
L167D       LDA   LB34B,X
            CMP   #$0C
            BCS   L1693
            INC   LB34B,X
            LDA   LB34B,X
            CMP   #$0C
            BNE   L1693
            LDA   #$08
            STA   LB34B,X
L1693       CMP   #$0F
            BNE   L169F
            LDA   #$FF
            STA   LB34B,X
            JMP   L16BF

L169F       CMP   #$0E
            BNE   L16A8
            LDA   #$0F
            STA   LB34B,X
L16A8       CMP   #$10
            BCC   L16BF
            CMP   #$14
            BCS   L16BF
            INC   LB34B,X
            LDA   LB34B,X
            CMP   #$14
            BNE   L16BF
            LDA   #$FF
            STA   LB34B,X
L16BF       LDA   LB37F,X
            BEQ   L16CE
            LDA   #$0E
            STA   LB34B,X
            LDA   #$00
            STA   LB37F,X
L16CE       LDA   LB383,X
            BEQ   L16E6
            LDA   #$10
            STA   LB34B,X
            LDA   LB347,X
            SEC
            SBC   #$05
            STA   LB347,X
            LDA   #$00
            STA   LB383,X
L16E6       LDA   $B3
            STA   $39
            LDY   $B2
            LDX   $B1
            LDA   $B0
            CMP   #$0E
            BCC   L16FD
            SEC
            SBC   #$0E
            JSR   drawSPRITE3
            JMP   L1700

L16FD       JSR   undrawSPRITE
L1700       LDX   $50
            LDA   LB373,X
            STA   $39
            LDA   LB347,X
            TAY
            LDA   LB34B,X
            STA   $B0
            LDA   LB347,X
            TAY
            LDA   LB343,X
            TAX
            LDA   $B0
            BMI   L172F
            CMP   #$0E
            BCC   L1729
            SEC
            SBC   #$0E
            JSR   drawSPRITE2
            JMP   L1736

L1729       JSR   drawSPRITE
            JMP   L1736

L172F       LDX   $50
            LDA   #$00
            STA   LB34B,X
L1736       LDX   $50
            LDA   #$00
            STA   $39
            JMP   L1656

L173F       STA   $B0
            LDX   #$03
L1743       LDA   LB3DE,X
            BEQ   L174C
            DEX
            BPL   L1743
            RTS

L174C       STX   $50
            LDA   $85
            BNE   L175E
            LDY   #$03
L1754       LDA   LB387,Y
            CMP   #$0A
            BEQ   L1796
            DEY
            BPL   L1754
L175E       LDA   $B0
            SEC
            SBC   #$13
            TAX
            LDY   $50
            LDA   LB3C3,X
            STA   LB3D2,Y
            LDA   LB3C8,X
            STA   LB3D6,Y
            LDA   LB3CD,X
            STA   LB3DA,Y
            LDA   $B0
            LDX   $50
            STA   LB3DE,X
            STA   LB3F3,X
            STA   $C3,X
            LDA   #$FC
            STA   LB3E2,X
            STA   $C7,X
            LDA   #$04
            STA   LB3EF,X
            STA   $D1,X
            LDA   #$00
            STA   $2A,X
L1796       RTS

L1797       LDX   #$03
L1799       LDA   LB3DE,X
            BNE   L17A2
L179E       DEX
            BPL   L1799
            RTS

L17A2       STX   $50
            LDA   LB3EF,X
            STA   $33
            LDA   LB3F3,X
            STA   $B1
            LDA   LB3E2,X
            TAX
            LDA   $B1
            CMP   #$16
            BEQ   L17C1
            CMP   #$17
            BEQ   L17C1
            LDY   #$9B
            JMP   L17C3

L17C1       LDY   #$87
L17C3       STY   $B0
            JSR   putSPRITE	; put big rock on ground
            LDX   $50
            LDA   LB3E2,X
            STA   $C7,X
            LDA   LB3F3,X
            STA   $C3,X
            LDA   LB3EF,X
            STA   $D1,X
            LDA   $B0
            STA   $CB,X
            LDA   LB3F3,X
            CMP   #$16
            BCC   L17FF
            LDA   frameCNT
            CLC
            AND   #$0F
            BNE   L17FF
            LDA   LB3F3,X
            CMP   #$16
            BNE   L17FA
            LDA   #$17
            STA   LB3F3,X
            JMP   L17FF

L17FA       LDA   #$16
            STA   LB3F3,X
L17FF       LDA   #$00
            STA   $00
            LDA   LB3E2,X
            BPL   L180F
            LDA   #$01
            STA   $00
            LDA   LB3E2,X
L180F       SEC
            SBC   $AF
            STA   LB3E2,X
            BPL   L1836
            LDA   $00
            BNE   L1836
            LDA   LB3EF,X
            BMI   L1831
            LDA   LB3E2,X
            CLC
            ADC   #$69
            STA   LB3E2,X
            LDA   #$F5
            STA   LB3EF,X
            JMP   L1836

L1831       LDA   #$00
            STA   LB3DE,X
L1836       JMP   L179E

L1839       PHA
            LDX   #$03
L183C       LDA   LB387,X
            BNE   L1847
            DEX
            BNE   L183C
            JMP   L1849

L1847       PLA
            RTS

L1849       PLA
            CMP   #$88
            BNE   L1852
            LDA   #$03
            STA   $00
L1852       CMP   #$C0
            BNE   L185A
            LDA   #$02
            STA   $00
L185A       CMP   #$48
            BNE   L1862
            LDA   #$01
            STA   $00
L1862       CMP   #$40
            BNE   L186A
            LDA   #$00
            STA   $00
L186A       LDX   #$00
L186C       LDA   LB413,X
            BEQ   L187B
            INX
            CPX   #$04
            BNE   L186C
            LDA   #$01
            STA   $48
            RTS

L187B       STX   $50
            LDA   $00
            CMP   #$02
            BNE   L1898
            LDA   $00
            STA   $B0
            LDA   #$0A
            JSR   L26EC
            CLC
            ADC   #$0A
            LDX   $50
            STA   LB426,X
            LDA   $B0
            STA   $00
L1898       LDA   #$01
            STA   LB413,X
            LDA   #$0E
            CLC
            ADC   $00
            STA   LB407,X
            LDA   #$FC
            STA   LB3F7,X
            STA   LB3FF,X
            LDY   $00
            LDA   #$04
            STA   LB40B,X
            STA   LB40F,X
            LDA   LB417,Y
            STA   LB3FB,X
            STA   LB403,X
            LDA   #$00
            STA   $86,X
            RTS

L18C5       LDX   #$00
L18C7       LDA   LB413,X
            BNE   L18D6
L18CC       INX
            CPX   #$04
            BNE   L18C7
            LDA   #$00
            STA   $39
            RTS

L18D6       STX   $16
            LDA   LB40F,X
            STA   $39
            LDA   LB407,X
            PHA
            LDA   LB403,X
            TAY
            LDA   LB3FF,X
            TAX
            PLA
            AND   #$7F
            JSR   undrawSPRITE
            LDX   $16
            LDA   frameCNT
            AND   #$03
            CMP   #$03
            BNE   L1911
            LDA   LB407,X
            CMP   #$11
            BEQ   L190C
            CMP   #$12
            BNE   L1911
            LDA   #$11
            STA   LB407,X
            JMP   L1911

L190C       LDA   #$12
            STA   LB407,X
L1911       LDA   LB407,X
            LDA   LB40B,X
            STA   LB40F,X
            STA   $39
            LDA   LB407,X
            STA   $B0
            LDA   LB3FB,X
            STA   LB403,X
            TAY
            LDA   LB3F7,X
            STA   LB3FF,X
            TAX
            LDA   $B0
            BPL   L1936
            JMP   L19BF

L1936       JSR   drawSPRITE
            LDX   $16
            LDA   LB407,X
            CMP   #$10
            BNE   L1985
            LDA   LB42A,X
            BNE   L1985
            DEC   LB426,X
            BNE   L1985
            LDY   #$03
L194E       LDA   LB413,Y
            BNE   L1959
L1953       DEY
            BPL   L194E
            JMP   L196E

L1959       LDA   LB40F,Y
            BMI   L1953
            LDA   LB3FF,Y
            CLC
            ADC   #$1C
            BCS   L1953
            CMP   LB3FF,X
            BCS   L1953
            JMP   L1985

L196E       LDA   LB3FF,X
            CLC
            ADC   #$0A
            STA   LB42A,X
            TAX
            LDA   #$00
            STA   $39
            LDY   #$8F
            LDA   #$0B
            JSR   drawSPRITE2
            LDX   $16
L1985       LDA   #$00
            STA   $00
            LDA   LB3F7,X
            BPL   L1995
            LDA   #$01
            STA   $00
            LDA   LB3F7,X
L1995       SEC
            SBC   $AF
            STA   LB3F7,X
            BPL   L19AB
            LDA   $00
            BNE   L19AB
            LDA   LB40B,X
            BPL   L19AE
            LDA   #$00
            STA   LB413,X
L19AB       JMP   L18CC

L19AE       LDA   LB3F7,X
            CLC
            ADC   #$69
            STA   LB3F7,X
            LDA   #$F5
            STA   LB40B,X
            JMP   L18CC

L19BF       LDA   #$00
            LDX   $16
            STA   LB413,X
            JMP   L18CC

*-----------------------------------
* DRAW MOUNTAINS
*-----------------------------------

drawMOUNTAINS
            LDA   #$05	; x-coord on screen
            STA   $08
            LDA   #$FF	; y-column on screen
            STA   $09
            LDA   #$00
            STA   mountX2
L19D5       LDX   mountX1
            LDA   tblYMOUNTAINS,X
            TAX
            LDA   tblHGRL,X
            STA   $26
            LDA   tblHGRH,X
            STA   $26+1
            LDY   $09
            LDX   $08
            LDA   tblPX2LIT,X
            CPY   #$FF
            BEQ   L19F4
            ORA   ($26),Y
            STA   ($26),Y
L19F4       LDA   $08	; save
            PHA
            LDA   $09
            PHA
            INC   $08	; every 2 pixels
            INC   $08
            LDA   $08
            CMP   #$07
            BMI   L1A09
            SEC	; correct
            SBC   #$07
            INC   $09	; next Y on screen
L1A09       STA   $08
            LDY   $09
            LDX   $08
            LDA   tblPX2UNLIT,X
            AND   ($26),Y
            STA   ($26),Y
            PLA
            STA   $09
            PLA
            STA   $08
            INC   $08
            INC   $08
            LDA   $08
            CMP   #$07
            BMI   L1A2B
            SEC
            SBC   #$07
            INC   $09
L1A2B       STA   $08
            INC   mountX1
            LDA   mountX1
            CMP   #$8D	; x = 141?
            BNE   L1A39
            LDA   #$00
            STA   mountX1
L1A39       INC   mountX2
            LDA   mountX2
            CMP   #$8D	; x = 141?
            BNE   L19D5
            LDA   mountX3
            STA   mountX1
            INC   mountX3
            LDA   mountX3
            CMP   #$8D	; x = 141?
            BNE   L1A51
            LDA   #$00
            STA   mountX3
L1A51       RTS

*-----------------------------------
* 
*-----------------------------------

L1A52       LDA   #$00
            STA   $14
            STA   $15
            STA   $16
            LDA   #$02
            STA   $13
            LDA   #<sprSTRUCTURE	; sprite definition pointer
            STA   $08
            LDA   #>sprSTRUCTURE
            STA   $08+1
            LDY   #$04		; get next sprite info
            LDA   ($08),Y
            STA   $0A		; width
            INY
            LDA   ($08),Y
            STA   $0B		; height
L1A71       LDY   $13
            LDA   ($08),Y
            STA   $0D		; get address
            INY
            LDA   ($08),Y
            STA   $0D+1
            LDY   #$00		; check end of table
            LDA   ($08),Y
            TAX
            CMP   #$FF
            BNE   L1A88
            JMP   L1AFD		; exit if end

L1A88       STA   $0F
            INY
            LDA   ($08),Y
            STA   $18
            JSR   L2F2D
            STX   $0C
            CLC
            LDY   $13
            INY
            INY
            LDA   $0A
            STA   ($08),Y
            INY
            LDA   $0B
            STA   ($08),Y
            JSR   L2F4A
            ASL   $15
            ASL   $16
            LDA   $0C
            CLC
            ADC   $0A
            BCC   L1AB2
            INC   $0B
L1AB2       STA   $0A
            INC   $13
            INC   $13
            LDA   $13
            CMP   #$0E
            BNE   L1A71
            LDA   #$10
            CLC
            ADC   $08
            STA   $08
            LDA   #$00
            ADC   $09
            STA   $09
            LDA   #$02
            STA   $13
            INC   $14
            LDA   $14
            CMP   #$13
            BEQ   L1AF0
            CMP   #$14
            BEQ   L1AF0
            CMP   #$15
            BEQ   L1AF0
            CMP   #$16
            BEQ   L1AF0
            CMP   #$17
            BEQ   L1AF0
            LDA   #$00
            STA   $15
            STA   $16
            JMP   L1AFA

L1AF0       LDA   #$D5
            ASL
            STA   $15
            LDA   #$D5
            ASL
            STA   $16
L1AFA       JMP   L1A71
L1AFD       RTS

*-----------------------------------
* PRINT PLAYER SCORE
*-----------------------------------

printPLAYERSCORE
            LDA   #$0F	; set Y for P1
            STA   $00
            LDA   curPLAYER
            BEQ   L1B0B
            LDA   #$18	; or est Y for P2
            STA   $00
L1B0B       LDA   $00	; now, print score
            STA   charY
            LDA   #$06
            STA   charX
            LDA   plrSCORE+2
            JSR   printNUMBER
            LDA   plrSCORE+1
            JSR   printNUMBER
            LDA   plrSCORE
            JSR   printNUMBER
            RTS

*-----------------------------------
* PRINT HIGH SCORE
*-----------------------------------

printHIGHSCORE
            LDA   #$06
            STA   charY
            LDA   #$06
            STA   charX
            LDA   highSCORE
            JSR   printNUMBER
            LDA   highSCORE+1
            JSR   printNUMBER
            LDA   highSCORE+2
            JSR   printNUMBER
            RTS

*-----------------------------------
* CHECK HIGH SCORE
*-----------------------------------

checkHIGHSCORE
            LDA   highSCORE
            CMP   plrSCORE+2
            BEQ   L1B4A
            BCS   L1B71
            JMP   L1B5F

L1B4A       LDA   highSCORE+1
            CMP   plrSCORE+1
            BEQ   L1B56
            BCS   L1B71
            JMP   L1B5F

L1B56       LDA   highSCORE+2
            CMP   plrSCORE
            BEQ   L1B71
            BCS   L1B71

L1B5F       LDA   plrSCORE+2	; we made a high score
            STA   highSCORE	; save it and...
            LDA   plrSCORE+1
            STA   highSCORE+1
            LDA   plrSCORE
            STA   highSCORE+2
            JSR   printHIGHSCORE	; ...display it
L1B71       RTS

*-----------------------------------
* PRINT BONUS ON SCREEN
*-----------------------------------

printBONUS  LDA   #$1A
            STA   charX
            LDA   #$73
            STA   charY
            LDA   theBONUS
            JSR   printNUMBER
            LDA   theBONUS+1
            JSR   printNUMBER
            LDA   theBONUS+2
            JSR   printNUMBER
            RTS

*-----------------------------------
* PRINT TIME
*-----------------------------------

printTIME   LDA   #$18		; set coordx
            STA   charX
            LDA   #$0F
            STA   charY
            LDA   plrTIME+1	; print time
            JSR   printDIGIT
            LDA   plrTIME
            JSR   printNUMBER

            SED		; time += 1
            LDA   #1
            CLC
            ADC   plrTIME
            STA   plrTIME
            LDA   #0
            ADC   plrTIME+1
            STA   plrTIME+1
            LDA   plrTIME+1
            CMP   #10
            BCC   L1BB9
            LDA   #0
            STA   plrTIME+1
            STA   plrTIME
L1BB9       CLD
            RTS

*-----------------------------------
* PRINT A NUMBER
*-----------------------------------

printNUMBER PHA
            LSR
            LSR
            LSR
            LSR
            JSR   printDIGIT
            PLA
            AND   #$0F
            JSR   printDIGIT
            RTS

*-----------------------------------
* ADD A/X/Y TO SCORE
*-----------------------------------

addTOSCORE  SED
            PHA
            LDA   plrSCORE+2
            STA   $B0
            PLA
            PHA
            TXA
            PHA
            TYA
            CLC
            ADC   plrSCORE
            STA   plrSCORE
            PLA
            ADC   plrSCORE+1
            STA   plrSCORE+1
            PLA
            ADC   plrSCORE+2
            STA   plrSCORE+2
            CLD
            LDA   $B0
            CMP   #$00
            BNE   L1BF2
            LDA   plrSCORE+2
            BEQ   L1BF2
            JMP   L1C17

L1BF2       LDA   $B0
            CMP   #$03
            BCS   L1C01
            LDA   plrSCORE+2
            CMP   #$03
            BCC   L1C01
            JMP   L1C17

L1C01       LDA   $B0
            CMP   #$05
            BCS   L1C10
            LDA   plrSCORE+2
            CMP   #$05
            BCC   L1C10
            JMP   L1C17

L1C10       JSR   printPLAYERSCORE
            JSR   checkHIGHSCORE
            RTS

L1C17       INC   nbLIVES
            JSR   showNBLIVES
            JMP   L1C10

L1C20       SED
            PHA
            TXA
            PHA
            TYA
            CLC
            ADC   theBONUS+2
            STA   theBONUS+2
            PLA
            ADC   theBONUS+1
            STA   theBONUS+1
            PLA
            ADC   theBONUS
            STA   theBONUS
            CLD
            RTS

*-----------------------------------
* PRINT A CHARACTER STRING
*-----------------------------------

printSTRING
            PLA
            STA   ptrSTRING
            PLA
            STA   ptrSTRING+1
            STX   $03
            STY   $04
L1C46       INC   ptrSTRING
            BNE   L1C4C
            INC   ptrSTRING+1
L1C4C       LDX   #$00
            LDA   (ptrSTRING,X)
            CMP   #$C0	; @ to exit
            BEQ   L1C7C
            CMP   #$A0
            BEQ   L1C60
            PHA
            LDA   charWAIT
            JSR   WAIT
            PLA
L1C60       LDX   $03
            LDY   $04
            AND   #$7F
            CMP   #$41
            BCS   L1C6D
            SEC
            SBC   #$01
L1C6D       CMP   #$40
            BCC   L1C74
            SEC
            SBC   #$41
L1C74       JSR   printCHAR
            INC   $03
            JMP   L1C46

L1C7C       LDA   ptrSTRING+1
            PHA
            LDA   ptrSTRING
            PHA
            RTS

L1C83       LDA   theBONUS		; BONUS
            LDX   theBONUS+1
            LDY   theBONUS+2
            JSR   addTOSCORE
L1C8F       LDX   #$1B
L1C91       LDA   #$FF
            JSR   WAIT
            DEX
            BPL   L1C91
            LDA   #$00
            STA   plrTIME
            STA   plrTIME+1
            LDA   plrPOINT
            STA   basePOINT
            CMP   #$19		; 25 = Z
            BNE   L1CAA
            JMP   setNEXTCOURSE
L1CAA       JSR   L0FC9
            JMP   L2EC2

*-----------------------------------
* PRINT A DIGIT (0..9)
*-----------------------------------

printDIGIT  LDX   charX
            LDY   charY
            CLC
            ADC   #$2F
            JSR   printCHAR
            INC   charX
            RTS

*-----------------------------------
* 
*-----------------------------------

L1CBD       LDA   plrPOINT
            CMP   #$04
            BNE   L1CC8
            LDA   #$00	; start at A
            JMP   L1CED

L1CC8       CMP   #$09
            BNE   L1CD1
            LDA   #$02	; start at E
            JMP   L1CED

L1CD1       CMP   #$0E
            BNE   L1CDA
            LDA   #$04	; start at J
            JMP   L1CED

L1CDA       CMP   #$13
            BNE   L1CE3
            LDA   #$06	; start at O
            JMP   L1CED

L1CE3       CMP   #$19
            BNE   L1CEC
            LDA   #$08	; start at T
            JMP   L1CED
L1CEC       RTS

L1CED       PHA	; save range
            LDA   basePOINT
            CMP   plrPOINT
            BNE   L1CF6
            PLA
            RTS

L1CF6       JSR   L32BE
            PLA
            STA   curRANGE
            CMP   #$08	; did we reach the end of the game? Ie. the letter Z
            BNE   L1D0A

            JSR   showCONGRATULATIONS	; yes, we did
            JSR   playMUSIC_GAMEWON		; play music for game end
            JMP   L1D0D
L1D0A       JSR   playMUSIC_ENDSTAGE	; play music for stage end
L1D0D       JSR   L0FC9

            SED		; subtract 1 to time
            SEC
            LDA   plrTIME
            SBC   #1
            STA   plrTIME
            LDA   plrTIME+1
            SBC   #0
            STA   plrTIME+1
            CLD

            LDA   #$00
            STA   $9D
            LDA   #$D0
            STA   charWAIT
            LDA   #$00
            STA   $F2
            LDX   #$08
            LDY   #$2D
            JSR   printSTRING
            ASC   "TIME TO REACH POINT "A2" "A2"@"
            LDA   plrPOINT
            LDX   #$1D
            LDY   #$2D
            JSR   printCHAR
            LDX   #$1E
            LDY   #$2D
            JSR   printSTRING
            ASC   ""A2"@"
            LDX   #$07
            LDY   #$41
            JSR   printSTRING
            ASC   "YOUR TIME          :@"
            LDA   #$1C
            STA   charX
            LDA   #$41
            STA   charY
            LDA   plrTIME+1
            JSR   printDIGIT
            LDA   plrTIME
            JSR   printNUMBER
            LDX   #$07
            LDY   #$50
            JSR   printSTRING
            ASC   "THE AVERAGE TIME   :@"
            LDA   #$1C
            STA   charX
            LDA   #$50
            STA   charY
            LDA   avgTIME+1
            JSR   printDIGIT
            LDA   avgTIME
            JSR   printNUMBER
            LDX   #$07
            LDY   #$5F
            JSR   printSTRING
            ASC   "TOP RECORD         :@"

            LDA   #$1C
            STA   charX
            LDA   #$5F
            STA   charY

            LDX   curRANGE
            LDA   tblBRECORD,X
            STA   timePLAYER
            LDA   tblBRECORD+1,X
            STA   timePLAYER+1
            LDA   courseTYPE
            BEQ   L1DFD
            LDA   tblCRECORD,X
            STA   timePLAYER
            LDA   tblCRECORD+1,X
            STA   timePLAYER+1

L1DFD       LDA   timePLAYER	; print player time
            JSR   printDIGIT
            LDA   timePLAYER+1
            JSR   printNUMBER

            LDA   plrTIME+1	; check for time
            CMP   timePLAYER
            BEQ   L1E15
            BCS   L1E1F
            JMP   L1E27

L1E15       LDA   plrTIME
            CMP   timePLAYER+1
            BCS   L1E1F
            JMP   L1E27

L1E1F       LDA   #$00		; no best time
            STA   fgBESTTIME
            JMP   L1E2C
L1E27       LDA   #$01		; best time
            STA   fgBESTTIME

L1E2C       LDA   plrTIME+1	; check record time
            CMP   avgTIME+1
            BCC   L1E42
            BEQ   L1E37
            JMP   L1E4A

L1E37       LDA   plrTIME
            CMP   avgTIME
            BCC   L1E42
            BEQ   L1E42
            JMP   L1E4A

L1E42       LDA   #$00		; we have a high score, we want a bonus
            STA   fgBONUS
            JMP   L1E4F
L1E4A       LDA   #$01		; no high score, no bonus
            STA   fgBONUS

L1E4F       LDA   #$01
            STA   charWAIT

            LDA   fgBONUS
            BEQ   L1E7F
            LDA   curRANGE	; no bonus at Z
            CMP   #$08
            BEQ   L1E7B
            LDX   #$0B
            LDY   #$73
            JSR   printSTRING
            ASC   "SORRY NO BONUS !@"
            JMP   L1C8F

L1E7B       LDA   #$01
            STA   $F2
L1E7F       LDA   fgBESTTIME
            BEQ   L1ED3
            LDA   plrTIME+1
            STA   timePLAYER
            LDA   plrTIME
            STA   timePLAYER+1
            LDX   #$07
            LDY   #$82
            JSR   printSTRING
            ASC   "YOU HAVE BROKEN A RECORD !@"

            LDX   curRANGE
            LDA   courseTYPE
            BEQ   L1EC7
            LDA   timePLAYER		; champion course record
            STA   tblCRECORD,X
            LDA   timePLAYER+1
            STA   tblCRECORD+1,X
            JMP   L1ED3
L1EC7       LDA   timePLAYER		; beginner course record
            STA   tblBRECORD,X
            LDA   timePLAYER+1
            STA   tblBRECORD+1,X

L1ED3       LDA   $F2
            BEQ   L1EF8
            LDX   #$04
            LDY   #$73
            JSR   printSTRING
            ASC   "SPECIAL BONUS POINTS  @"
            JMP   L1F13

L1EF8       LDX   #$07
            LDY   #$73
            JSR   printSTRING
            ASC   "GOOD BONUS POINTS  @"

L1F13       LDA   curRANGE
            CMP   #$08
            BNE   L1F3F
            LDA   courseTYPE
            BEQ   L1F2F
            LDA   #$01		; champion bonus at last stage
            STA   theBONUS		; 10000
            LDA   #$00
            STA   theBONUS+1
            STA   theBONUS+2
            JMP   L1F56

L1F2F       LDA   #$00		; beginner bonus at last stage
            STA   theBONUS		; 5000
            STA   theBONUS+2
            LDA   #$50
            STA   theBONUS+1
            JMP   L1F56

L1F3F       LDA   #$00		; beginner bonus at other stages
            STA   theBONUS		; 1000
            STA   theBONUS+2
            LDA   #$10
            STA   theBONUS+1

            LDA   courseTYPE
            BEQ   L1F56
            LDA   #$20		; champion bonus at other stages
            STA   theBONUS+1		; 2000

L1F56       JSR   printBONUS
            LDA   #$1C
            STA   charX
            LDA   #$41
            STA   charY
            LDA   plrTIME+1
            JSR   printDIGIT
            LDA   plrTIME
            JSR   printNUMBER
            LDA   $F2
            BNE   L1F7B
            LDA   plrTIME+1
            CMP   avgTIME+1
            BNE   L1F7E
            LDA   plrTIME
            CMP   avgTIME
            BNE   L1F7E
L1F7B       JMP   L1C83

L1F7E       SED		; add 1 to time
            LDA   #$01
            CLC
            ADC   plrTIME
            STA   plrTIME
            LDA   #$00
            ADC   plrTIME+1
            STA   plrTIME+1
            CLD
            LDA   #$00		; add 100 to score
            LDX   #$01
            LDY   #$00
            JSR   L1C20

            LDX   #$02		; wait
L1F98       LDA   #$A0
            JSR   WAIT
            DEX
            BPL   L1F98
            LDY   #$50
L1FA2       JSR   doBEEP
            LDA   #$11
            JSR   WAIT
            DEY
            BPL   L1FA2
            JMP   L1F56

*-----------------------------------
* 
*-----------------------------------

L1FB0       LDX   #$03
L1FB2       LDA   LB34B,X
            BEQ   L1FBB
            CMP   #$0E
            BCC   L1FC1
L1FBB       DEX
            BPL   L1FB2
            JMP   L2059

L1FC1       STX   $50
            DEC   LB37B,X
            BNE   L1FBB
            LDA   #$28
            JSR   L26EC
            CLC
            ADC   #$0F
            LDX   $50
            STA   LB37B,X
            LDA   LB387,X
            BNE   L1FBB
            LDA   #$01
            STA   $06
            LDA   LB34B,X
            CMP   #$0C
            BCS   L2020
            LDA   #$78
            STA   $06
            LDY   #$03
L1FEB       LDA   LB413,Y
            BNE   L1FF6
L1FF0       DEY
            BPL   L1FEB
            JMP   L200A

L1FF6       LDA   LB40F,Y
            BMI   L1FF0
            LDA   LB3FF,Y
            CLC
L1FFF       ADC   #$1C
            BCS   L2007
            CMP   #$6E
            BCC   L1FF0
L2007       JMP   L1FBB

L200A       LDY   #$03
L200C       LDA   LB3DE,Y
            BNE   L1FBB
            DEY
            BPL   L200C
            LDY   #$03
L2016       LDA   LB387,Y
            CMP   #$0A
            BEQ   L1FBB
            DEY
            BPL   L2016
L2020       LDA   LB343,X
            CMP   $06
            BCC   L1FBB
            CLC
            ADC   #$0A
            CMP   #$DC
            BCS   L1FBB
            STA   LB38B,X
            LDA   LB347,X
            CLC
            ADC   #$08
            STA   LB38F,X
            LDA   LB34B,X
            CMP   #$0E
            BCC   L2044
            JMP   L1FBB

L2044       CMP   #$0C
            BEQ   L2051
            CMP   #$0D
            BEQ   L2051
            LDA   #$0A
            JMP   L2053

L2051       LDA   #$09
L2053       STA   LB387,X
            JMP   L1FBB

L2059       LDX   #$03
L205B       LDA   LB387,X
            BNE   L2064
L2060       DEX
            BPL   L205B
            RTS

L2064       STX   $50
            LDA   LB387,X
            PHA
            LDY   LB38F,X
            LDA   LB38B,X
            TAX
            PLA
            JSR   drawSPRITE3
            LDX   $50
            LDA   LB387,X
            CMP   #$09
            BEQ   L2086
            CMP   #$0A
            BEQ   L2086
            CMP   #$02
            BCS   L20E0
L2086       INC   LB38B,X
            INC   LB38B,X
            LDA   LB38B,X
            AND   #$FE
            STA   LB38B,X
            LDA   LB38F,X
            CLC
            ADC   #$04
            STA   LB38F,X
            CMP   #$8C
            BCC   L20FE
            LDA   LB387,X
            CMP   #$0A
            BNE   L20D2
            TXA
            PHA
            LDA   #$01
            STA   $85
            LDA   #$14
            JSR   L173F
            LDA   #$3C
            STA   $46
            LDA   #$00
            STA   $85
            TXA
            TAY
            PLA
            TAX
            LDA   LB38B,X
            SEC
            SBC   #$22
            AND   #$FC
            STA   LB3E2,Y
            LDA   #$0B
            STA   LB387,X
            JMP   L20D7

L20D2       LDA   #$01
            STA   LB387,X
L20D7       LDA   LB38B,X
            SEC
            SBC   #$0E
            STA   LB38B,X
L20E0       INC   LB387,X
            LDA   #$89
            STA   LB38F,X
            LDA   LB387,X
            CMP   #$06
            BEQ   L20F6
            CMP   #$0E
            BEQ   L20F6
            JMP   L20FE

L20F6       LDA   #$00
            STA   LB387,X
            JMP   L2060

L20FE       LDA   LB387,X
            CMP   #$0A
            BEQ   L210C
            CMP   #$09
            BEQ   L210C
            JMP   L2134

L210C       LDA   LB38F,X
            CLC
            ADC   #$05
            CMP   $58
            BCC   L2134
            LDA   LB38B,X
            CLC
            ADC   #$04
            CMP   $57
            BCC   L2134
            LDA   $57
            CLC
            ADC   #$24
            CMP   LB38B,X
            BCC   L2134
            LDA   #$01
            STA   $70
            LDA   #$00
            STA   LB387,X
            RTS

L2134       LDA   LB387,X
            PHA
            LDY   LB38F,X
            LDA   LB38B,X
            TAX
            PLA
            JSR   drawSPRITE2
            LDX   $50
            JMP   L2060

L2148       LDX   #$03
L214A       LDA   LB34B,X
            BEQ   L2171
            BMI   L2171
            CMP   #$0E
            BCS   L2171
            SEC
            SBC   #$08
            TAY
            LDA   LB393,Y
            STA   LB3B3,X
            LDA   LB39B,Y
            STA   LB3B7,X
            LDA   LB3A3,Y
            STA   LB3BB,X
            LDA   LB3AB,Y
            STA   LB3BF,X
L2171       DEX
            BPL   L214A
            LDY   #$03
L2176       LDA   LB34B,Y
            BEQ   L2184
            BMI   L2184
            CMP   #$0E
            BCS   L2184
            JMP   L2188

L2184       DEY
            BPL   L2176
            RTS

L2188       LDA   LB343,Y
            CLC
            ADC   LB3BF,Y
            CMP   $57
            BCC   L21B3
            LDA   $57
            CLC
            ADC   #$26
            ADC   LB3BB,Y
            CMP   LB343,Y
            BCC   L21B3
            LDA   LB347,Y
            CLC
            ADC   LB3B7,Y
            SEC
            SBC   #$03
            CMP   $58
            BCC   L21B3
            LDA   #$01
            STA   $70
            RTS
L21B3       JMP   L2184

L21B6       LDA   plrPOINT
            LDX   #$19
            LDY   #$06
            JSR   printCHAR
            RTS

L21C0       LDX   #$03
L21C2       LDA   LB3DE,X
            BNE   L21CB
L21C7       DEX
            BPL   L21C2
            RTS

L21CB       STX   $50
            LDA   #$85
            STA   $05
            LDA   $C3,X
            CMP   #$16
            BEQ   L21E2
            CMP   #$17
            BNE   L21E6
            LDA   #$85
            STA   $05
            JMP   L21E6

L21E2       LDA   #$7B
            STA   $05
L21E6       LDA   $D1,X
            BMI   L222E
            LDA   $C7,X
            CLC
            ADC   #$1C
            BCS   L21C7
            CLC
            ADC   LB3D2,X
            BCS   L21C7
            CMP   #$96
            BCS   L21C7
            STA   $00
            LDY   LB3D6,X
            CLC
            ADC   tblX7HGR,Y
            BCS   L21C7
            CLC
            ADC   LB3DA,X
            BCS   L21C7
            SEC
            SBC   #$07
            STA   $01
            LDA   $57
            CLC
            ADC   #$24
            CMP   $00
            BCC   L21C7
            LDA   $57
            CLC
            ADC   #$03
            CMP   $01
            BCS   L21C7
            LDA   $58
            CMP   $05
            BCC   L21C7
            LDA   #$01
            STA   $70
            RTS

L222E       LDA   #$00
            STA   $03
            LDA   $C7,X
            SEC
            SBC   #$4D
            BCS   L223F
            PHA
            LDA   #$01
            STA   $03
            PLA
L223F       CLC
            ADC   LB3D2,X
            STA   $00
            LDY   LB3D6,X
            CLC
            ADC   tblX7HGR,Y
            CLC
            ADC   LB3DA,X
            BPL   L2255
            JMP   L21C7

L2255       STA   $01
            LDA   $03
            BNE   L2267
            LDA   $57
            CLC
            ADC   #$24
            CMP   $00
            BCS   L2267
            JMP   L21C7

L2267       LDA   $57
            CMP   $01
            BCC   L2270
            JMP   L21C7

L2270       LDA   $58
            CMP   $05
            BCS   L2279
            JMP   L21C7

L2279       LDA   #$01
            STA   $70
            RTS

L227E       LDX   #$03
L2280       LDA   LB413,X
            BNE   L2289
L2285       DEX
            BPL   L2280
            RTS

L2289       LDA   LB407,X
            SEC
            SBC   #$0E
            TAY
            STX   $50
            LDA   LB40F,X
            BMI   L22DC
            LDA   LB3FF,X
            CLC
            ADC   #$1C
            BCS   L2285
            CLC
            ADC   #$01
            BCS   L2285
            CMP   #$96
            BCS   L2285
            STA   $00
            CLC
            ADC   LB421,Y
            BCS   L2285
            CLC
            SEC
            SBC   #$02
            STA   $01
            LDA   $57
            CLC
            ADC   #$2A
            CMP   $00
            BCC   L2285
            LDA   $57
            CMP   $01
            BCS   L2285
            LDA   $58
            CLC
            ADC   #$10
            CLC
            ADC   LB3EA,Y
            CMP   LB403,X
            BEQ   L2285
            BCC   L2285
            LDA   #$01
            STA   $70
            JMP   L2326

L22DC       LDA   #$00
            STA   $03
            LDA   LB3FF,X
            SEC
            SBC   #$4D
            BCS   L22EC
            LDA   #$01
            STA   $03
L22EC       CLC
            ADC   #$01
            STA   $00
            CLC
            ADC   LB421,Y
            SEC
            SBC   #$02
            BMI   L2285
            STA   $01
            LDA   $03
            BNE   L230C
            LDA   $57
            CLC
            ADC   #$26
            CMP   $00
            BCS   L230C
            JMP   L2285

L230C       LDA   $57
            CMP   $01
            BCC   L2315
            JMP   L2285

L2315       LDA   $58
            CLC
            ADC   #$10
            CMP   LB403,X
            BCS   L2322
            JMP   L2285

L2322       LDA   #$01
            STA   $70
L2326       LDA   #$00
            STA   LB413,X
            LDA   LB40F,X
            STA   $39
            LDA   LB407,X
            STA   $B0
            LDA   LB403,X
            TAY
            LDA   LB3FF,X
            TAX
            LDA   $B0
            AND   #$7F
            JSR   undrawSPRITE
            LDA   #$00
            STA   $39
            RTS

*-----------------------------------
* DRAW THE THREE LINES OF GROUND
*-----------------------------------

drawGROUNDLINES
            LDX   $28
            LDA   LB000,X	; line 1
            STA   $00
            LDA   LB007,X
            STA   $00+1
            LDA   LB00E,X	; line 2
            STA   $02
            LDA   LB015,X
            STA   $02+1
            LDA   LB01C,X	; line 3
            STA   $04
            LDA   LB023,X
            STA   $04+1

            LDX   $29
            LDY   #$00
L236D       CPX   groundSTARTX
            BCC   L2380
            LDA   ($00),Y
            STA   L45D0,X
            LDA   ($02),Y
            STA   L49D0,X
            LDA   ($04),Y
            STA   L4DD0,X
L2380       INX
            CPX   #$28
            BNE   L2387
            LDX   #$00
L2387       INY
            CPY   #$28
            BNE   L236D
            RTS

*-----------------------------------
* 
*-----------------------------------

L238D       LDA   #$02
            JSR   L26EC
            CLC
            ADC   #$84
            STA   $58
            LDA   $6D
            BMI   L239D
            DEC   $6D
L239D       RTS

*-----------------------------------
* MOON BASE SCROLLING
*-----------------------------------

animMOONBASE
            JSR   drawMOUNTAINS	; 19C9
            LDA   #$01
            STA   $48
            LDA   #$FF
            JSR   WAIT
            LDA   #>musicINTRO_repeat	; music for game intro
            STA   $75+1
            LDA   #<musicINTRO_repeat
            STA   $75
            LDA   #>musicINTRO_notes
            STA   $73+1
            LDA   #<musicINTRO_notes
            STA   $73
            JSR   playASYNCMUSIC

            LDA   #<musicGAME_notes	; music while playing
            STA   $73
            LDA   #>musicGAME_notes
            STA   $73+1
            LDA   #<musicGAME_repeat
            STA   $75
            LDA   #>musicGAME_repeat
            STA   $75+1
            LDA   #$00
            STA   $A0
            LDA   #$FF
            JSR   WAIT
            LDA   #$22
            STA   $6D
            LDA   #$46	; 70 (half of 140)
            STA   $67
L23DE       LDA   #$79
            STA   $68
            JSR   L3B32
            LDA   $67
            AND   #$01
            STA   $17
            LDA   groundSTARTX
            SEC
            SBC   $17
            STA   groundSTARTX
            INC   frameCNT
            LDA   frameCNT
            AND   #$01
            BNE   L23FD
            JSR   drawMOUNTAINS
L23FD       LDA   #$0D
            STA   $6C
            LDA   $68
            CMP   #$99
            BCS   L240E
            LDA   #$0D
            STA   $6C
            JMP   L2412

L240E       LDA   #$FF
            STA   $6C
L2412       LDX   $68
            LDA   tblHGRL,X
            STA   L2436+1
            STA   L2448+1
            LDA   tblHGRH,X
            STA   L2436+2
            STA   L2448+2
            LDY   #$27
            CPX   #$9C
            BCC   L2431
            LDA   #$AA
            JMP   L2433

L2431       LDA   #$80
L2433       AND   #$0F
            TAX
L2436       LDA   $FFFF,Y
            STA   $00
            LSR
            LSR
            LSR
            LSR
            AND   #$07
            ORA   LB442,X
            CPY   $6C
            BCS   L244B
L2448       STA   $FFFF,Y
L244B       LDA   $00
            DEY
            BPL   L2433
            INC   $68
            LDA   $68
            CMP   #$A5
            BEQ   L245B
            JMP   L23FD

L245B       JSR   L0AC5		; draw the vehicle
            DEC   $67
            BEQ   L2465
            JMP   L23DE		; loop

L2465       LDA   #$00
            STA   $6F
            STA   $48
            JSR   L3B32
            JSR   L0AAC
            JMP   goCOURSE	; play game now

*-----------------------------------
*
*-----------------------------------

L2474       LDX   #$03
L2476       LDA   LB413,X
            BNE   L247F
L247B       DEX
            BPL   L2476
L247E       RTS

L247F       STX   $50
            LDA   LB407,X
            CMP   #$11
            BEQ   L247B
            CMP   #$12
            BEQ   L247B
            LDA   LB40F,X
            BMI   L247B
            LDA   $1A
            BEQ   L247E
            LDA   LB407,X
            SEC
            SBC   #$0E
            TAY
            LDA   LB3FF,X
            CLC
            ADC   #$1C
            BCS   L247B
            STA   $00
            CLC
            ADC   #$19
            BCS   L247B
            STA   $01
            LDA   LB41C,Y
            STA   $06
            LDA   $1B
            BIT   $1C
            BPL   L24BB
            CLC
            ADC   #$05
L24BB       CLC
            ADC   $06
            CMP   LB403,X
            BCC   L247B
            LDA   $1A
            CLC
            ADC   #$05
            CMP   $00
            BCC   L247B
            SEC
            SBC   #$0C
            CMP   $01
            BCS   L247B
            LDA   $9D
            BNE   L247B
            LDA   #$01
            STA   $9D
            LDA   $1C
            BMI   L24E3
            LDA   #$FF
            STA   $1C
L24E3       LDA   LB407,X
            ORA   #$80
            STA   LB407,X
            CMP   #$90
            BEQ   L24FB
            LDA   #$00	; 100
            LDX   #$01
            LDY   #$00
            JSR   addTOSCORE
            JMP   L2504

L24FB       LDA   #$00	; 200
            LDX   #$02
            LDY   #$00
            JSR   addTOSCORE
L2504       JMP   L2FCE

L2507       LDA   #$1E
            STA   LB36B,X
            LDA   #$14
            STA   LB35B,X
            LDA   #$14
            STA   LB367,X
            LDA   #$14
            STA   LB357,X
            LDA   #$23
            STA   LB347,X
            LDA   #$73
            STX   $16
            JSR   L26EC
            LDX   $16
            CLC
            ADC   #$8C
            STA   LB343,X
            LDA   #$00
            STA   LB34F,X
            STA   LB353,X

            LDA   $4E	; random value?
            ORA   #$01
            STA   $20
            LDA   $4F
            ORA   #$01
            STA   $21
            EOR   $20
            STA   $22
            RTS

L2548       LDA   LB36F,X
            BEQ   L257D
            LDA   LB343,X
            CMP   #$8C
            BCS   L257D
            STA   $00
            LDA   LB35B,X
            BPL   L257D
            LDA   #$00
            STA   LB363,X
            LDA   $00
            SEC
            SBC   #$04
            BCS   L259B
            LDA   LB373,X
            BEQ   L2572
            LDA   #$FF
            STA   LB34B,X
            RTS

L2572       CLC
            ADC   #$2A
            STA   LB343,X
            LDA   #$FA
            STA   LB373,X
L257D       LDA   LB35B,X
            PHP
            BPL   L2588
            EOR   #$FF
            CLC
            ADC   #$01
L2588       TAY
            LDA   LB842,Y
            CLC
            PLP
            BPL   L2595
            EOR   #$FF
            CLC
            ADC   #$01
L2595       CLC
            ADC   LB343,X
            AND   #$FE
L259B       STA   LB343,X
            LDA   LB36F,X
            BEQ   L25D3
            LDA   LB34B,X
            CMP   #$0D
            BEQ   L25B9
            CMP   #$0C
            BEQ   L25B9
            CMP   #$10
            BCC   L25D3
            CMP   #$14
            BCS   L25D3
            JMP   L25D0

L25B9       LDA   LB347,X
            CLC
            ADC   #$02
            STA   LB347,X
            CMP   #$86
            BCC   L25D0
            LDA   #$89
            STA   LB347,X
            LDA   #$01
            STA   LB383,X
L25D0       JMP   L25F1

L25D3       LDA   LB357,X
            PHP
            BPL   L25DE
            EOR   #$FF
            CLC
            ADC   #$01
L25DE       TAY
            LDA   LB801,Y
            PLP
            BPL   L25EA
            EOR   #$FF
            CLC
            ADC   #$01
L25EA       CLC
            ADC   LB347,X
            STA   LB347,X
L25F1       LDA   LB35B,X
            SEC
            SBC   LB363,X
            STA   LB35B,X
            LDA   LB357,X
            SEC
            SBC   LB35F,X
            STA   LB357,X
            LDA   LB36B,X
            EOR   #$FF
            CLC
            ADC   #$01
            STA   $17
            LDA   LB35B,X
            SEC
            SBC   $17
            BEQ   L2620
            BVS   L261E
            BMI   L2620
L261B       JMP   L262A

L261E       BMI   L261B
L2620       LDA   #$00
            STA   LB363,X
            LDA   $17
            STA   LB35B,X
L262A       LDA   LB35B,X
            SEC
            SBC   LB36B,X
            BEQ   L2637
            BVS   L263A
            BPL   L263C
L2637       JMP   L2647

L263A       BPL   L2637
L263C       LDA   #$00
            STA   LB363,X
            LDA   LB36B,X
            STA   LB35B,X
L2647       LDA   LB367,X
            EOR   #$FF
            CLC
            ADC   #$01
            STA   $17
            LDA   LB357,X
            SEC
            SBC   $17
            BVS   L265E
            BMI   L2660
L265B       JMP   L267F

L265E       BMI   L265B
L2660       LDA   #$0A
            JSR   L26EC
            LDX   $50
            CLC
            ADC   #$01
            EOR   #$FF
            CLC
            ADC   #$01
            STA   LB35F,X
            LDA   #$28
            JSR   L26EC
            LDX   $50
            CLC
            ADC   #$01
            STA   LB367,X
L267F       LDA   LB357,X
            SEC
            SBC   LB367,X
            BEQ   L268C
            BVS   L268F
            BPL   L2691
L268C       JMP   L26AB

L268F       BPL   L268C
L2691       LDA   #$0A
            JSR   L26EC
            LDX   $50
            CLC
            ADC   #$01
            STA   LB35F,X
            LDA   #$28
            JSR   L26EC
            LDX   $50
            CLC
            ADC   #$01
            STA   LB367,X
L26AB       LDA   LB347,X
            CMP   #$41
            BCS   L26BC
            LDA   LB357,X
            BPL   L26BC
            LDA   #$FB
            STA   LB35F,X
L26BC       LDA   LB347,X
            CMP   #$43
            BCC   L26D1
            BEQ   L26D1
            LDA   LB357,X
            BMI   L26D1
            BEQ   L26D1
            LDA   #$05
            STA   LB35F,X
L26D1       LDA   LB343,X
            CMP   #$28
            BCS   L26DD
            LDA   #$F0
            STA   LB363,X
L26DD       LDA   LB343,X
            CMP   #$BE
            BCC   L26EB
            BEQ   L26EB
            LDA   #$18
            STA   LB363,X
L26EB       RTS

*-----------------------------------
* 
*-----------------------------------

L26EC       CLC
            TAX
            LDY   #$18	; 24 bits
L26F0       LDA   $20
            ROL
            ROL
            ROL
            ROL
            ROL
            EOR   $20
            ROL
            ROL   $22
            ROL   $21
            ROL   $20
            DEY
            BNE   L26F0

            LDA   $20
            CLC
            ADC   $21
            ADC   $22
            STA   $00
            STX   $01
            LDA   #$00
            LDX   #$08	; 8 bits
L2712       ASL
            ROL   $02
            ASL   $00
            BCC   L2720
            CLC
            ADC   $01
            BCC   L2720
            INC   $02
L2720       DEX
            BNE   L2712
            LDA   $02
            RTS

*-----------------------------------
* GAME ENTRY POINT
*-----------------------------------

entryPOINT  LDX   slot16	; stop disk drive
            STA   $C088,X

            JSR   showHGRPAGE2	; show the title page
            BIT   KBDSTROBE

            LDX   #$41		; wait
L2733       LDA   #$FF
            JSR   WAIT
            LDA   KBD
            BMI   L2740
            DEX
            BNE   L2733

L2740       BIT   TXTPAGE1	; load the moon base picture
            BIT   TXTSET
            BIT   KBDSTROBE
            LDX   slot16	; turn disk drive on
            STA   $C089,X
            LDA   #$FF
            JSR   WAIT
            JSR   loadMOONBASEPIC	; load picture
            LDX   slot16
            STA   $C088,X

            LDA   #$00
            STA   fgINPUT
            STA   courseTYPE
            STA   P1_courseTYPE
            STA   P2_courseTYPE
            STA   nbPLAYERS
            STA   fgSOUND
            LDA   #SPKR
            STA   doBEEP+1
L2773       LDA   #$01
            STA   fgDEMO2
            JSR   selectOPTIONS
            BCC   L2780		; start demo mode
            JMP   L2783		; start game mode
L2780       JMP   L2B02

*-----------------------------------
* START GAME MODE
*-----------------------------------

L2783       BIT   KBDSTROBE
            BIT   TXTPAGE1
            BIT   TXTSET
            JSR   L0FC9
            JSR   L0A29
            LDA   #$00
            STA   fgBLINK

            LDA   courseTYPE	; Set pointer to course data
            BNE   L27BB
            LDA   #<courseBEGINNER	; beginner
            STA   coursePTR3
            STA   coursePTR4
            STA   coursePTR1
            STA   coursePTR2
            LDA   #>courseBEGINNER
            STA   coursePTR3+1
            STA   coursePTR4+1
            STA   coursePTR1+2
            STA   coursePTR2+2
            JMP   L27D7
L27BB       LDA   #<courseCHAMPION	; champion
            STA   coursePTR3
            STA   coursePTR4
            STA   coursePTR1
            STA   coursePTR2
            LDA   #>courseCHAMPION
            STA   coursePTR3+1
            STA   coursePTR4+1
            STA   coursePTR1+2
            STA   coursePTR2+2

L27D7       LDX   slot16
            STA   $C089,X
            LDA   #$FF
            JSR   WAIT
            JSR   loadMOONBASEPIC
            LDA   #$00
            STA   $2E
            STA   fgDEMO2
            STA   curPLAYER
            LDA   #NB_LIVES
            STA   P1_nbLIVES
            STA   P2_nbLIVES
            LDA   #$00
            STA   P1_basePOINT
            STA   P2_basePOINT
            STA   P1_score+4
            STA   P2_score+4
            STA   P1_score+2
            STA   P2_score+2
            STA   P1_score
            STA   P2_score
            STA   P1_time+2
            STA   P2_time+2
            STA   P1_time
            STA   P2_time
            LDA   #$FF
            STA   P1_point
            STA   P2_point
            LDA   nbPLAYERS
            BEQ   L282D
            LDA   #$01
            STA   $EE
L282D       LDA   courseTYPE
            STA   P1_courseTYPE
            STA   P2_courseTYPE
            JSR   setPLAYERDATA
            JSR   showNBLIVES

            LDA   fgSOUND
            BEQ   L2848
            LDA   #TAPEOUT
            STA   doBEEP+1
            JMP   L284D
L2848       LDA   #SPKR
            STA   doBEEP+1

L284D       JSR   L0AF9
            JSR   drawMOUNTAINS
            JSR   showHGRPAGE2
            JSR   showCOURSETYPE
            LDA   #$16
            STA   $F3
            JMP   animMOONBASE

L2860       LDA   #$01
            STA   charWAIT
            LDA   courseTYPE
            BEQ   L2876
            LDX   #$0D
            LDY   #$96
            JSR   printSTRING
            ASC   "C@"
            JMP   L287F

L2876       LDX   #$0D
            LDY   #$96
            JSR   printSTRING
            ASC   "B@"
L287F       LDA   fgINPUT
            BEQ   L2897
            LDX   #$0B
            LDY   #$A0
            JSR   printSTRING
            ASC   "JOYSTICK@"
            JMP   L28A7

L2897       LDX   #$0B
            LDY   #$A0
            JSR   printSTRING
            ASC   "KEYBOARD@"
L28A7       LDA   nbPLAYERS
            BEQ   L28B8
            LDX   #$22
            LDY   #$96
            JSR   printSTRING
            ASC   "2@"
            JMP   L28C1

L28B8       LDX   #$22
            LDY   #$96
            JSR   printSTRING
            ASC   "1@"
L28C1       LDA   fgSOUND
            BEQ   L28D3
            LDX   #$20
            LDY   #$A0
            JSR   printSTRING
            ASC   "OFF@"
            JMP   $28DE

L28D3       LDX   #$20
            LDY   #$A0
            JSR   printSTRING
            ASC   "ON @"
L28DE       RTS

*-----------------------------------
* SELECT OPTIONS MENU
*-----------------------------------

selectOPTIONS
            BIT   TXTPAGE1
            BIT   TXTSET
            BIT   KBDSTROBE
            JSR   L0FC9
            LDA   #$BF
            STA   $00
L28EF       LDX   $00
            LDA   tblHGRH,X
            STA   $26+1
            LDA   tblHGRL,X
            STA   $26
            LDY   #$27
            LDA   #$80
            CPX   #$46
            BCS   L2905
            LDA   #$00
L2905       STA   ($26),Y
            DEY
            BPL   L2905
            DEC   $00
            LDA   $00
            CMP   #$23
            BNE   L28EF

            LDA   #$01
            STA   charWAIT
            LDX   #$0A
            LDY   #$2D
            JSR   printSTRING
            ASC   "MOON PATROL OPTIONS@"
            LDX   #$0B
            LDY   #$41
            JSR   printSTRING
            ASC   "[K] KEYBOARD MODE@"
            LDX   #$0B
            LDY   #$4B
            JSR   printSTRING
            ASC   "[J] JOYSTICK MODE@"
            LDX   #$0B
            LDY   #$55
            JSR   printSTRING
            ASC   "[1] ONE PLAYER OPTION@"
            LDX   #$0B
            LDY   #$5F
            JSR   printSTRING
            ASC   "[2] TWO PLAYER OPTION@"
            LDX   #$0B
            LDY   #$69
            JSR   printSTRING
            ASC   "[B] BEGINNER COURSE@"
            LDX   #$0B
            LDY   #$73
            JSR   printSTRING
            ASC   "[C] CHAMPION COURSE@"
            LDX   #$0B
            LDY   #$7D
            JSR   printSTRING
            ASC   "[S] SOUND ON OR OFF@"
            LDX   #$05
            LDY   #$96
            JSR   printSTRING
            ASC   "COURSE ( )@"
            LDX   #$19
            LDY   #$96
            JSR   printSTRING
            ASC   "PLAYERS ( )@"
            LDX   #$05
            LDY   #$A0
            JSR   printSTRING
            ASC   "MODE (        )@"
            LDX   #$19
            LDY   #$A0
            JSR   printSTRING
            ASC   "SOUND (   )@"
            LDX   #$0A
            LDY   #$B1
            JSR   printSTRING
            ASC   "SPACE BAR STARTS GAME@"
            BIT   KBDSTROBE
            JSR   L2860
            JSR   showHGRPAGE2
L2A64       LDA   #$00
            STA   $B5
            LDA   #$0A
            STA   $B6
L2A6C       LDA   KBD
            BMI   L2A95
            LDA   BUTN0
            STA   $00
            EOR   $9E
            BPL   L2A82
            LDA   $00
            BPL   L2A82
            STA   $9E
            SEC	; start game mode
            RTS

L2A82       LDA   $00
            STA   $9E
            LDA   #$60
            JSR   WAIT
            DEC   $B5
            BNE   L2A6C
            DEC   $B6
            BNE   L2A6C
            CLC	; start demo mode
            RTS

L2A95       BIT   KBDSTROBE
            CMP   #"K"
            BNE   L2AA4
            LDA   #$00
            STA   fgINPUT
            JMP   L2AFC

L2AA4       CMP   #"J"
            BNE   L2AB0
            LDA   #$01
            STA   fgINPUT
            JMP   L2AFC

L2AB0       CMP   #"1"
            BNE   L2ABC
            LDA   #$00
            STA   nbPLAYERS
            JMP   L2AFC

L2ABC       CMP   #"2"
            BNE   L2AC8
            LDA   #$01
            STA   nbPLAYERS
            JMP   L2AFC

L2AC8       CMP   #"B"
            BNE   L2AD7
            LDA   #$00
            STA   courseTYPE
            STA   courseTYPE_unused
            JMP   L2AFC

L2AD7       CMP   #"C"
            BNE   L2AE6
            LDA   #$01
            STA   courseTYPE
            STA   courseTYPE_unused
            JMP   L2AFC

L2AE6       CMP   #"S"
            BNE   L2AF3
            LDA   fgSOUND
            EOR   #$01
            STA   fgSOUND
            JMP   L2AFC

L2AF3       CMP   #" "
            BEQ   L2AFA
            JMP   L2A6C
L2AFA       SEC	; start game mode
            RTS

L2AFC       JSR   L2860
            JMP   L2A64

*-----------------------------------
* START DEMO MODE
*-----------------------------------

L2B02       BIT   KBDSTROBE
            BIT   TXTPAGE1
            BIT   TXTSET
            JSR   L0FC9
            LDA   fgINPUT
            STA   fgINPUT2
            LDA   courseTYPE
            STA   courseTYPE2
            LDA   nbPLAYERS
            STA   nbPLAYERS2
            LDA   #$00
            STA   fgBLINK
            STA   P1_score+4
            STA   P1_score+2
            STA   P1_score
            STA   nbPLAYERS
            STA   curPLAYER
            STA   P1_time
            STA   P1_time+2
            STA   P1_basePOINT
            LDA   #$FF
            STA   P1_point
            LDA   #NB_LIVES
            STA   P1_nbLIVES
            JSR   setPLAYERDATA
            JSR   L2B72
            LDA   #$01		; another demo flag
            STA   fgDEMO2
            LDA   #<courseDEMO
            STA   $83
            STA   $44
            LDA   #>courseDEMO
            STA   $83+1
            STA   $44+1
            LDA   #KBD
            STA   doBEEP+1
            JSR   showHGRPAGE2
            LDA   #$00
            STA   demoINDEX
            TAX
            LDA   demoDATA,X
            STA   demoCNT
            JMP   L0996

L2B72       LDA   #$FF
            STA   $6D
            LDA   #$00
            STA   $6F
            STA   $67
            STA   $C0
            STA   $BD
            STA   $BB
            LDA   #$FF
            STA   $4A
            LDA   #$00
            STA   $96
            STA   $DD
            STA   $70
            LDA   #$01
            STA   $97
            LDA   #$4A
            STA   $5B
            LDA   #$46
            STA   $57
            LDA   #$54
            STA   $5D
            LDA   #$64
            STA   $5F
            LDA   #$85
            STA   $58
            LDA   #$8E
            STA   $5C
            STA   $5E
            STA   $60
            LDA   #$4A
            STA   $0F
            LDA   #$02
            STA   $07
            LDA   #$00
            STA   theACCEL
            STA   $13
            LDA   $83
            STA   $44
            LDA   $83+1
            STA   $44+1
            JSR   L0AAC
            JSR   showNBLIVES
            JSR   L0AF9
            JSR   drawMOUNTAINS
            JSR   printTIME
            JSR   printPLAYERSCORE
            JSR   printHIGHSCORE
            LDA   plrPOINT	; did we start?
            BMI   L2BF9
            LDA   plrPOINT	; yes
            PHA
            LDA   #$19
            STA   plrPOINT
            LDA   #$00
            STA   $04
            JSR   drawXPOINT
            PLA
            STA   plrPOINT
            LDA   #$D5
            STA   $04
            JSR   drawXPOINT
            JSR   L21B6
            RTS

L2BF9       LDA   #$19	; no
            STA   plrPOINT
            LDA   #$00
            STA   $04
            JSR   drawXPOINT
            LDA   #$1F
            STA   plrPOINT
            JSR   L21B6
            LDA   #$FF
            STA   plrPOINT
            RTS

L2C10       LDA   $5C
            SEC
            SBC   $A3
            CMP   #$8E
            BCC   L2C24
            LDA   #$8E
            STA   $5C
            STA   $5E
            STA   $60
            JMP   L2C32

L2C24       STA   $5C
            STA   $5E
            STA   $60
            DEC   $5F
            DEC   $5F
            DEC   $5D
            INC   $5B
L2C32       LDA   $5C
            SEC
            SBC   $A3
            CMP   #$8E
            BCC   L2C3D
            LDA   #$8E
L2C3D       STA   $5C
            STA   $5E
            STA   $60
            LDA   $A4
            SEC
            SBC   #$02
            BCS   L2C4F
            CLC
            ADC   #$0A
            DEC   $A3
L2C4F       STA   $A4
            LDA   $5C
            CMP   #$89
            BCC   L2C6D
            LDA   $A2
            SEC
            SBC   #$07
            BCS   L2C63
            DEC   $A1
            CLC
            ADC   #$0A
L2C63       STA   $A2
            LDA   $A2
            STA   $A4
            LDA   $A1
            STA   $A3
L2C6D       LDA   $A5
            BNE   L2C7A
            LDX   $65
            LDY   $66
            LDA   #$00
            JSR   undrawSPRITE
L2C7A       LDA   $A5
            CMP   #$02
            BEQ   L2C89
            LDA   #$00
            LDX   $63
            LDY   $64
            JSR   undrawSPRITE
L2C89       LDA   #$00
            LDX   $61
            LDY   $62
            JSR   undrawSPRITE
            LDA   $5F
            BEQ   L2C9D
            CMP   #$FF
            BEQ   L2C9D
            JMP   L2CA1

L2C9D       LDA   #$01
            STA   $A5
L2CA1       LDA   $5D
            BNE   L2CA9
            LDA   #$02
            STA   $A5
L2CA9       LDA   $A5
            BNE   L2CB6
            LDA   #$00
            LDX   $5F
            LDY   $60
            JSR   drawSPRITE
L2CB6       LDA   $A5
            CMP   #$02
            BEQ   L2CC5
            LDA   #$00
            LDX   $5D
            LDY   $5E
            JSR   drawSPRITE
L2CC5       LDA   #$00
            LDX   $5B
            LDY   $5C
            JSR   drawSPRITE
            LDA   $5B
            STA   $61
            LDA   $5D
            STA   $63
            LDA   $5F
            STA   $65
            LDA   $5C
            STA   $62
            LDA   $5E
            STA   $64
            LDA   $60
            STA   $66
            DEC   mountX3
            LDA   mountX3
            CMP   #$FF
            BNE   L2CF2
            LDA   #$8C
            STA   mountX3
L2CF2       DEC   mountX1
            LDA   mountX1
            CMP   #$FF
            BNE   L2CFE
            LDA   #$8C
            STA   mountX1
L2CFE       JSR   drawMOUNTAINS
            RTS

L2D02       LDA   $70
            BNE   L2D07
            RTS

L2D07       DEC   nbLIVES
            JSR   L3583
            LDX   #$03
L2D0F       LDA   LB407,X
            BMI   L2D26
            LDA   LB40F,X
            STA   LB40B,X
            LDA   LB403,X
            STA   LB3FB,X
            LDA   LB3FF,X
            STA   LB3F7,X
L2D26       LDA   $C7,X
            STA   LB3E2,X
            LDA   $CB,X
            STA   LB3E6,X
            LDA   $C3,X
            STA   LB3F3,X
            LDA   $D1,X
            STA   LB3EF,X
            DEX
            BPL   L2D0F
            LDA   #$00
            STA   $AF
            LDA   $65
            ORA   courseTYPE
            TAX
            LDA   #$00
            LDY   $66
            JSR   undrawSPRITE
            LDA   $63
            ORA   courseTYPE
            TAX
            LDA   #$00
            LDY   $64
            JSR   undrawSPRITE
            LDA   $61
            ORA   courseTYPE
            TAX
            LDY   $62
            LDA   #$00
            JSR   undrawSPRITE
            LDA   $59
            ORA   courseTYPE
            TAX
            LDA   #$01
            LDY   $5A
            JSR   undrawSPRITE
            LDA   #$03
            STA   $A1
            STA   $A3
            LDA   #$00
            STA   $A5
            LDA   #$02
            STA   $A2
            STA   $A4
            JSR   L2C10
            LDA   #$06
            STA   $71
            LDA   #$04
            STA   $B6
L2D90       LDA   $71
            LDX   $59
            INX
            INX
            LDY   $5A
            INY
            JSR   drawSPRITE2
            LDA   #$07
            STA   $06
            LDX   #$32
            LDY   #$01
            JSR   L2FA5
            JSR   L2C10
            JSR   L2C10
            JSR   L2C10
            JSR   L2C10
            JSR   L2C10
            LDA   #$0A
            JSR   WAIT
            JSR   L2ECE
            LDA   $B6
            BEQ   L2DE4
            LDA   $71
            LDX   $59
            INX
            INX
            LDY   $5A
            INY
            JSR   drawSPRITE3
            LDA   $71
            CMP   #$06
            BEQ   L2DDB
            LDA   #$06
            STA   $71
            JMP   L2DDF

L2DDB       LDA   #$07
            STA   $71
L2DDF       DEC   $B6
            JMP   L2D90

L2DE4       LDA   #$07
            STA   $06
            LDX   #$00
            LDY   #$07
            JSR   L2FA5
            JSR   L2C10
            LDA   #$06
            STA   $71
L2DF6       LDA   $71
            LDX   $59
            INX
            INX
            LDY   $5A
            INY
            JSR   drawSPRITE2
            LDA   $71
            CMP   #$08
            BEQ   L2E2A
            LDA   #$03
            STA   $72
L2E0C       JSR   L2ECE
            JSR   L2C10
            JSR   L2C10
            DEC   $72
            BPL   L2E0C
            LDA   $71
            LDX   $59
            INX
            INX
            LDY   $5A
            INY
            JSR   drawSPRITE3
            INC   $71
            JMP   L2DF6

L2E2A       JSR   L2ECE
            LDA   $71
            LDX   $59
            INX
            INX
            LDY   $5A
            INY
            JSR   drawSPRITE3
            LDA   #$00
            STA   $70
            LDA   #$1E
L2E3F       PHA
            JSR   L2ECE
            JSR   L2C10
            JSR   L2C10
            LDA   #$14
            JSR   WAIT
            PLA
            SEC
            SBC   #$01
            BCS   L2E3F
            JSR   L0AAC
            LDA   #$00
            STA   $E0
            STA   $DF
            STA   $9D
            JSR   L32BE
            LDA   #$FF
            JSR   WAIT
            LDA   #$FF
            JSR   WAIT
            LDA   fgDEMO2
            BEQ   L2E83
            LDA   fgINPUT2
            STA   fgINPUT
            LDA   courseTYPE2
            STA   courseTYPE
            LDA   nbPLAYERS2
            STA   nbPLAYERS
            JMP   L2773

L2E83       JSR   savePLAYERDATA
            LDA   nbLIVES
            BNE   L2E8E
            JMP   L3911		; we're dead!

L2E8E       LDA   nbPLAYERS
            BEQ   L2E9F
            LDA   $2E
            BNE   L2E9F
            LDA   curPLAYER
            EOR   #$01
            STA   curPLAYER
L2E9F       BIT   TXTPAGE1
            BIT   TXTSET
            LDA   #<musicGAME_notes
            STA   $73
            LDA   #>musicGAME_notes
            STA   $73+1
            LDA   #<musicGAME_repeat
            STA   $75
            LDA   #>musicGAME_repeat
            STA   $75+1
            LDA   #$00
            STA   $A0
            JSR   L0FC9
            JSR   L3254
            JSR   setPLAYERDATA
L2EC2       JSR   L2B72
            JSR   showHGRPAGE2
            JSR   L33E0
            JMP   L0996

L2ECE       INC   frameCNT
            LDA   frameCNT
            AND   #$01
            BNE   L2EDD
            DEC   mountX1
            DEC   mountX3
            JSR   drawMOUNTAINS
L2EDD       LDA   frameCNT
            AND   #$0F
            BNE   L2EE6
            JSR   L32DF
L2EE6       JSR   L0E9A
            DEC   $F3
            BPL   L2EF4
            LDA   #$16
            STA   $F3
            JSR   printTIME
L2EF4       JSR   L164F
            JSR   L13AD
            JSR   L1FB0
            JSR   L1797
            JSR   L18C5
            JSR   L103E
            JSR   L37C7
            JSR   L37A2
            JSR   L3898
            JSR   L1371
            JSR   L2474
            JSR   L0DC0
            LDA   #$50
            JSR   WAIT
            RTS

L2F1E       LDA   L1FFF+1,X
L2F21       CLC
            ADC   $06
            BCC   L2F21
            JSR   doBEEP		; beep
            INX
            BNE   L2F1E
            RTS

L2F2D       STA   $00
            STX   $01
            LDA   #$00
            LDX   #$08
L2F35       ASL
            ROL   $02
            ASL   $00
            BCC   L2F43
            CLC
            ADC   $01
            BCC   L2F43
            INC   $02
L2F43       DEX
            BNE   L2F35
            TAX
            LDA   $02
            RTS

L2F4A       LDA   $15
            PHA
            LDA   $16
            PHA
            LDA   #$00
            STA   $17
            TAY
L2F55       LDA   $0F
            STA   $11
            LDA   ($0D),Y
            AND   #$03
            BNE   L2F65
            LDA   #$00
            STA   $15
            STA   $16
L2F65       LDA   ($0D),Y
            AND   #$80
            STA   $DE
            LDA   $15
            ASL
            PHP
L2F6F       LDA   ($0D),Y
            AND   #$7F
            PLP
            ROL
            ASL
            PHP
            LSR
            ORA   $DE
            STA   ($0A),Y
            INY
            BNE   L2F83
            INC   $0E
            INC   $0B
L2F83       DEC   $11
            BNE   L2F6F
            INC   $17
            LDA   $17
            CMP   $18
            BEQ   L2F9D
            PLP
            LDA   $15
            PHA
            LDA   $16
            STA   $15
            PLA
            STA   $16
            JMP   L2F55

L2F9D       PLP
            PLA
            STA   $16
            PLA
            STA   $15
            RTS

L2FA5       INY
            INX
L2FA7       LDA   L1FFF+1,X
L2FAA       CLC
            ADC   $06
            BCC   L2FAA
            JSR   doBEEP
            DEX
            BEQ   L2FBA
            LDA   $00
            JMP   L2FA7

L2FBA       DEY
            BNE   L2FA7
            RTS

L2FBE       STA   $03
            LDX   #$1E
L2FC2       LDA   $03
            JSR   WAIT
            JSR   doBEEP
            DEX
            BPL   L2FC2
            RTS

L2FCE       LDA   #$01
            STA   $06
            LDX   #$D2
            JSR   L2F1E
            RTS

L2FD8       LDA   $A0	; music flag
            BNE   L2FFE
            LDX   #$00
            LDA   ($75,X)
            ASL
            STA   $54
            LDA   ($73,X)
            BNE   L2FFC	; end of data, reset the pointers

            LDA   #<musicGAME_notes
            STA   $73
            LDA   #>musicGAME_notes
            STA   $73+1
            LDA   #<musicGAME_repeat
            STA   $75
            LDA   #>musicGAME_repeat
            STA   $75+1
            LDA   #$00
            STA   $A0
            RTS

L2FFC       STA   $53
L2FFE       LDX   #$FF
            LDY   #$03
L3002       LDA   $53
L3004       NOP
            DEX
            BEQ   L300C
            NOP
            JMP   L300F

L300C       DEY
            BEQ   L3024
L300F       SEC
            SBC   #$01
            BCS   L3004
            JSR   doBEEP
            DEX
            BEQ   L301E
            NOP
            JMP   L3021

L301E       DEY
            BEQ   L3024
L3021       JMP   L3002

L3024       DEC   $54
            BEQ   L302F
            LDA   #$01
            STA   $A0
            JMP   L303F

L302F       INC   $75
            BNE   L3035
            INC   $75+1
L3035       INC   $73
            BNE   L303B
            INC   $73+1
L303B       LDA   #$00
            STA   $A0
L303F       RTS

*-----------------------------------
* SET NEXT (CHAMPION) COURSE
*-----------------------------------

setNEXTCOURSE
            BIT   TXTPAGE1	; we won the beginner course
            BIT   TXTSET	; so, let's start a...
            JSR   L0FC9
            LDA   $83
            STA   $44
            LDA   $83+1
            STA   $44+1
            LDX   slot16
            STA   $C089,X
            LDA   #$FF
            JSR   WAIT
            JSR   loadMOONBASEPIC
            LDA   #$01		; ...champion course
            STA   courseTYPE
            JSR   L0A33
            JSR   L0AF9
            JSR   drawMOUNTAINS
            JSR   showCOURSETYPE
            LDA   #$00
            STA   plrTIME+1
            STA   plrTIME
            JSR   savePLAYERDATA
            JSR   L3296
            JSR   showHGRPAGE2
            JMP   animMOONBASE

*-----------------------------------
* PLAY MUSAK
*-----------------------------------

playMUSIC   STX   $8D
            STA   $8D+1
            LDA   #$00
            STA   $95
            STA   $93
            STA   $94
L308D       LDY   #$00
            LDA   ($8D),Y
            BNE   L3094
            RTS

L3094       STA   $8F
            LDX   #$00
            JSR   L313B
            STA   L30D5+1
            STA   L30E5+1
            STX   L30D8+1
            STX   L30E8+1
            LDX   #$01
            JSR   L313B
            STA   L30FE+1
            STA   L310E+1
            STX   L3101+1
            STX   L3111+1
            LDA   $92
            BNE   L30C2
            ASL   $93
            ASL   $93
            ASL   $93
L30C2       LDA   #$00
            LDX   #$8A
            LDY   #$40
            STA   $90
L30CA       STA   $95
            DEY
            BNE   L30DD
            LDY   $91
            BIT   $95
            BMI   L30EE
L30D5       BIT   SPKR
L30D8       EOR   #$80
            JMP   L30F2

L30DD       CPY   $93
            BNE   L30ED
            BIT   $95
            BPL   L30EF
L30E5       BIT   SPKR
L30E8       EOR   #$80
            JMP   L30F3

L30ED       NOP
L30EE       NOP
L30EF       NOP
            NOP
            NOP
L30F2       NOP
L30F3       STA   $95
            DEX
            BNE   L3106
            LDX   $92
            BIT   $95
            BMI   L3117
L30FE       BIT   SPKR
L3101       EOR   #$80
            JMP   L311B

L3106       CPX   $94
            BNE   L3116
            BIT   $95
            BPL   L3118
L310E       BIT   SPKR
L3111       EOR   #$80
            JMP   L311C

L3116       NOP
L3117       NOP
L3118       NOP
            NOP
            NOP
L311B       NOP
L311C       DEC   $90
            BNE   L3127
            DEC   $8F
            BEQ   L312D
            JMP   L30CA

L3127       NOP
            NOP
            NOP
            JMP   L30CA

L312D       LDA   $8D
            CLC
            ADC   #$03
            STA   $8D
            BCC   L3138
            INC   $8E
L3138       JMP   L308D

L313B       INY
            LDA   ($8D),Y
            PHP
            STA   $91,X
            LSR
            LSR
            LSR
            LSR
            STA   $93,X
            PLP
            BEQ   L3157
            LDA   fgSOUND
            BEQ   L3153
            LDA   #TAPEOUT
            JMP   L3155
L3153       LDA   #SPKR
L3155       LDX   #$A0
L3157       RTS

*-----------------------------------
* 
*-----------------------------------

L3158       LDA   $D5
            STA   L318E+1
            LDA   $D5+1
            STA   L318E+2
            LDA   #$BA
            STA   $68
            LDX   #$00
            STX   $50
L316A       LDX   $68
            LDA   tblHGRL,X
            STA   L31B1+1
            STA   L31C1+1
            STA   L31D9+1
            LDA   tblHGRH,X
            STA   L31B1+2
            STA   L31C1+2
            STA   L31D9+2
            LDA   #$55
            STA   $05
            LDA   #$55
            STA   $06
            LDX   $50
L318E       LDA   $FFFF,X
            STX   $B4
            ASL
            LDX   $D8
            INX
L3197       DEX
            BEQ   L31A2
            ROL   $05
            ROL
            ROL   $06
            JMP   L3197

L31A2       LSR
            ORA   #$80
            LDX   $B4
            LDY   $D7
            CPY   #$00
            BMI   L31B4
            CPY   #$28
            BCS   L31B4
L31B1       STA   $FFFF,Y
L31B4       LDA   $06
            INY
            CPY   #$00
            BMI   L31C4
            CPY   #$28
            BCS   L31C4
            ORA   #$80
L31C1       STA   $FFFF,Y
L31C4       INY
            TYA
            AND   #$01
            BEQ   L31CF
            LDA   #$D5
            JMP   L31D1

L31CF       LDA   #$AA
L31D1       CPY   #$00
            BMI   L31DC
            CPY   #$28
            BCS   L31DC
L31D9       STA   $FFFF,Y
L31DC       DEC   $68
            INC   $50
            LDA   $68
            CMP   #$B3
            BNE   L316A
            LDA   $D8
            SEC
            SBC   $AF
            BCS   L31F2
            CLC
            ADC   #$07
            DEC   $D7
L31F2       STA   $D8
            RTS

*-----------------------------------
* MUSIC - PLAYER REACHED A MILESTONE
*-----------------------------------

playMUSIC_ENDSTAGE
            LDX   #<musicENDSTAGE
            LDA   #>musicENDSTAGE
            JMP   playMUSIC

*-----------------------------------
* MUSIC - PLAYER FINISHED THE GAME
*-----------------------------------

playMUSIC_GAMEWON
            LDX   #<musicGAMEWON
            LDA   #>musicGAMEWON
            JMP   playMUSIC

*-----------------------------------
* SHOW COURSE TYPE
*-----------------------------------

showCOURSETYPE
            LDA   courseTYPE
            BNE   L322E
            LDX   #$08
            LDY   #$4E
            LDA   #$01
            STA   charWAIT
            JSR   printSTRING
            ASC   "  BEGINNER COURSE GO !  @"
            RTS

L322E       LDX   #$08
            LDY   #$4E
            LDA   #$01
            STA   charWAIT
            JSR   printSTRING
            ASC   "  CHAMPION COURSE GO !  @"
            RTS

*-----------------------------------
* 
*-----------------------------------

L3254       LDA   curPLAYER
            BNE   L325A
L3259       RTS

L325A       LDA   $EE
            BEQ   L3259
            LDA   #$00
            STA   $EE
            JSR   L0A33
            LDX   slot16
            LDA   $C089,X
            LDA   #$FF
            JSR   WAIT
            JSR   loadMOONBASEPIC
            JSR   printHIGHSCORE
            LDA   #$00
            STA   curPLAYER
            JSR   printPLAYERSCORE
            LDA   #$01
            STA   curPLAYER
            JSR   setPLAYERDATA
            JSR   L0AF9
            JSR   showCOURSETYPE
            JSR   showHGRPAGE2
            PLA
            PLA
            JSR   showNBLIVES
            JMP   animMOONBASE

*-----------------------------------
* 
*-----------------------------------

L3296       LDA   curPLAYER
            PHA
            LDA   #$00
            STA   curPLAYER
            JSR   setPLAYERDATA
            JSR   printPLAYERSCORE
            JSR   printHIGHSCORE
            LDA   #$01
            STA   curPLAYER
            JSR   setPLAYERDATA
            JSR   printPLAYERSCORE
            PLA
            STA   curPLAYER
            JSR   setPLAYERDATA
            JSR   showNBLIVES
            RTS

*-----------------------------------
* 
*-----------------------------------

L32BE       LDA   curPLAYER
            PHA
            LDA   #$01
            STA   fgBLINK
            LDA   #$00
            STA   curPLAYER
            JSR   L32DF
            LDA   #$01
            STA   fgBLINK
            STA   curPLAYER
            JSR   L32DF
            PLA
            STA   curPLAYER
            RTS

*-----------------------------------
*
*-----------------------------------

L32DF       LDA   #$01
            STA   charWAIT
            LDA   fgBLINK
            BEQ   L330E
            LDA   fgBLINK
            EOR   #$01
            STA   fgBLINK
            LDA   curPLAYER
            BEQ   L3302
            LDY   #$18
            LDX   #$02
            JSR   printSTRING
            ASC   "2UP@"
            RTS

L3302       LDY   #$0F
            LDX   #$02
            JSR   printSTRING
            ASC   "1UP@"
            RTS

L330E       LDA   fgBLINK
            EOR   #$01
            STA   fgBLINK
            LDA   curPLAYER
            BEQ   L3327
            LDY   #$18
            LDX   #$02
            JSR   printSTRING
            ASC   "   @"
            RTS

L3327       LDY   #$0F
            LDX   #$02
            JSR   printSTRING
            ASC   "   @"
            RTS

L3333       LDX   #$03
L3335       LDA   LB3DE,X
            BNE   L333E
L333A       DEX
            BPL   L3335
L333D       RTS

L333E       STX   $50
            LDA   $C3,X
            CMP   #$16
            BNE   L333A
            LDA   $D1,X
            BMI   L333A
            LDA   $1A
            BEQ   L333D
            LDA   $C7,X
            CLC
            ADC   #$1C
            BCS   L333A
            CLC
            ADC   #$04
            STA   $00
            CLC
            ADC   #$1E
            STA   $01
            LDA   $1B
            SEC
            SBC   #$02
            CMP   #$7A
            BCC   L333A
            LDA   $1A
            CLC
            ADC   #$05
            CMP   $00
            BCC   L333A
            SEC
            SBC   #$0C
            CMP   $01
            BCS   L333A
            LDA   $9D
            BNE   L333A
            LDA   #$01
            STA   $9D
            LDA   $1C
            BMI   L3388
            LDA   #$FF
            STA   $1C
L3388       LDA   #$15
            STA   LB3F3,X
            LDY   $C7,X
            LDA   tblXBYTE,Y
            CLC
            ADC   $D1,X
            STA   $B0
            CLC
            ADC   #$09
            STA   $B1
            LDA   #$87
            STA   $B2
L33A0       LDX   $B2
            LDA   tblHGRH,X
            STA   $26+1
            LDA   tblHGRL,X
            STA   $26
            LDY   $B0
            LDA   #$80
L33B0       STA   ($26),Y
            INY
            CPY   $B1
            BNE   L33B0
            INC   $B2
            LDA   $B2
            CMP   #$99
            BNE   L33A0
            LDX   $50
            LDA   #$0A
            STA   $BD
            LDA   $C7,X
            CLC
            ADC   #$20
            STA   $BE
            LDA   #$91	; LOGO
            STA   $BF
            LDA   #$02
            JSR   L26EC
            CLC
            ADC   #$10
            STA   $D9
            JSR   L1074
            JMP   L2FCE

L33E0       LDA   nbPLAYERS
            BNE   L33E6
            RTS

L33E6       LDA   #$05
            STA   $B0
L33EA       LDA   curPLAYER
            BEQ   L3404
            LDX   #$0F
            LDY   #$41
            JSR   printSTRING
            ASC   "PLAYER TWO@"
            JMP   L3416

L3404       LDX   #$0F
            LDY   #$41
            JSR   printSTRING
            ASC   "PLAYER ONE@"
L3416       LDX   #$01
L3418       LDA   #$FF
            JSR   WAIT
            DEX
            BPL   L3418
            LDX   #$0F
            LDY   #$41
            JSR   printSTRING
            ASC   "          @"
            LDX   #$01
L3434       LDA   #$FF
            JSR   WAIT
            DEX
            BPL   L3434
            DEC   $B0
            BNE   L33EA
            RTS

*-----------------------------------
* SET PLAYER DATA (AT GAME START)
*-----------------------------------

setPLAYERDATA
            LDA   curPLAYER
            BNE   L3494
            LDA   P1_courseTYPE		; set data for player 1
            STA   courseTYPE
            LDA   P1_point
            STA   plrPOINT
            LDA   P1_score
            STA   plrSCORE
            LDA   P1_score+2
            STA   plrSCORE+1
            LDA   P1_score+4
            STA   plrSCORE+2
            LDA   P1_time+2
            STA   plrTIME+1
            LDA   P1_time
            STA   plrTIME
            LDA   P1_nbLIVES
            STA   nbLIVES
            LDA   P1_basePOINT
            STA   basePOINT
            LDA   P1_plrCOURSE
            STA   plrCOURSE
            LDA   P1_plrCOURSE+2
            STA   plrCOURSE+1
            LDA   coursePTR3
            STA   $44
            LDA   coursePTR3+1
            STA   $44+1
            LDA   coursePTR1
            STA   $83
            LDA   coursePTR1+2
            STA   $83+1
            RTS

L3494       LDA   P2_courseTYPE		; set data for player 2
            STA   courseTYPE
            LDA   P2_point
            STA   plrPOINT
            LDA   P2_score
            STA   plrSCORE
            LDA   P2_score+2
            STA   plrSCORE+1
            LDA   P2_score+4
            STA   plrSCORE+2
            LDA   P2_time+2
            STA   plrTIME+1
            LDA   P2_time
            STA   plrTIME
            LDA   P2_nbLIVES
            STA   nbLIVES
            LDA   P2_basePOINT
            STA   basePOINT
            LDA   P2_plrCOURSE
            STA   plrCOURSE
            LDA   P2_plrCOURSE+2
            STA   plrCOURSE+1
            LDA   coursePTR4
            STA   $44
            LDA   coursePTR4+1
            STA   $44+1
            LDA   coursePTR2
            STA   $83
            LDA   coursePTR2+2
            STA   $83+1
            RTS

*-----------------------------------
* SAVE PLAYER DATA (PLAYER DIES)
*-----------------------------------

savePLAYERDATA
            LDA   curPLAYER
            BEQ   L3535
            LDA   plrPOINT		; save data for player 2
            STA   P2_point
            LDA   plrSCORE
            STA   P2_score
            LDA   plrSCORE+1
            STA   P2_score+2
            LDA   plrSCORE+2
            STA   P2_score+4
            LDA   plrTIME+1
            STA   P2_time+2
            LDA   plrTIME
            STA   P2_time
            LDA   nbLIVES
            STA   P2_nbLIVES
            LDA   basePOINT
            STA   P2_basePOINT
            LDA   courseTYPE
            STA   P2_courseTYPE
            LDA   plrCOURSE
            STA   P2_plrCOURSE
            LDA   plrCOURSE+1
            STA   P2_plrCOURSE+2
            LDA   $44
            STA   coursePTR4
            LDA   $44+1
            STA   coursePTR4+1
            LDA   $83
            STA   coursePTR2
            LDA   $83+1
            STA   coursePTR2+2
            RTS

L3535       LDA   plrPOINT		; save data for player 1
            STA   P1_point
            LDA   plrSCORE
            STA   P1_score
            LDA   plrSCORE+1
            STA   P1_score+2
            LDA   plrSCORE+2
            STA   P1_score+4
            LDA   plrTIME+1
            STA   P1_time+2
            LDA   plrTIME
            STA   P1_time
            LDA   nbLIVES
            STA   P1_nbLIVES
            LDA   basePOINT
            STA   P1_basePOINT
            LDA   courseTYPE
            STA   P1_courseTYPE
            LDA   plrCOURSE
            STA   P1_plrCOURSE
            LDA   plrCOURSE+1
            STA   P1_plrCOURSE+2
            LDA   $44
            STA   coursePTR3
            LDA   $44+1
            STA   coursePTR3+1
            LDA   $83
            STA   coursePTR1
            LDA   $83+1
            STA   coursePTR1+2
            RTS

L3583       LDX   #$03
L3585       LDA   LB42A,X
            BNE   L3590
L358A       DEX
            BPL   L3585
            JMP   L35A2

L3590       STX   $50
            LDA   LB42A,X
            TAX
            LDA   #$0B
            LDY   #$8F
            JSR   drawSPRITE3
            LDX   $50
            JMP   L358A

L35A2       LDX   #$03
L35A4       LDA   #$FF
            STA   LB37B,X
            STA   LB426,X
            DEX
            BPL   L35A4
            LDX   #$03
L35B1       LDA   LB387,X
            BNE   L35C7
L35B6       DEX
            BPL   L35B1
            LDX   #$03
L35BB       LDA   #$00
            STA   LB42A,X
            STA   LB387,X
            DEX
            BPL   L35BB
            RTS

L35C7       STX   $50
            LDA   LB387,X
            PHA
            LDY   LB38F,X
            LDA   LB38B,X
            TAX
            PLA
            JSR   drawSPRITE3
            LDX   $50
            JMP   L35B6

L35DD       LDY   #$03
L35DF       LDA   LB387,Y
            BNE   L35E8
L35E4       DEY
            BPL   L35DF
            RTS

L35E8       LDX   #$03
L35EA       LDA   LB051,X
            BNE   L35F5
L35EF       DEX
            BPL   L35EA
            JMP   L35E4

L35F5       STY   $18
            STX   $16
            LDA   LB38B,Y
            CLC
            ADC   #$03
            CMP   LB049,X
            BCC   L35EF
            LDA   LB049,X
            CLC
            ADC   #$02
            CMP   LB38B,Y
            BCC   L35EF
            LDA   LB38F,Y
            CLC
            ADC   #$04
            CMP   LB04D,X
            BCC   L35EF
            LDA   LB04D,X
            CLC
            ADC   #$06
            CMP   LB38F,Y
            BCC   L35EF
            LDA   #$01
            STA   LB059,X
            LDA   LB387,Y
            STA   $B0
            LDA   #$00
            STA   LB387,Y
            LDA   LB38B,Y
            TAX
            LDA   LB38F,Y
            TAY
            LDA   $B0
            JSR   drawSPRITE3
            LDY   $18
            LDA   LB38B,Y
            TAX
            LDA   LB38F,Y
            TAY
            LDA   #$0E
            JSR   drawSPRITE2
            LDY   $18
            LDA   LB38B,Y
            TAX
            LDA   LB38F,Y
            TAY
            LDA   #$0E
            JSR   drawSPRITE3
            LDX   $16
            LDY   $18
            JMP   L35E4

L3666       BIT   TXTPAGE1
            BIT   TXTSET
            LDX   slot16
            STA   $C089,X
            LDA   #$FF
            JSR   WAIT
            JSR   loadMOONBASEPIC
            LDX   slot16
            STA   $C088,X
            RTS

*-----------------------------------
* SHOW NUMBER OF VEHICLES
*-----------------------------------

showNBLIVES LDA   nbLIVES
            SEC
            SBC   #$01
            PHA
            LDA   #$25
            STA   charX
            LDA   #$0F
            STA   charY
            PLA
            JSR   printNUMBER
            RTS

*-----------------------------------
* 
*-----------------------------------

L3693       LDX   #$03
L3695       LDA   LB413,X
            BNE   L369E
L369A       DEX
            BPL   L3695
            RTS

L369E       STX   $50
            LDA   LB407,X
            SEC
            SBC   #$0E
            TAY
            LDA   LB40B,X
            BMI   L36C5
            LDA   LB3F7,X
            CLC
            ADC   #$1C
            BCS   L369A
            CLC
            ADC   LB421,Y
            BCS   L369A
            STA   $01
            LDA   $57
            CMP   $01
            BCC   L369A
            JMP   L36E0

L36C5       LDA   #$00
            STA   $03
            LDA   LB3F7,X
            SEC
            SBC   #$4D
            CLC
            ADC   LB421,Y
            BMI   L36E0
            STA   $00
            LDA   $57
            CMP   $00
            BCS   L36E0
            JMP   L369A

L36E0       LDA   $86,X
            BNE   L36F8
            LDA   LB407,X
            CMP   #$0E
            BEQ   L3701
            CMP   #$11
            BCS   L3701
            LDA   #$00	; 100
            LDX   #$01
            LDY   #$00
            JSR   addTOSCORE
L36F8       LDX   $50
            LDA   #$01
            STA   $86,X
            JMP   L369A

L3701       LDA   #$00	; 50
            LDX   #$00
            LDY   #$50
            JSR   addTOSCORE
            LDX   $50
            LDA   #$01
            STA   $86,X
            JMP   L369A

L3713       LDX   #$03
L3715       LDA   LB3DE,X
            BNE   L371E
L371A       DEX
            BPL   L3715
            RTS

L371E       STX   $50
            LDA   LB3EF,X
            BMI   L374D
            LDA   LB3E2,X
            CLC
            ADC   #$1C
            BCS   L371A
            CLC
            ADC   LB3D2,X
            BCS   L371A
            LDY   LB3D6,X
            CLC
            ADC   tblX7HGR,Y
            BCS   L371A
            CLC
            ADC   LB3DA,X
            BCS   L371A
            STA   $01
            LDA   $57
            CMP   $01
            BCC   L371A
            JMP   L3773

L374D       LDA   #$00
            STA   $03
            LDA   LB3E2,X
            SEC
            SBC   #$4D
            CLC
            ADC   LB3D2,X
            LDY   LB3D6,X
            CLC
            ADC   tblX7HGR,Y
            CLC
            ADC   LB3DA,X
            BMI   L3773
            STA   $00
            LDA   $57
            CMP   $00
            BCS   L3773
            JMP   L371A

L3773       LDA   $2A,X
            BNE   L3787
            LDA   LB3F3,X
            CMP   #$15
            BCS   L3790
            LDA   #$00	; 50
            LDX   #$00
            LDY   #$50
            JSR   addTOSCORE
L3787       LDX   $50
            LDA   #$01
            STA   $2A,X
            JMP   L371A

L3790       LDA   #$00	; 100
            LDX   #$01
            LDY   #$00
            JSR   addTOSCORE
            LDX   $50
            LDA   #$01
            STA   $2A,X
            JMP   L371A

L37A2       LDA   $BD
            BNE   L37A7
            RTS

L37A7       LDA   $D9
            LDX   $BE
            LDY   $BF
            JSR   drawSPRITE3
            LDA   $BD
            CMP   #$01
            BEQ   L37C2
            LDA   $D9
            LDX   $BE
            LDY   $BF
            JSR   drawSPRITE2
            DEC   $BD
            RTS

L37C2       LDA   #$00
            STA   $BD
            RTS

L37C7       LDA   $C0
            BNE   L37CC
            RTS

L37CC       LDA   $DA
            LDX   $C1
            LDY   $C2
            JSR   drawSPRITE3
            LDA   $C0
            CMP   #$01
            BEQ   L37E7
            LDA   $DA
            LDX   $C1
            LDY   $C2
            JSR   drawSPRITE2
            DEC   $C0
            RTS

L37E7       LDA   #$00
            STA   $C0
            RTS

L37EC       LDA   #$05
            STA   $BB
            LDA   $1C
            BMI   L37F8
            LDA   #$FF
            STA   $1C
L37F8       JSR   L2FCE
            LDA   #$03
            JSR   L26EC
            CLC
            ADC   #$10
            STA   $DA
            LDA   #$0A
            STA   $C0
            LDA   $B8
            CLC
            ADC   #$06
            STA   $C1
            LDA   $BA
            STA   $C2
            LDA   $DA
            JMP   L1074

L3819       LDA   #$01
            STA   $BB
            LDA   #$00
            STA   $DB
            LDA   #$3C
            STA   $BC
            LDA   #$02
            STA   $B7
            STA   $B8
            LDA   #$8A
            STA   $B9
            STA   $BA
            LDA   #$18
            LDX   $B7
            LDY   $B9
            JSR   drawSPRITE
L383A       RTS

L383B       LDA   $BB
            BEQ   L383A
            CMP   #$02
            BEQ   L3846
            JMP   L386B

L3846       LDA   $B8
            CLC
            ADC   #$2D
            STA   $01
            LDA   $1A
            BEQ   L386B
            CLC
            ADC   #$05
            CMP   $B8
            BCC   L386B
            SEC
            SBC   #$0C
            CMP   $01
            BCS   L386B
            LDA   $1B
            CLC
            ADC   #$05
            CMP   $BA
            BCC   L386B
            JMP   L37EC

L386B       LDA   $59
            CLC
            ADC   #$1E
            CMP   $B8
            BCC   L3897
            LDA   $B8
            CLC
            ADC   #$0F
            CMP   $59
            BCC   L3897
            LDA   $5A
            CLC
            ADC   #$0E
            CMP   $BA
            BCC   L3897
            LDA   #$18
            LDX   $B8
            LDY   $BA
            JSR   undrawSPRITE
            LDA   #$00
            STA   $BB
            LDA   #$01
            STA   $70
L3897       RTS

L3898       LDA   $BB
            BNE   L389D
            RTS

L389D       LDA   #$18
            LDX   $B8
            LDY   $BA
            JSR   undrawSPRITE
            LDA   $BB
            CMP   #$05
            BEQ   L38B8
            LDA   #$18
            LDX   $B7
            LDY   $B9
            JSR   drawSPRITE
            JMP   L38BD

L38B8       LDA   #$00
            STA   $BB
            RTS

L38BD       LDA   $BB
            CMP   #$01
            BEQ   L38F3
            LDA   $B7
            STA   $B8
            LDA   $B9
            STA   $BA
            LDA   $B7
            CLC
            ADC   #$04
            BCC   L38D7
            LDA   #$05
            STA   $BB
            RTS

L38D7       STA   $B7
            LDA   $57
            CLC
            ADC   #$2C
            CMP   $B7
            BCS   L38F2
            LDA   $DB
            BNE   L38F2
            LDA   #$01
            STA   $DB
            LDA   #$01
            STA   $BB
            LDA   #$07
            STA   $BC
L38F2       RTS

L38F3       LDA   $B7
            STA   $B8
            LDA   $B9
            STA   $BA
            LDA   #$04
            JSR   L26EC
            CLC
            ADC   #$8D
            CLC
            ADC   #$01
            STA   $B9
            DEC   $BC
            BNE   L3910
            LDA   #$02
            STA   $BB
L3910       RTS

*-----------------------------------
*
*-----------------------------------

L3911       LDA   #$01
            STA   charWAIT
            LDA   nbPLAYERS	; how many players?
            BNE   L391E		; wto
            JMP   L39E9		; only one

L391E       LDA   curPLAYER	; which one died?
            BEQ   L3986
            LDX   #$07		; ..player 2
            LDY   #$4E
            JSR   printSTRING
            ASC   "                        @"
            LDX   #$07
            LDY   #$55
            JSR   printSTRING
            ASC   " END OF GAME PLAYER TWO @"
            LDX   #$07
            LDY   #$5C
            JSR   printSTRING
            ASC   "                        @"
            JMP   L3A28

L3986       LDX   #$07		; ..player 1
            LDY   #$4E
            JSR   $1C3C
            ASC   "                        @"
            LDX   #$07
            LDY   #$55
            JSR   printSTRING
            ASC   " END OF GAME PLAYER ONE @"
            LDX   #$07
            LDY   #$5C
            JSR   printSTRING
            ASC   "                        @"
            JMP   L3A28

L39E9       LDX   #$0D
            LDY   #$4E
            JSR   printSTRING
            ASC   "             @"
            LDX   #$0D
            LDY   #$55
            JSR   printSTRING
            ASC   " END OF GAME @"
            LDX   #$0D
            LDY   #$5C
            JSR   printSTRING
            ASC   "             @"

*--- The player may continue playing

L3A28       LDX   #<musicENDGAME
            LDA   #>musicENDGAME
            JSR   playMUSIC
            LDX   #$32
L3A31       LDA   #$A0
            JSR   WAIT
            DEX
            BPL   L3A31
            LDA   nbPLAYERS	; how many players?
            BEQ   L3A56
            LDA   P1_nbLIVES	; how many remaining lives?
            CLC
            ADC   P2_nbLIVES
            BEQ   L3A56

            LDA   #$01
            STA   $2E
            LDA   curPLAYER
            EOR   #$01
            STA   curPLAYER
            JMP   L2E9F

L3A56       LDA   #$BF	; clear lines 36-191
            STA   $00
L3A5A       LDX   $00
            LDA   tblHGRH,X
            STA   $26+1
            LDA   tblHGRL,X
            STA   $26
            LDY   #$27
            LDA   #$80
            CPX   #$46
            BCS   L3A70
            LDA   #$00
L3A70       STA   ($26),Y
            DEY
            BPL   L3A70
            DEC   $00
            LDA   $00
            CMP   #$23
            BNE   L3A5A

            LDA   #$01
            STA   charWAIT
            LDX   #$02
            LDY   #$55
            JSR   printSTRING
            ASC   "PRESS SPACE BAR TO CONTINUE GAME @"
            BIT   KBDSTROBE

            LDA   #$10		; 10 seconds
L3AB0       STA   $B0
            CLD
            LDA   #$23
            STA   charX
            LDA   #$55
            STA   charY
            LDA   $B0
            JSR   printNUMBER
            LDX   #$0F
L3AC2       LDA   #$A0
            JSR   WAIT
            DEX
            BPL   L3AC2
            LDA   KBD
            CMP   #" "
            BEQ   L3AF6
            LDA   BUTN0
            STA   $00
            EOR   $9E
            BPL   L3AE3
            LDA   $00
            BPL   L3AE3
            STA   $9E
            JMP   L3AF6

L3AE3       LDA   $00
            STA   $9E
            LDA   $B0
            SED
            SEC
            SBC   #$01
            BNE   L3AB0
            CLD
            JSR   L3666
            JMP   L2B02

L3AF6       LDA   #NB_LIVES	; player wants to continue...
            STA   P1_nbLIVES	; ...there are constraints!
            STA   P2_nbLIVES
            JSR   showNBLIVES
            LDA   #$00
            STA   $2E
            LDA   #$01
            STA   curPLAYER
            LDA   #$00
            STA   P1_score
            STA   P1_score+2
            STA   P1_score+4
            STA   P2_score
            STA   P2_score+2
            STA   P2_score+4
            STA   plrSCORE+2
            STA   plrSCORE+1
            STA   plrSCORE
            JSR   printPLAYERSCORE
            LDA   #$00
            STA   curPLAYER
            JSR   printPLAYERSCORE
            JMP   L2E9F

*-----------------------------------
* 
*-----------------------------------

L3B32       LDX   $28		; set ground data
            LDA   LB000,X
            STA   $00
            LDA   LB007,X
            STA   $00+1
            LDA   LB00E,X
            STA   $02
            LDA   LB015,X
            STA   $02+1
            LDA   LB01C,X
            STA   $04
            LDA   LB023,X
            STA   $04+1

            LDX   $29		; and prepare offline
            LDY   #$00
L3B56       LDA   ($00),Y
            EOR   #$7F
            AND   L45D0,X
            STA   LBB00,X	; offline buffer
            LDA   ($02),Y
            EOR   #$7F
            AND   L49D0,X
            STA   LBB28,X
            LDA   ($04),Y
            EOR   #$7F
            AND   L4DD0,X
            STA   LBB50,X
            INX
            CPX   #$28
            BNE   L3B7B

            LDX   #$00
L3B7B       INY
            CPY   #$28
            BNE   L3B56

            LDA   $67
            BEQ   L3B92

            LDY   #$00		; get first byte (b/c there are constraints)
            LDA   ($00),Y
            STA   $69
            LDA   ($02),Y
            STA   $6A
            LDA   ($04),Y
            STA   $6B

L3B92       LDA   $28
            SEC
            SBC   $AF
            BCS   L3BA6
            CLC
            ADC   #$07
            DEC   $29
            BPL   L3BA6
            PHA
            LDA   #$27
            STA   $29
            PLA
L3BA6       STA   $28
            LDA   $6F
            BEQ   L3BAF
            JMP   drawGROUNDLINES

L3BAF       LDX   $28		; set parms again
            LDA   LB000,X
            STA   $00
            LDA   LB007,X
            STA   $00+1
            LDA   LB00E,X
            STA   $02
            LDA   LB015,X
            STA   $02+1
            LDA   LB01C,X
            STA   $04
            LDA   LB023,X
            STA   $04+1

            LDX   $29		; and now draw the offline buffer
            LDY   #$00
L3BD3       LDA   ($00),Y
            ORA   LBB00,X
            STA   LBB00,X
            LDA   ($02),Y
            ORA   LBB28,X
            STA   LBB28,X
            LDA   ($04),Y
            ORA   LBB50,X
            STA   LBB50,X
            INX
            CPX   #$28
            BNE   L3BF2
            LDX   #$00
L3BF2       INY
            CPY   #$28
            BNE   L3BD3

            LDX   #$03
L3BF9       LDA   LB3DE,X
            BNE   L3C19
L3BFE       DEX
            BPL   L3BF9

            LDX   #$27		; restore the ground lines
L3C03       LDA   LBB00,X
            STA   L45D0,X
            LDA   LBB28,X
            STA   L49D0,X
            LDA   LBB50,X
            STA   L4DD0,X
            DEX
            BPL   L3C03
            RTS

L3C19       STX   $16
            LDA   LB3EF,X
            LDY   LB3E2,X
            CLC
            ADC   tblXBYTE,Y
            STA   $00
            LDA   tblXINDEX,Y
            LSR
            SEC
            SBC   #$01
            CLC
            ADC   LB3D2,X
            CMP   #$07
            BCC   L3C3B
            INC   $00
            SEC
            SBC   #$07
L3C3B       STA   $01
            LDA   $00
            CLC
            ADC   LB3D6,X
            STA   $02
            LDA   $01
            CLC
            ADC   LB3DA,X
            CMP   #$07
            BCC   L3C54
            INC   $02
            SEC
            SBC   #$07
L3C54       STA   $03
            LDA   $00
            STA   $09
            LDA   $01
            STA   $08
            LDY   $09
            LDX   $08
L3C62       CPY   #$28
            BCS   L3C81
            LDA   LBB00,Y
            AND   tblPX2UNLIT,X
            STA   LBB00,Y
            LDA   LBB28,Y
            AND   tblPX2UNLIT,X
            STA   LBB28,Y
            LDA   LBB50,Y
            AND   tblPX2UNLIT,X
            STA   LBB50,Y
L3C81       INX
            CPX   #$07
            BNE   L3C89
            LDX   #$00
            INY
L3C89       CPX   $03
            BNE   L3C62
            CPY   $02
            BNE   L3C62
            LDX   $16
            JMP   L3BFE

*-----------------------------------
* SPRITE - DRAW SPRITE
*-----------------------------------

drawSPRITE  STY   $3B
            STY   L3D04+1
            ASL
            TAY
            LDA   tblSPRITEPTR,Y
            STA   $3C
            LDA   tblSPRITEPTR+1,Y
            STA   $3C+1
            LDY   #$00
            LDA   ($3C),Y
            STA   $3E
            INY
            LDA   ($3C),Y
            CLC
            ADC   $3B
            STA   $3B
            LDY   tblXINDEX,X
            LDA   tblXBYTE,X
            CLC
            ADC   $39
            STA   L3CE7+1
            CLC
            ADC   $3E
            STA   $3E
            LDA   ($3C),Y
            STA   L3CE9+1
            INY
            LDA   ($3C),Y
            STA   L3CE9+2
            LDX   #$00
            LDY   $3B
L3CD5       LDA   tblHGRH,Y
            STA   L3CF7+2
            STA   L3CF4+2
            LDA   tblHGRL,Y
            STA   L3CF7+1
            STA   L3CF4+1
L3CE7       LDY   #$FF
L3CE9       LDA   $FFFF,X	; source
            CPY   #$00
            BMI   L3CFA
            CPY   #$28
            BCS   L3CFA
L3CF4       ORA   $FFFF,Y	; destination
L3CF7       STA   $FFFF,Y	; destination
L3CFA       INX
            INY
            CPY   $3E
            BNE   L3CE9
            DEC   $3B
            LDY   $3B
L3D04       CPY   #$FF
            BNE   L3CD5
            RTS

*-----------------------------------
* SPRITE - UNDRAW SPRITE
*-----------------------------------

undrawSPRITE		; undraws a sprite
            STY   $3B		; like the moon patrol vehicle
            STY   L3D79+1
            ASL
            TAY
            LDA   tblSPRITEPTR,Y
            STA   $3C
            LDA   tblSPRITEPTR+1,Y
            STA   $3C+1
            LDY   #$00
            LDA   ($3C),Y
            STA   $3E
            INY
            LDA   ($3C),Y
            CLC
            ADC   $3B
            STA   $3B
            LDY   tblXINDEX,X
            LDA   tblXBYTE,X
            CLC
            ADC   $39
            STA   L3D5A+1
            CLC
            ADC   $3E
            STA   $3E
            LDA   ($3C),Y
            STA   L3D5C+1
            INY
            LDA   ($3C),Y
            STA   L3D5C+2
            LDX   #$00
            LDY   $3B
L3D48       LDA   tblHGRH,Y
            STA   L3D6C+2
            STA   L3D61+2
            LDA   tblHGRL,Y
            STA   L3D6C+1
            STA   L3D61+1
L3D5A       LDY   #$FF
L3D5C       LDA   $FFFF,X	; source
            EOR   #$7F
L3D61       AND   $FFFF,Y	; destination mask
            CPY   #$00
            BMI   L3D6F
            CPY   #$28
            BCS   L3D6F
L3D6C       STA   $FFFF,Y	; destination write
L3D6F       INX
            INY
            CPY   $3E
            BNE   L3D5C
            DEC   $3B
            LDY   $3B
L3D79       CPY   #$FF
            BNE   L3D48
            RTS

*-----------------------------------
* SPRITE - DRAW SPRITE OVER PICTURE
*-----------------------------------

drawSPRITE2			; draws a sprite taking care of what is behind
            STY   $3B
            STY   L3DFF+1
            ASL
            ASL
            TAY
            LDA   L6500,Y
            STA   $3E
            LDA   L6501,Y
            CLC
            ADC   $3B
            STA   $3B
            LDA   tblXINDEX,X
            LSR
            STA   $06
            LDA   tblXBYTE,X
            CLC
            ADC   $39
            STA   L3DC7+1
            CLC
            ADC   $3E
            STA   $3E
            LDA   L6502,Y
            STA   L3DC9+1
            LDA   L6502+1,Y
            STA   L3DC9+2
            LDX   #$00
            LDY   $3B
L3DB7       LDA   tblHGRH,Y
            STA   $00+1
            LDA   tblHGRL,Y
            STA   $00
            LDA   #$00
            STA   $04
            STA   $05
L3DC7       LDY   #$FF
L3DC9       LDA   $FFFF,X	; sprite source
            CPY   #$00
            BMI   L3DF5
            CPY   #$28
            BCS   L3DF5
            STX   $B4
            ASL
            LDX   $06
L3DD9       DEX
            BEQ   L3DE2
            ASL
            ROL   $05
            JMP   L3DD9

L3DE2       LSR
            ORA   $04		; bit to keep
            ORA   #$80		; force bit 7
            ORA   ($00),Y	; destination
            STA   ($00),Y	; destination
            LDA   $05
            STA   $04
            LDA   #$00
            STA   $05
            LDX   $B4
L3DF5       INX
            INY
            CPY   $3E
            BNE   L3DC9
            DEC   $3B
            LDY   $3B
L3DFF       CPY   #$FF
            BNE   L3DB7
            RTS

*-----------------------------------
* SPRITE - BULLETS AND EXPLOSIONS
*-----------------------------------

drawSPRITE3			; draws/undraws small moving objects
            STY   $3B		; like bullets and explosions
            STY   L3E87+1
            ASL
            ASL
            TAY
            LDA   L6500,Y
            STA   $3E
            LDA   L6501,Y
            CLC
            ADC   $3B
            STA   $3B
            LDA   tblXINDEX,X
            LSR
            STA   $06
            LDA   tblXBYTE,X
            CLC
            ADC   $39
            STA   L3E4D+1
            CLC
            ADC   $3E
            STA   $3E
            LDA   L6502,Y
            STA   L3E4F+1
            LDA   L6502+1,Y
            STA   L3E4F+2
            LDX   #$00
            LDY   $3B
L3E3D       LDA   tblHGRH,Y
            STA   $00+1
            LDA   tblHGRL,Y
            STA   $00
            LDA   #$00
            STA   $04
            STA   $05
L3E4D       LDY   #$FF
L3E4F       LDA   $FFFF,X
            CPY   #$00
            BMI   L3E7D
            CPY   #$28
            BCS   L3E7D
            STX   $B4
            ASL
            LDX   $06
L3E5F       DEX
            BEQ   L3E68
            ASL
            ROL   $05
            JMP   L3E5F

L3E68       LSR
            ORA   $04	
            ORA   #$80		; force bit 7
            EOR   #$7F		; invert all
            AND   ($00),Y	; screen mask
            STA   ($00),Y	; screen destination
            LDA   $05
            STA   $04
            LDA   #$00
            STA   $05
            LDX   $B4
L3E7D       INX
            INY
            CPY   $3E
            BNE   L3E4F
            DEC   $3B
            LDY   $3B
L3E87       CPY   #$FF
            BNE   L3E3D
            RTS

*-----------------------------------
* SPRITE - DRAW LDA/STA A SPRITE
*-----------------------------------

putSPRITE			; draws big rock and big hole
            STY   $3B
            STY   L3EF6+1
            ASL
            TAY
            LDA   tblSPRITEPTR,Y
            STA   $3C
            LDA   tblSPRITEPTR+1,Y
            STA   $3C+1
            LDY   #$00
            LDA   ($3C),Y
            STA   $3E
            INY
            LDA   ($3C),Y
            CLC
            ADC   $3B
            STA   $3B
            LDY   tblXINDEX,X
            LDA   tblXBYTE,X
            CLC
            ADC   $33
            STA   L3ED7+1
            CLC
            ADC   $3E
            STA   $3E
            LDA   ($3C),Y
            STA   L3ED9+1
            INY
            LDA   ($3C),Y
            STA   L3ED9+2
            LDX   #$00
            LDY   $3B
L3ECB       LDA   tblHGRH,Y
            STA   L3EE4+2
            LDA   tblHGRL,Y
            STA   L3EE4+1
L3ED7       LDY   #$FF
L3ED9       LDA   $FFFF,X	; sprite source
            CPY   #$00
            BMI   L3EE7
            CPY   #$28
            BCS   L3EE7
L3EE4       STA   $FFFF,Y	; screen destination
L3EE7       INX
            BNE   L3EED
            INC   L3ED9+2
L3EED       INY
            CPY   $3E
            BNE   L3ED9
            DEC   $3B
            LDY   $3B
L3EF6       CPY   #$FF
            BNE   L3ECB
            RTS

            DB    $34
            DB    $2C
            DB    $30
            DB    $3A
            DB    $B9
	
*-----------------------------------
* Y-COORD WHERE TO DRAW THE MOUNTAINS
*-----------------------------------

tblYMOUNTAINS
            HEX   71706F6E6D6C6B6A6B6C6D6E6F707172	; length is $8D
            HEX   737271706F6E6D6C6B6C6D6C6B6A6968
            HEX   6766656465666564636465666768696A
            HEX   6B6C6D6C6D6E6F70717271706F6E6D6C
            HEX   6D6E6D6C6B6A69686766656463646566
            HEX   67686968676665666768696A6B6C6D6E
            HEX   6F70717273747574737271706F6E6D6C
            HEX   6B6C6D6E6F707172737475767778797A
            HEX   7B7C7C7B7A797877767574737271706F
            HEX   6F2020200F0044495243202020201000

            HEX   425546414420202011004231464C4147	; end of table
            HEX   202012004A554D50464C202013004752
            HEX   4156482020201400475241564C202020
            HEX   1500584E4F44524157201600414E4F44
            HEX   524157201700594E4F44524157201800
            HEX   42554C3245534E20190042554C325820

*-----------------------------------
* $4000
*-----------------------------------

            PUT   MOONTITLE.S

*-----------------------------------
* $6000
*-----------------------------------

	PUT   MOONDATA.S
	
*--- End of program