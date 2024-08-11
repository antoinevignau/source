*
* Robotron: 2084
* by Steve Hays
*
* (c) 1982, Atari and Williams
* (s) 2024, Antoine Vignau
*

            TYP   BIN
            ORG   $002DFD
	LST   OFF

*-----------------------------------
*
*-----------------------------------

KBD         EQU   $C000
KBDSTROBE   EQU   $C010
SPKR        EQU   $C030
TXTCLR      EQU   $C050
MIXCLR      EQU   $C052
TXTPAGE1    EQU   $C054
HIRES       EQU   $C057
BUTN0       EQU   $C061
BUTN1       EQU   $C062
PREAD       EQU   $FB1E
WAIT        EQU   $FCA8

*-----------------------------------
*
*-----------------------------------

            JMP   L4000

*-----------------------------------
*
*-----------------------------------

            ORG   $000800

L0800       DB    $00
            DB    $00
            DB    $10
            DB    $20
            DB    $FF
            DB    $FF
            DB    $30
            DB    $40
            DB    $50
            DB    $60
            DB    $10
            DB    $20
            DB    $FF
            DB    $FF
            DB    $30
            DB    $40
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $50
            DB    $60
            DB    $10
            DB    $20
            DB    $FF
            DB    $FF
            DB    $30
            DB    $40
L0820       DB    $7A
            DB    $7A
            DB    $7A
            DB    $7A
            DB    $FF
            DB    $FF
            DB    $7A
            DB    $7A
            DB    $7A
            DB    $7A
            DB    $7A
            DB    $7A
            DB    $FF
            DB    $FF
            DB    $7A
            DB    $7A
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $7A
            DB    $7A
            DB    $7A
            DB    $7A
            DB    $FF
            DB    $FF
            DB    $7A
            DB    $7A
L0840       DB    $D0
            DB    $D0
            DB    $E0
            DB    $F0
            DB    $FF
            DB    $FF
            DB    $00
            DB    $10
            DB    $20
            DB    $30
            DB    $E0
            DB    $F0
            DB    $FF
            DB    $FF
            DB    $00
            DB    $10
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $00
            DB    $FF
            DB    $FF
            DB    $20
            DB    $30
            DB    $E0
            DB    $F0
            DB    $FF
            DB    $FF
            DB    $00
            DB    $10
L0860       DB    $7B
            DB    $7B
            DB    $7B
            DB    $7B
            DB    $FF
            DB    $FF
            DB    $7C
            DB    $7C
            DB    $7C
            DB    $7C
            DB    $7B
            DB    $7B
            DB    $FF
            DB    $FF
            DB    $7C
            DB    $7C
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $7C
            DB    $7C
            DB    $7B
            DB    $7B
            DB    $FF
            DB    $FF
            DB    $7C
            DB    $7C
L0880       DB    $70
            DB    $80
            DB    $FF
            DB    $FF
L0884       DB    $7A
            DB    $7A
            DB    $FF
            DB    $FF
L0888       DB    $40
            DB    $50
            DB    $FF
            DB    $FF
L088C       DB    $7C
            DB    $7C
            DB    $FF
            DB    $FF
L0890       DB    $E0
            DB    $D0
            DB    $00
            DB    $F0
            DB    $20
            DB    $10
            DB    $20
            DB    $10
L0898       DB    $7A
            DB    $7A
            DB    $7B
            DB    $7A
            DB    $7B
            DB    $7B
            DB    $7B
            DB    $7B
L08A0       DB    $10
            DB    $20
            DB    $30
            DB    $40
            DB    $90
            DB    $A0
            DB    $B0
            DB    $C0
            DB    $70
            DB    $80
            DB    $90
            DB    $A0
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L08B0       DB    $7A
            DB    $7A
            DB    $7A
            DB    $7A
            DB    $7A
            DB    $7A
            DB    $7A
            DB    $7A
            DB    $7D
            DB    $7D
            DB    $7D
            DB    $7D
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L08C0       DB    $60
            DB    $50
            DB    $40
            DB    $30
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L08C8       DB    $7C
            DB    $7B
            DB    $7B
            DB    $7B
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L08D0       DB    $60
            DB    $FF
            DB    $FF
            DB    $FF
L08D4       DB    $7B
            DB    $FF
            DB    $FF
            DB    $FF
L08D8       DB    $70
            DB    $80
            DB    $FF
            DB    $FF
L08DC       DB    $7B
            DB    $7B
            DB    $FF
            DB    $FF
L08E0       DB    $90
            DB    $A0
            DB    $B0
            DB    $C0
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L08E8       DB    $7B
            DB    $7B
            DB    $7B
            DB    $7B
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L08F0       DB    $70
            DB    $80
            DB    $90
            DB    $90
            DB    $A0
            DB    $B0
            DB    $C0
            DB    $C0
            DB    $B0
            DB    $C0
            DB    $D0
            DB    $D0
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0900       DB    $7C
            DB    $7C
            DB    $7C
            DB    $7C
            DB    $7C
            DB    $7C
            DB    $7C
            DB    $7C
            DB    $7D
            DB    $7D
            DB    $7D
            DB    $7D
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0910       DB    $40
            DB    $30
            DB    $20
            DB    $10
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0918       DB    $7D
            DB    $7D
            DB    $7D
            DB    $7D
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0920       DB    $D0
            DB    $E0
            DB    $F0
            DB    $00
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0928       DB    $7C
            DB    $7C
            DB    $7C
            DB    $7D
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0930       DB    $50
            DB    $60
            DB    $FF
            DB    $FF
L0934       DB    $7D
            DB    $7D
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0940       DB    $00
            DB    $10
            DB    $20
            DB    $30
            DB    $40
            DB    $90
            DB    $A0
            DB    $FF
L0948       DB    $7F
            DB    $7F
            DB    $7F
            DB    $7F
            DB    $7F
            DB    $7F
            DB    $7F
            DB    $FF
L0950       DB    $80
            DB    $70
            DB    $60
            DB    $50
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0958       DB    $7F
            DB    $7F
            DB    $7F
            DB    $7F
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0960       DB    $F0
            DB    $E0
            DB    $FF
            DB    $FF
L0964       DB    $7F
            DB    $7F
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            MX    %11
            DB    $FF
            DB    $FF
            DB    $FF
L0A00       DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $00
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $03
            DB    $FF
            DB    $05
            DB    $01
            DB    $0D
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $00
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $0C
            DB    $04
            DB    $FF
            DB    $07
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0A80       DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $00
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $07
            DB    $FF
            DB    $04
            DB    $05
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $01
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $0F
            DB    $FF
            DB    $03
            DB    $00
            DB    $FF
            DB    $FF
            DB    $0C
            DB    $0D
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0B00       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $04
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $05
            DB    $00
            DB    $05
            DB    $05
            DB    $0D
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0F
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0D
            DB    $0D
            DB    $0D
            DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $07
            DB    $07
            DB    $07
            DB    $07
            DB    $03
            DB    $07
            DB    $07
            DB    $05
            DB    $01
            DB    $05
            DB    $05
            DB    $05
            DB    $05
            DB    $05
            DB    $01
            DB    $01
            DB    $03
            DB    $03
            DB    $07
            DB    $03
            DB    $01
            DB    $07
            DB    $03
            DB    $07
            DB    $01
            DB    $07
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0C00       DB    $08
L0C01       DB    $78
L0C02       DB    $10
L0C03       DB    $20
L0C04       DB    $30
L0C05       DB    $04
L0C06       DB    $04
L0C07       DB    $08
L0C08       DB    $05
L0C09       DB    $04
L0C0A       DB    $18
L0C0B       DB    $08
L0C0C       DB    $18
L0C0D       DB    $06
L0C0E       DB    $20
L0C0F       DB    $0D
L0C10       DB    $A8
L0C11       DB    $61
L0C12       DB    $00
L0C13       DB    $03
L0C14       DB    $28
L0C15       DB    $0C
L0C16       DB    $1C
L0C17       DB    $0A
L0C18       DB    $01
L0C19       DB    $01
L0C1A       DB    $01
L0C1B       DB    $10
L0C1C       DB    $07
L0C1D       DB    $FF
L0C1E       DB    $08
            DB    $10
L0C20       DB    $F0
L0C21       DB    $60
L0C22       DB    $08
L0C23       DB    $20
L0C24       DB    $04
L0C25       DB    $04
L0C26       DB    $2C
L0C27       DB    $A0
L0C28       DB    $30
L0C29       DB    $30
L0C2A       DB    $06
L0C2B       DB    $18
L0C2C       DB    $20
L0C2D       DB    $04
L0C2E       DB    $07
L0C2F       DB    $A0
L0C30       DB    $18
L0C31       DB    $FF
L0C32       DB    $02
            DB    $FF
L0C34       DB    $60
L0C35       DB    $06
L0C36       DB    $06
L0C37       DB    $60
L0C38       DB    $02
L0C39       DB    $20
L0C3A       DB    $D0
L0C3B       DB    $F0
            DB    $FF
L0C3D       DB    $FF
L0C3E       DB    $00
L0C3F       DB    $60
            DB    $01
L0C41       DB    $00
            DB    $FF
L0C43       DB    $08
L0C44       DB    $04
L0C45       DB    $0D
L0C46       DB    $40
L0C47       DB    $03
L0C48       DB    $10
L0C49       DB    $40
L0C4A       DB    $10
L0C4B       DB    $18
L0C4C       DB    $28
L0C4D       DB    $02
L0C4E       DB    $02
L0C4F       DB    $01
L0C50       DB    $30
L0C51       DB    $06
L0C52       DB    $08
L0C53       DB    $01
L0C54       DB    $20
L0C55       DB    $80
L0C56       DB    $E0
L0C57       DB    $03
L0C58       DB    $10
L0C59       DB    $1C
L0C5A       DB    $04
L0C5B       DB    $30
            DB    $F8
            DB    $08
L0C5E       DB    $06
L0C5F       DB    $02
L0C60       DB    $03
L0C61       DB    $0B
            DB    $00
L0C63       DB    $03
L0C64       DB    $90
L0C65       DB    $0A
L0C66       DB    $60
L0C67       DB    $80
L0C68       DB    $C0
L0C69       DB    $17
L0C6A       DB    $05
L0C6B       DB    $0C
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0C80       DB    $12
            DB    $01
            DB    $08
            DB    $0A
            DB    $06
            DB    $14
            DB    $04
            DB    $1E
            DB    $02
            DB    $28
            DB    $00
            DB    $FF
            DB    $13
            DB    $01
            DB    $08
            DB    $0A
            DB    $06
            DB    $14
            DB    $04
            DB    $1E
            DB    $02
            DB    $28
            DB    $00
            DB    $FF
            DB    $14
            DB    $01
            DB    $40
            DB    $10
            DB    $30
            DB    $20
            DB    $20
            DB    $30
            DB    $18
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0D00       DB    $00
            DB    $02
            DB    $12
            DB    $FE
L0D04       DB    $03
            DB    $FD
            DB    $07
            DB    $F9
            DB    $0C
            DB    $F4
            DB    $10
            DB    $F0
L0D0C       DB    $FF
            DB    $FF
            DB    $BE
            DB    $BE
            DB    $9C
            DB    $9C
            DB    $8C
            DB    $8C
L0D14       DB    $04
            DB    $FC
            DB    $00
            DB    $00
L0D18       DB    $00
            DB    $00
            DB    $04
            DB    $FC
L0D1C       DB    $02
            DB    $FE
L0D1E       DB    $0C
            DB    $0D
            DB    $01
            DB    $05
            DB    $04
            DB    $07
            DB    $03
            DB    $0F
L0D26       DB    $7F
            DB    $3F
            DB    $3E
            DB    $1E
            DB    $1C
            DB    $0C
            DB    $7F
            DB    $3F
            DB    $3E
            DB    $1E
            DB    $1C
            DB    $0C
L0D32       DB    $02
            DB    $04
            DB    $06
            DB    $08
            DB    $0A
            DB    $0C
            DB    $FE
            DB    $FC
            DB    $FA
            DB    $F8
            DB    $F6
            DB    $F4
L0D3E       DB    $06
            DB    $FA
            DB    $00
            DB    $00
L0D42       DB    $00
            DB    $00
            DB    $06
            DB    $FA
L0D46       DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $D8
            DB    $D8
            DB    $D8
            DB    $00
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $D8
            DB    $D8
            DB    $B4
            DB    $B4
            DB    $80
            DB    $80
            DB    $80
            DB    $00
            DB    $00
L0D5E       DB    $EA
            DB    $02
            DB    $EA
            DB    $06
            DB    $04
            DB    $03
            DB    $EA
            DB    $05
            DB    $EA
            DB    $EA
            DB    $EA
            DB    $EA
            DB    $00
            DB    $01
            DB    $EA
            DB    $07
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
L0E00       DB    $0B
            DB    $12
            DB    $15
            DB    $19
            DB    $0C
            DB    $15
            DB    $00
            DB    $15
            DB    $1E
            DB    $0F
            DB    $19
            DB    $00
            DB    $19
            DB    $19
            DB    $11
            DB    $19
            DB    $00
            DB    $1A
            DB    $24
            DB    $11
            DB    $19
            DB    $00
            DB    $19
            DB    $1D
            DB    $12
            DB    $19
            DB    $00
            DB    $19
            DB    $28
            DB    $13
            DB    $1D
            DB    $00
            DB    $20
            DB    $1D
            DB    $14
            DB    $1D
            DB    $00
            DB    $20
            DB    $2B
            DB    $14
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $28
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $80
            DB    $00
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $28
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $01
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $28
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $14
            DB    $00
            DB    $10
            DB    $80
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0E80       DB    $00
            DB    $04
            DB    $05
            DB    $05
            DB    $00
            DB    $06
            DB    $08
            DB    $06
            DB    $02
            DB    $00
            DB    $07
            DB    $09
            DB    $07
            DB    $10
            DB    $00
            DB    $07
            DB    $0A
            DB    $08
            DB    $02
            DB    $00
            DB    $07
            DB    $0A
            DB    $07
            DB    $07
            DB    $03
            DB    $09
            DB    $0A
            DB    $02
            DB    $09
            DB    $04
            DB    $07
            DB    $0B
            DB    $07
            DB    $10
            DB    $04
            DB    $09
            DB    $03
            DB    $09
            DB    $09
            DB    $04
            DB    $01
            DB    $01
            DB    $01
            DB    $10
            DB    $01
            DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $10
            DB    $02
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0F00       DB    $01
            DB    $03
            DB    $03
            DB    $03
            DB    $00
            DB    $03
            DB    $05
            DB    $04
            DB    $02
            DB    $0E
            DB    $05
            DB    $05
            DB    $05
            DB    $07
            DB    $00
            DB    $06
            DB    $07
            DB    $03
            DB    $06
            DB    $05
            DB    $06
            DB    $07
            DB    $06
            DB    $06
            DB    $00
            DB    $06
            DB    $03
            DB    $06
            DB    $07
            DB    $0F
            DB    $07
            DB    $05
            DB    $07
            DB    $06
            DB    $00
            DB    $03
            DB    $05
            DB    $07
            DB    $07
            DB    $06
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $05
            DB    $05
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $01
            DB    $01
            DB    $00
            DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $05
            DB    $10
            DB    $00
            DB    $00
            DB    $09
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $05
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0F80       DB    $01
            DB    $02
            DB    $03
            DB    $03
            DB    $0C
            DB    $05
            DB    $05
            DB    $04
            DB    $02
            DB    $00
            DB    $04
            DB    $05
            DB    $04
            DB    $06
            DB    $00
            DB    $05
            DB    $06
            DB    $02
            DB    $05
            DB    $06
            DB    $06
            DB    $07
            DB    $06
            DB    $06
            DB    $0F
            DB    $06
            DB    $03
            DB    $06
            DB    $07
            DB    $00
            DB    $06
            DB    $05
            DB    $06
            DB    $08
            DB    $01
            DB    $03
            DB    $05
            DB    $07
            DB    $07
            DB    $06
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $0E
            DB    $01
            DB    $01
            DB    $05
            DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $01
            DB    $00
            DB    $01
            DB    $00
            DB    $10
            DB    $05
            DB    $05
            DB    $00
            DB    $10
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $01
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $05
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1000       DB    $00
            DB    $01
            DB    $02
            DB    $02
            DB    $01
            DB    $02
            DB    $02
            DB    $02
            DB    $00
            DB    $00
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $10
            DB    $02
            DB    $02
            DB    $01
            DB    $02
            DB    $05
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $01
            DB    $02
            DB    $01
            DB    $02
            DB    $02
            DB    $00
            DB    $02
            DB    $02
            DB    $02
            DB    $02
            DB    $0F
            DB    $01
            DB    $02
            DB    $02
            DB    $02
            DB    $04
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $06
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $05
            DB    $00
            DB    $00
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $10
            DB    $00
            DB    $0E
            DB    $00
            DB    $0E
            DB    $00
            DB    $00
            DB    $00
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $06
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1080       DB    $00
            DB    $03
            DB    $06
            DB    $09
            DB    $03
            DB    $09
            DB    $00
            DB    $09
            DB    $09
            DB    $06
            DB    $09
            DB    $00
            DB    $09
            DB    $06
            DB    $06
            DB    $09
            DB    $00
            DB    $09
            DB    $0A
            DB    $07
            DB    $09
            DB    $00
            DB    $0C
            DB    $0C
            DB    $07
            DB    $09
            DB    $07
            DB    $0C
            DB    $0B
            DB    $0C
            DB    $0C
            DB    $00
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0A
            DB    $0F
            DB    $0B
            DB    $0F
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $50
            DB    $00
            DB    $00
            DB    $05
            DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $05
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0A
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $50
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1100       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0A
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0B
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0C
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0C
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0D
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0E
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0E
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0E
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $10
            DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $01
            DB    $01
            DB    $01
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0A
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $01
            DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L1180       DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $06
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $07
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $08
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $09
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $05
            DB    $01
            DB    $01
            DB    $00
            DB    $00
            DB    $09
            DB    $01
            DB    $00
            DB    $00
            DB    $01
            DB    $07
            DB    $02
            DB    $02
            DB    $01
            DB    $01
            DB    $06
            DB    $01
            DB    $01
            DB    $01
            DB    $01
            DB    $07
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $01
            DB    $10
            DB    $01
            DB    $00
            DB    $04
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $08
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $01
            DB    $00
            DB    $04
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $03
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $01
            DB    $10
            DB    $00
            DB    $10
            DB    $01
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
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
* HGR TABLES
*-----------------------

L1200       HEX   00000000000000008080808080808080
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
            HEX   D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
            HEX   D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
            HEX   D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0
            HEX   D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0D0

L1300       HEX   2024282C3034383C2024282C3034383C
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
            HEX   1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
            HEX   1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
            HEX   1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
            HEX   1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F

*-----------------------
* $1400..$1FFF is used
*-----------------------

*-----------------------
* WE ARE AT $100
*-----------------------

            ORG   $000100

L0100       DS    $40
L0140       JMP   L0158
L0143       JMP   L034F
L0146       JMP   L028E
L0149       JMP   L03B4
L014C       JMP   L03FE
L014F       JMP   L0474
L0152       JMP   L04E9
L0155       JMP   L054A

L0158       JSR   L04D3
            ASC   0D
            ASC   0318
            ASC   'INSPIRED BY HIS NEVER-ENDING QUEST'0D
            ASC   03
            ASC   '(FOR PROGRESS, IN 2084 MAN PERFECTS'0D
            ASC   03
            ASC   '8THE ROBOTRONS:'02080D
            ASC   03
            ASC   'PA ROBOT SPECIES SO ADVANCED THAT MAN'0D
            ASC   03
            ASC   '`IS INFERIOR TO HIS OWN CREATION.'02080D
            ASC   03
            ASC   'xGUIDED BY THEIR INFALLIBLE LOGIC,'0D
            ASC   0388
            ASC   'THE ROBOTRONS CONCLUDE:'02080D
            ASC   03
            ASC   " "
            ASC   'THE HUMAN RACE IS INEFFICIENT, AND'0D
            ASC   03
            ASC   "0"
            ASC   'THEREFORE MUST BE DESTROYED.'02
            ASC   '`'020100
            RTS

L028E       JSR   L04D3
            ASC   0D
            ASC   0318
            ASC   'YOU ARE THE LAST HOPE OF MANKIND.'02080D
            ASC   03
            ASC   '0DUE TO A GENETIC ENGINEERING ERROR,'0D
            ASC   03
            ASC   '@YOU POSSESS SUPERHUMAN POWERS.'02080D
            ASC   03
            ASC   'XYOUR MISSION IS TO STOP THE'0D
            ASC   03
            ASC   'hROBOTRONS, AND SAVE THE LAST'0D
            ASC   03
            ASC   'xHUMAN FAMILY.'00
            RTS

L034F       JSR   L04D3
            ASC   0D
            ASC   03
            ASC   '(THE FORCE OF GROUND ROVING UNIT'0D
            ASC   03
            ASC   '8NETWORK TERMINATOR (GRUNT)'0D
            ASC   03
            ASC   'HROBOTRONS SEEK TO DESTROY YOU.'00
            RTS

L03B4       JSR   L04D3
            ASC   0D
            ASC   03
            ASC   '8THE HULK ROBOTRONS SEEK OUT AND'0D
            ASC   03
            ASC   'HELIMINATE THE LAST HUMAN FAMILY.'00
            RTS

L03FE       JSR   L04D3
            ASC   0D
            ASC   03
            ASC   '(BEWARE OF THE INGENIOUS'0D
            ASC   03
            ASC   '8BRAIN ROBOTRONS, THAT POSSESS'0D
            ASC   03
            ASC   'HTHE POWER TO REPROGRAM HUMANS'0D
            ASC   03
            ASC   'XINTO SINISTER PROGS.'00
            RTS

L0474       JSR   L04D3
            ASC   0D
            ASC   03
            ASC   '8THE SPHEROIDS AND QUARKS'0D
            ASC   03
            ASC   'HARE PROGRAMMED TO MANUFACTURE'0D
            ASC   03
            ASC   'XENFORCER AND TANK ROBOTRONS.'00
            RTS

            MX    %11
L04D3       PLA
            STA   $28
            PLA
            STA   $29
            LDA   #$00
            STA   $2A
            LDA   #$FF
            STA   $2B
            STA   $2C
            LDX   #$01
            JSR   L0540
            RTS

L04E9       LDY   #$00
            LDA   ($28),Y
            BNE   L04F0
            RTS

L04F0       LDX   $2A
            BEQ   L04F7
            DEC   $2A
            RTS

L04F7       CMP   #$01
            BNE   L0505
            INY
            LDA   ($28),Y
            STA   $2B
            LDX   #$02
            JMP   L0540

L0505       CMP   #$02
            BNE   L0513
            INY
            LDA   ($28),Y
            STA   $2A
            LDX   #$02
            JMP   L0540

L0513       CMP   #$0D
            BNE   L0526
            INY
            LDA   ($28),Y
            STA   $2D
            INY
            LDA   ($28),Y
            STA   $2E
            LDX   #$03
            JMP   L0540

L0526       LDX   $2D
            LDY   $2E
            PHA
            JSR   L5108
            PLA
            CMP   #$20
            BEQ   L053C
            LDA   $2F
            CMP   #$60
            BEQ   L053C
            LDA   SPKR
L053C       INC   $2D
            LDX   #$01
L0540       INC   $28
            BNE   L0546
            INC   $29
L0546       DEX
            BNE   L0540
            RTS

L054A       JSR   L51B8
            ASC   0D
            ASC   03
            ASC   " "
            ASC   '$ 1982 WILLIAMS ELECTRONICS, INC.'0D0A
            ASC   "+"
            ASC   '$ 1983 ATARI, INC.'00
            RTS

*-----------------------------------
*
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
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $80
            DB    $80
            DB    $80
            DB    $CC
            DB    $81
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $CE
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $CB
            DB    $86
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C0
            DB    $C9
            DB    $8C
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $C8
            DB    $98
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $B0
            DB    $C8
            DB    $B0
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $98
            DB    $C8
            DB    $E0
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $8C
            DB    $C8
            DB    $C4
            DB    $81
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $86
            DB    $C9
            DB    $8C
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C3
            DB    $C9
            DB    $9C
            DB    $86
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E1
            DB    $C9
            DB    $B4
            DB    $84
            DB    $80
            DB    $80
            DB    $FE
            DB    $9F
            DB    $B1
            DB    $C9
            DB    $E4
            DB    $84
            DB    $C0
            DB    $87
            DB    $82
            DB    $90
            DB    $99
            DB    $C9
            DB    $C4
            DB    $84
            DB    $C0
            DB    $84
            DB    $82
            DB    $90
            DB    $89
            DB    $C9
            DB    $C4
            DB    $84
            DB    $C0
            DB    $84
            DB    $E2
            DB    $9F
            DB    $89
            DB    $C9
            DB    $C4
            DB    $84
            DB    $C0
            DB    $84
            DB    $C6
            DB    $81
            DB    $89
            DB    $C9
            DB    $C4
            DB    $84
            DB    $C0
            DB    $84
            DB    $8C
            DB    $83
            DB    $89
            DB    $C9
            DB    $C4
            DB    $84
            DB    $C0
            DB    $84
            DB    $98
            DB    $86
            DB    $89
            DB    $C9
            DB    $C4
            DB    $E4
            DB    $FF
            DB    $84
            DB    $B0
            DB    $8C
            DB    $89
            DB    $C9
            DB    $FC
            DB    $A4
            DB    $80
            DB    $84
            DB    $E0
            DB    $98
            DB    $89
            DB    $C9
            DB    $80
            DB    $A4
            DB    $80
            DB    $84
            DB    $C0
            DB    $91
            DB    $89
            DB    $C9
            DB    $80
            DB    $A4
            DB    $FE
            DB    $84
            DB    $80
            DB    $93
            DB    $89
            DB    $C9
            DB    $FC
            DB    $A4
            DB    $C2
            DB    $84
            DB    $9E
            DB    $92
            DB    $89
            DB    $C9
            DB    $C4
            DB    $A4
            DB    $C2
            DB    $84
            DB    $A2
            DB    $91
            DB    $89
            DB    $C9
            DB    $C4
            DB    $A4
            DB    $C2
            DB    $84
            DB    $E2
            DB    $91
            DB    $89
            DB    $C9
            DB    $C4
            DB    $A4
            DB    $C2
            DB    $84
            DB    $86
            DB    $98
            DB    $89
            DB    $C9
            DB    $C4
            DB    $A4
            DB    $C2
            DB    $84
            DB    $8C
            DB    $8C
            DB    $89
            DB    $C9
            DB    $C4
            DB    $A4
            DB    $C2
            DB    $84
            DB    $98
            DB    $86
            DB    $89
            DB    $C9
            DB    $C4
            DB    $A4
            DB    $C2
            DB    $84
            DB    $B0
            DB    $83
            DB    $99
            DB    $C9
            DB    $E4
            DB    $A4
            DB    $C2
            DB    $84
            DB    $E0
            DB    $81
            DB    $B1
            DB    $C9
            DB    $B4
            DB    $E4
            DB    $C3
            DB    $87
            DB    $80
            DB    $80
            DB    $E3
            DB    $C9
            DB    $9C
            DB    $86
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C6
            DB    $C9
            DB    $8C
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $8C
            DB    $C9
            DB    $C4
            DB    $81
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $98
            DB    $C8
            DB    $E0
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $B0
            DB    $C8
            DB    $B0
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $C8
            DB    $98
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C0
            DB    $C9
            DB    $8C
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $CB
            DB    $86
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $CE
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $CC
            DB    $81
            DB    $80
            DB    $80
            DB    $80

*-----------------------------------
*
*-----------------------------------

            ORG   $004000
            MX    %11

L4000       LDX   #$3F	; move data once
            TXS
            LDA   #$2E	; $2E00..$39FF -> $0800..$13FF, 12 pages
            LDX   #$0C
            LDY   #$08
            JSR   L449D
            LDA   #$3A	; $3A00..$3FFF -> $0100..$6FF, 6 pages
            LDX   #$06
            LDY   #$01
            JSR   L449D

            LDX   #$3F
            TXS
            JSR   makeSPRITES

            LDA   #$EA	; put NOP above
            LDX   #$14
L401F       STA   L4000,X
            DEX
            BPL   L401F

            LDA   #>L1200 ; set the pointers to the HGR table
            STA   $FC+1
            LDA   #>L1300
            STA   $FE+1

            LDA   TXTCLR
            LDA   MIXCLR
            LDA   TXTPAGE1
            LDA   HIRES
            LDA   #$00
            STA   $1407
            STA   $150C
            STA   $1432
            STA   $1433
            STA   $1434
            LDA   L0C10
            STA   $150A
            LDA   L0C11
            STA   $150B
            LDA   #$01
            STA   $1417
            LDA   #$06
            STA   $1509
L4060       LDX   #$3F
            TXS
            JSR   L4504
            JSR   L4B67
            LDA   L0C6A
            STA   $1509
            LDA   #$00
            STA   $1407
            STA   $150A
            STA   $150B
            STA   $150C
            LDX   L0C10
            DEX
            STX   $150D
            LDX   L0C11
            STX   $150E
L408A       JSR   L442A
L408D       JSR   L43C0
L4090       LDX   #$3F
            TXS
            JSR   L426B
            BCC   L40AC
            JSR   L4D4A
            INC   $1407
            LDA   $1407
            CMP   #$64
            BCC   L408A
            LDA   #$00
            STA   $1407
            BEQ   L408A
L40AC       JSR   L430E
            JSR   L4110
            JSR   L425B
            JSR   L4110
            JSR   L4171
            JSR   L5209
            JSR   L5A1B
            JSR   L5206
            JSR   L5203
            BCC   L40D7
            JSR   L4EF1
            DEC   $1509
            BNE   L408D
            JSR   L6215
            JMP   L4060

L40D7       JSR   L5A1E
            JSR   L4110
            JSR   L5A09
            JSR   L5A0C
            JSR   L5A0F
            JSR   L4110
            JSR   L6203
            JSR   L6206
            JSR   L6209
            JSR   L4110
            JSR   L7003
            JSR   L7006
            JSR   L7009
            JSR   L7009
            JSR   L4110
            JSR   L6903
            JSR   L6906
            JSR   L6909
            JMP   L4090

L4110       LDA   $1417
            CMP   #$01
            BNE   L412B
            JSR   L41E3
            LDA   L0A00,Y
            BMI   L4122
            STA   $1506
L4122       LDA   L0A80,Y
            BMI   L412A
            STA   $1416
L412A       RTS

L412B       TAX
            BNE   L416E
            LDA   BUTN1
            BPL   L4150
            LDA   $1435
            CLC
            ADC   L0C6B
            STA   $1435
            BCC   L4150
            LDX   $1436
            LDA   L0D5E,X
            ADC   #$00
            AND   #$07
            TAX
            LDA   L0D1E,X
            STA   $1436
L4150       LDA   #$00
            LDY   BUTN0
            BPL   L4168
            LDA   $1436
            LDX   $1431
            BMI   L4168
            LDX   $1506
            BEQ   L4168
            STX   $1436
            TXA
L4168       STA   $1416
            STY   $1431
L416E       JMP   L4C6E

L4171       LDA   $1417
            CMP   #$03
            BNE   L41B4
            JSR   L4185
            JSR   L41E3
            LDA   L0B00,Y
            STA   $1416
            RTS

L4185       LDA   #$03
            LDX   $1508
            BNE   L418E
            EOR   #$0F
L418E       AND   $1506
            STA   $1506
            JSR   PREAD
            LDX   #$00
            CPY   #$C0
            BCC   L419E
            INX
L419E       CPY   #$40
            BCS   L41A3
            DEX
L41A3       TXA
            AND   #$03
            LDX   $1508
            BEQ   L41AD
            ASL
            ASL
L41AD       ORA   $1506
            STA   $1506
            RTS

L41B4       CMP   #$02
            BNE   L41D9
            LDX   $1508
            JSR   PREAD
            TYA
            LSR
            LSR
            LSR
            LSR
            LSR
            TAY
            LDA   L0D1E,Y
            LDX   $1508
            BNE   L41D2
            STA   $1506
            BEQ   L41D5
L41D2       STA   $1416
L41D5       JSR   L41E3
            RTS

L41D9       TAX
            BNE   L41E2
            JSR   L4185
            JSR   L41E3
L41E2       RTS

L41E3       LDA   KBD
            BMI   L41EB
L41E8       PLA
            PLA
            RTS

L41EB       JSR   L4242
            CPY   #$1B
            BNE   L41F9
L41F2       LDA   KBD
            BPL   L41F2
            BMI   L41E8
L41F9       CPY   #$13
            BNE   L4207
            LDA   L4C6E
            EOR   #$C5
            STA   L4C6E
            BNE   L41E8
L4207       CPY   #$12
            BNE   L4236
            JSR   L424E
            BCS   L41E8
            STA   $07
            LDX   #$0A
            JSR   L4C4F
            STX   $06
            JSR   L424E
            BNE   L4222
            LDA   $07
            BPL   L4227
L4222       BCS   L41E8
            CLC
            ADC   $06
L4227       SEC
            SBC   #$01
            BCC   L41E8
            STA   $1407
            PLA
            PLA
            PLA
            PLA
            JMP   L408A

L4236       CMP   #$11
            BNE   L4241
            PLA
            PLA
            PLA
            PLA
            JMP   L4060
L4241       RTS

L4242       LDA   KBD
            BPL   L4242
            STA   KBDSTROBE
            AND   #$7F
            TAY
            RTS

L424E       JSR   L4242
            CMP   #$0D
            BEQ   L425A
            SEC
            SBC   #$30
            CMP   #$0A
L425A       RTS

L425B       LDX   $1411
            INX
L425F       LDY   #$40
L4261       DEY
            BNE   L4261
            JSR   L4C6E
            DEX
            BNE   L425F
            RTS

L426B       DEC   $1404
            BMI   L4272
            CLC
            RTS

L4272       LDA   #$0A
            STA   $1404
            LDA   $1402
            LDX   $1403
            JSR   L4C00
            ASL
            STA   $00
            LDA   $140E
            ADC   $140F
            ADC   $141B
            ADC   $141D
            ASL
            ADC   $00
            STA   $00
            LDA   $1409
            ADC   $1410
            ADC   $1418
            ADC   $1427
            ADC   $1428
            ADC   $1429
            ADC   $00
            STA   $00
            LDA   $140A
            LSR
            CLC
            ADC   $00
            LDX   $141C
            BEQ   L42B9
            ADC   $1418
L42B9       STA   $00
            LDA   $00
            LDX   L0C57
            JSR   L4C4F
            STX   $00
            LDA   L0C01
            SEC
            SBC   $00
            BCS   L42CF
            LDA   #$00
L42CF       STA   $1411
            LDA   $1403
            CMP   L0C0D
            BCC   L42DD
            DEC   $1403
L42DD       LDA   L0C14
            LDX   $140F
            INX
            JSR   L4C00
            STA   $1425
            LDA   L0C55
            LDX   $1428
            INX
            JSR   L4C00
            STA   $142B
            CLC
            LDA   $1402
            ORA   $140F
            ORA   $140E
            ORA   $1418
            ORA   $1427
            ORA   $1428
            BNE   L430D
            SEC
L430D       RTS

L430E       LDX   #$00
            LDA   $1406
            CMP   $1423
            BCC   L431F
            SBC   $1422
            STA   $1406
            TAX
L431F       LDA   $1412
            BMI   L432A
            DEC   $1412
            LDX   $1413
L432A       LDA   $1414
            BMI   L433C
            DEC   $1414
            LDA   $1415
            ADC   L0C21
            STA   $1415
            TAX
L433C       LDA   $142E
            BMI   L435B
L4341       LDA   $142F
            TAX
            SBC   L0C65
            STA   $142F
            CMP   L0C66
            BCS   L435B
            LDA   L0C64
            STA   $142F
            DEC   $142E
            BPL   L4341
L435B       LDA   $141E
            BEQ   L437E
            LDA   $141F
            SBC   L0C30
            STA   $141F
            CMP   L0C3F
            BCS   L437D
            DEC   $141E
            BEQ   L437E
            LDA   L0C31
            SEC
            SBC   L0C2C
            STA   $141F
L437D       TAX
L437E       LDA   $1419
            BEQ   L4390
            DEC   $1419
            LDA   $141A
            EOR   L0C27
            STA   $141A
            TAX
L4390       LDA   $140B
            BPL   L439B
            ADC   #$06
            STA   $140B
            TAX
L439B       LDA   $140C
            CMP   #$C0
            BCC   L43A8
            SBC   #$02
            STA   $140C
            TAX
L43A8       LDA   $141C
            BEQ   L43B0
            EOR   #$FF
            TAX
L43B0       LDY   $1430
            BMI   L43BB
            LDX   L0D46,Y
            DEC   $1430
L43BB       STX   $CA
            JMP   L4C6E

L43C0       JSR   L4F42
            LDX   #$00
L43C5       LDY   L0C80,X
            BMI   L43E5
            INX
L43CB       LDA   L0C80,X
            INX
            CMP   #$80
            BCS   L43C5
            SBC   #$00
            CMP   $1407
            BEQ   L43DC
            BCS   L43E2
L43DC       LDA   L0C80,X
            STA   L0C00,Y
L43E2       INX
            BPL   L43CB
L43E5       LDA   #$00
            STA   $1400
            STA   $CA
            STA   $1406
            STA   $1401
            STA   $1416
            STA   $1404
            STA   $1435
            LDA   #$0C
            STA   $1436
            LDA   #$FF
            STA   $1412
            STA   $1430
            JSR   L5200
            JSR   L5A00
            JSR   L7000
            LDA   L0C02
            CMP   $1421
            BCC   L441E
            ADC   #$00
            STA   $1421
L441E       JSR   L5A03
            JSR   L5A06
            JSR   L6200
            JMP   L6900

L442A       LDY   $1407
            LDA   L0E00,Y
            STA   $1402
            LDA   L0E80,Y
            STA   $1409
            LDA   L0F80,Y
            STA   $01
            LDA   L1000,Y
            STA   $02
            LDX   L0F00,Y
            LDY   #$00
            TYA
L4449       DEX
            BMI   L4452
            STA   $1990,Y
            INY
            BPL   L4449
L4452       LDX   $01
            LDA   #$01
L4456       DEX
            BMI   L445F
            STA   $1990,Y
            INY
            BPL   L4456
L445F       LDX   $02
            LDA   #$02
L4463       DEX
            BMI   L446C
            STA   $1990,Y
            INY
            BPL   L4463
L446C       STY   $140A
            LDY   $1407
            LDA   L1080,Y
            STA   $140F
            LDA   #$00
            STA   $140E
            LDA   L1100,Y
            STA   $1418
            LDA   L1180,Y
            STA   $1427
            LDX   #$00
            LDA   L0C51
L448E       STA   $1D40,X
            INX
            CPX   $1427
            BCC   L448E
            LDA   #$00
            STA   $1428
            RTS

*-----------------------
* moveDATA
*-----------------------

L449D       STA   $06+1	; move X pages
            STY   $08+1	; from AAzz to YYxx
            LDY   #$00
            STY   $06
            STY   $08
            PLA	; useless
            STA   $01
            PLA
            STA   $00
L44AD       LDA   ($06),Y
            STA   ($08),Y
            INY
            BNE   L44AD
            INC   $06+1
            INC   $08+1
            DEX
            BNE   L44AD
            LDA   $00	; useless
            PHA
            LDA   $01
            PHA
            RTS

*-----------------------
* 
*-----------------------

L44C2       JSR   L426B
            JSR   L425B
            JSR   L5209
            JSR   L5A1B
            JSR   L5206
            JSR   L5203
            JSR   L5A1E
            JSR   L5A09
            JSR   L5A0C
            JSR   L5A0F
            JSR   L6203
            JSR   L6206
            JSR   L6209
            JSR   L7003
            JSR   L7006
            JSR   L7009
            JSR   L7009
            JSR   L6903
            JSR   L6906
            JSR   L6909
            JSR   L0152
            JMP   L453D

L4504       STA   KBDSTROBE
            LDA   L4C6E
            STA   $2F
            LDA   #$60
            STA   L4C6E
            STA   L4DD0
            JSR   L4522
            LDA   $2F
            STA   L4C6E
            LDA   #$86
            STA   L4DD0
            RTS

L4522       JSR   L455E
            JSR   L462A
            JSR   L4728
            JSR   L467F
            JSR   L47BC
            JSR   L4888
            JSR   L4A52
L4537       JSR   L483E
            JMP   L4522

L453D       LDY   KBD
            BPL   L455D
            STY   KBDSTROBE
            PLA
            PLA
            CPY   #$8D	; return
            BNE   L454C
            RTS

L454C       PLA
            PLA
            CPY   #" "	; space
            BNE   L4553
            RTS

L4553       CPY   #$9B	; escape
            BNE   L455A
            JMP   L4537
L455A       JMP   L4522
L455D       RTS

*-----------------------
* 
*-----------------------

L455E       JSR   L4F42
            LDA   $1432
            ORA   $1433
            BEQ   L456C
            JSR   L6218
L456C       JSR   L51B8
            ASC   0D
            ASC   0C12
            ASC   'ATARI PRESENTS:'00
            LDA   #$03
            STA   L0C5A
            LDA   #$28
            STA   L0C5B
            LDX   #$00
            JSR   L5081
            LDA   #$FF
            STA   $0A
L4595       JSR   L50C5
            JSR   L453D
            LDA   $0A
            BEQ   L45AC
            SEC
            SBC   #$06
            STA   $0A
            BCS   L4595
            LDA   #$00
            STA   $0A
            BEQ   L4595
L45AC       LDA   #$0F
            STA   L0C5A
            LDA   #$60
            STA   L0C5B
            LDX   #$01
            JSR   L5081
            LDA   #$FF
            LDY   #$00
L45BF       STA   $0700,Y
            INY
            BNE   L45BF
            JSR   L50CA
            LDA   #$03
            STA   L0C5A
            LDA   #$28
            STA   L0C5B
            LDX   #$00
            JSR   L5081
            JSR   L0155
            LDX   #$05
L45DC       LDA   #$00
            JSR   WAIT
            DEX
            BNE   L45DC
            LDA   #$80
            STA   $FA
            LDA   #$00
            STA   $0A
L45EC       LDX   $0A
            LDA   L461E,X
            STA   $00
            LDY   L461F,X
            LDX   #$00
L45F8       LDA   $00
            STA   $0700,X
            TYA
            STA   $0701,X
            INX
            INX
            BNE   L45F8
            JSR   L50CA
            INC   $0A
            INC   $0A
            LDA   $0A
            CMP   #$0C
            BNE   L4616
            LDA   #$00
            STA   $0A
L4616       JSR   L453D
            DEC   $FA
            BNE   L45EC
            RTS

L461E       DB    $55
L461F       DB    $2A
            DB    $2A
            DB    $55
            DB    $7F
            DB    $7F
            DB    $D5
            DB    $AA
            DB    $AA
            DB    $D5
            DB    $FF
            DB    $FF

L462A       JSR   L4666
            JSR   L0140
L4630       JSR   L426B
            JSR   L425B
            JSR   L453D
            JSR   L0152
            LDY   #$00
            LDA   ($28),Y
            BNE   L4630
            RTS

*-----------------------
* 
*-----------------------

L4643       LDA   #$00
            STA   $1402
            STA   $1409
            STA   $140A
            STA   $140E
            STA   $140F
            STA   $1418
            STA   $1427
            STA   $1428
            JSR   L43C0
            LDA   #$00
            STA   $1421
            RTS

L4666       JSR   L4643
            JSR   L51B8
            ASC   0D0D00
            ASC   'ROBOTRON: 2084'00
            RTS

L467F       JSR   L4666
            JSR   L0143
            LDY   #$90
            LDX   #$06
            JSR   L4831
            LDY   #$14
            STY   $1402
            STY   $1408
            LDA   L0C0C
            STA   $1403
L469A       DEY
            BMI   L46C5
            LDA   #$56
            JSR   L4C4B
            ADC   #$60
            STA   $15F0,Y
            LDA   #$10
            JSR   L4C4B
            CLC
            ADC   #$E8
            AND   #$FE
            STA   $1570,Y
            TYA
            LDX   #$08
            JSR   L4C4F
            TXA
            STA   $16F0,Y
            LDA   #$00
            STA   $1670,Y
            BEQ   L469A
L46C5       LDX   #<L46DC
            LDA   #>L46DC
            JSR   L4824
L46CC       JSR   L4706
            JSR   L44C2
            LDA   #$68
            LDX   #$C0
            JSR   L46E9
            JMP   L46CC

L46DC       DB    $38
            DB    $01
            DB    $30
            DB    $00
            DB    $34
            DB    $81
            DB    $20
            DB    $01
            DB    $0C
            DB    $80
            DB    $10
            DB    $04
            DB    $00

L46E9       STA   $06
            STX   $07
            LDY   $1405
L46F0       DEY
            BMI   L4705
            LDA   $1770,Y
            CMP   $06
            BCC   L46FE
            CMP   $07
            BCC   L46F0
L46FE       LDA   #$01
            STA   $18B0,Y
            BPL   L46F0
L4705       RTS

L4706       DEC   $FA
            BNE   L4727
            LDY   $FB
            LDA   ($22),Y
            BNE   L4713
            PLA
            PLA
            RTS

L4713       STA   $FA
            INY
            LDA   ($22),Y
            BPL   L4721
            AND   #$0F
            STA   $1416
            BPL   L4724
L4721       STA   $1506
L4724       INY
            STY   $FB
L4727       RTS

L4728       JSR   L4666
            JSR   L0146
            LDY   #$A0
            LDX   #$78
            JSR   L4831
            LDA   #<L476D
            STA   $20
            LDA   #>L476D
            STA   $21
            JSR   L4782
            LDX   #<L4750
            LDA   #>L4750
            JSR   L4824
L4747       JSR   L4706
            JSR   L44C2
            JMP   L4747

L4750       DB    $20
            DB    $00
            DB    $20
            DB    $03
            DB    $06
            DB    $07
            DB    $0C
            DB    $0D
            DB    $2F
            DB    $01
            DB    $0C
            DB    $05
            DB    $17
            DB    $03
            DB    $06
            DB    $0F
            DB    $0C
            DB    $00
            DB    $10
            DB    $81
            DB    $10
            DB    $83
            DB    $10
            DB    $81
            DB    $10
            DB    $83
            DB    $20
            DB    $80
            DB    $00
L476D       DB    $10
            DB    $B0
            DB    $00
            DB    $01
            DB    $60
            DB    $90
            DB    $01
            DB    $00
            DB    $7C
            DB    $90
            DB    $00
            DB    $02
            DB    $E0
            DB    $A0
            DB    $01
            DB    $01
            DB    $F0
            DB    $B0
            DB    $01
            DB    $02
            DB    $00

L4782       LDX   #$00
            LDY   #$00
            LDA   #$0A
            STA   $140D
L478B       LDA   ($20),Y
            BNE   L4793
            STX   $140A
            RTS

L4793       STA   $1950,X
            INY
            LDA   ($20),Y
            STA   $1960,X
            INY
            LDA   ($20),Y
            STA   $1970,X
            INY
            LDA   ($20),Y
            STA   $1990,X
            INY
            LDA   #$00
            STA   $1980,X
            TXA
            AND   #$03
            STA   $19A0,X
            LDA   #$7F
            STA   $19B0,X
            INX
            BPL   L478B
L47BC       JSR   L4666
            JSR   L0149
            LDX   #$F0
            LDY   #$B0
            JSR   L4831
            LDA   #<L4817
            STA   $20
            LDA   #>L4817
            STA   $21
            JSR   L4782
            LDX   #<L47FE
            LDA   #>L47FE
            JSR   L4824
            LDA   #$09
            STA   $1900
            LDA   #$90
            STA   $1910
            LDA   #$00
            STA   $1920
            STA   $1930
            LDA   #$7F
            STA   $1940
            INC   $1409
L47F5       JSR   L4706
            JSR   L44C2
            JMP   L47F5

L47FE       DB    $58
            DB    $00
            DB    $10
            DB    $0F
            DB    $01
            DB    $00
            DB    $70
            DB    $83
            DB    $08
            DB    $03
            DB    $01
            DB    $04
            DB    $09
            DB    $80
            DB    $10
            DB    $03
            DB    $0A
            DB    $0C
            DB    $01
            DB    $00
            DB    $10
            DB    $81
            DB    $20
            DB    $80
            DB    $00
L4817       DB    $30
            DB    $90
            DB    $00
            DB    $01
            DB    $50
            DB    $90
            DB    $00
            DB    $00
            DB    $70
            DB    $90
            DB    $00
            DB    $02
            DB    $00

L4824       STX   $22
            STA   $23
            LDA   #$01
            STA   $FA
            LDA   #$00
            STA   $FB
            RTS

L4831       STX   $1500
            STX   $1502
            STY   $1501
            STY   $1503
            RTS

L483E       JSR   L4643
            JSR   L4930
            LDX   #$08
            LDY   #$08
            JSR   L4831
            LDX   #<L485F
            LDA   #>L485F
            JSR   L4824
L4852       JSR   L4706
            LDA   #$7F
            STA   $2A
            JSR   L44C2
            JMP   L4852

L485F       DB    $19
            DB    $01
            DB    $19
            DB    $04
            DB    $1A
            DB    $01
            DB    $12
            DB    $0C
            DB    $09
            DB    $01
            DB    $08
            DB    $00
            DB    $10
            DB    $81
            DB    $10
            DB    $83
            DB    $10
            DB    $81
            DB    $10
            DB    $83
            DB    $02
            DB    $80
            DB    $0A
            DB    $01
            DB    $12
            DB    $04
            DB    $1C
            DB    $01
            DB    $18
            DB    $0C
            DB    $10
            DB    $01
            DB    $18
            DB    $04
            DB    $72
            DB    $03
            DB    $19
            DB    $0C
            DB    $20
            DB    $00
            DB    $00

L4888       JSR   L4666
            JSR   L014C
            LDX   #$F0
            LDY   #$A0
            JSR   L4831
            LDA   #<L492B
            STA   $20
            LDA   #>L492B
            STA   $21
            JSR   L4782
            LDX   #<L4910
            LDA   #>L4910
            JSR   L4824
            LDA   #$08
            STA   $1B20
            LDA   #$A0
            STA   $1B30
            LDA   #$00
            STA   $1B40
            STA   $1B60
            STA   $1B70
            LDA   #$7F
            STA   $1B80
            LDA   #$FF
            STA   $1B90
            INC   $1418
L48C9       JSR   L4706
            JSR   L44C2
            LDA   #$80
            LDX   #$C0
            JSR   L46E9
            LDA   $141D
            BNE   L490D
            LDA   $FB
            CMP   #$0A
            BNE   L490D
            LDX   #$01
L48E3       LDA   $1B20
            CLC
            ADC   #$06
            STA   $1C70,X
            LDA   $1B30
            STA   $1C80,X
            LDA   #$02
            STA   $1C90,X
            LDA   #$00
            STA   $1CA0,X
            LDA   #$7F
            STA   $1CB0,X
            DEX
            BEQ   L48E3
            LDA   L0C2E
            STA   $1CC1
            INC   $141D
L490D       JMP   L48C9

L4910       DB    $80
            DB    $00
            DB    $60
            DB    $00
            DB    $01
            DB    $83
            DB    $20
            DB    $80
            DB    $10
            DB    $00
            DB    $02
            DB    $0F
            DB    $05
            DB    $00
            DB    $01
            DB    $83
            DB    $10
            DB    $80
            DB    $2A
            DB    $03
            DB    $01
            DB    $83
            DB    $0B
            DB    $80
            DB    $20
            DB    $00
            DB    $00
L492B       DB    $22
            DB    $A0
            DB    $00
            DB    $01
            DB    $00

L4930       JSR   L51B8
            ASC   0D
            ASC   0F00
            ASC   'KEYBOARD'0D
            ASC   0F08
            ASC   '========'0D0A
            ASC   10
            ASC   'MOVE:'0D
            ASC   1710
            ASC   'SHOOT:'0D0A
            ASC   1F
            ASC   'Q W E'0D
            ASC   171F
            ASC   'I O P'0D0A
            ASC   '(A   D'0D
            ASC   17
            ASC   '(K   ;'0D0A
            ASC   '1Z X C'0D
            ASC   17
            ASC   '1, . /'0D
            ASC   0F
            ASC   'HJOYSTICK'0D
            ASC   0F
            ASC   'P========'0D
            ASC   01
            ASC   'XMOVE:JOYSTICK   SHOOT:BUTTONS 0 AND 1'0D
            ASC   0F
            ASC   'pPADDLES'0D
            ASC   0F
            ASC   'x======='0D
            ASC   0480
            ASC   'MOVE:PADDLE 0   SHOOT:PADDLE 1'0D
            ASC   0998
            ASC   'JOYSTICK + KEYBOARD'0D
            ASC   09
            ASC   " "
            ASC   '==================='0D
            ASC   01
            ASC   "("
            ASC   'MOVE:JOYSTICK   SHOOT:WHOLE KEYBOARD'00
            RTS

L4A52       JSR   L4666
            JSR   L014F
            LDX   #$08
            LDY   #$08
            JSR   L4831
            LDX   #<L4B42
            LDA   #>L4B42
            JSR   L4824
            LDA   #$F1
            STA   $19C0
            LDA   #$F0
            STA   $1CE0
            LDA   #$90
            STA   $19D0
            LDA   #$A7
            STA   $1CF0
            LDA   #$00
            STA   $19E0
            STA   $19F0
            STA   $1D00
            STA   $1D10
            STA   $1A00
            STA   $1D20
            STA   $1A40
            STA   $1D60
            STA   $19C1
            STA   $1CE1
            LDA   #$7F
            STA   $1A20
            STA   $1D50
            STA   $1D30
            INC   $140E
            INC   $1427
L4AAB       JSR   L4706
            LDA   $1D30
            CMP   #$10
            BCS   L4ABA
            LDA   #$7F
            STA   $1D30
L4ABA       LDA   #$7F
            STA   $1A10
            STA   $1424
            STA   $142A
            LDA   $FB
            CMP   #$06
            BNE   L4AD0
            LDA   #$FC
            STA   $19E0
L4AD0       LDA   $140F
            BNE   L4AF8
            LDA   $19C0
            CMP   #$C1
            BNE   L4AF8
            CLC
            ADC   #$08
            STA   $1A50
            LDA   $19D0
            STA   $1A60
            LDA   #$00
            STA   $1A70
            STA   $1A90
            LDA   #$FE
            STA   $1A80
            INC   $140F
L4AF8       LDA   $FB
            CMP   #$18
            BNE   L4B03
            LDA   #$FC
            STA   $1D00
L4B03       LDA   $1428
            BNE   L4B35
            LDA   $1CE0
            CMP   #$C0
            BNE   L4B35
            CLC
            ADC   #$08
            ORA   #$01
            STA   $1D70
            LDA   $1CF0
            STA   $1D90
            LDA   #$00
            STA   $1DF0
            STA   $1DD0
            STA   $1E30
            LDA   #$FE
            STA   $1DB0
            LDA   #$7F
            STA   $1E10
            INC   $1428
L4B35       JSR   L44C2
            LDA   #$80
            LDX   #$B0
            JSR   L46E9
            JMP   L4AAB

L4B42       DB    $44
            DB    $04
            DB    $01
            DB    $00
            DB    $50
            DB    $00
            DB    $04
            DB    $01
            DB    $01
            DB    $81
            DB    $0F
            DB    $80
            DB    $01
            DB    $81
            DB    $0B
            DB    $80
            DB    $20
            DB    $03
            DB    $0C
            DB    $04
            DB    $01
            DB    $00
            DB    $50
            DB    $00
            DB    $04
            DB    $01
            DB    $01
            DB    $81
            DB    $1F
            DB    $80
            DB    $01
            DB    $81
            DB    $14
            DB    $80
            DB    $20
            DB    $00
            DB    $00

L4B67       JSR   L4F25
            JSR   L51B8
            ASC   0D
            ASC   09
            ASC   '(CHOOSE CONTROLS:'0D
            ASC   09
            ASC   '@1) JOYSTICK'0D
            ASC   09
            ASC   'P2) KEYBOARD'0D
            ASC   09
            ASC   '`3) PADDLES'0D
            ASC   09
            ASC   'p4) JOYSTICK AND KEYBOARD'0D
            ASC   0990
            ASC   'WHICH?'00

            JSR   L4242
            CMP   #$20
            BEQ   L4BEE
            LDX   #$00
L4BD7       CMP   L4BEF,X
            BEQ   L4BEB
            CMP   L4BF3,X
            BEQ   L4BEB
            INX
            CPX   #$04
            BCC   L4BD7
            PLA
            PLA
            JMP   L4060

L4BEB       STX   $1417
L4BEE       RTS

L4BEF       DB    $31
            DB    $32
            DB    $33
            DB    $34
L4BF3       DB    $4A
            DB    $4B
            DB    $50
            DB    $26
            DB    $02
            DB    $BB
            DB    $5A
            DB    $30
            DB    $5F
            DB    $EE
            DB    $3D
            DB    $A8
            DB    $FF

L4C00       STA   $E0
            STX   $E1
            LDA   #$00
            STA   $E2
            LDX   #$08
L4C0A       ASL   $E0
            ROL
            CMP   $E1
            BCC   L4C13
            SBC   $E1
L4C13       ROL   $E2
            DEX
            BNE   L4C0A
            TAX
            LDA   $E2
            RTS

L4C1C       STA   $E0
            LDA   #$00
            STA   $E2
            LDX   #$08
L4C24       ASL   $E0
            ROL
            CMP   #$07
            BCC   L4C2D
            SBC   #$07
L4C2D       ROL   $E2
            DEX
            BNE   L4C24
            TAX
            LDA   $E2
            RTS

L4C36       LDA   $4F
            ASL
            ADC   $FC
            EOR   $4E
            PHA
            INC   $4E
            LDA   $4E
            EOR   $150A
            STA   $4F
            PLA
            STA   $4E
            RTS

L4C4B       TAX
            JSR   L4C36
L4C4F       STA   $E0
            STX   $E1
            LDA   #$00
            STA   $E2
            LDX   #$08
L4C59       ASL
            ROL   $E2
            ASL   $E0
            BCC   L4C67
            CLC
            ADC   $E1
            BCC   L4C67
            INC   $E2
L4C67       DEX
            BNE   L4C59
            TAX
            LDA   $E2
            RTS

L4C6E       LDA   $CA
            BEQ   L4C7B
            ADC   $CB
            STA   $CB
            BCC   L4C7B
            LDA   SPKR
L4C7B       RTS

L4C7C       STY   $FC
            STY   $FE
            STX   $05
            LDA   #$00
            STA   $04
            LDX   #$08
L4C88       ASL   $05
            ROL
            CMP   #$07
            BCC   L4C91
            SBC   #$07
L4C91       ROL   $04
            DEX
            BNE   L4C88
            ADC   #$01
            ASL
            TAY
            LDA   ($06),Y
            STA   $08
            INY
            LDA   ($06),Y
            STA   $09
            LDY   #$01
            LDA   ($06),Y
            TAY
            DEY
            LDX   #$00
            RTS

L4CAC       JSR   L4C7C
L4CAF       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            LDA   ($08,X)
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($08,X)
            STA   ($06),Y
            INC   $08
            LDY   $05
            DEY
            BPL   L4CAF
            JMP   L4C6E

L4CD0       STX   $FC
            STX   $FE
            JSR   L4C1C
            STA   $04
            DEY
            LDX   #$00
L4CDC       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            TXA
            STA   ($06),Y
            INY
            STA   ($06),Y
            LDY   $05
            DEY
            BPL   L4CDC
            JMP   L4C6E

L4CF6       JSR   L4C7C
L4CF9       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            LDA   ($08,X)
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($08,X)
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($08,X)
            STA   ($06),Y
            INC   $08
            LDY   $05
            DEY
            BPL   L4CF9
            JMP   L4C6E

L4D21       STX   $FC
            STX   $FE
            JSR   L4C1C
            STA   $04
            DEY
            LDX   #$00
L4D2D       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            TXA
            STA   ($06),Y
            INY
            STA   ($06),Y
            INY
            STA   ($06),Y
            LDY   $05
            DEY
            BPL   L4D2D
            JMP   L4C6E

L4D4A       LDX   #$0B
L4D4C       JSR   L4C36
            STA   $0700,X
            JSR   L4C36
            STA   $0780,X
            DEX
            BNE   L4D4C
            STX   $00
            STX   $FC
            STX   $FE
            STX   $0700
            STX   $0780
L4D67       LDA   $00
            STA   $01
            CLC
            ADC   #$60
            LDX   #$FF
            JSR   L4C4F
            STA   $CA
L4D75       LDA   $01
            SEC
            SBC   $00
            LSR
            LSR
            LSR
            TAX
            LDA   #$60
            CLC
            ADC   $01
            JSR   L4DA2
            LDA   #$5F
            SEC
            SBC   $01
            JSR   L4DA2
            LDA   $01
            CLC
            ADC   #$08
            STA   $01
            CMP   #$60
            BCC   L4D75
            INC   $00
            LDA   $00
            CMP   #$60
            BCC   L4D67
            RTS

L4DA2       TAY
            LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            LDY   #$26
            LDA   $0700,X
L4DB0       STA   ($06),Y
            DEY
            DEY
            BPL   L4DB0
            JSR   L4C6E
            LDY   #$27
            LDA   $0780,X
L4DBE       STA   ($06),Y
            DEY
            DEY
            BPL   L4DBE
            JSR   L4C6E
            LDY   #$FF
L4DC9       DEY
            BNE   L4DC9
            JSR   L4C6E
            RTS

L4DD0       STX   $06
            STA   $07
            LDA   $150A
            CLC
            ADC   $06
            STA   $150A
            LDA   $150B
            ADC   $07
            STA   $150B
            LDA   $150C
            ADC   #$00
            STA   $150C
            LDA   $150D
            SEC
            SBC   $06
            STA   $150D
            LDA   $150E
            SBC   $07
            STA   $150E
            BPL   L4E1F
            INC   $1509
            JSR   L4E4F
            LDA   $150D
            CLC
            ADC   L0C10
            STA   $150D
            LDA   $150E
            ADC   L0C11
            STA   $150E
            LDA   L0C69
            STA   $1430
L4E1F       LDA   #$38
            STA   $FC
            LDA   $150A
            STA   $00
            LDA   $150B
            STA   $01
            LDA   $150C
            STA   $02
L4E32       JSR   L4EC4
            CLC
            ADC   #$B0
            LDX   #$27
            LDY   $FC
            JSR   L5108
            LDA   $FC
            SEC
            SBC   #$08
            STA   $FC
            LDA   $00
            ORA   $01
            ORA   $02
            BNE   L4E32
            RTS

L4E4F       LDA   L0800
            STA   $06
            LDA   L0820
            STA   $07
            LDY   #$02
            LDA   ($06),Y
            STA   $0A
            INY
            LDA   ($06),Y
            STA   $0B
            LDX   $1509
            DEX
            STX   $04
            LDA   #$60
            STA   $FC
            STA   $FE
L4E70       DEC   $04
            BMI   L4EA7
            LDA   $0A
            STA   $08
            LDA   $0B
            STA   $09
            LDY   #$09
            LDX   #$00
L4E80       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   #$27
            LDA   ($08,X)
            STA   ($06),Y
            INC   $08
            INC   $08
            LDY   $05
            DEY
            BPL   L4E80
            LDA   $FC
            CLC
            ADC   #$0B
            STA   $FC
            STA   $FE
            CMP   #$A5
            BCC   L4E70
L4EA6       RTS

L4EA7       LDA   $FC
            CMP   #$A5
            BCS   L4EA6
            LDY   #$09
            LDX   #$00
L4EB1       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            LDY   #$27
            TXA
            LDA   ($06),Y
            LDY   $05
            DEY
            BPL   L4EB1
            RTS

L4EC4       LDA   #$00
            STA   $03
            STA   $04
            STA   $05
            LDX   #$18
L4ECE       ASL   $00
            ROL   $01
            ROL   $02
            ROL
            CMP   #$0A
            BCC   L4EDB
            SBC   #$0A
L4EDB       ROL   $03
            ROL   $04
            ROL   $05
            DEX
            BNE   L4ECE
            LDX   $03
            STX   $00
            LDX   $04
            STX   $01
            LDX   $05
            STX   $02
            RTS

L4EF1       LDA   #$06
            STA   $00
            JSR   L4C36
            STA   $CA
            LDY   #$00
            STY   $FC
            STY   $FE
L4F00       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            LDX   #$20
L4F0A       JSR   L4C36
            STA   $CB
L4F0F       LDA   ($06),Y
            EOR   #$FF
            STA   ($06),Y
            JSR   L4C6E
            INY
            BNE   L4F0F
            INC   $07
            DEX
            BNE   L4F0A
            DEC   $00
            BNE   L4F00
            RTS

L4F25       LDY   #$00
            STY   $FC
            STY   $FE
            LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            LDX   #$20
            LDA   #$00
L4F37       STA   ($06),Y
            INY
            BNE   L4F37
            INC   $07
            DEX
            BNE   L4F37
            RTS

L4F42       JSR   L4F25
            JSR   L4E1F
            JSR   L4E4F
            LDX   $1407
            INX
            STX   $00
            LDA   #$00
            STA   $01
            STA   $02
            LDA   #$B8
            STA   $FC
L4F5B       JSR   L4EC4
            CLC
            ADC   #$B0
            LDY   $FC
            LDX   #$27
            JSR   L5108
            LDA   $FC
            SEC
            SBC   #$08
            STA   $FC
            LDA   $00
            BNE   L4F5B
            RTS

L4F74       PHA
            LDA   L0C03
            SEC
            SBC   $1405
            CMP   L0C0B
            BCS   L4F83
            PLA
            RTS

L4F83       TXA
            JSR   L4C1C
            STA   $04
            LSR
            PLA
            BCC   L4F9C
            PHA
            AND   #$80
            STA   $06
            PLA
            AND   #$7F
            LSR
            BCS   L4F9A
            ORA   #$40
L4F9A       ORA   $06
L4F9C       STA   $06
            STY   $05
            LDY   L0C0B
            DEY
            LDX   $1405
L4FA7       LDA   $05
            STA   $1770,X
            LDA   $04
            STA   $17C0,X
            LDA   $06
            AND   L0D0C,Y
            STA   $1810,X
            LDA   L0D04,Y
            STA   $1860,X
            LDA   L0C07
            STA   $18B0,X
            INX
            DEY
            BPL   L4FA7
            STX   $1405
            RTS

L4FCD       JSR   L4C7C
L4FD0       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            LDA   ($08,X)
            AND   ($06),Y
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($08,X)
            AND   ($06),Y
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($08,X)
            AND   ($06),Y
            STA   ($06),Y
            INC   $08
            LDY   $05
            DEY
            BPL   L4FD0
            JMP   L4C6E

L4FFE       JSR   L4C7C
L5001       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            LDA   ($08,X)
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($08,X)
            ORA   ($06),Y
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($08,X)
            ORA   ($06),Y
            STA   ($06),Y
            INC   $08
            LDY   $05
            DEY
            BPL   L5001
            JMP   L4C6E

L502D       JSR   L4C7C
L5030       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            LDA   ($08,X)
            EOR   #$FF
            AND   ($06),Y
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($08,X)
            EOR   #$FF
            AND   ($06),Y
            STA   ($06),Y
            INC   $08
            LDY   $05
            DEY
            BPL   L5030
            JMP   L4C6E

L5059       JSR   L4C7C
L505C       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            LDA   ($08,X)
            ORA   ($06),Y
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($08,X)
            ORA   ($06),Y
            STA   ($06),Y
            INC   $08
            LDY   $05
            DEY
            BPL   L505C
            JMP   L4C6E

L5081       LDA   L0960,X
            STA   $06
            LDA   L0964,X
            STA   $07
            LDY   #$00
            LDA   ($06),Y
            STA   $E6
            INY
            LDA   ($06),Y
            STA   $E7
            INY
            LDA   ($06),Y
            STA   $E8
            INY
            LDA   ($06),Y
            STA   $E9
            RTS

L50A1       STY   $07
            LDY   #$00
            STY   $20
            LDA   #$07
            STA   $21
L50AB       LDA   $4E
            STA   $06
            LDX   #$07
L50B1       JSR   L4C36
            CMP   $0A
            ROL   $06
            DEX
            BNE   L50B1
            LDA   $06
            STA   ($20),Y
            INY
            CPY   $07
            BNE   L50AB
            RTS

L50C5       LDY   #$00
            JSR   L50A1
L50CA       LDA   L0C5B
            STA   $FC
            STA   $FE
            LDA   $E8
            STA   $08
            LDA   $E9
            STA   $09
            LDY   $E7
            DEY
            LDX   #$00
L50DE       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $01
            LDA   $E6
            STA   $00
            LDY   L0C5A
L50EF       LDA   ($08,X)
            AND   ($20,X)
            STA   ($06),Y
            INC   $20
            INC   $08
            BNE   L50FD
            INC   $09
L50FD       INY
            DEC   $00
            BNE   L50EF
            LDY   $01
            DEY
            BPL   L50DE
            RTS

L5108       STY   $FC
            STY   $FE
            LDY   #$40
            STY   $09
            SEC
            SBC   #$20
            ASL
            ASL
            ASL
            ROL   $09
            STA   $08
            LDY   #$07
L511C       LDA   ($FC),Y
            STA   L5128+1
            LDA   ($FE),Y
            STA   L5128+2
            LDA   ($08),Y
L5128       STA   $FFFF,X
            DEY
            BPL   L511C
            RTS

*-----------------------
* MAKE SPRITES
*-----------------------

makeSPRITES LDA   #<L7A00	; make sprites
            STA   $00		; from table data at $7A00
            STA   $08		; to the sprite area at $9000+
            LDA   #>L7A00
            STA   $00+1
            LDA   #>L9000
            STA   $08+1
L513D       LDY   #$00
            LDA   ($00),Y
            BPL   L5144
            RTS

L5144       TAX
            INY
            LDA   ($00),Y
            JSR   L4C4F
            STX   $04
            LDA   #$02
            STA   $02
L5151       LDY   $02
            LDA   ($00),Y
            STA   $06
            INY
            LDA   ($00),Y
            STA   $07
            INY
            STY   $02
            CPY   #$10
            BCC   L5173
            LDA   $00
            CLC
            ADC   #$10
            STA   $00
            LDA   $01
            ADC   #$00
            STA   $01
            SEC
            BCS   L513D
L5173       LDA   $08
            CLC
            ADC   $04
            BCC   L5180
            INC   $09
            LDA   #$00
            STA   $08
L5180       LDA   $08
            STA   ($00),Y
            INY
            LDA   $09
            STA   ($00),Y
            LDY   #$00
            CLC
            PHP
            LDA   $04
            STA   $05
L5191       LDA   ($06),Y
            AND   #$80
            STA   $0A
            LDA   ($06),Y
            PLP
            ROL
            ASL
            PHP
            LSR
            ORA   $0A
            STA   ($08),Y
            INY
            DEC   $05
            BNE   L5191
            PLP
            LDA   $08
            CLC
            ADC   $04
            STA   $08
            LDA   $09
            ADC   #$00
            STA   $09
            SEC
            BCS   L5151
L51B8       PLA
            STA   $22
            PLA
            STA   $23
L51BE       JSR   L51E8
            TAX
            BNE   L51CB
            LDA   $23
            PHA
            LDA   $22
            PHA
            RTS

L51CB       CMP   #$0D
            BNE   L51DC
            JSR   L51E8
            STA   $E0
            JSR   L51E8
            STA   $E1
            JMP   L51BE

L51DC       LDX   $E0
            LDY   $E1
            JSR   L5108
            INC   $E0
            JMP   L51BE

L51E8       INC   $22
            BNE   L51EE
            INC   $23
L51EE       LDY   #$00
            LDA   ($22),Y
            RTS

            HEX   10101010101010101010101070

L5200       JMP   L520C
L5203       JMP   L522E
L5206       JMP   L551D
L5209       JMP   L53EC

L520C       LDA   #$78
            STA   $1500
            STA   $1502
            LDA   #$5A
            STA   $1501
            STA   $1503
            LDA   #$00
            STA   $1504
            STA   $1505
            STA   $1506
            STA   $1507
            STA   $1508
            RTS

L522E       LDA   $1421
            BEQ   L527D
            DEC   $1421
            CMP   L0C02
            BNE   L527B
            LDY   $1405
            LDA   #$0B
            STA   $00
            LDA   $1500
            JSR   L4C1C
            STA   $02
L524A       LDA   $02
            STA   $17C0,Y
            LDX   $00
            LDA   L0D26,X
            STA   $1810,Y
            LDA   L0D32,X
            STA   $1860,Y
            LDX   L0C02
            JSR   L4C4F
            STX   $06
            LDA   #$60
            SEC
            SBC   $06
            STA   $1770,Y
            LDA   L0C02
            STA   $18B0,Y
            INY
            DEC   $00
            BPL   L524A
            STY   $1405
L527B       CLC
            RTS

L527D       LDA   $1506
            AND   #$03
            STA   $1504
            LDA   $1506
            LSR
            LSR
            STA   $1505
            LDA   $1500
            LDX   $1504
            CLC
            ADC   L0D00,X
            CMP   #$05
            BCC   L529F
            CMP   #$F4
            BCC   L52A2
L529F       LDA   $1500
L52A2       STA   $1502
            LDA   $1501
            LDX   $1505
            CLC
            ADC   L0D00,X
            CMP   #$05
            BCC   L52B7
            CMP   #$B1
            BCC   L52BA
L52B7       LDA   $1501
L52BA       STA   $1503
            LDA   $1507
            ASL
            ORA   $1508
            PHA
            TAX
            LDA   L0800,X
            STA   $06
            LDA   L0820,X
            STA   $07
            LDY   $1501
            LDX   $1500
            JSR   L502D
            PLA
            TAX
            LDA   L0840,X
            STA   $06
            LDA   L0860,X
            STA   $07
            LDY   $1501
            DEY
            LDX   $1500
            DEX
            DEX
            JSR   L4C7C
L52F1       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            LDA   ($08,X)
            AND   ($06),Y
            BEQ   L5306
            JSR   L538D
L5306       INC   $08
            INY
            LDA   ($08,X)
            AND   ($06),Y
            BEQ   L5312
            JSR   L538D
L5312       INC   $08
            INY
            LDA   ($08,X)
            AND   ($06),Y
            BEQ   L531E
            JSR   L538D
L531E       INC   $08
            LDY   $05
            DEY
            BPL   L52F1
            JSR   L4C6E
            LDA   $1508
            EOR   #$01
            STA   $1508
            LDA   $1506
            STA   $1507
            ASL
            ORA   $1508
            TAX
            LDA   L0800,X
            STA   $06
            LDA   L0820,X
            STA   $07
            LDY   $1503
            STY   $1501
            LDX   $1502
            STX   $1500
            JSR   L4C7C
L5354       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            LDA   ($06),Y
            AND   ($08,X)
            BEQ   L5369
            JSR   L538D
L5369       LDA   ($08,X)
            ORA   ($06),Y
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($06),Y
            AND   ($08,X)
            BEQ   L537B
            JSR   L538D
L537B       LDA   ($08,X)
            ORA   ($06),Y
            STA   ($06),Y
            INC   $08
            LDY   $05
            DEY
            BPL   L5354
            JSR   L4C6E
            CLC
            RTS

L538D       PHA
            STX   $0700
            STY   $0701
            LDA   $FC
            STA   $0702
            LDX   #$05
L539B       LDA   $04,X
            STA   $0703,X
            DEX
            BPL   L539B
            PLA
            JSR   L598D
            LDA   #$01
            STA   $E8
            JSR   L5A18
            BCS   L53D4
            JSR   L59B5
            BCC   L53D4
            LDA   $1507
            ASL
            ORA   $1508
            TAX
            LDA   L0800,X
            STA   $06
            LDA   L0820,X
            STA   $07
            LDX   $1502
            LDY   $1503
            JSR   L5059
            PLA
            PLA
            SEC
            RTS

L53D4       LDX   #$05
L53D6       LDA   $0703,X
            STA   $04,X
            DEX
            BPL   L53D6
            LDA   $0702
            STA   $FC
            STA   $FE
            LDY   $0701
            LDX   $0700
            RTS

L53EC       LDA   $1421
            BEQ   L53F2
L53F1       RTS

L53F2       DEC   $1401
            BPL   L53F1
            INC   $1401
            LDA   $1416
            BEQ   L53F1
            LDY   $1400
            CPY   L0C00
            BCS   L53F1
            STA   $1530,Y
            TAX
            LDA   #$01
            STA   $1540,Y
            LDA   #$02
            STA   $1401
            INC   $1400
            CPX   #$01
            BNE   L543C
            LDA   $1500
            CLC
            ADC   #$0B
            JSR   L4C1C
            STA   $1520,Y
            LDA   #$FF
L542A       ASL
            DEX
            BPL   L542A
            LSR
            STA   $1550,Y
L5432       LDA   $1501
            CLC
            ADC   #$05
            STA   $1510,Y
            RTS

L543C       CPX   #$03
            BNE   L546A
            LDA   $1500
            SEC
            SBC   #$04
            JSR   L4C1C
            STA   $1520,Y
            TXA
            BEQ   L545B
            LDA   #$00
L5451       SEC
            ROL
            DEX
            BPL   L5451
            STA   $1550,Y
            BNE   L5432
L545B       LDA   #$7F
            STA   $1550,Y
            LDX   $1520,Y
            DEX
            TXA
            STA   $1520,Y
            BPL   L5432
L546A       CPX   #$04
            BNE   L5486
            LDA   $1501
            CLC
            ADC   #$0E
            STA   $1510,Y
            JSR   L4C1C
            STX   $00
            LDA   #$06
            SEC
            SBC   $00
            STA   $1560,Y
            BPL   L54A2
L5486       CPX   #$0C
            BNE   L54B9
            LDA   $1501
            SEC
            SBC   #$04
            JSR   L4C1C
            STA   $00
            ASL
            ADC   $00
            ASL
            ADC   $00
            STA   $1510,Y
            TXA
            STA   $1560,Y
L54A2       LDA   $1500
            CLC
            ADC   #$03
            JSR   L4C1C
            STA   $1520,Y
            LDA   #$00
            SEC
L54B1       ROL
            DEX
            BPL   L54B1
            STA   $1550,Y
            RTS

L54B9       CPX   #$05
            BNE   L54C3
            JSR   L54DD
            JMP   L54EF

L54C3       CPX   #$07
            BNE   L54CD
            JSR   L54DD
            JMP   L5506

L54CD       CPX   #$0D
            BNE   L54D7
            JSR   L54E5
            JMP   L54EF

L54D7       JSR   L54E5
            JMP   L5506

L54DD       LDA   $1501
            CLC
            ADC   #$0C
            BCC   L54EB
L54E5       LDA   $1501
            SEC
            SBC   #$02
L54EB       STA   $1510,Y
            RTS

L54EF       LDA   $1500
            CLC
            ADC   #$09
L54F5       JSR   L4C1C
            STA   $1520,Y
            LDA   #$00
            SEC
L54FE       ROL
            DEX
            BPL   L54FE
            STA   $1550,Y
            RTS

L5506       LDA   $1500
            SEC
            SBC   #$02
            JSR   L54F5
            LSR
            BCC   L551C
            TYA
            TAX
            DEC   $1520,X
            LDA   #$40
            STA   $1550,Y
L551C       RTS

L551D       LDX   $1400
            LDA   $1421
            BNE   L5528
L5525       DEX
            BPL   L5529
L5528       RTS

L5529       STX   $00
            LDA   $1530,X
            CMP   #$04
            BCS   L558C
            EOR   #$03
            STA   $04
            DEC   $04
            LDA   $1540,X
            BEQ   L5542
            DEC   $1540,X
            BPL   L555A
L5542       JSR   L5837
            LDA   #$7F
            STA   $1550,X
            LDA   $1520,X
            CLC
            ADC   $04
            STA   $1520,X
            CMP   #$25
            BCC   L555A
            JMP   L5959

L555A       LDA   $1510,X
            STA   $FC
            STA   $FE
            LDY   #$00
            STY   $05
            LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            LDY   $1520,X
            LDA   $1550,X
            AND   ($06),Y
            BEQ   L5582
            JSR   L59AA
            BCC   L5582
            JSR   L5837
            JMP   L5959

L5582       LDA   $1550,X
            ORA   ($06),Y
            STA   ($06),Y
            JMP   L5525

L558C       CMP   #$04
            BNE   L55FB
            LDA   $1540,X
            BEQ   L559A
            DEC   $1540,X
            BPL   L55B5
L559A       JSR   L5855
            LDX   $00
            LDA   $1510,X
            SEC
            ADC   $1560,X
            STA   $1510,X
            CMP   #$BD
            BCC   L55B0
            JMP   L5959

L55B0       LDA   #$06
            STA   $1560,X
L55B5       LDA   $1510,X
            STA   $FC
            STA   $FE
            LDY   $1560,X
            LDA   $1520,X
            STA   $04
            LDA   $1550,X
            TAX
L55C8       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            TXA
            AND   ($06),Y
            BEQ   L55EC
            STX   $01
            LDX   $00
            JSR   L59AA
            BCC   L55EA
            JSR   L5855
            LDX   $1F
            JMP   L5959

L55EA       LDX   $01
L55EC       TXA
            ORA   ($06),Y
            STA   ($06),Y
            LDY   $05
            DEY
            BPL   L55C8
            LDX   $00
            JMP   L5525

L55FB       CMP   #$0C
            BNE   L5667
            LDA   $1540,X
            BEQ   L5609
            DEC   $1540,X
            BPL   L5621
L5609       JSR   L5855
            LDX   $00
            LDA   $1510,X
            SEC
            SBC   #$07
            STA   $1510,X
            BCS   L561C
            JMP   L5959

L561C       LDA   #$06
            STA   $1560,X
L5621       LDA   $1510,X
            STA   $FC
            STA   $FE
            LDY   $1560,X
            LDA   $1520,X
            STA   $04
            LDA   $1550,X
            TAX
L5634       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            TXA
            AND   ($06),Y
            BEQ   L5658
            STX   $01
            LDX   $00
            JSR   L59AA
            BCC   L5656
            JSR   L5855
            LDX   $1F
            JMP   L5959

L5656       LDX   $01
L5658       TXA
            ORA   ($06),Y
            STA   ($06),Y
            LDY   $05
            DEY
            BPL   L5634
            LDX   $00
            JMP   L5525

L5667       CMP   #$05
            BNE   L56E2
            LDA   $1540,X
            BEQ   L5675
            DEC   $1540,X
            BPL   L5698
L5675       JSR   L5883
            LDX   $00
            LDA   #$01
            STA   $1550,X
            INC   $1520,X
            LDA   $1520,X
            CMP   #$25
            BCS   L5695
            TYA
            CLC
            ADC   $1510,X
            STA   $1510,X
            CMP   #$BD
            BCC   L5698
L5695       JMP   L5959

L5698       LDA   $1520,X
            STA   $04
            LDA   $1510,X
            STA   $FC
            STA   $FE
            LDA   $1550,X
            TAX
            LDY   #$00
L56AA       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            TXA
            AND   ($06),Y
            BEQ   L56CE
            STX   $01
            LDX   $00
            JSR   L59AA
            BCC   L56CC
            JSR   L5883
            LDX   $1F
            JMP   L5959

L56CC       LDX   $01
L56CE       TXA
            ORA   ($06),Y
            STA   ($06),Y
            TXA
            ASL
            BMI   L56DD
            TAX
            LDY   $05
            INY
            BNE   L56AA
L56DD       LDX   $00
            JMP   L5525

L56E2       CMP   #$07
            BNE   L5757
            LDA   $1540,X
            BEQ   L56F0
            DEC   $1540,X
            BPL   L570E
L56F0       JSR   L58B9
            LDX   $00
            LDA   #$80
            STA   $1550,X
            DEC   $1520,X
            BMI   L570B
            TYA
            CLC
            ADC   $1510,X
            STA   $1510,X
            CMP   #$BD
            BCC   L570E
L570B       JMP   L5959

L570E       LDA   $1520,X
            STA   $04
            LDA   $1510,X
            STA   $FC
            STA   $FE
            LDA   $1550,X
            TAX
            LDY   #$00
L5720       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            TXA
            LSR
            BCS   L5752
            TAX
            AND   ($06),Y
            BEQ   L5748
            STX   $01
            LDX   $00
            JSR   L59AA
            BCC   L5746
            JSR   L58B9
            LDX   $1F
            JMP   L5959

L5746       LDX   $01
L5748       TXA
            ORA   ($06),Y
            STA   ($06),Y
            LDY   $05
            INY
            BNE   L5720
L5752       LDX   $00
            JMP   L5525

L5757       CMP   #$0D
            BNE   L57CC
            LDA   $1540,X
            BEQ   L5765
            DEC   $1540,X
            BPL   L5782
L5765       JSR   L58EE
            LDX   $00
            LDA   #$01
            STA   $1550,X
            INC   $1520,X
            LDA   $1520,X
            CMP   #$25
            BCS   L577F
            TYA
            STA   $1510,X
            BNE   L5782
L577F       JMP   L5959

L5782       LDA   $1520,X
            STA   $04
            LDA   #$00
            STA   $FC
            STA   $FE
            LDY   $1510,X
            LDA   $1550,X
            TAX
L5794       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            TXA
            AND   ($06),Y
            BEQ   L57B8
            STX   $01
            LDX   $00
            JSR   L59AA
            BCC   L57B6
            JSR   L58EE
            LDX   $1F
            JMP   L5959

L57B6       LDX   $01
L57B8       TXA
            ORA   ($06),Y
            STA   ($06),Y
            TXA
            ASL
            BMI   L57C7
            TAX
            LDY   $05
            DEY
            BNE   L5794
L57C7       LDX   $00
            JMP   L5525

L57CC       LDA   $1540,X
            BEQ   L57D6
            DEC   $1540,X
            BPL   L57EE
L57D6       JSR   L5924
            LDX   $00
            LDA   #$80
            STA   $1550,X
            DEC   $1520,X
            BMI   L57EB
            TYA
            STA   $1510,X
            BNE   L57EE
L57EB       JMP   L5959

L57EE       LDA   $1520,X
            STA   $04
            LDA   #$00
            STA   $FC
            STA   $FE
            LDY   $1510,X
            LDA   $1550,X
            TAX
L5800       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            TXA
            LSR
            BCS   L5832
            TAX
            AND   ($06),Y
            BEQ   L5828
            STX   $01
            LDX   $00
            JSR   L59AA
            BCC   L5826
            JSR   L5924
            LDX   $1F
            JMP   L5959

L5826       LDX   $01
L5828       TXA
            ORA   ($06),Y
            STA   ($06),Y
            LDY   $05
            DEY
            BNE   L5800
L5832       LDX   $00
            JMP   L5525

L5837       LDA   $1510,X
            STA   $FC
            STA   $FE
            LDY   #$00
            LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            LDY   $1520,X
            LDA   $1550,X
            EOR   #$FF
            AND   ($06),Y
            STA   ($06),Y
            RTS

L5855       LDA   $1510,X
            STA   $FC
            STA   $FE
            LDY   $1560,X
            LDA   $1520,X
            STA   $04
            LDA   $1550,X
            EOR   #$FF
            TAX
L586A       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            TXA
            AND   ($06),Y
            STA   ($06),Y
            LDY   $05
            DEY
            BPL   L586A
            JMP   L4C6E

L5883       LDA   $1520,X
            STA   $04
            LDA   $1510,X
            STA   $FC
            STA   $FE
            LDA   $1550,X
            EOR   #$FF
            TAX
            LDY   #$00
L5897       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            TXA
            AND   ($06),Y
            STA   ($06),Y
            TXA
            SEC
            ROL
            BPL   L58B3
            TAX
            LDY   $05
            INY
            BNE   L5897
L58B3       LDY   $05
            INY
            JMP   L4C6E

L58B9       LDA   $1520,X
            STA   $04
            LDA   $1510,X
            STA   $FC
            STA   $FE
            LDA   $1550,X
            EOR   #$FF
            TAX
            LDY   #$00
L58CD       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            TXA
            SEC
            ROR
            BCC   L58E8
            TAX
            AND   ($06),Y
            STA   ($06),Y
            LDY   $05
            INY
            BNE   L58CD
L58E8       LDY   $05
            INY
            JMP   L4C6E

L58EE       LDA   $1520,X
            STA   $04
            LDA   #$00
            STA   $FC
            STA   $FE
            LDY   $1510,X
            LDA   $1550,X
            EOR   #$FF
            TAX
L5902       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            TXA
            AND   ($06),Y
            STA   ($06),Y
            TXA
            SEC
            ROL
            BPL   L591E
            TAX
            LDY   $05
            DEY
            BNE   L5902
L591E       LDY   $05
            DEY
            JMP   L4C6E

L5924       LDA   $1520,X
            STA   $04
            LDA   #$00
            STA   $FC
            STA   $FE
            LDY   $1510,X
            LDA   $1550,X
            EOR   #$FF
            TAX
L5938       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            TXA
            SEC
            ROR
            BCC   L5953
            TAX
            AND   ($06),Y
            STA   ($06),Y
            LDY   $05
            DEY
            BNE   L5938
L5953       LDY   $05
            DEY
            JMP   L4C6E

L5959       DEC   $1400
            TXA
            PHA
L595E       LDA   $1511,X
            STA   $1510,X
            LDA   $1521,X
            STA   $1520,X
            LDA   $1531,X
            STA   $1530,X
            LDA   $1541,X
            STA   $1540,X
            LDA   $1551,X
            STA   $1550,X
            LDA   $1561,X
            STA   $1560,X
            INX
            CPX   $1400
            BCC   L595E
            PLA
            TAX
            JMP   L5525

L598D       LDX   #$FF
L598F       INX
            LSR
            BCC   L598F
            STX   $19
            TYA
            STA   $1A
            ASL
            ADC   $1A
            ASL
            ADC   $1A
            ADC   $19
            STA   $1C
            LDA   $FC
            CLC
            ADC   $05
            STA   $1D
            RTS

L59AA       STX   $1F
            STY   $1E
            JSR   L598D
            LDA   #$00
            STA   $E8
L59B5       JSR   L5A12
            BCS   L59EC
            JSR   L5A15
            BCS   L59EC
            JSR   L620C
            BCS   L59EC
            JSR   L620F
            BCS   L59EC
            JSR   L6212
            BCS   L59EC
            JSR   L700C
            BCS   L59EC
            JSR   L700F
            BCS   L59EC
            JSR   L7012
            BCS   L59EC
            JSR   L690C
            BCS   L59EC
            JSR   L690F
            BCS   L59EC
            JSR   L6912
            BCS   L59EC
L59EC       LDX   $1F
            LDY   $1E
            RTS

            HEX   101010101010101010101010101070

L5A00       JMP   L5A2A
L5A03       JMP   L5AB1
L5A06       JMP   L5B26
L5A09       JMP   L5B7E
L5A0C       JMP   L5C9F
L5A0F       JMP   L5E60
L5A12       JMP   L5BF2
L5A15       JMP   L5DBE
L5A18       JMP   L6073
L5A1B       JMP   L5F8A
L5A1E       JMP   L5FE3
L5A21       JMP   L5F52
L5A24       JMP   L6127
L5A27       JMP   L61B9

L5A2A       LDA   #$00
            STA   $1408
            LDY   $1402
            TYA
            LSR
            LSR
            STA   $1421
L5A38       DEY
            BPL   L5A51
            LDA   $1407
            LDX   #$0A
            JSR   L4C00
            LDA   L0C0C
            CPX   #$08
            BNE   L5A4D
            LDA   L0C0F
L5A4D       STA   $1403
            RTS

L5A51       JSR   L4C36
            CMP   #$A0
            BCS   L5A7C
            LDA   #$F5
            JSR   L4C4B
            AND   #$FE
            STA   $1570,Y
            LDA   #$22
            JSR   L4C4B
            STA   $00
            LDX   #$00
            JSR   L4C36
            BPL   L5A72
            LDX   #$90
L5A72       TXA
            CLC
            ADC   $00
            STA   $15F0,Y
            SEC
            BCS   L5A9D
L5A7C       LDA   #$B2
            JSR   L4C4B
            STA   $15F0,Y
            LDA   #$45
            JSR   L4C4B
            STA   $00
            LDX   #$00
            JSR   L4C36
            BPL   L5A94
            LDX   #$B0
L5A94       TXA
            CLC
            ADC   $00
            AND   #$FE
            STA   $1570,Y
L5A9D       JSR   L4C36
            AND   #$01
            STA   $1670,Y
            TYA
            LSR
            LSR
            CLC
            ADC   L0C07
            STA   $16F0,Y
            BNE   L5A38
L5AB1       LDY   $1409
L5AB4       DEY
            BPL   L5AB8
            RTS

L5AB8       JSR   L4C36
            CMP   #$A0
            BCS   L5AE4
            LDA   #$E6
            JSR   L4C4B
            CLC
            ADC   #$06
            ORA   #$01
            STA   $1900,Y
            LDX   #$06
            JSR   L4C36
            BPL   L5AD5
            LDX   #$90
L5AD5       STX   $00
            LDA   #$1C
            JSR   L4C4B
            CLC
            ADC   $00
            STA   $1910,Y
            BNE   L5B07
L5AE4       LDA   #$A6
            JSR   L4C4B
            CLC
            ADC   #$06
            STA   $1910,Y
            LDX   #$06
            JSR   L4C36
            BPL   L5AF8
            LDX   #$C0
L5AF8       STX   $00
            LDA   #$2C
            JSR   L4C4B
            CLC
            ADC   $00
            ORA   #$01
            STA   $1900,Y
L5B07       JSR   L4C36
            AND   #$01
            STA   $1920,Y
            TYA
            AND   #$03
            STA   $1930,Y
            LDA   L0C0E
            JSR   L4C4B
            CLC
            ADC   #$03
            ORA   #$01
            STA   $1940,Y
            JMP   L5AB4

L5B26       LDY   $140A
L5B29       DEY
            BPL   L5B45
            LDA   #$00
            STA   $140B
            STA   $140C
            LDA   #$0A
            STA   $140D
            LDA   #$00
            STA   $1405
            STA   $142C
            STA   $142D
            RTS

L5B45       LDA   #$F1
            JSR   L4C4B
            CLC
            ADC   #$04
            STA   $1950,Y
            LDA   #$AE
            JSR   L4C4B
            CLC
            ADC   #$04
            STA   $1960,Y
            JSR   L4C36
            AND   #$01
            STA   $1970,Y
            LDA   #$05
            JSR   L4C4B
            SEC
            SBC   #$02
            STA   $1980,Y
            TYA
            AND   #$03
            STA   $19A0,Y
            LDA   #$20
            JSR   L4C4B
            STA   $19B0,Y
            BPL   L5B29
L5B7E       LDX   $1402
L5B81       DEX
            BPL   L5B87
            JMP   L6008

L5B87       DEC   $16F0,X
            BPL   L5B81
            STX   $00
            LDY   $1670,X
            LDA   L0888,Y
            STA   $06
            LDA   L088C,Y
            STA   $07
            LDY   $15F0,X
            LDA   $1570,X
            TAX
            JSR   L4FCD
            LDX   $00
            LDA   $1670,X
            EOR   #$01
            STA   $1670,X
            TAY
            LDA   L0880,Y
            STA   $06
            LDA   L0884,Y
            STA   $07
            LDA   $15F0,X
            CMP   $1501
            BCS   L5BC7
            ADC   L0C09
            BCC   L5BCA
L5BC7       SBC   L0C09
L5BCA       STA   $15F0,X
            TAY
            LDA   $1570,X
            CMP   $1500
            BCS   L5BDB
            ADC   L0C09
            BCC   L5BDE
L5BDB       SBC   L0C09
L5BDE       STA   $1570,X
            TAX
            JSR   L4FFE
            LDA   $1403
            JSR   L4C4B
            LDX   $00
            STA   $16F0,X
            BPL   L5B81
L5BF2       LDX   $1402
            LDA   $1C
            SEC
            SBC   #$0B
            BCS   L5BFE
            LDA   #$00
L5BFE       TAY
L5BFF       LDA   $1C
L5C01       DEX
            BPL   L5C06
            CLC
            RTS

L5C06       CMP   $1570,X
            BCC   L5C01
            TYA
            CMP   $1570,X
            BCS   L5BFF
            LDA   $1D
            CMP   $15F0,X
            BCC   L5BFF
            SEC
            SBC   #$0E
            BCC   L5C22
            CMP   $15F0,X
            BCS   L5BFF
L5C22       LDA   $E8
            BEQ   L5C28
            SEC
            RTS

L5C28       JSR   L5C3F
            LDA   L0C04
            STA   $1406
            LDA   L0C05
            STA   $1422
            LDA   L0C06
            STA   $1423
            SEC
            RTS

L5C3F       TXA
            PHA
            TAX
            LDY   $1670,X
            LDA   L0888,Y
            STA   $06
            LDA   L088C,Y
            STA   $07
            LDY   $15F0,X
            LDA   $1570,X
            TAX
            JSR   L4FCD
            PLA
            PHA
            TAX
            LDA   $15F0,X
            CLC
            ADC   #$07
            TAY
            LDA   $1570,X
            CLC
            ADC   #$03
            TAX
            LDA   #$AA
            JSR   L4F74
            PLA
            PHA
            TAX
            DEC   $1402
L5C75       LDA   $1571,X
            STA   $1570,X
            LDA   $15F1,X
            STA   $15F0,X
            LDA   $1671,X
            STA   $1670,X
            LDA   $16F1,X
            STA   $16F0,X
            INX
            CPX   $1402
            BCC   L5C75
            LDA   #$00
            LDX   #$64
            JSR   L4DD0
            PLA
            TAX
            JMP   L4C6E

L5C9F       LDX   $1409
L5CA2       DEX
            BPL   L5CA6
            RTS

L5CA6       DEC   $1930,X
            BPL   L5CA2
            STX   $00
            LDA   #$03
            STA   $1930,X
            DEC   $1940,X
            BPL   L5CDF
            LDA   $1421
            BNE   L5CCF
            LDA   $1920,X
            AND   #$02
            EOR   #$02
            STA   $06
            JSR   L4C36
            AND   #$01
            ORA   $06
            STA   $1920,X
L5CCF       LDA   L0C0E
            JSR   L4C4B
            CLC
            ADC   #$03
            ORA   #$01
            LDY   $00
            STA   $1940,Y
L5CDF       LDY   $00
            LDA   $1900,Y
            LDX   $1910,Y
            LDY   #$0E
            JSR   L4D21
            LDY   $00
            LDA   $1421
            BEQ   L5CFA
            LDA   $1920,Y
            ASL
            TAX
            BPL   L5D5D
L5CFA       LDX   $1920,Y
            LDA   $1900,Y
            CLC
            ADC   L0D14,X
            CMP   #$06
            BCC   L5D0C
            CMP   #$ED
            BCC   L5D18
L5D0C       JSR   L4C36
            AND   #$01
            ORA   #$02
            STA   $1920,Y
            BNE   L5CFA
L5D18       STA   $1900,Y
            CLC
            ADC   #$10
            STA   $1A
            SBC   #$19
            BCS   L5D26
            LDA   #$00
L5D26       STA   $1B
L5D28       LDX   $1920,Y
            LDA   $1910,Y
            CLC
            ADC   L0D18,X
            CMP   #$06
            BCC   L5D3A
            CMP   #$AC
            BCC   L5D44
L5D3A       JSR   L4C36
            AND   #$01
            STA   $1920,Y
            BPL   L5D28
L5D44       STA   $1910,Y
            CLC
            ADC   #$11
            STA   $1C
            SBC   #$1D
            BCS   L5D52
            LDA   #$00
L5D52       STA   $1D
            LDA   $1940,Y
            LSR
            LDA   $1920,Y
            ROL
            TAX
L5D5D       LDA   L0890,X
            STA   $06
            LDA   L0898,X
            STA   $07
            LDX   $1900,Y
            LDA   $1910,Y
            TAY
            JSR   L4CF6
            LDA   $1421
            BNE   L5DB9
            LDX   $140A
            LDY   $1B
L5D7B       LDA   $1A
L5D7D       DEX
            BMI   L5DB9
            CMP   $1950,X
            BCC   L5D7D
            TYA
            CMP   $1950,X
            BCS   L5D7B
            LDA   $1C
            CMP   $1960,X
            BCC   L5D7B
            LDA   $1D
            CMP   $1960,X
            BCS   L5D7B
            TXA
            PHA
            TAY
            LDX   $1960,Y
            LDA   $1950,Y
            LDY   #$0A
            JSR   L4CD0
            PLA
            TAX
            PHA
            LDY   $1960,X
            LDA   $1950,X
            TAX
            JSR   L6127
            PLA
            TAX
            JSR   L5F52
L5DB9       LDX   $00
            JMP   L5CA2

L5DBE       LDX   $1409
            LDA   $1C
            SEC
            SBC   #$0D
            BCS   L5DCA
            LDA   #$00
L5DCA       TAY
L5DCB       LDA   $1C
L5DCD       DEX
            BPL   L5DD2
            CLC
            RTS

L5DD2       CMP   $1900,X
            BCC   L5DCD
            TYA
            CMP   $1900,X
            BCS   L5DCB
            LDA   $1D
            CMP   $1910,X
            BCC   L5DCB
            SEC
            SBC   #$0E
            BCC   L5DEE
            CMP   $1910,X
            BCS   L5DCB
L5DEE       LDA   $E8
            BEQ   L5DF4
            SEC
            RTS

L5DF4       TXA
            PHA
            TAY
            LDX   $1910,Y
            LDA   $1900,Y
            LDY   #$0E
            JSR   L4D21
            PLA
            TAX
            JSR   L5E26
            LDA   $1940,X
            LSR
            LDA   $1920,X
            ROL
            TAY
            LDA   L0890,Y
            STA   $06
            LDA   L0898,Y
            STA   $07
            LDY   $1910,X
            LDA   $1900,X
            TAX
            JSR   L4CF6
            SEC
            RTS

L5E26       LDY   $1F
            LDA   $1530,Y
            PHA
            AND   #$03
            TAY
            LDA   $1900,X
            CLC
            ADC   L0D00,Y
            CMP   #$06
            BCS   L5E3C
            ADC   #$04
L5E3C       CMP   #$ED
            BCC   L5E42
            SBC   #$04
L5E42       STA   $1900,X
            PLA
            LSR
            LSR
            TAY
            LDA   $1910,X
            CLC
            ADC   L0D00,Y
            CMP   #$06
            BCS   L5E56
            ADC   #$04
L5E56       CMP   #$AC
            BCC   L5E5C
            SBC   #$04
L5E5C       STA   $1910,X
            RTS

L5E60       LDX   $140A
L5E63       DEX
            BPL   L5E69
            JMP   L60B0

L5E69       DEC   $19A0,X
            BPL   L5E63
            STX   $00
            LDA   L0C08
            STA   $19A0,X
            DEC   $19B0,X
            BPL   L5E99
            JSR   L4C36
            AND   #$01
            STA   $1970,X
            LDA   #$05
            JSR   L4C4B
            SEC
            SBC   #$02
            LDY   $00
            STA   $1980,Y
            LDA   L0C0A
            JSR   L4C4B
            STA   $19B0,Y
L5E99       LDY   $00
            LDX   $1960,Y
            LDA   $1950,Y
            LDY   #$0A
            JSR   L4CD0
            LDY   $00
L5EA8       LDA   $1950,Y
            LDX   $1970,Y
            CLC
            ADC   L0D1C,X
            CMP   #$04
            BCC   L5EBA
            CMP   #$F5
            BCC   L5EC2
L5EBA       TXA
            EOR   #$01
            STA   $1970,Y
            BPL   L5EA8
L5EC2       STA   $1950,Y
            LDA   $1960,Y
            CLC
            ADC   $1980,Y
            CMP   #$04
            BCC   L5ED4
            CMP   #$B2
            BCC   L5EDC
L5ED4       LDA   #$00
            STA   $1980,Y
            LDA   $1960,Y
L5EDC       STA   $1960,Y
            LDA   $1990,Y
            ASL
            ORA   $1970,Y
            ASL
            STA   $06
            LDA   $19B0,Y
            AND   #$01
            ORA   $06
            TAX
            LDA   L08A0,X
            STA   $06
            LDA   L08B0,X
            STA   $07
            LDX   $1950,Y
            LDA   $1960,Y
            TAY
            JSR   L4CAC
            LDX   $00
            JMP   L5E63

L5F0A       LDA   $1960,X
            CLC
            ADC   #$02
            PHA
            LDA   $1950,X
            SEC
            SBC   #$04
            PHA
            JSR   L5F52
            LDA   $140D
            LDX   #$0A
            JSR   L4C00
            SEC
            SBC   #$01
            STA   $06
            PLA
            TAX
            PLA
            TAY
            LDA   $06
            JSR   L61B9
            LDA   $140D
            LDX   #$64
            JSR   L4C4F
            JSR   L4DD0
            LDA   $140D
            CLC
            ADC   #$0A
            CMP   #$33
            BCS   L5F49
            STA   $140D
L5F49       LDA   L0C68
            STA   $140B
            JMP   L4C6E

L5F52       TXA
            PHA
            DEC   $140A
L5F57       LDA   $1951,X
            STA   $1950,X
            LDA   $1961,X
            STA   $1960,X
            LDA   $1971,X
            STA   $1970,X
            LDA   $1981,X
            STA   $1980,X
            LDA   $1991,X
            STA   $1990,X
            LDA   $19A1,X
            STA   $19A0,X
            LDA   $19B1,X
            STA   $19B0,X
            INX
            CPX   $140A
            BCC   L5F57
            PLA
            TAX
            RTS

L5F8A       LDX   $1405
            LDA   #$00
            STA   $FC
            STA   $FE
L5F93       DEX
            BPL   L5F97
            RTS

L5F97       LDY   $1770,X
            LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            LDY   $17C0,X
            LDA   #$00
            STA   ($06),Y
            LDA   $1770,X
            CLC
            ADC   $1860,X
            STA   $1770,X
            DEC   $18B0,X
            BNE   L5F93
            TXA
            TAY
            DEC   $1405
L5FBD       LDA   $1771,Y
            STA   $1770,Y
            LDA   $17C1,Y
            STA   $17C0,Y
            LDA   $1811,Y
            STA   $1810,Y
            LDA   $1861,Y
            STA   $1860,Y
            LDA   $18B1,Y
            STA   $18B0,Y
            INY
            CPY   $1405
            BCC   L5FBD
            BCS   L5F93
L5FE3       LDX   $1405
            LDA   #$00
            STA   $FC
            STA   $FE
L5FEC       DEX
            BPL   L5FF0
            RTS

L5FF0       LDY   $1770,X
            LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            LDY   $17C0,X
            LDA   $1810,X
            STA   ($06),Y
            BNE   L5FEC
            JMP   L5FEC

L6008       LDY   $1408
            CPY   $1402
            BCC   L6011
            RTS

L6011       TYA
            CLC
            ADC   #$04
            STA   $1408
            LDA   $15F0,Y
            CLC
            ADC   #$07
            STA   $05
            LDA   $1570,Y
            CLC
            ADC   #$03
            JSR   L4C1C
            STA   $04
            LDY   L0C0B
            DEY
            LDA   $1405
            TAX
            CLC
            ADC   L0C0B
            STA   $1405
L603A       LDA   L0C07
            STA   $18B0,X
            LDA   $04
            STA   $17C0,X
            LSR
            LDA   #$AA
            BCC   L604C
            LDA   #$D5
L604C       AND   L0D0C,Y
            STA   $1810,X
            LDA   L0D04,Y
            STA   $1860,X
            STX   $00
            LDX   L0C07
            JSR   L4C4F
            STX   $02
            LDA   $05
            SEC
            SBC   $02
            LDX   $00
            STA   $1770,X
            INX
            DEY
            BPL   L603A
            JMP   L4C6E

L6073       LDX   $140A
L6076       LDA   $1C
L6078       DEX
            BPL   L607D
            CLC
            RTS

L607D       CMP   $1950,X
            BCC   L6078
            SBC   #$08
            BCC   L608B
            CMP   $1950,X
            BCS   L6076
L608B       LDA   $1D
            CMP   $1960,X
            BCC   L6076
            SBC   #$0B
            BCC   L609B
            CMP   $1960,X
            BCS   L6076
L609B       TXA
            PHA
            TAY
            LDX   $1960,Y
            LDA   $1950,Y
            LDY   #$0A
            JSR   L4CD0
            PLA
            TAX
            JSR   L5F0A
            SEC
            RTS

L60B0       LDX   $142C
L60B3       DEX
            BPL   L60B9
            JMP   L6150

L60B9       DEC   $1ED0,X
            BPL   L60B3
            LDA   L0C5E
            STA   $1ED0,X
            STX   $00
            LDY   $1EF0,X
            LDA   L0940,Y
            STA   $06
            LDA   L0948,Y
            STA   $07
            LDY   $1EC0,X
            LDA   $1EB0,X
            TAX
            JSR   L4CF6
            LDX   $00
            DEC   $1EE0,X
            BPL   L60B3
            LDY   $00
            LDX   $1EC0,Y
            LDA   $1EF0,Y
            CMP   #$05
            LDA   $1EB0,Y
            LDY   #$05
            BCC   L60F7
            LDY   #$0D
L60F7       JSR   L4D21
            LDX   $00
            DEC   $142C
L60FF       LDA   $1EB1,X
            STA   $1EB0,X
            LDA   $1EC1,X
            STA   $1EC0,X
            LDA   $1ED1,X
            STA   $1ED0,X
            LDA   $1EE1,X
            STA   $1EE0,X
            LDA   $1EF1,X
            STA   $1EF0,X
            INX
            CPX   $142C
            BCC   L60FF
            LDX   $00
            BPL   L60B3
L6127       DEY
            TYA
            LDY   $142D
            STA   $1F10,Y
            TXA
            JSR   L4C1C
            LDX   #$07
            JSR   L4C4F
            TXA
            STA   $1F00,Y
            LDA   #$00
            STA   $1F20,Y
            LDA   L0C61
            STA   $1F30,Y
            INC   $142D
            LDA   #$FF
            STA   $140C
            RTS

L6150       LDX   $142D
L6153       DEX
            BPL   L6157
            RTS

L6157       DEC   $1F20,X
            BPL   L6153
            STX   $00
            LDA   L0C60
            STA   $1F20,X
            LDA   $1F30,X
            AND   #$03
            TAY
            LDA   L0950,Y
            STA   $06
            LDA   L0958,Y
            STA   $07
            LDY   $1F10,X
            LDA   $1F00,X
            TAX
            JSR   L4CAC
            LDX   $00
            DEC   $1F30,X
            BPL   L6153
            LDY   $00
            LDX   $1F10,Y
            LDA   $1F00,Y
            LDY   #$0C
            JSR   L4CD0
            LDX   $00
            DEC   $142D
L6197       LDA   $1F01,X
            STA   $1F00,X
            LDA   $1F11,X
            STA   $1F10,X
            LDA   $1F21,X
            STA   $1F20,X
            LDA   $1F31,X
            STA   $1F30,X
            INX
            CPX   $142D
            BCC   L6197
            LDX   $00
            BPL   L6153
L61B9       PHA
            TXA
            JSR   L4C1C
            LDX   #$07
            JSR   L4C4F
            TXA
            LDX   $142C
            STA   $1EB0,X
            TYA
            STA   $1EC0,X
            PLA
            STA   $1EF0,X
            CMP   #$05
            LDA   #$00
            STA   $1ED0,X
            LDA   L0C5F
            BCC   L61E0
            LDA   #$01
L61E0       STA   $1EE0,X
            INC   $142C
            RTS

            DS    $19,$FF
L6200       JMP   L621B
L6203       JMP   L62BE
L6206       JMP   L6436
L6209       JMP   L6523
L620C       JMP   L669F
L620F       JMP   L670E
L6212       JMP   L6643
L6215       JMP   L684E
L6218       JMP   L686A

L621B       LDX   $140E
            LDA   #$00
            CLC
L6221       DEX
            BMI   L6229
            ADC   $1A30,X
            BCC   L6221
L6229       ADC   $140F
            STA   $00
            LDX   #$00
L6230       LDY   #$05
            LDA   $00
            BEQ   L6248
            SEC
            SBC   #$05
            BCS   L623F
            LDY   $00
            LDA   #$00
L623F       STA   $00
            TYA
            STA   $1A30,X
            INX
            BNE   L6230
L6248       STX   $140E
            LDY   $140E
L624E       DEY
            BPL   L625F
            LDA   #$00
            STA   $140F
            STA   $1410
            LDA   #$FF
            STA   $1414
            RTS

L625F       JSR   L4C36
            BMI   L627E
            LDA   #$F3
            JSR   L4C4B
            ORA   #$01
            STA   $19C0,Y
            LDX   #$00
            JSR   L4C36
            BPL   L6277
            LDX   #$B3
L6277       TXA
            STA   $19D0,Y
            SEC
            BCS   L6293
L627E       LDA   #$B3
            JSR   L4C4B
            STA   $19D0,Y
            LDX   #$01
            JSR   L4C36
            BPL   L628F
            LDX   #$F3
L628F       TXA
            STA   $19C0,Y
L6293       LDA   #$00
            STA   $19E0,Y
            STA   $19F0,Y
            STA   $1A40,Y
            STA   $1A00,Y
            LDA   $1421
            LDX   L0C18
            INX
            JSR   L4C00
            STA   $1A10,Y
            LDA   L0C13
            JSR   L4C4B
            CLC
            ADC   L0C12
            STA   $1A20,Y
            SEC
            BCS   L624E
L62BE       LDX   $140E
L62C1       DEX
            BPL   L62C5
            RTS

L62C5       DEC   $1A00,X
            BPL   L62C1
            LDA   L0C18
            STA   $1A00,X
            STX   $00
            LDY   $00
            LDX   $19D0,Y
            LDA   $19C0,Y
            LDY   #$0D
            JSR   L4D21
            LDX   $00
            DEC   $1A10,X
            BPL   L6322
            LDA   L0C1B
            JSR   L4C4B
            LDY   $00
            STA   $1A10,Y
            LDA   L0C17
            ASL
            PHA
            JSR   L4C4B
            SEC
            SBC   L0C17
            AND   #$FE
            STA   $19E0,Y
            PLA
            JSR   L4C4B
            SEC
            SBC   L0C17
            STA   $19F0,Y
            LDX   $00
            DEC   $1A20,X
            BPL   L6322
            LDA   L0C13
            JSR   L4C4B
            STA   $1A20,Y
            LDX   $00
            JSR   L63B3
L6322       LDA   $1A20,X
            BNE   L6353
            LDA   $1A10,X
            CMP   L0C1C
            BCS   L6353
            LDA   $19E0,X
            BMI   L633B
            BEQ   L633E
            SEC
            SBC   #$02
            BCS   L633E
L633B       CLC
            ADC   #$02
L633E       STA   $19E0,X
            LDA   $19F0,X
            BMI   L634D
            BEQ   L6350
            SEC
            SBC   #$02
            BCS   L6350
L634D       CLC
            ADC   #$02
L6350       STA   $19F0,X
L6353       DEC   $1A40,X
            BPL   L635D
            LDA   #$03
            STA   $1A40,X
L635D       LDY   $1A40,X
            LDA   L08C0,Y
            STA   $06
            LDA   L08C8,Y
            STA   $07
            LDA   $19C0,X
            CLC
            ADC   $19E0,X
            CMP   #$F3
            BCC   L6385
            LDA   #$00
            LDY   $19E0,X
            STA   $19E0,X
            BMI   L6383
            LDA   #$F1
            BMI   L6385
L6383       LDA   #$01
L6385       STA   $19C0,X
            LDA   $19D0,X
            CLC
            ADC   $19F0,X
            CMP   #$B3
            BCC   L63A3
            LDA   #$00
            LDY   $19F0,X
            STA   $19F0,X
            BMI   L63A1
            LDA   #$B2
            BMI   L63A3
L63A1       LDA   #$00
L63A3       STA   $19D0,X
            TAY
            LDA   $19C0,X
            TAX
            JSR   L4CF6
            LDX   $00
            JMP   L62C1

L63B3       LDY   $140F
            CPY   #$10
            BCC   L63BB
            RTS

L63BB       LDA   $19C0,X
            STA   $1A50,Y
            LDA   $19D0,X
            STA   $1A60,Y
            LDA   #$01
            STA   $1A70,Y
            STX   $00
            TYA
            TAX
            JSR   L67B8
            LDX   $00
            LDA   L0C1E
            STA   $1412
            LDA   L0C1D
            STA   $1413
            INC   $140F
            DEC   $1A30,X
            BEQ   L63EA
            RTS

L63EA       JSR   L63F2
            PLA
            PLA
            JMP   L62C1

L63F2       TXA
            PHA
            DEC   $140E
L63F7       LDA   $19C1,X
            STA   $19C0,X
            LDA   $19D1,X
            STA   $19D0,X
            LDA   $19E1,X
            STA   $19E0,X
            LDA   $19F1,X
            STA   $19F0,X
            LDA   $1A01,X
            STA   $1A00,X
            LDA   $1A11,X
            STA   $1A10,X
            LDA   $1A21,X
            STA   $1A20,X
            LDA   $1A31,X
            STA   $1A30,X
            LDA   $1A41,X
            STA   $1A40,X
            INX
            CPX   $140E
            BCC   L63F7
            PLA
            TAX
            RTS

L6436       LDX   $140F
            BNE   L643C
            RTS

L643C       DEX
            BPL   L6442
            JMP   L6789

L6442       DEC   $1A70,X
            BPL   L643C
            LDA   L0C19
            STA   $1A70,X
            STX   $00
            LDY   $00
            LDX   $1A60,Y
            LDA   $1A50,Y
            LDY   #$0D
            JSR   L4D21
            LDX   $00
            LDA   $1A50,X
            CLC
            ADC   $1A80,X
            LDY   $1A80,X
            BMI   L6474
            BCS   L6470
            CMP   #$F4
            BCC   L6478
L6470       LDA   #$F3
            BMI   L6478
L6474       BCS   L6478
            LDA   #$00
L6478       STA   $1A50,X
            LDA   $1A60,X
            CLC
            ADC   $1A90,X
            CMP   #$B3
            BCC   L648F
            LDA   #$B2
            LDY   $1A90,X
            BPL   L648F
            LDA   #$00
L648F       STA   $1A60,X
            TAY
            LDA   $1A50,X
            TAX
            LDA   L08D0
            STA   $06
            LDA   L08D4
            STA   $07
            JSR   L4CF6
            LDX   $00
            BPL   L643C
L64A8       LDY   $1410
            CPY   #$10
            BCS   L64FF
            LDA   $1A60,X
            ADC   #$03
            STA   $1AB0,Y
            LDA   $1A50,X
            ADC   #$04
            STA   $1AA0,Y
            LDX   $1500
            JSR   L6500
            STA   $1AC0,Y
            LDA   $1AB0,Y
            LDX   $1501
            JSR   L6500
            STA   $1AD0,Y
            LDA   L0C16
            STA   $1AF0,Y
            LDA   $4E
            AND   #$01
            STA   $1AE0,Y
            LDA   #$03
            JSR   L4C4B
            SEC
            SBC   #$01
            STA   $1B00,Y
L64EC       LDA   #$03
            JSR   L4C4B
            SEC
            SBC   #$01
            STA   $1B10,Y
            ORA   $1B00,Y
            BEQ   L64EC
            INC   $1410
L64FF       RTS

L6500       LSR
            LSR
            LSR
            LSR
            LSR
            STA   $06
            TXA
            LSR
            LSR
            LSR
            LSR
            LSR
            SEC
            SBC   $06
            STA   $06
            LDA   #$05
            JSR   L4C4B
            SEC
            SBC   #$02
            CLC
            ADC   $06
            BNE   L6522
            CLC
            ADC   #$01
L6522       RTS

L6523       LDX   $1410
L6526       DEX
            BPL   L652A
            RTS

L652A       DEC   $1AE0,X
            BPL   L6526
            LDA   L0C1A
            STA   $1AE0,X
            STX   $00
            LDY   $00
            LDX   $1AB0,Y
            LDA   $1AA0,Y
            LDY   #$07
            JSR   L4CD0
            LDX   $00
            DEC   $1AF0,X
            BNE   L6551
            JSR   L65D9
            JMP   L6526

L6551       LDA   $1AF0,X
            AND   #$01
            STA   $08
            TAY
            LDA   L08D8,Y
            STA   $06
            LDA   L08DC,Y
            STA   $07
            LDA   $1AB0,X
            CLC
            ADC   $1AD0,X
            CMP   #$B9
            BCC   L657D
            LDA   #$B8
            LDY   $1AD0,X
            BPL   L6577
            LDA   #$00
L6577       STA   $1AB0,X
            PHA
            BPL   L6596
L657D       STA   $1AB0,X
            PHA
            LDA   $08
            BEQ   L6596
            LDA   $1AD0,X
            ADC   $1B10,X
            CMP   #$F6
            BCS   L6593
            CMP   #$0A
            BCS   L6596
L6593       STA   $1AD0,X
L6596       LDA   $1AA0,X
            CLC
            ADC   $1AC0,X
            LDY   $1AC0,X
            BMI   L65A8
            BCC   L65B3
            LDA   #$F9
            BMI   L65AC
L65A8       BCS   L65B3
            LDA   #$00
L65AC       STA   $1AA0,X
            PHA
            SEC
            BCS   L65CD
L65B3       STA   $1AA0,X
            PHA
            LDA   $08
            BEQ   L65CD
            LDA   $1AC0,X
            CLC
            ADC   $1B00,X
            CMP   #$F6
            BCS   L65CA
            CMP   #$0A
            BCS   L65CD
L65CA       STA   $1AC0,X
L65CD       PLA
            TAX
            PLA
            TAY
            JSR   L4CAC
            LDX   $00
            JMP   L6526

L65D9       TXA
            PHA
            DEC   $1410
L65DE       LDA   $1AA1,X
            STA   $1AA0,X
            LDA   $1AB1,X
            STA   $1AB0,X
            LDA   $1AC1,X
            STA   $1AC0,X
            LDA   $1AD1,X
            STA   $1AD0,X
            LDA   $1AE1,X
            STA   $1AE0,X
            LDA   $1AF1,X
            STA   $1AF0,X
            LDA   $1B01,X
            STA   $1B00,X
            LDA   $1B11,X
            STA   $1B10,X
            INX
            CPX   $1410
            BCC   L65DE
            PLA
            TAX
            RTS

L6617       TXA
            PHA
            DEC   $140F
L661C       LDA   $1A51,X
            STA   $1A50,X
            LDA   $1A61,X
            STA   $1A60,X
            LDA   $1A71,X
            STA   $1A70,X
            LDA   $1A81,X
            STA   $1A80,X
            LDA   $1A91,X
            STA   $1A90,X
            INX
            CPX   $140F
            BCC   L661C
            PLA
            TAX
            RTS

L6643       LDX   $1410
            LDA   $1C
            SEC
            SBC   #$07
            BCS   L664F
            LDA   #$00
L664F       TAY
L6650       LDA   $1C
L6652       DEX
            BPL   L6657
            CLC
            RTS

L6657       CMP   $1AA0,X
            BCC   L6652
            TYA
            CMP   $1AA0,X
            BCS   L6650
            LDA   $1D
            CMP   $1AB0,X
            BCC   L6650
            SBC   #$07
            BCC   L6672
            CMP   $1AB0,X
            BCS   L6650
L6672       LDA   $E8
            BEQ   L6678
            SEC
            RTS

L6678       TXA
            PHA
            TAY
            LDX   $1AB0,Y
            LDA   $1AA0,Y
            LDY   #$07
            JSR   L4CD0
            PLA
            TAX
            JSR   L65D9
            LDA   L0C20
            STA   $1413
            LDA   #$01
            STA   $1412
            LDA   #$00
            LDX   #$19
            JSR   L4DD0
            SEC
            RTS

L669F       LDX   $140E
            LDA   $1C
            SEC
            SBC   #$0D
            BCS   L66AB
            LDA   #$00
L66AB       TAY
L66AC       LDA   $1C
L66AE       DEX
            BPL   L66B3
            CLC
            RTS

L66B3       CMP   $19C0,X
            BCC   L66AE
            TYA
            CMP   $19C0,X
            BCS   L66AC
            LDA   $1D
            CMP   $19D0,X
            BCC   L66AC
            SBC   #$0D
            BCC   L66CE
            CMP   $19D0,X
            BCS   L66AC
L66CE       LDA   $E8
            BEQ   L66D4
            SEC
            RTS

L66D4       TXA
            PHA
            TAY
            LDX   $19D0,Y
            LDA   $19C0,Y
            LDY   #$0D
            JSR   L4D21
            PLA
            PHA
            TAY
            LDA   $19C0,Y
            CLC
            ADC   #$03
            TAX
            LDA   $19D0,Y
            TAY
            LDA   #$05
            JSR   L5A27
            PLA
            TAX
            JSR   L63F2
            LDA   #$03
            LDX   #$E8
            JSR   L4DD0
            LDA   L0C22
            STA   $1414
            LDA   #$00
            STA   $1415
            SEC
            RTS

L670E       LDX   $140F
            LDA   $1C
            SEC
            SBC   #$0A
            BCS   L671A
            LDA   #$00
L671A       TAY
L671B       LDA   $1C
L671D       DEX
            BPL   L6722
            CLC
            RTS

L6722       CMP   $1A50,X
            BCC   L671D
            TYA
            CMP   $1A50,X
            BEQ   L672F
            BCS   L671B
L672F       LDA   $1D
            CMP   $1A60,X
            BCC   L671B
            SBC   #$0D
            BCC   L673F
            CMP   $1A60,X
            BCS   L671B
L673F       LDA   $E8
            BEQ   L6745
            SEC
            RTS

L6745       TXA
            PHA
            TAY
            LDX   $1A60,Y
            LDA   $1A50,Y
            LDY   #$0D
            JSR   L4D21
            PLA
            TAX
            PHA
            LDA   $1A60,X
            CLC
            ADC   #$06
            TAY
            LDA   $1A50,X
            CLC
            ADC   #$03
            TAX
            LDA   #$55
            JSR   L4F74
            PLA
            TAX
            JSR   L6617
            LDA   #$00
            LDX   #$C8
            JSR   L4DD0
            LDA   L0C34
            STA   $1406
            LDA   L0C35
            STA   $1422
            LDA   L0C36
            STA   $1423
            SEC
            RTS

L6789       DEC   $1424
            BMI   L678F
            RTS

L678F       LDA   $1425
            JSR   L4C4B
            STA   $1424
            LDA   $140F
            JSR   L4C4B
            TAX
            JSR   L64A8
            LDA   $140F
            JSR   L4C4B
            TAX
            JSR   L4C36
            CMP   L0C3A
            BCC   L67B8
            CMP   L0C3B
            BCC   L67EE
            BCS   L67D1
L67B8       LDA   $1A50,X
            LDY   $1500
            JSR   L6832
            STA   $1A80,X
            LDA   $1A60,X
            LDY   $1501
            JSR   L6832
            STA   $1A90,X
            RTS

L67D1       TXA
            TAY
            LDA   L0C15
            ASL
            PHA
            JSR   L4C4B
            SEC
            SBC   L0C15
            STA   $1A80,Y
            PLA
            JSR   L4C4B
            SEC
            SBC   L0C15
            STA   $1A90,Y
            RTS

L67EE       LDA   $1A50,X
            STA   $02
            LDA   $1A60
            STA   $03
            LDA   $1500
            STA   $04
            LDA   $1501
            STA   $05
L6802       LSR   $02
            LSR   $03
            LSR   $04
            LSR   $05
            LDA   $02
            SBC   $04
            TAY
            BCS   L6813
            EOR   #$FF
L6813       CMP   L0C15
            BCS   L6802
            STY   $06
            LDA   $03
            SBC   $05
            TAY
            BCS   L6823
            EOR   #$FF
L6823       CMP   L0C15
            BCS   L6802
            LDA   $06
            STA   $1A80,X
            TYA
            STA   $1A90,X
            RTS

L6832       STA   $03
            LSR
            LSR
            LSR
            LSR
            LSR
            STA   $02
            TYA
            LSR
            LSR
            LSR
            LSR
            LSR
            SBC   $02
            BNE   L684D
            LDA   #$01
            CPY   $03
            BCS   L684D
            LDA   #$FF
L684D       RTS

L684E       LDX   #$02
L6850       LDA   $150A,X
            CMP   $1432,X
            BCC   L6869
            BNE   L6860
            DEX
            BPL   L6850
            JMP   L6869

L6860       LDA   $150A,X
            STA   $1432,X
            DEX
            BPL   L6860
L6869       RTS

L686A       JSR   L51B8
            ASC   0D
            ASC   0C00
            ASC   'HIGH SCORE:'00
            LDX   #$02
L687E       LDA   $1432,X
            STA   $00,X
            DEX
            BPL   L687E
            LDY   #$00
L6888       JSR   L4EC4
            INY
            LDA   $00
            ORA   $01
            ORA   $02
            BNE   L6888
            TYA
            CLC
            ADC   $E0
            STA   $E0
            LDX   #$02
L689C       LDA   $1432,X
            STA   $00,X
            DEX
            BPL   L689C
L68A4       DEC   $E0
            JSR   L4EC4
            CLC
            ADC   #$B0
            LDX   $E0
            LDY   $E1
            JSR   L5108
            LDA   $00
            ORA   $01
            ORA   $02
            BNE   L68A4
            RTS

            DS    $44,$FF
L6900       JMP   L6915
L6903       JMP   L6A0F
L6906       JMP   L6B7B
L6909       JMP   L6C67
L690C       JMP   L6E34
L690F       JMP   L6E98
L6912       JMP   L6F13

L6915       LDX   L0C4D
            INX
            LDA   $1421
            JSR   L4C00
            STA   $08
            LDY   $1427
L6924       DEY
            BPL   L692A
            JMP   L697D

L692A       LDA   #$02
            ASL   $4E
            LDX   $4F
            BCS   L6949
            BPL   L6936
            LDA   #$B2
L6936       STA   $1CF0,Y
            LDA   #$F1
            JSR   L4C4B
            CLC
            ADC   #$02
            AND   #$FE
            STA   $1CE0,Y
            JMP   L6958

L6949       BPL   L694D
            LDA   #$F2
L694D       STA   $1CE0,Y
            LDA   #$B3
            JSR   L4C4B
            STA   $1CF0,Y
L6958       LDA   #$00
            STA   $1D00,Y
            STA   $1D10,Y
            STA   $1D60,Y
            TYA
            AND   #$01
            STA   $1D20,Y
            LDA   $08
            STA   $1D30,Y
            LDA   L0C52
            JSR   L4C4B
            CLC
            ADC   L0C53
            STA   $1D50,Y
            BPL   L6924
L697D       LDA   $1421
            LDX   L0C4E
            INX
            JSR   L4C00
            STA   $08
            LDY   $1428
L698C       DEY
            BPL   L69A4
            LDA   #$00
            STA   $1429
            LDA   #$FF
            STA   $142E
            LDA   $1421
            CLC
            ADC   L0C59
            STA   $142A
            RTS

L69A4       ASL   $4E
            LDA   $4F
            BMI   L69CC
            LDA   #$10
            BCC   L69B0
            LDA   #$A0
L69B0       STA   $06
            LDA   #$3E
            JSR   L4C4B
            CLC
            ADC   $06
            ORA   #$01
            STA   $1D70,Y
            LDA   #$90
            JSR   L4C4B
            CLC
            ADC   #$10
            STA   $1D90,Y
            BNE   L69EC
L69CC       LDA   #$10
            BCC   L69D2
            LDA   #$80
L69D2       STA   $06
            LDA   #$20
            JSR   L4C4B
            CLC
            ADC   $06
            STA   $1D90,Y
            LDA   #$CE
            JSR   L4C4B
            CLC
            ADC   #$10
            ORA   #$01
            STA   $1D70,Y
L69EC       LDA   #$00
            STA   $1DB0,Y
            STA   $1DD0,Y
            LDA   $08
            STA   $1E10,Y
            LDX   #$00
            JSR   L4C36
            BPL   L6A02
            LDX   #$03
L6A02       TXA
            STA   $1E30,Y
            TYA
            AND   #$03
            STA   $1DF0,Y
            JMP   L698C

L6A0F       LDX   $1427
L6A12       DEX
            BPL   L6A16
            RTS

L6A16       DEC   $1D20,X
            BPL   L6A12
            LDA   L0C4D
            STA   $1D20,X
            STX   $00
            LDY   $00
            LDX   $1CF0,Y
            LDA   $1CE0,Y
            LDY   #$0D
            JSR   L4D21
            LDY   $00
            LDA   $1CE0,Y
            CLC
            ADC   $1D00,Y
            BNE   L6A3D
            LDA   #$02
L6A3D       CMP   #$F3
            BCC   L6A51
            LDA   #$F2
            LDX   $1D00,Y
            BPL   L6A4A
            LDA   #$02
L6A4A       PHA
            LDA   #$00
            STA   $1D00,Y
            PLA
L6A51       STA   $1CE0,Y
            LDA   $1CF0,Y
            CLC
            ADC   $1D10,Y
            CMP   #$B3
            BCC   L6A6F
            LDA   #$B2
            LDX   $1D10,Y
            BPL   L6A68
            LDA   #$00
L6A68       PHA
            LDA   #$00
            STA   $1D10,Y
            PLA
L6A6F       STA   $1CF0,Y
            LDA   $1D30,Y
            AND   #$03
            TAX
            LDA   L0910,X
            STA   $06
            LDA   L0918,X
            STA   $07
            LDX   $1CE0,Y
            LDA   $1CF0,Y
            TAY
            JSR   L4CF6
            LDX   $00
            DEC   $1D30,X
            BPL   L6AD2
            LDA   L0C4A
            JSR   L4C4B
            ORA   #$03
            LDX   $00
            STA   $1D30,X
            LDA   $1CE0,X
            LDY   $1500
            JSR   L6B3A
            STA   $1D00,X
            LDA   $1CF0,X
            LDY   $1501
            JSR   L6B3A
            STA   $1D10,X
            LDA   #$00
            STA   $1D60,X
            DEC   $1D50,X
            BPL   L6AD2
            LDA   L0C52
            JSR   L4C4B
            LDX   $00
            STA   $1D50,X
            LDA   #$01
            STA   $1D60,X
L6AD2       LDA   $1D60,X
            BEQ   L6B37
            LDA   $1D30,X
            AND   #$03
            BNE   L6B37
            LDY   $1428
            CPY   L0C58
            BCS   L6B37
            LDA   $1CE0,X
            ORA   #$01
            CMP   #$11
            BCS   L6AF1
            LDA   #$11
L6AF1       CMP   #$E0
            BCC   L6AF7
            LDA   #$DF
L6AF7       STA   $1D70,Y
            LDA   $1CF0,X
            CMP   #$11
            BCS   L6B03
            LDA   #$11
L6B03       CMP   #$A0
            BCC   L6B09
            LDA   #$9F
L6B09       STA   $1D90,Y
            LDA   #$00
            STA   $1DB0,Y
            STA   $1DD0,Y
            STA   $1DF0,Y
            STA   $1E10,Y
            STA   $1E30,Y
            INC   $1428
            DEC   $1D40,X
            BPL   L6B37
            LDY   $00
            LDX   $1CF0,Y
            LDA   $1CE0,Y
            LDY   #$0D
            JSR   L4D21
            LDX   $00
            JSR   L6DF0
L6B37       JMP   L6A12

L6B3A       STA   $06
            STY   $07
            SBC   $07
            BCS   L6B44
            EOR   #$FF
L6B44       CMP   L0C50
            PHP
            JSR   L4C36
            LDA   #$00
            LDY   $4E
            CPY   #$60
            BCC   L6B5E
            LDA   L0C43
            CPY   #$B0
            BCC   L6B5E
            EOR   #$FF
            ADC   #$00
L6B5E       PLP
            BCS   L6B7A
            LDY   $4F
            CPY   L0C56
            BCS   L6B7A
            LDY   $06
            CPY   $07
            TAY
            BCS   L6B73
            BPL   L6B7A
            BCC   L6B76
L6B73       BMI   L6B7A
            CLC
L6B76       EOR   #$FF
            ADC   #$01
L6B7A       RTS

L6B7B       LDX   $1428
L6B7E       DEX
            BPL   L6B82
            RTS

L6B82       DEC   $1DF0,X
            BPL   L6B7E
            STX   $00
            LDA   L0C4E
            STA   $1DF0,X
            LDY   $00
            LDX   $1D90,Y
            LDA   $1D70,Y
            LDY   #$0F
            JSR   L4D21
            LDX   $00
L6B9E       LDA   $1D70,X
            CLC
            ADC   $1DB0,X
            CMP   #$08
            BCC   L6BAD
            CMP   #$E8
            BCC   L6BBD
L6BAD       LDA   $1DB0,X
            EOR   #$FF
            CLC
            ADC   #$01
            STA   $1DB0,X
            JSR   L6C2F
            BPL   L6B9E
L6BBD       STA   $1D70,X
L6BC0       LDA   $1D90,X
            CLC
            ADC   $1DD0,X
            CMP   #$08
            BCC   L6BCF
            CMP   #$A8
            BCC   L6BDF
L6BCF       LDA   $1DD0,X
            EOR   #$FF
            CLC
            ADC   #$01
            STA   $1DD0,X
            JSR   L6C2F
            BPL   L6BC0
L6BDF       STA   $1D90,X
            LDA   $1E10,X
            AND   #$03
            EOR   $1E30,X
            TAY
            LDA   L0920,Y
            STA   $06
            LDA   L0928,Y
            STA   $07
            LDY   $1D90,X
            LDA   $1D70,X
            TAX
            JSR   L4CF6
            LDX   $00
            DEC   $1E10,X
            BPL   L6C2C
            LDA   L0C4B
            JSR   L4C4B
            LDX   $00
            STA   $1E10,X
            LDA   $1D70,X
            LDY   $1500
            JSR   L6C38
            STA   $1DB0,X
            LDA   $1D90,X
            LDY   $1501
            JSR   L6C38
            STA   $1DD0,X
            JSR   L6C2F
L6C2C       JMP   L6B7E

L6C2F       LDA   $1E30,X
            EOR   #$03
            STA   $1E30,X
            RTS

L6C38       STY   $06
            CMP   $06
            PHP
            LDA   L0C44
            ASL
            JSR   L4C4B
            SEC
            SBC   L0C44
            ADC   #$00
            AND   #$FE
            LDX   $00
            LDY   $4E
            CPY   L0C54
            BCS   L6C65
            PLP
            TAY
            BCS   L6C5D
            BPL   L6C64
            BCC   L6C60
L6C5D       BMI   L6C64
            CLC
L6C60       EOR   #$FF
            ADC   #$01
L6C64       RTS

L6C65       PLP
            RTS

L6C67       LDX   $1429
L6C6A       DEX
            BPL   L6C70
            JMP   L6D24

L6C70       DEC   $1E90,X
            BPL   L6C6A
            STX   $00
            LDA   L0C4F
            STA   $1E90,X
            LDY   $00
            LDX   $1E60,Y
            LDA   $1E50,Y
            LDY   #$07
            JSR   L4CD0
            LDX   $00
L6C8C       LDA   $1E50,X
            CLC
            ADC   $1E70,X
            LDY   $1E70,X
            BMI   L6C9D
            BCC   L6CAA
            CLC
            BCC   L6C9F
L6C9D       BCS   L6CAA
L6C9F       TYA
            EOR   #$FF
            ADC   #$01
            STA   $1E70,X
            JMP   L6C8C

L6CAA       STA   $1E50,X
L6CAD       LDA   $1E60,X
            CLC
            ADC   $1E80,X
            CMP   #$B8
            BCC   L6CC5
            LDA   $1E80,X
            EOR   #$FF
            ADC   #$00
            STA   $1E80,X
            JMP   L6CAD

L6CC5       STA   $1E60,X
            DEC   $1EA0,X
            BPL   L6CD3
            JSR   L6CF2
            JMP   L6C6A

L6CD3       LDA   $1EA0,X
            AND   #$01
            TAY
            LDA   L0930,Y
            STA   $06
            LDA   L0934,Y
            STA   $07
            LDY   $1E60,X
            LDA   $1E50,X
            TAX
            JSR   L4CAC
            LDX   $00
            JMP   L6C6A

L6CF2       TXA
            PHA
            DEC   $1429
L6CF7       LDA   $1E51,X
            STA   $1E50,X
            LDA   $1E61,X
            STA   $1E60,X
            LDA   $1E71,X
            STA   $1E70,X
            LDA   $1E81,X
            STA   $1E80,X
            LDA   $1E91,X
            STA   $1E90,X
            LDA   $1EA1,X
            STA   $1EA0,X
            INX
            CPX   $1429
            BCC   L6CF7
            PLA
            TAX
            RTS

L6D24       DEC   $142A
            BMI   L6D2A
L6D29       RTS

L6D2A       LDA   $142B
            JSR   L4C4B
            STA   $142A
            LDA   $1428
            BEQ   L6D29
            JSR   L4C4B
            TAX
            LDY   $1429
            CPY   #$10
            BCS   L6D29
            TYA
            BEQ   L6D4E
            JSR   L4C36
            CMP   L0C67
            BCS   L6D5A
L6D4E       LDA   L0C63
            STA   $142E
            LDA   L0C64
            STA   $142F
L6D5A       LDA   $1D70,X
            CLC
            ADC   #$03
            STA   $1E50,Y
            LDA   $1D90,X
            CLC
            ADC   #$04
            STA   $1E60,Y
            LDA   $1500
            LSR
            ADC   #$40
            STA   $02
            LDA   $1501
            LSR
            ADC   #$50
            STA   $03
            LDA   $4E
            BPL   L6D92
            LDA   $02
            BMI   L6D8B
            LDA   #$80
            SEC
            SBC   $02
            BCS   L6D90
L6D8B       EOR   #$FF
            CLC
            ADC   #$80
L6D90       STA   $02
L6D92       LDA   $4F
            BPL   L6DA8
            LDA   $03
            BMI   L6DA1
            LDA   #$A0
            SEC
            SBC   $03
            BCS   L6DA6
L6DA1       EOR   #$FF
            CLC
            ADC   #$60
L6DA6       STA   $03
L6DA8       LDA   $1E50,Y
            STA   $00
            LDA   $1E60,Y
            STA   $01
L6DB2       LSR   $00
            LSR   $01
            LSR   $02
            LSR   $03
            LDA   $02
            SBC   $00
            TAX
            BCS   L6DC3
            EOR   #$FF
L6DC3       CMP   L0C45
            BCS   L6DB2
            STX   $06
            LDA   $03
            SBC   $01
            TAX
            BCS   L6DD3
            EOR   #$FF
L6DD3       CMP   L0C45
            BCS   L6DB2
            LDA   $06
            STA   $1E70,Y
            TXA
            STA   $1E80,Y
            LDA   #$00
            STA   $1E90,Y
            LDA   L0C4C
            STA   $1EA0,Y
            INC   $1429
            RTS

L6DF0       TXA
            PHA
            DEC   $1427
L6DF5       LDA   $1CE1,X
            STA   $1CE0,X
            LDA   $1CF1,X
            STA   $1CF0,X
            LDA   $1D01,X
            STA   $1D00,X
            LDA   $1D11,X
            STA   $1D10,X
            LDA   $1D21,X
            STA   $1D20,X
            LDA   $1D31,X
            STA   $1D30,X
            LDA   $1D41,X
            STA   $1D40,X
            LDA   $1D51,X
            STA   $1D50,X
            LDA   $1D61,X
            STA   $1D60,X
            INX
            CPX   $1427
            BCC   L6DF5
            PLA
            TAX
            RTS

L6E34       LDX   $1427
            LDA   $1C
            SEC
            SBC   #$0D
            BCS   L6E40
            LDA   #$00
L6E40       TAY
L6E41       LDA   $1C
L6E43       DEX
            BPL   L6E48
            CLC
            RTS

L6E48       CMP   $1CE0,X
            BCC   L6E43
            TYA
            CMP   $1CE0,X
            BCS   L6E41
            LDA   $1D
            CMP   $1CF0,X
            BCC   L6E41
            SBC   #$0D
            BCC   L6E63
            CMP   $1CF0,X
            BCS   L6E41
L6E63       LDA   $E8
            BEQ   L6E69
            SEC
            RTS

L6E69       TXA
            PHA
            TAY
            LDX   $1CF0,Y
            LDA   $1CE0,Y
            LDY   #$0D
            JSR   L4D21
            PLA
            PHA
            TAY
            LDA   $1CE0,Y
            CLC
            ADC   #$03
            TAX
            LDA   $1CF0,Y
            TAY
            LDA   #$06
            JSR   L5A27
            PLA
            TAX
            JSR   L6DF0
            LDA   #$03
            LDX   #$E8
            JSR   L4DD0
            SEC
            RTS

L6E98       LDX   $1428
            LDA   $1C
            SEC
            SBC   #$0D
            BCS   L6EA4
            LDA   #$00
L6EA4       TAY
L6EA5       LDA   $1C
L6EA7       DEX
            BPL   L6EAC
            CLC
            RTS

L6EAC       CMP   $1D70,X
            BCC   L6EA7
            TYA
            CMP   $1D70,X
            BEQ   L6EB9
            BCS   L6EA5
L6EB9       LDA   $1D
            CMP   $1D90,X
            BCC   L6EA5
            SBC   #$0F
            BCC   L6EC9
            CMP   $1D90,X
            BCS   L6EA5
L6EC9       LDA   $E8
            BEQ   L6ECF
            SEC
            RTS

L6ECF       TXA
            PHA
            TAY
            LDX   $1D90,Y
            LDA   $1D70,Y
            LDY   #$0F
            JSR   L4D21
            PLA
            TAX
            PHA
            LDA   $1D90,X
            CLC
            ADC   #$07
            TAY
            LDA   $1D70,X
            CLC
            ADC   #$03
            TAX
            LDA   #$AA
            JSR   L4F74
            PLA
            TAX
            JSR   L6F6F
            LDA   #$00
            LDX   #$C8
            JSR   L4DD0
            LDA   L0C46
            STA   $1406
            LDA   L0C47
            STA   $1422
            LDA   L0C48
            STA   $1423
            SEC
            RTS

L6F13       LDX   $1429
            LDA   $1C
            SEC
            SBC   #$07
            BCS   L6F1F
            LDA   #$00
L6F1F       TAY
L6F20       LDA   $1C
L6F22       DEX
            BPL   L6F27
            CLC
            RTS

L6F27       CMP   $1E50,X
            BCC   L6F22
            TYA
            CMP   $1E50,X
            BCS   L6F20
            LDA   $1D
            CMP   $1E60,X
            BCC   L6F20
            SBC   #$07
            BCC   L6F42
            CMP   $1E60,X
            BCS   L6F20
L6F42       LDA   $E8
            BEQ   L6F48
            SEC
            RTS

L6F48       TXA
            PHA
            TAY
            LDX   $1E60,Y
            LDA   $1E50,Y
            LDY   #$07
            JSR   L4CD0
            PLA
            TAX
            JSR   L6CF2
            LDA   L0C49
            STA   $1413
            LDA   #$01
            STA   $1412
            LDA   #$00
            LDX   #$19
            JSR   L4DD0
            SEC
            RTS

L6F6F       TXA
            PHA
            DEC   $1428
L6F74       LDA   $1D71,X
            STA   $1D70,X
            LDA   $1D91,X
            STA   $1D90,X
            LDA   $1DB1,X
            STA   $1DB0,X
            LDA   $1DD1,X
            STA   $1DD0,X
            LDA   $1DF1,X
            STA   $1DF0,X
            LDA   $1E11,X
            STA   $1E10,X
            LDA   $1E31,X
            STA   $1E30,X
            INX
            CPX   $1428
            BCC   L6F74
            PLA
            TAX
            RTS

            DS    $59,$FF

L7000       JMP   L7015
L7003       JMP   L70CA
L7006       JMP   L76F1
L7009       JMP   L74BD
L700C       JMP   L73A3
L700F       JMP   L788A
L7012       JMP   L7585

L7015       LDA   L0C29
            LDY   $1418
            BNE   L701F
            LDA   #$00
L701F       STA   $141C
            CMP   $1421
            BCC   L702A
            STA   $1421
L702A       DEY
            BPL   L703F
            LDA   #$00
            STA   $141B
            STA   $141D
            STA   $141E
            STA   $1419
            STA   $1426
            RTS

L703F       JSR   L4C36
            PHP
            AND   #$01
            STA   $1B40,Y
            PLP
            BMI   L7070
            LDA   #$DB
            JSR   L4C4B
            CLC
            ADC   #$0C
            AND   #$FE
            STA   $1B20,Y
            JSR   L4C36
            STA   $00
            LDA   #$20
            JSR   L4C4B
            CLC
            ADC   #$0C
            LDX   $00
            BPL   L706B
            ADC   #$7C
L706B       STA   $1B30,Y
            BNE   L7093
L7070       LDA   #$9C
            JSR   L4C4B
            CLC
            ADC   #$0C
            STA   $1B30,Y
            JSR   L4C36
            STA   $00
            LDA   #$37
            JSR   L4C4B
            CLC
            ADC   #$0C
            LDX   $00
            BPL   L708E
            ADC   #$A4
L708E       AND   #$FE
            STA   $1B20,Y
L7093       LDA   $140A
            BNE   L709C
            LDA   #$FF
            BMI   L709F
L709C       JSR   L4C4B
L709F       STA   $1B50,Y
            TYA
            AND   #$03
            STA   $1B60,Y
            LDA   L0C25
            JSR   L4C4B
            STA   $1B70,Y
            LDA   L0C26
            JSR   L4C4B
            STA   $1B80,Y
            LDA   #$FF
            STA   $1B90,Y
            JSR   L4C36
            AND   #$01
            STA   $1BA0,Y
            JMP   L702A

L70CA       LDX   $1418
            LDA   $141C
            BEQ   L70D5
            JMP   L7211

L70D5       DEX
            BPL   L70D9
            RTS

L70D9       LDA   $1B90,X
            BMI   L70E3
            STX   $00
            JMP   L7278

L70E3       DEC   $1B60,X
            BPL   L70D5
            LDA   L0C24
            STA   $1B60,X
            STX   $00
            DEC   $1B70,X
            BPL   L7102
            LDA   L0C25
            STA   $1B70,X
            JSR   L72D9
            TYA
            STA   $1B50,X
L7102       LDY   $00
            LDX   $1B30,Y
            LDA   $1B20,Y
            LDY   #$0D
            JSR   L4D21
            LDY   $00
            LDA   $1B40,Y
            EOR   #$01
            STA   $1B40,Y
            LDX   $1B50,Y
            BMI   L7131
            CPX   $140A
            BCC   L713D
            LDX   $00
            JSR   L72D9
            TYA
            STA   $1B50,X
            LDY   $00
            TAX
            BPL   L713D
L7131       LDA   $1500
            STA   $06
            LDA   $1501
            STA   $07
            BNE   L7147
L713D       LDA   $1950,X
            STA   $06
            LDA   $1960,X
            STA   $07
L7147       LDA   $1B30,Y
            SEC
            SBC   $07
            BCS   L7153
            EOR   #$FF
            ADC   #$01
L7153       CMP   #$02
            BCS   L715B
            LDA   $07
            BNE   L7168
L715B       LDA   $1B30,Y
            CMP   $07
            BCS   L7166
            ADC   #$02
            BCC   L7168
L7166       SBC   #$02
L7168       STA   $1B30,Y
            LDA   #$00
            STA   $01
            LDA   $1B20,Y
            CMP   $06
            BCS   L718E
            ADC   #$02
            STA   $1B20,Y
            ADC   #$0F
            CMP   $06
            BCC   L719B
L7181       LDA   $1B30,Y
            CMP   $07
            BNE   L719B
            TXA
            BMI   L719B
            JMP   L7314

L718E       INC   $01
            SBC   #$02
            STA   $1B20,Y
            SBC   #$09
            CMP   $06
            BCC   L7181
L719B       LDA   $01
            STA   $1BA0,Y
            ASL
            ORA   $1B40,Y
            TAX
            LDA   L08E0,X
            STA   $06
            LDA   L08E8,X
            STA   $07
            LDX   $1B20,Y
            LDA   $1B30,Y
            TAY
            JSR   L4CF6
            LDX   $00
            DEC   $1B80,X
            BPL   L720E
            LDA   $141D
            ASL
            TAY
            CPY   #$10
            BCS   L720E
            INC   $141D
            LDA   $1B20,X
            CLC
            ADC   #$05
            STA   $1C70,Y
            STA   $1C71,Y
            LDA   $1B30,X
            STA   $1C80,Y
            STA   $1C81,Y
            JSR   L768F
            LDA   $02
            STA   $1C90,Y
            STA   $1C91,Y
            LDA   $03
            STA   $1CA0,Y
            STA   $1CA1,Y
            LDA   L0C2E
            STA   $1CB0,Y
            STA   $1CB1,Y
            LDA   L0C2E
            STA   $1CC1,Y
            LDA   L0C26
            JSR   L4C4B
            LDX   $00
            STA   $1B80,X
L720E       JMP   L70D5

L7211       ASL
            ASL
            STA   $0A
            LDY   #$0D
            JSR   L50A1
            LDX   $1418
L721D       DEX
            BPL   L7224
            DEC   $141C
            RTS

L7224       STX   $00
            LDA   $1BA0,X
            ASL
            TAY
            LDA   L08E0,Y
            STA   $06
            LDA   L08E8,Y
            STA   $07
            LDY   $1B30,X
            LDA   $1B20,X
            TAX
            JSR   L4C7C
            LDA   #$00
            STA   $20
L7243       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            LDA   ($08,X)
            AND   ($20,X)
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($08,X)
            AND   ($20,X)
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($08,X)
            AND   ($20,X)
            STA   ($06),Y
            INC   $08
            INC   $20
            LDY   $05
            DEY
            BPL   L7243
            JSR   L4C6E
            LDX   $00
            JMP   L721D

L7278       LDY   L0C3D
            LDA   $1B40,X
            EOR   #$01
            STA   $1B40,X
            BEQ   L7288
            LDY   L0C3E
L7288       STY   $02
            LDA   $1BA0,X
            ASL
            TAY
            LDA   L08E0,Y
            STA   $06
            LDA   L08E8,Y
            STA   $07
            LDY   $1B30,X
            LDA   $1B20,X
            TAX
            JSR   L4C7C
L72A3       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            LDA   ($08,X)
            EOR   $02
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($08,X)
            EOR   $02
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($08,X)
            EOR   $02
            STA   ($06),Y
            INC   $08
            LDY   $05
            DEY
            BPL   L72A3
            LDX   $00
            DEC   $1B90,X
            JSR   L4C6E
            JMP   L70D5

L72D9       LDY   $140A
            BNE   L72E0
            DEY
            RTS

L72E0       LDA   #$FF
            STA   $06
            LDA   #$00
            STA   $07
L72E8       DEY
            BMI   L7311
            LDA   $1950,Y
            SBC   $1B20,X
            BCS   L72F5
            EOR   #$FF
L72F5       STA   $08
            LDA   $1960,Y
            SBC   $1B30,X
            BCS   L7301
            EOR   #$FF
L7301       ADC   $08
            BCC   L7307
            LDA   #$FF
L7307       CMP   $06
            BCS   L72E8
            STA   $06
            STY   $07
            BCC   L72E8
L7311       LDY   $07
            RTS

L7314       LDA   $1990,X
            PHA
            TXA
            TAY
            LDX   $1960,Y
            LDA   $1950,Y
            LDY   #$0A
            JSR   L4CD0
            LDY   $00
            LDX   $1B50,Y
            JSR   L5A21
            LDY   $00
            LDA   $141B
            ASL
            STA   $01
L7335       LDA   $1B20,Y
            LDX   $1BA0,Y
            BNE   L734E
            CLC
            ADC   #$12
            BCS   L7346
            CMP   #$F3
            BCC   L7357
L7346       TXA
            EOR   #$01
            STA   $1BA0,Y
            BPL   L7335
L734E       SEC
            SBC   #$0C
            BCC   L7346
            CMP   #$06
            BCC   L7346
L7357       LDX   $01
            STA   $1BB0,X
            STA   $1BB1,X
            LDA   $1B30,Y
            STA   $1BD0,X
            STA   $1BD1,X
            LDA   $1BA0,Y
            STA   $1BF0,X
            STA   $1BF1,X
            STA   $1C30,X
            LDA   #$70
            STA   $1C10,X
            STA   $1C11,X
            PLA
            STA   $1C50,X
            LDA   L0C2A
            SEC
            SBC   #$01
            STA   $1C31,X
            LDA   L0C28
            STA   $1419
            STA   $1B90,Y
            STA   $1C51,X
            LDA   L0C23
            STA   $141A
            INC   $141B
            LDX   $00
            JMP   L70D5

L73A3       LDX   $1418
            LDA   $1C
            SEC
            SBC   #$0D
            BCS   L73AF
            LDA   #$00
L73AF       TAY
L73B0       LDA   $1C
L73B2       DEX
            BPL   L73B7
            CLC
            RTS

L73B7       CMP   $1B20,X
            BCC   L73B2
            TYA
            CMP   $1B20,X
            BCS   L73B0
            LDA   $1D
            CMP   $1B30,X
            BCC   L73B0
            SBC   #$0D
            BCC   L73D2
            CMP   $1B30,X
            BCS   L73B0
L73D2       LDA   $E8
            BEQ   L73D8
            SEC
            RTS

L73D8       STX   $00
            LDY   $00
            LDX   $1B30,Y
            LDA   $1B20,Y
            LDY   #$0D
            JSR   L4D21
            LDX   $00
            LDA   $1B30,X
            CLC
            ADC   #$06
            TAY
            LDA   $1B20,X
            ADC   #$03
            TAX
            LDA   #$D5
            JSR   L4F74
            LDX   $00
            LDA   $1B90,X
            BMI   L7441
            LDA   $141B
            ASL
            TAY
L7407       DEY
            DEY
            BMI   L743F
            LDA   $1C51,Y
            BMI   L7407
            JSR   L7979
            BCC   L7407
            STY   $01
            LDX   $1BD0,Y
            DEX
            DEX
            LDA   $1BB0,Y
            LDY   #$0E
            JSR   L4CD0
            LDX   $01
            LDY   $1BD0,X
            LDA   $1BB0,X
            TAX
            JSR   L5A24
            LDX   $01
            JSR   L7942
            LDX   $00
            LDA   #$FF
            STA   $1B90,X
            JSR   L7459
L743F       LDX   $00
L7441       JSR   L7479
            LDA   #$01
            LDX   #$F4
            JSR   L4DD0
            LDA   L0C32
            STA   $141E
            LDA   L0C31
            STA   $141F
            SEC
            RTS

L7459       LDA   $1419
            BEQ   L7478
            LDX   $1418
            LDA   #$00
L7463       DEX
            BMI   L7475
            LDY   $1B90,X
            BMI   L7463
            CMP   $1B90,X
            BCS   L7463
            LDA   $1B90,X
            BPL   L7463
L7475       STA   $1419
L7478       RTS

L7479       TXA
            PHA
            DEC   $1418
L747E       LDA   $1B21,X
            STA   $1B20,X
            LDA   $1B31,X
            STA   $1B30,X
            LDA   $1B41,X
            STA   $1B40,X
            LDA   $1B51,X
            STA   $1B50,X
            LDA   $1B61,X
            STA   $1B60,X
            LDA   $1B71,X
            STA   $1B70,X
            LDA   $1B81,X
            STA   $1B80,X
            LDA   $1B91,X
            STA   $1B90,X
            LDA   $1BA1,X
            STA   $1BA0,X
            INX
            CPX   $1418
            BCC   L747E
            PLA
            TAX
            RTS

L74BD       LDA   #$00
            STA   $FC
            STA   $FE
            LDA   $141D
            ASL
            TAX
L74C8       DEX
            DEX
            BPL   L74CD
            RTS

L74CD       STX   $00
            JSR   L7628
            LDX   $00
            JSR   L7546
            LDY   $1C80,X
            LDA   $1C70,X
            JSR   L4C1C
            STA   $04
            LDA   #$00
            SEC
L74E5       ROL
            DEX
            BPL   L74E5
            STA   $0A
            LDX   #$02
L74ED       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            LDA   $0A
            ORA   ($06),Y
            STA   ($06),Y
            LDA   $0A
            ASL
            BPL   L7507
            INY
            LDA   #$01
L7507       ORA   ($06),Y
            STA   ($06),Y
            LDY   $05
            INY
            DEX
            BNE   L74ED
            LDX   $00
            DEC   $1CB0,X
            BPL   L74C8
            LDY   $00
            JSR   L768F
            LDA   $02
            STA   $1C90,Y
            STA   $1CC0,Y
            LDA   $03
            STA   $1CA0,Y
            STA   $1CD0,Y
            LDA   L0C2D
            JSR   L4C4B
            CLC
            ADC   L0C2E
            STA   $1CB0,Y
            INY
            LDA   L0C2E
            STA   $1CB0,Y
            LDX   $00
            JMP   L74C8

L7546       LDA   $1C70,X
            CLC
            ADC   $1C90,X
            CMP   #$02
            BCC   L7555
            CMP   #$FE
            BCC   L7562
L7555       LDA   $1C90,X
            EOR   #$FF
            CLC
            ADC   #$01
            STA   $1C90,X
            BNE   L7546
L7562       STA   $1C70,X
L7565       LDA   $1C80,X
            CLC
            ADC   $1CA0,X
            CMP   #$02
            BCC   L7574
            CMP   #$BE
            BCC   L7581
L7574       LDA   $1CA0,X
            EOR   #$FF
            CLC
            ADC   #$01
            STA   $1CA0,X
            BNE   L7565
L7581       STA   $1C80,X
            RTS

L7585       LDA   $141D
            ASL
            TAX
            INC   $1C
            INC   $1D
            LDA   $1C
            SEC
            SBC   #$04
            BCS   L7597
            LDA   #$00
L7597       TAY
L7598       LDA   $1C
L759A       DEX
            DEX
            BPL   L75A4
            DEC   $1C
            DEC   $1D
            CLC
            RTS

L75A4       CMP   $1C70,X
            BCC   L759A
            TYA
            CMP   $1C70,X
            BCS   L7598
            LDA   $1D
            CMP   $1C80,X
            BCC   L7598
            SBC   #$04
            BCC   L75BF
            CMP   $1C80,X
            BCS   L7598
L75BF       LDA   $E8
            BEQ   L75C5
            SEC
            RTS

L75C5       STX   $00
            LDA   #$00
            STA   $FC
            STA   $FE
            LDA   L0C2E
            STA   $02
L75D2       JSR   L7628
            DEC   $02
            BPL   L75D2
            LDX   $00
            JSR   L75EB
            LDA   #$00
            LDX   #$64
            JSR   L4DD0
            DEC   $1C
            DEC   $1D
            SEC
            RTS

L75EB       TXA
            PHA
            DEC   $141D
            LDA   $141D
            ASL
            STA   $06
L75F6       LDA   $1C72,X
            STA   $1C70,X
            LDA   $1C82,X
            STA   $1C80,X
            LDA   $1C92,X
            STA   $1C90,X
            LDA   $1CA2,X
            STA   $1CA0,X
            LDA   $1CB2,X
            STA   $1CB0,X
            LDA   $1CC2,X
            STA   $1CC0,X
            LDA   $1CD2,X
            STA   $1CD0,X
            INX
            CPX   $06
            BCC   L75F6
            PLA
            TAX
            RTS

L7628       LDX   $00
            INX
            LDA   $1CC0,X
            BEQ   L7635
            DEC   $1CC0,X
            BPL   L768E
L7635       LDY   $1C80,X
            LDA   $1C70,X
            JSR   L4C1C
            STA   $04
            LDA   #$FF
            CLC
L7643       ROL
            DEX
            BPL   L7643
            STA   $0A
            LDX   #$02
L764B       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            LDA   $0A
            AND   ($06),Y
            STA   ($06),Y
            LDA   $0A
            SEC
            ROL
            BMI   L7666
            INY
            LDA   #$FE
L7666       AND   ($06),Y
            STA   ($06),Y
            LDY   $05
            INY
            DEX
            BNE   L764B
            LDX   $00
            INX
            JSR   L7546
            DEC   $1CB0,X
            BNE   L768E
            LDA   #$40
            STA   $1CB0,X
            LDY   $00
            LDA   $1CC0,Y
            STA   $1C90,X
            LDA   $1CD0,Y
            STA   $1CA0,X
L768E       RTS

L768F       LDX   #$00
            LDA   $4E
            LSR
            BCC   L769C
            INX
            LSR
            BCC   L769C
            DEX
            DEX
L769C       LDA   $4F
            AND   #$03
            SEC
            SBC   #$02
            BCC   L76A7
            ADC   #$00
L76A7       BIT   $4F
            BPL   L76B0
            STX   $02
            TAX
            LDA   $02
L76B0       STX   $02
            STA   $03
            JSR   L4C36
            CMP   L0C2F
            BCS   L76F0
            LDA   $1C70,Y
            CMP   $1500
            LDA   $02
            BCS   L76CE
            BPL   L76D4
            EOR   #$FF
            ADC   #$01
            BPL   L76D4
L76CE       BMI   L76D4
            EOR   #$FF
            ADC   #$00
L76D4       STA   $02
            LDA   $1C80,Y
            CMP   $1501
            LDA   $03
            BCS   L76E8
            BPL   L76EE
            EOR   #$FF
            ADC   #$01
            BPL   L76EE
L76E8       BMI   L76EE
            EOR   #$FF
            ADC   #$00
L76EE       STA   $03
L76F0       RTS

L76F1       LDA   $141B
            ASL
            TAX
L76F6       DEX
            DEX
            BPL   L76FD
            JMP   L77DD

L76FD       LDA   $1C51,X
            BMI   L770B
            STX   $00
            JSR   L7821
            LDX   $00
            BPL   L76F6
L770B       LDA   $1508
            BNE   L76F6
            STX   $00
            LDA   $1C31,X
            BMI   L771D
            DEC   $1C31,X
            JMP   L7720

L771D       JSR   L7778
L7720       LDX   $00
            JSR   L779E
            LDA   $1C50,X
            ASL
            ASL
            ORA   $1BF0,X
            TAY
            LDA   L08F0,Y
            STA   $06
            LDA   L0900,Y
            STA   $07
            LDY   $1BD0,X
            LDA   $1BB0,X
            TAX
            JSR   L5059
            LDX   $00
            DEC   $1C10,X
            BPL   L76F6
            LDA   #$70
            STA   $1C10,X
            LDA   $1BB0,X
            LDY   $1500
            JSR   L7812
            STA   $02
            STY   $03
            LDA   $1BD0,X
            LDY   $1501
            JSR   L7812
            CMP   $02
            BCS   L776C
            LDA   $03
            BPL   L776F
L776C       TYA
            ORA   #$02
L776F       STA   $1BF0,X
            STA   $1C30,X
            JMP   L76F6

L7778       LDX   $00
            INX
            JSR   L779E
            TXA
            TAY
            LDX   $1BD0,Y
            LDA   $1BB0,Y
            LDY   #$0A
            JSR   L4CD0
            LDX   $00
            DEC   $1C11,X
            BPL   L779D
            LDA   #$70
            STA   $1C11,X
            LDA   $1C30,X
            STA   $1BF1,X
L779D       RTS

L779E       LDY   $1BF0,X
            LDA   $1BB0,X
            CLC
            ADC   L0D3E,Y
            CMP   #$06
            BCS   L77B0
            LDA   #$00
            BPL   L77B6
L77B0       CMP   #$F3
            BCC   L77BB
            LDA   #$01
L77B6       STA   $1BF0,X
            BPL   L779E
L77BB       STA   $1BB0,X
L77BE       LDA   $1BD0,X
            CLC
            ADC   L0D42,Y
            CMP   #$06
            BCS   L77CD
            LDA   #$02
            BPL   L77D3
L77CD       CMP   #$B0
            BCC   L77D9
            LDA   #$03
L77D3       STA   $1BF0,X
            TAY
            BPL   L77BE
L77D9       STA   $1BD0,X
            RTS

L77DD       DEC   $1426
            BPL   L7811
            LDA   L0C2B
            JSR   L4C4B
            STA   $06
            LDA   L0C2A
            CLC
            ADC   #$01
            ASL
            ADC   $06
            STA   $1426
            LDA   $141B
            ASL
            TAX
L77FB       DEX
            DEX
            BMI   L7811
            LDA   $1C31,X
            BPL   L77FB
            LDA   #$00
            STA   $1C10,X
            LDA   L0C2A
            STA   $1C11,X
            BPL   L77FB
L7811       RTS

L7812       STY   $01
            LDY   #$01
            SEC
            SBC   $01
            BCS   L7820
            EOR   #$FF
            ADC   #$01
            DEY
L7820       RTS

L7821       LDY   $1508
            LDA   L0C41,Y
            STA   $02
            DEC   $1C51,X
            BPL   L783E
            LDA   $1BD0,X
            SEC
            SBC   #$02
            LDY   $1BB0,X
            TAX
            TYA
            LDY   #$0E
            JMP   L4CD0

L783E       LDA   $1C50,X
            ASL
            ORA   $1BF0,X
            ASL
            TAY
            LDA   L08A0,Y
            STA   $06
            LDA   L08B0,Y
            STA   $07
            LDA   $1BD0,X
            SEC
            SBC   #$02
            LDY   $4E
            BPL   L785D
            SBC   #$FC
L785D       TAY
            LDA   $1BB0,X
            TAX
            JSR   L4C7C
L7865       LDA   ($FC),Y
            STA   $06
            LDA   ($FE),Y
            STA   $07
            STY   $05
            LDY   $04
            LDA   ($08,X)
            EOR   $02
            STA   ($06),Y
            INC   $08
            INY
            LDA   ($08,X)
            EOR   $02
            STA   ($06),Y
            INC   $08
            LDY   $05
            DEY
            BPL   L7865
            JMP   L4C6E

L788A       LDA   $141B
            ASL
            TAX
            LDA   $1C
            SEC
            SBC   #$07
            BCS   L7898
            LDA   #$00
L7898       TAY
L7899       LDA   $1C
L789B       DEX
            DEX
            BPL   L78A1
            CLC
            RTS

L78A1       CMP   $1BB0,X
            BCC   L789B
            TYA
            CMP   $1BB0,X
            BCS   L7899
            LDA   $1D
            CMP   $1BD0,X
            BCC   L7899
            SBC   #$0A
            BCC   L78BC
            CMP   $1BD0,X
            BCS   L7899
L78BC       LDA   $E8
            BEQ   L78C2
            SEC
            RTS

L78C2       STX   $00
            LDA   $1C51,X
            BPL   L78FA
            LDA   L0C2A
            STA   $01
L78CE       JSR   L7778
            DEC   $01
            BPL   L78CE
            LDA   $1BD0,X
            CLC
            ADC   #$05
            TAY
            LDA   $1BB0,X
            TAX
            LDA   #$7F
            JSR   L4F74
            LDA   L0C37
            STA   $1406
            LDA   L0C38
            STA   $1422
            LDA   L0C39
            STA   $1423
            SEC
            BCS   L7930
L78FA       LDY   $00
            LDX   $1BD0,Y
            DEX
            DEX
            LDA   $1BB0,Y
            LDY   #$0E
            JSR   L4CD0
            LDX   $00
            LDY   $1BD0,X
            LDA   $1BB0,X
            TAX
            JSR   L5A24
            LDY   $00
            LDX   $1418
L791A       DEX
            BMI   L792F
            LDA   $1B90,X
            BMI   L791A
            JSR   L7979
            BCC   L791A
            LDA   #$FF
            STA   $1B90,X
            JSR   L7459
L792F       CLC
L7930       PHP
            LDX   $00
            JSR   L7942
            PLP
            BCC   L7940
            LDA   #$00
            LDX   #$64
            JSR   L4DD0
L7940       SEC
            RTS

L7942       TXA
            PHA
            DEC   $141B
            LDA   $141B
            ASL
            STA   $06
L794D       LDA   $1BB2,X
            STA   $1BB0,X
            LDA   $1BD2,X
            STA   $1BD0,X
            LDA   $1BF2,X
            STA   $1BF0,X
            LDA   $1C12,X
            STA   $1C10,X
            LDA   $1C32,X
            STA   $1C30,X
            LDA   $1C52,X
            STA   $1C50,X
            INX
            CPX   $06
            BCC   L794D
            PLA
            TAX
            RTS

L7979       LDA   $1B30,X
            CMP   $1BD0,Y
            BNE   L7996
            LDA   $1B20,X
            CLC
            ADC   #$12
            CMP   $1BB0,Y
            BEQ   L7994
            SEC
            SBC   #$1E
            CMP   $1BB0,Y
            BNE   L7996
L7994       SEC
            RTS
L7996       CLC
            RTS

*-----------------------------------
*
*-----------------------------------

L7998       DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $10
            DB    $9C
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
            DB    $10
            DB    $10
            DB    $9C
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
            DB    $10
            DB    $10
            DB    $5C
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
            DB    $10
            DB    $10
            DB    $90
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
            DB    $10
            DB    $10
            DB    $5C
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
            DB    $10
            DB    $10
            DB    $14
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
            DB    $10
            DB    $10
            DB    $50

*-----------------------
* PACKED SPRITES AREA
*-----------------------

L7A00       DB    $02
            DB    $0A
            DA    $8200
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $8214
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $8228
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $823C
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $8250
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $8264
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $8278
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $828C
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $82B3
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $82DA
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $8300
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $8314
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $8328
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0E
            DA    $833C
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0E
            DA    $8366
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0E
            DA    $8390
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0E
            DA    $83BA
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0E
            DA    $8400
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0E
            DA    $842A
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $8454
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $847B
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $84A2
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $84C9
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $07
            DA    $84F0
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $07
            DA    $8500
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $850E
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $8535
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $855C
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $8583
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0C
            DA    $85AA
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0C
            DA    $85CE
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0C
            DA    $8600
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0C
            DA    $8624
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0C
            DA    $8648
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0C
            DA    $866C
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0C
            DA    $8690
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $86B4
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $8700
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $8727
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $874E
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $8762
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $8776
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $878A
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $879E
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    $87B2
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0F
            DA    $87C6
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0F
            DA    $8800
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0F
            DA    $882D
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0F
            DA    $885A
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $8887
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $88AE
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $88D5
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    $8900
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $07
            DA    $8927
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $07
            DA    $8935
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    L7E00
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    L7E14
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    L7E28
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    L7E3C
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    L7E50
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    L7E64
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0A
            DA    L7E78
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $FF
            DB    $FF
            DA    $FFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $FF
            DB    $FF
            DA    $FFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
	
L7E00       HEX   0000180008001C001C001C0008001C00
            HEX   1C000000
L7E14       HEX   00003C0014001C003E001C0008001C00
            HEX   1C000000
L7E28       HEX   00000C0008001C001C001C0008001C00
            HEX   1C000000
L7E3C       HEX   00001E0014001C003E001C0008001C00
            HEX   1C000000
L7E50       HEX   00006700770063006300630077006300
            HEX   63000000
L7E64       HEX   00007300770063006300630077006300
            HEX   63000000
L7E78       HEX   000049006B0022002200410077006300
            HEX   63000000
L7E8C       HEX   D08280D48A80848880C5A880808080DD
            HEX   BB80D5AA80DDBB80808080C5A8808488
            HEX   80D48A80D08280
L7EB3       HEX   552A003333006529004924000000005D
            HEX   3B00552A005D3B000000004924006529
            HEX   00333300552A00
L7EDA       HEX   00000000000000000000000000000000
            HEX   00000000000000000000000000000000
            HEX   000000000000

L7F00       DB    $03
            DB    $05
            DA    $8943
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $05
            DA    $8952
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $05
            DA    $8961
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $05
            DA    $8970
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $05
            DA    $897F
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0C
            DA    $898E
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0C
            DA    $89A6
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0C
            DA    $89BE
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $02
            DB    $0C
            DA    $89D6
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    L7E8C
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $03
            DB    $0D
            DA    L7EB3
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $FF
            DB    $FF
            DA    L7EDA
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $FF
            DB    $FF
            DA    $FFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $FF
            DB    $FF
            DA    $FFFF
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $08
            DB    $28
            DA    $05C0
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF
            DB    $22
            DB    $2D
            DA    $8A00
            HEX   FFFFFFFFFFFFFFFFFFFFFFFF

*-----------------------
* WE ARE AT $8000
*-----------------------

            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $00
            DB    $0C
            DB    $0C
            DB    $12
            DB    $12
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $14
            DB    $14
            DB    $3E
            DB    $14
            DB    $3E
            DB    $14
            DB    $14
            DB    $00
            DB    $3E
            DB    $41
            DB    $59
            DB    $45
            DB    $45
            DB    $59
            DB    $41
            DB    $3E
            DB    $26
            DB    $26
            DB    $10
            DB    $08
            DB    $04
            DB    $32
            DB    $32
            DB    $00
            DB    $0C
            DB    $14
            DB    $0C
            DB    $06
            DB    $15
            DB    $25
            DB    $1E
            DB    $04
            DB    $08
            DB    $08
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $10
            DB    $08
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $08
            DB    $10
            DB    $04
            DB    $08
            DB    $18
            DB    $18
            DB    $18
            DB    $18
            DB    $08
            DB    $04
            DB    $08
            DB    $2A
            DB    $1C
            DB    $7F
            DB    $1C
            DB    $2A
            DB    $08
            DB    $00
            DB    $00
            DB    $08
            DB    $08
            DB    $3E
            DB    $08
            DB    $08
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $18
            DB    $18
            DB    $0C
            DB    $00
            DB    $00
            DB    $00
            DB    $3E
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $0C
            DB    $0C
            DB    $00
            DB    $40
            DB    $20
            DB    $10
            DB    $08
            DB    $04
            DB    $02
            DB    $01
            DB    $00
            DB    $3E
            DB    $22
            DB    $22
            DB    $32
            DB    $32
            DB    $32
            DB    $3E
            DB    $00
            DB    $08
            DB    $08
            DB    $08
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $00
            DB    $3C
            DB    $34
            DB    $30
            DB    $3E
            DB    $06
            DB    $06
            DB    $3E
            DB    $00
            DB    $3E
            DB    $30
            DB    $30
            DB    $3E
            DB    $20
            DB    $20
            DB    $3E
            DB    $00
            DB    $06
            DB    $06
            DB    $26
            DB    $26
            DB    $3E
            DB    $20
            DB    $20
            DB    $00
            DB    $1E
            DB    $16
            DB    $06
            DB    $3E
            DB    $30
            DB    $30
            DB    $3E
            DB    $00
            DB    $02
            DB    $02
            DB    $02
            DB    $3E
            DB    $32
            DB    $32
            DB    $3E
            DB    $00
            DB    $3E
            DB    $30
            DB    $30
            DB    $10
            DB    $08
            DB    $08
            DB    $08
            DB    $00
            DB    $3E
            DB    $26
            DB    $26
            DB    $3E
            DB    $32
            DB    $32
            DB    $3E
            DB    $00
            DB    $3E
            DB    $26
            DB    $26
            DB    $3E
            DB    $30
            DB    $30
            DB    $30
            DB    $00
            DB    $00
            DB    $0C
            DB    $0C
            DB    $00
            DB    $0C
            DB    $0C
            DB    $00
            DB    $00
            DB    $00
            DB    $18
            DB    $18
            DB    $00
            DB    $00
            DB    $18
            DB    $18
            DB    $0C
            DB    $30
            DB    $18
            DB    $0C
            DB    $06
            DB    $0C
            DB    $18
            DB    $30
            DB    $00
            DB    $55
            DB    $2A
            DB    $55
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $06
            DB    $0C
            DB    $18
            DB    $30
            DB    $18
            DB    $0C
            DB    $06
            DB    $00
            DB    $3E
            DB    $32
            DB    $30
            DB    $3C
            DB    $0C
            DB    $00
            DB    $0C
            DB    $0C
            DB    $7F
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $3C
            DB    $24
            DB    $24
            DB    $3E
            DB    $26
            DB    $26
            DB    $26
            DB    $00
            DB    $1E
            DB    $16
            DB    $16
            DB    $3E
            DB    $26
            DB    $26
            DB    $3E
            DB    $00
            DB    $3E
            DB    $26
            DB    $06
            DB    $06
            DB    $06
            DB    $26
            DB    $3E
            DB    $00
            DB    $1E
            DB    $26
            DB    $26
            DB    $26
            DB    $26
            DB    $26
            DB    $1E
            DB    $00
            DB    $3E
            DB    $06
            DB    $06
            DB    $1E
            DB    $06
            DB    $06
            DB    $3E
            DB    $00
            DB    $3E
            DB    $06
            DB    $06
            DB    $1E
            DB    $06
            DB    $06
            DB    $06
            DB    $00
            DB    $3E
            DB    $06
            DB    $06
            DB    $36
            DB    $26
            DB    $26
            DB    $3E
            DB    $00
            DB    $26
            DB    $26
            DB    $26
            DB    $3E
            DB    $26
            DB    $26
            DB    $26
            DB    $00
            DB    $1E
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $0C
            DB    $1E
            DB    $00
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $30
            DB    $36
            DB    $3E
            DB    $00
            DB    $36
            DB    $36
            DB    $16
            DB    $0E
            DB    $16
            DB    $36
            DB    $36
            DB    $00
            DB    $04
            DB    $04
            DB    $04
            DB    $06
            DB    $06
            DB    $06
            DB    $3E
            DB    $00
            DB    $22
            DB    $36
            DB    $2A
            DB    $22
            DB    $22
            DB    $22
            DB    $22
            DB    $00
            DB    $26
            DB    $2E
            DB    $2E
            DB    $36
            DB    $26
            DB    $26
            DB    $26
            DB    $00
            DB    $3E
            DB    $26
            DB    $26
            DB    $26
            DB    $22
            DB    $22
            DB    $3E
            DB    $00
            DB    $3E
            DB    $26
            DB    $26
            DB    $3E
            DB    $06
            DB    $06
            DB    $06
            DB    $00
            DB    $3E
            DB    $22
            DB    $22
            DB    $22
            DB    $32
            DB    $32
            DB    $3E
            DB    $70
            DB    $3E
            DB    $22
            DB    $22
            DB    $3E
            DB    $12
            DB    $22
            DB    $22
            DB    $00
            DB    $3E
            DB    $26
            DB    $06
            DB    $3E
            DB    $30
            DB    $32
            DB    $3E
            DB    $00
            DB    $3E
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $00
            DB    $26
            DB    $26
            DB    $26
            DB    $26
            DB    $26
            DB    $26
            DB    $3E
            DB    $00
            DB    $36
            DB    $36
            DB    $36
            DB    $36
            DB    $14
            DB    $1C
            DB    $08
            DB    $00
            DB    $22
            DB    $22
            DB    $22
            DB    $22
            DB    $2A
            DB    $36
            DB    $22
            DB    $00
            DB    $36
            DB    $36
            DB    $14
            DB    $08
            DB    $14
            DB    $36
            DB    $36
            DB    $00
            DB    $36
            DB    $36
            DB    $36
            DB    $14
            DB    $08
            DB    $08
            DB    $08
            DB    $00
            DB    $3E
            DB    $26
            DB    $10
            DB    $08
            DB    $04
            DB    $32
            DB    $3E
            DB    $00
            DB    $1E
            DB    $06
            DB    $06
            DB    $06
            DB    $06
            DB    $06
            DB    $06
            DB    $1E
            DB    $01
            DB    $02
            DB    $04
            DB    $08
            DB    $10
            DB    $20
            DB    $40
            DB    $00
            DB    $1E
            DB    $18
            DB    $18
            DB    $18
            DB    $18
            DB    $18
            DB    $1E
            DB    $00
            DB    $08
            DB    $1C
            DB    $2A
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $00
            DB    $7F
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $36
            DB    $00
            DB    $14
            DB    $00
            DB    $14
            DB    $00
            DB    $14
            DB    $00
            DB    $5D
            DB    $00
            DB    $5D
            DB    $00
            DB    $3E
            DB    $00
            DB    $08
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $18
            DB    $00
            DB    $08
            DB    $00
            DB    $08
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $08
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $3C
            DB    $00
            DB    $14
            DB    $00
            DB    $14
            DB    $00
            DB    $1C
            DB    $00
            DB    $3E
            DB    $00
            DB    $3E
            DB    $00
            DB    $1C
            DB    $00
            DB    $08
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $0C
            DB    $00
            DB    $08
            DB    $00
            DB    $08
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $08
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $1E
            DB    $00
            DB    $14
            DB    $00
            DB    $14
            DB    $00
            DB    $1C
            DB    $00
            DB    $3E
            DB    $00
            DB    $3E
            DB    $00
            DB    $1C
            DB    $00
            DB    $08
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $06
            DB    $00
            DB    $34
            DB    $00
            DB    $14
            DB    $00
            DB    $14
            DB    $00
            DB    $5D
            DB    $00
            DB    $5D
            DB    $00
            DB    $3E
            DB    $00
            DB    $08
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $30
            DB    $00
            DB    $16
            DB    $00
            DB    $14
            DB    $00
            DB    $14
            DB    $00
            DB    $5D
            DB    $00
            DB    $5D
            DB    $00
            DB    $3E
            DB    $00
            DB    $08
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $8F
            DB    $80
            DB    $80
            DB    $8A
            DB    $9F
            DB    $80
            DB    $8A
            DB    $85
            DB    $80
            DB    $AA
            DB    $85
            DB    $80
            DB    $AA
            DB    $85
            DB    $80
            DB    $A9
            DB    $89
            DB    $80
            DB    $F9
            DB    $89
            DB    $80
            DB    $AD
            DB    $8B
            DB    $80
            DB    $F6
            DB    $86
            DB    $80
            DB    $A0
            DB    $80
            DB    $80
            DB    $A8
            DB    $81
            DB    $80
            DB    $FC
            DB    $83
            DB    $80
            DB    $A8
            DB    $81
            DB    $80
            DB    $80
            DB    $8F
            DB    $80
            DB    $8F
            DB    $85
            DB    $80
            DB    $8A
            DB    $85
            DB    $80
            DB    $AA
            DB    $85
            DB    $80
            DB    $AA
            DB    $85
            DB    $80
            DB    $A9
            DB    $89
            DB    $80
            DB    $F9
            DB    $89
            DB    $80
            DB    $AD
            DB    $8B
            DB    $80
            DB    $F6
            DB    $86
            DB    $80
            DB    $A0
            DB    $80
            DB    $80
            DB    $A8
            DB    $81
            DB    $80
            DB    $FC
            DB    $83
            DB    $80
            DB    $A8
            DB    $81
            DB    $80
            DB    $18
            DB    $00
            DB    $08
            DB    $00
            DB    $08
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $1F
            DB    $00
            DB    $1F
            DB    $00
            DB    $0E
            DB    $00
            DB    $1E
            DB    $00
            DB    $1C
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $3C
            DB    $00
            DB    $14
            DB    $00
            DB    $14
            DB    $00
            DB    $1C
            DB    $00
            DB    $3E
            DB    $00
            DB    $3F
            DB    $00
            DB    $1F
            DB    $00
            DB    $0E
            DB    $00
            DB    $1E
            DB    $00
            DB    $1C
            DB    $00
            DB    $0C
            DB    $00
            DB    $08
            DB    $00
            DB    $08
            DB    $00
            DB    $1C
            DB    $00
            DB    $1C
            DB    $00
            DB    $7C
            DB    $00
            DB    $7C
            DB    $00
            DB    $38
            DB    $00
            DB    $3C
            DB    $00
            DB    $1C
            DB    $00
            DB    $1E
            DB    $00
            DB    $14
            DB    $00
            DB    $14
            DB    $00
            DB    $1C
            DB    $00
            DB    $3E
            DB    $00
            DB    $7E
            DB    $00
            DB    $7C
            DB    $00
            DB    $38
            DB    $00
            DB    $3C
            DB    $00
            DB    $1C
            DB    $00
            DB    $14
            DB    $10
            DB    $00
            DB    $02
            DB    $28
            DB    $00
            DB    $04
            DB    $04
            DB    $00
            DB    $08
            DB    $02
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $55
            DB    $2A
            DB    $00
            DB    $56
            DB    $12
            DB    $00
            DB    $54
            DB    $08
            DB    $00
            DB    $14
            DB    $08
            DB    $00
            DB    $14
            DB    $0A
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $D0
            DB    $82
            DB    $80
            DB    $40
            DB    $02
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $55
            DB    $2A
            DB    $00
            DB    $52
            DB    $1A
            DB    $00
            DB    $44
            DB    $0A
            DB    $00
            DB    $04
            DB    $0A
            DB    $00
            DB    $14
            DB    $0A
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $D0
            DB    $82
            DB    $80
            DB    $02
            DB    $0A
            DB    $00
            DB    $05
            DB    $10
            DB    $00
            DB    $08
            DB    $08
            DB    $00
            DB    $10
            DB    $04
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $55
            DB    $2A
            DB    $00
            DB    $52
            DB    $1A
            DB    $00
            DB    $44
            DB    $0A
            DB    $00
            DB    $04
            DB    $0A
            DB    $00
            DB    $14
            DB    $0A
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $D0
            DB    $82
            DB    $80
            DB    $50
            DB    $00
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $40
            DB    $00
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $55
            DB    $2A
            DB    $00
            DB    $56
            DB    $12
            DB    $00
            DB    $54
            DB    $08
            DB    $00
            DB    $14
            DB    $08
            DB    $00
            DB    $14
            DB    $0A
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $D0
            DB    $82
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
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $05
            DB    $00
            DB    $00
            DB    $01
            DB    $00
            DB    $28
            DB    $01
            DB    $00
            DB    $20
            DB    $01
            DB    $00
            DB    $57
            DB    $3A
            DB    $00
            DB    $57
            DB    $3A
            DB    $00
            DB    $57
            DB    $3A
            DB    $00
            DB    $53
            DB    $32
            DB    $00
            DB    $53
            DB    $32
            DB    $00
            DB    $53
            DB    $32
            DB    $00
            DB    $5F
            DB    $3E
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $D0
            DB    $82
            DB    $80
            DB    $28
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            DB    $00
            DB    $20
            DB    $05
            DB    $00
            DB    $20
            DB    $01
            DB    $00
            DB    $57
            DB    $3A
            DB    $00
            DB    $57
            DB    $3A
            DB    $00
            DB    $57
            DB    $3A
            DB    $00
            DB    $53
            DB    $32
            DB    $00
            DB    $53
            DB    $32
            DB    $00
            DB    $53
            DB    $32
            DB    $00
            DB    $5F
            DB    $3E
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $D0
            DB    $82
            DB    $80
            DB    $D0
            DB    $82
            DB    $80
            DB    $94
            DB    $8A
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $85
            DB    $A8
            DB    $80
            DB    $81
            DB    $A0
            DB    $80
            DB    $C1
            DB    $A0
            DB    $80
            DB    $D1
            DB    $A2
            DB    $80
            DB    $C1
            DB    $A0
            DB    $80
            DB    $81
            DB    $A0
            DB    $80
            DB    $85
            DB    $A8
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $94
            DB    $8A
            DB    $80
            DB    $D0
            DB    $82
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $D0
            DB    $82
            DB    $80
            DB    $94
            DB    $8A
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $85
            DB    $A8
            DB    $80
            DB    $81
            DB    $A0
            DB    $80
            DB    $C1
            DB    $A0
            DB    $80
            DB    $81
            DB    $A0
            DB    $80
            DB    $85
            DB    $A8
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $94
            DB    $8A
            DB    $80
            DB    $D0
            DB    $82
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C0
            DB    $80
            DB    $80
            DB    $D0
            DB    $82
            DB    $80
            DB    $94
            DB    $8A
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $94
            DB    $8A
            DB    $80
            DB    $D0
            DB    $82
            DB    $80
            DB    $C0
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $5E
            DB    $07
            DB    $00
            DB    $08
            DB    $01
            DB    $00
            DB    $28
            DB    $01
            DB    $00
            DB    $28
            DB    $01
            DB    $00
            DB    $23
            DB    $0C
            DB    $00
            DB    $7E
            DB    $07
            DB    $00
            DB    $23
            DB    $0C
            DB    $00
            DB    $50
            DB    $00
            DB    $00
            DB    $56
            DB    $06
            DB    $00
            DB    $2C
            DB    $03
            DB    $00
            DB    $58
            DB    $01
            DB    $00
            DB    $70
            DB    $00
            DB    $00
            DB    $20
            DB    $00
            DB    $00
            DB    $08
            DB    $00
            DB    $08
            DB    $00
            DB    $08
            DB    $00
            DB    $7F
            DB    $00
            DB    $08
            DB    $00
            DB    $08
            DB    $00
            DB    $08
            DB    $00
            DB    $00
            DB    $00
            DB    $41
            DB    $00
            DB    $22
            DB    $00
            DB    $14
            DB    $00
            DB    $08
            DB    $00
            DB    $14
            DB    $00
            DB    $22
            DB    $00
            DB    $41
            DB    $00
            DB    $00
            DB    $14
            DB    $00
            DB    $00
            DB    $04
            DB    $00
            DB    $00
            DB    $04
            DB    $00
            DB    $00
            DB    $34
            DB    $00
            DB    $00
            DB    $04
            DB    $00
            DB    $F0
            DB    $8A
            DB    $80
            DB    $DC
            DB    $AA
            DB    $80
            DB    $F7
            DB    $BE
            DB    $80
            DB    $D5
            DB    $AB
            DB    $80
            DB    $F7
            DB    $AA
            DB    $80
            DB    $DD
            DB    $BB
            DB    $80
            DB    $D4
            DB    $AE
            DB    $80
            DB    $D0
            DB    $8B
            DB    $80
            DB    $40
            DB    $32
            DB    $00
            DB    $00
            DB    $09
            DB    $00
            DB    $00
            DB    $04
            DB    $00
            DB    $00
            DB    $34
            DB    $00
            DB    $00
            DB    $04
            DB    $00
            DB    $A0
            DB    $8A
            DB    $80
            DB    $C8
            DB    $AA
            DB    $80
            DB    $A2
            DB    $BE
            DB    $80
            DB    $95
            DB    $A9
            DB    $80
            DB    $A2
            DB    $AA
            DB    $80
            DB    $89
            DB    $91
            DB    $80
            DB    $D4
            DB    $A4
            DB    $80
            DB    $90
            DB    $89
            DB    $80
            DB    $0A
            DB    $00
            DB    $00
            DB    $08
            DB    $00
            DB    $00
            DB    $08
            DB    $00
            DB    $00
            DB    $0B
            DB    $00
            DB    $00
            DB    $08
            DB    $00
            DB    $00
            DB    $D4
            DB    $83
            DB    $80
            DB    $D5
            DB    $8E
            DB    $80
            DB    $DF
            DB    $BB
            DB    $80
            DB    $F5
            DB    $AA
            DB    $80
            DB    $D5
            DB    $BB
            DB    $80
            DB    $F7
            DB    $AE
            DB    $80
            DB    $DD
            DB    $8A
            DB    $80
            DB    $F4
            DB    $82
            DB    $80
            DB    $53
            DB    $00
            DB    $00
            DB    $24
            DB    $00
            DB    $00
            DB    $08
            DB    $00
            DB    $00
            DB    $0B
            DB    $00
            DB    $00
            DB    $08
            DB    $00
            DB    $00
            DB    $94
            DB    $81
            DB    $80
            DB    $D5
            DB    $84
            DB    $80
            DB    $9F
            DB    $91
            DB    $80
            DB    $A5
            DB    $AA
            DB    $80
            DB    $95
            DB    $91
            DB    $80
            DB    $A2
            DB    $A4
            DB    $80
            DB    $C9
            DB    $8A
            DB    $80
            DB    $A4
            DB    $82
            DB    $80
            DB    $7E
            DB    $07
            DB    $00
            DB    $23
            DB    $0C
            DB    $00
            DB    $2E
            DB    $07
            DB    $00
            DB    $2E
            DB    $07
            DB    $00
            DB    $0B
            DB    $0D
            DB    $00
            DB    $0B
            DB    $0D
            DB    $00
            DB    $0B
            DB    $0D
            DB    $00
            DB    $06
            DB    $06
            DB    $00
            DB    $5C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $78
            DB    $01
            DB    $00
            DB    $70
            DB    $01
            DB    $00
            DB    $18
            DB    $03
            DB    $00
            DB    $58
            DB    $01
            DB    $00
            DB    $58
            DB    $01
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $58
            DB    $01
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $78
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $78
            DB    $03
            DB    $00
            DB    $0C
            DB    $06
            DB    $00
            DB    $2C
            DB    $03
            DB    $00
            DB    $2C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $06
            DB    $06
            DB    $00
            DB    $06
            DB    $06
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $58
            DB    $01
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $78
            DB    $01
            DB    $00
            DB    $78
            DB    $00
            DB    $00
            DB    $4C
            DB    $01
            DB    $00
            DB    $58
            DB    $01
            DB    $00
            DB    $58
            DB    $01
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $58
            DB    $01
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $78
            DB    $01
            DB    $00
            DB    $7C
            DB    $01
            DB    $00
            DB    $06
            DB    $03
            DB    $00
            DB    $2C
            DB    $03
            DB    $00
            DB    $2C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $06
            DB    $06
            DB    $00
            DB    $06
            DB    $06
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $58
            DB    $01
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $78
            DB    $01
            DB    $00
            DB    $3E
            DB    $00
            DB    $00
            DB    $63
            DB    $07
            DB    $00
            DB    $2E
            DB    $0C
            DB    $00
            DB    $2E
            DB    $07
            DB    $00
            DB    $0B
            DB    $0D
            DB    $00
            DB    $0B
            DB    $0D
            DB    $00
            DB    $0B
            DB    $0D
            DB    $00
            DB    $06
            DB    $06
            DB    $00
            DB    $5C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $78
            DB    $01
            DB    $00
            DB    $60
            DB    $07
            DB    $00
            DB    $3E
            DB    $0C
            DB    $00
            DB    $23
            DB    $07
            DB    $00
            DB    $2E
            DB    $07
            DB    $00
            DB    $0B
            DB    $0D
            DB    $00
            DB    $0B
            DB    $0D
            DB    $00
            DB    $0B
            DB    $0D
            DB    $00
            DB    $06
            DB    $06
            DB    $00
            DB    $5C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $0C
            DB    $03
            DB    $00
            DB    $78
            DB    $01
            DB    $00
            DB    $F0
            DB    $FF
            DB    $FF
            DB    $F5
            DB    $E0
            DB    $FF
            DB    $F5
            DB    $FA
            DB    $FF
            DB    $D5
            DB    $FA
            DB    $FF
            DB    $D5
            DB    $FA
            DB    $FF
            DB    $D6
            DB    $F6
            DB    $FF
            DB    $86
            DB    $F6
            DB    $FF
            DB    $D2
            DB    $F4
            DB    $FF
            DB    $89
            DB    $F9
            DB    $FF
            DB    $DF
            DB    $FF
            DB    $FF
            DB    $D7
            DB    $FE
            DB    $FF
            DB    $83
            DB    $FC
            DB    $FF
            DB    $D7
            DB    $FE
            DB    $FF
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $FF
            DB    $F0
            DB    $FF
            DB    $F0
            DB    $FA
            DB    $FF
            DB    $F5
            DB    $FA
            DB    $FF
            DB    $D5
            DB    $FA
            DB    $FF
            DB    $D5
            DB    $FA
            DB    $FF
            DB    $D6
            DB    $F6
            DB    $FF
            DB    $86
            DB    $F6
            DB    $FF
            DB    $D2
            DB    $F4
            DB    $FF
            DB    $89
            DB    $F9
            DB    $FF
            DB    $DF
            DB    $FF
            DB    $FF
            DB    $D7
            DB    $FE
            DB    $FF
            DB    $83
            DB    $FC
            DB    $FF
            DB    $D7
            DB    $FE
            DB    $FF
            DB    $84
            DB    $88
            DB    $80
            DB    $85
            DB    $A8
            DB    $80
            DB    $81
            DB    $A0
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C0
            DB    $80
            DB    $80
            DB    $90
            DB    $82
            DB    $80
            DB    $90
            DB    $82
            DB    $80
            DB    $90
            DB    $82
            DB    $80
            DB    $C0
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $81
            DB    $A0
            DB    $80
            DB    $85
            DB    $A8
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $67
            DB    $00
            DB    $77
            DB    $00
            DB    $77
            DB    $00
            DB    $63
            DB    $00
            DB    $63
            DB    $00
            DB    $63
            DB    $00
            DB    $63
            DB    $00
            DB    $77
            DB    $00
            DB    $63
            DB    $00
            DB    $63
            DB    $00
            DB    $73
            DB    $00
            DB    $77
            DB    $00
            DB    $77
            DB    $00
            DB    $63
            DB    $00
            DB    $63
            DB    $00
            DB    $63
            DB    $00
            DB    $63
            DB    $00
            DB    $77
            DB    $00
            DB    $63
            DB    $00
            DB    $63
            DB    $00
            DB    $49
            DB    $00
            DB    $6B
            DB    $00
            DB    $6B
            DB    $00
            DB    $22
            DB    $00
            DB    $22
            DB    $00
            DB    $22
            DB    $00
            DB    $41
            DB    $00
            DB    $77
            DB    $00
            DB    $63
            DB    $00
            DB    $63
            DB    $00
            DB    $67
            DB    $00
            DB    $77
            DB    $00
            DB    $77
            DB    $00
            DB    $63
            DB    $00
            DB    $63
            DB    $00
            DB    $60
            DB    $00
            DB    $60
            DB    $00
            DB    $71
            DB    $00
            DB    $61
            DB    $00
            DB    $63
            DB    $00
            DB    $73
            DB    $00
            DB    $77
            DB    $00
            DB    $77
            DB    $00
            DB    $63
            DB    $00
            DB    $63
            DB    $00
            DB    $03
            DB    $00
            DB    $03
            DB    $00
            DB    $47
            DB    $00
            DB    $43
            DB    $00
            DB    $63
            DB    $00
            DB    $49
            DB    $00
            DB    $6B
            DB    $00
            DB    $6B
            DB    $00
            DB    $22
            DB    $00
            DB    $22
            DB    $00
            DB    $22
            DB    $00
            DB    $00
            DB    $00
            DB    $41
            DB    $00
            DB    $41
            DB    $00
            DB    $63
            DB    $00
            DB    $E4
            DB    $8F
            DB    $80
            DB    $82
            DB    $80
            DB    $80
            DB    $81
            DB    $80
            DB    $80
            DB    $CE
            DB    $9F
            DB    $80
            DB    $C0
            DB    $80
            DB    $80
            DB    $D4
            DB    $8A
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $E4
            DB    $89
            DB    $80
            DB    $F4
            DB    $8B
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $D4
            DB    $8A
            DB    $80
            DB    $C0
            DB    $80
            DB    $80
            DB    $D0
            DB    $82
            DB    $80
            DB    $90
            DB    $82
            DB    $80
            DB    $D0
            DB    $82
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
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $F8
            DB    $83
            DB    $80
            DB    $80
            DB    $90
            DB    $80
            DB    $81
            DB    $A0
            DB    $80
            DB    $BE
            DB    $9E
            DB    $80
            DB    $C0
            DB    $80
            DB    $80
            DB    $D4
            DB    $8A
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $E4
            DB    $89
            DB    $80
            DB    $F4
            DB    $8B
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $D4
            DB    $8A
            DB    $80
            DB    $C0
            DB    $80
            DB    $80
            DB    $D0
            DB    $82
            DB    $80
            DB    $90
            DB    $82
            DB    $80
            DB    $D0
            DB    $82
            DB    $80
            DB    $FC
            DB    $8C
            DB    $80
            DB    $82
            DB    $90
            DB    $80
            DB    $80
            DB    $A0
            DB    $80
            DB    $FC
            DB    $99
            DB    $80
            DB    $C0
            DB    $80
            DB    $80
            DB    $D4
            DB    $8A
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $E4
            DB    $89
            DB    $80
            DB    $F4
            DB    $8B
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $D4
            DB    $8A
            DB    $80
            DB    $C0
            DB    $80
            DB    $80
            DB    $D0
            DB    $82
            DB    $80
            DB    $B0
            DB    $83
            DB    $80
            DB    $D0
            DB    $82
            DB    $80
            DB    $9C
            DB    $8F
            DB    $80
            DB    $82
            DB    $90
            DB    $80
            DB    $81
            DB    $A0
            DB    $80
            DB    $F2
            DB    $87
            DB    $80
            DB    $C0
            DB    $80
            DB    $80
            DB    $D4
            DB    $8A
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $E4
            DB    $89
            DB    $80
            DB    $F4
            DB    $8B
            DB    $80
            DB    $84
            DB    $88
            DB    $80
            DB    $D4
            DB    $8A
            DB    $80
            DB    $C0
            DB    $80
            DB    $80
            DB    $D0
            DB    $82
            DB    $80
            DB    $B0
            DB    $83
            DB    $80
            DB    $D0
            DB    $82
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
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $20
            DB    $01
            DB    $00
            DB    $60
            DB    $01
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $50
            DB    $02
            DB    $00
            DB    $30
            DB    $03
            DB    $00
            DB    $50
            DB    $02
            DB    $00
            DB    $30
            DB    $03
            DB    $00
            DB    $50
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
            DB    $54
            DB    $0A
            DB    $00
            DB    $0C
            DB    $0C
            DB    $00
            DB    $14
            DB    $0B
            DB    $00
            DB    $34
            DB    $09
            DB    $00
            DB    $44
            DB    $08
            DB    $00
            DB    $24
            DB    $0B
            DB    $00
            DB    $34
            DB    $0A
            DB    $00
            DB    $0C
            DB    $0C
            DB    $00
            DB    $54
            DB    $0A
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $55
            DB    $2A
            DB    $00
            DB    $33
            DB    $33
            DB    $00
            DB    $65
            DB    $29
            DB    $00
            DB    $49
            DB    $24
            DB    $00
            DB    $53
            DB    $32
            DB    $00
            DB    $27
            DB    $39
            DB    $00
            DB    $55
            DB    $2A
            DB    $00
            DB    $27
            DB    $39
            DB    $00
            DB    $53
            DB    $32
            DB    $00
            DB    $49
            DB    $24
            DB    $00
            DB    $65
            DB    $29
            DB    $00
            DB    $33
            DB    $33
            DB    $00
            DB    $55
            DB    $2A
            DB    $00
            DB    $08
            DB    $00
            DB    $2A
            DB    $00
            DB    $3E
            DB    $00
            DB    $5D
            DB    $00
            DB    $3E
            DB    $00
            DB    $2A
            DB    $00
            DB    $08
            DB    $00
            DB    $14
            DB    $00
            DB    $08
            DB    $00
            DB    $5D
            DB    $00
            DB    $36
            DB    $00
            DB    $5D
            DB    $00
            DB    $08
            DB    $00
            DB    $14
            DB    $00
            DB    $77
            DB    $6E
            DB    $01
            DB    $52
            DB    $2A
            DB    $01
            DB    $52
            DB    $2A
            DB    $01
            DB    $53
            DB    $2A
            DB    $01
            DB    $72
            DB    $6E
            DB    $01
            DB    $77
            DB    $6E
            DB    $01
            DB    $51
            DB    $2A
            DB    $01
            DB    $57
            DB    $2A
            DB    $01
            DB    $54
            DB    $2A
            DB    $01
            DB    $77
            DB    $6E
            DB    $01
            DB    $77
            DB    $6E
            DB    $01
            DB    $54
            DB    $2A
            DB    $01
            DB    $56
            DB    $2A
            DB    $01
            DB    $54
            DB    $2A
            DB    $01
            DB    $77
            DB    $6E
            DB    $01
            DB    $74
            DB    $6E
            DB    $01
            DB    $57
            DB    $2A
            DB    $01
            DB    $55
            DB    $2A
            DB    $01
            DB    $51
            DB    $2A
            DB    $01
            DB    $71
            DB    $6E
            DB    $01
            DB    $77
            DB    $6E
            DB    $01
            DB    $54
            DB    $2A
            DB    $01
            DB    $57
            DB    $2A
            DB    $01
            DB    $51
            DB    $2A
            DB    $01
            DB    $77
            DB    $6E
            DB    $01
            DB    $03
            DB    $30
            DB    $63
            DB    $31
            DB    $74
            DB    $0B
            DB    $18
            DB    $06
            DB    $70
            DB    $03
            DB    $78
            DB    $07
            DB    $4C
            DB    $0C
            DB    $4C
            DB    $0C
            DB    $78
            DB    $07
            DB    $74
            DB    $0B
            DB    $03
            DB    $30
            DB    $03
            DB    $30
            DB    $03
            DB    $10
            DB    $23
            DB    $31
            DB    $54
            DB    $0B
            DB    $08
            DB    $04
            DB    $70
            DB    $02
            DB    $38
            DB    $07
            DB    $4C
            DB    $08
            DB    $4C
            DB    $0C
            DB    $70
            DB    $06
            DB    $30
            DB    $03
            DB    $01
            DB    $30
            DB    $02
            DB    $10
            DB    $01
            DB    $10
            DB    $22
            DB    $21
            DB    $54
            DB    $0A
            DB    $18
            DB    $04
            DB    $10
            DB    $03
            DB    $08
            DB    $04
            DB    $74
            DB    $0B
            DB    $4C
            DB    $0C
            DB    $60
            DB    $06
            DB    $24
            DB    $0A
            DB    $01
            DB    $10
            DB    $02
            DB    $20
            DB    $02
            DB    $10
            DB    $21
            DB    $21
            DB    $20
            DB    $02
            DB    $18
            DB    $04
            DB    $10
            DB    $03
            DB    $28
            DB    $02
            DB    $04
            DB    $08
            DB    $48
            DB    $04
            DB    $50
            DB    $04
            DB    $04
            DB    $0A
            DB    $00
            DB    $20
            DB    $02
            DB    $10
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $81
            DB    $FF
            DB    $FF
            DB    $BF
            DB    $80
            DB    $FF
            DB    $FF
            DB    $BF
            DB    $80
            DB    $FF
            DB    $FF
            DB    $BF
            DB    $80
            DB    $FF
            DB    $9F
            DB    $FC
            DB    $87
            DB    $80
            DB    $80
            DB    $FF
            DB    $FF
            DB    $BF
            DB    $E0
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $C1
            DB    $FF
            DB    $C0
            DB    $FF
            DB    $C0
            DB    $FF
            DB    $C0
            DB    $FF
            DB    $C0
            DB    $FF
            DB    $C0
            DB    $FF
            DB    $C0
            DB    $FF
            DB    $9F
            DB    $FC
            DB    $87
            DB    $80
            DB    $C0
            DB    $FF
            DB    $C0
            DB    $FF
            DB    $E0
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $9F
            DB    $FC
            DB    $87
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $9F
            DB    $FC
            DB    $87
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $9F
            DB    $FC
            DB    $87
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $83
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $F0
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $83
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $E0
            DB    $FF
            DB    $83
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $F8
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $E0
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $F8
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $E0
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $F8
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $E0
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $F8
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $E0
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $F8
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FC
            DB    $87
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $F8
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FC
            DB    $87
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $80
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $F8
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FC
            DB    $CF
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $8F
            DB    $80
            DB    $C0
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $F8
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FC
            DB    $FF
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $C0
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $9F
            DB    $80
            DB    $E0
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $F8
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $BF
            DB    $80
            DB    $FC
            DB    $FF
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $87
            DB    $FF
            DB    $E1
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $C0
            DB    $FF
            DB    $CF
            DB    $FF
            DB    $E0
            DB    $FF
            DB    $FC
            DB    $FF
            DB    $C0
            DB    $FF
            DB    $CF
            DB    $FF
            DB    $E0
            DB    $BF
            DB    $80
            DB    $F8
            DB    $FF
            DB    $FF
            DB    $C0
            DB    $FF
            DB    $CF
            DB    $FF
            DB    $C0
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $81
            DB    $80
            DB    $FC
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $BF
            DB    $80
            DB    $FF
            DB    $FF
            DB    $BF
            DB    $E0
            DB    $FF
            DB    $FF
            DB    $BF
            DB    $80
            DB    $FF
            DB    $FF
            DB    $BF
            DB    $E0
            DB    $BF
            DB    $80
            DB    $F0
            DB    $FF
            DB    $BF
            DB    $80
            DB    $FF
            DB    $FF
            DB    $BF
            DB    $80
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $80
            DB    $80
            DB    $FC
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $8F
            DB    $80
            DB    $FC
            DB    $FF
            DB    $81
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C0
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C0
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C0
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C0
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C0
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C0
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $87
            DB    $80
            DB    $F8
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $E0
            DB    $BF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FC
            DB    $8F
            DB    $80
            DB    $FC
            DB    $FF
            DB    $83
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C0
            DB    $9F
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $C0
            DB    $9F
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $F8
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $81
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $F0
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $FF
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $80
            DB    $FF
            DB    $FF
            DB    $FF

	DS    \

*-----------------------
* WE ARE AT $9000 NOW
*-----------------------

L9000	=	*
