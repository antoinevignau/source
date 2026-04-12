*
* GSFile
*
* (c) 1997, SofWood Company
* (s) 2026, Brutal Deluxe Software
*

	mx	%00
	rel
	lst	off

*----------------------------------- Macros

	use	4/Ctl.Macs
	use	4/Desk.Macs
	use	4/Dialog.Macs
	use	4/DOS.16.Macs
	use	4/Event.Macs
	use	4/Int.Macs
	use	4/Line.Macs
	use	4/List.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/MIDISyn.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/SANE.Macs
	use	4/Sound.Macs
	use	4/Std.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	use	4/Window.Macs

	use	SEG4K.X.S
	
GSOS	=	$E100A8

*-----------------------------------

L0D0000     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            LDA   [$FD]
            AND   #$00FF
            STA   $EE
L0D0012     LDA   $EE
            DEC   $EE
            SEC
            SBC   #$0000
            BEQ   L0D004E
            BVS   L0D0021
            EOR   #$8000
L0D0021     BPL   L0D004E
            INC   $FD
            BNE   L0D0029
            INC   $FF
L0D0029     LDX   $FF
            LDA   $FD
            STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            PHA
            LDX   $FB
            LDA   $F9
            INC   $F9
            BNE   L0D0041
            INC   $FB
L0D0041     STA   $F0
            STX   $F2
            PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            BRA   L0D0012
L0D004E     LDA   #$0000
            SEP   #$20
            STA   [$F9]
            REP   #$20
            TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L0D005F     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E9
            TCS
            SEP   #$20
            STZ   $EB
            REP   #$20
            LDX   $FB
            LDA   $F9
            STX   $EE
            STA   $EC
L0D0078     LDA   [$FD]
            AND   #$00FF
            CMP   #$0000
            BEQ   L0D00AF
            LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L0D008C
            INC   $FF
L0D008C     STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            PHA
            INC   $F9
            BNE   L0D009C
            INC   $FB
L0D009C     LDX   $FB
            LDA   $F9
            STA   $F0
            STX   $F2
            PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            INC   $EB
            BRA   L0D0078
L0D00AF     LDA   $EB
            SEP   #$20
            STA   [$EC]
            REP   #$20
            TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L0D00BF     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00E0
            TCS
            STZ   $E4
            STZ   $E6
            LDA   $FF
            AND   #$0001
            CMP   #$0000
            BNE   L0D00EB
            LDX   #$8181
            LDA   #$8181
            PHA
            TXA
            STAL  L0E1F69
            PLA
            STAL  L0E1F67
            BRA   L0D00FC
L0D00EB     LDX   #$C1C1
            LDA   #$C1C1
            PHA
            TXA
            STAL  L0E1F69
            PLA
            STAL  L0E1F67
L0D00FC     LDA   $FD
            PHA
            LDA   #$000C
            SEC
            JSL   L0D151F
            PLA
            CLC
            ADC   #$000F
            STA   $E2
            LDA   $E2
            SEC
            SBC   #$003C
            BVS   L0D0119
            EOR   #$8000
L0D0119     BMI   L0D0120
            LDA   #$003C
            BRA   L0D0122
L0D0120     LDA   $E2
L0D0122     PHA
            LDAL  L0E1F5D
            PLX
            STX   $EE
            CLC
            ADC   $EE
            STAL  L0E1F61
            LDA   $FF
            AND   #$0002
            CMP   #$0000
            BNE   L0D0144
            LDA   #$0029
            STAL  L0E1FA9
            BRA   L0D014B
L0D0144     LDA   #$00C8
            STAL  L0E1FA9
L0D014B     LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E1F9D
            PLA
            STAL  L0E1F9B
            LDA   #L0E2053
            LDX   #^L0E2053
            PHA
            TXA
            STAL  L0E1FB5
            PLA
            STAL  L0E1FB3
            LDX   #$0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            TXA
            STAL  L0E1FCD
            PLA
            STAL  L0E1FCB
            LDX   #$0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            TXA
            STAL  L0E1FE5
            PLA
            STAL  L0E1FE3
            LDX   #$0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            TXA
            STAL  L0E1FFD
            PLA
            STAL  L0E1FFB
            LDX   #$0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            TXA
            STAL  L0E2015
            PLA
            STAL  L0E2013
            LDX   #$0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            TXA
            STAL  L0E202D
            PLA
            STAL  L0E202B
            LDX   #$0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            TXA
            STAL  L0E2045
            PLA
            STAL  L0E2043
            LDA   $FD
            CMP   #$0006
            BEQ   L0D01E8
            BRA   L0D0200
L0D01E8     LDY   #$0016
            LDA   [$F9],Y
            TAX
            LDY   #$0014
            LDA   [$F9],Y
            PHA
            TXA
            STAL  L0E2045
            PLA
            STAL  L0E2043
            BRA   L0D0207
L0D0200     CMP   #$0005
            BEQ   L0D0207
            BRA   L0D021F
L0D0207     LDY   #$0012
            LDA   [$F9],Y
            TAX
            LDY   #$0010
            LDA   [$F9],Y
            PHA
            TXA
            STAL  L0E202D
            PLA
            STAL  L0E202B
            BRA   L0D0226
L0D021F     CMP   #$0004
            BEQ   L0D0226
            BRA   L0D023E
L0D0226     LDY   #$000E
            LDA   [$F9],Y
            TAX
            LDY   #$000C
            LDA   [$F9],Y
            PHA
            TXA
            STAL  L0E2015
            PLA
            STAL  L0E2013
            BRA   L0D0245
L0D023E     CMP   #$0003
            BEQ   L0D0245
            BRA   L0D025D
L0D0245     LDY   #$000A
            LDA   [$F9],Y
            TAX
            LDY   #$0008
            LDA   [$F9],Y
            PHA
            TXA
            STAL  L0E1FFD
            PLA
            STAL  L0E1FFB
            BRA   L0D0264
L0D025D     CMP   #$0002
            BEQ   L0D0264
            BRA   L0D027C
L0D0264     LDY   #$0006
            LDA   [$F9],Y
            TAX
            LDY   #$0004
            LDA   [$F9],Y
            PHA
            TXA
            STAL  L0E1FE5
            PLA
            STAL  L0E1FE3
            BRA   L0D0283
L0D027C     CMP   #$0001
            BEQ   L0D0283
            BRA   L0D0296
L0D0283     LDY   #$0002
            LDA   [$F9],Y
            TAX
            LDA   [$F9]
            PHA
            TXA
            STAL  L0E1FCD
            PLA
            STAL  L0E1FCB
L0D0296     LDA   #L0E1F8F
            LDX   #^L0E1F8F
            PHA
            TXA
            STAL  L0E1F6D
            PLA
            STAL  L0E1F6B
            LDA   #L0E1FA7
            LDX   #^L0E1FA7
            PHA
            TXA
            STAL  L0E1F71
            PLA
            STAL  L0E1F6F
            LDA   #L0E1FBF
            LDX   #^L0E1FBF
            PHA
            TXA
            STAL  L0E1F75
            PLA
            STAL  L0E1F73
            LDA   #L0E1FD7
            LDX   #^L0E1FD7
            PHA
            TXA
            STAL  L0E1F79
            PLA
            STAL  L0E1F77
            LDA   #L0E1FEF
            LDX   #^L0E1FEF
            PHA
            TXA
            STAL  L0E1F7D
            PLA
            STAL  L0E1F7B
            LDA   #L0E2007
            LDX   #^L0E2007
            PHA
            TXA
            STAL  L0E1F81
            PLA
            STAL  L0E1F7F
            LDA   #L0E201F
            LDX   #^L0E201F
            PHA
            TXA
            STAL  L0E1F85
            PLA
            STAL  L0E1F83
            LDA   #L0E2037
            LDX   #^L0E2037
            PHA
            TXA
            STAL  L0E1F89
            PLA
            STAL  L0E1F87
            LDA   $F7
            CMP   #$0000
            BEQ   L0D0327
            BRA   L0D0346
L0D0327     PHA
            PEA   ^L0E1F5D
            PEA   L0E1F5D
            PEA   $0000
            PEA   $0000
            _StopAlert
            STA   L0F0779
            PLA
            STA   $E8
            BRL   L0D038C
            BRA   L0D034D
L0D0346     CMP   #$0001
            BEQ   L0D034D
            BRA   L0D036B
L0D034D     PHA
            PEA   ^L0E1F5D
            PEA   L0E1F5D
            PEA   $0000
            PEA   $0000
            _NoteAlert
            STA   L0F0779
            PLA
            STA   $E8
            BRA   L0D038C
            BRA   L0D0372
L0D036B     CMP   #$0002
            BEQ   L0D0372
            BRA   L0D038C
L0D0372     PHA
            PEA   ^L0E1F5D
            PEA   L0E1F5D
            PEA   $0000
            PEA   $0000
            _CautionAlert
            STA   L0F0779
            PLA
            STA   $E8
L0D038C     LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   $E8
            CMP   #$0002
            BNE   L0D03AA
            LDA   #$0000
            BRA   L0D03AD
L0D03AA     LDA   #$0001
L0D03AD     TAY
            TDC
            CLC
            ADC   #$00F1
            TCS
            TYA
            PLD
            RTL

L0D03B7     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            STZ   $F2
            BRA   L0D03C8
L0D03C6     INC   $F2
L0D03C8     LDA   $F2
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0D03D9
            DEC   $F6
L0D03D9     CLC
            ADC   $F4
            STA   $F4
            BCC   L0D03E2
            INC   $F6
L0D03E2     LDA   [$F4]
            AND   #$00FF
            AND   #$007F
            PHA
            LDA   $F2
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0D03FC
            DEC   $F6
L0D03FC     CLC
            ADC   $F4
            STA   $F4
            BCC   L0D0405
            INC   $F6
L0D0405     PLA
            SEP   #$20
            STA   [$F4]
            REP   #$20
            AND   #$00FF
            CMP   #$0000
            BNE   L0D03C6
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EE
            TCS
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            _GetPortRect
            STA   L0F0779
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            _ValidRect
            STA   L0F0779
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0D0455     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E3
            TCS
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            PEA   ^L0E4ACC
            PEA   L0E4ACC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   $0019
            JSL   L040622
            PLY
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E4ACC
            PEA   L0E4ACC
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   L0F00E1
            CMP   #$0001
            BNE   L0D04B2
            LDA   #$0000
            BRL   L0D08F7
L0D04B2     STZ   L0F0012
            PEA   $0000
            JSL   L0B1E73
            PLY
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDA   #L0E4CCC
            LDX   #^L0E4CCC
            PHA
            TXA
            STAL  L0E32D3
            PLA
            STAL  L0E32D1
            PEA   $0010
            PEA   ^L0E32CF
            PEA   L0E32CF
            JSL   L0F0831
            LDA   L0F0779
            CMP   #$0000
            BEQ   L0D0518
            LDA   L0F0779
            STA   L0F0598
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   L0F0598
            PHA
            PEA   $FFFD
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRL   L0D08F7
L0D0518     LDAL  L0E32CF
            STAL  L0E32D9
            LDA   #L0E0B58
            LDX   #^L0E0B58
            PHA
            TXA
            STAL  L0E32DD
            PLA
            STAL  L0E32DB
            LDX   #$0000
            LDA   #$03FA
            PHA
            TXA
            STAL  L0E32E1
            PLA
            STAL  L0E32DF
            PEA   $0012
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            LDAL  L0E32E5
            TAX
            LDAL  L0E32E3
            STX   $F6
            STA   $F4
            LDX   #$0000
            LDA   #$017A
            PHX
            PHA
            LDX   $F6
            LDA   $F4
            JSL   L0D157E
            BEQ   L0D05A3
            BVS   L0D0573
            EOR   #$8000
L0D0573     BPL   L0D05A3
            LDA   L0F0779
            STA   L0F0598
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   L0F0598
            PHA
            PEA   $FFFD
            JSL   L061721
            PLY
            PLY
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            LDA   #$0000
            BRL   L0D08F7
L0D05A3     LDA   L0F0779
            CMP   #$0000
            BEQ   L0D05E1
            LDA   L0F0779
            CMP   #$004C
            BEQ   L0D05E1
            LDA   L0F0779
            STA   L0F0598
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   L0F0598
            PHA
            PEA   $FFFD
            JSL   L061721
            PLY
            PLY
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            LDA   #$0000
            BRL   L0D08F7
L0D05E1     PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            JSL   L080027
            PEA   ^L0E3AA0
            PEA   L0E3AA0
            JSL   L0800DE
            PLY
            PLY
            STA   $E5
            PEA   $0002
            PEA   $0001
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEI   $E5
            PEA   $0000
            PEA   $0002
            JSL   L011721
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            LDA   #$0000
            SEP   #$20
            STAL  L0E4A4C
            REP   #$20
            PEA   $0000
            JSL   L0A15AF
            PLY
            PEI   $E5
            JSL   L011C24
            PLY
            PEA   $0000
            JSL   L0B1E73
            PLY
            LDA   #L0E0B58
            LDX   #^L0E0B58
            STX   $F1
            STA   $EF
            SEP   #$20
            STZ   $F3
            REP   #$20
            BRA   L0D06BB
L0D0657     LDA   $F3
            AND   #$00FF
            PHA
            LDA   #$0016
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDA   $EF
            CLC
            ADC   #$0165
            STA   $F8
            LDA   $F1
            BCC   L0D0674
            INC
L0D0674     STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D0680
            INC   $FA
L0D0680     PEI   $FA
            PEI   $F8
            LDA   $F3
            AND   #$00FF
            PHA
            LDA   #$0016
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDA   $EF
            CLC
            ADC   #$0165
            STA   $F8
            LDA   $F1
            BCC   L0D06A1
            INC
L0D06A1     STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D06AD
            INC   $FA
L0D06AD     PEI   $FA
            PEI   $F8
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
            INC   $F3
L0D06BB     LDA   $F3
            AND   #$00FF
            PHA
            LDY   #$0023
            LDA   [$EF],Y
            AND   #$00FF
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BEQ   L0D06DB
            BVS   L0D06D6
            EOR   #$8000
L0D06D6     BPL   L0D06DB
            BRL   L0D0657
L0D06DB     SEP   #$20
            STZ   $F3
            REP   #$20
            BRL   L0D08AD
L0D06E4     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            JSL   L0825EE
            PLY
            CMP   #$0000
            BEQ   L0D070C
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   #$0000
            BRL   L0D08F7
L0D070C     LDA   $F3
            AND   #$00FF
            PHA
            LDA   #$0016
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDA   $EF
            CLC
            ADC   #$0174
            STA   $F8
            LDA   $F1
            BCC   L0D0729
            INC
L0D0729     STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D0735
            INC   $FA
L0D0735     LDA   #$0000
            SEP   #$20
            STA   [$F8]
            REP   #$20
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   [$F8]
            STA   L0F00D5
            LDA   L0F00D5
            STA   L0F00D7
            LDA   $F3
            AND   #$00FF
            PHA
            LDA   $EF
            CLC
            ADC   #$002A
            STA   $F8
            LDA   $F1
            BCC   L0D0766
            INC
L0D0766     STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D0772
            INC   $FA
L0D0772     LDA   [$F8]
            AND   #$00FF
            CMP   #$0000
            BEQ   L0D07AD
            LDA   $F3
            AND   #$00FF
            PHA
            LDA   $EF
            CLC
            ADC   #$002A
            STA   $F8
            LDA   $F1
            BCC   L0D078F
            INC
L0D078F     STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D079B
            INC   $FA
L0D079B     LDA   [$F8]
            AND   #$00FF
            SEC
            SBC   #$003F
            BEQ   L0D07D5
            BVS   L0D07AB
            EOR   #$8000
L0D07AB     BPL   L0D07D5
L0D07AD     LDA   $F3
            AND   #$00FF
            PHA
            LDA   $EF
            CLC
            ADC   #$002A
            STA   $F8
            LDA   $F1
            BCC   L0D07C0
            INC
L0D07C0     STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D07CC
            INC   $FA
L0D07CC     LDA   #$0009
            SEP   #$20
            STA   [$F8]
            REP   #$20
L0D07D5     LDA   L0F00D7
            PHA
            LDA   $F3
            AND   #$00FF
            PHA
            LDA   $EF
            CLC
            ADC   #$002A
            STA   $F8
            LDA   $F1
            BCC   L0D07EC
            INC
L0D07EC     STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D07F8
            INC   $FA
L0D07F8     LDA   [$F8]
            AND   #$00FF
            PHA
            LDA   #$0008
            SEC
            JSL   L0D151F
            PLA
            PHA
            PEA   $0000
            PEA   $0000
            LDA   L0F00D5
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            LDA   $F3
            AND   #$00FF
            PHA
            LDA   #$0016
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDA   $EF
            CLC
            ADC   #$0165
            STA   $F8
            LDA   $F1
            BCC   L0D083F
            INC
L0D083F     STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D084B
            INC   $FA
L0D084B     PEI   $FA
            PEI   $F8
            PEA   $0000
            JSL   L0807C7
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            JSL   L090630
            JSL   L083651
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   [$F8]
            SEC
            SBC   #$0001
            BEQ   L0D08A4
            BVS   L0D087D
            EOR   #$8000
L0D087D     BPL   L0D08A4
            LDA   L0F00D5
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E7
            PHA
            JSL   L092547
            PLY
            PLY
            PLY
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0022
            LDA   [$F8],Y
            STA   $ED
L0D08A4     JSL   L091079
            STZ   L0F0012
            INC   $F3
L0D08AD     LDA   $F3
            AND   #$00FF
            PHA
            LDY   #$0023
            LDA   [$EF],Y
            AND   #$00FF
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BEQ   L0D08CD
            BVS   L0D08C8
            EOR   #$8000
L0D08C8     BPL   L0D08CD
            BRL   L0D06E4
L0D08CD     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0064
            STA   [$F8],Y
            LDA   #$0001
            STA   L0F0042
            LDA   #$0001
            STA   L0F0006
            JSL   L011281
            PEA   $0001
            JSL   L0B1E73
            PLY
L0D08F7     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0D0901     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00CB
            TCS
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            PEA   ^L0E4ACC
            PEA   L0E4ACC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   $0019
            JSL   L040622
            PLY
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E4ACC
            PEA   L0E4ACC
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            STZ   L0F0012
            LDA   L0F00E1
            CMP   #$0001
            BNE   L0D0961
            LDA   #$0000
            BRL   L0D0F7D
L0D0961     PEA   ^L0E4BCC
            PEA   L0E4BCC
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDA   #L0E4CCC
            LDX   #^L0E4CCC
            PHA
            TXA
            STAL  L0E32D3
            PLA
            STAL  L0E32D1
            PEA   $0010
            PEA   ^L0E32CF
            PEA   L0E32CF
            JSL   L0F0831
            LDA   L0F0779
            BEQ   L0D09B1
            LDA   L0F0779
            STA   L0F0598
            LDA   L0F0598
            PHA
            PEA   $FFFD
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRL   L0D0F7D
L0D09B1     PHX
            PHA
            PEA   $0000
            PEA   $0960
            LDA   L0F001E
            PHA
            PEA   $C010
            PEA   $0000
            PEA   $0000
            _NewHandle
            STA   L0F0779
            PLA
            PLX
            STX   $F6
            STA   $F4
            LDA   L0F0779
            BEQ   L0D0A0F
            LDA   L0F0779
            STA   L0F0598
            LDA   L0F0598
            PHA
            PEA   $FFE0
            JSL   L061721
            PLY
            PLY
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEI   $F6
            PEI   $F4
            _DisposeHandle
            STA   L0F0779
            LDA   #$0000
            BRL   L0D0F7D
