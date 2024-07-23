*
* Bubble Bobble
*
* (c) 1988, Taito
* (s) 2020, Antoine Vignau
*

	mx	%11
	org	$9800
	lst	off

*-------------------------------

CYAREG EQU $C036
TXTSET EQU $C051

*-------------------------------

L9800    JSR   L98C5
         LDA   #$00
         STA   $F1
         LDA   #$01
         STA   $F2
L980B    LDA   #$00
         STA   $F0
L980F    LDA   $F0
         STA   $0A05
         LDA   $F2
         STA   $0A04
         LDA   #$00
         STA   $0A08
         LDA   #$0C
         CLC
         ADC   $F1
         STA   $0A09
         JSR   L9841
         INC   $F1
         LDA   $F1
         CMP   #$8B
         BEQ   L983E
         INC   $F0
         LDA   $F0
         CMP   #$10
         BNE   L980F
         INC   $F2
         JMP   L980B
L983E    JMP   $6000	; play game

L9841    LDA   #$01
         STA   $0A00
         STA   $0A02
         STA   $0A0C
         STA   $0A10
         STA   $0B01
         LDA   #$60
         STA   $0A01
         STA   $0A0F
         LDA   #$00
         STA   $0A03
         STA   $0A0B
         STA   $0A0E
         STA   $0B00
         STA   $0A06
         LDA   #$0B
         STA   $0A07
         LDA   #$D8
         STA   $0B02
         LDA   #$EF
         STA   $0B03
         LDY   #$00
         LDA   #$0A
         JSR   $B7B5
         LDA   #$00
         STA   $48
         RTS

L9886    LDA   #$01
         STA   $0A00
         STA   $0A02
         STA   $0A10
         STA   $0B01
         LDA   #$60
         STA   $0A01
         STA   $0A0F
         LDA   #$00
         STA   $0A0C
         STA   $0B00
         STA   $0A06
         STA   $0A0E
         LDA   #$0B
         STA   $0A07
         LDA   #$D8
         STA   $0B02
         LDA   #$EF
         STA   $0B03
         LDY   #$00
         LDA   #$0A
         JSR   $B7B5
         LDA   #$00
         STA   $48
         RTS

L98C5    LDA   CYAREG	; IIgs slow
         AND   #$7F
         STA   CYAREG
         LDA   #$00
         STA   L994C
         JSR   L98EE	; call protection
         LDA   L994D
         BEQ   L98DD
         JMP   L9C1A	; copy, reboot
L98DD    RTS		; original, return

L98DE    ASC   "0123456789ABCDEF"

L98EE    LDA   #$21	; go to T21
         STA   $0A04
         JSR   L9886
         LDA   #$00
         STA   L994E
         STA   L994D
         LDY   #$0F
L9900    STA   L994F,Y
         DEY
         BPL   L9900
         JSR   L990A
         RTS

L990A    JSR   L9960
         INC   L994D
         LDA   #$19
         STA   L99D0
         STA   L99DE
         JSR   L996E
         BCS   L994A
         LDA   L9B1A+$5B
         CMP   #$99
         BNE   L994A
         LDA   #$59
         STA   L99D0
         STA   L99DE
         JSR   L996E
         LDX   #$00
         LDY   #$0F
L9933    LDA   L9B1A+$5B,Y
         BEQ   L9939
         INX
L9939    DEY
         BPL   L9933
         INC   L994F,X
         CPX   #$03
         BCC   L994A
         DEC   L994D
         INC   L994E
         RTS
L994A    RTS

         DB    $00
L994C    DB    $00
L994D    DB    $00
L994E    DB    $00
L994F    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00

L9960    LDA   #$00
         LDY   #$00
L9964    STA   L9A1A,Y
         STA   L9B1A,Y
         INY
         BNE   L9964
         RTS

L996E    LDX   #$60
         CMP   $C08E,X
         LDA   #$C0
         STA   L99F4
         STA   L99F5
L997B    INC   L99F4
         BNE   L9988
         INC   L99F5
         BNE   L9988
         JMP   L99EC

L9988    LDA   $C08C,X
         BPL   L9988
         CMP   #$D5
         BNE   L997B
L9991    LDA   $C08C,X
         BPL   L9991
         CMP   #$AA
         BNE   L997B
L999A    LDA   $C08C,X
         BPL   L999A
         CMP   #$96
         BNE   L997B
         JSR   L9A05
         JSR   L9A05
         CMP   #$21
         STA   L994C
         BNE   L997B
         JSR   L9A05
         CMP   #$0F
         BNE   L997B
L99B7    LDA   $C08C,X
         BPL   L99B7
L99BC    CMP   #$D5
         BNE   L99B7
L99C0    LDA   $C08C,X
         BPL   L99C0
         CMP   #$AA
         BNE   L99BC
         LDY   #$00
L99CB    LDA   $C08C,X
         BPL   L99CB
L99D0    ORA   L9A1A,Y
         STA   L9A1A,Y
         INY
         BNE   L99CB
L99D9    LDA   $C08C,X
         BPL   L99D9
L99DE    ORA   L9B1A,Y
         STA   L9B1A,Y
         INY
         BNE   L99D9
         JSR   L99FF
         CLC
         RTS

L99EC    JSR   L9960
         JSR   L99FF
         SEC
         RTS

L99F4    DB    $00
L99F5    DB    $00

         LDY   #$01
         LDA   ($F0),Y
         TAX
         CMP   $C089,X
         RTS

L99FF    LDX   #$60
         CMP   $C088,X
         RTS

L9A05    LDA   $C08C,X
         BPL   L9A05
         SEC
         ROL
         STA   L9A14+1
L9A0F    LDA   $C08C,X
         BPL   L9A0F
L9A14    AND   #$00
         STA   L9A14+1
         RTS

L9A1A    DS    $100
L9B1A    DS    $100

L9C1A    LDA   TXTSET	; reset, please, I have a copy
         LDA   L994C
         LSR
         LSR
         LSR
         LSR
         TAX
         LDA   L98DE,X
         STA   $0400
         LDA   L994C
         AND   #$0F
         TAX
         LDA   L98DE,X
         STA   $0401
         LDA   #$A0
         STA   $0402
         LDA   #$3B
         LDX   #$00
         STX   $50
         LDX   #$02
         STX   $51
         LDY   #$00
L9C48    LDA   #$A0
         STA   ($50),Y
         INC   $50
         BNE   L9C52
         INC   $51
L9C52    LDX   $51
         CPX   #$9C
         BCC   L9C48
L9C58    CMP   #$13
         BEQ   L9C5E
         BNE   L9C58
L9C5E    CMP   $52
         BNE   L9C58
         DS    $9E
         DS    $100
         DS    $100
         DS    $100
