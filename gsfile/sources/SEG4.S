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

	use	SEG4.X.S
	
GSOS	=	$E100A8

*-----------------------------------

L0B0000     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00CE
            TCS
            STZ   $D0
            STZ   $EA
            STZ   $E8
            STZ   $E6
            LDA   $FF
            CMP   #$0000
            BNE   L0B002B
            LDA   #$0030
            SEP   #$20
            STA   $D2
            REP   #$20
            LDA   #$0001
            STA   $FF
            BRL   L0B012C
L0B002B     LDA   $FF
            LDX   #$0000
            TAY
            BPL   L0B0034
            DEX
L0B0034     PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D2
            PHA
            PEI   $FD
            PEI   $FB
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STZ   $EE
            BRL   L0B011D
L0B0054     LDA   $EE
            TAX
            LDA   $D2,X
            AND   #$00FF
            STA   $EC
            LDA   $EC
            CMP   #$0030
            BEQ   L0B0094
            CMP   #$0031
            BEQ   L0B0094
            CMP   #$0032
            BEQ   L0B0094
            CMP   #$0033
            BEQ   L0B0094
            CMP   #$0034
            BEQ   L0B0094
            CMP   #$0035
            BEQ   L0B0094
            CMP   #$0036
            BEQ   L0B0094
            CMP   #$0037
            BEQ   L0B0094
            CMP   #$0038
            BEQ   L0B0094
            CMP   #$0039
            BEQ   L0B0094
            BRA   L0B00AF
L0B0094     LDA   $D0
            BEQ   L0B00A2
            LDA   $EA
            CLC
            ADC   #$0001
            STA   $EA
            BRA   L0B00AA
L0B00A2     LDA   $E8
            CLC
            ADC   #$0001
            STA   $E8
L0B00AA     BRL   L0B011B
            BRA   L0B00BB
L0B00AF     CMP   #$002E
            BEQ   L0B00BB
            CMP   #$002C
            BEQ   L0B00BB
            BRA   L0B00D0
L0B00BB     LDA   $D0
            BEQ   L0B00C7
            LDA   #$FFF4
            BRL   L0B029A
            BRA   L0B00CC
L0B00C7     LDA   #$0001
            STA   $D0
L0B00CC     BRA   L0B011B
            BRA   L0B00DC
L0B00D0     CMP   #$002B
            BEQ   L0B00DC
            CMP   #$002D
            BEQ   L0B00DC
            BRA   L0B0119
L0B00DC     LDA   $E6
            CMP   #$0000
            BNE   L0B00EA
            LDA   $EE
            CMP   #$0000
            BEQ   L0B00F4
L0B00EA     LDA   #$FFF4
            BRL   L0B029A
            BRA   L0B011B
            BRA   L0B0109
L0B00F4     LDA   $EC
            CMP   #$002B
            BNE   L0B0109
            LDA   #$002F
            SEP   #$20
            STA   $D2
            REP   #$20
            LDA   #$002F
            STA   $EC
L0B0109     LDA   $EC
            STA   $E6
            BRA   L0B011B
L0B010F     LDA   #$FFF4
            BRL   L0B029A
            BRA   L0B011B
            BRA   L0B011B
L0B0119     BRA   L0B010F
L0B011B     INC   $EE
L0B011D     LDA   $EE
            SEC
            SBC   $FF
            BVS   L0B0127
            EOR   #$8000
L0B0127     BMI   L0B012C
            BRL   L0B0054
L0B012C     LDA   $EA
            SEC
            SBC   #$0002
            BEQ   L0B0141
            BVS   L0B0139
            EOR   #$8000
L0B0139     BPL   L0B0141
            LDA   #$FFF6
            BRL   L0B029A
L0B0141     LDA   $E8
            SEC
            SBC   #$000A
            BEQ   L0B0156
            BVS   L0B014E
            EOR   #$8000
L0B014E     BPL   L0B0156
            LDA   #$FFF5
            BRL   L0B029A
L0B0156     LDA   $F9
            BNE   L0B0160
            LDA   #$0000
            BRL   L0B029A
L0B0160     LDA   $E6
            CMP   #$0000
            BNE   L0B01A1
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L0B0170
            DEX
L0B0170     PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D3
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D2
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$002F
            SEP   #$20
            STA   $D2
            REP   #$20
            LDA   $FF
            CLC
            ADC   #$0001
            STA   $FF
L0B01A1     LDA   $D0
            BNE   L0B01B9
            LDA   $FF
            TAX
            LDA   #$002E
            SEP   #$20
            STA   $D2,X
            REP   #$20
            LDA   $FF
            CLC
            ADC   #$0001
            STA   $FF
L0B01B9     LDA   $EA
            SEC
            SBC   #$0004
            BVS   L0B01C4
            EOR   #$8000
L0B01C4     BMI   L0B01F2
            STZ   $EE
            BRA   L0B01E0
L0B01CA     LDA   $FF
            TAX
            LDA   #$0030
            SEP   #$20
            STA   $D2,X
            REP   #$20
            LDA   $FF
            CLC
            ADC   #$0001
            STA   $FF
            INC   $EE
L0B01E0     LDA   #$0004
            SEC
            SBC   $EA
            SEC
            SBC   $EE
            BEQ   L0B01F2
            BVS   L0B01F0
            EOR   #$8000
L0B01F0     BMI   L0B01CA
L0B01F2     LDA   $FF
            SEC
            SBC   #$0010
            BVS   L0B01FD
            EOR   #$8000
L0B01FD     BMI   L0B0264
            LDA   #$0011
            SEC
            SBC   $FF
            STA   $E4
            LDA   $FF
            SEC
            SBC   #$0001
            LDX   #$0000
            TAY
            BPL   L0B0214
            DEX
L0B0214     PHX
            PHA
            LDA   $E4
            TAX
            PEA   $0000
            PHD
            TXA
            CLC
            ADC   #$00D2
            ADC   $01,S
            STA   $01,S
            PEA   $0000
            TDC
            CLC
            ADC   #$00D3
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$0001
            STA   $EE
            BRA   L0B0258
L0B0242     LDA   $EE
            TAX
            LDA   #$0030
            SEP   #$20
            STA   $D2,X
            REP   #$20
            LDA   $FF
            CLC
            ADC   #$0001
            STA   $FF
            INC   $EE
L0B0258     LDA   $EE
            SEC
            SBC   $E4
            BVS   L0B0262
            EOR   #$8000
L0B0262     BPL   L0B0242
L0B0264     LDA   $FF
            TAX
            LDA   #$0000
            SEP   #$20
            STA   $D2,X
            REP   #$20
            LDA   $FF
            CLC
            ADC   #$0001
            LDX   #$0000
            TAY
            BPL   L0B027D
            DEX
L0B027D     PHX
            PHA
            PEI   $FD
            PEI   $FB
            PEA   $0000
            TDC
            CLC
            ADC   #$00D2
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $FF
L0B029A     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0B02A4     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EA
            TCS
            LDA   #$0004
            SEC
            SBC   $FF
            PHA
            LDA   #$0010
            PLX
            STX   $F2
            SEC
            SBC   $F2
            STA   $FF
            LDA   $FF
            CMP   #$000C
            BNE   L0B02CD
            LDA   #$000B
            STA   $FF
L0B02CD     LDX   $FD
            LDA   $FB
            STX   $F0
            STA   $EE
            INC   $EE
            BNE   L0B02DB
            INC   $F0
L0B02DB     DEC   $FF
L0B02DD     LDA   [$EE]
            AND   #$00FF
            AND   #$00FF
            CMP   #$0030
            BNE   L0B0303
            LDA   $FF
            SEC
            SBC   #$0001
            BEQ   L0B0303
            BVS   L0B02F7
            EOR   #$8000
L0B02F7     BPL   L0B0303
            INC   $EE
            BNE   L0B02FF
            INC   $F0
L0B02FF     DEC   $FF
            BRA   L0B02DD
L0B0303     LDA   [$FB]
            AND   #$00FF
            AND   #$00FF
            CMP   #$002D
            BNE   L0B0333
            LDA   #$0002
            STA   $EC
            PEA   $0000
            PEA   $0001
            PEA   ^L0E52BC
            PEA   L0E52BC
            PEI   $FD
            PEI   $FB
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRA   L0B0338
L0B0333     LDA   #$0001
            STA   $EC
L0B0338     LDA   $FF
            LDX   #$0000
            TAY
            BPL   L0B0341
            DEX
L0B0341     PHX
            PHA
            LDA   $EC
            TAX
            TXA
            CLC
            ADC   #L0E52BB
            TAX
            LDA   #^L0E52BB
            BCC   L0B0352
            INC
L0B0352     PHA
            PHX
            PEI   $F0
            PEI   $EE
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $FF
            CLC
            ADC   $EC
            STA   $FF
            LDA   $FF
            TAX
            LDA   #$0000
            SEP   #$20
            STAL  L0E52BB,X
            REP   #$20
            PEA   ^L0E52BC
            PEA   L0E52BC
            PEI   $FD
            PEI   $FB
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   $FF
            TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0B0397     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00DE
            TCS
            LDA   $FF
            CMP   #$0000
            BNE   L0B03AF
            LDA   #$0000
            BRL   L0B064A
L0B03AF     LDA   $FF
            SEC
            SBC   #$0005
            BVS   L0B03BA
            EOR   #$8000
L0B03BA     BPL   L0B03CB
            LDA   $FF
            SEC
            SBC   #$0008
            BEQ   L0B03D1
            BVS   L0B03C9
            EOR   #$8000
L0B03C9     BPL   L0B03D1
L0B03CB     LDA   #$FFF3
            BRL   L0B064A
L0B03D1     LDA   $FF
            LDX   #$0000
            TAY
            BPL   L0B03DA
            DEX
L0B03DA     PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E1
            PHA
            PEI   $FD
            PEI   $FB
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L0B03F5     LDA   $FF
            CMP   #$0008
            BNE   L0B03FF
            BRL   L0B054F
L0B03FF     LDA   $FF
            CMP   #$0005
            BEQ   L0B040E
            CMP   #$0007
            BEQ   L0B040E
            BRL   L0B04B5
L0B040E     LDA   $FF
            CMP   #$0007
            BNE   L0B0476
            LDA   $E3
            AND   #$00FF
            CMP   #$002F
            BEQ   L0B0447
            LDA   $E3
            AND   #$00FF
            CMP   #$002E
            BEQ   L0B0447
            LDA   $E3
            AND   #$00FF
            CMP   #$002D
            BEQ   L0B0447
            LDA   $E3
            AND   #$00FF
            CMP   #$002C
            BEQ   L0B0447
            LDA   $E3
            AND   #$00FF
            CMP   #$0020
            BNE   L0B0476
