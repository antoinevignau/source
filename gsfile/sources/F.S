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

	use	F.X.S
	
GSOS	=	$E100A8

*-----------------------------------

L0C0000     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDA   $FD
            SEC
            SBC   $FF
            BVS   L0C0015
            EOR   #$8000
L0C0015     BMI   L0C001B
            LDA   $FD
            BRA   L0C001D
L0C001B     LDA   $FF
L0C001D     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0C0027     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDA   $FD
            SEC
            SBC   $FF
            BEQ   L0C0044
            BVS   L0C003E
            EOR   #$8000
L0C003E     BPL   L0C0044
            LDA   $FD
            BRA   L0C0046
L0C0044     LDA   $FF
L0C0046     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0C0050     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            LDA   #$0000
            STA   $F0
            PEI   $FF
            PEI   $FD
            JSL   L0C04CD
            PLY
            PLY
            SEC
            SBC   #$0001
            STA   $EE
            BRL   L0C0101
L0C0073     LDA   $F0
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0C0084
            DEC   $F6
L0C0084     CLC
            ADC   $F4
            STA   $F4
            BCC   L0C008D
            INC   $F6
L0C008D     LDA   [$F4]
            AND   #$00FF
            STA   $F2
            LDA   $EE
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0C00A5
            DEC   $F6
L0C00A5     CLC
            ADC   $F4
            STA   $F4
            BCC   L0C00AE
            INC   $F6
L0C00AE     LDA   [$F4]
            AND   #$00FF
            PHA
            LDA   $F0
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0C00C5
            DEC   $F6
L0C00C5     CLC
            ADC   $F4
            STA   $F4
            BCC   L0C00CE
            INC   $F6
L0C00CE     PLA
            SEP   #$20
            STA   [$F4]
            REP   #$20
            LDA   $F2
            PHA
            LDA   $EE
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0C00E9
            DEC   $F6
L0C00E9     CLC
            ADC   $F4
            STA   $F4
            BCC   L0C00F2
            INC   $F6
L0C00F2     PLA
            SEP   #$20
            STA   [$F4]
            REP   #$20
            LDA   $F0
            INC   $F0
            LDA   $EE
            DEC   $EE
L0C0101     LDA   $F0
            SEC
            SBC   $EE
            BVS   L0C010B
            EOR   #$8000
L0C010B     BMI   L0C0110
            BRL   L0C0073
L0C0110     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0C0118     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EC
            TCS
            LDA   $FB
            STA   $EE
            SEC
            SBC   #$0000
            BVS   L0C0130
            EOR   #$8000
L0C0130     BMI   L0C013A
            LDA   $FB
            EOR   #$FFFF
            INC
            STA   $FB
L0C013A     STZ   $F0
L0C013C     LDA   $FB
            PHA
            LDA   #$000A
            SEC
            JSL   L0D14B6
            PLA
            CLC
            ADC   #$0030
            PHA
            LDA   $F0
            INC   $F0
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F2
            STX   $F4
            PLA
            TAY
            BPL   L0C0160
            DEC   $F4
L0C0160     CLC
            ADC   $F2
            STA   $F2
            BCC   L0C0169
            INC   $F4
L0C0169     PLA
            SEP   #$20
            STA   [$F2]
            REP   #$20
            LDA   $FB
            PHA
            LDA   #$000A
            SEC
            JSL   L0D14B6
            PLY
            STA   $FB
            SEC
            SBC   #$0000
            BEQ   L0C018B
            BVS   L0C0189
            EOR   #$8000
L0C0189     BMI   L0C013C
L0C018B     LDA   $EE
            SEC
            SBC   #$0000
            BVS   L0C0196
            EOR   #$8000
L0C0196     BMI   L0C01BD
            LDA   $F0
            INC   $F0
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F2
            STX   $F4
            PLA
            TAY
            BPL   L0C01AB
            DEC   $F4
L0C01AB     CLC
            ADC   $F2
            STA   $F2
            BCC   L0C01B4
            INC   $F4
L0C01B4     LDA   #$002D
            SEP   #$20
            STA   [$F2]
            REP   #$20
L0C01BD     LDA   $F0
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F2
            STX   $F4
            PLA
            TAY
            BPL   L0C01CE
            DEC   $F4
L0C01CE     CLC
            ADC   $F2
            STA   $F2
            BCC   L0C01D7
            INC   $F4
L0C01D7     LDA   #$0000
            SEP   #$20
            STA   [$F2]
            REP   #$20
            PEI   $FF
            PEI   $FD
            JSL   L0C0050
            PLY
            PLY
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0C01F2     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E8
            TCS
            LDA   #$0001
            STA   $EC
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L0D157E
            BEQ   L0C022C
            BVS   L0C0219
            EOR   #$8000
L0C0219     BPL   L0C022C
            LDA   #$FFFF
            STA   $EC
            LDX   $FB
            LDA   $F9
            JSL   L0D16F6
            STX   $FB
            STA   $F9
L0C022C     STZ   $EE
L0C022E     LDX   $FB
            LDA   $F9
            PHX
            PHA
            LDX   #$0000
            LDA   #$000A
            SEC
            JSL   L0D15C0
            PLY
            PLY
            PHX
            PHA
            LDX   #$0000
            LDA   #$000A
            SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L0D1705
            PLA
            PLX
            STA   $EA
            LDA   $EA
            CLC
            ADC   #$0030
            STA   $EA
            LDA   $EA
            PHA
            LDA   $EE
            INC   $EE
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F0
            STX   $F2
            PLA
            TAY
            BPL   L0C027C
            DEC   $F2
L0C027C     CLC
            ADC   $F0
            STA   $F0
            BCC   L0C0285
            INC   $F2
L0C0285     PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            LDX   $FB
            LDA   $F9
            PHX
            PHA
            LDX   #$0000
            LDA   #$000A
            SEC
            JSL   L0D15C0
            PLY
            PLY
            STX   $FB
            STA   $F9
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L0D157E
            BVS   L0C02B8
            EOR   #$8000
L0C02B8     BMI   L0C02BD
            BRL   L0C022E
L0C02BD     LDA   $EC
            SEC
            SBC   #$0000
            BVS   L0C02C8
            EOR   #$8000
L0C02C8     BMI   L0C02EF
            LDA   $EE
            INC   $EE
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F0
            STX   $F2
            PLA
            TAY
            BPL   L0C02DD
            DEC   $F2
L0C02DD     CLC
            ADC   $F0
            STA   $F0
            BCC   L0C02E6
            INC   $F2
L0C02E6     LDA   #$002D
            SEP   #$20
            STA   [$F0]
            REP   #$20
L0C02EF     LDA   $EE
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F0
            STX   $F2
            PLA
            TAY
            BPL   L0C0300
            DEC   $F2
L0C0300     CLC
            ADC   $F0
            STA   $F0
            BCC   L0C0309
            INC   $F2
L0C0309     LDA   #$0000
            SEP   #$20
            STA   [$F0]
            REP   #$20
            PEI   $FF
            PEI   $FD
            JSL   L0C0050
            PLY
            PLY
            TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L0C0324     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EC
            TCS
            STZ   $F2
            BRA   L0C0335
L0C0333     INC   $F2
L0C0335     LDA   $F2
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0C0346
            DEC   $F6
L0C0346     CLC
            ADC   $F4
            STA   $F4
            BCC   L0C034F
            INC   $F6
L0C034F     LDA   [$F4]
            AND   #$00FF
            CMP   #$0020
            BEQ   L0C0333
            LDA   $F2
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0C036A
            DEC   $F6
L0C036A     CLC
            ADC   $F4
            STA   $F4
            BCC   L0C0373
            INC   $F6
L0C0373     LDA   [$F4]
            AND   #$00FF
            CMP   #$000A
            BEQ   L0C0333
            LDA   $F2
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0C038E
            DEC   $F6
L0C038E     CLC
            ADC   $F4
            STA   $F4
            BCC   L0C0397
            INC   $F6
L0C0397     LDA   [$F4]
            AND   #$00FF
            CMP   #$0009
            BEQ   L0C0333
            LDA   #$0001
            STA   $EE
            LDA   $F2
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0C03B7
            DEC   $F6
L0C03B7     CLC
            ADC   $F4
            STA   $F4
            BCC   L0C03C0
            INC   $F6
L0C03C0     LDA   [$F4]
            AND   #$00FF
            CMP   #$002B
            BEQ   L0C03EE
            LDA   $F2
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0C03DB
            DEC   $F6
L0C03DB     CLC
            ADC   $F4
            STA   $F4
            BCC   L0C03E4
            INC   $F6
L0C03E4     LDA   [$F4]
            AND   #$00FF
            CMP   #$002D
            BNE   L0C041E
L0C03EE     LDA   $F2
            INC   $F2
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0C0401
            DEC   $F6
L0C0401     CLC
            ADC   $F4
            STA   $F4
            BCC   L0C040A
            INC   $F6
L0C040A     LDA   [$F4]
            AND   #$00FF
            CMP   #$002B
            BNE   L0C0419
            LDA   #$0001
            BRA   L0C041C
L0C0419     LDA   #$FFFF
L0C041C     STA   $EE
L0C041E     STZ   $F0
            BRA   L0C045C
L0C0422     LDA   $F2
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0C0433
            DEC   $F6
L0C0433     CLC
            ADC   $F4
            STA   $F4
            BCC   L0C043C
            INC   $F6
L0C043C     LDA   [$F4]
            AND   #$00FF
            PHA
            LDA   #$000A
            PHA
            LDA   $F0
            SEC
            JSL   L0D151F
            PLA
            PLX
            STX   $F4
            CLC
            ADC   $F4
            SEC
            SBC   #$0030
            STA   $F0
            INC   $F2
L0C045C     LDA   $F2
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0C046D
            DEC   $F6
L0C046D     CLC
            ADC   $F4
            STA   $F4
            BCC   L0C0476
            INC   $F6
L0C0476     LDA   [$F4]
            AND   #$00FF
            SEC
            SBC   #$0030
            BVS   L0C0484
            EOR   #$8000
L0C0484     BPL   L0C04B8
            LDA   $F2
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F4
            STX   $F6
            PLA
            TAY
            BPL   L0C0497
            DEC   $F6
L0C0497     CLC
            ADC   $F4
            STA   $F4
            BCC   L0C04A0
            INC   $F6
L0C04A0     LDA   [$F4]
            AND   #$00FF
            SEC
            SBC   #$0039
            BNE   L0C04AE
            BRL   L0C0422
L0C04AE     BVS   L0C04B3
            EOR   #$8000
L0C04B3     BMI   L0C04B8
            BRL   L0C0422
L0C04B8     LDA   $EE
            PHA
            LDA   $F0
            SEC
            JSL   L0D151F
            PLA
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0C04CD     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            STZ   $F2
            BRA   L0C04E4
L0C04DC     INC   $F2
            INC   $FD
            BNE   L0C04E4
            INC   $FF
L0C04E4     LDA   [$FD]
            AND   #$00FF
            CMP   #$0000
            BNE   L0C04DC
            LDA   $F2
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0C04FA     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E4
            TCS
            PEI   $FF
            PEI   $FD
            JSL   L0C0000
            PLY
            PLY
            STA   $E8
            STZ   $EA
            BRA   L0C056A
