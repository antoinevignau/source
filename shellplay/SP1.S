	*
* ShellPlay v0.71
*
* (c) 1993, Brian Bening
* (s) 2026, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* TOOLS
*-------------------------------

	use	4/Int.Macs
	use	4/Mem.Macs
	use	4/Misc.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	
*-------------------------------
* EQUATES
*-------------------------------

TOOLBOX     EQU   $E10000
GSOS        EQU   $E100A8

*-------------------------------
* EXTERNALS
*-------------------------------

            EXT   L030000

*-------------------------------
* CODE
*-------------------------------

            PHK
            PLB
            STA   L02078E
            STY   $00
            STX   $02

	lda	#L030000
	stal	$300
	lda	#^L030000
	stal	$302
	
            JSR   L020112	; get memory
            BCC   L020011
            BRL   L0200C5
L020011     JSR   L0206D5
            BCC   L020019
            BRL   L0200C5
L020019     PHA
            PHA
            LDA   #$0001	; StartUp
            JSL   L030000
            PLX
            PLX
            BCC   L020087
            CMP   #$8103
            BNE   L02005E

            BRA   L02004E
L02002D     STR   'Sound toolset is already active.'
L02004E     PEA   ^L02002D
            PEA   L02002D
            _WriteLine
            BRL   L0200C5

L02005E     BRA   L020077
L020060     STR   'Unable to allocate DP.'
L020077     PEA   ^L020060
            PEA   L020060
            _WriteLine
            BRL   L0200C5

*-------------------------------
* Good start
*-------------------------------

L020087     LDA   #$0001
            STA   L02078C
            LDA   #$0000
            STA   L02078A
            JSR   L020167
            BCC   L02009B
            BRL   L0200C5
L02009B     LDA   L020774
            BEQ   L0200BC
            PEI   $0E	; handle
            PEI   $0C
            LDA   $06	; handle
            PHA
            LDA   $04
            PHA
            LDA   L020774	; length
            PHA
            LDA   #$0005
            JSL   L030000
            PLX
            PLX
            PLX
            PLX
            PLX
            BCS   L0200CA
L0200BC     LDA   #$0001
            STA   L02078A
            JSR   L020167
L0200C5     CLC
            LDA   #$0000
            RTL

L0200CA     PHA
            PEA   ^L020790
            PEA   L020790
            _WriteString
            JSR   L0200E1
            PLA
            JSR   L020102
            BRA   L0200C5
L0200E1     LDA   $03,S
            PHA
            PEA   ^L0207B1
            PEA   L0207B1
            PEA   $0004
            _Int2Hex
            PEA   ^L0207B0
            PEA   L0207B0
            _WriteString
            RTS

L020102     PEA   ^L0207AF
            PEA   L0207AF
            _WriteLine
            RTS

            CLC
            RTS

*-------------------------------
* 
*-------------------------------

L020112     STZ   L020770	; no Orca yet
            LDY   #$0006
L020118     LDA   L020CFB,Y	; Is it BYTEWRKS
            CMP   [$00],Y
            BNE   L020126
            DEY
            DEY
            BPL   L020118
            INC   L020770	; we are running under Orca

L020126     STZ   L020774
            STZ   L020776
            PHA
            PHA
            LDA   #$0000
            PHA
            PHA
            LDA   L02078E
            PHA
            PEA   $0000
            PHA
            PHA
            _NewHandle
            PLX
            STX   $04
            PLX
            STX   $06
            PHA
            PHA
            LDA   #$0000
            PHA
            PHA
            LDA   L02078E
            PHA
            PEA   $0000
            PHA
            PHA
            _NewHandle
            PLX
            STX   $0C
            PLX
            STX   $0E
            RTS

L020167     LDY   #$0008
            JSR   L0201CB
            JSR   L0201E5
L020170     CMP   #'-'	; - 8
            BNE   L02017E
            STA   L02077A
            INY
            JSR   L02024B
            BRA   L0201C0
