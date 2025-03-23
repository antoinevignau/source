*
* Animation dhgr monochrome
* 560*192 avec musique !!
*
* (k) LoGo, 12/91
*

            org   $1000
            lst   off

* animation    $1000
* picture      $4000
* sprite       $8000
* font         $8800
* music        $9000
* sprite2      $a000

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

            ldx   #$00
init0       lda   lignl,x
            sta   dep
            lda   lignh,x
            sta   dep+1
            lda   #$80
            ldy   #$27
init1       sta   $c055
            sta   (dep),y
            sta   $c054
            sta   (dep),y
            dey
            bpl   init1
            lda   #$30
            jsr   $fca8
            inx
            cpx   #$c0
            bne   init0
            rts

* Hackerforce presente...

present     lda   #$00
            jsr   pres1
            ldx   present+1
            lda   boucle,x
            tax
pres0       lda   #$00
            jsr   $fca8
            dex
            bpl   pres0
            inc   present+1
            lda   present+1
            cmp   #$07
            bne   present
            jsr   pres7
            rts
pres1       clc
            adc   #$80
            sta   pres5+2
            lda   #$00
            sta   pres5+1
            ldx   #$5b
pres2       lda   lignl,x
            sta   dep
            lda   lignh,x
            sta   dep+1
            ldy   #$0d
pres3       jsr   pres5
            sta   $c055
            sta   (dep),y
            sta   $c054
            cpy   #$19
            beq   pres4
            jsr   pres5
            sta   (dep),y
            iny
            bne   pres3
pres4       inx
            cpx   #$65
            bne   pres2
            rts
pres5       lda   $ffff
            inc   pres5+1
            bne   pres6
            inc   pres5+2
pres6       rts

* Dissolve effect

pres7       sta   $c000
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

            lda   #$07
            jsr   etoiles
            jsr   vumetre
            jsr   scroll
            jsr   logo
            lda   #$00
            jsr   etoiles

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
            lsr
            beq   down6
            cmp   note6
            beq   anim7
            bcs   up6
down6       ldx   note6
            lda   vadrl,x
            clc
            adc   #$06
            sta   do6a+1
            lda   vadrh,x
            sta   do6a+2
            lda   #$00
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
            adc   #$06
            sta   do6b+1
            lda   vadrh,x
            sta   do6b+2
            lda   #$ff
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
            lsr
            beq   down7
            cmp   note7
            beq   end7
            bcs   up7
down7       ldx   note7
            lda   vadrl,x
            clc
            adc   #$20
            sta   do7a+1
            lda   vadrh,x
            sta   do7a+2
            lda   #$00
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
            adc   #$20
            sta   do7b+1
            lda   vadrh,x
            sta   do7b+2
            lda   #$ff
do7b        sta   $2000
            dex
            cpx   note7
            bpl   ]lp
            tya
            sta   note7
end7        rts

* Scroll dhgr gauche

scr0        lda   #<mes
            sta   scroll+1
            lda   #>mes
            sta   scroll+2

scroll      hex   ad
            dw    mes
            beq   scr0
            sec
            sbc   #$a0
            asl
            tax
            lda   fadr,x
            sta   dep
            inx
            lda   fadr,x
            sta   dep+1

            inc   scroll+1
            bne   scr1
            inc   scroll+2

scr1        ldx   #$0a
scr2        sta   $c055
            lda   $3cd1,x
            sta   $3cd0,x
            lda   $2151,x
            sta   $2150,x
            lda   $2551,x
            sta   $2550,x
            lda   $2951,x
            sta   $2950,x
            lda   $2d51,x
            sta   $2d50,x
            lda   $3151,x
            sta   $3150,x
            lda   $3551,x
            sta   $3550,x
            lda   $3951,x
            sta   $3950,x
            sta   $c054
            lda   $3cd1,x
            sta   $3cd0,x
            lda   $2151,x
            sta   $2150,x
            lda   $2551,x
            sta   $2550,x
            lda   $2951,x
            sta   $2950,x
            lda   $2d51,x
            sta   $2d50,x
            lda   $3151,x
            sta   $3150,x
            lda   $3551,x
            sta   $3550,x
            lda   $3951,x
            sta   $3950,x
            inx
            cpx   #$1d
            bne   scr2

            sta   $c055
            ldy   #$00
            lda   (dep),y
            sta   $3ced
            ldy   #$02
            lda   (dep),y
            sta   $216d
            ldy   #$04
            lda   (dep),y
            sta   $256d
            ldy   #$06
            lda   (dep),y
            sta   $296d
            ldy   #$08
            lda   (dep),y
            sta   $2d6d
            ldy   #$0a
            lda   (dep),y
            sta   $316d
            ldy   #$0c
            lda   (dep),y
            sta   $356d
            ldy   #$0e
            lda   (dep),y
            sta   $396d

            sta   $c054
            ldy   #$01
            lda   (dep),y
            sta   $3ced
            ldy   #$03
            lda   (dep),y
            sta   $216d
            ldy   #$05
            lda   (dep),y
            sta   $256d
            ldy   #$07
            lda   (dep),y
            sta   $296d
            ldy   #$09
            lda   (dep),y
            sta   $2d6d
            ldy   #$0b
            lda   (dep),y
            sta   $316d
            ldy   #$0d
            lda   (dep),y
            sta   $356d
            ldy   #$0f
            lda   (dep),y
            sta   $396d
            rts

* Etoiles et toiles...

etoiles     sta   star3+1
starA       lda   #$fe
            beq   starB
            inc   starA+1
            rts
starB       lda   #$fe
            sta   starA+1
            ldy   #$09
star0       tya
            asl
            asl
            clc
            adc   #$03
            tax
            lda   lignl,x
            sta   dep
            lda   lignh,x
            sta   dep+1
            tya
            tax
            lda   stary,y
            clc
            adc   #10
            lsr
            tay
            bcc   star1
            iny
            sta   $c055
            jmp   star2
star1       sta   $c054
star2       lda   (dep),y
            cmp   #$07
            beq   star3
            cmp   #$00
            bne   star4
star3       lda   #$07
            sta   (dep),y
star4       sta   $c054
            txa
            tay
            dey
            bpl   star0
            lda   star3+1
            beq   star5
            rts

star5       ldy   #$09
star6       lda   stary,y
            clc
            adc   starp,y
            cmp   #60
            bcc   star7
            lda   #$00
star7       sta   stary,y
            dey
            bpl   star6
            lda   #$00
            sta   starA+1
            lda   #$07
            bne   etoiles

* Affiche les logos

logo        ldx   #00
            jsr   logo4
            lda   #70
            sec
            sbc   logo+1
            tax
            jsr   logo4
            lda   logo+1
            cmp   #36
            beq   logo1
            inc   logo+1
            rts
logo1       lda   logo5+1
            cmp   #$a0
            bne   logo2
            lda   #$ac
            bne   logo3
logo2       lda   #$a0
logo3       sta   logo5+1
            lda   #$00
            sta   logo+1
            rts

logo4       stx   coorx
            txa
            asl
            tax
            lda   ladr,x
            sta   logo7+1
            inx
            lda   ladr,x
            clc
logo5       adc   #$a0
            sta   logo7+2

            lda   coorx
            clc
            adc   #$3c
            tax
            lda   lignl,x
            sta   dep
            lda   lignh,x
            sta   dep+1

            ldy   #10
logo6       sta   $c055
            jsr   logo7
            sta   (dep),y
            sta   $c054
            jsr   logo7
            sta   (dep),y
            iny
            cpy   #30
            bne   logo6
            rts

logo7       lda   $ffff
            inc   logo7+1
            bne   logo8
            inc   logo7+2
logo8       rts

* All datas needed

note6       ds    1
note7       ds    1

coorx       ds    1

stary       hex   00000000000000000000
starp       hex   01020304050205070205

boucle      hex   010101010a0a01

mes         asc   "Salut Deckard !!   "
            asc   "Alors, comment trouves-tu cette animation ? "
            asc   "elle marche en dhgr 560*192 sur mon gs et //e"
            asc   "      "
            asc   "Peux-tu faire les modifications pour que cela "
            asc   "passe en monochrome sur ton //e couleur, sur le "
            asc   "gs pas possible, soit tout mono, soit tout couleur "
            asc   "      "
            asc   "Je trouve cette presentation tres belle !! "
            asc   "      "
            asc   "A bientot, Antoine... (c) 24 decembre 1991 "
            asc   "      "
            hex   00

ladr        =     *
]ladr       =     $00
            lup   71
            da    ]ladr
]ladr       =     ]ladr+$28
            --^

fadr        =     *
]fadr       =     $8800
            lup   96
            da    ]fadr
]fadr       =     ]fadr+$10
            --^

vadrl       hex   505050a8a8a8a8a8a8a8a82828282828
vadrh       hex   2824203f3b37332f2b27233f3b37332f

lignl       hex   00000000000000008080808080808080
            hex   00000000000000008080808080808080
            hex   00000000000000008080808080808080
            hex   00000000000000008080808080808080
            hex   2828282828282828A8A8A8A8A8A8A8A8
            hex   2828282828282828A8A8A8A8A8A8A8A8
            hex   2828282828282828A8A8A8A8A8A8A8A8
            hex   2828282828282828A8A8A8A8A8A8A8A8
            hex   5050505050505050D0D0D0D0D0D0D0D0
            hex   5050505050505050D0D0D0D0D0D0D0D0
            hex   5050505050505050D0D0D0D0D0D0D0D0
            hex   5050505050505050D0D0D0D0D0D0D0D0
lignh       hex   2024282C3034383C2024282C3034383C
            hex   2125292D3135393D2125292D3135393D
            hex   22262A2E32363A3E22262A2E32363A3E
            hex   23272B2F33373B3F23272B2F33373B3F
            hex   2024282C3034383C2024282C3034383C
            hex   2125292D3135393D2125292D3135393D
            hex   22262A2E32363A3E22262A2E32363A3E
            hex   23272B2F33373B3F23272B2F33373B3F
            hex   2024282C3034383C2024282C3034383C
            hex   2125292D3135393D2125292D3135393D
            hex   22262A2E32363A3E22262A2E32363A3E
            hex   23272B2F33373B3F23272B2F33373B3F

