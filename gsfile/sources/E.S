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

	use	E.X.S
	
GSOS	=	$E100A8

*-----------------------------------

L0A0000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            LDA   L0F0135
            PLX
            STX   $F8
            SEC
            SBC   $F8
            PHA
            PEA   $001E
            JSL   L011FF5
            PLY
            SEC
            JSL   L0D14B6
            PLY
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0008
            STA   [$F8],Y
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0016
            LDA   [$F8],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            PLX
            STX   $F8
            CLC
            ADC   $F8
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0006
            STA   [$F8],Y
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0006
            LDA   [$F8],Y
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   #$0050
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A00A7
            INC   $FA
L0A00A7     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A00B1
            INC   $FA
L0A00B1     LDA   [$F8]
            SEC
            SBC   #$0000
            BNE   L0A00BC
            BRL   L0A02ED
L0A00BC     BVS   L0A00C1
            EOR   #$8000
L0A00C1     BMI   L0A00C6
            BRL   L0A02ED
L0A00C6     STZ   $F6
            STZ   $F4
L0A00CA     LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0006
            LDA   [$F8],Y
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   #$0050
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A00F3
            INC   $FA
L0A00F3     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A00FD
            INC   $FA
L0A00FD     LDA   [$F8]
            SEC
            SBC   $F6
            BNE   L0A0107
            BRL   L0A02ED
L0A0107     BVS   L0A010C
            EOR   #$8000
L0A010C     BMI   L0A0111
            BRL   L0A02ED
L0A0111     PEI   $F4
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0006
            LDA   [$F8],Y
            PHA
            JSL   L08340A
            PLY
            PLY
            TAY
            BNE   L0A012F
            BRL   L0A02E2
L0A012F     LDA   $F4
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   #$0056
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A014B
            INC   $FA
L0A014B     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A0155
            INC   $FA
L0A0155     LDA   [$F8]
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0014
            STA   [$F8],Y
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            PHA
            PEA   $001E
            JSL   L011FF5
            PLY
            SEC
            JSL   L0D151F
            PLA
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STA   $F2
            PEA   $0018
            JSL   L011FF5
            PLY
            PHA
            LDA   $F2
            PLX
            STX   $F8
            CLC
            ADC   $F8
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0014
            LDA   [$F8],Y
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   #$0054
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A01DB
            INC   $FA
L0A01DB     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A01E5
            INC   $FA
L0A01E5     LDA   [$F8]
            PHA
            PEI   $F2
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0014
            LDA   [$F8],Y
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   #$0052
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A0215
            INC   $FA
L0A0215     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A021F
            INC   $FA
L0A021F     LDA   [$F8]
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$000C
            BCC   L0A0237
            INX
L0A0237     PHX
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$000C
            BCC   L0A025A
            INX
L0A025A     PHX
            PHA
            LDA   L0F0135
            PHA
            LDA   L0F0133
            PHA
            JSL   L0C0B8E
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L0A0272
            BRL   L0A02DA
L0A0272     LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0006
            LDA   [$F8],Y
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   #$0050
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A029B
            INC   $FA
L0A029B     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A02A5
            INC   $FA
L0A02A5     LDA   [$F8]
            STA   $F6
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   $F4
            LDY   #$000A
            STA   [$F8],Y
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0014
            LDA   [$F8],Y
            PHA
            JSL   L0A02F5
            PLY
            STA   L0F0129
            JSL   L0A0736
            BRA   L0A02ED
            BRA   L0A02E2
L0A02DA     LDA   $F6
            CLC
            ADC   #$0001
            STA   $F6
L0A02E2     LDA   $F4
            CLC
            ADC   #$0001
            STA   $F4
            BRL   L0A00CA
L0A02ED     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0A02F5     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EC
            TCS
            PEA   $0000
            PEA   $0008
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$000C
            BCC   L0A0324
            INX
L0A0324     PHX
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F6
            STX   $F8
            LDA   #$0052
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A0350
            INC   $F8
L0A0350     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A035A
            INC   $F8
L0A035A     LDA   [$F6]
            CLC
            ADC   #$0002
            SEC
            SBC   L0F0133
            BEQ   L0A03AC
            BVS   L0A036B
            EOR   #$8000
L0A036B     BPL   L0A03AC
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F6
            STX   $F8
            LDA   #$0052
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A038B
            INC   $F8
L0A038B     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A0395
            INC   $F8
L0A0395     LDA   [$F6]
            SEC
            SBC   #$0006
            SEC
            SBC   L0F0133
            BVS   L0A03A4
            EOR   #$8000
L0A03A4     BMI   L0A03AC
            LDA   #$0001
            BRL   L0A050E
L0A03AC     LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F6
            STX   $F8
            LDA   #$0054
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A03CA
            INC   $F8
L0A03CA     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A03D4
            INC   $F8
L0A03D4     LDA   [$F6]
            CLC
            ADC   #$0004
            SEC
            SBC   L0F0133
            BEQ   L0A0426
            BVS   L0A03E5
            EOR   #$8000
L0A03E5     BPL   L0A0426
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F6
            STX   $F8
            LDA   #$0054
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A0405
            INC   $F8
L0A0405     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A040F
            INC   $F8
L0A040F     LDA   [$F6]
            SEC
            SBC   #$0004
            SEC
            SBC   L0F0133
            BVS   L0A041E
            EOR   #$8000
L0A041E     BMI   L0A0426
            LDA   #$0002
            BRL   L0A050E
L0A0426     LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F6
            STX   $F8
            LDA   #$0056
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A0444
            INC   $F8
L0A0444     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A044E
            INC   $F8
L0A044E     LDA   [$F6]
            PHA
            LDA   $F4
            PLX
            STX   $F6
            SEC
            SBC   $F6
            CLC
            ADC   #$0002
            SEC
            SBC   L0F0133
            BEQ   L0A04B1
            BVS   L0A0468
            EOR   #$8000
L0A0468     BPL   L0A04B1
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F6
            STX   $F8
            LDA   #$0056
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A0488
            INC   $F8
L0A0488     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A0492
            INC   $F8
L0A0492     LDA   [$F6]
            PHA
            LDA   $F4
            PLX
            STX   $F6
            SEC
            SBC   $F6
            SEC
            SBC   #$0006
            SEC
            SBC   L0F0133
            BVS   L0A04AA
            EOR   #$8000
L0A04AA     BMI   L0A04B1
            LDA   #$0003
            BRA   L0A050E
L0A04B1     LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F6
            STX   $F8
            LDA   #$0056
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A04CF
            INC   $F8
L0A04CF     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A04D9
            INC   $F8
L0A04D9     LDA   [$F6]
            CLC
            ADC   #$0002
            PHA
            LDA   $F4
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   $F4
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            LDA   L0F0135
            PHA
            LDA   L0F0133
            PHA
            JSL   L0C0B8E
            PLY
            PLY
            PLY
            PLY
            TAY
            BEQ   L0A050B
            LDA   #$0006
            BRA   L0A050E
L0A050B     LDA   #$0000
L0A050E     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0A0518     ENT
            PHD
            TSC
            SEC
            SBC   #$00EB
            TCD
            ADC   #$00C4
            TCS
            PHA
            _GetPenMode
            STA   L0F0779
            PLA
            STA   $CE
            PEA   $8002
            _SetPenMode
            STA   L0F0779
            PEI   $FB
            PEI   $F9
            PEI   $F3
            PEI   $F1
            JSL   L0C0A98
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEI   $F7
            PEI   $F5
            JSL   L0C0A98
            PLY
            PLY
            PLY
            PLY
            LDA   L0F0133
            STA   $D6
            LDA   L0F0135
            STA   $D4
            STZ   $DA
            STZ   $D8
            PEI   $FB
            PEI   $F9
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            JSL   L0C0BFE
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            _FrameRect
            STA   L0F0779
L0A0599     PHA
            PEA   $0000
            _StillDown
            STA   L0F0779
            PLA
            TAY
            BNE   L0A05AE
            BRL   L0A06D4
L0A05AE     PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            _GetMouse
            STA   L0F0779
            LDA   $D2
            SEC
            SBC   $D6
            STA   $DE
            LDA   $DE
            SEC
            SBC   #$0000
            BVS   L0A05D3
            EOR   #$8000
L0A05D3     BMI   L0A05DD
            LDA   $DE
            EOR   #$FFFF
            INC
            BRA   L0A05DF
L0A05DD     LDA   $DE
L0A05DF     SEC
            SBC   $FD
            BVS   L0A05E7
            EOR   #$8000
L0A05E7     BPL   L0A0615
            LDY   #$0002
            LDA   [$F9],Y
            CLC
            ADC   $DA
            CLC
            ADC   $DE
            SEC
            SBC   $E2
            BVS   L0A05FC
            EOR   #$8000
L0A05FC     BPL   L0A0615
            LDY   #$0006
            LDA   [$F9],Y
            CLC
            ADC   $DA
            CLC
            ADC   $DE
            SEC
            SBC   $E6
            BEQ   L0A0617
            BVS   L0A0613
            EOR   #$8000
L0A0613     BPL   L0A0617
L0A0615     STZ   $DE
L0A0617     LDA   $D0
            SEC
            SBC   $D4
            STA   $DC
            LDA   $DC
            SEC
            SBC   #$0000
            BVS   L0A0629
            EOR   #$8000
L0A0629     BMI   L0A0633
            LDA   $DC
            EOR   #$FFFF
            INC
            BRA   L0A0635
L0A0633     LDA   $DC
L0A0635     SEC
            SBC   $FF
            BVS   L0A063D
            EOR   #$8000
L0A063D     BPL   L0A0668
            LDA   [$F9]
            CLC
            ADC   $D8
            CLC
            ADC   $DC
            SEC
            SBC   $E0
            BVS   L0A064F
            EOR   #$8000
L0A064F     BPL   L0A0668
            LDY   #$0004
            LDA   [$F9],Y
            CLC
            ADC   $D8
            CLC
            ADC   $DC
            SEC
            SBC   $E4
            BEQ   L0A066A
            BVS   L0A0666
            EOR   #$8000
L0A0666     BPL   L0A066A
L0A0668     STZ   $DC
L0A066A     LDA   $DE
            CMP   #$0000
            BNE   L0A0678
            LDA   $DC
            CMP   #$0000
            BEQ   L0A06D1
L0A0678     PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            _FrameRect
            STA   L0F0779
            LDA   $DA
            CLC
            ADC   $DE
            STA   $DA
            LDA   $D8
            CLC
            ADC   $DC
            STA   $D8
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            PEI   $DE
            PEI   $DC
            _OffsetRect
            STA   L0F0779
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            _FrameRect
            STA   L0F0779
            LDA   $D6
            CLC
            ADC   $DE
            STA   $D6
            LDA   $D4
            CLC
            ADC   $DC
            STA   $D4
L0A06D1     BRL   L0A0599
L0A06D4     PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            _FrameRect
            STA   L0F0779
            LDY   #$0002
            LDA   [$F9],Y
            CLC
            ADC   $DA
            PHA
            PLA
            LDY   #$0002
            STA   [$F9],Y
            LDY   #$0006
            LDA   [$F9],Y
            CLC
            ADC   $DA
            PHA
            PLA
            LDY   #$0006
            STA   [$F9],Y
            LDA   [$F9]
            CLC
            ADC   $D8
            PHA
            PLA
            STA   [$F9]
            LDY   #$0004
            LDA   [$F9],Y
            CLC
            ADC   $D8
            PHA
            PLA
            LDY   #$0004
            STA   [$F9],Y
            PEI   $CE
            _SetPenMode
            STA   L0F0779
            LDA   #$0000
            TAY
            TDC
            CLC
            ADC   #$00EB
            TCS
            TYA
            PLD
            RTL

L0A0736     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0F0129
            CMP   #$0000
            BNE   L0A074F
            LDA   #$0000
            BRL   L0A0880
L0A074F     PEA   $0000
            JSL   L07231B
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$005A
            LDA   [$F8],Y
            CMP   #$0000
            BEQ   L0A0771
            LDA   #$0000
            BRL   L0A0880
L0A0771     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0052
            LDA   [$F8],Y
            STA   $F6
            PEA   $0001
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0014
            LDA   [$F8],Y
            PHA
            JSL   L0704DE
            PLY
            PLY
            PEA   $0001
            PEA   $0001
            PEA   $0001
            JSL   L070543
            PLY
            PLY
            PLY
            PEA   $0001
            JSL   L071FA8
            PLY
            JSL   L071957
            LDA   L0F0129
            CMP   #$0001
            BEQ   L0A07C1
            BRA   L0A07CA
L0A07C1     JSL   L083E37
            BRL   L0A0812
            BRA   L0A07D1
L0A07CA     CMP   #$0002
            BEQ   L0A07D1
            BRA   L0A07DA
L0A07D1     JSL   L0841B8
            BRL   L0A0812
            BRA   L0A07E1
L0A07DA     CMP   #$0005
            BEQ   L0A07E1
            BRA   L0A07E9
L0A07E1     JSL   L084568
            BRA   L0A0812
            BRA   L0A07F0
L0A07E9     CMP   #$0004
            BEQ   L0A07F0
            BRA   L0A07F8
L0A07F0     JSL   L08457B
            BRA   L0A0812
            BRA   L0A07FF
L0A07F8     CMP   #$0003
            BEQ   L0A07FF
            BRA   L0A0807
L0A07FF     JSL   L08458E
            BRA   L0A0812
            BRA   L0A080E
L0A0807     CMP   #$0006
            BEQ   L0A080E
            BRA   L0A0812
L0A080E     JSL   L084757
L0A0812     JSL   L080000
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0052
            LDA   [$F8],Y
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   #$004C
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A0841
            INC   $FA
L0A0841     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A084B
            INC   $FA
L0A084B     LDA   [$F8]
            AND   #$00FF
            CMP   #$0008
            BNE   L0A0880
            PEA   $0000
            PEI   $F6
            JSL   L0704DE
            PLY
            PLY
            PEA   $0001
            PEA   $0001
            PEA   $0001
            JSL   L070543
            PLY
            PLY
            PLY
            PEA   $0001
            JSL   L071FA8
            PLY
            JSL   L071957
            JSL   L070CC7
L0A0880     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            PEA   $0001
            JSL   L071FA8
            PLY
            JSL   L071957
            JSL   L070CC7
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0A08AD     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            LDA   L0F0125
            STA   $F6
            PHA
            LDA   L0F0133
            PHA
            LDA   L0F0135
            PHA
            PEA   $0000
            PEA   $0000
            LDA   $F6
            ASL
            ASL
            PHA
            LDA   #L0E1822
            STA   $F8
            LDA   #^L0E1822
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A08E5
            INC   $FA
L0A08E5     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            PHX
            PHA
            _TrackControl
            STA   L0F0779
            PLA
            PHA
            LDA   $F6
            ASL
            ASL
            PHA
            LDA   #L0E1822
            STA   $F8
            LDA   #^L0E1822
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A0914
            INC   $FA
L0A0914     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            PHX
            PHA
            _GetCtlValue
            STA   L0F0779
            PLA
            LDX   #$0000
            TAY
            BPL   L0A0930
            DEX
L0A0930     STX   $F4
            STA   $F2
            LDA   $F6
            CMP   #$0000
            BEQ   L0A093D
            BRA   L0A094C
L0A093D     PEI   $F4
            PEI   $F2
            JSL   L08576A
            PLY
            PLY
            BRL   L0A098F
            BRA   L0A0953
L0A094C     CMP   #$0001
            BEQ   L0A0953
            BRA   L0A097E
L0A0953     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BEQ   L0A0970
            PEI   $F4
            PEI   $F2
            JSL   L0856FC
            PLY
            PLY
            BRA   L0A097A
L0A0970     PEI   $F4
            PEI   $F2
            JSL   L090EEB
            PLY
            PLY
L0A097A     BRA   L0A098F
            BRA   L0A0985
L0A097E     CMP   #$0002
            BEQ   L0A0985
            BRA   L0A098F
L0A0985     PEI   $F4
            PEI   $F2
            JSL   L090F75
            PLY
            PLY
L0A098F     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0A0997     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDA   L0F0125
            CMP   #$0000
            BEQ   L0A09AC
            BRA   L0A09BA
L0A09AC     LDA   L0F0127
            PHA
            JSL   L0852E3
            PLY
            BRL   L0A09FA
            BRA   L0A09C1
L0A09BA     CMP   #$0001
            BEQ   L0A09C1
            BRA   L0A09EA
L0A09C1     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BEQ   L0A09DD
            LDA   L0F0127
            PHA
            JSL   L0852E3
            PLY
            BRA   L0A09E6
L0A09DD     LDA   L0F0127
            PHA
            JSL   L09089C
            PLY
L0A09E6     BRA   L0A09FA
            BRA   L0A09F1
L0A09EA     CMP   #$0002
            BEQ   L0A09F1
            BRA   L0A09FA
L0A09F1     LDA   L0F0127
            PHA
            JSL   L09089C
            PLY
L0A09FA     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0A0A02     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            LDA   #$0002
            SEC
            JSL   L0D151F
            PLA
            CLC
            ADC   #$0004
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$004A
            STA   [$F8],Y
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            LDA   #$0002
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$004A
            LDA   [$F8],Y
            PLX
            STX   $F8
            CLC
            ADC   $F8
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0A10
            LDA   [$F8],Y
            TAX
            LDY   #$0A0E
            LDA   [$F8],Y
            STA   $F8
            STX   $FA
            PLA
            STA   [$F8]
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0A10
            LDA   [$F8],Y
            TAX
            LDY   #$0A0E
            LDA   [$F8],Y
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0002
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$004A
            LDA   [$F8],Y
            STA   $F4
            STZ   $F6
            BRA   L0A0B38
L0A0ACB     LDA   $F6
            ASL
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0A10
            LDA   [$F8],Y
            TAX
            LDY   #$0A0E
            LDA   [$F8],Y
            STA   $F8
            STX   $FA
            LDA   #$0004
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A0AF4
            INC   $FA
L0A0AF4     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A0AFE
            INC   $FA
L0A0AFE     LDA   $F4
            STA   [$F8]
            LDA   $F4
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$00BA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A0B1B
            INC   $FA
L0A0B1B     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A0B25
            INC   $FA
L0A0B25     LDA   #$0000
            SEP   #$20
            STA   [$F8]
            REP   #$20
            LDA   $F4
            CLC
            ADC   #$0002
            STA   $F4
            INC   $F6
L0A0B38     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   $F6
            BEQ   L0A0B56
            BVS   L0A0B51
            EOR   #$8000
L0A0B51     BPL   L0A0B56
            BRL   L0A0ACB
L0A0B56     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0022
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0010
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$005C
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$005E
            STA   [$F8],Y
            JSL   L030FA2
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0A0BAA     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$00BA
            BCC   L0A0BCA
            INX
L0A0BCA     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            JSL   L081620
            PLY
            PLY
            PLY
            PLY
            STA   $F6
            LDA   $F6
            CMP   #$FFFE
            BNE   L0A0C15
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0022
            STA   [$F8],Y
            JSL   L0A0A02
            BRA   L0A0C27
L0A0C15     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$0022
            STA   [$F8],Y
L0A0C27     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$00BA
            CLC
            ADC   $F8
            BCC   L0A0C3C
            INX
L0A0C3C     STX   L0F00AD
            STA   L0F00AB
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0A0C4A     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0010
            LDA   [$F6],Y
            BNE   L0A0C69
            BRL   L0A0DA5
L0A0C69     PEA   $0001
            JSL   L07231B
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$005A
            LDA   [$F6],Y
            CMP   #$0000
            BEQ   L0A0C8B
            LDA   #$0000
            BRL   L0A0DAC
L0A0C8B     PEA   $0000
            PEA   $042A
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$04E4
            BCC   L0A0CA6
            INX
L0A0CA6     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$00BA
            BCC   L0A0CBD
            INX
L0A0CBD     PHX
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0022
            LDA   [$F6],Y
            CMP   #$0000
            BEQ   L0A0CE2
            BRL   L0A0D45
L0A0CE2     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0A10
            LDA   [$F6],Y
            TAX
            LDY   #$0A0E
            LDA   [$F6],Y
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$00BA
            BCC   L0A0D13
            INX
L0A0D13     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            PHA
            JSL   L080F25
            PLY
            PLY
            PLY
            PLY
            JSL   L083D9E
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0001
            LDY   #$0022
            STA   [$F6],Y
            BRA   L0A0DA1
L0A0D45     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$002E
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0A10
            LDA   [$F6],Y
            TAX
            LDY   #$0A0E
            LDA   [$F6],Y
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$00BA
            BCC   L0A0D86
            INX
L0A0D86     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            PHA
            JSL   L0817D9
            PLY
            PLY
            PLY
            PLY
            PLY
L0A0DA1     JSL   L080000
L0A0DA5     PEI   $FF
            JSL   L0703BA
            PLY
L0A0DAC     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0A0DB6     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EA
            TCS
            PEI   $FB
            PEI   $F9
            JSL   L0B22EB
            PLY
            PLY
            STX   $EE
            STA   $EC
            LDA   L0F0598
            CMP   #$0000
            BEQ   L0A0DEA
            LDA   L0F0598
            PHA
            PEA   $FFFC
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRL   L0A0E60
L0A0DEA     LDX   $FF
            LDA   $FD
            PHX
            PHA
            LDX   $EE
            LDA   $EC
            JSL   L0D157E
            BVS   L0A0DFD
            EOR   #$8000
L0A0DFD     BPL   L0A0E0D
            PEA   $FFEC
            JSL   L0617E1
            PLY
            LDA   #$0000
            BRL   L0A0E60
L0A0E0D     PEI   $FB
            PEI   $F9
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
            STA   L0F0598
            LDA   L0F0598
            CMP   #$0000
            BEQ   L0A0E5D
            LDA   L0F0598
            PHA
            PEA   $FFFD
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRA   L0A0E60
L0A0E5D     LDA   #$0001
L0A0E60     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0A0E6A     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDA   L0F0042
            BNE   L0A0E7F
            LDA   #$0000
            BRA   L0A0EB4
L0A0E7F     LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDY   #$000A
            LDA   [$F8],Y
            TAX
            LDY   #$0008
            LDA   [$F8],Y
            PHX
            PHA
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L0A0DB6
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L0A0EAC
            LDA   #$0000
            BRA   L0A0EB4
L0A0EAC     PEA   $FFFF
            JSL   L0A0EBE
            PLY
L0A0EB4     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0A0EBE     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00E0
            TCS
            PEA   $0000
            JSL   L0B1E73
            PLY
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDY   #$0012
            LDA   [$F6],Y
            TAX
            LDY   #$0010
            LDA   [$F6],Y
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDY   #$000A
            LDA   [$F6],Y
            TAX
            LDY   #$0008
            LDA   [$F6],Y
            JSL   L0D1705
            PLA
            PLX
            STX   $F4
            STA   $F2
            LDAL  L0E32CF
            STAL  L0E32D9
            LDX   L0F000C
            LDA   L0F000A
            PHA
            TXA
            STAL  L0E32DD
            PLA
            STAL  L0E32DB
            LDX   $F4
            LDA   $F2
            PHA
            TXA
            STAL  L0E32E1
            PLA
            STAL  L0E32DF
            PEA   $0013
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            LDA   L0F0779
            STA   L0F0598
            LDA   L0F0598
            CMP   #$0000
            BEQ   L0A0F72
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   L0F0598
            PHA
            PEA   $FFFC
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRL   L0A1111
L0A0F72     LDAL  L0E32E5
            TAX
            LDAL  L0E32E3
            STX   $EA
            STA   $E8
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L0D157E
            BEQ   L0A0F9B
            BVS   L0A0F96
            EOR   #$8000
L0A0F96     BPL   L0A0F9B
            BRL   L0A1082
L0A0F9B     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDY   #$0012
            LDA   [$F6],Y
            TAX
            LDY   #$0010
            LDA   [$F6],Y
            JSL   L0D157E
            BVS   L0A0FC1
            EOR   #$8000
L0A0FC1     BPL   L0A0FC6
            BRL   L0A1082
L0A0FC6     LDX   L0F000C
            LDA   L0F000A
            STX   $F0
            STA   $EE
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDY   #$0012
            LDA   [$F6],Y
            TAX
            LDY   #$0010
            LDA   [$F6],Y
            PHX
            PHA
            LDX   L0F0028
            LDA   L0F0026
            JSL   L0D1705
            PLA
            PLX
            PHX
            PHA
            LDX   $F0
            LDA   $EE
            JSL   L0D1573
            PLA
            PLX
            STX   $F0
            STA   $EE
            LDX   $F0
            LDA   $EE
            PHA
            TXA
            STAL  L0E32DD
            PLA
            STAL  L0E32DB
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDY   #$0012
            LDA   [$F6],Y
            TAX
            LDY   #$0010
            LDA   [$F6],Y
            PHA
            TXA
            STAL  L0E32E1
            PLA
            STAL  L0E32DF
            PEA   $0013
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            LDA   L0F0779
            STA   L0F0598
            LDA   L0F0598
            CMP   #$0000
            BEQ   L0A1075
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   L0F0598
            PHA
            PEA   $FFFC
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRL   L0A1111
L0A1075     LDAL  L0E32E5
            TAX
            LDAL  L0E32E3
            STX   $EA
            STA   $E8
L0A1082     LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L0D157E
            BEQ   L0A10B1
            BVS   L0A1099
            EOR   #$8000
L0A1099     BPL   L0A10B1
            PEA   $0001
            JSL   L0B1E73
            PLY
            PEA   $FFFC
            JSL   L0617E1
            PLY
            LDA   #$0000
            BRL   L0A1111
L0A10B1     LDA   $FF
            CMP   #$0001
            BEQ   L0A10C5
            LDA   #$0001
            STA   L0F0044
            STZ   L0F0042
            JSL   L030FA2
L0A10C5     LDAL  L0E32D9
            STA   $E2
            PEA   $0017
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            JSL   L0F0831
            PEA   $0018
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            JSL   L0F0831
            LDX   #$0000
            LDA   #$0000
            PHA
            TXA
            STAL  L0E32E1
            PLA
            STAL  L0E32DF
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEA   $0001
            JSL   L0B1E73
            PLY
L0A1111     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0A111B     ENT
            PHD
            TSC
            SEC
            SBC   #$00E9
            TCD
            ADC   #$00E0
            TCS
            PEA   $0000
            JSL   L0B1E73
            PLY
            PEI   $F1
            PEI   $EF
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
            STA   L0F0598
            LDA   L0F0598
            CMP   #$0000
            BEQ   L0A1187
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
            BRL   L0A1246
L0A1187     LDAL  L0E32CF
            STAL  L0E32D9
            LDX   $F9
            LDA   $F7
            PHA
            TXA
            STAL  L0E32DD
            PLA
            STAL  L0E32DB
            LDX   $FD
            LDA   $FB
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
            STA   L0F0598
            LDA   L0F0598
            CMP   #$0000
            BEQ   L0A11E3
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   L0F0598
            PHA
            PEA   $FFFA
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRL   L0A1246
L0A11E3     LDAL  L0E32E5
            TAX
            LDAL  L0E32E3
            STX   $E4
            STA   $E2
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $E4
            LDA   $E2
            JSL   L0D157E
            BVS   L0A1205
            EOR   #$8000
L0A1205     BMI   L0A1243
            PEA   $0005
            PEA   $0005
            PEI   $F5
            PEI   $F3
            PEI   $F9
            PEI   $F7
            JSL   L0C04FA
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            CMP   #$0000
            BEQ   L0A123C
            PEA   $0001
            JSL   L0B1E73
            PLY
            PEI   $FF
            JSL   L0617E1
            PLY
            LDA   #$0000
            BRA   L0A1246
            BRA   L0A1241
L0A123C     LDA   #$0001
            BRA   L0A1246
L0A1241     BRA   L0A1246
L0A1243     LDA   #$0000
L0A1246     TAY
            TDC
            CLC
            ADC   #$00E9
            TCS
            TYA
            PLD
            RTL

L0A1250     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EA
            TCS
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L0B243F
            PLY
            PLY
            STX   $F6
            STA   $F4
            LDA   L0F0598
            CMP   #$0000
            BEQ   L0A128E
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
            BRL   L0A15A5
L0A128E     LDX   L0F0028
            LDA   L0F0026
            PHX
            PHA
            LDX   $F6
            LDA   $F4
            JSL   L0D157E
            BVS   L0A12A3
            EOR   #$8000
L0A12A3     BMI   L0A12BB
            PEA   $0001
            JSL   L0B1E73
            PLY
            PEA   $FFE1
            JSL   L0617E1
            PLY
            LDA   #$0000
            BRL   L0A15A5