L0D0A0F     PEA   $0000
            JSL   L0B1E73
            PLY
            LDAL  L0E32CF
            STAL  L0E32D9
            LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            PHA
            TXA
            STAL  L0E32DD
            PLA
            STAL  L0E32DB
            LDX   #$0000
            LDA   #$0032
            PHA
            TXA
            STAL  L0E32E1
            PLA
            STAL  L0E32DF
            PEA   $0012
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            LDAL  L0E32E5
            TAX
            LDAL  L0E32E3
            STX   $EA
            STA   $E8
            LDA   L0F0779
            BEQ   L0D0A9E
            LDA   L0F0779
            STA   L0F0598
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   L0F0598
            PHA
            PEA   $FFFA
            JSL   L061721
            PLY
            PLY
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEI   $F6
            PEI   $F4
            _DisposeHandle
            STA   L0F0779
            LDA   #$0000
            BRL   L0D0F7D
L0D0A9E     LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STX   $F2
            STA   $F0
            LDY   #$0026
            LDA   [$F0],Y
            AND   #$00FF
            LDX   #$0000
            PHX
            PHA
            LDX   #$0000
            LDA   #$0258
            SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDA   [$F0]
            LDX   #$0000
            TAY
            BPL   L0D0ACF
            DEX
L0D0ACF     JSL   L0D1573
            PLA
            PLX
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EE
            STA   $EC
            LDY   #$0024
            LDA   [$F0],Y
            STA   $E6
            LDAL  L0E32CF
            STAL  L0E53A1
            LDX   $EE
            LDA   $EC
            PHA
            TXA
            STAL  L0E53A5
            PLA
            STAL  L0E53A3
            PEA   $0016
            PEA   ^L0E53A1
            PEA   L0E53A1
            JSL   L0F0831
            LDA   L0F0779
            BEQ   L0D0B50
            LDA   L0F0779
            STA   L0F0598
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   L0F0598
            PHA
            PEA   $FFE0
            JSL   L061721
            PLY
            PLY
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEI   $F6
            PEI   $F4
            _DisposeHandle
            STA   L0F0779
            LDA   #$0000
            BRL   L0D0F7D
L0D0B50     STZ   L0F05A4
            STZ   L0F05B1
            STZ   L0F05AD
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            STA   $CD
            JSL   L0A0A02
            LDA   #$0001
            STA   $D1
            PEA   $0000
            JSL   L0A2CC0
            PLY
            STZ   $E4
            BRL   L0D0F37
L0D0B80     LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STX   $E0
            STA   $DE
            LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            PHA
            TXA
            STAL  L0E32DD
            PLA
            STAL  L0E32DB
            LDX   #$0000
            LDA   #$0002
            PHA
            TXA
            STAL  L0E32E1
            PLA
            STAL  L0E32DF
            PEA   $0012
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            LDA   L0F0779
            BEQ   L0D0BE0
            LDA   L0F0779
            STA   L0F0598
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   L0F0598
            PHA
            PEA   $FFFA
            JSL   L061721
            PLY
            PLY
            BRL   L0D0F4B
L0D0BE0     LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            PHA
            TXA
            STAL  L0E32DD
            PLA
            STAL  L0E32DB
            LDA   [$F0]
            LDX   #$0000
            TAY
            BPL   L0D0BFC
            DEX
L0D0BFC     PHA
            TXA
            STAL  L0E32E1
            PLA
            STAL  L0E32DF
            LDX   $EE
            LDA   $EC
            CLC
            ADCL  L0E32DF
            PHA
            TXA
            ADCL  L0E32E1
            TAX
            PLA
            CLC
            ADC   #$0002
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EE
            STA   $EC
            PEA   $0012
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            LDA   L0F0779
            BEQ   L0D0C57
            LDA   L0F0779
            STA   L0F0598
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   L0F0598
            PHA
            PEA   $FFFA
            JSL   L061721
            PLY
            PLY
            BRL   L0D0F4B
L0D0C57     LDX   $EE
            LDA   $EC
            PHA
            TXA
            STAL  L0E53A5
            PLA
            STAL  L0E53A3
            PEA   $0016
            PEA   ^L0E53A1
            PEA   L0E53A1
            JSL   L0F0831
            LDA   L0F0779
            BEQ   L0D0C96
            LDA   L0F0779
            STA   L0F0598
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   L0F0598
            PHA
            PEA   $FFFD
            JSL   L061721
            PLY
            PLY
            BRL   L0D0F4B
L0D0C96     LDA   $D1
            BEQ   L0D0C9F
            STZ   $D1
            BRL   L0D0F35
L0D0C9F     LDA   [$DE]
            AND   #$00FF
            SEP   #$20
            STA   $DD
            REP   #$20
            AND   #$00FF
            CMP   #$00FF
            BNE   L0D0CB5
            BRL   L0D0EB8
L0D0CB5     LDA   $CD
            SEC
            SBC   L0F05A4
            BNE   L0D0CC0
            BRL   L0D0EB8
L0D0CC0     BVS   L0D0CC5
            EOR   #$8000
L0D0CC5     BMI   L0D0CCA
            BRL   L0D0EB8
L0D0CCA     LDA   $DD
            AND   #$00FF
            SEC
            SBC   #$0080
            BVS   L0D0CD8
            EOR   #$8000
L0D0CD8     BPL   L0D0CDD
            BRL   L0D0E7A
L0D0CDD     LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $E0
            LDA   $DE
            JSL   L0D1573
            PLA
            PLX
            STA   $F8
            STX   $FA
            LDA   [$F8]
            AND   #$00FF
            AND   #$00FF
            SEC
            SBC   #$007F
            BNE   L0D0D04
            BRL   L0D0D6E
L0D0D04     BVS   L0D0D09
            EOR   #$8000
L0D0D09     BMI   L0D0D0E
            BRL   L0D0D6E
L0D0D0E     PEI   $E0
            PEI   $DE
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
            LDAL  L0E4CCC
            AND   #$00FF
            CMP   #$00C0
            BEQ   L0D0D2E
            BRA   L0D0D36
L0D0D2E     JSL   L0D100E
            BRA   L0D0D6C
            BRA   L0D0D3D
L0D0D36     CMP   #$00D4
            BEQ   L0D0D3D
            BRA   L0D0D6A
L0D0D3D     JSL   L0D11B2
            BRA   L0D0D6C
L0D0D43     PEA   ^L0E3ACC
            PEA   L0E3ACC
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0D0D5E
            INX
L0D0D5E     PHX
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRA   L0D0D6C
L0D0D6A     BRA   L0D0D43
L0D0D6C     BRA   L0D0D91
L0D0D6E     PEI   $E0
            PEI   $DE
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0D0D87
            INX
L0D0D87     PHX
            PHA
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
L0D0D91     LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDA   $DD
            AND   #$00FF
            LDX   #$0000
            PHX
            PHA
            LDX   $E0
            LDA   $DE
            JSL   L0D1573
            PLA
            PLX
            JSL   L0D1573
            PLA
            PLX
            STX   $E0
            STA   $DE
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0D0DCC
            INX
L0D0DCC     PHX
            PHA
            JSL   L0C04CD
            PLY
            PLY
            STA   L0F05A6
            LDA   L0F05A6
            LDX   #$0000
            PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            BCC   L0D0DF4
            INX
L0D0DF4     JSL   L0D1573
            PLA
            PLX
            STX   L0F059E
            STA   L0F059C
            JSL   L0A2920
            LDX   #$0000
            TAY
            BPL   L0D0E0B
            DEX
L0D0E0B     STX   $D7
            STA   $D5
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $D7
            LDA   $D5
            JSL   L0D157E
            BNE   L0D0E24
            BRL   L0D0E77
L0D0E24     PEA   $0001
            JSL   L0B1E73
            PLY
            PEA   $0001
            PEA   $0003
            PEA   ^L0E4A40
            PEA   L0E4A40
            PEA   $0002
            JSL   L0D00BF
            PLY
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L0D0E6F
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEI   $F6
            PEI   $F4
            _DisposeHandle
            STA   L0F0779
            LDA   #$000A
            STA   L0F0012
            LDX   $D7
            LDA   $D5
            BRL   L0D0F7D
L0D0E6F     PEA   $0000
            JSL   L0B1E73
            PLY
L0D0E77     BRL   L0D0C9F
L0D0E7A     LDA   $DD
            AND   #$00FF
            PHA
            JSL   L0D0F87
            PLY
            CMP   #$0000
            BEQ   L0D0EAC
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEI   $F6
            PEI   $F4
            _DisposeHandle
            STA   L0F0779
            LDX   $D7
            LDA   $D5
            BRL   L0D0F7D
L0D0EAC     INC   $DE
            BNE   L0D0EB2
            INC   $E0
L0D0EB2     BRL   L0D0C9F
            BRL   L0D0C9F
L0D0EB8     LDA   L0F05A4
            SEC
            SBC   $CD
            BVS   L0D0EC3
            EOR   #$8000
L0D0EC3     BMI   L0D0F0F
            LDA   $CD
            SEC
            SBC   L0F05A4
            AND   #$00FF
            PHA
            LDA   #$0080
            PLX
            STX   $F8
            ORA   $F8
            SEP   #$20
            STA   $DD
            REP   #$20
            LDA   $DD
            AND   #$00FF
            PHA
            JSL   L0D0F87
            PLY
            CMP   #$0000
            BEQ   L0D0F0F
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEI   $F6
            PEI   $F4
            _DisposeHandle
            STA   L0F0779
            LDX   $D7
            LDA   $D5
            BRL   L0D0F7D
L0D0F0F     LDA   $CD
            STA   L0F05A4
            JSL   L0A2C00
            LDX   #$0000
            TAY
            BPL   L0D0F1F
            DEX
L0D0F1F     STX   $D7
            STA   $D5
            LDA   $D5
            CMP   #$0000
            BNE   L0D0F33
            LDA   $D7
            CMP   #$0000
            BNE   L0D0F33
            BRA   L0D0F35
L0D0F33     BRA   L0D0F4B
L0D0F35     INC   $E4
L0D0F37     LDA   $E4
            SEC
            SBC   $E6
            BNE   L0D0F41
            BRL   L0D0B80
L0D0F41     BVS   L0D0F46
            EOR   #$8000
L0D0F46     BMI   L0D0F4B
            BRL   L0D0B80
L0D0F4B     PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEI   $F6
            PEI   $F4
            _DisposeHandle
            STA   L0F0779
            LDA   #$0001
            STA   L0F0006
            LDA   #$000A
            STA   L0F0012
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   #$0001
L0D0F7D     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0D0F87     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EE
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDX   $F8
            LDA   #$090E
            CLC
            ADC   $F6
            BCC   L0D0FA7
            INX
L0D0FA7     STX   L0F059E
            STA   L0F059C
            LDX   L0F059E
            LDA   L0F059C
            STA   $F6
            STX   $F8
            LDA   #$0000
            SEP   #$20
            STA   [$F6]
            REP   #$20
            STZ   L0F05A6
            STZ   $F4
            BRA   L0D0FF0
L0D0FC7     JSL   L0A2920
            LDX   #$0000
            TAY
            BPL   L0D0FD2
            DEX
L0D0FD2     STX   $F2
            STA   $F0
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $F2
            LDA   $F0
            JSL   L0D157E
            BEQ   L0D0FEE
            LDX   $F2
            LDA   $F0
            BRA   L0D1004
L0D0FEE     INC   $F4
L0D0FF0     LDA   $FF
            AND   #$00FF
            AND   #$001F
            SEC
            SBC   $F4
            BEQ   L0D1004
            BVS   L0D1002
            EOR   #$8000
L0D1002     BMI   L0D0FC7
L0D1004     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0D100E     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDAL  L0E4CCF
            AND   #$00FF
            SEC
            SBC   #$0040
            STA   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0D103B
            INX
L0D103B     PHX
            PHA
            PEI   $F6
            JSL   L0C0118
            PLY
            PLY
            PLY
            LDA   #$0001
            STA   $F4
            LDA   $F6
            SEC
            SBC   #$000A
            BVS   L0D1056
            EOR   #$8000
L0D1056     BPL   L0D105A
            INC   $F4
L0D105A     LDA   $F4
            INC   $F4
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D1075
            INC   $FA
L0D1075     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D107F
            INC   $FA
L0D107F     LDA   #$002F
            SEP   #$20
            STA   [$F8]
            REP   #$20
            LDAL  L0E4CD0
            AND   #$00FF
            CMP   #$0020
            BEQ   L0D10C3
            LDA   $F4
            INC   $F4
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D10AF
            INC   $FA
L0D10AF     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D10B9
            INC   $FA
L0D10B9     LDAL  L0E4CD0
            SEP   #$20
            STA   [$F8]
            REP   #$20
L0D10C3     LDA   $F4
            INC   $F4
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D10DE
            INC   $FA
L0D10DE     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D10E8
            INC   $FA
L0D10E8     LDAL  L0E4CD1
            SEP   #$20
            STA   [$F8]
            REP   #$20
            LDA   $F4
            INC   $F4
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D110D
            INC   $FA
L0D110D     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D1117
            INC   $FA
L0D1117     LDA   #$002F
            SEP   #$20
            STA   [$F8]
            REP   #$20
            LDA   $F4
            INC   $F4
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D113B
            INC   $FA
L0D113B     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D1145
            INC   $FA
L0D1145     LDAL  L0E4CCD
            SEP   #$20
            STA   [$F8]
            REP   #$20
            LDA   $F4
            INC   $F4
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D116A
            INC   $FA
L0D116A     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D1174
            INC   $FA
L0D1174     LDAL  L0E4CCE
            SEP   #$20
            STA   [$F8]
            REP   #$20
            LDA   $F4
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D1197
            INC   $FA
L0D1197     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D11A1
            INC   $FA
L0D11A1     LDA   #$0000
            SEP   #$20
            STA   [$F8]
            REP   #$20
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0D11B2     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDAL  L0E4CCD
            AND   #$00FF
            SEC
            SBC   #$0041
            STA   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0D11DF
            INX
L0D11DF     PHX
            PHA
            PEI   $F6
            JSL   L0C0118
            PLY
            PLY
            PLY
            LDA   #$0001
            STA   $F4
            LDA   $F6
            SEC
            SBC   #$0009
            BEQ   L0D1200
            BVS   L0D11FC
            EOR   #$8000
L0D11FC     BPL   L0D1200
            INC   $F4
L0D1200     LDA   $F4
            INC   $F4
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D121B
            INC   $FA
L0D121B     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D1225
            INC   $FA
L0D1225     LDA   #$003A
            SEP   #$20
            STA   [$F8]
            REP   #$20
            LDA   $F4
            INC   $F4
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D1249
            INC   $FA
L0D1249     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D1253
            INC   $FA
L0D1253     LDAL  L0E4CCE
            SEP   #$20
            STA   [$F8]
            REP   #$20
            LDA   $F4
            INC   $F4
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D1278
            INC   $FA
L0D1278     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D1282
            INC   $FA
L0D1282     LDAL  L0E4CCF
            SEP   #$20
            STA   [$F8]
            REP   #$20
            LDA   $F4
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D12A5
            INC   $FA
L0D12A5     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0D12AF
            INC   $FA
L0D12AF     LDA   #$0000
            SEP   #$20
            STA   [$F8]
            REP   #$20
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0D12C0     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PHA
            _MMStartUp
            STA   L0F07C7
            PLA
            STA   $F6
            LDA   $F6
            TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0D12E5     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E6
            TCS
            PHA
            PHA
            PEI   $F7
            PEI   $F5
            PEI   $F9
            PEI   $FB
            PEI   $FF
            PEI   $FD
            _NewHandle
            STA   L0F07C7
            PLA
            STA   $E8
            PLA
            STA   $EA
            LDX   $EA
            LDA   $E8
            TAY
            TDC
            CLC
            ADC   #$00EF
            TCS
            TYA
            PLD
            RTL

L0D131C     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            PEI   $FF
            PEI   $FD
            _WriteCString
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0D133A     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00E8
            TCS
            LDX   $FB
            LDA   $F9
            STA   $EA
            STX   $EC
L0D134D     LDA   $F7
            CMP   #$0001
            BEQ   L0D137A
            BCC   L0D137A
            LDA   [$FD]
            PHA
            PLA
            STA   [$F9]
            LDA   $F9
            CLC
            ADC   #$0002
            STA   $F9
            BCC   L0D1368
            INC   $FB
L0D1368     LDA   $FD
            CLC
            ADC   #$0002
            STA   $FD
            BCC   L0D1374
            INC   $FF
L0D1374     DEC   $F7
            DEC   $F7
            BRA   L0D134D
L0D137A     LDA   $F7
            BEQ   L0D1386
            SEP   #$20
            LDA   [$FD]
            STA   [$F9]
            REP   #$20
L0D1386     LDX   $EC
            LDA   $EA
            STA   $FD
            STX   $FF
            TDC
            CLC
            ADC   #$00F1
            TCS
            PLD
            RTL

L0D1396     ENT
            SEP   #$10
            PHX
            REP   #$10
            DEC
            PHA
            RTL

L0D139E     ENT
            TSC
            CLC
            ADC   #$0004
            PEA   $0000
            PHA
            ADC   #$000A
            PEA   $0000
            PHA
            PEA   $0000
            _SANEFP816
            LDA   $02,S
            STA   $0C,S
            LDA   $00,S
            STA   $0A,S
            PLY
            PLY
            PLY
            PLY
            PLY
            RTL

L0D13C6     ENT
            TSC
            CLC
            ADC   #$0004
            PEA   $0000
            PHA
            ADC   #$000A
            PEA   $0000
            PHA
            PEA   $0008
            _SANEFP816
            PHP
            PHP
            PLA
            STA   L0F0825
            LDA   $02,S
            STA   $16,S
            LDA   $00,S
            STA   $14,S
            TSC
            CLC
            ADC   #$0014
            TCS
            LDA   L0F0825
            PHA
            PLP
            PLP
            SEC
            BVC   L0D13FE
            CLC
L0D13FE     BPL   L0D1401
            SEC
L0D1401     RTL

L0D1402     ENT
            TSC
            CLC
            ADC   #$0004
            PEA   $0000
            PHA
            ADC   #$000A
            PEA   $0000
            PHA
            PEA   $0006
            _SANEFP816
            LDA   $02,S
            STA   $0C,S
            LDA   $00,S
            STA   $0A,S
            PLY
            PLY
            PLY
            PLY
            PLY
            RTL