L0B0447     PEA   $0000
            PEA   $0004
            PEA   $0000
            TDC
            CLC
            ADC   #$00E5
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$0030
            SEP   #$20
            STA   $E4
            REP   #$20
            BRA   L0B04A8
L0B0476     LDA   $FF
            LDX   #$0000
            TAY
            BPL   L0B047F
            DEX
L0B047F     PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E1
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$0030
            SEP   #$20
            STA   $E1
            REP   #$20
L0B04A8     LDA   $FF
            CLC
            ADC   #$0001
            STA   $FF
            BRL   L0B054C
            BRA   L0B04BD
L0B04B5     CMP   #$0006
            BEQ   L0B04BD
            BRL   L0B054C
L0B04BD     PEA   $0000
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E7
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E5
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $E4
            AND   #$00FF
            CMP   #$002F
            BEQ   L0B0513
            LDA   $E4
            AND   #$00FF
            CMP   #$002E
            BEQ   L0B0513
            LDA   $E4
            AND   #$00FF
            CMP   #$002D
            BEQ   L0B0513
            LDA   $E4
            AND   #$00FF
            CMP   #$002C
            BEQ   L0B0513
            LDA   $E4
            AND   #$00FF
            CMP   #$0020
            BNE   L0B0537
L0B0513     LDA   $E3
            SEP   #$20
            STA   $E5
            REP   #$20
            LDA   #$0030
            SEP   #$20
            STA   $E4
            REP   #$20
            LDA   $E1
            SEP   #$20
            STA   $E2
            REP   #$20
            LDA   #$0030
            SEP   #$20
            STA   $E1
            REP   #$20
            BRA   L0B0547
L0B0537     LDA   $E4
            SEP   #$20
            STA   $E5
            REP   #$20
            LDA   $E3
            SEP   #$20
            STA   $E4
            REP   #$20
L0B0547     LDA   #$0008
            STA   $FF
L0B054C     BRL   L0B03F5
L0B054F     LDA   #$002F
            SEP   #$20
            STA   $E3
            REP   #$20
            LDA   #$002F
            SEP   #$20
            STA   $E6
            REP   #$20
            LDA   $E2
            AND   #$00FF
            PHA
            LDA   $E1
            AND   #$00FF
            PHA
            JSL   L0B0654
            PLY
            PLY
            STA   $EE
            LDA   $E5
            AND   #$00FF
            PHA
            LDA   $E4
            AND   #$00FF
            PHA
            JSL   L0B0654
            PLY
            PLY
            STA   $EC
            LDA   $E8
            AND   #$00FF
            PHA
            LDA   $E7
            AND   #$00FF
            PHA
            JSL   L0B0654
            PLY
            PLY
            STA   $EA
            PEI   $EA
            PEI   $EC
            PEI   $EE
            JSL   L0B06F6
            PLY
            PLY
            PLY
            TAY
            BNE   L0B05B3
            LDA   #$FFF3
            BRL   L0B064A
L0B05B3     LDA   $F9
            BNE   L0B05BD
            LDA   #$0000
            BRL   L0B064A
L0B05BD     PEA   $0000
            PEA   $0002
            PEI   $FD
            PEI   $FB
            PEA   $0000
            TDC
            CLC
            ADC   #$00E7
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   #$0000
            LDA   #$0002
            PHX
            PHA
            LDX   $FD
            LDA   $FB
            JSL   L0D1573
            PLA
            PLX
            STX   $FD
            STA   $FB
            LDX   $FD
            LDA   $FB
            INC   $FB
            BNE   L0B05FC
            INC   $FD
L0B05FC     STA   $F0
            STX   $F2
            LDA   #$002F
            SEP   #$20
            STA   [$F0]
            REP   #$20
            PEA   $0000
            PEA   $0005
            PEI   $FD
            PEI   $FB
            PEA   $0000
            TDC
            CLC
            ADC   #$00E1
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   #$0000
            LDA   #$0005
            PHX
            PHA
            LDX   $FD
            LDA   $FB
            JSL   L0D1573
            PLA
            PLX
            STX   $FD
            STA   $FB
            LDA   #$0000
            SEP   #$20
            STA   [$FB]
            REP   #$20
            LDA   #$0008
L0B064A     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0B0654     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EF
            TCS
            LDA   $FD
            AND   #$00FF
            PHA
            JSL   L0B06B4
            PLY
            TAY
            BEQ   L0B06A7
            LDA   $FF
            AND   #$00FF
            PHA
            JSL   L0B06B4
            PLY
            TAY
            BEQ   L0B06A7
            LDA   $FD
            SEP   #$20
            STA   $F1
            REP   #$20
            LDA   $FF
            SEP   #$20
            STA   $F2
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STA   $F3
            REP   #$20
            PEA   $0000
            TDC
            CLC
            ADC   #$00F1
            PHA
            JSL   L0C0324
            PLY
            PLY
            BRA   L0B06AA
            BRA   L0B06AA
L0B06A7     LDA   #$0000
L0B06AA     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0B06B4     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            AND   #$00FF
            STA   $F4
            LDA   $F4
            SEC
            SBC   #$0030
            BVS   L0B06D1
            EOR   #$8000
L0B06D1     BPL   L0B06E2
            LDA   $F4
            SEC
            SBC   #$0039
            BEQ   L0B06E9
            BVS   L0B06E0
            EOR   #$8000
L0B06E0     BPL   L0B06E9
L0B06E2     LDA   #$0000
            BRA   L0B06EC
            BRA   L0B06EC
L0B06E9     LDA   #$0001
L0B06EC     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0B06F6     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
            LDA   $FB
            SEC
            SBC   #$0001
            BVS   L0B070C
            EOR   #$8000
L0B070C     BPL   L0B071D
            LDA   $FB
            SEC
            SBC   #$000C
            BEQ   L0B0723
            BVS   L0B071B
            EOR   #$8000
L0B071B     BPL   L0B0723
L0B071D     LDA   #$0000
            BRL   L0B07C9
L0B0723     LDA   $FF
            SEC
            SBC   #$0001
            BVS   L0B072E
            EOR   #$8000
L0B072E     BPL   L0B073F
            LDA   $FF
            SEC
            SBC   #$0063
            BEQ   L0B0745
            BVS   L0B073D
            EOR   #$8000
L0B073D     BPL   L0B0745
L0B073F     LDA   #$0000
            BRL   L0B07C9
L0B0745     LDA   $FB
            CMP   #$0001
            BEQ   L0B076C
            CMP   #$0003
            BEQ   L0B076C
            CMP   #$0005
            BEQ   L0B076C
            CMP   #$0007
            BEQ   L0B076C
            CMP   #$0008
            BEQ   L0B076C
            CMP   #$000A
            BEQ   L0B076C
            CMP   #$000C
            BEQ   L0B076C
            BRA   L0B0775
L0B076C     LDA   #$001F
            STA   $F0
            BRA   L0B07A4
            BRA   L0B077C
L0B0775     CMP   #$0002
            BEQ   L0B077C
            BRA   L0B07A2
L0B077C     LDA   #$001C
            STA   $F0
            LDA   $FF
            PHA
            LDA   #$0004
            SEC
            JSL   L0D14B6
            PLA
            CMP   #$0000
            BNE   L0B0797
            LDA   #$001D
            STA   $F0
L0B0797     BRA   L0B07A4
L0B0799     LDA   #$001E
            STA   $F0
            BRA   L0B07A4
            BRA   L0B07A4
L0B07A2     BRA   L0B0799
L0B07A4     LDA   $FD
            SEC
            SBC   #$0000
            BEQ   L0B07C6
            BVS   L0B07B1
            EOR   #$8000
L0B07B1     BPL   L0B07C6
            LDA   $FD
            SEC
            SBC   $F0
            BEQ   L0B07C1
            BVS   L0B07BF
            EOR   #$8000
L0B07BF     BMI   L0B07C6
L0B07C1     LDA   #$0001
            BRA   L0B07C9
L0B07C6     LDA   #$0000
L0B07C9     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0B07D3     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E4
            TCS
            LDX   $FF
            LDA   $FD
            STX   $E8
            STA   $E6
            PEA   $0000
            PEA   $0008
            PEA   $0000
            TDC
            CLC
            ADC   #$00EB
            PHA
            PEI   $FF
            PEI   $FD
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $0000
            PEA   $0005
            PEI   $FF
            PEI   $FD
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   #$0000
            LDA   #$0005
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L0D1573
            PLA
            PLX
            STX   $FF
            STA   $FD
            LDX   $FF
            LDA   $FD
            INC   $FD
            BNE   L0B0844
            INC   $FF
L0B0844     STA   $F4
            STX   $F6
            LDA   #$002F
            SEP   #$20
            STA   [$F4]
            REP   #$20
            PEA   $0000
            PEA   $0002
            PEI   $FF
            PEI   $FD
            PEA   $0000
            TDC
            CLC
            ADC   #$00EB
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   #$0000
            LDA   #$0002
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L0D1573
            PLA
            PLX
            STX   $FF
            STA   $FD
            LDA   #$0000
            SEP   #$20
            STA   [$FD]
            REP   #$20
            LDA   [$E6]
            AND   #$00FF
            CMP   #$0030
            BNE   L0B08CA
            PEA   $0000
            PEA   $0008
            PEI   $E8
            PEI   $E6
            LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $E8
            LDA   $E6
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
            LDA   #$0008
            BRA   L0B08CD
            BRA   L0B08CD
L0B08CA     LDA   #$0009
L0B08CD     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0B08D7     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00D6
            TCS
            LDA   $FF
            CMP   #$0000
            BNE   L0B08EF
            LDA   #$0000
            BRL   L0B0C46
L0B08EF     LDA   $FF
            SEC
            SBC   #$0003
            BVS   L0B08FA
            EOR   #$8000
L0B08FA     BMI   L0B0902
            LDA   #$FFF2
            BRL   L0B0C46
L0B0902     LDA   $FF
            STA   $EA
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L0B090F
            DEX
L0B090F     PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00DB
            PHA
            PEI   $FD
            PEI   $FB
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$FFFF
            STA   $EE
            LDA   #$0001
            STA   $D8
            LDA   $EA
            TAX
            LDA   $DA,X
            AND   #$00FF
            PHA
            JSL   L0B06B4
            PLY
            TAY
            BEQ   L0B0948
            BRL   L0B09FF
L0B0948     LDA   $EA
            TAX
            LDA   $DA,X
            AND   #$00FF
            STA   $EC
            LDA   $EC
            CMP   #$004D
            BEQ   L0B0961
            CMP   #$006D
            BEQ   L0B0961
            BRL   L0B09A6