L0A12BB     PEA   $FFF8
            PEA   $0000
            PEA   $0014
            LDX   L0F000C
            LDA   L0F000A
            PHX
            PHA
            PEA   ^L0E52A3
            PEA   L0E52A3
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L0A111B
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            TAY
            BNE   L0A12FA
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            LDA   #$0000
            BRL   L0A15A5
L0A12FA     LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDY   #$0012
            LDA   [$F8],Y
            TAX
            LDY   #$0010
            LDA   [$F8],Y
            PHX
            PHA
            LDX   #$0000
            LDA   #$0014
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDY   #$000A
            LDA   [$F8],Y
            TAX
            LDY   #$0008
            LDA   [$F8],Y
            JSL   L0D1705
            PLA
            PLX
            STX   $F6
            STA   $F4
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$0014
            CLC
            ADC   $F8
            BCC   L0A1353
            INX
L0A1353     PHA
            TXA
            STAL  L0E32DD
            PLA
            STAL  L0E32DB
            LDX   $F6
            LDA   $F4
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
            STA   L0F0598
            LDA   L0F0598
            CMP   #$0000
            BEQ   L0A13B0
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   L0F0598
            PHA
            PEA   $FFFA
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRL   L0A15A5
L0A13B0     LDAL  L0E32E5
            TAX
            LDAL  L0E32E3
            STX   $EE
            STA   $EC
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $EE
            LDA   $EC
            JSL   L0D157E
            BVS   L0A13D2
            EOR   #$8000
L0A13D2     BPL   L0A13D7
            BRL   L0A148E
L0A13D7     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDY   #$0012
            LDA   [$F8],Y
            TAX
            LDY   #$0010
            LDA   [$F8],Y
            JSL   L0D157E
            BVS   L0A13FD
            EOR   #$8000
L0A13FD     BPL   L0A1402
            BRL   L0A148E
L0A1402     LDX   L0F000C
            LDA   L0F000A
            STX   $F2
            STA   $F0
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDY   #$0012
            LDA   [$F8],Y
            TAX
            LDY   #$0010
            LDA   [$F8],Y
            PHX
            PHA
            LDX   L0F0028
            LDA   L0F0026
            JSL   L0D1705
            PLA
            PLX
            PHX
            PHA
            LDX   $F2
            LDA   $F0
            JSL   L0D1573
            PLA
            PLX
            STX   $F2
            STA   $F0
            LDX   $F2
            LDA   $F0
            PHA
            TXA
            STAL  L0E32DD
            PLA
            STAL  L0E32DB
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDY   #$0012
            LDA   [$F8],Y
            TAX
            LDY   #$0010
            LDA   [$F8],Y
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
            STA   L0F0598
            LDAL  L0E32E5
            TAX
            LDAL  L0E32E3
            STX   $EE
            STA   $EC
L0A148E     LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $EE
            LDA   $EC
            JSL   L0D157E
            BEQ   L0A14A7
            BVS   L0A14A5
            EOR   #$8000
L0A14A5     BMI   L0A14AF
L0A14A7     LDA   L0F0598
            CMP   #$0000
            BEQ   L0A14D7
L0A14AF     PEA   $0001
            JSL   L0B1E73
            PLY
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            LDA   L0F0598
            PHA
            PEA   $FFFA
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRL   L0A15A5
L0A14D7     PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            LDX   L0F000C
            LDA   L0F000A
            STX   $F2
            STA   $F0
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDY   #$0006
            LDA   [$F8],Y
            PHA
            LDA   #$0448
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDA   #$0014
            PLX
            STX   $F8
            CLC
            ADC   $F8
            LDX   #$0000
            PHX
            PHA
            LDX   $F2
            LDA   $F0
            JSL   L0D1573
            PLA
            PLX
            STX   $F2
            STA   $F0
            LDX   $F2
            LDA   $F0
            STX   L0F003C
            STA   L0F003A
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$0062
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0060
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$0066
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$0068
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$006C
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$006E
            STA   [$F8],Y
            PEA   $0001
            JSL   L0A15AF
            PLY
            LDA   #$0001
L0A15A5     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0A15AF     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            JSL   L090630
            JSL   L083651
            JSL   L051AE7
            LDA   $FF
            STA   L0F0044
            STZ   L0F0042
            STZ   L0F0000
            STZ   L0F0004
            STZ   L0F0002
            JSL   L030FA2
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            JSL   L073CE1
            PEA   $0001
            JSL   L0B1E73
            PLY
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0A1601     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            JSL   L080027
            PEA   ^L0E3AA0
            PEA   L0E3AA0
            JSL   L0800DE
            PLY
            PLY
            STA   $F4
            PEA   $0002
            PEA   $0001
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEI   $F4
            PEA   $0000
            PEI   $FF
            JSL   L011721
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            LDA   #$000A
            STA   L0F0012
            LDA   #$0000
            SEP   #$20
            STAL  L0E4A4C
            REP   #$20
            PEI   $F4
            JSL   L011C24
            PLY
            PEA   $0000
            JSL   L0A15AF
            PLY
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0A1668     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            JSL   L06137E
            TAY
            BEQ   L0A1688
            PEA   $0002
            JSL   L0A1601
            PLY
            LDA   #$0001
            STA   L0F0006
L0A1688     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0A1690     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F0
            TCS
            PEA   $0000
            JSL   L0B1E73
            PLY
            LDA   L0F0070
            PHA
            LDA   #$000C
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDA   #$004A
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A16C7
            INC   $F8
L0A16C7     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A16D1
            INC   $F8
L0A16D1     LDA   [$F6]
            CLC
            ADC   #$0001
            STA   L0F0016
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0066
            LDA   [$F6],Y
            BEQ   L0A1702
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0001
            LDY   #$0070
            STA   [$F6],Y
            STZ   $F2
            BRL   L0A181F
L0A1702     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0070
            LDA   [$F6],Y
            STA   $F2
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0070
            LDA   [$F6],Y
            SEC
            SBC   #$0000
            BNE   L0A172B
            BRL   L0A17E8
L0A172B     BVS   L0A1730
            EOR   #$8000
L0A1730     BMI   L0A1735
            BRL   L0A17E8
L0A1735     STZ   $F4
            BRL   L0A17CA
L0A173A     LDA   $F4
            ASL
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0072
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A1754
            INC   $F8
L0A1754     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A175E
            INC   $F8
L0A175E     LDA   [$F6]
            SEC
            SBC   #$0000
            BVS   L0A1769
            EOR   #$8000
L0A1769     BMI   L0A1797
            LDA   $F4
            ASL
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0072
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A1785
            INC   $F8
L0A1785     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A178F
            INC   $F8
L0A178F     LDA   [$F6]
            EOR   #$FFFF
            INC
            BRA   L0A17BD
L0A1797     LDA   $F4
            ASL
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0072
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A17B1
            INC   $F8
L0A17B1     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A17BB
            INC   $F8
L0A17BB     LDA   [$F6]
L0A17BD     CMP   L0F0016
            BNE   L0A17C8
            LDA   $F4
            STA   $F2
            BRA   L0A17E8
L0A17C8     INC   $F4
L0A17CA     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0070
            LDA   [$F6],Y
            SEC
            SBC   $F4
            BEQ   L0A17E8
            BVS   L0A17E3
            EOR   #$8000
L0A17E3     BPL   L0A17E8
            BRL   L0A173A
L0A17E8     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0070
            LDA   [$F6],Y
            CMP   $F2
            BNE   L0A181F
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0070
            LDA   [$F6],Y
            CLC
            ADC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$0070
            STA   [$F6],Y
L0A181F     LDA   $FF
            BEQ   L0A1854
            LDA   L0F0016
            EOR   #$FFFF
            INC
            PHA
            LDA   $F2
            ASL
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0072
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A1845
            INC   $F8
L0A1845     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A184F
            INC   $F8
L0A184F     PLA
            STA   [$F6]
            BRA   L0A187D
L0A1854     LDA   $F2
            ASL
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0072
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A186E
            INC   $F8
L0A186E     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A1878
            INC   $F8
L0A1878     LDA   L0F0016
            STA   [$F6]
L0A187D     PEA   $0000
            TDC
            CLC
            ADC   #$000C
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0010
            PHA
            PEA   ^L074043
            PEA   L074043
            JSL   L0A18D9
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$0001
            STA   L0F0042
            PEA   $0000
            JSL   L091C6A
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$002E
            STA   [$F6],Y
            JSL   L073F2B
            JSL   L072D31
            PEA   $0001
            JSL   L0B1E73
            PLY
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0A18D9     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00DE
            TCS
            JSL   L074043
            STA   $E8
            LDA   $E8
            STA   $EA
L0A18EE     LDA   $EA
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLY
            STA   $EA
            TAY
            BNE   L0A1902
            BRL   L0A1979
L0A1902     LDA   $E8
            SEC
            SBC   $EA
            STA   $E0
            LDA   #$0001
            STA   $E2
L0A190E     LDA   $E2
            STA   $E4
L0A1912     LDA   $E4
            CLC
            ADC   $EA
            STA   $E6
            LDA   $E6
            SEC
            SBC   #$0001
            PHA
            LDA   $E4
            SEC
            SBC   #$0001
            PHA
            JSL   L0A1981
            PLY
            PLY
            SEC
            SBC   #$0000
            BEQ   L0A1957
            BVS   L0A1938
            EOR   #$8000
L0A1938     BPL   L0A1957
            LDA   $E6
            SEC
            SBC   #$0001
            PHA
            LDA   $E4
            SEC
            SBC   #$0001
            PHA
            JSL   L0A1C15
            PLY
            PLY
            LDA   $E4
            SEC
            SBC   $EA
            STA   $E4
            BRA   L0A1959