L0C0515     LDA   $EA
            PHA
            LDX   $FB
            LDA   $F9
            STA   $EC
            STX   $EE
            PLA
            TAY
            BPL   L0C0526
            DEC   $EE
L0C0526     CLC
            ADC   $EC
            STA   $EC
            BCC   L0C052F
            INC   $EE
L0C052F     LDA   [$EC]
            AND   #$00FF
            PHA
            LDA   $EA
            PHA
            LDX   $F7
            LDA   $F5
            STA   $EC
            STX   $EE
            PLA
            TAY
            BPL   L0C0546
            DEC   $EE
L0C0546     CLC
            ADC   $EC
            STA   $EC
            BCC   L0C054F
            INC   $EE
L0C054F     LDA   [$EC]
            AND   #$00FF
            PHA
            JSL   L0C05F9
            PLY
            PLY
            STA   $E6
            LDA   $E6
            CMP   #$0000
            BEQ   L0C0568
            LDA   $E6
            BRA   L0C057B
L0C0568     INC   $EA
L0C056A     LDA   $EA
            SEC
            SBC   $E8
            BVS   L0C0574
            EOR   #$8000
L0C0574     BPL   L0C0515
            LDA   $FD
            SEC
            SBC   $FF
L0C057B     TAY
            TDC
            CLC
            ADC   #$00EF
            TCS
            TYA
            PLD
            RTL

L0C0585     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
L0C0590     LDA   #$0001
            BEQ   L0C05EF
            LDA   [$F9]
            AND   #$00FF
            CMP   #$0000
            BNE   L0C05B3
            LDA   [$FD]
            AND   #$00FF
            CMP   #$0000
            BNE   L0C05AE
            LDA   #$0000
            BRA   L0C05EF
L0C05AE     LDA   #$FFFF
            BRA   L0C05EF
L0C05B3     LDA   [$FD]
            AND   #$00FF
            CMP   #$0000
            BNE   L0C05C2
            LDA   #$0001
            BRA   L0C05EF
L0C05C2     LDA   [$FD]
            AND   #$00FF
            PHA
            LDA   [$F9]
            AND   #$00FF
            PHA
            JSL   L0C05F9
            PLY
            PLY
            STA   $EE
            LDA   $EE
            CMP   #$0000
            BEQ   L0C05E1
            LDA   $EE
            BRA   L0C05EF
L0C05E1     INC   $F9
            BNE   L0C05E7
            INC   $FB
L0C05E7     INC   $FD
            BNE   L0C05ED
            INC   $FF
L0C05ED     BRA   L0C0590
L0C05EF     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0C05F9     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDA   $FD
            AND   #$00FF
            STA   $F2
            LDA   $FF
            AND   #$00FF
            STA   $F0
            LDA   $F2
            SEC
            SBC   #$0060
            BEQ   L0C0636
            BVS   L0C061F
            EOR   #$8000
L0C061F     BPL   L0C0636
            LDA   $F2
            SEC
            SBC   #$007B
            BVS   L0C062C
            EOR   #$8000
L0C062C     BMI   L0C0636
            LDA   $F2
            SEC
            SBC   #$0020
            STA   $F2
L0C0636     LDA   $F0
            SEC
            SBC   #$0060
            BEQ   L0C065A
            BVS   L0C0643
            EOR   #$8000
L0C0643     BPL   L0C065A
            LDA   $F0
            SEC
            SBC   #$007B
            BVS   L0C0650
            EOR   #$8000
L0C0650     BMI   L0C065A
            LDA   $F0
            SEC
            SBC   #$0020
            STA   $F0
L0C065A     LDA   $F2
            SEC
            SBC   $F0
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0C0669     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
            LDA   $F9
            CMP   #$0000
            BEQ   L0C067D
            BRA   L0C0689
L0C067D     LDA   $FB
            CLC
            ADC   #$0002
            STA   $EE
            BRA   L0C06ED
            BRA   L0C0690
L0C0689     CMP   #$0002
            BEQ   L0C0690
            BRA   L0C06AF
L0C0690     LDA   #$0008
            PHA
            LDA   $FF
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDA   $FD
            SEC
            SBC   #$0002
            PLX
            STX   $F0
            SEC
            SBC   $F0
            STA   $EE
            BRA   L0C06ED
            BRA   L0C06B6
L0C06AF     CMP   #$0001
            BEQ   L0C06B6
            BRA   L0C06ED
L0C06B6     LDA   #$0008
            PHA
            LDA   $FF
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDA   $FB
            PLX
            STX   $F0
            CLC
            ADC   $F0
            PHA
            LDA   $FD
            SEC
            SBC   #$0002
            PLX
            STX   $F0
            SEC
            SBC   $F0
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLY
            PHA
            LDA   $FB
            PLX
            STX   $F0
            CLC
            ADC   $F0
            STA   $EE
L0C06ED     LDA   $EE
            TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0C06F9     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EE
            TCS
            LDA   [$F9]
            PHA
            PLA
            STA   [$FD]
            LDY   #$0002
            LDA   [$F9],Y
            PHA
            PLA
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0004
            LDA   [$F9],Y
            PHA
            PLA
            LDY   #$0004
            STA   [$FD],Y
            LDY   #$0006
            LDA   [$F9],Y
            PHA
            PLA
            LDY   #$0006
            STA   [$FD],Y
            TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L0C0736     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E6
            TCS
            LDY   #$0004
            LDA   [$F9],Y
            PHA
            LDA   [$F9]
            PLX
            STX   $F0
            CLC
            ADC   $F0
            PHA
            LDY   #$0004
            LDA   [$FD],Y
            PHA
            LDA   [$FD]
            PLX
            STX   $F0
            CLC
            ADC   $F0
            PHA
            JSL   L0C0000
            PLY
            PLY
            STA   $EA
            LDY   #$0006
            LDA   [$F9],Y
            PHA
            LDY   #$0002
            LDA   [$F9],Y
            PLX
            STX   $F0
            CLC
            ADC   $F0
            PHA
            LDY   #$0006
            LDA   [$FD],Y
            PHA
            LDY   #$0002
            LDA   [$FD],Y
            PLX
            STX   $F0
            CLC
            ADC   $F0
            PHA
            JSL   L0C0000
            PLY
            PLY
            STA   $E8
            LDA   [$F9]
            PHA
            LDA   [$FD]
            PHA
            JSL   L0C0027
            PLY
            PLY
            STA   $EE
            LDY   #$0002
            LDA   [$F9],Y
            PHA
            LDY   #$0002
            LDA   [$FD],Y
            PHA
            JSL   L0C0027
            PLY
            PLY
            STA   $EC
            LDA   $EE
            STA   [$FD]
            LDA   $EC
            LDY   #$0002
            STA   [$FD],Y
            LDA   $EA
            SEC
            SBC   $EE
            PHA
            PLA
            LDY   #$0004
            STA   [$FD],Y
            LDA   $E8
            SEC
            SBC   $EC
            PHA
            PLA
            LDY   #$0006
            STA   [$FD],Y
            LDA   $EA
            SEC
            SBC   $EE
            BEQ   L0C07F4
            BVS   L0C07E4
            EOR   #$8000
L0C07E4     BPL   L0C07F4
            LDA   $E8
            SEC
            SBC   $EC
            BEQ   L0C07F4
            BVS   L0C07F2
            EOR   #$8000
L0C07F2     BMI   L0C07F9
L0C07F4     LDA   #$0000
            BRA   L0C07FC
L0C07F9     LDA   #$0001
L0C07FC     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0C0806     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EE
            TCS
            LDA   [$FD]
            CMP   $F9
            BEQ   L0C0819
            BCS   L0C0856
L0C0819     LDY   #$0002
            LDA   [$FD],Y
            CMP   $FB
            BEQ   L0C0824
            BCS   L0C0856
L0C0824     LDY   #$0004
            LDA   [$FD],Y
            PHA
            LDA   [$FD]
            PLX
            STX   $F0
            CLC
            ADC   $F0
            CMP   $F9
            BEQ   L0C0856
            BCC   L0C0856
            LDY   #$0006
            LDA   [$FD],Y
            PHA
            LDY   #$0002
            LDA   [$FD],Y
            PLX
            STX   $F0
            CLC
            ADC   $F0
            CMP   $FB
            BEQ   L0C0856
            BCC   L0C0856
            LDA   #$0001
            BRA   L0C0859
            BRA   L0C0859
L0C0856     LDA   #$0000
L0C0859     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0C0863     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E6
            TCS
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L0D157E
            BVS   L0C0883
            EOR   #$8000
L0C0883     BPL   L0C0888
            BRL   L0C0980
L0C0888     LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L0D1573
            PLA
            PLX
            JSL   L0D1705
            PLA
            PLX
            STX   $EA
            STA   $E8
            LDX   $FB
            LDA   $F9
            PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L0D157E
            BVS   L0C08BD
            EOR   #$8000
L0C08BD     BPL   L0C08D6
            LDX   $FB
            LDA   $F9
            PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L0D157E
            BEQ   L0C0918
            BVS   L0C08D4
            EOR   #$8000
L0C08D4     BPL   L0C0918
L0C08D6     LDX   $EA
            LDA   $E8
            PHX
            PHA
            LDX   $F7
            LDA   $F5
            JSL   L0D157E
            BVS   L0C08E9
            EOR   #$8000
L0C08E9     BPL   L0C0916
            LDX   $F7
            LDA   $F5
            INC   $F5
            BNE   L0C08F5
            INC   $F7
L0C08F5     STA   $EC
            STX   $EE
            LDA   [$EC]
            AND   #$00FF
            PHA
            LDX   $FB
            LDA   $F9
            INC   $F9
            BNE   L0C0909
            INC   $FB
L0C0909     STA   $EC
            STX   $EE
            PLA
            SEP   #$20
            STA   [$EC]
            REP   #$20
            BRA   L0C08D6
L0C0916     BRA   L0C0980
L0C0918     LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L0D1573
            PLA
            PLX
            JSL   L0D1705
            PLA
            PLX
            STX   $FB
            STA   $F9
L0C093A     LDX   $F7
            LDA   $F5
            PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L0D157E
            BEQ   L0C0951
            BVS   L0C094F
            EOR   #$8000
L0C094F     BMI   L0C0980
L0C0951     LDX   $EA
            LDA   $E8
            LDA   $E8
            BNE   L0C095B
            DEC   $EA
L0C095B     DEC   $E8
            STA   $EC
            STX   $EE
            LDA   [$EC]
            AND   #$00FF
            PHA
            LDX   $FB
            LDA   $F9
            LDA   $F9
            BNE   L0C0971
            DEC   $FB
L0C0971     DEC   $F9
            STA   $EC
            STX   $EE
            PLA
            SEP   #$20
            STA   [$EC]
            REP   #$20
            BRA   L0C093A
L0C0980     TDC
            CLC
            ADC   #$00EF
            TCS
            PLD
            RTL

L0C0988     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EE
            TCS
            LDA   #$0001
            STA   $F0
            LDA   #$0001
            STA   $F2
            BRA   L0C09AE
