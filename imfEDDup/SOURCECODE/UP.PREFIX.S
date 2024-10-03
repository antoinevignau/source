*
* I'm fEDD up ;-)
*
* (c) 2012, Brutal Deluxe Software
*

*---------------------------

* Buffer Addresses

Buff0        =     $0280
Buff1        =     $0281
FilStore     =     $4000
NameBuff     =     $5000
Rd_Buff      =     $5800
Op_Buff      =     $B000

MaxFiles     =     $F0            ; (Op_Buff-NameBuff)>>4

TypeLen      =     Rd_Buff        ;type and length info for file
FilType      =     Rd_Buff+$10
Access       =     Rd_Buff+$1E
DirInfo      =     Rd_Buff+$23

*

* File Name Storage Pointers

StoLo        =     $fe            ;lo byte
StoHi        =     $ff            ;hi byte ($17)

* ProDOS

LASTDEV      =     $BF30
NUMDEVS      =     $BF31
DEVLST       =     $BF32

* Firmware

WNDLFT       =     $20
WNDWDTH      =     $21
WNDTOP       =     $22
WNDBTM       =     $23

OurCH        =     $057B

*---------------------------

menuPREFIX   =     *

* ORG $001000
* MX %11
* CLD
* LDA RDROM2
* STZ SOFTEV
* LDA #$10
* STA SOFTEV+1
* JSR SETPWRC

             LDA   #$A0
             JSR   $C300

* LDX #$17
*L1016 STZ $BF58,X
* DEX
* BPL L1016
* INC MEMMAP2+$F
* LDA #$CF
* STA MEMMAP

* LDA #$02
* STA pfxSETMARK

             LDX   NUMDEVS
             STX   LstPntr
             LDA   LASTDEV
             BNE   L1042
DS2          LDX   LstPntr
             LDA   DEVLST,X
             CPX   #$01
             BCS   L103F
             LDX   NUMDEVS
             INX
L103F        DEX
             STX   LstPntr

L1042        STA   pfxONLINE+1
             JSR   PRODOS         ; online
             DB    $C5
             DA    pfxONLINE
             BCS   DS2

* STZ Level
             lda   #0
             sta   Level

             LDA   Buff1
             AND   #$0F
             BEQ   DS2
             ADC   #$02
             TAX

L1059        STX   Buff0
             LDA   #'/'
             STA   Buff1
             STA   Buff0,X

* STZ Buff1,X
             lda   #0
             sta   Buff1,x

             JSR   PRODOS         ; open
             DB    $C8
             DA    pfxOPEN
             BCC   L107F

             LDA   Level
             BEQ   DS2
             JSR   BELL1
             JSR   do_pop
             STX   Buff0
             JMP   KeyLoop

L107F        INC   Level
* STZ FileCount
             lda   #0
             sta   FileCount

             LDA   pfxOPEN+5
             STA   pfxREAD+1
             STA   pfxSETMARK+1
             LDA   #$2B           ; read length
             STA   pfxREAD+4
* STZ pfxREAD+5
             JSR   doRead
             BCS   L10B3

             LDX   #$03
L109A        LDA   DirInfo,X
             STA   EntLen,X
             DEX
             BPL   L109A
             STA   pfxREAD+4

             LDA   #$01
             STA   BlkFil
* STZ pfxSETMARK+3
* STZ pfxSETMARK+4
             lda   #0
             sta   pfxSETMARK+3
             sta   pfxSETMARK+4

             LDA   CountLo
             ORA   CountLo+1
             BNE   L10B5
*L10B3 BRA L1129
L10B3        JMP   L1129

L10B5        BIT   CountLo+1
             BMI   L10B3

L10B9        LDA   pfxSETMARK+3
             AND   #$FE
             STA   pfxSETMARK+3
             LDY   BlkFil
             LDA   #$00
             CPY   EntBlk
             BCC   L10CE
             TAY
             STY   BlkFil
             INC   pfxSETMARK+3
L10CC        INC   pfxSETMARK+3
L10CE        DEY
             CLC
             BMI   L10D8
             ADC   EntLen
             BCC   L10CE
             BCS   L10CC
L10D8        ADC   #$04
             STA   pfxSETMARK+2

             JSR   PRODOS         ; setmark
             DB    $CE
             DA    pfxSETMARK
             BCS   L10B3

             JSR   doRead
             BCS   L10B3
             INC   BlkFil

             LDA   TypeLen
             AND   #$F0
             BEQ   L10B9
             DEC   CountLo
             BNE   L10F8
             DEC   CountLo+1