L0A1957     BRA   L0A1966
L0A1959     LDA   $E4
            SEC
            SBC   #$0001
            BVS   L0A1964
            EOR   #$8000
L0A1964     BMI   L0A1912
L0A1966     INC   $E2
            LDA   $E2
            SEC
            SBC   $E0
            BEQ   L0A190E
            BVS   L0A1974
            EOR   #$8000
L0A1974     BPL   L0A190E
            BRL   L0A18EE
L0A1979     TDC
            CLC
            ADC   #$00EF
            TCS
            PLD
            RTL

L0A1981     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E8
            TCS
            STZ   $EA
L0A198E     LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0070
            LDA   [$F4],Y
            SEC
            SBC   $EA
            BNE   L0A19A5
            BRL   L0A1AEC
L0A19A5     BVS   L0A19AA
            EOR   #$8000
L0A19AA     BMI   L0A19AF
            BRL   L0A1AEC
L0A19AF     LDA   $EA
            ASL
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDA   #$0072
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A19C9
            INC   $F6
L0A19C9     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A19D3
            INC   $F6
L0A19D3     LDA   [$F4]
            STA   $F0
            LDA   $F0
            SEC
            SBC   #$0000
            BVS   L0A19E2
            EOR   #$8000
L0A19E2     BMI   L0A19F4
            LDA   $F0
            EOR   #$FFFF
            INC
            STA   $F0
            LDA   #$0001
            STA   L0F0018
            BRA   L0A19F7
L0A19F4     STZ   L0F0018
L0A19F7     DEC   $F0
            LDA   $F0
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F4
            STX   $F6
            LDA   #$004C
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1A17
            INC   $F6
L0A1A17     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1A21
            INC   $F6
L0A1A21     LDA   [$F4]
            AND   #$00FF
            CMP   #$0008
            BEQ   L0A1A61
            PEI   $F0
            PEI   $FD
            JSL   L0A1D58
            PLY
            PLY
            LDX   L0F001C
            LDA   L0F001A
            STX   $EE
            STA   $EC
            PEI   $F0
            PEI   $FF
            JSL   L0A1D58
            PLY
            PLY
            LDX   L0F001C
            LDA   L0F001A
            PHX
            PHA
            PEI   $EE
            PEI   $EC
            JSL   L0C0585
            PLY
            PLY
            PLY
            PLY
            STA   $F2
            BRA   L0A1A70
L0A1A61     PEI   $F0
            PEI   $FF
            PEI   $FD
            JSL   L0A1AF9
            PLY
            PLY
            PLY
            STA   $F2
L0A1A70     LDA   $F2
            CMP   #$0000
            BNE   L0A1A7A
            BRL   L0A1AE7
L0A1A7A     LDA   L0F0018
            BEQ   L0A1A87
            LDA   $F2
            EOR   #$FFFF
            INC
            STA   $F2
L0A1A87     LDA   $F0
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F4
            STX   $F6
            LDA   #$004C
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1AA5
            INC   $F6
L0A1AA5     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1AAF
            INC   $F6
L0A1AAF     LDA   [$F4]
            AND   #$00FF
            CMP   #$0001
            BEQ   L0A1ABD
            LDA   $F2
            BRA   L0A1AEF
L0A1ABD     LDA   [$EC]
            AND   #$00FF
            CMP   #$002D
            BNE   L0A1AE3
            LDX   L0F001C
            LDA   L0F001A
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            CMP   #$002D
            BNE   L0A1AE3
            LDA   $F2
            EOR   #$FFFF
            INC
            STA   $F2
L0A1AE3     LDA   $F2
            BRA   L0A1AEF
L0A1AE7     INC   $EA
            BRL   L0A198E
L0A1AEC     LDA   #$0000
L0A1AEF     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0A1AF9     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00D2
            TCS
            PEA   $0000
            PEA   $0000
            PEI   $FB
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            PHA
            JSL   L081620
            PLY
            PLY
            PLY
            PLY
            LDX   L0F00C1
            LDA   L0F00BF
            STX   L0F00AD
            STA   L0F00AB
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            PEI   $FF
            JSL   L040000
            PLY
            PLY
            PLY
            PLY
            LDA   L0F00D3
            PHA
            LDA   L0F00D1
            PHA
            LDA   L0F00CF
            PHA
            LDA   L0F00CD
            PHA
            JSL   L0D1452
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
            PEA   $0000
            PEA   $0000
            PEI   $FD
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            PHA
            JSL   L081620
            PLY
            PLY
            PLY
            PLY
            LDX   L0F00C1
            LDA   L0F00BF
            STX   L0F00AD
            STA   L0F00AB
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            PEI   $FF
            JSL   L040000
            PLY
            PLY
            PLY
            PLY
            LDA   L0F00D3
            PHA
            LDA   L0F00D1
            PHA
            LDA   L0F00CF
            PHA
            LDA   L0F00CD
            PHA
            JSL   L0D1452
            PEI   $F0
            PEI   $EE
            PEI   $EC
            PEI   $EA
            JSL   L0D1452
            JSL   L0D13C6
            BEQ   L0A1BD6
            BRA   L0A1BDB
L0A1BD6     LDA   #$0000
            BRA   L0A1C0B
L0A1BDB     LDA   L0F00D3
            PHA
            LDA   L0F00D1
            PHA
            LDA   L0F00CF
            PHA
            LDA   L0F00CD
            PHA
            JSL   L0D1452
            PEI   $F0
            PEI   $EE
            PEI   $EC
            PEI   $EA
            JSL   L0D1452
            JSL   L0D13C6
            BVS   L0A1C03
            BRA   L0A1C08
L0A1C03     LDA   #$0001
            BRA   L0A1C0B
L0A1C08     LDA   #$FFFF
L0A1C0B     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0A1C15     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0062
            LDA   [$F4],Y
            BNE   L0A1C34
            BRL   L0A1CAC
L0A1C34     LDA   $FD
            ASL
            ASL
            PHA
            LDX   L0F0040
            LDA   L0F003E
            STA   $F4
            STX   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1C4D
            INC   $F6
L0A1C4D     LDA   [$F4]
            STA   $F2
            LDA   $FF
            ASL
            ASL
            PHA
            LDX   L0F0040
            LDA   L0F003E
            STA   $F4
            STX   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1C6A
            INC   $F6
L0A1C6A     LDA   [$F4]
            PHA
            LDA   $FD
            ASL
            ASL
            PHA
            LDX   L0F0040
            LDA   L0F003E
            STA   $F4
            STX   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1C86
            INC   $F6
L0A1C86     PLA
            STA   [$F4]
            LDA   $FF
            ASL
            ASL
            PHA
            LDX   L0F0040
            LDA   L0F003E
            STA   $F4
            STX   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1CA2
            INC   $F6
L0A1CA2     LDA   $F2
            STA   [$F4]
            LDA   #$0000
            BRL   L0A1D4E
L0A1CAC     LDA   $FD
            ASL
            ASL
            PHA
            LDX   L0F0040
            LDA   L0F003E
            STA   $F4
            STX   $F6
            LDA   #$0002
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1CC7
            INC   $F6
L0A1CC7     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1CD1
            INC   $F6
L0A1CD1     LDA   [$F4]
            STA   $F2
            LDA   $FF
            ASL
            ASL
            PHA
            LDX   L0F0040
            LDA   L0F003E
            STA   $F4
            STX   $F6
            LDA   #$0002
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1CF0
            INC   $F6
L0A1CF0     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1CFA
            INC   $F6
L0A1CFA     LDA   [$F4]
            PHA
            LDA   $FD
            ASL
            ASL
            PHA
            LDX   L0F0040
            LDA   L0F003E
            STA   $F4
            STX   $F6
            LDA   #$0002
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1D18
            INC   $F6
L0A1D18     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1D22
            INC   $F6
L0A1D22     PLA
            STA   [$F4]
            LDA   $FF
            ASL
            ASL
            PHA
            LDX   L0F0040
            LDA   L0F003E
            STA   $F4
            STX   $F6
            LDA   #$0002
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1D40
            INC   $F6
L0A1D40     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1D4A
            INC   $F6
L0A1D4A     LDA   $F2
            STA   [$F4]
L0A1D4E     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0A1D58     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            PEA   $0000
            PEA   $0000
            PEI   $FD
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            PHA
            JSL   L081620
            PLY
            PLY
            PLY
            PLY
            LDX   L0F00C1
            LDA   L0F00BF
            STX   L0F00AD
            STA   L0F00AB
            LDX   L0F00C1
            LDA   L0F00BF
            STX   L0F001C
            STA   L0F001A
            LDA   $FF
            ASL
            PHA
            LDX   L0F00C1
            LDA   L0F00BF
            STA   $F4
            STX   $F6
            LDA   #$0004
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1DB5
            INC   $F6
L0A1DB5     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0A1DBF
            INC   $F6
L0A1DBF     LDA   [$F4]
            LDX   #$0000
            TAY
            BPL   L0A1DC8
            DEX
L0A1DC8     PHX
            PHA
            LDX   L0F001C
            LDA   L0F001A
            JSL   L0D1573
            PLA
            PLX
            STX   L0F001C
            STA   L0F001A
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0A1DE4     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E4
            TCS
            PEA   $0000
            PEA   $0000
            PEI   $F9
            LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            LDY   #$0002
            LDA   [$F0],Y
            PHA
            JSL   L081620
            PLY
            PLY
            PLY
            PLY
            STA   $EE
            LDX   L0F00C1
            LDA   L0F00BF
            STX   L0F00AD
            STA   L0F00AB
            LDA   $FB
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F0
            STX   $F2
            LDA   #$004C
            CLC
            ADC   $F0
            STA   $F0
            BCC   L0A1E3B
            INC   $F2
