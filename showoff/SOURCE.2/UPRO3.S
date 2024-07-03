;...............................................................
;
; FILE : UPRO3.S                        - protection -
;        -------
;...............................................................
*=============
*
* DATE:          MOD
*-------        -----
* 10/05/86 - STARTED PROJECT
* 10/16/86 - ADDED APPLE 3.5 GS CODE
* 10/21/86 - ADDED PARMS FOR HLSPRO
* 10/26/86 - CORRECTED FOR BUGS IN GS
*            ADDED 65C816 OPCODES
*
*=============

HLSCODE  START
         Using GlobalData


BNK0_ADDRESS   GEQU   $008000
CODE     GEQU  $000500
MAXLEN   EQU   $800
SIGBYT   EQU   $E6

MARK1    EQU   $D5
MARK2    EQU   $AA
MARK3    EQU   $96

*
* PARMETER OFFSETS
*
ID_OFF   EQU   0
;
HLSVOL   EQU   0                        ;Long address of signature string
HLSTRK   EQU   4                        ;Signature track
HLSID    EQU   5                        ;   "      sector
*
* TAG FIELD DEFINITION (HOW TO IDENTIFY THE SIGNATURE DISK)
*
SIGBLK   EQU   2                        ;Volume block
TAGOFF   EQU   5                        ;Offset to volume name

*
* APPLE-ZPG VARIABLES
*
ZPG      EQU   $E0
PARM     EQU   $E0
PARMH    EQU   $E1
B0_HNDL  EQU   $E2
BNK0     EQU   $E6
SLT      EQU   $EA
UNIT     EQU   $EB
MAXUNIT  EQU   $EC
*
* LIRON-ZPG VARIABLES
*
ADRL     EQU   $ED ;3
LATCH    EQU   $F0 ;2
MARK     EQU   $F2 ;2
BUFL     EQU   $F4 ;1
BUFH     EQU   $F5
LTEMP    EQU   $F6
COUNT    EQU   $F8
*
*
* LIRON-ZPG EQUATES
*
CURCYL   EQU   $0D
CURDRIVE EQU   $0F
DRIVE    EQU   $13
CYL      EQU   $14
SIDE     EQU   $16
CURNSECT EQU   $1A

ADDRSUM  EQU   $27
ADDRFMT  EQU   $28
ADDRSID  EQU   $29
ADDRSEC  EQU   $2A
ADDRTRK  EQU   $2B

CMDTAB   EQU   $4C
CMDPCOUNT EQU  $4D
CMDREMAIN EQU  $4E
BLKLO    EQU   $50
BLKMED   EQU   $51
BLKHI    EQU   $52
STATTAB  EQU   $56
STATBYTE EQU   $57

FORMERR  EQU   $5E
INTERLEAVE EQU $62
FORMSIDES EQU  $63

READADDR EQU   $72
READDATA EQU   $75
WRITEDATA EQU  $78
SEEK     EQU   $7B
FORMAT   EQU   $7E
WRITETRACK EQU $81
VERIFY   EQU   $84
VECTOR   EQU   $87

DATAMRK  EQU   $8E
SYNCFLD  EQU   $91
BITSLIP  EQU   $97
ADDRMRK  EQU   $9F
*
* IWM CHIP OFFSETS
*
PH0L     EQU   $0
PH0H     EQU   $1
PH1L     EQU   $2
PH1H     EQU   $3
PH2L     EQU   $4
PH2H     EQU   $5
PH3L     EQU   $6
PH3H     EQU   $7
MTRON    EQU   $8
MTROFF   EQU   $9
ENABL1   EQU   $A
ENABL2   EQU   $B
Q6L      EQU   $C
Q6H      EQU   $D
Q7L      EQU   $E
Q7H      EQU   $F

