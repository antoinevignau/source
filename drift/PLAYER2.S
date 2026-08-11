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

*-----------

L17B3       LDA   zp80,X
            CLC
            ADC   #$03
            STA   zp80,X
            BCC   L17BE
            INC   zp80+1,X
L17BE       RTS

*-----------

L17BF       LDA   zp80,X
            SEC
            SBC   #$03
            STA   zp80,X
            BCS   L17CA
            DEC   zp80+1,X
L17CA       RTS

*-----------

L1807       LDX   #$10
            LDA   #$00
L180B       ASL   zp8E
            ROL   zp8E+1
            ROL
            CMP   #$0A
            BCC   L1818
            SBC   #$0A
            INC   zp8E
L1818       DEX
            BNE   L180B
            RTS

*-----------

PLAYER2     =     *

            LDA   #<ptrMUSIC  ; Start of file
            STA   zp8A
            LDA   #>ptrMUSIC
            STA   zp8A+1

            LDA   zp8A        ; End of file
            CLC
            ADC   proREAD+6
            STA   zp8C
            LDA   zp8A+1
            ADC   proREAD+7
            STA   zp8C+1

            LDA   #0          ; Line number
            STA   zp90
            STA   zp90+1

*-----------

L1C79       LDA   zp90        ; Line number
            STA   zp8E
            LDA   zp90+1
            STA   zp8E+1

            INC   zp90        ; Next line
            BNE   L1C87
            INC   zp90+1

L1C87       LDY   #$03        ; Display it
L1C89       JSR   L1807
            EOR   #$B0
            STA   L0407,Y
            DEY
            BMI   L1C9A

            LDA   zp8E
            ORA   zp8E+1
            BNE   L1C89

*-----------

L1C9A       LDY   #$02        ; Get note data
L1C9C       LDA   (zp8A),Y
            STA   L1CD4,Y
            DEY
            BPL   L1C9C
            TAY
            BEQ   L1CD0

            JSR   L1D35       ; Play it...

            LDA   #<L1CD4
            STA   zpMUSIC
            LDA   #>L1CD4
            STA   zpMUSIC+1

            LDA   #$01        ; Again Sam...
            JSR   PLAYER809

*---

* BIT KBD
* BMI L1CD0

            LDA   fgQUIT      ; force quit for player 2
            BNE   L1CD0

*---

            LDA   zp8A
            CMP   zp8C
            BNE   L1CC8
            LDA   zp8A+1
            CMP   zp8C+1
            BEQ   L1CD0

L1CC8       LDX   #$0A        ; next $8A
            JSR   L17B3
            JMP   L1C79

L1CD0       BIT   KBDSTRB
            RTS

L1CD4       HEX   01070500

L0407       ASC   "1234"      ; my false screen ;-)

*-----------

L1D35       LDA   zp8A
            STA   zp8E
            LDA   zp8A+1
            STA   zp8E+1

            LDX   #$0E
L1D3F       LDY   #$00
            LDA   (zp8E),Y
            CMP   #$01
            BNE   L1D60
            INY
            LDA   (zp8E),Y
            STA   L1D73+1
            INY
            LDA   (zp8E),Y
            STA   L1D73+2

L1D53       LDA   #<L1D73
            STA   zpMUSIC
            LDA   #>L1D73
            STA   zpMUSIC+1

            LDA   #$01
            JMP   PLAYER809

L1D60       JSR   L17BF
            LDA   zp8E+1
            CMP   #$28        ; start music
            BCS   L1D3F

            LDA   #$01
            STA   L1D73+1
            STA   L1D73+2
            BNE   L1D53

L1D73       HEX   01070500