L0A1E3B     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L0A1E45
            INC   $F2
L0A1E45     LDA   [$F0]
            AND   #$00FF
            CMP   #$0008
            BEQ   L0A1EA4
            LDX   L0F00C1
            LDA   L0F00BF
            STX   $E8
            STA   $E6
            LDA   $FB
            ASL
            PHA
            LDX   L0F00C1
            LDA   L0F00BF
            STA   $F0
            STX   $F2
            LDA   #$0004
            CLC
            ADC   $F0
            STA   $F0
            BCC   L0A1E73
            INC   $F2
L0A1E73     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L0A1E7D
            INC   $F2
L0A1E7D     LDA   [$F0]
            LDX   #$0000
            PHX
            PHA
            LDX   $E8
            LDA   $E6
            JSL   L0D1573
            PLA
            PLX
            STX   $E8
            STA   $E6
            PEI   $E8
            PEI   $E6
            PEI   $FF
            PEI   $FD
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRA   L0A1ECA
L0A1EA4     PEA   $0002
            PEI   $FF
            PEI   $FD
            PEI   $FB
            JSL   L040000
            PLY
            PLY
            PLY
            PLY
            STA   $EA
            PEI   $EA
            PEI   $FF
            PEI   $FD
            PEA   $0001
            JSL   L0B0000
            PLY
            PLY
            PLY
            PLY
            STA   $EA
L0A1ECA     LDA   $EE
            TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0A1ED6     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EA
            TCS
            PEA   $0000
            JSL   L0B1E73
            PLY
            STZ   $F2
            PEA   ^L0E2E68
            PEA   L0E2E68
            JSL   L0C04CD
            PLY
            PLY
            STA   $EE
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            JSL   L081516
            PLY
            LDA   L0F0125
            PHA
            LDA   #$000C
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   #$004A
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A1F32
            INC   $FA
L0A1F32     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A1F3C
            INC   $FA
L0A1F3C     LDA   [$F8]
            STA   $F4
            LDA   #$FFFF
            STA   $F6
L0A1F45     LDA   #$0001
            BNE   L0A1F4D
            BRL   L0A1FF3
L0A1F4D     PEI   $F6
            JSL   L0A24B8
            PLY
            STA   $F6
            LDA   $F6
            CMP   #$FFFF
            BNE   L0A1F60
            BRL   L0A1FF3
L0A1F60     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0A1F75
            INX
L0A1F75     PHX
            PHA
            PEI   $F4
            PEI   $F6
            JSL   L0A1DE4
            PLY
            PLY
            PLY
            PLY
            STA   $EC
            PEI   $EE
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0A1F9C
            INX
L0A1F9C     PHX
            PHA
            JSL   L0A203C
            PLY
            PLY
            PLY
            STA   $F0
            LDA   L0F00C9
            CMP   #$0007
            BNE   L0A1FB3
            LDA   $F0
            BNE   L0A1FBF
L0A1FB3     LDA   L0F00C9
            CMP   #$0008
            BNE   L0A1FF0
            LDA   $F0
            BNE   L0A1FF0
L0A1FBF     LDA   $F2
            ASL
            ASL
            PHA
            LDX   L0F0040
            LDA   L0F003E
            STA   $F8
            STX   $FA
            LDA   #$0002
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A1FDA
            INC   $FA
L0A1FDA     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A1FE4
            INC   $FA
L0A1FE4     LDA   $EC
            STA   [$F8]
            LDA   $F2
            CLC
            ADC   #$0001
            STA   $F2
L0A1FF0     BRL   L0A1F45
L0A1FF3     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F2
            LDY   #$0060
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0062
            STA   [$F8],Y
            JSL   L030FA2
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$002E
            STA   [$F8],Y
            PEA   $0001
            JSL   L0B1E73
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0A203C     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EA
            TCS
            LDA   #$0001
            STA   $EC
            PEI   $FD
            PEI   $FB
            JSL   L0C04CD
            PLY
            PLY
            STA   $EE
            LDA   L0F00CB
            CMP   #$0006
            BNE   L0A2063
            BRL   L0A2117
L0A2063     PEI   $FF
            PEI   $EE
            PEA   ^L0E2E68
            PEA   L0E2E68
            PEI   $FD
            PEI   $FB
            JSL   L0C04FA
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STA   $F0
            LDA   L0F00CB
            CMP   #$0000
            BEQ   L0A2089
            BRA   L0A2097
L0A2089     LDA   $F0
            CMP   #$0000
            BEQ   L0A2092
            STZ   $EC
L0A2092     BRL   L0A2115
            BRA   L0A209E
L0A2097     CMP   #$0001
            BEQ   L0A209E
            BRA   L0A20AC
L0A209E     LDA   $F0
            CMP   #$0000
            BNE   L0A20A7
            STZ   $EC
L0A20A7     BRL   L0A2115
            BRA   L0A20B3
L0A20AC     CMP   #$0004
            BEQ   L0A20B3
            BRA   L0A20C9
L0A20B3     LDA   $F0
            SEC
            SBC   #$0000
            BEQ   L0A20C4
            BVS   L0A20C0
            EOR   #$8000
L0A20C0     BPL   L0A20C4
            STZ   $EC
L0A20C4     BRL   L0A2115
            BRA   L0A20D0
L0A20C9     CMP   #$0005
            BEQ   L0A20D0
            BRA   L0A20E3
L0A20D0     LDA   $F0
            SEC
            SBC   #$0000
            BVS   L0A20DB
            EOR   #$8000
L0A20DB     BMI   L0A20DF
            STZ   $EC
L0A20DF     BRA   L0A2115
            BRA   L0A20EA
L0A20E3     CMP   #$0002
            BEQ   L0A20EA
            BRA   L0A20FF
L0A20EA     LDA   $F0
            SEC
            SBC   #$FFFF
            BEQ   L0A20FB
            BVS   L0A20F7
            EOR   #$8000
L0A20F7     BPL   L0A20FB
            STZ   $EC
L0A20FB     BRA   L0A2115
            BRA   L0A2106
L0A20FF     CMP   #$0003
            BEQ   L0A2106
            BRA   L0A2115
L0A2106     LDA   $F0
            SEC
            SBC   #$0001
            BVS   L0A2111
            EOR   #$8000
L0A2111     BMI   L0A2115
            STZ   $EC
L0A2115     BRA   L0A2136
L0A2117     PEI   $FF
            PEA   ^L0E2E68
            PEA   L0E2E68
            PEI   $EE
            PEI   $FD
            PEI   $FB
            JSL   L0A2142
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BNE   L0A2136
            STZ   $EC
L0A2136     LDA   $EC
            TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0A2142     PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E0
            TCS
            LDA   $FF
            STA   $E8
            LDA   $F9
            STA   $E4
L0A2155     LDA   $E8
            SEC
            SBC   $E4
            BEQ   L0A2166
            BVS   L0A2161
            EOR   #$8000
L0A2161     BPL   L0A2166
            BRL   L0A2271
L0A2166     LDA   $FF
            STA   $E6
L0A216A     LDA   $E6
            CMP   #$0000
            BEQ   L0A21D4
            LDA   $E6
            SEC
            SBC   #$0001
            PHA
            LDX   $FD
            LDA   $FB
            STA   $EC
            STX   $EE
            PLA
            TAY
            BPL   L0A2186
            DEC   $EE
L0A2186     CLC
            ADC   $EC
            STA   $EC
            BCC   L0A218F
            INC   $EE
L0A218F     LDA   [$EC]
            AND   #$00FF
            PHA
            LDA   $E8
            SEC
            SBC   #$0001
            PHA
            LDX   $F7
            LDA   $F5
            STA   $EC
            STX   $EE
            PLA
            TAY
            BPL   L0A21AA
            DEC   $EE
L0A21AA     CLC
            ADC   $EC
            STA   $EC
            BCC   L0A21B3
            INC   $EE
L0A21B3     LDA   [$EC]
            AND   #$00FF
            PHA
            JSL   L0C05F9
            PLY
            PLY
            TAY
            BNE   L0A21D4
            LDA   $E8
            SEC
            SBC   #$0001
            STA   $E8
            LDA   $E6
            SEC
            SBC   #$0001
            STA   $E6
            BRA   L0A216A
L0A21D4     LDA   $E6
            CMP   #$0000
            BNE   L0A21E4
            LDA   #$0001
            BRL   L0A2274
            BRL   L0A226E
L0A21E4     STZ   $E2
            LDA   $E6
            SEC
            SBC   #$0001
            STA   $EA
L0A21EE     LDA   $EA
            SEC
            SBC   #$0000
            BEQ   L0A225E
            BVS   L0A21FB
            EOR   #$8000
L0A21FB     BPL   L0A225E
            LDA   $EA
            SEC
            SBC   #$0001
            PHA
            LDX   $FD
            LDA   $FB
            STA   $EC
            STX   $EE
            PLA
            TAY
            BPL   L0A2212
            DEC   $EE
L0A2212     CLC
            ADC   $EC
            STA   $EC
            BCC   L0A221B
            INC   $EE
L0A221B     LDA   [$EC]
            AND   #$00FF
            PHA
            LDA   $E8
            SEC
            SBC   #$0001
            PHA
            LDX   $F7
            LDA   $F5
            STA   $EC
            STX   $EE
            PLA
            TAY
            BPL   L0A2236
            DEC   $EE
L0A2236     CLC
            ADC   $EC
            STA   $EC
            BCC   L0A223F
            INC   $EE
L0A223F     LDA   [$EC]
            AND   #$00FF
            PHA
            JSL   L0C05F9
            PLY
            PLY
            TAY
            BNE   L0A2254
            LDA   $EA
            STA   $E2
            BRA   L0A225E
L0A2254     LDA   $EA
            SEC
            SBC   #$0001
            STA   $EA
            BRA   L0A21EE
L0A225E     LDA   $FF
            SEC
            SBC   $E2
            PHA
            LDA   $E8
            PLX
            STX   $EC
            CLC
            ADC   $EC
            STA   $E8
L0A226E     BRL   L0A2155
L0A2271     LDA   #$0000
L0A2274     TAY
            TDC
            CLC
            ADC   #$00EF
            TCS
            TYA
            PLD
            RTL

L0A227E     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E8
            TCS
            PEA   $0000
            JSL   L0B1E73
            PLY
            PEA   ^L0E2E98
            PEA   L0E2E98
            JSL   L0C04CD
            PLY
            PLY
            CMP   #$0000
            BNE   L0A22B8
            LDA   #$0001
            SEP   #$20
            STAL  L0E2E98
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STAL  L0E2E99
            REP   #$20
L0A22B8     PEA   ^L0E2EC8
            PEA   L0E2EC8
            JSL   L0C04CD
            PLY
            PLY
            CMP   #$0000
            BNE   L0A22DF
            LDA   #$007F
            SEP   #$20
            STAL  L0E2EC8
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STAL  L0E2EC9
            REP   #$20
L0A22DF     STZ   $F2
            PEA   ^L0E2E98
            PEA   L0E2E98
            JSL   L0C04CD
            PLY
            PLY
            STA   $EE
            PEA   ^L0E2EC8
            PEA   L0E2EC8
            JSL   L0C04CD
            PLY
            PLY
            STA   $EC
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            JSL   L081516
            PLY
            LDA   L0F0125
            PHA
            LDA   #$000C
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   #$004A
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A2336
            INC   $FA
L0A2336     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A2340
            INC   $FA
L0A2340     LDA   [$F8]
            STA   $F4
            LDA   #$FFFF
            STA   $F6
L0A2349     LDA   #$0001
            BNE   L0A2351
            BRL   L0A23FA
L0A2351     PEI   $F6
            JSL   L0A24B8
            PLY
            STA   $F6
            LDA   $F6
            CMP   #$FFFF
            BNE   L0A2364
            BRL   L0A23FA
L0A2364     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0A2379
            INX
L0A2379     PHX
            PHA
            PEI   $F4
            PEI   $F6
            JSL   L0A1DE4
            PLY
            PLY
            PLY
            PLY
            STA   $EA
            PEI   $EC
            PEI   $EE
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0A23A2
            INX
L0A23A2     PHX
            PHA
            JSL   L0A2443
            PLY
            PLY
            PLY
            PLY
            STA   $F0
            LDA   L0F00C9
            CMP   #$0007
            BNE   L0A23BA
            LDA   $F0
            BNE   L0A23C6
L0A23BA     LDA   L0F00C9
            CMP   #$0008
            BNE   L0A23F7
            LDA   $F0
            BNE   L0A23F7
L0A23C6     LDA   $F2
            ASL
            ASL
            PHA
            LDX   L0F0040
            LDA   L0F003E
            STA   $F8
            STX   $FA
            LDA   #$0002
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A23E1
            INC   $FA
L0A23E1     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0A23EB
            INC   $FA
L0A23EB     LDA   $EA
            STA   [$F8]
            LDA   $F2
            CLC
            ADC   #$0001
            STA   $F2
L0A23F7     BRL   L0A2349
L0A23FA     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F2
            LDY   #$0060
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0062
            STA   [$F8],Y
            JSL   L030FA2
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$002E
            STA   [$F8],Y
            PEA   $0001
            JSL   L0B1E73
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0A2443     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            PEI   $FB
            PEI   $F9
            JSL   L0C04CD
            PLY
            PLY
            STA   $EE
            PEI   $FD
            PEI   $EE
            PEA   ^L0E2E98
            PEA   L0E2E98
            PEI   $FB
            PEI   $F9
            JSL   L0C04FA
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            SEC
            SBC   #$0000
            BVS   L0A247D
            EOR   #$8000
L0A247D     BPL   L0A24AB
            PEI   $FF
            PEI   $EE
            PEA   ^L0E2EC8
            PEA   L0E2EC8
            PEI   $FB
            PEI   $F9
            JSL   L0C04FA
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            SEC
            SBC   #$0000
            BEQ   L0A24A6
            BVS   L0A24A4
            EOR   #$8000
L0A24A4     BMI   L0A24AB
L0A24A6     LDA   #$0001
            BRA   L0A24AE
L0A24AB     LDA   #$0000
L0A24AE     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0A24B8     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0062
            LDA   [$F6],Y
            BEQ   L0A24FF
            LDX   L0F002C
            LDA   L0F002A
            STA   $F6
            STX   $F8
            LDA   [$F6]
            SEC
            SBC   #$0001
            SEC
            SBC   $FF
            BEQ   L0A24FA
            BVS   L0A24EE
            EOR   #$8000
L0A24EE     BPL   L0A24FA
            LDA   $FF
            CLC
            ADC   #$0001
            BRA   L0A252B
            BRA   L0A24FF
L0A24FA     LDA   #$FFFF
            BRA   L0A252B
L0A24FF     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0060
            LDA   [$F6],Y
            SEC
            SBC   #$0001
            SEC
            SBC   $FF
            BEQ   L0A2528
            BVS   L0A251C
            EOR   #$8000
L0A251C     BPL   L0A2528
            LDA   $FF
            CLC
            ADC   #$0001
            BRA   L0A252B
            BRA   L0A252B
L0A2528     LDA   #$FFFF
L0A252B     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0A2535     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            JSL   L0702F3
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0A254C     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            JSL   L06224C
            CMP   #$0001
            BNE   L0A2566
            LDA   #$000E
            STA   L0F0012
L0A2566     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0A256E     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            JSL   L081BC8
            PLY
            PLY
            JSL   L083D9E
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0062
            LDA   [$F8],Y
            BNE   L0A25E2
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0060
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BEQ   L0A25F9
            BVS   L0A25E0
            EOR   #$8000
L0A25E0     BPL   L0A25F9
L0A25E2     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            PHA
            JSL   L0703BA
            PLY
            BRA   L0A260B
L0A25F9     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   [$F8]
            PHA
            JSL   L0703BA
            PLY
L0A260B     STZ   L0F0012
            JSL   L080000
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0A261A     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   [$F8]
            PHA
            JSL   L0703BA
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0062
            LDA   [$F8],Y
            BEQ   L0A266B
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   [$F8]
            BRA   L0A267A
            BRA   L0A267A
L0A266B     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0060
            LDA   [$F8],Y
L0A267A     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0A2684     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
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
            STA   L0F0598
            LDA   L0F0598
            CMP   #$0000
            BEQ   L0A26F2
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
            BRL   L0A277A
L0A26F2     JSL   L0A2784
            LDX   #$0000
            TAY
            BPL   L0A26FD
            DEX
L0A26FD     STX   $F6
            STA   $F4
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $F6
            LDA   $F4
            JSL   L0D157E
            BEQ   L0A2744
            LDX   #$FFFF
            LDA   #$FFFF
            PHX
            PHA
            LDX   $F6
            LDA   $F4
            JSL   L0D157E
            BEQ   L0A2744
            PEA   $0001
            JSL   L0B1E73
            PLY
            PEI   $F6
            PEI   $F4
            JSL   L0617E1
            PLY
            PLY
L0A2744     LDA   L0F05B1
            SEC
            SBC   #$0000
            BEQ   L0A275E
            BVS   L0A2752
            EOR   #$8000
L0A2752     BPL   L0A275E
            LDA   #$0001
            STA   L0F0042
            JSL   L011281
L0A275E     PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   $F4
            CMP   #$0000
            BNE   L0A277A
            LDA   $F6
            CMP   #$0000
            BNE   L0A277A
            LDA   #$0001
            STA   L0F0006
L0A277A     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0A2784     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            STZ   L0F05A4
            STZ   L0F05B1
            STZ   L0F05AD
            LDA   #$0001
            STA   L0F05AB
            STZ   L0F05AF
            JSL   L0A0A02
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            BCC   L0A27BA
            INX
L0A27BA     STX   L0F059E
            STA   L0F059C
            STZ   L0F05A6
            LDAL  L0E32CF
            STAL  L0E32D9
L0A27CB     LDA   #$0001
            BNE   L0A27D3
            BRL   L0A2916
L0A27D3     LDX   #$0000
            TDC
            CLC
            ADC   #$00F2
            PHA
            TXA
            STAL  L0E32DD
            PLA
            STAL  L0E32DB
            LDX   #$0000
            LDA   #$0001
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
            CMP   #$004C
            BNE   L0A2812
            LDA   #$0000
            BRL   L0A2916
L0A2812     LDA   $F2
            AND   #$00FF
            STA   L0F059A
            LDA   L0F059A
            CMP   #$000D
            BEQ   L0A282A
            LDA   L0F059A
            CMP   #$000A
            BNE   L0A2882
L0A282A     LDA   L0F05AB
            BEQ   L0A287F
            JSL   L0A2920
            LDX   #$0000
            TAY
            BPL   L0A283A
            DEX
L0A283A     STX   $F6
            STA   $F4
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $F6
            LDA   $F4
            JSL   L0D157E
            BEQ   L0A2857
            LDX   $F6
            LDA   $F4
            BRL   L0A2916
L0A2857     JSL   L0A2C00
            LDX   #$0000
            TAY
            BPL   L0A2862
            DEX
L0A2862     STX   $F6
            STA   $F4
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $F6
            LDA   $F4
            JSL   L0D157E
            BEQ   L0A287F
            LDX   $F6
            LDA   $F4
            BRL   L0A2916
L0A287F     BRL   L0A2913
L0A2882     LDA   #$0001
            STA   L0F05AB
            LDA   L0F059A
            CMP   #$0009
            BEQ   L0A289D
            LDA   L0F05AF
            BNE   L0A28C8
            LDA   L0F059A
            CMP   #$002C
            BNE   L0A28C8
L0A289D     JSL   L0A2920
            LDX   #$0000
            TAY
            BPL   L0A28A8
            DEX
L0A28A8     STX   $F6
            STA   $F4
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $F6
            LDA   $F4
            JSL   L0D157E
            BEQ   L0A28C5
            LDX   $F6
            LDA   $F4
            BRL   L0A2916
L0A28C5     BRL   L0A2913
L0A28C8     LDA   L0F059A
            CMP   #$0022
            BNE   L0A28E2
            LDA   L0F05AF
            BEQ   L0A28DA
            STZ   L0F05AF
            BRA   L0A28E0
L0A28DA     LDA   #$0001
            STA   L0F05AF
L0A28E0     BRA   L0A2913
L0A28E2     LDA   $F2
            AND   #$00FF
            AND   #$0080
            CMP   #$0000
            BNE   L0A290E
            LDX   L0F059E
            LDA   L0F059C
            STA   $F8
            STX   $FA
            LDA   $F2
            SEP   #$20
            STA   [$F8]
            REP   #$20
            INC   L0F059C
            BNE   L0A2909
            INC   L0F059E
L0A2909     INC   L0F05A6
            BRA   L0A2913
L0A290E     LDA   #$FFE9
            BRA   L0A2916
L0A2913     BRL   L0A27CB
L0A2916     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0A2920     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EE
            TCS
            LDA   L0F05A6
            STA   $F6
            STZ   L0F05A6
            INC   L0F05A4
            LDX   L0F059E
            LDA   L0F059C
            STA   $F8
            STX   $FA
            LDA   #$0000
            SEP   #$20
            STA   [$F8]
            REP   #$20
            LDA   L0F05B1
            CMP   #$0000
            BEQ   L0A2982
            LDA   L0F05A4
            SEC
            SBC   L0F05AD
            BEQ   L0A2982
            BVS   L0A295F
            EOR   #$8000
L0A295F     BPL   L0A2982
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            BCC   L0A2976
            INX
L0A2976     STX   L0F059E
            STA   L0F059C
            LDA   #$0000
            BRL   L0A2BF6
L0A2982     LDA   L0F05A4
            SEC
            SBC   #$0001
            PHA
            JSL   L0A2CC0
            PLY
            LDA   L0F05A8
            AND   #$00FF
            CMP   #$0008
            BEQ   L0A29AF
            LDA   $F6
            SEC
            SBC   L0F05A9
            BEQ   L0A29AF
            BVS   L0A29A7
            EOR   #$8000
L0A29A7     BPL   L0A29AF
            LDA   #$FFE5
            BRL   L0A2BF6
L0A29AF     LDA   L0F05A8
            AND   #$00FF
            CMP   #$0000
            BEQ   L0A29BC
            BRA   L0A29C5
L0A29BC     LDA   $F6
            STA   $F4
            BRL   L0A2B37
            BRA   L0A29CC
L0A29C5     CMP   #$0001
            BEQ   L0A29CC
            BRA   L0A29F7
L0A29CC     PEI   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0A29E3
            INX
L0A29E3     PHX
            PHA
            PEA   $0001
            JSL   L0B0000
            PLY
            PLY
            PLY
            PLY
            STA   $F4
            BRL   L0A2B37
            BRA   L0A29FE
L0A29F7     CMP   #$0002
            BEQ   L0A29FE
            BRA   L0A2A29
L0A29FE     PEI   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0A2A15
            INX
L0A2A15     PHX
            PHA
            PEA   $0001
            JSL   L0B0397
            PLY
            PLY
            PLY
            PLY
            STA   $F4
            BRL   L0A2B37
            BRA   L0A2A30
L0A2A29     CMP   #$0004
            BEQ   L0A2A30
            BRA   L0A2A5B
L0A2A30     PEI   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0A2A47
            INX
L0A2A47     PHX
            PHA
            PEA   $0001
            JSL   L0B0DD6
            PLY
            PLY
            PLY
            PLY
            STA   $F4
            BRL   L0A2B37
            BRA   L0A2A62
L0A2A5B     CMP   #$0006
            BEQ   L0A2A62
            BRA   L0A2A89
L0A2A62     PEI   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0A2A79
            INX
L0A2A79     PHX
            PHA
            JSL   L0B0F15
            PLY
            PLY
            PLY
            STA   $F4
            BRL   L0A2B37
            BRA   L0A2A90
L0A2A89     CMP   #$0003
            BEQ   L0A2A90
            BRA   L0A2ABB
L0A2A90     PEI   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0A2AA7
            INX
L0A2AA7     PHX
            PHA
            PEA   $0001
            JSL   L0B08D7
            PLY
            PLY
            PLY
            PLY
            STA   $F4
            BRL   L0A2B37
            BRA   L0A2AC2
L0A2ABB     CMP   #$0007
            BEQ   L0A2AC2
            BRA   L0A2AE9
L0A2AC2     PEI   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0A2AD9
            INX
L0A2AD9     PHX
            PHA
            JSL   L0B0FA7
            PLY
            PLY
            PLY
            STA   $F4
            BRL   L0A2B37
            BRA   L0A2AF0
L0A2AE9     CMP   #$0005
            BEQ   L0A2AF0
            BRA   L0A2B16
L0A2AF0     PEI   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0A2B07
            INX
L0A2B07     PHX
            PHA
            JSL   L0B1072
            PLY
            PLY
            PLY
            STA   $F4
            BRA   L0A2B37
            BRA   L0A2B1D
L0A2B16     CMP   #$0008
            BEQ   L0A2B1D
            BRA   L0A2B37
L0A2B1D     STZ   $F4
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            SEP   #$20
            LDY   #$090E
            STA   [$F8],Y
            REP   #$20
            STZ   $F6
L0A2B37     LDA   $F4
            SEC
            SBC   #$0000
            BVS   L0A2B42
            EOR   #$8000
L0A2B42     BMI   L0A2B4A
            LDA   #$FFE6
            BRL   L0A2BF6
L0A2B4A     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$00BA
            BCC   L0A2B5F
            INX
L0A2B5F     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0A2B76
            INX
L0A2B76     PHX
            PHA
            LDA   L0F05A4
            SEC
            SBC   #$0001
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            JSL   L082D81
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #L0E2A36
            LDX   #^L0E2A36
            STX   $F2
            STA   $F0
            LDA   [$F0]
            LDX   #$0000
            TAY
            BPL   L0A2BAF
            DEX
L0A2BAF     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$00BA
            BCC   L0A2BC6
            INX
L0A2BC6     PHX
            PHA
            PEI   $F2
            PEI   $F0
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            BCC   L0A2BED
            INX
L0A2BED     STX   L0F059E
            STA   L0F059C
            LDA   #$0000
L0A2BF6     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0A2C00     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            STZ   L0F05AB
            LDA   L0F05B1
            CMP   #$0000
            BNE   L0A2C1E
            LDA   L0F05A4
            STA   L0F05AD
            BRA   L0A2C45
L0A2C1E     LDA   L0F05A4
            CMP   L0F05AD
            BEQ   L0A2C45
            LDAL  L0E49D2
            TAX
            LDAL  L0E49D0
            PHX
            PHA
            JSL   L0A2D50
            PLY
            PLY
            LDA   L0F00E1
            CMP   #$0000
            BEQ   L0A2C45
            LDA   #$FFFF
            BRL   L0A2CB6
L0A2C45     STZ   $F6
            LDA   L0F05A4
            CMP   L0F05AD
            BNE   L0A2C92
            INC   L0F05B1
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0A10
            LDA   [$F8],Y
            TAX
            LDY   #$0A0E
            LDA   [$F8],Y
            STA   $F8
            STX   $FA
            LDA   [$F8]
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$00BA
            BCC   L0A2C83
            INX
L0A2C83     PHX
            PHA
            PEA   $0000
            JSL   L080F25
            PLY
            PLY
            PLY
            PLY
            STA   $F6
L0A2C92     STZ   L0F05A4
            JSL   L0A0A02
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            BCC   L0A2CAE
            INX
L0A2CAE     STX   L0F059E
            STA   L0F059C
            LDA   $F6
L0A2CB6     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0A2CC0     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F6
            STX   $F8
            LDA   #$004C
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A2CE9
            INC   $F8
L0A2CE9     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A2CF3
            INC   $F8
L0A2CF3     LDA   [$F6]
            AND   #$00FF
            SEP   #$20
            STA   L0F05A8
            REP   #$20
            LDA   L0F05A8
            AND   #$00FF
            CMP   #$0008
            BEQ   L0A2D48
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F6
            STX   $F8
            LDA   #$004D
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A2D28
            INC   $F8
L0A2D28     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0A2D32
            INC   $F8
L0A2D32     LDA   [$F6]
            AND   #$00FF
            STA   L0F05A9
            LDA   L0F05A9
            CMP   #$0000
            BNE   L0A2D48
            LDA   #$0040
            STA   L0F05A9
L0A2D48     TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0A2D50     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDX   $FF
            LDA   $FD
            STX   $F2
            STA   $F0
            PEA   $0002
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0002
            JSL   L0D00BF
            PLY
            PLY
            PLY
            PLY
            PLY
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL


