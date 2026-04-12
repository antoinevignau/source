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

	use	B.X.S
	
GSOS	=	$E100A8

*-----------------------------------

L040000     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00BF
            TCS
            LDA   #L0E0A9E
            LDX   #^L0E0A9E
            STX   L0F0034
            STA   L0F0032
            LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            LDX   $F2
            LDA   #$00BA
            CLC
            ADC   $F0
            BCC   L04002C
            INX
L04002C     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            PLA
            PLX
            LDY   #$0A10
            PHA
            TXA
            STA   [$F0],Y
            PLA
            LDY   #$0A0E
            STA   [$F0],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDX   $F2
            LDA   #$045C
            CLC
            ADC   $F0
            BCC   L04005C
            INX
L04005C     STX   L0F002C
            STA   L0F002A
            PEA   $0000
            PEA   $0000
            LDA   $F9
            ASL
            TAX
            LDAL  L0E0046,X
            PHA
            PEA   $0001
            JSL   L081620
            PLY
            PLY
            PLY
            PLY
            LDX   L0F00C1
            LDA   L0F00BF
            STX   $D6
            STA   $D4
            LDX   L0F00C1
            LDA   L0F00BF
            STA   $F0
            STX   $F2
            LDY   #$0008
            LDA   [$F0],Y
            LDX   #$0000
            TAY
            BPL   L04009C
            DEX
L04009C     PHX
            PHA
            LDX   $D6
            LDA   $D4
            JSL   L0D1573
            PLA
            PLX
            STX   $D6
            STA   $D4
            PEI   $D6
            PEI   $D4
            JSL   L0C04CD
            PLY
            PLY
            STA   $EE
            STZ   $EC
            LDA   #L0E2A36
            LDX   #^L0E2A36
            STX   $D2
            STA   $D0
            PEA   $0000
            JSL   L01141C
            PLY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L0F00CD
            PEA   L0F00CD
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
L0400EA     LDA   #$0001
            BNE   L0400F2
            BRL   L040573
L0400F2     LDA   $EC
            SEC
            SBC   $EE
            BVS   L0400FC
            EOR   #$8000
L0400FC     BMI   L040101
            BRL   L0401D2
L040101     PEA   $0000
            PEA   $0008
            LDA   #L0F00CD
            LDX   #^L0F00CD
            PHX
            PHA
            LDX   #$0000
            LDA   #$0008
            PHX
            PHA
            LDX   $D2
            LDA   $D0
            JSL   L0D1705
            PLA
            PLX
            PHX
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   L0F00D3
            PHA
            LDA   L0F00D1
            PHA
            LDA   L0F00CF
            PHA
            LDA   L0F00CD
            PHA
            JSL   L0D1452
            PEA   ^L0E50CC
            PEA   L0E50CC
            PEI   $FD
            PEI   $FB
            JSL   L0D1BB9
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   L0F00D3
            PHA
            LDA   L0F00D1
            PHA
            LDA   L0F00CF
            PHA
            LDA   L0F00CD
            PHA
            JSL   L0D1452
            JSL   L0D13C6
            BEQ   L040184
            BRA   L040196
L040184     PEA   ^L0E50D2
            PEA   L0E50D2
            PEI   $FD
            PEI   $FB
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L040196     PEA   ^L0E50D6
            PEA   L0E50D6
            PEI   $FD
            PEI   $FB
            JSL   L0D1C7E
            PLY
            PLY
            PLY
            PLY
            CMP   #$0000
            BNE   L0401BF
            PEA   ^L0E50D9
            PEA   L0E50D9
            PEI   $FD
            PEI   $FB
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0401BF     PEI   $FD
            PEI   $FB
            JSL   L0C04CD
            PLY
            PLY
            BRL   L040573
            BRL   L040573
            BRL   L040570
L0401D2     LDA   [$D4]
            AND   #$00FF
            STA   $EA
            LDA   $EA
            CMP   #$007E
            BEQ   L0401E3
            BRL   L0403E9
L0401E3     LDX   #$0000
            LDA   #$0008
            PHX
            PHA
            LDX   $D2
            LDA   $D0
            JSL   L0D1705
            PLA
            PLX
            STX   $D2
            STA   $D0
            PEA   $0000
            PEA   $0008
            LDX   #$0000
            TDC
            CLC
            ADC   #$00D8
            PHX
            PHA
            PEI   $D2
            PEI   $D0
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   #$0000
            LDA   #$0008
            PHX
            PHA
            LDX   $D2
            LDA   $D0
            JSL   L0D1705
            PLA
            PLX
            STX   $D2
            STA   $D0
            PEA   $0000
            PEA   $0008
            LDX   #$0000
            TDC
            CLC
            ADC   #$00E0
            PHX
            PHA
            PEI   $D2
            PEI   $D0
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $D6
            LDA   $D4
            JSL   L0D1573
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            SEP   #$20
            STA   $CD
            REP   #$20
            LDA   $CD
            AND   #$00FF
            STA   $CE
            LDX   #$0000
            LDA   #$0002
            PHX
            PHA
            LDX   $D6
            LDA   $D4
            JSL   L0D1573
            PLA
            PLX
            STX   $D6
            STA   $D4
            LDA   $EC
            CLC
            ADC   #$0002
            STA   $EC
            LDA   $CE
            CMP   #$002B
            BEQ   L04029E
            BRA   L0402CE
L04029E     PEI   $E6
            PEI   $E4
            PEI   $E2
            PEI   $E0
            JSL   L0D1452
            PEI   $DE
            PEI   $DC
            PEI   $DA
            PEI   $D8
            JSL   L0D1452
            JSL   L0D139E
            PEA   ^L0F00CD
            PEA   L0F00CD
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
            BRL   L0403B0
            BRA   L0402D5
L0402CE     CMP   #$002D
            BEQ   L0402D5
            BRA   L040305
L0402D5     PEI   $E6
            PEI   $E4
            PEI   $E2
            PEI   $E0
            JSL   L0D1452
            PEI   $DE
            PEI   $DC
            PEI   $DA
            PEI   $D8
            JSL   L0D1452
            JSL   L0D148E
            PEA   ^L0F00CD
            PEA   L0F00CD
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
            BRL   L0403B0
            BRA   L04030C
L040305     CMP   #$002A
            BEQ   L04030C
            BRA   L04033C
L04030C     PEI   $E6
            PEI   $E4
            PEI   $E2
            PEI   $E0
            JSL   L0D1452
            PEI   $DE
            PEI   $DC
            PEI   $DA
            PEI   $D8
            JSL   L0D1452
            JSL   L0D142A
            PEA   ^L0F00CD
            PEA   L0F00CD
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
            BRL   L0403B0
            BRA   L040344
L04033C     CMP   #$002F
            BEQ   L040344
            BRL   L0403B0
L040344     PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEI   $DE
            PEI   $DC
            PEI   $DA
            PEI   $D8
            JSL   L0D1452
            JSL   L0D13C6
            BEQ   L040392
            PEI   $E6
            PEI   $E4
            PEI   $E2
            PEI   $E0
            JSL   L0D1452
            PEI   $DE
            PEI   $DC
            PEI   $DA
            PEI   $D8
            JSL   L0D1452
            JSL   L0D1402
            PEA   ^L0F00CD
            PEA   L0F00CD
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
            BRA   L0403B0
L040392     PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L0F00CD
            PEA   L0F00CD
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
L0403B0     PEA   $0000
            PEA   $0008
            PEI   $D2
            PEI   $D0
            LDA   #L0F00CD
            LDX   #^L0F00CD
            PHX
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   #$0000
            LDA   #$0008
            PHX
            PHA
            LDX   $D2
            LDA   $D0
            JSL   L0D1573
            PLA
            PLX
            STX   $D2
            STA   $D0
            BRL   L040570
            BRA   L0403F1
L0403E9     CMP   #$007F
            BEQ   L0403F1
            BRL   L04056D
L0403F1     LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $D6
            LDA   $D4
            JSL   L0D1573
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            STA   $E8
            LDA   $E8
            SEC
            SBC   #$0030
            STA   $E8
            PEI   $E8
            JSL   L04057D
            PLY
            PEA   $0000
            PEA   $0008
            PEI   $D2
            PEI   $D0
            LDA   #L0F00CD
            LDX   #^L0F00CD
            PHX
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   #$0000
            LDA   #$0008
            PHX
            PHA
            LDX   $D2
            LDA   $D0
            JSL   L0D1573
            PLA
            PLX
            STX   $D2
            STA   $D0
            LDX   #$0000
            LDA   #$0002
            PHX
            PHA
            LDX   $D6
            LDA   $D4
            JSL   L0D1573
            PLA
            PLX
            STX   $D6
            STA   $D4
            LDA   $EC
            CLC
            ADC   #$0002
            STA   $EC
            BRL   L040570
L040472     LDA   $EA
            LDX   #$0000
            PHX
            PHA
            LDX   $D6
            LDA   $D4
            JSL   L0D1573
            PLA
            PLX
            STA   $F0
            STX   $F2
            LDA   [$F0]
            AND   #$00FF
            CMP   #$0025
            BNE   L040498
            LDA   #$0001
            STA   $C3
            BRA   L04049A
L040498     STZ   $C3
L04049A     PEA   $0000
            TDC
            CLC
            ADC   #$00C5
            PHA
            PEA   ^L0E50DD
            PEA   L0E50DD
            LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $D6
            LDA   $D4
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            JSL   L0D1BE1
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $C3
            BEQ   L0404FE
            PEI   $CB
            PEI   $C9
            PEI   $C7
            PEI   $C5
            JSL   L0D1452
            PEA   $4005
            PEA   $C800
            PEA   $0000
            PEA   $0000
            PEA   $0000
            JSL   L0D1402
            PEA   $0000
            TDC
            CLC
            ADC   #$00C5
            PHA
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
L0404FE     PEA   $0000
            PEA   $0008
            PEI   $D2
            PEI   $D0
            LDX   #$0000
            TDC
            CLC
            ADC   #$00C5
            PHX
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $EA
            LDX   #$0000
            TAY
            BPL   L040527
            DEX
L040527     CLC
            ADC   #$0001
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDX   $D6
            LDA   $D4
            JSL   L0D1573
            PLA
            PLX
            STX   $D6
            STA   $D4
            LDA   $EA
            CLC
            ADC   #$0001
            PHA
            LDA   $EC
            PLX
            STX   $F0
            CLC
            ADC   $F0
            STA   $EC
            LDX   #$0000
            LDA   #$0008
            PHX
            PHA
            LDX   $D2
            LDA   $D0
            JSL   L0D1573
            PLA
            PLX
            STX   $D2
            STA   $D0
            BRA   L040570
            BRA   L040570
L04056D     BRL   L040472
L040570     BRL   L0400EA
L040573     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L04057D     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$090E
            BCC   L04059D
            INX
L04059D     PHX
            PHA
            LDX   L0F00AD
            LDA   L0F00AB
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F4
            PHA
            PEI   $FF
            JSL   L0721E0
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            LDA   $F4
            SEC
            SBC   #$0002
            BVS   L0405C9
            EOR   #$8000
L0405C9     BMI   L0405EB
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L0F00CD
            PEA   L0F00CD
            JSL   L0D1710
            PLY
            PLY
            PLY
            PLY
            PLY
            BRA   L04061A
L0405EB     PEA   ^L0F00CD
            PEA   L0F00CD
            PEA   ^L0E50E1
            PEA   L0E50E1
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$090E
            BCC   L04060C
            INX
L04060C     PHX
            PHA
            JSL   L0D1BE1
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L04061A     TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L040622     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   #$0001
            SEP   #$20
            STAL  L0E5107
            REP   #$20
            LDA   $FF
            AND   #$00FF
            SEP   #$20
            STAL  L0E5108
            REP   #$20
            LDA   #L0E0A9E
            LDX   #^L0E0A9E
            STX   L0F0034
            STA   L0F0032
            PEA   $0000
            JSL   L011C24
            PLY
            PEA   $0082
            PEA   $002C
            PEA   ^L0E50E5
            PEA   L0E50E5
            PEA   $0000
            PEA   $0000
            PEA   ^L0E5107
            PEA   L0E5107
            PEA   ^L0E3009
            PEA   L0E3009
            _SFGetFile
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDAL  L0E3009
            BEQ   L0406B8
            PEA   ^L0E301F
            PEA   L0E301F
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
            LDA   #$0008
            STA   L0F0012
            STZ   L0F00E1
            BRA   L0406BE
L0406B8     LDA   #$0001
            STA   L0F00E1
L0406BE     PEA   $0000
            JSL   L01141C
            PLY
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL


