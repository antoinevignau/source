*
* Battlezone
*
* (c) 1983, Atari
* (d) 2024, Antoine Vignau
*

            TYP   BIN
            ORG   $0800
	MX    %11
	LST   OFF

            USE   EQUATES.S

*-----------------------------------

            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00

L0810       LDA   #<L0810
            STA   SOFTEV
            LDA   #>L0810
            STA   SOFTEV+1
            JSR   SETPWRC
            LDA   #$00
            STA   fgINTROMUSIC
            LDX   #$61
L0824       STA   $80,X
            DEX
            BPL   L0824
            LDA   #$01
            STA   curLEVEL
            STA   fgSOUND
            LDA   #$FF
            STA   joyBTN
            STA   $EC
            STA   $ED
            STA   $AB
            STA   $AC
            STA   $A9
            STA   L6B27
            JSR   makePAGE2
            JSR   clearPAGE2
            JSR   checkJOYSTICK
            JSR   clearPAGE1
            JSR   initHIGHSCORE

*-----------------------

L084F       LDA   #$00
            STA   fgOFFLIMIT
            JSR   showTITLEPAGE
            JSR   L167A	; print text strings
            CMP   #" "
            BEQ   L087C	; go to options
            CMP   #$8D
            BEQ   L0885	; go to play game
            BNE   L086B

            DB    $02
            DB    $BB
            DB    $5A
            DB    $30
            DB    $5F
            DB    $EE
            DB    $3D
            DB    $A8

*-----------------------

L086B       LDA   #$FF
            STA   $E2
            JSR   L0970
            CMP   #" "
            BEQ   L087C
            CMP   #$8D
            BEQ   L0885
            BNE   L084F

L087C       JSR   L1775
            CMP   #" "
            BEQ   L0885
            BNE   L084F
L0885       LDA   #$00
            STA   $E2
            JSR   L0970
            JMP   L088F

L088F       JSR   printGAMEOVER
            JSR   verifyHIGHSCORE
            JSR   printHIGHSCORE
            JSR   L167A
            CMP   #" "
            BEQ   L087C
            CMP   #$8D
            BEQ   L0885
            JMP   L086B

L08A6       LDA   $9F
            LDY   $9D
            STY   $9F
            ASL
            STA   $9D
            LDA   $A0
            LDY   $9E
            STY   $A0
            ROL
            STA   $9E
            LDA   #$10
            STA   $A1
L08BC       ROL   $9F
            ROL   $A0
            SEC
            LDA   $9F
            SBC   $9B
            TAY
            LDA   $A0
            SBC   $9C
            BCC   L08D0
            STY   $9F
            STA   $A0
L08D0       ROL   $9D
            ROL   $9E
            DEC   $A1
            BNE   L08BC
            RTS

L08D9       LDA   $9D
            STA   $9F
            LDY   #$00
            STY   $9D
            LDA   $9E
            STY   $9E
            STA   $A0
            LDY   #$10
L08E9       ASL   $9D
            ROL   $9E
            ROL   $9B
            ROL   $9C
            BCC   L0906
            CLC
            LDA   $9F
            ADC   $9D
            STA   $9D
            LDA   $A0
            ADC   $9E
            STA   $9E
            LDA   #$00
            ADC   $9B
            STA   $9B
L0906       DEY
            BNE   L08E9
            RTS

L090A       LDA   $9C
            CMP   #$FF
            BNE   L0915
            LDA   $9B
            STA   $9D
            RTS

L0915       LDA   $9C
            STA   $9E
            LDY   #$00
            STY   $9C
            STY   $9D
            LDY   #$08
L0921       ASL   $9C
            ROL   $9D
            ROL   $9B
            BCC   L0936
            CLC
            LDA   $9E
            ADC   $9C
            STA   $9C
            LDA   #$00
            ADC   $9D
            STA   $9D
L0936       DEY
            BNE   L0921
            RTS

L093A       DB    $A0
L093B       DB    $B3
L093C       DB    $A0
L093D       DB    $A0

L093E       STA   L093A
            STX   L093B
L0944       LDA   L093B
            BPL   L094E
            LDA   #$00
            STA   L093B
L094E       STA   L093D
            LDA   L093A
            STA   L093C
            SEC
            SBC   #$F8
            STA   L093A
            LDA   L093B
            SBC   #$01
            STA   L093B
            BPL   L0944
            LDA   L093C
            LDX   L093D
            RTS

fgINTROMUSIC       DB    $00
L096F       DB    $00

*-----------------------
* GAME ENTRY POINT
*-----------------------

L0970       JSR   clearPAGE1
            JSR   L4A11
            LDA   MIXCLR
            JSR   L65CF
            JSR   printHIGHSCORE
            LDA   #$FF
            STA   $A9
            STA   L7FCC
            STA   L7FCD
            LDY   #$04
            LDA   curLEVEL	; which level?
            CMP   #$03
            BCC   L0992
            DEY
L0992       STY   nbLIVES_P1
            STY   nbLIVES_P2
            JSR   L67B7
            LDA   #$01
            STA   fgOFFLIMIT
            LDA   #$00
            STA   L7F77
            STA   L7F78
            STA   L7F79
            STA   L7F7A
            STA   L0B15
            STA   L0B16
            STA   $B6
            STA   $8F
            STA   $90
            STA   $91
            STA   L80C9
            STA   L80CA
            STA   L80C6
            STA   L80C7
            STA   $DF
            STA   L7143
            LDY   #$01
            LDA   L7D5F,Y
            STA   $D9
            LDA   #$F8
            STA   $AD
            LDA   #$01
            STA   $AE
            LDA   #$80
            STA   $D1
            LDA   #$00
            STA   $D0
            LDA   #$80
            STA   $D4
            LDA   #$00
            STA   $D3
            LDA   #$64
            STA   $A3
            LDA   #$78
            STA   $A4
            LDA   #$FF
            STA   curPLAYER
            STA   $A9
            JSR   L6F72
            LDA   #$00
            STA   L7F76
            STA   L71C4

L0A04       LDA   nbPLAYERS	; how many players?
            BNE   L0A0E		; more than one
            LDA   nbLIVES_P1	; get P1 lives
            JMP   L0A14
L0A0E       LDA   nbLIVES_P1	; are there lives
            ORA   nbLIVES_P2	; remaining?
L0A14       BNE   L0A17		; yes, jump
            RTS		; no

L0A17       LDA   #$FF
            STA   L7E53
            STA   L7E52
            STA   $EC
            STA   $ED
            STA   $A9
            STA   joyBTN
            LDA   $AB
            STA   $AC
            LDA   KBDSTROBE
            LDA   #$00
            STA   L6CDD
            STA   L6F9C
            JSR   L4F12
            JSR   L0B90
            INC   $B3
            LDA   curPLAYER
            AND   nbPLAYERS
            STA   curPLAYER
            TAX
            LDA   nbLIVES_P1,X
            BEQ   L0A04
            LDA   #$00
            STA   L6D5D
            STA   L6CCD
            STA   L6CBD
            STA   L69B2
            LDA   #$0F
            STA   L80C8
            JSR   L66A2
            LDA   $E2
            BEQ   L0A67
            JMP   L0AD8

L0A67       LDA   KBD
            CMP   #$91	; ctrl-q to end game
            BNE   L0A74
            LDA   KBDSTROBE
            JMP   L0970

L0A74       CMP   #$8F	; ctrl-o to restart game
            BNE   L0A80
            PLA
            PLA
            LDA   KBDSTROBE
            JMP   L087C

L0A80       JSR   L44B0
            JSR   L6851
            JSR   L69B3
            JSR   L59DA
            JSR   L4FC0
            JSR   L41B4
            JSR   L7B0D
            LDA   #$00
            STA   L54C6
            JSR   L71C6
            JSR   L7F7B
            LDA   #$05
            STA   L096F
L0AA5       JSR   L0B81
            JSR   L7000
            JSR   L745B
            JSR   L73BE
            JSR   L6DB1
            DEC   L096F
            BPL   L0AA5
            JSR   L41B4
            JSR   L71C6
            JSR   L0B17
            JSR   L4E65
            JSR   L54C7
            JMP   L0A67

L0ACB       LDX   curPLAYER
            LDA   nbLIVES_P1,X
            BNE   L0AD5
            JSR   L7EF7
L0AD5       JMP   L0A04

L0AD8       JSR   showTEXT4LINES
L0ADB       JSR   L44B0
            JSR   L0B30
            JSR   L59DA
            JSR   L4FC0
            LDA   #$05
            STA   L096F
L0AEC       JSR   L6DB1
            JSR   L7000
            JSR   L745B
            DEC   L096F
            BPL   L0AEC
            JSR   L0B17
            JSR   L71C6
            JSR   L7B0D
            JSR   L0B81
            JSR   L7F7B
            JSR   L69B3
            JSR   L4E65
            JSR   L54C7
            JMP   L0ADB

L0B15       DB    $00
L0B16       DB    $00

L0B17       JSR   L7E56
            JSR   L6E7C
            JSR   L6A07
            JSR   L7BB5
            JSR   L0B81
            JSR   L6A18
            JSR   L6B31
            JSR   L0B81
            RTS

L0B30       CLC
            LDA   #$01
            ADC   L0B15
            STA   L0B15
            LDA   #$00
            ADC   L0B16
            STA   L0B16
            LDA   L7F77
            ROL
            ROL
            BCC   L0B4C
            LDA   #$08
            BNE   L0B4E
L0B4C       LDA   #$04
L0B4E       STA   $A9
            JSR   L68E0
            LDA   L6A17
            BEQ   L0B5E
            LDA   #$00
            STA   joyBTN
            BEQ   L0B62
L0B5E       LDA   #$FF
            STA   joyBTN
L0B62       LDA   MIXSET
            LDA   KBD
            BPL   L0B80
            CMP   #$A0
            BNE   L0B75
            PLA
            PLA
            PLA
            PLA
            JMP   L087C

L0B75       CMP   #$8D
            BNE   L0B80
            PLA
            PLA
            PLA
            PLA
            JMP   L0885
L0B80       RTS

L0B81       LDA   L6D5D
            CMP   #$02
            BNE   L0B8F
            LDA   fgSOUND
            BEQ   L0B8F
            LDA   SPKR
L0B8F       RTS

L0B90       LDA   curPLAYER
            ASL
            TAX
            LDA   L7F77,X
            STA   $95
            LDA   #$00
            STA   L6D7F
L0B9E       LDA   L6D7F
            CMP   #$10
            BNE   L0BBB
            CLC
            LDA   $95
            ADC   $AF
            ADC   #$0C
            PHA
            LDA   #$00
            ADC   $B0
            TAX
            PLA
            JSR   L093E
            STA   $AF
            STX   $B0
            RTS

L0BBB       ASL
            ASL
            ASL
            ASL
            TAX
            CLC
            LDA   L6C6F,X
            ADC   $95
            STA   L6C6F,X
            CLC
            LDA   L6C72,X
            ADC   $95
            STA   L6C72,X
            INC   L6D7F
            JMP   L0B9E

L0BD8       DB    $00

            STX   L0CFF
            STY   L0CFE
            LDX   L0CFE
            LDY   L0CFF

L0BE5       STA   L0BD8
            STX   L0CFE
            STY   L0CFF
            LDA   tblXBIT,X
            ASL
            TAY
            INY
            CLC
            LDA   ptrSTRING
            ADC   (ptrSTRING),Y
            STA   $82
            DEY
            LDA   ptrSTRING+1
            ADC   (ptrSTRING),Y
            STA   $82+1
            LDY   #$00
            LDA   ($82),Y
            STA   L0CA7
            INY
            LDA   ($82),Y
            STA   L0CA6
            DEY
            CLC
            LDA   #$02
            ADC   $82
            STA   $82
            BCC   L0C1B
            INC   $82+1
L0C1B       LDY   L0CFE
            LDA   tblXBYT,Y
            STA   L0CFD
            LDY   L0CFF
            CLC
            ADC   tblHGRL,Y
            STA   $80
            LDA   L0CFD
            BPL   L0C36
            LDA   #$FF
            BNE   L0C38
L0C36       LDA   #$00
L0C38       ADC   tblHGRH,Y
            STA   $81
            CLC
            LDA   L0CA7
            TAY
            ADC   L0CFD
            TAX
            DEX
            DEY
L0C48       CPX   #$28
            BPL   L0C65
            CPX   #$01
            BMI   L0C65
            BEQ   L0C61
            TYA
            BNE   L0C61
            LDA   ($82),Y
            ORA   ($80),Y
            STA   ($80),Y
            DEX
            DEY
            BPL   L0C48
            BMI   L0C69
L0C61       LDA   ($82),Y
            STA   ($80),Y
L0C65       DEX
            DEY
            BPL   L0C48
L0C69       CLC
            LDA   L0CA7
            ADC   $82
            STA   $82
            BCC   L0C75
            INC   $82+1
L0C75       INC   L0CFF
            DEC   L0CA6
            BNE   L0C1B
            RTS

*-----------------------

clearPAGE1  LDA   #<HGR1
            STA   $80
            LDA   #>HGR1
            STA   $80+1
L0C86       LDY   #$00
            TYA
L0C89       STA   ($80),Y
            INY
            BNE   L0C89
            INC   $80+1
            LDA   $80+1
            CMP   #>HGR2
            BCC   L0C86
            RTS

L0C97       TXA
            CLC
            ADC   tblHGRL,Y
            STA   $80
            LDA   #$00
            ADC   tblHGRH,Y
            STA   $80+1
            RTS

*-----------------------

L0CA6       DB    $00
L0CA7       DB    $00
L0CA8       DB    $00
L0CA9       DB    $00

printSTRING STY   L0CA8
            STX   L0CA9
            STA   charCOLOR
            LDY   #$00
            LDA   (ptrSTRING),Y
            STA   L0CA6
            INY
            LDA   (ptrSTRING),Y
            STA   L0CA6+1
            CLC
            LDA   #$02
            ADC   ptrSTRING
            STA   ptrSTRING
            LDA   #$00
            ADC   ptrSTRING+1
            STA   ptrSTRING+1
L0CCC       LDX   L0CA8
            LDY   L0CA9
            JSR   L0C97
            LDY   L0CA7
            DEY
L0CD9       TYA
            EOR   $80
            JSR   L0D85
            AND   (ptrSTRING),Y
            STA   ($80),Y
            DEY
            BPL   L0CD9
            CLC
            LDA   L0CA7
            ADC   ptrSTRING
            STA   ptrSTRING
            LDA   #$00
            ADC   ptrSTRING+1
            STA   ptrSTRING+1
            INC   L0CA9
            DEC   L0CA6
            BNE   L0CCC
            RTS

*-----------------------

L0CFD       DB    $00
L0CFE       DB    $00
L0CFF       DB    $00

L0D00       STX   L0CFE
            STY   L0CFF
            LDA   tblXBIT,X
            ASL
            TAY
            INY
            CLC
            LDA   ptrSTRING
            ADC   (ptrSTRING),Y
            STA   $82
            DEY
            LDA   ptrSTRING+1
            ADC   (ptrSTRING),Y
            STA   $82+1
            LDY   #$00
            LDA   ($82),Y
            STA   L0CA7
            INY
            LDA   ($82),Y
            STA   L0CA6
            DEY
            CLC
            LDA   #$02
            ADC   $82
            STA   $82
            BCC   L0D33
            INC   $82+1
L0D33       LDY   L0CFE
            LDA   tblXBYT,Y
            STA   L0CFD
            LDY   L0CFF
            CLC
            ADC   tblHGRL,Y
            STA   $80
            LDA   L0CFD
            BPL   L0D4E
            LDA   #$FF
            BNE   L0D50
L0D4E       LDA   #$00
L0D50       ADC   tblHGRH,Y
            STA   $80+1
            CLC
            LDA   L0CA7
            TAY
            ADC   L0CFD
            TAX
            DEX
            DEY
L0D60       CPX   #$28
            BPL   L0D6C
            CPX   #$01
            BMI   L0D6C
            LDA   ($82),Y
            STA   ($80),Y
L0D6C       DEX
            DEY
            BPL   L0D60
            CLC
            LDA   L0CA7
            ADC   $82
            STA   $82
            BCC   L0D7C
            INC   $82+1
L0D7C       INC   L0CFF
            DEC   L0CA6
            BNE   L0D33
            RTS

L0D85       AND   #$01
            ORA   charCOLOR
            TAX
            LDA   L0D8E,X
            RTS

L0D8E       DB    $FF
            DB    $FF
            DB    $55
            DB    $2A
            DB    $2A
            DB    $55
            DB    $D5
            DB    $AA
            DB    $AA
            DB    $D5
            DB    $00
            DB    $00

*-----------------------

L0D9A       DB    $00
L0D9B       DB    $00

printSTRINGS
            LDY   #$00	; index
            STY   L0D9B
L0DA1       LDY   L0D9B	; get pointer
            LDA   (ptrSTRINGS),Y
            STA   ptrSTRING
            INY
            LDA   (ptrSTRINGS),Y
            STA   ptrSTRING+1
            ORA   ptrSTRING
            BEQ   L0DCB	; 0 means the end
            LDY   charX
            LDX   charY
            LDA   charCOLOR
            JSR   printSTRING
            INC   L0D9B	; next pointer
            INC   L0D9B
            CLC
            LDA   L0D9A
            ADC   charX
            STA   charX
            JMP   L0DA1
L0DCB       RTS

*-----------------------

showTITLEPAGE
            JSR   clearPAGE1
            STA   CLR80VID
            LDA   TXTCLR
            LDA   MIXCLR
            LDA   TXTPAGE1
            LDA   HIRES
	
* Show 1st string

            LDA   #<strATARISOFT
            STA   ptrSTRINGS
            LDA   #>strATARISOFT
            STA   ptrSTRINGS+1
            LDA   #$02	; X
            STA   charX
            LDA   #$02	; Y
            STA   charY
            STA   L0D9A
            LDA   #$04	; color?
            STA   charCOLOR
            JSR   printSTRINGS

* Show 2nd string

            LDA   #<strPRESENTS
            STA   ptrSTRINGS
            LDA   #>strPRESENTS
            STA   ptrSTRINGS+1
            LDA   #$02
            STA   L0D9A
            LDA   #$16
            STA   charX
            LDA   #$02
            STA   charY
            LDA   #$04
            STA   charCOLOR
            JSR   printSTRINGS

* Show BATTLEZONE and the TANK

            JSR   showTITLETANK

* Show 3rd string

            LDA   #<strCOPYRIGHT
            STA   ptrSTRINGS
            LDA   #>strCOPYRIGHT
            STA   ptrSTRINGS+1
            LDA   #$00
            STA   charX
            LDA   #$7F
            STA   charY
            LDA   #$02
            STA   L0D9A
            LDA   #$06
            STA   charCOLOR
            JSR   printSTRINGS

* Show 4th string

            LDA   #<strALLRIGHTS
            STA   ptrSTRINGS
            LDA   #>strALLRIGHTS
            STA   ptrSTRINGS+1
            LDA   #$00
            STA   charX
            LDA   #$93
            STA   charY
            LDA   #$02
            STA   L0D9A
            LDA   #$06
            STA   charCOLOR
            JSR   printSTRINGS
            RTS

*-----------------------

tblHGRL     HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   00000000000000008080808080808080
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   2828282828282828A8A8A8A8A8A8A8A8
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0
            HEX   5050505050505050D0D0D0D0D0D0D0D0

tblHGRH     HEX   2024282C3034383C2024282C3034383C
            HEX   2125292D3135393D2125292D3135393D
            HEX   22262A2E32363A3E22262A2E32363A3E
            HEX   23272B2F33373B3F23272B2F33373B3F
            HEX   2024282C3034383C2024282C3034383C
            HEX   2125292D3135393D2125292D3135393D
            HEX   22262A2E32363A3E22262A2E32363A3E
            HEX   23272B2F33373B3F23272B2F33373B3F
            HEX   2024282C3034383C2024282C3034383C
            HEX   2125292D3135393D2125292D3135393D
            HEX   22262A2E32363A3E22262A2E32363A3E
            HEX   23272B2F33373B3F23272B2F33373B3F

tblXBYT       HEX   F6F6F6F7F7F7F7F8F8F8F9F9F9F9FAFA
            HEX   FAFBFBFBFBFCFCFCFDFDFDFDFEFEFEFF
            HEX   FFFFFF00000001010101020202030303
            HEX   03040404050505050606060707070708
            HEX   0808090909090A0A0A0B0B0B0B0C0C0C
            HEX   0D0D0D0D0E0E0E0F0F0F0F1010101111
            HEX   11111212121313131314141415151515
            HEX   16161617171717181818191919191A1A
            HEX   1A1B1B1B1B1C1C1C1D1D1D1D1E1E1E1F
            HEX   1F1F1F20202021212121222222232323
            HEX   23242424252525252626262727272728
            HEX   2828292929292A2A2A2B2B2B2B2C2C2C
            HEX   2D2D2D2D2E2E2E2F2F2F2F3030303131
            HEX   31313232323333333334343435353535

tblXBIT       HEX   01030500020406010305000204060103
            HEX   05000204060103050002040601030500
            HEX   02040601030500020406010305000204
            HEX   06010305000204060103050002040601
            HEX   03050002040601030500020406010305
            HEX   00020406010305000204060103050002
            HEX   04060103050002040601030500020406
            HEX   01030500020406010305000204060103
            HEX   05000204060103050002040601030500
            HEX   02040601030500020406010305000204
            HEX   06010305000204060103050002040601
            HEX   03050002040601030500020406010305
            HEX   00020406010305000204060103050002
            HEX   04060103050002040601030500020406
            HEX   01030500020406010305000204060103
            HEX   0500

*-----------------------
* FONT
*-----------------------

L11A2       DB    $0C
            DB    $02
            DB    $83
            DB    $98
            DB    $83
            DB    $98
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $FF
            DB    $9F
            DB    $FF
            DB    $9F
            DB    $FF
            DB    $9F
            DB    $FF
            DB    $9F
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
L11BC       DB    $0C
            DB    $02
            DB    $FC
            DB    $87
            DB    $FC
            DB    $87
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $FC
            DB    $87
            DB    $FC
            DB    $87
L11D6       DB    $0C
            DB    $02
            DB    $FC
            DB    $87
            DB    $FF
            DB    $9F
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $FC
            DB    $87
            DB    $FC
            DB    $87
            DB    $80
            DB    $9E
            DB    $80
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $FF
            DB    $9F
            DB    $FC
            DB    $87
L11F0       DB    $0C
            DB    $02
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $FF
            DB    $9F
            DB    $FF
            DB    $9F
            DB    $FF
            DB    $9F
L120A       DB    $0C
            DB    $02
            DB    $FF
            DB    $9F
            DB    $FF
            DB    $9F
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $FF
            DB    $87
            DB    $FF
            DB    $87
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $FF
            DB    $9F
            DB    $FF
            DB    $9F
L1224       DB    $0C
            DB    $02
            DB    $FF
            DB    $9F
            DB    $FF
            DB    $9F
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $FF
            DB    $87
            DB    $FF
            DB    $87
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
L123E       DB    $0C
            DB    $02
            DB    $83
            DB    $8C
            DB    $83
            DB    $8C
            DB    $83
            DB    $8C
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $FC
            DB    $87
            DB    $FC
            DB    $87
            DB    $FC
            DB    $87
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
L1258       DB    $0C
            DB    $02
            DB    $F0
            DB    $81
            DB    $FC
            DB    $87
            DB    $FC
            DB    $9F
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $FC
            DB    $9F
            DB    $FC
            DB    $87
            DB    $F0
            DB    $81
L1272       DB    $0C
            DB    $02
            DB    $F0
            DB    $81
            DB    $FC
            DB    $87
            DB    $FC
            DB    $87
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $FC
            DB    $87
            DB    $FC
            DB    $87
            DB    $F0
            DB    $81
L128C       DB    $0C
            DB    $02
            DB    $F0
            DB    $81
            DB    $FC
            DB    $87
            DB    $FF
            DB    $9F
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $FF
            DB    $9F
            DB    $FF
            DB    $9F
            DB    $FF
            DB    $9F
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
L12A6       DB    $0C
            DB    $02
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $BF
            DB    $9E
            DB    $BF
            DB    $9E
            DB    $BF
            DB    $9E
            DB    $BF
            DB    $9E
            DB    $CF
            DB    $9F
            DB    $CF
            DB    $9F
            DB    $CF
            DB    $9F
            DB    $CF
            DB    $9F
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
L12C0       DB    $0C
            DB    $02
            DB    $FF
            DB    $81
            DB    $FF
            DB    $81
            DB    $CF
            DB    $87
            DB    $CF
            DB    $87
            DB    $CF
            DB    $87
            DB    $CF
            DB    $87
            DB    $CF
            DB    $87
            DB    $CF
            DB    $87
            DB    $CF
            DB    $87
            DB    $CF
            DB    $87
            DB    $FF
            DB    $81
            DB    $FF
            DB    $81
L12DA       DB    $0C
            DB    $02
            DB    $FF
            DB    $87
            DB    $FF
            DB    $87
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $FF
            DB    $87
            DB    $FF
            DB    $87
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $80
L12F4       DB    $0C
            DB    $02
            DB    $FF
            DB    $87
            DB    $FF
            DB    $87
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $FF
            DB    $87
            DB    $FF
            DB    $87
            DB    $FF
            DB    $81
            DB    $CF
            DB    $87
            DB    $CF
            DB    $87
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
L130E       DB    $0C
            DB    $02
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $FC
            DB    $87
            DB    $FC
            DB    $87
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
L1328       DB    $0C
            DB    $02
            DB    $F0
            DB    $81
            DB    $FC
            DB    $87
            DB    $FF
            DB    $9F
            DB    $8F
            DB    $98
            DB    $8F
            DB    $80
            DB    $CF
            DB    $9F
            DB    $CF
            DB    $9F
            DB    $8F
            DB    $98
            DB    $8F
            DB    $98
            DB    $FF
            DB    $9F
            DB    $FC
            DB    $8F
            DB    $F0
            DB    $81
L1342       DB    $0C
            DB    $02
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $FF
            DB    $9F
            DB    $FF
            DB    $9F
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
            DB    $8F
            DB    $9E
L135C       DB    $0C
            DB    $02
            DB    $FF
            DB    $9F
            DB    $FF
            DB    $9F
            DB    $FF
            DB    $9F
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $07
            DB    $02
            DB    $F0
            DB    $87
            DB    $8C
            DB    $98
            DB    $8C
            DB    $98
            DB    $8C
            DB    $98
            DB    $8C
            DB    $98
            DB    $8C
            DB    $98
            DB    $F0
            DB    $87
L1386       DB    $0C
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $07
            DB    $02
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00

strATARISOFT
            DA    L128C	; A
            DA    L135C	; T
            DA    L128C	; A
            DA    L12F4	; R
            DA    L11BC	; I
            DA    L11D6	; S
            DA    L1272	; O
            DA    L1224	; F
            DA    L135C	; T
            DA    L1386	; _
strPRESENTS
            DA    L12DA	; P
            DA    L12F4	; R
            DA    L120A	; E
            DA    L11D6	; S
            DA    L120A	; E
            DA    L12A6	; N
            DA    L135C	; T
            DA    L11D6	; S
            DA    L1386	; _
            DA    $0000
strCOPYRIGHT
            DA    L1258	; C
            DA    L1272	; O
            DA    L12DA	; P
            DA    L130E	; Y
            DA    L12F4	; R
            DA    L11BC	; I
            DA    L1328	; G
            DA    L1342	; H
            DA    L135C	; T
            DA    L1386	; _
            DA    L16E5	; 1
            DA    L1759	; 9
            DA    L173D	; 8
            DA    L171B	; 3
            DA    L1386	; _
            DA    L128C	; A
            DA    L135C	; T
            DA    L128C	; A
            DA    L12F4	; R
            DA    L11BC	; I
            DA    $0000
strALLRIGHTS
            DA    L128C	; A
            DA    L11F0	; L
            DA    L11F0	; L
            DA    L1386	; _
            DA    L12F4	; R
            DA    L11BC	; I
            DA    L1328	; G
            DA    L1342	; H
            DA    L135C	; T
            DA    L11D6	; S
            DA    L1386	; _
            DA    L12F4	; R
            DA    L120A	; E
            DA    L11D6	; S
            DA    L120A	; E
            DA    L12F4	; R
            DA    L123E	; V
            DA    L120A	; E
            DA    L12C0	; D
            DA    $0000
strGAMEOVER
            DA    L1328	; G
            DA    L128C	; A
            DA    L11A2	; M
            DA    L120A	; E
            DA    L1386	; _
            DA    L1272	; O
            DA    L123E	; V
            DA    L120A	; E
            DA    L12F4	; R
            DA    $0000

*-----------------------
		
showTITLETANK

* We output on HGR1

            LDA   #>tblHGRL
            STA   L518D+2
            STA   L5250+2
            STA   L52D1+2
            LDA   #<tblHGRL
            STA   L518D+1
            STA   L5250+1
            STA   L52D1+1
            LDA   #>tblHGRH
            STA   L5192+2
            STA   L5255+2
            STA   L52D6+2
            LDA   #<tblHGRH
            STA   L5255+1
            STA   L52D6+1
            STA   L5192+1

* Browse through the list

            LDY   #$00
            LDA   #<tblTITLELINES
            STA   $A0
            LDA   #>tblTITLELINES
            STA   $A0+1
L1474       LDY   #$00
            LDA   ($A0),Y
            CLC
            ADC   #$02
            STA   X1
            INY
            LDA   ($A0),Y
            CLC
            ADC   #$18
            STA   Y1
            INY
            LDA   ($A0),Y
            CLC
            ADC   #$02
            STA   X2
            INY
            LDA   ($A0),Y
            CLC
            ADC   #$18
            STA   Y2
            JSR   drawLINE
            CLC	; next data
            LDA   #$04
            ADC   $A0
            STA   $A0
            LDA   #$00
            TAY
            ADC   $A0+1
            STA   $A0+1
            LDA   ($A0),Y
            CMP   #$FF
            BNE   L1474	; loop

* We draw offscreen now

            LDA   #>tblPAGE2H
            STA   L5192+2
            STA   L5255+2
            STA   L52D6+2
            LDA   #<tblPAGE2H
            STA   L5255+1
            STA   L52D6+1
            STA   L5192+1
            LDA   #>tblPAGE2L
            STA   L518D+2
            STA   L5250+2
            STA   L52D1+2
            LDA   #<tblPAGE2L
            STA   L518D+1
            STA   L5250+1
            STA   L52D1+1
            RTS

            DB    $A0

*----------------------- BATTLEZONE ($14DA) & TANK ($15D6)
	
tblTITLELINES
* Battle Zone
            HEX   25002C00,2C003008,30082C10,2C103018
            HEX   30182C20,2C202520,25202500,28042C09
            HEX   2C082810,28102C18,2C18281C,281C2804
            HEX   30203700,37003F20,37143F21,37143021
            HEX   370E3711,3C005400,54005418,54185B20
            HEX   5B205020,50205108,50084D08,4D084D20
            HEX   4D204920,49204908,48084208,42084220
            HEX   42203F20,3F203F08,3F083C08,3C083C00
            HEX   5C006800,68006109,61096510,65106117
            HEX   61176820,68205C20,5C205C00,6C008500
            HEX   85008520,85206C20,6C207308,73086C00
            HEX   7A207A00,7A207418,74187A00,7D088208
            HEX   82088218,82187D18,7D187D08,89009308
            HEX   93089700,9700A300,A3009C09,9C09A010
            HEX   A0109C17,9C17A320,A3209720,97209700
            HEX   97208C18,8C188920,89208900
* T   X1ank
	HEX   4048503A,503A5C28,5C288C48,8C488556
	HEX   85564956,49564048,40488C48,503A783A
	HEX   6F338C33,8C338C2C,8C2C662C,FFFFFFFF

*-----------------------

waitFORKEY		; wait for a keypress
            TXA	; exit with FF if no keypress
            PHA	; or with the key value
L1608       PLA
            PHA
            TAX
L160B       LDA   #$78
            JSR   WAIT
            LDA   fgJOYSTICK
            BEQ   L1623
            LDA   BUTN0
            BPL   L1623
L161A       LDA   BUTN0
            BMI   L161A
            LDA   #" "
            BNE   L1630
L1623       LDA   KBD
            BMI   L1630
            DEX
            BNE   L160B
            DEY
            BNE   L1608
            LDA   #$FF	; no key
L1630       STA   $95
            LDA   KBDSTROBE
            PLA
            TAX
            LDA   $95
            RTS

*-----------------------

showTEXT4LINES
            LDA   KBDSTROBE	; clear the 4 lines of text
            LDX   #$27
            LDA   #$A0
L1641       STA   $0650,X
            STA   $06D0,X
            STA   $0750,X
            STA   $07D0,X
            DEX
            BPL   L1641

* Print Return to begin

            LDA   MIXSET	; and print the strings
            LDA   #<L16AA
            STA   ptrSTRINGS
            LDA   #>L16AA
            STA   ptrSTRINGS+1
            LDA   #$DB
            STA   $84
            LDA   #$06
            STA   $85
            JSR   L1B0A

* Print Space for options

            LDA   #<L16BB
            STA   ptrSTRINGS
            LDA   #>L16BB
            STA   ptrSTRINGS+1
            LDA   #$DB
            STA   $84
            LDA   #$07
            STA   $85
            JSR   L1B0A
            RTS

*-----------------------

L167A       JSR   showTEXT4LINES	; show strings
            LDA   fgINTROMUSIC	; do not play the intro music
            BNE   L1688
            JSR   playINTROMUSIC
            INC   fgINTROMUSIC	; ...twice
L1688       LDY   #$01
            LDX   #$FF
L168C       JSR   waitFORKEY
            CMP   #$8D
            BEQ   L16A9	; we wanna play
            CMP   #" "
            BEQ   L16A9	; or set options
            CMP   #$FF	; exit with no keypress
            BEQ   L16A9
            TXA	; other key... beep
            PHA
            TYA
            PHA
            JSR   BELL1
            PLA
            TAY
            PLA
            TAX
            JMP   L168C	; and loop
L16A9       RTS

L16AA       ASC   " RETURN TO BEGIN"00
L16BB       ASC   "SPACE FOR OPTIONS"00

*-----------------------

L16CD       DA    L16E3	; 0
            DA    L16E5	; 1* (* means character used)
            DA    L1701	; 2
            DA    L171B	; 3*
            DA    L1735	; 4
            DA    L1737	; 5
            DA    L1739	; 6
            DA    L173B	; 7
            DA    L173D	; 8*
            DA    L1759	; 9*
            DA    L1386	; _

L16E3       DB    $0C
            DB    $02
L16E5       DB    $0C	; 1
            DB    $02
            DB    $C0
            DB    $81
            DB    $C0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $F0
            DB    $81
            DB    $C0
            DB    $81
            DB    $C0
            DB    $81
            DB    $C0
            DB    $81
            DB    $C0
            DB    $81
            DB    $F0
            DB    $87
            DB    $F0
            DB    $87
            DB    $F0
            DB    $87
            DB    $00
            DB    $00
L1701       DB    $0C	; 2
            DB    $02
            DB    $F0
            DB    $87
            DB    $F0
            DB    $87
            DB    $8C
            DB    $98
            DB    $80
            DB    $98
            DB    $F0
            DB    $87
            DB    $F0
            DB    $87
            DB    $8C
            DB    $80
            DB    $8C
            DB    $80
            DB    $8C
            DB    $80
            DB    $FC
            DB    $9F
            DB    $FC
            DB    $9F
            DB    $00
            DB    $00
L171B       DB    $0C	; 3
            DB    $02
            DB    $FC
            DB    $9F
            DB    $FC
            DB    $9F
            DB    $80
            DB    $9E
            DB    $80
            DB    $9E
            DB    $C0
            DB    $87
            DB    $C0
            DB    $87
            DB    $80
            DB    $9E
            DB    $80
            DB    $9E
            DB    $BC
            DB    $9E
            DB    $BC
            DB    $9E
            DB    $F0
            DB    $87
            DB    $F0
            DB    $87
L1735       DB    $0C	; 4
            DB    $02
L1737       DB    $0C	; 5
            DB    $02
L1739       DB    $0C	; 6
            DB    $02
L173B       DB    $0C	; 7
            DB    $02
L173D       DB    $0C	; 8
            DB    $02
            DB    $F0
            DB    $87
            DB    $F0
            DB    $87
            DB    $8C
            DB    $98
            DB    $8C
            DB    $98
            DB    $8C
            DB    $98
            DB    $F0
            DB    $87
            DB    $F0
            DB    $87
            DB    $8C
            DB    $98
            DB    $8C
            DB    $98
            DB    $8C
            DB    $98
            DB    $F0
            DB    $87
            DB    $F0
            DB    $87
            DB    $00
            DB    $00
L1759       DB    $0C	; 9
            DB    $02
            DB    $F0
            DB    $87
            DB    $F0
            DB    $87
            DB    $8C
            DB    $98
            DB    $8C
            DB    $98
            DB    $8C
            DB    $98
            DB    $F0
            DB    $9F
            DB    $F0
            DB    $9F
            DB    $80
            DB    $9E
            DB    $80
            DB    $9E
            DB    $80
            DB    $9E
            DB    $F0
            DB    $87
            DB    $F0
            DB    $87
            DB    $00
            DB    $00

*-----------------------

L1775       LDA   #$00
            STA   fgOFFLIMIT
            LDA   KBDSTROBE
            LDA   #$00
            STA   $84
            LDA   #$04
            STA   $84+1
            TAX
L1785       LDY   #$00
            LDA   #$A0
L1789       STA   ($84),Y
            DEY
            BNE   L1789
            INX
            STX   $84+1
            CPX   #$08
            BEQ   L1798
            JMP   L1785

L1798       LDA   TXTPAGE1
            LDA   TXTSET
            LDA   MIXCLR
L17A1       LDA   #$84
            STA   $84
            LDY   #$04
            LDA   #<L1AD2
            LDX   #>L1AD2
            JSR   L1B04
            LDA   #$91
            STA   $84
            LDY   #$04
            LDA   nbPLAYERS
            BEQ   L17BF
            LDA   #<L1ADB
            LDX   #>L1ADB
            JMP   L17C3
L17BF       LDA   #<L1AE4
            LDX   #>L1AE4

L17C3       JSR   L1B04
            LDA   #$9E
            STA   $84
            LDY   #$04
            LDA   #<L1AEF
            LDX   #>L1AEF
            JSR   L1B04
            LDX   #$01	; Player 1
            LDA   #$04
            STA   $84
            LDA   #$05
            STA   $85
            JSR   printSCOREPX
            LDX   #$02	; Player 2
            LDA   #$11
            STA   $84
            LDA   #$05
            STA   $85
            LDA   nbPLAYERS
            BEQ   L17F4
            JSR   printSCOREPX
            JMP   L17FD

L17F4       LDA   #<L1AE4
            LDX   #>L1AE4
            LDY   $85
            JSR   L1B04
L17FD       LDX   #$00	; High-score
            LDA   #$1E
            STA   $84
            LDA   #$05
            STA   $85
            JSR   printSCOREPX
            LDA   #$0A
            STA   $84
            LDY   #$06
            LDA   #<L19DD
            LDX   #>L19DD
            JSR   L1B04
            LDA   #$0B
            STA   $84
            LDY   #$07
            LDA   #<L19F1
            LDX   #>L19F1
            JSR   L1B04
            LDA   #$8B
            STA   $84
            LDY   #$07
            LDA   #<L1A01
            LDX   #>L1A01
            JSR   L1B04
            LDA   #$33
            STA   $84
            LDY   #$04
            LDA   #<L1A11
            LDX   #>L1A11
            JSR   L1B04
            LDA   #$B3
            STA   $84
            LDY   #$04
            LDA   #<L1A25
            LDX   #>L1A25
            JSR   L1B04
            LDA   #$33
            STA   $84
            LDY   #$05
            LDA   #<L1A39
            LDX   #>L1A39
            JSR   L1B04
            LDA   #$B3
            STA   $84
            LDY   #$05
            LDA   #<L1A4C
            LDX   #>L1A4C
            JSR   L1B04
            LDA   #$33
            STA   $84
            LDY   #$06
            LDA   #<L1A5E
            LDX   #>L1A5E
            JSR   L1B04
            LDA   #$AE
            STA   $84
            LDY   #$07
            LDA   #<L1A8D
            LDX   #>L1A8D
            JSR   L1B04
            CLC
            LDA   curLEVEL
            ADC   #$B0
            LDY   #$07
            STA   ($84),Y
            CLC
            LDA   nbPLAYERS
            ADC   #$B1
            LDY   #$1A
            STA   ($84),Y
            LDA   #$D6
            STA   $84
            LDY   #$04
            LDA   #<L1A6E
            LDX   #>L1A6E
            JSR   L1B04
            LDA   #$CF
            LDY   #$1A
            STA   ($84),Y
            LDX   fgSOUND
            BEQ   L18B2
            INY
            LDA   #$CE
            STA   ($84),Y
            LDA   #$A0
            JMP   L18B7

L18B2       LDA   #$C6
            INY
            STA   ($84),Y
L18B7       INY
            STA   ($84),Y
            LDA   #$DD
            STA   $84
            LDY   #$04
            LDA   fgJOYSTICK
            BEQ   L18CB
            LDA   #<L1AC0
            LDX   #>L1AC0
            BNE   L18CF
L18CB       LDA   #<L1AC9
            LDX   #>L1AC9
L18CF       JSR   L1B04
            LDA   #$5A
            STA   $84
            LDY   #$06
            LDA   #<L1AAA
            LDX   #>L1AAA
            JSR   L1B04
            JSR   L18F8
            LDA   fgOFFLIMIT
            BNE   L18E9
            JMP   L17A1

L18E9       LDA   $95
            LDX   TXTCLR
            LDX   MIXCLR
            LDX   TXTPAGE1
            LDX   KBDSTROBE
            RTS

L18F8       LDY   #$01
            LDX   #$FF
            JSR   waitFORKEY
            CMP   #$FF
            BEQ   L196F
            LDY   KBDSTROBE
            CMP   #"L"	; level
            BEQ   L192A
            CMP   #"1"	; 1 player
            BEQ   L1940
            CMP   #"2"	; 2 players
            BEQ   L1945
            CMP   #"R"	; redefine keys
            BEQ   L194A
            CMP   #"S"	; sound
            BEQ   L1951
            CMP   #" "	; start
            BEQ   L196F
            CMP   #"K"	; keyboard
            BEQ   L1958
            CMP   #"J"	; joystick
            BEQ   L195E
            JSR   BELL1
L1929       RTS

L192A       LDA   curLEVEL
            CMP   #$06
            BMI   L1934
            LDA   #$00
            STA   curLEVEL
L1934       INC   curLEVEL
            RTS

            DEC   curLEVEL
            BNE   L1929
            LDA   #$06
            STA   curLEVEL
            RTS

L1940       LDY   #$00
            STY   nbPLAYERS
            RTS

L1945       LDY   #$01
            STY   nbPLAYERS
            RTS

L194A       JSR   L1B85
            JSR   L1B16
            RTS

L1951       LDA   #$01
            EOR   fgSOUND
            STA   fgSOUND
            RTS

L1958       LDA   #$00
            STA   fgJOYSTICK
            RTS

L195E       JSR   checkJOYSTICK
            LDA   fgJOYSTICK
            BNE   L1969
            JMP   BELL1
L1969       LDA   #$01
            STA   fgJOYSTICK
            RTS

L196F       LDA   #$01
            STA   fgOFFLIMIT
            RTS

L1974       DA    $06E0
            DA    $06D6
            DA    $06EA
            DA    $0660
            DA    $0760
            DA    $076A
            DA    $07DA
L1982       ASC   "FIRE="00
L1988       ASC   "LEFT="00
L198E       ASC   "RIGHT="00
L1995       ASC   "FWD.="00
L199B       ASC   "REV.="00
L19A1       ASC   "PAUSE="00
L19A8       DA    L1982
            DA    L1988
            DA    L198E
            DA    L1995
            DA    L199B
            DA    L19A1
            DA    L19CE
L19B6       ASC   "-->"00
            ASC   "<--"00
            ASC   "SP."00
            ASC   "ESC"00
            ASC   "RET"00
            ASC   "..."00
L19CE       ASC   "ENTER KEY FOR "00
L19DD       ASC   " BATTLEZONE OPTIONS"00
L19F1       ASC   "K KEYBOARD MODE"00
L1A01       ASC   "J JOYSTICK MODE"00
L1A11       ASC   "1 ONE PLAYER OPTION"00
L1A25       ASC   "2 TWO PLAYER OPTION"00
L1A39       ASC   "L DIFFICULTY LEVEL"00
L1A4C       ASC   "S SOUND ON OR OFF"00
L1A5E       ASC   "R REDEFINE KEYS"00
L1A6E       ASC   "MODE  (        ) SOUND   (   )"00
L1A8D       ASC   "LEVEL ( )        PLAYERS ( )"00
L1AAA       ASC   "SPACE BAR STARTS GAME"00
L1AC0       ASC   "JOYSTICK"00
L1AC9       ASC   "KEYBOARD"00
L1AD2       ASC   "PLAYER 1"00
L1ADB       ASC   "PLAYER 2"00
L1AE4       ASC   "          "00
L1AEF       ASC   "HI SCORE"00

*-----------------------

tblKEYS     DB    $A0	; space
            DB    $88	; left arrow
            DB    $95	; right arrow
            DB    $C1	; A
            DB    $DA	; Z
L1AFD       DB    $9B	; escape
            DB    $AE	; .
L1AFF       DB    $95	; right arrow
	DB    $88	; left arrow
	DB    $A0	; space
	DB    $9B	; escape
	DB    $8D	; return

*-----------------------

L1B04       STA   ptrSTRINGS
            STY   $84+1
            STX   ptrSTRINGS+1
L1B0A       LDY   #$00
L1B0C       LDA   (ptrSTRINGS),Y
            BEQ   L1B15
            STA   ($84),Y
            INY
            BNE   L1B0C
L1B15       RTS

*-----------------------

L1B16       LDX   #$27
            LDA   #$A0
L1B1A       STA   $0650,X
            STA   $06D0,X
            STA   $0750,X
            STA   $07D0,X
            DEX
            BPL   L1B1A
            RTS

*-----------------------

L1B2A       LDA   #$00
            STA   charX
            JSR   L1B16
            LDA   MIXSET
L1B34       LDA   charX
            ASL
            TAX
            LDA   L19A8,X
            STA   ptrSTRINGS
            LDA   L19A8+1,X
            STA   ptrSTRINGS+1
            LDA   L1974,X
            STA   $84
            LDA   L1974+1,X
            STA   $84+1
            JSR   L1B0A
            JSR   L1B5B
            INC   charX
            LDY   charX
            CPY   #$07
            BNE   L1B34
            RTS

L1B5B       LDX   charX
            LDA   tblKEYS,X
            LDX   #$04
L1B62       CMP   L1AFF,X
            BEQ   L1B75
            DEX
            BPL   L1B62
            STA   ($84),Y
            LDA   #$AE
            INY
            STA   ($84),Y
            INY
            STA   ($84),Y
            RTS

L1B75       TXA
            ASL
            ASL
            TAX
L1B79       LDA   L19B6,X
            BEQ   L1B84
            STA   ($84),Y
            INY
            INX
            BNE   L1B79
L1B84       RTS

L1B85       LDX   #$00
            STX   $95
            LDA   MIXSET
L1B8C       LDX   $95
            CPX   #$06
            BEQ   L1BE3
            JSR   L1B2A
            LDA   $95
            ASL
            TAX
            LDA   L19A8,X
            STA   ptrSTRINGS
            LDA   L19A8+1,X
            STA   ptrSTRINGS+1
            LDX   #$00
            LDA   #$07
            STA   $85
            LDA   #$E8
            STA   $84
            LDY   #$00
L1BAF       LDA   (ptrSTRINGS),Y
            BEQ   L1BBB
            AND   #$7F
            STA   ($84),Y
            INY
            JMP   L1BAF

L1BBB       DEY
            LDA   #$A0
            STA   ($84),Y
L1BC0       LDA   KBD
            BPL   L1BC0
            LDX   KBDSTROBE
            LDX   $95
            DEX
L1BCB       CMP   tblKEYS,X
            BEQ   L1BDD
            DEX
            BPL   L1BCB
            LDX   $95
            STA   tblKEYS,X
            INC   $95
            JMP   L1B8C

L1BDD       JSR   BELL1
            JMP   L1BC0

L1BE3       LDA   MIXCLR
            RTS

*-----------------------

printSCOREPX
            TXA
            ASL
            ASL
            CLC
            ADC   #$03
            TAX
            LDY   #$00
            STY   $9B
L1BF2       LDA   tblSCORES,X
            BNE   L1BFF
            LDA   $9B
            BNE   L1BFF
            LDA   #$A0
            BNE   L1C06
L1BFF       LDA   tblSCORES,X
            INC   $9B
            ORA   #$B0
L1C06       STA   ($84),Y
            INY
            DEX
            CPY   #$04
            BNE   L1BF2
L1C0E       LDA   #$B0
            LDX   $9B
            BNE   L1C16
            LDA   #$A0
L1C16       STA   ($84),Y
            INY
            CPY   #$06
            BNE   L1C0E
            LDA   #$B0
            STA   ($84),Y
            RTS

*-----------------------

L1C22       DB    $00
            DB    $02
            DB    $02
            DB    $06
            DB    $06
            DB    $00
            DB    $0A
            DB    $0C
            DB    $0C
            DB    $0E
            DB    $0E
            DB    $0A
            DB    $06
            DB    $0E
            DB    $12
            DB    $08
            DB    $08
            DB    $10
            DB    $10
            DB    $14
            DB    $12
            DB    $04
            DB    $08
            DB    $04
            DB    $10
            DB    $04
            DB    $14
            DB    $04
            DB    $00
            DB    $0A
            DB    $02
            DB    $0C
            DB    $16
            DB    $18
            DB    $18
            DB    $1A
            DB    $1A
            DB    $1C
            DB    $1C
            DB    $16
            DB    $1E
            DB    $20
            DB    $20
            DB    $22
            DB    $22
            DB    $24
            DB    $24
            DB    $1E
            DB    $16
            DB    $1E
            DB    $1C
            DB    $24
            DB    $18
            DB    $20
            DB    $1A
            DB    $22
            DB    $FF
            DB    $FF
            DB    $E6
            DB    $23
            DB    $CF
            DB    $41
            DB    $07
            DB    $27
            DB    $E6
            DB    $FC
            DB    $F7
            DB    $E4
            DB    $22
            DB    $23
            DB    $42
            DB    $42
            DB    $22
            DB    $FC
            DB    $11
            DB    $E5
            DB    $F7
            DB    $FC
            DB    $11
            DB    $FC
            DB    $02
            DB    $F2
            DB    $04
            DB    $EB
            DB    $04
            DB    $DD
            DB    $02
            DB    $EB
            DB    $07
            DB    $F2
            DB    $0B
            DB    $EB
            DB    $0B
            DB    $DD
            DB    $07
            DB    $EB
            DB    $FF
            DB    $FF
            DB    $F3
            DB    $22
            DB    $C0
            DB    $3B
            DB    $FC
            DB    $27
            DB    $F3
            DB    $FC
            DB    $04
            DB    $E5
            DB    $2F
            DB    $24
            DB    $2A
            DB    $4A
            DB    $2F
            DB    $FC
            DB    $1D
            DB    $E4
            DB    $04
            DB    $FC
            DB    $1D
            DB    $FC
            DB    $09
            DB    $F2
            DB    $F2
            DB    $EB
            DB    $F2
            DB    $DE
            DB    $0B
            DB    $EB
            DB    $0E
            DB    $F2
            DB    $F9
            DB    $EB
            DB    $F9
            DB    $DD
            DB    $10
            DB    $EA
            DB    $FF
            DB    $FF
            DB    $01
            DB    $22
            DB    $B8
            DB    $35
            DB    $F1
            DB    $26
            DB    $01
            DB    $FC
            DB    $10
            DB    $E4
            DB    $3B
            DB    $26
            DB    $09
            DB    $4E
            DB    $3B
            DB    $FC
            DB    $29
            DB    $E3
            DB    $10
            DB    $FC
            DB    $29
            DB    $FC
            DB    $0F
            DB    $F2
            DB    $E2
            DB    $EC
            DB    $E2
            DB    $DF
            DB    $14
            DB    $EA
            DB    $14
            DB    $F2
            DB    $E8
            DB    $EC
            DB    $E8
            DB    $DE
            DB    $18
            DB    $EA
            DB    $FF
            DB    $FF
            DB    $0F
            DB    $23
            DB    $B7
            DB    $30
            DB    $E8
            DB    $25
            DB    $0F
            DB    $FC
            DB    $1C
            DB    $E4
            DB    $45
            DB    $29
            DB    $E5
            DB    $4C
            DB    $45
            DB    $FB
            DB    $33
            DB    $E1
            DB    $1C
            DB    $FC
            DB    $33
            DB    $FC
            DB    $15
            DB    $F2
            DB    $D6
            DB    $ED
            DB    $D6
            DB    $E1
            DB    $1C
            DB    $EA
            DB    $19
            DB    $F2
            DB    $DA
            DB    $ED
            DB    $DA
            DB    $E0
            DB    $20
            DB    $E9
            DB    $FF
            DB    $FF
            DB    $1C
            DB    $23
            DB    $BB
            DB    $2C
            DB    $E2
            DB    $24
            DB    $1C
            DB    $FC
            DB    $27
            DB    $E3
            DB    $4C
            DB    $2D
            DB    $C8
            DB    $46
            DB    $4C
            DB    $FB
            DB    $3C
            DB    $DF
            DB    $27
            DB    $FC
            DB    $3C
            DB    $FB
            DB    $19
            DB    $F1
            DB    $CF
            DB    $EE
            DB    $CF
            DB    $E3
            DB    $22
            DB    $E9
            DB    $1C
            DB    $F1
            DB    $D1
            DB    $EE
            DB    $D1
            DB    $E2
            DB    $26
            DB    $E8
            DB    $FF
            DB    $FF
            DB    $29
            DB    $25
            DB    $C2
            DB    $29
            DB    $DE
            DB    $22
            DB    $29
            DB    $FC
            DB    $31
            DB    $E1
            DB    $4F
            DB    $32
            DB    $B5
            DB    $3E
            DB    $4F
            DB    $FA
            DB    $42
            DB    $DD
            DB    $31
            DB    $FC
            DB    $42
            DB    $FB
            DB    $1C
            DB    $F1
            DB    $CC
            DB    $F0
            DB    $CC
            DB    $E5
            DB    $27
            DB    $E8
            DB    $1E
            DB    $F1
            DB    $CC
            DB    $EF
            DB    $CC
            DB    $E4
            DB    $2A
            DB    $E7
            DB    $FF
            DB    $FF
            DB    $34
            DB    $26
            DB    $CC
            DB    $26
            DB    $DD
            DB    $20
            DB    $34
            DB    $FC
            DB    $39
            DB    $DF
            DB    $4D
            DB    $38
            DB    $AC
            DB    $37
            DB    $4D
            DB    $FA
            DB    $44
            DB    $DA
            DB    $39
            DB    $FB
            DB    $44
            DB    $FA
            DB    $1E
            DB    $F0
            DB    $CD
            DB    $F1
            DB    $CD
            DB    $E7
            DB    $2A
            DB    $E6
            DB    $1E
            DB    $F0
            DB    $CB
            DB    $F0
            DB    $CB
            DB    $E6
            DB    $2C
            DB    $E6
            DB    $FF
            DB    $FF
            DB    $3E
            DB    $29
            DB    $D7
            DB    $25
            DB    $DE
            DB    $1F
            DB    $3E
            DB    $FB
            DB    $3F
            DB    $DD
            DB    $43
            DB    $3E
            DB    $AC
            DB    $31
            DB    $43
            DB    $F9
            DB    $41
            DB    $D6
            DB    $3F
            DB    $FB
            DB    $41
            DB    $FA
            DB    $1D
            DB    $F0
            DB    $D1
            DB    $F2
            DB    $D1
            DB    $E8
            DB    $2B
            DB    $E5
            DB    $1C
            DB    $EF
            DB    $CE
            DB    $F1
            DB    $CE
            DB    $E8
            DB    $2A
            DB    $E4
            DB    $FF
            DB    $FF
            DB    $45
            DB    $2C
            DB    $E4
            DB    $23
            DB    $E1
            DB    $1E
            DB    $45
            DB    $FB
            DB    $40
            DB    $DA
            DB    $30
            DB    $45
            DB    $B0
            DB    $2C
            DB    $30
            DB    $F8
            DB    $38
            DB    $D1
            DB    $40
            DB    $FA
            DB    $38
            DB    $F9
            DB    $1A
            DB    $EF
            DB    $D7
            DB    $F2
            DB    $D7
            DB    $E9
            DB    $28
            DB    $E3
            DB    $18
            DB    $EF
            DB    $D4
            DB    $F2
            DB    $D4
            DB    $E9
            DB    $25
            DB    $E2
            DB    $FF
            DB    $FF
            DB    $48
            DB    $30
            DB    $F1
            DB    $23
            DB    $E6
            DB    $1D
            DB    $48
            DB    $FB
            DB    $3E
            DB    $D6
            DB    $13
            DB    $4A
            DB    $B9
            DB    $28
            DB    $13
            DB    $F8
            DB    $28
            DB    $CD
            DB    $3E
            DB    $FA
            DB    $28
            DB    $F9
            DB    $15
            DB    $EF
            DB    $DF
            DB    $F3
            DB    $DF
            DB    $EA
            DB    $21
            DB    $E2
            DB    $11
            DB    $EE
            DB    $DB
            DB    $F3
            DB    $DB
            DB    $EA
            DB    $1D
            DB    $E1
            DB    $FF
            DB    $FF
            DB    $47
            DB    $35
            DB    $FE
            DB    $22
            DB    $EC
            DB    $1C
            DB    $47
            DB    $FA
            DB    $35
            DB    $D2
            DB    $F3
            DB    $4B
            DB    $C3
            DB    $26
            DB    $F3
            DB    $F8
            DB    $11
            DB    $CA
            DB    $35
            DB    $F9
            DB    $11
            DB    $F8
            DB    $0E
            DB    $EE
            DB    $E9
            DB    $F3
            DB    $E9
            DB    $EB
            DB    $17
            DB    $E0
            DB    $08
            DB    $EE
            DB    $E4
            DB    $F3
            DB    $E4
            DB    $EB
            DB    $11
            DB    $E0
            DB    $FF
            DB    $FF
            DB    $40
            DB    $3B
            DB    $0C
            DB    $22
            DB    $F3
            DB    $1C
            DB    $40
            DB    $F9
            DB    $26
            DB    $CE
            DB    $D5
            DB    $47
            DB    $D0
            DB    $24
            DB    $D5
            DB    $F8
            DB    $F7
            DB    $CA
            DB    $26
            DB    $F9
            DB    $F7
            DB    $F8
            DB    $06
            DB    $EE
            DB    $F3
            DB    $F4
            DB    $F3
            DB    $EB
            DB    $0A
            DB    $DF
            DB    $FF
            DB    $EE
            DB    $EE
            DB    $F3
            DB    $EE
            DB    $EB
            DB    $03
            DB    $DF
            DB    $FF
            DB    $FF
            DB    $31
            DB    $41
            DB    $1A
            DB    $23
            DB    $FB
            DB    $1B
            DB    $31
            DB    $F9
            DB    $10
            DB    $CC
            DB    $C0
            DB    $40
            DB    $DE
            DB    $22
            DB    $C0
            DB    $F9
            DB    $DF
            DB    $CC
            DB    $10
            DB    $F8
            DB    $DF
            DB    $F9
            DB    $FC
            DB    $EE
            DB    $FD
            DB    $F4
            DB    $FD
            DB    $EB
            DB    $FC
            DB    $DF
            DB    $F6
            DB    $EE
            DB    $F9
            DB    $F4
            DB    $F9
            DB    $EB
            DB    $F5
            DB    $DF
            DB    $FF
            DB    $FF
L1E64       DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $D5
            DB    $B6
            DB    $A0
            DB    $8E
            DB    $80
            DB    $74
            DB    $6A
            DB    $62
            DB    $5B
            DB    $55
            DB    $50
            DB    $4B
            DB    $47
            DB    $43
            DB    $40
            DB    $3C
            DB    $3A
            DB    $37
            DB    $35
            DB    $33
            DB    $31
            DB    $2F
            DB    $2D
            DB    $2C
            DB    $2A
            DB    $29
            DB    $28
            DB    $26
            DB    $25
            DB    $24
            DB    $23
            DB    $22
            DB    $21
            DB    $20
            DB    $20
            DB    $1F
            DB    $1E
            DB    $1D
            DB    $1D
            DB    $1C
            DB    $1B
            DB    $1B
            DB    $1A
            DB    $1A
            DB    $19
            DB    $19
            DB    $18
            DB    $18
            DB    $17
            DB    $17
            DB    $16
            DB    $16
            DB    $16
            DB    $15
            DB    $15
            DB    $14
            DB    $14
            DB    $14
            DB    $14
            DB    $13
            DB    $13
            DB    $13
            DB    $12
            DB    $12
            DB    $12
            DB    $12
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0E
            DB    $0E
            DB    $0E
            DB    $0E
            DB    $0E
            DB    $0E
            DB    $0D
            DB    $0D
            DB    $0D
            DB    $0D
            DB    $0D
            DB    $0D
            DB    $0D
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0B
            DB    $0B
            DB    $0B
            DB    $0B
            DB    $0B
            DB    $0B
            DB    $0B
            DB    $0B
            DB    $0B
            DB    $0B
            DB    $0A
            DB    $0A
            DB    $0A
            DB    $0A
            DB    $0A
            DB    $0A
            DB    $0A
            DB    $0A
            DB    $0A
            DB    $0A
            DB    $0A
            DB    $0A
L1EE5       DB    $00
            DB    $02
            DB    $02
            DB    $04
            DB    $04
            DB    $06
            DB    $06
            DB    $00
            DB    $08
            DB    $0A
            DB    $0A
            DB    $0C
            DB    $0C
            DB    $0E
            DB    $0E
            DB    $08
            DB    $00
            DB    $08
            DB    $02
            DB    $0A
            DB    $04
            DB    $0C
            DB    $06
            DB    $0E
            DB    $FF
            DB    $FF
            DB    $E1
            DB    $38
            DB    $D2
            DB    $52
            DB    $35
            DB    $51
            DB    $23
            DB    $37
            DB    $E1
            DB    $C0
            DB    $D2
            DB    $A2
            DB    $35
            DB    $A3
            DB    $23
            DB    $C0
            DB    $FF
            DB    $FF
            DB    $EB
            DB    $36
            DB    $CA
            DB    $4C
            DB    $28
            DB    $58
            DB    $2C
            DB    $3A
            DB    $EB
            DB    $C2
            DB    $CA
            DB    $A9
            DB    $28
            DB    $9B
            DB    $2C
            DB    $BD
            DB    $FF
            DB    $FF
            DB    $F5
            DB    $35
            DB    $C7
            DB    $46
            DB    $16
            DB    $5D
            DB    $33
            DB    $3D
            DB    $F5
            DB    $C3
            DB    $C7
            DB    $AF
            DB    $16
            DB    $96
            DB    $33
            DB    $BA
            DB    $FF
            DB    $FF
            DB    $00
            DB    $35
            DB    $C8
            DB    $41
            DB    $00
            DB    $5E
            DB    $38
            DB    $41
            DB    $00
            DB    $C3
            DB    $C8
            DB    $B5
            DB    $00
            DB    $94
            DB    $38
            DB    $B5
            DB    $FF
            DB    $FF
            DB    $0B
            DB    $35
            DB    $CC
            DB    $3D
            DB    $EA
            DB    $5D
            DB    $39
            DB    $46
            DB    $0B
            DB    $C3
            DB    $CC
            DB    $BA
            DB    $EA
            DB    $96
            DB    $39
            DB    $AF
            DB    $FF
            DB    $FF
            DB    $15
            DB    $36
            DB    $D3
            DB    $3A
            DB    $D7
            DB    $58
            DB    $36
            DB    $4C
            DB    $15
            DB    $C2
            DB    $D3
            DB    $BD
            DB    $D7
            DB    $9B
            DB    $36
            DB    $A9
            DB    $FF
            DB    $FF
            DB    $1F
            DB    $38
            DB    $DC
            DB    $37
            DB    $CB
            DB    $51
            DB    $2E
            DB    $52
            DB    $1F
            DB    $C0
            DB    $DC
            DB    $C0
            DB    $CB
            DB    $A3
            DB    $2E
            DB    $A2
            DB    $FF
            DB    $FF
            DB    $27
            DB    $3A
            DB    $E6
            DB    $36
            DB    $C4
            DB    $4B
            DB    $21
            DB    $58
            DB    $27
            DB    $BD
            DB    $E6
            DB    $C2
            DB    $C4
            DB    $AA
            DB    $21
            DB    $9C
            DB    $FF
            DB    $FF
            DB    $2E
            DB    $3D
            DB    $F1
            DB    $35
            DB    $C3
            DB    $45
            DB    $0F
            DB    $5B
            DB    $2E
            DB    $BA
            DB    $F1
            DB    $C3
            DB    $C3
            DB    $B1
            DB    $0F
            DB    $98
            DB    $FF
            DB    $FF
            DB    $33
            DB    $40
            DB    $FD
            DB    $34
            DB    $C5
            DB    $40
            DB    $FA
            DB    $5C
            DB    $33
            DB    $B6
            DB    $FD
            DB    $C4
            DB    $C5
            DB    $B7
            DB    $FA
            DB    $97
            DB    $FF
            DB    $FF
            DB    $35
            DB    $45
            DB    $08
            DB    $34
            DB    $CB
            DB    $3C
            DB    $E7
            DB    $59
            DB    $35
            DB    $B1
            DB    $08
            DB    $C4
            DB    $CB
            DB    $BB
            DB    $E7
            DB    $99
            DB    $FF
            DB    $FF
            DB    $33
            DB    $4A
            DB    $13
            DB    $35
            DB    $D3
            DB    $39
            DB    $D7
            DB    $55
            DB    $33
            DB    $AB
            DB    $13
            DB    $C3
            DB    $D3
            DB    $BF
            DB    $D7
            DB    $9F
            DB    $FF
            DB    $FF
            DB    $2C
            DB    $4F
            DB    $1E
            DB    $36
            DB    $DD
            DB    $36
            DB    $CD
            DB    $4F
            DB    $2C
            DB    $A5
            DB    $1E
            DB    $C1
            DB    $DD
            DB    $C2
            DB    $CD
            DB    $A6
            DB    $FF
            DB    $FF
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $D5
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $D3
            DB    $AE
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $A0

*----------------------- HGR1

            DS    $2000
	
*-----------------------

L4000       DB    $00
            DB    $02
            DB    $02
            DB    $04
            DB    $04
            DB    $06
            DB    $06
            DB    $00
            DB    $00
            DB    $08
            DB    $02
            DB    $0A
            DB    $0A
            DB    $04
            DB    $08
            DB    $06
            DB    $0A
            DB    $08
            DB    $04
            DB    $06
            DB    $0C
            DB    $0E
            DB    $0E
            DB    $10
            DB    $10
            DB    $12
            DB    $12
            DB    $0C
            DB    $0E
            DB    $16
            DB    $10
            DB    $18
            DB    $14
            DB    $16
            DB    $16
            DB    $18
            DB    $18
            DB    $1A
            DB    $1A
            DB    $14
            DB    $0C
            DB    $14
            DB    $12
            DB    $1A
            DB    $FF
            DB    $FF
            DB    $FD
            DB    $FB
            DB    $23
            DB    $FB
            DB    $37
            DB    $1E
            DB    $FB
            DB    $1F
            DB    $FD
            DB    $D4
            DB    $26
            DB    $D5
            DB    $0F
            DB    $DB
            DB    $19
            DB    $F7
            DB    $18
            DB    $09
            DB    $11
            DB    $EB
            DB    $15
            DB    $DB
            DB    $22
            DB    $F7
            DB    $21
            DB    $09
            DB    $18
            DB    $EB
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FB
            DB    $25
            DB    $FB
            DB    $1D
            DB    $21
            DB    $E2
            DB    $1E
            DB    $FA
            DB    $D5
            DB    $24
            DB    $D3
            DB    $0A
            DB    $DA
            DB    $F1
            DB    $F7
            DB    $F3
            DB    $09
            DB    $06
            DB    $EA
            DB    $10
            DB    $DA
            DB    $FB
            DB    $F7
            DB    $FC
            DB    $09
            DB    $0D
            DB    $EA
            DB    $FF
            DB    $FF
            DB    $00
            DB    $FB
            DB    $25
            DB    $FB
            DB    $FC
            DB    $22
            DB    $CD
            DB    $1C
            DB    $F7
            DB    $D5
            DB    $1E
            DB    $D0
            DB    $04
            DB    $DA
            DB    $CE
            DB    $F8
            DB    $D1
            DB    $08
            DB    $FA
            DB    $EA
            DB    $0A
            DB    $D9
            DB    $D5
            DB    $F7
            DB    $D8
            DB    $09
            DB    $00
            DB    $EA
            DB    $FF
            DB    $FF
            DB    $02
            DB    $FB
            DB    $21
            DB    $FA
            DB    $DD
            DB    $21
            DB    $C0
            DB    $1A
            DB    $F5
            DB    $D5
            DB    $16
            DB    $CF
            DB    $FD
            DB    $DA
            DB    $B6
            DB    $F9
            DB    $B9
            DB    $07
            DB    $EF
            DB    $EB
            DB    $02
            DB    $D9
            DB    $B9
            DB    $F8
            DB    $BD
            DB    $08
            DB    $F3
            DB    $EA
            DB    $FF
            DB    $FF
            DB    $03
            DB    $FB
            DB    $1B
            DB    $FA
            DB    $C5
            DB    $1E
            DB    $BB
            DB    $17
            DB    $F4
            DB    $D6
            DB    $0A
            DB    $CD
            DB    $F7
            DB    $DA
            DB    $A9
            DB    $FA
            DB    $AD
            DB    $06
            DB    $E6
            DB    $EC
            DB    $FA
            DB    $D9
            DB    $AA
            DB    $F9
            DB    $AE
            DB    $07
            DB    $E8
            DB    $EB
            DB    $FF
            DB    $FF
            DB    $04
            DB    $FB
            DB    $12
            DB    $FA
            DB    $B6
            DB    $1A
            DB    $BB
            DB    $15
            DB    $F4
            DB    $D7
            DB    $FE
            DB    $CD
            DB    $F2
            DB    $DB
            DB    $A6
            DB    $FA
            DB    $A9
            DB    $06
            DB    $DF
            DB    $EC
            DB    $F3
            DB    $D9
            DB    $A5
            DB    $FA
            DB    $A8
            DB    $06
            DB    $E0
            DB    $EC
            DB    $FF
            DB    $FF
            DB    $05
            DB    $FB
            DB    $07
            DB    $FA
            DB    $B0
            DB    $17
            DB    $BF
            DB    $13
            DB    $F5
            DB    $D7
            DB    $F2
            DB    $CE
            DB    $ED
            DB    $DB
            DB    $AA
            DB    $FB
            DB    $AC
            DB    $05
            DB    $DB
            DB    $ED
            DB    $ED
            DB    $DA
            DB    $A7
            DB    $FB
            DB    $AA
            DB    $05
            DB    $DA
            DB    $ED
            DB    $FF
            DB    $FF
            DB    $06
            DB    $FB
            DB    $FB
            DB    $FA
            DB    $B1
            DB    $15
            DB    $C6
            DB    $12
            DB    $F6
            DB    $D8
            DB    $E7
            DB    $CF
            DB    $EB
            DB    $DC
            DB    $B1
            DB    $FB
            DB    $B3
            DB    $05
            DB    $DB
            DB    $EE
            DB    $E8
            DB    $DB
            DB    $AE
            DB    $FB
            DB    $B0
            DB    $05
            DB    $D8
            DB    $EE
            DB    $FF
            DB    $FF
            DB    $06
            DB    $FB
            DB    $EF
            DB    $FA
            DB    $B6
            DB    $13
            DB    $D0
            DB    $11
            DB    $F8
            DB    $D8
            DB    $DF
            DB    $D1
            DB    $EA
            DB    $DD
            DB    $BC
            DB    $FC
            DB    $BE
            DB    $04
            DB    $DC
            DB    $EF
            DB    $E6
            DB    $DD
            DB    $B9
            DB    $FC
            DB    $BA
            DB    $04
            DB    $D9
            DB    $EF
            DB    $FF
            DB    $FF
            DB    $06
            DB    $FB
            DB    $E6
            DB    $FA
            DB    $BF
            DB    $12
            DB    $DB
            DB    $10
            DB    $FA
            DB    $D9
            DB    $DB
            DB    $D3
            DB    $EA
            DB    $DE
            DB    $C9
            DB    $FC
            DB    $CA
            DB    $04
            DB    $E0
            DB    $F0
            DB    $E5
            DB    $DE
            DB    $C5
            DB    $FC
            DB    $C6
            DB    $04
            DB    $DC
            DB    $F0
            DB    $FF
            DB    $FF
            DB    $05
            DB    $FB
            DB    $DF
            DB    $FA
            DB    $CA
            DB    $11
            DB    $E8
            DB    $10
            DB    $FD
            DB    $D9
            DB    $D9
            DB    $D6
            DB    $EC
            DB    $DF
            DB    $D7
            DB    $FC
            DB    $D8
            DB    $04
            DB    $E5
            DB    $F0
            DB    $E7
            DB    $DF
            DB    $D3
            DB    $FC
            DB    $D4
            DB    $04
            DB    $E1
            DB    $F0
            DB    $FF
            DB    $FF
            DB    $04
            DB    $FB
            DB    $DB
            DB    $FA
            DB    $D7
            DB    $10
            DB    $F5
            DB    $0F
            DB    $00
            DB    $D9
            DB    $DA
            DB    $D8
            DB    $EF
            DB    $E0
            DB    $E6
            DB    $FC
            DB    $E6
            DB    $04
            DB    $EC
            DB    $F1
            DB    $E9
            DB    $E0
            DB    $E2
            DB    $FC
            DB    $E2
            DB    $04
            DB    $E7
            DB    $F1
            DB    $FF
            DB    $FF
            DB    $03
            DB    $FB
            DB    $DA
            DB    $FB
            DB    $E4
            DB    $0F
            DB    $02
            DB    $0F
            DB    $02
            DB    $D9
            DB    $DD
            DB    $DA
            DB    $F3
            DB    $E1
            DB    $F6
            DB    $FC
            DB    $F6
            DB    $04
            DB    $F4
            DB    $F1
            DB    $ED
            DB    $E1
            DB    $F2
            DB    $FC
            DB    $F2
            DB    $04
            DB    $EF
            DB    $F1
            DB    $FF
            DB    $FF

*-----------------------

L41B4       LDA   fgJOYSTICK
            BEQ   L41C2
            LDA   BUTN0
            BPL   L41C2
            LDA   #$00
            STA   joyBTN
L41C2       JSR   readJOYSTICK
            LDA   $DB
            BEQ   L41CD
            DEC   $DB
            BNE   L41F3
L41CD       LDA   joyY
            BEQ   L41E7
            CMP   #$A5
            BCS   L41E3
            LDA   #$03
            STA   $DB
            LDA   $EC
            AND   #$0B
            ORA   #$08
            STA   $EC
            BNE   L41F3
L41E3       CMP   #$EF
            BCC   L41F3
L41E7       LDA   #$03
            STA   $DB
            LDA   $EC
            AND   #$07
            ORA   #$04
            STA   $EC
L41F3       LDA   $DC
            BEQ   L41FB
            DEC   $DC
            BNE   L4221
L41FB       LDA   joyX
            BEQ   L4215
            CMP   #$A5
            BCS   L4211
            LDA   #$03
            STA   $DC
            LDA   $EC
            AND   #$0E
            ORA   #$02
            STA   $EC
            BNE   L4221
L4211       CMP   #$EF
            BCC   L4221
L4215       LDA   #$03
            STA   $DC
            LDA   $EC
            AND   #$0D
            ORA   #$01
            STA   $EC
L4221       RTS

*-----------------------

readJOYSTICK
            LDA   PTRIG	; read joystick
            LDA   #$98	; return positions
            STA   joyY	; in $E3..$E4
            STA   joyX
            INC   joyX
            DEC   joyX
            LDA   joyX
            LDA   joyX
            LDA   joyX
L4235       LDX   PADDL0
            LDA   PADDL1
            BPL   L4247
            TXA
            BPL   L425A
            INC   joyY
            INC   joyX
            BNE   L4235
L4246       RTS

L4247       TXA
            BPL   L4246
            INC   joyY
            LDA   joyY
            LDA   joyY
            LDA   joyY
            BEQ   L4246
            LDX   PADDL0
            JMP   L4247

L425A       INC   joyX
            NOP
            LDA   joyX
            BEQ   L4246
            LDA   PADDL1
            BPL   L4246
            NOP
            NOP
            NOP
            JMP   L425A

*-----------------------

L426C       DB    $00
            DB    $02
            DB    $02
            DB    $04
            DB    $04
            DB    $06
            DB    $06
            DB    $00
            DB    $08
            DB    $00
            DB    $08
            DB    $02
            DB    $08
            DB    $04
            DB    $08
            DB    $06
            DB    $FF
            DB    $FF
            DB    $DF
            DB    $3B
            DB    $CF
            DB    $56
            DB    $31
            DB    $56
            DB    $21
            DB    $3B
            DB    $00
            DB    $B8
            DB    $FF
            DB    $FF
            DB    $E9
            DB    $39
            DB    $C8
            DB    $50
            DB    $25
            DB    $5C
            DB    $2A
            DB    $3E
            DB    $00
            DB    $B8
            DB    $FF
            DB    $FF
            DB    $F4
            DB    $38
            DB    $C7
            DB    $4A
            DB    $14
            DB    $61
            DB    $31
            DB    $41
            DB    $00
            DB    $B8
            DB    $FF
            DB    $FF
            DB    $00
            DB    $38
            DB    $C9
            DB    $45
            DB    $00
            DB    $63
            DB    $37
            DB    $45
            DB    $00
            DB    $B8
            DB    $FF
            DB    $FF
            DB    $0B
            DB    $38
            DB    $CE
            DB    $41
            DB    $EC
            DB    $61
            DB    $39
            DB    $4A
            DB    $00
            DB    $B8
            DB    $FF
            DB    $FF
            DB    $16
            DB    $39
            DB    $D6
            DB    $3E
            DB    $DB
            DB    $5C
            DB    $37
            DB    $50
            DB    $00
            DB    $B8
            DB    $FF
            DB    $FF
            DB    $21
            DB    $3B
            DB    $DF
            DB    $3B
            DB    $CF
            DB    $56
            DB    $31
            DB    $56
            DB    $00
            DB    $B8
            DB    $FF
            DB    $FF
            DB    $2A
            DB    $3E
            DB    $E9
            DB    $39
            DB    $C8
            DB    $50
            DB    $25
            DB    $5C
            DB    $00
            DB    $B8
            DB    $FF
            DB    $FF
            DB    $31
            DB    $41
            DB    $F4
            DB    $38
            DB    $C7
            DB    $4A
            DB    $14
            DB    $61
            DB    $00
            DB    $B8
            DB    $FF
            DB    $FF
            DB    $37
            DB    $45
            DB    $00
            DB    $38
            DB    $C9
            DB    $45
            DB    $00
            DB    $63
            DB    $00
            DB    $B8
            DB    $FF
            DB    $FF
            DB    $39
            DB    $4A
            DB    $0B
            DB    $38
            DB    $CE
            DB    $41
            DB    $EC
            DB    $61
            DB    $00
            DB    $B8
            DB    $FF
            DB    $FF
            DB    $37
            DB    $50
            DB    $16
            DB    $39
            DB    $D6
            DB    $3E
            DB    $DB
            DB    $5C
            DB    $00
            DB    $B8
            DB    $FF
            DB    $FF
            DB    $31
            DB    $56
            DB    $21
            DB    $3B
            DB    $DF
            DB    $3B
            DB    $CF
            DB    $56
            DB    $00
            DB    $B8
            DB    $FF
            DB    $FF

*-----------------------

L431A       TAY
            BEQ   L431F
	LDA   #$FF
L431F       AND   L44AF
            BEQ   L437A
            LDA   #<L4889
            STA   ptrSTRING
            LDA   #>L4889
            STA   ptrSTRING+1
            LDX   #$2A
            LDY   #$0B
            LDA   #$FF
            JSR   L0BE5
            LDA   #<L48E1
            STA   ptrSTRING
            LDA   #>L48E1
            STA   ptrSTRING+1
            LDX   #$2A
            LDY   #$13
            LDA   #$FF
            JSR   L0BE5
            LDA   #<L4929
            STA   ptrSTRING
            LDA   #>L4929
            STA   ptrSTRING+1
            LDX   #$42
            LDY   #$13
            LDA   #$FF
            JSR   L0BE5
            LDA   #<L4949
            STA   ptrSTRING
            LDA   #>L4949
            STA   ptrSTRING+1
            LDX   #$2A
            LDY   #$1B
            LDA   #$FF
            JSR   L0BE5
            LDA   #<L4971
            STA   ptrSTRING
            LDA   #>L4971
            STA   ptrSTRING+1
            LDX   #$35
            LDY   #$1B
            LDA   #$FF
            JSR   L0BE5
            RTS

L437A       LDA   #<L49C1
            STA   ptrSTRING
            LDA   #>L49C1
            STA   ptrSTRING+1
            LDX   #$2A
            LDY   #$0B
            LDA   #$0A
            JSR   L0D00
            LDX   #$2A
            LDY   #$13
            LDA   #$0A
            JSR   L0D00
            LDX   #$31
            LDY   #$13
            LDA   #$0A
            JSR   L0D00
            LDX   #$2A
            LDY   #$1B
            LDA   #$0A
            JSR   L0D00
            LDX   #$35
            LDY   #$1B
            LDA   #$0A
            JSR   L0D00
            RTS

L43B0       AND   L44AF
            BEQ   L43C7
            LDA   #<L46F9
            STA   ptrSTRING
            LDA   #>L46F9
            STA   ptrSTRING+1
            LDX   #$2A
            LDY   #$28
            LDA   #$FF
            JSR   L0BE5
            RTS

L43C7       LDA   #<L49C1
            STA   ptrSTRING
            LDA   #>L49C1
            STA   ptrSTRING+1
            LDX   #$2A
            LDY   #$28
            LDA   #$0A
            JSR   L0D00
            RTS

L43D9       AND   L44AF
            BEQ   L4401
            LDA   #<L4741
            STA   ptrSTRING
            LDA   #>L4741
            STA   ptrSTRING+1
            LDX   #$2A
            LDY   #$30
            LDA   #$FF
            JSR   L0BE5
            LDA   #<L4769
            STA   ptrSTRING
            LDA   #>L4769
            STA   ptrSTRING+1
            LDX   #$35
            LDY   #$30
            LDA   #$FF
            JSR   L0BE5
            RTS

L4401       LDA   #<L49C1
            STA   ptrSTRING
            LDA   #>L49C1
            STA   ptrSTRING+1
            LDX   #$2A
            LDY   #$30
            LDA   #$0A
            JSR   L0D00
            LDX   #$35
            LDY   #$30
            LDA   #$0A
            JSR   L0D00
            RTS

L441C       AND   L44AF
            BEQ   L4444
            LDA   #<L47B1
            STA   ptrSTRING
            LDA   #>L47B1
            STA   ptrSTRING+1
            LDX   #$2A
            LDY   #$38
            LDA   #$FF
            JSR   L0BE5
            LDA   #<L4811
            STA   ptrSTRING
            LDA   #>L4811
            STA   ptrSTRING+1
            LDX   #$35
            LDY   #$38
            LDA   #$FF
            JSR   L0BE5
            RTS

L4444       LDA   #<L49C1
            STA   ptrSTRING
            LDA   #>L49C1
            STA   ptrSTRING+1
            LDX   #$2A
            LDY   #$38
            LDA   #$0A
            JSR   L0D00
            LDX   #$35
            LDY   #$38
            LDA   #$0A
            JSR   L0D00
            RTS

L445F       AND   L44AF
            BEQ   L4444
            LDA   #<L47B1
            STA   ptrSTRING
            LDA   #>L47B1
            STA   ptrSTRING+1
            LDX   #$2A
            LDY   #$38
            LDA   #$FF
            JSR   L0D00
            LDA   #<L47D9
            STA   ptrSTRING
            LDA   #>L47D9
            STA   ptrSTRING+1
            LDX   #$35
            LDY   #$38
            LDA   #$FF
            JSR   L0BE5
            RTS

L4487       AND   L44AF
            BEQ   L4444
            LDA   #<L47B1
            STA   ptrSTRING
            LDA   #>L47B1
            STA   ptrSTRING+1
            LDX   #$2A
            LDY   #$38
            LDA   #$FF
            JSR   L0BE5
            LDA   #<L4851
            STA   ptrSTRING
            LDA   #>L4851
            STA   ptrSTRING+1
            LDX   #$35
            LDY   #$38
            LDA   #$FF
            JSR   L0BE5
            RTS

L44AF       DB    $00

L44B0       CLC
            LDX   #$FF
            LDA   #$78
            ADC   $E0
            STA   $E0
            CMP   #$80
            BCS   L44BE
            INX
L44BE       STX   L44AF
            TXA
            EOR   $00
            BNE   L44C7
            RTS

L44C7       LDA   L44AF
            STA   $00
            LDA   L71C5
            PHA
            LDA   #$00
            STA   L71C5
            PLA
            JSR   L431A
            LDA   $B6
            AND   #$07
            ORA   $DF
            JSR   L43B0
            LDA   $DF
            JSR   L43D9
            LDA   $B6
            AND   #$01
            BEQ   L44F1
            JSR   L4487
            RTS

L44F1       LDA   $B6
            AND   #$02
            BEQ   L44FB
            JSR   L441C
            RTS

L44FB       LDA   $B6
            AND   #$04
            BEQ   L4505
            JSR   L445F
            RTS

L4505       JSR   L4444
            RTS

*-----------------------

L4509       DB    $01
            DB    $24
            DB    $0A
            DB    $0C
            DB    $0A
            DB    $0C
            DB    $0D
            DB    $10
            DB    $0D
            DB    $10
            DB    $10
            DB    $0C
            DB    $10
            DB    $0C
            DB    $18
            DB    $24
            DB    $0A
            DB    $0F
            DB    $0B
            DB    $0F
            DB    $18
            DB    $14
            DB    $18
            DB    $14
            DB    $12
            DB    $0C
            DB    $12
            DB    $0D
            DB    $0B
            DB    $0E
            DB    $0C
            DB    $0E
            DB    $08
            DB    $0E
            DB    $09
            DB    $0E
            DB    $0D
            DB    $09
            DB    $0E
            DB    $09
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L4535       DB    $01
            DB    $24
            DB    $0A
            DB    $0C
            DB    $0A
            DB    $0C
            DB    $0D
            DB    $10
            DB    $0D
            DB    $10
            DB    $10
            DB    $0C
            DB    $10
            DB    $0C
            DB    $18
            DB    $24
            DB    $10
            DB    $11
            DB    $10
            DB    $11
            DB    $17
            DB    $19
            DB    $17
            DB    $19
            DB    $09
            DB    $11
            DB    $09
            DB    $11
            DB    $07
            DB    $10
            DB    $07
            DB    $10
            DB    $0A
            DB    $0A
            DB    $0B
            DB    $0A
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L455D       DB    $01
            DB    $24
            DB    $0A
            DB    $0C
            DB    $0A
            DB    $0C
            DB    $0D
            DB    $10
            DB    $0D
            DB    $10
            DB    $10
            DB    $0C
            DB    $10
            DB    $0C
            DB    $18
            DB    $24
            DB    $0D
            DB    $0D
            DB    $0E
            DB    $0D
            DB    $18
            DB    $1A
            DB    $18
            DB    $1A
            DB    $0B
            DB    $09
            DB    $0C
            DB    $09
            DB    $07
            DB    $0B
            DB    $07
            DB    $0B
            DB    $04
            DB    $10
            DB    $04
            DB    $10
            DB    $07
            DB    $08
            DB    $07
            DB    $08
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L4589       DB    $01
            DB    $24
            DB    $0A
            DB    $0C
            DB    $0A
            DB    $0C
            DB    $0D
            DB    $10
            DB    $0D
            DB    $10
            DB    $10
            DB    $0C
            DB    $10
            DB    $0C
            DB    $18
            DB    $24
            DB    $14
            DB    $0B
            DB    $14
            DB    $0B
            DB    $18
            DB    $1F
            DB    $18
            DB    $1F
            DB    $11
            DB    $08
            DB    $11
            DB    $08
            DB    $04
            DB    $0A
            DB    $04
            DB    $0A
            DB    $04
            DB    $13
            DB    $04
            DB    $13
            DB    $04
            DB    $07
            DB    $04
            DB    $07
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L45B5       DB    $01
            DB    $24
            DB    $0A
            DB    $0C
            DB    $0A
            DB    $0C
            DB    $0D
            DB    $10
            DB    $0D
            DB    $10
            DB    $10
            DB    $0C
            DB    $10
            DB    $0C
            DB    $18
            DB    $24
            DB    $15
            DB    $0A
            DB    $15
            DB    $0A
            DB    $18
            DB    $23
            DB    $18
            DB    $23
            DB    $14
            DB    $07
            DB    $14
            DB    $07
            DB    $02
            DB    $0C
            DB    $02
            DB    $0C
            DB    $03
            DB    $16
            DB    $03
            DB    $16
            DB    $01
            DB    $09
            DB    $01
            DB    $09
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L45E1       DB    $01
            DB    $24
            DB    $0A
            DB    $0C
            DB    $0A
            DB    $0C
            DB    $0D
            DB    $10
            DB    $0D
            DB    $10
            DB    $10
            DB    $0C
            DB    $10
            DB    $0C
            DB    $18
            DB    $24
            DB    $18
            DB    $0A
            DB    $18
            DB    $0A
            DB    $18
            DB    $24
            DB    $18
            DB    $24
            DB    $15
            DB    $07
            DB    $15
            DB    $07
            DB    $02
            DB    $10
            DB    $02
            DB    $10
            DB    $03
            DB    $19
            DB    $03
            DB    $19
            DB    $0C
            DB    $09
            DB    $0C
            DB    $09
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L460D       DB    $01
            DB    $24
            DB    $0A
            DB    $0C
            DB    $0A
            DB    $0C
            DB    $0D
            DB    $10
            DB    $0D
            DB    $10
            DB    $10
            DB    $0C
            DB    $10
            DB    $0C
            DB    $18
            DB    $24
            DB    $18
            DB    $0E
            DB    $18
            DB    $0E
            DB    $15
            DB    $21
            DB    $15
            DB    $21
            DB    $16
            DB    $12
            DB    $16
            DB    $12
            DB    $01
            DB    $14
            DB    $01
            DB    $14
            DB    $03
            DB    $1C
            DB    $03
            DB    $1C
            DB    $0D
            DB    $08
            DB    $0D
            DB    $08
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L4639       DB    $01
            DB    $24
            DB    $0A
            DB    $0C
            DB    $0A
            DB    $0C
            DB    $0D
            DB    $10
            DB    $0D
            DB    $10
            DB    $10
            DB    $0C
            DB    $10
            DB    $0C
            DB    $18
            DB    $24
            DB    $18
            DB    $11
            DB    $18
            DB    $11
            DB    $12
            DB    $23
            DB    $12
            DB    $23
            DB    $18
            DB    $1E
            DB    $18
            DB    $1E
            DB    $01
            DB    $17
            DB    $01
            DB    $17
            DB    $01
            DB    $1F
            DB    $01
            DB    $1F
            DB    $0F
            DB    $06
            DB    $0F
            DB    $06
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L4665       DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L4669       DB    $01
            DB    $1D
            DB    $0F
            DB    $24
            DB    $01
            DB    $1D
            DB    $18
            DB    $24
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L4675       DB    $01
            DB    $24
            DB    $11
            DB    $19
            DB    $11
            DB    $19
            DB    $18
            DB    $1C
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L4681       DB    $01
            DB    $24
            DB    $08
            DB    $18
            DB    $08
            DB    $18
            DB    $18
            DB    $24
            DB    $0F
            DB    $1E
            DB    $18
            DB    $1C
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L4691       DB    $01
            DB    $1C
            DB    $06
            DB    $24
            DB    $01
            DB    $1C
            DB    $18
            DB    $24
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L469D       DB    $01
            DB    $24
            DB    $18
            DB    $1C
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L46A5       DB    $01
            DB    $1C
            DB    $18
            DB    $24
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L46AD       DB    $01
            DB    $1D
            DB    $08
            DB    $24
            DB    $08
            DB    $24
            DB    $18
            DB    $24
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L46B9       DB    $01
            DB    $1D
            DB    $16
            DB    $24
            DB    $0D
            DB    $23
            DB    $18
            DB    $1D
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L46C5       DB    $0D
            DB    $01
            DB    $0F
            DB    $01
            DB    $0E
            DB    $02
            DB    $10
            DB    $02
            DB    $0E
            DB    $03
            DB    $10
            DB    $03
            DB    $0F
            DB    $04
            DB    $11
            DB    $04
            DB    $0F
            DB    $05
            DB    $11
            DB    $05
            DB    $0F
            DB    $06
            DB    $11
            DB    $06
            DB    $0E
            DB    $07
            DB    $11
            DB    $07
            DB    $0D
            DB    $08
            DB    $11
            DB    $08
            DB    $0A
            DB    $09
            DB    $10
            DB    $09
            DB    $0B
            DB    $0A
            DB    $10
            DB    $0A
            DB    $0C
            DB    $0B
            DB    $0E
            DB    $0B
            DB    $0A
            DB    $08
            DB    $0A
            DB    $08
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L46F9       DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $07
            DB    $08
            DB    $AA
            DB    $84
            DB    $A2
            DB    $C5
            DB    $80
            DB    $91
            DB    $82
            DB    $82
            DB    $94
            DB    $A2
            DB    $C0
            DB    $A2
            DB    $91
            DB    $82
            DB    $82
            DB    $94
            DB    $A2
            DB    $C0
            DB    $A2
            DB    $91
            DB    $82
            DB    $8A
            DB    $C4
            DB    $A2
            DB    $C1
            DB    $88
            DB    $C1
            DB    $80
            DB    $82
            DB    $C4
            DB    $A2
            DB    $C0
            DB    $88
            DB    $C1
            DB    $80
            DB    $82
            DB    $84
            DB    $A2
            DB    $C0
            DB    $80
            DB    $C1
            DB    $80
            DB    $AA
            DB    $84
            DB    $A2
            DB    $C5
            DB    $80
            DB    $C1
            DB    $80
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L4741       DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $03
            DB    $08
            DB    $AA
            DB    $84
            DB    $82
            DB    $88
            DB    $94
            DB    $82
            DB    $88
            DB    $94
            DB    $82
            DB    $88
            DB    $C4
            DB    $82
            DB    $88
            DB    $C4
            DB    $82
            DB    $88
            DB    $84
            DB    $82
            DB    $AA
            DB    $84
            DB    $82
            DB    $00
            DB    $00
            DB    $00
L4769       DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $07
            DB    $08
            DB    $94
            DB    $A0
            DB    $90
            DB    $88
            DB    $94
            DB    $A8
            DB    $81
            DB    $C4
            DB    $88
            DB    $D1
            DB    $88
            DB    $C1
            DB    $88
            DB    $80
            DB    $C4
            DB    $88
            DB    $D1
            DB    $88
            DB    $81
            DB    $88
            DB    $80
            DB    $D4
            DB    $88
            DB    $91
            DB    $8A
            DB    $81
            DB    $A8
            DB    $80
            DB    $94
            DB    $A8
            DB    $91
            DB    $8A
            DB    $D1
            DB    $88
            DB    $80
            DB    $C4
            DB    $88
            DB    $91
            DB    $88
            DB    $C1
            DB    $88
            DB    $80
            DB    $C4
            DB    $88
            DB    $91
            DB    $88
            DB    $94
            DB    $A8
            DB    $81
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L47B1       DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $03
            DB    $08
            DB    $AA
            DB    $D0
            DB    $80
            DB    $88
            DB    $84
            DB    $82
            DB    $88
            DB    $84
            DB    $82
            DB    $88
            DB    $84
            DB    $82
            DB    $88
            DB    $84
            DB    $82
            DB    $88
            DB    $84
            DB    $82
            DB    $88
            DB    $D0
            DB    $80
            DB    $00
            DB    $00
            DB    $00
L47D9       DB    $00
            DB    $0E
L47DB       DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $05
            DB    $08
            DB    $84
            DB    $A8
            DB    $D1
            DB    $A2
            DB    $85
            DB    $84
            DB    $88
            DB    $90
            DB    $80
            DB    $81
            DB    $84
            DB    $88
            DB    $90
            DB    $80
            DB    $81
            DB    $84
            DB    $A8
            DB    $D0
            DB    $80
            DB    $81
            DB    $84
            DB    $88
            DB    $90
            DB    $80
            DB    $81
            DB    $84
            DB    $88
            DB    $90
            DB    $80
            DB    $81
            DB    $D4
            DB    $A8
            DB    $91
            DB    $80
            DB    $81
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L4811       DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $06
            DB    $08
            DB    $94
            DB    $A8
            DB    $C1
            DB    $82
            DB    $91
            DB    $AA
            DB    $C4
            DB    $A0
            DB    $90
            DB    $88
            DB    $91
            DB    $88
            DB    $C4
            DB    $A0
            DB    $90
            DB    $80
            DB    $91
            DB    $88
            DB    $94
            DB    $A0
            DB    $90
            DB    $80
            DB    $95
            DB    $88
            DB    $94
            DB    $A0
            DB    $90
            DB    $8A
            DB    $91
            DB    $88
            DB    $C4
            DB    $A0
            DB    $90
            DB    $88
            DB    $91
            DB    $88
            DB    $C4
            DB    $A8
            DB    $C1
            DB    $82
            DB    $91
            DB    $88
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L4851       DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $05
            DB    $08
            DB    $94
            DB    $A8
            DB    $C1
            DB    $A0
            DB    $81
            DB    $C4
            DB    $88
            DB    $90
            DB    $A2
            DB    $84
            DB    $C4
            DB    $88
            DB    $90
            DB    $A2
            DB    $84
            DB    $94
            DB    $A8
            DB    $90
            DB    $A2
            DB    $81
            DB    $94
            DB    $88
            DB    $D0
            DB    $A2
            DB    $81
            DB    $C4
            DB    $88
            DB    $90
            DB    $A2
            DB    $84
            DB    $C4
            DB    $A8
            DB    $91
            DB    $A2
            DB    $84
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L4889       DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $09
            DB    $08
            DB    $82
            DB    $84
            DB    $8A
            DB    $D4
            DB    $A8
            DB    $C1
            DB    $82
            DB    $C1
            DB    $80
            DB    $8A
            DB    $C5
            DB    $A0
            DB    $90
            DB    $A0
            DB    $90
            DB    $88
            DB    $C5
            DB    $80
            DB    $8A
            DB    $C5
            DB    $A0
            DB    $90
            DB    $A0
            DB    $90
            DB    $88
            DB    $C5
            DB    $80
            DB    $A2
            DB    $C4
            DB    $A0
            DB    $90
            DB    $A0
            DB    $90
            DB    $88
            DB    $D1
            DB    $80
            DB    $A2
            DB    $C4
            DB    $A0
            DB    $90
            DB    $A0
            DB    $90
            DB    $88
            DB    $D1
            DB    $80
            DB    $82
            DB    $C4
            DB    $A0
            DB    $90
            DB    $A0
            DB    $90
            DB    $88
            DB    $C1
            DB    $80
            DB    $82
            DB    $84
            DB    $8A
            DB    $90
            DB    $A8
            DB    $C1
            DB    $82
            DB    $C1
            DB    $80
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L48E1       DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $07
            DB    $08
            DB    $8A
            DB    $84
            DB    $A0
            DB    $81
            DB    $8A
            DB    $C4
            DB    $A8
            DB    $A2
            DB    $84
            DB    $88
            DB    $C0
            DB    $A0
            DB    $C4
            DB    $88
            DB    $A2
            DB    $84
            DB    $88
            DB    $C4
            DB    $80
            DB    $C4
            DB    $88
            DB    $8A
            DB    $84
            DB    $88
            DB    $C4
            DB    $80
            DB    $94
            DB    $A8
            DB    $A2
            DB    $84
            DB    $88
            DB    $C4
            DB    $80
            DB    $94
            DB    $88
            DB    $A2
            DB    $84
            DB    $88
            DB    $C4
            DB    $A0
            DB    $C4
            DB    $88
            DB    $8A
            DB    $D4
            DB    $A0
            DB    $81
            DB    $8A
            DB    $C4
            DB    $A8
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L4929       DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $02
            DB    $08
            DB    $D1
            DB    $80
            DB    $90
            DB    $82
            DB    $90
            DB    $82
            DB    $90
            DB    $82
            DB    $90
            DB    $82
            DB    $90
            DB    $82
            DB    $D1
            DB    $80
            DB    $00
            DB    $00
L4949       DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $03
            DB    $08
            DB    $8A
            DB    $C4
            DB    $80
            DB    $A2
            DB    $C4
            DB    $80
            DB    $A2
            DB    $C4
            DB    $80
            DB    $8A
            DB    $90
            DB    $80
            DB    $A2
            DB    $90
            DB    $80
            DB    $A2
            DB    $90
            DB    $80
            DB    $8A
            DB    $90
            DB    $80
            DB    $00
            DB    $00
            DB    $00
L4971       DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $08
            DB    $08
            DB    $94
            DB    $A8
            DB    $80
            DB    $A2
            DB    $85
            DB    $8A
            DB    $D4
            DB    $80
            DB    $C1
            DB    $88
            DB    $81
            DB    $A2
            DB    $C0
            DB    $A0
            DB    $90
            DB    $80
            DB    $C1
            DB    $88
            DB    $81
            DB    $A2
            DB    $C0
            DB    $80
            DB    $90
            DB    $80
            DB    $C1
            DB    $A8
            DB    $80
            DB    $A2
            DB    $C1
            DB    $80
            DB    $90
            DB    $80
            DB    $C1
            DB    $88
            DB    $81
            DB    $A2
            DB    $C0
            DB    $80
            DB    $90
            DB    $80
            DB    $C1
            DB    $88
            DB    $91
            DB    $A2
            DB    $C0
            DB    $A0
            DB    $90
            DB    $80
            DB    $94
            DB    $A8
            DB    $C0
            DB    $A0
            DB    $85
            DB    $8A
            DB    $90
            DB    $80
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L49C1       DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $08
            DB    $08
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00

*-----------------------

L4A11       LDA   #$0E
            STA   $9B
L4A15       LDY   $9B
            LDA   tblHGRL,Y
            STA   $84
            LDA   tblHGRH,Y
            STA   $85
            LDY   #$10
            LDA   #$80
L4A25       STA   ($84),Y
            INY
            CPY   #$18
            BNE   L4A25
            INC   $9B
            LDA   $9B
            CMP   #$3B
            BNE   L4A15
            LDX   #$00
L4A36       LDY   L4A52,X
            BEQ   L4A51
            LDA   tblHGRL,Y
            STA   $84
            LDA   tblHGRH,Y
            STA   $85
            LDY   L4AED,X
            LDA   L4B87,X
            STA   ($84),Y
            INX
            JMP   L4A36
L4A51       RTS

*-----------------------

L4A52       DB    $0E
            DB    $0F
            DB    $0F
            DB    $10
            DB    $11
            DB    $12
            DB    $13
            DB    $14
            DB    $15
            DB    $16
            DB    $16
            DB    $17
            DB    $17
            DB    $18
            DB    $18
            DB    $19
            DB    $19
            DB    $1A
            DB    $1A
            DB    $1B
            DB    $1B
            DB    $1C
            DB    $1C
            DB    $1D
            DB    $1D
            DB    $1E
            DB    $1E
            DB    $1E
            DB    $1F
            DB    $1F
            DB    $1F
            DB    $20
            DB    $20
            DB    $21
            DB    $21
            DB    $22
            DB    $22
            DB    $23
            DB    $23
            DB    $24
            DB    $24
            DB    $0E
            DB    $12
            DB    $17
            DB    $18
            DB    $24
            DB    $23
            DB    $22
            DB    $21
            DB    $20
            DB    $1F
            DB    $1E
            DB    $1D
            DB    $1D
            DB    $1C
            DB    $1B
            DB    $1A
            DB    $19
            DB    $18
            DB    $17
            DB    $16
            DB    $15
            DB    $14
            DB    $13
            DB    $12
            DB    $12
            DB    $11
            DB    $10
            DB    $0F
            DB    $0F
            DB    $17
            DB    $18
            DB    $18
            DB    $19
            DB    $19
            DB    $1A
            DB    $1A
            DB    $1B
            DB    $1C
            DB    $1D
            DB    $1E
            DB    $1F
            DB    $20
            DB    $21
            DB    $22
            DB    $23
            DB    $24
            DB    $25
            DB    $26
            DB    $27
            DB    $28
            DB    $29
            DB    $2A
            DB    $2B
            DB    $2C
            DB    $2D
            DB    $2E
            DB    $2F
            DB    $30
            DB    $31
            DB    $31
            DB    $32
            DB    $32
            DB    $33
            DB    $34
            DB    $35
            DB    $36
            DB    $37
            DB    $38
            DB    $39
            DB    $39
            DB    $36
            DB    $3A
            DB    $3A
            DB    $39
            DB    $39
            DB    $38
            DB    $37
            DB    $36
            DB    $36
            DB    $35
            DB    $34
            DB    $33
            DB    $32
            DB    $31
            DB    $30
            DB    $30
            DB    $2F
            DB    $2F
            DB    $2E
            DB    $2E
            DB    $2D
            DB    $2C
            DB    $2B
            DB    $2A
            DB    $29
            DB    $28
            DB    $27
            DB    $26
            DB    $25
            DB    $0C
            DB    $0D
            DB    $3B
            DB    $3C
            DB    $0C
            DB    $0D
            DB    $23
            DB    $24
            DB    $25
            DB    $3B
            DB    $3C
            DB    $23
            DB    $24
            DB    $25
            DB    $00
L4AED       DB    $13
            DB    $12
            DB    $13
            DB    $12
            DB    $12
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $10
            DB    $11
            DB    $10
            DB    $11
            DB    $10
            DB    $11
            DB    $10
            DB    $12
            DB    $10
            DB    $12
            DB    $10
            DB    $12
            DB    $10
            DB    $12
            DB    $10
            DB    $12
            DB    $10
            DB    $12
            DB    $13
            DB    $10
            DB    $12
            DB    $13
            DB    $10
            DB    $13
            DB    $10
            DB    $13
            DB    $10
            DB    $13
            DB    $10
            DB    $13
            DB    $10
            DB    $13
            DB    $14
            DB    $12
            DB    $12
            DB    $12
            DB    $14
            DB    $14
            DB    $14
            DB    $14
            DB    $14
            DB    $14
            DB    $14
            DB    $14
            DB    $15
            DB    $15
            DB    $15
            DB    $15
            DB    $15
            DB    $15
            DB    $15
            DB    $16
            DB    $16
            DB    $16
            DB    $16
            DB    $15
            DB    $16
            DB    $15
            DB    $15
            DB    $14
            DB    $15
            DB    $16
            DB    $16
            DB    $17
            DB    $16
            DB    $17
            DB    $16
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $11
            DB    $10
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $11
            DB    $12
            DB    $12
            DB    $12
            DB    $13
            DB    $12
            DB    $13
            DB    $14
            DB    $14
            DB    $15
            DB    $15
            DB    $15
            DB    $15
            DB    $16
            DB    $16
            DB    $16
            DB    $16
            DB    $16
            DB    $16
            DB    $16
            DB    $17
            DB    $16
            DB    $17
            DB    $16
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $17
            DB    $13
            DB    $13
            DB    $13
            DB    $13
            DB    $14
            DB    $14
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $14
            DB    $14
            DB    $18
            DB    $18
            DB    $18
L4B87       DB    $D4
            DB    $A0
            DB    $81
            DB    $88
            DB    $82
            DB    $C0
            DB    $90
            DB    $84
            DB    $84
            DB    $80
            DB    $91
            DB    $80
            DB    $C1
            DB    $A0
            DB    $C0
            DB    $A0
            DB    $82
            DB    $A0
            DB    $82
            DB    $88
            DB    $88
            DB    $88
            DB    $88
            DB    $88
            DB    $A0
            DB    $88
            DB    $80
            DB    $81
            DB    $88
            DB    $80
            DB    $81
            DB    $82
            DB    $84
            DB    $82
            DB    $84
            DB    $82
            DB    $90
            DB    $82
            DB    $90
            DB    $82
            DB    $C0
            DB    $8A
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $82
            DB    $82
            DB    $88
            DB    $88
            DB    $A0
            DB    $A0
            DB    $80
            DB    $81
            DB    $84
            DB    $84
            DB    $90
            DB    $90
            DB    $C0
            DB    $C0
            DB    $A2
            DB    $88
            DB    $88
            DB    $82
            DB    $C0
            DB    $80
            DB    $90
            DB    $84
            DB    $A0
            DB    $81
            DB    $A0
            DB    $80
            DB    $81
            DB    $80
            DB    $81
            DB    $80
            DB    $81
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $D0
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $88
            DB    $88
            DB    $88
            DB    $88
            DB    $88
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $80
            DB    $81
            DB    $80
            DB    $81
            DB    $84
            DB    $84
            DB    $90
            DB    $C0
            DB    $82
            DB    $88
            DB    $A0
            DB    $81
            DB    $80
            DB    $D4
            DB    $8A
            DB    $A0
            DB    $81
            DB    $84
            DB    $90
            DB    $C0
            DB    $80
            DB    $82
            DB    $88
            DB    $88
            DB    $A0
            DB    $A0
            DB    $80
            DB    $81
            DB    $80
            DB    $81
            DB    $80
            DB    $81
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $C0
            DB    $C0
            DB    $C0
            DB    $C0
            DB    $80
            DB    $80
            DB    $80
            DB    $C0
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
L4C21       DB    $A0
L4C22       DB    $A0
L4C23       DB    $A0
L4C24       DB    $A0
L4C25       DB    $A0
L4C26       DB    $C6
L4C27       DB    $C1
L4C28       DB    $A0
L4C29       DB    $A0
L4C2A       DB    $A0
L4C2B       DB    $A0
L4C2C       DB    $D3
L4C2D       DB    $C3
L4C2E       DB    $CC
L4C2F       DB    $C1
L4C30       DB    $AC
            DB    $21
            DB    $4C
            DB    $C0
            DB    $05
            DB    $B0
            DB    $01
            DB    $60
            DB    $85
            DB    $9B
            DB    $B9
            DB    $45
            DB    $4C
            DB    $85
            DB    $9C
            DB    $20
            DB    $15
            DB    $09
            DB    $A5
            DB    $9D
            DB    $60
L4C45       DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FE
            DB    $FE
            DB    $FE
            DB    $FD
            DB    $FD
            DB    $FC
            DB    $FC
            DB    $FB
            DB    $FA
            DB    $FA
            DB    $F9
            DB    $F8
            DB    $F7
            DB    $F6
            DB    $F6
            DB    $F5
            DB    $F4
            DB    $F3
            DB    $F2
            DB    $F1
            DB    $EF
            DB    $EE
            DB    $ED
            DB    $EC
            DB    $EB
            DB    $E9
            DB    $E8
            DB    $E7
            DB    $E5
            DB    $E4
            DB    $E2
            DB    $E1
            DB    $DF
            DB    $DE
            DB    $DC
            DB    $DA
            DB    $D9
            DB    $D7
            DB    $D5
            DB    $D4
            DB    $D2
            DB    $D0
            DB    $CE
            DB    $CC
            DB    $CA
            DB    $C8
            DB    $C6
            DB    $C4
            DB    $C2
            DB    $C0
            DB    $BE
            DB    $BC
            DB    $B9
            DB    $B7
            DB    $B5
            DB    $B3
            DB    $B0
            DB    $AE
            DB    $AC
            DB    $A9
            DB    $A7
            DB    $A5
            DB    $A2
            DB    $A0
            DB    $9D
            DB    $9B
            DB    $98
            DB    $95
            DB    $93
            DB    $90
            DB    $8E
            DB    $8B
            DB    $88
            DB    $85
            DB    $83
            DB    $80
            DB    $7D
            DB    $7A
            DB    $78
            DB    $75
            DB    $72
            DB    $6F
            DB    $6C
            DB    $69
            DB    $66
            DB    $63
            DB    $60
            DB    $5E
            DB    $5B
            DB    $58
            DB    $55
            DB    $52
            DB    $4F
            DB    $4B
            DB    $48
            DB    $45
            DB    $42
            DB    $3F
            DB    $3C
            DB    $39
            DB    $36
            DB    $33
            DB    $30
            DB    $2C
            DB    $29
            DB    $26
            DB    $23
            DB    $20
            DB    $1D
            DB    $19
            DB    $16
            DB    $13
            DB    $10
            DB    $0D
            DB    $0A
            DB    $06
            DB    $03
            DB    $00

*-----------------------

L4CC4       LDA   $D7
            STA   $9B
            LDA   $D8
            STA   $9C
            LDX   #$00
L4CCE       SEC
            LDA   $9B
            SBC   #$7E
            STA   $9B
            LDA   $9C
            SBC   #$00
            STA   $9C
            BCC   L4CE0
            INX
            BNE   L4CCE
L4CE0       LDA   L4E0F,X
            STA   L4C2D
            LDA   L4E13,X
            STA   L4C2C
            CPX   #$00
            BNE   L4D00
            SEC
            LDA   #$7E
            SBC   $D7
            STA   L4C23
            LDA   $D7
            STA   L4C22
            JMP   L4D3E

L4D00       CPX   #$01
            BNE   L4D17
            SEC
            LDA   $D7
            SBC   #$7E
            STA   L4C23
            SEC
            LDA   #$FC
            SBC   $D7
            STA   L4C22
            JMP   L4D3E

L4D17       CPX   #$02
            BNE   L4D2E
            SEC
            LDA   #$7A
            SBC   $D7
            STA   L4C23
            SEC
            LDA   $D7
            SBC   #$FC
            STA   L4C22
            JMP   L4D3E

L4D2E       SEC
            LDA   $D7
            SBC   #$7A
            STA   L4C23
            SEC
            LDA   #$FB
            SBC   $D7
            STA   L4C22
L4D3E       LDA   L4C23
            STA   L4C21
            LDA   L5670
            JSR   L4C30
            STA   L4C28
            LDA   #$00
            EOR   L5671
            EOR   L4C2D
            STA   L4C2A
            LDA   L4C22
            STA   L4C21
            LDA   L5673
            JSR   L4C30
            STA   L4C29
            LDA   #$00
            EOR   L5674
            EOR   L4C2C
            STA   L4C2B
            JSR   L4E17
            LDA   L4C28
            STA   L4C25
            LDA   L4C29
            STA   L4C27
            LDA   L4C22
            STA   L4C21
            LDA   L5670
            JSR   L4C30
            STA   L4C28
            LDA   #$00
            EOR   L5671
            EOR   L4C2C
            STA   L4C2A
            LDA   L4C23
            STA   L4C21
            LDA   L5673
            JSR   L4C30
            STA   L4C29
            LDA   #$01
            EOR   L5674
            EOR   L4C2D
            STA   L4C2B
            JSR   L4E17
            LDA   L4C28
            STA   L4C24
            LDA   L4C29
            STA   L4C26
            LDA   L4C24
            CMP   L4C25
            BCS   L4DEC
            LSR
            CLC
            ADC   L4C25
            CMP   #$72
            BCS   L4DD9
            LDA   #$FF
            BNE   L4DDB
L4DD9       LDA   #$00
L4DDB       STA   $9B
            LDA   L4C27
            BNE   L4DE7
            LDA   #$08
            STA   $B6
            RTS

L4DE7       LDA   #$01
            STA   $B6
            RTS

L4DEC       LDA   L4C25
            LSR
            CLC
            ADC   L4C24
            CMP   #$72
            BCS   L4DFC
            LDA   #$FF
            BNE   L4DFE
L4DFC       LDA   #$00
L4DFE       STA   $9B
            LDA   L4C26
            BNE   L4E0A
            LDA   #$02
            STA   $B6
            RTS

L4E0A       LDA   #$04
            STA   $B6
            RTS

L4E0F       DB    $00
            DB    $00
            DB    $01
            DB    $01
L4E13       DB    $00
            DB    $01
            DB    $01
            DB    $00

L4E17       LDA   L4C2A
            CMP   L4C2B
            BNE   L4E30
            CLC
            LDA   L4C28
            ADC   L4C29
            STA   L4C28
            LDA   L4C2A
            STA   L4C29
            RTS

L4E30       LDA   L4C28
            CMP   L4C29
            BEQ   L4E5C
            BCC   L4E4B
            SEC
            LDA   L4C28
            SBC   L4C29
            STA   L4C28
            LDA   L4C2A
            STA   L4C29
            RTS

L4E4B       SEC
            LDA   L4C29
            SBC   L4C28
            STA   L4C28
            LDA   L4C2B
            STA   L4C29
            RTS

L4E5C       LDA   #$00
            STA   L4C28
            STA   L4C29
            RTS

L4E65       LDA   L6D5D
            BNE   L4E6B
            RTS

L4E6B       LDA   $DF
            BEQ   L4E72
            JSR   L4EDA
L4E72       JSR   L4CC4
            LDA   $9B
            CMP   $DF
            STA   $DF
            BEQ   L4E87
            CMP   #$FF
            BNE   L4E8B
            JSR   L784E
            JMP   L4E8C

L4E87       CMP   #$FF
            BEQ   L4E8C
L4E8B       RTS

L4E8C       LDA   L4C25
            CLC
            ADC   #$03
            STA   $9B
            LDA   #$2D
            STA   $9C
            JSR   L0915
            LDA   L4C27
            BEQ   L4EAB
            CLC
            LDA   $9D
            ADC   #$24
            STA   L4C2E
            JMP   L4EB3

L4EAB       SEC
            LDA   #$24
            SBC   $9D
            STA   L4C2E
L4EB3       LDA   L4C24
            CLC
            ADC   #$02
            STA   $9B
            LDA   #$36
            STA   $9C
            JSR   L0915
            LDA   L4C26
            BNE   L4ED2
            CLC
            LDA   #$8B
            ADC   $9D
            STA   L4C2F
            JMP   L4EDA

L4ED2       SEC
            LDA   #$8B
            SBC   $9D
            STA   L4C2F
L4EDA       LDY   L4C2E
            LDA   tblHGRL,Y
            STA   $84
            LDA   tblHGRH,Y
            STA   $85
            LDA   L4C2F
            STA   $9F
            LDA   #$07
            STA   $9B
            LDA   #$00
            STA   $9C
            STA   $9D
            STA   $9E
            STA   $A0
            JSR   L08A6
            LDA   $9D
            TAY
            LDA   $9F
            TAX
            LDA   L4F0B,X
            EOR   ($84),Y
            STA   ($84),Y
            RTS

L4F0B       DB    $01
            DB    $02
            DB    $04
            DB    $08
            DB    $10
            DB    $20
            DB    $40

L4F12       LDA   $DF
            BEQ   L4F1D
            JSR   L4EDA
            LDA   #$00
            STA   $DF
L4F1D       RTS

L4F1E       STA   $9B
            STA   $9D
            STX   $9C
            LDX   #$00
L4F26       SEC
            LDA   $9B
            SBC   #$7E
            STA   $9B
            LDA   $9C
            SBC   #$00
            STA   $9C
            BCC   L4F38
            INX
            BNE   L4F26
L4F38       LDA   L4E0F,X
            STA   L4C2D
            LDA   L4E13,X
            STA   L4C2C
            CPX   #$00
            BNE   L4F5C
            LDA   #$7E
            SBC   $9D
            TAY
            LDA   L4C45,Y
            STA   L4C23
            LDY   $9D
            LDA   L4C45,Y
            STA   L4C22
            RTS

L4F5C       CPX   #$01
            BNE   L4F79
            SEC
            LDA   $9D
            SBC   #$7E
            TAY
            LDA   L4C45,Y
            STA   L4C23
            SEC
            LDA   #$FC
            SBC   $9D
            TAY
            LDA   L4C45,Y
            STA   L4C22
            RTS

L4F79       CPX   #$02
            BNE   L4F96
            SEC
            LDA   #$7A
            SBC   $9D
            TAY
            LDA   L4C45,Y
            STA   L4C23
            SEC
            LDA   $9D
            SBC   #$FC
            TAY
            LDA   L4C45,Y
            STA   L4C22
            RTS

L4F96       SEC
            LDA   $9D
            SBC   #$7A
            TAY
            LDA   L4C45,Y
            STA   L4C23
            SEC
            LDA   #$F8
            SBC   $9D
            TAY
            LDA   L4C45,Y
            STA   L4C22
            RTS

*-----------------------

L4FAF       DA    L4639
            DA    L460D
            DA    L45E1
            DA    L45B5
            DA    L4589
            DA    L455D
            DA    L4535
            DA    L4509

L4FBF       DB    $00

*-----------------------

L4FC0       DEC   L4FBF
            BPL   L4FCA
            LDA   #$07
            STA   L4FBF
L4FCA       LDA   L4FBF
            ASL
            TAX
            LDA   L4FAF,X
            STA   L5063
            STA   L508D
            INX
            LDA   L4FAF,X
            STA   L5063+1
            STA   L508D+1
            LDA   #$18
            STA   $9B
            LDA   #$00
            STA   $9C
            STA   $9D
            STA   $9E
            LDA   $AF
            STA   $9F
            LDA   $B0
            STA   $A0
            JSR   L08A6
            LDA   $9F
            STA   $B1
            SEC
            LDA   #$17
            SBC   $9D
            ASL
            STA   $A8
            LDA   #$07
            STA   $A1
L5009       LDY   $A8
            LDA   L5063,Y
            STA   ptrSTRING
            INY
            LDA   L5063,Y
            STA   ptrSTRING+1
            INY
            STY   $A8
            LDY   #$00
L501B       LDA   (ptrSTRING),Y
            BMI   L5047
            CLC
            ADC   $B1
            STA   X1
            INY
            LDA   (ptrSTRING),Y
            CLC
            ADC   #$54
            STA   Y1
            INY
            LDA   (ptrSTRING),Y
            CLC
            ADC   $B1
            STA   X2
            INY
            LDA   (ptrSTRING),Y
            CLC
            ADC   #$54
            STA   Y2
            INY
            STY   $96
            JSR   drawLINE
            LDY   $96
            JMP   L501B

L5047       CLC
            LDA   #$18
            ADC   $B1
            STA   $B1
            DEC   $A1
            BPL   L5009
            LDX   #$78
            LDA   tblPAGE2L,X
            STA   $84
            LDA   tblPAGE2H,X
            STA   $84+1
            LDY   #$27
            JMP   L7B00

L5063       DA    L4509
            DA    L4675
            DA    L4669
            DA    L4681
            DA    L46B9
            DA    L46AD
            DA    L469D
            DA    L46A5
            DA    L4665
            DA    L46C5
            DA    L469D
            DA    L46B9
            DA    L46AD
            DA    L4681
            DA    L46A5
            DA    L469D
            DA    L46A5
            DA    L4665
            DA    L469D
            DA    L4691
            DA    L4665
L508D       DA    L4509
            DA    L4675
            DA    L4669
            DA    L4681
            DA    L46B9
            DA    L46AD
            DA    L469D
            DA    L46A5
            DA    L4665
            DA    L46C5

*-----------------------

L50A1       JSR   L57C5
            BEQ   L50E6
            LDA   $C0
            CMP   #$03
            BEQ   L50C2
            CMP   #$04
            BEQ   L50C2
            CMP   #$01
            BEQ   L50C2
            CMP   #$06
            BEQ   L50C2
            CMP   #$02
            BEQ   L50C2
            CMP   #$05
            BEQ   L50C2
            BNE   L50CB
L50C2       LDA   $A2
            CMP   #$13
            BCS   L50CB
            JMP   L8201

L50CB       LDA   $C0
            ASL
            TAX
            LDA   L50E7,X
            STA   $80
            LDA   L50E7+1,X
            STA   $80+1
            LDA   L5107,X
            STA   $86
            LDA   L5107+1,X
            STA   $86+1
            JSR   L533A
L50E6       RTS

L50E7       DA    L5A95
            DA    L5AC7
            DA    L5A63
            DA    L59FF
            DA    L5A31
            DA    L5AF9
            DA    L5A95
            DA    L5B2B
            DA    L5B5D
            DA    L5B5D
            DA    L5B8F
            DA    L5BC1
            DA    L5BF3
            DA    L5B2B
            DA    L5C25
            DA    L5C25
L5107       DA    L5C31
            DA    L1C22
            DA    L5ED3
            DA    L1EE5
            DA    L426C
            DA    L60A1
            DA    L5C31
            DA    L6B85
            DA    L61F1
            DA    L61F1
            DA    L629D
            DA    L634B
            DA    L4000
            DA    L6B85
            DA    L6B9D
            DA    L6B9D

*-----------------------

makePAGE2
            LDY   #>LA000
            LDA   #<LA000
            LDX   #$00
L512D       PHA
            STA   tblPAGE2L,X
            TYA
            STA   tblPAGE2H,X
            PLA
            INX
            CPX   #$C1
            BEQ   L5143
            CLC
            ADC   #$28
            BCC   L512D
            INY
            BCS   L512D
L5143       RTS

*-----------------------

clearPAGE2  LDX   #$C0	; get each pointer
L5146       LDA   tblPAGE2L,X
            STA   $84
            LDA   tblPAGE2H,X
            STA   $84+1
            LDA   #$00	; clear line
            NOP
            NOP
            LDY   #$27
L5156       STA   ($84),Y
            DEY
            BPL   L5156
            DEX
            BNE   L5146
            RTS

*-----------------------
* Draw the last point with sound

L515F       DB    $00

L5160       LDA   fgSOUND
            BEQ   L5181
            LDA   L6E21
            BEQ   L516F
            CMP   #$02
            BNE   L516F
            BEQ   L517E
L516F       LDA   L6F9C
            BEQ   L5181
            INC   L515F
            LDA   L515F
            ROR
            ROR
            BCS   L5181

L517E       LDA   SPKR
L5181       CPY   #$22
            BCC   L51B1
            CPX   #$AC
            BCS   L51B1
            CPY   #$AE
            BCS   L51B1

L518D       LDA   tblPAGE2L,X
            STA   $84
L5192       LDA   tblPAGE2H,X
            STA   $84+1
            TYA
            TAX
            LDY   tblXBYT,X
            LDA   tblXBIT,X
            TAX
            LDA   tblBITON,X
            ORA   ($84),Y
            STA   ($84),Y
            LDA   tblBITON2,X
            BMI   L51B1
            INY
            ORA   ($84),Y
            STA   ($84),Y
L51B1       RTS

*-----------------------
* Welcome to Bresenham...

drawLINE
            LDA   fgOFFLIMIT	; check limits?
            BEQ   L51CC	; no
            LDA   #$AC	; yes, for Y1/Y2
            CMP   Y1	; 172
            BCS   L51C1
            CMP   Y2
            BCS   L51C1
            RTS

L51C1       LDA   #$38	; yes, for X1/X2
            CMP   Y1	; 56
            BCC   L51CC
            CMP   Y2
            BCC   L51CC
            RTS

* Check if clipping is required

L51CC       LDA   Y1
            CMP   #$AC	; 172
            BCS   L51F2
            LDA   Y2
            CMP   #$AC	; 172
            BCS   L51F2
            LDA   X1
            CMP   #$22	; 34
            BCC   L51F2
            CMP   #$AE	; 174
            BCS   L51F2
            LDA   X2
            CMP   #$22	; 34
            BCC   L51F2
            CMP   #$AE	; 174
            BCS   L51F2
            LDA   #$00	; coords in limit
            STA   fgCLIPPING
            BEQ   L51F6
L51F2       LDA   #$FF	; drawing to be clipped
            STA   fgCLIPPING

* Calculate delta X

L51F6       SEC
            LDA   X2
            SBC   X1
            BCS   L5201
            EOR   #$FF
            ADC   #$01
L5201       STA   deltaX

* Calculate delta Y

            SEC
            LDA   Y2
            SBC   Y1
            BCS   L520E
            EOR   #$FF
            ADC   #$01
L520E       STA   deltaY

* Calculate error for X

            LDY   #$FF	; X2<X1 = -1
            LDA   X2	; X2=X1 = 0
            SEC	; X2>X1 = 1
            CMP   X1
            BCC   L521D
            BEQ   L521C
            INY
L521C       INY
L521D       STY   errX

* Calculate error for Y

            LDY   #$FF	; Y2<Y1 = -1
            LDA   Y2	; Y2=Y1 = 0
            SEC	; Y2>Y1 = 1
            CMP   Y1
            BCC   L522C
            BEQ   L522B
            INY
L522B       INY
L522C       STY   errY

* Is the line more horizontal than vertical?

            SEC
            LDA   deltaX
            CMP   deltaY
            BCS   L5238	; yes
            JMP   L52B9	; no

* Draw an horizontal line
* in Y, we have X
* in X, we have Y
* because of the 6502 :-)

L5238       LDA   #$00
            STA   errVALUE
L523C       LDX   Y1
            LDY   X1
            LDA   fgCLIPPING ; clipping needed?
            BEQ   L5250	; no
            CPX   #$AC	; yes, clipping cases...
            BCS   L5274
            CPY   #$22
            BCC   L5274
            CPY   #$AE
            BCS   L5274

L5250       LDA   tblPAGE2L,X	; get line
            STA   $84
L5255       LDA   tblPAGE2H,X
            STA   $84+1
            TYA		; X-coord
            TAX
            LDY   tblXBYT,X	; get the RAM column
            LDA   tblXBIT,X	; get the bit in byte
            TAX
            LDA   tblBITON,X
            ORA   ($84),Y
            STA   ($84),Y
            LDA   tblBITON2,X
            BMI   L5274
            INY
            ORA   ($84),Y
            STA   ($84),Y

L5274       LDX   Y1
            LDY   X1
            CPX   #$78		; this is line 120...
            BNE   L5288
            CPY   $E9		; is X<@E9 (0) on entry
            BCC   L5282
            STY   $E9		; save new value
L5282       CPY   $E8		; does it exceed the rightmost value as well?
            BCS   L5288
            STY   $E8		; save it

L5288       CLC		; now, add the error
            LDA   errX		; check if we're done?
            ADC   X1
            STA   X1
            CMP   X2		; we must draw the last
            BEQ   L52B2		; point in "music"

            CLC		; add errors
            LDA   deltaY
            ADC   errVALUE
            STA   errVALUE
            LDA   deltaX
            CMP   errVALUE
            BCS   L523C
            SEC		; correct the error
            LDA   errVALUE
            SBC   deltaX
            STA   errVALUE

            CLC		; next line
            LDA   errY
            ADC   Y1
            STA   Y1
            BNE   L523C
            BEQ   L523C

L52B2       LDX   Y1		; and loop
            LDY   X1
            JMP   L5160

* Draw a vertical line

L52B9       LDA   #$00		; same routine as above
            STA   errVALUE	; but the error is higher
L52BD       LDY   X1		; in vertical than in horizontal
            LDX   Y1
            LDA   fgCLIPPING
            BEQ   L52D1
            CPX   #$AC
            BCS   L52F5
            CPY   #$22
            BCC   L52F5
            CPY   #$AE
            BCS   L52F5
L52D1       LDA   tblPAGE2L,X
            STA   $84
L52D6       LDA   tblPAGE2H,X
            STA   $84+1
            TYA
            TAX
            LDY   tblXBYT,X
            LDA   tblXBIT,X
            TAX
            LDA   tblBITON,X
            ORA   ($84),Y
            STA   ($84),Y
            LDA   tblBITON2,X
            BMI   L52F5
            INY
            ORA   ($84),Y
            STA   ($84),Y
L52F5       LDX   Y1
            LDY   X1
            CPX   #$78
            BNE   L5309
            CPY   $E9
            BCC   L5303
            STY   $E9
L5303       CPY   $E8
            BCS   L5309
            STY   $E8
L5309       CLC
            LDA   errY
            ADC   Y1
            STA   Y1
            CMP   Y2
            BEQ   L5333
            CLC
            LDA   errVALUE
            ADC   deltaX
            STA   errVALUE
            LDA   deltaY
            CMP   errVALUE
            BCS   L52BD
            SEC
            LDA   errVALUE
            SBC   deltaY
            STA   errVALUE
            CLC
            LDA   errX
            ADC   X1
            STA   X1
            BNE   L52BD
            BEQ   L52BD

L5333       LDX   Y1		; draw the last
            LDY   X1		; point in music
            JMP   L5160

*-----------------------

L533A       LDX   $C0
            LDA   $A3
            CPX   #$07
            BNE   L5344
            STA   $E5
L5344       CPX   #$0D
            BNE   L534A
            STA   $E6
L534A       CPX   #$01
            BEQ   L5352
            CPX   #$06
            BNE   L5354
L5352       STA   $E7
L5354       LDY   $CE
            LDA   ($80),Y
            STA   ptrSTRING
            INY
            LDA   ($80),Y
            STA   ptrSTRING+1
            JSR   L537C
            LDY   #$00
            STY   $96
L5366       LDY   $96
            LDA   (ptrSTRING),Y
            STA   X1
            INY
            LDA   (ptrSTRING),Y
            STA   Y1
            CMP   #$FF
            BNE   L539C
            CMP   X1
            BNE   L539C
            JMP   L542E

L537C       LDA   $C0
            CMP   #$0E
            BNE   L5388
            LDA   L69B2
            JMP   L538F

L5388       CMP   #$0F
            BNE   L539B
            LDA   L7B67
L538F       ASL
            TAX
            LDA   L5C25,X
            STA   ptrSTRING
            LDA   L5C26,X
            STA   ptrSTRING+1
L539B       RTS

L539C       LDA   $A5
            BEQ   L53A7
            SEC
            LDA   #$00
            SBC   X1
            STA   X1
L53A7       LDA   X1
            BMI   L53C4
            STA   $9B
            LDA   $A2
            STA   $9C
            JSR   L090A
            CLC
            LDA   $A3
            ADC   $9D
            CMP   $A3
            BCS   L53BF
            LDA   #$BE
L53BF       STA   X1
            JMP   L53DD

L53C4       SEC
            LDA   #$00
            SBC   X1
            STA   $9B
            LDA   $A2
            STA   $9C
            JSR   L090A
            SEC
            LDA   $A3
            SBC   $9D
            BCS   L53DB
            LDA   #$00
L53DB       STA   X1
L53DD       CLC
            LDA   #$78
            ADC   $C7
            SEC
            SBC   Y1
            BCC   L53FF
            LDA   Y1
            STA   $9B
            LDA   $A2
            STA   $9C
            JSR   L090A
            CLC
            LDA   $C7
            ADC   #$78
            CLC
            ADC   $9D
            STA   Y1
            JMP   L541B

L53FF       SEC
            LDA   #$00
            SBC   Y1
            STA   $9B
            LDA   $A2
            STA   $9C
            JSR   L090A
            CLC
            LDA   $C7
            ADC   #$78
            SEC
            SBC   $9D
            BCS   L5419
            LDA   #$00
L5419       STA   Y1
L541B       LDY   $96
            LDA   X1
            STA   L9C82,Y
            LDA   Y1
            STA   L9C82+1,Y
            INC   $96
            INC   $96
            JMP   L5366

L542E       LDX   #$00
            LDY   #$00
            STY   $96
L5434       LDY   $96
            LDA   ($86),Y
            CMP   #$FF
            BNE   L543F
            JMP   L546A

L543F       TAY
            LDA   L9C82,Y
            STA   L9D81,X
            INY
            INX
            LDA   L9C82,Y
            STA   L9D81,X
            INX
            INC   $96
            LDY   $96
            LDA   ($86),Y
            TAY
            LDA   L9C82,Y
            STA   L9D81,X
            INY
            INX
            LDA   L9C82,Y
            STA   L9D81,X
            INX
            INC   $96
            JMP   L5434

L546A       LDA   $A3
            STA   $E9
            STA   $E8
            LDA   #$FF	; ends the list of points to draw
            STA   L9D81,X
            INX
            STA   L9D81,X
            INX
            STA   L9D81,X
            INX
            STA   L9D81,X
            LDX   #$00
            STX   $A0
L5485       LDX   $A0
            LDA   L9D81,X
            CMP   #$FF
            BNE   L54A3
            LDA   $E9
            CMP   $A3
            BNE   L5496
            LDA   #$AE
L5496       STA   $C3
            LDA   $E8
            CMP   $A3
            BNE   L54A0
            LDA   #$22
L54A0       STA   $C6
            RTS

L54A3       STA   X1
            INX
            LDA   L9D81,X
            STA   Y1
            INX
            LDA   L9D81,X
            STA   X2
            INX
            LDA   L9D81,X
            STA   Y2
            INX
            STX   $A0
            LDA   $A3
            CMP   #$C0
            BCS   L54C3
            JSR   drawLINE
L54C3       JMP   L5485

L54C6       DB    $00

L54C7       LDA   L54C6
            BNE   L550F
            LDX   #$48
            INX
L54CF       CLC
            LDA   tblHGRL,X
            ADC   #$02
            STA   L54FC+1
            LDA   tblHGRH,X
            ADC   #$00
            STA   L54FC+2
            CLC
            LDA   tblPAGE2L,X
            ADC   #$02
            STA   L54F9+1
            STA   L5503+1
            LDA   tblPAGE2H,X
            ADC   #$00
            STA   L54F9+2
            STA   L5503+2
            LDY   #$23
L54F9       LDA   $E000,Y
L54FC       STA   $E000,Y
            BEQ   L5506
            LDA   #$00
L5503       STA   $E000,Y
L5506       DEY
            BPL   L54F9
            INX
            CPX   #$AD
            BNE   L54CF
            RTS

L550F       LDA   #$00
            STA   L54C6
            LDX   #$38
L5516       LDA   tblPAGE2L,X
            STA   $9B
            LDA   tblPAGE2H,X
            STA   $9C
            LDY   #$25
            LDA   #$00
L5524       STA   ($9B),Y
            DEY
            BPL   L5524
            INX
            CPX   #$4A
            BNE   L5516
            LDX   #$48
            INX
L5531       CLC
            LDA   tblHGRL,X
            ADC   #$02
            STA   L555E+1
            LDA   tblHGRH,X
            ADC   #$00
            STA   L555E+2
            CLC
            LDA   tblPAGE2L-4,X
            ADC   #$02
            STA   L555B+1
            STA   L5565+1
            LDA   tblPAGE2H-4,X
            ADC   #$00
            STA   L555B+2
            STA   L5565+2
            LDY   #$23
L555B       LDA   $E000,Y
L555E       STA   $E000,Y
            BEQ   L5568
            LDA   #$00
L5565       STA   $E000,Y
L5568       DEY
            BPL   L555B
            TXA
            AND   #$03
            BNE   L5577
            LDA   fgSOUND
            BEQ   L5577
            LDA   SPKR
L5577       INX
            CPX   #$AD
            BNE   L5531
            LDX   #$A8
L557E       LDA   tblPAGE2L,X
            STA   $9B
            LDA   tblPAGE2H,X
            STA   $9C
            LDY   #$25
            LDA   #$00
L558C       STA   ($9B),Y
            DEY
            BPL   L558C
            INX
            CPX   #$AD
            BNE   L557E
            RTS

L5597       LDA   L5673
            ORA   L5672
            BEQ   L55EB
            LDA   L5673
            LDA   L5670
            ORA   L566F
            BEQ   L55F0
            LDA   L5670
            CMP   L5673
            BNE   L55B7
            LDA   #$3F
            JMP   L5627

L55B7       BCC   L55F5
            LDA   L5673
            STA   $9D
            LDA   L5672
            STA   $A0
            LDA   #$00
            STA   $9F
            STA   $9E
            LDA   L5670
            STA   $9C
            LDA   L566F
            STA   $9B
            JSR   L08A6
            LDA   $9D
            LDX   #$3F
L55DA       CMP   L576B,X
            BEQ   L55E4
            BCC   L55E4
            DEX
            BNE   L55DA
L55E4       CLC
            TXA
            ADC   #$3F
            JMP   L5627

L55EB       LDA   #$7E
            JMP   L5627

L55F0       LDA   #$00
            JMP   L5627

L55F5       LDA   L5670
            STA   $9D
            LDA   L566F
            STA   $A0
            LDA   #$00
            STA   $9F
            STA   $9E
            LDA   L5673
            STA   $9C
            LDA   L5672
            STA   $9B
            JSR   L08A6
            LDA   $9D
            LDX   #$3F
L5616       CMP   L576B,X
            BEQ   L5620
            BCC   L5620
            DEX
            BNE   L5616
L5620       STX   $9D
            SEC
            LDA   #$3F
            SBC   $9D
L5627       STA   $A6
            LDA   #$00
            STA   $A7
            LDA   L5671
            ORA   L5674
            BEQ   L566E
            LDA   L5671
            AND   L5674
            BEQ   L5643
            LDY   #$00
            LDA   #$FC
            BNE   L5664
L5643       LDA   L5674
            BEQ   L5656
            SEC
            LDA   #$FC
            SBC   $A6
            STA   $A6
            LDA   #$00
            SBC   $A7
            STA   $A7
            RTS

L5656       SEC
            LDA   #$F8
            SBC   $A6
            STA   $A6
            LDA   #$01
            SBC   $A7
            STA   $A7
            RTS

L5664       CLC
            ADC   $A6
            STA   $A6
            TYA
            ADC   $A7
            STA   $A7
L566E       RTS

L566F       DB    $00
L5670       DB    $A0
L5671       DB    $D2
L5672       DB    $00
L5673       DB    $A0
L5674       DB    $A0

L5675       LDA   $C8
            LDX   $C9
            JSR   L4F1E
            LDA   L4C22
            STA   $9B
            LDA   #$00
            STA   $9C
            LDA   #$40
            PHA
            STA   $9D
            LDA   #$02
            PHA
            STA   $9E
            JSR   L08D9
            LDA   $9E
            STA   ptrSTRING
            LDA   $9B
            STA   ptrSTRING+1
            LDA   L4C23
            STA   $9B
            LDA   #$00
            STA   $9C
            PLA
            STA   $9E
            PLA
            STA   $9D
            JSR   L08D9
            LDX   $9E
            LDA   $9B
            STX   $9B
            STA   $9C
            LDA   L4C2C
            STA   L5674
            LDA   L4C2D
            STA   L5671
            LDA   L5671
            EOR   $CB
            BNE   L56EE
            LDA   #$00
            TAX
            TAY
L56CB       LDA   L6C6D,Y
            BEQ   L56E1
            SEC
            LDA   L6C6E,Y
            SBC   $9B
            STA   L6C6E,Y
            LDA   L6C6F,Y
            SBC   $9C
            STA   L6C6F,Y
L56E1       CLC
            TYA
            ADC   #$10
            TAY
            INX
            CPX   #$10
            BEQ   L5715
            JMP   L56CB

L56EE       LDA   #$00
            TAY
            TAX
L56F2       LDA   L6C6D,Y
            BEQ   L5708
            CLC
            LDA   L6C6E,Y
            ADC   $9B
            STA   L6C6E,Y
            LDA   L6C6F,Y
            ADC   $9C
            STA   L6C6F,Y
L5708       TYA
            CLC
            ADC   #$10
            TAY
            INX
            CPX   #$10
            BEQ   L5715
            JMP   L56F2

L5715       LDA   L5674
            EOR   $CB
            BNE   L5743
            LDA   #$00
            TAX
            TAY
L5720       LDA   L6C6D,Y
            BEQ   L5736
            SEC
            LDA   L6C71,Y
            SBC   ptrSTRING
            STA   L6C71,Y
            LDA   L6C72,Y
            SBC   ptrSTRING+1
            STA   L6C72,Y
L5736       CLC
            TYA
            ADC   #$10
            TAY
            INX
            CPX   #$10
            BEQ   L576A
            JMP   L5720

L5743       LDA   #$00
            TAY
            TAX
L5747       LDA   L6C6D,Y
            BEQ   L575D
            CLC
            LDA   L6C71,Y
            ADC   ptrSTRING
            STA   L6C71,Y
            LDA   L6C72,Y
            ADC   ptrSTRING+1
            STA   L6C72,Y
L575D       TYA
            CLC
            ADC   #$10
            TAY
            INX
            CPX   #$10
            BEQ   L576A
            JMP   L5747
L576A       RTS

L576B       DB    $FF
            DB    $F8
            DB    $F2
            DB    $EC
            DB    $E6
            DB    $E1
            DB    $DB
            DB    $D6
            DB    $D0
            DB    $CB
            DB    $C6
            DB    $C1
            DB    $BC
            DB    $B7
            DB    $B2
            DB    $AD
            DB    $A9
            DB    $A4
            DB    $A0
            DB    $9B
            DB    $97
            DB    $93
            DB    $8F
            DB    $8A
            DB    $86
            DB    $82
            DB    $7E
            DB    $7A
            DB    $76
            DB    $73
            DB    $6F
            DB    $6B
            DB    $67
            DB    $64
            DB    $60
            DB    $5C
            DB    $59
            DB    $55
            DB    $52
            DB    $4E
            DB    $4B
            DB    $47
            DB    $44
            DB    $41
            DB    $3D
            DB    $3A
            DB    $36
            DB    $33
            DB    $30
            DB    $2D
            DB    $29
            DB    $26
            DB    $23
            DB    $20
            DB    $1C
            DB    $19
            DB    $16
            DB    $13
            DB    $10
            DB    $0C
            DB    $09
            DB    $06
            DB    $03
            DB    $00
L57AB       DB    $00
L57AC       DB    $00
            DB    $30
            DB    $00
            DB    $60
            DB    $00
L57B1       DB    $00
L57B2       DB    $00
            DB    $E5
            DB    $00
            DB    $00
            DB    $02
            DB    $D5
            DB    $00
            DB    $00
            DB    $06
            DB    $00
            DB    $20
            DB    $00
            DB    $37
            DB    $00
            DB    $4A
            DB    $00
            DB    $64
            DB    $00
            DB    $6F

*-----------------------

L57C5       SEC
            LDA   $C1
            SBC   $D0
            STA   L566F
            LDA   $C2
            SBC   $D1
            STA   L5670
            LDA   #$00
            STA   L5671
            BCS   L57EF
            SEC
            LDA   $D0
            SBC   $C1
            STA   L566F
            LDA   $D1
            SBC   $C2
            STA   L5670
            LDA   #$01
            STA   L5671
L57EF       SEC
            LDA   $C4
            SBC   $D3
            STA   L5672
            LDA   $C5
            SBC   $D4
            STA   L5673
            LDA   #$00
            STA   L5674
            BCS   L5819
            SEC
            LDA   $D3
            SBC   $C4
            STA   L5672
            LDA   $D4
            SBC   $C5
            STA   L5673
            LDA   #$01
            STA   L5674
L5819       JSR   L5597
            CLC
            LDA   #$FC
            ADC   $A6
            STA   $CC
            LDA   #$00
            ADC   $A7
            STA   $CD
            SEC
            LDA   $CC
            SBC   #$F8
            PHA
            LDA   $CD
            SBC   #$01
            BMI   L583B
            STA   $CD
            PLA
            STA   $CC
            PHA
L583B       PLA
            SEC
            LDA   $AD
            SBC   #$33
            STA   $9D
            LDA   $AE
            SBC   #$01
            STA   $9E
            BPL   L584E
            JMP   L58B5

L584E       SEC
            LDA   $A6
            SBC   $AD
            STA   ptrSTRING
            LDA   $A7
            SBC   $AE
            STA   ptrSTRING+1
            BPL   L58CF
            CLC
            LDA   $AD
            ADC   #$C5
            STA   $9B
            LDA   $AE
            ADC   #$00
            STA   $9C
            SEC
            LDA   $9B
            SBC   #$F8
            STA   $9B
            LDA   $9C
            SBC   #$01
            STA   $9C
            SEC
            LDA   $9B
            SBC   $A6
            LDA   $9C
            SBC   $A7
            BMI   L58A9
            LDA   $C7
            CMP   #$05
            BCC   L588C
            CMP   #$D8
            BCC   L58A9
L588C       SEC
            LDA   #$F8
            SBC   $AD
            STA   $9F
            LDA   #$01
            SBC   $AE
            STA   $A0
            CLC
            LDA   $A6
            ADC   $9F
            STA   ptrSTRING
            LDA   $A7
            ADC   $A0
            STA   ptrSTRING+1
            JMP   L58CF

L58A9       LDA   #$FF
            STA   $C3
            STA   $C6
            LDA   #$00
            STA   L6A17
            RTS

L58B5       SEC
            LDA   $A6
            SBC   $AD
            STA   ptrSTRING
            LDA   $A7
            SBC   $AE
            STA   ptrSTRING+1
            BMI   L58A9
            SEC
            LDA   ptrSTRING
            SBC   #$C5
            LDA   ptrSTRING+1
            SBC   #$00
            BPL   L58A9
L58CF       LDA   $C0
            CMP   #$05
            BNE   L58E8
            LDA   curPLAYER
            ASL
            TAX
            LDY   L6F9C
            BNE   L58E5
            LDA   #$02
            AND   L7F77,X
            BNE   L58E8
L58E5       JSR   L782D
L58E8       SEC
            LDA   #$F8
            SBC   $A6
            STA   $CE
            LDA   #$01
            SBC   $A7
            STA   $CF
            CLC
            LDA   $C8
            ADC   $CE
            STA   $CE
            LDA   $C9
            ADC   $CF
            STA   $CF
            LDA   #$F8
            STA   $9B
            LDA   #$01
            STA   $9C
            LDA   #$00
            STA   $9D
            STA   $9E
            LDA   $CE
            STA   $9F
            LDA   $CF
            STA   $A0
            JSR   L08A6
            LDA   $9F
            STA   $CE
            LDA   $A0
            STA   $CF
            SEC
            LDA   $C2
            SBC   $D1
            BCS   L592F
            SEC
            LDA   $D1
            SBC   $C2
L592F       STA   $9B
            SEC
            LDA   $C5
            SBC   $D4
            BCS   L593D
            SEC
            LDA   $D4
            SBC   $C5
L593D       STA   $9C
            CMP   $9B
            BCS   L594C
            LSR
            CLC
            ADC   $9B
            STA   $9B
            JMP   L5953

L594C       LSR   $9B
            CLC
            ADC   $9B
            STA   $9B
L5953       LDA   #$00
            LDX   $9B
            BMI   L595C
            LDA   L1E64,X
L595C       STA   $A2
            CMP   #$0A
            BCS   L5968
L5962       LDA   #$00
            STA   L6A17
            RTS

L5968       LDA   $C0
            CMP   #$01
            BEQ   L5978
            CMP   #$06
            BEQ   L5978
            CMP   #$02
            BEQ   L5978
            BNE   L597C
L5978       LDA   $DF
            BEQ   L5962
L597C       LDA   $CE
            STA   $9F
            LDA   $CF
            STA   $A0
            LDA   $C0
            CMP   #$05
            BNE   L59A0
            CLC
            LDA   L7E54
            ADC   $9F
            STA   $9F
            LDA   #$00
            ADC   $A0
            TAX
            LDA   $9F
            JSR   L093E
            STA   $9F
            STX   $A0
L59A0       LDA   #$00
            STA   $9D
            STA   $9E
            STA   $9C
            LDA   #$15
            STA   $9B
            JSR   L08A6
            LDY   #$00
            LDA   $9D
            CMP   #$0C
            BPL   L59B8
            DEY
L59B8       STY   $A5
            ASL
            STA   $CE
            CLC
            LDA   ptrSTRING
            ADC   #$02
            STA   $A3
            CMP   #$56
            BCC   L59D2
            CMP   #$6D
            BCS   L59D2
            LDA   #$FF
            STA   L6A17
            RTS

L59D2       LDA   #$00
            STA   L6A17
            LDA   #$FF
            RTS

L59DA       CLC
            LDA   $AD
            ADC   #$62
            STA   $D7
            LDA   $AE
            ADC   #$00
            STA   $D8
            SEC
            LDA   $D7
            SBC   #$F8
            STA   $9B
            LDA   $D8
            SBC   #$01
            STA   $9C
            BCC   L59FE
            LDA   $9B
            STA   $D7
            LDA   $9C
            STA   $D8
L59FE       RTS

*-----------------------

L59FF       DB    $D7
            DB    $1F
            DB    $C5
            DB    $1F
            DB    $B3
            DB    $1F
            DB    $A1
            DB    $1F
            DB    $8F
            DB    $1F
            DB    $7D
            DB    $1F
            DB    $6B
            DB    $1F
            DB    $59
            DB    $1F
            DB    $47
X5A10       DB    $1F
            DB    $35
            DB    $1F
            DB    $23
            DB    $1F
            DB    $11
            DB    $1F
            DB    $FF
            DB    $1E
            DB    $11
            DB    $1F
            DB    $23
            DB    $1F
            DB    $35
            DB    $1F
            DB    $47
X5A20       DB    $1F
            DB    $59
            DB    $1F
            DB    $6B
            DB    $1F
            DB    $7D
            DB    $1F
            DB    $8F
            DB    $1F
            DB    $A1
            DB    $1F
            DB    $B3
            DB    $1F
            DB    $C5
            DB    $1F
            DB    $D7
X5A30       DB    $1F
L5A31       DB    $0E
            DB    $43
            DB    $02
            DB    $43
            DB    $F6
            DB    $42
            DB    $EA
            DB    $42
            DB    $DE
            DB    $42
            DB    $D2
            DB    $42
            DB    $C6
            DB    $42
            DB    $BA
X5A40       DB    $42
            DB    $AE
            DB    $42
            DB    $A2
            DB    $42
            DB    $96
            DB    $42
            DB    $8A
            DB    $42
            DB    $7E
            DB    $42
            DB    $8A
            DB    $42
            DB    $96
            DB    $42
            DB    $A2
X5A50       DB    $42
            DB    $AE
            DB    $42
            DB    $BA
            DB    $42
            DB    $C6
            DB    $42
            DB    $D2
            DB    $42
            DB    $DE
            DB    $42
            DB    $EA
            DB    $42
            DB    $F6
            DB    $42
            DB    $02
X5A60       DB    $43
            DB    $0E
            DB    $43
L5A63       DB    $81
            DB    $60
            DB    $61
            DB    $60
            DB    $41
            DB    $60
            DB    $21
            DB    $60
            DB    $01
            DB    $60
            DB    $E1
            DB    $5F
            DB    $C1
X5A70       DB    $5F
            DB    $A1
            DB    $5F
            DB    $81
            DB    $5F
            DB    $61
            DB    $5F
            DB    $41
            DB    $5F
            DB    $21
            DB    $5F
            DB    $01
            DB    $5F
            DB    $21
            DB    $5F
            DB    $41
X5A80       DB    $5F
            DB    $61
            DB    $5F
            DB    $81
            DB    $5F
            DB    $A1
            DB    $5F
            DB    $C1
            DB    $5F
            DB    $E1
            DB    $5F
            DB    $01
            DB    $60
            DB    $21
            DB    $60
            DB    $41
X5A90       DB    $60
            DB    $61
            DB    $60
            DB    $81
            DB    $60
L5A95       DB    $A5
            DB    $5E
            DB    $77
            DB    $5E
            DB    $49
            DB    $5E
            DB    $1B
            DB    $5E
            DB    $ED
            DB    $5D
            DB    $BF
X5AA0       DB    $5D
            DB    $91
            DB    $5D
            DB    $63
            DB    $5D
            DB    $35
            DB    $5D
            DB    $07
            DB    $5D
            DB    $D9
            DB    $5C
            DB    $AB
            DB    $5C
            DB    $7D
            DB    $5C
            DB    $AB
X5AB0       DB    $5C
            DB    $D9
            DB    $5C
            DB    $07
            DB    $5D
            DB    $35
            DB    $5D
            DB    $63
            DB    $5D
            DB    $91
            DB    $5D
            DB    $BF
            DB    $5D
            DB    $ED
            DB    $5D
            DB    $1B
X5AC0       DB    $5E
            DB    $49
            DB    $5E
            DB    $77
            DB    $5E
            DB    $A5
            DB    $5E
L5AC7       DB    $3C
            DB    $1E
            DB    $14
            DB    $1E
            DB    $EC
            DB    $1D
            DB    $C4
            DB    $1D
            DB    $9C
X5AD0       DB    $1D
            DB    $74
            DB    $1D
            DB    $4C
            DB    $1D
            DB    $24
            DB    $1D
            DB    $FC
            DB    $1C
            DB    $D4
            DB    $1C
            DB    $AC
            DB    $1C
            DB    $84
            DB    $1C
            DB    $5C
X5AE0       DB    $1C
            DB    $84
            DB    $1C
            DB    $AC
            DB    $1C
            DB    $D4
            DB    $1C
            DB    $FC
            DB    $1C
            DB    $24
            DB    $1D
            DB    $4C
            DB    $1D
            DB    $74
            DB    $1D
            DB    $9C
X5AF0       DB    $1D
            DB    $C4
            DB    $1D
            DB    $EC
            DB    $1D
            DB    $14
            DB    $1E
            DB    $3C
            DB    $1E
L5AF9       DB    $DB
            DB    $61
            DB    $C5
            DB    $61
            DB    $AF
            DB    $61
            DB    $99
L5B00       DB    $61
            DB    $83
            DB    $61
            DB    $6D
            DB    $61
            DB    $57
            DB    $61
            DB    $41
            DB    $61
            DB    $2B
            DB    $61
            DB    $15
            DB    $61
            DB    $FF
            DB    $60
            DB    $E9
X5B10       DB    $60
            DB    $D3
            DB    $60
            DB    $E9
            DB    $60
            DB    $FF
            DB    $60
            DB    $15
            DB    $61
            DB    $2B
            DB    $61
            DB    $41
            DB    $61
            DB    $57
            DB    $61
            DB    $6D
X5B20       DB    $61
            DB    $83
            DB    $61
            DB    $99
            DB    $61
            DB    $AF
            DB    $61
            DB    $C5
            DB    $61
            DB    $DB
            DB    $61
L5B2B       DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
X5B30       DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
X5B40       DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
X5B50       DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
            DB    $93
            DB    $6B
L5B5D       DB    $91
            DB    $62
            DB    $85
X5B60       DB    $62
            DB    $79
            DB    $62
            DB    $6D
            DB    $62
            DB    $61
            DB    $62
            DB    $55
            DB    $62
            DB    $49
            DB    $62
            DB    $3D
            DB    $62
            DB    $31
            DB    $62
            DB    $25
X5B70       DB    $62
            DB    $19
            DB    $62
            DB    $0D
            DB    $62
            DB    $01
            DB    $62
            DB    $0D
            DB    $62
            DB    $19
            DB    $62
            DB    $25
            DB    $62
            DB    $31
            DB    $62
            DB    $3D
X5B80       DB    $62
            DB    $49
            DB    $62
            DB    $55
            DB    $62
            DB    $61
            DB    $62
            DB    $6D
            DB    $62
            DB    $79
            DB    $62
            DB    $85
            DB    $62
            DB    $91
            DB    $62
L5B8F       DB    $3F
X5B90       DB    $63
            DB    $33
            DB    $63
            DB    $27
            DB    $63
            DB    $1B
            DB    $63
            DB    $0F
            DB    $63
            DB    $03
            DB    $63
            DB    $F7
            DB    $62
            DB    $EB
            DB    $62
            DB    $DF
X5BA0       DB    $62
            DB    $D3
            DB    $62
            DB    $C7
            DB    $62
            DB    $BB
            DB    $62
            DB    $AF
            DB    $62
            DB    $BB
            DB    $62
            DB    $C7
            DB    $62
            DB    $D3
            DB    $62
            DB    $DF
X5BB0       DB    $62
            DB    $EB
            DB    $62
            DB    $F7
            DB    $62
            DB    $03
            DB    $63
            DB    $0F
            DB    $63
            DB    $1B
            DB    $63
            DB    $27
            DB    $63
            DB    $33
            DB    $63
            DB    $3F
X5BC0       DB    $63
L5BC1       DB    $ED
            DB    $63
            DB    $E1
            DB    $63
            DB    $D5
            DB    $63
            DB    $C9
            DB    $63
            DB    $BD
            DB    $63
            DB    $B1
            DB    $63
            DB    $A5
            DB    $63
            DB    $99
X5BD0       DB    $63
            DB    $8D
            DB    $63
            DB    $81
            DB    $63
            DB    $75
            DB    $63
            DB    $69
            DB    $63
            DB    $5D
            DB    $63
            DB    $69
            DB    $63
            DB    $75
            DB    $63
            DB    $81
X5BE0       DB    $63
            DB    $8D
            DB    $63
            DB    $99
            DB    $63
            DB    $A5
            DB    $63
            DB    $B1
            DB    $63
            DB    $BD
            DB    $63
            DB    $C9
            DB    $63
            DB    $D5
            DB    $63
            DB    $E1
X5BF0       DB    $63
            DB    $ED
            DB    $63
L5BF3       DB    $96
            DB    $41
            DB    $78
            DB    $41
            DB    $5A
            DB    $41
            DB    $3C
            DB    $41
            DB    $1E
            DB    $41
            DB    $00
            DB    $41
            DB    $E2
X5C00       DB    $40
            DB    $C4
            DB    $40
            DB    $A6
            DB    $40
            DB    $88
            DB    $40
            DB    $6A
            DB    $40
            DB    $4C
            DB    $40
            DB    $2E
            DB    $40
            DB    $4C
            DB    $40
            DB    $6A
X5C10       DB    $40
            DB    $88
            DB    $40
            DB    $A6
            DB    $40
            DB    $C4
            DB    $40
            DB    $E2
            DB    $40
            DB    $00
            DB    $41
            DB    $1E
            DB    $41
            DB    $3C
            DB    $41
            DB    $5A
X5C20       DB    $41
            DB    $78
            DB    $41
            DB    $96
            DB    $41
L5C25       DB    $B5
L5C26       DB    $6B
            DB    $B5
            DB    $6B
            DB    $E3
            DB    $6B
            DB    $11
            DB    $6C
            DB    $3F
            DB    $6C
            DB    $3F
X5C30       DB    $6C
L5C31       DB    $00
            DB    $02
            DB    $02
            DB    $04
            DB    $04
            DB    $06
            DB    $06
            DB    $00
            DB    $06
            DB    $08
            DB    $08
            DB    $0A
            DB    $0A
            DB    $04
            DB    $08
X5C40       DB    $0C
            DB    $0C
            DB    $0A
            DB    $0E
            DB    $10
            DB    $10
            DB    $12
            DB    $12
            DB    $14
            DB    $14
            DB    $0E
            DB    $14
            DB    $16
            DB    $16
            DB    $18
            DB    $18
X5C50       DB    $12
            DB    $16
            DB    $1A
            DB    $1A
            DB    $18
            DB    $00
            DB    $0E
            DB    $02
            DB    $10
            DB    $04
            DB    $12
            DB    $06
            DB    $14
            DB    $08
            DB    $16
            DB    $0A
X5C60       DB    $18
            DB    $0C
            DB    $1A
            DB    $1C
            DB    $1E
            DB    $1E
            DB    $20
            DB    $20
            DB    $22
            DB    $22
            DB    $1C
            DB    $24
            DB    $26
            DB    $26
            DB    $28
            DB    $28
X5C70       DB    $2A
            DB    $2A
            DB    $24
            DB    $1C
            DB    $24
            DB    $1E
            DB    $26
            DB    $20
            DB    $28
            DB    $22
            DB    $2A
            DB    $FF
            DB    $FF
            DB    $E5
            DB    $2D
            DB    $D1
X5C80       DB    $4C
            DB    $CD
            DB    $2F
            DB    $E6
            DB    $18
            DB    $F4
            DB    $09
            DB    $EF
            DB    $0C
            DB    $FD
            DB    $E9
            DB    $24
            DB    $2C
            DB    $3D
            DB    $4B
            DB    $42
X5C90       DB    $2E
            DB    $22
            DB    $18
            DB    $15
            DB    $08
            DB    $1E
            DB    $0C
            DB    $0C
            DB    $E9
            DB    $03
            DB    $FB
            DB    $04
            DB    $F8
            DB    $04
            DB    $E9
            DB    $02
            DB    $F1
            DB    $08
            DB    $FB
            DB    $0C
            DB    $F8
            DB    $0C
            DB    $E9
            DB    $08
            DB    $F1
            DB    $FF
            DB    $FF
            DB    $F1
            DB    $2C
            DB    $C4
            DB    $46
            DB    $BC
            DB    $2A
            DB    $F3
            DB    $18
            DB    $FE
            DB    $08
            DB    $E6
            DB    $0C
            DB    $04
            DB    $E9
            DB    $2F
            DB    $2E
            DB    $2B
            DB    $52
            DB    $2A
            DB    $33
            DB    $2F
            DB    $19
            DB    $1E
            DB    $09
            DB    $14
            DB    $0D
            DB    $13
            DB    $E9
            DB    $02
            DB    $FB
            DB    $EC
            DB    $F9
            DB    $EC
            DB    $EA
            DB    $05
            DB    $F1
            DB    $07
            DB    $FB
            DB    $F4
            DB    $F8
            DB    $F4
            DB    $E9
            DB    $0A
            DB    $F1
            DB    $FF
            DB    $FF
            DB    $FD
            DB    $2B
            DB    $BD
            DB    $40
            DB    $B3
            DB    $26
            DB    $01
            DB    $18
            DB    $07
            DB    $08
            DB    $E0
            DB    $0B
            DB    $0A
            DB    $E9
            DB    $39
            DB    $31
            DB    $11
            DB    $57
            DB    $09
            DB    $36
            DB    $3B
            DB    $1A
            DB    $26
            DB    $09
            DB    $07
            DB    $0D
            DB    $18
            DB    $E8
            DB    $01
            DB    $FB
            DB    $D8
            DB    $F9
            DB    $D8
            DB    $EB
            DB    $08
            DB    $F1
            DB    $06
            DB    $FB
            DB    $DE
            DB    $F9
            DB    $DE
            DB    $EA
            DB    $0C
            DB    $F1
            DB    $FF
            DB    $FF
            DB    $09
            DB    $2C
            DB    $BC
            DB    $3A
            DB    $B2
            DB    $22
            DB    $0F
            DB    $18
            DB    $10
            DB    $09
            DB    $DD
            DB    $0B
            DB    $10
            DB    $E9
            DB    $40
            DB    $35
            DB    $F3
            DB    $58
            DB    $E5
            DB    $35
            DB    $45
            DB    $1C
            DB    $2C
            DB    $0A
            DB    $F9
            DB    $0D
            DB    $1C
            DB    $E8
            DB    $00
            DB    $FB
            DB    $CA
            DB    $F9
            DB    $CA
            DB    $EC
            DB    $0A
            DB    $F1
            DB    $04
            DB    $FB
            DB    $CE
            DB    $F9
            DB    $CE
            DB    $EC
            DB    $0E
            DB    $F1
            DB    $FF
            DB    $FF
            DB    $15
            DB    $2C
            DB    $C0
            DB    $35
            DB    $B5
            DB    $1F
            DB    $1C
            DB    $18
            DB    $19
            DB    $09
            DB    $DC
            DB    $0A
            DB    $15
            DB    $E8
            DB    $45
            DB    $39
            DB    $D8
            DB    $53
            DB    $C8
            DB    $31
            DB    $4C
            DB    $1F
            DB    $31
            DB    $0A
            DB    $ED
            DB    $0D
            DB    $1F
            DB    $E7
            DB    $FF
            DB    $FB
            DB    $C2
            DB    $FA
            DB    $C2
            DB    $EE
            DB    $0B
            DB    $F1
            DB    $02
            DB    $FB
            DB    $C4
            DB    $FA
            DB    $C4
            DB    $EE
            DB    $0E
            DB    $F0
            DB    $FF
            DB    $FF
            DB    $20
            DB    $2D
            DB    $C7
            DB    $32
            DB    $BD
            DB    $1C
            DB    $29
            DB    $19
            DB    $21
            DB    $09
            DB    $DE
            DB    $0A
            DB    $19
            DB    $E8
            DB    $45
            DB    $3F
            DB    $C4
            DB    $4C
            DB    $B5
            DB    $2B
            DB    $4F
            DB    $22
            DB    $32
            DB    $0B
            DB    $E2
            DB    $0C
            DB    $20
            DB    $E6
            DB    $FE
            DB    $FB
            DB    $C0
            DB    $FB
            DB    $C0
            DB    $F0
            DB    $0B
            DB    $F0
            DB    $FF
            DB    $FB
            DB    $C0
            DB    $FA
            DB    $C0
            DB    $EF
            DB    $0D
            DB    $F0
            DB    $FF
            DB    $FF
            DB    $2B
            DB    $2F
            DB    $D0
            DB    $2F
            DB    $C7
            DB    $1A
            DB    $34
            DB    $1A
            DB    $27
            DB    $09
            DB    $E1
            DB    $0A
            DB    $1C
            DB    $E7
            DB    $40
            DB    $45
            DB    $B9
            DB    $44
            DB    $AC
            DB    $26
            DB    $4D
            DB    $26
            DB    $30
            DB    $0C
            DB    $DB
            DB    $0C
            DB    $1E
            DB    $E4
            DB    $FD
            DB    $FB
            DB    $C2
            DB    $FB
            DB    $C2
            DB    $F1
            DB    $0B
            DB    $F0
            DB    $FD
            DB    $FB
            DB    $C1
            DB    $FB
            DB    $C1
            DB    $F1
            DB    $0C
            DB    $F0
            DB    $FF
            DB    $FF
            DB    $34
            DB    $32
            DB    $DB
            DB    $2D
            DB    $D3
            DB    $19
            DB    $3E
            DB    $1C
            DB    $2B
            DB    $0A
            DB    $E7
            DB    $09
            DB    $1C
            DB    $E6
            DB    $33
            DB    $4C
            DB    $B5
            DB    $3E
            DB    $AC
            DB    $22
            DB    $43
            DB    $2B
            DB    $29
            DB    $0C
            DB    $D7
            DB    $0B
            DB    $1A
            DB    $E3
            DB    $FC
            DB    $FB
            DB    $C8
            DB    $FB
            DB    $C8
            DB    $F2
            DB    $0A
            DB    $F0
            DB    $FB
            DB    $FB
            DB    $C5
            DB    $FB
            DB    $C5
            DB    $F2
            DB    $09
            DB    $F0
            DB    $FF
            DB    $FF
            DB    $3A
            DB    $35
            DB    $E7
            DB    $2C
            DB    $E0
            DB    $18
            DB    $45
            DB    $1E
            DB    $2D
            DB    $0B
            DB    $ED
            DB    $09
            DB    $1B
            DB    $E5
            DB    $20
            DB    $52
            DB    $B7
            DB    $38
            DB    $B0
            DB    $1E
            DB    $30
            DB    $30
            DB    $1E
            DB    $0D
            DB    $D6
            DB    $0A
            DB    $14
            DB    $E2
            DB    $FC
            DB    $FB
            DB    $D0
            DB    $FC
            DB    $D0
            DB    $F3
            DB    $09
            DB    $F0
            DB    $F9
            DB    $FB
            DB    $CD
            DB    $FC
            DB    $CD
            DB    $F3
            DB    $06
            DB    $EF
            DB    $FF
            DB    $FF
            DB    $3E
            DB    $39
            DB    $F4
            DB    $2B
            DB    $EE
            DB    $17
            DB    $48
            DB    $21
            DB    $2C
            DB    $0B
            DB    $F5
            DB    $09
            DB    $18
            DB    $E4
            DB    $06
            DB    $55
            DB    $BD
            DB    $33
            DB    $B9
            DB    $1C
            DB    $13
            DB    $34
            DB    $10
            DB    $0E
            DB    $D8
            DB    $0A
            DB    $0C
            DB    $E2
            DB    $FB
            DB    $FB
            DB    $DA
            DB    $FC
            DB    $DA
            DB    $F3
            DB    $06
            DB    $F0
            DB    $F8
            DB    $FB
            DB    $D6
            DB    $FC
            DB    $D6
            DB    $F3
            DB    $02
            DB    $EF
            DB    $FF
            DB    $FF
            DB    $3E
            DB    $3E
            DB    $01
            DB    $2B
            DB    $FC
            DB    $17
            DB    $47
            DB    $25
            DB    $27
            DB    $0C
            DB    $FC
            DB    $09
            DB    $13
            DB    $E3
            DB    $EB
            DB    $54
            DB    $C6
            DB    $30
            DB    $C3
            DB    $1A
            DB    $F3
            DB    $34
            DB    $FF
            DB    $0E
            DB    $DC
            DB    $09
            DB    $02
            DB    $E1
            DB    $FB
            DB    $FB
            DB    $E5
            DB    $FC
            DB    $E5
            DB    $F4
            DB    $03
            DB    $F0
            DB    $F7
            DB    $FB
            DB    $E1
            DB    $FC
            DB    $E1
            DB    $F4
            DB    $FE
            DB    $EF
            DB    $FF
            DB    $FF
            DB    $38
            DB    $44
            DB    $0E
            DB    $2B
            DB    $0B
            DB    $17
            DB    $40
            DB    $29
            DB    $1E
            DB    $0D
            DB    $04
            DB    $09
            DB    $0B
            DB    $E2
            DB    $D4
            DB    $4F
            DB    $D0
            DB    $2D
            DB    $D0
            DB    $19
            DB    $D5
            DB    $31
            DB    $EE
            DB    $0E
            DB    $E2
            DB    $09
            DB    $F8
            DB    $E1
            DB    $FC
            DB    $FB
            DB    $F1
            DB    $FC
            DB    $F1
            DB    $F4
            DB    $00
            DB    $EF
            DB    $F7
            DB    $FB
            DB    $ED
            DB    $FC
            DB    $ED
            DB    $F4
            DB    $FA
            DB    $EF
            DB    $FF
            DB    $FF
            DB    $2D
            DB    $4A
            DB    $1A
            DB    $2C
            DB    $19
            DB    $18
            DB    $31
            DB    $2D
            DB    $12
            DB    $0D
            DB    $0C
            DB    $09
            DB    $03
            DB    $E2
            DB    $C4
            DB    $48
            DB    $DD
            DB    $2B
            DB    $DE
            DB    $18
            DB    $C0
            DB    $2C
            DB    $DF
            DB    $0D
            DB    $EA
            DB    $09
            DB    $EF
            DB    $E2
            DB    $FC
            DB    $FB
            DB    $FE
            DB    $FC
            DB    $FE
            DB    $F4
            DB    $FD
            DB    $F0
            DB    $F7
            DB    $FB
            DB    $F9
            DB    $FC
            DB    $F9
            DB    $F4
            DB    $F7
            DB    $F0
            DB    $FF
            DB    $FF
L5ED3       DB    $00
            DB    $12
            DB    $02
            DB    $14
            DB    $00
            DB    $02
            DB    $12
            DB    $14
            DB    $04
            DB    $06
            DB    $06
            DB    $08
            DB    $08
            DB    $0A
            DB    $0A
            DB    $06
            DB    $16
            DB    $06
            DB    $06
            DB    $18
            DB    $18
            DB    $1A
            DB    $1A
            DB    $06
            DB    $0C
            DB    $0E
            DB    $0E
            DB    $1C
            DB    $1C
            DB    $0C
            DB    $0E
            DB    $10
            DB    $1C
            DB    $10
            DB    $0C
            DB    $10
            DB    $0A
            DB    $1A
            DB    $04
            DB    $16
            DB    $08
            DB    $04
            DB    $16
            DB    $18
            DB    $FF
            DB    $FF
            DB    $F8
            DB    $32
            DB    $FF
            DB    $14
            DB    $F2
            DB    $1B
            DB    $05
            DB    $E6
            DB    $EA
            DB    $F4
            DB    $F2
            DB    $CF
            DB    $02
            DB    $D0
            DB    $F9
            DB    $D7
            DB    $03
            DB    $BC
            DB    $0D
            DB    $32
            DB    $06
            DB    $14
            DB    $12
            DB    $1A
            DB    $1B
            DB    $F4
            DB    $12
            DB    $CF
            DB    $0D
            DB    $D8
            DB    $FF
            DB    $FF
            DB    $F3
            DB    $31
            DB    $FE
            DB    $14
            DB    $F8
            DB    $1A
            DB    $D8
            DB    $E7
            DB    $F1
            DB    $F4
            DB    $F8
            DB    $CF
            DB    $04
            DB    $D0
            DB    $EC
            DB    $D8
            DB    $02
            DB    $BC
            DB    $07
            DB    $33
            DB    $05
            DB    $14
            DB    $18
            DB    $1B
            DB    $21
            DB    $F4
            DB    $18
            DB    $CE
            DB    $FF
            DB    $D7
            DB    $FF
            DB    $FF
            DB    $EF
            DB    $30
            DB    $FD
            DB    $14
            DB    $FF
            DB    $1A
            DB    $B6
            DB    $EA
            DB    $F8
            DB    $F5
            DB    $FF
            DB    $D0
            DB    $06
            DB    $D0
            DB    $E1
            DB    $DA
            DB    $02
            DB    $BC
            DB    $01
            DB    $33
            DB    $03
            DB    $14
            DB    $1C
            DB    $1C
            DB    $25
            DB    $F3
            DB    $1C
            DB    $CC
            DB    $F1
            DB    $D8
            DB    $FF
            DB    $FF
            DB    $ED
            DB    $2F
            DB    $FC
            DB    $14
            DB    $06
            DB    $1A
            DB    $A4
            DB    $EE
            DB    $00
            DB    $F5
            DB    $06
            DB    $D0
            DB    $07
            DB    $CF
            DB    $DA
            DB    $DC
            DB    $01
            DB    $BC
            DB    $FB
            DB    $33
            DB    $01
            DB    $14
            DB    $1F
            DB    $1D
            DB    $28
            DB    $F3
            DB    $1F
            DB    $CA
            DB    $E5
            DB    $D9
            DB    $FF
            DB    $FF
            DB    $EC
            DB    $2E
            DB    $FB
            DB    $14
            DB    $0C
            DB    $1A
            DB    $9E
            DB    $F0
            DB    $08
            DB    $F5
            DB    $0C
            DB    $CF
            DB    $08
            DB    $CF
            DB    $D6
            DB    $DE
            DB    $01
            DB    $BB
            DB    $F5
            DB    $32
            DB    $FF
            DB    $14
            DB    $21
            DB    $1E
            DB    $28
            DB    $F2
            DB    $21
            DB    $C8
            DB    $DC
            DB    $DB
            DB    $FF
            DB    $FF
            DB    $ED
            DB    $2D
            DB    $FB
            DB    $14
            DB    $12
            DB    $1B
            DB    $9F
            DB    $F2
            DB    $10
            DB    $F4
            DB    $12
            DB    $CE
            DB    $08
            DB    $CE
            DB    $D5
            DB    $E0
            DB    $00
            DB    $BB
            DB    $F0
            DB    $31
            DB    $FD
            DB    $14
            DB    $20
            DB    $20
            DB    $24
            DB    $F1
            DB    $20
            DB    $C5
            DB    $D6
            DB    $DD
            DB    $FF
            DB    $FF
            DB    $EE
            DB    $2C
            DB    $FB
            DB    $14
            DB    $17
            DB    $1C
            DB    $A6
            DB    $F4
            DB    $16
            DB    $F4
            DB    $17
            DB    $CD
            DB    $07
            DB    $CE
            DB    $D7
            DB    $E1
            DB    $FF
            DB    $BB
            DB    $EC
            DB    $30
            DB    $FB
            DB    $14
            DB    $1C
            DB    $21
            DB    $1E
            DB    $F0
            DB    $1C
            DB    $C3
            DB    $D4
            DB    $DF
            DB    $FF
            DB    $FF
            DB    $F1
            DB    $2B
            DB    $FC
            DB    $14
            DB    $1B
            DB    $1C
            DB    $B1
            DB    $F5
            DB    $1C
            DB    $F4
            DB    $1B
            DB    $CB
            DB    $06
            DB    $CD
            DB    $DC
            DB    $E3
            DB    $FE
            DB    $BB
            DB    $EA
            DB    $2F
            DB    $FA
            DB    $14
            DB    $16
            DB    $22
            DB    $14
            DB    $F0
            DB    $16
            DB    $C1
            DB    $D5
            DB    $E1
            DB    $FF
            DB    $FF
            DB    $F5
            DB    $2A
            DB    $FC
            DB    $13
            DB    $1E
            DB    $1E
            DB    $BE
            DB    $F6
            DB    $21
            DB    $F3
            DB    $1E
            DB    $C9
            DB    $05
            DB    $CD
            DB    $E2
            DB    $E4
            DB    $FE
            DB    $BC
            DB    $EA
            DB    $2D
            DB    $F9
            DB    $14
            DB    $0E
            DB    $23
            DB    $08
            DB    $EF
            DB    $0E
            DB    $BF
            DB    $D9
            DB    $E2
            DB    $FF
            DB    $FF
            DB    $F9
            DB    $2A
            DB    $FD
            DB    $13
            DB    $1E
            DB    $1F
            DB    $CD
            DB    $F6
            DB    $23
            DB    $F3
            DB    $1E
            DB    $C7
            DB    $03
            DB    $CD
            DB    $E9
            DB    $E5
            DB    $FD
            DB    $BC
            DB    $EB
            DB    $2C
            DB    $F8
            DB    $14
            DB    $04
            DB    $24
            DB    $FB
            DB    $EF
            DB    $04
            DB    $BE
            DB    $DE
            DB    $E4
            DB    $FF
            DB    $FF
            DB    $FD
            DB    $29
            DB    $FE
            DB    $13
            DB    $1C
            DB    $20
            DB    $DD
            DB    $F7
            DB    $24
            DB    $F2
            DB    $1C
            DB    $C5
            DB    $01
            DB    $CD
            DB    $F2
            DB    $E5
            DB    $FD
            DB    $BC
            DB    $ED
            DB    $2B
            DB    $F8
            DB    $14
            DB    $FA
            DB    $24
            DB    $EF
            DB    $EF
            DB    $FA
            DB    $BE
            DB    $E6
            DB    $E4
            DB    $FF
            DB    $FF
            DB    $02
            DB    $29
            DB    $FF
            DB    $13
            DB    $18
            DB    $21
            DB    $ED
            DB    $F7
            DB    $21
            DB    $F1
            DB    $18
            DB    $C3
            DB    $FF
            DB    $CD
            DB    $FB
            DB    $E6
            DB    $FD
            DB    $BC
            DB    $F1
            DB    $2A
            DB    $F9
            DB    $13
            DB    $F0
            DB    $23
            DB    $E4
            DB    $F0
            DB    $F0
            DB    $BF
            DB    $EE
            DB    $E5
            DB    $FF
            DB    $FF
            DB    $07
            DB    $2A
            DB    $00
            DB    $13
            DB    $12
            DB    $22
            DB    $FE
            DB    $F7
            DB    $1C
            DB    $F1
            DB    $12
            DB    $C1
            DB    $FD
            DB    $CD
            DB    $04
            DB    $E6
            DB    $FD
            DB    $BD
            DB    $F5
            DB    $2A
            DB    $FA
            DB    $13
            DB    $E8
            DB    $22
            DB    $DD
            DB    $F1
            DB    $E8
            DB    $C1
            DB    $F7
            DB    $E6
            DB    $FF
            DB    $FF
L60A1       DB    $00
            DB    $02
            DB    $02
            DB    $04
            DB    $04
            DB    $06
            DB    $06
            DB    $08
            DB    $0A
            DB    $0C
            DB    $0E
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $02
            DB    $10
            DB    $04
            DB    $10
            DB    $06
            DB    $10
            DB    $08
            DB    $10
            DB    $0A
            DB    $10
            DB    $0C
            DB    $10
            DB    $0E
            DB    $12
            DB    $00
            DB    $12
            DB    $02
            DB    $12
            DB    $04
            DB    $12
            DB    $06
            DB    $12
            DB    $08
            DB    $12
            DB    $0A
            DB    $12
            DB    $0C
            DB    $12
            DB    $0E
            DB    $08
            DB    $0A
            DB    $0C
            DB    $0E
            DB    $FF
            DB    $FF
            DB    $00
            DB    $00
            DB    $DE
            DB    $00
            DB    $C8
            DB    $00
            DB    $CE
            DB    $00
            DB    $00
            DB    $00
            DB    $31
            DB    $00
            DB    $37
            DB    $00
            DB    $21
            DB    $00
            DB    $00
            DB    $DD
            DB    $00
            DB    $1B
            DB    $FF
            DB    $FF
            DB    $0B
            DB    $00
            DB    $E9
            DB    $00
            DB    $CE
            DB    $00
            DB    $C8
            DB    $00
            DB    $EB
            DB    $00
            DB    $25
            DB    $00
            DB    $39
            DB    $00
            DB    $2A
            DB    $00
            DB    $00
            DB    $DD
            DB    $00
            DB    $1B
            DB    $FF
            DB    $FF
            DB    $16
            DB    $00
            DB    $F4
            DB    $00
            DB    $D5
            DB    $00
            DB    $C6
            DB    $00
            DB    $DA
            DB    $00
            DB    $14
            DB    $00
            DB    $38
            DB    $00
            DB    $32
            DB    $00
            DB    $00
            DB    $DD
            DB    $00
            DB    $1B
            DB    $FF
            DB    $FF
            DB    $21
            DB    $00
            DB    $00
            DB    $00
            DB    $DF
            DB    $00
            DB    $C8
            DB    $00
            DB    $CE
            DB    $00
            DB    $00
            DB    $00
            DB    $31
            DB    $00
            DB    $37
            DB    $00
            DB    $00
            DB    $DD
            DB    $00
            DB    $1B
            DB    $FF
            DB    $FF
            DB    $2A
            DB    $00
            DB    $0B
            DB    $00
            DB    $E9
            DB    $00
            DB    $CD
            DB    $00
            DB    $C8
            DB    $00
            DB    $EB
            DB    $00
            DB    $25
            DB    $00
            DB    $3A
            DB    $00
            DB    $00
            DB    $DD
            DB    $00
            DB    $1B
            DB    $FF
            DB    $FF
            DB    $32
            DB    $00
            DB    $17
            DB    $00
            DB    $F4
            DB    $00
            DB    $D5
            DB    $00
            DB    $C6
            DB    $00
            DB    $DA
            DB    $00
            DB    $14
            DB    $00
            DB    $38
            DB    $00
            DB    $00
            DB    $DD
            DB    $00
            DB    $1B
            DB    $FF
            DB    $FF
            DB    $37
            DB    $00
            DB    $21
            DB    $00
            DB    $00
            DB    $00
            DB    $DE
            DB    $00
            DB    $C8
            DB    $00
            DB    $CE
            DB    $00
            DB    $00
            DB    $00
            DB    $31
            DB    $00
            DB    $00
            DB    $DD
            DB    $00
            DB    $1B
            DB    $FF
            DB    $FF
            DB    $39
            DB    $00
            DB    $2A
            DB    $00
            DB    $0B
            DB    $00
            DB    $E9
            DB    $00
            DB    $CE
            DB    $00
            DB    $C8
            DB    $00
            DB    $EB
            DB    $00
            DB    $25
            DB    $00
            DB    $00
            DB    $DD
            DB    $00
            DB    $1B
            DB    $FF
            DB    $FF
            DB    $38
            DB    $00
            DB    $32
            DB    $00
            DB    $16
            DB    $00
            DB    $F4
            DB    $00
            DB    $D5
            DB    $00
            DB    $C6
            DB    $00
            DB    $DA
            DB    $00
            DB    $14
            DB    $00
            DB    $00
            DB    $DD
            DB    $00
            DB    $1B
            DB    $FF
            DB    $FF
            DB    $31
            DB    $00
            DB    $37
            DB    $00
            DB    $21
            DB    $00
            DB    $00
            DB    $00
            DB    $DF
            DB    $00
            DB    $C8
            DB    $00
            DB    $CE
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $DD
            DB    $00
            DB    $1B
            DB    $FF
            DB    $FF
            DB    $25
            DB    $00
            DB    $3A
            DB    $00
            DB    $2A
            DB    $00
            DB    $0B
            DB    $00
            DB    $E9
            DB    $00
            DB    $CD
            DB    $00
            DB    $C8
            DB    $00
            DB    $EB
            DB    $00
            DB    $00
            DB    $DD
            DB    $00
            DB    $1B
            DB    $FF
            DB    $FF
            DB    $14
            DB    $00
            DB    $38
            DB    $00
            DB    $32
            DB    $00
            DB    $17
            DB    $00
            DB    $F4
            DB    $00
            DB    $D5
            DB    $00
            DB    $C6
            DB    $00
            DB    $DA
            DB    $00
            DB    $00
            DB    $DD
            DB    $00
            DB    $1B
            DB    $FF
            DB    $FF
            DB    $00
            DB    $00
            DB    $31
            DB    $00
            DB    $37
            DB    $00
            DB    $21
            DB    $00
            DB    $00
            DB    $00
            DB    $DE
            DB    $00
            DB    $C8
            DB    $00
            DB    $CE
            DB    $00
            DB    $00
            DB    $DD
            DB    $00
            DB    $1B
            DB    $FF
            DB    $FF
L61F1       DB    $00
            DB    $02
            DB    $02
            DB    $04
            DB    $04
            DB    $06
            DB    $06
            DB    $00
            DB    $00
            DB    $08
            DB    $02
            DB    $08
            DB    $04
            DB    $08
            DB    $FF
            DB    $FF
            DB    $15
            DB    $05
            DB    $15
            DB    $D9
            DB    $23
            DB    $06
            DB    $21
            DB    $24
            DB    $F5
            DB    $EC
            DB    $FF
            DB    $FF
            DB    $18
            DB    $05
            DB    $18
            DB    $D7
            DB    $16
            DB    $07
            DB    $18
            DB    $26
            DB    $F7
            DB    $EC
            DB    $FF
            DB    $FF
            DB    $18
            DB    $05
            DB    $18
            DB    $D6
            DB    $06
            DB    $07
            DB    $0B
            DB    $27
            DB    $F9
            DB    $EC
            DB    $FF
            DB    $FF
            DB    $17
            DB    $05
            DB    $17
            DB    $D5
            DB    $F5
            DB    $07
            DB    $FD
            DB    $27
            DB    $FC
            DB    $EC
            DB    $FF
            DB    $FF
            DB    $14
            DB    $06
            DB    $14
            DB    $D3
            DB    $E6
            DB    $07
            DB    $F0
            DB    $27
            DB    $FF
            DB    $ED
            DB    $FF
            DB    $FF
            DB    $0F
            DB    $06
            DB    $0F
            DB    $D2
            DB    $DA
            DB    $06
            DB    $E4
            DB    $25
            DB    $02
            DB    $ED
            DB    $FF
            DB    $FF
            DB    $09
            DB    $06
            DB    $09
            DB    $D1
            DB    $D2
            DB    $06
            DB    $DC
            DB    $24
            DB    $05
            DB    $EC
            DB    $FF
            DB    $FF
            DB    $02
            DB    $06
            DB    $02
            DB    $D1
            DB    $CF
            DB    $06
            DB    $D7
            DB    $22
            DB    $08
            DB    $EC
            DB    $FF
            DB    $FF
            DB    $FB
            DB    $06
            DB    $FB
            DB    $D1
            DB    $CF
            DB    $05
            DB    $D5
            DB    $20
            DB    $0A
            DB    $EC
            DB    $FF
            DB    $FF
            DB    $F4
            DB    $06
            DB    $F4
            DB    $D2
            DB    $D2
            DB    $05
            DB    $D7
            DB    $1E
            DB    $0C
            DB    $EC
            DB    $FF
            DB    $FF
            DB    $EF
            DB    $06
            DB    $EF
            DB    $D3
            DB    $D8
            DB    $05
            DB    $DA
            DB    $1D
            DB    $0C
            DB    $EB
            DB    $FF
            DB    $FF
            DB    $EB
            DB    $06
            DB    $EB
            DB    $D4
            DB    $DF
            DB    $04
            DB    $E0
            DB    $1B
            DB    $0C
            DB    $EB
            DB    $FF
            DB    $FF
            DB    $E8
            DB    $05
            DB    $E8
            DB    $D5
            DB    $E8
            DB    $04
            DB    $E7
            DB    $1B
            DB    $0B
            DB    $EB
            DB    $FF
            DB    $FF
L629D       DB    $00
            DB    $02
            DB    $02
            DB    $04
            DB    $04
            DB    $06
            DB    $06
            DB    $00
            DB    $00
            DB    $08
            DB    $02
            DB    $08
            DB    $04
            DB    $08
            DB    $06
            DB    $08
            DB    $FF
            DB    $FF
            DB    $1A
            DB    $ED
            DB    $1E
            DB    $E5
            DB    $1D
            DB    $05
            DB    $1B
            DB    $0F
            DB    $F5
            DB    $F6
            DB    $FF
            DB    $FF
            DB    $1E
            DB    $EC
            DB    $1B
            DB    $E4
            DB    $1B
            DB    $05
            DB    $1D
            DB    $0F
            DB    $F7
            DB    $F6
            DB    $FF
            DB    $FF
            DB    $20
            DB    $EB
            DB    $15
            DB    $E3
            DB    $18
            DB    $06
            DB    $1D
            DB    $10
            DB    $F9
            DB    $F6
            DB    $FF
            DB    $FF
            DB    $1F
            DB    $EA
            DB    $0E
            DB    $E2
            DB    $12
            DB    $06
            DB    $1C
            DB    $11
            DB    $FC
            DB    $F6
            DB    $FF
            DB    $FF
            DB    $1D
            DB    $EA
            DB    $05
            DB    $E2
            DB    $0B
            DB    $06
            DB    $18
            DB    $11
            DB    $FF
            DB    $F6
            DB    $FF
            DB    $FF
            DB    $18
            DB    $E9
            DB    $FB
            DB    $E1
            DB    $02
            DB    $06
            DB    $12
            DB    $12
            DB    $02
            DB    $F6
            DB    $FF
            DB    $FF
            DB    $10
            DB    $E8
            DB    $F2
            DB    $E2
            DB    $F9
            DB    $06
            DB    $0A
            DB    $12
            DB    $05
            DB    $F6
            DB    $FF
            DB    $FF
            DB    $07
            DB    $E7
            DB    $EB
            DB    $E3
            DB    $F1
            DB    $06
            DB    $01
            DB    $12
            DB    $08
            DB    $F6
            DB    $FF
            DB    $FF
            DB    $FD
            DB    $E7
            DB    $E5
            DB    $E4
            DB    $EA
            DB    $06
            DB    $F8
            DB    $12
            DB    $0A
            DB    $F6
            DB    $FF
            DB    $FF
            DB    $F4
            DB    $E8
            DB    $E2
            DB    $E5
            DB    $E6
            DB    $06
            DB    $F0
            DB    $12
            DB    $0C
            DB    $F6
            DB    $FF
            DB    $FF
            DB    $EC
            DB    $E8
            DB    $E1
            DB    $E6
            DB    $E3
            DB    $05
            DB    $E9
            DB    $11
            DB    $0C
            DB    $F6
            DB    $FF
            DB    $FF
            DB    $E5
            DB    $E9
            DB    $E2
            DB    $E7
            DB    $E3
            DB    $05
            DB    $E5
            DB    $11
            DB    $0C
            DB    $F6
            DB    $FF
            DB    $FF
            DB    $E1
            DB    $EA
            DB    $E5
            DB    $E8
            DB    $E4
            DB    $05
            DB    $E2
            DB    $10
            DB    $0B
            DB    $F5
            DB    $FF
            DB    $FF
L634B       DB    $00
            DB    $02
            DB    $02
            DB    $04
            DB    $04
            DB    $06
            DB    $06
            DB    $00
            DB    $00
            DB    $08
            DB    $02
            DB    $08
            DB    $04
            DB    $08
            DB    $06
            DB    $08
            DB    $FF
            DB    $FF
            DB    $0B
            DB    $FE
            DB    $0C
            DB    $E0
            DB    $0C
            DB    $F2
            DB    $0B
            DB    $13
            DB    $F4
            DB    $F3
            DB    $FF
            DB    $FF
            DB    $0D
            DB    $FE
            DB    $09
            DB    $DF
            DB    $06
            DB    $F2
            DB    $0A
            DB    $13
            DB    $F1
            DB    $F3
            DB    $FF
            DB    $FF
            DB    $0E
            DB    $FE
            DB    $06
            DB    $DF
            DB    $00
            DB    $F2
            DB    $07
            DB    $14
            DB    $F0
            DB    $F3
            DB    $FF
            DB    $FF
            DB    $0E
            DB    $FE
            DB    $02
            DB    $DF
            DB    $F9
            DB    $F2
            DB    $04
            DB    $14
            DB    $F0
            DB    $F4
            DB    $FF
            DB    $FF
            DB    $0D
            DB    $FE
            DB    $FE
            DB    $DF
            DB    $F3
            DB    $F2
            DB    $01
            DB    $14
            DB    $F1
            DB    $F4
            DB    $FF
            DB    $FF
            DB    $0B
            DB    $FE
            DB    $FA
            DB    $DF
            DB    $EE
            DB    $F3
            DB    $FD
            DB    $14
            DB    $F2
            DB    $F4
            DB    $FF
            DB    $FF
            DB    $09
            DB    $FE
            DB    $F7
            DB    $DF
            DB    $EB
            DB    $F3
            DB    $FA
            DB    $14
            DB    $F5
            DB    $F4
            DB    $FF
            DB    $FF
            DB    $05
            DB    $FE
            DB    $F4
            DB    $E0
            DB    $E9
            DB    $F3
            DB    $F7
            DB    $14
            DB    $F8
            DB    $F4
            DB    $FF
            DB    $FF
            DB    $02
            DB    $FE
            DB    $F2
            DB    $E0
            DB    $E9
            DB    $F4
            DB    $F5
            DB    $13
            DB    $FC
            DB    $F4
            DB    $FF
            DB    $FF
            DB    $FE
            DB    $FE
            DB    $F2
            DB    $E1
            DB    $EA
            DB    $F4
            DB    $F3
            DB    $13
            DB    $00
            DB    $F4
            DB    $FF
            DB    $FF
            DB    $FA
            DB    $FE
            DB    $F2
            DB    $E1
            DB    $ED
            DB    $F4
            DB    $F3
            DB    $13
            DB    $04
            DB    $F4
            DB    $FF
            DB    $FF
            DB    $F6
            DB    $FE
            DB    $F3
            DB    $E2
            DB    $F1
            DB    $F5
            DB    $F3
            DB    $12
            DB    $07
            DB    $F4
            DB    $FF
            DB    $FF
            DB    $F4
            DB    $FE
            DB    $F5
            DB    $E2
            DB    $F5
            DB    $F5
            DB    $F5
            DB    $12
            DB    $0B
            DB    $F4
            DB    $FF
            DB    $FF
L63F9       DB    $A0
L63FA       DB    $80
L63FB       DB    $D5
L63FC       DB    $CD
L63FD       DB    $FF	; HGR output address (high byte)
L63FE       DB    $A0

* The scores

tblSCORES   DS    $04	; High-score
tblSCOREP1  DS    $04	; Player 1
            DS    $04	; Player 2

*-----------------------

L640B       LDX   curPLAYER
            CLC
            LDA   L63FA
            ADC   $97,X
            STA   $97,X
            LDA   L63F9
            ASL
            ASL
            STA   L63FB
            CMP   #$08
            BEQ   L642E
            LDA   #$80
            STA   $84
            LDA   #$21
            STA   L63FD
            STA   $85
            BNE   L6439
L642E       LDA   #$00
            STA   $84
            LDA   #$23
            STA   L63FD
            STA   $85
L6439       LDY   #$24
            LDA   ($84),Y
            BNE   L6451
            LDA   #$04
            STA   L63FE
            LDA   #$00
            JSR   L64B0
            INC   L63FE
            LDA   #$00
            JSR   L64B0
L6451       LDA   #$00
            STA   L63FC
            LDY   #$03
            STY   L63FE
            CLC
            LDX   L63FB
            LDA   tblSCORES,X
            ADC   L63FA
L6465       CMP   #$0A
            BCC   L646F
            INC   L63FC
            SEC
            SBC   #$0A
L646F       STA   tblSCORES,X
            JSR   L64B0
            LDA   L63FC
            BEQ   L648F
            DEC   L63FE
            DEC   L63FC
            INC   L63FB
            LDX   L63FB
            CLC
            LDA   tblSCORES,X
            ADC   #$01
            JMP   L6465
L648F       RTS

*-----------------------
* Print a small char

printSMALLCHAR
            PHA	; save line
            LDA   L63FD	; put HGR high address
            STA   $84+1
            PLA	; restore
            ASL
            ASL
            ASL	; *8
            TAX
L649B       LDA   tblSMALLFONT,X ; get value
            STA   ($84),Y ; save in HGR
            CLC
            LDA   $84+1	; next line
            ADC   #$04
            STA   $84+1
            INX
            TXA
            AND   #$07
            CMP   #$07
            BNE   L649B ; modulo 7
            RTS

L64B0       PHA
            LDA   L63FD
            STA   $84+1
            LDX   L63FE
            LDA   L6511,X
            STA   $9B
            LDA   L6518,X
            STA   $9C
            CLC
            LDA   #$1F
            ADC   L63FE
            STA   $9F
            PLA
            ASL
            ASL
            ASL
            TAX
L64D0       LDA   tblSMALLFONT,X
            STA   $9D
            LDA   #$00
            STA   $9E
            LDY   L63FE
L64DC       BEQ   L64EA
            ASL   $9D	; 16-bit mult
            ASL   $9D
            ROL   $9E
            LSR   $9D
            DEY
            JMP   L64DC

L64EA       LDY   $9F
            LDA   $9B
            AND   ($84),Y
            ORA   $9D
            ORA   #$80
            STA   ($84),Y
            INY
            LDA   $9C
            AND   ($84),Y
            ORA   $9E
            ORA   #$80
            STA   ($84),Y
            CLC
            LDA   $84+1
            ADC   #$04
            STA   $84+1
            INX
            TXA
            AND   #$07
            CMP   #$07
            BNE   L64D0
            RTS

*-----------------------

L6511       DB    $81	; 0
            DB    $83	; 1
            DB    $87	; 2
            DB    $8F	; 3
            DB    $9F	; 4
            DB    $BF	; 5
            DB    $FF	; 6
L6518       DB    $FE	; 0
            DB    $FC	; 1
            DB    $F8	; 2
            DB    $F0	; 3
            DB    $E0	; 4
            DB    $C0	; 5
            DB    $80	; 6
	
* The small font...

tblSMALLFONT
            HEX   54444444444454FF10101010101010FF	; 0 1
            HEX   54404054040454FF54404054404054FF	; 2 3
            HEX   44444454404040FF54040454404054FF	; 4 5
            HEX   54040454444454FF54404040404040FF	; 6 7
            HEX   54444454444454FF54444454404054FF	; 8 9
            HEX   008494D4D4D4D4FF00009191959191FF	; Ship H
            HEX   0000A2A2A2A2A2FF00008080808080FF	; H _
            HEX   0000C5C0C4C4C5FF00009591958181FF	; H P
            HEX   000082828282AAFF000088888A8888FF	; L H
            HEX   00009090909090FF0000D4C0D484D4FF	; 1 2
            HEX   008080AA828AAAFF818595D5958581FF	; Ship I>

*-----------------------

L65CF       LDA   #$00
            STA   $97
            STA   $98
            STA   $99
            LDA   #$80	; $2080
            STA   $84
            LDX   #$1C
            LDA   #>HGR1
            STA   $84+1
            LDA   #$00
L65E3       LDY   #$1B
L65E5       STA   ($84),Y
            INY
            CPY   #$27
            BNE   L65E5
            INC   $84+1
            DEX
            BNE   L65E3
            STA   $84
            LDX   #$07
            STX   L63FB
L65F8       LDX   #$02
L65FA       DEC   $84+1
            LDY   #$1B
L65FE       STA   ($84),Y
            INY
            CPY   #$27
            BNE   L65FE
            DEX
            BNE   L65FA
            DEC   $84+1
            DEC   $84+1
            DEC   L63FB
            BNE   L65F8

* 

            LDA   #$06
            STA   L63FE
            LDA   nbPLAYERS ; number of players?
            BEQ   L6624	; only 1
            LDX   #$23	; two players
            STX   L63FD
            LDA   #$00
            JSR   L64B0
L6624       LDX   #$21
            STX   L63FD
            LDX   #$80
            STX   $84
            LDA   #$00
            JSR   L64B0
            DEC   L63FD
            LDA   #$00
            JSR   L64B0
            LDY   #$1B
            LDA   #$20
            STA   L63FD
            LDA   #$0B	; H
            JSR   printSMALLCHAR
            INY
            LDA   #$0C	; I
            JSR   printSMALLCHAR
            INY
            LDA   #$0E	; G
            JSR   printSMALLCHAR
            INY
            LDA   #$11	; H
            JSR   printSMALLCHAR
            INC   L63FD
            LDY   #$1B
            LDA   #$0F	; P
            JSR   printSMALLCHAR
            INY
            LDA   #$10	; L
            JSR   printSMALLCHAR
            INY
            LDA   #$12	; 1
            JSR   printSMALLCHAR

            LDA   nbPLAYERS
            BEQ   L6693

            LDA   #$00
            STA   $84
            LDA   #$23
            STA   L63FD
            INY
            LDA   #$0D	; _
            JSR   printSMALLCHAR
            DEY
            LDA   #$13	; 2
            JSR   printSMALLCHAR
            DEY
            LDA   #$10	; L
            JSR   printSMALLCHAR
            DEY
            LDA   #$0F	; P
            JSR   printSMALLCHAR
L6693       LDA   $E2
            BNE   L66A1

            LDA   #$00	; erase players score
            LDY   #$07
L669B       STA   tblSCOREP1,Y
            DEY
            BPL   L669B
L66A1       RTS

*-----------------------

L66A2       LDA   nbPLAYERS
            BNE   L66BE
            LDA   #$80
            STA   $84
            LDA   #$21
            STA   L63FD
            JSR   L66EF
            LDA   #$00
            STA   $84
            LDA   #$23
            STA   L63FD
            JMP   L66EF

L66BE       LDA   curPLAYER
            BNE   L66DA
            LDA   #$80
            STA   $84
            LDA   #$21
            STA   L63FD
            JSR   L66FC
            LDA   #$00
            STA   $84
            LDA   #$23
            STA   L63FD
            JMP   L66EF

L66DA       LDA   #$00
            STA   $84
            LDA   #$23
            STA   L63FD
            JSR   L66FC
            LDA   #$80
            STA   $84
            LDA   #$21
            STA   L63FD
L66EF       LDA   #$0D	; _
            LDY   #$19
            JSR   printSMALLCHAR
            INY
            LDA   #$0D	; _
            JMP   printSMALLCHAR

L66FC       LDY   #$19
            LDA   #$15	; ship
            JSR   printSMALLCHAR
            INY
            LDA   #$0D	; _
            JMP   printSMALLCHAR

*-----------------------

verifyHIGHSCORE       LDX   #$04	; high-score for P1?
            JSR   checkHIGHSCORE
            LDA   L63FC
            BEQ   L6718	; no
            LDX   #$07	; yes, set it (it decrements)
            JSR   setHIGHSCORE
L6718       LDX   #$08	; high-score for P2?
            JSR   checkHIGHSCORE
            LDA   L63FC
            BEQ   L6727	; no
            LDX   #$0B	; yes, set it
            JSR   setHIGHSCORE
L6727       RTS

*-----------------------

setHIGHSCORE
            LDY   #$03
L672A       LDA   tblSCORES,X
            STA   tblSCORES,Y
            DEX
            DEY
            BPL   L672A
            RTS

*-----------------------

checkHIGHSCORE
            LDY   #$00	; no high-score by default
            STY   L63FC
L673A       LDA   tblSCORES,Y
            CMP   tblSCORES,X
            BCC   L674A
L6742       INX
            INY
            CPY   #$04
            BNE   L673A
            BEQ   L675D
L674A       INX
            INY
            CPY   #$04
            BEQ   L675A
            LDA   tblSCORES,X
            CMP   tblSCORES,Y
            BCC   L6742
            BCS   L674A
L675A       INC   L63FC	; yes, a high-score!!
L675D       RTS

*-----------------------

initHIGHSCORE
            LDA   #$05	; default high-score
            STA   tblSCORES
            LDA   #$00
            STA   tblSCORES+1
            STA   tblSCORES+2
            STA   tblSCORES+3

printHIGHSCORE
            LDA   #$03
            STA   L63FB
            LDA   #$80
            STA   $84
            LDY   #$00
            STY   L63FE
            LDA   #$20
            STA   L63FD
L6781       LDX   L63FB
            LDA   tblSCORES,X
            BNE   L6797
            DEC   L63FB
            INC   L63FE
            BNE   L6781
L6791       LDX   L63FB
            LDA   tblSCORES,X
L6797       JSR   L64B0
            DEC   L63FB
            INC   L63FE
            LDA   L63FE
            CMP   #$04
            BNE   L6791
            LDA   #$00
            JSR   L64B0
            INC   L63FE
            LDA   #$00
            JMP   L64B0

*-----------------------

L67B4       DB    $A0
nbLIVES_P1  DB    $A0	; P1 - nb lives
nbLIVES_P2  DB    $D4	; P2 - nb lives

L67B7       LDA   #$00
            STA   $84
            LDA   #$22
            STA   L63FD
            LDX   nbLIVES_P1
            JSR   L67D4
            LDA   nbPLAYERS
            BEQ   L6802
            INC   L63FD
            LDA   #$80
            STA   $84
            LDX   nbLIVES_P2

L67D4       STX   L67B4
            LDY   #$1A
            LDA   L67B4
            BEQ   L67EF
L67DE       INY
            LDA   #$0A
            JSR   printSMALLCHAR
            INY
            LDA   #$14
            JSR   printSMALLCHAR
            DEC   L67B4
            BNE   L67DE
L67EF       CPY   #$26
            BEQ   L6802
            INY
            LDA   #$0D
            JSR   printSMALLCHAR
            INY
            LDA   #$0D
            JSR   printSMALLCHAR
            JMP   L67EF
L6802       RTS

*-----------------------

fgJOYSTICK  DB    $00	; 0 if no joystick

checkJOYSTICK
            LDA   #$FE
            STA   fgJOYSTICK
            JSR   readJOYSTICK
            LDA   joyX
            BNE   L6813
            INC   fgJOYSTICK
L6813       LDA   joyY
            BNE   L681A
            INC   fgJOYSTICK
L681A       RTS

*-----------------------

L681B       LDA   #$01	; default is no button pressed
            STA   joyBTN
            LDA   KBD
            BPL   L684B
            CMP   L1AFD	; is it escape for pause?
            BNE   L682C	; no
            JSR   doPAUSE	; yes

L682C       LDX   KBDSTROBE
            LDX   #$04	; now compare key
L6831       CMP   tblKEYS,X
            BEQ   L683B
            DEX
            BPL   L6831
            BMI   L684B
L683B       LDA   tblMOVEMENT,X
            BPL   L6845
            LDA   #$00	; button is pressed
            STA   joyBTN
            RTS
L6845       STA   $AB	; save movement
            ADC   #$55	; 0101_0101
            STA   $AC
L684B       RTS

tblMOVEMENT DB    $80	; space (fire)
            DB    $0B	; left arrow
            DB    $07	; right arrow
            DB    $0E	; A
            DB    $0D	; Z

*-----------------------

L6851       JSR   L681B
            LDA   $AB
            CMP   $AC
            STA   $AC
            BNE   L6876
            JSR   L41B4
            LDA   fgJOYSTICK
            BEQ   L686E
            LDA   $EC
            CMP   $ED
            STA   $ED
            BEQ   L686E
            STA   $A9
L686E       JSR   L68E0
            LDA   #$0F
            STA   $EC
            RTS

L6876       STA   $9B
            LDA   $9B
            BMI   L686E
            ROR   $9B
            BCC   L688E
            ROR   $9B
            BCC   L689E
            ROR   $9B
            BCC   L68B6
            ROR   $9B
            BCC   L68C6
            BCS   L686E
L688E       LDA   $A9
            AND   #$02
            BEQ   L68AE
            LDA   #$0C
            AND   $A9
            ORA   #$02
            STA   $A9
            BNE   L686E
L689E       LDA   $A9
            AND   #$01
            BEQ   L68AE
            LDA   #$0C
            AND   $A9
            ORA   #$01
            STA   $A9
            BNE   L686E
L68AE       LDA   #$03
            ORA   $A9
            STA   $A9
            BNE   L686E
L68B6       LDA   $A9
            AND   #$08
            BEQ   L68D8
            LDA   #$03
            AND   $A9
            ORA   #$08
            STA   $A9
            BNE   L686E
L68C6       LDA   $A9
            AND   #$04
            BEQ   L68D8
            LDA   $A9
            LDA   #$03
            AND   $A9
            ORA   #$04
            STA   $A9
            BNE   L686E
L68D8       LDA   #$0C
            ORA   $A9
            STA   $A9
            BNE   L686E
L68E0       LDA   #$00
            STA   $DA
            LDA   $A9
            AND   #$01
            BNE   L68ED
            JSR   L6994
L68ED       LDA   $A9
            AND   #$02
            BNE   L68F6
            JSR   L6998
L68F6       LDA   $A9
            AND   #$04
            BNE   L68FF
            JSR   L6945
L68FF       LDA   $A9
            AND   #$08
            BNE   L6908
            JSR   L696B
L6908       LDA   $A9
            AND   #$0C
            EOR   #$0C
            BNE   L6916
            STA   L6944
            STA   L6943
L6916       LDA   $B0
            BPL   L6924
            LDA   #$F8
            STA   $AF
            LDA   #$01
            STA   $B0
            BNE   L6935
L6924       SEC
            LDA   $AF
            SBC   #$F8
            LDA   $B0
            SBC   #$01
            BMI   L6935
            LDA   #$00
            STA   $AF
            STA   $B0
L6935       SEC
            LDA   #$F8
            SBC   $AF
            STA   $AD
            LDA   #$01
            SBC   $B0
            STA   $AE
            RTS

L6943       DB    $00
L6944       DB    $00

L6945       LDA   #$02
            CLC
            ADC   L6943
            STA   L6943
            CMP   #$07
            BCC   L6954
            LDA   #$07
L6954       STA   L6943
            LDA   L6943
            LDX   #$00
            STX   L6944
            CLC
            ADC   $AF
            STA   $AF
            LDA   #$00
            ADC   $B0
            STA   $B0
            RTS

L696B       LDA   #$02
            CLC
            ADC   L6944
            STA   L6944
            CMP   #$07
            BCC   L697A
            LDA   #$07
L697A       STA   L6944
            LDA   L6944
            LDX   #$00
            STX   L6943
            SEC
            LDA   $AF
            SBC   L6944
            STA   $AF
            LDA   $B0
            SBC   #$00
            STA   $B0
            RTS

L6994       LDA   #$00
            BEQ   L699A
L6998       LDA   #$01
L699A       STA   $DA
            LDX   #$0A
L699E       LDA   $D0,X
            STA   $C1,X
            DEX
            BPL   L699E
            JSR   L5675
            LDX   #$0A
L69AA       LDA   $C1,X
            STA   $D0,X
            DEX
            BPL   L69AA
            RTS

L69B2       DB    $00

L69B3       LDA   joyBTN
            BNE   L6A06
            LDA   L6CCD
            CMP   #$0E
            BEQ   L69C3
            LDA   L69B2
            BNE   L6A06
L69C3       LDA   #$08
            STA   L69B2
            LDX   #$0A
L69CA       LDA   $D0,X
            STA   L6CCE,X
            DEX
            BPL   L69CA
            LDA   #$00
            STA   L6CD8
            LDA   #$07
            STA   L6CCD
            STA   joyBTN
            TAY
            LDA   L7D5F,Y
            STA   L6CD7
            JSR   L78E5
            LDA   #$65
            STA   $E5
            LDX   #$18
            LDA   L6CCE
            STA   L99B3,X
            LDA   L6CCF
            STA   L99B3+1,X
            LDA   L6CD1
            STA   L99B3+2,X
            LDA   L6CD2
            STA   L99B3+3,X
L6A06       RTS

L6A07       LDA   L69B2
            BEQ   L6A11
            DEC   L69B2
            BNE   L6A06
L6A11       LDA   #$00
            STA   L6CCD
            RTS

L6A17       DB    $A0

L6A18       LDA   L6B27
            BPL   L6A25
            LDA   L69B2
            BEQ   L6A26
            LSR
            BCC   L6A26
L6A25       RTS

L6A26       LDA   L6A17
            BEQ   L6A3E
            LDA   #<L7A80
            STA   $84
            LDA   #>L7A80
            STA   $84+1
            LDA   #<L7AC0
            STA   ptrSTRING
            LDA   #>L7AC0
            STA   ptrSTRING+1
            JMP   L6A4E

L6A3E       LDA   #<L7A00
            STA   $84
            LDA   #>L7A00
            STA   $84+1
            LDA   #<L7A40
            STA   ptrSTRING
            LDA   #>L7A40
            STA   ptrSTRING+1
L6A4E       LDX   #$5E
L6A50       LDY   #$03
            CLC
            LDA   tblPAGE2L,X
            ADC   #$11
            STA   $9B
            LDA   tblPAGE2H,X
            ADC   #$00
            STA   $9C
L6A61       LDA   ($84),Y
            BEQ   L6A69
            ORA   ($9B),Y
            STA   ($9B),Y
L6A69       DEY
            BPL   L6A61
            INX
            CLC
            LDA   #$04
            ADC   $84
            STA   $84
            LDA   #$00
            ADC   $85
            STA   $85
            CPX   #$6E
            BNE   L6A50
            LDX   #$80
L6A80       LDY   #$03
            CLC
            LDA   tblPAGE2L,X
            ADC   #$11
            STA   $9B
            LDA   tblPAGE2H,X
            ADC   #$00
            STA   $9C
L6A91       LDA   (ptrSTRING),Y
            BEQ   L6A99
            ORA   ($9B),Y
            STA   ($9B),Y
L6A99       DEY
            BPL   L6A91
            INX
            CLC
            LDA   #$04
            ADC   ptrSTRING
            STA   ptrSTRING
            LDA   #$00
            ADC   ptrSTRING+1
            STA   ptrSTRING+1
            CPX   #$90
            BNE   L6A80
            RTS

*-----------------------

L6AAF       DB    $55
            DB    $70
            DB    $6E
            DB    $48
            DB    $55
            DB    $70
            DB    $7D
            DB    $8C
            DB    $55
            DB    $70
            DB    $26
            DB    $40
            DB    $55
            DB    $70
            DB    $4B
            DB    $98
            DB    $55
            DB    $70
            DB    $43
            DB    $70
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L6AC7       DB    $26
            DB    $48
            DB    $18
            DB    $60
            DB    $42
            DB    $5C
            DB    $3F
            DB    $4A
            DB    $43
            DB    $70
            DB    $43
            DB    $78
            DB    $4B
            DB    $98
            DB    $50
            DB    $A3
            DB    $7D
            DB    $8C
            DB    $7D
            DB    $98
            DB    $67
            DB    $79
            DB    $81
            DB    $68
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L6AE3       DB    $3F
            DB    $4A
            DB    $46
            DB    $40
            DB    $37
            DB    $58
            DB    $25
            DB    $65
            DB    $28
            DB    $78
            DB    $22
            DB    $66
            DB    $28
            DB    $78
            DB    $22
            DB    $90
            DB    $4C
            DB    $90
            DB    $32
            DB    $A6
            DB    $32
            DB    $A6
            DB    $2A
            DB    $AD
            DB    $50
            DB    $A3
            DB    $53
            DB    $B0
            DB    $50
            DB    $A3
            DB    $4A
            DB    $C0
            DB    $7D
            DB    $98
            DB    $62
            DB    $C0
            DB    $7D
            DB    $98
            DB    $8B
            DB    $98
            DB    $8B
            DB    $98
            DB    $92
            DB    $C0
            DB    $81
            DB    $68
            DB    $96
            DB    $73
            DB    $96
            DB    $73
            DB    $A5
            DB    $79
            DB    $A5
            DB    $79
            DB    $AF
            DB    $BE
            DB    $A5
            DB    $79
            DB    $B4
            DB    $B9
            DB    $81
            DB    $68
            DB    $87
            DB    $60
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L6B27       DB    $FF
L6B28       DB    $A0
L6B29       DB    $A0
            DB    $A0

L6B2B       DA    L6AE3
            DA    L6AC7
            DA    L6AAF

*-----------------------

L6B31       LDA   L6B27
            BPL   L6B37
            RTS

L6B37       LDA   #$02
            STA   L6B28
L6B3C       LDA   L6B28
            ASL
            TAX
            LDA   L6B2B,X
            STA   $80
            INX
            LDA   L6B2B,X
            STA   $81
            LDY   #$00
L6B4E       LDA   ($80),Y
            CMP   #$FF
            BEQ   L6B72
            STA   X1
            INY
            LDA   ($80),Y
            STA   Y1
            INY
            LDA   ($80),Y
            STA   X2
            INY
            LDA   ($80),Y
            STA   Y2
            INY
            STY   L6B29
            JSR   drawLINE
            LDY   L6B29
            JMP   L6B4E

L6B72       LDA   L6B28
            CMP   L6B27
            BEQ   L6B81
            DEC   L6B28
            BMI   L6B81
            BPL   L6B3C
L6B81       DEC   L6B27
            RTS

L6B85       DB    $00
            DB    $02
            DB    $00
            DB    $04
            DB    $00
            DB    $06
            DB    $06
            DB    $02
            DB    $06
            DB    $04
            DB    $04
            DB    $02
            DB    $FF
            DB    $FF
            DB    $FB
            DB    $F5
            DB    $05
            DB    $F5
            DB    $FB
            DB    $0B
            DB    $05
            DB    $0B
            DB    $FF
            DB    $FF
L6B9D       DB    $00
            DB    $02
            DB    $04
            DB    $06
            DB    $08
            DB    $0A
            DB    $0C
            DB    $0E
            DB    $10
            DB    $12
            DB    $14
            DB    $16
            DB    $18
            DB    $1A
            DB    $1C
            DB    $1E
            DB    $20
            DB    $22
            DB    $24
            DB    $26
            DB    $28
            DB    $2A
            DB    $FF
            DB    $FF
            DB    $DA
            DB    $DA
            DB    $DB
            DB    $DB
            DB    $EE
            DB    $E7
            DB    $EF
            DB    $E8
            DB    $11
            DB    $DD
            DB    $12
            DB    $DE
            DB    $1B
            DB    $00
            DB    $1C
            DB    $01
            DB    $11
            DB    $16
            DB    $12
            DB    $17
            DB    $16
            DB    $2A
            DB    $17
            DB    $2B
            DB    $FD
            DB    $23
            DB    $FE
            DB    $24
            DB    $E4
            DB    $2D
            DB    $E5
            DB    $2E
            DB    $DA
            DB    $19
            DB    $DB
            DB    $1A
            DB    $E4
            DB    $FD
            DB    $E5
            DB    $FE
            DB    $EE
            DB    $E7
            DB    $EF
            DB    $E8
            DB    $FF
            DB    $FF
            DB    $E7
            DB    $E7
            DB    $E8
            DB    $E8
            DB    $F4
            DB    $EF
            DB    $F5
            DB    $F0
            DB    $0B
            DB    $E8
            DB    $0C
            DB    $E9
            DB    $12
            DB    $00
            DB    $13
            DB    $01
            DB    $0B
            DB    $0F
            DB    $0C
            DB    $10
            DB    $0F
            DB    $1C
            DB    $10
            DB    $1D
            DB    $FE
            DB    $17
            DB    $FF
            DB    $18
            DB    $ED
            DB    $1E
            DB    $EE
            DB    $1F
            DB    $E7
            DB    $10
            DB    $E8
            DB    $11
            DB    $ED
            DB    $FE
            DB    $EE
            DB    $FF
            DB    $F4
            DB    $EF
            DB    $F5
            DB    $F0
            DB    $FF
            DB    $FF
            DB    $ED
            DB    $ED
            DB    $EE
            DB    $EE
            DB    $F7
            DB    $F3
            DB    $F8
            DB    $F4
            DB    $08
            DB    $EE
            DB    $09
            DB    $EF
            DB    $0D
            DB    $00
            DB    $0E
            DB    $01
            DB    $08
            DB    $0B
            DB    $09
            DB    $0C
            DB    $0B
            DB    $15
            DB    $0C
            DB    $16
            DB    $FE
            DB    $11
            DB    $FF
            DB    $12
            DB    $F2
            DB    $16
            DB    $F3
            DB    $17
            DB    $ED
            DB    $0C
            DB    $EE
            DB    $0D
            DB    $F2
            DB    $FE
            DB    $F3
            DB    $FF
            DB    $F7
            DB    $F3
            DB    $F8
            DB    $F4
            DB    $FF
            DB    $FF
            DB    $F1
            DB    $F1
            DB    $F2
            DB    $F2
            DB    $F9
            DB    $F6
            DB    $FA
            DB    $F7
            DB    $07
            DB    $F2
            DB    $08
            DB    $F3
            DB    $0B
            DB    $00
            DB    $0C
            DB    $01
            DB    $07
            DB    $09
            DB    $08
            DB    $0A
            DB    $09
            DB    $11
            DB    $0A
            DB    $12
            DB    $FF
            DB    $0E
            DB    $00
            DB    $0F
            DB    $F5
            DB    $12
            DB    $F6
            DB    $13
            DB    $F1
            DB    $0A
            DB    $F2
            DB    $0B
            DB    $F5
            DB    $FF
            DB    $F6
            DB    $00
            DB    $F9
            DB    $F6
            DB    $FA
            DB    $F7
            DB    $FF
            DB    $FF
L6C6D       DB    $03
L6C6E       DB    $00
L6C6F       DB    $40
L6C70       DB    $00
L6C71       DB    $00
L6C72       DB    $C0
L6C73       DB    $00
L6C74       DB    $00
            DB    $10
            DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $00
L6C7B       DB    $00
            DB    $A0
            DB    $04
            DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $C0
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $03
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $A0
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $A0
            DB    $B6
            DB    $A0
            DB    $03
            DB    $00
            DB    $90
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $03
            DB    $00
            DB    $50
            DB    $00
            DB    $00
            DB    $30
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $A0
            DB    $B8
            DB    $A0
L6CBD       DB    $00
L6CBE       DB    $00
L6CBF       DB    $00
L6CC0       DB    $00
L6CC1       DB    $00
L6CC2       DB    $00
L6CC3       DB    $00
            DB    $00
            DB    $01
            DB    $00
L6CC7       DB    $80
L6CC8       DB    $00
            DB    $00
            DB    $B5
            DB    $A0
            DB    $A0
L6CCD       DB    $00
L6CCE       DB    $00
L6CCF       DB    $00
            DB    $00
L6CD1       DB    $00
L6CD2       DB    $00
            DB    $00
            DB    $00
            DB    $3F
            DB    $00
L6CD7       DB    $80
L6CD8       DB    $00
            DB    $00
            DB    $C3
            DB    $A0
            DB    $A0
L6CDD       DB    $00
            DB    $00
L6CDF       DB    $40
            DB    $00
            DB    $00
L6CE2       DB    $80
            DB    $00
            DB    $00
L6CE5       DB    $3B
            DB    $01
L6CE7       DB    $80
            DB    $00
            DB    $00
            DB    $A0
L6CEB       DB    $CE
            DB    $A0
            DB    $03
            DB    $00
            DB    $C0
            DB    $00
            DB    $00
            DB    $C0
            DB    $00
            DB    $00
            DB    $FC
            DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $A0
            DB    $A0
            DB    $A0
            DB    $04
            DB    $00
            DB    $C0
            DB    $00
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $7E
            DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $A0
            DB    $A0
            DB    $CC
L6D0D       DB    $00
            DB    $00
L6D0F       DB    $C0
            DB    $00
            DB    $00
            DB    $40
            DB    $00
L6D14       DB    $00
L6D15       DB    $00
L6D16       DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $A0
            DB    $C6
            DB    $A0
L6D1D       DB    $00
            DB    $00
            DB    $C0
            DB    $00
            DB    $00
L6D22       DB    $40
            DB    $00
L6D24       DB    $00
L6D25       DB    $00
L6D26       DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $FF
            DB    $A0
            DB    $C4
L6D2D       DB    $00
            DB    $00
L6D2F       DB    $C0
            DB    $00
            DB    $00
            DB    $40
            DB    $00
L6D34       DB    $00
L6D35       DB    $00
L6D36       DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $A0
            DB    $A0
            DB    $A0
L6D3D       DB    $00
            DB    $00
            DB    $C0
            DB    $00
            DB    $00
L6D42       DB    $40
            DB    $00
L6D44       DB    $00
L6D45       DB    $00
L6D46       DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $CE
            DB    $A0
            DB    $A0
L6D4D       DB    $00
            DB    $00
            DB    $C0
            DB    $00
            DB    $00
            DB    $40
            DB    $00
L6D54       DB    $00
L6D55       DB    $00
L6D56       DB    $00
            DB    $80
            DB    $00
            DB    $00
            DB    $A0
            DB    $A0
            DB    $A0
L6D5D       DB    $06
L6D5E       DB    $00
L6D5F       DB    $A0
L6D60       DB    $00
L6D61       DB    $00
L6D62       DB    $80
            DB    $00
L6D64       DB    $00
L6D65       DB    $00
L6D66       DB    $00
L6D67       DB    $00
L6D68       DB    $00
L6D69       DB    $00
L6D6A       DB    $B2
            DB    $A0
            DB    $A0
            DB    $FF
            DB    $FF
            DB    $C1
            DB    $8D
            DB    $D2
            DB    $CC
            DB    $D2
            DB    $A0
            DB    $B1
            DB    $D4
            DB    $A0
            DB    $C5
            DB    $A0
            DB    $A0
            DB    $80
            DB    $A0
            DB    $AE
            DB    $97
L6D7F       DB    $00

L6D80       LDA   L6D7F
            ASL
            ASL
            ASL
            ASL
            TAY
            LDX   #$00
L6D8A       LDA   L6C6D,Y
            STA   $C0,X
            INY
            INX
            CPX   #$0E
            BNE   L6D8A
            RTS

L6D96       LDA   L6D7F
            ASL
            ASL
            ASL
            ASL
            TAY
            LDX   #$00
L6DA0       LDA   $C0,X
            STA   L6C6D,Y
            INY
            INX
            CPX   #$0E
            BNE   L6DA0
            LDA   $A2
            STA   L6C6D,Y
            RTS

L6DB1       LDX   #$FF
            STX   L6D7F
L6DB6       INC   L6D7F
            LDX   L6D7F
            CPX   #$10
            BEQ   L6DF5
            JSR   L6D80
            LDA   $C0
            BEQ   L6DB6
            JSR   L6FC8
            LDA   $C0
            CMP   #$03
            BNE   L6DD3
            JMP   L6DD7

L6DD3       CMP   #$04
            BNE   L6DDA
L6DD7       JSR   L6FD4
L6DDA       LDA   $CA
            BMI   L6DE1
            JSR   L759D
L6DE1       LDA   $C0
            CMP   #$05
            BEQ   L6DFD
            LDA   L096F
            BNE   L6DEF
            JSR   L50A1
L6DEF       JSR   L6D96
            JMP   L6DB6

L6DF5       LDX   #$FF
            STX   L6D7F
            JMP   L6FD4

L6DFD       LDA   L096F
            BNE   L6DB6
            JSR   L6F9D
            LDA   L6CDD
            BEQ   L6DB6
            LDA   $C7
            PHA
            SEC
            SBC   #$03
            STA   $C7
            JSR   L50A1
            PLA
            STA   $C7
            JSR   L6D96
            JSR   L6FD4
            JMP   L6DB6

L6E21       DB    $00

L6E22       JSR   L4F12
            LDA   L6D7F
            ASL
            ASL
            ASL
            ASL
            TAY
            LDX   L6C6D,Y
            LDA   #$00
            STA   L6C6D,Y
            STA   L7B0B
            STA   L73BD
            LDA   #$08
            STA   L6D0D
            LDA   #$09
            STA   L6D1D
            LDA   #$0A
            STA   L6D2D
            LDA   #$0B
            STA   L6D3D
            CPX   #$02
            BEQ   L6E55
            LDA   #$0C
L6E55       STA   L6D4D
            INY
            LDX   #$01
L6E5B       LDA   L6C6D,Y
            STA   L6D0D,X
            STA   L6D1D,X
            STA   L6D2D,X
            STA   L6D3D,X
            STA   L6D4D,X
            INX
            INY
            CPX   #$10
            BNE   L6E5B
            LDA   #$01
            STA   L6E21
            JMP   L78F5
            RTS

L6E7C       LDA   L096F
            BMI   L6E82
            RTS

L6E82       LDA   L6E21
            BNE   L6E88
            RTS

L6E88       INC   L6E21
            LDA   L6E21
            CMP   #$0A
            BNE   L6E95
            JMP   L6F72

L6E95       LDY   #$F8
            LDA   #$0A
            LSR
            CMP   L6E21
            BPL   L6EA1
            LDY   #$07
L6EA1       CLC
            TYA
            ADC   L6D14
            STA   L6D14
            CLC
            TYA
            ADC   L6D24
            STA   L6D24
            CLC
            TYA
            ADC   L6D34
            STA   L6D34
            CLC
            TYA
            ADC   L6D44
            STA   L6D44
            CLC
            TYA
            ADC   L6D54
            STA   L6D54
            SEC
            LDA   L6D15
            SBC   #$3F
            STA   L6D15
            LDA   L6D16
            SBC   #$00
            BPL   L6EE0
            LDA   #$F8
            STA   L6D15
            LDA   #$01
L6EE0       STA   L6D16
            SEC
            LDA   L6D25
            SBC   #$3F
            STA   L6D25
            LDA   L6D26
            SBC   #$00
            BPL   L6EFA
            LDA   #$F8
            STA   L6D25
            LDA   #$01
L6EFA       STA   L6D26
            SEC
            LDA   L6D35
            SBC   #$3F
            STA   L6D35
            LDA   L6D36
            SBC   #$00
            BPL   L6F14
            LDA   #$F8
            STA   L6D35
            LDA   #$01
L6F14       STA   L6D36
            SEC
            LDA   L6D45
            SBC   #$3F
            STA   L6D45
            LDA   L6D46
            SBC   #$00
            BPL   L6F2E
            LDA   #$F8
            STA   L6D45
            LDA   #$01
L6F2E       STA   L6D46
            SEC
            LDA   L6D55
            SBC   #$3F
            STA   L6D55
            LDA   L6D56
            SBC   #$00
            BPL   L6F48
            LDA   #$F8
            STA   L6D55
            LDA   #$01
L6F48       STA   L6D56
            LDY   #$03
            CLC
            TYA
            ADC   L6D0F
            STA   L6D0F
            CLC
            TYA
            ADC   L6D22
            STA   L6D22
            STY   $9B
            SEC
            LDA   L6D2F
            SBC   $9B
            STA   L6D2F
            SEC
            LDA   L6D42
            SBC   $9B
            STA   L6D42
            RTS

L6F72       LDA   #$00
            STA   L6E21
            STA   L6D4D
            STA   L6D3D
            STA   L6D2D
            STA   L6D0D
            STA   L6D1D
            STA   L7CF6
            STA   L7B0C
            STA   L7CF7
            STA   L6D5D
            STA   $B6
            LDA   #$0A
            STA   L7F76
            JMP   L714C

L6F9C       DB    $00

L6F9D       LDY   L6F9C
            BNE   L6FA3
            RTS

L6FA3       LDA   #$00
            STA   L7E55
            LDA   #$80
            STA   L6CE7
            DEC   L6F9C
            LDA   L6F9C
            BNE   L6FC5
            STA   L6CDD
            JSR   L714C
            STA   $C0
            LDA   #$FF
            STA   L7E52
            STA   L7E53
L6FC5       ROR
            BCS   L6FD4
L6FC8       LDX   #$0D
L6FCA       LDA   L79E4,X
            STA   tblBITON,X
            DEX
            BPL   L6FCA
            RTS

L6FD4       LDX   #$0D
L6FD6       LDA   L79D6,X
            STA   tblBITON,X
            DEX
            BPL   L6FD6
            RTS

L6FE0       DB    $00
L6FE1       DB    $02
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $40
            DB    $03
            DB    $80
            DB    $02
            DB    $40
            DB    $03
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $00
            DB    $02
            DB    $00
            DB    $02
L7000       LDA   L6CCD
            CMP   #$07
            BEQ   L7008
            RTS

L7008       LDA   #$FF
            STA   L6D7F
L700D       INC   L6D7F
            LDA   L6D7F
            CMP   #$10
            BNE   L7018
            RTS

L7018       ASL
            ASL
            ASL
            ASL
            TAX
            LDA   L6C6D,X
            BEQ   L700D
            CMP   #$07
            BPL   L700D
            ASL
            TAY
            LSR
            CLC
            LDA   L6FE0,Y
            ADC   L6CCE
            STA   ptrSTRING
            LDA   L6FE1,Y
            ADC   L6CCF
            STA   ptrSTRING+1
            SEC
            LDA   L6C6E,X
            SBC   ptrSTRING
            LDA   L6C6F,X
            SBC   ptrSTRING+1
            BCS   L700D
            SEC
            LDA   L6CCE
            SBC   L6FE0,Y
            STA   ptrSTRING
            LDA   L6CCF
            SBC   L6FE1,Y
            STA   ptrSTRING+1
            SEC
            LDA   ptrSTRING
            SBC   L6C6E,X
            LDA   ptrSTRING+1
            SBC   L6C6F,X
            BCS   L700D
            CLC
            LDA   L6FE0,Y
            ADC   L6CD1
            STA   ptrSTRING
            LDA   L6FE1,Y
            ADC   L6CD2
            STA   ptrSTRING+1
            SEC
            LDA   L6C71,X
            SBC   ptrSTRING
            LDA   L6C72,X
            SBC   ptrSTRING+1
            BCS   L700D
            SEC
            LDA   L6CD1
            SBC   L6FE0,Y
            STA   ptrSTRING
            LDA   L6CD2
            SBC   L6FE1,Y
            STA   ptrSTRING+1
            SEC
            LDA   ptrSTRING
            SBC   L6C71,X
            LDA   ptrSTRING+1
            SBC   L6C72,X
            BCC   L70A4
            JMP   L700D

L70A4       LDA   L6C6D,X
            CMP   #$07
            BEQ   L7108
            CMP   #$03
            BEQ   L710C
            CMP   #$04
            BEQ   L710C
            CMP   #$02
            BNE   L70CA
            LDA   L6D64
            BEQ   L70BF
            JMP   L700D

L70BF       LDA   #$02
            JSR   L7144
            JSR   L6E22
            JMP   L7131

L70CA       CMP   #$01
            BNE   L70DE
            LDA   L7143
            BNE   L7108
            LDA   #$03
            JSR   L7144
            JSR   L6E22
            JMP   L7131

L70DE       CMP   #$06
            BNE   L70F2
            LDA   L7143
            BNE   L7108
            LDA   #$01
            JSR   L7144
            JSR   L6E22
            JMP   L7131

L70F2       CMP   #$05
            BNE   L7108
            LDA   L6F9C
            BNE   L7108
            LDA   #$05
            JSR   L7144
            LDA   #$09
            STA   L6F9C
            JMP   L7131
L7108       JMP   L700D

            DB    $00

L710C       LDA   L6C70,X
            STA   $9B
            LDA   L6C73,X
            STA   $9C
            CMP   #$FF
            BNE   L711D
            JMP   L7131

L711D       LDA   $E5
            INC   $9B
            INC   $9B
            CMP   $9B
            BCS   L712E
            CMP   $9C
            BCC   L712E
            JMP   L7131
L712E       JMP   L700D

L7131       LDY   #$03
            STY   L69B2
            LDA   #$0E
            STA   L6CCD
            LDA   #$80
            STA   L6CD7
            RTS

L7141       DB    $00
L7142       DB    $00
L7143       DB    $00

L7144       CLC
            ADC   L7143
            STA   L7143
            RTS

L714C       LDA   L7143
            BEQ   L7159
            JSR   L715A
            LDA   #$00
            STA   L7143
L7159       RTS

L715A       PHA
            LDA   #$00
            STA   L7141
            STA   L7142
            LDX   curPLAYER
            LDA   $97,X
            CMP   #$0F
            BCC   L716F
            CMP   #$64
            BCC   L7174
L716F       INC   L7141
            BNE   L7177
L7174       INC   L7142
L7177       PLA
            STA   L63FA
            LDY   curPLAYER
            INY
            STY   L63F9
            LDA   $E2
            BNE   L7195
            JSR   L640B
            LDX   curPLAYER
            LDA   $97,X
            CMP   #$64
            BCC   L71A9
            LDA   L7142
            BNE   L7196
L7195       RTS

L7196       LDA   curLEVEL	; extra life?
            CMP   #$06
            BEQ   L71C3	; nope if level 6

            INC   nbLIVES_P1,X	; yes!
            JSR   L67B7
            JSR   L7879
            JSR   L76B6
            RTS

L71A9       LDX   curLEVEL
            CPX   #$06
            BCS   L71C3
            CMP   #$0F
            BCC   L71C3
            LDA   L7141
            BEQ   L71C3
            LDX   curPLAYER
            INC   nbLIVES_P1,X
            JSR   L7879
            JSR   L67B7
L71C3       RTS

L71C4       DB    $00
L71C5       DB    $00

L71C6       LDA   L71C4
            BEQ   L71CE
            JMP   L7315

L71CE       INC   L54C6
            CLC
            LDA   $D1
            ADC   #$05
            STA   ptrSTRING
            CLC
            LDA   $D1
            ADC   #$02
            STA   ptrSTRINGS
            SEC
            LDA   $D1
            SBC   #$05
            STA   ptrSTRING+1
            SEC
            LDA   $D1
            SBC   #$02
            STA   ptrSTRINGS+1
            CLC
            LDA   $D4
            ADC   #$05
            STA   $80
            CLC
            LDA   $D4
            ADC   #$02
            STA   $84
            SEC
            LDA   $D4
            SBC   #$05
            STA   $81
            SEC
            LDA   $D4
            SBC   #$02
            STA   $85
            LDA   #$FF
            STA   L6D7F
L720E       INC   L6D7F
            LDA   L6D7F
            CMP   #$10
            BNE   L724E
            DEC   L54C6
            LDY   #$00
            STY   $9B
L721F       LDA   $9B
            ASL
            ASL
            ASL
            ASL
            TAX
            LDA   L6C6E,X
            STA   L99B3,Y
            INY
            LDA   L6C6F,X
            STA   L99B3,Y
            INY
            LDA   L6C71,X
            STA   L99B3,Y
            INY
            LDA   L6C72,X
            STA   L99B3,Y
            INY
            INC   $9B
            LDA   $9B
            CMP   #$10
            BNE   L721F
            RTS
L724B       JMP   L720E

L724E       ASL
            ASL
            ASL
            ASL
            TAX
            LDA   L6C6D,X
            BEQ   L720E
            CMP   #$07
            BEQ   L720E
            CMP   #$0D
            BEQ   L7287
            CMP   #$01
            BEQ   L7287
            CMP   #$06
            BEQ   L7287
            CMP   #$02
            BNE   L7277
            TAY
            LDA   L6C74,X
            BEQ   L7277
            CMP   #$F8
            BCC   L720E
            TYA
L7277       CMP   #$08
            BPL   L720E
            CMP   #$0F
            BEQ   L720E
            CMP   #$0E
            BEQ   L724B
            CMP   #$05
            BEQ   L724B
L7287       CMP   #$0D
            BEQ   L72A7
            CMP   #$02
            BEQ   L72A7
            LDA   L6C6F,X
            CMP   ptrSTRING
            BCS   L724B
            CMP   ptrSTRING+1
            BCC   L724B
            LDA   L6C72,X
            CMP   $80
            BCS   L724B
            CMP   $81
            BCC   L724B
            BCS   L72BD
L72A7       LDA   L6C6F,X
            CMP   ptrSTRINGS
            BCS   L724B
            CMP   $8B
            BCC   L724B
            LDA   L6C72,X
            CMP   $84
            BCS   L724B
            CMP   $85
            BCC   L724B
L72BD       LDA   L6C6D,X
            CMP   #$01
            BEQ   L72D2
            CMP   #$06
            BEQ   L72D2
            CMP   #$0D
            BEQ   L7307
            CMP   #$02
            BEQ   L7307
            BNE   L72D2
L72D2       LDA   #$FF
            STA   L71C5
            LDY   #$00
            STY   $9B
L72DB       LDA   $9B
            ASL
            ASL
            ASL
            ASL
            TAX
            LDA   L99B3,Y
            STA   L6C6E,X
            INY
            LDA   L99B3,Y
            STA   L6C6F,X
            INY
            LDA   L99B3,Y
            STA   L6C71,X
            INY
            LDA   L99B3,Y
            STA   L6C72,X
            INY
            INC   $9B
            LDA   $9B
            CMP   #$10
            BNE   L72DB
            RTS

L7307       CMP   #$02
            BNE   L7315
            LDA   #$01
            LDX   curPLAYER
            STA   L80C9,X
            JSR   L6F72
L7315       LDA   #$00
            STA   L54C6
            STA   L71C4
            STA   L096F
            LDX   curPLAYER
            INC   $8F,X
            LDA   #$00
            STA   L6CBD
            STA   L7B67
            JSR   L7377
            LDA   #$02
            STA   L6B27
L7334       JSR   L7377
            LDY   L6B27
            BPL   L7334
            LDA   #$00
            STA   L6B27
            LDA   L6E21
            ORA   L69B2
            BNE   L7334
            LDA   #$00
            STA   L6B27
            JSR   L7377
            LDA   #$00
            STA   L6CBD
            STA   L6CCD
            STA   L7B67
            STA   L69B2
            JSR   L714C
            LDX   curPLAYER
            DEC   nbLIVES_P1,X
            LDA   #$05
            STA   L7F76
            JSR   L67B7
            JSR   L6F72
            PLA
            PLA
            JMP   L0ACB

L7377       JSR   L59DA
            JSR   L4FC0
            LDA   #$05
            STA   L096F
L7382       JSR   L6DB1
            JSR   L73BE
            JSR   L7000
            DEC   L096F
            BPL   L7382
            JSR   L6E7C
            JSR   L6A07
            JSR   L6A18
            JSR   L6B31
            JSR   L4E65
            JSR   L54C7
            LDA   KBD
            BPL   L73AF
            CMP   L1AFD
            BNE   L73AF
            JSR   doPAUSE
L73AF       LDX   KBDSTROBE
            LDX   #$02
L73B4       LDA   #$80
            JSR   WAIT
            DEX
            BPL   L73B4
            RTS

L73BD       DB    $00

L73BE       LDA   L73BD
            BEQ   L73C4
            RTS

L73C4       CLC
            LDA   L6D5F
            ADC   #$05
            STA   ptrSTRING
            SEC
            LDA   L6D5F
            SBC   #$05
            STA   ptrSTRING+1
            CLC
            LDA   L6D62
            ADC   #$05
            STA   $80
            SEC
            LDA   L6D62
            SBC   #$05
            STA   $81
            LDA   #$FF
            STA   L6D7F
L73E9       INC   L6D7F
            LDA   L6D7F
            CMP   #$10
            BNE   L73F4
            RTS

L73F4       ASL
            ASL
            ASL
            ASL
            TAX
            LDA   L6C6D,X
            BEQ   L73E9
            CMP   #$07
            BEQ   L73E9
            CMP   #$0D
            BEQ   L73E9
            CMP   #$0E
            BEQ   L73E9
            CMP   #$0F
            BEQ   L73E9
            LDA   L6C6F,X
            CMP   ptrSTRING
            BCS   L73E9
            CMP   ptrSTRING+1
            BCC   L73E9
            LDA   L6C72,X
            CMP   $80
            BCS   L73E9
            CMP   $81
            BCC   L73E9
            LDA   L6C6D,X
            CMP   #$04
            BEQ   L7430
            CMP   #$03
            BEQ   L7430
            RTS

L7430       LDA   L6D5D
            CMP   #$02
            BEQ   L743D
            LDA   #$32
            STA   L73BD
            RTS

L743D       LDA   L6D64
            BMI   L745A
            LDA   L6C7B,X
            CMP   #$38
            BCC   L744B
            LDA   #$38
L744B       STA   L7D73
            DEC   L7D73
            LSR
            STA   L7D74
            LDA   #$01
            STA   L7D75
L745A       RTS

L745B       LDA   L6CBD
            CMP   #$0D
            BEQ   L7463
            RTS

L7463       JSR   L7563
            LDA   L71C4
            BEQ   L746C
            RTS

L746C       LDA   #$FF
            STA   L6D7F
L7471       INC   L6D7F
            LDA   L6D7F
            CMP   #$10
            BNE   L747C
            RTS

L747C       ASL
            ASL
            ASL
            ASL
            TAX
            LDA   L6C6D,X
            BEQ   L7471
            CMP   #$06
            BPL   L7471
            CMP   #$01
            BEQ   L7471
            ASL
            TAY
            LSR
            CLC
            LDA   L6FE0,Y
            ADC   L6CBE
            STA   ptrSTRING
            LDA   L6FE1,Y
            ADC   L6CBF
            STA   ptrSTRING+1
            SEC
            LDA   L6C6E,X
            SBC   ptrSTRING
            LDA   L6C6F,X
            SBC   ptrSTRING+1
            BCS   L7471
            SEC
            LDA   L6CBE
            SBC   L6FE0,Y
            STA   ptrSTRING
            LDA   L6CBF
            SBC   L6FE1,Y
            STA   ptrSTRING+1
            SEC
            LDA   ptrSTRING
            SBC   L6C6E,X
            LDA   ptrSTRING+1
            SBC   L6C6F,X
            BCS   L7471
            CLC
            LDA   L6FE0,Y
            ADC   L6CC1
            STA   ptrSTRING
            LDA   L6FE1,Y
            ADC   L6CC2
            STA   ptrSTRING+1
            SEC
            LDA   L6C71,X
            SBC   ptrSTRING
            LDA   L6C72,X
            SBC   ptrSTRING+1
            BCS   L7471
            SEC
            LDA   L6CC1
            SBC   L6FE0,Y
            STA   ptrSTRING
            LDA   L6CC2
            SBC   L6FE1,Y
            STA   ptrSTRING+1
            SEC
            LDA   ptrSTRING
            SBC   L6C71,X
            LDA   ptrSTRING+1
            SBC   L6C72,X
            BCC   L750C
L7509       JMP   L7471

L750C       LDA   $E6
            CMP   #$22
            BCC   L7534
            CMP   #$AE
            BCS   L7534
            LDA   #$FF
            CMP   L6CC0
            BEQ   L7534
            CMP   L6CC3
            BEQ   L7534
            LDA   L6C70,X
            CMP   #$FF
            BEQ   L7534
            STA   $9B
            LDA   L6C73,X
            STA   $9C
            CMP   #$FF
            BNE   L7537
L7534       JMP   L7BC4

L7537       LDA   L6C6D,X
            CMP   #$03
            BEQ   L7553
            CMP   #$04
            BEQ   L7553
            CMP   #$05
            BNE   L7509
            LDA   L6F9C
            BNE   L7509
            LDA   #$09
            STA   L6F9C
            JMP   L7BC4

L7553       LDA   $E6
            CMP   $9B
            BCS   L7560
            CMP   $9C
            BCC   L7560
            JMP   L7BC4
L7560       JMP   L7471

L7563       CLC
            LDA   L6CBF
            ADC   #$02
            STA   ptrSTRINGS
            SEC
            LDA   L6CBF
            SBC   #$02
            STA   ptrSTRINGS+1
            CLC
            LDA   L6CC2
            ADC   #$02
            STA   $84
            SEC
            LDA   L6CC2
            SBC   #$02
            STA   $85
            LDA   $D1
            CMP   ptrSTRINGS
            BCS   L759C
            CMP   $8B
            BCC   L759C
            LDA   $D4
            CMP   $84
            BCS   L759C
            CMP   $85
            BCC   L759C
            LDA   #$01
            STA   L71C4
L759C       RTS

L759D       LDA   $C8
            LDX   $C9
            JSR   L4F1E
            LDA   L4C22
            STA   $9B
            LDA   #$00
            STA   $9C
            LDA   $CA
            ASL
            TAX
            LDA   L57AB,X
            STA   $9D
            LDA   L57AC,X
            STA   $9E
            LDA   L73BD
            BEQ   L75C4
            ASL   $9D
            ROL   $9E
L75C4       LDA   $9D
            PHA
            LDA   $9E
            PHA
            JSR   L08D9
            LDA   $9E
            STA   ptrSTRING
            LDA   $9B
            STA   ptrSTRING+1
            LDA   L4C23
            STA   $9B
            LDA   #$00
            STA   $9C
            PLA
            STA   $9E
            PLA
            STA   $9D
            JSR   L08D9
            LDX   $9E
            LDA   $9B
            STX   $9B
            STA   $9C
            LDA   L4C2C
            STA   L5674
            LDA   L4C2D
            STA   L5671
            LDA   L5671
            EOR   $CB
            BNE   L7612
            CLC
            LDA   $9B
            ADC   $C1
            STA   $C1
            LDA   $9C
            ADC   $C2
            STA   $C2
            JMP   L761F

L7612       SEC
            LDA   $C1
            SBC   $9B
            STA   $C1
            LDA   $C2
            SBC   $9C
            STA   $C2
L761F       LDA   L5674
            EOR   $CB
            BNE   L7636
            CLC
            LDA   ptrSTRING
            ADC   $C4
            STA   $C4
            LDA   ptrSTRING+1
            ADC   $C5
            STA   $C5
            JMP   L7643

L7636       SEC
            LDA   $C4
            SBC   ptrSTRING
            STA   $C4
            LDA   $C5
            SBC   ptrSTRING+1
            STA   $C5
L7643       RTS

*-----------------------

playINTROMUSIC
            LDA   fgSOUND
            BEQ   L7661
            LDA   KBDSTROBE
            JSR   L76B6
            LDA   fgJOYSTICK
            BEQ   L765C
            LDA   BUTN0
            BPL   L765C
            LDA   #$A0
            BNE   L7661
L765C       LDA   KBD
            BPL   L7664
L7661       JMP   L76B5

L7664       JSR   L76B6
            LDA   KBD
            BPL   L766F
            JMP   L76B5

L766F       LDA   #$1A
            STA   $9F
            LDY   #$00
L7675       LDA   L76F5,Y
            STA   L772B
            INY
            LDA   L76F5,Y
            STA   L772A
            TYA
            PHA
            JSR   L772C
            PLA
            TAY
            INY
            CPY   $9F
            BNE   L7675
            LDA   KBD
            BPL   L7696
            JMP   L76B5

L7696       LDA   #$1A
            STA   $9F
            LDY   #$00
L769C       LDA   L770F,Y
            STA   L772B
            INY
            LDA   L770F,Y
            STA   L772A
            TYA
            PHA
            JSR   L772C
            PLA
            TAY
            INY
            CPY   $9F
            BNE   L769C
L76B5       RTS

L76B6       LDA   fgSOUND
            BEQ   L76B5
            LDA   #$20
            STA   L7729
            LDA   #$16
            STA   $9F
            LDY   #$00
L76C5       LDA   L76DF,Y
            STA   L772B
            INY
            LDA   L76DF,Y
            STA   L772A
            TYA
            PHA
            JSR   L772C
            PLA
            TAY
            INY
            CPY   $9F
            BNE   L76C5
            RTS

L76DF       DB    $11
            DB    $24
            DB    $16
            DB    $24
            DB    $18
            DB    $24
            DB    $1A
            DB    $24
            DB    $18
            DB    $24
            DB    $16
            DB    $24
            DB    $18
            DB    $24
            DB    $1A
            DB    $48
            DB    $16
            DB    $48
            DB    $16
            DB    $90
            DB    $00
            DB    $24
L76F5       DB    $13
            DB    $24
            DB    $18
            DB    $24
            DB    $1A
            DB    $24
            DB    $18
            DB    $24
            DB    $13
            DB    $24
            DB    $0F
            DB    $24
            DB    $13
            DB    $24
            DB    $18
            DB    $24
            DB    $13
            DB    $24
            DB    $0F
            DB    $24
            DB    $13
            DB    $24
            DB    $18
            DB    $90
            DB    $00
            DB    $24
L770F       DB    $11
            DB    $24
            DB    $16
            DB    $24
            DB    $18
            DB    $24
            DB    $16
            DB    $24
            DB    $11
            DB    $24
            DB    $0E
            DB    $24
            DB    $11
            DB    $24
            DB    $16
            DB    $24
            DB    $11
            DB    $24
            DB    $0E
            DB    $24
            DB    $11
            DB    $24
            DB    $16
            DB    $90
            DB    $00
L7728       DB    $24
L7729       DB    $A0
L772A       DB    $A0
L772B       DB    $A0

*-----------------------

L772C       JMP   L7763

L772F       LDY   $9C
            LDA   SPKR
L7734       INC   $9D
            BNE   L773D
            INC   $9E
            BNE   L7741
            RTS

L773D       NOP
            JMP   L7741

L7741       DEY
            BEQ   L7749
            JMP   L7747

L7747       BNE   L7734
L7749       LDY   $9B
            LDA   SPKR
L774E       INC   $9D
            BNE   L7757
            INC   $9E
            BNE   L775B
            RTS

L7757       NOP
            JMP   L775B

L775B       DEY
            BEQ   L772F
            JMP   L7761

L7761       BNE   L774E
L7763       LDA   L772B
            ASL
            TAY
            LDA   L77AB,Y
            STA   $9B
            LDA   L7729
L7770       LSR
            BEQ   L7777
            LSR   $9B
            BNE   L7770
L7777       LDA   L77AB,Y
            SEC
            SBC   $9B
            STA   $9C
            INY
            LDA   L77AB,Y
            ADC   $9B
            STA   $9B
            LDA   #$00
            SEC
            SBC   L772A
            STA   $9E
            LDA   #$00
            STA   $9D
            LDA   $9C
            BNE   L772F
L7797       NOP
            NOP
            JMP   L779C

L779C       INC   $9D
            BNE   L77A5
            INC   $9E
            BNE   L77A9
            RTS

L77A5       NOP
            JMP   L77A9
L77A9       BNE   L7797

*-----------------------

L77AB       DB    $00
            DB    $00
            DB    $F6
            DB    $F6
            DB    $E8
            DB    $E8
            DB    $DB
            DB    $DB
            DB    $CF
            DB    $CF
            DB    $C3
            DB    $C3
            DB    $B8
            DB    $B8
            DB    $AE
            DB    $AE
            DB    $A4
            DB    $A4
            DB    $9B
            DB    $9B
            DB    $92
            DB    $92
            DB    $8A
            DB    $8A
            DB    $82
            DB    $82
            DB    $7B
            DB    $7B
            DB    $74
            DB    $74
            DB    $6D
            DB    $6E
            DB    $67
            DB    $68
            DB    $61
            DB    $62
            DB    $5C
            DB    $5C
            DB    $57
            DB    $57
            DB    $52
            DB    $52
            DB    $4D
            DB    $4E
            DB    $49
            DB    $49
            DB    $45
            DB    $45
            DB    $41
            DB    $41
            DB    $3D
            DB    $3E
            DB    $3A
            DB    $3A
            DB    $36
            DB    $37
            DB    $33
            DB    $34
            DB    $30
            DB    $31
            DB    $2E
            DB    $2E
            DB    $2B
            DB    $2C
            DB    $29
            DB    $29
            DB    $26
            DB    $27
            DB    $24
            DB    $25
            DB    $22
            DB    $23
            DB    $20
            DB    $21
            DB    $1E
            DB    $1F
            DB    $1D
            DB    $1D
            DB    $1B
            DB    $1C
            DB    $1A
            DB    $1A
            DB    $18
            DB    $19
            DB    $17
            DB    $17
            DB    $15
            DB    $16
            DB    $14
            DB    $15
            DB    $13
            DB    $14
            DB    $12
            DB    $12
            DB    $11
            DB    $11
            DB    $10
            DB    $10
            DB    $0F
            DB    $10
            DB    $0E
            DB    $0F
L7811       DB    $A0
L7812       DB    $A0

L7813       LDA   SPKR
            LDY   L7811
L7819       DEY
            BNE   L7819
            RTS

            LDA   SPKR
            LDX   L7812
            LDY   L7811
L7826       DEY
            BNE   L7826
            DEX
            BNE   L7826
            RTS

L782D       LDA   fgSOUND
            BEQ   L784D
            LDA   #$80
            LDY   L6F9C
            BEQ   L783A
            LDA   #$40
L783A       STA   L7811
            JSR   L7813
            JSR   L7813
            DEC   L7811
            LDA   L7811
            CMP   #$20
            BNE   L783A
L784D       RTS

L784E       LDA   fgSOUND
            BEQ   L784D
            LDA   #$98
            STA   L7811
            LDX   #$30
L7859       JSR   L7813
            LDA   #$00
            BEQ   L7860
L7860       JSR   L7813
            DEX
            BNE   L7859
            LDX   #$28
L7868       JSR   L7813
            NOP
            NOP
            NOP
            NOP
            JSR   L7813
            DEC   L7811
            DEX
            BNE   L7868
            RTS

L7879       LDA   fgSOUND
            BEQ   L78A1
            LDX   #$04
            LDA   #$20
            STA   L7729
L7884       LDA   #$30
            STA   L772B
            LDA   #$20
            STA   L772A
            JSR   L772C
            LDA   #$00
            STA   L772B
            LDA   #$10
            STA   L772A
            JSR   L772C
            DEX
            BNE   L7884
L78A1       RTS

L78A2       LDY   #$00
            LDA   ($84),Y
            STA   $9B
            BNE   L78BC
L78AA       NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            BNE   L78B2
L78B2       LDA   $9C
            BEQ   L78CA
            LDA   SPKR
            LDA   TAPEOUT
L78BC       INY
            LDA   ($84),Y
            TAX
            STA   $9C
L78C2       DEX
            BNE   L78CE
            CPY   $9B
            BNE   L78AA
            RTS

L78CA       NOP
            NOP
            BEQ   L78BC
L78CE       NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            NOP
            BNE   L78C2
L78E5       LDA   fgSOUND
            BNE   L78EA
L78E9       RTS

L78EA       LDA   #<L7904
            STA   $84
            LDA   #>L7904
            STA   $84+1
            JMP   L78A2

L78F5       LDA   fgSOUND
            BEQ   L78E9
            LDA   #<L794C
            STA   $84
            LDA   #>L794C
            STA   $84+1
            JMP   L78A2

L7904       DB    $5A
            DB    $18
            DB    $0D
            DB    $0A
            DB    $0E
            DB    $1C
            DB    $42
            DB    $12
            DB    $0C
            DB    $09
            DB    $42
            DB    $0B
            DB    $4F
            DB    $3B
            DB    $20
            DB    $1E
            DB    $4C
            DB    $27
            DB    $5F
            DB    $0B
            DB    $1A
            DB    $42
            DB    $12
            DB    $08
            DB    $3B
            DB    $34
            DB    $12
            DB    $1F
            DB    $47
            DB    $6E
            DB    $3B
            DB    $37
            DB    $7C
            DB    $1C
            DB    $0A
            DB    $0B
            DB    $26
            DB    $31
            DB    $15
            DB    $12
            DB    $81
            DB    $1F
            DB    $47
            DB    $6A
            DB    $1D
            DB    $09
            DB    $25
            DB    $47
            DB    $65
            DB    $2E
            DB    $69
            DB    $11
            DB    $35
            DB    $15
            DB    $2F
            DB    $1E
            DB    $42
            DB    $6E
            DB    $92
            DB    $0F
            DB    $35
            DB    $32
            DB    $27
            DB    $12
            DB    $36
            DB    $4E
            DB    $4B
            DB    $06
            DB    $3D
            DB    $16
            DB    $7B
            DB    $24
L794C       DB    $12
            DB    $30
            DB    $F0
            DB    $3A
            DB    $1C
            DB    $1F
            DB    $47
            DB    $14
            DB    $33
            DB    $1C
            DB    $2E
            DB    $27
            DB    $30
            DB    $29
            DB    $38
            DB    $15
            DB    $18
            DB    $0A
            DB    $22

*-----------------------

doPAUSE     LDA   #$00	; timer is reset
            STA   $9B
            STA   $9C
            STA   $9D
            LDA   KBDSTROBE
L796A       INC   $9B	; increment timer
            BNE   L7976	; while waiting for
            INC   $9C	; a key
            BNE   L7976
            INC   $9D
            BEQ   L797C	; 256*256*256 means screen saver
L7976       LDA   KBD
            BPL   L796A
            RTS

* Enter the screen saver mode

L797C       STA   KBD	; screen saver
            LDA   LORES	; full text mode
            LDA   TXTPAGE1
            LDA   TXTCLR
            LDA   MIXCLR
            LDA   #$00
L798D       JSR   clearTEXTPAGE1
            LDA   KBDSTROBE
L7993       INC   $9B	; increment the timer
            BNE   L79AC
            INC   $9C
            BNE   L79AC
            INC   $9D
            LDA   $9D
            AND   #$0F
            STA   $9F
            ASL
            ASL
            ASL
            ASL
            ORA   $9F
            JMP   L798D

L79AC       LDA   KBD	; we (finally) pressed
            BPL   L7993	; a key
            LDA   HIRES	; return to HGR mode
            LDA   TXTPAGE1
            LDA   TXTCLR
            LDA   MIXCLR
            RTS

*-----------------------

clearTEXTPAGE1
            LDX   #>TEXT1
            STX   $84+1
            LDX   #<TEXT1
            STX   $84
            LDY   #$00
L79C8       STA   ($84),Y
            INY
            BNE   L79C8
            INC   $84+1
            LDX   $84+1
            CPX   #$08
            BNE   L79C8
            RTS

*-----------------------

L79D6       DB    $04
            DB    $08
            DB    $10
            DB    $20
            DB    $40
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $02
L79E4       DB    $06
            DB    $0C
            DB    $18
            DB    $30
            DB    $60
            DB    $40
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $03

tblBITON    DB    $04	; bit to lit
            DB    $08
            DB    $10
            DB    $20
            DB    $40
            DB    $00
            DB    $00
tblBITON2   DB    $00	; lit the neighbor if set
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $02

L7A00       HEX   00000100000001000000010000000100
            HEX   000001000000010000000100542A552A
            HEX   04000020040000200400002004000020
            HEX   00000000000000000000000000000000
L7A40       HEX   04000020040000200400002004000020
            HEX   542A552A000001000000010000000100
            HEX   00000100000001000000010000000100
            HEX   00000000000000000000000000000000
L7A80       HEX   00000100000001000000010000000100
            HEX   000001000000010000000100542A552A
            HEX   542A552A140000285000000A5000000A
            HEX   4002400240024002000A5000000A5000
L7AC0       HEX   000A5000000A50004002400240024002
            HEX   5000000A5000000A14000028542A552A
            HEX   542A552A000001000000010000000100
            HEX   00000100000001000000010000000100

*-----------------------

L7B00       LDA   #$55
L7B02       STA   ($84),Y
            EOR   #$7F
            DEY
            BPL   L7B02
            RTS

L7B0A       DB    $00
L7B0B       DB    $00
L7B0C       DB    $00

L7B0D       LDA   L6D5D
            BEQ   L7B19
            CMP   #$02
            BNE   L7B1A
            JMP   L7D76
L7B19       RTS

L7B1A       JSR   L7B26
            LDA   L80C8
            BEQ   L7B25
            DEC   L80C8
L7B25       RTS

L7B26       JSR   L73BE
            LDA   L73BD
            BEQ   L7B31
            JMP   L7CAC

L7B31       LDA   L7CF7
            BEQ   L7B39
            JMP   L7CF8

L7B39       JSR   L7BD6
            LDA   $9C
            CMP   #$07
            BEQ   L7B45
            JMP   L7B52

L7B45       LDA   #$80
            STA   L6D67
            LDA   #$07
            STA   $9C
            JSR   L7C66
            RTS

L7B52       JSR   L7D54
            LDA   #$00
            STA   L6D68
            JSR   L7C66
            LDA   $9C
            CMP   #$06
            BCS   L7B66
            JSR   L7B68
L7B66       RTS

L7B67       DB    $00

L7B68       LDA   $DF
            BEQ   L7B71
            LDA   L7B67
            BEQ   L7B72
L7B71       RTS

L7B72       LDA   #$08
            STA   L7B67
            LDX   #$0F
L7B79       LDA   L6D5D,X
            STA   L6CBD,X
            DEX
            BPL   L7B79
            LDA   $E7
            STA   $E6
            LDX   #$14
            LDA   L6CBE
            STA   L99B3,X
            LDA   L6CBF
            STA   L99B3+1,X
            LDA   L6CC1
            STA   L99B3+2,X
            LDA   L6CC2
            STA   L99B3+3,X
            LDA   #$0D
            STA   L6CBD
            TAY
            LDA   L7D5F,Y
            STA   L6CC7
            LDA   #$00
            STA   L6CC8
            JSR   L78E5
            RTS

L7BB5       LDY   L7B67
            BEQ   L7BBE
            DEC   L7B67
            RTS

L7BBE       LDA   #$00
            STA   L6CBD
            RTS

L7BC4       LDA   #$0F
            STA   L6CBD
            LDA   #$80
            STA   L6CC7
            LDA   #$03
            STA   L7B67
            RTS

L7BD4       DB    $C5
L7BD5       DB    $A0

L7BD6       SEC
            LDA   #$F8
            SBC   L6D65
            STA   L7BD4
            LDA   #$01
            SBC   L6D66
            STA   L7BD5
            CLC
            LDA   #$FC
            ADC   L7BD4
            STA   L7BD4
            LDA   #$00
            ADC   L7BD5
            STA   L7BD5
            CLC
            LDA   L7BD4
            ADC   L6D65
            STA   $9B
            LDA   L7BD5
            ADC   L6D66
            STA   $9C
            CLC
            LDA   L7BD4
            ADC   L6D69
            STA   $9D
            LDA   L7BD5
            ADC   L6D6A
            STA   $9E
            LDA   $9B
            LDX   $9C
            JSR   L093E
            STA   $9B
            STX   $9C
            LDA   $9D
            LDX   $9E
            JSR   L093E
            STA   $9D
            STX   $9E
            SEC
            LDA   $9B
            SBC   $9D
            STA   $9F
            LDA   $9C
            SBC   $9E
            STA   $A0
            BPL   L7C52
            SEC
            LDA   $9D
            SBC   $9B
            STA   $9F
            LDA   $9E
            SBC   $9C
            STA   $A0
            LDA   #$00
            STA   $9B
            BEQ   L7C56
L7C52       LDA   #$01
            STA   $9B
L7C56       SEC
            LDA   $9F
            SBC   #$07
            LDA   $A0
            SBC   #$00
            BMI   L7C65
            LDA   #$07
            STA   $9C
L7C65       RTS

L7C66       LDA   $9B
            BNE   L7C8C
            CLC
            LDA   L6D65
            ADC   $9C
            STA   L6D65
            LDA   L6D66
            ADC   #$00
            STA   L6D66
            SEC
            LDA   L6D65
            LDX   L6D66
            JSR   L093E
            STA   L6D65
            STX   L6D66
            RTS

L7C8C       SEC
            LDA   L6D65
            SBC   $9C
            STA   L6D65
            LDA   L6D66
            SBC   #$00
            STA   L6D66
            BPL   L7CA9
            LDA   #$F8
            STA   L6D65
            LDA   #$01
            STA   L6D66
L7CA9       RTS

L7CAA       DB    $00
L7CAB       DB    $00

L7CAC       LDA   L73BD
            BNE   L7CB2
            RTS

L7CB2       CMP   #$23
            BCS   L7CB9
            JMP   L7CEE

L7CB9       CMP   #$32
            BNE   L7CCE
            LDA   curPLAYER
            ASL
            TAX
            LDA   L7F77,X
            AND   #$01
            STA   L7CAA
            LDA   #$03
            STA   L7CAB
L7CCE       LDA   L7CAA
            STA   $9B
            LDA   L7CAB
            STA   $9C
            JSR   L7C66
            LDA   #$01
            STA   L6D68
L7CE0       DEC   L73BD
            BMI   L7CE6
            RTS

L7CE6       LDA   #$00
            STA   L73BD
            JSR   L7D54
L7CEE       LDA   #$00
            STA   L6D68
            JMP   L7CE0

L7CF6       DB    $00
L7CF7       DB    $00

L7CF8       LDA   L7CF6
            BNE   L7D22
            LDA   L7CF7
            CMP   #$64
            BNE   L7D09
            LDA   #$FF
            STA   L7B0A
L7D09       INC   L7B0A
            LDA   #$03
            AND   L7B0A
            STA   L7B0A
            LDA   curPLAYER
            TAX
            LDA   L7F77,X
            AND   #$1F
            CLC
            ADC   #$03
            STA   L7CF6
L7D22       LDA   L7B0A
            BEQ   L7D2F
            CMP   #$02
            BEQ   L7D2D
            BNE   L7D40
L7D2D       LDA   #$01
L7D2F       STA   $9B
            LDA   #$07
            STA   $9C
            JSR   L7C66
            LDA   #$80
            STA   L6D67
            JMP   L7D43

L7D40       JSR   L7D54
L7D43       LDY   L7CF6
            BEQ   L7D4B
            DEC   L7CF6
L7D4B       LDY   L7CF7
            BEQ   L7D53
            DEC   L7CF7
L7D53       RTS

L7D54       LDA   L6D5D
            TAY
            LDA   L7D5F,Y
            STA   L6D67
            RTS

*-----------------------

L7D5F       DB    $80
            DB    $02
            DB    $04
            DB    $80
            DB    $80
            DB    $03
            DB    $01
            DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $05
            DB    $00
            DB    $00
L7D6F       DB    $00
L7D70       DB    $00
L7D71       DB    $00
            DB    $00
L7D73       DB    $00
L7D74       DB    $00
L7D75       DB    $00

*-----------------------

L7D76       LDA   L7D75
            BEQ   L7D7E
            JMP   L7E2F

L7D7E       JSR   L7BD6
            SEC
            LDA   #$7E
            SBC   $9F
            LDA   #$00
            SBC   $A0
            BPL   L7DA5
            CLC
            LDA   #$FC
            ADC   $D7
            STA   L6D69
            LDA   #$00
            ADC   $D8
            TAX
            LDA   L6D69
            JSR   L093E
            STA   L6D69
            STX   L6D6A
L7DA5       LDA   L7D6F
            CMP   #$01
            BEQ   L7DC3
            LDA   L7D70
            BNE   L7DB6
            LDA   #$00
            TAX
            BEQ   L7DEA
L7DB6       DEC   L7D70
            LDA   #$0A
            STA   L7D71
            LDA   #$01
            STA   L7D6F
L7DC3       LDA   #$08
            CMP   L7D71
            BCS   L7DD0
            LDA   #$2A
            LDX   #$00
            BEQ   L7DE0
L7DD0       LDA   #$04
            CMP   L7D71
            BCS   L7DDD
            LDA   #$CE
            LDX   #$01
            BNE   L7DE0
L7DDD       LDA   #$00
            TAX
L7DE0       DEC   L7D71
            BNE   L7DEA
            LDY   #$00
            STY   L7D6F
L7DEA       CLC
            ADC   L6D69
            STA   L6D65
            TXA
            ADC   L6D6A
            TAX
            LDA   L6D65
            JSR   L093E
            STA   L6D65
            STX   L6D66
            LDY   L80C8
            BEQ   L7E0A
            DEC   L80C8
L7E0A       LDA   L6D64
            BPL   L7E1F
            LDA   L7D74
            LSR
            ORA   #$01
            CLC
            ADC   L6D64
            STA   L6D64
            JMP   L7E24

L7E1F       LDA   #$00
            STA   L6D64
L7E24       JSR   L7D54
            LDA   $DF
            BNE   L7E2E
            JMP   L7FDD
L7E2E       RTS

L7E2F       LDA   L80C8
            BEQ   L7E37
            DEC   L80C8
L7E37       LDA   L6D64
            SEC
            SBC   L7D74
            STA   L6D64
            CLC
            ADC   L7D73
            BPL   L7E4C
            LDA   #$00
            STA   L7D75
L7E4C       LDA   #$80
            STA   L6D67
            RTS

L7E52       DB    $00
L7E53       DB    $00
L7E54       DB    $00
L7E55       DB    $00

*-----------------------

L7E56       LDA   L7E52
            CMP   #$FF
            BNE   L7E71
            LDA   curPLAYER
            ASL
            TAX
            LDA   L7F77,X
            ROL
            ROL
            ROL
            ROL
            ROL
            AND   #$7F
            CLC
            ADC   #$0C
            STA   L7E52
L7E71       CMP   #$01
            BNE   L7EA6
            LDA   L7F77,X
            ROL
            ROL
            STA   $9B
            ROL
            ROL
            STA   $9C
            CLC
            LDA   $D1
            ADC   $9B
            STA   L6CDF
            CLC
            LDA   $D4
            ADC   $9C
            STA   L6CE2
            LDA   #$00
            STA   L7E53
            LDA   #$05
            STA   L6CDD
            TAX
            LDA   L7D5F,X
            STA   L6CE7
            LDA   #$15
            STA   L7E55
L7EA6       LDA   L7E52
            BEQ   L7EAF
            DEC   L7E52
            RTS

L7EAF       LDA   L7E53
            BNE   L7EDD
            LDA   curPLAYER
            ASL
            TAX
            LDA   L7F77,X
            ROL
            ROL
            ROL
            ROL
            AND   #$0F
            ADC   #$05
            STA   L7E53
            LDA   L7F77,X
            STA   L6CE5
            AND   #$03
            STA   L57B2
            LSR   L57B2
            ROR   L57B1
            LSR   L57B2
            ROR   L57B1
L7EDD       DEC   L7E53
            CLC
            LDA   L7E55
            ADC   L7E54
            STA   L7E54
            LDA   L6CEB
            CMP   #$0A
            BCS   L7EF6
            LDA   #$FF
            STA   L7E53
L7EF6       RTS

L7EF7       JSR   printGAMEOVER
            JSR   printPLAYERX
            LDX   #$18
L7EFF       LDA   #$A0
            JSR   WAIT
            DEX
            BPL   L7EFF
            RTS

*-----------------------

printGAMEOVER
            LDA   #<strGAMEOVER
            STA   ptrSTRINGS
            LDA   #>strGAMEOVER
            STA   ptrSTRINGS+1
            LDA   #$0A
            STA   charX
            LDA   #$50
            STA   charY
            LDA   #$06
            STA   charCOLOR
            LDA   #$02
            STA   L0D9A
            JSR   printSTRINGS
            RTS

*-----------------------

printPLAYERX
            LDA   nbPLAYERS	; how many players?
            BNE   L7F2A		; two
            RTS		; only one, show nothing
L7F2A       LDA   curPLAYER	; who is dead?
            BNE   L7F35
            LDA   #<strPLAYER1	; ...player 1
            LDX   #>strPLAYER1
            JMP   L7F39
L7F35       LDA   #<strPLAYER2	; ...player 2
            LDX   #>strPLAYER2

L7F39       STA   ptrSTRINGS	; draw the player's name
            STX   ptrSTRINGS+1
            LDA   #$0C
            STA   charX
            LDA   #$91
            STA   charY
            LDA   #$06
            STA   charCOLOR
            LDA   #$02
            STA   L0D9A
            JSR   printSTRINGS
            RTS

strPLAYER1  DA    L12DA	; P
            DA    L11F0	; L
            DA    L128C	; A
            DA    L130E	; Y
            DA    L120A	; E
            DA    L12F4	; R
            DA    L1386	; _
            DA    L16E5	; 1
            DA    $0000

strPLAYER2  DA    L12DA	; P
            DA    L11F0	; L
            DA    L128C	; A
            DA    L130E	; Y
            DA    L120A	; E
            DA    L12F4	; R
            DA    L1386	; _
	DA    L1701	; 2
	DA    $0000

*-----------------------

L7F76       DB    $00
L7F77       DB    $A4
L7F78       DB    $80
L7F79       DB    $A0
L7F7A       DB    $A0

L7F7B       CLC
            LDA   curPLAYER
            ASL
            TAX
            LDA   #$01
            ADC   L7F77,X
            STA   L7F77,X
            LDA   #$00
            ADC   L7F78,X
            STA   L7F78,X
            LDA   L7F76
            BEQ   L7F9C
            DEC   L7F76
            JSR   L4FC0
            RTS

L7F9C       LDA   L6E21
            ORA   L7B67
            BEQ   L7FA5
            RTS

L7FA5       LDA   L6D5D
            BEQ   L7FC2
            LDA   #$00
            STA   L6CBD
            STA   L7B67
            LDA   L80C8
            BNE   L7FCB
            LDA   L6D5D
            CMP   #$02
            BNE   L7FC2
            LDA   $DF
            BNE   L7FCB
L7FC2       JSR   L80CB
            LDA   L6D5D
            STA   L80C5
L7FCB       RTS

*-----------------------

L7FCC       DB    $00
L7FCD       DB    $00

L7FCE       LDA   #$00
            LDX   curPLAYER
            STA   L80C9,X
            STA   L73BD
            LDA   #$64
            STA   L80C8
L7FDD       LDX   curPLAYER
            INC   L7FCC,X
            LDA   L7FCC,X
            STA   L7D70
            LDA   #$00
            STA   L7D75
            STA   L7D6F
            LDA   #$02
            STA   L6D5D
            LDX   #$00
            LDY   #$0A
            JSR   L800F
            JSR   L7D54
            LDA   #$C9
            STA   L6D64
            LDA   #$37
            STA   L7D73
            LSR
            LSR
            STA   L7D74
            RTS

L800F       LDA   #$80
            STA   L6D67
            LDA   #$00
            STA   L6D64
            STA   L6D68
            STX   $95
            LDX   #$0B
L8020       STA   $C0,X
            DEX
            BPL   L8020
            LDA   $D7
            STA   $C8
            LDA   $D8
            STA   $C9
            LDA   curPLAYER
            ASL
            TAX
            LDA   L7F77,X
            LSR
            BCC   L804B
            SEC
            LDX   $95
            STX   $9B
            LDA   $C8
            SBC   $9B
            STA   $C8
            LDA   $C9
            SBC   #$00
            STA   $C9
            JMP   L8058

L804B       CLC
            LDA   $95
            ADC   $C8
            STA   $C8
            LDA   #$00
            ADC   $C9
            STA   $C9
L8058       LDA   $C8
            LDX   $C9
            JSR   L093E
            STA   $C8
            STX   $C9
            LDA   $D0
            STA   $C1
            LDA   $D1
            STA   $C2
            LDA   $D3
            STA   $C4
            LDA   $D4
            STA   $C5
            STY   $CA
            JSR   L759D
            CLC
            LDA   $D7
            ADC   #$FC
            STA   L6D65
            LDA   $D8
            ADC   #$00
            STA   L6D66
            LDA   L6D65
            LDX   L6D66
            JSR   L093E
            STA   L6D65
            STX   L6D66
            LDA   $C1
            STA   L6D5E
            LDA   $C2
            STA   L6D5F
            LDA   $C4
            STA   L6D61
            LDA   $C5
            STA   L6D62
            LDX   #$3C
            LDA   L6D5E
            STA   L99B3,X
            LDA   L6D5F
            STA   L99B3+1,X
            LDA   L6D60
            STA   L99B3+2,X
            LDA   L6D61
            STA   L99B3+3,X
            RTS

L80C5       DB    $00
L80C6       DB    $00
L80C7       DB    $00
L80C8       DB    $00
L80C9       DB    $00
L80CA       DB    $00

L80CB       LDA   L80C8
            BNE   L80DA
            LDA   L80C5
            CMP   #$02
            BEQ   L80F5
            JMP   L81D3

L80DA       LDX   curPLAYER
            LDA   L80C6,X
            BNE   L80E3
            BEQ   L80FE
L80E3       LDA   L80C9,X
            BNE   L80F5
            LDA   curPLAYER
            ASL
            TAY
            LDA   L7F77,Y
            LSR
            BCC   L80F5
            JMP   L81DA

L80F5       LDA   #$00
            LDX   curPLAYER
            STA   L80C6,X
            BEQ   L8117
L80FE       LDX   curPLAYER
            LDA   $97,X
            LDY   curLEVEL
            CMP   L81DD,Y
            BCC   L8117
            LDA   curPLAYER
            ASL
            TAY
            LDA   L7F77,Y
            AND   #$03
            BNE   L8117
            JMP   L81D3

L8117       LDX   curPLAYER
            LDA   $97,X
            CMP   #$0A
            BCC   L8174
            TXA
            ASL
            TAY
            SEC
            LDA   L7F77,Y
            SBC   #$84
            LDA   L7F78,Y
            SBC   #$03
            BMI   L8174
            LDA   #$01
            STA   L6D5D
            LDA   #$0A
            STA   L7CF7
            LDA   #$00
            STA   L7CF6
L813E       LDA   curPLAYER
            ASL
            TAY
            LDX   L7F77,Y
            CLC
            TXA
            PHA
            AND   #$03
            ADC   #$08
            TAY
            PHA
L814E       JSR   L800F
            LDA   #$00
            STA   L73BD
            JSR   L73BE
            LDA   L73BD
            BEQ   L816B
            PLA
            TAY
            PLA
            CLC
            ADC   #$0F
            TAX
            PHA
            TYA
            PHA
            JMP   L814E

L816B       PLA
            PLA
            JSR   L81E5
            JSR   L7D54
            RTS

L8174       LDA   #$06
            STA   L6D5D
            LDX   curPLAYER
            LDA   $8F,X
            CMP   $97,X
            BCC   L818D
            LDA   #$64
            STA   L7CF7
            LDA   #$00
            STA   L7CF6
            BEQ   L8197
L818D       LDA   #$0A
            STA   L7CF7
            LDA   #$00
            STA   L7CF6
L8197       LDX   curPLAYER
            LDA   $97,X
            CMP   #$09
            BCC   L81A2
            JMP   L813E

L81A2       LDA   curPLAYER
            ASL
            TAY
            LDA   L7F77,Y
            PHA
            AND   #$0F
            STA   $9B
            LDX   curPLAYER
            LDA   $97,X
            STA   $9C
            LDA   #$00
            STA   $9D
            JSR   L0915
            LDX   $9C
            PLA
            AND   #$03
            CLC
            ADC   #$08
            TAY
            JSR   L800F
            JSR   L81E5
            LDA   #$06
            STA   L6D5D
            JSR   L7D54
            RTS

L81D3       LDA   #$01
            LDX   curPLAYER
            STA   L80C6,X
L81DA       JMP   L7FCE

L81DD       HEX   1E1E14140A0A0A0A	; 30/30/20/20/10/10/10/10

L81E5       LDA   curPLAYER
            ASL
            TAY
            LDA   L7F77,Y
            AND   #$01
            TAX
            LDA   L7F77,Y
            JSR   L093E
            STA   L6D65
            STX   L6D66
            LDA   #$E1
            STA   L80C8
            RTS

L8201       LDA   #$FF
            STA   $C3
            STA   $C6
            LDA   L6F9C
            ROR
            BCS   L821A
            LDA   #<L844A
            STA   L82CC
            LDA   #>L844A
            STA   L82CC+1
            JMP   L8224
L821A       LDA   #<L83A2
            STA   L82CC
            LDA   #>L83A2
            STA   L82CC+1

L8224       LDA   $A3
            CMP   #$20
            BCC   L82A7
            CMP   #$AF
            BCS   L82A7
            JSR   L82FE
            JSR   L82D4
            JSR   L8375
            ASL   L67B4
            LDY   L67B4
            LDA   L82A8,Y
            STA   $9E
            INY
            LDA   L82A8,Y
            STA   $9F
            LDA   $9C
            ASL
            ADC   $9E
            STA   $A0
            LDA   #$00
            ADC   $9F
            STA   $A1
            LDY   #$01
            LDA   ($A0),Y
            ADC   $9E
            STA   $84
            DEY
            LDA   ($A0),Y
            ADC   $9F
            STA   $85
            LDA   ($84),Y
            STA   $A0
            INY
            LDA   ($84),Y
            STA   $A1
            INY
            STY   $9C
L8270       LDX   $9D
            LDA   tblPAGE2L,X
            STA   $9E
            LDA   tblPAGE2H,X
            STA   $9E+1
            LDA   $A0
            STA   $A2
            LDX   $9B
L8282       BMI   L8294
            CPX   #$28
            BCS   L8294
            LDY   $9C
            LDA   ($84),Y
            PHA
            TXA
            TAY
            PLA
            ORA   ($9E),Y
            STA   ($9E),Y
L8294       INC   $9C
            DEC   $A2
            BEQ   L829E
            INX
            JMP   L8282

L829E       DEC   $A1
            BEQ   L82A7
            INC   $9D
            JMP   L8270
L82A7       RTS

*-----------------------

L82A8       DA    L84F2
            DA    L85CB
            DA    L86E3
            DA    L87FB
            DA    L8913
            DA    L89EC
            DA    L8B04
            DA    L8C1C
            DA    L8D34
            DA    L8E0D
            DA    L8F25
            DA    L903D
            DA    L9155
            DA    L922E
            DA    L9346
            DA    L945E
            DA    L9576
            DA    L964F
L82CC       DA    L83A2
            DA    L9801
            DA    L98DA
            DA    L9728

*-----------------------

L82D4       LDA   $A3
            LDY   L67B4
            SEC
            SBC   L82E9,Y
            TAX
            LDA   tblXBYT,X
            STA   $9B
            LDA   tblXBIT,X
            STA   $9C
            RTS

L82E9       HEX   03030403030304030303040303030403
            HEX   0202040202

L82FE       LDA   $C0
            CMP   #$03
            BCC   L8313
            CMP   #$06
            BCS   L8313
            STA   $9E
            SEC
            LDA   #$17
            SBC   $9E
            STA   L67B4
            RTS

L8313       LSR   $CE
            CMP   #$02
            BNE   L8322
            LDY   $CE
            LDA   L834F,Y
            STA   L67B4
            RTS

L8322       CMP   #$01
            BNE   L832A
            LDA   #$08
            BNE   L832C
L832A       LDA   #$00
L832C       LDY   $CE
            CLC
            ADC   L8336,Y
            STA   L67B4
            RTS

L8336       HEX   00000101010202020303030404040505
            HEX   050606060707070000

L834F       HEX   10101011111111111110101010101010
            HEX   11111111111110101010101010151515
            HEX   151515101010

L8375       LDA   #$78
            STA   $9D
            LDA   $C0
            CMP   #$02
            BEQ   L8384
            CMP   #$05
            BEQ   L8384
            RTS

L8384       SEC
            LDA   #$00
            SBC   $C7
            STA   $A0
            LDA   $C0
            CMP   #$05
            BNE   L8398
            CLC
            LDA   $A0
            ADC   #$04
            STA   $A0
L8398       LDA   $A0
            SEC
            LDA   $9D
            SBC   $A0
            STA   $9D
            RTS

*-----------------------

L83A2       DB    $00
            DB    $0E
            DB    $00
            DB    $22
            DB    $00
            DB    $36
            DB    $00
            DB    $4A
            DB    $00
            DB    $5E
            DB    $00
            DB    $72
            DB    $00
            DB    $86
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $50
            DB    $02
            DB    $00
            DB    $44
            DB    $08
            DB    $00
            DB    $41
            DB    $20
            DB    $00
            DB    $44
            DB    $08
            DB    $00
            DB    $50
            DB    $02
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $05
            DB    $00
            DB    $08
            DB    $11
            DB    $00
            DB    $02
            DB    $41
            DB    $00
            DB    $08
            DB    $11
            DB    $00
            DB    $20
            DB    $05
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $40
            DB    $0A
            DB    $00
            DB    $10
            DB    $22
            DB    $00
            DB    $04
            DB    $02
            DB    $01
            DB    $10
            DB    $22
            DB    $00
            DB    $40
            DB    $0A
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $15
            DB    $00
            DB    $20
            DB    $44
            DB    $00
            DB    $08
            DB    $04
            DB    $02
            DB    $20
            DB    $44
            DB    $00
            DB    $00
            DB    $15
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $2A
            DB    $00
            DB    $40
            DB    $08
            DB    $01
            DB    $10
            DB    $08
            DB    $04
            DB    $40
            DB    $08
            DB    $01
            DB    $00
            DB    $2A
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $54
            DB    $00
            DB    $00
            DB    $11
            DB    $02
            DB    $20
            DB    $10
            DB    $08
            DB    $00
            DB    $11
            DB    $02
            DB    $00
            DB    $54
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $01
            DB    $00
            DB    $22
            DB    $04
            DB    $40
            DB    $20
            DB    $10
            DB    $00
            DB    $22
            DB    $04
            DB    $00
            DB    $28
            DB    $01
            DB    $00
            DB    $20
            DB    $00
            DB    $00
            DB    $28
            DB    $01
            DB    $00
            DB    $22
            DB    $04
            DB    $40
            DB    $08
            DB    $11
            DB    $00
            DB    $22

L844A       DB    $00
            DB    $0E
            DB    $00
            DB    $22
            DB    $00
            DB    $36
            DB    $00
            DB    $4A
            DB    $00
            DB    $5E
            DB    $00
            DB    $72
            DB    $00
            DB    $86
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $30
            DB    $03
            DB    $00
            DB    $4C
            DB    $0C
            DB    $00
            DB    $47
            DB    $30
            DB    $00
            DB    $4C
            DB    $0C
            DB    $00
            DB    $30
            DB    $03
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $60
            DB    $06
            DB    $00
            DB    $18
            DB    $19
            DB    $00
            DB    $0E
            DB    $61
            DB    $00
            DB    $18
            DB    $19
            DB    $00
            DB    $60
            DB    $06
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $40
            DB    $0D
            DB    $00
            DB    $30
            DB    $32
            DB    $00
            DB    $1C
            DB    $42
            DB    $01
            DB    $30
            DB    $32
            DB    $00
            DB    $40
            DB    $0D
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $1B
            DB    $00
            DB    $60
            DB    $64
            DB    $00
            DB    $38
            DB    $04
            DB    $03
            DB    $60
            DB    $64
            DB    $00
            DB    $00
            DB    $1B
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $36
            DB    $00
            DB    $40
            DB    $49
            DB    $01
            DB    $70
            DB    $08
            DB    $06
            DB    $40
            DB    $49
            DB    $01
            DB    $00
            DB    $36
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $6C
            DB    $00
            DB    $00
            DB    $13
            DB    $03
            DB    $60
            DB    $11
            DB    $0C
            DB    $00
            DB    $13
            DB    $03
            DB    $00
            DB    $6C
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $58
            DB    $01
            DB    $00
            DB    $26
            DB    $06
            DB    $40
            DB    $23
            DB    $18
            DB    $00
            DB    $26
            DB    $06
            DB    $00
            DB    $58
            DB    $01
            DB    $00
            DB    $20
            DB    $00
            DB    $00
            DB    $28
            DB    $01
            DB    $00
            DB    $22
            DB    $04
            DB    $40
            DB    $08
            DB    $11
            DB    $00
            DB    $22

L84F2       DB    $00
            DB    $0E
            DB    $00
            DB    $2B
            DB    $00
            DB    $48
            DB    $00
            DB    $65
            DB    $00
            DB    $82
            DB    $00
            DB    $9F
            DB    $00
            DB    $BC
            DB    $03
            DB    $09
            DB    $70
            DB    $07
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $7C
            DB    $1F
            DB    $00
            DB    $0F
            DB    $78
            DB    $00
            DB    $03
            DB    $60
            DB    $00
            DB    $03
            DB    $60
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
            DB    $03
            DB    $09
            DB    $60
            DB    $0F
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $78
            DB    $3F
            DB    $00
            DB    $1E
            DB    $70
            DB    $01
            DB    $06
            DB    $40
            DB    $01
            DB    $06
            DB    $40
            DB    $01
            DB    $7E
            DB    $7F
            DB    $01
            DB    $03
            DB    $09
            DB    $40
            DB    $1F
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $70
            DB    $7F
            DB    $00
            DB    $3C
            DB    $60
            DB    $03
            DB    $0C
            DB    $00
            DB    $03
            DB    $0C
            DB    $00
            DB    $03
            DB    $7C
            DB    $7F
            DB    $03
            DB    $03
            DB    $09
            DB    $00
            DB    $3F
            DB    $00
            DB    $60
            DB    $40
            DB    $01
            DB    $60
            DB    $40
            DB    $01
            DB    $60
            DB    $40
            DB    $01
            DB    $60
            DB    $7F
            DB    $01
            DB    $78
            DB    $40
            DB    $07
            DB    $18
            DB    $00
            DB    $06
            DB    $18
            DB    $00
            DB    $06
            DB    $78
            DB    $7F
            DB    $07
            DB    $03
            DB    $09
            DB    $00
            DB    $7E
            DB    $00
            DB    $40
            DB    $01
            DB    $03
            DB    $40
            DB    $01
            DB    $03
            DB    $40
            DB    $01
            DB    $03
            DB    $40
            DB    $7F
            DB    $03
            DB    $70
            DB    $01
            DB    $0F
            DB    $30
            DB    $00
            DB    $0C
            DB    $30
            DB    $00
            DB    $0C
            DB    $70
            DB    $7F
            DB    $0F
            DB    $03
            DB    $09
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $7F
            DB    $07
            DB    $60
            DB    $03
            DB    $1E
            DB    $60
            DB    $00
            DB    $18
            DB    $60
            DB    $00
            DB    $18
            DB    $60
            DB    $7F
            DB    $1F
            DB    $03
            DB    $09
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $7E
            DB    $0F
            DB    $40
            DB    $07
            DB    $3C
            DB    $40
            DB    $01
            DB    $30
            DB    $40
            DB    $01
            DB    $30
            DB    $40
            DB    $7F
            DB    $3F
L85CB       DB    $00
            DB    $0E
            DB    $00
            DB    $34
            DB    $00
            DB    $5A
            DB    $00
            DB    $80
            DB    $00
            DB    $A6
            DB    $00
            DB    $CC
            DB    $00
            DB    $F2
            DB    $04
            DB    $09
            DB    $78
            DB    $03
            DB    $00
            DB    $00
            DB    $0C
            DB    $06
            DB    $00
            DB    $00
            DB    $0C
            DB    $7C
            DB    $00
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $00
            DB    $7E
            DB    $7F
            DB    $01
            DB    $00
            DB    $43
            DB    $01
            DB    $03
            DB    $00
            DB    $43
            DB    $01
            DB    $03
            DB    $00
            DB    $43
            DB    $01
            DB    $03
            DB    $00
            DB    $7E
            DB    $7F
            DB    $01
            DB    $00
            DB    $04
            DB    $09
            DB    $70
            DB    $07
            DB    $00
            DB    $00
            DB    $18
            DB    $0C
            DB    $00
            DB    $00
            DB    $18
            DB    $78
            DB    $01
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $00
            DB    $7C
            DB    $7F
            DB    $03
            DB    $00
            DB    $06
            DB    $03
            DB    $06
            DB    $00
            DB    $06
            DB    $03
            DB    $06
            DB    $00
            DB    $06
            DB    $03
            DB    $06
            DB    $00
            DB    $7C
            DB    $7F
            DB    $03
            DB    $00
            DB    $04
            DB    $09
            DB    $60
            DB    $0F
            DB    $00
            DB    $00
            DB    $30
            DB    $18
            DB    $00
            DB    $00
            DB    $30
            DB    $70
            DB    $03
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $00
            DB    $78
            DB    $7F
            DB    $07
            DB    $00
            DB    $0C
            DB    $06
            DB    $0C
            DB    $00
            DB    $0C
            DB    $06
            DB    $0C
            DB    $00
            DB    $0C
            DB    $06
            DB    $0C
            DB    $00
            DB    $78
            DB    $7F
            DB    $07
            DB    $00
            DB    $04
            DB    $09
            DB    $40
            DB    $1F
            DB    $00
            DB    $00
            DB    $60
            DB    $30
            DB    $00
            DB    $00
            DB    $60
            DB    $60
            DB    $07
            DB    $00
            DB    $60
            DB    $40
            DB    $01
            DB    $00
            DB    $70
            DB    $7F
            DB    $0F
            DB    $00
            DB    $18
            DB    $0C
            DB    $18
            DB    $00
            DB    $18
            DB    $0C
            DB    $18
            DB    $00
            DB    $18
            DB    $0C
            DB    $18
            DB    $00
            DB    $70
            DB    $7F
            DB    $0F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $3F
            DB    $00
            DB    $00
            DB    $40
            DB    $61
            DB    $00
            DB    $00
            DB    $40
            DB    $41
            DB    $0F
            DB    $00
            DB    $40
            DB    $01
            DB    $03
            DB    $00
            DB    $60
            DB    $7F
            DB    $1F
            DB    $00
            DB    $30
            DB    $18
            DB    $30
            DB    $00
            DB    $30
            DB    $18
            DB    $30
            DB    $00
            DB    $30
            DB    $18
            DB    $30
            DB    $00
            DB    $60
            DB    $7F
            DB    $1F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $7E
            DB    $00
            DB    $00
            DB    $00
            DB    $43
            DB    $01
            DB    $00
            DB    $00
            DB    $03
            DB    $1F
            DB    $00
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $40
            DB    $7F
            DB    $3F
            DB    $00
            DB    $60
            DB    $30
            DB    $60
            DB    $00
            DB    $60
            DB    $30
            DB    $60
            DB    $00
            DB    $60
            DB    $30
            DB    $60
            DB    $00
            DB    $40
            DB    $7F
            DB    $3F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $00
            DB    $06
            DB    $03
            DB    $00
            DB    $00
            DB    $06
            DB    $3E
            DB    $00
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
            DB    $40
            DB    $61
            DB    $40
            DB    $01
            DB    $40
            DB    $61
            DB    $40
            DB    $01
            DB    $40
            DB    $61
            DB    $40
            DB    $01
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
L86E3       DB    $00
            DB    $0E
            DB    $00
            DB    $34
            DB    $00
            DB    $5A
            DB    $00
            DB    $80
            DB    $00
            DB    $A6
            DB    $00
            DB    $CC
            DB    $00
            DB    $F2
            DB    $04
            DB    $09
            DB    $78
            DB    $03
            DB    $00
            DB    $00
            DB    $0C
            DB    $06
            DB    $00
            DB    $00
            DB    $4C
            DB    $7F
            DB    $00
            DB    $00
            DB    $0E
            DB    $18
            DB    $00
            DB    $00
            DB    $7F
            DB    $7F
            DB    $01
            DB    $00
            DB    $03
            DB    $06
            DB    $03
            DB    $00
            DB    $03
            DB    $06
            DB    $03
            DB    $00
            DB    $03
            DB    $06
            DB    $03
            DB    $00
            DB    $7E
            DB    $7F
            DB    $01
            DB    $00
            DB    $04
            DB    $09
            DB    $40
            DB    $1F
            DB    $00
            DB    $00
            DB    $60
            DB    $30
            DB    $00
            DB    $00
            DB    $60
            DB    $70
            DB    $7F
            DB    $00
            DB    $70
            DB    $7F
            DB    $0F
            DB    $00
            DB    $1C
            DB    $00
            DB    $38
            DB    $00
            DB    $06
            DB    $00
            DB    $60
            DB    $00
            DB    $06
            DB    $00
            DB    $60
            DB    $00
            DB    $1C
            DB    $00
            DB    $38
            DB    $00
            DB    $70
            DB    $7F
            DB    $0F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $3F
            DB    $00
            DB    $00
            DB    $40
            DB    $61
            DB    $00
            DB    $00
            DB    $40
            DB    $61
            DB    $7F
            DB    $01
            DB    $60
            DB    $7F
            DB    $1F
            DB    $00
            DB    $38
            DB    $00
            DB    $70
            DB    $00
            DB    $0C
            DB    $00
            DB    $40
            DB    $01
            DB    $0C
            DB    $00
            DB    $40
            DB    $01
            DB    $38
            DB    $00
            DB    $70
            DB    $00
            DB    $60
            DB    $7F
            DB    $1F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $7E
            DB    $00
            DB    $00
            DB    $00
            DB    $43
            DB    $01
            DB    $00
            DB    $00
            DB    $43
            DB    $7F
            DB    $03
            DB    $40
            DB    $7F
            DB    $3F
            DB    $00
            DB    $70
            DB    $00
            DB    $60
            DB    $01
            DB    $18
            DB    $00
            DB    $00
            DB    $03
            DB    $18
            DB    $00
            DB    $00
            DB    $03
            DB    $70
            DB    $00
            DB    $60
            DB    $01
            DB    $40
            DB    $7F
            DB    $3F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $00
            DB    $06
            DB    $03
            DB    $00
            DB    $00
            DB    $06
            DB    $7F
            DB    $07
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
            DB    $60
            DB    $01
            DB    $40
            DB    $03
            DB    $30
            DB    $00
            DB    $00
            DB    $06
            DB    $30
            DB    $00
            DB    $00
            DB    $06
            DB    $60
            DB    $01
            DB    $40
            DB    $03
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $00
            DB    $0C
            DB    $06
            DB    $00
            DB    $00
            DB    $0C
            DB    $7E
            DB    $0F
            DB    $00
            DB    $7E
            DB    $7F
            DB    $01
            DB    $40
            DB    $03
            DB    $00
            DB    $07
            DB    $60
            DB    $00
            DB    $00
            DB    $0C
            DB    $60
            DB    $00
            DB    $00
            DB    $0C
            DB    $40
            DB    $03
            DB    $00
            DB    $07
            DB    $00
            DB    $7E
            DB    $7F
            DB    $01
            DB    $04
            DB    $09
            DB    $00
            DB    $70
            DB    $07
            DB    $00
            DB    $00
            DB    $18
            DB    $0C
            DB    $00
            DB    $00
            DB    $18
            DB    $7C
            DB    $1F
            DB    $00
            DB    $7C
            DB    $7F
            DB    $03
            DB    $00
            DB    $07
            DB    $00
            DB    $0E
            DB    $40
            DB    $01
            DB    $00
            DB    $18
            DB    $40
            DB    $01
            DB    $00
            DB    $18
            DB    $00
            DB    $07
            DB    $00
            DB    $0E
            DB    $00
            DB    $7C
            DB    $7F
            DB    $03
L87FB       DB    $00
            DB    $0E
            DB    $00
            DB    $34
            DB    $00
            DB    $5A
            DB    $00
            DB    $80
            DB    $00
            DB    $A6
            DB    $00
            DB    $CC
            DB    $00
            DB    $F2
            DB    $04
            DB    $09
            DB    $78
            DB    $03
            DB    $00
            DB    $00
            DB    $0C
            DB    $06
            DB    $00
            DB    $00
            DB    $4C
            DB    $7F
            DB    $00
            DB    $00
            DB    $0E
            DB    $18
            DB    $00
            DB    $00
            DB    $7F
            DB    $7F
            DB    $01
            DB    $00
            DB    $03
            DB    $06
            DB    $03
            DB    $00
            DB    $03
            DB    $06
            DB    $03
            DB    $00
            DB    $03
            DB    $06
            DB    $03
            DB    $00
            DB    $7E
            DB    $7F
            DB    $01
            DB    $00
            DB    $04
            DB    $09
            DB    $70
            DB    $07
            DB    $00
            DB    $00
            DB    $18
            DB    $0C
            DB    $00
            DB    $00
            DB    $18
            DB    $7F
            DB    $01
            DB    $00
            DB    $1C
            DB    $30
            DB    $00
            DB    $00
            DB    $7E
            DB    $7F
            DB    $03
            DB    $00
            DB    $06
            DB    $0C
            DB    $06
            DB    $00
            DB    $06
            DB    $0C
            DB    $06
            DB    $00
            DB    $06
            DB    $0C
            DB    $06
            DB    $00
            DB    $7C
            DB    $7F
            DB    $03
            DB    $00
            DB    $04
            DB    $09
            DB    $60
            DB    $0F
            DB    $00
            DB    $00
            DB    $30
            DB    $18
            DB    $00
            DB    $00
            DB    $30
            DB    $7E
            DB    $03
            DB    $00
            DB    $38
            DB    $60
            DB    $00
            DB    $00
            DB    $7C
            DB    $7F
            DB    $07
            DB    $00
            DB    $0C
            DB    $18
            DB    $0C
            DB    $00
            DB    $0C
            DB    $18
            DB    $0C
            DB    $00
            DB    $0C
            DB    $18
            DB    $0C
            DB    $00
            DB    $78
            DB    $7F
            DB    $07
            DB    $00
            DB    $04
            DB    $09
            DB    $40
            DB    $1F
            DB    $00
            DB    $00
            DB    $60
            DB    $30
            DB    $00
            DB    $00
            DB    $60
            DB    $7C
            DB    $07
            DB    $00
            DB    $70
            DB    $40
            DB    $01
            DB    $00
            DB    $78
            DB    $7F
            DB    $0F
            DB    $00
            DB    $18
            DB    $30
            DB    $18
            DB    $00
L8895       DB    $18
            DB    $30
            DB    $18
            DB    $00
            DB    $18
            DB    $30
            DB    $18
            DB    $00
            DB    $70
            DB    $7F
            DB    $0F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $3F
            DB    $00
            DB    $00
            DB    $40
            DB    $61
            DB    $00
            DB    $00
            DB    $40
            DB    $79
            DB    $0F
            DB    $00
            DB    $60
            DB    $01
            DB    $03
            DB    $00
            DB    $70
            DB    $7F
            DB    $1F
            DB    $00
            DB    $30
            DB    $60
            DB    $30
            DB    $00
            DB    $30
            DB    $60
            DB    $30
            DB    $00
            DB    $30
            DB    $60
            DB    $30
            DB    $00
            DB    $60
            DB    $7F
            DB    $1F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $7E
            DB    $00
            DB    $00
            DB    $00
            DB    $43
            DB    $01
            DB    $00
            DB    $00
            DB    $73
            DB    $1F
            DB    $00
            DB    $40
            DB    $03
            DB    $06
            DB    $00
            DB    $60
            DB    $7F
            DB    $3F
            DB    $00
            DB    $60
            DB    $40
            DB    $61
            DB    $00
            DB    $60
            DB    $40
            DB    $61
            DB    $00
            DB    $60
            DB    $40
            DB    $61
            DB    $00
            DB    $40
            DB    $7F
            DB    $3F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $00
            DB    $06
            DB    $03
            DB    $00
            DB    $00
            DB    $66
            DB    $3F
            DB    $00
            DB    $00
            DB    $07
            DB    $0C
            DB    $00
            DB    $40
            DB    $7F
            DB    $7F
            DB    $00
            DB    $40
            DB    $01
            DB    $43
            DB    $01
            DB    $40
            DB    $01
            DB    $43
            DB    $01
            DB    $40
            DB    $01
            DB    $43
            DB    $01
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
L8913       DB    $00
            DB    $0E
            DB    $00
            DB    $2B
            DB    $00
            DB    $48
            DB    $00
            DB    $65
            DB    $00
            DB    $82
            DB    $00
            DB    $9F
            DB    $00
            DB    $BC
            DB    $03
            DB    $09
            DB    $78
            DB    $0F
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $4C
            DB    $19
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
            DB    $0F
            DB    $78
            DB    $00
            DB    $03
            DB    $60
            DB    $00
            DB    $03
            DB    $60
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
            DB    $03
            DB    $09
            DB    $70
            DB    $1F
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $18
            DB    $33
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $7E
            DB    $7F
            DB    $01
            DB    $1E
            DB    $70
            DB    $01
            DB    $06
            DB    $40
            DB    $01
            DB    $06
            DB    $40
            DB    $01
            DB    $7E
            DB    $7F
            DB    $01
            DB    $03
            DB    $09
            DB    $60
            DB    $3F
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $30
            DB    $66
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $7C
            DB    $7F
            DB    $03
            DB    $3C
            DB    $60
            DB    $03
            DB    $0C
            DB    $00
            DB    $03
            DB    $0C
            DB    $00
            DB    $03
            DB    $7C
            DB    $7F
            DB    $03
            DB    $03
            DB    $09
            DB    $40
            DB    $7F
            DB    $00
            DB    $60
            DB    $40
            DB    $01
            DB    $60
            DB    $4C
            DB    $01
            DB    $60
            DB    $40
            DB    $01
            DB    $78
            DB    $7F
            DB    $07
            DB    $78
            DB    $40
            DB    $07
            DB    $18
            DB    $00
            DB    $06
            DB    $18
            DB    $00
            DB    $06
            DB    $78
            DB    $7F
            DB    $07
            DB    $03
            DB    $09
            DB    $00
            DB    $7F
            DB    $01
            DB    $40
            DB    $01
            DB    $03
            DB    $40
            DB    $19
            DB    $03
            DB    $40
            DB    $01
            DB    $03
            DB    $70
            DB    $7F
            DB    $0F
            DB    $70
            DB    $01
            DB    $0F
            DB    $30
            DB    $00
            DB    $0C
            DB    $30
            DB    $00
            DB    $0C
            DB    $70
            DB    $7F
            DB    $0F
            DB    $03
            DB    $09
            DB    $00
            DB    $7E
            DB    $03
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $33
            DB    $06
            DB    $00
            DB    $03
            DB    $06
            DB    $60
            DB    $7F
            DB    $1F
            DB    $60
            DB    $03
            DB    $1E
            DB    $60
            DB    $00
            DB    $18
            DB    $60
            DB    $00
            DB    $18
            DB    $60
            DB    $7F
            DB    $1F
            DB    $03
            DB    $09
            DB    $00
            DB    $7C
            DB    $07
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $66
            DB    $0C
            DB    $00
            DB    $06
            DB    $0C
            DB    $40
            DB    $7F
            DB    $3F
            DB    $40
            DB    $07
            DB    $3C
            DB    $40
            DB    $01
            DB    $30
            DB    $40
            DB    $01
            DB    $30
            DB    $40
            DB    $7F
            DB    $3F
L89EC       DB    $00
            DB    $0E
            DB    $00
            DB    $34
            DB    $00
            DB    $5A
            DB    $00
            DB    $80
            DB    $00
            DB    $A6
            DB    $00
            DB    $CC
            DB    $00
            DB    $F2
            DB    $04
            DB    $09
            DB    $00
            DB    $3F
            DB    $00
            DB    $00
            DB    $40
            DB    $61
            DB    $00
            DB    $00
            DB    $7C
            DB    $67
            DB    $00
            DB    $00
            DB    $70
            DB    $60
            DB    $01
            DB    $00
            DB    $7E
            DB    $7F
            DB    $03
            DB    $00
            DB    $43
            DB    $01
            DB    $03
            DB    $00
            DB    $43
            DB    $01
            DB    $03
            DB    $00
            DB    $43
            DB    $01
            DB    $03
            DB    $00
            DB    $7E
            DB    $7F
            DB    $01
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $7E
            DB    $00
            DB    $00
            DB    $00
            DB    $43
            DB    $01
            DB    $00
            DB    $78
            DB    $4F
            DB    $01
            DB    $00
            DB    $60
            DB    $41
            DB    $03
            DB    $00
            DB    $7C
            DB    $7F
            DB    $07
            DB    $00
            DB    $06
            DB    $03
            DB    $06
            DB    $00
            DB    $06
            DB    $03
            DB    $06
            DB    $00
            DB    $06
            DB    $03
            DB    $06
            DB    $00
            DB    $7C
            DB    $7F
            DB    $03
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $00
            DB    $06
            DB    $03
            DB    $00
            DB    $70
            DB    $1F
            DB    $03
            DB    $00
            DB    $40
            DB    $03
            DB    $07
            DB    $00
            DB    $78
            DB    $7F
            DB    $0F
            DB    $00
            DB    $0C
            DB    $06
            DB    $0C
            DB    $00
            DB    $0C
            DB    $06
            DB    $0C
            DB    $00
            DB    $0C
            DB    $06
            DB    $0C
            DB    $00
            DB    $78
            DB    $7F
            DB    $07
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $00
            DB    $0C
            DB    $06
            DB    $00
            DB    $60
            DB    $3F
            DB    $06
            DB    $00
            DB    $00
            DB    $07
            DB    $0E
            DB    $00
            DB    $70
            DB    $7F
            DB    $1F
            DB    $00
            DB    $18
            DB    $0C
            DB    $18
L8A85       DB    $00
            DB    $18
            DB    $0C
            DB    $18
            DB    $00
            DB    $18
            DB    $0C
            DB    $18
            DB    $00
            DB    $70
            DB    $7F
            DB    $0F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $70
            DB    $07
            DB    $00
            DB    $00
            DB    $18
            DB    $0C
            DB    $00
            DB    $40
            DB    $7F
            DB    $0C
            DB    $00
            DB    $00
            DB    $0E
            DB    $1C
            DB    $00
            DB    $60
            DB    $7F
            DB    $3F
            DB    $00
            DB    $30
            DB    $18
            DB    $30
            DB    $00
            DB    $30
            DB    $18
            DB    $30
            DB    $00
            DB    $30
            DB    $18
            DB    $30
            DB    $00
            DB    $60
            DB    $7F
            DB    $1F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $60
            DB    $0F
            DB    $00
            DB    $00
            DB    $30
            DB    $18
            DB    $00
            DB    $00
            DB    $7F
            DB    $19
            DB    $00
            DB    $00
            DB    $1C
            DB    $38
            DB    $00
            DB    $40
            DB    $7F
            DB    $7F
            DB    $00
            DB    $60
            DB    $30
            DB    $60
            DB    $00
            DB    $60
            DB    $30
            DB    $60
            DB    $00
            DB    $60
            DB    $30
            DB    $60
            DB    $00
            DB    $40
            DB    $7F
            DB    $3F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $40
            DB    $1F
            DB    $00
            DB    $00
            DB    $60
            DB    $30
            DB    $00
            DB    $00
            DB    $7E
            DB    $33
            DB    $00
            DB    $00
            DB    $38
            DB    $70
            DB    $00
            DB    $00
            DB    $7F
            DB    $7F
            DB    $01
            DB    $40
            DB    $61
            DB    $40
            DB    $01
            DB    $40
            DB    $61
            DB    $40
            DB    $01
            DB    $40
            DB    $61
            DB    $40
            DB    $01
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
L8B04       DB    $00
            DB    $0E
            DB    $00
            DB    $34
            DB    $00
            DB    $5A
            DB    $00
            DB    $80
            DB    $00
            DB    $A6
            DB    $00
            DB    $CC
            DB    $00
            DB    $F2
            DB    $04
            DB    $09
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $00
            DB    $06
            DB    $03
            DB    $00
            DB    $7F
            DB    $07
            DB    $03
            DB    $00
            DB    $78
            DB    $7F
            DB    $07
            DB    $00
            DB    $0E
            DB    $00
            DB    $1C
            DB    $00
            DB    $03
            DB    $00
            DB    $30
            DB    $00
            DB    $03
            DB    $00
            DB    $30
            DB    $00
            DB    $0E
            DB    $00
            DB    $1C
            DB    $00
            DB    $78
            DB    $7F
            DB    $07
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $00
            DB    $0C
            DB    $06
            DB    $00
            DB    $7E
            DB    $0F
            DB    $06
            DB    $00
            DB    $70
            DB    $7F
            DB    $0F
            DB    $00
            DB    $1C
            DB    $00
            DB    $38
            DB    $00
            DB    $06
            DB    $00
            DB    $60
            DB    $00
            DB    $06
            DB    $00
            DB    $60
            DB    $00
            DB    $1C
            DB    $00
            DB    $38
            DB    $00
            DB    $70
            DB    $7F
            DB    $0F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $70
            DB    $07
            DB    $00
            DB    $00
            DB    $18
            DB    $0C
            DB    $00
            DB    $7C
            DB    $1F
            DB    $0C
            DB    $00
            DB    $60
            DB    $7F
            DB    $1F
            DB    $00
            DB    $38
            DB    $00
            DB    $70
            DB    $00
            DB    $0C
            DB    $00
            DB    $40
            DB    $01
            DB    $0C
            DB    $00
            DB    $40
            DB    $01
            DB    $38
            DB    $00
            DB    $70
            DB    $00
            DB    $60
            DB    $7F
            DB    $1F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $60
            DB    $0F
            DB    $00
            DB    $00
            DB    $30
            DB    $18
            DB    $00
            DB    $78
            DB    $3F
            DB    $18
            DB    $00
            DB    $40
            DB    $7F
            DB    $3F
            DB    $00
            DB    $70
            DB    $00
            DB    $60
            DB    $01
            DB    $18
            DB    $00
            DB    $00
            DB    $03
            DB    $18
            DB    $00
            DB    $00
            DB    $03
            DB    $70
            DB    $00
            DB    $60
            DB    $01
            DB    $40
            DB    $7F
            DB    $3F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $40
            DB    $1F
            DB    $00
            DB    $00
            DB    $60
            DB    $30
            DB    $00
            DB    $70
            DB    $7F
            DB    $30
            DB    $00
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
            DB    $60
            DB    $01
            DB    $40
            DB    $03
            DB    $30
            DB    $00
            DB    $00
            DB    $06
            DB    $30
            DB    $00
            DB    $00
            DB    $06
            DB    $60
            DB    $01
            DB    $40
            DB    $03
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $3F
            DB    $00
            DB    $00
            DB    $40
            DB    $61
            DB    $00
            DB    $60
            DB    $7F
            DB    $61
            DB    $00
            DB    $00
            DB    $7E
            DB    $7F
            DB    $01
            DB    $40
            DB    $03
            DB    $00
            DB    $07
            DB    $60
            DB    $00
            DB    $00
            DB    $0C
            DB    $60
            DB    $00
            DB    $00
            DB    $0C
            DB    $40
            DB    $03
            DB    $00
            DB    $07
            DB    $00
            DB    $7E
            DB    $7F
            DB    $01
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $7E
            DB    $00
            DB    $00
            DB    $00
            DB    $43
            DB    $01
            DB    $40
            DB    $7F
            DB    $43
            DB    $01
            DB    $00
            DB    $7C
            DB    $7F
            DB    $03
            DB    $00
            DB    $07
            DB    $00
            DB    $0E
            DB    $40
            DB    $01
            DB    $00
            DB    $18
            DB    $40
            DB    $01
            DB    $00
            DB    $18
            DB    $00
            DB    $07
            DB    $00
            DB    $0E
            DB    $00
            DB    $7C
            DB    $7F
            DB    $03
L8C1C       DB    $00
            DB    $0E
            DB    $00
            DB    $34
            DB    $00
            DB    $5A
            DB    $00
            DB    $80
            DB    $00
            DB    $A6
            DB    $00
            DB    $CC
            DB    $00
            DB    $F2
            DB    $04
            DB    $09
            DB    $00
            DB    $3F
            DB    $00
            DB    $00
            DB    $40
            DB    $61
            DB    $00
            DB    $00
            DB    $7C
            DB    $60
            DB    $00
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $00
            DB    $7E
            DB    $7F
            DB    $01
            DB    $00
            DB    $03
            DB    $06
            DB    $03
            DB    $00
            DB    $03
            DB    $06
            DB    $03
            DB    $00
            DB    $03
            DB    $06
            DB    $03
            DB    $00
            DB    $7E
            DB    $7F
            DB    $01
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $7E
            DB    $00
            DB    $00
            DB    $00
            DB    $43
            DB    $01
            DB    $00
            DB    $78
            DB    $41
            DB    $01
            DB    $00
            DB    $60
            DB    $40
            DB    $01
            DB    $00
            DB    $7C
            DB    $7F
            DB    $03
            DB    $00
            DB    $06
            DB    $0C
            DB    $06
            DB    $00
            DB    $06
            DB    $0C
            DB    $06
            DB    $00
            DB    $06
            DB    $0C
            DB    $06
            DB    $00
            DB    $7C
            DB    $7F
            DB    $03
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $00
            DB    $06
            DB    $03
            DB    $00
            DB    $70
            DB    $03
            DB    $03
            DB    $00
            DB    $40
            DB    $01
            DB    $03
            DB    $00
            DB    $78
            DB    $7F
            DB    $07
            DB    $00
            DB    $0C
            DB    $18
            DB    $0C
            DB    $00
            DB    $0C
            DB    $18
            DB    $0C
            DB    $00
            DB    $0C
            DB    $18
            DB    $0C
            DB    $00
            DB    $78
            DB    $7F
            DB    $07
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $00
            DB    $0C
            DB    $06
            DB    $00
            DB    $60
            DB    $07
            DB    $06
            DB    $00
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $70
            DB    $7F
            DB    $0F
            DB    $00
            DB    $18
            DB    $30
            DB    $18
            DB    $00
            DB    $18
            DB    $30
            DB    $18
            DB    $00
            DB    $18
            DB    $30
            DB    $18
            DB    $00
            DB    $70
            DB    $7F
            DB    $0F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $70
            DB    $07
            DB    $00
            DB    $00
            DB    $18
            DB    $0C
            DB    $00
            DB    $40
            DB    $0F
            DB    $0C
            DB    $00
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $60
            DB    $7F
            DB    $1F
            DB    $00
            DB    $30
            DB    $60
            DB    $30
            DB    $00
            DB    $30
            DB    $60
            DB    $30
            DB    $00
            DB    $30
            DB    $60
            DB    $30
            DB    $00
            DB    $60
            DB    $7F
            DB    $1F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $60
            DB    $0F
            DB    $00
            DB    $00
            DB    $30
            DB    $18
            DB    $00
            DB    $00
            DB    $1F
            DB    $18
            DB    $00
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $40
            DB    $7F
            DB    $3F
            DB    $00
            DB    $60
            DB    $40
            DB    $61
            DB    $00
            DB    $60
            DB    $40
            DB    $61
            DB    $00
            DB    $60
            DB    $40
            DB    $61
            DB    $00
            DB    $40
            DB    $7F
            DB    $3F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $40
            DB    $1F
            DB    $00
            DB    $00
            DB    $60
            DB    $30
            DB    $00
            DB    $00
            DB    $3E
            DB    $30
            DB    $00
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
            DB    $40
            DB    $01
            DB    $43
            DB    $01
            DB    $40
            DB    $01
            DB    $43
            DB    $01
            DB    $40
            DB    $01
            DB    $43
            DB    $01
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
L8D34       DB    $00
            DB    $0E
            DB    $00
            DB    $2B
            DB    $00
            DB    $48
            DB    $00
            DB    $65
            DB    $00
            DB    $82
            DB    $00
            DB    $9F
            DB    $00
            DB    $BC
            DB    $03
            DB    $09
            DB    $40
            DB    $01
            DB    $00
            DB    $30
            DB    $06
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
            DB    $03
            DB    $60
            DB    $00
            DB    $03
            DB    $60
            DB    $00
            DB    $03
            DB    $60
            DB    $00
            DB    $03
            DB    $60
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $03
            DB    $00
            DB    $60
            DB    $0C
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $7E
            DB    $7F
            DB    $01
            DB    $06
            DB    $40
            DB    $01
            DB    $06
            DB    $40
            DB    $01
            DB    $06
            DB    $40
            DB    $01
            DB    $06
            DB    $40
            DB    $01
            DB    $7E
            DB    $7F
            DB    $01
            DB    $03
            DB    $09
            DB    $00
            DB    $06
            DB    $00
            DB    $40
            DB    $19
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $7C
            DB    $7F
            DB    $03
            DB    $0C
            DB    $00
            DB    $03
            DB    $0C
            DB    $00
            DB    $03
            DB    $0C
            DB    $00
            DB    $03
            DB    $0C
            DB    $00
            DB    $03
            DB    $7C
            DB    $7F
            DB    $03
            DB    $03
            DB    $09
            DB    $00
            DB    $0C
            DB    $00
            DB    $00
            DB    $33
            DB    $00
            DB    $60
            DB    $40
            DB    $01
            DB    $78
            DB    $7F
            DB    $07
            DB    $18
            DB    $00
            DB    $06
            DB    $18
            DB    $00
            DB    $06
            DB    $18
            DB    $00
            DB    $06
            DB    $18
            DB    $00
            DB    $06
            DB    $78
            DB    $7F
            DB    $07
            DB    $03
            DB    $09
            DB    $00
            DB    $18
            DB    $00
            DB    $00
            DB    $66
            DB    $00
            DB    $40
            DB    $01
            DB    $03
            DB    $70
            DB    $7F
            DB    $0F
            DB    $30
            DB    $00
            DB    $0C
            DB    $30
            DB    $00
            DB    $0C
            DB    $30
            DB    $00
            DB    $0C
            DB    $30
            DB    $00
            DB    $0C
            DB    $70
            DB    $7F
            DB    $0F
            DB    $03
            DB    $09
            DB    $00
            DB    $30
            DB    $00
            DB    $00
            DB    $4C
            DB    $01
            DB    $00
            DB    $03
            DB    $06
            DB    $60
            DB    $7F
            DB    $1F
            DB    $60
            DB    $00
            DB    $18
            DB    $60
            DB    $00
            DB    $18
            DB    $60
            DB    $00
            DB    $18
            DB    $60
            DB    $00
            DB    $18
            DB    $60
            DB    $7F
            DB    $1F
            DB    $03
            DB    $09
            DB    $00
            DB    $60
            DB    $00
            DB    $00
            DB    $18
            DB    $03
            DB    $00
            DB    $06
            DB    $0C
            DB    $40
            DB    $7F
            DB    $3F
            DB    $40
            DB    $01
            DB    $30
            DB    $40
            DB    $01
            DB    $30
            DB    $40
            DB    $01
            DB    $30
            DB    $40
            DB    $01
            DB    $30
            DB    $40
            DB    $7F
            DB    $3F
L8E0D       DB    $00
            DB    $0E
            DB    $00
            DB    $34
            DB    $00
            DB    $5A
            DB    $00
            DB    $80
            DB    $00
            DB    $A6
            DB    $00
            DB    $CC
            DB    $00
            DB    $F2
            DB    $04
            DB    $09
            DB    $30
            DB    $00
            DB    $00
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $00
            DB    $3F
            DB    $7F
            DB    $00
            DB    $00
            DB    $33
            DB    $06
            DB    $00
            DB    $00
            DB    $33
            DB    $18
            DB    $00
            DB    $00
            DB    $33
            DB    $60
            DB    $00
            DB    $00
            DB    $33
            DB    $40
            DB    $01
            DB    $00
            DB    $33
            DB    $00
            DB    $03
            DB    $00
            DB    $7F
            DB    $7F
            DB    $03
            DB    $00
            DB    $04
            DB    $09
            DB    $60
            DB    $00
            DB    $00
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $00
            DB    $7E
            DB    $7E
            DB    $01
            DB    $00
            DB    $66
            DB    $0C
            DB    $00
            DB    $00
            DB    $66
            DB    $30
            DB    $00
            DB    $00
            DB    $66
            DB    $40
            DB    $01
            DB    $00
            DB    $66
            DB    $00
            DB    $03
            DB    $00
            DB    $66
            DB    $00
            DB    $06
            DB    $00
            DB    $7E
            DB    $7F
            DB    $07
            DB    $00
            DB    $04
            DB    $09
            DB    $40
            DB    $01
            DB    $00
            DB    $00
            DB    $70
            DB    $07
            DB    $00
            DB    $00
            DB    $7C
            DB    $7D
            DB    $03
            DB    $00
            DB    $4C
            DB    $19
            DB    $00
            DB    $00
            DB    $4C
            DB    $61
            DB    $00
            DB    $00
            DB    $4C
            DB    $01
            DB    $03
            DB    $00
            DB    $4C
            DB    $01
            DB    $06
            DB    $00
            DB    $4C
            DB    $01
            DB    $0C
            DB    $00
            DB    $7C
            DB    $7F
            DB    $0F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $03
            DB    $00
            DB    $00
            DB    $60
            DB    $0F
            DB    $00
            DB    $00
            DB    $78
            DB    $7B
            DB    $07
            DB    $00
            DB    $18
            DB    $33
            DB    $00
            DB    $00
            DB    $18
            DB    $43
            DB    $01
            DB    $00
            DB    $18
            DB    $03
            DB    $06
            DB    $00
            DB    $18
            DB    $03
            DB    $0C
            DB    $00
            DB    $18
            DB    $03
            DB    $18
            DB    $00
            DB    $78
            DB    $7F
            DB    $1F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $06
            DB    $00
            DB    $00
            DB    $40
            DB    $1F
            DB    $00
            DB    $00
            DB    $70
            DB    $77
            DB    $0F
            DB    $00
            DB    $30
            DB    $66
            DB    $00
            DB    $00
            DB    $30
            DB    $06
            DB    $03
            DB    $00
            DB    $30
            DB    $06
            DB    $0C
            DB    $00
            DB    $30
            DB    $06
            DB    $18
            DB    $00
            DB    $30
            DB    $06
            DB    $30
            DB    $00
            DB    $70
            DB    $7F
            DB    $3F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $0C
            DB    $00
            DB    $00
            DB    $00
            DB    $3F
            DB    $00
            DB    $00
            DB    $60
            DB    $6F
            DB    $1F
            DB    $00
            DB    $60
            DB    $4C
            DB    $01
            DB    $00
            DB    $60
            DB    $0C
            DB    $06
            DB    $00
            DB    $60
            DB    $0C
            DB    $18
            DB    $00
            DB    $60
            DB    $0C
            DB    $30
            DB    $00
            DB    $60
            DB    $0C
            DB    $60
            DB    $00
            DB    $60
            DB    $7F
            DB    $7F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $18
            DB    $00
            DB    $00
            DB    $00
            DB    $7E
            DB    $00
            DB    $00
            DB    $40
            DB    $5F
            DB    $3F
            DB    $00
            DB    $40
            DB    $19
            DB    $03
            DB    $00
            DB    $40
            DB    $19
            DB    $0C
            DB    $00
            DB    $40
            DB    $19
            DB    $30
            DB    $00
            DB    $40
            DB    $19
            DB    $60
            DB    $00
            DB    $40
            DB    $19
            DB    $40
            DB    $01
            DB    $40
            DB    $7F
            DB    $7F
            DB    $01
L8F25       DB    $00
            DB    $0E
            DB    $00
            DB    $34
            DB    $00
            DB    $5A
            DB    $00
            DB    $80
            DB    $00
            DB    $A6
            DB    $00
            DB    $CC
            DB    $00
            DB    $F2
            DB    $04
            DB    $09
            DB    $03
            DB    $00
            DB    $00
            DB    $00
            DB    $0F
            DB    $00
            DB    $00
            DB    $00
            DB    $73
            DB    $7F
            DB    $03
            DB    $00
            DB    $43
            DB    $01
            DB    $00
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $00
            DB    $03
            DB    $18
            DB    $00
            DB    $00
            DB    $03
            DB    $60
            DB    $00
            DB    $00
            DB    $03
            DB    $00
            DB    $03
            DB    $00
            DB    $7F
            DB    $7F
            DB    $0F
            DB    $00
            DB    $04
            DB    $09
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $1E
            DB    $00
            DB    $00
            DB    $00
            DB    $66
            DB    $7F
            DB    $07
            DB    $00
            DB    $06
            DB    $03
            DB    $00
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $00
            DB    $06
            DB    $30
            DB    $00
            DB    $00
            DB    $06
            DB    $40
            DB    $01
            DB    $00
            DB    $06
            DB    $00
            DB    $06
            DB    $00
            DB    $7E
            DB    $7F
            DB    $1F
            DB    $00
            DB    $04
            DB    $09
            DB    $0C
            DB    $00
            DB    $00
            DB    $00
            DB    $3C
            DB    $00
            DB    $00
            DB    $00
            DB    $4C
            DB    $7F
            DB    $0F
            DB    $00
            DB    $0C
            DB    $06
            DB    $00
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $00
            DB    $0C
            DB    $60
            DB    $00
            DB    $00
            DB    $0C
            DB    $00
            DB    $03
            DB    $00
            DB    $0C
            DB    $00
            DB    $0C
            DB    $00
            DB    $7C
            DB    $7F
            DB    $3F
            DB    $00
            DB    $04
            DB    $09
            DB    $18
            DB    $00
            DB    $00
            DB    $00
            DB    $78
            DB    $00
            DB    $00
            DB    $00
            DB    $18
            DB    $7F
            DB    $1F
            DB    $00
            DB    $18
            DB    $0C
            DB    $00
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $00
            DB    $18
            DB    $40
            DB    $01
            DB    $00
            DB    $18
            DB    $00
            DB    $06
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $78
            DB    $7F
            DB    $7F
            DB    $00
            DB    $04
            DB    $09
            DB    $30
            DB    $00
            DB    $00
            DB    $00
            DB    $70
            DB    $01
            DB    $00
            DB    $00
            DB    $30
            DB    $7E
            DB    $3F
            DB    $00
            DB    $30
            DB    $18
            DB    $00
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $00
            DB    $30
            DB    $00
            DB    $03
            DB    $00
            DB    $30
            DB    $00
            DB    $0C
            DB    $00
            DB    $30
            DB    $00
            DB    $30
            DB    $00
            DB    $70
            DB    $7F
            DB    $7F
            DB    $01
            DB    $04
            DB    $09
            DB    $60
            DB    $00
            DB    $00
            DB    $00
            DB    $60
            DB    $03
            DB    $00
            DB    $00
            DB    $60
            DB    $7C
            DB    $7F
            DB    $00
            DB    $60
            DB    $30
            DB    $00
            DB    $00
            DB    $60
            DB    $40
            DB    $01
            DB    $00
            DB    $60
            DB    $00
            DB    $06
            DB    $00
            DB    $60
            DB    $00
            DB    $18
            DB    $00
            DB    $60
            DB    $00
            DB    $60
            DB    $00
            DB    $60
            DB    $7F
            DB    $7F
            DB    $03
            DB    $04
            DB    $09
            DB    $40
            DB    $01
            DB    $00
            DB    $00
            DB    $40
            DB    $07
            DB    $00
            DB    $00
            DB    $40
            DB    $79
            DB    $7F
            DB    $01
            DB    $40
            DB    $61
            DB    $00
            DB    $00
            DB    $40
            DB    $01
            DB    $03
            DB    $00
            DB    $40
            DB    $01
            DB    $0C
            DB    $00
            DB    $40
            DB    $01
            DB    $30
            DB    $00
            DB    $40
            DB    $01
            DB    $40
            DB    $01
            DB    $40
            DB    $7F
            DB    $7F
            DB    $07
L903D       DB    $00
            DB    $0E
            DB    $00
            DB    $34
            DB    $00
            DB    $5A
            DB    $00
            DB    $80
            DB    $00
            DB    $A6
            DB    $00
            DB    $CC
            DB    $00
            DB    $F2
            DB    $04
            DB    $09
            DB    $30
            DB    $00
            DB    $00
            DB    $00
            DB    $4C
            DB    $01
            DB    $00
            DB    $00
            DB    $4E
            DB    $7F
            DB    $00
            DB    $00
            DB    $33
            DB    $06
            DB    $00
            DB    $00
            DB    $43
            DB    $19
            DB    $00
            DB    $00
            DB    $03
            DB    $66
            DB    $00
            DB    $00
            DB    $03
            DB    $78
            DB    $01
            DB    $00
            DB    $03
            DB    $78
            DB    $03
            DB    $00
            DB    $7F
            DB    $7F
            DB    $03
            DB    $00
            DB    $04
            DB    $09
            DB    $60
            DB    $00
            DB    $00
            DB    $00
            DB    $18
            DB    $03
            DB    $00
            DB    $00
            DB    $1C
            DB    $7F
            DB    $01
            DB    $00
            DB    $66
            DB    $0C
            DB    $00
            DB    $00
            DB    $06
            DB    $33
            DB    $00
            DB    $00
            DB    $06
            DB    $4C
            DB    $01
            DB    $00
            DB    $06
            DB    $70
            DB    $03
            DB    $00
            DB    $06
            DB    $70
            DB    $07
            DB    $00
            DB    $7E
            DB    $7F
            DB    $07
            DB    $00
            DB    $04
            DB    $09
            DB    $40
            DB    $01
            DB    $00
            DB    $00
            DB    $30
            DB    $06
            DB    $00
            DB    $00
            DB    $38
            DB    $7E
            DB    $03
            DB    $00
            DB    $4C
            DB    $19
            DB    $00
            DB    $00
            DB    $0C
            DB    $66
            DB    $00
            DB    $00
            DB    $0C
            DB    $18
            DB    $03
            DB    $00
            DB    $0C
            DB    $60
            DB    $07
            DB    $00
            DB    $0C
            DB    $60
            DB    $0F
            DB    $00
            DB    $7C
            DB    $7F
            DB    $0F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $03
            DB    $00
            DB    $00
            DB    $60
            DB    $0C
            DB    $00
            DB    $00
            DB    $70
            DB    $7C
            DB    $07
            DB    $00
            DB    $18
            DB    $33
            DB    $00
            DB    $00
            DB    $18
            DB    $4C
            DB    $01
            DB    $00
            DB    $18
            DB    $30
            DB    $06
            DB    $00
            DB    $18
            DB    $40
            DB    $0F
            DB    $00
            DB    $18
            DB    $40
            DB    $1F
            DB    $00
            DB    $78
            DB    $7F
            DB    $1F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $06
            DB    $00
            DB    $00
            DB    $40
            DB    $19
            DB    $00
            DB    $00
            DB    $60
            DB    $79
            DB    $0F
            DB    $00
            DB    $30
            DB    $66
            DB    $00
            DB    $00
            DB    $30
            DB    $18
            DB    $03
            DB    $00
            DB    $30
            DB    $60
            DB    $0C
            DB    $00
            DB    $30
            DB    $00
            DB    $1F
            DB    $00
            DB    $30
            DB    $00
            DB    $3F
            DB    $00
            DB    $70
            DB    $7F
            DB    $3F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $0C
            DB    $00
            DB    $00
            DB    $00
            DB    $33
            DB    $00
            DB    $00
            DB    $40
            DB    $73
            DB    $1F
            DB    $00
            DB    $60
            DB    $4C
            DB    $01
            DB    $00
            DB    $60
            DB    $30
            DB    $06
            DB    $00
            DB    $60
            DB    $40
            DB    $19
            DB    $00
            DB    $60
            DB    $00
            DB    $3E
            DB    $00
            DB    $60
            DB    $00
            DB    $7E
            DB    $00
            DB    $60
            DB    $7F
            DB    $7F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $18
            DB    $00
            DB    $00
            DB    $00
            DB    $66
            DB    $00
            DB    $00
            DB    $00
            DB    $67
            DB    $3F
            DB    $00
            DB    $40
            DB    $19
            DB    $03
            DB    $00
            DB    $40
            DB    $61
            DB    $0C
            DB    $00
            DB    $40
            DB    $01
            DB    $33
            DB    $00
            DB    $40
            DB    $01
            DB    $7C
            DB    $00
            DB    $40
            DB    $01
            DB    $7C
            DB    $01
            DB    $40
            DB    $7F
            DB    $7F
            DB    $01
L9155       DB    $00
            DB    $0E
            DB    $00
            DB    $2B
            DB    $00
            DB    $48
            DB    $00
            DB    $65
            DB    $00
            DB    $82
            DB    $00
            DB    $9F
            DB    $00
            DB    $BC
            DB    $03
            DB    $09
            DB    $40
            DB    $01
            DB    $00
            DB    $30
            DB    $06
            DB    $00
            DB    $4C
            DB    $19
            DB    $00
            DB    $03
            DB    $60
            DB    $00
            DB    $0F
            DB    $78
            DB    $00
            DB    $33
            DB    $66
            DB    $00
            DB    $43
            DB    $61
            DB    $00
            DB    $03
            DB    $60
            DB    $00
            DB    $7F
            DB    $7F
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $03
            DB    $00
            DB    $60
            DB    $0C
            DB    $00
            DB    $18
            DB    $33
            DB    $00
            DB    $06
            DB    $40
            DB    $01
            DB    $1E
            DB    $70
            DB    $01
            DB    $66
            DB    $4C
            DB    $01
            DB    $06
            DB    $43
            DB    $01
            DB    $06
            DB    $40
            DB    $01
            DB    $7E
            DB    $7F
            DB    $01
            DB    $03
            DB    $09
            DB    $00
            DB    $06
            DB    $00
            DB    $40
            DB    $19
            DB    $00
            DB    $30
            DB    $66
            DB    $00
            DB    $0C
            DB    $00
            DB    $03
            DB    $3C
            DB    $60
            DB    $03
            DB    $4C
            DB    $19
            DB    $03
            DB    $0C
            DB    $06
            DB    $03
            DB    $0C
            DB    $00
            DB    $03
            DB    $7C
            DB    $7F
            DB    $03
            DB    $03
            DB    $09
            DB    $00
            DB    $0C
            DB    $00
            DB    $00
            DB    $33
            DB    $00
            DB    $60
            DB    $4C
            DB    $01
            DB    $18
            DB    $00
            DB    $06
            DB    $78
            DB    $40
            DB    $07
            DB    $18
            DB    $33
            DB    $06
            DB    $18
            DB    $0C
            DB    $06
            DB    $18
            DB    $00
            DB    $06
            DB    $78
            DB    $7F
            DB    $07
            DB    $03
            DB    $09
            DB    $00
            DB    $18
            DB    $00
            DB    $00
            DB    $66
            DB    $00
            DB    $40
            DB    $19
            DB    $03
            DB    $30
            DB    $00
            DB    $0C
            DB    $70
            DB    $01
            DB    $0F
            DB    $30
            DB    $66
            DB    $0C
            DB    $30
            DB    $18
            DB    $0C
            DB    $30
            DB    $00
            DB    $0C
            DB    $70
            DB    $7F
            DB    $0F
            DB    $03
            DB    $09
            DB    $00
            DB    $30
            DB    $00
            DB    $00
            DB    $4C
            DB    $01
            DB    $00
            DB    $33
            DB    $06
            DB    $60
            DB    $00
            DB    $18
            DB    $60
            DB    $03
            DB    $1E
            DB    $60
            DB    $4C
            DB    $19
            DB    $60
            DB    $30
            DB    $18
            DB    $60
            DB    $00
            DB    $18
            DB    $60
            DB    $7F
            DB    $1F
            DB    $03
            DB    $09
            DB    $00
            DB    $60
            DB    $00
            DB    $00
            DB    $18
            DB    $03
            DB    $00
            DB    $66
            DB    $0C
            DB    $40
            DB    $01
            DB    $30
            DB    $40
            DB    $07
            DB    $3C
            DB    $40
            DB    $19
            DB    $33
            DB    $40
            DB    $61
            DB    $30
            DB    $40
            DB    $01
            DB    $30
            DB    $40
            DB    $7F
            DB    $3F
L922E       DB    $00
            DB    $0E
            DB    $00
            DB    $34
            DB    $00
            DB    $5A
            DB    $00
            DB    $80
            DB    $00
            DB    $A6
            DB    $00
            DB    $CC
            DB    $00
            DB    $F2
            DB    $04
            DB    $09
            DB    $00
            DB    $38
            DB    $00
            DB    $00
            DB    $00
            DB    $66
            DB    $01
            DB    $00
            DB    $7C
            DB    $67
            DB    $03
            DB    $00
            DB    $40
            DB    $19
            DB    $03
            DB    $00
            DB    $30
            DB    $06
            DB    $03
            DB    $00
            DB    $4C
            DB    $01
            DB    $03
            DB    $00
            DB    $3E
            DB    $00
            DB    $03
            DB    $00
            DB    $3F
            DB    $00
            DB    $03
            DB    $00
            DB    $7F
            DB    $7F
            DB    $03
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $70
            DB    $00
            DB    $00
            DB    $00
            DB    $4C
            DB    $03
            DB    $00
            DB    $78
            DB    $4F
            DB    $07
            DB    $00
            DB    $00
            DB    $33
            DB    $06
            DB    $00
            DB    $60
            DB    $0C
            DB    $06
            DB    $00
            DB    $18
            DB    $03
            DB    $06
            DB    $00
            DB    $7C
            DB    $00
            DB    $06
            DB    $00
            DB    $7E
            DB    $00
            DB    $06
            DB    $00
            DB    $7E
            DB    $7F
            DB    $07
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $00
            DB    $18
            DB    $07
            DB    $00
            DB    $70
            DB    $1F
            DB    $0F
            DB    $00
            DB    $00
            DB    $66
            DB    $0C
            DB    $00
            DB    $40
            DB    $19
            DB    $0C
            DB    $00
            DB    $30
            DB    $06
            DB    $0C
            DB    $00
            DB    $78
            DB    $01
            DB    $0C
            DB    $00
            DB    $7C
            DB    $01
            DB    $0C
            DB    $00
            DB    $7C
            DB    $7F
            DB    $0F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $30
            DB    $0E
            DB    $00
            DB    $60
            DB    $3F
            DB    $1E
            DB    $00
            DB    $00
            DB    $4C
            DB    $19
            DB    $00
            DB    $00
            DB    $33
            DB    $18
            DB    $00
            DB    $60
            DB    $0C
            DB    $18
            DB    $00
            DB    $70
            DB    $03
            DB    $18
            DB    $00
            DB    $78
            DB    $03
            DB    $18
            DB    $00
            DB    $78
            DB    $7F
            DB    $1F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $07
            DB    $00
            DB    $00
            DB    $60
            DB    $1C
            DB    $00
            DB    $40
            DB    $7F
            DB    $3C
            DB    $00
            DB    $00
            DB    $18
            DB    $33
            DB    $00
            DB    $00
            DB    $66
            DB    $30
            DB    $00
            DB    $40
            DB    $19
            DB    $30
            DB    $00
            DB    $60
            DB    $07
            DB    $30
            DB    $00
            DB    $70
            DB    $07
            DB    $30
            DB    $00
            DB    $70
            DB    $7F
            DB    $3F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $0E
            DB    $00
            DB    $00
            DB    $40
            DB    $39
            DB    $00
            DB    $00
            DB    $7F
            DB    $79
            DB    $00
            DB    $00
            DB    $30
            DB    $66
            DB    $00
            DB    $00
            DB    $4C
            DB    $61
            DB    $00
            DB    $00
            DB    $33
            DB    $60
            DB    $00
            DB    $40
            DB    $0F
            DB    $60
            DB    $00
            DB    $60
            DB    $0F
            DB    $60
            DB    $00
            DB    $60
            DB    $7F
            DB    $7F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $1C
            DB    $00
            DB    $00
            DB    $00
            DB    $73
            DB    $00
            DB    $00
            DB    $7E
            DB    $73
            DB    $01
            DB    $00
            DB    $60
            DB    $4C
            DB    $01
            DB    $00
            DB    $18
            DB    $43
            DB    $01
            DB    $00
            DB    $66
            DB    $40
            DB    $01
            DB    $00
            DB    $1F
            DB    $40
            DB    $01
            DB    $40
            DB    $1F
            DB    $40
            DB    $01
            DB    $40
            DB    $7F
            DB    $7F
            DB    $01
L9346       DB    $00
            DB    $0E
            DB    $00
            DB    $34
            DB    $00
            DB    $5A
            DB    $00
            DB    $80
            DB    $00
            DB    $A6
            DB    $00
            DB    $CC
            DB    $00
            DB    $F2
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $0C
            DB    $00
            DB    $00
            DB    $00
            DB    $0F
            DB    $00
            DB    $7C
            DB    $7F
            DB    $0C
            DB    $00
            DB    $00
            DB    $18
            DB    $0C
            DB    $00
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $40
            DB    $01
            DB    $0C
            DB    $00
            DB    $30
            DB    $00
            DB    $0C
            DB    $00
            DB    $0C
            DB    $00
            DB    $0C
            DB    $00
            DB    $7F
            DB    $7F
            DB    $0F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $18
            DB    $00
            DB    $00
            DB    $00
            DB    $1E
            DB    $00
            DB    $78
            DB    $7F
            DB    $19
            DB    $00
            DB    $00
            DB    $30
            DB    $18
            DB    $00
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $00
            DB    $03
            DB    $18
            DB    $00
            DB    $60
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $18
            DB    $00
            DB    $7E
            DB    $7F
            DB    $1F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $30
            DB    $00
            DB    $00
            DB    $00
            DB    $3C
            DB    $00
            DB    $70
            DB    $7F
            DB    $33
            DB    $00
            DB    $00
            DB    $60
            DB    $30
            DB    $00
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $00
            DB    $06
            DB    $30
            DB    $00
            DB    $40
            DB    $01
            DB    $30
            DB    $00
            DB    $30
            DB    $00
            DB    $30
            DB    $00
            DB    $7C
            DB    $7F
            DB    $3F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $60
            DB    $00
            DB    $00
            DB    $00
            DB    $78
            DB    $00
            DB    $60
            DB    $7F
            DB    $67
            DB    $00
            DB    $00
            DB    $40
            DB    $61
            DB    $00
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $00
            DB    $0C
            DB    $60
            DB    $00
            DB    $00
            DB    $03
            DB    $60
            DB    $00
            DB    $60
            DB    $00
            DB    $60
            DB    $00
            DB    $78
            DB    $7F
            DB    $7F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $40
            DB    $01
            DB    $00
            DB    $00
            DB    $70
            DB    $01
            DB    $40
            DB    $7F
            DB    $4F
            DB    $01
            DB    $00
            DB    $00
            DB    $43
            DB    $01
            DB    $00
            DB    $60
            DB    $40
            DB    $01
            DB    $00
            DB    $18
            DB    $40
            DB    $01
            DB    $00
            DB    $06
            DB    $40
            DB    $01
            DB    $40
            DB    $01
            DB    $40
            DB    $01
            DB    $70
            DB    $7F
            DB    $7F
            DB    $01
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $03
            DB    $00
            DB    $00
            DB    $60
            DB    $03
            DB    $00
            DB    $7F
            DB    $1F
            DB    $03
            DB    $00
            DB    $00
            DB    $06
            DB    $03
            DB    $00
            DB    $40
            DB    $01
            DB    $03
            DB    $00
            DB    $30
            DB    $00
            DB    $03
            DB    $00
            DB    $0C
            DB    $00
            DB    $03
            DB    $00
            DB    $03
            DB    $00
            DB    $03
            DB    $60
            DB    $7F
            DB    $7F
            DB    $03
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $06
            DB    $00
            DB    $00
            DB    $40
            DB    $07
            DB    $00
            DB    $7E
            DB    $3F
            DB    $06
            DB    $00
            DB    $00
            DB    $0C
            DB    $06
            DB    $00
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $60
            DB    $00
            DB    $06
            DB    $00
            DB    $18
            DB    $00
            DB    $06
            DB    $00
            DB    $06
            DB    $00
            DB    $06
            DB    $40
            DB    $7F
            DB    $7F
            DB    $07
L945E       DB    $00
            DB    $0E
            DB    $00
            DB    $34
            DB    $00
            DB    $5A
            DB    $00
            DB    $80
            DB    $00
            DB    $A6
            DB    $00
            DB    $CC
            DB    $00
            DB    $F2
            DB    $04
            DB    $09
            DB    $00
            DB    $38
            DB    $00
            DB    $00
            DB    $00
            DB    $7E
            DB    $01
            DB    $00
            DB    $7C
            DB    $7B
            DB    $03
            DB    $00
            DB    $40
            DB    $19
            DB    $03
            DB    $00
            DB    $30
            DB    $18
            DB    $03
            DB    $00
            DB    $18
            DB    $18
            DB    $03
            DB    $00
            DB    $0C
            DB    $18
            DB    $03
            DB    $00
            DB    $06
            DB    $18
            DB    $03
            DB    $00
            DB    $7F
            DB    $7F
            DB    $03
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $70
            DB    $00
            DB    $00
            DB    $00
            DB    $7C
            DB    $03
            DB    $00
            DB    $78
            DB    $77
            DB    $07
            DB    $00
            DB    $00
            DB    $33
            DB    $06
            DB    $00
            DB    $60
            DB    $30
            DB    $06
            DB    $00
            DB    $30
            DB    $30
            DB    $06
            DB    $00
            DB    $18
            DB    $30
            DB    $06
            DB    $00
            DB    $0C
            DB    $30
            DB    $06
            DB    $00
            DB    $7E
            DB    $7F
            DB    $07
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $00
            DB    $78
            DB    $07
            DB    $00
            DB    $70
            DB    $6F
            DB    $0F
            DB    $00
            DB    $00
            DB    $66
            DB    $0C
            DB    $00
            DB    $40
            DB    $61
            DB    $0C
            DB    $00
            DB    $60
            DB    $60
            DB    $0C
            DB    $00
            DB    $30
            DB    $60
            DB    $0C
            DB    $00
            DB    $18
            DB    $60
            DB    $0C
            DB    $00
            DB    $7C
            DB    $7F
            DB    $0F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $40
            DB    $03
            DB    $00
            DB    $00
            DB    $70
            DB    $0F
            DB    $00
            DB    $60
            DB    $5F
            DB    $1F
            DB    $00
            DB    $00
            DB    $4C
            DB    $19
            DB    $00
            DB    $00
            DB    $43
            DB    $19
            DB    $00
            DB    $40
            DB    $41
            DB    $19
            DB    $00
            DB    $60
            DB    $40
            DB    $19
            DB    $00
            DB    $30
            DB    $40
            DB    $19
            DB    $00
            DB    $78
            DB    $7F
            DB    $1F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $07
            DB    $00
            DB    $00
            DB    $60
            DB    $1F
            DB    $00
            DB    $40
            DB    $3F
            DB    $3F
            DB    $00
            DB    $00
            DB    $18
            DB    $33
            DB    $00
            DB    $00
            DB    $06
            DB    $33
            DB    $00
            DB    $00
            DB    $03
            DB    $33
            DB    $00
            DB    $40
            DB    $01
            DB    $33
            DB    $00
            DB    $60
            DB    $00
            DB    $33
            DB    $00
            DB    $70
            DB    $7F
            DB    $3F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $0E
            DB    $00
            DB    $00
            DB    $40
            DB    $3F
            DB    $00
            DB    $00
            DB    $7F
            DB    $7E
            DB    $00
            DB    $00
            DB    $30
            DB    $66
            DB    $00
            DB    $00
            DB    $0C
            DB    $66
            DB    $00
            DB    $00
            DB    $06
            DB    $66
            DB    $00
            DB    $00
            DB    $03
            DB    $66
            DB    $00
            DB    $40
            DB    $01
            DB    $66
            DB    $00
            DB    $60
            DB    $7F
            DB    $7F
            DB    $00
            DB    $04
            DB    $09
            DB    $00
            DB    $00
            DB    $1C
            DB    $00
            DB    $00
            DB    $00
            DB    $7F
            DB    $00
            DB    $00
            DB    $7E
            DB    $7D
            DB    $01
            DB    $00
            DB    $60
            DB    $4C
            DB    $01
            DB    $00
            DB    $18
            DB    $4C
            DB    $01
            DB    $00
            DB    $0C
            DB    $4C
            DB    $01
            DB    $00
            DB    $06
            DB    $4C
            DB    $01
            DB    $00
            DB    $03
            DB    $4C
            DB    $01
            DB    $40
            DB    $7F
            DB    $7F
            DB    $01
L9576       DB    $00
            DB    $0E
            DB    $00
            DB    $2B
            DB    $00
            DB    $48
            DB    $00
            DB    $65
            DB    $00
            DB    $82
            DB    $00
            DB    $9F
            DB    $00
            DB    $BC
            DB    $03
            DB    $09
            DB    $30
            DB    $00
            DB    $00
            DB    $4C
            DB    $01
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $33
            DB    $06
            DB    $00
            DB    $33
            DB    $06
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $4C
            DB    $01
            DB    $00
            DB    $30
            DB    $00
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $03
            DB    $09
            DB    $60
            DB    $00
            DB    $00
            DB    $18
            DB    $03
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $66
            DB    $0C
            DB    $00
            DB    $66
            DB    $0C
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $18
            DB    $03
            DB    $00
            DB    $60
            DB    $00
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $03
            DB    $09
            DB    $40
            DB    $01
            DB    $00
            DB    $30
            DB    $06
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $4C
            DB    $19
            DB    $00
            DB    $4C
            DB    $19
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $30
            DB    $06
            DB    $00
            DB    $40
            DB    $01
            DB    $00
            DB    $70
            DB    $07
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $03
            DB    $00
            DB    $60
            DB    $0C
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $18
            DB    $33
            DB    $00
            DB    $18
            DB    $33
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $60
            DB    $0C
            DB    $00
            DB    $00
            DB    $03
            DB    $00
            DB    $60
            DB    $0F
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $06
            DB    $00
            DB    $40
            DB    $19
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $30
            DB    $66
            DB    $00
            DB    $30
            DB    $66
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $40
            DB    $19
            DB    $00
            DB    $00
            DB    $06
            DB    $00
            DB    $40
            DB    $1F
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $0C
            DB    $00
            DB    $00
            DB    $33
            DB    $00
            DB    $60
            DB    $40
            DB    $01
            DB    $60
            DB    $4C
            DB    $01
            DB    $60
            DB    $4C
            DB    $01
            DB    $60
            DB    $40
            DB    $01
            DB    $00
            DB    $33
            DB    $00
            DB    $00
            DB    $0C
            DB    $00
            DB    $00
            DB    $3F
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $18
            DB    $00
            DB    $00
            DB    $66
            DB    $00
            DB    $40
            DB    $01
            DB    $03
            DB    $40
            DB    $19
            DB    $03
            DB    $40
            DB    $19
            DB    $03
            DB    $40
            DB    $01
            DB    $03
            DB    $00
            DB    $66
            DB    $00
            DB    $00
            DB    $18
            DB    $00
            DB    $00
            DB    $7E
            DB    $00
L964F       DB    $00
            DB    $0E
            DB    $00
            DB    $2B
            DB    $00
            DB    $48
            DB    $00
            DB    $65
            DB    $00
            DB    $82
            DB    $00
            DB    $9F
            DB    $00
            DB    $BC
            DB    $03
            DB    $09
            DB    $1F
            DB    $00
            DB    $00
            DB    $63
            DB    $00
            DB    $00
            DB    $43
            DB    $01
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $43
            DB    $01
            DB    $00
            DB    $3F
            DB    $00
            DB    $00
            DB    $30
            DB    $00
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $03
            DB    $09
            DB    $3E
            DB    $00
            DB    $00
            DB    $46
            DB    $01
            DB    $00
            DB    $06
            DB    $03
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $06
            DB    $03
            DB    $00
            DB    $7E
            DB    $00
            DB    $00
            DB    $60
            DB    $00
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $03
            DB    $09
            DB    $7C
            DB    $00
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $0C
            DB    $06
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $0C
            DB    $06
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $40
            DB    $01
            DB    $00
            DB    $70
            DB    $07
            DB    $00
            DB    $03
            DB    $09
            DB    $78
            DB    $01
            DB    $00
            DB    $18
            DB    $06
            DB    $00
            DB    $18
            DB    $0C
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $18
            DB    $0C
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $00
            DB    $03
            DB    $00
            DB    $60
            DB    $0F
            DB    $00
            DB    $03
            DB    $09
            DB    $70
            DB    $03
            DB    $00
            DB    $30
            DB    $0C
            DB    $00
            DB    $30
            DB    $18
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $30
            DB    $18
            DB    $00
            DB    $70
            DB    $07
            DB    $00
            DB    $00
            DB    $06
            DB    $00
            DB    $40
            DB    $1F
            DB    $00
            DB    $03
            DB    $09
            DB    $60
            DB    $07
            DB    $00
            DB    $60
            DB    $18
            DB    $00
            DB    $60
            DB    $30
            DB    $00
            DB    $60
            DB    $40
            DB    $01
            DB    $60
            DB    $40
            DB    $01
            DB    $60
            DB    $30
            DB    $00
            DB    $60
            DB    $0F
            DB    $00
            DB    $00
            DB    $0C
            DB    $00
            DB    $00
            DB    $3F
            DB    $00
            DB    $03
            DB    $09
            DB    $40
            DB    $0F
            DB    $00
            DB    $40
            DB    $31
            DB    $00
            DB    $40
            DB    $61
            DB    $00
            DB    $40
            DB    $01
            DB    $03
            DB    $40
            DB    $01
            DB    $03
            DB    $40
            DB    $61
            DB    $00
            DB    $40
            DB    $1F
            DB    $00
            DB    $00
            DB    $18
            DB    $00
            DB    $00
            DB    $7E
            DB    $00
L9728       DB    $00
            DB    $0E
            DB    $00
            DB    $2B
            DB    $00
            DB    $48
            DB    $00
            DB    $65
            DB    $00
            DB    $82
            DB    $00
            DB    $9F
            DB    $00
            DB    $BC
            DB    $03
            DB    $09
            DB    $40
            DB    $07
            DB    $00
            DB    $30
            DB    $06
            DB    $00
            DB    $0C
            DB    $06
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $03
            DB    $06
            DB    $00
            DB    $0C
            DB    $06
            DB    $00
            DB    $70
            DB    $07
            DB    $00
            DB    $30
            DB    $00
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $0F
            DB    $00
            DB    $60
            DB    $0C
            DB    $00
            DB    $18
            DB    $0C
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $06
            DB    $0C
            DB    $00
            DB    $18
            DB    $0C
            DB    $00
            DB    $60
            DB    $0F
            DB    $00
            DB    $60
            DB    $00
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $1E
            DB    $00
            DB    $40
            DB    $19
            DB    $00
            DB    $30
            DB    $18
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $0C
            DB    $18
            DB    $00
            DB    $30
            DB    $18
            DB    $00
            DB    $40
            DB    $1F
            DB    $00
            DB    $40
            DB    $01
            DB    $00
            DB    $70
            DB    $07
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $3C
            DB    $00
            DB    $00
            DB    $33
            DB    $00
            DB    $60
            DB    $30
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $18
            DB    $30
            DB    $00
            DB    $60
            DB    $30
            DB    $00
            DB    $00
            DB    $3F
            DB    $00
            DB    $00
            DB    $03
            DB    $00
            DB    $60
            DB    $0F
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $78
            DB    $00
            DB    $00
            DB    $66
            DB    $00
            DB    $40
            DB    $61
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $30
            DB    $60
            DB    $00
            DB    $40
            DB    $61
            DB    $00
            DB    $00
            DB    $7E
            DB    $00
            DB    $00
            DB    $06
            DB    $00
            DB    $40
            DB    $1F
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $70
            DB    $01
            DB    $00
            DB    $4C
            DB    $01
            DB    $00
            DB    $43
            DB    $01
            DB    $60
            DB    $40
            DB    $01
            DB    $60
            DB    $40
            DB    $01
            DB    $00
            DB    $43
            DB    $01
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $0C
            DB    $00
            DB    $00
            DB    $3F
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $60
            DB    $03
            DB    $00
            DB    $18
            DB    $03
            DB    $00
            DB    $06
            DB    $03
            DB    $40
            DB    $01
            DB    $03
            DB    $40
            DB    $01
            DB    $03
            DB    $00
            DB    $06
            DB    $03
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $18
            DB    $00
            DB    $00
            DB    $7E
            DB    $00
L9801       DB    $00
            DB    $0E
            DB    $00
            DB    $2B
            DB    $00
            DB    $48
            DB    $00
            DB    $65
            DB    $00
            DB    $82
            DB    $00
            DB    $9F
            DB    $00
            DB    $BC
            DB    $03
            DB    $09
            DB    $10
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $44
            DB    $00
            DB    $00
            DB    $44
            DB    $00
            DB    $00
            DB    $44
            DB    $00
            DB    $00
            DB    $44
            DB    $00
            DB    $00
            DB    $01
            DB    $02
            DB    $00
            DB    $01
            DB    $02
            DB    $00
            DB    $55
            DB    $02
            DB    $00
            DB    $03
            DB    $09
            DB    $20
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            DB    $00
            DB    $08
            DB    $01
            DB    $00
            DB    $08
            DB    $01
            DB    $00
            DB    $08
            DB    $01
            DB    $00
            DB    $08
            DB    $01
            DB    $00
            DB    $02
            DB    $04
            DB    $00
            DB    $02
            DB    $04
            DB    $00
            DB    $2A
            DB    $05
            DB    $00
            DB    $03
            DB    $09
            DB    $40
            DB    $00
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $10
            DB    $02
            DB    $00
            DB    $10
            DB    $02
            DB    $00
            DB    $10
            DB    $02
            DB    $00
            DB    $10
            DB    $02
            DB    $00
            DB    $04
            DB    $08
            DB    $00
            DB    $04
            DB    $08
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $20
            DB    $04
            DB    $00
            DB    $20
            DB    $04
            DB    $00
            DB    $20
            DB    $04
            DB    $00
            DB    $20
            DB    $04
            DB    $00
            DB    $08
            DB    $10
            DB    $00
            DB    $08
            DB    $10
            DB    $00
            DB    $28
            DB    $15
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $02
            DB    $00
            DB    $00
            DB    $02
            DB    $00
            DB    $40
            DB    $08
            DB    $00
            DB    $40
            DB    $08
            DB    $00
            DB    $40
            DB    $08
            DB    $00
            DB    $40
            DB    $08
            DB    $00
            DB    $10
            DB    $20
            DB    $00
            DB    $10
            DB    $20
            DB    $00
            DB    $50
            DB    $2A
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $04
            DB    $00
            DB    $00
            DB    $04
            DB    $00
            DB    $00
            DB    $11
            DB    $00
            DB    $00
            DB    $11
            DB    $00
            DB    $00
            DB    $11
            DB    $00
            DB    $00
            DB    $11
            DB    $00
            DB    $20
            DB    $40
            DB    $00
            DB    $20
            DB    $40
            DB    $00
            DB    $20
            DB    $55
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $08
            DB    $00
            DB    $00
            DB    $08
            DB    $00
            DB    $00
            DB    $22
            DB    $00
            DB    $00
            DB    $22
            DB    $00
            DB    $00
            DB    $22
            DB    $00
            DB    $00
            DB    $22
            DB    $00
            DB    $40
            DB    $00
            DB    $01
            DB    $40
            DB    $00
            DB    $01
            DB    $40
            DB    $2A
            DB    $01

L98DA       DB    $00
            DB    $0E
            DB    $00
            DB    $2B
            DB    $00
            DB    $48
            DB    $00
            DB    $65
            DB    $00
            DB    $82
            DB    $00
            DB    $9F
            DB    $00
            DB    $BC
            DB    $03
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $55
            DB    $02
            DB    $00
            DB    $01
            DB    $02
            DB    $00
            DB    $01
            DB    $02
            DB    $00
            DB    $01
            DB    $02
            DB    $00
            DB    $01
            DB    $02
            DB    $00
            DB    $01
            DB    $02
            DB    $00
            DB    $01
            DB    $02
            DB    $00
            DB    $55
            DB    $02
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $2A
            DB    $05
            DB    $00
            DB    $02
            DB    $04
            DB    $00
            DB    $02
            DB    $04
            DB    $00
            DB    $02
            DB    $04
            DB    $00
            DB    $02
            DB    $04
            DB    $00
            DB    $02
            DB    $04
            DB    $00
            DB    $02
            DB    $04
            DB    $00
            DB    $2A
            DB    $05
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $04
            DB    $08
            DB    $00
            DB    $04
            DB    $08
            DB    $00
            DB    $04
            DB    $08
            DB    $00
            DB    $04
            DB    $08
            DB    $00
            DB    $04
            DB    $08
            DB    $00
            DB    $04
            DB    $08
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $15
            DB    $00
            DB    $08
            DB    $10
            DB    $00
            DB    $08
            DB    $10
            DB    $00
            DB    $08
            DB    $10
            DB    $00
            DB    $08
            DB    $10
            DB    $00
            DB    $08
            DB    $10
            DB    $00
            DB    $08
            DB    $10
            DB    $00
            DB    $28
            DB    $15
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $50
            DB    $2A
            DB    $00
            DB    $10
            DB    $20
            DB    $00
            DB    $10
            DB    $20
            DB    $00
            DB    $10
            DB    $20
            DB    $00
            DB    $10
            DB    $20
            DB    $00
            DB    $10
            DB    $20
            DB    $00
            DB    $10
            DB    $20
            DB    $00
            DB    $50
            DB    $2A
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $20
            DB    $55
            DB    $00
            DB    $20
            DB    $40
            DB    $00
            DB    $20
            DB    $40
            DB    $00
            DB    $20
            DB    $40
            DB    $00
            DB    $20
            DB    $40
            DB    $00
            DB    $20
            DB    $40
            DB    $00
            DB    $20
            DB    $40
            DB    $00
            DB    $20
            DB    $55
            DB    $00
            DB    $03
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $40
            DB    $2A
            DB    $01
            DB    $40
            DB    $00
            DB    $01
            DB    $40
            DB    $00
            DB    $01
            DB    $40
            DB    $00
            DB    $01
            DB    $40
            DB    $00
            DB    $01
            DB    $40
            DB    $00
            DB    $01
            DB    $40
            DB    $00
            DB    $01
            DB    $40
            DB    $2A
            DB    $01

L99B3       DB    $F8
            DB    $F9
            DB    $EF
            DB    $47
            DB    $60
            DB    $65
            DB    $6D
            DB    $64
            DB    $6B
            DB    $BA
            DB    $B7
            DB    $00
            DB    $A0
            DB    $A7
            DB    $EE
            DB    $FE
            DB    $EA
            DB    $EB
            DB    $EF
            DB    $67
            DB    $68
            DB    $65
            DB    $6D
            DB    $6C
            DB    $6B
            DB    $BA
            DB    $B7
            DB    $00
            DB    $A0
            DB    $B7
            DB    $FE
            DB    $F4
            DB    $FC
            DB    $FD
            DB    $EF
            DB    $66
            DB    $24
            DB    $E5
            DB    $ED
            DB    $EC
            DB    $EA
            DB    $BE
            DB    $B7
            DB    $00
            DB    $A2
            DB    $97
            DB    $FE
            DB    $FE
            DB    $E8
            DB    $EB
            DB    $EF
            DB    $66
            DB    $40
            DB    $65
            DB    $4D
            DB    $4C
            DB    $6A
            DB    $9A
            DB    $B7
            DB    $00
            DB    $A2
            DB    $B7
            DB    $FE
            DB    $F6
            DB    $FA
            DB    $FB
            DB    $EF
            DB    $66
            DB    $24
            DB    $65
            DB    $4D
            DB    $4C
            DB    $EA
            DB    $BA
            DB    $B7
            DB    $00
            DB    $A2
            DB    $87
            DB    $EE
            DB    $FE
            DB    $EC
            DB    $EF
            DB    $EF
            DB    $66
            DB    $64
            DB    $65
            DB    $4D
            DB    $4C
            DB    $6A
            DB    $9A
            DB    $B7
            DB    $00
            DB    $A2
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L9C82       DS    $FF
L9D81       DS    $FF

*----------------------- Page 2 table pointers

tblPAGE2L   DS    $C0	; table of 28/50/78...
tblPAGE2H   DS    $C0	; table of A0..A1..A2..

*--- There is the offscreen (PAGE2) screen at $A000..$BFFF