L0C099F     LDA   $F0
            PHA
            LDA   $FD
            CLC
            JSL   L0D151F
            PLA
            STA   $F0
            INC   $F2
L0C09AE     LDA   $FF
            CMP   $F2
            BCS   L0C099F
            LDA   $F0
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0C09C0     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            PEI   $FF
            PEA   $0002
            JSL   L0C0988
            PLY
            PLY
            STA   $F2
            LDA   $FD
            AND   $F2
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0C09E6     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            PEI   $FF
            PEA   $0002
            JSL   L0C0988
            PLY
            PLY
            STA   $F2
            LDA   $FD
            ORA   $F2
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0C0A0C     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            PEI   $FF
            PEI   $FD
            JSL   L0C09E6
            PLY
            PLY
            STA   $FD
            PEI   $FF
            PEA   $0002
            JSL   L0C0988
            PLY
            PLY
            STA   $F2
            LDA   $FD
            EOR   $F2
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0C0A3E     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EE
            TCS
            LDY   #$0002
            LDA   [$F9],Y
            PHA
            PLA
            STA   [$FD]
            LDA   [$F9]
            PHA
            PLA
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0002
            LDA   [$F9],Y
            PHA
            LDY   #$0006
            LDA   [$F9],Y
            PLX
            STX   $F0
            SEC
            SBC   $F0
            CLC
            ADC   #$0001
            PHA
            PLA
            LDY   #$0004
            STA   [$FD],Y
            LDA   [$F9]
            PHA
            LDY   #$0004
            LDA   [$F9],Y
            PLX
            STX   $F0
            SEC
            SBC   $F0
            CLC
            ADC   #$0001
            PHA
            PLA
            LDY   #$0006
            STA   [$FD],Y
            TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L0C0A98     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EE
            TCS
            LDA   [$F9]
            PHA
            PLA
            LDY   #$0002
            STA   [$FD],Y
            LDY   #$0002
            LDA   [$F9],Y
            PHA
            PLA
            STA   [$FD]
            LDY   #$0004
            LDA   [$F9],Y
            PHA
            LDA   [$F9]
            PLX
            STX   $F0
            CLC
            ADC   $F0
            SEC
            SBC   #$0001
            PHA
            PLA
            LDY   #$0006
            STA   [$FD],Y
            LDY   #$0006
            LDA   [$F9],Y
            PHA
            LDY   #$0002
            LDA   [$F9],Y
            PLX
            STX   $F0
            CLC
            ADC   $F0
            SEC
            SBC   #$0001
            PHA
            PLA
            LDY   #$0004
            STA   [$FD],Y
            TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L0C0AF2     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00E2
            TCS
            LDY   #$0006
            LDA   [$F9],Y
            PHA
            LDY   #$0006
            LDA   [$F5],Y
            PHA
            JSL   L0C0000
            PLY
            PLY
            STA   $E6
            LDY   #$0004
            LDA   [$F9],Y
            PHA
            LDY   #$0004
            LDA   [$F5],Y
            PHA
            JSL   L0C0000
            PLY
            PLY
            STA   $E4
            LDY   #$0002
            LDA   [$F9],Y
            PHA
            LDY   #$0002
            LDA   [$F5],Y
            PHA
            JSL   L0C0027
            PLY
            PLY
            STA   $EA
            LDA   [$F9]
            PHA
            LDA   [$F5]
            PHA
            JSL   L0C0027
            PLY
            PLY
            STA   $E8
            LDA   $EA
            LDY   #$0002
            STA   [$FD],Y
            LDA   $E8
            STA   [$FD]
            LDA   $E6
            LDY   #$0006
            STA   [$FD],Y
            LDA   $E4
            LDY   #$0004
            STA   [$FD],Y
            LDA   $E6
            SEC
            SBC   $EA
            BEQ   L0C0B7C
            BVS   L0C0B6C
            EOR   #$8000
L0C0B6C     BPL   L0C0B7C
            LDA   $E4
            SEC
            SBC   $E8
            BEQ   L0C0B7C
            BVS   L0C0B7A
            EOR   #$8000
L0C0B7A     BMI   L0C0B81
L0C0B7C     LDA   #$0000
            BRA   L0C0B84
L0C0B81     LDA   #$0001
L0C0B84     TAY
            TDC
            CLC
            ADC   #$00EF
            TCS
            TYA
            PLD
            RTL

L0C0B8E     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EE
            TCS
            LDY   #$0002
            LDA   [$FD],Y
            CMP   $F9
            BEQ   L0C0BA4
            BCS   L0C0BC5
L0C0BA4     LDA   [$FD]
            CMP   $FB
            BEQ   L0C0BAC
            BCS   L0C0BC5
L0C0BAC     LDY   #$0006
            LDA   [$FD],Y
            CMP   $F9
            BCC   L0C0BC5
            LDY   #$0004
            LDA   [$FD],Y
            CMP   $FB
            BCC   L0C0BC5
            LDA   #$0001
            BRA   L0C0BC8
            BRA   L0C0BC8
L0C0BC5     LDA   #$0000
L0C0BC8     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0C0BD2     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00EA
            TCS
            LDA   $F9
            LDY   #$0002
            STA   [$F5],Y
            LDA   $FB
            STA   [$F5]
            LDA   $FD
            LDY   #$0006
            STA   [$F5],Y
            LDA   $FF
            LDY   #$0004
            STA   [$F5],Y
            TDC
            CLC
            ADC   #$00EF
            TCS
            PLD
            RTL

L0C0BFE     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EE
            TCS
            LDY   #$0002
            LDA   [$FD],Y
            PHA
            PLA
            LDY   #$0002
            STA   [$F9],Y
            LDA   [$FD]
            PHA
            PLA
            STA   [$F9]
            LDY   #$0006
            LDA   [$FD],Y
            PHA
            PLA
            LDY   #$0006
            STA   [$F9],Y
            LDY   #$0004
            LDA   [$FD],Y
            PHA
            PLA
            LDY   #$0004
            STA   [$F9],Y
            TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L0C0C3B     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            PEI   $FF
            _SetSolidPenPat
            STA   L0F0779
            LDY   #$0002
            LDA   [$FB],Y
            PHA
            LDA   [$FB]
            PHA
            _MoveTo
            STA   L0F0779
            LDY   #$0006
            LDA   [$FB],Y
            SEC
            SBC   #$0001
            PHA
            LDA   [$FB]
            PHA
            _LineTo
            STA   L0F0779
            LDY   #$0006
            LDA   [$FB],Y
            SEC
            SBC   #$0001
            PHA
            LDY   #$0004
            LDA   [$FB],Y
            PHA
            _LineTo
            STA   L0F0779
            LDY   #$0002
            LDA   [$FB],Y
            PHA
            LDY   #$0004
            LDA   [$FB],Y
            PHA
            _LineTo
            STA   L0F0779
            LDY   #$0002
            LDA   [$FB],Y
            PHA
            LDA   [$FB]
            PHA
            _LineTo
            STA   L0F0779
            LDY   #$0006
            LDA   [$FB],Y
            SEC
            SBC   #$0002
            PHA
            LDA   [$FB]
            PHA
            _MoveTo
            STA   L0F0779
            LDY   #$0006
            LDA   [$FB],Y
            SEC
            SBC   #$0002
            PHA
            LDY   #$0004
            LDA   [$FB],Y
            PHA
            _LineTo
            STA   L0F0779
            LDY   #$0002
            LDA   [$FB],Y
            CLC
            ADC   #$0001
            PHA
            LDY   #$0004
            LDA   [$FB],Y
            PHA
            _MoveTo
            STA   L0F0779
            LDY   #$0002
            LDA   [$FB],Y
            CLC
            ADC   #$0001
            PHA
            LDA   [$FB]
            PHA
            _LineTo
            STA   L0F0779
            PEA   $0000
            _SetSolidPenPat
            STA   L0F0779
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0C0D36     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EE
            TCS
            LDY   #$0002
            LDA   [$F9],Y
            CLC
            ADC   $FD
            PHA
            PLA
            LDY   #$0002
            STA   [$F9],Y
            LDY   #$0006
            LDA   [$F9],Y
            SEC
            SBC   $FD
            PHA
            PLA
            LDY   #$0006
            STA   [$F9],Y
            LDA   [$F9]
            CLC
            ADC   $FF
            PHA
            PLA
            STA   [$F9]
            LDY   #$0004
            LDA   [$F9],Y
            SEC
            SBC   $FF
            PHA
            PLA
            LDY   #$0004
            STA   [$F9],Y
            TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L0C0D7F     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EE
            TCS
            LDY   #$0002
            LDA   [$F9],Y
            CLC
            ADC   $FD
            PHA
            PLA
            LDY   #$0002
            STA   [$F9],Y
            LDY   #$0006
            LDA   [$F9],Y
            CLC
            ADC   $FD
            PHA
            PLA
            LDY   #$0006
            STA   [$F9],Y
            LDA   [$F9]
            CLC
            ADC   $FF
            PHA
            PLA
            STA   [$F9]
            LDY   #$0004
            LDA   [$F9],Y
            CLC
            ADC   $FF
            PHA
            PLA
            LDY   #$0004
            STA   [$F9],Y
            TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L0C0DC8     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            PEI   $FF
            _SetSolidPenPat
            STA   L0F0779
            PEI   $FD
            PEI   $FB
            _PaintRect
            STA   L0F0779
            PEA   $0000
            _SetSolidPenPat
            STA   L0F0779
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0C0E02     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            PEA   $0000
            JSL   L091C6A
            PLY
            PEA   ^L0E53D0
            PEA   L0E53D0
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
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
            BCC   L0C0E4D
            INC   $FA
L0C0E4D     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C0E57
            INC   $FA
L0C0E57     LDA   [$F8]
            STA   L0F00C3
            LDA   L0F00C3
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
            LDA   #$0058
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C0E7B
            INC   $FA
L0C0E7B     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C0E85
            INC   $FA
L0C0E85     PEI   $FA
            PEI   $F8
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            PEA   ^L0E58C7
            PEA   L0E58C7
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E5454
            PLA
            STAL  L0E5452
            LDA   #L0E2053
            LDX   #^L0E2053
            PHA
            TXA
            STAL  L0E546C
            PLA
            STAL  L0E546A
            LDA   #L0E53A7
            LDX   #^L0E53A7
            PHA
            TXA
            STAL  L0E5484
            PLA
            STAL  L0E5482
            LDA   #L0E53B0
            LDX   #^L0E53B0
            PHA
            TXA
            STAL  L0E549C
            PLA
            STAL  L0E549A
            LDA   #L0E53B9
            LDX   #^L0E53B9
            PHA
            TXA
            STAL  L0E54B4
            PLA
            STAL  L0E54B2
            LDA   #L0E58C7
            LDX   #^L0E58C7
            PHA
            TXA
            STAL  L0E54CC
            PLA
            STAL  L0E54CA
            LDA   #L0E53DB
            LDX   #^L0E53DB
            PHA
            TXA
            STAL  L0E54E4
            PLA
            STAL  L0E54E2
            LDA   #L0E53DF
            LDX   #^L0E53DF
            PHA
            TXA
            STAL  L0E54FC
            PLA
            STAL  L0E54FA
            LDA   #L0E53E4
            LDX   #^L0E53E4
            PHA
            TXA
            STAL  L0E5514
            PLA
            STAL  L0E5512
            LDA   #L0E53E8
            LDX   #^L0E53E8
            PHA
            TXA
            STAL  L0E552C
            PLA
            STAL  L0E552A
            LDA   #L0E53EC
            LDX   #^L0E53EC
            PHA
            TXA
            STAL  L0E5544
            PLA
            STAL  L0E5542
            LDA   #L0E53F1
            LDX   #^L0E53F1
            PHA
            TXA
            STAL  L0E555C
            PLA
            STAL  L0E555A
            LDA   #L0E53F6
            LDX   #^L0E53F6
            PHA
            TXA
            STAL  L0E5574
            PLA
            STAL  L0E5572
            LDA   #L0E53FA
            LDX   #^L0E53FA
            PHA
            TXA
            STAL  L0E558C
            PLA
            STAL  L0E558A
            LDA   #L0E5446
            LDX   #^L0E5446
            PHA
            TXA
            STAL  L0E540C
            PLA
            STAL  L0E540A
            LDA   #L0E545E
            LDX   #^L0E545E
            PHA
            TXA
            STAL  L0E5410
            PLA
            STAL  L0E540E
            LDA   #L0E5476
            LDX   #^L0E5476
            PHA
            TXA
            STAL  L0E5414
            PLA
            STAL  L0E5412
            LDA   #L0E548E
            LDX   #^L0E548E
            PHA
            TXA
            STAL  L0E5418
            PLA
            STAL  L0E5416
            LDA   #L0E54A6
            LDX   #^L0E54A6
            PHA
            TXA
            STAL  L0E541C
            PLA
            STAL  L0E541A
            LDA   #L0E54BE
            LDX   #^L0E54BE
            PHA
            TXA
            STAL  L0E5420
            PLA
            STAL  L0E541E
            LDA   #L0E54D6
            LDX   #^L0E54D6
            PHA
            TXA
            STAL  L0E5424
            PLA
            STAL  L0E5422
            LDA   #L0E54EE
            LDX   #^L0E54EE
            PHA
            TXA
            STAL  L0E5428
            PLA
            STAL  L0E5426
            LDA   #L0E5506
            LDX   #^L0E5506
            PHA
            TXA
            STAL  L0E542C
            PLA
            STAL  L0E542A
            LDA   #L0E551E
            LDX   #^L0E551E
            PHA
            TXA
            STAL  L0E5430
            PLA
            STAL  L0E542E
            LDA   #L0E5536
            LDX   #^L0E5536
            PHA
            TXA
            STAL  L0E5434
            PLA
            STAL  L0E5432
            LDA   #L0E554E
            LDX   #^L0E554E
            PHA
            TXA
            STAL  L0E5438
            PLA
            STAL  L0E5436
            LDA   #L0E5566
            LDX   #^L0E5566
            PHA
            TXA
            STAL  L0E543C
            PLA
            STAL  L0E543A
            LDA   #L0E557E
            LDX   #^L0E557E
            PHA
            TXA
            STAL  L0E5440
            PLA
            STAL  L0E543E
            PHX
            PHA
            PEA   ^L0E53FC
            PEA   L0E53FC
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $F6
            STA   $F4
            PEA   $0001
            PEI   $F6
            PEI   $F4
            PEA   $0003
            _SetDItemValue
            STA   L0F0779
            PEA   $0001
            PEI   $F6
            PEI   $F4
            PEA   $0007
            _SetDItemValue
            STA   L0F0779
            LDA   #$0002
            STA   L0F0068
            LDA   #$0004
            STA   L0F006A
            STZ   L0F00C7
L0C10D6     LDA   #$0001
            BNE   L0C10DE
            BRL   L0C11CB
L0C10DE     PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   L0F00E1
            LDA   L0F00E1
            CMP   #$0001
            BNE   L0C1130
            PEI   $F6
            PEI   $F4
            PEA   $000E
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            _GetIText
            STA   L0F0779
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            PEA   ^L0E2E68
            PEA   L0E2E68
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
            JSL   L0C1277
            TAY
            BEQ   L0C1130
            BRL   L0C11CB
L0C1130     LDA   L0F00E1
            CMP   #$0002
            BNE   L0C115E
            PEI   $F6
            PEI   $F4
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   #$FFFF
            BRL   L0C126D
L0C115E     LDA   L0F00E1
            CMP   #$0003
            BEQ   L0C116E
            LDA   L0F00E1
            CMP   #$0004
            BNE   L0C118D
L0C116E     LDA   L0F00E1
            SEC
            SBC   #$0001
            STA   L0F0068
            PEA   $0001
            PEI   $F6
            PEI   $F4
            LDA   L0F00E1
            PHA
            _SetDItemValue
            STA   L0F0779
L0C118D     LDA   L0F00E1
            SEC
            SBC   #$0007
            BVS   L0C1199
            EOR   #$8000
L0C1199     BPL   L0C11C8
            LDA   L0F00E1
            SEC
            SBC   #$000E
            BVS   L0C11A7
            EOR   #$8000
L0C11A7     BMI   L0C11C8
            LDA   L0F00E1
            SEC
            SBC   #$0003
            STA   L0F006A
            PEA   $0001
            PEI   $F6
            PEI   $F4
            LDA   L0F00E1
            PHA
            _SetDItemValue
            STA   L0F0779
L0C11C8     BRL   L0C10D6
L0C11CB     PEI   $F6
            PEI   $F4
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   L0F006A
            CMP   #$0004
            BEQ   L0C11F5
            BRA   L0C11FD
L0C11F5     STZ   L0F00CB
            BRL   L0C1261
            BRA   L0C1204
L0C11FD     CMP   #$0005
            BEQ   L0C1204
            BRA   L0C120F
L0C1204     LDA   #$0001
            STA   L0F00CB
            BRL   L0C1261
            BRA   L0C1216
L0C120F     CMP   #$0006
            BEQ   L0C1216
            BRA   L0C1221
L0C1216     LDA   #$0002
            STA   L0F00CB
            BRL   L0C1261
            BRA   L0C1228
L0C1221     CMP   #$0007
            BEQ   L0C1228
            BRA   L0C1232
L0C1228     LDA   #$0003
            STA   L0F00CB
            BRA   L0C1261
            BRA   L0C1239
L0C1232     CMP   #$0008
            BEQ   L0C1239
            BRA   L0C1243
L0C1239     LDA   #$0004
            STA   L0F00CB
            BRA   L0C1261
            BRA   L0C124A
L0C1243     CMP   #$0009
            BEQ   L0C124A
            BRA   L0C1254
L0C124A     LDA   #$0005
            STA   L0F00CB
            BRA   L0C1261
            BRA   L0C125B
L0C1254     CMP   #$000A
            BEQ   L0C125B
            BRA   L0C1261
L0C125B     LDA   #$0006
            STA   L0F00CB
L0C1261     LDA   #$0001
            STA   L0F0006
            LDA   #$000B
            STA   L0F0012
L0C126D     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0C1277     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0F00C3
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
            BCC   L0C12A1
            INC   $FA
L0C12A1     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C12AB
            INC   $FA
L0C12AB     LDA   [$F8]
            AND   #$00FF
            STA   $F6
            LDA   L0F00C7
            BNE   L0C12C8
            PEA   ^L0E2E68
            PEA   L0E2E68
            PEI   $F6
            JSL   L0C135B
            PLY
            PLY
            PLY
            BRA   L0C12D7
L0C12C8     PEA   ^L0E2E98
            PEA   L0E2E98
            PEI   $F6
            JSL   L0C135B
            PLY
            PLY
            PLY
L0C12D7     LDA   L0F00C5
            SEC
            SBC   #$0000
            BVS   L0C12E3
            EOR   #$8000
L0C12E3     BPL   L0C12FC
            LDA   L0F00C7
            BEQ   L0C12FC
            PEA   ^L0E2EC8
            PEA   L0E2EC8
            PEI   $F6
            JSL   L0C135B
            PLY
            PLY
            PLY
            STA   L0F00C5
L0C12FC     LDA   $F6
            CMP   #$0000
            BEQ   L0C1314
            CMP   #$0006
            BEQ   L0C1314
            CMP   #$0007
            BEQ   L0C1314
            CMP   #$0005
            BEQ   L0C1314
            BRA   L0C132B
L0C1314     BRA   L0C132D
L0C1316     LDA   L0F00C5
            SEC
            SBC   #$0000
            BVS   L0C1322
            EOR   #$8000
L0C1322     BMI   L0C1329
            LDA   #$0000
            BRA   L0C1351
L0C1329     BRA   L0C132D
L0C132B     BRA   L0C1316
L0C132D     LDA   L0F0068
            CMP   #$0002
            BEQ   L0C1337
            BRA   L0C1341
L0C1337     LDA   #$0007
            STA   L0F00C9
            BRA   L0C134E
            BRA   L0C1348
L0C1341     CMP   #$0003
            BEQ   L0C1348
            BRA   L0C134E
L0C1348     LDA   #$0008
            STA   L0F00C9
L0C134E     LDA   #$0001
L0C1351     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0C135B     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            PEI   $FF
            PEI   $FD
            JSL   L0C04CD
            PLY
            PLY
            STA   L0F00C5
            LDA   $FB
            CMP   #$0001
            BEQ   L0C1381
            CMP   #$0008
            BEQ   L0C1381
            BRA   L0C139C
L0C1381     LDA   L0F00C5
            PHA
            PEI   $FF
            PEI   $FD
            PEA   $0001
            JSL   L0B0000
            PLY
            PLY
            PLY
            PLY
            STA   L0F00C5
            BRL   L0C1480
            BRA   L0C13A3
L0C139C     CMP   #$0002
            BEQ   L0C13A3
            BRA   L0C13BE
L0C13A3     LDA   L0F00C5
            PHA
            PEI   $FF
            PEI   $FD
            PEA   $0001
            JSL   L0B0397
            PLY
            PLY
            PLY
            PLY
            STA   L0F00C5
            BRL   L0C1480
            BRA   L0C13C5
L0C13BE     CMP   #$0004
            BEQ   L0C13C5
            BRA   L0C13E0
L0C13C5     LDA   L0F00C5
            PHA
            PEI   $FF
            PEI   $FD
            PEA   $0001
            JSL   L0B0DD6
            PLY
            PLY
            PLY
            PLY
            STA   L0F00C5
            BRL   L0C1480
            BRA   L0C13E7
L0C13E0     CMP   #$0006
            BEQ   L0C13E7
            BRA   L0C140C
L0C13E7     LDA   L0F00C5
            PHA
            PEI   $FF
            PEI   $FD
            JSL   L0B0F15
            PLY
            PLY
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            PLA
            LDY   #$005A
            STA   [$F2],Y
            BRL   L0C1480
            BRA   L0C1413
L0C140C     CMP   #$0003
            BEQ   L0C1413
            BRA   L0C142E
L0C1413     LDA   L0F00C5
            PHA
            PEI   $FF
            PEI   $FD
            PEA   $0001
            JSL   L0B08D7
            PLY
            PLY
            PLY
            PLY
            STA   L0F00C5
            BRL   L0C1480
            BRA   L0C1435
L0C142E     CMP   #$0005
            BEQ   L0C1435
            BRA   L0C1459
L0C1435     LDA   L0F00C5
            PHA
            PEI   $FF
            PEI   $FD
            JSL   L0B0FA7
            PLY
            PLY
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            PLA
            LDY   #$005A
            STA   [$F2],Y
            BRA   L0C1480
            BRA   L0C1460
L0C1459     CMP   #$0007
            BEQ   L0C1460
            BRA   L0C1480
L0C1460     LDA   L0F00C5
            PHA
            PEI   $FF
            PEI   $FD
            JSL   L0B1072
            PLY
            PLY
            PLY
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            PLA
            LDY   #$005A
            STA   [$F2],Y
L0C1480     TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L0C1488     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00DF
            TCS
            STZ   $F4
            LDA   L0F0044
            CMP   #$0001
            BNE   L0C14E5
L0C149D     LDA   $F4
            INC   $F4
            TAX
            LDAL  L0E4A4C,X
            AND   #$00FF
            SEP   #$20
            STA   $E1
            REP   #$20
            AND   #$00FF
            BEQ   L0C14C4
            LDA   $E1
            AND   #$00FF
            CMP   #$002F
            BNE   L0C14C2
            LDA   $F4
            STA   $F2
L0C14C2     BRA   L0C149D
L0C14C4     LDA   $F2
            TAX
            TXA
            CLC
            ADC   #L0E4A4C
            TAX
            LDA   #^L0E4A4C
            BCC   L0C14D3
            INC
L0C14D3     PHA
            PHX
            PEA   ^L0E2F09
            PEA   L0E2F09
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRA   L0C14F9
L0C14E5     PEA   ^L0E3AA0
            PEA   L0E3AA0
            PEA   ^L0E2F09
            PEA   L0E2F09
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0C14F9     LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E56A6
            PLA
            STAL  L0E56A4
            LDA   #L0E4CCC
            LDX   #^L0E4CCC
            PHA
            TXA
            STAL  L0E56BE
            PLA
            STAL  L0E56BC
            LDA   #L0E5698
            LDX   #^L0E5698
            PHA
            TXA
            STAL  L0E5690+2
            PLA
            STAL  L0E5690
            LDAL  L0E56B0
            CMP   #$0002
            BEQ   L0C153A
            LDA   #$0000
            BRA   L0C153D
L0C153A     LDA   #$0001
L0C153D     PHX
            PHA
            PEA   ^L0E5682
            PEA   L0E5682
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $E4
            STA   $E2
            LDA   #$0009
            STA   $F2
            STZ   $F4
            BRL   L0C190C
L0C155F     LDA   $F4
            ASL
            ASL
            PHA
            LDA   #L0E48F4
            STA   $F8
            LDA   #^L0E48F4
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C1578
            INC   $FA
L0C1578     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            PHX
            PHA
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   $F4
            CMP   #$0000
            BEQ   L0C1599
            BRA   L0C159E
L0C1599     BRL   L0C1890
            BRA   L0C15A5
L0C159E     CMP   #$0001
            BEQ   L0C15A5
            BRA   L0C15BE
L0C15A5     PEA   ^L0E5803
            PEA   L0E5803
            PEA   ^L0E2F09
            PEA   L0E2F09
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRL   L0C1890
            BRA   L0C15C5
L0C15BE     CMP   #$0002
            BEQ   L0C15C5
            BRA   L0C15F0
L0C15C5     PEA   ^L0E2F09
            PEA   L0E2F09
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDY   #$0014
            LDA   [$F8],Y
            LDX   #$0000
            TAY
            BPL   L0C15E1
            DEX
L0C15E1     PHX
            PHA
            JSL   L0C01F2
            PLY
            PLY
            PLY
            PLY
            BRL   L0C1890
            BRA   L0C15F8
L0C15F0     CMP   #$0003
            BEQ   L0C15F8
            BRL   L0C1675
L0C15F8     STZ   $F6
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDY   #$000E
            LDA   [$F8],Y
            TAX
            LDY   #$000C
            LDA   [$F8],Y
            JSL   L0D157E
            BVS   L0C1620
            EOR   #$8000
L0C1620     BMI   L0C1657
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
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDY   #$000E
            LDA   [$F8],Y
            TAX
            LDY   #$000C
            LDA   [$F8],Y
            SEC
            JSL   L0D15C0
            PLY
            PLY
            STA   $F6
L0C1657     PEA   ^L0E2F09
            PEA   L0E2F09
            LDA   $F6
            LDX   #$0000
            TAY
            BPL   L0C1666
            DEX
L0C1666     PHX
            PHA
            JSL   L0C01F2
            PLY
            PLY
            PLY
            PLY
            BRL   L0C1890
            BRA   L0C167D
L0C1675     CMP   #$0004
            BEQ   L0C167D
            BRL   L0C16EE
L0C167D     LDA   $F6
            CMP   #$0000
            BNE   L0C169A
            PEA   ^L0E5805
            PEA   L0E5805
            PEA   ^L0E2F09
            PEA   L0E2F09
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRA   L0C16E9
L0C169A     LDX   L0F0028
            LDA   L0F0026
            PHX
            PHA
            LDA   $F6
            LDX   #$0000
            TAY
            BPL   L0C16AB
            DEX
L0C16AB     SEC
            JSL   L0D15C0
            PLY
            PLY
            STX   $F0
            STA   $EE
            LDX   #$0000
            LDA   #$7D00
            PHX
            PHA
            LDX   $F0
            LDA   $EE
            JSL   L0D157E
            BVS   L0C16CB
            EOR   #$8000
L0C16CB     BMI   L0C16D7
            LDX   #$0000
            LDA   #$7D00
            STX   $F0
            STA   $EE
L0C16D7     PEA   ^L0E2F09
            PEA   L0E2F09
            PEI   $F0
            PEI   $EE
            JSL   L0C01F2
            PLY
            PLY
            PLY
            PLY
L0C16E9     BRL   L0C1890
            BRA   L0C16F6
L0C16EE     CMP   #$0005
            BEQ   L0C16F6
            BRL   L0C1752
L0C16F6     LDA   #$0000
            STAL  L0E32AF
            LDA   #L0E4CCC
            LDX   #^L0E4CCC
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
            CMP   #$0000
            BEQ   L0C1739
            PEA   ^L0E5807
            PEA   L0E5807
            PEA   ^L0E2F09
            PEA   L0E2F09
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRA   L0C174D
L0C1739     PEA   ^L0E4CCC
            PEA   L0E4CCC
            PEA   ^L0E2F09
            PEA   L0E2F09
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
L0C174D     BRL   L0C1890
            BRA   L0C1759
L0C1752     CMP   #$0006
            BEQ   L0C1759
            BRA   L0C1780
L0C1759     PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L0B22EB
            PLY
            PLY
            STX   $EC
            STA   $EA
            PEA   ^L0E2F09
            PEA   L0E2F09
            PEI   $EC
            PEI   $EA
            JSL   L0C01F2
            PLY
            PLY
            PLY
            PLY
            BRL   L0C1890
            BRA   L0C1787
L0C1780     CMP   #$0007
            BEQ   L0C1787
            BRA   L0C17B7
L0C1787     LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDY   #$000A
            LDA   [$F8],Y
            TAX
            LDY   #$0008
            LDA   [$F8],Y
            STX   $E8
            STA   $E6
            PEA   ^L0E2F09
            PEA   L0E2F09
            PEI   $E8
            PEI   $E6
            JSL   L0C01F2
            PLY
            PLY
            PLY
            PLY
            BRL   L0C1890
            BRA   L0C17BF
L0C17B7     CMP   #$0008
            BEQ   L0C17BF
            BRL   L0C1849
L0C17BF     LDA   $F6
            CMP   #$0000
            BNE   L0C17DC
            PEA   ^L0E5809
            PEA   L0E5809
            PEA   ^L0E2F09
            PEA   L0E2F09
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRA   L0C1844
L0C17DC     LDX   $EC
            LDA   $EA
            PHX
            PHA
            LDX   $E8
            LDA   $E6
            JSL   L0D157E
            BVS   L0C17EF
            EOR   #$8000
L0C17EF     BMI   L0C17F7
            STZ   $EE
            STZ   $F0
            BRA   L0C1832
L0C17F7     LDX   $EC
            LDA   $EA
            PHX
            PHA
            LDA   $F6
            LDX   #$0000
            TAY
            BPL   L0C1806
            DEX
L0C1806     SEC
            JSL   L0D15C0
            PLY
            PLY
            STX   $F0
            STA   $EE
            LDX   #$0000
            LDA   #$7D00
            PHX
            PHA
            LDX   $F0
            LDA   $EE
            JSL   L0D157E
            BVS   L0C1826
            EOR   #$8000
L0C1826     BMI   L0C1832
            LDX   #$0000
            LDA   #$7D00
            STX   $F0
            STA   $EE
L0C1832     PEA   ^L0E2F09
            PEA   L0E2F09
            PEI   $F0
            PEI   $EE
            JSL   L0C01F2
            PLY
            PLY
            PLY
            PLY
L0C1844     BRL   L0C1890
            BRA   L0C1851
L0C1849     CMP   #$0009
            BEQ   L0C1851
            BRL   L0C1890
L0C1851     LDX   $EC
            LDA   $EA
            PHX
            PHA
            LDX   $E8
            LDA   $E6
            JSL   L0D157E
            BVS   L0C1864
            EOR   #$8000
L0C1864     BMI   L0C187C
            PEA   ^L0E580B
            PEA   L0E580B
            PEA   ^L0E2F09
            PEA   L0E2F09
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRA   L0C1890
L0C187C     PEA   ^L0E580E
            PEA   L0E580E
            PEA   ^L0E2F09
            PEA   L0E2F09
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0C1890     PEA   ^L0E2F09
            PEA   L0E2F09
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
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
            LDA   $F2
            STAL  L0E56B2
            LDA   $F2
            CLC
            ADC   #$000A
            STAL  L0E56B6
            PEI   $E4
            PEI   $E2
            LDA   #L0E56B0
            LDX   #^L0E56B0
            PHX
            PHA
            _GetNewDItem
            STA   L0F0779
            PEI   $E4
            PEI   $E2
            LDAL  L0E56B0
            PHA
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            _SetIText
            STA   L0F0779
            LDAL  L0E56B0
            PHA
            INC
            STAL  L0E56B0
            PLA
            LDA   $F2
            CLC
            ADC   #$000A
            STA   $F2
            INC   $F4
L0C190C     LDA   $F4
            SEC
            SBC   #$000A
            BVS   L0C1917
            EOR   #$8000
L0C1917     BMI   L0C191C
            BRL   L0C155F
L0C191C     LDA   #$0000
            SEP   #$20
            STAL  L0E4CCC
            REP   #$20
            STZ   L0F00E1
L0C192A     LDA   L0F00E1
            CMP   #$0001
            BEQ   L0C1949
            PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   L0F00E1
            BRA   L0C192A
L0C1949     PEI   $E4
            PEI   $E2
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0C1971     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EA
            TCS
            LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E56EC
            PLA
            STAL  L0E56EA
            LDA   #L0E4CCC
            LDX   #^L0E4CCC
            PHA
            TXA
            STAL  L0E5704
            PLA
            STAL  L0E5702
            LDA   #L0E56DE
            LDX   #^L0E56DE
            PHA
            TXA
            STAL  L0E56D8
            PLA
            STAL  L0E56D6
            LDAL  L0E56F6
            CMP   #$0002
            BEQ   L0C19BD
            LDA   #$0000
            BRA   L0C19C0
L0C19BD     LDA   #$0001
L0C19C0     PHX
            PHA
            PEA   ^L0E56C8
            PEA   L0E56C8
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $EE
            STA   $EC
            PEA   ^L0E3A77
            PEA   L0E3A77
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E2F09
            PEA   L0E2F09
            LDX   L0F0028
            LDA   L0F0026
            PHX
            PHA
            LDX   #$0000
            LDA   #$0400
            SEC
            JSL   L0D15C0
            PLY
            PLY
            PHX
            PHA
            JSL   L0C01F2
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E2F09
            PEA   L0E2F09
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E5812
            PEA   L0E5812
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
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
            LDA   #$000D
            STAL  L0E56F8
            LDA   #$0017
            STAL  L0E56FC
            PEI   $EE
            PEI   $EC
            LDA   #L0E56F6
            LDX   #^L0E56F6
            PHX
            PHA
            _GetNewDItem
            STA   L0F0779
            PEI   $EE
            PEI   $EC
            LDAL  L0E56F6
            PHA
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            _SetIText
            STA   L0F0779
            LDA   #$0000
            SEP   #$20
            STAL  L0E4CCC
            REP   #$20
            STZ   L0F00E1
L0C1A98     LDA   L0F00E1
            CMP   #$0001
            BEQ   L0C1AB7
            PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   L0F00E1
            BRA   L0C1A98
L0C1AB7     PEI   $EE
            PEI   $EC
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0C1ADF     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            PEA   $0000
            JSL   L091C6A
            PLY
            PEA   ^L0E53D0
            PEA   L0E53D0
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
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
            BCC   L0C1B2A
            INC   $FA
L0C1B2A     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C1B34
            INC   $FA
L0C1B34     LDA   [$F8]
            STA   L0F00C3
            LDA   L0F00C3
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
            LDA   #$0058
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C1B58
            INC   $FA
L0C1B58     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C1B62
            INC   $FA
L0C1B62     PEI   $FA
            PEI   $F8
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            PEA   ^L0E58C7
            PEA   L0E58C7
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E5452+2
            PLA
            STAL  L0E5452
            LDA   #L0E2053
            LDX   #^L0E2053
            PHA
            TXA
            STAL  L0E546A+2
            PLA
            STAL  L0E546A
            LDA   #L0E53A7
            LDX   #^L0E53A7
            PHA
            TXA
            STAL  L0E5482+2
            PLA
            STAL  L0E5482
            LDA   #L0E53B0
            LDX   #^L0E53B0
            PHA
            TXA
            STAL  L0E549A+2
            PLA
            STAL  L0E549A
            LDA   #L0E53B9
            LDX   #^L0E53B9
            PHA
            TXA
            STAL  L0E54B2+2
            PLA
            STAL  L0E54B2
            LDA   #L0E58C7
            LDX   #^L0E58C7
            PHA
            TXA
            STAL  L0E54CA+2
            PLA
            STAL  L0E54CA
            LDA   #L0E5596
            LDX   #^L0E5596
            PHA
            TXA
            STAL  L0E562E+2
            PLA
            STAL  L0E562E
            LDA   #L0E559F
            LDX   #^L0E559F
            PHA
            TXA
            STAL  L0E5646+2
            PLA
            STAL  L0E5646
            LDA   #L0E55A8
            LDX   #^L0E55A8
            PHA
            TXA
            STAL  L0E565E+2
            PLA
            STAL  L0E565E
            LDA   #L0E55C8
            LDX   #^L0E55C8
            PHA
            TXA
            STAL  L0E5678
            PLA
            STAL  L0E5676
            LDA   #L0E5446
            LDX   #^L0E5446
            PHA
            TXA
            STAL  L0E55F6+2
            PLA
            STAL  L0E55F6
            LDA   #L0E545E
            LDX   #^L0E545E
            PHA
            TXA
            STAL  L0E55FA+2
            PLA
            STAL  L0E55FA
            LDA   #L0E5476
            LDX   #^L0E5476
            PHA
            TXA
            STAL  L0E55FE+2
            PLA
            STAL  L0E55FE
            LDA   #L0E548E
            LDX   #^L0E548E
            PHA
            TXA
            STAL  L0E5602+2
            PLA
            STAL  L0E5602
            LDA   #L0E54A6
            LDX   #^L0E54A6
            PHA
            TXA
            STAL  L0E5606+2
            PLA
            STAL  L0E5606
            LDA   #L0E54BE
            LDX   #^L0E54BE
            PHA
            TXA
            STAL  L0E560A+2
            PLA
            STAL  L0E560A
            LDA   #L0E5622
            LDX   #^L0E5622
            PHA
            TXA
            STAL  L0E560E+2
            PLA
            STAL  L0E560E
            LDA   #L0E563A
            LDX   #^L0E563A
            PHA
            TXA
            STAL  L0E5612+2
            PLA
            STAL  L0E5612
            LDA   #L0E5652
            LDX   #^L0E5652
            PHA
            TXA
            STAL  L0E5616+2
            PLA
            STAL  L0E5616
            LDA   #L0E566A
            LDX   #^L0E566A
            PHA
            TXA
            STAL  L0E561A+2
            PLA
            STAL  L0E561A
            PHX
            PHA
            PEA   ^L0E55E8
            PEA   L0E55E8
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $F6
            STA   $F4
            PEA   $0001
            PEI   $F6
            PEI   $F4
            PEA   $0003
            _SetDItemValue
            STA   L0F0779
            LDA   #$0002
            STA   L0F0068
            LDA   #$0001
            STA   L0F00C7
L0C1D14     LDA   #$0001
            BNE   L0C1D1C
            BRL   L0C1DFC
L0C1D1C     PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   L0F00E1
            LDA   L0F00E1
            CMP   #$0001
            BEQ   L0C1D3C
            BRL   L0C1D9C
L0C1D3C     PEI   $F6
            PEI   $F4
            PEA   $0009
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            _GetIText
            STA   L0F0779
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            PEA   ^L0E2E98
            PEA   L0E2E98
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
            PEI   $F6
            PEI   $F4
            PEA   $000A
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            _GetIText
            STA   L0F0779
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            PEA   ^L0E2EC8
            PEA   L0E2EC8
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
            JSL   L0C1277
            TAY
            BEQ   L0C1D9C
            BRL   L0C1DFC
L0C1D9C     LDA   L0F00E1
            CMP   #$0002
            BNE   L0C1DCA
            PEI   $F6
            PEI   $F4
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   #$FFFF
            BRL   L0C1E28
L0C1DCA     LDA   L0F00E1
            CMP   #$0003
            BEQ   L0C1DDA
            LDA   L0F00E1
            CMP   #$0004
            BNE   L0C1DF9
L0C1DDA     LDA   L0F00E1
            SEC
            SBC   #$0001
            STA   L0F0068
            PEA   $0001
            PEI   $F6
            PEI   $F4
            LDA   L0F00E1
            PHA
            _SetDItemValue
            STA   L0F0779
L0C1DF9     BRL   L0C1D14
L0C1DFC     PEI   $F6
            PEI   $F4
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   #$0001
            STA   L0F0006
            LDA   #$000C
            STA   L0F0012
L0C1E28     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0C1E32     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            LDA   L0F0042
            BNE   L0C1E4E
            LDA   #$0001
            STA   L0F0050
            LDA   #$0000
            BRL   L0C1FA0
L0C1E4E     LDA   #L0E5754
            LDX   #^L0E5754
            PHA
            TXA
            STAL  L0E5799
            PLA
            STAL  L0E5797
            LDA   #L0E5759
            LDX   #^L0E5759
            PHA
            TXA
            STAL  L0E57B1
            PLA
            STAL  L0E57AF
            LDA   #L0E575D
            LDX   #^L0E575D
            PHA
            TXA
            STAL  L0E57C9
            PLA
            STAL  L0E57C7
            LDAL  L0E491E
            TAX
            LDAL  L0E491C
            PHA
            TXA
            STAL  L0E57E1
            PLA
            STAL  L0E57DF
            LDAL  L0E4922
            TAX
            LDAL  L0E4920
            PHA
            TXA
            STAL  L0E57F9
            PLA
            STAL  L0E57F7
            LDA   #L0E578B
            LDX   #^L0E578B
            PHA
            TXA
            STAL  L0E5773+2
            PLA
            STAL  L0E5773
            LDA   #L0E57A3
            LDX   #^L0E57A3
            PHA
            TXA
            STAL  L0E5777+2
            PLA
            STAL  L0E5777
            LDA   #L0E57BB
            LDX   #^L0E57BB
            PHA
            TXA
            STAL  L0E577B+2
            PLA
            STAL  L0E577B
            LDA   #L0E57D3
            LDX   #^L0E57D3
            PHA
            TXA
            STAL  L0E577F+2
            PLA
            STAL  L0E577F
            LDA   #L0E57EB
            LDX   #^L0E57EB
            PHA
            TXA
            STAL  L0E5783+2
            PLA
            STAL  L0E5783
            PHX
            PHA
            PEA   ^L0E5765
            PEA   L0E5765
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $F4
            STA   $F2
            STZ   L0F00E1
L0C1F19     LDA   L0F00E1
            SEC
            SBC   #$0001
            BVS   L0C1F25
            EOR   #$8000
L0C1F25     BMI   L0C1F3E
            PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   L0F00E1
            BRA   L0C1F19
L0C1F3E     PEI   $F4
            PEI   $F2
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   L0F00E1
            SEC
            SBC   #$0001
            CMP   #$0000
            BEQ   L0C1F6C
            BRA   L0C1F8E
L0C1F6C     LDA   L0F0044
            CMP   #$0000
            BNE   L0C1F86
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            PEA   $0000
            JSL   L050000
            PLY
            PLY
            PLY
            BRA   L0C1F8A
L0C1F86     JSL   L0A0E6A
L0C1F8A     BRA   L0C1F9A
            BRA   L0C1F95
L0C1F8E     CMP   #$0002
            BEQ   L0C1F95
            BRA   L0C1F9A
L0C1F95     LDA   #$0000
            BRA   L0C1FA0
L0C1F9A     LDA   #$0001
            STA   L0F0050
L0C1FA0     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0C1FAA     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            LDA   L0F0000
            BNE   L0C1FD5
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$0008
            CLC
            ADC   $F8
            BCC   L0C1FCF
            INX
L0C1FCF     STX   $F4
            STA   $F2
            BRA   L0C1FDF
L0C1FD5     LDA   #L0E332D
            LDX   #^L0E332D
            STX   $F4
            STA   $F2
L0C1FDF     PEI   $F4
            PEI   $F2
            PEA   ^L0E58E5
            PEA   L0E58E5
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   $0001
            PEA   $0000
            PEA   ^L0E58E5
            PEA   L0E58E5
            PEA   $0002
            PEA   $0001
            PEA   $0038
            PEA   ^L0E3A65
            PEA   L0E3A65
            JSL   L06140B
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            STA   $F6
            LDA   $F6
            CMP   #$0002
            BNE   L0C2027
            LDA   #$0000
            BRL   L0C206E
L0C2027     LDAL  L0E58E5
            AND   #$00FF
            CMP   #$0000
            BNE   L0C2047
            PEA   ^L0E3AA0
            PEA   L0E3AA0
            PEI   $F4
            PEI   $F2
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRA   L0C2059
L0C2047     PEA   ^L0E58E5
            PEA   L0E58E5
            PEI   $F4
            PEI   $F2
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0C2059     JSL   L073CE1
            LDA   L0F0000
            BNE   L0C2068
            JSL   L080000
            BRA   L0C206E
L0C2068     LDA   #$0001
            STA   L0F0002
L0C206E     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0C2078     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00C5
            TCS
            PEA   ^L0E5814
            PEA   L0E5814
            PEA   $0000
            TDC
            CLC
            ADC   #$00C7
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E5818
            PEA   L0E5818
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E581B
            PEA   L0E581B
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDAL  L0E495E
            TAX
            LDAL  L0E495C
            PHX
            PHA
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0052
            LDA   [$F8],Y
            STA   $F4
            LDA   $F4
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
            LDA   #$0058
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2110
            INC   $FA
L0C2110     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C211A
            INC   $FA
L0C211A     PEI   $FA
            PEI   $F8
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            LDAL  L0E4962
            TAX
            LDAL  L0E4960
            PHX
            PHA
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   $F4
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
            BCC   L0C2163
            INC   $FA
L0C2163     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C216D
            INC   $FA
L0C216D     LDA   [$F8]
            AND   #$00FF
            CMP   #$0000
            BEQ   L0C2179
            BRA   L0C21A9
L0C2179     PEA   ^L0E5820
            PEA   L0E5820
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E5825
            PEA   L0E5825
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRL   L0C23B3
            BRA   L0C21B1
L0C21A9     CMP   #$0001
            BEQ   L0C21B1
            BRL   L0C21F8
L0C21B1     PEA   ^L0E5833
            PEA   L0E5833
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E583A
            PEA   L0E583A
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E5840
            PEA   L0E5840
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRL   L0C23B3
            BRA   L0C2200
L0C21F8     CMP   #$0002
            BEQ   L0C2200
            BRL   L0C225E
L0C2200     PEA   ^L0E5843
            PEA   L0E5843
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E5848
            PEA   L0E5848
            PEA   $0000
            TDC
            CLC
            ADC   #$00C7
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E5851
            PEA   L0E5851
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E5853
            PEA   L0E5853
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRL   L0C23B3
            BRA   L0C2266
L0C225E     CMP   #$0003
            BEQ   L0C2266
            BRL   L0C22C4
L0C2266     PEA   ^L0E5855
            PEA   L0E5855
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E585A
            PEA   L0E585A
            PEA   $0000
            TDC
            CLC
            ADC   #$00C7
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E5860
            PEA   L0E5860
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E5868
            PEA   L0E5868
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRL   L0C23B3
            BRA   L0C22CC
L0C22C4     CMP   #$0004
            BEQ   L0C22CC
            BRL   L0C2313
L0C22CC     PEA   ^L0E586A
            PEA   L0E586A
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E5871
            PEA   L0E5871
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E5873
            PEA   L0E5873
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRL   L0C23B3
            BRA   L0C231A
L0C2313     CMP   #$0006
            BEQ   L0C231A
            BRA   L0C234A
L0C231A     PEA   ^L0E5889
            PEA   L0E5889
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E588F
            PEA   L0E588F
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRL   L0C23B3
            BRA   L0C2351
L0C234A     CMP   #$0005
            BEQ   L0C2351
            BRA   L0C2381
L0C2351     PEA   ^L0E589D
            PEA   L0E589D
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E58A3
            PEA   L0E58A3
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            BRL   L0C23B3
            BRA   L0C2388
L0C2381     CMP   #$0007
            BEQ   L0C2388
            BRA   L0C23B3
L0C2388     PEA   ^L0E58AB
            PEA   L0E58AB
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E58B9
            PEA   L0E58B9
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
L0C23B3     LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E5730+2
            PLA
            STAL  L0E5730
            LDA   #L0E4CCC
            LDX   #^L0E4CCC
            PHA
            TXA
            STAL  L0E5748+2
            PLA
            STAL  L0E5748
            LDA   #L0E5724
            LDX   #^L0E5724
            PHA
            TXA
            STAL  L0E571C+2
            PLA
            STAL  L0E571C
            LDA   #$0002
            STAL  L0E573C
            PHX
            PHA
            PEA   ^L0E570E
            PEA   L0E570E
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $F0
            STA   $EE
            LDA   #$0008
            STA   $F6
            STZ   $F2
            BRL   L0C2534
L0C240F     LDA   $F2
            CMP   #$0000
            BEQ   L0C2418
            BRA   L0C241D
L0C2418     BRL   L0C24CC
            BRA   L0C2424
L0C241D     CMP   #$0001
            BEQ   L0C2424
            BRA   L0C2459
L0C2424     LDAL  L0E4966
            TAX
            LDAL  L0E4964
            PHX
            PHA
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            BRL   L0C24CC
            BRA   L0C2460
L0C2459     CMP   #$0002
            BEQ   L0C2460
            BRA   L0C2495
L0C2460     LDAL  L0E496A
            TAX
            LDAL  L0E4968
            PHX
            PHA
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            BRL   L0C24CC
            BRA   L0C249C
L0C2495     CMP   #$0003
            BEQ   L0C249C
            BRA   L0C24CC
L0C249C     LDAL  L0E496E
            TAX
            LDAL  L0E496C
            PHX
            PHA
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00C7
            PHA
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
L0C24CC     PEA   ^L0E4BCC
            PEA   L0E4BCC
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDA   $F6
            STAL  L0E573E
            LDA   $F6
            CLC
            ADC   #$000A
            STAL  L0E5742
            PEI   $F0
            PEI   $EE
            LDA   #L0E573C
            LDX   #^L0E573C
            PHX
            PHA
            _GetNewDItem
            STA   L0F0779
            PEI   $F0
            PEI   $EE
            LDAL  L0E573C
            PHA
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            _SetIText
            STA   L0F0779
            LDAL  L0E573C
            PHA
            INC
            STAL  L0E573C
            PLA
            LDA   $F6
            CLC
            ADC   #$000A
            STA   $F6
            INC   $F2
L0C2534     LDA   $F2
            SEC
            SBC   #$0004
            BVS   L0C253F
            EOR   #$8000
L0C253F     BMI   L0C2544
            BRL   L0C240F
L0C2544     LDA   #$0000
            SEP   #$20
            STAL  L0E4CCC
            REP   #$20
            STZ   L0F00E1
L0C2552     LDA   L0F00E1
            CMP   #$0001
            BEQ   L0C2571
            PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   L0F00E1
            BRA   L0C2552
L0C2571     PEI   $F0
            PEI   $EE
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0C2599     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0F0004
            CMP   #$0000
            BNE   L0C25C7
            PEA   ^L0E4B4C
            PEA   L0E4B4C
            PEA   $0004
            JSL   L050000
            PLY
            PLY
            PLY
            TAY
            BNE   L0C25C5
            LDA   #$0000
            BRL   L0C294F
L0C25C5     BRA   L0C25FE
L0C25C7     LDAL  L0E495A
            TAX
            LDAL  L0E4958
            PHX
            PHA
            JSL   L0506B1
            PLY
            PLY
            TAY
            BNE   L0C25E1
            LDA   #$0000
            BRL   L0C294F
L0C25E1     PEA   $0000
            PEA   $02E6
            PEA   ^L0E4B4C
            PEA   L0E4B4C
            JSL   L0A0DB6
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L0C25FE
            LDA   #$0000
            BRL   L0C294F
L0C25FE     PEA   $0000
            JSL   L0B1E73
            PLY
            PEA   ^L0E5921
            PEA   L0E5921
            PEA   ^L0E32E7
            PEA   L0E32E7
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            PEA   ^L0E32ED
            PEA   L0E32ED
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   L0F0004
            CMP   #$0000
            BNE   L0C265B
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$0008
            BCC   L0C264B
            INX
L0C264B     PHX
            PHA
            PEA   ^L0E332D
            PEA   L0E332D
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0C265B     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            STAL  L0E336D
            STZ   $F6
            BRL   L0C2834
L0C2673     LDA   $F6
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
            BCC   L0C2691
            INC   $FA
L0C2691     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C269B
            INC   $FA
L0C269B     LDA   [$F8]
            PHA
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            PLA
            STAL  L0E336F,X
            LDA   $F6
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
            LDA   #$004A
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C26C8
            INC   $FA
L0C26C8     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C26D2
            INC   $FA
L0C26D2     LDA   [$F8]
            PHA
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            PLA
            STAL  L0E3371,X
            LDA   $F6
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
            LDA   #$004E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C26FF
            INC   $FA
L0C26FF     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2709
            INC   $FA
L0C2709     LDA   [$F8]
            PHA
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            PLA
            STAL  L0E3374,X
            LDA   $F6
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
            BCC   L0C2736
            INC   $FA
L0C2736     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2740
            INC   $FA
L0C2740     LDA   [$F8]
            AND   #$00FF
            PHA
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            PLA
            SEP   #$20
            STAL  L0E3373,X
            REP   #$20
            LDA   $F6
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
            BCC   L0C2774
            INC   $FA
L0C2774     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C277E
            INC   $FA
L0C277E     LDA   [$F8]
            PHA
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            PLA
            STAL  L0E3376,X
            LDA   $F6
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
            BCC   L0C27AB
            INC   $FA
L0C27AB     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C27B5
            INC   $FA
L0C27B5     LDA   [$F8]
            PHA
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            PLA
            STAL  L0E3378,X
            LDA   $F6
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
            BCC   L0C27E2
            INC   $FA
L0C27E2     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C27EC
            INC   $FA
L0C27EC     LDA   [$F8]
            PHA
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            PLA
            STAL  L0E337A,X
            LDA   $F6
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
            LDA   #$0056
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2819
            INC   $FA
L0C2819     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2823
            INC   $FA
L0C2823     LDA   [$F8]
            PHA
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            PLA
            STAL  L0E337C,X
            INC   $F6
L0C2834     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   $F6
            BEQ   L0C2852
            BVS   L0C284D
            EOR   #$8000
L0C284D     BPL   L0C2852
            BRL   L0C2673
L0C2852     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0066
            LDA   [$F8],Y
            STAL  L0E3571
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0068
            LDA   [$F8],Y
            STAL  L0E3573
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$006A
            LDA   [$F8],Y
            STAL  L0E3575
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$006C
            LDA   [$F8],Y
            STAL  L0E3577
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$006E
            LDA   [$F8],Y
            STAL  L0E3579
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0070
            LDA   [$F8],Y
            STAL  L0E357B
            PEA   $0000
            PEA   $0040
            PEA   ^L0E357D
            PEA   L0E357D
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$0072
            BCC   L0C28E5
            INX
L0C28E5     PHX
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            JSL   L050F37
            LDA   L0F010B
            STAL  L0E35BD
            LDA   L0F010D
            STAL  L0E35BF
            LDA   L0F010F
            STAL  L0E35C1
            LDA   L0F0111
            STAL  L0E35C3
            LDA   L0F0113
            STAL  L0E35C5
            LDA   L0F0115
            STAL  L0E35C7
            LDA   L0F0117
            STAL  L0E35C9
            LDA   L0F0119
            STAL  L0E35CB
            LDA   L0F0018
            STAL  L0E356F
            JSL   L0C2959
            LDA   #$0001
            STA   L0F0004
            STZ   L0F0002
            JSL   L030FA2
            PEA   $0001
            JSL   L0B1E73
            PLY
L0C294F     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0C2959     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EC
            TCS
            LDAL  L0E32CF
            STAL  L0E32D9
            LDA   #L0E32E7
            LDX   #^L0E32E7
            PHA
            TXA
            STAL  L0E32DD
            PLA
            STAL  L0E32DB
            LDX   #$0000
            LDA   #$02E6
            PHA
            TXA
            STAL  L0E32E1
            PLA
            STAL  L0E32DF
            PEA   $0013
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            LDAL  L0E32E5
            TAX
            LDAL  L0E32E3
            STX   $F6
            STA   $F4
            LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $F6
            LDA   $F4
            JSL   L0D157E
            BEQ   L0C29D6
            BVS   L0C29BF
            EOR   #$8000
L0C29BF     BPL   L0C29D6
            PEA   $FFFC
            JSL   L0617E1
            PLY
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   #$0000
            BRA   L0C2A1A
L0C29D6     LDAL  L0E32D9
            STA   $EE
            PEA   $0017
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            JSL   L0F0831
            PEA   $0018
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
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
L0C2A1A     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0C2A24     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            JSL   L0C2C4D
            CMP   #$0002
            BNE   L0C2A3E
            LDA   #$0000
            BRL   L0C2C43
L0C2A3E     PEA   $FFE4
            PEA   $0000
            PEA   $02E6
            PEA   ^L0E32E7
            PEA   L0E32E7
            PEA   ^L0E5927
            PEA   L0E5927
            PEA   ^L0E4B4C
            PEA   L0E4B4C
            JSL   L0A111B
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            TAY
            BNE   L0C2A6E
            LDA   #$0000
            BRL   L0C2C43
L0C2A6E     PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            STZ   L0F0000
            STZ   L0F0002
            LDA   #$FFFF
            STA   $F6
L0C2A86     LDA   #$0001
            BNE   L0C2A8E
            BRL   L0C2B73
L0C2A8E     LDA   L0F0044
            CMP   #$0001
            BEQ   L0C2A99
            BRL   L0C2AE5
L0C2A99     PEA   ^L0E32ED
            PEA   L0E32ED
            JSL   L0C04CD
            PLY
            PLY
            PHA
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L0C04CD
            PLY
            PLY
            PHA
            PEA   ^L0E32ED
            PEA   L0E32ED
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L0C04FA
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            TAY
            BNE   L0C2AD1
            BRL   L0C2B73
L0C2AD1     PEA   ^L0E4A4C
            PEA   L0E4A4C
            PEA   ^L0E4ACC
            PEA   L0E4ACC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0C2AE5     PEA   ^L0E32ED
            PEA   L0E32ED
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            INC   $F6
            JSL   L0A1250
            TAY
            BEQ   L0C2B05
            BRL   L0C2B6E
L0C2B05     LDA   L0F0044
            CMP   #$0001
            BNE   L0C2B21
            PEA   ^L0E4ACC
            PEA   L0E4ACC
            PEA   ^L0E4A4C
            PEA   L0E4A4C
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0C2B21     PEA   $0001
            PEA   $0000
            PEA   ^L0E32ED
            PEA   L0E32ED
            PEA   $0002
            PEA   $0001
            PEA   $0038
            LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDAL  L0E49E2
            TAX
            LDAL  L0E49E0
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            JSL   L06140B
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            STA   L0F00E1
            LDA   L0F00E1
            CMP   #$0002
            BNE   L0C2B6C
            LDA   #$0000
            BRL   L0C2C43
L0C2B6C     BRA   L0C2B70
L0C2B6E     BRA   L0C2B73
L0C2B70     BRL   L0C2A86
L0C2B73     LDA   $F6
            SEC
            SBC   #$0000
            BEQ   L0C2B88
            BVS   L0C2B80
            EOR   #$8000
L0C2B80     BPL   L0C2B88
            LDA   #$0001
            STA   L0F0002
L0C2B88     LDA   #$0001
            STA   $F4
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            CMPL  L0E336D
            BEQ   L0C2BA6
            STZ   $F4
            BRA   L0C2C01
L0C2BA6     STZ   $F6
            BRA   L0C2BF3
L0C2BAA     LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            LDAL  L0E3373,X
            AND   #$00FF
            PHA
            LDA   $F6
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
            BCC   L0C2BD7
            INC   $FA
L0C2BD7     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2BE1
            INC   $FA
L0C2BE1     LDA   [$F8]
            AND   #$00FF
            PLX
            STX   $F8
            CMP   $F8
            BEQ   L0C2BF1
            STZ   $F4
            BRA   L0C2C01
L0C2BF1     INC   $F6
L0C2BF3     LDA   $F6
            SEC
            SBCL  L0E336D
            BVS   L0C2BFF
            EOR   #$8000
L0C2BFF     BPL   L0C2BAA
L0C2C01     LDA   $F4
            BEQ   L0C2C0B
            JSL   L0C2C80
            BRA   L0C2C21
L0C2C0B     LDA   #$0001
            STA   L0F0002
            PEA   $0001
            JSL   L0B1E73
            PLY
            PEA   $FFE2
            JSL   L0617E1
            PLY
L0C2C21     LDA   #$0001
            STA   L0F0004
            LDA   #$0001
            STA   L0F0000
            JSL   L011281
            JSL   L073CE1
            LDA   #$0001
            STA   L0F0006
            PEA   $0001
            JSL   L0B1E73
            PLY
L0C2C43     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0C2C4D     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDA   L0F0042
            BEQ   L0C2C73
            JSL   L0C1E32
            LDA   L0F0050
            CMP   #$0001
            BNE   L0C2C6E
            STZ   L0F0050
            BRA   L0C2C73
L0C2C6E     LDA   #$0002
            BRA   L0C2C76
L0C2C73     LDA   #$0001
L0C2C76     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0C2C80     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   $0000
            JSL   L0B1E73
            PLY
            LDAL  L0E356F
            STA   L0F0018
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDAL  L0E3571
            LDY   #$0066
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDAL  L0E3573
            LDY   #$0068
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDAL  L0E3575
            LDY   #$006A
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDAL  L0E3577
            LDY   #$006C
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDAL  L0E3579
            LDY   #$006E
            STA   [$F8],Y
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDAL  L0E357B
            LDY   #$0070
            STA   [$F8],Y
            PEA   $0000
            PEA   $0040
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$0072
            BCC   L0C2D27
            INX
L0C2D27     PHX
            PHA
            PEA   ^L0E357D
            PEA   L0E357D
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDAL  L0E35BD
            STA   L0F010B
            LDAL  L0E35BF
            STA   L0F010D
            LDAL  L0E35C1
            STA   L0F010F
            LDAL  L0E35C3
            STA   L0F0111
            LDAL  L0E35C5
            STA   L0F0113
            LDAL  L0E35C7
            STA   L0F0115
            LDAL  L0E35C9
            STA   L0F0117
            LDAL  L0E35CB
            STA   L0F0119
            LDA   #$0001
            STA   L0F006E
            STZ   $F6
            BRL   L0C2F3F
L0C2D7E     LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            LDAL  L0E336F,X
            PHA
            LDA   $F6
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
            BCC   L0C2DA8
            INC   $FA
L0C2DA8     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2DB2
            INC   $FA
L0C2DB2     PLA
            STA   [$F8]
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            LDAL  L0E3371,X
            PHA
            LDA   $F6
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
            LDA   #$004A
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2DDF
            INC   $FA
L0C2DDF     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2DE9
            INC   $FA
L0C2DE9     PLA
            STA   [$F8]
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            LDAL  L0E3374,X
            PHA
            LDA   $F6
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
            LDA   #$004E
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2E16
            INC   $FA
L0C2E16     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2E20
            INC   $FA
L0C2E20     PLA
            STA   [$F8]
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            LDAL  L0E3373,X
            AND   #$00FF
            PHA
            LDA   $F6
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
            BCC   L0C2E50
            INC   $FA
L0C2E50     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2E5A
            INC   $FA
L0C2E5A     PLA
            SEP   #$20
            STA   [$F8]
            REP   #$20
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            LDAL  L0E3376,X
            PHA
            LDA   $F6
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
            BCC   L0C2E8B
            INC   $FA
L0C2E8B     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2E95
            INC   $FA
L0C2E95     PLA
            STA   [$F8]
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            LDAL  L0E3378,X
            PHA
            LDA   $F6
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
            BCC   L0C2EC2
            INC   $FA
L0C2EC2     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2ECC
            INC   $FA
L0C2ECC     PLA
            STA   [$F8]
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            LDAL  L0E337A,X
            PHA
            LDA   $F6
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
            BCC   L0C2EF9
            INC   $FA
L0C2EF9     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2F03
            INC   $FA
L0C2F03     PLA
            STA   [$F8]
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            TAX
            LDAL  L0E337C,X
            PHA
            LDA   $F6
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
            LDA   #$0056
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2F30
            INC   $FA
L0C2F30     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0C2F3A
            INC   $FA
L0C2F3A     PLA
            STA   [$F8]
            INC   $F6
L0C2F3F     LDA   $F6
            SEC
            SBCL  L0E336D
            BVS   L0C2F4B
            EOR   #$8000
L0C2F4B     BMI   L0C2F50
            BRL   L0C2D7E
L0C2F50     JSL   L090630
            JSL   L083651
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0070
            LDA   [$F8],Y
            CMP   #$0000
            BEQ   L0C2F8A
            PEA   ^L0A1C15
            PEA   L0A1C15
            PEA   ^L0A1981
            PEA   L0A1981
            PEA   ^L074043
            PEA   L074043
            JSL   L0A18D9
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L0C2F8A     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0C2F92     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            STZ   L0F0000
            STZ   L0F0002
            STZ   L0F0004
            JSL   L030FA2
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0C2FB2     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            PEA   ^L0E4ACC
            PEA   L0E4ACC
            PEA   $0005
            JSL   L050000
            PLY
            PLY
            PLY
            TAY
            BNE   L0C2FD5
            LDA   #$0000
            BRA   L0C2FD9
L0C2FD5     JSL   L0C2959
L0C2FD9     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL


