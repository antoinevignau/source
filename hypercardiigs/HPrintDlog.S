*
* HypercardGS
* segment: $22 HPrintDlog
*
* (k) 2015, Brutal Deluxe Software
*

         mx    %00
         rel
         dsk   HPrintDlog.l
         lst   off

*---------------------------------------

         use   HPrintDlog.X

         use   4/Ctl.Macs
         use   4/Desk.Macs
         use   4/Dialog.Macs
         use   4/Event.Macs
         use   4/Int.Macs
         use   4/Line.Macs
         use   4/List.Macs
         use   4/Locator.Macs
         use   4/Mem.Macs
         use   4/Menu.Macs
         use   4/MidiSyn.Macs
         use   4/Misc.Macs
         use   4/Qd.Macs
         use   4/Sound.Macs
         use   4/Std.Macs
         use   4/Text.Macs
         use   4/Util.Macs
         use   4/Window.Macs

*---------------------------------------

L220000  ENT
         ADRL  L220006
         DB    $00
         DB    $00
L220006  DB    $06
         DB    $00
         DB    $FD
         DB    $FF
         DB    $00
         DB    $00
         DB    $08
         DB    $00
         DB    $01
         DB    $01
         DB    $17
         DB    $00
         DB    $00
         DB    $90
         DB    $06
         DB    $00
         DB    $FA
         DB    $00
         DB    $17
         DB    $00
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $17
         DB    $00
         DB    $08
         DB    $00
         DB    $64
         DB    $03
         DB    $07
         DB    $00
         DB    $01
         DB    $00
         DB    $01
         DB    $00
         DB    $4D
         DB    $00
         DB    $7F
         DB    $FF
         DB    $3F
         DB    $FF
         DB    $FF
         DB    $FC
         DB    $07
         DB    $FC
         DB    $06
         DB    $00
         DB    $10
         DB    $30
         DB    $00
         DB    $F0
         DB    $01
         DB    $FF
         DB    $FE
         DB    $00
         DB    $00
         DB    $1E
         DB    $6D
         DB    $84
         DB    $30
         DB    $31
         DB    $8F
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $9E
         DB    $63
         DB    $CF
         DB    $61
         DB    $F3
         DB    $DF
         DB    $BC
         DB    $F0
         DB    $06
         DB    $06
         DB    $1E
         DB    $7C
         DB    $F7
         DB    $CF
         DB    $7D
         DB    $FF
         DB    $BD
         DB    $9F
         DB    $87
         DB    $8F
         DB    $08
         DB    $31
         DB    $BD
         DB    $F3
         DB    $DF
         DB    $3D
         DB    $FE
         DB    $78
         DB    $F0
         DB    $F3
         DB    $CF
         DB    $FF
         DB    $C1
         DB    $E6
         DB    $00
         DB    $60
         DB    $30
         DB    $00
         DB    $30
         DB    $0E
         DB    $06
         DB    $0C
         DB    $3C
         DB    $38
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $7F
         DB    $87
         DB    $34
         DB    $9E
         DB    $78
         DB    $4E
         DB    $52
         DB    $48
         DB    $63
         DB    $0E
         DB    $49
         DB    $93
         DB    $00
         DB    $11
         DB    $03
         DB    $12
         DB    $3C
         DB    $69
         DB    $64
         DB    $66
         DB    $0C
         DB    $49
         DB    $91
         DB    $98
         DB    $31
         DB    $23
         DB    $1C
         DB    $23
         DB    $CE
         DB    $07
         DB    $B9
         DB    $F0
         DB    $3A
         DB    $2E
         DB    $40
         DB    $7F
         DB    $7C
         DB    $00
         DB    $03
         DB    $33
         DB    $10
         DB    $1C
         DB    $FB
         DB    $F8
         DB    $01
         DB    $9F
         DB    $79
         DB    $E0
         DB    $00
         DB    $00
         DB    $D8
         DB    $01
         DB    $E1
         DB    $80
         DB    $40
         DB    $00
         DB    $00
         DB    $02
         DB    $19
         DB    $72
         DB    $FE
         DB    $00
         DB    $00
         DB    $0D
         DB    $B6
         DB    $D8
         DB    $04
         DB    $25
         DB    $FC
         DB    $00
         DB    $81
         DB    $21
         DB    $F0
         DB    $03
         DB    $C0
         DB    $0C
         DB    $18
         DB    $43
         DB    $04
         DB    $00
         DB    $38
         DB    $20
         DB    $0F
         DB    $0F
         DB    $01
         DB    $80
         DB    $07
         DB    $E3
         DB    $F1
         DB    $FE
         DB    $7F
         DB    $DF
         DB    $5A
         DB    $41
         DB    $B0
         DB    $C9
         DB    $18
         DB    $00
         DB    $03
         DB    $27
         DB    $E6
         DB    $79
         DB    $E7
         DB    $86
         DB    $01
         DB    $E7
         DB    $98
         DB    $0C
         DB    $03
         DB    $33
         DB    $83
         DB    $9E
         DB    $79
         DB    $E7
         DB    $8C
         DB    $67
         DB    $9B
         DB    $07
         DB    $9B
         DB    $0C
         DB    $79
         DB    $E7
         DB    $9E
         DB    $79
         DB    $E6
         DB    $66
         DB    $78
         DB    $F0
         DB    $F3
         DB    $CC
         DB    $3C
         DB    $60
         DB    $6B
         DB    $00
         DB    $30
         DB    $30
         DB    $00
         DB    $30
         DB    $18
         DB    $06
         DB    $00
         DB    $0C
         DB    $18
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $30
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $CC
         DB    $CC
         DB    $E0
         DB    $33
         DB    $CC
         DB    $93
         DB    $80
         DB    $00
         DB    $C1
         DB    $93
         DB    $02
         DB    $64
         DB    $80
         DB    $20
         DB    $85
         DB    $80
         DB    $66
         DB    $B0
         DB    $98
         DB    $C3
         DB    $16
         DB    $02
         DB    $63
         DB    $0C
         DB    $58
         DB    $0F
         DB    $F6
         DB    $26
         DB    $38
         DB    $0F
         DB    $E5
         DB    $9B
         DB    $D3
         DB    $78
         DB    $06
         DB    $CC
         DB    $C6
         DB    $00
         DB    $C6
         DB    $1B
         DB    $10
         DB    $26
         DB    $65
         DB    $B0
         DB    $13
         DB    $73
         DB    $CF
         DB    $30
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $82
         DB    $02
         DB    $40
         DB    $00
         DB    $00
         DB    $01
         DB    $26
         DB    $9D
         DB    $98
         DB    $00
         DB    $00
         DB    $1B
         DB    $37
         DB    $99
         DB    $0A
         DB    $01
         DB    $8C
         DB    $00
         DB    $87
         DB    $F9
         DB    $F0
         DB    $03
         DB    $CF
         DB    $FF
         DB    $E0
         DB    $40
         DB    $9B
         DB    $03
         DB    $7C
         DB    $D8
         DB    $F0
         DB    $00
         DB    $FF
         DB    $FF
         DB    $C6
         DB    $00
         DB    $00
         DB    $1E
         DB    $6D
         DB    $B4
         DB    $34
         DB    $61
         DB    $E0
         DB    $66
         DB    $18
         DB    $00
         DB    $06
         DB    $66
         DB    $60
         DB    $61
         DB    $E7
         DB    $F7
         DB    $C3
         DB    $67
         DB    $9E
         DB    $D9
         DB    $F9
         DB    $83
         DB    $9B
         DB    $9E
         DB    $78
         DB    $67
         DB    $8C
         DB    $61
         DB    $9B
         DB    $07
         DB    $B3
         DB    $0E
         DB    $FD
         DB    $E7
         DB    $9E
         DB    $79
         DB    $E0
         DB    $66
         DB    $78
         DB    $F6
         DB    $DE
         DB    $CC
         DB    $6C
         DB    $30
         DB    $71
         DB    $80
         DB    $17
         DB    $FE
         DB    $79
         DB    $F7
         DB    $BE
         DB    $FF
         DB    $DC
         DB    $7C
         DB    $DB
         DB    $FB
         DB    $E7
         DB    $BE
         DB    $7F
         DB    $6F
         DB    $7D
         DB    $9E
         DB    $3C
         DB    $3C
         DB    $F3
         DB    $FC
         DB    $8C
         DB    $40
         DB    $07
         DB    $9E
         DB    $C3
         DB    $E0
         DB    $1E
         DB    $CC
         DB    $00
         DB    $00
         DB    $7C
         DB    $03
         DB    $1E
         DB    $79
         DB    $E0
         DB    $1E
         DB    $00
         DB    $0E
         DB    $00
         DB    $00
         DB    $00
         DB    $78
         DB    $00
         DB    $00
         DB    $03
         DB    $33
         DB    $36
         DB    $F6
         DB    $0F
         DB    $0F
         DB    $E9
         DB    $F6
         DB    $12
         DB    $A0
         DB    $3F
         DB    $CC
         DB    $CE
         DB    $00
         DB    $CC
         DB    $0D
         DB    $AC
         DB    $C3
         DB    $31
         DB    $B7
         DB    $E3
         DB    $33
         DB    $CF
         DB    $37
         DB    $B8
         DB    $F0
         DB    $D8
         DB    $01
         DB    $86
         DB    $3C
         DB    $A3
         DB    $3C
         DB    $C0
         DB    $07
         DB    $80
         DB    $01
         DB    $98
         DB    $F7
         DB    $00
         DB    $1B
         DB    $6D
         DB    $B0
         DB    $11
         DB    $67
         DB    $64
         DB    $00
         DB    $81
         DB    $21
         DB    $F0
         DB    $03
         DB    $C6
         DB    $00
         DB    $E0
         DB    $40
         DB    $E1
         DB    $86
         DB    $FF
         DB    $FF
         DB    $00
         DB    $0F
         DB    $30
         DB    $00
         DB    $C7
         DB    $FF
         DB    $3F
         DB    $F8
         DB    $0D
         DB    $9F
         DB    $08
         DB    $34
         DB    $60
         DB    $7F
         DB    $FE
         DB    $3F
         DB    $0C
         DB    $66
         DB    $60
         DB    $C7
         DB    $66
         DB    $1E
         DB    $66
         DB    $3D
         DB    $98
         DB    $30
         DB    $00
         DB    $C6
         DB    $AB
         DB    $9F
         DB    $D8
         DB    $67
         DB    $EF
         DB    $6F
         DB    $FB
         DB    $07
         DB    $E3
         DB    $0F
         DB    $FF
         DB    $E7
         DB    $F6
         DB    $7F
         DB    $3C
         DB    $66
         DB    $6D
         DB    $B6
         DB    $CC
         DB    $78
         DB    $CC
         DB    $18
         DB    $60
         DB    $00
         DB    $0C
         DB    $F3
         DB    $CF
         DB    $3C
         DB    $D9
         DB    $9E
         DB    $6C
         DB    $3D
         DB    $9B
         DB    $6F
         DB    $3C
         DB    $F3
         DB    $CF
         DB    $98
         DB    $31
         DB    $9E
         DB    $3D
         DB    $B7
         DB    $B3
         DB    $1B
         DB    $0C
         DB    $30
         DB    $0C
         DB    $F3
         DB    $C3
         DB    $18
         DB    $73
         DB    $CD
         DB    $F7
         DB    $DF
         DB    $CD
         DB    $F7
         DB    $F3
         DB    $CF
         DB    $37
         DB    $F3
         DB    $EE
         DB    $E6
         DB    $F9
         DB    $E7
         DB    $9E
         DB    $CD
         DB    $EC
         DB    $F3
         DB    $CF
         DB    $3F
         DB    $DD
         DB    $8F
         DB    $99
         DB    $FF
         DB    $E5
         DB    $9E
         DB    $00
         DB    $00
         DB    $0C
         DB    $CF
         DB    $D6
         DB    $DB
         DB    $F6
         DB    $1B
         DB    $FC
         DB    $DF
         DB    $19
         DB    $B3
         DB    $63
         DB    $33
         DB    $CF
         DB    $30
         DB    $CF
         DB    $3B
         DB    $DF
         DB    $E3
         DB    $1F
         DB    $C2
         DB    $A6
         DB    $66
         DB    $60
         DB    $0C
         DB    $DE
         DB    $7D
         DB    $9F
         DB    $99
         DB    $FF
         DB    $E0
         DB    $00
         DB    $07
         DB    $E0
         DB    $E7
         DB    $E4
         DB    $00
         DB    $87
         DB    $F9
         DB    $F0
         DB    $3F
         DB    $CE
         DB    $30
         DB    $E0
         DB    $38
         DB    $E1
         DB    $4C
         DB    $7D
         DB    $F8
         DB    $F0
         DB    $F0
         DB    $F0
         DB    $00
         DB    $FE
         DB    $00
         DB    $00
         DB    $18
         DB    $1F
         DB    $C5
         DB    $96
         DB    $58
         DB    $60
         DB    $66
         DB    $18
         DB    $00
         DB    $18
         DB    $66
         DB    $61
         DB    $81
         DB    $FE
         DB    $1E
         DB    $66
         DB    $66
         DB    $F8
         DB    $19
         DB    $F9
         DB    $8C
         DB    $AB
         DB    $FE
         DB    $78
         DB    $67
         DB    $8C
         DB    $67
         DB    $9B
         DB    $07
         DB    $B3
         DB    $0D
         DB    $7B
         DB    $E7
         DB    $86
         DB    $7B
         DB    $06
         DB    $66
         DB    $6D
         DB    $B6
         DB    $DE
         DB    $31
         DB    $8C
         DB    $0C
         DB    $60
         DB    $00
         DB    $0C
         DB    $F3
         DB    $C3
         DB    $3F
         DB    $D9
         DB    $9E
         DB    $6C
         DB    $3F
         DB    $1B
         DB    $6F
         DB    $3C
         DB    $F3
         DB    $CF
         DB    $0F
         DB    $31
         DB    $9B
         DB    $6D
         DB    $B3
         DB    $37
         DB    $30
         DB    $8C
         DB    $40
         DB    $0C
         DB    $F3
         DB    $C3
         DB    $DE
         DB    $73
         DB    $CF
         DB    $3C
         DB    $F3
         DB    $CF
         DB    $3C
         DB    $F0
         DB    $FF
         DB    $FC
         DB    $BF
         DB    $66
         DB    $66
         DB    $CF
         DB    $3C
         DB    $F3
         DB    $CF
         DB    $3C
         DB    $F3
         DB    $CF
         DB    $33
         DB    $01
         DB    $86
         DB    $19
         DB    $F7
         DB    $E6
         DB    $03
         DB    $C0
         DB    $00
         DB    $3F
         DB    $FC
         DB    $E7
         DB    $34
         DB    $C3
         DB    $30
         DB    $CC
         DB    $F3
         DB    $11
         DB    $B3
         DB    $63
         DB    $1F
         DB    $7B
         DB    $37
         DB    $FF
         DB    $5E
         DB    $18
         DB    $63
         DB    $06
         DB    $3D
         DB    $1C
         DB    $C3
         DB    $30
         DB    $0C
         DB    $F3
         DB    $C7
         DB    $99
         DB    $9F
         DB    $80
         DB    $00
         DB    $00
         DB    $00
         DB    $11
         DB    $6F
         DB    $CC
         DB    $00
         DB    $81
         DB    $21
         DB    $F0
         DB    $32
         DB    $C6
         DB    $38
         DB    $D8
         DB    $03
         DB    $E5
         DB    $B8
         DB    $39
         DB    $FF
         DB    $0F
         DB    $0F
         DB    $30
         DB    $00
         DB    $C1
         DB    $E7
         DB    $CF
         DB    $E0
         DB    $0D
         DB    $B5
         DB    $AB
         DB    $CC
         DB    $60
         DB    $69
         DB    $18
         DB    $00
         DB    $30
         DB    $64
         DB    $63
         DB    $19
         DB    $87
         DB    $9E
         DB    $6C
         DB    $66
         DB    $18
         DB    $0C
         DB    $03
         DB    $00
         DB    $B7
         DB    $9E
         DB    $79
         DB    $E7
         DB    $8C
         DB    $67
         DB    $9B
         DB    $67
         DB    $9B
         DB    $0C
         DB    $79
         DB    $E7
         DB    $86
         DB    $79
         DB    $E6
         DB    $66
         DB    $67
         DB    $19
         DB    $B3
         DB    $33
         DB    $0C
         DB    $06
         DB    $60
         DB    $00
         DB    $0C
         DB    $F3
         DB    $CF
         DB    $3C
         DB    $18
         DB    $FE
         DB    $6C
         DB    $3D
         DB    $9B
         DB    $6F
         DB    $3C
         DB    $F3
         DB    $CF
         DB    $01
         DB    $B7
         DB    $9B
         DB    $66
         DB    $67
         DB    $9B
         DB    $60
         DB    $CC
         DB    $C0
         DB    $0F
         DB    $FF
         DB    $CF
         DB    $13
         DB    $F3
         DB    $CF
         DB    $3C
         DB    $F3
         DB    $CF
         DB    $3C
         DB    $F3
         DB    $C3
         DB    $0D
         DB    $30
         DB    $66
         DB    $66
         DB    $CF
         DB    $3C
         DB    $F3
         DB    $CF
         DB    $3C
         DB    $F3
         DB    $CF
         DB    $33
         DB    $00
         DB    $F6
         DB    $2F
         DB    $72
         DB    $F6
         DB    $00
         DB    $00
         DB    $00
         DB    $18
         DB    $CC
         DB    $C7
         DB    $64
         DB    $C0
         DB    $03
         DB    $FD
         DB    $F3
         DB    $21
         DB    $B3
         DB    $63
         DB    $00
         DB    $01
         DB    $2C
         DB    $C3
         DB    $9E
         DB    $78
         DB    $63
         DB    $06
         DB    $41
         DB    $16
         DB    $66
         DB    $60
         DB    $0F
         DB    $FF
         DB    $C7
         DB    $99
         DB    $98
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $0A
         DB    $37
         DB    $FC
         DB    $00
         DB    $7F
         DB    $FF
         DB    $F0
         DB    $34
         DB    $FE
         DB    $00
         DB    $C7
         DB    $FF
         DB    $9B
         DB    $10
         DB    $10
         DB    $D8
         DB    $F0
         DB    $F0
         DB    $3F
         DB    $FF
         DB    $C0
         DB    $00
         DB    $00
         DB    $18
         DB    $00
         DB    $1F
         DB    $06
         DB    $76
         DB    $30
         DB    $C0
         DB    $00
         DB    $C0
         DB    $E0
         DB    $79
         DB    $FF
         DB    $EF
         DB    $06
         DB    $F3
         DB    $CC
         DB    $3C
         DB    $F6
         DB    $C6
         DB    $06
         DB    $0C
         DB    $81
         DB    $9F
         DB    $CF
         DB    $7D
         DB    $FC
         DB    $3D
         DB    $9F
         DB    $BD
         DB    $8F
         DB    $FC
         DB    $78
         DB    $BD
         DB    $83
         DB    $D9
         DB    $BC
         DB    $63
         DB    $C7
         DB    $19
         DB    $B3
         DB    $33
         DB    $FC
         DB    $02
         DB    $60
         DB    $00
         DB    $07
         DB    $FE
         DB    $79
         DB    $F7
         DB    $99
         DB    $1E
         DB    $7F
         DB    $BC
         DB    $FF
         DB    $6F
         DB    $37
         DB    $BE
         DB    $7F
         DB    $0F
         DB    $1C
         DB    $F9
         DB    $C6
         DB    $6C
         DB    $E3
         DB    $FC
         DB    $CC
         DB    $C0
         DB    $0C
         DB    $F3
         DB    $7B
         DB    $F0
         DB    $DE
         DB    $79
         DB    $F7
         DB    $DF
         DB    $7D
         DB    $F7
         DB    $DE
         DB    $79
         DB    $E7
         DB    $DE
         DB    $FF
         DB    $FF
         DB    $CD
         DB    $E7
         DB    $9E
         DB    $79
         DB    $E7
         DB    $DF
         DB    $7D
         DB    $F3
         DB    $00
         DB    $2F
         DB    $C1
         DB    $82
         DB    $EC
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $CF
         DB    $7C
         DB    $DB
         DB    $FF
         DB    $FC
         DB    $CE
         DB    $5E
         DB    $45
         DB    $B6
         DB    $CB
         DB    $3F
         DB    $7B
         DB    $37
         DB    $B9
         DB    $E3
         DB    $D8
         DB    $1E
         DB    $04
         DB    $01
         DB    $F3
         DB    $3C
         DB    $CD
         DB    $BC
         DB    $F3
         DB    $7C
         DB    $FE
         DB    $F7
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $04
         DB    $47
         DB    $CC
         DB    $00
         DB    $1F
         DB    $FF
         DB    $3F
         DB    $F8
         DB    $07
         DB    $FF
         DB    $C1
         DB    $FE
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0F
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
         DB    $0F
         DB    $00
         DB    $01
         DB    $80
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $80
         DB    $00
         DB    $00
         DB    $78
         DB    $00
         DB    $00
         DB    $00
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
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $0F
         DB    $01
         DB    $E0
         DB    $7F
         DB    $80
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $F0
         DB    $00
         DB    $E0
         DB    $00
         DB    $00
         DB    $00
         DB    $30
         DB    $0C
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $1E
         DB    $00
         DB    $7F
         DB    $80
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
         DB    $00
         DB    $03
         DB    $00
         DB    $20
         DB    $07
         DB    $02
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
         DB    $08
         DB    $00
         DB    $F8
         DB    $00
         DB    $06
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $06
         DB    $18
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $3D
         DB    $FC
         DB    $00
         DB    $00
         DB    $00
         DB    $12
         DB    $00
         DB    $12
         DB    $00
         DB    $20
         DB    $00
         DB    $32
         DB    $00
         DB    $32
         DB    $00
         DB    $32
         DB    $00
         DB    $32
         DB    $00
         DB    $42
         DB    $00
         DB    $42
         DB    $00
         DB    $42
         DB    $00
         DB    $42
         DB    $00
         DB    $49
         DB    $00
         DB    $50
         DB    $00
         DB    $57
         DB    $00
         DB    $5E
         DB    $00
         DB    $72
         DB    $00
         DB    $72
         DB    $00
         DB    $72
         DB    $00
         DB    $87
         DB    $00
         DB    $9B
         DB    $00
         DB    $9B
         DB    $00
         DB    $9B
         DB    $00
         DB    $9B
         DB    $00
         DB    $9B
         DB    $00
         DB    $9B
         DB    $00
         DB    $9B
         DB    $00
         DB    $9B
         DB    $00
         DB    $9D
         DB    $00
         DB    $A3
         DB    $00
         DB    $AA
         DB    $00
         DB    $B1
         DB    $00
         DB    $B8
         DB    $00
         DB    $BF
         DB    $00
         DB    $C1
         DB    $00
         DB    $C6
         DB    $00
         DB    $CB
         DB    $00
         DB    $D1
         DB    $00
         DB    $D7
         DB    $00
         DB    $DA
         DB    $00
         DB    $E0
         DB    $00
         DB    $E2
         DB    $00
         DB    $E9
         DB    $00
         DB    $EF
         DB    $00
         DB    $F5
         DB    $00
         DB    $FB
         DB    $00
         DB    $01
         DB    $01
         DB    $07
         DB    $01
         DB    $0D
         DB    $01
         DB    $13
         DB    $01
         DB    $19
         DB    $01
         DB    $1F
         DB    $01
         DB    $25
         DB    $01
         DB    $27
         DB    $01
         DB    $2A
         DB    $01
         DB    $2F
         DB    $01
         DB    $35
         DB    $01
         DB    $3A
         DB    $01
         DB    $40
         DB    $01
         DB    $47
         DB    $01
         DB    $4D
         DB    $01
         DB    $53
         DB    $01
         DB    $59
         DB    $01
         DB    $5F
         DB    $01
         DB    $64
         DB    $01
         DB    $69
         DB    $01
         DB    $6F
         DB    $01
         DB    $75
         DB    $01
         DB    $79
         DB    $01
         DB    $7F
         DB    $01
         DB    $86
         DB    $01
         DB    $8C
         DB    $01
         DB    $93
         DB    $01
         DB    $99
         DB    $01
         DB    $9F
         DB    $01
         DB    $A5
         DB    $01
         DB    $AB
         DB    $01
         DB    $B1
         DB    $01
         DB    $B7
         DB    $01
         DB    $BD
         DB    $01
         DB    $C3
         DB    $01
         DB    $CA
         DB    $01
         DB    $D2
         DB    $01
         DB    $D8
         DB    $01
         DB    $DE
         DB    $01
         DB    $E4
         DB    $01
         DB    $E8
         DB    $01
         DB    $EF
         DB    $01
         DB    $F3
         DB    $01
         DB    $F9
         DB    $01
         DB    $01
         DB    $02
         DB    $04
         DB    $02
         DB    $0A
         DB    $02
         DB    $10
         DB    $02
         DB    $16
         DB    $02
         DB    $1C
         DB    $02
         DB    $22
         DB    $02
         DB    $27
         DB    $02
         DB    $2D
         DB    $02
         DB    $33
         DB    $02
         DB    $37
         DB    $02
         DB    $3C
         DB    $02
         DB    $42
         DB    $02
         DB    $46
         DB    $02
         DB    $4E
         DB    $02
         DB    $54
         DB    $02
         DB    $5A
         DB    $02
         DB    $60
         DB    $02
         DB    $66
         DB    $02
         DB    $6B
         DB    $02
         DB    $71
         DB    $02
         DB    $77
         DB    $02
         DB    $7D
         DB    $02
         DB    $84
         DB    $02
         DB    $8C
         DB    $02
         DB    $92
         DB    $02
         DB    $98
         DB    $02
         DB    $9E
         DB    $02
         DB    $A4
         DB    $02
         DB    $A6
         DB    $02
         DB    $AC
         DB    $02
         DB    $B4
         DB    $02
         DB    $B4
         DB    $02
         DB    $BA
         DB    $02
         DB    $C0
         DB    $02
         DB    $C6
         DB    $02
         DB    $CB
         DB    $02
         DB    $D2
         DB    $02
         DB    $D8
         DB    $02
         DB    $DE
         DB    $02
         DB    $E4
         DB    $02
         DB    $EA
         DB    $02
         DB    $F0
         DB    $02
         DB    $F6
         DB    $02
         DB    $FC
         DB    $02
         DB    $02
         DB    $03
         DB    $08
         DB    $03
         DB    $0E
         DB    $03
         DB    $14
         DB    $03
         DB    $1A
         DB    $03
         DB    $20
         DB    $03
         DB    $24
         DB    $03
         DB    $28
         DB    $03
         DB    $2C
         DB    $03
         DB    $30
         DB    $03
         DB    $36
         DB    $03
         DB    $3C
         DB    $03
         DB    $42
         DB    $03
         DB    $48
         DB    $03
         DB    $4E
         DB    $03
         DB    $54
         DB    $03
         DB    $5A
         DB    $03
         DB    $60
         DB    $03
         DB    $66
         DB    $03
         DB    $6C
         DB    $03
         DB    $72
         DB    $03
         DB    $77
         DB    $03
         DB    $7C
         DB    $03
         DB    $83
         DB    $03
         DB    $89
         DB    $03
         DB    $8C
         DB    $03
         DB    $91
         DB    $03
         DB    $97
         DB    $03
         DB    $9D
         DB    $03
         DB    $A2
         DB    $03
         DB    $AB
         DB    $03
         DB    $AE
         DB    $03
         DB    $B2
         DB    $03
         DB    $B8
         DB    $03
         DB    $C0
         DB    $03
         DB    $C7
         DB    $03
         DB    $CE
         DB    $03
         DB    $D4
         DB    $03
         DB    $D9
         DB    $03
         DB    $DE
         DB    $03
         DB    $E4
         DB    $03
         DB    $EA
         DB    $03
         DB    $F0
         DB    $03
         DB    $F6
         DB    $03
         DB    $FD
         DB    $03
         DB    $04
         DB    $04
         DB    $0A
         DB    $04
         DB    $10
         DB    $04
         DB    $16
         DB    $04
         DB    $1C
         DB    $04
         DB    $26
         DB    $04
         DB    $2D
         DB    $04
         DB    $33
         DB    $04
         DB    $35
         DB    $04
         DB    $3B
         DB    $04
         DB    $43
         DB    $04
         DB    $49
         DB    $04
         DB    $4F
         DB    $04
         DB    $54
         DB    $04
         DB    $5C
         DB    $04
         DB    $64
         DB    $04
         DB    $6C
         DB    $04
         DB    $6C
         DB    $04
         DB    $72
         DB    $04
         DB    $78
         DB    $04
         DB    $7F
         DB    $04
         DB    $87
         DB    $04
         DB    $91
         DB    $04
         DB    $94
         DB    $04
         DB    $9B
         DB    $04
         DB    $A1
         DB    $04
         DB    $A7
         DB    $04
         DB    $AA
         DB    $04
         DB    $AD
         DB    $04
         DB    $B2
         DB    $04
         DB    $B9
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $BF
         DB    $04
         DB    $C6
         DB    $04
         DB    $14
         DB    $02
         DB    $FF
         DB    $FF
         DB    $10
         DB    $02
         DB    $14
         DB    $02
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $12
         DB    $02
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $08
         DB    $01
         DB    $08
         DB    $01
         DB    $08
         DB    $01
         DB    $09
         DB    $02
         DB    $16
         DB    $02
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $17
         DB    $02
         DB    $16
         DB    $02
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $04
         DB    $01
         DB    $06
         DB    $03
         DB    $08
         DB    $02
         DB    $08
         DB    $01
         DB    $08
         DB    $01
         DB    $08
         DB    $01
         DB    $09
         DB    $02
         DB    $06
         DB    $03
         DB    $07
         DB    $02
         DB    $07
         DB    $02
         DB    $07
         DB    $01
         DB    $08
         DB    $02
         DB    $05
         DB    $02
         DB    $08
         DB    $02
         DB    $04
         DB    $02
         DB    $08
         DB    $01
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $04
         DB    $02
         DB    $05
         DB    $02
         DB    $07
         DB    $02
         DB    $08
         DB    $02
         DB    $07
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $01
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $07
         DB    $02
         DB    $07
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $03
         DB    $08
         DB    $02
         DB    $09
         DB    $02
         DB    $08
         DB    $02
         DB    $09
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $09
         DB    $02
         DB    $09
         DB    $01
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $06
         DB    $02
         DB    $08
         DB    $01
         DB    $06
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $01
         DB    $05
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $07
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $06
         DB    $02
         DB    $07
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $03
         DB    $09
         DB    $01
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $07
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $09
         DB    $02
         DB    $09
         DB    $01
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $06
         DB    $03
         DB    $08
         DB    $02
         DB    $09
         DB    $01
         DB    $04
         DB    $00
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $07
         DB    $02
         DB    $09
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $06
         DB    $02
         DB    $06
         DB    $02
         DB    $06
         DB    $02
         DB    $06
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $07
         DB    $02
         DB    $07
         DB    $02
         DB    $08
         DB    $01
         DB    $08
         DB    $02
         DB    $07
         DB    $03
         DB    $07
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $07
         DB    $02
         DB    $0B
         DB    $02
         DB    $07
         DB    $03
         DB    $06
         DB    $02
         DB    $08
         DB    $02
         DB    $0A
         DB    $02
         DB    $09
         DB    $02
         DB    $08
         DB    $01
         DB    $08
         DB    $02
         DB    $07
         DB    $02
         DB    $07
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $01
         DB    $08
         DB    $01
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $0C
         DB    $02
         DB    $09
         DB    $02
         DB    $08
         DB    $02
         DB    $06
         DB    $03
         DB    $08
         DB    $02
         DB    $08
         DB    $01
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $07
         DB    $02
         DB    $08
         DB    $01
         DB    $08
         DB    $01
         DB    $08
         DB    $01
         DB    $04
         DB    $00
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $09
         DB    $02
         DB    $0A
         DB    $02
         DB    $0C
         DB    $02
         DB    $05
         DB    $02
         DB    $08
         DB    $01
         DB    $08
         DB    $02
         DB    $08
         DB    $02
         DB    $05
         DB    $02
         DB    $05
         DB    $02
         DB    $07
         DB    $02
         DB    $08
         DB    $01
         DB    $08
         DB    $02
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
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
         DB    $01
         DB    $00
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $FF
         DB    $01
         DB    $00
         DB    $FF
         DB    $FF
         DB    $01
         DB    $00
         DB    $08
         DB    $01
         DB    $FF
         DB    $FF