L0D142A     ENT
            TSC
            CLC
            ADC   #$0004
            PEA   $0000
            PHA
            ADC   #$000A
            PEA   $0000
            PHA
            PEA   $0004
            _SANEFP816
            LDA   $02,S
            STA   $0C,S
            LDA   $00,S
            STA   $0A,S
            PLY
            PLY
            PLY
            PLY
            PLY
            RTL

L0D1452     ENT
            LDA   $04,S
            STA   L0F0825
            LDA   $06,S
            STA   L0F0827
            LDA   $08,S
            STA   L0F0829
            LDA   $0A,S
            STA   L0F082B
            TSC
            SEC
            SBC   #$0002
            TCS
            LDA   $02,S
            STA   $00,S
            LDA   $04,S
            STA   $02,S
            PEA   ^L0F0825
            PEA   L0F0825
            TSC
            CLC
            ADC   #$0008
            PEA   $0000
            PHA
            PEA   $010E
            _SANEFP816
            RTL

L0D148E     ENT
            TSC
            CLC
            ADC   #$0004
            PEA   $0000
            PHA
            ADC   #$000A
            PEA   $0000
            PHA
            PEA   $0002
            _SANEFP816
            LDA   $02,S
            STA   $0C,S
            LDA   $00,S
            STA   $0A,S
            PLY
            PLY
            PLY
            PLY
            PLY
            RTL

L0D14B6     ENT
            PHD
            PHA
            PEA   $0001
            TSC
            TCD
            LDX   #$0000
            BCC   L0D14DE
            LDA   $03
            BIT   #$8000
            BEQ   L0D14D0
            EOR   #$FFFF
            INC
            STA   $03
            INX
L0D14D0     LDA   $0A
            BIT   #$8000
            BEQ   L0D14DE
            EOR   #$FFFF
            INC
            STA   $0A
            DEX
L0D14DE     LDY   #$0000
            BRA   L0D14E5
L0D14E3     ASL   $01
L0D14E5     ASL   $03
            BCC   L0D14E3
            ROR   $03
L0D14EB     LDA   $0A
            CMP   $03
            BCC   L0D14FC
            LDA   $0A
            SEC
            SBC   $03
            STA   $0A
            TYA
            ORA   $01
            TAY
L0D14FC     LSR   $03
            LSR   $01
            BCC   L0D14EB
            TYA
            CPX   #$0000
            BEQ   L0D150C
            EOR   #$FFFF
            INC
L0D150C     PLY
            PLY
            PLD
            RTL

L0D1510     ENT
            CMP   #$0000
            BEQ   L0D151E
            TAX
            LDA   $04,S
L0D1518     ASL
            DEX
            BNE   L0D1518
            STA   $04,S
L0D151E     RTL

L0D151F     ENT
            PHD
            PHA
            TSC
            TCD
            LDX   #$0000
            BCC   L0D1544
            LDA   $01
            BIT   #$8000
            BEQ   L0D1536
            EOR   #$FFFF
            INC
            STA   $01
            INX
L0D1536     LDA   $08
            BIT   #$8000
            BEQ   L0D1544
            EOR   #$FFFF
            INC
            STA   $08
            DEX
L0D1544     LDA   #$0000
            BRA   L0D1552
L0D1549     LSR   $08
            BCC   L0D1550
            CLC
            ADC   $01
L0D1550     ASL   $01
L0D1552     LDY   $08
            BNE   L0D1549
            CPX   #$0000
            BEQ   L0D155F
            EOR   #$FFFF
            INC
L0D155F     STA   $08
            PLY
            PLD
            RTL

L0D1564     ENT
            CMP   #$0000
            BEQ   L0D1572
            TAX
            LDA   $04,S
L0D156C     LSR
            DEX
            BNE   L0D156C
            STA   $04,S
L0D1572     RTL

L0D1573     ENT
            CLC
            ADC   $04,S
            STA   $04,S
            TXA
            ADC   $06,S
            STA   $06,S
            RTL

L0D157E     ENT
            PHX
            PHA
            LDA   $08,S
            TAX
            LDA   $0A,S
            TAY
            SEP   #$20
            LDA   $07,S
            STA   $0B,S
            LDA   $06,S
            STA   $0A,S
            LDA   $05,S
            STA   $09,S
            REP   #$20
            TXA
            SEC
            SBC   $01,S
            STA   $01,S
            TYA
            SBC   $03,S
            STA   $03,S
            PHP
            BNE   L0D15B0
            LDA   $02,S
            BEQ   L0D15B0
            SEP   #$20
            LDA   #$FD
            AND   $01,S
            STA   $01,S
L0D15B0     SEP   #$20
            LDA   $01,S
            STA   $09,S
            REP   #$20
            LDA   $04,S
            PLY
            PLY
            PLY
            PLY
            PLP
            RTL

L0D15C0     ENT
            PHD
            PHX
            PHA
            PEA   $0000
            PEA   $0001
            PEA   $0000
            PEA   $0000
            TSC
            TCD
            LDX   #$0000
            BCC   L0D1608
            LDA   $0B
            BIT   #$8000
            BEQ   L0D15EF
            EOR   #$FFFF
            STA   $0B
            LDA   $09
            EOR   #$FFFF
            INC
            BNE   L0D15EC
            INC   $0B
L0D15EC     STA   $09
            INX
L0D15EF     LDA   $14
            BIT   #$8000
            BEQ   L0D1608
            EOR   #$FFFF
            STA   $14
            LDA   $12
            EOR   #$FFFF
            INC
            BNE   L0D1605
            INC   $14
L0D1605     STA   $12
            DEX
L0D1608     BRA   L0D160E
L0D160A     ASL   $05
            ROL   $07
L0D160E     ASL   $09
            ROL   $0B
            BCC   L0D160A
            ROR   $0B
            ROR   $09
L0D1618     LDA   $14
            CMP   $0B
            BEQ   L0D1622
            BCC   L0D1641
            BRA   L0D1628
L0D1622     LDA   $12
            CMP   $09
            BCC   L0D1641
L0D1628     LDA   $12
            SEC
            SBC   $09
            STA   $12
            LDA   $14
            SBC   $0B
            STA   $14
            LDA   $01
            ORA   $05
            STA   $01
            LDA   $03
            ORA   $07
            STA   $03
L0D1641     LSR   $0B
            ROR   $09
            LSR   $07
            ROR   $05
            BCC   L0D1618
            CPX   #$0000
            BEQ   L0D1663
            LDA   $01
            EOR   #$FFFF
            STA   $01
            LDA   $03
            EOR   #$FFFF
            INC   $01
            BNE   L0D1661
            INC
L0D1661     STA   $03
L0D1663     LDA   $01
            LDX   $03
            PLY
            PLY
            PLY
            PLY
            PLY
            PLY
            PLD
            RTL

L0D166F     ENT
            PHD
            PHX
            PHA
            PEA   $0000
            PEA   $0000
            TSC
            TCD
            LDX   #$0000
            BCC   L0D16B1
            LDA   $07
            BIT   #$8000
            BEQ   L0D1698
            EOR   #$FFFF
            STA   $07
            LDA   $05
            EOR   #$FFFF
            INC
            BNE   L0D1695
            INC   $07
L0D1695     STA   $05
            INX
L0D1698     LDA   $10
            BIT   #$8000
            BEQ   L0D16B1
            EOR   #$FFFF
            STA   $10
            LDA   $0E
            EOR   #$FFFF
            INC
            BNE   L0D16AE
            INC   $10
L0D16AE     STA   $0E
            DEX
L0D16B1     BRA   L0D16CA
L0D16B3     LSR   $10
            ROR   $0E
            BCC   L0D16C6
            LDA   $01
            CLC
            ADC   $05
            STA   $01
            LDA   $03
            ADC   $07
            STA   $03
L0D16C6     ASL   $05
            ROL   $07
L0D16CA     LDA   $0E
            ORA   $10
            BNE   L0D16B3
            CPX   #$0000
            BEQ   L0D16E8
            LDA   $01
            EOR   #$FFFF
            STA   $01
            LDA   $03
            EOR   #$FFFF
            INC   $01
            BNE   L0D16E6
            INC
L0D16E6     STA   $03
L0D16E8     LDA   $01
            STA   $0E
            LDA   $03
            STA   $10
            PLY
            PLY
            PLY
            PLY
            PLD
            RTL

L0D16F6     ENT
            PHA
            TXA
            EOR   #$FFFF
            TAX
            PLA
            EOR   #$FFFF
            INC
            BNE   L0D1704
            INX
L0D1704     RTL

L0D1705     ENT
            SEC
            SBC   $04,S
            STA   $04,S
            TXA
            SBC   $06,S
            STA   $06,S
            RTL

L0D1710     ENT
            TSC
            CLC
            ADC   #$0008
            PEA   $0000
            PHA
            LDA   $0A,S
            PHA
            LDA   $0A,S
            PHA
            PEA   $0110
            _SANEFP816
            LDA   $02,S
            STA   $06,S
            LDA   $00,S
            STA   $04,S
            PLY
            PLY
            RTL

L0D1734     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$0060
            TCS
            STZ   $EE
            STZ   $EC
            STZ   $E0
            STZ   $E2
            STZ   $DC
            STZ   $DE
            LDX   #$0000
            LDA   #$0008
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L0D1573
            PLA
            PLX
            STA   $FD
            STX   $FF
            PEI   $FF
            PEI   $FD
            JSL   L0C04CD
            PLY
            PLY
            STA   $F0
            LDX   $FF
            LDA   $FD
            STA   $E8
            STX   $EA
            STA   $E4
            STX   $E6
            STZ   $F2
            BRL   L0D19B0
L0D177E     LDA   [$E8]
            AND   #$00FF
            CMP   #$0020
            BEQ   L0D17B0
            LDA   [$E8]
            AND   #$00FF
            CMP   #$0009
            BEQ   L0D17B0
            LDA   [$E8]
            AND   #$00FF
            CMP   #$000D
            BEQ   L0D17B0
            LDA   [$E8]
            AND   #$00FF
            CMP   #$000A
            BEQ   L0D17B0
            LDA   [$E8]
            AND   #$00FF
            CMP   #$000C
            BNE   L0D17ED
L0D17B0     LDA   $EC
            BNE   L0D17D3
            LDA   $EE
            BEQ   L0D17BA
            STZ   $EE
L0D17BA     LDX   $E6
            LDA   $E4
            INC   $E4
            BNE   L0D17C4
            INC   $E6
L0D17C4     STA   $F4
            STX   $F6
            LDA   #$0000
            SEP   #$20
            STA   [$F4]
            REP   #$20
            BRA   L0D17EA
L0D17D3     LDX   $E6
            LDA   $E4
            INC   $E4
            BNE   L0D17DD
            INC   $E6
L0D17DD     STA   $F4
            STX   $F6
            LDA   #$0020
            SEP   #$20
            STA   [$F4]
            REP   #$20
L0D17EA     BRL   L0D19A2
L0D17ED     LDA   [$E8]
            AND   #$00FF
            CMP   #$0022
            BNE   L0D1858
            LDA   $EC
            CMP   #$0001
            BNE   L0D1802
            STZ   $EC
            BRA   L0D1855
L0D1802     LDA   $EE
            BNE   L0D183E
            LDA   $EC
            BNE   L0D183E
            LDA   #$0001
            STA   $EC
            LDA   L01014D
            PHA
            INC
            STA   L01014D
            PLA
            ASL
            ASL
            PHA
            STZ   $F6
            TDC
            CLC
            ADC   #$0062
            STA   $F4
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0D182E
            INC   $F6
L0D182E     LDX   $E6
            LDA   $E4
            STA   [$F4]
            LDY   #$0002
            PHA
            TXA
            STA   [$F4],Y
            PLA
            BRA   L0D1855
L0D183E     LDX   $E6
            LDA   $E4
            INC   $E4
            BNE   L0D1848
            INC   $E6
L0D1848     STA   $F4
            STX   $F6
            LDA   #$0022
            SEP   #$20
            STA   [$F4]
            REP   #$20
L0D1855     BRL   L0D19A2
L0D1858     LDA   [$E8]
            AND   #$00FF
            CMP   #$0027
            BNE   L0D18C3
            LDA   $EC
            CMP   #$0002
            BNE   L0D186D
            STZ   $EC
            BRA   L0D18C0
L0D186D     LDA   $EE
            BNE   L0D18A9
            LDA   $EC
            BNE   L0D18A9
            LDA   #$0002
            STA   $EC
            LDA   L01014D
            PHA
            INC
            STA   L01014D
            PLA
            ASL
            ASL
            PHA
            STZ   $F6
            TDC
            CLC
            ADC   #$0062
            STA   $F4
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0D1899
            INC   $F6
L0D1899     LDX   $E6
            LDA   $E4
            STA   [$F4]
            LDY   #$0002
            PHA
            TXA
            STA   [$F4],Y
            PLA
            BRA   L0D18C0
L0D18A9     LDX   $E6
            LDA   $E4
            INC   $E4
            BNE   L0D18B3
            INC   $E6
L0D18B3     STA   $F4
            STX   $F6
            LDA   #$0027
            SEP   #$20
            STA   [$F4]
            REP   #$20
L0D18C0     BRL   L0D19A2
L0D18C3     LDA   $EE
            BEQ   L0D18CA
            BRL   L0D1987
L0D18CA     LDA   $EC
            BEQ   L0D18D1
            BRL   L0D1987
L0D18D1     LDA   #$0001
            STA   $EE
            LDA   [$E8]
            AND   #$00FF
            CMP   #$003C
            BNE   L0D18F9
            LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L0D1573
            PLA
            PLX
            STA   $E0
            STX   $E2
            BRL   L0D1987
L0D18F9     LDA   [$E8]
            AND   #$00FF
            CMP   #$003E
            BNE   L0D195A
            LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L0D1573
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            CMP   #$003E
            BNE   L0D1940
            LDX   #$0000
            LDA   #$0002
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L0D1573
            PLA
            PLX
            STA   $DC
            STX   $DE
            LDA   #$0001
            STA   $DA
            BRA   L0D1958
L0D1940     LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L0D1573
            PLA
            PLX
            STA   $DC
            STX   $DE
            STZ   $DA
L0D1958     BRA   L0D1987
L0D195A     LDA   L01014D
            PHA
            INC
            STA   L01014D
            PLA
            ASL
            ASL
            PHA
            STZ   $F6
            TDC
            CLC
            ADC   #$0062
            STA   $F4
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0D1979
            INC   $F6
L0D1979     LDX   $E6
            LDA   $E4
            STA   [$F4]
            LDY   #$0002
            PHA
            TXA
            STA   [$F4],Y
            PLA
L0D1987     LDA   [$E8]
            AND   #$00FF
            PHA
            LDX   $E6
            LDA   $E4
            INC   $E4
            BNE   L0D1997
            INC   $E6
L0D1997     STA   $F4
            STX   $F6
            PLA
            SEP   #$20
            STA   [$F4]
            REP   #$20
L0D19A2     LDX   $EA
            LDA   $E8
            INC   $E8
            BNE   L0D19AC
            INC   $EA
L0D19AC     LDA   $F2
            INC   $F2
L0D19B0     LDA   $F2
            SEC
            SBC   $F0
            BVS   L0D19BA
            EOR   #$8000
L0D19BA     BMI   L0D19BF
            BRL   L0D177E
L0D19BF     LDA   #$0000
            SEP   #$20
            STA   [$E4]
            REP   #$20
            LDX   $E2
            LDA   $E0
            STX   $F4
            ORA   $F4
            BEQ   L0D1A12
            LDA   #L0F05DF
            LDX   #^L0F05DF
            STA   $F4
            STX   $F6
            LDA   #$0001
            LDY   #$000A
            STA   [$F4],Y
            LDA   #L0F05DF
            LDX   #^L0F05DF
            STA   $F4
            STX   $F6
            LDA   #$0200
            LDY   #$0012
            STA   [$F4],Y
            PEA   ^L0F05DF
            PEA   L0F05DF
            PEA   ^L0F05D5
            PEA   L0F05D5
            PEI   $E2
            PEI   $E0
            JSL   L0D1B63
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L0D1A12     LDX   $DE
            LDA   $DC
            STX   $F4
            ORA   $F4
            BNE   L0D1A1F
            BRL   L0D1A5B
L0D1A1F     LDA   #L0F05F3
            LDX   #^L0F05F3
            STA   $F4
            STX   $F6
            LDA   #$0002
            LDY   #$000A
            STA   [$F4],Y
            PEA   ^L0F05F3
            PEA   L0F05F3
            LDA   $DA
            BEQ   L0D1A43
            LDA   #L0F05D7
            LDX   #^L0F05D7
            BRA   L0D1A49
L0D1A43     LDA   #L0F05D9
            LDX   #^L0F05D9
L0D1A49     PHX
            PHA
            PEI   $DE
            PEI   $DC
            JSL   L0D1B63
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L0D1A5B     LDA   L01014D
            CLC
            ADC   #$0001
            PHA
            LDA   #$0004
            SEC
            JSL   L0D151F
            PLA
            LDX   #$0000
            CMP   #$0000
            BPL   L0D1A75
            DEX
L0D1A75     PHX
            PHA
            JSL   L0D1B13
            PLY
            PLY
            STA   L01014F
            STX   L010151
            STZ   $F2
            BRA   L0D1AD0
L0D1A87     LDA   $F2
            ASL
            ASL
            PHA
            STZ   $F6
            TDC
            CLC
            ADC   #$0062
            STA   $F4
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0D1A9F
            INC   $F6
L0D1A9F     LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            PHX
            PHA
            LDA   $F2
            ASL
            ASL
            PHA
            LDX   L010151
            LDA   L01014F
            STA   $F4
            STX   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0D1AC2
            INC   $F6
L0D1AC2     PLA
            PLX
            STA   [$F4]
            LDY   #$0002
            PHA
            TXA
            STA   [$F4],Y
            PLA
            INC   $F2
L0D1AD0     LDA   $F2
            SEC
            SBC   L01014D
            BVS   L0D1ADB
            EOR   #$8000
L0D1ADB     BPL   L0D1A87
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDA   L01014D
            ASL
            ASL
            PHA
            LDX   L010151
            LDA   L01014F
            STA   $F4
            STX   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0D1AFF
            INC   $F6
L0D1AFF     PLA
            PLX
            STA   [$F4]
            LDY   #$0002
            PHA
            TXA
            STA   [$F4],Y
            PLA
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0D1B13     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            PEA   $0000
            PEA   $0000
            PEA   $4000
            LDA   L0F07C9
            PHA
            PEI   $FF
            PEI   $FD
            JSL   L0D12E5
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STA   $F0
            STX   $F2
            LDX   $F2
            LDA   $F0
            STX   $F4
            ORA   $F4
            BNE   L0D1B51
            LDX   #$0000
            LDA   #$0000
            BRA   L0D1B59
L0D1B51     LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
L0D1B59     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0D1B63     PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00EA
            TCS
            LDX   $FF
            LDA   $FD
            STA   L0F05DB
            STX   L0F05DD
            PEI   $FF
            PEI   $FD
            JSL   L0D25CB
            PLY
            PLY
            PEI   $FB
            PEI   $F9
            PEI   $F7
            PEI   $F5
            JSL   L0D2AF2
            PLY
            PLY
            PLY
            PLY
            TAY
            TDC
            CLC
            ADC   #$00EF
            TCS
            TYA
            PLD
            RTL