LIRIWM   EQU   $A00
APLIWM   EQU   $C0E0
*
* SMARTPORT-CONROL COMMANDS
*
EJECT    EQU   1                        ;LIRON 3.5 CONTROL CMDS
CALL     EQU   5
SETADR   EQU   6
UPLOAD   EQU   7
;
SETHOOK  EQU   5                        ;APPLE 3.5 (GS DRIVER)
REHOOK   EQU   6
SETMARK  EQU   7
REMARK   EQU   8
SETSIDE  EQU   9
SETINTR  EQU   10
NOCALL   EQU   $80
ALL_HOOKS EQU  0
RDAT_HOOK EQU  2
;
ST_STAT  EQU   0                        ;STATUS $03 OFFSETS
DISKIN   EQU   $10
ST_SIZ   EQU   1
ST_LEN   EQU   4
ST_NAM   EQU   5
ST_TYP   EQU   21
UNITYP   EQU   1
ST_SUB   EQU   22
UNISUB   EQU   $00
APLSUB   EQU   $C0
ST_VER   EQU   23
;
ST_ERR   EQU   1                        ;LIRON STATUS $05 OFF
ST_TRY   EQU   2
ST_A     EQU   3
ST_X     EQU   4
ST_Y     EQU   5
ST_P     EQU   6


         65816 ON
         LONGA ON
         LONGI ON
*******
*
* HLSOPEN - START OF CODE
*
*FORMAT:
*  ERROR = HLSOPEN( PROGRAM_ID_NUMBER);
*
*
*MEMORY MAP:
*
*  X + 0000:BLOCK BUFFER
*      0120:MY DIRECT PAGE(ZPG) BASE (ALL MY REFS ARE TO $E0 OR HIGHER)
*      0200: MY REAL ZPG
*      0220:THE BANK 0 PROTECTION CODE
*
ZPG_OFF  EQU   $200-ZPG
CODE_OFF EQU   $0220

LOCK     EQU   $8000
FIX      EQU   $4000
CROSS    EQU   $0010
SPCL     EQU   $0008
PGALGN   EQU   $0004
FIXADR   EQU   $0002
FIXBNK   EQU   $0001
*
HLSOPEN  ENTRY
         PHP
         PHD
         PHB
         PHK
         PLB
         REP   #$30
         LDA   ID_OFF+3+2+1+1+1,S      ;Get our ID
         STA   OUR_ID
         JSR   GET_MEM
         BCS   QUIT
         JSR   INSTALL
         LDA   #$0000                  ;No error
         CLC
QUIT     ENTRY
         PLB
         PLD
         ROL   CARRY                   ;PRESERVE THE CARRY
         PLP
         ROR   CARRY
         RTL
*
* GET_MEM - Allocate the necessary memory for the protection
*
GET_MEM  ANOP
;--------------------------------------
;        pushlong #0                    ; room for handle
;        pushlong #$220+ENDPRO-KLUDGE  ; Length of context routine
;        LDA   OUR_ID                  ; Our user ID
;        PHA
;        pushword #LOCK+FIX+CROSS+FIXBNK+FIXADR
;        pushlong #BNK0_ADDRESS-CODE_OFF
;        _NewHandle
;--------------------------------------
         PushLong >Hdl_Upro3            |adresse bank 0
         clc
;--
         PLA
         STA   TEMP
         PLA
         STA   TEMP+2
         BCC   GOTMEM
         LDA   #$34
         BRA   DONE
GOTMEM   ANOP
         JSR   GET_OUR_PG0
         LDA   TEMP
         LDY   TEMP+2
         STA   B0_HNDL
         STY   B0_HNDL+2
         LDA   [B0_HNDL]
         LDY   #$0000
         STA   <BNK0
         STY   <BNK0+2
DONE     RTS
*
GET_OUR_PG0    ANOP
         SEI
;--
         LDX   B0_HNDL                  ;We're still in the user's
         LDY   B0_HNDL+2                ; direct page so we must save
         LDA   TEMP                     ; his values
         STA   B0_HNDL
         LDA   TEMP+2
         STA   B0_HNDL+2
         lda   [B0_HNDL]                ;Get actual zero bank address
         STX   B0_HNDL
         STY   B0_HNDL+2                ;Restore the user's zpg values
         CLC
         ADC   #ZPG_OFF                 ;Beyond the buffer
         STA   OUR_PG0
         TCD
         RTS
