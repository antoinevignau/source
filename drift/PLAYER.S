*
* Krue's music disk
*
* (c) 2011, Brutal Deluxe Software
*

            mx    %11
            lst   off

*
* $0800 : menu.txt
* $0c00 : prodos buffer
* $1000 : main program
* $2000 : hgr
* $4000 : hgr2
* $4000 : music info
* $6000 : icons
* $7000 : musics
*

*-----------------------------

PLAYER      LDA   #<ptrMUSIC   ;LADRES OF MUSIC DATAS
            STA   zpMUSIC
            LDA   #>ptrMUSIC   ;HADRES OF MUSIC DATAS
            STA   zpMUSIC+1

            LDA   #$01
            STA   $09
            STA   $1D

*-----------

PLAYER809   PHA
            PHA
            PHA
            BNE   H0A2B
H0A16       INY
            LDA   (zpMUSIC),Y
            STA   $09
            INY
            LDA   (zpMUSIC),Y
            STA   $1D

H0A20       LDA   zpMUSIC
            CLC
            ADC   #$03
            STA   zpMUSIC
            BCC   H0A2B
            INC   zpMUSIC+1

H0A2B       LDY   #$00
            LDA   (zpMUSIC),Y
            CMP   #$01
            BEQ   H0A16
            BCS   H0A45
            PLA
            PLA
            PLA
H0A38       LDX   #$49
            INY
            LDA   (zpMUSIC),Y
            BNE   H0A40
            LDX   #$C9
H0A40       RTS

H0A45       STA   $08
            JSR   H0A38
            STX   H0A94
            STA   $06
            LDX   $09
H0A51       LSR
            DEX
            BNE   H0A51
            STA   H0A8C+1
            JSR   H0A38
            STX   H0ACC
            STA   $07
            LDX   $1D
H0A62       LSR
            DEX
            BNE   H0A62
            STA   H0AC4+1

* JSR doWAIT

            PLA
            TAY
            PLA
            TAX
            PLA
            BNE   H0A76
H0A73       BIT   SPKR
H0A76       CMP   #$00
            BMI   H0A7D
            NOP
            BPL   H0A80
H0A7D       BIT   SPKR
H0A80       STA   $4E

* LDA KBD
            BIT   KBD
* BPL noKEY
            BMI   H0A41

*-----------

*noKEY LDA $4E
noKEY       DEY
            BNE   H0A8C
            BEQ   H0A92
H0A8C       CPY   #$00
            BEQ   H0A94
            BNE   H0A96
H0A92       LDY   $06
H0A94       EOR   #$40
H0A96       BIT   $4E
            BVC   H0AA1
            BVS   H0A9C
H0A9C       BPL   H0AA7
            NOP
            BMI   H0AAA
H0AA1       NOP
            BMI   H0AA7
            NOP
            BPL   H0AAA
H0AA7       CMP   SPKR
H0AAA       DEC   $4F
            BNE   H0ABF
            DEC   $08
            BNE   H0ABF
            BVC   H0AB7
            BIT   SPKR
H0AB7       PHA
            TXA
            PHA
            TYA
            PHA
            JMP   H0A20
H0ABF       DEX
            BNE   H0AC4
            BEQ   H0ACA
H0AC4       CPX   #$00
            BEQ   H0ACC
            BNE   H0ACE
H0ACA       LDX   $07
H0ACC       EOR   #$80
H0ACE       BVS   H0A73
            NOP
            BVC   H0A76
* NOP
* RTS

*-----------

H0A41       LDA   KBDSTRB

            AND   #$7F         ; Mask bit 7
            CMP   #chrESC
            BNE   noESC

            LDA   #1           ; force quit for player 2
            STA   fgQUIT
            RTS
noESC       CMP   #chrSPACE
            BNE   noSPACE

            JSR   switchHGR

noSPACE     =     *
            JMP   noKEY

*-----------------------------

*doWAIT STA BITS ;SAUVEGARDE
* STX BITS+1 ;DES COMPTEURS
* STY BITS+2 ;UTILISES
*
* LDA zpTEMPO
* BEQ doWAIT99
*
* ASL  ; *2
* ASL  ; *4
* JSR WAIT ; NOW WAIT
*
*doWAIT99 LDA BITS
* LDX BITS+1
* LDY BITS+2
* RTS
*
*BITS HEX FFFFFF

*-----------------------------

