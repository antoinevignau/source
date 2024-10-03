*
* I'm fEDD up ;-)
*
* (c) 2012-2017, Brutal Deluxe Software
*

*----------------------------

dftSTART    =     $00
dftEND      =     $88         ; $22 to $27 ($9C)
dftSTEP     =     $04

maxEND      =     $9C         ; for 40-track

*----------

CSLT        =     $10
CDRV        =     $11
CTRK        =     $12

*----------------------------

            ds    \

initEDD     lda   POS         ; slot*16
            asl
            asl
            asl
            asl
            sta   CSLT

            lda   POD         ; drive
            sta   CDRV

            lda   #dftSTART   ; default
            sta   STARTTRK    ; start track

*---------- Get current phase

            lda   POS         ; 0..7
            asl               ; 0..14
            clc
            adc   POD         ; 1..16
            sec
            sbc   #1          ; 0..15
            tax
            lda   tblPHASE,x
            sta   CTRK
            rts

*--- All current phase of each slot/drive

tblPHASE    ds    16,-1       ; 8*2

*----------

resetEDD    lda   #dftSTART
            sta   STARTTRK
            lda   #dftEND
            sta   ENDTRK
resetSTEP   lda   #dftSTEP
            sta   STEP
            rts

*----------------------------

MTRON       ldx   CSLT
            lda   $c089,x
            txa
            clc
            adc   CDRV
            tax
            lda   $c089,x
            jsr   W3
            rts

*----------------------------

MTROFF      ldx   CSLT
            lda   $c088,x

            lda   POS         ; 0..7
            asl               ; 0..14
            clc
            adc   POD         ; 1..15 or 2..16
            sec
            sbc   #1          ; 0..14 or 1..15
            tax
            lda   CTRK
            sta   tblPHASE,x
            rts

*----------------------------

W1          lda   ARMWAITR
            beq   W1S
            ldx   ARMCVH
            ldy   ARMCVL
            jmp   WTIN
W1S         ldx   #$00
            ldy   #$DC
            jmp   WTIN

W2          ldx   #$04
            ldy   #$00
            jmp   WTIN

W3          ldx   #$20
            ldy   #$00
            jmp   WTIN

WTIN        lda   #2
            sta   WRKSPC
WL          lda   $c0ec
            dec   WRKSPC
            bne   WL
            dey
            cpy   #$ff
            bne   WTIN
            dex
            cpx   #$ff
            bne   WTIN
            rts

*----------

NTRKCALC    lda   STEP
            beq   NTD1
            lda   CTRK
            cmp   ENDTRK
            beq   NTD1
            bcs   NTDWN
            adc   STEP
            cmp   ENDTRK
            beq   NTD
            bcs   NTD1
            cmp   CTRK
            bcc   NTD1
NTD         clc
            rts
NTDWN       sbc   STEP
            cmp   CTRK
            bcs   NTD1
            cmp   ENDTRK
            bcc   NTD
NTD1        sec
            rts

*----------
* Other options moved to UP.OPTIONS

ARMWAITR    DS    1
ARMCVH      DS    1
ARMCVL      DS    1
WRKSPC      DS    1
WANTTRK     DS    1
WANTHALF    DS    1
PHSLST      DS    1

            ds    \

*----------

DCCDUMP     LDA   DCCSLOT
            ASL
            ASL
            ASL
            ASL
            TAX
            LDA   #>L4000
            STA   $00+1
            LDY   #<L4000
            STY   $00
LOOP1       LDA   $00+1
            CMP   #>E4000
            BEQ   DNDUMP
CHKRDY      LDA   $C081,X
            BPL   CHKRDY
            LDA   $C080,X
            STA   ($00),Y
            INY
            BNE   LOOP1
            INC   $00+1
            BNE   CHKRDY
DNDUMP      RTS

*----------------------------

DCC2NIB     LDA   #>L4000
            STA   $04+1
            STA   $06+1
            LDA   #>LB000-1
            STA   $08+1
            LDY   #<LB000
            STY   $00
            STY   $04
            STY   $06
            STY   $08
            LDA   #$F8
            STA   $02
LOOP3       LDX   #$08
            LDA   ($04),Y
            STA   $01
LOOP2       INC   $02
            ASL   $01
            ROL   $00
            BMI   STORE
            LDA   $02
            CMP   #$02
            BNE   LOOP4
STORE       LDA   $00
            STA   ($06),Y
            LDA   $02
            STA   ($08),Y
            STY   $00
            LDA   #$F8
            STA   $02
            INC   $06
            INC   $08
            BNE   LOOP4
            INC   $06+1
            DEC   $08+1
            LDA   $05
            CMP   $08+1
            BCS   DCL3
LOOP4       DEX
            BNE   LOOP2
            INC   $04
            BNE   LOOP3
            INC   $04+1
            LDA   $04+1
            CMP   $08+1
            BCC   LOOP3

DCL3        LDY   $06
            LDA   #$00
            STA   $06
            STA   $08
            JMP   DCL4

DCL2        STA   ($06),Y
            STA   ($08),Y
            INY
            BNE   DCL2
            DEC   $08+1
            INC   $06+1

DCL4        LDX   $06+1
            CPX   #>L7800
            BNE   DCL2

            LDA   #>LB000-1   ; sort data
            STA   $08+1
DCL1        LDA   ($06),Y
            TAX
            LDA   ($08),Y
            STA   ($06),Y
            TXA
            STA   ($08),Y
            INY
            BNE   DCL1
            INC   $06+1
            DEC   $08+1
            LDA   $06+1
            CMP   $08+1
            BCC   DCL1
            RTS

            ds    \

*----------------------------

TDUMPW      LDA   #>L4000     ; read from $4000 to $7FFF
            JSR   TDS1        ; not useful, but...

            LDA   #>L4000     ; read $4000-$77FF
            STA   $00+1       ;  set $7800-$AFFF
            lda   #<L4000
            sta   $00
            LDA   #>L7800     ;
            STA   $02+1       ; if high nibble, save $80
            LDA   #<L7800     ;      otherwise, save nibble
            STA   $02
            TAY
TCL1        LDA   ($00),Y     ; source nibble
            BPL   TCS1
            LDA   #$00        ; <128, store 0
TCL2        STA   ($02),Y
            INY
            BNE   TCL1
            INC   $00+1
            INC   $02+1
            LDA   $02+1
            CMP   #>LB000
            BNE   TCL1
            RTS

TCS1        ORA   #$80        ; force bit 7 of source
            STA   ($00),Y
            LDA   TIMEBITS    ; otherwise, store 1
            JMP   TCL2

*----------

*TDS LDA #$60
TDS1        STA   $00+1
            LDY   #<L4000
            STY   $00
            LDA   #$7F        ; MASK
            STA   $02
TDUMP       LDX   CSLT
TDR         NOP
            STA   $03         ; tempo ?
            NOP
TDL1        NOP
            LDA   $C08C,X
            BMI   TDS2
TDL2        LDA   $C08C,X
            BMI   TDS2
            LDA   $C08C,X
            BMI   TDS3
            LDA   $C08C,X
            BMI   TDS3
            LDA   $C08C,X
            BMI   TDS3
            LDA   $C08C,X
            BMI   TDS3
            BPL   TDL2
TDS2        STA   ($00),Y
            INY
            BNE   TDR
            INC   $00+1
            BPL   TDL1
            RTS

TDS3        AND   $02
            STA   ($00),Y
            INY
            BNE   TDL1
            INC   $00+1
            BPL   TDL2
            RTS

            ds    \

*----------------------------

ARMV        LDY   #$00
            BEQ   AMS1
ARMV2       LDY   #$01
AMS1        STY   ARMWAITR
            LDY   CTRK
            CPY   #$FF
            BNE   AM
            PHA
            LDA   #$00
            JSR   AM
            PLA
AM          STA   WANTTRK
            CMP   CTRK
            BEQ   ARMDONE1
            AND   #$FE
            STA   WANTHALF
            LDY   #$01
            STY   PHSLST
            LDA   CTRK
            AND   #$FE
            JSR   ARMDO1
AML1        LDA   CTRK
            CMP   WANTHALF
            BEQ   ARMQTR
            BCS   AMS2
            INC   CTRK
            INC   CTRK
            JMP   AMS3

AMS2        DEC   CTRK
            DEC   CTRK
AMS3        JSR   ARMDO
            JMP   AML1

ARMQTR      LDA   WANTTRK
            CMP   CTRK
            BEQ   ARMDONE
            STA   CTRK
            AND   #$07
            ORA   CSLT
            TAY
            CLC
            ADC   #$02
            AND   #$F7
            TAX
            LDA   $C080,Y
            LDA   $C080,X
            JSR   W1
ARMDONE     JSR   W2
            LDX   CSLT
            LDA   $C080,X
            LDA   $C082,X
            LDA   $C084,X
            LDA   $C086,X

ARMDONE1    rts

ARMDO1      STA   CTRK
ARMDO       LDA   CTRK
            AND   #$06
            ORA   CSLT
            TAX
            INX
            LDY   PHSLST
            STA   PHSLST
            LDA   $C080,Y
            LDA   $C080,X
            JSR   W1
            RTS

* ds \