*
* INSTALL - COPY THE EMULATION CODE TO BANK 0
*
INSTALL  ANOP
         LDX   #KLUDGE
         CLC
         LDA   <BNK0
         ADC   #CODE_OFF
         STA   PRO_ADR+1
         TAY
         LDA   #ENDPRO-KLUDGE
         MVN   KLUDGE,$0000             ;MOVE FROM OUR BANK, TO BANK 0
         RTS
*
CARRY    DC    I2' $0000'
OUR_ID   DC    I2' $0000'
OUR_PG0  DC    A2' $0000'
TEMP     DC    A4' $0000'
*

********
*
* HLSCLOSE - UNDO WHAT WE'VE DONE
*
HLSCLOSE ENTRY
         PHP
         PHD
         PHB
         REP   #$30                     ;LONG A'S & I'S
         PHK
         PLB
         LDA   OUR_PG0
         TCD
         JSR   FREE_MEM
         JMP   QUIT
*
* FREE_MEM - Release the memory used
*
FREE_MEM ANOP
;--
;        PEI   B0_HNDL+2
;        PEI   B0_HNDL
;        LDX   #$1002                   ;DisposeHandle
;        JSL   $E10000
;--
         RTS

*******
*
* HLSPRO - RETURN THE SPECIFIED TRACK/SIDE LENGTH
*
HLSPRO   ENTRY
         PHP
         PHD
         PHB
         REP   #$30                     ;LONG A'S & I'S
         PHK
         PLB
         TSC
         CLC
         ADC   #3+1+1+2+1               ;THE ADDRESS OF OUR PARAMETERS
         TAY
         LDA   OUR_PG0
         TCD
         STY   <PARM                    ; ON THE STACK
PRO_ADR  ENTRY
         JSL   BNK0_ADDRESS             ;CALL THE CODE IN BANK 0
         JMP   QUIT
;--------------------------------------
;    Code installe en bank zero
;--------------------------------------
*
KLUDGE   ENTRY
         OBJ   BNK0_ADDRESS             ;BUILT TO RUN IN BANK 0
         PHK
         PLB
         SEP   #$30
         LONGA OFF
         LONGI OFF
         LDY   #HLSTRK
         LDA   (<PARM),Y
         STA   A_REG                    ;Track
         TAX
         INY
         LDA   (<PARM),Y
         STA   X_REG                    ;Side
         JSR   GETCNT
         STA   Y_REG                    ;Sectors on track

         STZ   LST_ERR
         LDX   #7                       ;Start with slot 7 and run down
PROSLT   STX   SLT
         JSR   TSTSLT
         BCC   PASS
         LDX   SLT
         DEX
         BNE   PROSLT                   ;DON'T CHECK SLOT 0
         LDA   LST_ERR
         BNE   PASS
         LDA   #$33
PASS     RTL
LST_ERR  DS    1
*
* TSTDRV - TEST A SLOT FOR SMARTCARD
*
TSTSLT   anop
         JSR   GET_SMART                ;Is there a smartport ??
         BCS   FAIL
         LDA   #$00
         STA   UNIT
         JSR   STATUS
;--
         LDX   ST_BUF+0                 ;COUNT OF UNITS
         INX
         STX   MAXUNIT
         LDX   #$01                     ; TART WITH ONE
PRODRV   STX   UNIT
         STX   CT_UNIT
         STX   RB_UNIT                  ;Test one of the drives
         JSR   TSTDRV
         BCC   PASS1
         LDX   UNIT
         INX
         CPX   MAXUNIT
         BCC   PRODRV
PASS1    RTS
*
* TSTDRV - TEST A UNIT FOR SIG
*
TSTDRV   anop
         LDA   #$03
         JSR   STATUS
         LDA   ST_BUF+ST_STAT
         AND   #DISKIN                  ;DISK IN DRIVE ?
         BEQ   FAIL
         LDA   ST_BUF+ST_TYP            ;3.5 INCH DISK
         CMP   #UNITYP
         BNE   FAIL
         JSR   CHKHLS                   ;RIGHT DISK ?
         BCS   FAIL
         LDA   ST_BUF+ST_SUB            ; DRIVE ?
         CMP   #APLSUB                  ;Only supports apple 3.5
         BEQ   APLTST
         CMP   #UNISUB                  ; and liron
         BNE   FAIL
*
* LIRTST - TEST THE LIRON DRIVE
*  (UPLOAD THE CODE)
*
LIRTST   ANOP
         LDA   #SETADR
         LDX   #<SA_CMD                 ;SET THE ADDRESS TO UPLOAD TO
         LDY   #>SA_CMD
         JSR   CONTROL
         BCS   FAIL0
         LDA   #UPLOAD                  ;UPLOAD OUR TEST CODE
         LDX   #<LIRON
         LDY   #>LIRON
         JSR   CONTROL
         BCS   FAIL0
         LDA   #CALL                    ;CALL THE UPLOADED ROUTINE
         LDX   #<CA_CMD
         LDY   #>CA_CMD
         JSR   CONTROL
         BCS   FAIL0
         LDA   #$05                     ;LIRON CTRL CALL FOR GET REGS
         JSR   STATUS
         BCC   GETREGS
FAIL0    STA   LST_ERR
FAIL     SEC
         RTS
*
* APLTST - CHECK APPLE 3.5 DRIVE
*
APLTST   anop
         LDA   #SETHOOK
         LDX   #<SH_CMD                 ;PUT MY HOOK IN
         LDY   #>SH_CMD                 ;(HAR, HAR ME MATEYS)
         JSR   CONTROL
         BCS   FAIL0

         JSR   GETBLK
         JSR   RBLK

         LDA   #REHOOK
         LDX   #<RH_CMD
         LDY   #>RH_CMD
         JSR   CONTROL
         BCS   FAIL0
*
GETREGS  LDA   ST_BUF+ST_P
         PHA
         LDA   ST_BUF+ST_A
         LDX   ST_BUF+ST_X
         LDY   ST_BUF+ST_Y
         PLP
         SEP   #$30
         CLI
         BCS   FAIL0
         RTS
*
* CHKHLS - MAKE SURE DISK WAS MADE BY HLS
*  (ie. Our volume name or whatever is in the right block)
*
CHKHLS   anop
         REP   #$20
         LONGA ON
         LDA   [B0_HNDL]                ;Buffer address
         STA   BUFL
         STA   RB_BUF
         LDY   #HLSVOL                  ;VOLUME NAME OFFSET
         LDA   (PARM),Y
         SEC
         SBC   #TAGOFF                  ;TAGOFF is the offset into the block
         STA   ADRL                     ; where we will find our string
         SEP   #$20
         LONGA OFF
         INY
         INY
         LDA   (PARM),Y                 ;Get the bank byte
         SBC   #^TAGOFF
         STA   ADRL+2
;
         LDX   #<SIGBLK                 ;Read the signature block
         LDY   #>SIGBLK                 ; (USUALLY THE VOLUME NAME)
         JSR   RBLK
         BCS   FAIL1
         LDY   #TAGOFF-1
CMPVOL   INY
         LDA   [<ADRL],Y                 ;Is it our disk ??
         BEQ   VOLOK
         CMP   (BUFL),Y
         BEQ   CMPVOL
FAIL1    SEC
         RTS
VOLOK    CLC
         RTS
*
* GETBLK - CALCULATE BLOCK # OF TRK/SIDE
*
GETBLK   anop
         LDA   #$00
         STA   LTEMP+1
         LDX   A_REG
         LDY   Y_REG
         BEQ   SIDE0                    ;If on 2nd side add sector count
         JSR   GETCNT
SIDE0    STA   LTEMP                    ;Reached our track ?
GETRK    DEX
         BMI   GOTRK
         JSR   GETCNT                   ;No, get the sector count for
         ASL   A                        ; this track (*2 for both sides)
         ADC   LTEMP                    ; and add it to the total
         STA   LTEMP
         BCC   GETRK
         INC   LTEMP+1
         BCS   GETRK
GOTRK    LDX   LTEMP
         LDY   LTEMP+1
         RTS
*
GETCNT   TXA
         LSR   A                        ;Find # of secs on track (A)
         LSR   A
         LSR   A
         LSR   A
         TAY
         LDA   CNTBL,Y
         RTS
CNTBL    dc    i1' 12,11,10,9,8 '
*
* MY_RDAT - MY REPLACEMENT FOR READDATA
* 
MY_RDAT  anop
         SEI
         PHD
         REP   #$20
         LDA   >OUR_PG0                 ;Zpg=Our Zpg
         TCD
         SEP   #$20
         LDA   >Y_REG
         STA   COUNT
         LDA   #<APLIWM+Q6L
         LDY   #>APLIWM+Q6L
         JSR   SETLAT
         PHB
         PHK
         PLB
         PHP
         STA   ST_BUF+ST_A
         STX   ST_BUF+ST_X
         STY   ST_BUF+ST_Y
         PLA
         STA   ST_BUF+ST_P
         PLB
         PLD
         CLC
         RTL

******
*
* STATUS - SMARTPORT STATUS CALL
*
STATUS   anop
;--
         STA   ST_COD
         LDA   UNIT
         STA   ST_UNIT
         LDA   #$00
         JSR   CALL_IT
ST_CMD   dc    H'03'
ST_UNIT  dc    H'01'
         DC    A2'ST_BUF'
ST_COD   dc    H'00'

ST_BUF   DS    28
*
* RBLK - Read a block
*
RBLK     anop
         STX   RB_BLK
         STY   RB_BLK+1
         LDA   #$01
         JSR   CALL_IT
RB_CMD   dc    H'03'
RB_UNIT  dc    H'01'
RB_BUF   DC    A2'$2000'
RB_BLK   DC    I4'$0000'
*
* CONTROL -
*
CONTROL  anop
         STA   CT_SUB
         STX   CT_BUF
         STY   CT_BUF+1
         LDA   #$04
         JSR   CALL_IT
CT_CMD   dc    H'03'
CT_UNIT  dc    H'01'
CT_BUF   DC    A2'CA_CMD'
CT_SUB   dc    H'00'
*
CA_CMD   DC    I2'0006'
A_REG    dc    H'00'
X_REG    dc    H'00'
Y_REG    dc    H'00'
P_REG    dc    H'34'
CA_ADR   DC    A'CODE'
*
SA_CMD   DC    I2'0002'
         DC    A'CODE'
*
SH_CMD   DC    I2'0004'
         dc    i1' NOCALL+RDAT_HOOK '
         DC    A4'MY_RDAT'
*
RH_CMD   DC    I2'0004'
         dc    i1' ALL_HOOKS '

*
CALL_IT  STA   DISPATCH+3
         REP   #$20
         PLA                            ;Pull the address of the parameters
         INC   A                        ; (Just after the call)
         STA   DISPATCH+4
         SEP   #$30
         JSL   DISPAT0
         RTS

EMULSTACK EQU $010100                   ;Bank $01/ Page $01
DISPAT0  PHD
         PHB                            ;Save the world
         PHP
         REP   #$30
         LONGA ON
         LONGI ON
         TSC
         TSX
         SEP   #$20
         LONGA OFF
         XBA                            ;Set the stack somewhere in
         DEC   A                        ; $01/$01xx like emulation will do
         BEQ   ALREADY_PG1              ; (unless it already is!!)
         LDA   #>$100
         XBA
         LDA   >EMULSTACK
         SEC
         SBC   #$10
         TCS                            ;Set 6502 SP
ALREADY_PG1    ANOP
         PEA   $0000
         PLD                            ;Direct page = $0000
         LDA   #>$00
         PHA
         PLB                            ;Data Bank = $00
         PHX                            ;Save native SP         
         SEC
         XCE                            ;6502 Emulation=ON
         65C02 ON