L0D1B9C     ENT
            PHD
            TSC
            TCD
            STA   [$06]
            LDA   $01,S
            LDY   #$0002
            STA   [$06],Y
            LDA   $02,S
            INY
            INY
            STA   [$06],Y
            LDA   $04,S
            INY
            INY
            STA   [$06],Y
            PLD
            LDA   #$0000
            RTL

L0D1BB9     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            PEA   $0000
            TDC
            CLC
            ADC   #$00FF
            PHA
            PEI   $FD
            PEI   $FB
            JSL   L0D2189
            PLY
            PLY
            PLY
            PLY
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0D1BE1     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            LDX   $FD
            LDA   $FB
            STA   L0F07AD
            STX   L0F07AF
            STZ   L0F07B1
            PEA   $0000
            TDC
            CLC
            ADC   #$00FF
            PHA
            JSL   L0D1D1C
            PLY
            PLY
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0D1C10     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EA
            TCS
            LDX   $FB
            LDA   $F9
            STA   $EC
            STX   $EE
L0D1C23     LDX   $FB
            LDA   $F9
            INC   $F9
            BNE   L0D1C2D
            INC   $FB
L0D1C2D     STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            BNE   L0D1C23
            LDA   $F9
            BNE   L0D1C3E
            DEC   $FB
L0D1C3E     DEC   $F9
L0D1C40     LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L0D1C4A
            INC   $FF
L0D1C4A     STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            PHA
            LDX   $FB
            LDA   $F9
            INC   $F9
            BNE   L0D1C5E
            INC   $FB
L0D1C5E     STA   $F0
            STX   $F2
            PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            AND   #$00FF
            BEQ   L0D1C70
            BRA   L0D1C40
L0D1C70     LDX   $EE
            LDA   $EC
            TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0D1C7E     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EE
            TCS
            BRA   L0D1C97
L0D1C8B     INC   $F9
            BNE   L0D1C91
            INC   $FB
L0D1C91     INC   $FD
            BNE   L0D1C97
            INC   $FF
L0D1C97     LDA   [$F9]
            AND   #$00FF
            BEQ   L0D1CB0
            LDA   [$F9]
            AND   #$00FF
            PHA
            LDA   [$FD]
            AND   #$00FF
            PLX
            STX   $F0
            CMP   $F0
            BEQ   L0D1C8B
L0D1CB0     LDA   [$FD]
            AND   #$00FF
            PHA
            LDA   [$F9]
            AND   #$00FF
            PLX
            STX   $F0
            SEC
            SBC   $F0
            TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0D1CCB     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EA
            TCS
            LDX   $FB
            LDA   $F9
            STA   $EC
            STX   $EE
L0D1CDE     LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L0D1CE8
            INC   $FF
L0D1CE8     STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            PHA
            LDX   $FB
            LDA   $F9
            INC   $F9
            BNE   L0D1CFC
            INC   $FB
L0D1CFC     STA   $F0
            STX   $F2
            PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            AND   #$00FF
            BEQ   L0D1D0E
            BRA   L0D1CDE
L0D1D0E     LDX   $EE
            LDA   $EC
            TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0D1D1C     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00CC
            TCS
            STZ   $F2
            STZ   L0F07B3
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            CLC
            ADC   #$0004
            STA   $FD
            LDA   $FF
            BCC   L0D1D3D
            INC
L0D1D3D     STA   $FF
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STA   $EE
            STX   $F0
L0D1D51     LDA   [$EE]
            AND   #$00FF
            BNE   L0D1D5B
            BRL   L0D217D
L0D1D5B     LDX   $F0
            LDA   $EE
            INC   $EE
            BNE   L0D1D65
            INC   $F0
L0D1D65     STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            STA   $E4
            LDA   $E4
            CMP   #$0020
            BEQ   L0D1D85
            LDA   $E4
            CMP   #$0009
            BEQ   L0D1D85
            LDA   $E4
            CMP   #$000A
            BNE   L0D1DB7
L0D1D85     JSL   L0D34F3
            STA   $E2
            LDA   $E2
            CMP   #$FFFF
            BEQ   L0D1DB5
            LDA   L0F07B1
            BEQ   L0D1DAA
            LDX   L0F07AB
            LDA   L0F07A9
            PHX
            PHA
            PEI   $E2
            JSL   L0D36AD
            PLY
            PLY
            PLY
            BRA   L0D1DB5
L0D1DAA     LDA   L0F07AD
            BNE   L0D1DB2
            DEC   L0F07AF
L0D1DB2     DEC   L0F07AD
L0D1DB5     BRA   L0D1D51
L0D1DB7     LDA   $E4
            CMP   #$0025
            BNE   L0D1DC1
            BRL   L0D1E05
L0D1DC1     JSL   L0D34F3
            STA   $E2
            LDA   $E2
            CMP   #$FFFF
            BNE   L0D1DD4
            LDA   #$FFFF
            BRL   L0D217F
L0D1DD4     LDA   $E2
            CMP   $E4
            BEQ   L0D1E02
            LDA   L0F07B1
            BEQ   L0D1DF2
            LDX   L0F07AB
            LDA   L0F07A9
            PHX
            PHA
            PEI   $E2
            JSL   L0D36AD
            PLY
            PLY
            PLY
            BRA   L0D1DFD
L0D1DF2     LDA   L0F07AD
            BNE   L0D1DFA
            DEC   L0F07AF
L0D1DFA     DEC   L0F07AD
L0D1DFD     LDA   $F2
            BRL   L0D217F
L0D1E02     BRL   L0D217A
L0D1E05     LDA   #$0000
            STA   $DE
            STA   $DC
            LDA   #$0100
            STA   $DA
            LDA   [$EE]
            AND   #$00FF
            CMP   #$002A
            BNE   L0D1E26
            LDA   #$0001
            STA   $DE
            INC   $EE
            BNE   L0D1E26
            INC   $F0
L0D1E26     LDA   [$EE]
            AND   #$00FF
            SEC
            SBC   #$0030
            BVS   L0D1E34
            EOR   #$8000
L0D1E34     BPL   L0D1E69
            LDA   [$EE]
            AND   #$00FF
            SEC
            SBC   #$0039
            BEQ   L0D1E48
            BVS   L0D1E46
            EOR   #$8000
L0D1E46     BMI   L0D1E69
L0D1E48     LDX   $F0
            LDA   $EE
            STA   $E6
            STX   $E8
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            JSL   L0D39B8
            PLY
            PLY
            STA   $DA
            LDX   $E8
            LDA   $E6
            STA   $EE
            STX   $F0
L0D1E69     LDA   [$EE]
            AND   #$00FF
            CMP   #$006C
            BNE   L0D1E7E
            LDA   #$0001
            STA   $DC
            INC   $EE
            BNE   L0D1E7E
            INC   $F0
L0D1E7E     LDX   $F0
            LDA   $EE
            INC   $EE
            BNE   L0D1E88
            INC   $F0
L0D1E88     STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            STA   $E0
            LDA   $E0
            CMP   #$0063
            BNE   L0D1EE3
            JSL   L0D30A1
            STA   $E2
            CMP   #$FFFF
            BNE   L0D1EAB
            LDA   #$FFFF
            BRL   L0D217F
L0D1EAB     LDA   $DE
            BNE   L0D1EDE
            LDA   $E2
            PHA
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            CLC
            ADC   #$0004
            STA   $FD
            LDA   $FF
            BCC   L0D1EC3
            INC
L0D1EC3     STA   $FF
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STA   $F4
            STX   $F6
            PLA
            SEP   #$20
            STA   [$F4]
            REP   #$20
L0D1EDE     INC   $F2
            BRL   L0D217A
L0D1EE3     LDA   $E0
            CMP   #$0064
            BEQ   L0D1F02
            LDA   $E0
            CMP   #$006F
            BEQ   L0D1F02
            LDA   $E0
            CMP   #$0078
            BEQ   L0D1F02
            LDA   $E0
            CMP   #$0068
            BEQ   L0D1F02
            BRL   L0D1FD6
L0D1F02     JSL   L0D34F3
            STA   $E2
            CMP   #$FFFF
            BNE   L0D1F13
            LDA   #$FFFF
            BRL   L0D217F
L0D1F13     PEI   $DA
            PEI   $E2
            PEI   $E0
            JSL   L0D3525
            PLY
            PLY
            PLY
            STA   $CE
            STX   $D0
            LDA   L0F07B3
            BEQ   L0D1F2E
            LDA   $F2
            BRL   L0D217F
L0D1F2E     LDA   $DE
            BEQ   L0D1F35
            BRL   L0D1FD1
L0D1F35     LDA   $DC
            BEQ   L0D1F6E
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            CLC
            ADC   #$0004
            STA   $FD
            LDA   $FF
            BCC   L0D1F4A
            INC
L0D1F4A     STA   $FF
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STA   $F4
            STX   $F6
            LDX   $D0
            LDA   $CE
            STA   [$F4]
            LDY   #$0002
            PHA
            TXA
            STA   [$F4],Y
            PLA
            BRA   L0D1FD1
L0D1F6E     LDA   $E0
            CMP   #$0068
            BNE   L0D1FA4
            LDX   $D0
            LDA   $CE
            PHA
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            CLC
            ADC   #$0004
            STA   $FD
            LDA   $FF
            BCC   L0D1F8B
            INC
L0D1F8B     STA   $FF
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STA   $F4
            STX   $F6
            PLA
            STA   [$F4]
            BRA   L0D1FD1
L0D1FA4     LDX   $D0
            LDA   $CE
            PHA
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            CLC
            ADC   #$0004
            STA   $FD
            LDA   $FF
            BCC   L0D1FBA
            INC
L0D1FBA     STA   $FF
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STA   $F4
            STX   $F6
            PLA
            STA   [$F4]
L0D1FD1     INC   $F2
            BRL   L0D217A
L0D1FD6     LDA   $E0
            CMP   #$0065
            BEQ   L0D1FE7
            LDA   $E0
            CMP   #$0066
            BEQ   L0D1FE7
            BRL   L0D20B0
L0D1FE7     JSL   L0D34F3
            STA   $E2
            CMP   #$FFFF
            BNE   L0D1FF8
            LDA   #$FFFF
            BRL   L0D217F
L0D1FF8     PEI   $DA
            PEI   $E2
            JSL   L0D3261
            PLY
            PLY
            JSL   L0D38FB
            PEA   $0000
            TDC
            CLC
            ADC   #$00D2
            PHA
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
            LDA   L0F07B3
            BEQ   L0D2022
            LDA   $F2
            BRL   L0D217F
L0D2022     LDA   $DE
            BEQ   L0D2029
            BRL   L0D20AB
L0D2029     LDA   $DC
            BEQ   L0D206D
            PEI   $D8
            PEI   $D6
            PEI   $D4
            PEI   $D2
            JSL   L0D1452
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            CLC
            ADC   #$0004
            STA   $FD
            LDA   $FF
            BCC   L0D204A
            INC
L0D204A     STA   $FF
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STA   $F4
            STX   $F6
            PEI   $F6
            PEI   $F4
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
            BRA   L0D20AB
L0D206D     PEI   $D8
            PEI   $D6
            PEI   $D4
            PEI   $D2
            JSL   L0D1452
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            CLC
            ADC   #$0004
            STA   $FD
            LDA   $FF
            BCC   L0D208A
            INC
L0D208A     STA   $FF
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STA   $F4
            STX   $F6
            PEI   $F6
            PEI   $F4
            JSL   L0D3920
            PLY
            PLY
            PLY
            PLY
            PLY
L0D20AB     INC   $F2
            BRL   L0D217A
L0D20B0     LDA   $E0
            CMP   #$0073
            BEQ   L0D20BA
            BRL   L0D217A
L0D20BA     JSL   L0D34F3
            STA   $E2
            CMP   #$FFFF
            BNE   L0D20CB
            LDA   #$FFFF
            BRL   L0D217F
L0D20CB     LDA   $DE
            BNE   L0D20F4
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            CLC
            ADC   #$0004
            STA   $FD
            LDA   $FF
            BCC   L0D20E0
            INC
L0D20E0     STA   $FF
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STA   $EA
            STX   $EC
L0D20F4     LDA   $DA
            BEQ   L0D213E
            LDA   $E2
            CMP   #$0020
            BEQ   L0D213E
            LDA   $E2
            CMP   #$0009
            BEQ   L0D213E
            LDA   $E2
            CMP   #$000A
            BEQ   L0D213E
            LDA   $DE
            BNE   L0D2129
            LDA   $E2
            PHA
            LDX   $EC
            LDA   $EA
            INC   $EA
            BNE   L0D211E
            INC   $EC
L0D211E     STA   $F4
            STX   $F6
            PLA
            SEP   #$20
            STA   [$F4]
            REP   #$20
L0D2129     JSL   L0D30A1
            STA   $E2
            CMP   #$FFFF
            BNE   L0D213A
            LDA   #$FFFF
            BRL   L0D217F
L0D213A     DEC   $DA
            BRA   L0D20F4
L0D213E     LDX   $EC
            LDA   $EA
            INC   $EA
            BNE   L0D2148
            INC   $EC
L0D2148     STA   $F4
            STX   $F6
            LDA   #$0000
            SEP   #$20
            STA   [$F4]
            REP   #$20
            LDA   L0F07B1
            BEQ   L0D216D
            LDX   L0F07AB
            LDA   L0F07A9
            PHX
            PHA
            PEI   $E2
            JSL   L0D36AD
            PLY
            PLY
            PLY
            BRA   L0D2178
L0D216D     LDA   L0F07AD
            BNE   L0D2175
            DEC   L0F07AF
L0D2175     DEC   L0F07AD
L0D2178     INC   $F2
L0D217A     BRL   L0D1D51
L0D217D     LDA   $F2
L0D217F     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0D2189     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00CD
            TCS
            LDX   $FB
            LDA   $F9
            STA   $E8
            STX   $EA
            LDX   $FF
            LDA   $FD
            STA   $F0
            STX   $F2
            LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
            STA   $EC
            STX   $EE
            LDX   #$0000
            LDA   #$0004
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L0D1573
            PLA
            PLX
            STA   $FD
            STX   $FF
L0D21C6     LDA   [$EC]
            AND   #$00FF
            BNE   L0D21D0
            BRL   L0D25A8
L0D21D0     LDA   [$EC]
            AND   #$00FF
            BEQ   L0D220C
            LDA   [$EC]
            AND   #$00FF
            CMP   #$0025
            BEQ   L0D220C
            LDX   $EE
            LDA   $EC
            INC   $EC
            BNE   L0D21EB
            INC   $EE
L0D21EB     STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            PHA
            LDX   $FB
            LDA   $F9
            INC   $F9
            BNE   L0D21FF
            INC   $FB
L0D21FF     STA   $F0
            STX   $F2
            PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            BRA   L0D21D0
L0D220C     LDA   [$EC]
            AND   #$00FF
            CMP   #$0025
            BEQ   L0D2219
            BRL   L0D25A5
L0D2219     INC   $EC
            BNE   L0D221F
            INC   $EE
L0D221F     STZ   $D7
            LDA   #$0100
            STA   $D3
            STZ   $D1
            LDA   #$0020
            SEP   #$20
            STA   $DB
            REP   #$20
            LDA   [$EC]
            AND   #$00FF
            CMP   #$002D
            BNE   L0D2246
            LDA   #$0001
            STA   $D7
            INC   $EC
            BNE   L0D2246
            INC   $EE
L0D2246     LDA   [$EC]
            AND   #$00FF
            CMP   #$0030
            BNE   L0D225F
            LDA   #$0030
            SEP   #$20
            STA   $DB
            REP   #$20
            INC   $EC
            BNE   L0D225F
            INC   $EE
L0D225F     LDX   $EE
            LDA   $EC
            STA   $DC
            STX   $DE
            PEA   $0000
            TDC
            CLC
            ADC   #$00DC
            PHA
            JSL   L0D39B8
            PLY
            PLY
            STA   $D5
            LDX   $DE
            LDA   $DC
            STA   $EC
            STX   $EE
            LDA   [$EC]
            AND   #$00FF
            CMP   #$002E
            BNE   L0D22B1
            INC   $EC
            BNE   L0D2290
            INC   $EE
L0D2290     LDX   $EE
            LDA   $EC
            STA   $DC
            STX   $DE
            PEA   $0000
            TDC
            CLC
            ADC   #$00DC
            PHA
            JSL   L0D39B8
            PLY
            PLY
            STA   $D3
            LDX   $DE
            LDA   $DC
            STA   $EC
            STX   $EE
L0D22B1     LDA   [$EC]
            AND   #$00FF
            CMP   #$006C
            BNE   L0D22C6
            LDA   #$0001
            STA   $D1
            INC   $EC
            BNE   L0D22C6
            INC   $EE
L0D22C6     LDA   [$EC]
            AND   #$00FF
            BEQ   L0D22E2
            LDX   $EE
            LDA   $EC
            INC   $EC
            BNE   L0D22D7
            INC   $EE
L0D22D7     STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            STA   $D9
L0D22E2     LDX   $FB
            LDA   $F9
            STA   $E4
            STX   $E6
            LDA   $D9
            CMP   #$0064
            BEQ   L0D2306
            LDA   $D9
            CMP   #$006F
            BEQ   L0D2306
            LDA   $D9
            CMP   #$0078
            BEQ   L0D2306
            LDA   $D9
            CMP   #$0075
            BNE   L0D236C
L0D2306     LDA   $D1
            BEQ   L0D231C
            LDX   $FF
            LDA   $FD
            STA   $F0
            STX   $F2
            LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
            BRA   L0D232F
L0D231C     LDX   $FF
            LDA   $FD
            STA   $F0
            STX   $F2
            LDA   [$F0]
            LDX   #$0000
            CMP   #$0000
            BPL   L0D232F
            DEX
L0D232F     PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F9
            PHA
            PEI   $D1
            PEI   $D9
            JSL   L0D2EBB
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $D1
            BEQ   L0D2353
            LDA   #$0004
            BRA   L0D2356
L0D2353     LDA   #$0002
L0D2356     LDX   #$0000
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L0D1573
            PLA
            PLX
            STA   $FD
            STX   $FF
            BRL   L0D2498
L0D236C     LDA   $D9
            CMP   #$0063
            BNE   L0D23A7
            LDA   [$FD]
            AND   #$00FF
            PHA
            LDX   $FB
            LDA   $F9
            INC   $F9
            BNE   L0D2383
            INC   $FB
L0D2383     STA   $F0
            STX   $F2
            PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            LDX   #$0000
            LDA   #$0002
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L0D1573
            PLA
            PLX
            STA   $FD
            STX   $FF
            BRL   L0D2498
L0D23A7     LDA   $D9
            CMP   #$0073
            BNE   L0D2417
            LDX   $FF
            LDA   $FD
            STA   $F0
            STX   $F2
            LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
            STA   $E0
            STX   $E2
            LDX   #$0000
            LDA   #$0004
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L0D1573
            PLA
            PLX
            STA   $FD
            STX   $FF
            LDA   $D3
            STA   $CF
            BRA   L0D2409
L0D23DE     LDX   $E2
            LDA   $E0
            INC   $E0
            BNE   L0D23E8
            INC   $E2
L0D23E8     STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            PHA
            LDX   $FB
            LDA   $F9
            INC   $F9
            BNE   L0D23FC
            INC   $FB
L0D23FC     STA   $F0
            STX   $F2
            PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            DEC   $CF
L0D2409     LDA   $CF
            BEQ   L0D2414
            LDA   [$E0]
            AND   #$00FF
            BNE   L0D23DE
L0D2414     BRL   L0D2498
L0D2417     LDA   $D9
            CMP   #$0065
            BEQ   L0D242C
            LDA   $D9
            CMP   #$0066
            BEQ   L0D242C
            LDA   $D9
            CMP   #$0067
            BNE   L0D2480
L0D242C     LDX   $FF
            LDA   $FD
            STA   $F0
            STX   $F2
            LDY   #$0008
            LDA   [$F0],Y
            PHA
            LDY   #$0006
            LDA   [$F0],Y
            PHA
            LDY   #$0004
            LDA   [$F0],Y
            PHA
            LDY   #$0002
            LDA   [$F0],Y
            PHA
            LDA   [$F0]
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F9
            PHA
            PEI   $D3
            PEI   $D9
            JSL   L0D262E
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            LDX   #$0000
            LDA   #$000A
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L0D1573
            PLA
            PLX
            STA   $FD
            STX   $FF
            BRA   L0D2498
L0D2480     LDA   $D9
            PHA
            LDX   $FB
            LDA   $F9
            INC   $F9
            BNE   L0D248D
            INC   $FB
L0D248D     STA   $F0
            STX   $F2
            PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
L0D2498     LDX   $E6
            LDA   $E4
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L0D1705
            PLA
            PLX
            SEC
            SBC   $D5
            BVS   L0D24B0
            EOR   #$8000
L0D24B0     BPL   L0D24B5
            BRL   L0D25A5
L0D24B5     LDA   $D7
            BEQ   L0D24F5
            LDX   $E6
            LDA   $E4
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L0D1705
            PLA
            PLX
            PHA
            LDA   $D5
            PLX
            STX   $F0
            SEC
            SBC   $F0
            STA   $CF
            BRA   L0D24EE
L0D24D6     LDX   $FB
            LDA   $F9
            INC   $F9
            BNE   L0D24E0
            INC   $FB
L0D24E0     STA   $F0
            STX   $F2
            LDA   $DB
            SEP   #$20
            STA   [$F0]
            REP   #$20
            DEC   $CF
L0D24EE     LDA   $CF
            BNE   L0D24D6
            BRL   L0D25A5
L0D24F5     LDA   $D5
            SEC
            SBC   #$0001
            LDX   #$0000
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L0D1573
            PLA
            PLX
            STA   $E0
            STX   $E2
            STA   $DC
            STX   $DE
            LDX   $E6
            LDA   $E4
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L0D1705
            PLA
            PLX
            STA   $CF
            BRA   L0D255E
L0D2526     LDA   $CF
            SEC
            SBC   #$0001
            LDX   #$0000
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L0D1573
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            PHA
            LDX   $E2
            LDA   $E0
            LDA   $E0
            BNE   L0D254F
            DEC   $E2
L0D254F     DEC   $E0
            STA   $F0
            STX   $F2
            PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            DEC   $CF
L0D255E     LDA   $CF
            BNE   L0D2526
L0D2562     LDX   $E2
            LDA   $E0
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L0D157E
            BVS   L0D2575
            EOR   #$8000
L0D2575     BPL   L0D258F
            LDX   $E6
            LDA   $E4
            INC   $E4
            BNE   L0D2581
            INC   $E6
L0D2581     STA   $F0
            STX   $F2
            LDA   $DB
            SEP   #$20
            STA   [$F0]
            REP   #$20
            BRA   L0D2562
L0D258F     LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $DE
            LDA   $DC
            JSL   L0D1573
            PLA
            PLX
            STA   $F9
            STX   $FB
L0D25A5     BRL   L0D21C6
L0D25A8     LDA   #$0000
            SEP   #$20
            STA   [$F9]
            REP   #$20
            LDX   $EA
            LDA   $E8
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L0D1705
            PLA
            PLX
            TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0D25CB     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            PEI   $FF
            PEI   $FD
            JSL   L0D299C
            PLY
            PLY
            TAY
            BEQ   L0D25E8
            LDA   #$FFFF
            BRA   L0D2624
L0D25E8     LDY   #$000A
            LDA   [$FD],Y
            AND   #$0010
            TAY
            BEQ   L0D2606
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            PHX
            PHA
            JSL   L0D3A57
            PLY
            PLY
L0D2606     LDA   #$0000
            LDY   #$000A
            STA   [$FD],Y
            LDY   #$000C
            LDA   [$FD],Y
            PHA
            JSL   L0D3BA1
            PLY
            TAY
            BEQ   L0D2621
            LDA   #$FFFF
            BRA   L0D2624
L0D2621     LDA   #$0000
L0D2624     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0D262E     PHD
            TSC
            SEC
            SBC   #$00E9
            TCD
            ADC   #$00DC
            TCS
            LDX   #$0000
            TDC
            CLC
            ADC   #$00F7
            STA   $DE
            STX   $E0
            LDA   $F1
            CMP   #$0100
            BNE   L0D2651
            LDA   #$0006
            STA   $F1
L0D2651     LDA   $F1
            STAL  L0F0785
            LDA   $EF
            CMP   #$0066
            BNE   L0D266B
            LDA   #$0001
            SEP   #$20
            STAL  L0F0783
            REP   #$20
            BRA   L0D268F
L0D266B     LDA   $EF
            CMP   #$0065
            BEQ   L0D2679
            LDA   $EF
            CMP   #$0067
            BNE   L0D268F
L0D2679     LDA   #$0000
            SEP   #$20
            STAL  L0F0783
            REP   #$20
            LDAL  L0F0785
            PHA
            INC
            STAL  L0F0785
            PLA
L0D268F     PEA   ^L0F0783
            PEA   L0F0783
            PEI   $E0
            PEI   $DE
            PEA   ^L0F0787
            PEA   L0F0787
            PEA   $000B
            _SANEFP816
            PEA   ^L0F078B
            PEA   L0F078B
            JSL   L0D31F0
            PLY
            PLY
            LDAL  L0F0787
            AND   #$00FF
            BEQ   L0D26EA
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$F3]
            LDY   #$0002
            LDA   [$F3],Y
            BCC   L0D26D6
            INC
L0D26D6     LDY   #$0002
            STA   [$F3],Y
            PLA
            PLX
            STA   $E6
            STX   $E8
            LDA   #$002D
            SEP   #$20
            STA   [$E6]
            REP   #$20
L0D26EA     LDAL  L0F078B
            AND   #$00FF
            SEC
            SBC   #$0030
            BVS   L0D26FA
            EOR   #$8000
L0D26FA     BPL   L0D271C
            LDAL  L0F078B
            AND   #$00FF
            SEC
            SBC   #$0039
            BEQ   L0D2710
            BVS   L0D270E
            EOR   #$8000
L0D270E     BMI   L0D271C
L0D2710     LDAL  L0F078B
            AND   #$00FF
            CMP   #$0030
            BNE   L0D2755
L0D271C     LDAL  L0F078C
            AND   #$00FF
            BNE   L0D2755
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$F3]
            LDY   #$0002
            LDA   [$F3],Y
            BCC   L0D273D
            INC
L0D273D     LDY   #$0002
            STA   [$F3],Y
            PLA
            PLX
            STA   $E6
            STX   $E8
            LDAL  L0F078B
            SEP   #$20
            STA   [$E6]
            REP   #$20
            BRL   L0D2994
L0D2755     LDA   $EF
            CMP   #$0066
            BEQ   L0D275F
            BRL   L0D286E
L0D275F     PEA   ^L0F078B
            PEA   L0F078B
            JSL   L0C04CD
            PLY
            PLY
            SEC
            SBC   $F1
            STA   $E4
            STZ   $E2
L0D2772     LDA   $E4
            SEC
            SBC   #$0000
            BEQ   L0D27BC
            BVS   L0D277F
            EOR   #$8000
L0D277F     BPL   L0D27BC
            LDA   $E2
            INC   $E2
            TAX
            LDAL  L0F078B,X
            AND   #$00FF
            PHA
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$F3]
            LDY   #$0002
            LDA   [$F3],Y
            BCC   L0D27A6
            INC
L0D27A6     LDY   #$0002
            STA   [$F3],Y
            PLA
            PLX
            STA   $E6
            STX   $E8
            PLA
            SEP   #$20
            STA   [$E6]
            REP   #$20
            DEC   $E4
            BRA   L0D2772
L0D27BC     LDA   $F1
            BEQ   L0D27EC
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$F3]
            LDY   #$0002
            LDA   [$F3],Y
            BCC   L0D27D8
            INC
L0D27D8     LDY   #$0002
            STA   [$F3],Y
            PLA
            PLX
            STA   $E6
            STX   $E8
            LDA   #$002E
            SEP   #$20
            STA   [$E6]
            REP   #$20
L0D27EC     LDA   $E4
            INC   $E4
            SEC
            SBC   #$0000
            BVS   L0D27F9
            EOR   #$8000
L0D27F9     BMI   L0D282B
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$F3]
            LDY   #$0002
            LDA   [$F3],Y
            BCC   L0D2813
            INC
L0D2813     LDY   #$0002
            STA   [$F3],Y
            PLA
            PLX
            STA   $E6
            STX   $E8
            LDA   #$0030
            SEP   #$20
            STA   [$E6]
            REP   #$20
            DEC   $F1
            BRA   L0D27EC
L0D282B     LDA   $F1
            DEC   $F1
            TAY
            BEQ   L0D286B
            LDA   $E2
            INC   $E2
            TAX
            LDAL  L0F078B,X
            AND   #$00FF
            PHA
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$F3]
            LDY   #$0002
            LDA   [$F3],Y
            BCC   L0D2857
            INC
L0D2857     LDY   #$0002
            STA   [$F3],Y
            PLA
            PLX
            STA   $E6
            STX   $E8
            PLA
            SEP   #$20
            STA   [$E6]
            REP   #$20
            BRA   L0D282B
L0D286B     BRL   L0D2994
L0D286E     LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$F3]
            LDY   #$0002
            LDA   [$F3],Y
            BCC   L0D2886
            INC
L0D2886     LDY   #$0002
            STA   [$F3],Y
            PLA
            PLX
            STA   $E6
            STX   $E8
            LDAL  L0F078B
            SEP   #$20
            STA   [$E6]
            REP   #$20
            LDA   $F1
            BEQ   L0D28CB
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$F3]
            LDY   #$0002
            LDA   [$F3],Y
            BCC   L0D28B7
            INC
L0D28B7     LDY   #$0002
            STA   [$F3],Y
            PLA
            PLX
            STA   $E6
            STX   $E8
            LDA   #$002E
            SEP   #$20
            STA   [$E6]
            REP   #$20
L0D28CB     LDA   #$0001
            STA   $E4
            LDAL  L0F0789
            CLC
            ADC   $F1
            STAL  L0F0789
L0D28DB     LDA   $F1
            DEC   $F1
            TAY
            BEQ   L0D291B
            LDA   $E4
            INC   $E4
            TAX
            LDAL  L0F078B,X
            AND   #$00FF
            PHA
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$F3]
            LDY   #$0002
            LDA   [$F3],Y
            BCC   L0D2907
            INC
L0D2907     LDY   #$0002
            STA   [$F3],Y
            PLA
            PLX
            STA   $E6
            STX   $E8
            PLA
            SEP   #$20
            STA   [$E6]
            REP   #$20
            BRA   L0D28DB
L0D291B     LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$F3]
            LDY   #$0002
            LDA   [$F3],Y
            BCC   L0D2933
            INC
L0D2933     LDY   #$0002
            STA   [$F3],Y
            PLA
            PLX
            STA   $E6
            STX   $E8
            LDA   #$0045
            SEP   #$20
            STA   [$E6]
            REP   #$20
            LDAL  L0F0789
            PHA
            PEA   ^L0F0681
            PEA   L0F0681
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            JSL   L0D1BB9
            PLY
            PLY
            PLY
            PLY
            PLY
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            PHX
            PHA
            JSL   L0C04CD
            PLY
            PLY
            LDX   #$0000
            PHX
            PHA
            LDY   #$0002
            LDA   [$F3],Y
            TAX
            LDA   [$F3]
            JSL   L0D1573
            PLA
            PLX
            PHA
            PLA
            STA   [$F3]
            LDY   #$0002
            PHA
            TXA
            STA   [$F3],Y
            PLA
L0D2994     TDC
            CLC
            ADC   #$00E9
            TCS
            PLD
            RTL

L0D299C     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDY   #$000A
            LDA   [$FD],Y
            AND   #$0003
            TAY
            BNE   L0D29B8
            LDA   #$FFFF
            BRL   L0D2AE8
L0D29B8     LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            PHX
            PHA
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            JSL   L0D1705
            PLA
            PLX
            STA   $F2
            LDY   #$000A
            LDA   [$FD],Y
            AND   #$0080
            TAY
            BNE   L0D29E3
            BRL   L0D2A7C
L0D29E3     LDY   #$000A
            LDA   [$FD],Y
            AND   #$0002
            TAY
            BNE   L0D29F4
            LDA   #$FFFF
            BRL   L0D2AE8
L0D29F4     LDY   #$000A
            LDA   [$FD],Y
            AND   #$0004
            TAY
            BEQ   L0D2A16
            PEA   $0002
            PEA   $0000
            PEA   $0000
            LDY   #$000C
            LDA   [$FD],Y
            PHA
            JSL   L0D2D51
            PLY
            PLY
            PLY
            PLY
L0D2A16     PEI   $F2
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            PHX
            PHA
            LDY   #$000C
            LDA   [$FD],Y
            PHA
            JSL   L0D37C7
            PLY
            PLY
            PLY
            PLY
            CMP   #$FFFF
            BNE   L0D2A3E
            LDA   #$FFFF
            BRL   L0D2AE8
L0D2A3E     LDY   #$000A
            LDA   [$FD],Y
            AND   #$FF7F
            PHA
            PLA
            LDY   #$000A
            STA   [$FD],Y
            LDA   $F2
            LDX   #$0000
            CMP   #$0000
            BPL   L0D2A58
            DEX
L0D2A58     PHX
            PHA
            LDY   #$0010
            LDA   [$FD],Y
            TAX
            LDY   #$000E
            LDA   [$FD],Y
            JSL   L0D1573
            PLA
            PLX
            PHA
            PLA
            LDY   #$000E
            STA   [$FD],Y
            LDY   #$0010
            PHA
            TXA
            STA   [$FD],Y
            PLA
            BRA   L0D2AC4
L0D2A7C     LDY   #$000C
            LDA   [$FD],Y
            SEC
            SBC   #$0000
            BEQ   L0D2AC4
            BVS   L0D2A8C
            EOR   #$8000
L0D2A8C     BPL   L0D2AC4
            PEA   $0001
            LDY   #$0004
            LDA   [$FD],Y
            EOR   #$FFFF
            INC
            LDX   #$0000
            CMP   #$0000
            BPL   L0D2AA3
            DEX
L0D2AA3     PHX
            PHA
            LDY   #$000C
            LDA   [$FD],Y
            PHA
            JSL   L0D2D51
            PLY
            PLY
            PLY
            PLY
            PHX
            PHA
            PLA
            PLX
            LDY   #$000E
            STA   [$FD],Y
            LDY   #$0010
            PHA
            TXA
            STA   [$FD],Y
            PLA
L0D2AC4     LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            PHX
            PHA
            PLA
            PLX
            STA   [$FD]
            LDY   #$0002
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDA   #$0000
            LDY   #$0004
            STA   [$FD],Y
            LDA   #$0000
L0D2AE8     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0D2AF2     PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00DE
            TCS
            STZ   $E0
            LDA   [$FB]
            AND   #$00FF
            CMP   #$0066
            BNE   L0D2B14
            LDA   #$0004
            STA   $E0
            INC   $FB
            BNE   L0D2B14
            INC   $FD
L0D2B14     LDA   [$FB]
            AND   #$00FF
            CMP   #$0062
            BNE   L0D2B2B
            LDA   $E0
            ORA   #$2000
            STA   $E0
            INC   $FB
            BNE   L0D2B2B
            INC   $FD
L0D2B2B     LDA   [$FB]
            AND   #$00FF
            CMP   #$0072
            BEQ   L0D2B52
            LDA   [$FB]
            AND   #$00FF
            CMP   #$0077
            BEQ   L0D2B52
            LDA   [$FB]
            AND   #$00FF
            CMP   #$0061
            BEQ   L0D2B52
            LDX   #$0000
            LDA   #$0000
            BRL   L0D2D47
L0D2B52     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   L0F05DD
            LDA   L0F05DB
            STA   $E8
            STX   $EA
            JSL   L0D157E
            BNE   L0D2BB6
            LDA   #L0F05DF
            LDX   #^L0F05DF
            STA   $E8
            STX   $EA
            BRA   L0D2B8F
L0D2B76     LDY   #$000A
            LDA   [$E8],Y
            AND   #$0003
            TAY
            BNE   L0D2B83
            BRA   L0D2BB6
L0D2B83     LDA   $E8
            CLC
            ADC   #$0014
            STA   $E8
            BCC   L0D2B8F
            INC   $EA
L0D2B8F     LDX   #$0000
            LDA   #$00A0
            PHX
            PHA
            LDA   #L0F05DF
            LDX   #^L0F05DF
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L0D157E
            BEQ   L0D2BB6
            BVS   L0D2BB4
            EOR   #$8000
L0D2BB4     BMI   L0D2B76
L0D2BB6     LDX   #$0000
            LDA   #$00A0
            PHX
            PHA
            LDA   #L0F05DF
            LDX   #^L0F05DF
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L0D157E
            BEQ   L0D2BDD
            BVS   L0D2BDB
            EOR   #$8000
L0D2BDB     BMI   L0D2BE6
L0D2BDD     LDX   #$0000
            LDA   #$0000
            BRL   L0D2D47
L0D2BE6     STZ   L0F05DB
            STZ   L0F05DD
            LDA   #$0000
            LDY   #$000A
            STA   [$E8],Y
            LDA   #$0001
            STA   $E2
            LDY   #$0001
            LDA   [$FB],Y
            AND   #$00FF
            CMP   #$002B
            BNE   L0D2C1A
            LDA   #$0003
            STA   $E2
            LDY   #$000A
            LDA   [$E8],Y
            ORA   #$0003
            PHA
            PLA
            LDY   #$000A
            STA   [$E8],Y
L0D2C1A     LDA   [$FB]
            AND   #$00FF
            CMP   #$0077
            BNE   L0D2C47
            PEI   $FF
            PEI   $E0
            PEI   $F9
            PEI   $F7
            JSL   L0D3C49
            PLY
            PLY
            PLY
            PLY
            STA   $EC
            LDY   #$000A
            LDA   [$E8],Y
            ORA   #$0002
            PHA
            PLA
            LDY   #$000A
            STA   [$E8],Y
            BRA   L0D2CC0
L0D2C47     LDA   [$FB]
            AND   #$00FF
            CMP   #$0061
            BNE   L0D2C9F
            LDA   #$0003
            ORA   $E0
            PHA
            PEI   $F9
            PEI   $F7
            JSL   L0D30EE
            PLY
            PLY
            PLY
            STA   $EC
            CMP   #$FFFF
            BNE   L0D2C7B
            PEI   $FF
            PEI   $E0
            PEI   $F9
            PEI   $F7
            JSL   L0D3C49
            PLY
            PLY
            PLY
            PLY
            STA   $EC
L0D2C7B     PEA   $0002
            PEA   $0000
            PEA   $0000
            PEI   $EC
            JSL   L0D2D51
            PLY
            PLY
            PLY
            PLY
            LDY   #$000A
            LDA   [$E8],Y
            ORA   #$0006
            PHA
            PLA
            LDY   #$000A
            STA   [$E8],Y
            BRA   L0D2CC0
L0D2C9F     LDA   $E2
            ORA   $E0
            PHA
            PEI   $F9
            PEI   $F7
            JSL   L0D30EE
            PLY
            PLY
            PLY
            STA   $EC
            LDY   #$000A
            LDA   [$E8],Y
            ORA   #$0001
            PHA
            PLA
            LDY   #$000A
            STA   [$E8],Y
L0D2CC0     LDA   $EC
            CMP   #$FFFF
            BNE   L0D2CD7
            LDA   #$0000
            LDY   #$000A
            STA   [$E8],Y
            LDX   #$0000
            LDA   #$0000
            BRA   L0D2D47
L0D2CD7     LDA   $EC
            LDY   #$000C
            STA   [$E8],Y
            LDA   #$0000
            LDY   #$0004
            STA   [$E8],Y
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            PLA
            PLX
            STA   [$E8]
            LDY   #$0002
            PHA
            TXA
            STA   [$E8],Y
            PLA
            PHX
            PHA
            PLA
            PLX
            LDY   #$0006
            STA   [$E8],Y
            LDY   #$0008
            PHA
            TXA
            STA   [$E8],Y
            PLA
            LDX   $EA
            LDA   $E8
            STA   $E4
            STX   $E6
            PEA   $0001
            PEA   $0000
            PEA   $0000
            LDY   #$000C
            LDA   [$E8],Y
            PHA
            JSL   L0D2D51
            PLY
            PLY
            PLY
            PLY
            PHX
            PHA
            PLA
            PLX
            LDY   #$000E
            STA   [$E4],Y
            LDY   #$0010
            PHA
            TXA
            STA   [$E4],Y
            PLA
            LDA   L0F067F
            LDY   #$0012
            STA   [$E4],Y
            LDX   $EA
            LDA   $E8
L0D2D47     TAY
            TDC
            CLC
            ADC   #$00F1
            TCS
            TYA
            PLD
            RTL

L0D2D51     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E0
            TCS
            STZ   $E2
            LDA   $F9
            SEC
            SBC   #$0000
            BVS   L0D2D69
            EOR   #$8000
L0D2D69     BMI   L0D2D74
            LDX   #$FFFF
            LDA   #$FFFF
            BRL   L0D2EB1
L0D2D74     LDA   $F9
            STAL  L0F07F5
            JSL   GSOS
            DW    $0019       ; GetEOF
            ADRL  L0F07F5
            STA   L0F07C5
            LDA   L0F07C5
            BEQ   L0D2D95
            LDX   #$FFFF
            LDA   #$FFFF
            BRL   L0D2EB1
L0D2D95     LDAL  L0F07F9
            TAX
            LDAL  L0F07F7
            STA   $E8
            STX   $EA
            JSL   GSOS
            DW    $0017       ; GetMark
            ADRL  L0F07F5
            STA   L0F07C5
            LDA   L0F07C5
            BEQ   L0D2DBD
            LDX   #$FFFF
            LDA   #$FFFF
            BRL   L0D2EB1
L0D2DBD     LDAL  L0F07F9
            TAX
            LDAL  L0F07F7
            STA   $EC
            STX   $EE
            LDA   $FF
            CMP   #$0000
            BEQ   L0D2DD3
            BRA   L0D2DDF
L0D2DD3     LDX   $FD
            LDA   $FB
            STA   $E4
            STX   $E6
            BRA   L0D2E24
            BRA   L0D2DE6
L0D2DDF     CMP   #$0001
            BEQ   L0D2DE6
            BRA   L0D2DFB
L0D2DE6     LDX   $EE
            LDA   $EC
            CLC
            ADC   $FB
            PHA
            TXA
            ADC   $FD
            TAX
            PLA
            STA   $E4
            STX   $E6
            BRA   L0D2E24
            BRA   L0D2E02
L0D2DFB     CMP   #$0002
            BEQ   L0D2E02
            BRA   L0D2E22
L0D2E02     LDX   $EA
            LDA   $E8
            CLC
            ADC   $FB
            PHA
            TXA
            ADC   $FD
            TAX
            PLA
            STA   $E4
            STX   $E6
            BRA   L0D2E24
L0D2E15     LDX   #$FFFF
            LDA   #$FFFF
            BRL   L0D2EB1
            BRA   L0D2E24
            BRA   L0D2E24
L0D2E22     BRA   L0D2E15
L0D2E24     LDX   $EA
            LDA   $E8
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L0D157E
            BVS   L0D2E37
            EOR   #$8000
L0D2E37     BMI   L0D2E82
            LDX   $EA
            LDA   $E8
            STAL  L0F07F7
            PHA
            TXA
            STAL  L0F07F9
            PLA
            JSL   GSOS
            DW    $0016       ; SetMark
            ADRL  L0F07F5
            STA   L0F07C5
            LDX   $E6
            LDA   $E4
            SEC
            SBC   $E8
            PHA
            TXA
            SBC   $EA
            TAX
            PLA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            PEI   $F9
            JSL   L0D37C7
            PLY
            PLY
            PLY
            PLY
            PLY
            CMP   #$FFFF
            BNE   L0D2E80
            INC   L0F07C5
L0D2E80     BRA   L0D2E9E
L0D2E82     LDX   $E6
            LDA   $E4
            STAL  L0F07F7
            PHA
            TXA
            STAL  L0F07F9
            PLA
            JSL   GSOS
            DW    $0016       ; SetMark
            ADRL  L0F07F5
            STA   L0F07C5
L0D2E9E     LDA   L0F07C5
            BEQ   L0D2EAD
            LDX   #$FFFF
            LDA   #$FFFF
            STA   $E4
            STX   $E6
L0D2EAD     LDX   $E6
            LDA   $E4
L0D2EB1     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0D2EBB     PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00BE
            TCS
            STZ   $C2
            LDA   $F5
            CMP   #$0064
            BEQ   L0D2ED1
            BRA   L0D2EDA
L0D2ED1     LDA   #$000A
            STA   $C0
            BRA   L0D2F06
            BRA   L0D2EE1
L0D2EDA     CMP   #$0075
            BEQ   L0D2EE1
            BRA   L0D2EEA
L0D2EE1     LDA   #$000A
            STA   $C0
            BRA   L0D2F06
            BRA   L0D2EF1
L0D2EEA     CMP   #$006F
            BEQ   L0D2EF1
            BRA   L0D2EFA
L0D2EF1     LDA   #$0008
            STA   $C0
            BRA   L0D2F06
            BRA   L0D2F01
L0D2EFA     CMP   #$0078
            BEQ   L0D2F01
            BRA   L0D2F06
L0D2F01     LDA   #$0010
            STA   $C0
L0D2F06     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L0D157E
            BEQ   L0D2F76
            BVS   L0D2F1D
            EOR   #$8000
L0D2F1D     BPL   L0D2F76
            LDA   $F5
            CMP   #$0064
            BNE   L0D2F60
            LDY   #$0002
            LDA   [$F9],Y
            TAX
            LDA   [$F9]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$F9]
            LDY   #$0002
            LDA   [$F9],Y
            BCC   L0D2F3E
            INC
L0D2F3E     LDY   #$0002
            STA   [$F9],Y
            PLA
            PLX
            STA   $EC
            STX   $EE
            LDA   #$002D
            SEP   #$20
            STA   [$EC]
            REP   #$20
            LDX   $FF
            LDA   $FD
            JSL   L0D16F6
            STA   $FD
            STX   $FF
            BRA   L0D2F76
L0D2F60     LDA   $F7
            BNE   L0D2F76
            LDX   $FF
            LDA   $FD
            AND   #$FFFF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            STA   $FD
            STX   $FF
L0D2F76     LDA   $C0
            CMP   #$0008
            BNE   L0D2F8D
            LDX   $FF
            LDA   $FD
            AND   #$0007
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            BRA   L0D2FBC
L0D2F8D     LDA   $C0
            CMP   #$0010
            BNE   L0D2FA4
            LDX   $FF
            LDA   $FD
            AND   #$000F
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            BRA   L0D2FBC
L0D2FA4     LDX   $FF
            LDA   $FD
            PHX
            PHA
            LDA   $C0
            LDX   #$0000
            CMP   #$0000
            BPL   L0D2FB5
            DEX
L0D2FB5     SEC
            JSL   L0D15C0
            PLA
            PLX
L0D2FBC     PHA
            LDA   $C2
            INC   $C2
            ASL
            TAX
            PLA
            STA   $C4,X
            LDA   $C0
            CMP   #$0008
            BNE   L0D2FEC
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            LDX   #$0000
            LDA   #$0003
            SEC
            JSL   L0D38DE
            PLA
            PLX
            AND   #$FFFF
            PHA
            TXA
            AND   #$1FFF
            TAX
            PLA
            BRA   L0D302A
L0D2FEC     LDA   $C0
            CMP   #$0010
            BNE   L0D3012
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            LDX   #$0000
            LDA   #$0004
            SEC
            JSL   L0D38DE
            PLA
            PLX
            AND   #$FFFF
            PHA
            TXA
            AND   #$0FFF
            TAX
            PLA
            BRA   L0D302A
L0D3012     LDX   $FF
            LDA   $FD
            PHX
            PHA
            LDA   $C0
            LDX   #$0000
            CMP   #$0000
            BPL   L0D3023
            DEX
L0D3023     SEC
            JSL   L0D15C0
            PLY
            PLY
L0D302A     STA   $FD
            STX   $FF
            LDX   $FF
            LDA   $FD
            STX   $EC
            ORA   $EC
            BEQ   L0D303B
            BRL   L0D2F76
L0D303B     LDA   $C2
            BEQ   L0D3099
            DEC   $C2
            LDA   $C2
            ASL
            TAX
            LDA   $C4,X
            SEC
            SBC   #$000A
            BVS   L0D3050
            EOR   #$8000
L0D3050     BPL   L0D3062
            LDA   $C2
            ASL
            TAX
            LDA   $C4,X
            SEC
            SBC   #$000A
            CLC
            ADC   #$0041
            BRA   L0D306C
L0D3062     LDA   $C2
            ASL
            TAX
            LDA   $C4,X
            CLC
            ADC   #$0030
L0D306C     PHA
            LDY   #$0002
            LDA   [$F9],Y
            TAX
            LDA   [$F9]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$F9]
            LDY   #$0002
            LDA   [$F9],Y
            BCC   L0D3085
            INC
L0D3085     LDY   #$0002
            STA   [$F9],Y
            PLA
            PLX
            STA   $EC
            STX   $EE
            PLA
            SEP   #$20
            STA   [$EC]
            REP   #$20
            BRA   L0D303B
L0D3099     TDC
            CLC
            ADC   #$00EF
            TCS
            PLD
            RTL

L0D30A1     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDA   L0F07B1
            BEQ   L0D30C1
            LDX   L0F07AB
            LDA   L0F07A9
            PHX
            PHA
            JSL   L0D3DB0
            PLY
            PLY
            BRA   L0D30E4
L0D30C1     LDX   L0F07AF
            LDA   L0F07AD
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   L0F07AD
            LDA   L0F07AF
            BCC   L0D30D6
            INC
L0D30D6     STA   L0F07AF
            PLA
            PLX
            STA   $F8
            STX   $FA
            LDA   [$F8]
            AND   #$00FF
L0D30E4     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0D30EE     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E8
            TCS
            STZ   $EE
            PEA   ^L0F05B3
            PEA   L0F05B3
            PEI   $FD
            PEI   $FB
            JSL   L0D1C7E
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L0D3118
            LDA   #$8300
            STA   $F0
            BRL   L0D31E4
L0D3118     PEA   ^L0F05B8
            PEA   L0F05B8
            PEI   $FD
            PEI   $FB
            JSL   L0D1C7E
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L0D3135
            LDA   #$82FF
            STA   $F0
            BRL   L0D31E4
L0D3135     PEA   ^L0F05BD
            PEA   L0F05BD
            PEI   $FD
            PEI   $FB
            JSL   L0D1C7E
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L0D3156
            JSL   L0D3B4B
            LDA   #$82FE
            STA   $F0
            BRL   L0D31E4
L0D3156     PEI   $FD
            PEI   $FB
            JSL   L0D3D48
            PLY
            PLY
            LDX   $FD
            LDA   $FB
            STAL  L0F07DF
            PHA
            TXA
            STAL  L0F07E1
            PLA
            PEA   $0000
            PEA   $0000
            PEA   $4004
            LDA   L0F07C9
            PHA
            PEA   $0000
            PEA   $0400
            JSL   L0D12E5
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STA   $EA
            STX   $EC
            LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            STAL  L0F07E3
            PHA
            TXA
            STAL  L0F07E5
            PLA
            JSL   GSOS
            DW    $0010       ; Open
            ADRL  L0F07DD
            STA   L0F07C5
            PEI   $FD
            PEI   $FB
            JSL   L0D31F0
            PLY
            PLY
            LDA   L0F07C5
            BEQ   L0D31C8
            LDA   #$FFFF
            STA   $F0
            BRA   L0D31E4
L0D31C8     LDAL  L0F07DD
            STA   $F0
            LDY   #$0002
            LDA   [$EA],Y
            TAX
            LDA   [$EA]
            PHX
            PHA
            PEI   $FF
            PEI   $F0
            JSL   L0D3944
            PLY
            PLY
            PLY
            PLY
L0D31E4     LDA   $F0
            TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0D31F0     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDX   $FF
            LDA   $FD
            STX   $F4
            ORA   $F4
            BEQ   L0D3259
            LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L0D320F
            INC   $FF
L0D320F     STA   $EE
            STX   $F0
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            STA   $F2
            BRA   L0D3249
L0D3220     LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L0D322A
            INC   $FF
L0D322A     STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            PHA
            LDX   $F0
            LDA   $EE
            INC   $EE
            BNE   L0D323E
            INC   $F0
L0D323E     STA   $F4
            STX   $F6
            PLA
            SEP   #$20
            STA   [$F4]
            REP   #$20
L0D3249     LDA   $F2
            DEC   $F2
            TAY
            BNE   L0D3220
            LDA   #$0000
            SEP   #$20
            STA   [$EE]
            REP   #$20
L0D3259     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0D3261     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00CA
            TCS
            LDA   #$000A
            STA   $F2
            LDA   $F2
            JSL   L0D3896
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
            STZ   $E0
            STZ   $DE
            STZ   $DC
            STZ   $DA
            LDA   #$0001
            STA   $D8
            STZ   $D6
            LDA   #$0013
            STA   $D4
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00CC
            PHA
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
            LDA   $FD
            CMP   #$002D
            BNE   L0D32D2
            LDA   #$0001
            STA   $E8
            JSL   L0D30A1
            STA   $FD
            BRA   L0D32D4
L0D32D2     STZ   $E8
L0D32D4     STZ   $E6
L0D32D6     LDA   $FF
            BNE   L0D32DD
            BRL   L0D33D5
L0D32DD     LDA   $FD
            CMP   #$002D
            BNE   L0D32F0
            LDA   $DE
            BEQ   L0D32F0
            LDA   #$0001
            STA   $DA
            BRL   L0D33C5
L0D32F0     LDA   $FD
            SEC
            SBC   #$0030
            BVS   L0D32FB
            EOR   #$8000
L0D32FB     BMI   L0D3300
            BRL   L0D3398
L0D3300     LDA   $FD
            SEC
            SBC   #$0039
            BEQ   L0D3312
            BVS   L0D330D
            EOR   #$8000
L0D330D     BPL   L0D3312
            BRL   L0D3398
L0D3312     LDA   $DE
            BEQ   L0D332E
            LDA   $DC
            PHA
            LDA   #$000A
            SEC
            JSL   L0D151F
            PLA
            CLC
            ADC   $FD
            SEC
            SBC   #$0030
            STA   $DC
            BRL   L0D3396
L0D332E     LDA   $FD
            CMP   #$0030
            BEQ   L0D3337
            STZ   $D8
L0D3337     LDA   $D4
            BNE   L0D333F
            INC   $E6
            BRA   L0D3396
L0D333F     LDA   $E0
            BEQ   L0D3345
            DEC   $E6
L0D3345     LDA   $D8
            BNE   L0D3396
            PEI   $D2
            PEI   $D0
            PEI   $CE
            PEI   $CC
            JSL   L0D1452
            PEI   $F0
            PEI   $EE
            PEI   $EC
            PEI   $EA
            JSL   L0D1452
            JSL   L0D142A
            LDA   $FD
            JSL   L0D3896
            JSL   L0D139E
            PEA   $4004
            PEA   $C000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            JSL   L0D148E
            PEA   $0000
            TDC
            CLC
            ADC   #$00CC
            PHA
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
            DEC   $D4
L0D3396     BRA   L0D33C5
L0D3398     LDA   $FD
            CMP   #$002E
            BNE   L0D33AA
            LDA   $E0
            BNE   L0D33AA
            LDA   #$0001
            STA   $E0
            BRA   L0D33C5
L0D33AA     LDA   $FD
            CMP   #$0045
            BEQ   L0D33B8
            LDA   $FD
            CMP   #$0065
            BNE   L0D33C3
L0D33B8     LDA   $DE
            BNE   L0D33C3
            LDA   #$0001
            STA   $DE
            BRA   L0D33C5
L0D33C3     BRA   L0D33D5
L0D33C5     LDA   #$0001
            STA   $D6
            JSL   L0D30A1
            STA   $FD
            DEC   $FF
            BRL   L0D32D6
L0D33D5     LDA   $D6
            BNE   L0D33DF
            LDA   #$0001
            STA   L0F07B3
L0D33DF     LDA   $DA
            BEQ   L0D33EC
            LDA   $E6
            SEC
            SBC   $DC
            STA   $E6
            BRA   L0D33F3
L0D33EC     LDA   $E6
            CLC
            ADC   $DC
            STA   $E6
L0D33F3     LDA   $E6
            BNE   L0D33FA
            BRL   L0D346B
L0D33FA     LDA   $E6
            SEC
            SBC   #$0000
            BVS   L0D3405
            EOR   #$8000
L0D3405     BMI   L0D3439
            PEI   $D2
            PEI   $D0
            PEI   $CE
            PEI   $CC
            JSL   L0D1452
            PEI   $F0
            PEI   $EE
            PEI   $EC
            PEI   $EA
            JSL   L0D1452
            JSL   L0D1402
            PEA   $0000
            TDC
            CLC
            ADC   #$00CC
            PHA
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
            INC   $E6
            BRA   L0D3469
L0D3439     PEI   $D2
            PEI   $D0
            PEI   $CE
            PEI   $CC
            JSL   L0D1452
            PEI   $F0
            PEI   $EE
            PEI   $EC
            PEI   $EA
            JSL   L0D1452
            JSL   L0D142A
            PEA   $0000
            TDC
            CLC
            ADC   #$00CC
            PHA
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
            DEC   $E6
L0D3469     BRA   L0D33F3
L0D346B     LDA   $E8
            BEQ   L0D34A0
            PEI   $D2
            PEI   $D0
            PEI   $CE
            PEI   $CC
            JSL   L0D1452
            PEA   $BFFF
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            JSL   L0D142A
            PEA   $0000
            TDC
            CLC
            ADC   #$00CC
            PHA
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
L0D34A0     LDA   L0F07B1
            BEQ   L0D34B8
            LDX   L0F07AB
            LDA   L0F07A9
            PHX
            PHA
            PEI   $FD
            JSL   L0D36AD
            PLY
            PLY
            PLY
            BRA   L0D34C3
L0D34B8     LDA   L0F07AD
            BNE   L0D34C0
            DEC   L0F07AF
L0D34C0     DEC   L0F07AD
L0D34C3     PEI   $D2
            PEI   $D0
            PEI   $CE
            PEI   $CC
            JSL   L0D1452
            PLA
            STA   L0F07B5
            PLA
            STA   L0F07B7
            PLA
            STA   L0F07B9
            PLA
            STA   L0F07BB
            PLA
            STA   L0F07BD
            LDA   #L0F07B5
            LDX   #^L0F07B5
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0D34F3     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
L0D34FE     JSL   L0D30A1
            STA   $F6
            LDA   $F6
            CMP   #$0020
            BEQ   L0D34FE
            LDA   $F6
            CMP   #$0009
            BEQ   L0D34FE
            LDA   $F6
            CMP   #$000A
            BEQ   L0D34FE
            LDA   $F6
            TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0D3525     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E2
            TCS
            LDA   $FD
            STA   $EE
            STZ   $EA
            STZ   $E8
            STZ   $E4
            STZ   $E6
            LDA   $FB
            CMP   #$0064
            BEQ   L0D3545
            BRA   L0D354E
L0D3545     LDA   #$000A
            STA   $F0
            BRA   L0D357A
            BRA   L0D3555
L0D354E     CMP   #$006F
            BEQ   L0D3555
            BRA   L0D355E
L0D3555     LDA   #$0008
            STA   $F0
            BRA   L0D357A
            BRA   L0D3565
L0D355E     CMP   #$0078
            BEQ   L0D3565
            BRA   L0D356E
L0D3565     LDA   #$0010
            STA   $F0
            BRA   L0D357A
            BRA   L0D3575
L0D356E     CMP   #$0068
            BEQ   L0D3575
            BRA   L0D357A
L0D3575     LDA   #$000A
            STA   $F0
L0D357A     LDA   $EE
            CMP   #$002D
            BNE   L0D358C
            LDA   #$0001
            STA   $EA
            JSL   L0D30A1
            STA   $EE
L0D358C     LDA   $FF
            BNE   L0D3593
            BRL   L0D3662
L0D3593     PEI   $F0
            PEI   $EE
            JSL   L0D3731
            PLY
            PLY
            STA   $EC
            CMP   #$FFFF
            BNE   L0D35A7
            BRL   L0D3662
L0D35A7     LDA   $F0
            CMP   #$000A
            BNE   L0D35F5
            LDA   $EC
            LDX   #$0000
            CMP   #$0000
            BPL   L0D35B9
            DEX
L0D35B9     PHX
            PHA
            LDX   $E6
            LDA   $E4
            PHX
            PHA
            LDX   #$0000
            LDA   #$0001
            SEC
            JSL   L0D38C1
            PLA
            PLX
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            PHX
            PHA
            LDX   #$0000
            LDA   #$0003
            SEC
            JSL   L0D38C1
            PLA
            PLX
            JSL   L0D1573
            PLA
            PLX
            JSL   L0D1573
            PLA
            PLX
            STA   $E4
            STX   $E6
            BRA   L0D3652
L0D35F5     LDA   $F0
            CMP   #$0008
            BNE   L0D3628
            LDA   $EC
            LDX   #$0000
            CMP   #$0000
            BPL   L0D3607
            DEX
L0D3607     PHX
            PHA
            LDX   $E6
            LDA   $E4
            PHX
            PHA
            LDX   #$0000
            LDA   #$0003
            SEC
            JSL   L0D38C1
            PLA
            PLX
            JSL   L0D1573
            PLA
            PLX
            STA   $E4
            STX   $E6
            BRA   L0D3652
L0D3628     LDA   $EC
            LDX   #$0000
            CMP   #$0000
            BPL   L0D3633
            DEX
L0D3633     PHX
            PHA
            LDX   $E6
            LDA   $E4
            PHX
            PHA
            LDX   #$0000
            LDA   #$0004
            SEC
            JSL   L0D38C1
            PLA
            PLX
            JSL   L0D1573
            PLA
            PLX
            STA   $E4
            STX   $E6
L0D3652     DEC   $FF
            LDA   #$0001
            STA   $E8
            JSL   L0D30A1
            STA   $EE
            BRL   L0D358C
L0D3662     LDA   $E8
            BEQ   L0D366E
            LDA   L0F07B3
            BEQ   L0D366E
            STZ   L0F07B3
L0D366E     LDA   L0F07B1
            BEQ   L0D3686
            LDX   L0F07AB
            LDA   L0F07A9
            PHX
            PHA
            PEI   $EE
            JSL   L0D36AD
            PLY
            PLY
            PLY
            BRA   L0D3691
L0D3686     LDA   L0F07AD
            BNE   L0D368E
            DEC   L0F07AF
L0D368E     DEC   L0F07AD
L0D3691     LDA   $EA
            BEQ   L0D369F
            LDX   $E6
            LDA   $E4
            JSL   L0D16F6
            BRA   L0D36A3
L0D369F     LDX   $E6
            LDA   $E4
L0D36A3     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0D36AD     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            LDX   $FF
            LDA   $FD
            STX   $F2
            ORA   $F2
            BEQ   L0D36E8
            LDY   #$000A
            LDA   [$FD],Y
            AND   #$0080
            TAY
            BNE   L0D36E8
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            PHX
            PHA
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            JSL   L0D157E
            BNE   L0D36ED
L0D36E8     LDA   #$FFFF
            BRA   L0D3727
L0D36ED     LDY   #$0004
            LDA   [$FD],Y
            PHA
            INC
            LDY   #$0004
            STA   [$FD],Y
            PLA
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            SEC
            SBC   #$0001
            STA   [$FD]
            PHA
            LDY   #$0002
            LDA   [$FD],Y
            SBC   #$0000
            TAX
            LDY   #$0002
            STA   [$FD],Y
            PLA
            STA   $F2
            STX   $F4
            LDA   $FB
            SEP   #$20
            STA   [$F2]
            REP   #$20
            AND   #$00FF
L0D3727     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0D3731     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   #$FFFF
            STA   $F2
            LDA   $FD
            SEC
            SBC   #$0030
            BVS   L0D374C
            EOR   #$8000
L0D374C     BPL   L0D3767
            LDA   $FD
            SEC
            SBC   #$0039
            BEQ   L0D375D
            BVS   L0D375B
            EOR   #$8000
L0D375B     BMI   L0D3767
L0D375D     LDA   $FD
            SEC
            SBC   #$0030
            STA   $F2
            BRA   L0D379B
L0D3767     LDA   $FD
            SEC
            SBC   #$0061
            BVS   L0D3772
            EOR   #$8000
L0D3772     BPL   L0D3782
            LDA   $FD
            SEC
            SBC   #$0061
            CLC
            ADC   #$000A
            STA   $F2
            BRA   L0D379B
L0D3782     LDA   $FD
            SEC
            SBC   #$0041
            BVS   L0D378D
            EOR   #$8000
L0D378D     BPL   L0D379B
            LDA   $FD
            SEC
            SBC   #$0041
            CLC
            ADC   #$000A
            STA   $F2
L0D379B     LDA   $F2
            SEC
            SBC   $FF
            BEQ   L0D37AE
            BVS   L0D37A7
            EOR   #$8000
L0D37A7     BPL   L0D37AE
            LDA   #$FFFF
            STA   $F2
L0D37AE     LDA   $F2
            CMP   #$FFFF
            BNE   L0D37BB
            LDA   #$0001
            STA   L0F07B3
L0D37BB     LDA   $F2
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0D37C7     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            LDA   $FF
            BNE   L0D37DB
            LDA   $FF
            BRL   L0D388C
L0D37DB     LDA   $F9
            CMP   #$8300
            BNE   L0D37F6
            PEI   $FF
            PEI   $FD
            PEI   $FB
            JSL   L0D3A7C
            PLY
            PLY
            PLY
            LDA   $FF
            STA   $EE
            BRL   L0D388A
L0D37F6     LDA   $F9
            CMP   #$82FF
            BNE   L0D3805
            LDA   #$FFFF
            STA   $EE
            BRL   L0D388A
L0D3805     LDA   $F9
            CMP   #$82FE
            BNE   L0D3835
            LDA   $FF
            STA   $EE
L0D3810     LDA   $FF
            DEC   $FF
            TAY
            BEQ   L0D3832
            LDX   $FD
            LDA   $FB
            INC   $FB
            BNE   L0D3821
            INC   $FD
L0D3821     STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            PHA
            JSL   L0D3B77
            PLY
            BRA   L0D3810
L0D3832     BRL   L0D388A
L0D3835     LDA   $F9
            STAL  L0F07E7
            LDX   $FD
            LDA   $FB
            STAL  L0F07E9
            PHA
            TXA
            STAL  L0F07EB
            PLA
            LDA   $FF
            LDX   #$0000
            STAL  L0F07ED
            PHA
            TXA
            STAL  L0F07EF
            PLA
            JSL   GSOS
            DW    $0013       ; Write
            ADRL  L0F07E7
            STA   L0F07C5
            LDA   L0F07C5
            BEQ   L0D387F
            LDA   L0F07C5
            CMP   #$004C
            BNE   L0D3878
            STZ   $EE
            BRA   L0D387D
L0D3878     LDA   #$FFFF
            STA   $EE
L0D387D     BRA   L0D388A
L0D387F     LDAL  L0F07F3
            TAX
            LDAL  L0F07F1
            STA   $EE
L0D388A     LDA   $EE
L0D388C     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0D3896     STA   L0F0825
            TSC
            SEC
            SBC   #$000A
            TCS
            LDA   $0A,S
            STA   $00,S
            LDA   $0C,S
            STA   $02,S
            PEA   ^L0F0825
            PEA   L0F0825
            TSC
            CLC
            ADC   #$0008
            PEA   $0000
            PHA
            PEA   $040E
            _SANEFP816
            RTL

L0D38C1     CPX   #$0000
            BEQ   L0D38C9
            LDA   #$0021
L0D38C9     CMP   #$0000
            BEQ   L0D38DD
            TAX
            PHD
            TSC
            TCD
            LDA   $06
L0D38D4     ASL
            ROL   $08
            DEX
            BNE   L0D38D4
            STA   $06
            PLD
L0D38DD     RTL

L0D38DE     CPX   #$0000
            BEQ   L0D38E6
            LDA   #$0021
L0D38E6     CMP   #$0000
            BEQ   L0D38FA
            TAX
            PHD
            TSC
            TCD
            LDA   $06
L0D38F1     LSR   $08
            ROR
            DEX
            BNE   L0D38F1
            STA   $06
            PLD
L0D38FA     RTL

L0D38FB     TAY
            TSC
            SEC
            SBC   #$000A
            TCS
            LDA   $0A,S
            STA   $00,S
            LDA   $0C,S
            STA   $02,S
            PHX
            PHY
            TSC
            CLC
            ADC   #$0008
            PEA   $0000
            PHA
            PEA   $000E
            _SANEFP816
            RTL

L0D3920     TSC
            CLC
            ADC   #$0008
            PEA   $0000
            PHA
            LDA   $0A,S
            PHA
            LDA   $0A,S
            PHA
            PEA   $0210
            _SANEFP816
            LDA   $02,S
            STA   $06,S
            LDA   $00,S
            STA   $04,S
            PLY
            PLY
            RTL

L0D3944     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            STZ   $EE
            BRA   L0D39A3
L0D3953     LDA   $EE
            ASL
            ASL
            ASL
            TAX
            LDAL  L0F06A9,X
            BNE   L0D39A1
            LDA   $EE
            ASL
            ASL
            ASL
            TAX
            LDA   $F9
            STAL  L0F06A9,X
            LDA   $EE
            ASL
            ASL
            ASL
            TAX
            LDA   $FB
            STAL  L0F06AB,X
            LDA   $EE
            ASL
            ASL
            ASL
            PHA
            LDA   #L0F06AD
            STA   $F0
            LDA   #^L0F06AD
            STA   $F2
            PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L0D3991
            INC   $F2
L0D3991     LDX   $FF
            LDA   $FD
            STA   [$F0]
            LDY   #$0002
            PHA
            TXA
            STA   [$F0],Y
            PLA
            BRA   L0D39B0
L0D39A1     INC   $EE
L0D39A3     LDA   $EE
            SEC
            SBC   #$0010
            BVS   L0D39AE
            EOR   #$8000
L0D39AE     BPL   L0D3953
L0D39B0     TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L0D39B8     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            STZ   $F2
L0D39C5     LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            SEC
            SBC   #$0030
            BVS   L0D39DF
            EOR   #$8000
L0D39DF     BPL   L0D3A4B
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            SEC
            SBC   #$0039
            BEQ   L0D39FF
            BVS   L0D39FD
            EOR   #$8000
L0D39FD     BMI   L0D3A4B
L0D39FF     LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            PHA
            LDA   $F2
            PHA
            LDA   #$000A
            SEC
            JSL   L0D151F
            PLA
            PLX
            STX   $F4
            CLC
            ADC   $F4
            SEC
            SBC   #$0030
            STA   $F2
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$FD]
            LDY   #$0002
            LDA   [$FD],Y
            BCC   L0D3A41
            INC
L0D3A41     LDY   #$0002
            STA   [$FD],Y
            PLA
            PLX
            BRL   L0D39C5
L0D3A4B     LDA   $F2
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0D3A57     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            PEI   $FF
            PEI   $FD
            JSL   L0D3E86
            PLY
            PLY
            PHX
            PHA
            JSL   L0D3E65
            PLY
            PLY
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0D3A7C     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
            LDX   #$0000
            LDA   #$C000
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            PHA
            LDX   #$0000
            LDA   #$C010
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            PLX
            STX   $F2
            CMP   $F2
            BEQ   L0D3B05
L0D3AAD     LDX   #$0000
            LDA   #$C010
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            SEC
            SBC   #$007F
            BEQ   L0D3ACB
            BVS   L0D3AC7
            EOR   #$8000
L0D3AC7     BPL   L0D3ACB
            BRA   L0D3AAD
L0D3ACB     LDX   #$0000
            LDA   #$C010
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            SEC
            SBC   #$0080
            BVS   L0D3AE3
            EOR   #$8000
L0D3AE3     BMI   L0D3AE7
            BRA   L0D3ACB
L0D3AE7     LDX   #$0000
            LDA   #$C010
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            SEC
            SBC   #$007F
            BEQ   L0D3B05
            BVS   L0D3B01
            EOR   #$8000
L0D3B01     BPL   L0D3B05
            BRA   L0D3AE7
L0D3B05     LDA   $FF
            DEC   $FF
            TAY
            BEQ   L0D3B43
            LDA   [$FB]
            AND   #$00FF
            CMP   #$000A
            BNE   L0D3B28
            PEA   $000D
            JSL   L0D3EB5
            PLY
            PEA   $000A
            JSL   L0D3EB5
            PLY
            BRA   L0D3B41
L0D3B28     LDX   $FD
            LDA   $FB
            INC   $FB
            BNE   L0D3B32
            INC   $FD
L0D3B32     STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            PHA
            JSL   L0D3EB5
            PLY
L0D3B41     BRA   L0D3B05
L0D3B43     TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0D3B4B     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            PHA
            PHA
            PHA
            PHA
            LDA   #$0007
            PHA
            PHA
            PHA
            LDA   #$C200
            PHA
            _FWEntry
            PLA
            PLA
            PLA
            PLA
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0D3B77     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            PHA
            PHA
            PHA
            PHA
            PEI   $FF
            PHA
            PHA
            LDA   #$C207
            PHA
            _FWEntry
            PLA
            PLA
            PLA
            PLA
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0D3BA1     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F0
            TCS
            STZ   $F4
            LDA   $FF
            SEC
            SBC   #$0000
            BNE   L0D3BB9
            BRL   L0D3C3D
L0D3BB9     BVS   L0D3BBE
            EOR   #$8000
L0D3BBE     BMI   L0D3BC3
            BRL   L0D3C3D
L0D3BC3     PEI   $FF
            JSL   L0D3ED1
            PLY
            STZ   $F2
            BRA   L0D3C13
L0D3BCE     LDA   $F2
            ASL
            ASL
            ASL
            TAX
            LDA   $FF
            STAL  L0F06A9,X
            TAY
            BEQ   L0D3C11
            LDA   $F2
            ASL
            ASL
            ASL
            PHA
            LDA   #L0F06AD
            STA   $F6
            LDA   #^L0F06AD
            STA   $F8
            PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0D3BF7
            INC   $F8
L0D3BF7     LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            PHX
            PHA
            JSL   L0D3E86
            PLY
            PLY
            PHX
            PHA
            JSL   L0D3E65
            PLY
            PLY
            BRA   L0D3C20
L0D3C11     INC   $F2
L0D3C13     LDA   $F2
            SEC
            SBC   #$0010
            BVS   L0D3C1E
            EOR   #$8000
L0D3C1E     BPL   L0D3BCE
L0D3C20     LDA   $FF
            STAL  L0F07E7
            JSL   GSOS
            DW    $0014       ; Close
            ADRL  L0F07E7
            STA   L0F07C5
            LDA   L0F07C5
            BEQ   L0D3C3D
            LDA   #$FFFF
            STA   $F4
L0D3C3D     LDA   $F4
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0D3C49     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EA
            TCS
            LDA   $FF
            STA   $EC
            LDA   $FD
            AND   #$0004
            TAY
            BNE   L0D3C65
            LDA   #$0004
            STA   $EC
L0D3C65     PEA   ^L0F05C2
            PEA   L0F05C2
            PEI   $FB
            PEI   $F9
            JSL   L0D1C7E
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L0D3C7D
            BRL   L0D3D37
L0D3C7D     PEA   ^L0F05C7
            PEA   L0F05C7
            PEI   $FB
            PEI   $F9
            JSL   L0D1C7E
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L0D3C95
            BRL   L0D3D37
L0D3C95     PEA   ^L0F05CC
            PEA   L0F05CC
            PEI   $FB
            PEI   $F9
            JSL   L0D1C7E
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L0D3CAD
            BRL   L0D3D37
L0D3CAD     PEI   $FB
            PEI   $F9
            JSL   L0D3E12
            PLY
            PLY
            PEI   $FB
            PEI   $F9
            JSL   L0D3D48
            PLY
            PLY
            LDX   $FB
            LDA   $F9
            STAL  L0F07CB
            PHA
            TXA
            STAL  L0F07CD
            PLA
            LDA   #$00C3
            STAL  L0F07CF
            LDA   $EC
            STAL  L0F07D1
            LDX   #$0000
            LDA   #$0000
            STAL  L0F07D3
            PHA
            TXA
            STAL  L0F07D5
            PLA
            LDA   #$0001
            STAL  L0F07D7
            LDA   #$0000
            STAL  L0F07D9
            LDA   #$0000
            STAL  L0F07DB
            JSL   GSOS
            DW    $0001       ; Create
            ADRL  L0F07CB
            STA   L0F07C5
            PEI   $FB
            PEI   $F9
            JSL   L0D31F0
            PLY
            PLY
            LDA   L0F07C5
            BEQ   L0D3D26
            LDA   #$FFFF
            STA   $EE
            BRA   L0D3D35
L0D3D26     PEI   $FD
            PEI   $FB
            PEI   $F9
            JSL   L0D30EE
            PLY
            PLY
            PLY
            STA   $EE
L0D3D35     BRA   L0D3D3C
L0D3D37     LDA   #$FFFF
            STA   $EE
L0D3D3C     LDA   $EE
            TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0D3D48     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E8
            TCS
            LDX   $FF
            LDA   $FD
            STA   $EA
            STX   $EC
            LDX   $FF
            LDA   $FD
            STX   $F4
            ORA   $F4
            BEQ   L0D3DA8
L0D3D65     LDA   [$FD]
            AND   #$00FF
            STA   $EE
            LDA   $F0
            PHA
            LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L0D3D79
            INC   $FF
L0D3D79     STA   $F4
            STX   $F6
            PLA
            SEP   #$20
            STA   [$F4]
            REP   #$20
            LDA   $EE
            STA   $F0
            LDA   $EE
            BNE   L0D3D65
            LDX   $EC
            LDA   $EA
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L0D1705
            PLA
            PLX
            SEC
            SBC   #$0001
            PHA
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
L0D3DA8     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0D3DB0     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDY   #$0004
            LDA   [$FD],Y
            DEC
            LDY   #$0004
            STA   [$FD],Y
            SEC
            SBC   #$0000
            BVS   L0D3DCF
            EOR   #$8000
L0D3DCF     BPL   L0D3DFE
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$FD]
            LDY   #$0002
            LDA   [$FD],Y
            BCC   L0D3DE9
            INC
L0D3DE9     LDY   #$0002
            STA   [$FD],Y
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            AND   #$00FF
            BRA   L0D3E08
L0D3DFE     PEI   $FF
            PEI   $FD
            JSL   L0D3F12
            PLY
            PLY
L0D3E08     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0D3E12     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            STZ   $F2
            PEI   $FF
            PEI   $FD
            JSL   L0D3D48
            PLY
            PLY
            LDX   $FF
            LDA   $FD
            STAL  L0F07FB
            PHA
            TXA
            STAL  L0F07FD
            PLA
            JSL   GSOS
            DW    $0002       ; Destroy
            ADRL  L0F07FB
            STA   L0F07C5
            PEI   $FF
            PEI   $FD
            JSL   L0D31F0
            PLY
            PLY
            LDA   L0F07C5
            BEQ   L0D3E59
            LDA   #$FFFF
            STA   $F2
L0D3E59     LDA   $F2
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0D3E65     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            PEI   $FF
            PEI   $FD
            _DisposeHandle
            STA   L0F07C7
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0D3E86     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            PHA
            PHA
            PEI   $FF
            PEI   $FD
            _FindHandle
            STA   L0F07C7
            PLA
            STA   $F0
            PLA
            STA   $F2
            LDX   $F2
            LDA   $F0
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0D3EB5     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            PEI   $FF
            _WriteChar
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0D3ED1     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            STZ   $F4
            BRA   L0D3EFD
L0D3EE0     LDA   $F4
            ASL
            ASL
            ASL
            TAX
            LDAL  L0F06A9,X
            CMP   $FF
            BNE   L0D3EFB
            LDA   $F4
            ASL
            ASL
            ASL
            TAX
            LDA   #$0000
            STAL  L0F06A9,X
L0D3EFB     INC   $F4
L0D3EFD     LDA   $F4
            SEC
            SBC   #$0010
            BVS   L0D3F08
            EOR   #$8000
L0D3F08     BPL   L0D3EE0
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0D3F12     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDY   #$000A
            LDA   [$FD],Y
            AND   #$0001
            TAY
            BNE   L0D3F37
            LDY   #$000A
            LDA   [$FD],Y
            ORA   #$0040
            PHA
            PLA
            LDY   #$000A
            STA   [$FD],Y
L0D3F37     LDY   #$000A
            LDA   [$FD],Y
            AND   #$0060
            TAY
            BEQ   L0D3F69
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            PHX
            PHA
            PLA
            PLX
            STA   [$FD]
            LDY   #$0002
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDA   #$0000
            LDY   #$0004
            STA   [$FD],Y
            LDA   #$FFFF
            BRL   L0D414A
L0D3F69     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            JSL   L0D157E
            BEQ   L0D3F85
            BRL   L0D403E
L0D3F85     LDY   #$000A
            LDA   [$FD],Y
            AND   #$0008
            TAY
            BEQ   L0D3FDE
            LDA   #L0F05DF
            LDX   #^L0F05DF
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L0D1705
            PLA
            PLX
            PHX
            PHA
            LDX   #$0000
            LDA   #$0014
            SEC
            JSL   L0D15C0
            PLY
            PLY
            TAX
            TXA
            CLC
            ADC   #L0F077B
            LDX   #^L0F077B
            BCC   L0D3FBD
            INX
L0D3FBD     PHX
            PHA
            PLA
            PLX
            STA   [$FD]
            LDY   #$0002
            PHA
            TXA
            STA   [$FD],Y
            PLA
            PHX
            PHA
            PLA
            PLX
            LDY   #$0006
            STA   [$FD],Y
            LDY   #$0008
            PHA
            TXA
            STA   [$FD],Y
            PLA
            BRA   L0D403B
L0D3FDE     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDY   #$0012
            LDA   [$FD],Y
            LDX   #$0000
            PHX
            PHA
            JSL   L0D1B13
            PLY
            PLY
            PHX
            PHA
            PLA
            PLX
            STA   [$FD]
            LDY   #$0002
            PHA
            TXA
            STA   [$FD],Y
            PLA
            PHX
            PHA
            PLA
            PLX
            LDY   #$0006
            STA   [$FD],Y
            LDY   #$0008
            PHA
            TXA
            STA   [$FD],Y
            PLA
            JSL   L0D157E
            BNE   L0D402C
            LDY   #$000A
            LDA   [$FD],Y
            ORA   #$0008
            PHA
            PLA
            LDY   #$000A
            STA   [$FD],Y
            BRA   L0D403B
L0D402C     LDY   #$000A
            LDA   [$FD],Y
            ORA   #$0010
            PHA
            PLA
            LDY   #$000A
            STA   [$FD],Y
L0D403B     BRL   L0D3F69
L0D403E     LDX   $FF
            LDA   $FD
            STA   $F0
            STX   $F2
            PEA   $0001
            PEA   $0000
            PEA   $0000
            LDY   #$000C
            LDA   [$FD],Y
            PHA
            JSL   L0D2D51
            PLY
            PLY
            PLY
            PLY
            PHX
            PHA
            PLA
            PLX
            LDY   #$000E
            STA   [$F0],Y
            LDY   #$0010
            PHA
            TXA
            STA   [$F0],Y
            PLA
            LDY   #$0008
            LDA   [$FD],Y
            TAX
            LDY   #$0006
            LDA   [$FD],Y
            PHX
            PHA
            PLA
            PLX
            STA   [$FD]
            LDY   #$0002
            PHA
            TXA
            STA   [$FD],Y
            PLA
            LDY   #$000C
            LDA   [$FD],Y
            CMP   #$8300
            BNE   L0D409D
            PEA   ^L0F05F3
            PEA   L0F05F3
            JSL   L0D299C
            PLY
            PLY
L0D409D     LDY   #$000A
            LDA   [$FD],Y
            AND   #$0108
            TAY
            BEQ   L0D40AD
            LDA   #$0001
            BRA   L0D40B2
L0D40AD     LDY   #$0012
            LDA   [$FD],Y
L0D40B2     PHA
            LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            PHX
            PHA
            LDY   #$000C
            LDA   [$FD],Y
            PHA
            JSL   L0D4154
            PLY
            PLY
            PLY
            PLY
            PHA
            PLA
            LDY   #$0004
            STA   [$FD],Y
            LDY   #$0004
            LDA   [$FD],Y
            DEC
            LDY   #$0004
            STA   [$FD],Y
            SEC
            SBC   #$0000
            BVS   L0D40E6
            EOR   #$8000
L0D40E6     BMI   L0D411F
            LDY   #$0004
            LDA   [$FD],Y
            CMP   #$FFFF
            BNE   L0D4103
            LDY   #$000A
            LDA   [$FD],Y
            ORA   #$0020
            PHA
            PLA
            LDY   #$000A
            STA   [$FD],Y
            BRA   L0D4112
L0D4103     LDY   #$000A
            LDA   [$FD],Y
            ORA   #$0040
            PHA
            PLA
            LDY   #$000A
            STA   [$FD],Y
L0D4112     LDA   #$0000
            LDY   #$0004
            STA   [$FD],Y
            LDA   #$FFFF
            BRA   L0D414A
L0D411F     LDY   #$0002
            LDA   [$FD],Y
            TAX
            LDA   [$FD]
            PHX
            PHA
            CLC
            ADC   #$0001
            STA   [$FD]
            LDY   #$0002
            LDA   [$FD],Y
            BCC   L0D4137
            INC
L0D4137     LDY   #$0002
            STA   [$FD],Y
            PLA
            PLX
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            AND   #$00FF
L0D414A     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0D4154     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E8
            TCS
            LDX   $FD
            LDA   $FB
            STA   $EA
            STX   $EC
            LDA   $F9
            CMP   #$8300
            BNE   L0D41AE
            STZ   $EE
L0D4170     LDA   $FF
            DEC   $FF
            TAY
            BEQ   L0D419C
            PEI   $F9
            JSL   L0D427E
            PLY
            PHA
            PLA
            SEP   #$20
            STA   [$EA]
            REP   #$20
            AND   #$00FF
            CMP   #$FFFF
            BNE   L0D4192
            BRA   L0D419C
            BRA   L0D419A
L0D4192     INC   $EA
            BNE   L0D4198
            INC   $EC
L0D4198     INC   $EE
L0D419A     BRA   L0D4170
L0D419C     LDA   $EE
            BNE   L0D41A6
            LDA   #$FFFF
            BRL   L0D4245
L0D41A6     LDA   $EE
            BRL   L0D4245
            BRL   L0D4243
L0D41AE     LDA   $F9
            CMP   #$82FF
            BNE   L0D41BD
            LDA   #$FFFF
            STA   $EE
            BRL   L0D4243
L0D41BD     LDA   $F9
            CMP   #$82FE
            BNE   L0D41EE
            LDA   $FF
            STA   $EE
L0D41C8     LDA   $FF
            DEC   $FF
            TAY
            BEQ   L0D41EB
            JSL   L0D424F
            PHA
            LDX   $EC
            LDA   $EA
            INC   $EA
            BNE   L0D41DE
            INC   $EC
L0D41DE     STA   $F0
            STX   $F2
            PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            BRA   L0D41C8
L0D41EB     BRL   L0D4243
L0D41EE     LDA   $F9
            STAL  L0F07E7
            LDX   $FD
            LDA   $FB
            STAL  L0F07E9
            PHA
            TXA
            STAL  L0F07EB
            PLA
            LDA   $FF
            LDX   #$0000
            STAL  L0F07ED
            PHA
            TXA
            STAL  L0F07EF
            PLA
            JSL   GSOS
            DW    $0012       ; Read
            ADRL  L0F07E7
            STA   L0F07C5
            LDA   L0F07C5
            BEQ   L0D4238
            LDA   L0F07C5
            CMP   #$004C
            BNE   L0D4231
            STZ   $EE
            BRA   L0D4236
L0D4231     LDA   #$FFFF
            STA   $EE
L0D4236     BRA   L0D4243
L0D4238     LDAL  L0F07F3
            TAX
            LDAL  L0F07F1
            STA   $EE
L0D4243     LDA   $EE
L0D4245     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0D424F     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PHA
            PHA
            PHA
            PHA
            PHA
            PHA
            PHA
            LDA   #$C205
            PHA
            _FWEntry
            PLA
            PLA
            PLA
            STA   $F6
            PLA
            LDA   $F6
            TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0D427E     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            CMP   #$8300
            BEQ   L0D4293
            BRL   L0D43B7
L0D4293     LDA   L0F05D1
            CMP   L0F05D3
            BEQ   L0D429E
            BRL   L0D4391
L0D429E     LDA   #$0000
            STA   L0F05D3
            STA   L0F05D1
L0D42A7     LDA   #$0001
            BNE   L0D42AF
            BRL   L0D4373
L0D42AF     PEA   $0000
            JSL   L0D43C1
            PLY
            AND   #$007F
            STA   $F4
            LDA   $F4
            CMP   #$0008
            BNE   L0D42E6
            LDA   L0F05D1
            BEQ   L0D42E3
            DEC   L0F05D1
            PEA   $0008
            JSL   L0D3EB5
            PLY
            PEA   $0020
            JSL   L0D3EB5
            PLY
            PEA   $0008
            JSL   L0D3EB5
            PLY
L0D42E3     BRL   L0D4370
L0D42E6     LDA   $F4
            CMP   #$000D
            BNE   L0D4315
            LDA   L0F05D1
            PHA
            INC
            STA   L0F05D1
            PLA
            TAX
            LDA   #$000A
            SEP   #$20
            STAL  L0F0729,X
            REP   #$20
            PEA   $000D
            JSL   L0D3EB5
            PLY
            PEA   $000A
            JSL   L0D3EB5
            PLY
            BRL   L0D4373
L0D4315     LDA   $F4
            CMP   #$0003
            BNE   L0D4324
            PEA   $0002
            JSL   L0D43E5
            PLY
L0D4324     LDA   $F4
            CMP   #$001A
            BNE   L0D4353
            LDA   $F4
            PHA
            LDA   L0F05D1
            PHA
            INC
            STA   L0F05D1
            PLA
            TAX
            PLA
            SEP   #$20
            STAL  L0F0729,X
            REP   #$20
            PEA   $000D
            JSL   L0D3EB5
            PLY
            PEA   $000A
            JSL   L0D3EB5
            PLY
            BRA   L0D4373
L0D4353     LDA   $F4
            PHA
            LDA   L0F05D1
            PHA
            INC
            STA   L0F05D1
            PLA
            TAX
            PLA
            SEP   #$20
            STAL  L0F0729,X
            REP   #$20
            PEI   $F4
            JSL   L0D3EB5
            PLY
L0D4370     BRL   L0D42A7
L0D4373     LDX   #$0000
            LDA   #$C010
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            SEC
            SBC   #$007F
            BEQ   L0D4391
            BVS   L0D438D
            EOR   #$8000
L0D438D     BPL   L0D4391
            BRA   L0D4373
L0D4391     LDA   L0F05D3
            TAX
            LDAL  L0F0729,X
            AND   #$00FF
            CMP   #$001A
            BNE   L0D43A6
            LDA   #$FFFF
            BRA   L0D43B7
L0D43A6     LDA   L0F05D3
            PHA
            INC
            STA   L0F05D3
            PLA
            TAX
            LDAL  L0F0729,X
            AND   #$00FF
L0D43B7     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0D43C1     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            PHA
            PEI   $FF
            _ReadChar
            PLA
            STA   $F4
            LDA   $F4
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0D43E5     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EE
            TCS
            LDA   #L0F05DF
            LDX   #^L0F05DF
            STA   $F0
            STX   $F2
            BRA   L0D441D
L0D43FC     LDY   #$000A
            LDA   [$F0],Y
            AND   #$0003
            TAY
            BEQ   L0D4411
            PEI   $F2
            PEI   $F0
            JSL   L0D25CB
            PLY
            PLY
L0D4411     LDA   $F0
            CLC
            ADC   #$0014
            STA   $F0
            BCC   L0D441D
            INC   $F2
L0D441D     LDX   #$0000
            LDA   #$00A0
            PHX
            PHA
            LDA   #L0F05DF
            LDX   #^L0F05DF
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            LDX   $F2
            LDA   $F0
            JSL   L0D157E
            BEQ   L0D4444
            BVS   L0D4442
            EOR   #$8000
L0D4442     BMI   L0D43FC
L0D4444     STZ   $F4
            BRA   L0D4471
L0D4448     LDA   $F4
            ASL
            ASL
            ASL
            TAX
            LDAL  L0F06A9,X
            SEC
            SBC   #$0000
            BEQ   L0D446F
            BVS   L0D445D
            EOR   #$8000
L0D445D     BPL   L0D446F
            LDA   $F4
            ASL
            ASL
            ASL
            TAX
            LDAL  L0F06A9,X
            PHA
            JSL   L0D3BA1
            PLY
L0D446F     INC   $F4
L0D4471     LDA   $F4
            SEC
            SBC   #$0010
            BVS   L0D447C
            EOR   #$8000
L0D447C     BPL   L0D4448
            PEI   $FF
            JSL   L0D448D
            PLY
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0D448D     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            PEA   $0001
            PEA   ^L010153
            PEA   L010153
            JSL   L0D44B0
            PLY
            PLY
            PLY
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0D44B0     TSC
            TCD
            LDA   [$04]
            TAX
            LDA   $04,S
            TAY
            LDA   $06,S
            TCD
            LDA   $08,S
            TXS
            PHA
            PHA
            PHD
            PHY
            TSC
            TCD
            LDY   #$0002
            LDA   [$01],Y
            TAX
            INY
            INY
            LDA   [$01],Y
            STA   $08,S
            INY
            INY
            LDA   [$01],Y
            STA   $0A,S
            PLA
            PLA
            PLA
            PLY
            CMP   #$0000
            BNE   L0D44E0
            INC
L0D44E0     PHX
            PLD
            RTL


