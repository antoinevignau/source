*
* Targui
*
* (c) 1990, Antoine Vignau
*

            mx    %11
            org   $a000
            lst   off

*----------------------------

KBD         =     $C000
CLR80VID    =     $C00C
KBDSTROBE   =     $C010
SPKR        =     $C030
TXTSET      =     $C051
TXTPAGE1    =     $C054
TXTPAGE2    =     $C055
WAIT        =     $FCA8

*----------------------------

LA000       LDA   #<LA268     ; text
            STA   LA149+1
            LDA   #>LA268
            STA   LA149+2
            JSR   LA025       ; animate
            LDA   KBD         ; store key
            STA   $00
            NOP
            STA   CLR80VID
            STA   TXTSET
            STA   TXTPAGE1
            STA   KBD
            RTS               ; and return

            db    $00
            db    $00
LA022       db    $FF
LA023       db    $FF
LA024       db    $FF

*--- Electric Duet player

LA025       LDA   #$00        ; music is at $4000
            STA   $1E
            LDA   #$40
            STA   $1F
            LDA   #$01
            STA   $09
            STA   $1D
            PHA
            PHA
            PHA
            BNE   LA04D
LA038       INY
            LDA   ($1E),Y
            STA   $09
            INY
            LDA   ($1E),Y
            STA   $1D
LA042       LDA   $1E
            CLC
            ADC   #$03
            STA   $1E
            BCC   LA04D
            INC   $1F
LA04D       LDY   #$00
            LDA   ($1E),Y
            CMP   #$01
            BEQ   LA038
            BCS   LA067
            PLA
            PLA
            PLA
LA05A       LDX   #$49
            INY
            LDA   ($1E),Y
            BNE   LA063
            LDX   #$C9
LA063       BIT   KBDSTROBE
            RTS

LA067       STA   $08
            JSR   LA05A
            STX   LA0B6
            STA   $06
            LDX   $09
LA073       LSR
            DEX
            BNE   LA073
            STA   LA0AE+1
            JSR   LA05A
            STX   LA0EE
            STA   $07
            LDX   $1D
LA084       LSR
            DEX
            BNE   LA084
            STA   LA0E6+1
            JSR   LA0F6       ; animate
            PLA
            TAY
            PLA
            TAX
            PLA
            BNE   LA098
LA095       BIT   SPKR
LA098       CMP   #$00
            BMI   LA09F
            NOP
            BPL   LA0A2
LA09F       BIT   SPKR
LA0A2       STA   $4E
            BIT   KBD
            BMI   LA063
            DEY
            BNE   LA0AE
            BEQ   LA0B4
LA0AE       CPY   #$36
            BEQ   LA0B6
            BNE   LA0B8
LA0B4       LDY   $06
LA0B6       EOR   #$40
LA0B8       BIT   $4E
            BVC   LA0C3
            BVS   LA0BE
LA0BE       BPL   LA0C9
            NOP
            BMI   LA0CC
LA0C3       NOP
            BMI   LA0C9
            NOP
            BPL   LA0CC
LA0C9       CMP   SPKR
LA0CC       DEC   $4F
            BNE   LA0E1
            DEC   $08
            BNE   LA0E1
            BVC   LA0D9
            BIT   SPKR
LA0D9       PHA
            TXA
            PHA
            TYA
            PHA
            JMP   LA042

LA0E1       DEX
            BNE   LA0E6
            BEQ   LA0EC
LA0E6       CPX   #$0C
            BEQ   LA0EE
            BNE   LA0F0
LA0EC       LDX   $07
LA0EE       EOR   #$80
LA0F0       BVS   LA095
            NOP
            BVC   LA098
            NOP

LA0F6       STA   LA022       ; store AXY
            STX   LA023
            STY   LA024
            JSR   LA114       ; scroll
            JSR   LA149       ; print
            LDA   #$26
            JSR   WAIT
            LDA   LA022       ; restore
            LDX   LA023
            LDY   LA024
            RTS

*--- Scroll left

LA114       LDX   #$00
LA116       LDA   LA198,X
            STA   $FE
            LDA   LA1A0,X
            STA   $FF
            LDY   #$01
LA122       STA   TXTPAGE2
            INY
            LDA   ($FE),Y
            DEY
            STA   ($FE),Y
            STA   TXTPAGE1
            INY
            LDA   ($FE),Y
            DEY
            STA   ($FE),Y
            INY
            CPY   #$27
            BNE   LA122
            INX
            CPX   #$08
            BNE   LA116
            RTS

*--- Print out char

LA13F       LDA   #<LA268
            STA   LA149+1
            LDA   #>LA268
            STA   LA149+2

LA149       LDA   $4175
            BEQ   LA13F
            SEC
            SBC   #$A0
            PHA
            INC   LA149+1
            LDA   LA149+1
            BNE   LA15D
            INC   LA149+2
LA15D       PLA               ; the char
            TAX
            LDA   LA1A8,X     ; ptr to sprite
            STA   $FC
            LDA   LA208,X
            STA   $FD
            LDX   #$00
LA16B       LDA   LA198,X
            STA   $FE
            LDA   LA1A0,X
            STA   $FF
            STA   TXTPAGE2
            JSR   LA187
            STA   TXTPAGE1
            JSR   LA187
            INX
            CPX   #$08
            BNE   LA16B
            RTS

LA187       LDY   #$00
            LDA   ($FC),Y
            LDY   #$26
            STA   ($FE),Y
            INC   $FC
            LDA   $FC
            BNE   LA197
            INC   $FD
LA197       RTS

LA198       hex   D0D0D0D0D0D0D0D0
LA1A0       hex   23272B2F33373B3F

*--- Pointer to font

LA1A8       hex   00102030405060708090A0B0C0D0E0F0
            hex   00102030405060708090A0B0C0D0E0F0
            hex   00102030405060708090A0B0C0D0E0F0
            hex   00102030405060708090A0B0C0D0E0F0
            hex   00102030405060708090A0B0C0D0E0F0
            hex   00102030405060708090A0B0C0D0E0F0

LA208       hex   AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
            hex   ABABABABABABABABABABABABABABABAB
            hex   ACACACACACACACACACACACACACACACAC
            hex   ADADADADADADADADADADADADADADADAD
            hex   AEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAE
            hex   AFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF

*--- My text

LA268       asc   "Salut, LoGo au clavier.    Voici, comme"
            asc   " promis, le jeu de reflexion dhgr que j"
            asc   "e vous avais promis: TARGUI.    Pour le"
            asc   "s instructions, appuyez sur "A2"I"A2", ou sur"
            asc   " une autre touche pour jouer.        To"
            asc   "ut le programme est realise en assemble"
            asc   "ur (merci Glen).     Critiques, deplomb"
            asc   "ages: appelez moi sur le 3614 RTEL2, ba"
            asc   "l: LOGO.        Qisses to: HackerForce "
            asc   "(mega demo), Deckard (Muryaden II, le p"
            asc   "lus beau), LO44 (tu veux la version 650"
            asc   "2 de Langue d'Ocs ?), et RJP (on se fai"
            asc   "t un Pip en assembleur ?), Max A Gaz po"
            asc   "ur la musique...               Decembre"
            asc   " 1990 -- Joyeux Noel --                "
            asc   "                                       "
            asc   "        "00

            ds    $11F