;
DISPATCH JSR   $FFFF
DIS_OFF  EQU   *-DISPAT0
         DC    H'00'
         DC    A2' ST_CMD'
;
         PHP
         CLC
         XCE                            ;Native 65816 mode
         65816 ON
         PLP
         TAY
         ROR   A
         REP   #$10                     ;(long x)
         LONGI ON
         PLX
         TXS
         PLP                            ;Status
         LONGI OFF
         PLB                            ;Data Bank
         PLD                            ;Direct Page Reg
         ROL   A                        ;Recover the carry/error
         TYA
         RTL                            ;PC & Program Bank
*
* GET_SMART - FIND THE SMARTCARD
*
GET_SMART anop
         TXA
         LDX   #<$E1C000
         ORA   #>$E1C000
         STX   <ADRL
         STA   <ADRL+1
         LDA   #^$E1C000
         STA   <ADRL+2
         LDX   #$03
CKSIG    LDY   SIGOFF,X
         LDA   SIGTBL,X
         CMP   [<ADRL],Y
         BNE   NOT_SMART
         DEX
         BPL   CKSIG
         LDY   #$FF                     ;CHECK LAST BYTE
         LDA   [<ADRL],Y
         BEQ   NOT_SMART
         CMP   #$FF
         BEQ   NOT_SMART
         ADC   ADRL
         LDX   ADRL+1
         ADC   #$03
         STA   DISPATCH+1               ;Set the dispatch address
         STX   DISPATCH+2
         CLC
         RTS
NOT_SMART SEC
         RTS
SIGOFF   dc    H' 01 03 05 07 FE FE '
SIGTBL   dc    H' 20 00 03 00 '

***********
*
* LIRON - The section of code that gets uploaded to the liron drive
*
LIRON    anop
         dc    i2'256'
         65C02 ON
PROCOD   anop
         STA   CYL
         STY   COUNT
         TXA
         ROR   A
         ROR   A
         AND   #$80
         STA   SIDE
         JSR   SEEK
         BCS   SKERR
         LDA   #$30
         STA   LTEMP
GETS0    DEC   LTEMP
         BEQ   SKERR1
         JSR   READADDR
         BCS   GETS0
         LDA   ADDRSID
         ROR   A
         ROR   A
         ROR   A
         AND   #$40
         ORA   ADDRTRK
         CMP   CYL
         BNE   SKERR1
         LDA   ADDRSEC
         BNE   GETS0
         LDA   #<LIRIWM+Q6L
         LDY   #>LIRIWM+Q6L
         BNE   SETLAT
SKERR    LDA   #$32
         dc    H'2C'
SKERR1   LDA   #$31
         dc    H'2C'
LFAIL    LDA   #$30
         SEC
         RTS
SETLAT   anop
CNTOFF   EQU   SETLAT-LIRON
         STA   LATCH
         STY   LATCH+1
         LDA   #$00
         STA   BUFL
         STA   BUFH
CNTADR   anop
         LDX   #<$0000-MAXLEN
         LDY   #>$0000-MAXLEN
         STY   LTEMP+1
TSL0     INX
         BNE   TSL1
         INC   LTEMP+1
         BEQ   LFAIL
TSL1     LDA   (LATCH)
         BPL   TSL1
TSL2     CMP   #MARK1
         BNE   TSL0
TSL3     LDA   (LATCH)
         BPL   TSL3
         CMP   #MARK2
         BNE   TSL2
TSL4     LDA   (LATCH)
         BPL   TSL4
         CMP   #MARK3
         BNE   TSL2
         CLC
         TXA
         ADC   #<MAXLEN+3+2
         TAX
         LDA   LTEMP+1
         ADC   #>MAXLEN+3+2
         TAY
         CLC
         TXA
         ADC   BUFL
         STA   BUFL
         TYA
         ADC   BUFH
         STA   BUFH
         DEC   COUNT
         BNE   CNTADR
         LDA   #$00
         LDX   BUFL
         LDY   BUFH
         CLC
         RTS

         OBJEND
*
* ENDPRO - END OF UNMODIFIED CODE
*
ENDPRO  anop

         END
