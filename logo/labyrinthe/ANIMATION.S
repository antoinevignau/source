*
* Animation dhgr monochrome
* 560*192 pour LABYRINTHE
*
* (k) LoGo, 12/91
*

            org   $1000
            lst   off

* animation    $1000
* picture      $4000
* sprite       $8000
* music        $9000

h06         =     $06
h08         =     $08
h0a         =     $0a
h0b         =     $0b
hec         =     $ec
dep         =     $fe

* Main program

            jsr   init
            jsr   present
            jsr   music
            sta   $c05f
            sta   $c056
            sta   $c054
            sta   $c053
            sta   $c051
            sta   $c00c
            sta   $c000
            jsr   $c300
            lda   #$15
            jsr   $fded
            jsr   $fb2f
            jsr   $fc58
            jsr   $bf00
            dfb   $65
            dw    quit
quit        dfb   $04
            hex   0100000000000000

* Dhgr mode on

init        lda   #$21
            sta   $c029
            lda   $c034
            and   #$f0
            ora   #$0f
            sta   $c034
            jsr   $c300
            jsr   $fc58

            sta   $c052       ; FORCE MONOCHROME 560*192
            sta   $c057
            sta   $c050
            sta   $c054
            LDX   #2          ; BARBARE, NON?
DCKD        sta   $c001
            STA   $C05D
            STA   $C00C
            STA   $C05E
            STA   $C05F
            sta   $c00d
            sta   $c05e
            DEX
            BNE   DCKD

            rts

* Dissolve effect

present     sta   $c000
            lda   #67
            sta   h0b
            ldy   #0
            sty   h0a
pres8       ldx   h0a
            cpx   h0b
            bcs   pres12
            lda   #$20
            stx   h06
            sta   h06+1
            lda   #$40
            stx   h08
            sta   h08+1
            lda   #$60
            stx   hec
            sta   hec+1
pres9       sta   $c005
            lda   (h08),Y
            sta   (h06),Y
            sta   $c004
            lda   (hec),Y
            sta   (h06),Y
            clc
            lda   h06
            adc   h0b
            sta   h06
            bcc   pres10
            inc   h06+1
pres10      clc
            lda   h08
            adc   h0b
            sta   h08
            sta   hec
            bcc   pres11
            inc   h08+1
            inc   hec+1
pres11      lda   h06+1
            cmp   #$40
            bcc   pres9
            inc   h0a
            bne   pres8
pres12      sta   $c001
            rts

* The music is...

music       LDA   #$00
            STA   $1E
            LDA   #$90
            STA   $1F
            LDA   #$01
            STA   $09
            STA   $1D
            PHA
            PHA
            PHA
            BNE   H0A2B
H0A16       INY
            LDA   ($1E),Y
            STA   $09
            INY
            LDA   ($1E),Y
            STA   $1D
H0A20       LDA   $1E
            CLC
            ADC   #$03
            STA   $1E
            BCC   H0A2B
            INC   $1F
H0A2B       LDY   #$00
            LDA   ($1E),Y
            CMP   #$01
            BEQ   H0A16
            BCS   H0A45
            PLA
            PLA
            PLA
            lda   #$00
            beq   music
H0A38       LDX   #$49
            INY
            LDA   ($1E),Y
            BNE   H0A41
            LDX   #$C9
H0A41       RTS
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

            jsr   vumetre
            jsr   logo

            PLA
            TAY
            PLA
            TAX
            PLA
            BNE   H0A76
H0A73       BIT   $c030
H0A76       CMP   #$00
            BMI   H0A7D
            NOP
            BPL   H0A80
H0A7D       BIT   $c030
H0A80       STA   $4E
            BIT   $c000
            bpl   nokey
            bit   $c010
            rts
nokey       dey
            BNE   H0A8C
            BEQ   H0A92
H0A8C       CPY   #$36
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
H0AA7       CMP   $c030
H0AAA       DEC   $4F
            BNE   H0ABF
            DEC   $08
            BNE   H0ABF
            BVC   H0AB7
            BIT   $c030
H0AB7       PHA
            TXA
            PHA
            TYA
            PHA
            JMP   H0A20
H0ABF       DEX
            BNE   H0AC4
            BEQ   H0ACA
H0AC4       CPX   #$0C
            BEQ   H0ACC
            BNE   H0ACE
H0ACA       LDX   $07
H0ACC       EOR   #$80
H0ACE       BVS   H0A73
            NOP
            BVC   H0A76
            rts

* Vu-metre dhgr

vumetre     lda   $06
            and   #$f0
            lsr
            lsr
            lsr
            beq   down6
            cmp   note6
            beq   anim7
            bcs   up6
down6       ldx   note6
            lda   vadrl,x
            clc
            adc   #$23
            sta   do6a+1
            lda   vadrh,x
            sta   do6a+2
            lda   #$ff
do6a        sta   $2000
            lda   note6
            beq   anim7
            dec   note6
            lda   #$00
            beq   anim7
up6         tay
            tax
]lp         lda   vadrl,x
            clc
            adc   #$23
            sta   do6b+1
            lda   vadrh,x
            sta   do6b+2
            lda   #$00
do6b        sta   $2000
            dex
            cpx   note6
            bpl   ]lp
            tya
            sta   note6

anim7       lda   $07
            and   #$f0
            lsr
            lsr
            lsr
            beq   down7
            cmp   note7
            beq   end7
            bcs   up7
down7       ldx   note7
            lda   vadrl,x
            clc
            adc   #$25
            sta   do7a+1
            lda   vadrh,x
            sta   do7a+2
            lda   #$ff
do7a        sta   $2000
            lda   note7
            beq   end7
            dec   note7
            lda   #$00
            beq   end7
up7         tay
            tax
]lp         lda   vadrl,x
            clc
            adc   #$25
            sta   do7b+1
            lda   vadrh,x
            sta   do7b+2
            lda   #$00
do7b        sta   $2000
            dex
            cpx   note7
            bpl   ]lp
            tya
            sta   note7
end7        rts

* Affiche les logos

logo        lda   #$f7
            beq   logo0
            inc   logo+1
            rts
logo0       lda   #$f7
            sta   logo+1
logo1       ldx   #00
            lda   lordre,x
            cmp   #$ff
            beq   logo2
            clc
            adc   #$80
            jsr   logo3
            inc   logo1+1
            rts
logo2       lda   #$00
            sta   logo1+1
            beq   logo1

logo3       sta   logo6+2
            lda   #$00
            sta   logo6+1

            ldx   #$00
logo4       lda   lignl,x
            sta   dep
            lda   lignh,x
            sta   dep+1
            ldy   #$1d
logo5       sta   $c055
            jsr   logo6
            sta   (dep),y
            sta   $c054
            jsr   logo6
            sta   (dep),y
            iny
            cpy   #$26
            bne   logo5
            inx
            cpx   #$0a
            bne   logo4
            rts

logo6       lda   $ffff
            inc   logo6+1
            bne   logo7
            inc   logo6+2
logo7       rts

* All datas needed

note6       ds    1
note7       ds    1

lordre      hex   00010203
            hex   000405
            hex   000607
            hex   000802
            hex   0009
            hex   000a0b0c02
            hex   ff

vadrl       hex   d0d0d0d0d0d0d0d05050505050505050
            hex   d0d0d0d0d0d0d0d05050505050505050
vadrh       hex   3f3b37332f2b27233f3b37332f2b2723
            hex   3e3a36322e2a26223e3a36322e2a2622

lignl       hex   80808080808080800000000000000000
lignh       hex   2024282c3034383c2125292D3135393D