L0B0961     LDA   $EA
            SEC
            SBC   #$0001
            STA   $EA
            LDA   $EA
            TAX
            LDA   $DA,X
            AND   #$00FF
            STA   $EC
            LDA   $EC
            CMP   #$0041
            BEQ   L0B0981
            CMP   #$0061
            BEQ   L0B0981
            BRA   L0B0987
L0B0981     STZ   $EE
            BRA   L0B09A2
            BRA   L0B0993
L0B0987     CMP   #$0050
            BEQ   L0B0993
            CMP   #$0070
            BEQ   L0B0993
            BRA   L0B09A0
L0B0993     LDA   #$000C
            STA   $EE
            BRA   L0B09A2
L0B099A     STZ   $D8
            BRA   L0B09A2
            BRA   L0B09A2
L0B09A0     BRA   L0B099A
L0B09A2     BRA   L0B09D3
            BRA   L0B09B2
L0B09A6     CMP   #$0041
            BEQ   L0B09B2
            CMP   #$0061
            BEQ   L0B09B2
            BRA   L0B09B8
L0B09B2     STZ   $EE
            BRA   L0B09D3
            BRA   L0B09C4
L0B09B8     CMP   #$0050
            BEQ   L0B09C4
            CMP   #$0070
            BEQ   L0B09C4
            BRA   L0B09D1
L0B09C4     LDA   #$000C
            STA   $EE
            BRA   L0B09D3
L0B09CB     STZ   $D8
            BRA   L0B09D3
            BRA   L0B09D3
L0B09D1     BRA   L0B09CB
L0B09D3     LDA   $EE
            CMP   #$FFFF
            BEQ   L0B09FF
            LDA   $EA
            SEC
            SBC   #$0001
            STA   $EA
            LDA   $EA
            TAX
            LDA   $DA,X
            AND   #$00FF
            STA   $EC
            LDA   $EC
            CMP   #$0020
            BNE   L0B09FB
            LDA   $EA
            SEC
            SBC   #$0001
            STA   $EA
L0B09FB     LDA   $EA
            STA   $FF
L0B09FF     LDA   $D8
            BNE   L0B0A09
            LDA   #$FFF2
            BRL   L0B0C46
L0B0A09     LDA   $EA
            TAX
            LDA   $DA,X
            AND   #$00FF
            PHA
            JSL   L0B06B4
            PLY
            STA   $D8
            LDA   $D8
            BNE   L0B0A20
            BRL   L0B0AB0
L0B0A20     LDA   $EA
            SEC
            SBC   #$0001
            STA   $EA
            LDA   $EA
            TAX
            LDA   $DA,X
            AND   #$00FF
            PHA
            JSL   L0B06B4
            PLY
            TAY
            BNE   L0B0A95
            LDA   $FF
            SEC
            SBC   $EA
            LDX   #$0000
            TAY
            BPL   L0B0A45
            DEX
L0B0A45     PHX
            PHA
            LDA   $EA
            CLC
            ADC   #$0002
            TAX
            PEA   $0000
            PHD
            TXA
            CLC
            ADC   #$00DA
            ADC   $01,S
            STA   $01,S
            LDA   $EA
            CLC
            ADC   #$0001
            TAX
            PEA   $0000
            PHD
            TXA
            CLC
            ADC   #$00DA
            ADC   $01,S
            STA   $01,S
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $FF
            CLC
            ADC   #$0001
            STA   $FF
            LDA   $EA
            CLC
            ADC   #$0001
            TAX
            LDA   #$0030
            SEP   #$20
            STA   $DA,X
            REP   #$20
            BRA   L0B0AB0
L0B0A95     LDA   $EA
            SEC
            SBC   #$0001
            STA   $EA
            LDA   $EA
            TAX
            LDA   $DA,X
            AND   #$00FF
            PHA
            JSL   L0B06B4
            PLY
            TAY
            BEQ   L0B0AB0
            STZ   $D8
L0B0AB0     LDA   $D8
            BEQ   L0B0ACC
            LDA   $EA
            SEC
            SBC   #$0001
            STA   $EA
            LDA   $EA
            TAX
            LDA   $DA,X
            AND   #$00FF
            PHA
            JSL   L0B06B4
            PLY
            STA   $D8
L0B0ACC     LDA   $D8
            BEQ   L0B0B23
            LDA   $EA
            CMP   #$0001
            BNE   L0B0B0B
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L0B0AE0
            DEX
L0B0AE0     PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00DC
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00DB
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$0030
            SEP   #$20
            STA   $DB
            REP   #$20
            BRA   L0B0B23
L0B0B0B     LDA   $EA
            SEC
            SBC   #$0001
            STA   $EA
            LDA   $EA
            TAX
            LDA   $DA,X
            AND   #$00FF
            PHA
            JSL   L0B06B4
            PLY
            STA   $D8
L0B0B23     LDA   $D8
            BNE   L0B0B2D
            LDA   #$FFF2
            BRL   L0B0C46
L0B0B2D     LDA   $DC
            AND   #$00FF
            PHA
            LDA   $DB
            AND   #$00FF
            PHA
            JSL   L0B0654
            PLY
            PLY
            STA   $E8
            LDA   $DF
            AND   #$00FF
            PHA
            LDA   $DE
            AND   #$00FF
            PHA
            JSL   L0B0654
            PLY
            PLY
            STA   $E6
            LDA   $E8
            SEC
            SBC   #$FFFF
            BEQ   L0B0B90
            BVS   L0B0B62
            EOR   #$8000
L0B0B62     BPL   L0B0B90
            LDA   $EE
            CMP   #$0000
            BEQ   L0B0B6D
            BRA   L0B0B7A
L0B0B6D     LDA   $E8
            CMP   #$000C
            BNE   L0B0B76
            STZ   $E8
L0B0B76     BRA   L0B0B90
            BRA   L0B0B81
L0B0B7A     CMP   #$000C
            BEQ   L0B0B81
            BRA   L0B0B90
L0B0B81     LDA   $E8
            CMP   #$000C
            BEQ   L0B0B90
            LDA   $E8
            CLC
            ADC   #$000C
            STA   $E8
L0B0B90     LDA   $E8
            SEC
            SBC   #$0000
            BVS   L0B0B9B
            EOR   #$8000
L0B0B9B     BPL   L0B0BC8
            LDA   $E8
            SEC
            SBC   #$0017
            BEQ   L0B0BAC
            BVS   L0B0BAA
            EOR   #$8000
L0B0BAA     BMI   L0B0BC8
L0B0BAC     LDA   $E6
            SEC
            SBC   #$0000
            BVS   L0B0BB7
            EOR   #$8000
L0B0BB7     BPL   L0B0BC8
            LDA   $E6
            SEC
            SBC   #$003B
            BEQ   L0B0BCD
            BVS   L0B0BC6
            EOR   #$8000
L0B0BC6     BPL   L0B0BCD
L0B0BC8     LDA   #$FFF2
            BRA   L0B0C46
L0B0BCD     PEA   $0000
            TDC
            CLC
            ADC   #$00DB
            PHA
            PEI   $E8
            JSL   L0C0118
            PLY
            PLY
            PLY
            LDA   $E8
            SEC
            SBC   #$000A
            BVS   L0B0BEA
            EOR   #$8000
L0B0BEA     BMI   L0B0BFD
            LDA   $DB
            SEP   #$20
            STA   $DC
            REP   #$20
            LDA   #$0030
            SEP   #$20
            STA   $DB
            REP   #$20
L0B0BFD     LDA   #$003A
            SEP   #$20
            STA   $DD
            REP   #$20
            LDA   #$0020
            SEP   #$20
            STA   $E0
            REP   #$20
            LDA   #$0020
            SEP   #$20
            STA   $E1
            REP   #$20
            LDA   #$0020
            SEP   #$20
            STA   $E2
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STA   $E3
            REP   #$20
            LDA   $F9
            BEQ   L0B0C43
            PEA   $0000
            TDC
            CLC
            ADC   #$00DB
            PHA
            PEI   $FD
            PEI   $FB
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0B0C43     LDA   #$0008
L0B0C46     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0B0C50     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00D2
            TCS
            STZ   $D4
            PEA   $0000
            PEA   $0008
            PEA   $0000
            TDC
            CLC
            ADC   #$00E9
            PHA
            PEI   $FF
            PEI   $FD
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $EA
            AND   #$00FF
            PHA
            LDA   $E9
            AND   #$00FF
            PHA
            JSL   L0B0654
            PLY
            PLY
            STA   $DA
            LDA   $ED
            AND   #$00FF
            PHA
            LDA   $EC
            AND   #$00FF
            PHA
            JSL   L0B0654
            PLY
            PLY
            STA   $D8
            LDA   $DA
            SEC
            SBC   #$000C
            BVS   L0B0CAF
            EOR   #$8000
L0B0CAF     BPL   L0B0CC7
            LDA   #$0001
            STA   $D4
            LDA   $DA
            CMP   #$000C
            BEQ   L0B0CC5
            LDA   $DA
            SEC
            SBC   #$000C
            STA   $DA
L0B0CC5     BRA   L0B0CD3
L0B0CC7     LDA   $DA
            CMP   #$0000
            BNE   L0B0CD3
            LDA   #$000C
            STA   $DA
L0B0CD3     PEA   $0000
            TDC
            CLC
            ADC   #$00DD
            PHA
            PEI   $DA
            JSL   L0C0118
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00DD
            PHA
            JSL   L0C04CD
            PLY
            PLY
            CLC
            ADC   #$0001
            STA   $D6
            LDA   $D6
            INC   $D6
            TAX
            LDA   #$003A
            SEP   #$20
            STA   $DC,X
            REP   #$20
            LDA   $D8
            SEC
            SBC   #$000A
            BVS   L0B0D13
            EOR   #$8000
L0B0D13     BMI   L0B0D46
            LDA   $D6
            INC   $D6
            TAX
            LDA   #$0030
            SEP   #$20
            STA   $DC,X
            REP   #$20
            LDA   $D6
            TAX
            PEA   $0000
            PHD
            TXA
            CLC
            ADC   #$00DC
            ADC   $01,S
            STA   $01,S
            PEI   $D8
            JSL   L0C0118
            PLY
            PLY
            PLY
            LDA   $D6
            CLC
            ADC   #$0001
            STA   $D6
            BRA   L0B0D67
L0B0D46     LDA   $D6
            TAX
            PEA   $0000
            PHD
            TXA
            CLC
            ADC   #$00DC
            ADC   $01,S
            STA   $01,S
            PEI   $D8
            JSL   L0C0118
            PLY
            PLY
            PLY
            LDA   $D6
            CLC
            ADC   #$0002
            STA   $D6
L0B0D67     LDA   $D6
            INC   $D6
            TAX
            LDA   #$0020
            SEP   #$20
            STA   $DC,X
            REP   #$20
            LDA   $D4
            BEQ   L0B0D87
            LDA   $D6
            TAX
            LDA   #$0050
            SEP   #$20
            STA   $DC,X
            REP   #$20
            BRA   L0B0D93
L0B0D87     LDA   $D6
            TAX
            LDA   #$0041
            SEP   #$20
            STA   $DC,X
            REP   #$20
L0B0D93     LDA   $D6
            CLC
            ADC   #$0001
            STA   $D6
            LDA   $D6
            INC   $D6
            TAX
            LDA   #$004D
            SEP   #$20
            STA   $DC,X
            REP   #$20
            LDA   $D6
            TAX
            LDA   #$0000
            SEP   #$20
            STA   $DC,X
            REP   #$20
            PEA   $0000
            TDC
            CLC
            ADC   #$00DD
            PHA
            PEI   $FF
            PEI   $FD
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   $D6
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0B0DD6     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            LDA   $FF
            CMP   #$0000
            BNE   L0B0DF0
            LDA   #$0001
            STA   $EE
            BRL   L0B0E80
L0B0DF0     PEI   $FF
            PEA   $0003
            PEI   $FD
            PEI   $FB
            PEA   ^L0E52A9
            PEA   L0E52A9
            JSL   L0C04FA
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            CMP   #$0000
            BEQ   L0B0E30
            PEI   $FF
            PEA   $0001
            PEI   $FD
            PEI   $FB
            PEA   ^L0E52AD
            PEA   L0E52AD
            JSL   L0C04FA
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            CMP   #$0000
            BNE   L0B0E37
L0B0E30     LDA   #$0001
            STA   $EE
            BRA   L0B0E80
L0B0E37     PEI   $FF
            PEA   $0002
            PEI   $FD
            PEI   $FB
            PEA   ^L0E52AF
            PEA   L0E52AF
            JSL   L0C04FA
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            CMP   #$0000
            BEQ   L0B0E77
            PEI   $FF
            PEA   $0001
            PEI   $FD
            PEI   $FB
            PEA   ^L0E52B2
            PEA   L0E52B2
            JSL   L0C04FA
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            CMP   #$0000
            BNE   L0B0E7B
L0B0E77     STZ   $EE
            BRA   L0B0E80
L0B0E7B     LDA   #$FFF1
            BRA   L0B0EBE
L0B0E80     LDA   $F9
            BEQ   L0B0EBB
            LDA   $EE
            BEQ   L0B0E93
            LDA   #$0059
            SEP   #$20
            STA   [$FB]
            REP   #$20
            BRA   L0B0E9C
L0B0E93     LDA   #$004E
            SEP   #$20
            STA   [$FB]
            REP   #$20
L0B0E9C     LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $FD
            LDA   $FB
            JSL   L0D1573
            PLA
            PLX
            STX   $FD
            STA   $FB
            LDA   #$0000
            SEP   #$20
            STA   [$FB]
            REP   #$20
L0B0EBB     LDA   #$0001
L0B0EBE     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0B0EC8     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDA   [$FD]
            AND   #$00FF
            CMP   #$0059
            BNE   L0B0EF6
            PEA   ^L0E52B4
            PEA   L0E52B4
            PEI   $FF
            PEI   $FD
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   #$0004
            BRA   L0B0F0B
            BRA   L0B0F0B
L0B0EF6     PEA   ^L0E52B8
            PEA   L0E52B8
            PEI   $FF
            PEI   $FD
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   #$0003
L0B0F0B     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0B0F15     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EC
            TCS
            LDA   $FF
            CMP   #$0000
            BNE   L0B0F2D
            LDA   #$0000
            BRL   L0B0F9D
L0B0F2D     STZ   $F0
L0B0F2F     LDA   $F0
            SEC
            SBC   $FF
            BVS   L0B0F39
            EOR   #$8000
L0B0F39     BMI   L0B0F9A
            LDX   $FD
            LDA   $FB
            INC   $FB
            BNE   L0B0F45
            INC   $FD
L0B0F45     STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            STA   $EE
            LDA   $EE
            SEC
            SBC   #$0041
            BVS   L0B0F5B
            EOR   #$8000
L0B0F5B     BPL   L0B0F6C
            LDA   $EE
            SEC
            SBC   #$005A
            BEQ   L0B0F8F
            BVS   L0B0F6A
            EOR   #$8000
L0B0F6A     BPL   L0B0F8F
L0B0F6C     LDA   $EE
            SEC
            SBC   #$0061
            BVS   L0B0F77
            EOR   #$8000
L0B0F77     BPL   L0B0F88
            LDA   $EE
            SEC
            SBC   #$007A
            BEQ   L0B0F8F
            BVS   L0B0F86
            EOR   #$8000
L0B0F86     BPL   L0B0F8F
L0B0F88     LDA   $EE
            CMP   #$0020
            BNE   L0B0F93
L0B0F8F     INC   $F0
            BRA   L0B0F98
L0B0F93     LDA   #$FFF0
            BRA   L0B0F9D
L0B0F98     BRA   L0B0F2F
L0B0F9A     LDA   #$0000
L0B0F9D     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0B0FA7     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00ED
            TCS
            LDA   $FF
            CMP   #$0000
            BNE   L0B0FBF
            LDA   #$0000
            BRL   L0B1068
L0B0FBF     STZ   $F0
L0B0FC1     LDA   $F0
            SEC
            SBC   $FF
            BVS   L0B0FCB
            EOR   #$8000
L0B0FCB     BPL   L0B0FD0
            BRL   L0B1065
L0B0FD0     LDX   $FD
            LDA   $FB
            INC   $FB
            BNE   L0B0FDA
            INC   $FD
L0B0FDA     STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            SEP   #$20
            STA   $EF
            REP   #$20
            LDA   $EF
            AND   #$00FF
            SEC
            SBC   #$0041
            BVS   L0B0FF7
            EOR   #$8000
L0B0FF7     BPL   L0B100B
            LDA   $EF
            AND   #$00FF
            SEC
            SBC   #$005A
            BEQ   L0B1059
            BVS   L0B1009
            EOR   #$8000
L0B1009     BPL   L0B1059
L0B100B     LDA   $EF
            AND   #$00FF
            SEC
            SBC   #$0061
            BVS   L0B1019
            EOR   #$8000
L0B1019     BPL   L0B102D
            LDA   $EF
            AND   #$00FF
            SEC
            SBC   #$007A
            BEQ   L0B1059
            BVS   L0B102B
            EOR   #$8000
L0B102B     BPL   L0B1059
L0B102D     LDA   $EF
            AND   #$00FF
            SEC
            SBC   #$0030
            BVS   L0B103B
            EOR   #$8000
L0B103B     BPL   L0B104F
            LDA   $EF
            AND   #$00FF
            SEC
            SBC   #$0039
            BEQ   L0B1059
            BVS   L0B104D
            EOR   #$8000
L0B104D     BPL   L0B1059
L0B104F     LDA   $EF
            AND   #$00FF
            CMP   #$0020
            BNE   L0B105D
L0B1059     INC   $F0
            BRA   L0B1062
L0B105D     LDA   #$FFEE
            BRA   L0B1068
L0B1062     BRL   L0B0FC1
L0B1065     LDA   #$0000
L0B1068     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0B1072     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EC
            TCS
            LDA   $FF
            CMP   #$0000
            BNE   L0B108A
            LDA   #$0000
            BRL   L0B1101
L0B108A     STZ   $F0
L0B108C     LDA   $F0
            SEC
            SBC   $FF
            BVS   L0B1096
            EOR   #$8000
L0B1096     BMI   L0B10FE
            LDX   $FD
            LDA   $FB
            INC   $FB
            BNE   L0B10A2
            INC   $FD
L0B10A2     STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            STA   $EE
            LDA   $EE
            SEC
            SBC   #$0030
            BVS   L0B10B8
            EOR   #$8000
L0B10B8     BPL   L0B10C9
            LDA   $EE
            SEC
            SBC   #$0039
            BEQ   L0B10F3
            BVS   L0B10C7
            EOR   #$8000
L0B10C7     BPL   L0B10F3
L0B10C9     LDA   $EE
            CMP   #$0029
            BEQ   L0B10F3
            LDA   $EE
            CMP   #$0028
            BEQ   L0B10F3
            LDA   $EE
            CMP   #$002D
            BEQ   L0B10F3
            LDA   $EE
            CMP   #$002E
            BEQ   L0B10F3
            LDA   $EE
            CMP   #$0020
            BEQ   L0B10F3
            LDA   $EE
            CMP   #$002C
            BNE   L0B10F7
L0B10F3     INC   $F0
            BRA   L0B10FC
L0B10F7     LDA   #$FFED
            BRA   L0B1101
L0B10FC     BRA   L0B108C
L0B10FE     LDA   #$0000
L0B1101     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0B110B     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            AND   #$FFE0
            PHA
            LDA   $FF
            PLX
            STX   $F6
            SEC
            SBC   $F6
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0B112E     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            LDA   [$FB]
            PHA
            JSL   L0B110B
            PLY
            STA   L0F0131
            LDA   L0F0131
            STA   L0F012F
            LDA   [$FB]
            EOR   L0F012F
            STA   L0F012F
            LDA   L0F012F
            ORA   $FF
            PHA
            PLA
            STA   [$FB]
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0B1163     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            AND   #$FF9F
            PHA
            LDA   $FF
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   L0F012F
            LDA   L0F012F
            LSR
            LSR
            LSR
            LSR
            LSR
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0B1191     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            LDA   [$FB]
            AND   #$FF9F
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            SEC
            SBC   $F2
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            EOR   $F2
            PHA
            PLA
            STA   [$FB]
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            STA   L0F012F
            LDA   [$FB]
            ORA   L0F012F
            PHA
            PLA
            STA   [$FB]
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0B11D1     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            AND   #$FE7F
            PHA
            LDA   $FF
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   L0F012F
            LDA   L0F012F
            LSR
            LSR
            LSR
            LSR
            LSR
            LSR
            LSR
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0B1201     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            LDA   [$FB]
            AND   #$FE7F
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            SEC
            SBC   $F2
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            EOR   $F2
            PHA
            PLA
            STA   [$FB]
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            ASL
            ASL
            STA   L0F012F
            LDA   [$FB]
            ORA   L0F012F
            PHA
            PLA
            STA   [$FB]
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0B1243     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            AND   #$F9FF
            PHA
            LDA   $FF
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   L0F012F
            LDA   L0F012F
            PHA
            LDA   #$0009
            CLC
            JSL   L0D1564
            PLA
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0B1276     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            LDA   [$FB]
            AND   #$F9FF
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            SEC
            SBC   $F2
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            EOR   $F2
            PHA
            PLA
            STA   [$FB]
            LDA   $FF
            PHA
            LDA   #$0009
            CLC
            JSL   L0D1510
            PLA
            STA   L0F012F
            LDA   [$FB]
            ORA   L0F012F
            PHA
            PLA
            STA   [$FB]
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0B12BB     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            AND   #$E7FF
            PHA
            LDA   $FF
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   L0F012F
            LDA   L0F012F
            PHA
            LDA   #$000B
            CLC
            JSL   L0D1564
            PLA
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0B12EE     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            LDA   [$FB]
            AND   #$E7FF
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            SEC
            SBC   $F2
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            EOR   $F2
            PHA
            PLA
            STA   [$FB]
            LDA   $FF
            PHA
            LDA   #$000B
            CLC
            JSL   L0D1510
            PLA
            STA   L0F012F
            LDA   [$FB]
            ORA   L0F012F
            PHA
            PLA
            STA   [$FB]
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0B1333     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            AND   #$1FFF
            PHA
            LDA   $FF
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   L0F012F
            LDA   L0F012F
            PHA
            LDA   #$000D
            CLC
            JSL   L0D1564
            PLA
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0B1366     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            LDA   [$FB]
            AND   #$1FFF
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            SEC
            SBC   $F2
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            EOR   $F2
            PHA
            PLA
            STA   [$FB]
            LDA   $FF
            PHA
            LDA   #$000D
            CLC
            JSL   L0D1510
            PLA
            STA   L0F012F
            LDA   [$FB]
            ORA   L0F012F
            PHA
            PLA
            STA   [$FB]
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0B13AB     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E2
            TCS
            PEI   $FF
            PEI   $FD
            JSL   L0C04CD
            PLY
            PLY
            STA   $F0
            LDA   $F0
            CMP   #$0008
            BEQ   L0B13F1
            PEA   ^L0E52CD
            PEA   L0E52CD
            PEA   ^L0E31AF
            PEA   L0E31AF
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEI   $FF
            PEI   $FD
            PEA   ^L0E31AF
            PEA   L0E31AF
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            BRA   L0B1403
L0B13F1     PEI   $FF
            PEI   $FD
            PEA   ^L0E31AF
            PEA   L0E31AF
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0B1403     LDA   #$0000
            SEP   #$20
            STAL  L0E31B1
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STAL  L0E31B4
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STAL  L0E31B7
            REP   #$20
            PEA   ^L0E31AF
            PEA   L0E31AF
            JSL   L0C0324
            PLY
            PLY
            STA   $F0
            PEA   ^L0E31B2
            PEA   L0E31B2
            JSL   L0C0324
            PLY
            PLY
            STA   $EE
            PEA   ^L0E31B5
            PEA   L0E31B5
            JSL   L0C0324
            PLY
            PLY
            STA   $EC
            PEI   $FB
            JSL   L0B1163
            PLY
            CMP   #$0000
            BEQ   L0B145C
            BRA   L0B1474
L0B145C     PEA   ^L0E31B5
            PEA   L0E31B5
            PEA   ^L0E31FB
            PEA   L0E31FB
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRA   L0B14A5
            BRA   L0B147B
L0B1474     CMP   #$0001
            BEQ   L0B147B
            BRA   L0B1493
L0B147B     PEA   ^L0E31FB
            PEA   L0E31FB
            LDA   $EC
            CLC
            ADC   #$076C
            PHA
            JSL   L0C0118
            PLY
            PLY
            PLY
            BRA   L0B14A5
            BRA   L0B149A
L0B1493     CMP   #$0002
            BEQ   L0B149A
            BRA   L0B14A5
L0B149A     LDA   #$0000
            SEP   #$20
            STAL  L0E31FB
            REP   #$20
L0B14A5     PEI   $FB
            JSL   L0B11D1
            PLY
            STA   $E4
            LDA   $E4
            CMP   #$0000
            BEQ   L0B14B7
            BRA   L0B14CB
L0B14B7     PEA   ^L0E31DF
            PEA   L0E31DF
            PEI   $F0
            JSL   L0C0118
            PLY
            PLY
            PLY
            BRL   L0B153F
            BRA   L0B14D2
L0B14CB     CMP   #$0001
            BEQ   L0B14D2
            BRA   L0B1507
L0B14D2     LDA   $F0
            ASL
            ASL
            PHA
            LDA   #L0E4768	; Bug L0E4764
            sec		; LoGo
            sbc   #4
            STA   $F2
            LDA   #^L0E4768	; Bug L0E4764
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L0B14EB
            INC   $F4
L0B14EB     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            PEA   ^L0E31DF
            PEA   L0E31DF
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRA   L0B153F
            BRA   L0B150E
L0B1507     CMP   #$0002
            BEQ   L0B150E
            BRA   L0B153F
L0B150E     LDA   $F0
            ASL
            ASL
            PHA
            LDA   #L0E4794
            STA   $F2
            LDA   #^L0E4794
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L0B1527
            INC   $F4
L0B1527     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            PEA   ^L0E31DF
            PEA   L0E31DF
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0B153F     PEA   ^L0E31F7
            PEA   L0E31F7
            PEI   $EE
            JSL   L0C0118
            PLY
            PLY
            PLY
            PEI   $FB
            JSL   L0B12BB
            PLY
            CMP   #$0000
            BEQ   L0B155C
            BRA   L0B156C
L0B155C     LDA   #$0000
            SEP   #$20
            STAL  L0E3201
            REP   #$20
            BRL   L0B1608
            BRA   L0B1573
L0B156C     CMP   #$0001
            BEQ   L0B1573
            BRA   L0B15BC
L0B1573     PEI   $EE
            PEI   $F0
            LDA   $EC
            CLC
            ADC   #$076C
            PHA
            JSL   L0510BC
            PLY
            PLY
            PLY
            STA   $EA
            LDA   $EA
            ASL
            ASL
            PHA
            LDA   #L0E47C8
            STA   $F2
            LDA   #^L0E47C8
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L0B15A0
            INC   $F4
L0B15A0     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            PEA   ^L0E3201
            PEA   L0E3201
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRA   L0B1608
            BRA   L0B15C3
L0B15BC     CMP   #$0002
            BEQ   L0B15C3
            BRA   L0B1608
L0B15C3     PEI   $EE
            PEI   $F0
            LDA   $EC
            CLC
            ADC   #$076C
            PHA
            JSL   L0510BC
            PLY
            PLY
            PLY
            STA   $EA
            LDA   $EA
            ASL
            ASL
            PHA
            LDA   #L0E47E4
            STA   $F2
            LDA   #^L0E47E4
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L0B15F0
            INC   $F4
L0B15F0     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            PEA   ^L0E3201
            PEA   L0E3201
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0B1608     LDA   #$0000
            SEP   #$20
            STA   [$FD]
            REP   #$20
            PEI   $FB
            JSL   L0B12BB
            PLY
            CMP   #$0000
            BEQ   L0B161F
            BRA   L0B1624
L0B161F     BRL   L0B16BC
            BRA   L0B162B
L0B1624     CMP   #$0001
            BEQ   L0B162B
            BRA   L0B1672
L0B162B     PEI   $EE
            PEI   $F0
            LDA   $EC
            CLC
            ADC   #$076C
            PHA
            JSL   L0510BC
            PLY
            PLY
            PLY
            STA   $EA
            LDA   $EA
            ASL
            ASL
            PHA
            LDA   #L0E47C8
            STA   $F2
            LDA   #^L0E47C8
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L0B1658
            INC   $F4
L0B1658     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            PEI   $FF
            PEI   $FD
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRA   L0B16BC
            BRA   L0B1679
L0B1672     CMP   #$0002
            BEQ   L0B1679
            BRA   L0B16BC
L0B1679     PEI   $EE
            PEI   $F0
            LDA   $EC
            CLC
            ADC   #$076C
            PHA
            JSL   L0510BC
            PLY
            PLY
            PLY
            STA   $EA
            LDA   $EA
            ASL
            ASL
            PHA
            LDA   #L0E47E4
            STA   $F2
            LDA   #^L0E47E4
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L0B16A6
            INC   $F4
L0B16A6     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            PEI   $FF
            PEI   $FD
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0B16BC     PEI   $FF
            PEI   $FD
            JSL   L0C04CD
            PLY
            PLY
            SEC
            SBC   #$0000
            BEQ   L0B16E5
            BVS   L0B16D1
            EOR   #$8000
L0B16D1     BPL   L0B16E5
            PEA   ^L0E52CF
            PEA   L0E52CF
            PEI   $FF
            PEI   $FD
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
L0B16E5     PEI   $FB
            JSL   L0B1243
            PLY
            STA   $E6
            LDA   $E6
            CMP   #$0000
            BEQ   L0B16F7
            BRA   L0B170E
L0B16F7     PEA   ^L0E31DF
            PEA   L0E31DF
            PEI   $FF
            PEI   $FD
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            BRL   L0B1744
            BRA   L0B1715
L0B170E     CMP   #$0001
            BEQ   L0B1715
            BRA   L0B172B
L0B1715     PEA   ^L0E31FB
            PEA   L0E31FB
            PEI   $FF
            PEI   $FD
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            BRA   L0B1744
            BRA   L0B1732
L0B172B     CMP   #$0002
            BEQ   L0B1732
            BRA   L0B1744
L0B1732     PEA   ^L0E31F7
            PEA   L0E31F7
            PEI   $FF
            PEI   $FD
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
L0B1744     PEI   $FB
            JSL   L0B1333
            PLY
            STA   $E8
            LDA   $E8
            CMP   #$0003
            BEQ   L0B175B
            CMP   #$0004
            BEQ   L0B175B
            BRA   L0B17A2
L0B175B     PEA   ^L0E52D2
            PEA   L0E52D2
            PEI   $FF
            PEI   $FD
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            BRA   L0B17A4
L0B176F     LDA   $E8
            ASL
            ASL
            PHA
            LDA   #L0E4828
            STA   $F2
            LDA   #^L0E4828
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L0B1788
            INC   $F4
L0B1788     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            PEI   $FF
            PEI   $FD
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            BRA   L0B17A4
            BRA   L0B17A4
L0B17A2     BRA   L0B176F
L0B17A4     LDA   $E6
            CMP   #$0000
            BEQ   L0B17AD
            BRA   L0B17C3
L0B17AD     PEA   ^L0E31F7
            PEA   L0E31F7
            PEI   $FF
            PEI   $FD
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            BRA   L0B17E1
            BRA   L0B17CF
L0B17C3     CMP   #$0001
            BEQ   L0B17CF
            CMP   #$0002
            BEQ   L0B17CF
            BRA   L0B17E1
L0B17CF     PEA   ^L0E31DF
            PEA   L0E31DF
            PEI   $FF
            PEI   $FD
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
L0B17E1     LDA   $E8
            CMP   #$0003
            BEQ   L0B17EA
            BRA   L0B1831
L0B17EA     PEA   ^L0E52D4
            PEA   L0E52D4
            PEI   $FF
            PEI   $FD
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            BRA   L0B1833
L0B17FE     LDA   $E8
            ASL
            ASL
            PHA
            LDA   #L0E4828
            STA   $F2
            LDA   #^L0E4828
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L0B1817
            INC   $F4
L0B1817     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            PEI   $FF
            PEI   $FD
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            BRA   L0B1833
            BRA   L0B1833
L0B1831     BRA   L0B17FE
L0B1833     LDA   $E6
            CMP   #$0000
            BEQ   L0B183C
            BRA   L0B1853
L0B183C     PEA   ^L0E31FB
            PEA   L0E31FB
            PEI   $FF
            PEI   $FD
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            BRL   L0B1889
            BRA   L0B185A
L0B1853     CMP   #$0001
            BEQ   L0B185A
            BRA   L0B1870
L0B185A     PEA   ^L0E31F7
            PEA   L0E31F7
            PEI   $FF
            PEI   $FD
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            BRA   L0B1889
            BRA   L0B1877
L0B1870     CMP   #$0002
            BEQ   L0B1877
            BRA   L0B1889
L0B1877     PEA   ^L0E31FB
            PEA   L0E31FB
            PEI   $FF
            PEI   $FD
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
L0B1889     PEI   $FF
            PEI   $FD
            JSL   L0C04CD
            PLY
            PLY
            TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0B189D     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            AND   #$FF9F
            PHA
            LDA   $FF
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   L0F012F
            LDA   L0F012F
            LSR
            LSR
            LSR
            LSR
            LSR
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0B18CB     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            LDA   [$FB]
            AND   #$FF9F
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            SEC
            SBC   $F2
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            EOR   $F2
            PHA
            PLA
            STA   [$FB]
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            STA   L0F012F
            LDA   [$FB]
            ORA   L0F012F
            PHA
            PLA
            STA   [$FB]
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0B190B     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            AND   #$03FF
            PHA
            LDA   $FF
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   L0F012F
            LDA   L0F012F
            PHA
            LDA   #$000A
            CLC
            JSL   L0D1564
            PLA
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0B193E     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            LDA   [$FB]
            AND   #$03FF
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            SEC
            SBC   $F2
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            EOR   $F2
            PHA
            PLA
            STA   [$FB]
            LDA   $FF
            PHA
            LDA   #$000A
            CLC
            JSL   L0D1510
            PLA
            STA   L0F012F
            LDA   [$FB]
            ORA   L0F012F
            PHA
            PLA
            STA   [$FB]
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0B1983     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            AND   #$FC7F
            PHA
            LDA   $FF
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   L0F012F
            LDA   L0F012F
            LSR
            LSR
            LSR
            LSR
            LSR
            LSR
            LSR
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0B19B3     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            LDA   [$FB]
            AND   #$FC7F
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            SEC
            SBC   $F2
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            EOR   $F2
            PHA
            PLA
            STA   [$FB]
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            ASL
            ASL
            STA   L0F012F
            LDA   [$FB]
            ORA   L0F012F
            PHA
            PLA
            STA   [$FB]
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0B19F5     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00DC
            TCS
            PEI   $FB
            JSL   L0B1983
            PLY
            STA   $F0
            PEI   $F0
            PEI   $FF
            PEI   $FD
            JSL   L0B1B9F
            PLY
            PLY
            PLY
            STA   $EE
            PEI   $FB
            JSL   L0B189D
            PLY
            STA   $EC
            LDA   $EC
            CMP   #$0000
            BEQ   L0B1A2A
            BRA   L0B1A2F
L0B1A2A     BRL   L0B1AB0
            BRA   L0B1A36
L0B1A2F     CMP   #$0001
            BEQ   L0B1A36
            BRA   L0B1A7C
L0B1A36     LDX   $FF
            LDA   $FD
            STX   $E4
            STA   $E2
L0B1A3E     LDA   [$E2]
            AND   #$00FF
            CMP   #$0000
            BEQ   L0B1A78
            LDA   [$E2]
            AND   #$00FF
            CMP   #$002C
            BNE   L0B1A5D
            LDA   #$002E
            SEP   #$20
            STA   [$E2]
            REP   #$20
            BRA   L0B1A70
L0B1A5D     LDA   [$E2]
            AND   #$00FF
            CMP   #$002E
            BNE   L0B1A70
            LDA   #$002C
            SEP   #$20
            STA   [$E2]
            REP   #$20
L0B1A70     INC   $E2
            BNE   L0B1A76
            INC   $E4
L0B1A76     BRA   L0B1A3E
L0B1A78     BRA   L0B1AB0
            BRA   L0B1A83
L0B1A7C     CMP   #$0002
            BEQ   L0B1A83
            BRA   L0B1AB0
L0B1A83     LDX   $FF
            LDA   $FD
            STX   $E4
            STA   $E2
L0B1A8B     LDA   [$E2]
            AND   #$00FF
            CMP   #$0000
            BEQ   L0B1AB0
            LDA   [$E2]
            AND   #$00FF
            CMP   #$002C
            BNE   L0B1AA8
            LDA   #$0020
            SEP   #$20
            STA   [$E2]
            REP   #$20
L0B1AA8     INC   $E2
            BNE   L0B1AAE
            INC   $E4
L0B1AAE     BRA   L0B1A8B
L0B1AB0     PEI   $FB
            JSL   L0B190B
            PLY
            STA   $EA
            LDA   $EA
            CMP   #$0000
            BNE   L0B1AC3
            BRL   L0B1B8B
L0B1AC3     LDA   #L0E31AF
            LDX   #^L0E31AF
            STX   $E8
            STA   $E6
            LDX   $FF
            LDA   $FD
            STX   $E4
            STA   $E2
L0B1AD5     LDA   [$E2]
            AND   #$00FF
            CMP   #$0000
            BNE   L0B1AE2
            BRL   L0B1B70
L0B1AE2     LDA   [$E2]
            AND   #$00FF
            CMP   #$0024
            BEQ   L0B1B01
            LDA   [$E2]
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$E6]
            REP   #$20
            INC   $E6
            BNE   L0B1AFF
            INC   $E8
L0B1AFF     BRA   L0B1B67
L0B1B01     LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDA   $EA
            CLC
            ADC   #$0005
            ASL
            ASL
            PHA
            LDA   #L0E483C
            STA   $F2
            LDA   #^L0E483C
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L0B1B26
            INC   $F4
L0B1B26     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            JSL   L0D1573
            PLA
            PLX
            STX   $E0
            STA   $DE
            LDA   [$DE]
            AND   #$00FF
            CMP   #$0020
            BEQ   L0B1B67
L0B1B42     LDA   [$DE]
            AND   #$00FF
            CMP   #$0000
            BEQ   L0B1B67
            LDA   [$DE]
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$E6]
            REP   #$20
            INC   $E6
            BNE   L0B1B5F
            INC   $E8
L0B1B5F     INC   $DE
            BNE   L0B1B65
            INC   $E0
L0B1B65     BRA   L0B1B42
L0B1B67     INC   $E2
            BNE   L0B1B6D
            INC   $E4
L0B1B6D     BRL   L0B1AD5
L0B1B70     LDA   #$0000
            SEP   #$20
            STA   [$E6]
            REP   #$20
            PEA   ^L0E31AF
            PEA   L0E31AF
            PEI   $FF
            PEI   $FD
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0B1B8B     PEI   $FF
            PEI   $FD
            JSL   L0C04CD
            PLY
            PLY
            TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0B1B9F     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E2
            TCS
            LDX   $FD
            LDA   $FB
            STX   $EA
            STA   $E8
            LDX   $FD
            LDA   $FB
            STX   $E6
            STA   $E4
            STZ   $F0
L0B1BBC     LDA   [$E8]
            AND   #$00FF
            CMP   #$002E
            BEQ   L0B1BD0
            INC   $F0
            INC   $E8
            BNE   L0B1BCE
            INC   $EA
L0B1BCE     BRA   L0B1BBC
L0B1BD0     LDX   $EA
            LDA   $E8
            STX   $E6
            STA   $E4
            LDA   #$000F
            STA   $EE
            LDA   $FF
            SEC
            SBC   #$0000
            BEQ   L0B1C42
            BVS   L0B1BEA
            EOR   #$8000
L0B1BEA     BPL   L0B1C42
            LDX   $EA
            LDA   $E8
            INC   $E8
            BNE   L0B1BF6
            INC   $EA
L0B1BF6     STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            PHA
            LDA   $EE
            INC   $EE
            TAX
            PLA
            SEP   #$20
            STAL  L0E31AF,X
            REP   #$20
            STZ   $EC
            BRA   L0B1C36
L0B1C12     LDX   $EA
            LDA   $E8
            INC   $E8
            BNE   L0B1C1C
            INC   $EA
L0B1C1C     STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            PHA
            LDA   $EE
            INC   $EE
            TAX
            PLA
            SEP   #$20
            STAL  L0E31AF,X
            REP   #$20
            INC   $EC
L0B1C36     LDA   $EC
            SEC
            SBC   $FF
            BVS   L0B1C40
            EOR   #$8000
L0B1C40     BPL   L0B1C12
L0B1C42     LDA   $EE
            TAX
            LDA   #$0000
            SEP   #$20
            STAL  L0E31AF,X
            REP   #$20
            STZ   $EC
            LDA   #$000E
            STA   $EE
            LDX   $E6
            LDA   $E4
            LDA   $E4
            BNE   L0B1C61
            DEC   $E6
L0B1C61     DEC   $E4
            STA   $F2
            STX   $F4
L0B1C67     LDA   $F0
            SEC
            SBC   #$0000
            BNE   L0B1C72
            BRL   L0B1D01
L0B1C72     BVS   L0B1C77
            EOR   #$8000
L0B1C77     BMI   L0B1C7C
            BRL   L0B1D01
L0B1C7C     LDA   [$E4]
            AND   #$00FF
            CMP   #$002D
            BNE   L0B1CBD
            LDA   $EE
            CLC
            ADC   #$0001
            TAX
            LDAL  L0E31AF,X
            AND   #$00FF
            CMP   #$002C
            BNE   L0B1C9B
            INC   $EE
L0B1C9B     LDA   $EE
            DEC   $EE
            TAX
            LDA   #$0024
            SEP   #$20
            STAL  L0E31AF,X
            REP   #$20
            LDA   $EE
            DEC   $EE
            TAX
            LDA   #$002D
            SEP   #$20
            STAL  L0E31AF,X
            REP   #$20
            BRA   L0B1D01
L0B1CBD     LDA   $EC
            CMP   #$0003
            BNE   L0B1CD6
            LDA   $EE
            DEC   $EE
            TAX
            LDA   #$002C
            SEP   #$20
            STAL  L0E31AF,X
            REP   #$20
            STZ   $EC
L0B1CD6     LDX   $E6
            LDA   $E4
            LDA   $E4
            BNE   L0B1CE0
            DEC   $E6
L0B1CE0     DEC   $E4
            STA   $F2
            STX   $F4
            LDA   [$F2]
            AND   #$00FF
            PHA
            LDA   $EE
            DEC   $EE
            TAX
            PLA
            SEP   #$20
            STAL  L0E31AF,X
            REP   #$20
            INC   $EC
            DEC   $F0
            BRL   L0B1C67
L0B1D01     LDA   $F0
            CMP   #$0000
            BNE   L0B1D2D
            LDA   $EE
            CLC
            ADC   #$0001
            TAX
            LDAL  L0E31AF,X
            AND   #$00FF
            CMP   #$002C
            BNE   L0B1D1D
            INC   $EE
L0B1D1D     LDA   $EE
            DEC   $EE
            TAX
            LDA   #$0024
            SEP   #$20
            STAL  L0E31AF,X
            REP   #$20
L0B1D2D     INC   $EE
            LDA   $EE
            TAX
            TXA
            CLC
            ADC   #L0E31AF
            TAX
            LDA   #^L0E31AF
            BCC   L0B1D3E
            INC
L0B1D3E     PHA
            PHX
            JSL   L0C04CD
            PLY
            PLY
            STA   $EC
            LDA   $EC
            CMP   #$0000
            BEQ   L0B1D51
            BRA   L0B1D75
L0B1D51     PEA   ^L0E52D7
            PEA   L0E52D7
            LDA   $EE
            TAX
            TXA
            CLC
            ADC   #L0E31AF
            TAX
            LDA   #^L0E31AF
            BCC   L0B1D66
            INC
L0B1D66     PHA
            PHX
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRL   L0B1E35
            BRA   L0B1D7D
L0B1D75     CMP   #$0001
            BEQ   L0B1D7D
            BRL   L0B1DE0
L0B1D7D     LDA   $EE
            TAX
            LDAL  L0E31AF,X
            AND   #$00FF
            CMP   #$0024
            BNE   L0B1DAD
            PEA   ^L0E52D9
            PEA   L0E52D9
            LDA   $EE
            TAX
            TXA
            CLC
            ADC   #L0E31AF
            TAX
            LDA   #^L0E31AF
            BCC   L0B1DA1
            INC
L0B1DA1     PHA
            PHX
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRA   L0B1DDB
L0B1DAD     LDA   $EE
            TAX
            LDAL  L0E31AF,X
            AND   #$00FF
            CMP   #$002D
            BNE   L0B1DDB
            PEA   ^L0E52DC
            PEA   L0E52DC
            LDA   $EE
            TAX
            TXA
            CLC
            ADC   #L0E31AF
            TAX
            LDA   #^L0E31AF
            BCC   L0B1DD1
            INC
L0B1DD1     PHA
            PHX
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0B1DDB     BRL   L0B1E35
            BRA   L0B1DE8
L0B1DE0     CMP   #$0002
            BEQ   L0B1DE8
            BRL   L0B1E35
L0B1DE8     PEA   $0002
            PEA   $0002
            LDA   $EE
            TAX
            TXA
            CLC
            ADC   #L0E31AF
            TAX
            LDA   #^L0E31AF
            BCC   L0B1DFD
            INC
L0B1DFD     PHA
            PHX
            PEA   ^L0E52DE
            PEA   L0E52DE
            JSL   L0C04FA
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            CMP   #$0000
            BNE   L0B1E35
            PEA   ^L0E52E1
            PEA   L0E52E1
            LDA   $EE
            TAX
            TXA
            CLC
            ADC   #L0E31AF
            TAX
            LDA   #^L0E31AF
            BCC   L0B1E2B
            INC
L0B1E2B     PHA
            PHX
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0B1E35     LDA   $EE
            TAX
            TXA
            CLC
            ADC   #L0E31AF
            TAX
            LDA   #^L0E31AF
            BCC   L0B1E44
            INC
L0B1E44     PHA
            PHX
            PEI   $FD
            PEI   $FB
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   $EE
            TAX
            TXA
            CLC
            ADC   #L0E31AF
            TAX
            LDA   #^L0E31AF
            BCC   L0B1E61
            INC
L0B1E61     PHA
            PHX
            JSL   L0C04CD
            PLY
            PLY
            TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0B1E73     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            PHX
            PHA
            _FrontWindow
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            LDX   L0F0060
            LDA   L0F005E
            JSL   L0D157E
            BEQ   L0B1EA0
            LDA   #$0000
            BRL   L0B1EFB
L0B1EA0     LDA   L0F0062
            CMP   $FF
            BNE   L0B1EAD
            LDA   #$0000
            BRL   L0B1EFB
L0B1EAD     LDA   $FF
            STA   L0F0062
            LDA   $FF
            CMP   #$0000
            BEQ   L0B1EBB
            BRA   L0B1ECF
L0B1EBB     PEA   ^L0E52E5
            PEA   L0E52E5
            _SetCursor
            STA   L0F0779
            BRA   L0B1EFB
            BRA   L0B1ED6
L0B1ECF     CMP   #$0001
            BEQ   L0B1ED6
            BRA   L0B1EE4
L0B1ED6     _InitCursor
            STA   L0F0779
            BRA   L0B1EFB
            BRA   L0B1EEB
L0B1EE4     CMP   #$0003
            BEQ   L0B1EEB
            BRA   L0B1EFB
L0B1EEB     PEA   ^L0E207B
            PEA   L0E207B
            _SetCursor
            STA   L0F0779
L0B1EFB     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0B1F05     ENT
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
            BEQ   L0B1F24
            BRL   L0B1FF5
L0B1F24     LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$002C
            BCC   L0B1F39
            INX
L0B1F39     PHX
            PHA
            LDA   L0F0024
            PHA
            LDA   L0F0022
            PHA
            JSL   L0C0806
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L0B1F51
            BRL   L0B1FF5
L0B1F51     STZ   $F6
L0B1F53     LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   [$F8]
            SEC
            SBC   $F6
            BNE   L0B1F67
            BRL   L0B1FF5
L0B1F67     BVS   L0B1F6C
            EOR   #$8000
L0B1F6C     BMI   L0B1F71
            BRL   L0B1FF5
L0B1F71     LDA   $F6
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
            LDA   #$0046
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B1F94
            INC   $FA
L0B1F94     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B1F9E
            INC   $FA
L0B1F9E     LDA   [$F8]
            SEC
            SBC   #$0004
            CMP   L0F0022
            BCS   L0B1FF0
            LDA   $F6
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
            LDA   #$0046
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B1FCC
            INC   $FA
L0B1FCC     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B1FD6
            INC   $FA
L0B1FD6     LDA   [$F8]
            CLC
            ADC   #$0004
            CMP   L0F0022
            BEQ   L0B1FF0
            BCC   L0B1FF0
            PEA   $0003
            JSL   L0B1E73
            PLY
            LDA   #$0000
            BRA   L0B1FFD
L0B1FF0     INC   $F6
            BRL   L0B1F53
L0B1FF5     PEA   $0001
            JSL   L0B1E73
            PLY
L0B1FFD     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0B2007     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            PEA   $0000
            PEA   ^L0E205B
            PEA   L0E205B
            _SetColorTable
            STA   L0F0779
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0B202D     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            BEQ   L0B206E
            PEA   $0000
            LDA   $FD
            ASL
            ASL
            PHA
            LDA   #L0E1822
            STA   $F4
            LDA   #^L0E1822
            STA   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0B2058
            INC   $F6
L0B2058     LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            PHX
            PHA
            _HiliteControl
            STA   L0F0779
            BRA   L0B209E
L0B206E     PEA   $00FF
            LDA   $FD
            ASL
            ASL
            PHA
            LDA   #L0E1822
            STA   $F4
            LDA   #^L0E1822
            STA   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0B208A
            INC   $F6
L0B208A     LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            PHX
            PHA
            _HiliteControl
            STA   L0F0779
L0B209E     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0B20A6     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00E0
            TCS
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
            BCC   L0B20D5
            INC   $F8
L0B20D5     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0B20DF
            INC   $F8
L0B20DF     LDA   [$F6]
            STA   $F4
            PEI   $F4
            JSL   L082F1F
            PLY
            STA   $EA
            LDA   $EA
            CMP   $FF
            BNE   L0B20FF
            PEA   $0000
            JSL   L091C6A
            PLY
            LDA   #$0000
            BRA   L0B215A
L0B20FF     JSL   L080000
            PEI   $FF
            PEI   $F4
            JSL   L082FAF
            PLY
            PLY
            LDA   L0F0070
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            JSL   L092547
            PLY
            PLY
            PLY
            PEA   $0000
            JSL   L091C6A
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            JSL   L0C0A98
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            JSL   L073E52
            PLY
            PLY
            JSL   L072D31
            JSL   L073E73
L0B215A     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0B2164     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
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
            STA   $F4
            STX   $F6
            LDA   #$004A
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0B2192
            INC   $F6
L0B2192     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0B219C
            INC   $F6
L0B219C     LDA   [$F4]
            STA   $FD
            PEI   $FF
            PEI   $FD
            JSL   L0830DD
            PLY
            PLY
            LDA   L0F0070
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            JSL   L092547
            PLY
            PLY
            PLY
            STZ   $E6
            STZ   $EA
            STZ   $E8
            BRA   L0B21D8
L0B21C6     PEI   $E8
            JSL   L083089
            PLY
            TAY
            BEQ   L0B21D4
            INC   $E6
            BRA   L0B21D6
L0B21D4     INC   $EA
L0B21D6     INC   $E8
L0B21D8     LDX   L0F002C
            LDA   L0F002A
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            SEC
            SBC   $E8
            BEQ   L0B21F3
            BVS   L0B21F1
            EOR   #$8000
L0B21F1     BMI   L0B21C6
L0B21F3     LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDA   #$0000
            LDY   #$0064
            STA   [$F4],Y
            LDX   L0F002C
            LDA   L0F002A
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            CMP   $EA
            BNE   L0B222A
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDA   #$0001
            LDY   #$0064
            STA   [$F4],Y
L0B222A     LDA   #$0001
            STA   L0F0042
            PEA   $0000
            JSL   L091C6A
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00DE
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
            PHA
            JSL   L0C0A98
            PLY
            PLY
            PLY
            PLY
            LDA   $E2
            INC   $E2
            PEA   $0000
            TDC
            CLC
            ADC   #$00DE
            PHA
            JSL   L073E52
            PLY
            PLY
            JSL   L072D31
            JSL   L073E73
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0B2275     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            STZ   $F4
            BRA   L0B2290
L0B2284     PEI   $FF
            PEI   $F4
            JSL   L0830DD
            PLY
            PLY
            INC   $F4
L0B2290     LDX   L0F002C
            LDA   L0F002A
            STA   $F6
            STX   $F8
            LDY   #$0002
            LDA   [$F6],Y
            SEC
            SBC   $F4
            BEQ   L0B22AB
            BVS   L0B22A9
            EOR   #$8000
L0B22A9     BMI   L0B2284
L0B22AB     JSL   L072D31
            LDA   $FF
            BEQ   L0B22C7
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0000
            LDY   #$0064
            STA   [$F6],Y
            BRA   L0B22D9
L0B22C7     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   #$0001
            LDY   #$0064
            STA   [$F6],Y
L0B22D9     LDA   #$0001
            STA   L0F0042
            JSL   L030FA2
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0B22EB     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$007D
            TCS
            LDA   L0F0044
            CMP   #$0001
            BNE   L0B231D
            PEI   $FF
            PEI   $FD
            JSL   L0B243F
            PLY
            PLY
            STX   $EA
            STA   $E8
            LDA   L0F0598
            CMP   #$0000
            BEQ   L0B231D
            LDX   #$0000
            LDA   #$0000
            BRL   L0B2435
L0B231D     LDA   #$0000
            STAL  L0E32AF
            LDX   #$0000
            TDC
            CLC
            ADC   #$007F
            PHA
            TXA
            STAL  L0E32B3
            PLA
            STAL  L0E32B1
            PEA   $000A
            PEA   ^L0E32AF
            PEA   L0E32AF
            JSL   L0F0831
            LDA   L0F0779
            STA   L0F0598
            LDA   L0F0598
            CMP   #$0000
            BEQ   L0B235B
            LDX   #$0000
            LDA   #$0000
            BRL   L0B2435
L0B235B     LDA   $7F
            SEP   #$20
            STA   $E7
            REP   #$20
            LDA   $E7
            AND   #$00FF
            CMP   #$0000
            BEQ   L0B23A9
            LDA   #$0001
            SEP   #$20
            STA   $7F
            REP   #$20
            LDX   #$0000
            LDA   #$0002
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$007F
            JSL   L0D1573
            PLA
            PLX
            STX   $E5
            STA   $E3
L0B2390     LDA   [$E3]
            AND   #$00FF
            CMP   #$002F
            BEQ   L0B23A9
            LDA   $7F
            AND   #$00FF
            INC   $7F
            INC   $E3
            BNE   L0B23A7
            INC   $E5
L0B23A7     BRA   L0B2390
L0B23A9     LDX   #$0000
            TDC
            CLC
            ADC   #$007F
            PHA
            TXA
            STAL  L0E32B7
            PLA
            STAL  L0E32B5
            PEA   $0006
            PEA   ^L0E32B5
            PEA   L0E32B5
            JSL   L0F0831
            LDA   L0F0779
            STA   L0F0598
            LDA   $E7
            SEP   #$20
            STA   $7F
            REP   #$20
            LDA   L0F0598
            CMP   #$0000
            BEQ   L0B23E7
            LDX   #$0000
            LDA   #$0000
            BRA   L0B2435
L0B23E7     LDAL  L0E32BF
            TAX
            LDAL  L0E32BD
            SEC
            SBCL  L0E32CB
            PHA
            TXA
            SBCL  L0E32CD
            TAX
            PLA
            STX   $EE
            STA   $EC
            LDX   $EE
            LDA   $EC
            PHX
            PHA
            LDX   #$0000
            LDA   #$0200
            SEC
            JSL   L0D166F
            PLA
            PLX
            STX   $F2
            STA   $F0
            LDA   L0F0044
            CMP   #$0001
            BNE   L0B2431
            LDX   $F2
            LDA   $F0
            CLC
            ADC   $E8
            PHA
            TXA
            ADC   $EA
            TAX
            PLA
            STX   $F2
            STA   $F0
L0B2431     LDX   $F2
            LDA   $F0
L0B2435     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0B243F     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            PEI   $FF
            PEI   $FD
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
            BEQ   L0B2490
            LDX   #$0000
            LDA   #$0000
            BRA   L0B24BF
L0B2490     LDAL  L0E32CF
            STA   $EE
            PEA   $0019
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            JSL   L0F0831
            LDAL  L0E32CF
            STAL  L0E32D9
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            LDX   $F2
            LDA   $F0
L0B24BF     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0B24C9     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E2
            TCS
            PEA   $0000
            JSL   L0B1E73
            PLY
            LDA   #$FFFF
            STA   $EA
            STZ   $F0
L0B24E3     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   $F0
            BEQ   L0B253F
            BVS   L0B24FC
            EOR   #$8000
L0B24FC     BPL   L0B253F
            LDA   $F0
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
            BCC   L0B2521
            INC   $FA
L0B2521     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B252B
            INC   $FA
L0B252B     LDA   [$F8]
            STA   $F2
            PEI   $F2
            JSL   L083089
            PLY
            TAY
            BEQ   L0B253B
            INC   $EA
L0B253B     INC   $F0
            BRA   L0B24E3
L0B253F     LDA   #$FFFF
            STA   $F4
L0B2544     LDA   #$0001
            BNE   L0B254C
            BRL   L0B2881
L0B254C     PEI   $F4
            JSL   L0A24B8
            PLY
            STA   $F4
            LDA   $F4
            CMP   #$FFFF
            BNE   L0B255F
            BRL   L0B2881
L0B255F     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$00BA
            BCC   L0B2574
            INX
L0B2574     PHX
            PHA
            PEI   $F4
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
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$00BA
            CLC
            ADC   $F8
            BCC   L0B25A7
            INX
L0B25A7     STX   L0F00AD
            STA   L0F00AB
            LDA   $F6
            CMP   #$FFFE
            BNE   L0B25B7
            BRL   L0B2881
L0B25B7     STZ   $F0
            BRL   L0B2858
L0B25BC     LDA   $F0
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
            BCC   L0B25DF
            INC   $FA
L0B25DF     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B25E9
            INC   $FA
L0B25E9     LDA   [$F8]
            STA   $F2
            PEI   $F2
            JSL   L083089
            PLY
            TAY
            BNE   L0B25FA
            BRL   L0B2856
L0B25FA     PEI   $F2
            JSL   L072114
            PLY
            LDA   $F2
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
            BCC   L0B261F
            INC   $FA
L0B261F     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B2629
            INC   $FA
L0B2629     LDA   [$F8]
            AND   #$00FF
            CMP   #$0001
            BEQ   L0B2668
            LDA   $F2
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
            BCC   L0B2651
            INC   $FA
L0B2651     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B265B
            INC   $FA
L0B265B     LDA   [$F8]
            AND   #$00FF
            CMP   #$0008
            BEQ   L0B2668
            BRL   L0B26F3
L0B2668     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0056
            LDA   [$F8],Y
            SEC
            SBC   #$0002
            BVS   L0B2680
            EOR   #$8000
L0B2680     BMI   L0B26A7
            PEA   ^L0E539D
            PEA   L0E539D
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0B269D
            INX
L0B269D     PHX
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0B26A7     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0B26BC
            INX
L0B26BC     PHX
            PHA
            LDA   $F2
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
            LDA   #$0048
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B26DC
            INC   $FA
L0B26DC     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B26E6
            INC   $FA
L0B26E6     LDA   [$F8]
            PHA
            JSL   L0B19F5
            PLY
            PLY
            PLY
            BRL   L0B276E
L0B26F3     LDA   $F2
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
            BCC   L0B2711
            INC   $FA
L0B2711     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B271B
            INC   $FA
L0B271B     LDA   [$F8]
            AND   #$00FF
            CMP   #$0002
            BNE   L0B276E
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0B273A
            INX
L0B273A     PHX
            PHA
            LDA   $F2
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
            LDA   #$0048
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B275A
            INC   $FA
L0B275A     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B2764
            INC   $FA
L0B2764     LDA   [$F8]
            PHA
            JSL   L0B13AB
            PLY
            PLY
            PLY
L0B276E     STZ   $EC
            STZ   $EE
L0B2772     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0B2787
            INX
L0B2787     PHX
            PHA
            JSL   L0C04CD
            PLY
            PLY
            SEC
            SBC   $EE
            BEQ   L0B27D3
            BVS   L0B2799
            EOR   #$8000
L0B2799     BPL   L0B27D3
            LDA   $EE
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B27B4
            INC   $FA
L0B27B4     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B27BE
            INC   $FA
L0B27BE     LDA   [$F8]
            AND   #$00FF
            CMP   #$002C
            BNE   L0B27CF
            LDA   #$0001
            STA   $EC
            BRA   L0B27D3
L0B27CF     INC   $EE
            BRA   L0B2772
L0B27D3     LDA   $EC
            BEQ   L0B27DF
            PEA   $0022
            JSL   L0B28C4
            PLY
L0B27DF     STZ   $EE
L0B27E1     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L0B27F6
            INX
L0B27F6     PHX
            PHA
            JSL   L0C04CD
            PLY
            PLY
            SEC
            SBC   $EE
            BEQ   L0B283C
            BVS   L0B2808
            EOR   #$8000
L0B2808     BPL   L0B283C
            LDA   $EE
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   #$090E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B2823
            INC   $FA
L0B2823     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0B282D
            INC   $FA
L0B282D     LDA   [$F8]
            AND   #$00FF
            PHA
            JSL   L0B28C4
            PLY
            INC   $EE
            BRA   L0B27E1
L0B283C     LDA   $EC
            BEQ   L0B2848
            PEA   $0022
            JSL   L0B28C4
            PLY
L0B2848     LDA   $F0
            CMP   $EA
            BEQ   L0B2856
            PEA   $002C
            JSL   L0B28C4
            PLY
L0B2856     INC   $F0
L0B2858     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   $F0
            BEQ   L0B2876
            BVS   L0B2871
            EOR   #$8000
L0B2871     BPL   L0B2876
            BRL   L0B25BC
L0B2876     PEA   $000D
            JSL   L0B28C4
            PLY
            BRL   L0B2544
L0B2881     LDAL  L0E32D9
            STA   $E4
            PEA   $0017
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            JSL   L0F0831
            PEA   $0018
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            JSL   L0F0831
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEA   $0001
            JSL   L0B1E73
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0B28C4     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F3
            TCS
            LDA   $FF
            AND   #$00FF
            SEP   #$20
            STA   $F5
            REP   #$20
            LDAL  L0E32CF
            STAL  L0E32D9
            LDX   #$0000
            TDC
            CLC
            ADC   #$00F5
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
            PEA   $0013
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL


