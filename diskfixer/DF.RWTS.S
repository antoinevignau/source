*
* RWTS 3.3
*
* SOURCE CODE BY LOGO 2007
*

* ORG $B700
              LST   OFF
              MX    %11

*
*
*

NB_TRACK      =     $23
NB_SECTOR     =     $10

*
*
*

LB700         STX   RWTS+$1
              STX   RWTS+$F
              TXA
              LSR
              LSR
              LSR
              LSR
              TAX
              LDA   #$00
              STA   $04F8,X
              STA   $0478,X
              RTS

              DS    $A0

*
* CALLER ENTRY
*

RWTS_ENTRY    PHP
              SEI
              JSR   LBD00
              BCS   LB7BF
              PLP
              CLC
              RTS
LB7BF         PLP
              SEC
              RTS

              DS    $26

RWTS          DB    $01
RWTS_SLOT     DB    $60           ; SLOT
RWTS_DRIVE    DB    $01
RWTS_VOLUME   DB    $FE           ; VOLUME
RWTS_TRACK    DB    $00           ; TRACK
RWTS_SECTOR   DB    $01           ; SECTOR
              DA    RWTS_DCT
RWTS_BUFFER   DA    $B700         ; BUFFER
              DB    $00
              DB    $00
RWTS_COMMAND  DB    $01
RWTS_ERROR    DB    $00
RWTS_OVOLUME  DB    $FE
RWTS_OSLOT    DB    $60
RWTS_ODRIVE   DB    $01
              DB    $00
              DB    $00
RWTS_DCT      HEX   0001EFD8
              DB    $00

*
*
*

LB800         LDX   #$00
              LDY   #$02
LB804         DEY
              LDA   ($3E),Y
              LSR
              ROL   LBC00,X
              LSR
              ROL   LBC00,X
              STA   LBB00,Y
              INX
              CPX   #$56
              BCC   LB804
              LDX   #$00
              TYA
              BNE   LB804
              LDX   #$55
LB81E         LDA   LBC00,X
              AND   #$3F
              STA   LBC00,X
              DEX
              BPL   LB81E
              RTS

LB82A         SEC
              STX   $27
              STX   $0678
              LDA   $C08D,X
              LDA   $C08E,X
              BMI   LB8B4
              LDA   LBC00
              STA   $26
              LDA   #$FF
              STA   $C08F,X
              ORA   $C08C,X
              PHA
              PLA
              NOP
              LDY   #$04
LB84A         PHA
              PLA
              JSR   LB8B9
              DEY
              BNE   LB84A
LB852         LDA   #$D5
              JSR   LB8B8
LB857         LDA   #$AA
              JSR   LB8B8
LB85C         LDA   #$AD
              JSR   LB8B8
              TYA
              LDY   #$56
              BNE   LB869
LB866         LDA   LBC00,Y
LB869         EOR   LBC00-1,Y
              TAX
              LDA   LBA29,X
              LDX   $27
              STA   $C08D,X
              LDA   $C08C,X
              DEY
              BNE   LB866
              LDA   $26
              NOP
LB87E         EOR   LBB00,Y
              TAX
              LDA   LBA29,X
              LDX   $0678
              STA   $C08D,X
              LDA   $C08C,X
              LDA   LBB00,Y
              INY
              BNE   LB87E
              TAX
              LDA   LBA29,X
              LDX   $27
              JSR   LB8BB
LB89D         LDA   #$DE
              JSR   LB8B8
LB8A2         LDA   #$AA
              JSR   LB8B8
LB8A7         LDA   #$EB
              JSR   LB8B8
              LDA   #$FF
              JSR   LB8B8
              LDA   $C08E,X
LB8B4         LDA   $C08C,X
              RTS

LB8B8         CLC
LB8B9         PHA
              PLA
LB8BB         STA   $C08D,X
              ORA   $C08C,X
              RTS

LB8C2         LDY   #$00
LB8C4         LDX   #$56
LB8C6         DEX
              BMI   LB8C4
              LDA   LBB00,Y
              LSR   LBC00,X
              ROL
              LSR   LBC00,X
              ROL
* EOR #$00
              STA   ($3E),Y
              INY
              CPY   $26
              BNE   LB8C6
              RTS

*
* READ DATA FIELD
*

LB8DC         LDY   #$20
LB8DE         DEY
              BEQ   LB942
]LP           LDA   $C08C,X
              BPL   ]LP
LB8E6         EOR   #$D5
              BNE   LB8DE
              NOP
]LP           LDA   $C08C,X
              BPL   ]LP
LB8F0         CMP   #$AA
              BNE   LB8E6
              LDY   #$56
]LP           LDA   $C08C,X
              BPL   ]LP
LB8FB         CMP   #$AD
              BNE   LB8E6

              LDA   #$00
LB901         DEY
              STY   $26
]LP           LDY   $C08C,X
              BPL   ]LP
              EOR   LBA80-$80,Y
              LDY   $26
              STA   LBC00,Y
              BNE   LB901
LB913         STY   $26
]LP           LDY   $C08C,X
              BPL   ]LP
              EOR   LBA80-$80,Y
              LDY   $26
              STA   LBB00,Y
              INY
              BNE   LB913
]LP           LDY   $C08C,X
              BPL   ]LP
              CMP   LBA80-$80,Y
              BNE   LB942

]LP           LDA   $C08C,X
              BPL   ]LP
LB934         CMP   #$DE
              BNE   LB942
              NOP
]LP           LDA   $C08C,X
              BPL   ]LP
LB93E         CMP   #$AA
              BEQ   LB99E
LB942         SEC
              RTS

*
* READ HEADER FIELD
*

LB944         LDY   #$FC
              STY   $26
LB948         INY
              BNE   LB94F
              INC   $26
              BEQ   LB942
LB94F         LDA   $C08C,X
              BPL   LB94F
LB954         CMP   #$D5
              BNE   LB948
              NOP
]LP           LDA   $C08C,X
              BPL   ]LP
LB95E         CMP   #$AA
              BNE   LB954
              LDY   #$03
]LP           LDA   $C08C,X
              BPL   ]LP
LB969         CMP   #$96
              BNE   LB954

              LDA   #$00
LB96F         STA   $27
]LP           LDA   $C08C,X
              BPL   ]LP
              ROL
              STA   $26
]LP           LDA   $C08C,X
              BPL   ]LP
              AND   $26
              STA   |$002C,Y
              EOR   $27
              DEY
              BPL   LB96F
              TAY
              BNE   LB942

]LP           LDA   $C08C,X
              BPL   ]LP
LB990         CMP   #$DE
              BNE   LB942
              NOP
]LP           LDA   $C08C,X
              BPL   ]LP
LB99A         CMP   #$AA
              BNE   LB942
LB99E         CLC
              RTS

*
* MOVE ARM
*

LB9A0         STX   $2B
              STA   $2A
              CMP   $0478
              BEQ   LB9FC
              LDA   #$00
              STA   $26
LB9AD         LDA   $0478
              STA   $27
              SEC
              SBC   $2A
              BEQ   LB9EA
              BCS   LB9C0
              EOR   #$FF
              INC   $0478
              BCC   LB9C5
LB9C0         ADC   #$FE
              DEC   $0478
LB9C5         CMP   $26
              BCC   LB9CB
              LDA   $26
LB9CB         CMP   #$0C
              BCS   LB9D0
              TAY
LB9D0         SEC
              JSR   LB9EE
              LDA   LBA11,Y
              JSR   LBA00
              LDA   $27
              CLC
              JSR   LB9F1
              LDA   LBA1D,Y
              JSR   LBA00
              INC   $26
              BNE   LB9AD
LB9EA         JSR   LBA00
              CLC
LB9EE         LDA   $0478
LB9F1         AND   #$03
              ROL
              ORA   $2B
              TAX
              LDA   $C080,X
              LDX   $2B
LB9FC         RTS

              DS    3

LBA00         LDX   #$11
LBA02         DEX
              BNE   LBA02
              INC   $46
              BNE   LBA0B
              INC   $47
LBA0B         SEC
              SBC   #$01
              BNE   LBA00
              RTS

LBA11         HEX   01302824201E1D1C1C1C1C1C
LBA1D         HEX   702C26221F1E1D1C1C1C1C1C

* THE NIBBLE TABLE

LBA29         HEX   96979A9B9D9E9FA6A7ABACADAEAFB2B3
              HEX   B4B5B6B7B9BABBBCBDBEBFCBCDCECFD3
              HEX   D6D7D9DADBDCDDDEDFE5E6E7E9EAEBEC
              HEX   EDEEEFF2F3F4F5F6F7F9FAFBFCFDFEFF

              DS    $17

* INDEX IN THE NIBBLE TABLE

LBA80         DS    $16
LBA96         HEX   0001989902039C040506A0A1A2A3A4A5
              HEX   0708A8A9AA090A0B0C0DB0B10E0F1011
              HEX   1213B81415161718191AC0C1C2C3C4C5
              HEX   C6C7C8C9CA1BCC1C1D1ED0D1D21FD4D5
              HEX   2021D822232425262728E0E1E2E3E429
              HEX   2A2BE82C2D2E2F303132F0F133343536
              HEX   3738F8393A3B3C3D3E3F

LBB00         DS    $100
LBC00         DS    $56

*
* WRITE HEADER FIELD
*

LBC56         SEC
              LDA   $C08D,X
              LDA   $C08E,X
              BMI   LBCBD
              LDA   #$FF
              STA   $C08F,X
              CMP   $C08C,X
              PHA
              PLA
LBC69         JSR   LBCC3
              JSR   LBCC3
              STA   $C08D,X
              CMP   $C08C,X
              NOP
              DEY
              BNE   LBC69
LBC79         LDA   #$D5
              JSR   LBCD5
LBC7E         LDA   #$AA
              JSR   LBCD5
LBC83         LDA   #$96
              JSR   LBCD5
              LDA   $41
              JSR   LBCC4
              LDA   $44
              JSR   LBCC4
              LDA   $3F
              JSR   LBCC4
              LDA   $41
              EOR   $44
              EOR   $3F
              PHA
              LSR
              ORA   $3E
              STA   $C08D,X
              LDA   $C08C,X
              PLA
              ORA   #$AA
              JSR   LBCD4
LBCAD         LDA   #$DE
              JSR   LBCD5
LBCB2         LDA   #$AA
              JSR   LBCD5
LBCB7         LDA   #$EB
              JSR   LBCD5
              CLC
LBCBD         LDA   $C08E,X
              LDA   $C08C,X
LBCC3         RTS

LBCC4         PHA
              LSR
              ORA   $3E
              STA   $C08D,X
              CMP   $C08C,X
              PLA
              NOP
              NOP
              NOP
              ORA   #$AA
LBCD4         NOP
LBCD5         NOP
              PHA
              PLA
              STA   $C08D,X
              CMP   $C08C,X
              RTS

              DS    \

*
*
*

LBD00         STY   $48
              STA   $49
              LDY   #$02
              STY   $06F8
              LDY   #$04
              STY   $04F8
              LDY   #$01
              LDA   ($48),Y
              TAX
              LDY   #$0F
              CMP   ($48),Y
              BEQ   LBD34
              TXA
              PHA
              LDA   ($48),Y
              TAX
              PLA
              PHA
              STA   ($48),Y
              LDA   $C08E,X
LBD25         LDY   #$08
              LDA   $C08C,X
LBD2A         CMP   $C08C,X
              BNE   LBD25
              DEY
              BNE   LBD2A
              PLA
              TAX
LBD34         LDA   $C08E,X
              LDA   $C08C,X
              LDY   #$08
LBD3C         LDA   $C08C,X
              PHA
              PLA
              PHA
              PLA
              STX   $05F8
              CMP   $C08C,X
              BNE   LBD4E
              DEY
              BNE   LBD3C
LBD4E         PHP
              LDA   $C089,X
              LDY   #$06
LBD54         LDA   ($48),Y
              STA   |$0036,Y
              INY
              CPY   #$0A
              BNE   LBD54
              LDY   #$03
              LDA   ($3C),Y
              STA   $47
              LDY   #$02
              LDA   ($48),Y
              LDY   #$10
              CMP   ($48),Y
              BEQ   LBD74
              STA   ($48),Y
              PLP
              LDY   #$00
              PHP
LBD74         ROR
              BCC   LBD7C
              LDA   $C08A,X
              BCS   LBD7F
LBD7C         LDA   $C08B,X
LBD7F         ROR   $35
              PLP
              PHP
              BNE   LBD90
              LDY   #$07
LBD87         JSR   LBA00
              DEY
              BNE   LBD87
              LDX   $05F8
LBD90         LDY   #$04
              LDA   ($48),Y
              JSR   LBE5A
              PLP
              BNE   LBDAB
              LDY   $47
              BPL   LBDAB
LBD9E         LDY   #$12
LBDA0         DEY
              BNE   LBDA0
              INC   $46
              BNE   LBD9E
              INC   $47
              BNE   LBD9E
LBDAB         LDY   #$0C
              LDA   ($48),Y
              BEQ   LBE0B
              CMP   #$04
              BEQ   LBE0D
              ROR
              PHP
              BCS   LBDBC
              JSR   LB800
LBDBC         LDY   #$30
              STY   $0578
LBDC1         LDX   $05F8
              JSR   LB944
              BCC   LBDED
LBDC9         DEC   $0578
              BPL   LBDC1
LBDCE         LDA   $0478
              PHA
              LDA   #$60
              JSR   LBE95
              DEC   $06F8
              BEQ   LBE04
              LDA   #$04
              STA   $04F8
              LDA   #$00
              JSR   LBE5A
              PLA
LBDE7         JSR   LBE5A
              JMP   LBDBC

LBDED         LDY   $2E
              CPY   $0478
              BEQ   LBE10
              LDA   $0478
              PHA
              TYA
              JSR   LBE95
              PLA
              DEC   $04F8
              BNE   LBDE7
              BEQ   LBDCE
LBE04         PLA
              LDA   #$40
LBE07         PLP
              JMP   LBE48

LBE0B         BEQ   LBE46
LBE0D         JMP   LBEAF

LBE10         LDY   #$03
              LDA   ($48),Y
              PHA
              LDA   $2F
              LDY   #$0E
              STA   ($48),Y
              PLA
              BEQ   LBE26
              CMP   $2F
              BEQ   LBE26
              LDA   #$20
              BNE   LBE07
LBE26         LDY   #$05
              LDA   ($48),Y
              TAY
              LDA   LBFB8,Y
              CMP   $2D
              BNE   LBDC9
              PLP
              BCC   LBE51
              JSR   LB8DC
              PHP
              BCS   LBDC9
              PLP
              LDX   #$00
              STX   $26
              JSR   LB8C2
              LDX   $05F8
LBE46         CLC
              HEX   24
LBE48         SEC
              LDY   #$0D
              STA   ($48),Y
              LDA   $C088,X
              RTS

LBE51         JSR   LB82A
              BCC   LBE46
              LDA   #$10
              BCS   LBE48
LBE5A         PHA
              LDY   #$01
              LDA   ($3C),Y
              ROR
              PLA
              BCC   LBE6B
              ASL
              JSR   LBE6B
              LSR   $0478
              RTS

LBE6B         STA   $2A
              JSR   LBE8E
              LDA   $0478,Y
              BIT   $35
              BMI   LBE7A
              LDA   $04F8,Y
LBE7A         STA   $0478
              LDA   $2A
              BIT   $35
              BMI   LBE88
              STA   $04F8,Y
              BPL   LBE8B
LBE88         STA   $0478,Y
LBE8B         JMP   LB9A0

LBE8E         TXA
              LSR
              LSR
              LSR
              LSR
              TAY
              RTS

LBE95         PHA
              LDY   #$02
              LDA   ($48),Y
              ROR
              ROR   $35
              JSR   LBE8E
              PLA
              ASL
              BIT   $35
              BMI   LBEAB
              STA   $04F8,Y
              BPL   LBEAE
LBEAB         STA   $0478,Y
LBEAE         RTS

LBEAF         LDY   #$03
              LDA   ($48),Y
              STA   $41
              LDA   #$AA
              STA   $3E
              LDY   #$56
              LDA   #$00
              STA   $44
LBEBF         STA   LBC00-1,Y
              DEY
              BNE   LBEBF
LBEC5         STA   LBB00,Y
              DEY
              BNE   LBEC5
              LDA   #$50
              JSR   LBE95
              LDA   #$28
              STA   $45
LBED4         LDA   $44
              JSR   LBE5A
              JSR   LBF0D
              LDA   #$08
              BCS   LBF04
              LDA   #$30
              STA   $0578
LBEE5         SEC
              DEC   $0578
              BEQ   LBF04
              JSR   LB944
              BCS   LBEE5
              LDA   $2D
              BNE   LBEE5
              JSR   LB8DC
              BCS   LBEE5
              INC   $44
              LDA   $44
LBEFD         CMP   #NB_TRACK
              BCC   LBED4
              CLC
              BCC   LBF09
LBF04         LDY   #$0D
              STA   ($48),Y
              SEC
LBF09         LDA   $C088,X
              RTS

LBF0D         LDA   #$00
              STA   $3F
              LDY   #$80
              BNE   LBF17
LBF15         LDY   $45
LBF17         JSR   LBC56
              BCS   LBF87
              JSR   LB82A
              BCS   LBF87
              INC   $3F
              LDA   $3F
              CMP   #NB_SECTOR
              BCC   LBF15
              LDY   #NB_SECTOR-1
              STY   $3F
              LDA   #$30
              STA   $0578
LBF32         STA   LBFA8,Y
              DEY
              BPL   LBF32
              LDY   $45
LBF3A         JSR   LBF87
              JSR   LBF87
              JSR   LBF87
              PHA
              PLA
              NOP
              DEY
              BNE   LBF3A
              JSR   LB944
              BCS   LBF71
              LDA   $2D
              BEQ   LBF67
              LDA   #NB_SECTOR
              CMP   $45
              LDA   $45
              SBC   #$01
              STA   $45
              CMP   #$05
              BCS   LBF71
              SEC
              RTS

LBF62         JSR   LB944
              BCS   LBF6C
LBF67         JSR   LB8DC
              BCC   LBF88
LBF6C         DEC   $0578
              BNE   LBF62
LBF71         JSR   LB944
              BCS   LBF81
              LDA   $2D
              CMP   #NB_SECTOR-1
              BNE   LBF81
              JSR   LB8DC
              BCC   LBF0D
LBF81         DEC   $0578
              BNE   LBF71
              SEC
LBF87         RTS

LBF88         LDY   $2D
              LDA   LBFA8,Y
              BMI   LBF6C
              LDA   #$FF
              STA   LBFA8,Y
              DEC   $3F
              BPL   LBF62
              LDA   $44
              BNE   LBFA6
              LDA   $45
              CMP   #$10
              BCC   LBF87
              DEC   $45
              DEC   $45
LBFA6         CLC
LBFA7         RTS

LBFA8         HEX   FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
LBFB8         HEX   000D0B09070503010E0C0A080604020F

              DS    \