L02017E     CMP   #'+'	; + 9
            BNE   L02018C
            STA   L02077A
            INY
            JSR   L02024B
            BRA   L0201C0
L02018C     CMP   #$0022	; " A
            BNE   L0201A0
            STA   L02077C
            LDA   #$0001
            STA   L020780
            INY
            JSR   L0204F2
            BRA   L0201C0
L0201A0     CMP   #$0027	; ' B
            BNE   L0201B1
            STA   L02077C
            STZ   L020780
            INY
            JSR   L0204F2
            BRA   L0201C0
L0201B1     LDA   #$0001
            STA   L020780
            LDA   #$0020
            STA   L02077C
            JSR   L0204F2
L0201C0     BCS   L0201C9
            JSR   L0201E5
            BNE   L020170
            CLC
            RTS

L0201C9     SEC
            RTS

L0201CB     LDA   #$0020
            SEP   #$20
            STA   L02077E
            BRA   L0201D6
L0201D5     INY
L0201D6     LDA   [$00],Y
            BEQ   L0201DF
            CMP   L02077E
            BNE   L0201D5
L0201DF     REP   #$20
            AND   #$00FF
            RTS

L0201E5     SEP   #$20
            BRA   L0201EA
L0201E9     INY
L0201EA     LDA   [$00],Y
            BEQ   L0201F2
            CMP   #$20
            BEQ   L0201E9
L0201F2     REP   #$30
            AND   #$00FF
            RTS

*-------------------------------
* String to number
*-------------------------------

            MX    %10
L0201F8     SEP   #$20
            LDX   #$0000
            INY
            LDA   [$00],Y
            CMP   #$2D	; .
L020202     BNE   L020209
            STA   L0207B1,X
            INX
            INY
L020209     JSR   L020233	; is it a number?
            BCS   L020230	; no
L02020E     JSR   L020233	; is it a number again?
            BCC   L02020E	; yes
            CPX   #$0007	; end of string?
            BCS   L020230	; yes
            REP   #$20	; make it a number
            PHY
            PHA
            PEA   ^L0207B1
            PEA   L0207B1
            PHX
            PEA   $0001
            _Dec2Int
            PLA
            PLY
            DEY
L020230     REP   #$20
            RTS

            MX    %10
L020233     LDA   [$00],Y	; save the number value
            CMP   #$30
            BCC   L020249
            CMP   #$3A
            BCS   L020249
            CPX   #$0006
            BCS   L020245
            STA   L0207B1,X
L020245     INX
            INY
            CLC
            RTS
L020249     SEC
            RTS

*-------------------------------
* 
*-------------------------------

            MX    %00
            
L02024B     LDA   [$00],Y
            AND   #$00FF
            BEQ   L020257
            CMP   #' '	; space
            BNE   L02025A
L020257     BRL   L0202DA
L02025A     PHY
            PEA   L0202D3-1
            CMP   #'K'	; K - stop shellplay and remove it from memory
            BNE   L020266
            BRL   L0203AA
L020266     CMP   #'t'	; t - guess the tempo method
            BNE   L02026E
            BRL   L0203BC
L02026E     CMP   #'C'	; C - clear all songs from the playlist
            BNE   L020276
            BRL   L02039C
L020276     CMP   #'s'	; s - skip to the previous/next song
            BNE   L02027E
            BRL   L020368
L02027E     CMP   #'H'	; H - hardware handshaking on the modem port
            BNE   L020286
            BRL   L02034A
L020286     CMP   #'S'	; S - use X% stereo
            BNE   L02028E
            BRL   L0202FC
L02028E     CMP   #'V'	; V - set the volume to X% of the maximum
            BNE   L020296
            BRL   L020316
L020296
*            BRA   L0202A0
            CMP   #'E'	; E - unknown feature
            BNE   L0202A0
            BRL   L020330
L0202A0     CMP   #'r'	; r - play MODs randomly/sequentially
            BNE   L0202A8
            BRL   L020470
L0202A8     CMP   #'b'	; b - do/don't follow position jumps
            BNE   L0202B0
            BRL   L02048E
L0202B0     CMP   #'c'	; c - print the name of the MOD currently being played
            BNE   L0202B8
            BRL   L0204AC
L0202B8     CMP   #'l'	; l - print out the playlist
            BNE   L0202C0
            BRL   L0204BA
L0202C0     CMP   #'g'	; g - goto song number X
            BNE   L0202C8
            BRL   L0204C8
L0202C8     CMP   #'?'	; ? - print a brief option summary
            BNE   L0202D0
            BRL   L0204E8
L0202D0     BRL   L020404
L0202D3     PLY
            BCS   L0202DB
            INY
            BRL   L02024B
L0202DA     CLC
L0202DB     RTS

*-------------------------------
* Err / Illegal value
*-------------------------------

L0202DC     BRA   L0202ED
L0202DE     STR   'Illegal value.'
L0202ED     PEA   ^L0202DE
            PEA   L0202DE
            _WriteLine
            SEC
            RTS

*-------------------------------
* S / Set Stereo Value
*-------------------------------

L0202FC     JSR   L0201F8	; get a number
            BCS   L0202DC
            PHA
            TYA
            STA   $05,S
            LDA   L02078A
            CLC
            BNE   L020312
            LDA   #$000C
            JSL   L030000
L020312     PLA
            BCS   L0202DC
            RTS

*-------------------------------
* V / Set Volume
*-------------------------------

L020316     JSR   L0201F8	; get a number
            BCS   L0202DC
            PHA
            TYA
            STA   $05,S
            LDA   L02078A
            CLC
            BNE   L02032C
            LDA   #$000B
            JSL   L030000
L02032C     PLA
            BCS   L0202DC
            RTS

*-------------------------------
* E / Unknown feature
*-------------------------------

L020330     JSR   L0201F8	; get a number?
            BCS   L0202DC	; error
            PHA
            TYA
            STA   $05,S
            LDA   L02078A
            CLC
            BEQ   L020346
            LDA   #$000D
            JSL   L030000
L020346     PLA
            BCS   L0202DC
            RTS

*-------------------------------
* H / Hardware handshaking
*-------------------------------

L02034A     LDA   L02078A
            BNE   L0203BA
            LDY   #$FFFF
            LDA   L02077A
            CMP   #'+'	; +
            BEQ   L02035D
            LDY   #$0000
L02035D     PHY
            LDA   #$000A
            JSL   L030000
            PLY
            CLC
            RTS

*-------------------------------
* s / Skip to the previous/next song
*-------------------------------

L020368     LDA   L02078A
            BEQ   L0203BA
            LDA   L02078C
            BEQ   L0203BA
            LDX   #$0000
L020375     INY
            INX
            LDA   [$00],Y
            AND   #$007F
            CMP   #$0073	; s
            BEQ   L020375
            DEY
            TYA
            STA   $03,S
            TXA
            LDY   L02077A
            CPY   #'+'	; +
            BEQ   L020392
            EOR   #$FFFF
            INC
L020392     PHA
            LDA   #$0009
            JSL   L030000
            PLA
            RTS

*-------------------------------
* C / Clear all songs from the playlist
*-------------------------------

L02039C     LDA   L02078A
            BNE   L0203BA
            LDA   #$0008
            JSL   L030000
            CLC
            RTS

*-------------------------------
* K / stop shellplay and remove it from memory
*-------------------------------

L0203AA     LDA   L02078C
            BEQ   L0203B8
            JSL   L020D03
            LDA   $00
            STA   L02078C
L0203B8     SEC
            RTS
L0203BA     CLC
            RTS

L0203BC     INY
            TYA
            STA   $03,S
            LDA   [$00],Y
            AND   #$00FF
            TAX
            SEC
            SBC   #$0030
            CMP   #$0005	; 50 or 60 Hz
            BCC   L0203EF
            LDA   #$0000
            CPX   #$0073	; s - guess the tempo method -> 0
            BEQ   L0203EF
            INC
            CPX   #$0070	; p - force SP to use Protracker tempo -> 1 
            BEQ   L0203EF
            INC
            CPX   #$0063	; c - force SP to use constant speed tempo -> 2
            BEQ   L0203EF
            INC
            CPX   #$0035	; 5 - use 50Hz timing -> 3
            BEQ   L0203EF
            INC
            CPX   #$0036	; 6 - use 60Hz timing -> 4
            BNE   L020448
L0203EF     LDX   L02078A
            BEQ   L0203BA
            LDX   L02078C
            BEQ   L0203BA
            PHA
            LDA   #$0007	; Set Tempo
            JSL   L030000
            PLA
            CLC
            RTS

*-------------------------------
* 
*-------------------------------

L020404     LDA   L02078A
            BNE   L0203BA
            BRA   L020418

L02040B     STR   'Bad option: '

L020418     PEA   ^L02040B
            PEA   L02040B
            _WriteString
            LDA   $03,S
            TAY
            LDA   [$00],Y
            AND   #$00FF
            PHA
            _WriteChar

*-------------------------------
* 
*-------------------------------

            BRA   L020439
L020437     STR   '.'
L020439     PEA   ^L020437
            PEA   L020437
            _WriteLine
            SEC
            RTS

*-------------------------------
* 
*-------------------------------

L020448     BRA   L020461
L02044A     STR   'Invalid tempo setting.'
L020461     PEA   ^L02044A
            PEA   L02044A
            _WriteLine
            SEC
            RTS

*-------------------------------
* r / play MODs randomly or sequentially
*-------------------------------

L020470     LDA   L02078A
            BNE   L02048C
            LDY   #$0001	; 0001: randomly
            LDA   L02077A
            CMP   #'+'	; +
            BEQ   L020483
            LDY   #$0000	; 0000: sequentially
L020483     PHY
            LDA   #$000E
            JSL   L030000
            PLA
L02048C     CLC
            RTS

*-------------------------------
* b / don't (0000) do (0001) follow position jumps
*-------------------------------

L02048E     LDA   L02078A
            BEQ   L0204AA
            LDY   #$0001
            LDA   L02077A
            CMP   #'+'
            BEQ   L0204A1
            LDY   #$0000
L0204A1     PHY
            LDA   #$000F
            JSL   L030000
            PLA
L0204AA     CLC
            RTS

*-------------------------------
* c / print current song name
*-------------------------------

L0204AC     LDA   L02078A
            BEQ   L0204B8
            LDA   #$0011
            JSL   L030000
L0204B8     CLC
            RTS

*-------------------------------
* l / print out the playlist
*-------------------------------

L0204BA     LDA   L02078A
            BEQ   L0204B8
            LDA   #$0010
            JSL   L030000
            CLC
            RTS

*-------------------------------
* g / goto song number X
*-------------------------------

L0204C8     JSR   L0201F8
            BCC   L0204D0
            BRL   L0202DC	; Err illegal value
L0204D0     PHA
            TYA
            STA   $05,S
            LDA   L02078A
            CLC
            BEQ   L0204E1
            LDA   #$0012
            JSL   L030000
L0204E1     PLA
            BCC   L0204E7
            BRL   L0202DC	; Err illegal value
L0204E7     RTS

*-------------------------------
* 
*-------------------------------

L0204E8     LDA   L02078A
            BEQ   L0204F0
            JSR   L0206E4
L0204F0     CLC
            RTS

L0204F2     STY   L020788
            LDX   #$0001
            SEP   #$20
L0204FA     LDA   [$00],Y
            BNE   L020501
            BRL   L02061D
L020501     CMP   L02077C
            BEQ   L020515
            CPX   #$0041
            BCC   L02050E
            BRL   L02065B
L02050E     STA   L0207C1,X
            INX
            INY
            BRA   L0204FA
L020515     TYX
            INX
L020517     REP   #$20
            PHX
            LDA   L02078A
            BNE   L020549
            TYA
            SEC
            SBC   L020788
            SEP   #$20
            STA   L0207C1
            REP   #$20
            BEQ   L020551
            STZ   L020772
            LDA   L020770	; Orca shell?
            BEQ   L02053A
            LDA   L020780
            BNE   L02053F
L02053A     JSR   L0205B6
            BRA   L020542
L02053F     JSR   L020584
L020542     BCS   L02054C
            LDA   L020772
            BEQ   L020551
L020549     LDA   #$0000
L02054C     PLY
            CMP   #$0001
            RTS

L020551     PEA   ^L020925
            PEA   L020925
            _WriteString
            PEA   ^L0207C1
            PEA   L0207C1
            _WriteString
            PEA   $000D
            _WriteChar
            PEA   $000A
            _WriteChar
            LDA   #$9000
            BRA   L02054C
L020584     JSL   GSOS
            DW    $0109       ; Shell: Init_Wildcard
            ADRL  L0207B7
L02058E     JSL   GSOS
            DW    $010A       ; Shell: Next_Wildcard
            ADRL  L0207BD
            LDA   L020805
            AND   #$00FF
            BEQ   L0205B4
            INC   L020772
            LDA   L020804
            XBA
            AND   #$00FF
            STA   L020804
            JSR   L020682
            BCS   L0205B5
            BRA   L02058E
L0205B4     CLC
L0205B5     RTS

L0205B6     STZ   L020804
            LDA   L0207C2
            AND   #$00FF
            CMP   #$002F
            BEQ   L0205D5
            CMP   #$003A
            BEQ   L0205D5
            JSL   GSOS
            DW    $200A       ; GetPrefix
            ADRL  L020915
            BCS   L02061C
L0205D5     LDA   L0207C1
            AND   #$00FF
            CLC
            ADC   L020804
            CMP   #$0100
            BCS   L02061C
            TAY
            LDA   L020804
            CLC
            ADC   #L020806
            STA   $18
            STY   L020804
            SEP   #$30
            LDY   L0207C1
            DEY
L0205F7     LDA   L0207C2,Y
            CMP   #$2F
            BNE   L020600
            LDA   #$3A
L020600     STA   ($18),Y
            DEY
            BPL   L0205F7
            REP   #$30
            JSL   GSOS
            DW    $2006       ; GetFileInfo
            ADRL  L02091D
            BCS   L02061B
            INC   L020772
            JSR   L020682
            BCS   L02061C
L02061B     CLC
L02061C     RTS

L02061D     REP   #$20
            LDA   L02077C
            CMP   #$0020
            BNE   L02062B
            TYX
            BRL   L020517
L02062B     BRA   L020638
L02062D     STR   'Unmatched '
L020638     PEA   ^L02062D
            PEA   L02062D
            _WriteString
            LDA   L02077C
            PHA
            PEA   $0000
            PEA   $0001
            PEA   $0000
            JSL   L020D4B
L020656     LDA   #$8000
            SEC
            RTS

L02065B     REP   #$20
            BRA   L020673
L02065F     STR   'Parameter too long.'
L020673     PEA   ^L02065F
            PEA   L02065F
            _WriteLine
            BRA   L020656
L020682     LDA   L020786
            BNE   L02068A
            BRL   L0206CE
L02068A     INC   L020774
            LDA   L020774
            CMP   #$0FFF
            BCC   L02069B
            LDA   #$8102
            BRL   L0206D0
L02069B     PEI   $0E
            PEI   $0C
            PEA   ^L020905
            PEA   L020905
            PEA   $0000
            PEA   $0010
            JSL   L0206FA
            BCC   L0206B3
            BRA   L0206CF
L0206B3     PEI   $06
            PEI   $04
            PEA   ^L020804
            PEA   L020804
            PEA   $0000
            LDA   L020804
            INC
            INC
            PHA
            JSL   L0206FA
            BCC   L0206CE
            BRA   L0206CF
L0206CE     CLC
L0206CF     RTS

L0206D0     DEC   L020774
            BRA   L0206CF
L0206D5     LDY   #$0008
            JSR   L0201CB
            BEQ   L0206E4
            JSR   L0201E5
            BEQ   L0206E4
            CLC
            RTS

L0206E4     PEA   ^L020930
            PEA   L020932
            PEA   $0000
            LDA   L020930
            PHA
            _TextWriteBlock
            SEC
            RTS

L0206FA     PHD
            PHA
            PHA
            TSC
            INC
            TCD
            PEI   $13
            PEI   $11
            _GetHandleSize
            CLC
            LDA   $00
            ADC   $09
            TAX
            LDA   $02
            ADC   $0B
            PHA
            PHX
            PEI   $13
            PEI   $11
            _SetHandleSize
            BCS   L020759
            LDY   #$0004
            LDA   [$11],Y
            ORA   #$8000
            STA   [$11],Y
            PEI   $0F
            PEI   $0D
            CLC
            LDA   [$11]
            ADC   $00
            TAX
            LDY   #$0002
            LDA   [$11],Y
            ADC   $02
            PHA
            PHX
            PEI   $0B
            PEI   $09
            _BlockMove
            LDY   #$0004
            LDA   [$11],Y
            AND   #$7FFF
            STA   [$11],Y
            LDA   #$0000
L020759     TAY
            LDA   $07
            STA   $13
            LDA   $06
            STA   $12
            LDA   $04
            TCD
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            CMP   #$0001
            RTL

L020770     DW    $0000	; Orca shell?
L020772     DB    $00
            DB    $00
L020774     DB    $00
            DB    $00
L020776     DB    $00
            DB    $00
            DB    $00
            DB    $00
L02077A     DB    $00
            DB    $00
L02077C     DB    $00
            DB    $00
L02077E     DB    $00
            DB    $00
L020780     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $01
            DB    $00
L020786     DB    $01
            DB    $00
L020788     DB    $00
            DB    $00
L02078A     DW    $0000
L02078C     DB    $00
            DB    $00
L02078E     ENT
            DB    $00
            DB    $00
L020790     STR   'Unable to add songs to list: $'
L0207AF     DB    $00
L0207B0     DB    $04
L0207B1     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L0207B7     ADRL  L0207C1     ;  file name
            DW    $0000       ;  flags
L0207BD     ADRL  L020805     ;  file name
L0207C1     DB    $00
L0207C2     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L020802     DW    $0102
L020804     DB    $00
L020805     DB    $00
L020806     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L020905     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L020915     DW    $0002       ; Parms for GetPrefix
            DW    $0000       ;  prefix num
            ADRL  L020802     ;  prefix ptr
L02091D     DW    $0002       ; Parms for GetFileInfo
            ADRL  L020804     ;  file name
            DW    $0000       ;  access
L020925     STR   'No match: '

L020930     DW    L020CFB-L020932	; $03C9
L020932     ASC   '---'0D0A
            ASC   '      Shellplay  v0.72    Copyright (c) 1993 by Brian C Bening    Freeware'0D0A
            ASC   '     (19:45  23 Jun 93)   All rights reserved.'0D0A0D0A
            ASC   'usage: sp [option(s)] [MODfile(s)] [ [option(s)] [MODfile(s)] [...] ]'0D0A
            ASC   'options:'0D0A
            ASC   '   -ts smart PT/constant tempo            +|-s  change current song'0D0A
            ASC   '   -tp force protracker tempo               -r  don'27't use random play'0D0A
            ASC   '   -tc force constant tempo                 +r  random play / re-randomize'0D0A
            ASC   '   -t5 constant tempo is PAL 50Hz           -C  clear playlist'0D0A
            ASC   '   -t6 constant tempo is NTSC 60Hz          -K  kill and remove shellplay'0D0A
            ASC   '   -VX set volume percent (0..100)          -gX goto song X'0D0A
            ASC   '   -SX set percent stereo (-200..200)       -l  print playlist'0D0A
            ASC   ' +|-b  follow position jumps                -c  print current MODfile'0D0A
            ASC   '   -?  print this option list             +|-H  modem port hardware handshaking'0D0A0D0A
            ASC   'default options: sp -H -r -b -ts -t5 -S70 -V60'0D0A0D0A
            ASC   'send comments, suggestions, bug reports to: vacc0001@student.tc.umn.edu'0D0A

L020CFB     ASC   'BYTEWRKS'

*-------------------------------
* Stop shellplay and remove it from memory
*-------------------------------

L020D03     LDA   #$0002
            JSL   L030000
            PHA
            PHA
            _DisposeAll
            _DeleteID
            RTL

*-------------------------------
* 
*-------------------------------

L020D1B     ENT
            TSC
            PHD
            TCD
            PEA   ^L020DD6
            PEA   L020DD6
            LDA   $0A
            JSL   L020DBF
            PEA   ^L020DD6
            PEA   L020DD6
            LDA   $08
            PHA
            LDA   $06
            PHA
            LDA   $04
            PHA
            JSL   L020D7A
            LDA   $02
            STA   $0A
            LDA   $00
            STA   $08
            PLD
            PLA
            PLA
            PLA
            PLA
            RTL

*-------------------------------
* 
*-------------------------------

L020D4B     TSC
            PHD
            TCD
            LDA   #$0001
            STA   L020DD7
            LDA   $0A
            STA   L020DD8
            PEA   ^L020DD6
            PEA   L020DD6
            LDA   $08
            PHA
            LDA   $06
            PHA
            LDA   $04
            PHA
            JSL   L020D7A
            LDA   $02
            STA   $0A
            LDA   $00
            STA   $08
            PLD
            PLA
            PLA
            PLA
            PLA
            RTL

L020D7A     TSC
            PHD
            TCD
            INC   $0A
            BNE   L020D83
            INC   $0C
L020D83     LDA   [$0A]
            AND   #$00FF
            SEC
            SBC   $08
            BPL   L020D97
            EOR   #$FFFF
            INC
            LDY   $04
            JSL   L020E75
L020D97     LDA   $0C
            PHA
            LDA   $0A
            PHA
            LDA   $06
            EOR   #$0001
            ASL
            ORA   $04
            XBA
            CLC
            ADC   #$1A0C      ; WriteLine
            TAX
            JSL   TOOLBOX
            LDA   $02
            STA   $0C
            LDA   $00
            STA   $0A
            PLD
            CLC
            TSC
            ADC   #$000A
            TCS
            RTL

L020DBF     PHA
            PEA   ^L020E00
            PEA   L020E00
            PEA   $0028
            PEA   $0001
            _Int2Dec
            JMP   L020E28

L020DD6     DB    $28
L020DD7     DB    $00
L020DD8     DS    $28
L020E00     DS    $28

L020E28     PHD
            TSC
            TCD
            SEP   #$20
            LDX   #$0000
            LDA   #$20
L020E32     CMPL  L020E00,X
            BNE   L020E3B
            INX
            BRA   L020E32
L020E3B     REP   #$20
            TXA
            SEC
            SBC   #$0028
            EOR   #$FFFF
            INC
            SEP   #$20
            CMP   [$06]
            BEQ   L020E4E
            BCS   L020E65
L020E4E     LDY   #$0001
            STA   [$06],Y
L020E53     LDAL  L020E00,X
            INY
            STA   [$06],Y
            INX
            CPX   #$0028
            BCC   L020E53
            REP   #$20
            CLV
            BRA   L020E69
L020E65     REP   #$20
            SEP   #$40
L020E69     LDA   $02,S
            STA   $06,S
            LDA   $04,S
            STA   $08,S
            PLD
            PLA
            PLA
            RTL

L020E75     PHA
            TYA
            XBA
            CLC
            ADC   #$180C	; _WriteSomething
            PHA
            PHD
            TSC
            TCD
L020E80     PEA   $0020
            LDX   $03
            JSL   TOOLBOX
            DEC   $05
            BNE   L020E80
            PLD
            PLA
            PLA
            RTL