L10F8        =     *
*L10F8 ROR Access
* BCC L10B5

L10FC        LDA   FilType
* CMP #$0F
* BEQ L1108
* CMP #$FF
* BNE L10B5
* BEQ L1108
*L10FD JMP L10B5

L1108        LDX   FileCount
             CPX   #MaxFiles
             BCS   L1129
             STA   FilStore,X
             JSR   NameCalc
             LDY   #$0F
L1115        LDA   TypeLen,Y
             STA   (StoLo),Y
             DEY
             BPL   L1115
             INY
             AND   #$0F
             STA   (StoLo),Y
             INC   FileCount
             BNE   L10B5
* BNE L10FD
L1126        JMP   DS2

*----------

L1129        JSR   PRODOS         ; close
             DB    $CC
             DA    pfxCLOSE
             BCS   L1126

             JSR   SETTXT
             JSR   HOME
             LDA   #$17
             JSR   TABV
             LDY   #$00
             LDA   #13
             JSR   SetHorz        ; print 'ESC...'

             JSR   HomeCursor
             LDX   #$00           ; print prefix
]lp          LDA   Buff1,X
             BEQ   L1153
             JSR   OutPut
             INX
             BNE   ]lp

*----------

*L1153 STZ ValCnt
* STZ TopName
L1153        lda   #0
             sta   ValCnt
             sta   TopName
             LDA   FileCount
             BEQ   KeyLoop
             CMP   #$15
             BCC   L1161
             LDA   #$14
L1161        STA   Counter

             LDA   #2             ; window size
             STA   WNDTOP
             STA   WNDLFT
             LDA   #22
             STA   WNDWDTH
             STA   WNDBTM

L116F        JSR   NamePrnt
             INC   ValCnt
             DEC   Counter
             BNE   L116F
* STZ ValCnt
             lda   #0
             sta   ValCnt
             BEQ   L11AA

L117C        JSR   NamePrnt
             LDX   ValCnt
             BEQ   L11AA
             DEC   ValCnt
             LDA   CV
             CMP   #2
             BNE   L11AA
             DEC   TopName
             LDA   #22
             BNE   L11A7

L1191        JSR   NamePrnt
             LDX   ValCnt
             INX
             CPX   FileCount
             BCS   L11AA
             STX   ValCnt
             LDA   CV
             CMP   #21
             BNE   L11AA
             INC   TopName
             LDA   #$17
L11A7        JSR   COUT
L11AA        JSR   SETINV
             JSR   NamePrnt

*----------

KeyLoop      LDA   KBD
             BPL   KeyLoop
             STA   KBDSTRB
             and   #maskLOWER     ; lowercase

             JSR   SETNORM

             LDX   FileCount
             BEQ   L11CB

             CMP   #$8D           ; Return
             BEQ   RunIt2
             CMP   #$8A           ; Down
             BEQ   L1191
             CMP   #$8B           ; Up
             BEQ   L117C

L11CB        CMP   #$89           ; Tab
             BEQ   NewVol

             cmp   #"A"           ; Accept
             beq   RunIt

             cmp   #$84           ; v2.2: Ctrl-Delete file
             beq   DeleteIt

             CMP   #$9B           ; Esc
             BNE   KeyLoop

             JSR   do_pop
             DEC   Level
             jmp   SelDir2        ; v2.2 - was BRA!

do_pop       LDX   Buff0
]lp          DEX
             LDA   Buff0,X
             CMP   #'/'
             BNE   ]lp
             CPX   #$01
             BNE   done
             LDX   Buff0
done         RTS

NewVol       JMP   DS2

SelDir       INX
SelDir2      JMP   L1059

*----------

RunIt        JSR   SETTXT
             JSR   HOME
             LDA   #$95
             JSR   COUT

doSetPfx     JSR   PRODOS         ; set prefix
             DB    $C6
             DA    pfxSETPFX
* BCS NewVol
             rts

*----------

RunIt2       =     *

* V2.2 - Run dir only...

             LDY   ValCnt
             LDA   FilStore,Y
             cmp   #$0f           ; directory
             beq   RunIt3         ; so, add the prefix
             jmp   KeyLoop        ; otherwise, loop

RunIt3       jsr   doSetPfx

             LDX   ValCnt
             JSR   NameCalc
             LDX   Buff0
]lp          INY
             LDA   (StoLo),Y
             INX
             STA   Buff0,X
             CPY   NameLen
             BCC   ]lp
             STX   Buff0

             jmp   SelDir

* LDY ValCnt
* LDA FilStore,Y
* cmp #$0f ; directory
* beq SelDir
* BPL SelDir

* JSR PRODOS
* DB $C8
* DA $12EC
* BCS NewVol
* LDA pfxOPEN+5
* STA pfxREAD+1
* LDA #$FF
* STA pfxREAD+4
* STA pfxREAD+5
* JSR doRead
* PHP
* JSR PRODOS
* DB $CC
* DA pfxCLOSE
* PLP
* BCS NewVol
* JMP $2000

*---------- v2.2 - Delete a file
*
* WARNING: we delete unlocked binary files only!
*

DeleteIt     =     *
             ldx   ValCnt
             lda   FilStore,x
             cmp   #$06           ; if a binary file
             beq   DeleteIt2      ; then, try to delete
             jmp   KeyLoop        ; otherwise, loop

DeleteIt2    jsr   NameCalc
             tay
]lp          lda   (StoLo),y
             sta   buffDESTROY,y
             dey
             bpl   ]lp

             jsr   PRODOS
             dfb   $c1
             da    pfxDESTROY

             LDX   Buff0
             jmp   SelDir2

*----------

SetHorz      STA   CH
MsgLoop      LDA   Msg1,Y
             BEQ   L1257
             JSR   COUT
             INY
             BNE   MsgLoop
L1257        RTS

*----------

NameCalc     =     *
* STZ StoLo+1
             lda   #0
             sta   StoLo+1
             TXA
             ASL
             ROL   StoLo+1
             ASL
             ROL   StoLo+1
             ASL
             ROL   StoLo+1
             ASL
             ROL   StoLo+1
             STA   StoLo
             LDA   #>NameBuff
             CLC
             ADC   StoLo+1
             STA   StoLo+1
             LDY   #$00
             LDA   (StoLo),Y
             STA   NameLen
             RTS

*----------

NamePrnt     =     *
             LDA   #$02
* lda #0
             STA   OurCH

             LDX   ValCnt
             TXA
             SEC
             SBC   TopName
* INC
* INC
             clc
             adc   #2
             JSR   TABV

* V2.2
             LDA   FilStore,X
             cmp   #$0F
             bne   L1299
* BMI L1299

* STZ OurCH
             lda   #0
             sta   OurCH
             LDA   INVFLG
             PHA
             LDY   #FldrMsg-Msg1
             JSR   MsgLoop
             PLA
             STA   INVFLG

L1299        JSR   spcOut
             JSR   NameCalc
L129F        INY
             LDA   (StoLo),Y
             JSR   OutPut
             CPY   NameLen
             BCC   L129F

spcOut       LDA   #" "
             BNE   myCout
HomeCursor   LDA   #$99
OutPut       ORA   #$80
myCout       JMP   COUT

*----------

doRead       JSR   PRODOS
             DB    $CA
             DA    pfxREAD
             RTS

Msg1         asc   "A/CCEPT  CTRL-D/ELETE  RET:DOWN  TAB:VOL  ESC:BACK"00

FldrMsg      HEX   0F1BD8D9180E00

pfxONLINE    DB    $02
             DB    $60
             DA    Buff1

pfxSETPFX    DB    $01
             DA    Buff0

pfxOPEN      DB    $03
             DA    Buff0
             DA    Op_Buff
             DB    $00

pfxREAD      DB    $04
             DB    $01
             DA    Rd_Buff
             DS    2
             DS    2

pfxCLOSE     DB    $01
             DB    $00

pfxSETMARK   DB    $02
             DB    $01
             DS    3

pfxDESTROY   dfb   $01
             da    buffDESTROY

buffDESTROY  ds    16

*----------

myKEY        ds    1

LstPntr      ds    2              ;= $65
ValCnt       ds    1              ;= $67
FileCount    ds    1              ;= $68
NameLen      ds    1              ;= $69
Counter      ds    1              ;= $6A
Level        ds    1              ;= $6B

EntLen       ds    1              ;= $6E
EntBlk       ds    1              ;= $6F
CountLo      ds    2              ;= $70
*BlkFlag ds 1 ;= $72
BlkFil       ds    1              ;$72

TopName      ds    1              ;= $73
*FilStore ds MaxFiles

* ds \

