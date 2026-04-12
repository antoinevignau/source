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

	use	SEG3.X.S
	
GSOS	=	$E100A8

*-----------------------------------

L070000     PHD
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
            LDY   #$0052
            LDA   [$F8],Y
            SEC
            SBC   #$0010
            BVS   L070023
            EOR   #$8000
L070023     BMI   L07004D
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0052
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$005C
            LDA   [$F8],Y
            PHA
            JSL   L0C09C0
            PLY
            PLY
            BRA   L070077
L07004D     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0052
            LDA   [$F8],Y
            SEC
            SBC   #$0010
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$005E
            LDA   [$F8],Y
            PHA
            JSL   L0C09C0
            PLY
            PLY
L070077     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L070081     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            SEC
            SBC   #$0010
            BVS   L070097
            EOR   #$8000
L070097     BMI   L0700C4
            PEI   $FF
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$005C
            LDA   [$F6],Y
            PHA
            JSL   L0C09E6
            PLY
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$005C
            STA   [$F6],Y
            BRA   L0700F2
L0700C4     LDA   $FF
            SEC
            SBC   #$0010
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$005E
            LDA   [$F6],Y
            PHA
            JSL   L0C09E6
            PLY
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$005E
            STA   [$F6],Y
L0700F2     TDC
            CLC
            ADC   #$00F9
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
            LDY   #$0052
            LDA   [$F8],Y
            SEC
            SBC   #$0010
            BVS   L07011D
            EOR   #$8000
L07011D     BMI   L070158
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0052
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$005C
            LDA   [$F8],Y
            PHA
            JSL   L0C0A0C
            PLY
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$005C
            STA   [$F8],Y
            BRA   L070193
L070158     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0052
            LDA   [$F8],Y
            SEC
            SBC   #$0010
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$005E
            LDA   [$F8],Y
            PHA
            JSL   L0C0A0C
            PLY
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$005E
            STA   [$F8],Y
L070193     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L07019B     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EA
            TCS
            LDA   $FD
            PHA
            LDA   #$000E
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   #$0020
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0701C9
            INC   $F6
L0701C9     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0701D3
            INC   $F6
L0701D3     LDA   [$F4]
            CMP   $FF
            BNE   L0701DF
            LDA   #$0000
            BRL   L0702E9
L0701DF     LDA   $FF
            BEQ   L070216
            PEA   $0000
            LDA   $FD
            ASL
            ASL
            PHA
            LDA   #L0E182E
            STA   $F4
            LDA   #^L0E182E
            STA   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0701FF
            INC   $F6
L0701FF     LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            PHX
            PHA
            _HiliteControl
            STA   L0F0779
            BRL   L0702B8
L070216     PEA   $00FF
            LDA   $FD
            ASL
            ASL
            PHA
            LDA   #L0E182E
            STA   $F4
            LDA   #^L0E182E
            STA   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L070232
            INC   $F6
L070232     LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            PHX
            PHA
            _HiliteControl
            STA   L0F0779
            LDA   $FD
            ASL
            ASL
            PHA
            LDA   #L0E182E
            STA   $F4
            LDA   #^L0E182E
            STA   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L07025F
            INC   $F6
L07025F     LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STA   $F4
            STX   $F6
            LDA   $F4
            LDX   $F6
            CLC
            ADC   #$0008
            BCC   L070282
            INX
L070282     PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            JSL   L0C0BFE
            PLY
            PLY
            PLY
            PLY
            LDA   $EE
            CLC
            ADC   #$0002
            STA   $EE
            LDA   $F2
            SEC
            SBC   #$0002
            STA   $F2
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            _FrameRect
            STA   L0F0779
L0702B8     LDA   $FD
            PHA
            LDA   #$000E
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   #$0020
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0702DB
            INC   $F6
L0702DB     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0702E5
            INC   $F6
L0702E5     LDA   $FF
            STA   [$F4]
L0702E9     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0702F3     ENT
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
            LDA   #$0000
            LDY   #$004C
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$004E
            STA   [$F8],Y
            PEA   $0000
            JSL   L0705A6
            PLY
            JSL   L0707D5
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0052
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0054
            STA   [$F8],Y
            JSL   L083D9E
            JSL   L083E24
            JSL   L083CF4
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            PHA
            JSL   L0703BA
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L070377     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            PEA   $0000
            PEA   $0000
            JSL   L07019B
            PLY
            PLY
            PEA   $0000
            PEA   $0001
            JSL   L07019B
            PLY
            PLY
            PEA   $0000
            PEA   $0002
            JSL   L07019B
            PLY
            PLY
            PEA   $0000
            PEA   $0003
            JSL   L07019B
            PLY
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0703BA     ENT
            PHD
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
            LDA   $FF
            LDY   #$002E
            STA   [$F6],Y
            JSL   L0A0A02
            PEA   $0001
            JSL   L072765
            PLY
            JSL   L070377
            JSL   L0A0BAA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0022
            LDA   [$F6],Y
            CMP   #$0000
            BNE   L070401
            BRL   L070467
L070401     PEA   $0001
            PEA   $0000
            JSL   L07019B
            PLY
            PLY
            PEA   $0001
            PEA   $0001
            JSL   L07019B
            PLY
            PLY
            PEA   $0001
            PEA   $0003
            JSL   L07019B
            PLY
            PLY
            STZ   $F4
            BRA   L070432
L070429     PEI   $F4
            JSL   L070081
            PLY
            INC   $F4
L070432     LDX   L0F002C
            LDA   L0F002A
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            SEC
            SBC   $F4
            BEQ   L07044D
            BVS   L07044B
            EOR   #$8000
L07044B     BMI   L070429
L07044D     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0001
            LDY   #$000A
            STA   [$F6],Y
            PEA   $0000
            JSL   L072765
            PLY
L070467     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$004C
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$004E
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0001
            LDY   #$006A
            STA   [$F6],Y
            PEA   $0001
            PEA   $0000
            PEA   $0000
            JSL   L070543
            PLY
            PLY
            PLY
            TAY
            BEQ   L0704C0
            PEA   $0001
            JSL   L071FA8
            PLY
            JSL   L071957
            JSL   L070CC7
L0704C0     JSL   L083DB1
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$000A
            STA   [$F6],Y
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0704DE     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDA   #$0000
            LDY   #$004C
            STA   [$F4],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDA   #$0000
            LDY   #$004E
            STA   [$F4],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDA   #$FFFF
            LDY   #$0052
            STA   [$F4],Y
L07051F     LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0052
            LDA   [$F4],Y
            CMP   $FD
            BEQ   L07053B
            PEI   $FF
            JSL   L0705A6
            PLY
            BRA   L07051F
L07053B     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L070543     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
            LDA   #$0001
            STA   $F0
            LDA   $FD
            BNE   L070577
            LDA   $FB
            CMP   #$0000
            BEQ   L070560
            BRA   L07056C
L070560     PEA   $0000
            JSL   L0705A6
            PLY
            BRA   L070577
            BRA   L070573
L07056C     CMP   #$0001
            BEQ   L070573
            BRA   L070577
L070573     JSL   L0707D5
L070577     JSL   L070A42
            LDA   $FF
            BEQ   L070585
            JSL   L070B11
            STA   $F0
L070585     LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0052
            LDA   [$F2],Y
            PHA
            JSL   L070BE2
            PLY
            LDA   $F0
            TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0705A6     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
L0705B1     LDA   #$0001
            BNE   L0705B9
            BRL   L0707CD
L0705B9     LDA   #$0001
            BNE   L0705C1
            BRL   L07073F
L0705C1     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$004E
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$004C
            LDA   [$F6],Y
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F6
            STX   $F8
            LDA   #$0050
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0705FA
            INC   $F8
L0705FA     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L070604
            INC   $F8
L070604     LDA   [$F6]
            PLX
            STX   $F6
            SEC
            SBC   $F6
            BNE   L070611
            BRL   L0706E0
L070611     BVS   L070616
            EOR   #$8000
L070616     BMI   L07061B
            BRL   L0706E0
L07061B     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$004E
            LDA   [$F6],Y
            CMP   #$0000
            BNE   L070643
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$0050
            STA   [$F6],Y
            BRA   L070667
L070643     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0050
            LDA   [$F6],Y
            CLC
            ADC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$0050
            STA   [$F6],Y
L070667     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0050
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$004C
            LDA   [$F6],Y
            PHA
            JSL   L08340A
            PLY
            PLY
            TAY
            BNE   L0706B6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0050
            LDA   [$F6],Y
            CLC
            ADC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$0050
            STA   [$F6],Y
            BRA   L070667
L0706B6     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$004E
            LDA   [$F6],Y
            CLC
            ADC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$004E
            STA   [$F6],Y
            BRL   L07073F
            BRL   L07073C
L0706E0     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$004C
            LDA   [$F6],Y
            CLC
            ADC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$004C
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$004E
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$004C
            LDA   [$F6],Y
            CMP   #$0020
            BNE   L07073C
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$004C
            STA   [$F6],Y
L07073C     BRL   L0705B9
L07073F     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0050
            LDA   [$F6],Y
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F6
            STX   $F8
            LDA   #$0056
            CLC
            ADC   $F6
            STA   $F6
            BCC   L070768
            INC   $F8
L070768     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L070772
            INC   $F8
L070772     LDA   [$F6]
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$0052
            STA   [$F6],Y
            LDA   $FF
            BNE   L0707C8
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0052
            LDA   [$F6],Y
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
            BCC   L0707B4
            INC   $F8
L0707B4     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0707BE
            INC   $F8
L0707BE     LDA   [$F6]
            AND   #$00FF
            CMP   #$0008
            BEQ   L0707CA
L0707C8     BRA   L0707CD
L0707CA     BRL   L0705B1
L0707CD     TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0707D5     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
L0707E0     LDA   #$0001
            BNE   L0707E8
            BRL   L070A3A
L0707E8     LDA   #$0001
            BNE   L0707F0
            BRL   L0709B0
L0707F0     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$004E
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            BNE   L070808
            BRL   L070913
L070808     BVS   L07080D
            EOR   #$8000
L07080D     BMI   L070812
            BRL   L070913
L070812     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$004E
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$004C
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
            BCC   L07084B
            INC   $FA
L07084B     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L070855
            INC   $FA
L070855     LDA   [$F8]
            CLC
            ADC   #$0001
            PLX
            STX   $F8
            CMP   $F8
            BNE   L070876
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$001F
            LDY   #$0050
            STA   [$F8],Y
            BRA   L07089A
L070876     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0050
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0050
            STA   [$F8],Y
