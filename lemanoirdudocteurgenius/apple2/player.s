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