L2208D8  DW    $0000
         DW    $0451
         DW    $0000
         ADRL  L2208FE
         ADRL  L220902
         ADRL  L220910
         ADRL  L22091E
         ADRL  L22092C
         ADRL  L22093A
         ADRL  L220948
         ADRL  L220956
L2208FE  DW    $0000
         DW    $0000
L220902  DW    $0000
         DW    $0006
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L220964
L220910  DW    $0000
         DW    $0064
         DW    $0000
         DW    $0000
         DW    $0080
         ADRL  L2209AD
L22091E  DW    $0000
         DW    $0001
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L220975
L22092C  DW    $0000
         DW    $0002
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L220985
L22093A  DW    $0000
         DW    $0003
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L22098F
L220948  DW    $0000
         DW    $0004
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L220999
L220956  DW    $0000
         DW    $0005
         DW    $0000
         DW    $0000
         DW    $0000
         ADRL  L2209A3
L220964  STR   'Edit Template...'
L220975  STR   'New Template...'
L220985  STR   'Duplicate'
L22098F  STR   'Export...'
L220999  STR   'Rename...'
L2209A3  STR   'Delete...'
L2209AD  STR   '-'

L2209AF  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFA
         TCS
         ADC   #$0015
         TCD
         STZ   $EB
         LDA   $F8
         ORA   $FA
         BEQ   L2209CF
         LDA   [$F8]
         LDY   #$0002
         ORA   [$F8],Y
         BEQ   L2209CF
         LDA   $F6
         STA   $EB
L2209CF  LDA   $EB
         SEC
         SBC   #$00FE
         BEQ   L2209E3
         BVS   L2209DC
         EOR   #$8000
L2209DC  BPL   L2209E3
         LDA   #$00FE
         STA   $EB
L2209E3  LDA   $EB
         LDX   #$FFEB
         SEP   #$20
         STA   $00,X
         REP   #$20
         LDA   $EB
         BMI   L220A12
         BEQ   L220A12
         LDY   #$0002
         LDA   [$F8],Y
         PHA
         LDA   [$F8]
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEC
         PHA
         LDA   $EB
         JSL   L150488
         PHX
         PHA
         JSL   L070597
L220A12  PEI   $FE
         PEI   $FC
         PEA   $0000
         TDC
         CLC
         ADC   #$FFEB
         PHA
         PEA   $0100
         JSL   L0313BE
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$010E
         TCS
         RTL

L220A38  ENT
         PHD
         TSC
         CLC
         ADC   #$FCE8
         TCS
         ADC   #$0229
         TCD
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         TXY
         LDX   #$FEDB
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FEDB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L220A64
         INX
L220A64  STA   $EB
         STX   $ED
         LDA   [$EB]
         PHA
         LDX   #$FEDB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0022
         BCC   L220A7B
         INX
L220A7B  STA   $EB
         STX   $ED
         PLA
         CMP   [$EB]
         BNE   L220A89
         LDA   #$0000
         BRA   L220A8C
L220A89  LDA   #$0001
L220A8C  STA   $E9
         LDA   $FA
         SEC
         SBC   #$0043
         BPL   L220A99
         BRL   L220CAE
L220A99  CMP   #$003D
         BMI   L220AA1
         BRL   L220CAE
L220AA1  SEC
         SBC   #$0000
         BEQ   L220AE4
         SEC
         SBC   #$0013
         BEQ   L220AFB
         DEC
         DEC
         BEQ   L220ACD
         SEC
         SBC   #$000B
         BEQ   L220AE4
         SEC
         SBC   #$0013
         BEQ   L220AFB
         DEC
         DEC
         BEQ   L220ACD
         SEC
         SBC   #$0007
         BNE   L220ACA
         BRL   L220CA4
L220ACA  BRL   L220CAE
L220ACD  LDA   $E9
         BEQ   L220AE1
         PEI   $F8
         PEI   $F6
         JSL   L150C34
         JSL   L150395
         JSL   L150723
L220AE1  BRL   L220CAE
L220AE4  LDA   $E9
         BEQ   L220AF8
         PEI   $F8
         PEI   $F6
         JSL   L15019D
         JSL   L150395
         JSL   L150723
L220AF8  BRL   L220CAE
L220AFB  PHY
         PHY
         PEA   $0000
         JSL   L150B1C
         LDA   #$0100
         LDX   #$0000
         JSL   L033477
         BVS   L220B13
         EOR   #$8000
L220B13  BMI   L220B19
         JSL   L151478
L220B19  PHY
         JSL   L150F6D
         PLA
         STA   $E3
         LDA   $E3
         SEC
         SBC   #$0001
         BVS   L220B2C
         EOR   #$8000
L220B2C  BMI   L220B31
         BRL   L220CA2
L220B31  PHY
         PHY
         JSL   L1516C3
         PLA
         STA   $DF
         PLX
         STX   $E1
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDF
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDD7
         PHA
         PEI   $E1
         PEI   $DF
         PEI   $E3
         JSL   L2209AF
         PEA   $0100
         JSL   L0313BE
         PHY
         PHY
         PEI   $F8
         PEI   $F6
         JSL   L151379
         PLA
         STA   $DF
         PLX
         STX   $E1
         PHY
         PEI   $F8
         PEI   $F6
         JSL   L150807
         PLA
         STA   $E3
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDF
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FDD7
         PHA
         PEI   $E1
         PEI   $DF
         PEI   $E3
         JSL   L2209AF
         PEA   $0100
         JSL   L0313BE
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         TXY
         LDX   #$FED7
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FED7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L220BC0
         INX
L220BC0  STA   $EB
         STX   $ED
         LDA   [$EB]
         INC
         STA   $E7
         LDX   #$FED7
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0022
         BCC   L220BD9
         INX
L220BD9  STA   $EB
         STX   $ED
         LDA   [$EB]
         INC
         STA   $E5
         LDA   $E5
         SEC
         SBC   $E7
         BEQ   L220C07
         BVS   L220BEE
         EOR   #$8000
L220BEE  BPL   L220C07
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDF
         PHA
         PEI   $E7
         LDA   $E5
         SEC
         SBC   $E7
         PHA
         JSL   L150A64
         BRA   L220C32
L220C07  LDA   $E7
         SEC
         SBC   $E5
         BEQ   L220C32
         BVS   L220C13
         EOR   #$8000
L220C13  BPL   L220C32
         LDA   $E7
         STA   $E3
         LDA   $E5
         STA   $E7
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDF
         PHA
         PEI   $E7
         LDA   $E3
         SEC
         SBC   $E7
         PHA
         JSL   L150A64
L220C32  PEA   $0000
         TDC
         CLC
         ADC   #$FFDF
         PHA
         PEI   $F4
         JSL   L221560
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDF
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$FEDF
         PHA
         PEI   $E7
         JSL   L150C4C
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE0
         PHA
         LDA   #$00FF
         LDX   #$FEDF
         AND   $00,X
         PHA
         PEI   $F8
         PEI   $F6
         JSL   L151651
         LDA   #$00FF
         LDX   #$FFDF
         AND   $00,X
         CLC
         ADC   $E7
         DEC
         STA   $E5
         PEI   $E5
         PEI   $E5
         PEI   $F8
         PEI   $F6
         JSL   L1512D1
         LDY   #$0002
         LDA   [$F6],Y
         TAX
         LDA   [$F6]
         CLC
         ADC   #$0010
         BCC   L220C9C
         INX
L220C9C  PHX
         PHA
         JSL   L150B34
L220CA2  BRA   L220CAE
L220CA4  PEI   $F8
         PEI   $F6
         JSL   L15058C
         BRA   L220CAE
L220CAE  LDA   $F2
         STA   $FA
         LDA   $F1
         STA   $F9
         LDA   $EF
         TCD
         TSC
         CLC
         ADC   #$0322
         TCS
         RTL

L220CC0  ENT
         PHD
         TSC
         CLC
         ADC   #$FFD0
         TCS
         TCD
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEI   $38
         PEI   $36
         PEA   $0008
         JSL   L0313BE
         PEI   $3C
         PEI   $3A
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L221769
         PEA   $3333
         JSL   L081DD8
         PEA   $0002
         PEA   $0001
         JSL   L151083
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $0000
         JSL   L151005
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         JSL   L15123D
         LDA   $3A
         LDX   $3C
         STA   $05
         STX   $07
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         LDA   #$0008
         CLC
         ADC   $05
         LDX   $07
         BCC   L220D53
         INX
L220D53  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         PEA   $0004
         PEA   $0000
         JSL   L151005
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         PEA   $3333
         PEA   $FFFF
         JSL   L1501B5
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         LDA   #$0020
         CLC
         ADC   $05
         LDX   $07
         BCC   L220D96
         INX
L220D96  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         LDY   #$0030
         LDA   [$05],Y
         BNE   L220DA9
         BRL   L220F02
L220DA9  LDY   #$0030
         LDA   [$05],Y
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L220DBB
         EOR   #$8000
L220DBB  BMI   L220DC0
         BRL   L220F02
L220DC0  LDA   #$0001
         STA   $2B
L220DC5  TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDY   #$0032
         LDA   [$05],Y
         STA   $03
         LDA   $03
         SEC
         SBC   #$0001
         BVS   L220DF0
         EOR   #$8000
L220DF0  BMI   L220DF5
         BRL   L220EDB
L220DF5  LDA   #$0001
         STA   $29
L220DFA  TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   #$FFFE
         AND   $23
         STA   $23
         LDA   #$FFFE
         AND   $27
         STA   $27
         LDX   #$0000
         LDY   #$002C
         LDA   [$05],Y
         BNE   L220E2C
         INX
L220E2C  PHX
         LDY   #$0030
         LDA   [$05],Y
         SEC
         SBC   #$0001
         BEQ   L220E3F
         BVS   L220E3D
         EOR   #$8000
L220E3D  BMI   L220E44
L220E3F  LDA   #$0000
         BRA   L220E47
L220E44  LDA   #$0001
L220E47  AND   $01,S
         PLX
         LSR
         BCC   L220E53
         LDA   $27
         INC
         INC
         STA   $27
L220E53  LDX   #$0000
         LDY   #$002E
         LDA   [$05],Y
         BNE   L220E5E
         INX
L220E5E  PHX
         LDY   #$0032
         LDA   [$05],Y
         SEC
         SBC   #$0001
         BEQ   L220E71
         BVS   L220E6F
         EOR   #$8000
L220E6F  BMI   L220E76
L220E71  LDA   #$0000
         BRA   L220E79
L220E76  LDA   #$0001
L220E79  AND   $01,S
         PLX
         LSR
         BCC   L220E84
         LDA   $25
         INC
         STA   $25
L220E84  TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         PEA   $3333
         PEA   $FFFF
         JSL   L1501B5
         LDY   #$0034
         LDA   [$05],Y
         BEQ   L220EB4
         PEI   $23
         PEI   $25
         JSL   L1510C5
         LDY   #$002A
         LDA   [$05],Y
         LSR
         PHA
         PEA   $0000
         JSL   L15056E
L220EB4  TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $0000
         LDY   #$0028
         LDA   [$05],Y
         LDY   #$002E
         CLC
         ADC   [$05],Y
         PHA
         JSL   L1501AF
         LDA   $29
         CMP   $03
         BEQ   L220EDB
         INC   $29
         BRL   L220DFA
L220EDB  TDC
         CLC
         ADC   #$0019
         PEA   $0000
         PHA
         LDY   #$002A
         LDA   [$05],Y
         LDY   #$002C
         CLC
         ADC   [$05],Y
         PHA
         PEA   $0000
         JSL   L1501AF
         LDA   $2B
         CMP   $01
         BEQ   L220F02
         INC   $2B
         BRL   L220DC5
L220F02  TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         LDA   #$0010
         CLC
         ADC   $05
         LDX   $07
         BCC   L220F16
         INX
L220F16  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         PEA   $0004
         PEA   $0000
         JSL   L151005
         TDC
         CLC
         ADC   #$0021
         PEA   $0000
         PHA
         PEA   $3333
         PEA   $FFFF
         JSL   L1501B5
         PEA   $0000
         JSL   L081DD8
         LDA   $34
         STA   $3C
         LDA   $33
         STA   $3B
         LDA   $31
         TCD
         TSC
         CLC
         ADC   #$003A
         TCS
         RTL

L220F5E  ENT
         PHD
         TSC
         CLC
         ADC   #$FEFC
         TCS
         ADC   #$0013
         TCD
         LDA   #$0000
         STAL  L051F18
         STAL  L051F1A
         LDA   #$0000
         STAL  L051F1C
         STAL  L051F1E
         LDA   $F6
         BNE   L220FDD
         PEI   $FA
         PEI   $F8
         PEA   $0009
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         JSL   L071169
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         JSL   L071DE3
         PLA
         STAL  L051F18
         PLA
         STAL  L051F1A
         PEI   $FA
         PEI   $F8
         PEA   $0008
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         JSL   L071169
         PHY
         PHY
         PEA   $0000
         TDC
         CLC
         ADC   #$FFED
         PHA
         JSL   L071DE3
         PLA
         STAL  L051F1C
         PLA
         STAL  L051F1E
L220FDD  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$010C
         TCS
         RTL

L220FEF  PHD
         TSC
         CLC
         ADC   #$FEF0
         TCS
         ADC   #$0025
         TCD
         PHY
         PHY
         JSL   L150493
         PLA
         STA   $DB
         PLX
         STX   $DD
         LDA   [$F0]
         BEQ   L221011
         LDA   #$3F48
         STA   $E5
         BRA   L221016
L221011  LDA   #$3EE4
         STA   $E5
L221016  PEI   $FA
         PEI   $F8
         PEA   ^L0408E2
         PEA   L0408E2
         PEA   ^L0408E3
         PEA   L0408E3
         PEA   ^L0408E4
         PEA   L0408E4
         JSL   L073C22
         PHY
         PHY
         PEI   $E5
         JSL   L072834
         PLA
         STA   $DF
         PLX
         STX   $E1
         PEI   $E1
         PEI   $DF
         PEA   $0003
         PEI   $FA
         PEI   $F8
         JSL   L073A7B
         PEI   $E1
         PEI   $DF
         PEA   $0003
         PEA   $0000
         PEA   $0013
         JSL   L0739E4
         LDA   #$0000
         STA   [$F0]
         PEI   $E1
         PEI   $DF
         JSL   L15102F
         PEI   $E1
         PEI   $DF
         JSL   L1511C8
         PEI   $E1
         PEI   $DF
         JSL   L151131
         LDA   L05531F
         LDX   L055321
         PHX
         PHA
         JSL   L150D20
L221087  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $E5
         LDA   #$FFFD
         CMP   $E5
         BNE   L2210E7
         LDA   #$007F
         ANDL  L0540A1
         STA   $E3
         LDA   $E3
         SEC
         SBC   #$000A
         BMI   L2210BC
         CMP   #$0002
         BPL   L2210BC
         SEC
         SBC   #$0000
         BEQ   L2210BA
         DEC
         BEQ   L2210BA
         BRA   L2210BC
L2210BA  BRA   L2210E7
L2210BC  PHY
         PEI   $E1
         PEI   $DF
         JSL   L072354
         PLA
         STA   $E5
         LDA   #$0100
         ANDL  L0540AD
         BEQ   L2210E7
         PEI   $E3
         PHY
         PHY
         PEI   $E1
         PEI   $DF
         PEA   $0003
         JSL   L2212AA
         PEA   $0001
         JSL   L220A38
L2210E7  LDA   $E5
         DEC
         BPL   L2210EF
         BRL   L221180
L2210EF  CMP   #$0009
         BMI   L2210F7
         BRL   L221180
L2210F7  SEC
         SBC   #$0000
         BEQ   L221108
         SEC
         SBC   #$0007
         BEQ   L22114D
         DEC
         BEQ   L221166
         BRA   L221180
L221108  PEI   $E1
         PEI   $DF
         PEA   $0003
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDB
         PHA
         JSL   L071169
         LDA   #$00FF
         LDX   #$FFDB
         AND   $00,X
         BNE   L221137
         PEI   $F6
         PEI   $F4
         PEI   $FA
         PEI   $F8
         PEA   $0014
         JSL   L0313BE
         BRA   L22114B
L221137  PEI   $F6
         PEI   $F4
         PEA   $0000
         TDC
         CLC
         ADC   #$FFDB
         PHA
         PEA   $0014
         JSL   L0313BE
L22114B  BRA   L221180
L22114D  LDA   [$F0]
         BEQ   L221164
         PEA   $0001
         PEI   $E1
         PEI   $DF
         PEA   $0008
         JSL   L073B05
         LDA   #$0000
         STA   [$F0]
L221164  BRA   L221180
L221166  LDA   [$F0]
         DEC
         BEQ   L22117E
         PEA   $0001
         PEI   $E1
         PEI   $DF
         PEA   $0009
         JSL   L073B05
         LDA   #$0001
         STA   [$F0]
L22117E  BRA   L221180
L221180  LDX   #$0000
         LDA   $E5
         DEC
         BNE   L221189
         INX
L221189  PHX
         LDX   #$0000
         LDA   $E5
         DEC
         DEC
         BNE   L221194
         INX
L221194  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L22119E
         BRL   L221087
L22119E  PEI   $E1
         PEI   $DF
         JSL   L072634
         PEI   $DD
         PEI   $DB
         JSL   L151131
         LDX   #$0000
         LDA   $E5
         DEC
         DEC
         BEQ   L2211B8
         INX
L2211B8  TXA
         STA   $FC
         LDA   $EE
         STA   $FA
         LDA   $ED
         STA   $F9
         LDA   $EB
         TCD
         TSC
         CLC
         ADC   #$011E
         TCS
         RTL

L2211CD  PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         PEI   $28
         PEI   $26
         PEA   $0008
         JSL   L0313BE
         PHY
         JSL   L071BFF
         PLA
         STA   $11
         LDA   $22
         LDX   $24
         STA   $01
         STX   $03
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L15123D
         LDY   #$0006
         LDA   [$01],Y
         STA   $0F
         LDA   #$0008
         CLC
         ADC   $05
         STA   $0D
         LDA   #$0003
         AND   $0F
         BNE   L221223
         LDA   #$0018
         STA   $13
         BRA   L221228
L221223  LDA   #$0019
         STA   $13
L221228  LDA   $07
         INC
         INC
         INC
         PHA
         PEI   $0D
         JSL   L1510C5
         PEI   $13
         JSL   L150197
         LDA   #$4000
         AND   $0F
         BEQ   L22125D
         LDA   #$001E
         CLC
         ADC   $07
         PHA
         PEI   $0D
         JSL   L093420
         LDA   #$002E
         CLC
         ADC   $07
         PHA
         PEI   $0D
         JSL   L1510C5
         BRA   L22126A
L22125D  LDA   #$001E
         CLC
         ADC   $07
         PHA
         PEI   $0D
         JSL   L1510C5
L22126A  LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         PHX
         PHA
         JSL   L150592
         LDY   #$0004
         LDA   #$0080
         AND   [$01],Y
         CMP   #$0000
         BEQ   L221292
         TDC
         CLC
         ADC   #$0005
         PEA   $0000
         PHA
         JSL   L150383
L221292  PEI   $11
         JSL   L071AA4
         LDA   $1C
         STA   $28
         LDA   $1B
         STA   $27
         LDA   $19
         TCD
         TSC
         CLC
         ADC   #$0026
         TCS
         RTL

L2212AA  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PEI   $12
         PEI   $10
         LDA   $0E
         JSL   L150488
         PHX
         PHA
         JSL   L151367
         PLA
         STA   $01
         PLX
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$001C
         BCC   L2212D9
         INX
L2212D9  STA   $05
         STX   $07
         LDY   #$0002
         LDA   [$05],Y
         TAX
         LDA   [$05]
         STA   $14
         STX   $16
         LDA   $0C
         STA   $12
         LDA   $0B
         STA   $11
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0010
         TCS
         RTL

L2212FB  ENT
         PHD
         TSC
         CLC
         ADC   #$FF82
         TCS
         TCD
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEI   $94
         PEI   $92
         PEA   $0020
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEI   $8C
         PEI   $8A
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEI   $88
         PEI   $86
         PEA   $0008
         JSL   L0313BE
         PHY
         JSL   L150BDC
         PLA
         STA   $75
         TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         JSL   L15119E
         PEA   $0002
         JSL   L150BD6
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L151198
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0051
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         LDA   $8E
         LDX   $90
         STA   $71
         STX   $73
         LDA   $8E
         LDX   $90
         STA   $69
         STX   $6B
         LDA   $90
         SEC
         SBC   $53
         STA   $90
         LDA   $8E
         SEC
         SBC   $51
         STA   $8E
L2213C5  LDA   $6B
         BPL   L2213CB
         STZ   $6B
L2213CB  LDA   $69
         BPL   L2213D1
         STZ   $69
L2213D1  PHY
         PHY
         PEI   $6B
         PEI   $69
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L1505B6
         PLA
         STA   $69
         PLX
         STX   $6B
         LDA   $6B
         SEC
         SBC   $73
         STA   $79
         LDA   $79
         BMI   L221409
         BEQ   L221409
         PHY
         PEI   $79
         LDA   $07
         SEC
         SBC   $0F
         PHA
         JSL   L072FD5
         PLA
         STA   $79
         BRA   L221419
L221409  PHY
         PEI   $79
         LDA   $03
         SEC
         SBC   $0B
         PHA
         JSL   L072FA6
         PLA
         STA   $79
L221419  LDA   $84
         BEQ   L221431
         PEI   $79
         PEI   $79
         PEI   $84
         JSL   L150318
         PLX
         PLX
         STA   $7B
         PLA
         SEC
         SBC   $7B
         STA   $79
L221431  LDA   $69
         SEC
         SBC   $71
         STA   $77
         LDA   $77
         BMI   L221450
         BEQ   L221450
         PHY
         PEI   $77
         LDA   $05
         SEC
         SBC   $0D
         PHA
         JSL   L072FD5
         PLA
         STA   $77
         BRA   L221460
L221450  PHY
         PEI   $77
         LDA   $01
         SEC
         SBC   $09
         PHA
         JSL   L072FA6
         PLA
         STA   $77
L221460  LDA   $84
         BEQ   L221482
         PEI   $77
         PEI   $77
         PEI   $84
         PEA   $0002
         JSL   L1500F5
         PLX
         PLX
         PHA
         JSL   L150318
         PLX
         PLX
         STA   $7B
         PLA
         SEC
         SBC   $7B
         STA   $77
L221482  TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEI   $79
         PEI   $77
         JSL   L1501AF
         PHY
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         JSL   L1501A9
         PLA
         LSR
         BCS   L2214FA
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0009
         PEA   $0000
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         JSL   L151418
         TDC
         CLC
         ADC   #$0071
         PEA   $0000
         PHA
         LDA   $90
         CLC
         ADC   $63
         PHA
         LDA   $8E
         CLC
         ADC   $61
         PHA
         JSL   L151355
L2214FA  TDC
         CLC
         ADC   #$0069
         PEA   $0000
         PHA
         JSL   L150801
         PHY
         PEA   $0000
         JSL   L15164B
         PLA
         EOR   #$0001
         BNE   L221518
         BRL   L2213C5
L221518  LDA   $63
         SEC
         SBC   $53
         STA   $6F
         LDA   $61
         SEC
         SBC   $51
         STA   $6D
         LDA   $6D
         LDX   $6F
         STA   $96
         STX   $98
         TDC
         CLC
         ADC   #$0061
         PEA   $0000
         PHA
         JSL   L151418
         PEI   $75
         JSL   L150BD6
         TDC
         CLC
         ADC   #$0031
         PEA   $0000
         PHA
         JSL   L151198
         LDA   $82
         STA   $94
         LDA   $81
         STA   $93
         LDA   $7F
         TCD
         TSC
         CLC
         ADC   #$0092
         TCS
         RTL

L221560  PHD
         TSC
         CLC
         ADC   #$FEF4
         TCS
         ADC   #$001B
         TCD
         STZ   $E7
         LDA   #$00FF
         AND   [$F8]
         LDX   #$FFE5
         STA   $00,X
         LDX   #$FFE5
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L221585
         EOR   #$8000
L221585  BMI   L22158A
         BRL   L221619
L22158A  LDA   #$0001
         STA   $E9
L22158F  LDY   $E9
         LDA   #$00FF
         AND   [$F8],Y
         STA   $EB
         LDA   $F6
         DEC
         BMI   L2215F3
         CMP   #$0002
         BPL   L2215F3
         SEC
         SBC   #$0000
         BEQ   L2215AD
         DEC
         BEQ   L2215BE
         BRA   L2215F3
L2215AD  LDA   $EB
         SEC
         SBC   #$0020
         BVS   L2215B8
         EOR   #$8000
L2215B8  BMI   L2215BC
         STZ   $EB
L2215BC  BRA   L2215F3
L2215BE  LDA   $EB
         SEC
         SBC   #$0030
         BVS   L2215C9
         EOR   #$8000
L2215C9  BPL   L2215D0
         LDA   #$0000
         BRA   L2215D3
L2215D0  LDA   #$0001
L2215D3  PHA
         LDA   $EB
         SEC
         SBC   #$003A
         BVS   L2215DF
         EOR   #$8000
L2215DF  BMI   L2215E6
         LDA   #$0000
         BRA   L2215E9
L2215E6  LDA   #$0001
L2215E9  ORA   $01,S
         PLX
         LSR
         BCC   L2215F1
         STZ   $EB
L2215F1  BRA   L2215F3
L2215F3  LDA   $EB
         BEQ   L22160B
         LDA   $E7
         INC
         STA   $E7
         LDA   $E7
         CLC
         ADC   #$FFE7
         TAX
         LDA   $EB
         SEP   #$20
         STA   $00,X
         REP   #$20
L22160B  LDA   $E9
         LDX   #$FFE5
         CMP   $00,X
         BEQ   L221619
         INC   $E9
         BRL   L22158F
L221619  LDA   $E7
         LDX   #$FFE7
         SEP   #$20
         STA   $00,X
         REP   #$20
         PEA   $0000
         TDC
         CLC
         ADC   #$FFE7
         PHA
         PEI   $FA
         PEI   $F8
         LDA   $E7
         INC
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$0114
         TCS
         RTL

L221650  PHD
         TSC
         CLC
         ADC   #$FFF4
         TCS
         TCD
         PHY
         PHY
         LDA   [$1A]
         LDY   #$0011
         SEC
         SBC   [$12],Y
         PHA
         LDY   #$001B
         LDA   [$12],Y
         PHA
         JSL   L150C46
         PLA
         STA   $05
         PLX
         STX   $07
         PHY
         PHY
         PEI   $07
         PEI   $05
         LDY   #$0013
         LDA   [$12],Y
         JSL   L150488
         PHX
         PHA
         JSL   L15007C
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $1A
         LDX   $1C
         STA   $09
         STX   $0B
         PHY
         PEI   $03
         PEI   $01
         JSL   L15057A
         LDY   #$0019
         PLA
         CLC
         ADC   [$12],Y
         STA   [$09]
         PHY
         PHY
         LDA   [$16]
         LDY   #$000D
         SEC
         SBC   [$12],Y
         PHA
         LDY   #$0017
         LDA   [$12],Y
         PHA
         JSL   L150C46
         PLA
         STA   $05
         PLX
         STX   $07
         PHY
         PHY
         PEI   $07
         PEI   $05
         LDY   #$000F
         LDA   [$12],Y
         JSL   L150488
         PHX
         PHA
         JSL   L15007C
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $16
         LDX   $18
         STA   $09
         STX   $0B
         PHY
         PEI   $03
         PEI   $01
         JSL   L15057A
         LDY   #$0015
         PLA
         CLC
         ADC   [$12],Y
         STA   [$09]
         LDA   $10
         STA   $1C
         LDA   $0F
         STA   $1B
         LDA   $0D
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L22170A  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         LDA   $12
         LDX   $14
         STA   $01
         STX   $03
         LDA   #$0002
         CLC
         ADC   $01
         LDX   $03
         BCC   L221725
         INX
L221725  PHX
         PHA
         PEI   $03
         PEI   $01
         PEA   $0000
         PEI   $0E
         JSL   L221650
         LDA   #$0006
         CLC
         ADC   $01
         LDX   $03
         BCC   L22173F
         INX
L22173F  PHX
         PHA
         LDA   #$0004
         CLC
         ADC   $01
         LDX   $03
         BCC   L22174C
         INX
L22174C  PHX
         PHA
         PEA   $0000
         PEI   $0E
         JSL   L221650
         LDA   $0C
         STA   $14
         LDA   $0B
         STA   $13
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L221769  PHD
         TSC
         CLC
         ADC   #$FFE0
         TCS
         TCD
         LDA   $2A
         LDX   $2C
         STA   $09
         STX   $0B
         PHY
         PEI   $0B
         PEI   $09
         PEI   $28
         PEI   $26
         JSL   L1501A9
         PLA
         LSR
         BCC   L22178D
         BRL   L22188D
L22178D  LDA   $26
         LDX   $28
         STA   $05
         STX   $07
         LDY   #$0006
         LDA   [$05],Y
         LDY   #$0002
         SEC
         SBC   [$05],Y
         STA   $1B
         LDY   #$0002
         LDA   [$05],Y
         STA   $19
         LDY   #$0004
         LDA   [$05],Y
         SEC
         SBC   [$05]
         STA   $17
         LDA   [$05]
         STA   $15
         LDA   $09
         LDX   $0B
         STA   $01
         STX   $03
         LDY   #$0006
         LDA   [$01],Y
         LDY   #$0002
         SEC
         SBC   [$01],Y
         STA   $13
         LDY   #$0002
         LDA   [$01],Y
         STA   $11
         LDY   #$0004
         LDA   [$01],Y
         SEC
         SBC   [$01]
         STA   $0F
         LDA   [$01]
         STA   $0D
         PEI   $0B
         PEI   $09
         PEA   $0000
         PHD
         JSL   L22170A
         LDA   #$0008
         CLC
         ADC   $09
         LDX   $0B
         BCC   L2217F8
         INX
L2217F8  PHX
         PHA
         PEA   $0000
         PHD
         JSL   L22170A
         LDA   #$0010
         CLC
         ADC   $09
         LDX   $0B
         BCC   L22180D
         INX
L22180D  PHX
         PHA
         PEA   $0000
         PHD
         JSL   L22170A
         LDA   #$0018
         CLC
         ADC   $09
         LDX   $0B
         BCC   L221822
         INX
L221822  PHX
         PHA
         PEA   $0000
         PHD
         JSL   L22170A
         LDA   #$0020
         CLC
         ADC   $09
         LDX   $0B
         BCC   L221837
         INX
L221837  PHX
         PHA
         PEA   $0000
         PHD
         JSL   L22170A
         STZ   $19
         STZ   $15
         STZ   $11
         STZ   $0D
         LDA   #$002A
         CLC
         ADC   $09
         LDX   $0B
         BCC   L221854
         INX
L221854  PHX
         PHA
         LDA   #$0028
         CLC
         ADC   $09
         LDX   $0B
         BCC   L221861
         INX
L221861  PHX
         PHA
         PEA   $0000
         PHD
         JSL   L221650
         LDA   #$002E
         CLC
         ADC   $09
         LDX   $0B
         BCC   L221876
         INX
L221876  PHX
         PHA
         LDA   #$002C
         CLC
         ADC   $09
         LDX   $0B
         BCC   L221883
         INX
L221883  PHX
         PHA
         PEA   $0000
         PHD
         JSL   L221650
L22188D  LDA   $24
         STA   $2C
         LDA   $23
         STA   $2B
         LDA   $21
         TCD
         TSC
         CLC
         ADC   #$002A
         TCS
         RTL

L22189F  ENT
         PHD
         TSC
         CLC
         ADC   #$FFBA
         TCS
         TCD
         LDAL  L0408E5
         SEP   #$20
         STA   $29
         REP   #$20
         LDAL  L0408E6
         SEP   #$20
         STA   $15
         REP   #$20
         LDAL  L051F18
         ORAL  L051F1A
         BEQ   L2218C8
         LDA   #$0001
L2218C8  STA   $41
         LDAL  L051F1C
         ORAL  L051F1E
         BEQ   L2218D7
         LDA   #$0001
L2218D7  STA   $3F
         LDA   $41
         BEQ   L221904
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDAL  L051F1A
         PHA
         LDAL  L051F18
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
L221904  LDA   $3F
         BEQ   L22192F
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         PEA   $0000
         TDC
         CLC
         ADC   #$0001
         PHA
         LDAL  L051F1E
         PHA
         LDAL  L051F1C
         PHA
         JSL   L07346C
         PEA   $0014
         JSL   L0313BE
L22192F  LDA   $3F
         ORA   $41
         EOR   #$0001
         STA   $3D
         PEI   $3D
         PEI   $4E
         PEI   $4C
         PEA   $0006
         JSL   L073B05
         PEI   $4E
         PEI   $4C
         PEA   $0009
         TDC
         CLC
         ADC   #$0029
         PEA   $0000
         PHA
         JSL   L073A7B
         PEI   $4E
         PEI   $4C
         PEA   $0008
         TDC
         CLC
         ADC   #$0015
         PEA   $0000
         PHA
         JSL   L073A7B
         LDA   $3D
         STA   $50
         LDA   $4A
         STA   $4E
         LDA   $49
         STA   $4D
         LDA   $47
         TCD
         TSC
         CLC
         ADC   #$004C
         TCS
         RTL

L221983  ENT
         PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         PHY
         PHY
         PEA   $0000
         PEA   $01D4
         PEA   $0000
         PEA   $07D7
         JSL   L160A30
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L2219C2
         PEA   ^L051EF0
         PEA   L051EF0
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         PEA   $0000
         PEA   $01D4
         JSL   L070597
L2219C2  LDA   $01
         LDX   $03
         STA   $0E
         STX   $10
         PLY
         PLY
         PLY
         PLY
         PLD
         RTL

L2219D0  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         STZ   $05
         STZ   $07
         LDA   $1A
         ORA   $1C
         BEQ   L221A54
         PHY
         PHY
         PEI   $1C
         PEI   $1A
         PEI   $18
         PEI   $16
         PEA   $0000
         JSL   L077624
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L221A54
         PHY
         PHY
         PEI   $03
         PEI   $01
         JSL   L151301
         PLA
         STA   $09
         PLX
         STX   $0B
         PHY
         PHY
         PEI   $0B
         PEI   $09
         PEA   $0000
         PEA   $07D8
         JSL   L160A30
         PLA
         STA   $05
         PLX
         STX   $07
         LDA   $05
         ORA   $07
         BEQ   L221A45
         LDY   #$0002
         LDA   [$01],Y
         PHA
         LDA   [$01]
         PHA
         LDY   #$0002
         LDA   [$05],Y
         PHA
         LDA   [$05]
         PHA
         PEI   $0B
         PEI   $09
         JSL   L070597
L221A45  PEI   $1C
         PEI   $1A
         PEI   $18
         PEI   $16
         PEA   $0000
         JSL   L074B81
L221A54  LDA   $05
         LDX   $07
         STA   $1E
         STX   $20
         LDA   $14
         STA   $1C
         LDA   $13
         STA   $1B
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L221A6E  PHD
         TSC
         CLC
         ADC   #$FFF8
         TCS
         TCD
         STZ   $16
         STZ   $18
         PHY
         PHY
         PEI   $14
         PEI   $12
         PEI   $10
         PEI   $0E
         PEA   $0000
         JSL   L077624
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L221ABA
         PHY
         PHY
         PEI   $03
         PEI   $01
         PEI   $10
         PEI   $0E
         JSL   L221ACC
         PLA
         STA   $16
         PLX
         STX   $18
         PEI   $14
         PEI   $12
         PEI   $10
         PEI   $0E
         PEA   $0000
         JSL   L074B81
L221ABA  LDA   $0C
         STA   $14
         LDA   $0B
         STA   $13
         LDA   $09
         TCD
         TSC
         CLC
         ADC   #$0012
         TCS
         RTL

L221ACC  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         STZ   $05
         STZ   $07
         LDA   $1A
         ORA   $1C
         BNE   L221AE1
         BRL   L221B6E
L221AE1  PHY
         PHY
         PEI   $1C
         PEI   $1A
         JSL   L151301
         PLA
         STA   $09
         PLX
         STX   $0B
         PHY
         PHY
         PEI   $0B
         PEI   $09
         PEI   $18
         PEI   $16
         PEA   $0000
         PEA   $0000
         JSL   L07502A
         PLA
         STA   $05
         PLX
         STX   $07
         PHY
         PHY
         PEI   $07
         PEI   $05
         PEI   $18
         PEI   $16
         PEA   $0000
         JSL   L077624
         PLA
         STA   $01
         PLX
         STX   $03
         LDA   $01
         ORA   $03
         BEQ   L221B6E
         LDY   #$0002
         LDA   [$1A],Y
         TAX
         LDA   [$1A]
         CLC
         ADC   #$000C
         BCC   L221B37
         INX
L221B37  PHX
         PHA
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         CLC
         ADC   #$000C
         BCC   L221B48
         INX
L221B48  PHX
         PHA
         LDA   $09
         LDX   $0B
         SEC
         SBC   #$000C
         BCS   L221B55
         DEX
L221B55  PHX
         PHA
         JSL   L070597
         PEI   $07
         PEI   $05
         PEI   $18
         PEI   $16
         LDA   L055051
         EOR   #$0001
         PHA
         JSL   L074B81
L221B6E  LDA   $05
         LDX   $07
         STA   $1E
         STX   $20
         LDA   $14
         STA   $1C
         LDA   $13
         STA   $1B
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$001A
         TCS
         RTL

L221B88  ENT
         PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   $0A
         ORA   $0C
         BNE   L221B9A
         STZ   $0E
         BRA   L221BB7
L221B9A  PHY
         LDY   #$0002
         LDA   [$0A],Y
         PHA
         LDA   [$0A]
         PHA
         PEA   ^L051EF0
         PEA   L051EF0
         PEA   $01D4
         JSL   L070A10
         PLA
         EOR   #$0001
         STA   $0E
L221BB7  LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L221BC8  PHD
         TSC
         CLC
         ADC   #$FFE8
         TCS
         TCD
         LDA   #$0011
         CLC
         ADC   $1E
         LDX   $20
         BCC   L221BDB
         INX
L221BDB  CLC
         ADC   #$0008
         BCC   L221BE2
         INX
L221BE2  STA   $15
         STX   $17
         LDA   [$15]
         STA   $0F
         LDY   #$006D
         LDA   [$1E],Y
         TAX
         DEY
         DEY
         LDA   [$1E],Y
         CLC
         ADC   #$0006
         BCC   L221BFB
         INX
L221BFB  CLC
         ADC   #$0002
         BCC   L221C02
         INX
L221C02  STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         PHX
         PHA
         LDA   #$0039
         CLC
         ADC   $1E
         LDX   $20
         BCC   L221C1B
         INX
L221C1B  CLC
         ADC   #$0002
         BCC   L221C22
         INX
L221C22  STA   $15
         STX   $17
         PLA
         PLX
         CMP   [$15]
         BNE   L221C32
         LDY   #$0002
         TXA
         CMP   [$15],Y
L221C32  BNE   L221C7B
         PHY
         PHY
         PEA   $0844
         JSL   L0711EB
         LDY   #$006D
         LDA   [$1E],Y
         TAX
         DEY
         DEY
         LDA   [$1E],Y
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         PHX
         PHA
         PEA   ^L04088A
         PEA   L04088A
         PEA   ^L04088C
         PEA   L04088C
         JSL   L15065F
         PHY
         PEA   ^L040E18
         PEA   L040E18
         PEA   $0000
         PEA   $0000
         JSL   L15108F
         PLA
         STA   $0D
         BRA   L221CBD
L221C7B  PEA   ^L04088E
         PEA   L04088E
         LDY   #$006D
         LDA   [$1E],Y
         TAX
         DEY
         DEY
         LDA   [$1E],Y
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         PHX
         PHA
         PEA   ^L040890
         PEA   L040890
         PEA   ^L040892
         PEA   L040892
         JSL   L15065F
         PHY
         PEA   ^L040E18
         PEA   L040E18
         PEA   $0000
         PEA   $0000
         JSL   L1505AA
         PLA
         STA   $0D
L221CBD  LDA   $0D
         DEC
         BEQ   L221CC5
         BRL   L221E92
L221CC5  PHY
         JSL   L073CDF
         PLA
         STA   $13
         PHY
         LDY   #$006D
         LDA   [$1E],Y
         TAX
         DEY
         DEY
         LDA   [$1E],Y
         CLC
         ADC   #$0006
         BCC   L221CDF
         INX
L221CDF  CLC
         ADC   #$0002
         BCC   L221CE6
         INX
L221CE6  STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         PHX
         PHA
         PEA   $544E
         PEA   $5250
         JSL   L0751BE
         PLA
         STA   $11
         LDY   #$006D
         LDA   [$1E],Y
         TAX
         DEY
         DEY
         LDA   [$1E],Y
         CLC
         ADC   #$0006
         BCC   L221D12
         INX
L221D12  CLC
         ADC   #$0006
         BCC   L221D19
         INX
L221D19  STA   $15
         STX   $17
         LDA   [$15]
         LDY   #$0002
         ORA   [$15],Y
         BEQ   L221D5A
         PHY
         LDY   #$006D
         LDA   [$1E],Y
         TAX
         DEY
         DEY
         LDA   [$1E],Y
         CLC
         ADC   #$0006
         BCC   L221D38
         INX
L221D38  CLC
         ADC   #$0006
         BCC   L221D3F
         INX
L221D3F  STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         PHX
         PHA
         PEA   $5041
         PEA   $4D42
         JSL   L0751BE
         PLA
         STA   $11
L221D5A  LDY   #$006D
         LDA   [$1E],Y
         TAX
         DEY
         DEY
         LDA   [$1E],Y
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         STA   $15
         STX   $17
         LDAL  L040894
         SEP   #$20
         STA   [$15]
         REP   #$20
         LDY   #$005D
         LDA   [$1E],Y
         TAX
         DEY
         DEY
         LDA   [$1E],Y
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         PHX
         PHA
         LDA   $0F
         JSL   L150488
         TAY
         BNE   L221DA0
         DEX
L221DA0  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $09
         STX   $0B
         LDY   #$006D
         LDA   [$1E],Y
         TAX
         DEY
         DEY
         LDA   [$1E],Y
         CMP   $09
         BNE   L221DC5
         CPX   $0B
L221DC5  BEQ   L221DE0
         PEI   $0B
         PEI   $09
         LDY   #$006D
         LDA   [$1E],Y
         PHA
         DEY
         DEY
         LDA   [$1E],Y
         PHA
         PEA   $0000
         PEA   $0046
         JSL   L070597
L221DE0  PEI   $0B
         PEI   $09
         PEA   $0000
         PEA   $0046
         JSL   L071EC5
         LDA   #$0011
         CLC
         ADC   $1E
         LDX   $20
         BCC   L221DF9
         INX
L221DF9  CLC
         ADC   #$0008
         BCC   L221E00
         INX
L221E00  STA   $15
         STX   $17
         LDA   $0F
         DEC
         STA   [$15]
         PEA   $0000
         PEA   $0000
         LDA   #$0011
         CLC
         ADC   $1E
         LDX   $20
         BCC   L221E1A
         INX
L221E1A  PHX
         PHA
         JSL   L15109B
         LDY   #$005D
         LDA   [$1E],Y
         TAX
         DEY
         DEY
         LDA   [$1E],Y
         STA   $15
         STX   $17
         LDY   #$0002
         LDA   [$15],Y
         TAX
         LDA   [$15]
         PHX
         PHA
         LDA   #$0011
         CLC
         ADC   $1E
         LDX   $20
         BCC   L221E43
         INX
L221E43  PHX
         PHA
         JSL   L1500EF
         LDA   #$0001
         STA   L055337
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   #$0043
         CLC
         ADC   $1E
         LDX   $20
         BCC   L221E63
         INX
L221E63  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $0000
         JSL   L151005
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150B34
         PEI   $13
         JSL   L0724F7
L221E92  PEA   $0000
         PEI   $1E
         JSL   L222CB0
         JSL   L09AFB1
         LDA   $1C
         STA   $20
         LDA   $1B
         STA   $1F
         LDA   $19
         TCD
         TSC
         CLC
         ADC   #$001E
         TCS
         RTL

L221EB1  PHD
         TSC
         CLC
         ADC   #$FFA0
         TCS
         TCD
         LDA   $6A
         DEC
         DEC
         BNE   L221EEB
         STZ   $57
         PHY
         PHY
         PHY
         PEA   $0849
         JSL   L0711EB
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0057
         PEA   $0000
         PHA
         JSL   L220FEF
         PLA
         STA   $59
         LDA   $59
         BNE   L221EEB
         BRL   L222427
L221EEB  PHY
         JSL   L073CDF
         PLA
         STA   $5B
         LDA   $6A
         DEC
         DEC
         BNE   L221F09
         PHY
         PHY
         PEI   $57
         JSL   L160B48
         PLA
         STA   $49
         PLX
         STX   $4B
         BRA   L221F41
L221F09  PHY
         PHY
         LDY   #$006D
         LDA   [$66],Y
         TAX
         DEY
         DEY
         LDA   [$66],Y
         CLC
         ADC   #$0006
         BCC   L221F1C
         INX
L221F1C  CLC
         ADC   #$0002
         BCC   L221F23
         INX
L221F23  STA   $5D
         STX   $5F
         LDY   #$0002
         LDA   [$5D],Y
         TAX
         LDA   [$5D]
         PHX
         PHA
         PEA   $544E
         PEA   $5250
         JSL   L221A6E
         PLA
         STA   $49
         PLX
         STX   $4B
L221F41  LDA   $49
         ORA   $4B
         BNE   L221F51
         PEA   $0845
         JSL   L0727E0
         BRL   L222427
L221F51  LDA   $6A
         DEC
         DEC
         BNE   L221F5D
         STZ   $45
         STZ   $47
         BRA   L221FCD
L221F5D  LDY   #$006D
         LDA   [$66],Y
         TAX
         DEY
         DEY
         LDA   [$66],Y
         CLC
         ADC   #$0006
         BCC   L221F6E
         INX
L221F6E  CLC
         ADC   #$0006
         BCC   L221F75
         INX
L221F75  STA   $5D
         STX   $5F
         LDA   [$5D]
         LDY   #$0002
         ORA   [$5D],Y
         BEQ   L221FC9
         PHY
         PHY
         LDY   #$006D
         LDA   [$66],Y
         TAX
         DEY
         DEY
         LDA   [$66],Y
         CLC
         ADC   #$0006
         BCC   L221F95
         INX
L221F95  CLC
         ADC   #$0006
         BCC   L221F9C
         INX
L221F9C  STA   $5D
         STX   $5F
         LDY   #$0002
         LDA   [$5D],Y
         TAX
         LDA   [$5D]
         PHX
         PHA
         PEA   $5041
         PEA   $4D42
         JSL   L221A6E
         PLA
         STA   $45
         PLX
         STX   $47
         LDA   $45
         ORA   $47
         BNE   L221FC7
         PEA   $0846
         JSL   L0727E0
L221FC7  BRA   L221FCD
L221FC9  STZ   $45
         STZ   $47
L221FCD  PHY
         PHY
         PEI   $4B
         PEI   $49
         PEA   $544E
         PEA   $5250
         PEA   $0000
         JSL   L077624
         PLA
         STA   $41
         PLX
         STX   $43
         LDA   $41
         ORA   $43
         BNE   L221FEF
         BRL   L22241E
L221FEF  PHY
         PEI   $43
         PEI   $41
         JSL   L0718A4
         PLA
         STA   $4D
         PEI   $43
         PEI   $41
         JSL   L0718BF
         LDA   $6A
         DEC
         BMI   L222086
         CMP   #$0002
         BPL   L222086
         SEC
         SBC   #$0000
         BEQ   L222018
         DEC
         BEQ   L222084
         BRA   L222086
L222018  TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         CLC
         ADC   #$000C
         BCC   L222030
         INX
L222030  PHX
         PHA
         PEA   $0014
         JSL   L0313BE
         LDA   #$00FF
         AND   $25
         SEC
         SBC   #$0013
         BVS   L222047
         EOR   #$8000
L222047  BMI   L22207A
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         PEA   ^L040895
         PEA   L040895
         TDC
         CLC
         ADC   #$000F
         PEA   $0000
         PHA
         PEA   $0002
         JSL   L1509CE
         PEA   $0014
         JSL   L0313BE
         BRA   L222082
L22207A  SEP   #$20
         LDA   #$32
         STA   $38
         REP   #$20
L222082  BRA   L222086
L222084  BRA   L222086
L222086  LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         STA   $0B
         STX   $0D
         LDA   #$000C
         CLC
         ADC   $0B
         LDX   $0D
         BCC   L22209D
         INX
L22209D  PHX
         PHA
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         PEA   $0014
         JSL   L0313BE
         LDY   #$0020
         LDA   #$BFFF
         AND   [$0B],Y
         LDY   #$0020
         STA   [$0B],Y
         LDA   $45
         ORA   $47
         BNE   L2220D1
         LDY   #$0020
         LDA   #$FFFB
         AND   [$0B],Y
         LDY   #$0020
         STA   [$0B],Y
         BRA   L2220DE
L2220D1  LDY   #$0020
         LDA   #$0004
         ORA   [$0B],Y
         LDY   #$0020
         STA   [$0B],Y
L2220DE  LDY   #$0020
         LDA   [$0B],Y
         STA   $4F
         LDA   #$0011
         CLC
         ADC   $66
         LDX   $68
         BCC   L2220F0
         INX
L2220F0  STA   $07
         STX   $09
         LDY   #$0008
         LDA   [$07],Y
         INC
         LDY   #$0008
         STA   [$07],Y
         LDY   #$0008
         LDA   [$07],Y
         STA   $55
         LDY   #$005D
         LDA   [$66],Y
         TAX
         DEY
         DEY
         LDA   [$66],Y
         STA   $5D
         STX   $5F
         LDY   #$0002
         LDA   [$5D],Y
         TAX
         LDA   [$5D]
         PHX
         PHA
         LDA   $55
         JSL   L150488
         TAY
         BNE   L222128
         DEX
L222128  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0006
         BCC   L222140
         INX
L222140  STA   $03
         STX   $05
         LDA   $49
         LDX   $4B
         LDY   #$0002
         STA   [$03],Y
         INY
         INY
         TXA
         STA   [$03],Y
         LDA   $45
         LDX   $47
         LDY   #$0006
         STA   [$03],Y
         INY
         INY
         TXA
         STA   [$03],Y
         LDA   $4F
         STA   [$03]
         LDY   #$0002
         LDA   [$41],Y
         TAX
         LDA   [$41]
         CLC
         ADC   #$0022
         BCC   L222173
         INX
L222173  PHX
         PHA
         LDY   #$005D
         LDA   [$66],Y
         TAX
         DEY
         DEY
         LDA   [$66],Y
         STA   $5D
         STX   $5F
         LDY   #$0002
         LDA   [$5D],Y
         TAX
         LDA   [$5D]
         PHX
         PHA
         LDA   $55
         JSL   L150488
         TAY
         BNE   L222197
         DEX
L222197  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0010
         BCC   L2221AF
         INX
L2221AF  PHX
         PHA
         JSL   L160A3E
         PEI   $43
         PEI   $41
         PEI   $4D
         JSL   L0718DA
         PEI   $4B
         PEI   $49
         PEA   $544E
         PEA   $5250
         LDA   L055051
         EOR   #$0001
         PHA
         JSL   L074B81
         LDA   #$0001
         STA   $53
L2221D9  PHA
         LDY   #$005D
         LDA   [$66],Y
         TAX
         DEY
         DEY
         LDA   [$66],Y
         STA   $5D
         STX   $5F
         LDY   #$0002
         LDA   [$5D],Y
         TAX
         LDA   [$5D]
         CLC
         ADC   #$08C0
         BCC   L2221F7
         INX
L2221F7  PHX
         PHA
         LDA   $53
         JSL   L150488
         TAY
         BNE   L222203
         DEX
L222203  DEC
         PEA   $0000
         PEA   $0014
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEA   ^L040897
         PEA   L040897
         JSL   L1503DD
         PLA
         LSR
         BCC   L222226
         BRA   L222231
L222226  LDA   #$0020
         CMP   $53
         BEQ   L222231
         INC   $53
         BRA   L2221D9
L222231  LDY   #$005D
         LDA   [$66],Y
         TAX
         DEY
         DEY
         LDA   [$66],Y
         STA   $5D
         STX   $5F
         LDY   #$0002
         LDA   [$5D],Y
         TAX
         LDA   [$5D]
         PHX
         PHA
         LDA   $55
         JSL   L150488
         TAY
         BNE   L222253
         DEX
L222253  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         LDY   #$005D
         LDA   [$66],Y
         TAX
         DEY
         DEY
         LDA   [$66],Y
         STA   $5D
         STX   $5F
         LDY   #$0002
         LDA   [$5D],Y
         TAX
         LDA   [$5D]

*

         CLC
         ADC   #$08C0
         BCC   L222283
         INX
L222283  PHX
         PHA
         LDA   $53
         JSL   L150488
         TAY
         BNE   L22228F
         DEX
L22228F  DEC
         PEA   $0000
         PEA   $0014
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PLA
         PLY
         PLX
         STX   $5D
         PLX
         STX   $5F
         STA   [$5D]
         TYA
         LDY   #$0002
         STA   [$5D],Y
         TDC
         CLC
         ADC   #$0025
         PEA   $0000
         PHA
         LDY   #$005D
         LDA   [$66],Y
         TAX
         DEY
         DEY
         LDA   [$66],Y
         STA   $5D
         STX   $5F
         LDY   #$0002
         LDA   [$5D],Y
         TAX
         LDA   [$5D]
         CLC
         ADC   #$08C0
         BCC   L2222D8
         INX
L2222D8  PHX
         PHA
         LDA   $53
         JSL   L150488
         TAY
         BNE   L2222E4
         DEX
L2222E4  DEC
         PEA   $0000
         PEA   $0014
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         LDA   #$00FF
         AND   $25
         INC
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         PEA   $0000
         PEA   $0000
         LDA   #$0011
         CLC
         ADC   $66
         LDX   $68
         BCC   L222318
         INX
L222318  PHX
         PHA
         JSL   L15109B
         LDA   $55
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L22232D
         EOR   #$8000
L22232D  BPL   L222395
         LDA   #$0001
         STA   $51
L222334  LDY   #$005D
         LDA   [$66],Y
         TAX
         DEY
         DEY
         LDA   [$66],Y
         STA   $5D
         STX   $5F
         LDY   #$0002
         LDA   [$5D],Y
         TAX
         LDA   [$5D]
         PHX
         PHA
         LDA   $51
         JSL   L150488
         TAY
         BNE   L222356
         DEX
L222356  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0006
         BCC   L22236E
         INX
L22236E  CLC
         ADC   #$0002
         BCC   L222375
         INX
L222375  STA   $5D
         STX   $5F
         LDA   $49
         LDX   $4B
         CMP   [$5D]
         BNE   L222387
         LDY   #$0002
         TXA
         CMP   [$5D],Y
L222387  BNE   L22238B
         BRA   L222395
L22238B  LDA   $51
         CMP   $01
         BEQ   L222395
         INC   $51
         BRA   L222334
L222395  LDY   #$005D
         LDA   [$66],Y
         TAX
         DEY
         DEY
         LDA   [$66],Y
         STA   $5D
         STX   $5F
         LDY   #$0002
         LDA   [$5D],Y
         TAX
         LDA   [$5D]
         PHX
         PHA
         LDA   $51
         JSL   L150488
         TAY
         BNE   L2223B7
         DEX
L2223B7  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         LDA   #$0011
         CLC
         ADC   $66
         LDX   $68
         BCC   L2223D5
         INX
L2223D5  PHX
         PHA
         JSL   L1500EF
         LDA   #$0001
         STA   L055337
         TDC
         CLC
         ADC   #$0039
         PEA   $0000
         PHA
         LDA   #$0043
         CLC
         ADC   $66
         LDX   $68
         BCC   L2223F5
         INX
L2223F5  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0039
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $0000
         JSL   L151005
         TDC
         CLC
         ADC   #$0039
         PEA   $0000
         PHA
         JSL   L150B34
L22241E  PEA   $0000
         PEI   $66
         JSL   L222CB0
L222427  PEI   $5B
         JSL   L0724F7
         LDA   $64
         STA   $6A
         LDA   $63
         STA   $69
         LDA   $61
         TCD
         TSC
         CLC
         ADC   #$0068
         TCS
         RTL

L22243F  PHD
         TSC
         CLC
         ADC   #$FFF0
         TCS
         TCD
         LDY   #$006D
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         CLC
         ADC   #$0006
         BCC   L222458
         INX
L222458  STA   $0D
         STX   $0F
         LDA   #$0003
         AND   [$0D]
         DEC
         BEQ   L222469
         LDA   #$0000
         BRA   L22246C
L222469  LDA   #$0001
L22246C  STA   $0B
         LDA   $0B
         BEQ   L222479
         LDA   #$0006
         STA   $09
         BRA   L22247E
L222479  LDA   #$0002
         STA   $09
L22247E  PHY
         PEI   $09
         LDY   #$006D
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         CLC
         ADC   #$0006
         BCC   L222492
         INX
L222492  PHX
         PHA
         JSL   L160A5A
         PLA
         LSR
         BCS   L22249F
         BRL   L2225A8
L22249F  LDA   $0B
         BEQ   L2224ED
         PHY
         PEA   ^L040898
         PEA   L040898
         JSL   L160B56
         PLA
         LSR
         BCC   L2224EB
         LDY   #$006D
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         PHX
         PHA
         LDY   #$006D
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         CLC
         ADC   #$0006
         BCC   L2224DB
         INX
L2224DB  PHX
         PHA
         JSL   L160B64
         PEA   ^L160B64
         PEA   L160B64
         JSL   L07187A
L2224EB  BRA   L222535
L2224ED  PHY
         PEA   ^L0408A3
         PEA   L0408A3
         JSL   L160B56
         PLA
         LSR
         BCC   L222535
         LDY   #$006D
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         STA   $0D
         STX   $0F
         LDY   #$0002
         LDA   [$0D],Y
         TAX
         LDA   [$0D]
         PHX
         PHA
         LDY   #$006D
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         CLC
         ADC   #$0006
         BCC   L222525
         INX
L222525  PHX
         PHA
         JSL   L160B72
         PEA   ^L160B72
         PEA   L160B72
         JSL   L07187A
L222535  PEA   ^L051EF0
         PEA   L051EF0
         LDY   #$006D
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         CLC
         ADC   #$0010
         BCC   L22254C
         INX
L22254C  PHX
         PHA
         JSL   L160A3E
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         LDA   #$0043
         CLC
         ADC   $16
         LDX   $18
         BCC   L222566
         INX
L222566  PHX
         PHA
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         PEA   $FFFE
         PEA   $0000
         JSL   L151005
         TDC
         CLC
         ADC   #$0001
         PEA   $0000
         PHA
         JSL   L150B34
         PEI   $09
         LDY   #$006D
         LDA   [$16],Y
         TAX
         DEY
         DEY
         LDA   [$16],Y
         CLC
         ADC   #$0006
         BCC   L2225A2
         INX
L2225A2  PHX
         PHA
         JSL   L160B80
L2225A8  LDA   $14
         STA   $18
         LDA   $13
         STA   $17
         LDA   $11
         TCD
         TSC
         CLC
         ADC   #$0016
         TCS
         RTL

L2225BA  PHD
         TSC
         CLC
         ADC   #$FDE8
         TCS
         ADC   #$0125
         TCD
         PEA   $0000
         TDC
         CLC
         ADC   #$FF11
         PHA
         PEA   ^L0408AE
         PEA   L0408AE
         LDY   #$006D
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         PHX
         PHA
         PEA   ^L0408C0
         PEA   L0408C0
         PEA   $0000
         TDC
         CLC
         ADC   #$FEE7
         PHA
         PEA   $0003
         JSL   L1509CE
         PEA   $002A
         JSL   L0313BE
         PHY
         PEA   $0000
         PEA   $0055
         PEA   $0000
         PEA   $0001
         PEA   $0000
         TDC
         CLC
         ADC   #$FF11
         PHA
         TDC
         CLC
         ADC   #$00D5
         PEA   $0000
         PHA
         JSL   L09B294
         PLA
         LSR
         BCS   L222633
         BRL   L222A02
L222633  LDA   #$0001
         STA   L054FB3
         PHY
         PEI   $D7
         PEI   $D5
         JSL   L0988BB
         PLA
         LSR
         BCC   L222650
         PEA   $0847
         JSL   L0727E0
         BRL   L222A02
L222650  PHY
         JSL   L073CDF
         PLA
         STA   $ED
         PHY
         PHY
         LDY   #$006D
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         CLC
         ADC   #$0006
         BCC   L22266B
         INX
L22266B  CLC
         ADC   #$0002
         BCC   L222672
         INX
L222672  STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         PHX
         PHA
         PEA   $544E
         PEA   $5250
         JSL   L2219D0
         PLA
         STA   $CD
         PLX
         STX   $CF
         LDA   $CD
         ORA   $CF
         BNE   L222699
         BRL   L2229FC
L222699  PHY
         PHY
         LDY   #$006D
         LDA   [$F8],Y
         TAX
         DEY
         DEY
         LDA   [$F8],Y
         CLC
         ADC   #$0006
         BCC   L2226AC
         INX
L2226AC  CLC
         ADC   #$0006
         BCC   L2226B3
         INX
L2226B3  STA   $EF
         STX   $F1
         LDY   #$0002
         LDA   [$EF],Y
         TAX
         LDA   [$EF]
         PHX
         PHA
         PEA   $5041
         PEA   $4D42
         JSL   L2219D0
         PLA
         STA   $C9
         PLX
         STX   $CB
         LDY   #$0002
         LDA   [$CD],Y
         TAX
         LDA   [$CD]
         TXY
         LDX   #$FEE3
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FEE3
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L2226F2
         INX
L2226F2  PHX
         PHA
         LDX   #$FEE3
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L222704
         INX
L222704  STA   $EF
         STX   $F1
         LDA   #$BFFF
         AND   [$EF]
         PLX
         STX   $EF
         PLX
         STX   $F1
         STA   [$EF]
         LDA   $C9
         ORA   $CB
         BNE   L222750
         LDX   #$FEE3
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L22272B
         INX
L22272B  PHX
         PHA
         LDX   #$FEE3
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L22273D
         INX
L22273D  STA   $EF
         STX   $F1
         LDA   #$FFFB
         AND   [$EF]
         PLX
         STX   $EF
         PLX
         STX   $F1
         STA   [$EF]
         BRA   L222783
L222750  LDX   #$FEE3
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L222760
         INX
L222760  PHX
         PHA
         LDX   #$FEE3
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L222772
         INX
L222772  STA   $EF
         STX   $F1
         LDA   #$0004
         ORA   [$EF]
         PLX
         STX   $EF
         PLX
         STX   $F1
         STA   [$EF]
L222783  LDX   #$FEE3
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0020
         BCC   L222793
         INX
L222793  STA   $EF
         STX   $F1
         LDA   [$EF]
         STA   $E5
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         JSL   L0940E5
         LDA   #$0002
         STA   $11
         LDA   #$0001
         LDX   #$0000
         STA   $17
         STX   $19
         LDA   #$0006
         STA   $3D
         PHY
         PHY
         PEI   $D7
         PEI   $D5
         JSL   L078841
         PLA
         STA   $69
         PLX
         STX   $6B
         PHY
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         LSR
         BCS   L2227E1
         BRL   L2229F0
L2227E1  PHY
         PHY
         JSL   L160B8E
         PLA
         STA   $D1
         PLX
         STX   $D3
         LDA   $D1
         ORA   $D3
         BNE   L2227FD
         PEA   $0845
         JSL   L0727E0
         BRL   L2229DF
L2227FD  STZ   $EB
         PHY
         LDY   #$0002
         LDA   [$D1],Y
         TAX
         LDA   [$D1]
         CLC
         ADC   #$0010
         BCC   L22280F
         INX
L22280F  STA   $EF
         STX   $F1
         LDA   [$EF]
         PHA
         PEA   $0020
         JSL   L072FD5
         PLA
         STA   $E7
         LDA   $E7
         SEC
         SBC   #$0020
         BVS   L22282B
         EOR   #$8000
L22282B  BPL   L222830
         BRL   L2229AD
L222830  PHY
         PHY
         PEI   $CF
         PEI   $CD
         PEA   $544E
         PEA   $5250
         JSL   L221ACC
         PLA
         STA   $DD
         PLX
         STX   $DF
         LDA   $DD
         ORA   $DF
         BNE   L22284F
         BRL   L2229A4
L22284F  PHY
         PHY
         PEI   $CB
         PEI   $C9
         PEA   $5041
         PEA   $4D42
         JSL   L221ACC
         PLA
         STA   $D9
         PLX
         STX   $DB
         LDA   $E7
         BNE   L22286E
         LDA   #$0001
         STA   $E7
L22286E  LDY   #$0002
         LDA   [$D1],Y
         TAX
         LDA   [$D1]
         CLC
         ADC   #$009E
         BCC   L22287D
         INX
L22287D  PHX
         PHA
         LDA   $E7
         JSL   L150488
         TAY
         BNE   L222889
         DEX
L222889  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0002
         BCC   L2228A1
         INX
L2228A1  STA   $EF
         STX   $F1
         LDA   [$EF]
         LDY   #$0002
         ORA   [$EF],Y
         BEQ   L2228B3
         LDA   $E7
         INC
         STA   $E7
L2228B3  LDY   #$0002
         LDA   [$D1],Y
         TAX
         LDA   [$D1]
         TXY
         LDX   #$FEDF
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FEDF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$009E
         BCC   L2228D4
         INX
L2228D4  PHX
         PHA
         LDA   $E7
         JSL   L150488
         TAY
         BNE   L2228E0
         DEX
L2228E0  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         TXY
         LDX   #$FEDB
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FEDB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0002
         BCC   L22290A
         INX
L22290A  STA   $EF
         STX   $F1
         LDA   $DD
         LDX   $DF
         STA   [$EF]
         TXA
         LDY   #$0002
         STA   [$EF],Y
         LDX   #$FEDB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0006
         BCC   L22292A
         INX
L22292A  STA   $EF
         STX   $F1
         LDA   $D9
         LDX   $DB
         STA   [$EF]
         TXA
         LDY   #$0002
         STA   [$EF],Y
         LDX   #$FEDB
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         STA   $EF
         STX   $F1
         LDA   $E5
         STA   [$EF]
         LDX   #$FEDF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L22295B
         INX
L22295B  STA   $EF
         STX   $F1
         LDA   $E7
         STA   [$EF]
         LDX   #$FEDF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000E
         BCC   L222973
         INX
L222973  STA   $EF
         STX   $F1
         LDA   [$EF]
         SEC
         SBC   $E7
         BEQ   L22299D
         BVS   L222983
         EOR   #$8000
L222983  BPL   L22299D
         LDX   #$FEDF
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000E
         BCC   L222995
         INX
L222995  STA   $EF
         STX   $F1
         LDA   $E7
         STA   [$EF]
L22299D  LDA   #$0001
         STA   $EB
         BRA   L2229AB
L2229A4  PEA   $0846
         JSL   L0727E0
L2229AB  BRA   L2229B4
L2229AD  PEA   $0848
         JSL   L0727E0
L2229B4  LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         PEA   $5452
         PEA   $504D
         LDA   L055051
         EOR   #$0001
         AND   $EB
         PHA
         JSL   L074B81
         LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         JSL   L077B28
L2229DF  PHY
         TDC
         CLC
         ADC   #$006D
         PEA   $0000
         PHA
         JSL   L0953DD
         PLA
         STA   $E9
L2229F0  PEI   $CB
         PEI   $C9
         PEI   $CF
         PEI   $CD
         JSL   L071825
L2229FC  PEI   $ED
         JSL   L0724F7
L222A02  STZ   L054FB3
         JSL   L09AFB1
         PEI   $D7
         PEI   $D5
         JSL   L07185A
         LDA   $F6
         STA   $FA
         LDA   $F5
         STA   $F9
         LDA   $F3
         TCD
         TSC
         CLC
         ADC   #$021E
         TCS
         RTL

L222A23  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         PEA   $0000
         PEI   $0A
         JSL   L222CB0
         LDY   #$006D
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         CLC
         ADC   #$0010
         BCC   L222A45
         INX
L222A45  PHX
         PHA
         LDA   #$0043
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L222A52
         INX
L222A52  PHX
         PHA
         JSL   L220CC0
         LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L222A69  PHD
         TSC
         CLC
         ADC   #$FFD4
         TCS
         TCD
         LDA   #$0001
         STA   $23
         PHY
         LDY   #$006D
         LDA   [$32],Y
         TAX
         DEY
         DEY
         LDA   [$32],Y
         STA   $29
         STX   $2B
         LDY   #$0002
         LDA   [$29],Y
         TAX
         LDA   [$29]
         PHX
         PHA
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         TDC
         CLC
         ADC   #$0023
         PEA   $0000
         PHA
         JSL   L220FEF
         PLA
         STA   $25
         PEI   $25
         PHY
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         LDY   #$006D
         LDA   [$32],Y
         TAX
         DEY
         DEY
         LDA   [$32],Y
         STA   $29
         STX   $2B
         LDY   #$0002
         LDA   [$29],Y
         TAX
         LDA   [$29]
         PHX
         PHA
         LDA   #$00FF
         AND   $03
         INC
         PHA
         JSL   L070A10
         PLA
         EOR   #$0001
         AND   $01,S
         PLX
         LSR
         BCS   L222AE4
         BRL   L222C95
L222AE4  PHY
         JSL   L073CDF
         PLA
         STA   $27
         LDY   #$006D
         LDA   [$32],Y
         TAX
         DEY
         DEY
         LDA   [$32],Y
         CLC
         ADC   #$0006
         BCC   L222AFD
         INX
L222AFD  CLC
         ADC   #$0002
         BCC   L222B04
         INX
L222B04  STA   $29
         STX   $2B
         LDY   #$0002
         LDA   [$29],Y
         TAX
         LDA   [$29]
         STA   $1B
         STX   $1D
         PHY
         PHY
         PEI   $1D
         PEI   $1B
         PEA   $544E
         PEA   $5250
         PEA   $0000
         JSL   L077624
         PLA
         STA   $17
         PLX
         STX   $19
         LDA   $17
         ORA   $19
         BNE   L222B36
         BRL   L222C8F
L222B36  LDY   #$0002
         LDA   [$17],Y
         TAX
         LDA   [$17]
         CLC
         ADC   #$000C
         BCC   L222B45
         INX
L222B45  PHX
         PHA
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         PEA   $0014
         JSL   L0313BE
         PEI   $1D
         PEI   $1B
         PEA   $544E
         PEA   $5250
         LDA   L055051
         EOR   #$0001
         PHA
         JSL   L074B81
         PEI   $1D
         PEI   $1B
         JSL   L077B28
         TDC
         CLC
         ADC   #$0003
         PEA   $0000
         PHA
         LDY   #$006D
         LDA   [$32],Y
         TAX
         DEY
         DEY
         LDA   [$32],Y
         STA   $29
         STX   $2B
         LDY   #$0002
         LDA   [$29],Y
         TAX
         LDA   [$29]
         PHX
         PHA
         LDA   #$00FF
         AND   $03
         INC
         JSL   L150488
         PHX
         PHA
         JSL   L070597
         PEA   $0000
         PEA   $0000
         LDA   #$0011
         CLC
         ADC   $32
         LDX   $34
         BCC   L222BB6
         INX
L222BB6  PHX
         PHA
         JSL   L15109B
         LDA   #$0011
         CLC
         ADC   $32
         LDX   $34
         BCC   L222BC7
         INX
L222BC7  CLC
         ADC   #$0008
         BCC   L222BCE
         INX
L222BCE  STA   $29
         STX   $2B
         LDA   [$29]
         STA   $01
         LDA   $01
         SEC
         SBC   #$0001
         BVS   L222BE1
         EOR   #$8000
L222BE1  BPL   L222C49
         LDA   #$0001
         STA   $1F
L222BE8  LDY   #$005D
         LDA   [$32],Y
         TAX
         DEY
         DEY
         LDA   [$32],Y
         STA   $29
         STX   $2B
         LDY   #$0002
         LDA   [$29],Y
         TAX
         LDA   [$29]
         PHX
         PHA
         LDA   $1F
         JSL   L150488
         TAY
         BNE   L222C0A
         DEX
L222C0A  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0006
         BCC   L222C22
         INX
L222C22  CLC
         ADC   #$0002
         BCC   L222C29
         INX
L222C29  STA   $29
         STX   $2B
         LDA   $1B
         LDX   $1D
         CMP   [$29]
         BNE   L222C3B
         LDY   #$0002
         TXA
         CMP   [$29],Y
L222C3B  BNE   L222C3F
         BRA   L222C49
L222C3F  LDA   $1F
         CMP   $01
         BEQ   L222C49
         INC   $1F
         BRA   L222BE8
L222C49  LDY   #$005D
         LDA   [$32],Y
         TAX
         DEY
         DEY
         LDA   [$32],Y
         STA   $29
         STX   $2B
         LDY   #$0002
         LDA   [$29],Y
         TAX
         LDA   [$29]
         PHX
         PHA
         LDA   $1F
         JSL   L150488
         TAY
         BNE   L222C6B
         DEX
L222C6B  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         LDA   #$0011
         CLC
         ADC   $32
         LDX   $34
         BCC   L222C89
         INX
L222C89  PHX
         PHA
         JSL   L1500EF
L222C8F  PEI   $27
         JSL   L0724F7
L222C95  PEA   $0000
         PEI   $32
         JSL   L222CB0
         LDA   $30
         STA   $34
         LDA   $2F
         STA   $33
         LDA   $2D
         TCD
         TSC
         CLC
         ADC   #$0032
         TCS
         RTL

L222CB0  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDA   #$006B
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L222CC3
         INX
L222CC3  STA   $01
         STX   $03
         PHY
         PHY
         PEA   $0000
         PEA   $0000
         LDA   #$0011
         CLC
         ADC   $0A
         LDX   $0C
         BCC   L222CDA
         INX
L222CDA  PHX
         PHA
         JSL   L150371
         PLA
         STA   [$01]
         PLA
         LDY   #$0002
         STA   [$01],Y
         LDY   #$006B
         LDA   [$0A],Y
         INY
         INY
         ORA   [$0A],Y
         BNE   L222D14
         LDY   #$005D
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         STA   $01
         STX   $03
         LDY   #$0002
         LDA   [$01],Y
         TAX
         LDA   [$01]
         LDY   #$006B
         STA   [$0A],Y
         INY
         INY
         TXA
         STA   [$0A],Y
L222D14  LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L222D25  PHD
         TSC
         CLC
         ADC   #$FFFC
         TCS
         TCD
         LDY   #$006D
         LDA   [$0A],Y
         TAX
         DEY
         DEY
         LDA   [$0A],Y
         CLC
         ADC   #$0006
         BCC   L222D3E
         INX
L222D3E  STA   $01
         STX   $03
         LDA   #$4000
         AND   [$01]
         BEQ   L222D4C
         LDA   #$0001
L222D4C  EOR   #$0001
         LDY   #$0093
         AND   [$0A],Y
         PHA
         LDY   #$0091
         LDA   L055243
         ORA   [$0A],Y
         AND   $01,S
         PLX
         LSR
         BCC   L222D96
         PEA   $0001
         LDY   #$0071
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $0004
         JSL   L072E7C
         PEA   $0000
         PEI   $0A
         JSL   L22243F
         PEA   $0000
         LDY   #$0071
         LDA   [$0A],Y
         PHA
         DEY
         DEY
         LDA   [$0A],Y
         PHA
         PEA   $0004
         JSL   L072E7C
L222D96  LDA   $08
         STA   $0C
         LDA   $07
         STA   $0B
         LDA   $05
         TCD
         PLY
         PLY
         PLY
         PLY
         PLY
         RTL

L222DA7  PHD
         TSC
         CLC
         ADC   #$FEAA
         TCS
         ADC   #$0065
         TCD
         PHY
         LDY   #$006D
         LDA   [$F6],Y
         TAX
         DEY
         DEY
         LDA   [$F6],Y
         CLC
         ADC   #$0006
         BCC   L222DC4
         INX
L222DC4  PHX
         PHA
         LDA   #$0039
         CLC
         ADC   $F6
         LDX   $F8
         BCC   L222DD1
         INX
L222DD1  PHX
         PHA
         PEA   $000A
         JSL   L070A10
         PLA
         LSR
         BCS   L222DE4
         LDA   #$0001
         STA   L055337
L222DE4  LDA   L055337
         BNE   L222DEC
         BRL   L22304E
L222DEC  PHY
         JSL   L073CDF
         PLA
         STA   $EB
         LDA   #$0011
         CLC
         ADC   $F6
         LDX   $F8
         BCC   L222DFF
         INX
L222DFF  CLC
         ADC   #$0008
         BCC   L222E06
         INX
L222E06  STA   $ED
         STX   $EF
         LDA   [$ED]
         STA   $E5
         STZ   $E7
         LDA   $E5
         LDX   #$FF9F
         STA   $00,X
         LDX   #$FF9F
         LDA   $00,X
         SEC
         SBC   #$0001
         BVS   L222E25
         EOR   #$8000
L222E25  BMI   L222E2A
         BRL   L222F79
L222E2A  LDA   #$0001
         STA   $E9
L222E2F  LDA   $E9
         PEA   $000A
         JSL   L150BEE
         CLC
         PLA
         ADC   #$FF97
         TAX
         STX   $ED
         TDC
         CLC
         ADC   $ED
         LDX   #$0000
         PHX
         PHA
         LDY   #$005D
         LDA   [$F6],Y
         TAX
         DEY
         DEY
         LDA   [$F6],Y
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         LDA   $E9
         JSL   L150488
         TAY
         BNE   L222E6B
         DEX
L222E6B  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0006
         BCC   L222E83
         INX
L222E83  PHX
         PHA
         PEA   $000A
         JSL   L0313BE
         LDA   $FA
         BPL   L222E93
         BRL   L222F6B
L222E93  CMP   #$0002
         BMI   L222E9B
         BRL   L222F6B
L222E9B  SEC
         SBC   #$0000
         BEQ   L222EF2
         DEC
         BEQ   L222EA7
         BRL   L222F6B
L222EA7  LDY   #$005D
         LDA   [$F6],Y
         TAX
         DEY
         DEY
         LDA   [$F6],Y
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         LDA   $E9
         JSL   L150488
         TAY
         BNE   L222EC9
         DEX
L222EC9  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0004
         BCC   L222EE1
         INX
L222EE1  STA   $ED
         STX   $EF
         LDA   #$0080
         AND   [$ED]
         BEQ   L222EF0
         LDA   $E9
         STA   $E7
L222EF0  BRA   L222F6B
L222EF2  LDY   #$005D
         LDA   [$F6],Y
         TAX
         DEY
         DEY
         LDA   [$F6],Y
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         LDA   $E9
         JSL   L150488
         TAY
         BNE   L222F14
         DEX
L222F14  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0006
         BCC   L222F2C
         INX
L222F2C  CLC
         ADC   #$0002
         BCC   L222F33
         INX
L222F33  STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         LDA   #$0039
         CLC
         ADC   $F6
         LDX   $F8
         BCC   L222F4C
         INX
L222F4C  CLC
         ADC   #$0002
         BCC   L222F53
         INX
L222F53  STA   $ED
         STX   $EF
         PLA
         PLX
         CMP   [$ED]
         BNE   L222F63
         LDY   #$0002
         TXA
         CMP   [$ED],Y
L222F63  BNE   L222F69
         LDA   $E9
         STA   $E7
L222F69  BRA   L222F6B
L222F6B  LDA   $E9
         LDX   #$FF9F
         CMP   $00,X
         BEQ   L222F79
         INC   $E9
         BRL   L222E2F
L222F79  LDA   $E7
         BNE   L222F82
         LDA   #$0001
         STA   $E7
L222F82  PHY
         PHY
         JSL   L160B8E
         PLA
         STA   $E1
         PLX
         STX   $E3
         LDA   $E1
         ORA   $E3
         BNE   L222F97
         BRL   L223048
L222F97  LDY   #$0002
         LDA   [$E1],Y
         TAX
         LDA   [$E1]
         TXY
         LDX   #$FF9B
         STA   $00,X
         TYA
         STA   $02,X
         LDX   #$FF9B
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$000E
         BCC   L222FB8
         INX
L222FB8  STA   $ED
         STX   $EF
         LDA   $E7
         STA   [$ED]
         LDX   #$FF9B
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0010
         BCC   L222FD0
         INX
L222FD0  STA   $ED
         STX   $EF
         LDA   $E5
         STA   [$ED]
         PEA   $0000
         TDC
         CLC
         ADC   #$FFA1
         PHA
         LDX   #$FF9B
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$009E
         BCC   L222FF1
         INX
L222FF1  PHX
         PHA
         PEA   $0000
         PEA   $0140
         JSL   L070597
         LDA   L055327
         LDX   L055329
         STA   $ED
         STX   $EF
         LDY   #$0002
         LDA   [$ED],Y
         TAX
         LDA   [$ED]
         PHX
         PHA
         LDX   #$FF9B
         LDA   $02,X
         TAY
         LDA   $00,X
         TYX
         CLC
         ADC   #$0012
         BCC   L223021
         INX
L223021  PHX
         PHA
         PEA   $0000
         PEA   $008C
         JSL   L070597
         LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         PEA   $5452
         PEA   $504D
         LDA   L055051
         EOR   #$0001
         PHA
         JSL   L074B81
L223048  PEI   $EB
         JSL   L0724F7
L22304E  LDA   $F4
         STA   $FA
         LDA   $F3
         STA   $F9
         LDA   $F1
         TCD
         TSC
         CLC
         ADC   #$015E
         TCS
         RTL

L223060  ENT
         PHD
         TSC
         CLC
         ADC   #$FF66
         TCS
         TCD
         STZ   $73
         STZ   $A0
         PEA   $0000
         JSL   L1609F8
         PHY
         PEA   $0003
         PEA   $0000
         PEA   $0000
         JSL   L160A5A
         PLA
         LSR
         BCS   L223088
         BRL   L223986
L223088  PEA   $0003
         JSL   L160A4C
         PHY
         JSL   L160A06
         PLA
         BEQ   L22309A
         BRL   L223986
L22309A  PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         PEA   $0000
         JSL   L160AAE
         PLA
         STA   $81
         PHY
         PHY
         JSL   L160B8E
         PLA
         STA   $5F
         PLX
         STX   $61
         LDA   $5F
         ORA   $61
         BNE   L2230C9
         PEA   $001B
         JSL   L0727E0
         BRL   L223986
L2230C9  LDA   L055327
         LDX   L055329
         STA   $97
         STX   $99
         LDY   #$0002
         LDA   [$97],Y
         TAX
         LDA   [$97]
         CLC
         ADC   #$0050
         BCC   L2230E2
         INX
L2230E2  STA   $0D
         STX   $0F
         LDX   #$0000
         LDA   [$0D]
         DEC
         BEQ   L2230EF
         INX
L2230EF  PHX
         LDX   #$0000
         LDY   #$0002
         LDA   #$03E7
         CMP   [$0D],Y
         BEQ   L2230FE
         INX
L2230FE  TXA
         ORA   $01,S
         PLX
         LSR
         BCC   L223128
         LDA   #$0001
         STA   [$0D]
         LDA   #$03E7
         LDY   #$0002
         STA   [$0D],Y
         PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L1511B6
         PLA
         STA   $95
         LDA   #$0001
         STA   L055337
L223128  PHY
         PHY
         JSL   L150493
         PLA
         STA   $75
         PLX
         STX   $77
         PHY
         PHY
         PEA   $3E80
         JSL   L072834
         PLA
         STA   $6F
         PLX
         STX   $71
         LDA   L0551FB
         SEC
         SBC   #$0004
         BVS   L22314F
         EOR   #$8000
L22314F  BMI   L223156
         LDA   #$0000
         BRA   L223159
L223156  LDA   #$0001
L223159  STA   $93
         LDA   $93
         BEQ   L22317F
         PHY
         PHY
         PEA   $0000
         PEA   ^L2208D8
         PEA   L2208D8
         JSL   L1502E8
         PLA
         STA   $53
         PLX
         STX   $55
         PEI   $71
         PEI   $6F
         PEA   $0004
         JSL   L073CFE
L22317F  PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L15038F
         PLA
         BNE   L223196
         LDA   #$0005
         STA   $85
         BRA   L22319B
L223196  LDA   #$0006
         STA   $85
L22319B  PEI   $71
         PEI   $6F
         PEI   $85
         JSL   L073CFE
         TDC
         CLC
         ADC   #$0043
         PEA   $0000
         PHA
         PHY
         PHY
         PEI   $71
         PEI   $6F
         PEI   $85
         JSL   L073032
         PEA   $0008
         JSL   L0313BE
         TDC
         CLC
         ADC   #$0043
         PEA   $0000
         PHA
         PEA   $0008
         PEA   $0004
         JSL   L151005
         PHY
         PHY
         PEA   $0000
         PEA   $0B40
         PEA   $03E9
         JSL   L160B9C
         PLA
         STA   $5B
         PLX
         STX   $5D
         LDA   $5B
         ORA   $5D
         BNE   L223210
         LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         PEA   $5452
         PEA   $504D
         LDA   L055051
         EOR   #$0001
         AND   L055337
         PHA
         JSL   L074B81
         BRL   L22394D
L223210  PEI   $5D
         PEI   $5B
         JSL   L0718BF
         PHY
         PEI   $61
         PEI   $5F
         JSL   L0718FA
         PLA
         STA   $87
         LDY   #$0002
         LDA   [$5F],Y
         TAX
         LDA   [$5F]
         STA   $09
         STX   $0B
         PHY
         LDY   #$000E
         LDA   [$09],Y
         PHA
         LDY   #$0010
         LDA   [$09],Y
         PHA
         JSL   L072FD5
         PLA
         STA   $8B
         PHY
         PEI   $8B
         PEA   $0020
         JSL   L072FD5
         PLA
         STA   $8B
         PHY
         LDY   #$0010
         LDA   [$09],Y
         PHA
         PEA   $0020
         JSL   L072FD5
         PLA
         STA   $89
         LDA   $89
         SEC
         SBC   #$0003
         BEQ   L223279
         BVS   L22326F
         EOR   #$8000
L22326F  BPL   L223279
         PHY
         JSL   L073CDF
         PLA
         STA   $73
L223279  LDA   $89
         STA   $07
         LDA   $07
         SEC
         SBC   #$0001
         BVS   L223288
         EOR   #$8000
L223288  BMI   L22328D
         BRL   L223405
L22328D  LDA   #$0001
         STA   $8D
L223292  LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         PHX
         PHA
         LDA   $8D
         JSL   L150488
         TAY
         BNE   L2232A6
         DEX
L2232A6  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0006
         BCC   L2232BE
         INX
L2232BE  PHX
         PHA
         LDA   #$009E
         CLC
         ADC   $09
         LDX   $0B
         BCC   L2232CB
         INX
L2232CB  PHX
         PHA
         LDA   $8D
         JSL   L150488
         TAY
         BNE   L2232D7
         DEX
L2232D7  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEA   $000A
         JSL   L0313BE
         LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         PHX
         PHA
         LDA   $8D
         JSL   L150488
         TAY
         BNE   L223305
         DEX
L223305  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   $97
         STX   $99
         LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         CLC
         ADC   #$08C0
         BCC   L223329
         INX
L223329  PHX
         PHA
         LDA   $8D
         JSL   L150488
         TAY
         BNE   L223335
         DEX
L223335  DEC
         PEA   $0000
         PEA   $0014
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         STA   [$97]
         TXA
         LDY   #$0002
         STA   [$97],Y
         LDA   $8B
         CMP   $8D
         BNE   L2233C5
         LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         PHX
         PHA
         LDA   $8D
         JSL   L150488
         TAY
         BNE   L223368
         DEX
L223368  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0004
         BCC   L223380
         INX
L223380  STA   $97
         STX   $99
         LDA   #$0080
         STA   [$97]
         TDC
         CLC
         ADC   #$0039
         PEA   $0000
         PHA
         LDA   #$009E
         CLC
         ADC   $09
         LDX   $0B
         BCC   L22339D
         INX
L22339D  PHX
         PHA
         LDA   $8D
         JSL   L150488
         TAY
         BNE   L2233A9
         DEX
L2233A9  DEC
         PEA   $0000
         PEA   $000A
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         PEA   $000A
         JSL   L0313BE
         BRA   L2233FA
L2233C5  LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         PHX
         PHA
         LDA   $8D
         JSL   L150488
         TAY
         BNE   L2233D9
         DEX
L2233D9  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0004
         BCC   L2233F1
         INX
L2233F1  STA   $97
         STX   $99
         LDA   #$0000
         STA   [$97]
L2233FA  LDA   $8D
         CMP   $07
         BEQ   L223405
         INC   $8D
         BRL   L223292
L223405  PEI   $61
         PEI   $5F
         PEI   $87
         JSL   L0718DA
         LDAL  L053ADB
         PHA
         LDAL  L053AD9
         PHA
         PEA   $5452
         PEA   $504D
         LDA   L055051
         EOR   #$0001
         AND   L055337
         PHA
         JSL   L074B81
         LDA   $89
         STA   $05
         LDA   $05
         SEC
         SBC   #$0001
         BVS   L22343C
         EOR   #$8000
L22343C  BMI   L223441
         BRL   L223561
L223441  LDA   #$0001
         STA   $8D
L223446  LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         PHX
         PHA
         LDA   $8D
         JSL   L150488
         TAY
         BNE   L22345A
         DEX
L22345A  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0006
         BCC   L223472
         INX
L223472  CLC
         ADC   #$0002
         BCC   L223479
         INX
L223479  STA   $97
         STX   $99
         LDY   #$0002
         LDA   [$97],Y
         TAX
         LDA   [$97]
         STA   $7D
         STX   $7F
         LDA   $7D
         ORA   $7F
         BNE   L223492
         BRL   L22394D
L223492  PHY
         PHY
         PEI   $7F
         PEI   $7D
         PEA   $544E
         PEA   $5250
         PEA   $0000
         JSL   L077624
         PLA
         STA   $57
         PLX
         STX   $59
         LDA   $57
         ORA   $59
         BNE   L2234B4
         BRL   L223556
L2234B4  LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         CLC
         ADC   #$08C0
         BCC   L2234C3
         INX
L2234C3  PHX
         PHA
         LDA   $8D
         JSL   L150488
         TAY
         BNE   L2234CF
         DEX
L2234CF  DEC
         PEA   $0000
         PEA   $0014
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         PHX
         PHA
         LDY   #$0002
         LDA   [$57],Y
         TAX
         LDA   [$57]
         CLC
         ADC   #$000C
         BCC   L2234F1
         INX
L2234F1  PHX
         PHA
         PEA   $0014
         JSL   L0313BE
         LDY   #$0002
         LDA   [$57],Y
         TAX
         LDA   [$57]
         CLC
         ADC   #$0022
         BCC   L223509
         INX
L223509  PHX
         PHA
         LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         PHX
         PHA
         LDA   $8D
         JSL   L150488
         TAY
         BNE   L22351F
         DEX
L22351F  DEC
         PEA   $0000
         PEA   $0046
         JSL   L150D50
         PLA
         PLX
         JSL   L150F53
         CLC
         ADC   #$0010
         BCC   L223537
         INX
L223537  PHX
         PHA
         JSL   L160A3E
         PEI   $7F
         PEI   $7D
         PEA   $544E
         PEA   $5250
         PEA   $0000
         JSL   L074B81
         PEI   $7F
         PEI   $7D
         JSL   L077B28
L223556  LDA   $8D
         CMP   $05
         BEQ   L223561
         INC   $8D
         BRL   L223446
L223561  TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         PEA   $00F5
         PEA   $0035
         PEA   $01AC
         PEA   $0072
         JSL   L15100B
         LDA   $89
         STA   $19
         LDA   #$000A
         STA   $29
         LDA   #$0006
         STA   $1B
         LDA   #$0002
         STA   $1D
         LDA   #$0001
         STA   $1F
         LDA   #L2211CD
         LDX   #^L2211CD
         STA   $25
         STX   $27
         LDA   #$0046
         STA   $2B
         LDY   #$0002
         LDA   [$5B],Y
         TAX
         LDA   [$5B]
         STA   $2D
         STX   $2F
         STZ   $31
         STZ   $33
         STZ   $35
         STZ   $37
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L15109B
         PHY
         PHY
         PEI   $71
         PEI   $6F
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L1500E9
         PLA
         STA   $63
         PLX
         STX   $65
         PEI   $71
         PEI   $6F
         JSL   L15102F
         PEI   $71
         PEI   $6F
         JSL   L1511C8
         PEI   $71
         PEI   $6F
         JSL   L151131
         LDA   #L220000
         LDX   #^L220000
         STA   L05531F
         STX   L055321
         PEA   $0000
         PHD
         JSL   L222CB0
         PHY
         JSL   L0727BF
         PLA
         STA   $8D
         LDA   $73
         BNE   L22361D
         LDA   $8D
         STA   $73
L22361D  LDA   L055051
         EOR   #$0001
         STA   $91
L223625  PHY
         PEA   $0001
         JSL   L0736C8
         PLA
         STA   $8F
         PHY
         TDC
         CLC
         ADC   #$0067
         PEA   $0000
         PHA
         LDAL  L0540AB
         PHA
         LDAL  L0540A9
         PHA
         PEI   $71
         PEI   $6F
         JSL   L150482
         PLA
         STA   $83
         LDA   #$FFFD
         CMP   $8F
         BNE   L2236D0
         LDA   #$007F
         ANDL  L0540A1
         STA   $83
         LDA   $83
         SEC
         SBC   #$000A
         BMI   L2236C4
         CMP   #$0004
         BPL   L2236C4
         SEC
         SBC   #$0000
         BEQ   L22367B
         DEC
         BEQ   L22367B
         DEC
         DEC
         BEQ   L2236A3
         BRA   L2236C4
L22367B  PHY
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         LDX   #$0000
         LDA   #$000B
         CMP   $83
         BNE   L223690
         INX
L223690  PHX
         JSL   L072227
         PLA
         LSR
         BCC   L2236A1
         PEA   $0000
         PHD
         JSL   L222A23
L2236A1  BRA   L2236D0
L2236A3  LDA   #$2100
         ANDL  L0540AD
         BNE   L2236BA
         PHY
         PEI   $71
         PEI   $6F
         JSL   L072354
         PLA
         STA   $8F
         BRA   L2236C2
L2236BA  PEA   $0000
         PHD
         JSL   L222D25
L2236C2  BRA   L2236D0
L2236C4  PHY
         PEI   $71
         PEI   $6F
         JSL   L072354
         PLA
         STA   $8F
L2236D0  LDA   $8F
         SEC
         SBC   #$FFFE
         BVS   L2236DF
         BPL   L2236DD
         BRL   L2238E3
L2236DD  BRA   L2236E4
L2236DF  BMI   L2236E4
         BRL   L2238E3
L2236E4  CMP   #$0007
         BMI   L2236EC
         BRL   L2238E3
L2236EC  SEC
         SBC   #$0000
         BEQ   L223704
         SEC
         SBC   #$0003
         BEQ   L22373A
         DEC
         BEQ   L22374D
         DEC
         BEQ   L22375B
         DEC
         BEQ   L223772
         BRL   L2238E3
L223704  PEI   $71
         PEI   $6F
         JSL   L1506B3
         PEA   $0004
         JSL   L0724F7
         LDA   L05531F
         LDX   L055321
         PHX
         PHA
         JSL   L150D20
         PEI   $71
         PEI   $6F
         JSL   L1517CD
         PEA   $0000
         PHD
         JSL   L222A23
         PEI   $71
         PEI   $6F
         JSL   L1506AD
         BRL   L22392F
L22373A  LDA   #$0001
         STA   $A0
         PEA   $0001
         PEA   $0000
         PHD
         JSL   L222DA7
         BRL   L22392F
L22374D  PEA   $0000
         PEA   $0000
         PHD
         JSL   L222DA7
         BRL   L22392F
L22375B  PHY
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         JSL   L15105F
         PLA
         ORA   L055337
         STA   L055337
         BRL   L22392F
L223772  LDA   $93
         BNE   L223779
         BRL   L2238E1
L223779  PEA   $0001
         PEI   $69
         PEI   $67
         JSL   L150B10
         PEI   $55
         PEI   $53
         PEA   $0000
         JSL   L150671
         LDA   $19
         STA   $83
         LDX   #$0000
         LDY   #$0006
         LDA   #$4000
         AND   [$6B],Y
         CMP   #$0000
         BNE   L2237A4
         INX
L2237A4  TXA
         STA   $95
         LDA   $91
         AND   $95
         PHA
         PEA   $0004
         JSL   L073077
         LDA   L055243
         ORA   $91
         AND   $95
         PHA
         PEA   $0006
         JSL   L073077
         LDA   $91
         AND   $95
         PHA
         LDA   $83
         SEC
         SBC   #$0002
         BVS   L2237D2
         EOR   #$8000
L2237D2  BMI   L2237D9
         LDA   #$0000
         BRA   L2237DC
L2237D9  LDA   #$0001
L2237DC  AND   $01,S
         PLX
         PHA
         PEA   $0005
         JSL   L073077
         LDA   $83
         SEC
         SBC   #$0020
         BVS   L2237F2
         EOR   #$8000
L2237F2  BPL   L2237F9
         LDA   #$0000
         BRA   L2237FC
L2237F9  LDA   #$0001
L2237FC  STA   $95
         LDA   $95
         AND   $91
         PHA
         PEA   $0001
         JSL   L073077
         LDA   $95
         AND   $91
         PHA
         PEA   $0002
         JSL   L073077
         PEA   $0451
         JSL   L1512C5
         PHY
         PHY
         PEI   $71
         PEI   $6F
         PEA   $0004
         JSL   L073032
         PLA
         STA   $01
         PLX
         STX   $03
         LDY   #$0004
         LDA   [$01],Y
         STA   $79
         LDY   #$0002
         LDA   [$01],Y
         STA   $7B
         TDC
         CLC
         ADC   #$0079
         PEA   $0000
         PHA
         JSL   L151412
         PHY
         PHY
         JSL   L151293
         JSL   L151131
         PHY
         PEA   $0006
         PEI   $7B
         PEI   $79
         PEA   $0000
         PEI   $55
         PEI   $53
         JSL   L150389
         PLA
         STA   $83
         PEI   $71
         PEI   $6F
         JSL   L151131
         LDA   $83
         SEC
         SBC   #$0001
         BMI   L2238D6
         CMP   #$0006
         BPL   L2238D6
         ASL
         TAX
         LDAL  L223888,X
         PHA
         RTS

L223888  DA    L223894-1
         DA    L2238A1-1
         DA    L2238AE-1
         DA    L2238B8-1
         DA    L2238C2-1
         DA    L2238CC-1

L223894  PEA   $0002
         PEA   $0000
         PHD
         JSL   L221EB1
         BRA   L2238D6
L2238A1  PEA   $0001
         PEA   $0000
         PHD
         JSL   L221EB1
         BRA   L2238D6
L2238AE  PEA   $0000
         PHD
         JSL   L2225BA
         BRA   L2238D6
L2238B8  PEA   $0000
         PHD
         JSL   L222A69
         BRA   L2238D6
L2238C2  PEA   $0000
         PHD
         JSL   L221BC8
         BRA   L2238D6
L2238CC  PEA   $0000
         PHD
         JSL   L22243F
         BRA   L2238D6
L2238D6  PEA   $0000
         PEI   $69
         PEI   $67
         JSL   L150B10
L2238E1  BRA   L22392F
L2238E3  LDA   $63
         LDX   $65
         CMP   $67
         BNE   L2238ED
         CPX   $69
L2238ED  BNE   L22392F
         LDAL  L0540BB
         SEC
         SBC   #$0002
         BVS   L2238FC
         EOR   #$8000
L2238FC  BPL   L223908
         PEA   $0000
         PHD
         JSL   L222D25
         BRA   L22392F
L223908  PHY
         PHY
         PEA   $0000
         PEA   $0000
         TDC
         CLC
         ADC   #$0011
         PEA   $0000
         PHA
         JSL   L150371
         PLA
         PLX
         CMP   $6B
         BNE   L223925
         CPX   $6D
L223925  BEQ   L22392F
         PEA   $0000
         PHD
         JSL   L222A23
L22392F  LDX   #$0000
         LDA   $8F
         DEC
         BNE   L223938
         INX
L223938  PHX
         LDX   #$0000
         LDA   $8F
         DEC
         DEC
         BNE   L223943
         INX
L223943  TXA
         ORA   $01,S
         PLX
         LSR
         BCS   L22394D
         BRL   L223625
L22394D  PEI   $71
         PEI   $6F
         JSL   L072634
         PEI   $77
         PEI   $75
         JSL   L151131
         LDA   $93
         BEQ   L223969
         PEI   $55
         PEI   $53
         JSL   L07185A
L223969  PEI   $5D
         PEI   $5B
         JSL   L07185A
         PEA   $0001
         JSL   L160A4C
         LDA   L055327
         LDX   L055329
         PHX
         PHA
         PEI   $81
         JSL   L160B10
L223986  LDA   $73
         BEQ   L223990
         PEI   $73
         JSL   L0724F7
L223990  TSC
         CLC
         ADC   #$009A
         TCS
         PLD
         RTL