L07089A     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0050
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$004C
            LDA   [$F8],Y
            PHA
            JSL   L08340A
            PLY
            PLY
            TAY
            BNE   L0708E9
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0050
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0050
            STA   [$F8],Y
            BRA   L07089A
L0708E9     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$004E
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$004E
            STA   [$F8],Y
            BRL   L0709B0
            BRL   L0709AD
L070913     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$004C
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$004C
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$004C
            LDA   [$F8],Y
            SEC
            SBC   #$0000
            BVS   L07094F
            EOR   #$8000
L07094F     BMI   L070963
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$001F
            LDY   #$004C
            STA   [$F8],Y
L070963     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$004C
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
            BCC   L07098C
            INC   $FA
L07098C     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L070996
            INC   $FA
L070996     LDA   [$F8]
            CLC
            ADC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$004E
            STA   [$F8],Y
L0709AD     BRL   L0707E8
L0709B0     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0050
            LDA   [$F8],Y
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
            BCC   L0709D9
            INC   $FA
L0709D9     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0709E3
            INC   $FA
L0709E3     LDA   [$F8]
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0052
            STA   [$F8],Y
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
            BCC   L070A21
            INC   $FA
L070A21     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L070A2B
            INC   $FA
L070A2B     LDA   [$F8]
            AND   #$00FF
            CMP   #$0008
            BEQ   L070A37
            BRA   L070A3A
L070A37     BRL   L0707E0
L070A3A     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L070A42     PHD
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
            BCC   L070A78
            INC   $FA
L070A78     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L070A82
            INC   $FA
L070A82     LDA   [$F8]
            AND   #$00FF
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0058
            STA   [$F8],Y
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
            LDA   #$004D
            CLC
            ADC   $F8
            STA   $F8
            BCC   L070AC3
            INC   $FA
L070AC3     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L070ACD
            INC   $FA
L070ACD     LDA   [$F8]
            AND   #$00FF
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$002A
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002A
            LDA   [$F8],Y
            CMP   #$0000
            BNE   L070B09
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0040
            LDY   #$002A
            STA   [$F8],Y
L070B09     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L070B11     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EE
            TCS
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   [$F8]
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0016
            LDA   [$F8],Y
            PLX
            STX   $F8
            CLC
            ADC   $F8
            SEC
            SBC   #$0002
            STA   $F6
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
            LDA   #$0050
            CLC
            ADC   $F8
            STA   $F8
            BCC   L070B6F
            INC   $FA
L070B6F     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L070B79
            INC   $FA
L070B79     LDA   [$F8]
            STA   $F4
            STZ   $F2
            LDA   $F4
            SEC
            SBC   $F6
            BEQ   L070B96
            BVS   L070B8B
            EOR   #$8000
L070B8B     BPL   L070B96
            LDA   $F4
            SEC
            SBC   $F6
            STA   $F2
            BRA   L070BBE
L070B96     LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0016
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            STA   $F0
            LDA   $F4
            SEC
            SBC   $F0
            BVS   L070BB5
            EOR   #$8000
L070BB5     BMI   L070BBE
            LDA   $F4
            SEC
            SBC   $F0
            STA   $F2
L070BBE     LDA   $F2
            CMP   #$0000
            BEQ   L070BD5
            PEA   $0000
            PEI   $F2
            JSL   L085431
            PLY
            PLY
            LDA   #$0000
            BRA   L070BD8
L070BD5     LDA   #$0001
L070BD8     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L070BE2     ENT
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
            LDA   $FF
            LDY   #$0052
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$00B2
            BCC   L070C13
            INX
L070C13     PHX
            PHA
            JSL   L070E1E
            PLY
            PLY
            PEA   $0005
            JSL   L011FF5
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$00B6
            LDA   [$F6],Y
            PLX
            STX   $F6
            SEC
            SBC   $F6
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$0032
            STA   [$F6],Y
            PEA   $0005
            JSL   L011FF5
            PLY
            CMP   #$0002
            BNE   L070C7B
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0032
            LDA   [$F6],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$0032
            STA   [$F6],Y
L070C7B     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$00B4
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$00B8
            LDA   [$F6],Y
            PLX
            STX   $F6
            SEC
            SBC   $F6
            SEC
            SBC   #$0003
            PHA
            LDA   #$0008
            SEC
            JSL   L0D14B6
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$0026
            STA   [$F6],Y
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L070CC7     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            JSL   L070FFD
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0032
            LDA   [$F8],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BEQ   L070D04
            BVS   L070D02
            EOR   #$8000
L070D02     BMI   L070D30
L070D04     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0032
            LDA   [$F8],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0004
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BVS   L070D2E
            EOR   #$8000
L070D2E     BMI   L070D35
L070D30     LDA   #$0000
            BRA   L070D88
L070D35     LDX   L0F0034
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
            BCC   L070D60
            INC   $FA
L070D60     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L070D6A
            INC   $FA
L070D6A     LDA   [$F8]
            AND   #$00FF
            CMP   #$0008
            BEQ   L070D88
            PEA   $FFFF
            PEA   $0001
            JSL   L0710F9
            PLY
            PLY
            PEA   $0001
            JSL   L070F4C
            PLY
L070D88     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L070D92     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            JSL   L070FFD
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0032
            LDA   [$F8],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BEQ   L070DCF
            BVS   L070DCD
            EOR   #$8000
L070DCD     BMI   L070DFB
L070DCF     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0032
            LDA   [$F8],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0004
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BVS   L070DF9
            EOR   #$8000
L070DF9     BMI   L070E00
L070DFB     LDA   #$0000
            BRA   L070E14
L070E00     PEA   $FFFF
            PEA   $0003
            JSL   L0710F9
            PLY
            PLY
            PEA   $0000
            JSL   L070F4C
            PLY
L070E14     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L070E1E     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0052
            LDA   [$F4],Y
            STA   $F0
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDY   #$0016
            LDA   [$F4],Y
            PHA
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
            LDA   #$0050
            CLC
            ADC   $F4
            STA   $F4
            BCC   L070E78
            INC   $F6
L070E78     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L070E82
            INC   $F6
L070E82     LDA   [$F4]
            PLX
            STX   $F4
            SEC
            SBC   $F4
            CLC
            ADC   #$0001
            PHA
            LDA   #$000F
            SEC
            JSL   L0D151F
            PLA
            PLX
            STX   $F4
            CLC
            ADC   $F4
            STA   $F2
            LDA   $F2
            CLC
            ADC   #$000C
            PHA
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
            LDA   #$0054
            CLC
            ADC   $F4
            STA   $F4
            BCC   L070EC5
            INC   $F6
L070EC5     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L070ECF
            INC   $F6
L070ECF     LDA   [$F4]
            PHA
            PEI   $F2
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
            LDA   #$0056
            CLC
            ADC   $F4
            STA   $F4
            BCC   L070EF2
            INC   $F6
L070EF2     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L070EFC
            INC   $F6
L070EFC     LDA   [$F4]
            PHA
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
            LDA   #$0054
            CLC
            ADC   $F4
            STA   $F4
            BCC   L070F1D
            INC   $F6
L070F1D     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L070F27
            INC   $F6
L070F27     LDA   [$F4]
            PLX
            STX   $F4
            SEC
            SBC   $F4
            CLC
            ADC   #$0001
            PHA
            PEI   $FF
            PEI   $FD
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L070F4C     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EA
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0030
            LDA   [$F6],Y
            STA   $F4
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0032
            LDA   [$F6],Y
            CLC
            ADC   #$0002
            PHA
            LDA   $F4
            CLC
            ADC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0032
            LDA   [$F6],Y
            SEC
            SBC   #$0007
            PHA
            PEI   $F4
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $FF
            BEQ   L070FC7
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            BRA   L070FF5
L070FC7     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$00B8
            LDA   [$F6],Y
            SEC
            SBC   $F2
            BEQ   L070FF5
            BVS   L070FE0
            EOR   #$8000
L070FE0     BPL   L070FF5
            PEA   $0003
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
L070FF5     TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L070FFD     PHD
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
            LDY   #$00B4
            LDA   [$F8],Y
            CLC
            ADC   #$0002
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0030
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0024
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0034
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            PHA
            LDA   #$0008
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0030
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
            PLA
            LDY   #$0030
            STA   [$F8],Y
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L07108A     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002A
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0026
            LDA   [$F8],Y
            PHA
            JSL   L0C0000
            PLY
            PLY
            STA   $F4
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0024
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0056
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            PHA
            LDA   $F4
            PLX
            STX   $F8
            SEC
            SBC   $F8
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

L0710F9     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E4
            TCS
            LDA   $FF
            CMP   #$FFFF
            BNE   L071126
            JSL   L07108A
            STA   $F2
            LDA   $F2
            SEC
            SBC   #$0001
            BVS   L07111C
            EOR   #$8000
L07111C     BMI   L071124
            LDA   #$0000
            BRL   L0711D3
L071124     BRA   L07112B
L071126     LDA   #$0001
            STA   $F2
L07112B     LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0028
            LDA   [$F4],Y
            PHA
            LDA   #$0008
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$00B4
            LDA   [$F4],Y
            PLX
            STX   $F4
            CLC
            ADC   $F4
            CLC
            ADC   #$0003
            STA   $EE
            STZ   $F0
            BRA   L0711C7
L071164     LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0032
            LDA   [$F4],Y
            CLC
            ADC   #$0001
            PHA
            LDA   $EE
            CLC
            ADC   #$0003
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0032
            LDA   [$F4],Y
            PHA
            LDA   $EE
            SEC
            SBC   #$0001
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEI   $FD
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            LDA   $EE
            CLC
            ADC   #$0008
            STA   $EE
            INC   $F0
L0711C7     LDA   $F0
            SEC
            SBC   $F2
            BVS   L0711D1
            EOR   #$8000
L0711D1     BPL   L071164
L0711D3     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0711DD     PHD
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
            LDA   #$0001
            LDY   #$000A
            STA   [$F8],Y
            PEA   $0000
            JSL   L07231B
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$005A
            LDA   [$F8],Y
            CMP   #$0000
            BEQ   L071219
            BRL   L07127A
L071219     LDA   #$0001
            STA   $F6
            LDA   L0F004E
            CMP   #$000B
            BEQ   L071228
            BRA   L071252
L071228     PEA   $0001
            PEA   $0000
            PEA   $0001
            JSL   L070543
            PLY
            PLY
            PLY
            STA   $F6
            BRA   L071254
L07123C     PEA   $0001
            PEA   $0000
            PEA   $0000
            JSL   L070543
            PLY
            PLY
            PLY
            STA   $F6
            BRA   L071254
            BRA   L071254
L071252     BRA   L07123C
L071254     LDA   $F6
            BEQ   L071268
            PEA   $0001
            JSL   L071FA8
            PLY
            JSL   L071957
            JSL   L070CC7
L071268     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$006A
            STA   [$F8],Y
L07127A     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L071282     PHD
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
            LDY   #$0032
            LDA   [$F8],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BEQ   L0712BB
            BVS   L0712B9
            EOR   #$8000
L0712B9     BMI   L0712E7
L0712BB     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0032
            LDA   [$F8],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0004
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BVS   L0712E5
            EOR   #$8000
L0712E5     BMI   L071304
L0712E7     JSL   L070B11
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0052
            LDA   [$F8],Y
            PHA
            JSL   L070BE2
            PLY
            JSL   L070CC7
L071304     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L07130C     ENT
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
            LDY   #$0008
            LDA   [$F8],Y
            BNE   L07132E
            LDA   #$0000
            BRL   L071598
L07132E     LDAL  L0E0030+2
            TAX
            LDAL  L0E0030
            AND   #$00FF
            PHA
            TXA
            AND   #$0000
            TAX
            PLA
            STA   L0F004E
            LDA   L0F004E
            SEP   #$20
            STA   L0F00AA
            REP   #$20
            LDA   L0F004E
            CMP   #$007F
            BEQ   L071359
            BRL   L0713C3
L071359     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0056
            LDA   [$F8],Y
            SEC
            SBC   #$0000
            BEQ   L0713BE
            BVS   L071373
            EOR   #$8000
L071373     BPL   L0713BE
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0034
            LDA   [$F8],Y
            SEC
            SBC   #$0000
            BEQ   L0713BE
            BVS   L07138F
            EOR   #$8000
L07138F     BPL   L0713BE
            JSL   L071282
            JSL   L0717CB
            LDA   L0F00AA
            SEP   #$20
            STA   $F6
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STA   $F7
            REP   #$20
            PEA   $0000
            TDC
            CLC
            ADC   #$00F6
            PHA
            PEA   $0001
            JSL   L0719F7
            PLY
            PLY
            PLY
L0713BE     BRL   L071598
            BRA   L0713D4
L0713C3     CMP   #$000B
            BEQ   L0713D4
            CMP   #$000A
            BEQ   L0713D4
            CMP   #$0009
            BEQ   L0713D4
            BRA   L0713DD
L0713D4     JSL   L0711DD
            BRL   L071598
            BRA   L0713EA
L0713DD     CMP   #$000D
            BEQ   L0713EA
            CMP   #$000D
            BEQ   L0713EA
            BRL   L0714A9
L0713EA     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0056
            LDA   [$F8],Y
            CMP   #$0000
            BEQ   L071401
            BRL   L07145F
L071401     LDA   #$0001
            STA   L0F0066
            PEA   $0000
            JSL   L071FA8
            PLY
            STZ   L0F0066
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0056
            LDA   [$F8],Y
            SEC
            SBC   #$0000
            BEQ   L071449
            BVS   L07142C
            EOR   #$8000
L07142C     BPL   L071449
            JSL   L071F3E
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0052
            LDA   [$F8],Y
            PHA
            JSL   L070081
            PLY
            BRA   L07144D
L071449     JSL   L070CC7
L07144D     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$000A
            STA   [$F8],Y
L07145F     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0052
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0054
            LDA   [$F8],Y
            PLX
            STX   $F8
            CMP   $F8
            BNE   L0714A0
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            CLC
            ADC   #$0001
            PHA
            JSL   L0A0C4A
            PLY
            BRA   L0714A4
L0714A0     JSL   L0711DD
L0714A4     BRL   L071598
            BRA   L0714B0
L0714A9     CMP   #$001B
            BEQ   L0714B0
            BRA   L0714B5
L0714B0     BRL   L071598
            BRA   L0714BD
L0714B5     CMP   #$0015
            BEQ   L0714BD
            BRL   L07152C
L0714BD     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0034
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0056
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BEQ   L071527
            BVS   L0714E9
            EOR   #$8000
L0714E9     BPL   L071527
            JSL   L0716E6
            PEA   $0000
            JSL   L070F4C
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0034
            LDA   [$F8],Y
            CLC
            ADC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0034
            STA   [$F8],Y
            JSL   L070FFD
            PEA   $0001
            JSL   L070F4C
            PLY
L071527     BRL   L071598
            BRA   L071534
L07152C     CMP   #$0008
            BEQ   L071534
            BRL   L071596
L071534     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0034
            LDA   [$F8],Y
            SEC
            SBC   #$0000
            BEQ   L07158C
            BVS   L07154E
            EOR   #$8000
L07154E     BPL   L07158C
            JSL   L0717CB
            PEA   $0000
            JSL   L070F4C
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0034
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0034
            STA   [$F8],Y
            JSL   L070FFD
            PEA   $0001
            JSL   L070F4C
            PLY
L07158C     BRA   L071598
L07158E     JSL   L0715A2
            BRA   L071598
            BRA   L071598
L071596     BRA   L07158E
L071598     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0715A2     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDA   L0F00AA
            SEP   #$20
            STA   $F6
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STA   $F7
            REP   #$20
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0056
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
            LDA   [$F8]
            PLX
            STX   $F8
            CLC
            ADC   $F8
            CLC
            ADC   #$0001
            STA   $F4
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0056
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002A
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BNE   L071620
            BRL   L0716DE
L071620     BVS   L071625
            EOR   #$8000
L071625     BMI   L07162A
            BRL   L0716DE
L07162A     LDA   $F4
            SEC
            SBC   #$042A
            BVS   L071635
            EOR   #$8000
L071635     BPL   L07163A
            BRL   L0716DE
L07163A     JSL   L071282
            JSL   L0716E6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0068
            LDA   [$F8],Y
            BNE   L071656
            BRL   L0716CB
L071656     LDA   L0F00AA
            AND   #$00FF
            CMP   #$0020
            BNE   L071675
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$006A
            STA   [$F8],Y
            BRA   L0716CB
L071675     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$006A
            LDA   [$F8],Y
            BEQ   L0716CB
            LDA   L0F00AA
            AND   #$00FF
            SEC
            SBC   #$007A
            BEQ   L071699
            BVS   L071697
            EOR   #$8000
L071697     BMI   L0716B9
L071699     LDA   L0F00AA
            AND   #$00FF
            SEC
            SBC   #$0061
            BVS   L0716A8
            EOR   #$8000
L0716A8     BPL   L0716B9
            LDA   $F6
            AND   #$00FF
            SEC
            SBC   #$0020
            SEP   #$20
            STA   $F6
            REP   #$20
L0716B9     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$006A
            STA   [$F8],Y
L0716CB     PEA   $0000
            TDC
            CLC
            ADC   #$00F6
            PHA
            PEA   $0000
            JSL   L0719F7
            PLY
            PLY
            PLY
L0716DE     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0716E6     PHD
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
            LDY   #$0056
            LDA   [$F8],Y
            SEC
            SBC   #$0000
            BNE   L071709
            BRL   L0717C3
L071709     BVS   L07170E
            EOR   #$8000
L07170E     BMI   L071713
            BRL   L0717C3
L071713     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0024
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0034
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            CLC
            ADC   #$0001
            STA   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0026
            LDA   [$F8],Y
            SEC
            SBC   $F6
            BVS   L071755
            EOR   #$8000
L071755     BPL   L07175A
            BRL   L0717C3
L07175A     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0026
            LDA   [$F8],Y
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLY
            STA   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0024
            LDA   [$F8],Y
            CLC
            ADC   $F6
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0024
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0028
            LDA   [$F8],Y
            SEC
            SBC   $F6
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0028
            STA   [$F8],Y
            JSL   L071957
            JSL   L070CC7
L0717C3     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0717CB     PHD
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
            LDY   #$0024
            LDA   [$F8],Y
            SEC
            SBC   #$0000
            BNE   L0717EE
            BRL   L0718C8
L0717EE     BVS   L0717F3
            EOR   #$8000
L0717F3     BMI   L0717F8
            BRL   L0718C8
L0717F8     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0024
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0034
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            SEC
            SBC   #$0001
            STA   $F6
            LDA   $F6
            SEC
            SBC   #$0000
            BEQ   L071835
            BVS   L071830
            EOR   #$8000
L071830     BPL   L071835
            BRL   L0718C8
L071835     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0026
            LDA   [$F8],Y
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLY
            STA   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0024
            LDA   [$F8],Y
            SEC
            SBC   $F6
            BVS   L071867
            EOR   #$8000
L071867     BMI   L07187A
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0024
            LDA   [$F8],Y
            STA   $F6
L07187A     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0024
            LDA   [$F8],Y
            SEC
            SBC   $F6
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0024
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0028
            LDA   [$F8],Y
            CLC
            ADC   $F6
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0028
            STA   [$F8],Y
            JSL   L071957
            JSL   L070CC7
L0718C8     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0718D0     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EE
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$00B6
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$00B8
            LDA   [$F8],Y
            SEC
            SBC   #$0002
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$00B2
            LDA   [$F8],Y
            CLC
            ADC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$00B4
            LDA   [$F8],Y
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0003
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L071957     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            JSL   L0718D0
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0056
            LDA   [$F8],Y
            CMP   #$0000
            BNE   L071980
            LDA   #$0000
            BRL   L0719ED
L071980     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0028
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0056
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0719BC
            INC   $FA
L0719BC     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0719C6
            INC   $FA
L0719C6     LDA   $F8
            LDX   $FA
            STX   $F6
            STA   $F4
            PEI   $F6
            PEI   $F4
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$00B4
            LDA   [$F8],Y
            CLC
            ADC   #$0002
            PHA
            JSL   L071E1E
            PLY
            PLY
            PLY
L0719ED     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0719F7     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E2
            TCS
            JSL   L071F3E
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDA   #$0001
            LDY   #$000A
            STA   [$F2],Y
            JSL   L070FFD
            PEA   $0000
            JSL   L070F4C
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0034
            LDA   [$F2],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDA   #$090E
            CLC
            ADC   $F2
            STA   $F2
            BCC   L071A4A
            INC   $F4
L071A4A     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L071A54
            INC   $F4
L071A54     LDA   $F2
            LDX   $F4
            STX   $F0
            STA   $EE
            LDA   $FB
            BEQ   L071A63
            BRL   L071BA1
L071A63     LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0034
            LDA   [$F2],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0056
            LDA   [$F2],Y
            PLX
            STX   $F2
            CMP   $F2
            BNE   L071AF7
            LDA   [$FD]
            AND   #$00FF
            PHA
            LDX   $F0
            LDA   $EE
            INC   $EE
            BNE   L071A99
            INC   $F0
L071A99     STA   $F2
            STX   $F4
            PLA
            SEP   #$20
            STA   [$F2]
            REP   #$20
            LDY   #$0001
            LDA   [$FD],Y
            AND   #$00FF
            PHA
            LDX   $F0
            LDA   $EE
            LDA   $EE
            BNE   L071AB7
            DEC   $F0
L071AB7     DEC   $EE
            STA   $F2
            STX   $F4
            PLA
            SEP   #$20
            STA   [$F2]
            REP   #$20
            PEI   $F0
            PEI   $EE
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0032
            LDA   [$F2],Y
            SEC
            SBC   #$0006
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0030
            LDA   [$F2],Y
            PHA
            JSL   L071DEA
            PLY
            PLY
            PLY
            PLY
            BRL   L071B75
L071AF7     LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0034
            LDA   [$F2],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0056
            LDA   [$F2],Y
            PLX
            STX   $F2
            SEC
            SBC   $F2
            CLC
            ADC   #$0001
            LDX   #$0000
            TAY
            BPL   L071B27
            DEX
L071B27     PHX
            PHA
            LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $F0
            LDA   $EE
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            PEI   $F0
            PEI   $EE
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   [$FD]
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$EE]
            REP   #$20
            PEI   $F0
            PEI   $EE
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0030
            LDA   [$F2],Y
            PHA
            JSL   L071E1E
            PLY
            PLY
            PLY
L071B75     LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0056
            LDA   [$F2],Y
            CLC
            ADC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            PLA
            LDY   #$0056
            STA   [$F2],Y
            LDA   #$0001
            STA   $EC
            BRL   L071CAB
L071BA1     LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $F0
            LDA   $EE
            JSL   L0D1705
            PLA
            PLX
            STX   $F0
            STA   $EE
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0034
            LDA   [$F2],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0056
            LDA   [$F2],Y
            PLX
            STX   $F2
            CMP   $F2
            BNE   L071C0D
            LDA   #$0000
            SEP   #$20
            STA   [$EE]
            REP   #$20
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0056
            LDA   [$F2],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            PLA
            LDY   #$0056
            STA   [$F2],Y
            BRL   L071CA6
L071C0D     LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0034
            LDA   [$F2],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0056
            LDA   [$F2],Y
            PLX
            STX   $F2
            SEC
            SBC   $F2
            CLC
            ADC   #$0001
            LDX   #$0000
            TAY
            BPL   L071C3D
            DEX
L071C3D     PHX
            PHA
            PEI   $F0
            PEI   $EE
            LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $F0
            LDA   $EE
            JSL   L0D1573
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
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0056
            LDA   [$F2],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            PLA
            LDY   #$0056
            STA   [$F2],Y
            PEI   $F0
            PEI   $EE
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0030
            LDA   [$F2],Y
            SEC
            SBC   #$0008
            PHA
            JSL   L071E1E
            PLY
            PLY
            PLY
L071CA6     LDA   #$FFFF
            STA   $EC
L071CAB     LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0028
            LDA   [$F2],Y
            CLC
            ADC   $EC
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            PLA
            LDY   #$0028
            STA   [$F2],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0034
            LDA   [$F2],Y
            CLC
            ADC   $EC
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            PLA
            LDY   #$0034
            STA   [$F2],Y
            JSL   L070FFD
            LDA   $FB
            BNE   L071CFC
            BRL   L071DDA
L071CFC     LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0028
            LDA   [$F2],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0026
            LDA   [$F2],Y
            PLX
            STX   $F2
            SEC
            SBC   $F2
            BNE   L071D26
            BRL   L071DDA
L071D26     BVS   L071D2B
            EOR   #$8000
L071D2B     BMI   L071D30
            BRL   L071DDA
L071D30     LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0028
            LDA   [$F2],Y
            PHA
            LDA   #$0008
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$00B4
            LDA   [$F2],Y
            PLX
            STX   $F2
            CLC
            ADC   $F2
            CLC
            ADC   #$0003
            STA   $EC
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0032
            LDA   [$F2],Y
            CLC
            ADC   #$0002
            PHA
            LDA   $EC
            CLC
            ADC   #$0007
            PHA
            PEA   $000E
            JSL   L011FF5
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0032
            LDA   [$F2],Y
            PLX
            STX   $F2
            SEC
            SBC   $F2
            PHA
            LDA   $EC
            SEC
            SBC   #$0001
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0003
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            PEA   $0001
            PEA   $0001
            JSL   L0710F9
            PLY
            PLY
L071DDA     PEA   $0001
            JSL   L070F4C
            PLY
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L071DEA     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EE
            TCS
            PEI   $F9
            LDA   $FB
            CLC
            ADC   #$0007
            PHA
            _MoveTo
            STA   L0F0779
            PEI   $FF
            PEI   $FD
            _DrawCString
            STA   L0F0779
            TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L071E1E     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E0
            TCS
            LDA   #$0000
            SEP   #$20
            STA   $EF
            REP   #$20
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0026
            LDA   [$F2],Y
            PHA
            LDA   #$0008
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$00B4
            LDA   [$F2],Y
            CLC
            ADC   #$0002
            PLX
            STX   $F2
            CLC
            ADC   $F2
            STA   $F0
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$00B2
            LDA   [$F2],Y
            CLC
            ADC   #$0001
            STA   $E2
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$00B6
            LDA   [$F2],Y
            STA   $E6
            LDA   $FB
            STA   $E4
            LDA   $FB
            STA   $E8
            LDX   $FF
            LDA   $FD
            STX   $EC
            STA   $EA
L071E9D     LDA   $E8
            SEC
            SBC   $F0
            BVS   L071EA7
            EOR   #$8000
L071EA7     BMI   L071EC3
            LDA   [$EA]
            AND   #$00FF
            CMP   #$0000
            BEQ   L071EC3
            LDA   $E8
            CLC
            ADC   #$0008
            STA   $E8
            INC   $EA
            BNE   L071EC1
            INC   $EC
L071EC1     BRA   L071E9D
L071EC3     PEA   $0003
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
L071ED6     LDA   $FB
            SEC
            SBC   $F0
            BVS   L071EE0
            EOR   #$8000
L071EE0     BMI   L071F36
            LDA   [$FD]
            AND   #$00FF
            CMP   #$0000
            BEQ   L071F36
            LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L071EF6
            INC   $FF
L071EF6     STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            SEP   #$20
            STA   $EE
            REP   #$20
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0032
            LDA   [$F2],Y
            SEC
            SBC   #$0006
            PHA
            PEI   $FB
            JSL   L071DEA
            PLY
            PLY
            PLY
            PLY
            LDA   $FB
            CLC
            ADC   #$0008
            STA   $FB
            BRA   L071ED6
L071F36     TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L071F3E     PHD
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
            LDY   #$0010
            LDA   [$F8],Y
            BNE   L071FA0
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$0010
            STA   [$F8],Y
            JSL   L030FA2
            PEA   $0001
            PEA   $0000
            JSL   L07019B
            PLY
            PLY
            PEA   $0000
            PEA   $0001
            JSL   L07019B
            PLY
            PLY
            PEA   $0001
            PEA   $0002
            JSL   L07019B
            PLY
            PLY
            PEA   $0000
            PEA   $0003
            JSL   L07019B
            PLY
            PLY
L071FA0     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L071FA8     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            JSL   L0718D0
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$0024
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$0028
            STA   [$F6],Y
            LDA   $FF
            BEQ   L072026
            JSL   L070000
            TAY
            BNE   L072026
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$0056
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$0034
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            SEP   #$20
            LDY   #$090E
            STA   [$F6],Y
            REP   #$20
            LDA   #$0000
            BRL   L07210A
L072026     LDA   L0F0066
            BEQ   L072053
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$006E
            LDA   [$F6],Y
            BEQ   L072053
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0052
            LDA   [$F6],Y
            PHA
            JSL   L07217A
            PLY
            BRA   L072068
L072053     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0052
            LDA   [$F6],Y
            PHA
            JSL   L072114
            PLY
L072068     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0056
            LDA   [$F6],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$0056
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0056
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$0034
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0056
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$0028
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0028
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0026
            LDA   [$F6],Y
            PLX
            STX   $F6
            SEC
            SBC   $F6
            BVS   L0720F6
            EOR   #$8000
L0720F6     BMI   L07210A
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$0034
            STA   [$F6],Y
L07210A     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L072114     ENT
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
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$090E
            BCC   L072134
            INX
L072134     PHX
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
            PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$0056
            BCC   L072162
            INX
L072162     PHX
            PHA
            PEI   $FF
            JSL   L0721E0
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L07217A     PHD
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
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$090E
            BCC   L07219A
            INX
L07219A     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$04E4
            BCC   L0721B1
            INX
L0721B1     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$0056
            BCC   L0721C8
            INX
L0721C8     PHX
            PHA
            PEI   $FF
            JSL   L0721E0
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0721E0     ENT
            PHD
            TSC
            SEC
            SBC   #$00ED
            TCD
            ADC   #$00E2
            TCS
            LDX   $FB
            LDA   $F9
            STX   $E8
            STA   $E6
            LDA   $F3
            ASL
            PHA
            LDA   $F9
            CLC
            ADC   #$0004
            STA   $EA
            LDA   $FB
            BCC   L072204
            INC
L072204     STA   $EC
            PLA
            CLC
            ADC   $EA
            STA   $EA
            BCC   L072210
            INC   $EC
L072210     LDA   [$EA]
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
            JSL   L0C04CD
            PLY
            PLY
            CLC
            ADC   #$0001
            PHA
            PLA
            STA   [$F5]
            PEI   $E8
            PEI   $E6
            PEI   $FF
            PEI   $FD
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   $F3
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $EA
            STX   $EC
            LDA   #$004C
            CLC
            ADC   $EA
            STA   $EA
            BCC   L072265
            INC   $EC
L072265     PLA
            CLC
            ADC   $EA
            STA   $EA
            BCC   L07226F
            INC   $EC
L07226F     LDA   [$EA]
            AND   #$00FF
            STA   $E4
            LDA   [$F5]
            CMP   #$0001
            BNE   L07228A
            LDA   $E4
            CMP   #$0008
            BEQ   L07228A
            LDA   #$0000
            BRL   L072311
L07228A     LDA   $E4
            CMP   #$0008
            BEQ   L072293
            BRA   L0722AD
L072293     PEA   $0002
            PEI   $FF
            PEI   $FD
            PEI   $F3
            JSL   L040000
            PLY
            PLY
            PLY
            PLY
            PHA
            PLA
            STA   [$F5]
            BRL   L072311
            BRA   L0722B4
L0722AD     CMP   #$0001
            BEQ   L0722B4
            BRA   L0722CA
L0722B4     PEA   $0002
            PEI   $FF
            PEI   $FD
            JSL   L0B02A4
            PLY
            PLY
            PLY
            PHA
            PLA
            STA   [$F5]
            BRA   L072311
            BRA   L0722D1
L0722CA     CMP   #$0002
            BEQ   L0722D1
            BRA   L0722E3
L0722D1     PEI   $FF
            PEI   $FD
            JSL   L0B07D3
            PLY
            PLY
            PHA
            PLA
            STA   [$F5]
            BRA   L072311
            BRA   L0722EA
L0722E3     CMP   #$0004
            BEQ   L0722EA
            BRA   L0722FC
L0722EA     PEI   $FF
            PEI   $FD
            JSL   L0B0EC8
            PLY
            PLY
            PHA
            PLA
            STA   [$F5]
            BRA   L072311
            BRA   L072303
L0722FC     CMP   #$0003
            BEQ   L072303
            BRA   L072311
L072303     PEI   $FF
            PEI   $FD
            JSL   L0B0C50
            PLY
            PLY
            PHA
            PLA
            STA   [$F5]
L072311     TAY
            TDC
            CLC
            ADC   #$00ED
            TCS
            TYA
            PLD
            RTL

L07231B     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EA
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$005A
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$000A
            LDA   [$F6],Y
            BNE   L072353
            JSL   L070D92
            LDA   #$0000
            BRL   L07275B
L072353     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0056
            LDA   [$F6],Y
            CMP   #$0000
            BNE   L07239B
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0052
            LDA   [$F6],Y
            PHA
            JSL   L0831B4
            PLY
            TAY
            BEQ   L07239B
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$FFEF
            LDY   #$005A
            STA   [$F6],Y
            JSL   L061659
            LDA   #$0000
            BRL   L07275B
L07239B     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0056
            LDA   [$F6],Y
            STA   $F0
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0052
            LDA   [$F6],Y
            STA   $F4
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0058
            LDA   [$F6],Y
            CMP   #$0001
            BEQ   L0723D3
            BRA   L07240C
L0723D3     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0056
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$090E
            BCC   L0723F8
            INX
L0723F8     PHX
            PHA
            PEA   $0001
            JSL   L0B0000
            PLY
            PLY
            PLY
            PLY
            STA   $F2
            BRL   L0725A7
            BRA   L072413
L07240C     CMP   #$0002
            BEQ   L072413
            BRA   L07244C
L072413     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0056
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$090E
            BCC   L072438
            INX
L072438     PHX
            PHA
            PEA   $0001
            JSL   L0B0397
            PLY
            PLY
            PLY
            PLY
            STA   $F2
            BRL   L0725A7
            BRA   L072453
L07244C     CMP   #$0004
            BEQ   L072453
            BRA   L07248C
L072453     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0056
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$090E
            BCC   L072478
            INX
L072478     PHX
            PHA
            PEA   $0001
            JSL   L0B0DD6
            PLY
            PLY
            PLY
            PLY
            STA   $F2
            BRL   L0725A7
            BRA   L072493
L07248C     CMP   #$0006
            BEQ   L072493
            BRA   L0724D7
L072493     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0056
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$090E
            BCC   L0724B8
            INX
L0724B8     PHX
            PHA
            JSL   L0B0F15
            PLY
            PLY
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$005A
            STA   [$F6],Y
            BRL   L0725A7
            BRA   L0724DE
L0724D7     CMP   #$0003
            BEQ   L0724DE
            BRA   L072517
L0724DE     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0056
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$090E
            BCC   L072503
            INX
L072503     PHX
            PHA
            PEA   $0001
            JSL   L0B08D7
            PLY
            PLY
            PLY
            PLY
            STA   $F2
            BRL   L0725A7
            BRA   L07251E
L072517     CMP   #$0007
            BEQ   L07251E
            BRA   L072561
L07251E     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0056
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$090E
            BCC   L072543
            INX
L072543     PHX
            PHA
            JSL   L0B0FA7
            PLY
            PLY
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$005A
            STA   [$F6],Y
            BRA   L0725A7
            BRA   L072568
L072561     CMP   #$0005
            BEQ   L072568
            BRA   L0725A7
L072568     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0056
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$090E
            BCC   L07258D
            INX
L07258D     PHX
            PHA
            JSL   L0B1072
            PLY
            PLY
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$005A
            STA   [$F6],Y
L0725A7     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0058
            LDA   [$F6],Y
            CMP   #$0001
            BEQ   L0725CC
            CMP   #$0002
            BEQ   L0725CC
            CMP   #$0003
            BEQ   L0725CC
            CMP   #$0004
            BEQ   L0725CC
            BRA   L07261D
L0725CC     LDA   $F2
            SEC
            SBC   #$0000
            BVS   L0725D7
            EOR   #$8000
L0725D7     BMI   L0725EC
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F2
            LDY   #$005A
            STA   [$F6],Y
            BRA   L07261D
L0725EC     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F2
            LDY   #$0056
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0056
            LDA   [$F6],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            LDY   #$0034
            STA   [$F6],Y
L07261D     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$005A
            LDA   [$F6],Y
            CMP   #$0000
            BNE   L072658
            LDA   $FF
            BEQ   L072658
            LDX   L0F002C
            LDA   L0F002A
            STA   $F6
            STX   $F8
            LDA   [$F6]
            CMP   #$7D00
            BNE   L072658
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$FFFF
            LDY   #$005A
            STA   [$F6],Y
L072658     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$005A
            LDA   [$F6],Y
            CMP   #$0000
            BEQ   L07267A
            JSL   L070B11
            JSL   L061659
            LDA   #$0000
            BRL   L07275B
L07267A     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$00BA
            BCC   L07268F
            INX
L07268F     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$090E
            BCC   L0726A6
            INX
L0726A6     PHX
            PHA
            PEI   $F4
            LDX   L0F002C
            LDA   L0F002A
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
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
            STX   $EE
            STA   $EC
            LDA   [$EC]
            LDX   #$0000
            TAY
            BPL   L0726D9
            DEX
L0726D9     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$00BA
            BCC   L0726F0
            INX
L0726F0     PHX
            PHA
            PEI   $EE
            PEI   $EC
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
            LDA   #$0000
            LDY   #$000A
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$0052
            LDA   [$F6],Y
            PHA
            JSL   L070081
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F0
            LDY   #$0056
            STA   [$F6],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F0
            LDY   #$0034
            STA   [$F6],Y
            JSL   L070D92
            PEA   $0001
            JSL   L071FA8
            PLY
            JSL   L071957
L07275B     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L072765     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EA
            TCS
            LDX   L0F0038
            LDA   L0F0036
            STA   $F6
            STX   $F8
            LDY   #$0016
            LDA   [$F6],Y
            SEC
            SBC   #$0001
            STA   $EE
            LDA   $EE
            STA   $F4
L072789     LDX   L0F0038
            LDA   L0F0036
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            LDA   $EE
            PLX
            STX   $F6
            CLC
            ADC   $F6
            SEC
            SBC   $F4
            BNE   L0727A6
            BRL   L072895
L0727A6     BVS   L0727AB
            EOR   #$8000
L0727AB     BMI   L0727B0
            BRL   L072895
L0727B0     LDA   $F4
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F6
            STX   $F8
            LDA   #$0050
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0727CC
            INC   $F8
L0727CC     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0727D6
            INC   $F8
L0727D6     LDA   [$F6]
            SEC
            SBC   #$0000
            BNE   L0727E1
            BRL   L07288A
L0727E1     BVS   L0727E6
            EOR   #$8000
L0727E6     BMI   L0727EB
            BRL   L07288A
L0727EB     STZ   $EC
            STZ   $F2
            BRL   L072853
L0727F2     PEI   $EC
            PEI   $F4
            JSL   L08340A
            PLY
            PLY
            TAY
            BNE   L072809
            LDA   $EC
            CLC
            ADC   #$0001
            STA   $EC
            BRA   L0727F2
L072809     LDA   $EC
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F6
            STX   $F8
            LDA   #$0056
            CLC
            ADC   $F6
            STA   $F6
            BCC   L072825
            INC   $F8
L072825     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L07282F
            INC   $F8
L07282F     LDA   [$F6]
            STA   $F0
            PEI   $F0
            JSL   L070BE2
            PLY
            JSL   L070A42
            PEI   $FF
            JSL   L071FA8
            PLY
            JSL   L071957
            LDA   $EC
            CLC
            ADC   #$0001
            STA   $EC
            INC   $F2
L072853     LDA   $F4
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F6
            STX   $F8
            LDA   #$0050
            CLC
            ADC   $F6
            STA   $F6
            BCC   L07286F
            INC   $F8
L07286F     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L072879
            INC   $F8
L072879     LDA   [$F6]
            SEC
            SBC   $F2
            BEQ   L07288A
            BVS   L072885
            EOR   #$8000
L072885     BPL   L07288A
            BRL   L0727F2
L07288A     LDA   $F4
            CLC
            ADC   #$0001
            STA   $F4
            BRL   L072789
L072895     TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L07289D     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            JSL   L0718D0
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0024
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0028
            STA   [$F8],Y
            PEA   ^L0E29F6
            PEA   L0E29F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0728EB
            INX
L0728EB     PHX
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E29F6
            PEA   L0E29F6
            JSL   L0C04CD
            PLY
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0056
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0056
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0034
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0056
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0028
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0028
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0026
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BVS   L07297C
            EOR   #$8000
L07297C     BMI   L072990
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0034
            STA   [$F8],Y
L072990     JSL   L071957
            JSL   L070CC7
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0729A0     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            JSL   L0729F7
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BNE   L0729C6
            JSL   L072D31
            BRA   L0729EF
L0729C6     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0729DB
            INX
L0729DB     PHX
            PHA
            PEA   ^L0E29F6
            PEA   L0E29F6
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            JSL   L073EAC
L0729EF     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0729F7     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EE
            TCS
            PEA   $0012
            PEA   $027A
            PEA   $000F
            PEA   $0005
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            PEA   $00C1
            PEA   $000D
            PEA   $0012
            PEA   $0005
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            PEA   $00C5
            PEA   $027A
            PEA   $00C1
            PEA   $0005
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            PEA   $00C1
            PEA   $027A
            PEA   $0012
            PEA   $0271
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            PEA   $0000
            _SetSolidPenPat
            STA   L0F0779
            PEA   $00C7
            PEA   $0280
            PEA   $000C
            PEA   $FFFF
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0C3B
            PLY
            PLY
            PLY
            PEA   $0001
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0D36
            PLY
            PLY
            PLY
            PLY
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0C3B
            PLY
            PLY
            PLY
            PEA   $0001
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0D36
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0C3B
            PLY
            PLY
            PLY
            PEA   $0001
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0D36
            PLY
            PLY
            PLY
            PLY
            LDA   $F4
            CLC
            ADC   #$0001
            STA   $F4
            LDA   L0F000E
            BEQ   L072B91
            LDA   #$0000
            BRL   L072D27
L072B91     PEA   $0020
            PEA   $026F
            PEA   $0013
            PEA   $000F
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            PEA   $00B3
            PEA   $002B
            PEA   $0020
            PEA   $000F
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            PEA   $00C1
            PEA   $026F
            PEA   $00B3
            PEA   $000F
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            PEA   $00B3
            PEA   $026F
            PEA   $0020
            PEA   $0253
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            PEA   $00C1
            PEA   $0271
            PEA   $0012
            PEA   $000D
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0C3B
            PLY
            PLY
            PLY
            PEA   $0001
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0D36
            PLY
            PLY
            PLY
            PLY
            LDA   $F4
            CLC
            ADC   #$0001
            STA   $F4
            LDA   L0F0010
            BNE   L072CC5
            PEA   $0000
            PEA   $0000
            JSL   L0B202D
            PLY
            PLY
L072CC5     PEA   $00B3
            PEA   $0253
            PEA   $0020
            PEA   $002B
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0006
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0C3B
            PLY
            PLY
            PLY
            PEA   $0000
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0D36
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0C3B
            PLY
            PLY
            PLY
            JSL   L073CE1
L072D27     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L072D31     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EE
            TCS
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0026
            LDA   [$F8],Y
            STA   L0F00AF
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$002A
            LDA   [$F8],Y
            PHA
            LDA   L0F00AF
            PLX
            STX   $F8
            CLC
            ADC   $F8
            SEC
            SBC   #$0001
            STA   L0F00B1
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0020
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001C
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001E
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001A
            LDA   [$F8],Y
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L072E68
            PLY
            PLY
            PEA   $0000
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0020
            LDA   [$F8],Y
            PHA
            PEA   $0001
            JSL   L0737F0
            PLY
            PLY
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L072DF7     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDA   [$FD]
            STA   L0F00AF
            LDY   #$0004
            LDA   [$FD],Y
            STA   L0F00B1
            PEI   $FF
            PEI   $FD
            JSL   L072E68
            PLY
            PLY
            LDA   L0F00B1
            SEC
            SBC   L0F00AF
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$000A
            LDA   [$F4],Y
            PLX
            STX   $F4
            SEC
            SBC   $F4
            BVS   L072E3B
            EOR   #$8000
L072E3B     BMI   L072E5C
            PEA   $0000
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$0020
            LDA   [$F4],Y
            PHA
            PEA   $0001
            JSL   L0737F0
            PLY
            PLY
            PLY
            BRA   L072E60
L072E5C     JSL   L07369F
L072E60     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L072E68     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            PEA   $0003
            PEI   $FF
            PEI   $FD
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            PEI   $FF
            PEI   $FD
            JSL   L072E9D
            PLY
            PLY
            PEI   $FF
            PEI   $FD
            JSL   L073016
            PLY
            PLY
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L072E9D     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            LDA   [$FD]
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$0026
            LDA   [$F4],Y
            PLX
            STX   $F4
            SEC
            SBC   $F4
            BEQ   L072F0D
            BVS   L072EC7
            EOR   #$8000
L072EC7     BPL   L072F0D
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$0026
            LDA   [$F4],Y
            SEC
            SBC   #$0001
            PHA
            LDY   #$0006
            LDA   [$FD],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$0026
            LDA   [$F4],Y
            SEC
            SBC   #$0001
            PHA
            LDY   #$0002
            LDA   [$FD],Y
            PHA
            PEA   $0001
            JSL   L072FCE
            PLY
            PLY
            PLY
            PLY
            PLY
L072F0D     LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$006C
            LDA   [$F4],Y
            BEQ   L072F2D
            PEA   $0002
            _SetSolidPenPat
            STA   L0F0779
            BRA   L072F3A
L072F2D     PEA   $0003
            _SetSolidPenPat
            STA   L0F0779
L072F3A     LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$000A
            LDA   [$F4],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$0026
            LDA   [$F4],Y
            SEC
            SBC   #$0001
            PLX
            STX   $F4
            CLC
            ADC   $F4
            STA   $F2
L072F65     LDY   #$0004
            LDA   [$FD],Y
            SEC
            SBC   $F2
            BVS   L072F72
            EOR   #$8000
L072F72     BPL   L072FC6
            LDA   [$FD]
            SEC
            SBC   $F2
            BEQ   L072F82
            BVS   L072F80
            EOR   #$8000
L072F80     BMI   L072FAA
L072F82     LDY   #$0002
            LDA   [$FD],Y
            PHA
            PEI   $F2
            _MoveTo
            STA   L0F0779
            LDY   #$0006
            LDA   [$FD],Y
            SEC
            SBC   #$0001
            PHA
            PEI   $F2
            _LineTo
            STA   L0F0779
L072FAA     LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$000A
            LDA   [$F4],Y
            PHA
            LDA   $F2
            PLX
            STX   $F4
            CLC
            ADC   $F4
            STA   $F2
            BRA   L072F65
L072FC6     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L072FCE     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00EC
            TCS
            PEI   $F7
            _SetSolidPenPat
            STA   L0F0779
            PEI   $F9
            PEI   $FB
            _MoveTo
            STA   L0F0779
            PEI   $FD
            PEI   $FF
            _LineTo
            STA   L0F0779
            PEA   $0000
            _SetSolidPenPat
            STA   L0F0779
            TDC
            CLC
            ADC   #$00F1
            TCS
            PLD
            RTL

L073016     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00D8
            TCS
            STZ   L0F00B5
            STZ   L0F00B3
            STZ   L0F00B9
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDA   [$F4]
            CMP   #$0000
            BNE   L073041
            LDA   #$0000
            BRL   L07334F
L073041     LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$002C
            LDA   [$F4],Y
            PHA
            LDY   #$0002
            LDA   [$FD],Y
            PHA
            JSL   L0C0027
            PLY
            PLY
            STA   $E8
L07305F     LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDA   [$F4]
            SEC
            SBC   L0F00B3
            BEQ   L0730BB
            BVS   L073076
            EOR   #$8000
L073076     BPL   L0730BB
            LDA   L0F00B3
            PHA
            LDA   #$000C
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDA   #$0046
            CLC
            ADC   $F4
            STA   $F4
            BCC   L07309C
            INC   $F6
L07309C     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0730A6
            INC   $F6
L0730A6     LDA   [$F4]
            SEC
            SBC   $E8
            BEQ   L0730B6
            BVS   L0730B2
            EOR   #$8000
L0730B2     BPL   L0730B6
            BRA   L0730BB
L0730B6     INC   L0F00B3
            BRA   L07305F
L0730BB     LDA   L0F00B3
            STA   L0F00B7
L0730C1     LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDA   [$F4]
            SEC
            SBC   L0F00B7
            BEQ   L073126
            BVS   L0730D8
            EOR   #$8000
L0730D8     BPL   L073126
            LDY   #$0006
            LDA   [$FD],Y
            PHA
            LDA   L0F00B7
            PHA
            LDA   #$000C
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDA   #$0044
            CLC
            ADC   $F4
            STA   $F4
            BCC   L073104
            INC   $F6
L073104     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L07310E
            INC   $F6
L07310E     LDA   [$F4]
            PLX
            STX   $F4
            SEC
            SBC   $F4
            BEQ   L073121
            BVS   L07311D
            EOR   #$8000
L07311D     BPL   L073121
            BRA   L073126
L073121     INC   L0F00B7
            BRA   L0730C1
L073126     LDA   L0F00B7
            SEC
            SBC   L0F00B3
            STA   L0F00B5
            LDY   #$0002
            LDA   [$FD],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$002C
            LDA   [$F4],Y
            PLX
            STX   $F4
            SEC
            SBC   $F4
            BEQ   L0731AF
            BVS   L073152
            EOR   #$8000
L073152     BPL   L0731AF
            LDY   #$0004
            LDA   [$FD],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$002C
            LDA   [$F4],Y
            PHA
            LDA   [$FD]
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$002C
            LDA   [$F4],Y
            SEC
            SBC   #$0002
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00DC
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00DC
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            LDA   #$0001
            STA   L0F00B9
L0731AF     LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$006C
            LDA   [$F4],Y
            BEQ   L0731C7
            LDA   #$0002
            STA   $DA
            BRA   L0731CC
L0731C7     LDA   #$0003
            STA   $DA
L0731CC     LDA   L0F00B3
            STA   $F0
L0731D1     LDA   L0F00B7
            SEC
            SBC   $F0
            BNE   L0731DC
            BRL   L07334F
L0731DC     BVS   L0731E1
            EOR   #$8000
L0731E1     BMI   L0731E6
            BRL   L07334F
L0731E6     LDA   $F0
            PHA
            LDA   #$000C
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDA   #$0046
            CLC
            ADC   $F4
            STA   $F4
            BCC   L073209
            INC   $F6
L073209     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L073213
            INC   $F6
L073213     LDA   [$F4]
            STA   $EA
            LDY   #$0006
            LDA   [$FD],Y
            SEC
            SBC   $EA
            BVS   L073224
            EOR   #$8000
L073224     BPL   L073242
            LDY   #$0004
            LDA   [$FD],Y
            SEC
            SBC   #$0001
            PHA
            PEI   $EA
            LDA   [$FD]
            PHA
            PEI   $EA
            PEI   $DA
            JSL   L072FCE
            PLY
            PLY
            PLY
            PLY
            PLY
L073242     LDA   [$FD]
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$002E
            LDA   [$F4],Y
            PLX
            STX   $F4
            SEC
            SBC   $F4
            BVS   L07325F
            EOR   #$8000
L07325F     BMI   L073264
            BRL   L07334A
L073264     LDA   $F0
            PHA
            LDA   #$000C
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDA   #$004A
            CLC
            ADC   $F4
            STA   $F4
            BCC   L073287
            INC   $F6
L073287     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L073291
            INC   $F6
L073291     LDA   [$F4]
            STA   $EE
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$0022
            LDA   [$F4],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$0036
            LDA   [$F4],Y
            PLX
            STX   $F4
            CLC
            ADC   $F4
            SEC
            SBC   #$000A
            STA   $EC
            LDA   #$0003
            STA   $E6
            LDA   L0F0070
            CMP   $F0
            BNE   L0732D1
            LDA   #$0001
            STA   $E6
L0732D1     LDA   $EE
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
            LDA   #$0058
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0732EF
            INC   $F6
L0732EF     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0732F9
            INC   $F6
L0732F9     PEI   $F6
            PEI   $F4
            JSL   L0C04CD
            PLY
            PLY
            STA   $E4
            PEI   $E4
            PEI   $E6
            PEA   $0000
            PEI   $EC
            LDA   $EE
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
            LDA   #$0058
            CLC
            ADC   $F4
            STA   $F4
            BCC   L07332C
            INC   $F6
L07332C     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L073336
            INC   $F6
L073336     PEI   $F6
            PEI   $F4
            PEI   $F0
            PEI   $EE
            JSL   L0733BB
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
L07334A     INC   $F0
            BRL   L0731D1
L07334F     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L073359     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00EA
            TCS
            PEI   $FF
            PEA   $0003
            PEA   $0000
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            PEI   $F5
            JSL   L0733BB
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            TDC
            CLC
            ADC   #$00EF
            TCS
            PLD
            RTL

L07338A     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00EA
            TCS
            PEI   $FF
            PEA   $0001
            PEA   $0000
            PEI   $FD
            PEI   $FB
            PEI   $F9
            PEI   $F7
            PEI   $F5
            JSL   L0733BB
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            TDC
            CLC
            ADC   #$00EF
            TCS
            PLD
            RTL

L0733BB     PHD
            TSC
            SEC
            SBC   #$00EB
            TCD
            ADC   #$00DC
            TCS
            LDA   $F3
            PHA
            LDA   #$000C
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $E8
            STX   $EA
            LDA   #$0044
            CLC
            ADC   $E8
            STA   $E8
            BCC   L0733E9
            INC   $EA
L0733E9     PLA
            CLC
            ADC   $E8
            STA   $E8
            BCC   L0733F3
            INC   $EA
L0733F3     LDA   [$E8]
            CLC
            ADC   #$0001
            STA   $E4
            PEI   $FF
            LDA   $F3
            PHA
            LDA   #$000C
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $E8
            STX   $EA
            LDA   #$0046
            CLC
            ADC   $E8
            STA   $E8
            BCC   L073420
            INC   $EA
L073420     PLA
            CLC
            ADC   $E8
            STA   $E8
            BCC   L07342A
            INC   $EA
L07342A     LDA   [$E8]
            PHA
            PEI   $E4
            PEI   $F1
            JSL   L082F1F
            PLY
            PHA
            JSL   L0C0669
            PLY
            PLY
            PLY
            PLY
            STA   $E6
            LDX   L0F0030
            LDA   L0F002E
            STA   $E8
            STX   $EA
            LDY   #$002C
            LDA   [$E8],Y
            STA   $DE
            LDA   $E4
            SEC
            SBC   $DE
            BVS   L07345C
            EOR   #$8000
L07345C     BMI   L073462
            LDA   $DE
            STA   $E4
L073462     LDA   $F3
            PHA
            LDA   #$000C
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $E8
            STX   $EA
            LDA   #$0046
            CLC
            ADC   $E8
            STA   $E8
            BCC   L073485
            INC   $EA
L073485     PLA
            CLC
            ADC   $E8
            STA   $E8
            BCC   L07348F
            INC   $EA
L07348F     LDA   [$E8]
            STA   $E0
            LDX   L0F0030
            LDA   L0F002E
            STA   $E8
            STX   $EA
            LDY   #$0030
            LDA   [$E8],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $E8
            STX   $EA
            LDY   #$002C
            LDA   [$E8],Y
            PLX
            STX   $E8
            CLC
            ADC   $E8
            STA   $E2
            LDA   $E0
            SEC
            SBC   $E2
            BEQ   L0734CC
            BVS   L0734C6
            EOR   #$8000
L0734C6     BPL   L0734CC
            LDA   $E2
            STA   $E0
L0734CC     PEI   $FD
            PEI   $FB
            PEI   $F7
            PEI   $F5
            PEI   $F9
            PEI   $E6
            PEI   $E0
            PEI   $E4
            JSL   L0734F0
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            TDC
            CLC
            ADC   #$00EB
            TCS
            PLD
            RTL

L0734F0     PHD
            TSC
            SEC
            SBC   #$00EB
            TCD
            ADC   #$00D4
            TCS
            LDX   $FB
            LDA   $F9
            STX   L0F00BD
            STA   L0F00BB
            LDA   $F5
            SEC
            SBC   $F1
            BVS   L07350F
            EOR   #$8000
L07350F     BMI   L07351E
            LDA   $F1
            SEC
            SBC   $F5
            STA   $E6
            LDA   $F1
            STA   $E4
            BRA   L073524
L07351E     STZ   $E6
            LDA   $F5
            STA   $E4
L073524     LDA   $F3
            SEC
            SBC   $F1
            SEC
            SBC   #$0001
            STA   $E2
            LDA   $F3
            SEC
            SBC   $E4
            SEC
            SBC   #$0001
            STA   $E0
            LDA   $F7
            CLC
            ADC   #$0008
            PHA
            PEI   $F3
            PEI   $F7
            PEI   $F1
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDY   #$0008
            LDA   [$E8],Y
            BNE   L0735A5
            LDX   L0F0030
            LDA   L0F002E
            STA   $E8
            STX   $EA
            LDY   #$002E
            LDA   [$E8],Y
            CLC
            ADC   #$000A
            SEC
            SBC   $F7
            BEQ   L0735A5
            BVS   L07358A
            EOR   #$8000
L07358A     BPL   L0735A5
            LDX   L0F0030
            LDA   L0F002E
            STA   $E8
            STX   $EA
            LDY   #$002E
            LDA   [$E8],Y
            SEC
            SBC   #$0001
            STA   $D6
            LDA   $DA
            INC   $DA
L0735A5     PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            _ClipRect
            STA   L0F0779
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDY   #$0008
            LDA   [$E8],Y
            BNE   L0735FB
            LDX   L0F0030
            LDA   L0F002E
            STA   $E8
            STX   $EA
            LDY   #$002E
            LDA   [$E8],Y
            CLC
            ADC   #$000A
            SEC
            SBC   $F7
            BEQ   L0735FB
            BVS   L0735E6
            EOR   #$8000
L0735E6     BPL   L0735FB
            PEA   $0003
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
L0735FB     PHA
            _GetForeColor
            STA   L0F0779
            PLA
            STA   $DE
            PEI   $FD
            _SetForeColor
            STA   L0F0779
            PEI   $F5
            LDA   $F7
            CLC
            ADC   #$0007
            PHA
            _MoveTo
            STA   L0F0779
            LDX   L0F00BD
            LDA   L0F00BB
            PHX
            PHA
            _DrawCString
            STA   L0F0779
            PEI   $DE
            _SetForeColor
            STA   L0F0779
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            _GetPortRect
            STA   L0F0779
            LDX   L0F0034
            LDA   L0F0032
            STA   $E8
            STX   $EA
            LDY   #$0008
            LDA   [$E8],Y
            BNE   L073684
            LDA   $FF
            CMP   #$0001
            BNE   L073684
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            _InvertRect
            STA   L0F0779
L073684     PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            _ClipRect
            STA   L0F0779
            TDC
            CLC
            ADC   #$00EB
            TCS
            PLD
            RTL

L07369F     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            STA   $F6
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0026
            LDA   [$F8],Y
            CMP   L0F00AF
            BNE   L0736D6
            LDA   #$0001
            STA   $F2
            BRA   L073705
L0736D6     LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0020
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            PHA
            LDA   $F6
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STA   $F6
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0020
            LDA   [$F8],Y
            STA   $F2
L073705     LDA   $F2
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$000A
            LDA   [$F8],Y
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0026
            LDA   [$F8],Y
            PLX
            STX   $F8
            CLC
            ADC   $F8
            SEC
            SBC   #$0009
            STA   $F4
            PEI   $F4
            PEI   $F6
            JSL   L07374B
            PLY
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L07374B     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            JSL   L074043
            SEC
            SBC   $FD
            BNE   L073762
            BRL   L0737D8
L073762     BVS   L073767
            EOR   #$8000
L073767     BMI   L07376C
            BRL   L0737D8
L07376C     LDA   L0F00B9
            BEQ   L073780
            LDA   $FD
            CLC
            ADC   #$0001
            PHA
            PEI   $FF
            JSL   L0738E8
            PLY
            PLY
L073780     PEA   $0000
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
            LDA   L0F00B3
            STA   $F2
            BRA   L0737C3
L0737B3     PEA   $0000
            PEI   $F2
            PEI   $FF
            JSL   L0739AA
            PLY
            PLY
            PLY
            INC   $F2
L0737C3     LDA   L0F00B3
            CLC
            ADC   L0F00B5
            SEC
            SBC   $F2
            BEQ   L0737D6
            BVS   L0737D4
            EOR   #$8000
L0737D4     BMI   L0737B3
L0737D6     BRA   L0737E8
L0737D8     LDA   L0F00B9
            BEQ   L0737E8
            PEA   $FFFF
            PEI   $FF
            JSL   L0738E8
            PLY
            PLY
L0737E8     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0737F0     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00DC
            TCS
            LDA   L0F00B5
            CMP   #$0000
            BNE   L073809
            LDA   #$0000
            BRL   L0738DE
L073809     LDA   $FB
            STA   $F0
            LDA   $FB
            CLC
            ADC   $FD
            STA   $EE
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$002E
            LDA   [$F2],Y
            CLC
            ADC   $FB
            SEC
            SBC   #$0001
            STA   $EC
            LDA   $F0
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F2
            STX   $F4
            LDY   #$000A
            LDA   [$F2],Y
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F2
            STX   $F4
            LDY   #$0026
            LDA   [$F2],Y
            PLX
            STX   $F2
            CLC
            ADC   $F2
            SEC
            SBC   #$0009
            STA   $E6
            JSL   L074043
            STA   $E0
            LDA   $E0
            STA   $DE
            LDA   L0F0008
            CMP   #$0001
            BEQ   L073874
            INC   $DE
L073874     LDA   $EC
            SEC
            SBC   $DE
            BVS   L07387E
            EOR   #$8000
L07387E     BMI   L0738DE
            LDA   $F0
            SEC
            SBC   $EE
            BVS   L07388A
            EOR   #$8000
L07388A     BMI   L0738DE
            LDA   $E6
            SEC
            SBC   L0F00AF
            BVS   L073897
            EOR   #$8000
L073897     BPL   L0738B2
            LDA   $E6
            SEC
            SBC   L0F00B1
            BEQ   L0738A8
            BVS   L0738A6
            EOR   #$8000
L0738A6     BMI   L0738B2
L0738A8     PEI   $E6
            PEI   $EC
            JSL   L07374B
            PLY
            PLY
L0738B2     LDX   L0F0030
            LDA   L0F002E
            STA   $F2
            STX   $F4
            LDY   #$000A
            LDA   [$F2],Y
            PHA
            LDA   $E6
            PLX
            STX   $F2
            CLC
            ADC   $F2
            STA   $E6
            LDA   $F0
            CLC
            ADC   #$0001
            STA   $F0
            LDA   $EC
            CLC
            ADC   #$0001
            STA   $EC
            BRA   L073874
L0738DE     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0738E8     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDA   $FF
            CMP   #$FFFF
            BEQ   L07390B
            PEA   ^L0E28F0
            PEA   L0E28F0
            PEI   $FF
            JSL   L0C0118
            PLY
            PLY
            PLY
            BRA   L07391F
L07390B     PEA   ^L0E3AC8
            PEA   L0E3AC8
            PEA   ^L0E28F0
            PEA   L0E28F0
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L07391F     LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$0024
            LDA   [$F4],Y
            CLC
            ADC   #$0001
            STA   $F0
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$0012
            LDA   [$F4],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F4
            STX   $F6
            LDY   #$0024
            LDA   [$F4],Y
            PLX
            STX   $F4
            CLC
            ADC   $F4
            SEC
            SBC   #$0003
            STA   $EE
            PEA   ^L0E28F0
            PEA   L0E28F0
            JSL   L0C04CD
            PLY
            PLY
            PHA
            PEI   $EE
            PEI   $F0
            PEA   $0001
            JSL   L0C0669
            PLY
            PLY
            PLY
            PLY
            STA   $F2
            PEA   $0003
            PEA   $0000
            PEA   ^L0E28F0
            PEA   L0E28F0
            LDA   $FD
            SEC
            SBC   #$0001
            PHA
            PEI   $F2
            PEI   $EE
            PEI   $F0
            JSL   L0734F0
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0739AA     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00DC
            TCS
            LDA   $FD
            PHA
            LDA   #$000C
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F2
            STX   $F4
            LDA   #$004A
            CLC
            ADC   $F2
            STA   $F2
            BCC   L0739D8
            INC   $F4
L0739D8     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L0739E2
            INC   $F4
L0739E2     LDA   [$F2]
            STA   $F0
            LDA   $FF
            BNE   L0739F7
            PEI   $F0
            JSL   L083089
            PLY
            TAY
            BEQ   L0739F7
            BRL   L073B2C
L0739F7     LDX   L0F0030
            LDA   L0F002E
            STA   $F2
            STX   $F4
            LDY   #$002C
            LDA   [$F2],Y
            PHA
            LDA   $FD
            PHA
            LDA   #$000C
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F2
            STX   $F4
            LDA   #$0044
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073A2A
            INC   $F4
L073A2A     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073A34
            INC   $F4
L073A34     LDA   [$F2]
            PHA
            JSL   L0C0027
            PLY
            PLY
            STA   $EE
            LDX   L0F0030
            LDA   L0F002E
            STA   $F2
            STX   $F4
            LDY   #$0030
            LDA   [$F2],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F2
            STX   $F4
            LDY   #$002C
            LDA   [$F2],Y
            PLX
            STX   $F2
            CLC
            ADC   $F2
            SEC
            SBC   #$0001
            PHA
            LDA   $FD
            PHA
            LDA   #$000C
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F2
            STX   $F4
            LDA   #$0046
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073A8C
            INC   $F4
L073A8C     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073A96
            INC   $F4
L073A96     LDA   [$F2]
            PHA
            JSL   L0C0000
            PLY
            PLY
            STA   $EC
            LDA   $FB
            CLC
            ADC   #$0003
            STA   $EA
            LDA   $EA
            SEC
            SBC   #$0002
            PHA
            LDA   $EC
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F2
            STX   $F4
            LDY   #$000A
            LDA   [$F2],Y
            PHA
            LDA   $EA
            PLX
            STX   $F2
            SEC
            SBC   $F2
            PHA
            LDA   $EE
            CLC
            ADC   #$0001
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$0003
            STA   $DE
            PEI   $F0
            JSL   L083089
            PLY
            TAY
            BNE   L073B00
            LDA   #$0001
            STA   $DE
L073B00     PEA   $0006
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            JSL   L0C0D7F
            PLY
            PLY
            PLY
            PLY
            PEI   $DE
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            BRL   L073CD9
L073B2C     PEA   ^L0E28F6
            PEA   L0E28F6
            LDX   L0F00AD
            LDA   L0F00AB
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEI   $F0
            JSL   L0721E0
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            LDA   $E0
            SEC
            SBC   #$0001
            BNE   L073B5C
            BRL   L073CD9
L073B5C     BVS   L073B61
            EOR   #$8000
L073B61     BMI   L073B66
            BRL   L073CD9
L073B66     DEC   $E0
            LDA   $F0
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F2
            STX   $F4
            LDA   #$004C
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073B86
            INC   $F4
L073B86     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073B90
            INC   $F4
L073B90     LDA   [$F2]
            AND   #$00FF
            CMP   #$0001
            BEQ   L073BCF
            LDA   $F0
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F2
            STX   $F4
            LDA   #$004C
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073BB8
            INC   $F4
L073BB8     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073BC2
            INC   $F4
L073BC2     LDA   [$F2]
            AND   #$00FF
            CMP   #$0008
            BEQ   L073BCF
            BRL   L073C4A
L073BCF     LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$0056
            LDA   [$F2],Y
            SEC
            SBC   #$0002
            BVS   L073BE7
            EOR   #$8000
L073BE7     BMI   L073C0E
            PEA   ^L0E5299
            PEA   L0E5299
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDA   $F2
            LDX   $F4
            CLC
            ADC   #$090E
            BCC   L073C04
            INX
L073C04     PHX
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L073C0E     PEA   ^L0E28F6
            PEA   L0E28F6
            LDA   $F0
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F2
            STX   $F4
            LDA   #$0048
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073C32
            INC   $F4
L073C32     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073C3C
            INC   $F4
L073C3C     LDA   [$F2]
            PHA
            JSL   L0B19F5
            PLY
            PLY
            PLY
            STA   $E0
            BRA   L073CB6
L073C4A     LDA   $F0
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F2
            STX   $F4
            LDA   #$004C
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073C68
            INC   $F4
L073C68     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073C72
            INC   $F4
L073C72     LDA   [$F2]
            AND   #$00FF
            CMP   #$0002
            BNE   L073CB6
            PEA   ^L0E28F6
            PEA   L0E28F6
            LDA   $F0
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F2
            STX   $F4
            LDA   #$0048
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073CA0
            INC   $F4
L073CA0     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073CAA
            INC   $F4
L073CAA     LDA   [$F2]
            PHA
            JSL   L0B13AB
            PLY
            PLY
            PLY
            STA   $E0
L073CB6     LDA   $E0
            BEQ   L073CD9
            PEI   $E0
            LDA   $FB
            SEC
            SBC   #$0001
            PHA
            PEA   ^L0E28F6
            PEA   L0E28F6
            PEI   $FD
            PEI   $F0
            JSL   L073359
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L073CD9     TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L073CE1     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E6
            TCS
            LDA   L0F006C
            BNE   L073CF6
            LDA   L0F0000
            BNE   L073D13
L073CF6     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$0008
            CLC
            ADC   $F8
            BCC   L073D0B
            INX
L073D0B     STX   L0F00BD
            STA   L0F00BB
            BRA   L073D1F
L073D13     LDA   #L0E332D
            LDX   #^L0E332D
            STX   L0F00BD
            STA   L0F00BB
L073D1F     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001E
            LDA   [$F8],Y
            SEC
            SBC   #$0003
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001C
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001E
            LDA   [$F8],Y
            SEC
            SBC   #$000D
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001A
            LDA   [$F8],Y
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            LDX   L0F00BD
            LDA   L0F00BB
            PHX
            PHA
            JSL   L0C04CD
            PLY
            PLY
            PHA
            LDA   #$0008
            SEC
            JSL   L0D151F
            PLA
            STA   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001A
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001C
            LDA   [$F8],Y
            PLX
            STX   $F8
            CLC
            ADC   $F8
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLY
            STA   $F4
            LDA   $F6
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLY
            PHA
            LDA   $F4
            PLX
            STX   $F8
            SEC
            SBC   $F8
            STA   $F2
            PHA
            _GetTextMode
            STA   L0F0779
            PLA
            STA   $E8
            PEA   $8003
            _SetTextMode
            STA   L0F0779
            PEI   $F2
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001E
            LDA   [$F8],Y
            SEC
            SBC   #$0004
            PHA
            _MoveTo
            STA   L0F0779
            LDX   L0F00BD
            LDA   L0F00BB
            PHX
            PHA
            _DrawCString
            STA   L0F0779
            PEI   $E8
            _SetTextMode
            STA   L0F0779
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L073E52     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            PEI   $FF
            PEI   $FD
            _ClipRect
            STA   L0F0779
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L073E73     ENT
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
            _ClipRect
            STA   L0F0779
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L073EAC     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EC
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0020
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001C
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001E
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$001A
            LDA   [$F8],Y
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            JSL   L083BA9
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L073F2B     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0020
            LDA   [$F8],Y
            PHA
            JSL   L074043
            PLX
            STX   $F8
            SEC
            SBC   $F8
            CLC
            ADC   #$0001
            STA   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            SEC
            SBC   $F6
            BEQ   L073F82
            BVS   L073F6F
            EOR   #$8000
L073F6F     BPL   L073F82
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F6
            LDY   #$002E
            STA   [$F8],Y
L073F82     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            SEC
            SBC   #$0000
            BVS   L073F9A
            EOR   #$8000
L073F9A     BMI   L073FAE
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$002E
            STA   [$F8],Y
L073FAE     JSL   L091202
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L073FBA     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
            LDA   $FB
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F2
            STX   $F4
            LDA   #$0052
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073FE3
            INC   $F4
L073FE3     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L073FED
            INC   $F4
L073FED     LDA   [$F2]
            CLC
            ADC   #$0004
            STA   $F0
            PEA   $0003
            PEA   $0000
            LDA   $FB
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F2
            STX   $F4
            LDA   #$0058
            CLC
            ADC   $F2
            STA   $F2
            BCC   L074019
            INC   $F4
L074019     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L074023
            INC   $F4
L074023     PEI   $F4
            PEI   $F2
            PEI   $FD
            PEI   $F0
            PEI   $FF
            PEI   $F0
            JSL   L0734F0
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L074043     ENT
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
            BEQ   L07406F
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   [$F8]
            BRA   L07407E
            BRA   L07407E
L07406F     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0060
            LDA   [$F8],Y
L07407E     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL


