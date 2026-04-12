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

	use	D.X.S
	
GSOS	=	$E100A8

*-----------------------------------

L080000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDA   L0F006C
            BNE   L08001F
            LDA   L0F0042
            BNE   L08001F
            LDA   #$0001
            STA   L0F0042
            JSL   L030FA2
L08001F     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L080027     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$0006
            STA   [$F8],Y
            PEA   ^L0E529D
            PEA   L0E529D
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            PEI   $FA
            PEI   $F8
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDX   #$0000
            LDA   #$0014
            LDY   #$000A
            PHA
            TXA
            STA   [$F8],Y
            PLA
            LDY   #$0008
            STA   [$F8],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDX   #$0000
            LDA   #$0000
            LDY   #$000E
            PHA
            TXA
            STA   [$F8],Y
            PLA
            LDY   #$000C
            STA   [$F8],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDX   #$0000
            LDA   #$0000
            LDY   #$0012
            PHA
            TXA
            STA   [$F8],Y
            PLA
            LDY   #$0010
            STA   [$F8],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$0014
            CLC
            ADC   $F8
            BCC   L0800CC
            INX
L0800CC     STX   L0F003C
            STA   L0F003A
            JSL   L080000
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0800DE     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00DE
            TCS
            LDX   #$0000
            LDA   #$0448
            STX   $E6
            STA   $E4
            LDX   L0F0028
            LDA   L0F0026
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$000A
            LDA   [$F4],Y
            TAX
            LDY   #$0008
            LDA   [$F4],Y
            CLC
            ADC   $E4
            PHA
            TXA
            ADC   $E6
            TAX
            PLA
            JSL   L0D157E
            BVS   L080122
            EOR   #$8000
L080122     BMI   L080132
            PEA   $FFFF
            JSL   L0617E1
            PLY
            LDA   #$FFFF
            BRL   L080399
L080132     LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$000A
            LDA   [$F4],Y
            TAX
            LDY   #$0008
            LDA   [$F4],Y
            CLC
            ADC   $E4
            PHA
            TXA
            ADC   $E6
            TAX
            PLA
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            PLA
            PLX
            LDY   #$000A
            PHA
            TXA
            STA   [$F4],Y
            PLA
            LDY   #$0008
            STA   [$F4],Y
            LDX   L0F000C
            LDA   L0F000A
            STX   $EA
            STA   $E8
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0006
            LDA   [$F4],Y
            LDX   #$0000
            TAY
            BPL   L08018B
            DEX
L08018B     PHX
            PHA
            LDX   #$0000
            LDA   #$0448
            SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   #$0000
            LDA   #$0014
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L0D1573
            PLA
            PLX
            STX   $EA
            STA   $E8
            LDX   $EA
            LDA   $E8
            STX   $EE
            STA   $EC
            LDX   #$0000
            LDA   #$0448
            PHX
            PHA
            LDX   $EE
            LDA   $EC
            JSL   L0D1573
            PLA
            PLX
            STX   $EE
            STA   $EC
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$000E
            LDA   [$F4],Y
            TAX
            LDY   #$000C
            LDA   [$F4],Y
            JSL   L0D157E
            BVS   L0801FC
            EOR   #$8000
L0801FC     BPL   L080201
            BRL   L0802B7
L080201     LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$000E
            LDA   [$F4],Y
            TAX
            LDY   #$000C
            LDA   [$F4],Y
            PHX
            PHA
            LDX   #$0000
            LDA   #$0004
            SEC
            JSL   L0D166F
            PLA
            PLX
            STX   $E2
            STA   $E0
            STZ   $F0
            BRA   L080284
L08022D     LDA   $F0
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDA   #$0014
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080250
            INC   $F6
L080250     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08025A
            INC   $F6
L08025A     LDA   [$F4]
            LDX   #$0000
            TAY
            BPL   L080263
            DEX
L080263     PHX
            PHA
            LDX   #$0000
            LDA   #$0004
            SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L0D1573
            PLA
            PLX
            STX   $E2
            STA   $E0
            INC   $F0
L080284     LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0006
            LDA   [$F4],Y
            SEC
            SBC   $F0
            BEQ   L08029F
            BVS   L08029D
            EOR   #$8000
L08029D     BMI   L08022D
L08029F     PEI   $E2
            PEI   $E0
            PEI   $EE
            PEI   $EC
            PEI   $EA
            PEI   $E8
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L0802B7     LDX   $EE
            LDA   $EC
            STX   L0F003C
            STA   L0F003A
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0006
            LDA   [$F4],Y
            STA   $F2
            LDA   $F2
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDA   #$0014
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0802F5
            INC   $F6
L0802F5     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0802FF
            INC   $F6
L0802FF     LDA   $F4
            LDX   $F6
            STX   L0F002C
            STA   L0F002A
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0006
            LDA   [$F4],Y
            CLC
            ADC   #$0001
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            PLA
            LDY   #$0006
            STA   [$F4],Y
            LDX   L0F002C
            LDA   L0F002A
            STA   $F4
            STX   $F6
            LDA   #$0000
            STA   [$F4]
            LDX   L0F002C
            LDA   L0F002A
            STA   $F4
            STX   $F6
            LDA   #$0000
            LDY   #$0002
            STA   [$F4],Y
            LDX   L0F002C
            LDA   L0F002A
            STA   $F4
            STX   $F6
            LDX   #$0000
            LDA   #$0000
            LDY   #$0006
            PHA
            TXA
            STA   [$F4],Y
            PLA
            LDY   #$0004
            STA   [$F4],Y
            LDA   L0F006C
            BNE   L080397
            PEI   $FF
            PEI   $FD
            LDX   L0F002C
            LDA   L0F002A
            STA   $F4
            STX   $F6
            LDA   $F4
            LDX   $F6
            CLC
            ADC   #$0008
            BCC   L080389
            INX
L080389     PHX
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            JSL   L080000
L080397     LDA   $F2
L080399     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0803A3     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            STZ   $F6
            BRL   L080468
L0803B3     LDA   $F6
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
            BCC   L0803D1
            INC   $FA
L0803D1     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0803DB
            INC   $FA
L0803DB     LDA   $F6
            STA   [$F8]
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
            BCC   L0803FD
            INC   $FA
L0803FD     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L080407
            INC   $FA
L080407     LDA   #$0038
            STA   [$F8]
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
            BCC   L08042A
            INC   $FA
L08042A     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L080434
            INC   $FA
L080434     LDA   #$0124
            STA   [$F8]
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
            BCC   L080457
            INC   $FA
L080457     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L080461
            INC   $FA
L080461     LDA   #$0098
            STA   [$F8]
            INC   $F6
L080468     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   $F6
            BEQ   L080486
            BVS   L080481
            EOR   #$8000
L080481     BPL   L080486
            BRL   L0803B3
L080486     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L08048E     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            LDA   L0F0044
            CMP   #$0001
            BEQ   L0804C3
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            BNE   L0804B9
            BRL   L080635
L0804B9     BVS   L0804BE
            EOR   #$8000
L0804BE     BMI   L0804C3
            BRL   L080635
L0804C3     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            STA   $F2
            LDA   #$FFFF
            STA   $F4
            STZ   $F6
            BRA   L080545
L0804E1     LDA   $F6
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
            BCC   L0804FF
            INC   $FA
L0804FF     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L080509
            INC   $FA
L080509     LDA   [$F8]
            SEC
            SBC   $F4
            BEQ   L080543
            BVS   L080515
            EOR   #$8000
L080515     BPL   L080543
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
            BCC   L080535
            INC   $FA
L080535     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L08053F
            INC   $FA
L08053F     LDA   [$F8]
            STA   $F4
L080543     INC   $F6
L080545     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            SEC
            SBC   $F6
            BEQ   L080567
            BVS   L080562
            EOR   #$8000
L080562     BPL   L080567
            BRL   L0804E1
L080567     LDA   $F4
            SEC
            SBC   #$001F
            BVS   L080572
            EOR   #$8000
L080572     BPL   L080577
            BRL   L080635
L080577     LDA   $F4
            CLC
            ADC   #$0001
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
            LDA   #$0050
            CLC
            ADC   $F8
            STA   $F8
            BCC   L08059C
            INC   $FA
L08059C     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0805A6
            INC   $FA
L0805A6     PLA
            STA   [$F8]
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
            LDA   #$0052
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0805C7
            INC   $FA
L0805C7     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0805D1
            INC   $FA
L0805D1     LDA   #$0038
            STA   [$F8]
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
            LDA   #$0054
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0805F4
            INC   $FA
L0805F4     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0805FE
            INC   $FA
L0805FE     LDA   #$0124
            STA   [$F8]
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
            LDA   #$0056
            CLC
            ADC   $F8
            STA   $F8
            BCC   L080621
            INC   $FA
L080621     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L08062B
            INC   $FA
L08062B     LDA   #$0098
            STA   [$F8]
            LDA   #$0000
            BRA   L080639
L080635     JSL   L0803A3
L080639     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L080643     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            CMP   #$0000
            BEQ   L080666
            CMP   #$0006
            BEQ   L080666
            CMP   #$0005
            BEQ   L080666
            CMP   #$0007
            BEQ   L080666
            BRA   L08069C
L080666     LDA   $FD
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
            LDA   #$004D
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080684
            INC   $F6
L080684     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08068E
            INC   $F6
L08068E     LDA   #$0000
            SEP   #$20
            STA   [$F4]
            REP   #$20
            BRL   L08078A
            BRA   L0806A3
L08069C     CMP   #$0001
            BEQ   L0806A3
            BRA   L0806D9
L0806A3     LDA   $FD
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
            LDA   #$004D
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0806C1
            INC   $F6
L0806C1     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0806CB
            INC   $F6
L0806CB     LDA   #$000E
            SEP   #$20
            STA   [$F4]
            REP   #$20
            BRL   L08078A
            BRA   L0806E0
L0806D9     CMP   #$0002
            BEQ   L0806E0
            BRA   L080716
L0806E0     LDA   $FD
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
            LDA   #$004D
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0806FE
            INC   $F6
L0806FE     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080708
            INC   $F6
L080708     LDA   #$0008
            SEP   #$20
            STA   [$F4]
            REP   #$20
            BRL   L08078A
            BRA   L08071D
L080716     CMP   #$0003
            BEQ   L08071D
            BRA   L080752
L08071D     LDA   $FD
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
            LDA   #$004D
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08073B
            INC   $F6
L08073B     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080745
            INC   $F6
L080745     LDA   #$0008
            SEP   #$20
            STA   [$F4]
            REP   #$20
            BRA   L08078A
            BRA   L080759
L080752     CMP   #$0004
            BEQ   L080759
            BRA   L08078A
L080759     LDA   $FD
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
            LDA   #$004D
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080777
            INC   $F6
L080777     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080781
            INC   $F6
L080781     LDA   #$0003
            SEP   #$20
            STA   [$F4]
            REP   #$20
L08078A     LDA   $FF
            AND   #$00FF
            PHA
            LDA   $FD
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
            BCC   L0807AE
            INC   $F6
L0807AE     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0807B8
            INC   $F6
L0807B8     PLA
            SEP   #$20
            STA   [$F4]
            REP   #$20
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0807C7     ENT
            PHD
            TSC
            SEC
            SBC   #$00E9
            TCD
            ADC   #$00E0
            TCS
            LDA   $F7
            STA   $E4
            LDA   $EF
            CMP   #$0000
            BEQ   L0807E0
            BRL   L080979
L0807E0     LDX   L0F002C
            LDA   L0F002A
            STA   $E6
            STX   $E8
            LDY   #$0002
            LDA   [$E6],Y
            CLC
            ADC   #$0001
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $E6
            STX   $E8
            PLA
            LDY   #$0002
            STA   [$E6],Y
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $E6
            STX   $E8
            LDA   #$0048
            CLC
            ADC   $E6
            STA   $E6
            BCC   L080822
            INC   $E8
L080822     PLA
            CLC
            ADC   $E6
            STA   $E6
            BCC   L08082C
            INC   $E8
L08082C     LDA   $E4
            STA   [$E6]
            PEI   $F9
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $E6
            STX   $E8
            LDA   #$0048
            CLC
            ADC   $E6
            STA   $E6
            BCC   L080850
            INC   $E8
L080850     PLA
            CLC
            ADC   $E6
            STA   $E6
            BCC   L08085A
            INC   $E8
L08085A     PEI   $E8
            PEI   $E6
            JSL   L060E2F
            PLY
            PLY
            PLY
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $E6
            STX   $E8
            LDA   #$004A
            CLC
            ADC   $E6
            STA   $E6
            BCC   L080883
            INC   $E8
L080883     PLA
            CLC
            ADC   $E6
            STA   $E6
            BCC   L08088D
            INC   $E8
L08088D     LDA   $FD
            STA   [$E6]
            PEI   $F9
            PEI   $FF
            JSL   L080643
            PLY
            PLY
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $E6
            STX   $E8
            LDA   #$004E
            CLC
            ADC   $E6
            STA   $E6
            BCC   L0808B9
            INC   $E8
L0808B9     PLA
            CLC
            ADC   $E6
            STA   $E6
            BCC   L0808C3
            INC   $E8
L0808C3     LDA   #$0000
            STA   [$E6]
            PEI   $FB
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $E6
            STX   $E8
            LDA   #$004E
            CLC
            ADC   $E6
            STA   $E6
            BCC   L0808E8
            INC   $E8
L0808E8     PLA
            CLC
            ADC   $E6
            STA   $E6
            BCC   L0808F2
            INC   $E8
L0808F2     LDA   [$E6]
            PHA
            JSL   L0C09E6
            PLY
            PLY
            PHA
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $E6
            STX   $E8
            LDA   #$004E
            CLC
            ADC   $E6
            STA   $E6
            BCC   L08091A
            INC   $E8
L08091A     PLA
            CLC
            ADC   $E6
            STA   $E6
            BCC   L080924
            INC   $E8
L080924     PLA
            STA   [$E6]
            PEA   $0000
            PEA   $0010
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $E6
            STX   $E8
            LDA   #$0058
            CLC
            ADC   $E6
            STA   $E6
            BCC   L08094B
            INC   $E8
L08094B     PLA
            CLC
            ADC   $E6
            STA   $E6
            BCC   L080955
            INC   $E8
L080955     PEI   $E8
            PEI   $E6
            PEI   $F3
            PEI   $F1
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            JSL   L08048E
            PEI   $F5
            JSL   L082693
            PLY
            BRL   L080A1B
            BRA   L080981
L080979     CMP   #$0001
            BEQ   L080981
            BRL   L080A1B
L080981     PEI   $F9
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $E6
            STX   $E8
            LDA   #$0048
            CLC
            ADC   $E6
            STA   $E6
            BCC   L0809A1
            INC   $E8
L0809A1     PLA
            CLC
            ADC   $E6
            STA   $E6
            BCC   L0809AB
            INC   $E8
L0809AB     PEI   $E8
            PEI   $E6
            JSL   L060E2F
            PLY
            PLY
            PLY
            PEI   $F9
            PEI   $FF
            JSL   L080643
            PLY
            PLY
            PEA   $0000
            PEA   $0010
            LDA   $FF
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $E6
            STX   $E8
            LDA   #$0058
            CLC
            ADC   $E6
            STA   $E6
            BCC   L0809E4
            INC   $E8
L0809E4     PLA
            CLC
            ADC   $E6
            STA   $E6
            BCC   L0809EE
            INC   $E8
L0809EE     PEI   $E8
            PEI   $E6
            PEI   $F3
            PEI   $F1
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEI   $FF
            JSL   L082F1F
            PLY
            STA   $E2
            LDA   $E2
            CMP   $FB
            BEQ   L080A1B
            PEI   $FB
            PEI   $FF
            JSL   L082FAF
            PLY
            PLY
L080A1B     JSL   L080000
            TDC
            CLC
            ADC   #$00E9
            TCS
            PLD
            RTL

L080A27     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E0
            TCS
            STZ   $F2
L080A34     LDA   $F2
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
            LDA   #$0048
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080A52
            INC   $F6
L080A52     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080A5C
            INC   $F6
L080A5C     LDA   [$F4]
            PHA
            JSL   L0B110B
            PLY
            CMP   $FF
            BEQ   L080A6C
            INC   $F2
            BRA   L080A34
L080A6C     LDA   $F2
            LDX   #$0000
            TAY
            BPL   L080A75
            DEX
L080A75     STX   $E8
            STA   $E6
            LDX   $E8
            LDA   $E6
            ASL
            TAX
            LDAL  L0E0046,X
            LDX   #$0000
            TAY
            BPL   L080A8A
            DEX
L080A8A     STX   $E4
            STA   $E2
            PEI   $F2
            PEI   $FD
            JSL   L082B21
            PLY
            PLY
            LDX   L0F002C
            LDA   L0F002A
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F4
            STX   $F6
            PLA
            LDY   #$0002
            STA   [$F4],Y
            LDX   L0F002C
            LDA   L0F002A
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            STA   $EE
            LDA   $F2
            SEC
            SBC   $EE
            BVS   L080AD7
            EOR   #$8000
L080AD7     BPL   L080ADC
            BRL   L080B6B
L080ADC     LDA   $F2
            CLC
            ADC   #$0001
            STA   $F0
            LDA   $EE
            SEC
            SBC   $F2
            LDX   #$0000
            TAY
            BPL   L080AF0
            DEX
L080AF0     PHX
            PHA
            LDX   #$0000
            LDA   #$0020
            SEC
            JSL   L0D166F
            PLA
            PLX
            STX   $EC
            STA   $EA
            PEI   $EC
            PEI   $EA
            LDA   $F2
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
            LDA   #$0048
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080B25
            INC   $F6
L080B25     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080B2F
            INC   $F6
L080B2F     PEI   $F6
            PEI   $F4
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
            LDA   #$0048
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080B51
            INC   $F6
L080B51     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080B5B
            INC   $F6
L080B5B     PEI   $F6
            PEI   $F4
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L080B6B     LDA   $EE
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
            LDA   #$0048
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080B89
            INC   $F6
L080B89     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080B93
            INC   $F6
L080B93     LDA   #$0000
            STA   [$F4]
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
            LDA   #$004A
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080BB6
            INC   $F6
L080BB6     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080BC0
            INC   $F6
L080BC0     LDA   #$0000
            STA   [$F4]
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080BE3
            INC   $F6
L080BE3     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080BED
            INC   $F6
L080BED     LDA   #$0000
            STA   [$F4]
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
            BCC   L080C10
            INC   $F6
L080C10     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080C1A
            INC   $F6
L080C1A     LDA   #$0000
            SEP   #$20
            STA   [$F4]
            REP   #$20
            STZ   $F2
            BRL   L080CC0
L080C28     LDA   $F2
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
            LDA   #$0048
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080C46
            INC   $F6
L080C46     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080C50
            INC   $F6
L080C50     LDA   [$F4]
            PHA
            JSL   L0B110B
            PLY
            SEC
            SBC   $FF
            BEQ   L080CBE
            BVS   L080C62
            EOR   #$8000
L080C62     BPL   L080CBE
            LDA   $F2
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
            LDA   #$0048
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080C82
            INC   $F6
L080C82     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080C8C
            INC   $F6
L080C8C     LDA   [$F4]
            SEC
            SBC   #$0001
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
            STA   $F4
            STX   $F6
            LDA   #$0048
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080CB1
            INC   $F6
L080CB1     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L080CBB
            INC   $F6
L080CBB     PLA
            STA   [$F4]
L080CBE     INC   $F2
L080CC0     LDA   $F2
            SEC
            SBC   $EE
            BVS   L080CCA
            EOR   #$8000
L080CCA     BMI   L080CCF
            BRL   L080C28
L080CCF     JSL   L080000
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0006
            LDA   [$F4],Y
            SEC
            SBC   #$0001
            BNE   L080CEB
            BRL   L080D5C
L080CEB     BVS   L080CF0
            EOR   #$8000
L080CF0     BMI   L080CF5
            BRL   L080D5C
L080CF5     LDA   #L0E0A9E
            LDX   #^L0E0A9E
            STX   L0F0034
            STA   L0F0032
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDA   #$0001
            LDY   #$0062
            STA   [$F4],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDX   $F6
            LDA   #$045C
            CLC
            ADC   $F4
            BCC   L080D28
            INX
L080D28     STX   L0F002C
            STA   L0F002A
            LDX   $E8
            LDA   $E6
            PHA
            JSL   L080D64
            PLY
            LDX   #$FFFF
            LDA   #$FFFF
            PHX
            PHA
            LDX   $E4
            LDA   $E2
            JSL   L0D157E
            BEQ   L080D58
            LDX   $E4
            LDA   $E2
            PHA
            PEA   $0001
            JSL   L081BC8
            PLY
            PLY
L080D58     JSL   L051AE7
L080D5C     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L080D64     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00E0
            TCS
            STZ   $E6
L080D71     LDA   $E6
            SEC
            SBC   #$0020
            BVS   L080D7C
            EOR   #$8000
L080D7C     BPL   L080D81
            BRL   L080F1D
L080D81     LDA   $E6
            ASL
            TAX
            LDAL  L0E0046,X
            CMP   #$FFFF
            BNE   L080D91
            BRL   L080F18
L080D91     PEA   $0000
            PEA   $0000
            LDA   $E6
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
            STX   $F4
            STA   $F2
            LDX   L0F00C1
            LDA   L0F00BF
            STA   $F6
            STX   $F8
            LDY   #$0004
            LDA   [$F6],Y
            LDX   #$0000
            TAY
            BPL   L080DCB
            DEX
L080DCB     PHX
            PHA
            LDX   $F4
            LDA   $F2
            JSL   L0D1573
            PLA
            PLX
            STX   $F4
            STA   $F2
            LDA   [$F2]
            AND   #$00FF
            SEC
            SBC   #$0030
            STA   $E4
            LDA   $E4
            SEC
            SBC   $FF
            BEQ   L080E07
            BVS   L080DF2
            EOR   #$8000
L080DF2     BPL   L080E07
            DEC   $E4
            LDA   [$F2]
            AND   #$00FF
            SEC
            SBC   #$0001
            PHA
            PLA
            SEP   #$20
            STA   [$F2]
            REP   #$20
L080E07     LDA   [$F2]
            AND   #$00FF
            SEC
            SBC   #$0030
            STA   $E4
            LDX   L0F00C1
            LDA   L0F00BF
            STX   $F0
            STA   $EE
            LDX   L0F00C1
            LDA   L0F00BF
            STA   $F6
            STX   $F8
            LDY   #$0008
            LDA   [$F6],Y
            LDX   #$0000
            PHX
            PHA
            LDX   $F0
            LDA   $EE
            JSL   L0D1573
            PLA
            PLX
            STX   $F0
            STA   $EE
            PEI   $F0
            PEI   $EE
            JSL   L0C04CD
            PLY
            PLY
            STA   $E2
            STZ   $EC
L080E4C     LDA   #$0001
            BNE   L080E54
            BRL   L080F18
L080E54     LDA   $EC
            SEC
            SBC   $E2
            BVS   L080E5E
            EOR   #$8000
L080E5E     BPL   L080E63
            BRL   L080F18
L080E63     LDA   [$EE]
            AND   #$00FF
            STA   $EA
            LDA   $EA
            CMP   #$007E
            BEQ   L080E73
            BRA   L080E96
L080E73     LDX   #$0000
            LDA   #$0002
            PHX
            PHA
            LDX   $F0
            LDA   $EE
            JSL   L0D1573
            PLA
            PLX
            STX   $F0
            STA   $EE
            LDA   $EC
            CLC
            ADC   #$0002
            STA   $EC
            BRL   L080F15
            BRA   L080E9D
L080E96     CMP   #$007F
            BEQ   L080E9D
            BRA   L080F13
L080E9D     INC   $EE
            BNE   L080EA3
            INC   $F0
L080EA3     LDA   [$EE]
            AND   #$00FF
            STA   $E8
            LDA   $E8
            SEC
            SBC   #$0030
            STA   $E8
            LDA   $E8
            SEC
            SBC   $FF
            BEQ   L080ED1
            BVS   L080EBE
            EOR   #$8000
L080EBE     BPL   L080ED1
            LDA   [$EE]
            AND   #$00FF
            SEC
            SBC   #$0001
            PHA
            PLA
            SEP   #$20
            STA   [$EE]
            REP   #$20
L080ED1     INC   $EE
            BNE   L080ED7
            INC   $F0
L080ED7     LDA   $EC
            CLC
            ADC   #$0002
            STA   $EC
            BRA   L080F15
L080EE1     LDA   $EA
            CLC
            ADC   #$0001
            LDX   #$0000
            TAY
            BPL   L080EEE
            DEX
L080EEE     PHX
            PHA
            LDX   $F0
            LDA   $EE
            JSL   L0D1573
            PLA
            PLX
            STX   $F0
            STA   $EE
            LDA   $EA
            CLC
            ADC   #$0001
            PHA
            LDA   $EC
            PLX
            STX   $F6
            CLC
            ADC   $F6
            STA   $EC
            BRA   L080F15
            BRA   L080F15
L080F13     BRA   L080EE1
L080F15     BRL   L080E4C
L080F18     INC   $E6
            BRL   L080D71
L080F1D     TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L080F25     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00C6
            TCS
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L080F39
            DEX
L080F39     PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDY   #$000A
            LDA   [$F0],Y
            TAX
            LDY   #$0008
            LDA   [$F0],Y
            JSL   L0D1573
            PLA
            PLX
            CLC
            ADC   #$0008
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $EE
            STA   $EC
            LDX   L0F0028
            LDA   L0F0026
            PHX
            PHA
            LDX   $EE
            LDA   $EC
            JSL   L0D157E
            BVS   L080F7A
            EOR   #$8000
L080F7A     BMI   L080F8A
            PEA   $FFFF
            JSL   L0617E1
            PLY
            LDA   #$FFFF
            BRL   L08150C
L080F8A     LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDY   #$000E
            LDA   [$F0],Y
            TAX
            LDY   #$000C
            LDA   [$F0],Y
            PHX
            PHA
            LDX   #$0000
            LDA   #$0004
            SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDY   #$0006
            LDA   [$F0],Y
            LDX   #$0000
            TAY
            BPL   L080FC6
            DEX
L080FC6     PHX
            PHA
            LDX   #$0000
            LDA   #$0448
            SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   #$0000
            LDA   #$0014
            JSL   L0D1573
            PLA
            PLX
            JSL   L0D1573
            PLA
            PLX
            STX   $DA
            STA   $D8
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDY   #$0012
            LDA   [$F0],Y
            TAX
            LDY   #$0010
            LDA   [$F0],Y
            CLC
            ADC   $D8
            PHA
            TXA
            ADC   $DA
            TAX
            PLA
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDY   #$000A
            LDA   [$F0],Y
            TAX
            LDY   #$0008
            LDA   [$F0],Y
            JSL   L0D1705
            PLA
            PLX
            STX   $DE
            STA   $DC
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L081035
            DEX
L081035     CLC
            ADC   #$0008
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDY   #$000A
            LDA   [$F0],Y
            TAX
            LDY   #$0008
            LDA   [$F0],Y
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            PLA
            PLX
            LDY   #$000A
            PHA
            TXA
            STA   [$F0],Y
            PLA
            LDY   #$0008
            STA   [$F0],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDY   #$000E
            LDA   [$F0],Y
            TAX
            LDY   #$000C
            LDA   [$F0],Y
            CLC
            ADC   #$0001
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            PLA
            PLX
            LDY   #$000E
            PHA
            TXA
            STA   [$F0],Y
            PLA
            LDY   #$000C
            STA   [$F0],Y
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L0810BC
            DEX
L0810BC     PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDY   #$0012
            LDA   [$F0],Y
            TAX
            LDY   #$0010
            LDA   [$F0],Y
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            PLA
            PLX
            LDY   #$0012
            PHA
            TXA
            STA   [$F0],Y
            PLA
            LDY   #$0010
            STA   [$F0],Y
            LDA   $F9
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDA   #$0014
            CLC
            ADC   $F0
            STA   $F0
            BCC   L081117
            INC   $F2
L081117     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L081121
            INC   $F2
L081121     LDA   $F0
            LDX   $F2
            STX   $D2
            STA   $D0
            LDA   [$D0]
            CLC
            ADC   #$0001
            PHA
            PLA
            STA   [$D0]
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L08113C
            DEX
L08113C     PHX
            PHA
            LDY   #$0006
            LDA   [$D0],Y
            TAX
            LDY   #$0004
            LDA   [$D0],Y
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            PLA
            PLX
            LDY   #$0006
            PHA
            TXA
            STA   [$D0],Y
            PLA
            LDY   #$0004
            STA   [$D0],Y
            LDX   L0F000C
            LDA   L0F000A
            STX   $EA
            STA   $E8
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDY   #$0012
            LDA   [$F0],Y
            TAX
            LDY   #$0010
            LDA   [$F0],Y
            PHX
            PHA
            LDX   L0F0028
            LDA   L0F0026
            JSL   L0D1705
            PLA
            PLX
            PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L0D1573
            PLA
            PLX
            STX   $EA
            STA   $E8
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L0811A6
            DEX
L0811A6     PHX
            PHA
            PEI   $EA
            PEI   $E8
            PEI   $FD
            PEI   $FB
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   L0F000C
            LDA   L0F000A
            STX   $E6
            STA   $E4
            LDX   $DA
            LDA   $D8
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L0D1573
            PLA
            PLX
            STX   $E6
            STA   $E4
            LDX   L0F000C
            LDA   L0F000A
            STX   $EA
            STA   $E8
            LDX   $DA
            LDA   $D8
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L0D1573
            PLA
            PLX
            STX   $EA
            STA   $E8
            PEI   $DE
            PEI   $DC
            PEI   $EA
            PEI   $E8
            PEI   $E6
            PEI   $E4
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDY   #$000E
            LDA   [$F0],Y
            TAX
            LDY   #$000C
            LDA   [$F0],Y
            STA   $C8
            LDA   $C8
            SEC
            SBC   #$0001
            STA   $C8
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDY   #$0012
            LDA   [$F0],Y
            TAX
            LDY   #$0010
            LDA   [$F0],Y
            PHX
            PHA
            LDA   $C8
            ASL
            ASL
            PHA
            LDX   L0F003C
            LDA   L0F003A
            STA   $F0
            STX   $F2
            PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L08126A
            INC   $F2
L08126A     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$F0],Y
            PLA
            STA   [$F0]
            LDX   $DA
            LDA   $D8
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            STX   $DA
            STA   $D8
            LDX   $DA
            LDA   $D8
            STX   $E2
            STA   $E0
            STZ   $CE
L081293     LDA   $CE
            SEC
            SBC   $F9
            BEQ   L0812A4
            BVS   L08129F
            EOR   #$8000
L08129F     BPL   L0812A4
            BRL   L081325
L0812A4     LDA   $CE
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDA   #$0014
            CLC
            ADC   $F0
            STA   $F0
            BCC   L0812C7
            INC   $F2
L0812C7     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L0812D1
            INC   $F2
L0812D1     LDA   $F0
            LDX   $F2
            STX   $D2
            STA   $D0
            LDX   #$0000
            LDA   #$0004
            PHX
            PHA
            LDA   [$D0]
            LDX   #$0000
            TAY
            BPL   L0812EA
            DEX
L0812EA     SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L0D1573
            PLA
            PLX
            STX   $E2
            STA   $E0
            LDA   $CE
            CMP   $F9
            BNE   L08131A
            LDX   $E2
            LDA   $E0
            SEC
            SBC   #$0004
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STX   $E2
            STA   $E0
L08131A     LDA   $CE
            CLC
            ADC   #$0001
            STA   $CE
            BRL   L081293
L081325     LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDY   #$0006
            LDA   [$F0],Y
            SEC
            SBC   #$0001
            SEC
            SBC   $F9
            BNE   L081340
            BRL   L0813C3
L081340     BVS   L081345
            EOR   #$8000
L081345     BPL   L0813C3
            LDX   $E2
            LDA   $E0
            SEC
            SBC   $D8
            PHA
            TXA
            SBC   $DA
            TAX
            PLA
            PHX
            PHA
            LDX   $DE
            LDA   $DC
            JSL   L0D1705
            PLA
            PLX
            STX   $D6
            STA   $D4
            LDX   L0F000C
            LDA   L0F000A
            STX   $E6
            STA   $E4
            LDX   $E2
            LDA   $E0
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L0D1573
            PLA
            PLX
            STX   $E6
            STA   $E4
            LDX   L0F000C
            LDA   L0F000A
            STX   $EA
            STA   $E8
            LDX   $E2
            LDA   $E0
            CLC
            ADC   #$0004
            PHA
            TXA
            ADC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L0D1573
            PLA
            PLX
            STX   $EA
            STA   $E8
            PEI   $D6
            PEI   $D4
            PEI   $EA
            PEI   $E8
            PEI   $E6
            PEI   $E4
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L0813C3     LDX   #$0000
            LDA   #$0004
            PHX
            PHA
            LDA   [$D0]
            SEC
            SBC   #$0001
            LDX   #$0000
            TAY
            BPL   L0813D8
            DEX
L0813D8     SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L0D1705
            PLA
            PLX
            STX   $E2
            STA   $E0
            LDX   L0F000C
            LDA   L0F000A
            STX   $E6
            STA   $E4
            LDX   $E2
            LDA   $E0
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L0D1573
            PLA
            PLX
            STX   $E6
            STA   $E4
            LDX   $E6
            LDA   $E4
            STX   $CC
            STA   $CA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDY   #$000E
            LDA   [$F0],Y
            TAX
            LDY   #$000C
            LDA   [$F0],Y
            SEC
            SBC   #$0001
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            PHA
            LDA   [$D0]
            SEC
            SBC   #$0001
            ASL
            ASL
            PHA
            LDA   $CA
            STA   $F0
            LDA   $CC
            STA   $F2
            PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L081451
            INC   $F2
L081451     PLA
            STA   [$F0]
            LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            LDY   #$0062
            LDA   [$F0],Y
            BEQ   L081484
            LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            LDY   #$0060
            LDA   [$F0],Y
            SEC
            SBC   #$0000
            BNE   L08147D
            BRL   L0814F7
L08147D     BVS   L081482
            EOR   #$8000
L081482     BPL   L0814F7
L081484     LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDY   #$000E
            LDA   [$F0],Y
            TAX
            LDY   #$000C
            LDA   [$F0],Y
            SEC
            SBC   #$0001
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            LDY   #$0060
            LDA   [$F0],Y
            ASL
            ASL
            PHA
            LDA   $CA
            CLC
            ADC   #$0002
            STA   $F0
            LDA   $CC
            BCC   L0814C4
            INC
L0814C4     STA   $F2
            PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L0814D0
            INC   $F2
L0814D0     PLA
            STA   [$F0]
            LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            LDY   #$0060
            LDA   [$F0],Y
            CLC
            ADC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            PLA
            LDY   #$0060
            STA   [$F0],Y
L0814F7     LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            LDA   #$0001
            LDY   #$000C
            STA   [$F0],Y
            LDA   #$0000
L08150C     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L081516     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00E6
            TCS
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDY   #$000E
            LDA   [$F6],Y
            TAX
            LDY   #$000C
            LDA   [$F6],Y
            PHX
            PHA
            LDX   #$0000
            LDA   #$0004
            SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDY   #$0006
            LDA   [$F6],Y
            PHA
            LDA   #$0448
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDA   #$0014
            PLX
            STX   $F6
            CLC
            ADC   $F6
            LDX   #$0000
            TAY
            BPL   L081571
            DEX
L081571     JSL   L0D1573
            PLA
            PLX
            STX   $F4
            STA   $F2
            STZ   $E8
L08157D     LDA   $E8
            SEC
            SBC   $FF
            BVS   L081587
            EOR   #$8000
L081587     BMI   L0815EA
            LDA   $E8
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDA   #$0014
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0815AC
            INC   $F8
L0815AC     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0815B6
            INC   $F8
L0815B6     LDA   $F6
            LDX   $F8
            STX   $F0
            STA   $EE
            LDX   #$0000
            LDA   #$0004
            PHX
            PHA
            LDA   [$EE]
            LDX   #$0000
            TAY
            BPL   L0815CF
            DEX
L0815CF     SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   $F4
            LDA   $F2
            JSL   L0D1573
            PLA
            PLX
            STX   $F4
            STA   $F2
            INC   $E8
            BRA   L08157D
L0815EA     LDX   L0F000C
            LDA   L0F000A
            STX   $EC
            STA   $EA
            LDX   $F4
            LDA   $F2
            PHX
            PHA
            LDX   $EC
            LDA   $EA
            JSL   L0D1573
            PLA
            PLX
            STX   $EC
            STA   $EA
            LDX   $EC
            LDA   $EA
            STX   L0F0040
            STA   L0F003E
            LDX   $F4
            LDA   $F2
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L081620     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00D8
            TCS
            LDA   $F9
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F0
            STX   $F2
            LDA   #$0014
            CLC
            ADC   $F0
            STA   $F0
            BCC   L08164E
            INC   $F2
L08164E     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L081658
            INC   $F2
L081658     LDA   $F0
            LDX   $F2
            STX   $EE
            STA   $EC
            LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            LDY   #$0062
            LDA   [$F0],Y
            BEQ   L081677
            LDA   [$EC]
            STA   $DE
            BRA   L081688
L081677     LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            LDY   #$0060
            LDA   [$F0],Y
            STA   $DE
L081688     LDA   $FB
            SEC
            SBC   $DE
            BVS   L081692
            EOR   #$8000
L081692     BPL   L08169A
            LDA   #$FFFE
            BRL   L0817CF
L08169A     PEI   $F9
            JSL   L081516
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            LDY   #$0062
            LDA   [$F0],Y
            BEQ   L0816D1
            LDA   $FB
            ASL
            ASL
            PHA
            LDX   L0F0040
            LDA   L0F003E
            STA   $F0
            STX   $F2
            PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L0816CB
            INC   $F2
L0816CB     LDA   [$F0]
            STA   $E0
            BRA   L0816FA
L0816D1     LDA   $FB
            ASL
            ASL
            PHA
            LDX   L0F0040
            LDA   L0F003E
            STA   $F0
            STX   $F2
            LDA   #$0002
            CLC
            ADC   $F0
            STA   $F0
            BCC   L0816EC
            INC   $F2
L0816EC     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L0816F6
            INC   $F2
L0816F6     LDA   [$F0]
            STA   $E0
L0816FA     LDA   $E0
            ASL
            ASL
            PHA
            LDX   L0F003C
            LDA   L0F003A
            STA   $F0
            STX   $F2
            PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L081713
            INC   $F2
L081713     LDY   #$0002
            LDA   [$F0],Y
            TAX
            LDA   [$F0]
            STX   $EA
            STA   $E8
            LDX   L0F000C
            LDA   L0F000A
            STX   $E4
            STA   $E2
            LDX   L0F0028
            LDA   L0F0026
            SEC
            SBC   $E8
            PHA
            TXA
            SBC   $EA
            TAX
            PLA
            PHX
            PHA
            LDX   $E4
            LDA   $E2
            JSL   L0D1573
            PLA
            PLX
            STX   $E4
            STA   $E2
            PEA   $0000
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            PEI   $E4
            PEI   $E2
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L0D157E
            BEQ   L0817C3
            PEI   $E4
            PEI   $E2
            PEA   $0000
            PEA   $0000
            PEA   $FFFF
            LDY   #$0002
            LDA   [$EC],Y
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
            STX   $DC
            STA   $DA
            LDA   [$DA]
            LDX   #$0000
            TAY
            BPL   L0817AB
            DEX
L0817AB     PHX
            PHA
            PEI   $FF
            PEI   $FD
            PEI   $DC
            PEI   $DA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRA   L0817CD
L0817C3     LDX   $E4
            LDA   $E2
            STX   L0F00C1
            STA   L0F00BF
L0817CD     LDA   $E0
L0817CF     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L0817D9     ENT
            PHD
            TSC
            SEC
            SBC   #$00F1
            TCD
            ADC   #$00CA
            TCS
            LDA   $F7
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $EE
            STX   $F0
            LDA   #$0014
            CLC
            ADC   $EE
            STA   $EE
            BCC   L081807
            INC   $F0
L081807     PLA
            CLC
            ADC   $EE
            STA   $EE
            BCC   L081811
            INC   $F0
L081811     LDA   $EE
            LDX   $F0
            STX   $EC
            STA   $EA
            LDA   [$EA]
            SEC
            SBC   $FF
            BEQ   L081827
            BVS   L081825
            EOR   #$8000
L081825     BMI   L08182D
L081827     LDA   #$FFFE
            BRL   L081BBE
L08182D     PEI   $F7
            JSL   L081516
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $EE
            STX   $F0
            LDY   #$0062
            LDA   [$EE],Y
            BEQ   L081864
            LDA   $FF
            ASL
            ASL
            PHA
            LDX   L0F0040
            LDA   L0F003E
            STA   $EE
            STX   $F0
            PLA
            CLC
            ADC   $EE
            STA   $EE
            BCC   L08185E
            INC   $F0
L08185E     LDA   [$EE]
            STA   $D6
            BRA   L08188D
L081864     LDA   $FF
            ASL
            ASL
            PHA
            LDX   L0F0040
            LDA   L0F003E
            STA   $EE
            STX   $F0
            LDA   #$0002
            CLC
            ADC   $EE
            STA   $EE
            BCC   L08187F
            INC   $F0
L08187F     PLA
            CLC
            ADC   $EE
            STA   $EE
            BCC   L081889
            INC   $F0
L081889     LDA   [$EE]
            STA   $D6
L08188D     LDA   $D6
            ASL
            ASL
            PHA
            LDX   L0F003C
            LDA   L0F003A
            STA   $EE
            STX   $F0
            PLA
            CLC
            ADC   $EE
            STA   $EE
            BCC   L0818A6
            INC   $F0
L0818A6     LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            STX   $E4
            STA   $E2
            LDX   L0F000C
            LDA   L0F000A
            STX   $DE
            STA   $DC
            LDX   L0F0028
            LDA   L0F0026
            SEC
            SBC   $E2
            PHA
            TXA
            SBC   $E4
            TAX
            PLA
            PHX
            PHA
            LDX   $DE
            LDA   $DC
            JSL   L0D1573
            PLA
            PLX
            STX   $DE
            STA   $DC
            PEA   $0000
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEI   $DE
            PEI   $DC
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $FD
            CMP   $E0
            BNE   L081925
            LDA   $E0
            LDX   #$0000
            TAY
            BPL   L081909
            DEX
L081909     PHX
            PHA
            PEI   $DE
            PEI   $DC
            PEI   $FB
            PEI   $F9
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$0000
            BRL   L081BBE
L081925     LDA   $FD
            SEC
            SBC   $E0
            BNE   L08192F
            BRL   L081996
L08192F     BVS   L081934
            EOR   #$8000
L081934     BPL   L081996
            LDA   $E0
            LDX   #$0000
            TAY
            BPL   L08193F
            DEX
L08193F     PHX
            PHA
            LDA   $FD
            LDX   #$0000
            TAY
            BPL   L08194A
            DEX
L08194A     PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $EE
            STX   $F0
            LDY   #$000A
            LDA   [$EE],Y
            TAX
            LDY   #$0008
            LDA   [$EE],Y
            JSL   L0D1573
            PLA
            PLX
            JSL   L0D1705
            PLA
            PLX
            STX   $E8
            STA   $E6
            LDX   L0F0028
            LDA   L0F0026
            PHX
            PHA
            LDX   $E8
            LDA   $E6
            JSL   L0D157E
            BVS   L081986
            EOR   #$8000
L081986     BMI   L081996
            PEA   $FFFF
            JSL   L0617E1
            PLY
            LDA   #$FFFF
            BRL   L081BBE
L081996     LDA   $E0
            SEC
            SBC   $FD
            LDX   #$0000
            TAY
            BPL   L0819A2
            DEX
L0819A2     STX   $CE
            STA   $CC
            LDX   L0F000C
            LDA   L0F000A
            STA   $EE
            STX   $F0
            LDY   #$0012
            LDA   [$EE],Y
            TAX
            LDY   #$0010
            LDA   [$EE],Y
            SEC
            SBC   $E2
            PHA
            TXA
            SBC   $E4
            TAX
            PLA
            STX   $D2
            STA   $D0
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $D2
            LDA   $D0
            JSL   L0D157E
            BVS   L0819DD
            EOR   #$8000
L0819DD     BPL   L0819E2
            BRL   L081A53
L0819E2     LDX   L0F000C
            LDA   L0F000A
            STX   $DE
            STA   $DC
            LDX   L0F000C
            LDA   L0F000A
            STA   $EE
            STX   $F0
            LDY   #$0012
            LDA   [$EE],Y
            TAX
            LDY   #$0010
            LDA   [$EE],Y
            PHX
            PHA
            LDX   L0F0028
            LDA   L0F0026
            JSL   L0D1705
            PLA
            PLX
            PHX
            PHA
            LDX   $DE
            LDA   $DC
            JSL   L0D1573
            PLA
            PLX
            STX   $DE
            STA   $DC
            LDX   $DE
            LDA   $DC
            STX   $DA
            STA   $D8
            LDX   $CE
            LDA   $CC
            PHX
            PHA
            LDX   $DA
            LDA   $D8
            JSL   L0D1573
            PLA
            PLX
            STX   $DA
            STA   $D8
            PEI   $D2
            PEI   $D0
            PEI   $DA
            PEI   $D8
            PEI   $DE
            PEI   $DC
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L081A53     LDX   L0F000C
            LDA   L0F000A
            STX   $DA
            STA   $D8
            LDX   L0F0028
            LDA   L0F0026
            SEC
            SBC   $E2
            PHA
            TXA
            SBC   $E4
            TAX
            PLA
            CLC
            ADC   $CC
            PHA
            TXA
            ADC   $CE
            TAX
            PLA
            PHX
            PHA
            LDX   $DA
            LDA   $D8
            JSL   L0D1573
            PLA
            PLX
            STX   $DA
            STA   $D8
            LDA   $FD
            LDX   #$0000
            TAY
            BPL   L081A8E
            DEX
L081A8E     PHX
            PHA
            PEI   $DA
            PEI   $D8
            PEI   $FB
            PEI   $F9
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $D6
            STA   $D4
L081AA8     LDX   L0F000C
            LDA   L0F000A
            STA   $EE
            STX   $F0
            LDY   #$000E
            LDA   [$EE],Y
            TAX
            LDY   #$000C
            LDA   [$EE],Y
            SEC
            SBC   $D4
            BEQ   L081B24
            BVS   L081AC7
            EOR   #$8000
L081AC7     BPL   L081B24
            LDA   $D4
            ASL
            ASL
            PHA
            LDX   L0F003C
            LDA   L0F003A
            STA   $EE
            STX   $F0
            PLA
            CLC
            ADC   $EE
            STA   $EE
            BCC   L081AE2
            INC   $F0
L081AE2     LDY   #$0002
            LDA   [$EE],Y
            TAX
            LDA   [$EE]
            SEC
            SBC   $CC
            PHA
            TXA
            SBC   $CE
            TAX
            PLA
            PHX
            PHA
            LDA   $D4
            ASL
            ASL
            PHA
            LDX   L0F003C
            LDA   L0F003A
            STA   $EE
            STX   $F0
            PLA
            CLC
            ADC   $EE
            STA   $EE
            BCC   L081B0E
            INC   $F0
L081B0E     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$EE],Y
            PLA
            STA   [$EE]
            LDA   $D4
            CLC
            ADC   #$0001
            STA   $D4
            BRA   L081AA8
L081B24     LDX   L0F000C
            LDA   L0F000A
            STA   $EE
            STX   $F0
            LDY   #$000A
            LDA   [$EE],Y
            TAX
            LDY   #$0008
            LDA   [$EE],Y
            SEC
            SBC   $CC
            PHA
            TXA
            SBC   $CE
            TAX
            PLA
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $EE
            STX   $F0
            PLA
            PLX
            LDY   #$000A
            PHA
            TXA
            STA   [$EE],Y
            PLA
            LDY   #$0008
            STA   [$EE],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $EE
            STX   $F0
            LDY   #$0012
            LDA   [$EE],Y
            TAX
            LDY   #$0010
            LDA   [$EE],Y
            SEC
            SBC   $CC
            PHA
            TXA
            SBC   $CE
            TAX
            PLA
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $EE
            STX   $F0
            PLA
            PLX
            LDY   #$0012
            PHA
            TXA
            STA   [$EE],Y
            PLA
            LDY   #$0010
            STA   [$EE],Y
            LDY   #$0006
            LDA   [$EA],Y
            TAX
            LDY   #$0004
            LDA   [$EA],Y
            SEC
            SBC   $CC
            PHA
            TXA
            SBC   $CE
            TAX
            PLA
            PHX
            PHA
            PLA
            PLX
            LDY   #$0006
            PHA
            TXA
            STA   [$EA],Y
            PLA
            LDY   #$0004
            STA   [$EA],Y
            LDA   #$0000
L081BBE     TAY
            TDC
            CLC
            ADC   #$00F1
            TCS
            TYA
            PLD
            RTL

L081BC8     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00CA
            TCS
            LDA   $FD
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDA   #$0014
            CLC
            ADC   $F4
            STA   $F4
            BCC   L081BF6
            INC   $F6
L081BF6     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L081C00
            INC   $F6
L081C00     LDA   $F4
            LDX   $F6
            STX   $F2
            STA   $F0
            LDA   [$F0]
            SEC
            SBC   $FF
            BEQ   L081C16
            BVS   L081C14
            EOR   #$8000
L081C14     BMI   L081C1C
L081C16     LDA   #$FFFE
            BRL   L0825E4
L081C1C     LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$000E
            LDA   [$F4],Y
            TAX
            LDY   #$000C
            LDA   [$F4],Y
            PHX
            PHA
            LDX   #$0000
            LDA   #$0004
            SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0006
            LDA   [$F4],Y
            LDX   #$0000
            TAY
            BPL   L081C58
            DEX
L081C58     PHX
            PHA
            LDX   #$0000
            LDA   #$0448
            SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   #$0000
            LDA   #$0014
            JSL   L0D1573
            PLA
            PLX
            JSL   L0D1573
            PLA
            PLX
            STX   $D6
            STA   $D4
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0012
            LDA   [$F4],Y
            TAX
            LDY   #$0010
            LDA   [$F4],Y
            CLC
            ADC   $D4
            PHA
            TXA
            ADC   $D6
            TAX
            PLA
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$000A
            LDA   [$F4],Y
            TAX
            LDY   #$0008
            LDA   [$F4],Y
            JSL   L0D1705
            PLA
            PLX
            STX   $D2
            STA   $D0
            PEI   $FD
            JSL   L081516
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0062
            LDA   [$F4],Y
            BEQ   L081CF5
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
            BCC   L081CEF
            INC   $F6
L081CEF     LDA   [$F4]
            STA   $DE
            BRA   L081D1E
L081CF5     LDA   $FF
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
            BCC   L081D10
            INC   $F6
L081D10     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L081D1A
            INC   $F6
L081D1A     LDA   [$F4]
            STA   $DE
L081D1E     LDA   #$FFFF
            STA   $E8
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0062
            LDA   [$F4],Y
            BNE   L081D6A
            LDA   $FF
            STA   $E8
            STZ   $DC
L081D3A     LDA   $DC
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
            BCC   L081D53
            INC   $F6
L081D53     LDA   [$F4]
            CMP   $DE
            BEQ   L081D63
            LDA   $DC
            CLC
            ADC   #$0001
            STA   $DC
            BRA   L081D3A
L081D63     LDA   $DC
            STA   $FF
            BRL   L081DD8
L081D6A     LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0060
            LDA   [$F4],Y
            SEC
            SBC   #$0000
            BEQ   L081DD8
            BVS   L081D84
            EOR   #$8000
L081D84     BPL   L081DD8
            STZ   $D8
            BRA   L081DBD
L081D8A     LDA   $D8
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
            BCC   L081DA5
            INC   $F6
L081DA5     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L081DAF
            INC   $F6
L081DAF     LDA   [$F4]
            CMP   $DE
            BNE   L081DBB
            LDA   $D8
            STA   $E8
            BRA   L081DD8
L081DBB     INC   $D8
L081DBD     LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0060
            LDA   [$F4],Y
            SEC
            SBC   $D8
            BEQ   L081DD8
            BVS   L081DD6
            EOR   #$8000
L081DD6     BMI   L081D8A
L081DD8     LDA   $FF
            STA   $D8
L081DDC     LDA   [$F0]
            SEC
            SBC   #$0001
            SEC
            SBC   $D8
            BEQ   L081E34
            BVS   L081DEC
            EOR   #$8000
L081DEC     BPL   L081E34
            LDA   $D8
            CLC
            ADC   #$0001
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
            BCC   L081E0B
            INC   $F6
L081E0B     LDA   [$F4]
            PHA
            LDA   $D8
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
            BCC   L081E27
            INC   $F6
L081E27     PLA
            STA   [$F4]
            LDA   $D8
            CLC
            ADC   #$0001
            STA   $D8
            BRA   L081DDC
L081E34     LDA   $E8
            CMP   #$FFFF
            BNE   L081E3E
            BRL   L081EDF
L081E3E     LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0060
            LDA   [$F4],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            PLA
            LDY   #$0060
            STA   [$F4],Y
            LDA   $E8
            STA   $D8
L081E66     LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$0060
            LDA   [$F4],Y
            SEC
            SBC   $D8
            BEQ   L081EDF
            BVS   L081E7F
            EOR   #$8000
L081E7F     BPL   L081EDF
            LDA   $D8
            CLC
            ADC   #$0001
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
            BCC   L081EA0
            INC   $F6
L081EA0     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L081EAA
            INC   $F6
L081EAA     LDA   [$F4]
            PHA
            LDA   $D8
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
            BCC   L081EC8
            INC   $F6
L081EC8     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L081ED2
            INC   $F6
L081ED2     PLA
            STA   [$F4]
            LDA   $D8
            CLC
            ADC   #$0001
            STA   $D8
            BRA   L081E66
L081EDF     LDA   $DE
            ASL
            ASL
            PHA
            LDX   L0F003C
            LDA   L0F003A
            STA   $F4
            STX   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L081EF8
            INC   $F6
L081EF8     LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STX   $EE
            STA   $EC
            LDX   L0F000C
            LDA   L0F000A
            STX   $E6
            STA   $E4
            LDX   L0F0028
            LDA   L0F0026
            SEC
            SBC   $EC
            PHA
            TXA
            SBC   $EE
            TAX
            PLA
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L0D1573
            PLA
            PLX
            STX   $E6
            STA   $E4
            PEA   $0000
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            PEI   $E6
            PEI   $E4
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0012
            LDA   [$F4],Y
            TAX
            LDY   #$0010
            LDA   [$F4],Y
            PHX
            PHA
            LDX   $EE
            LDA   $EC
            JSL   L0D157E
            BNE   L081F70
            BRL   L082012
L081F70     BVS   L081F75
            EOR   #$8000
L081F75     BMI   L081F7A
            BRL   L082012
L081F7A     LDX   L0F000C
            LDA   L0F000A
            STX   $E6
            STA   $E4
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0012
            LDA   [$F4],Y
            TAX
            LDY   #$0010
            LDA   [$F4],Y
            PHX
            PHA
            LDX   L0F0028
            LDA   L0F0026
            JSL   L0D1705
            PLA
            PLX
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L0D1573
            PLA
            PLX
            STX   $E6
            STA   $E4
            LDX   $E6
            LDA   $E4
            STX   $E2
            STA   $E0
            LDA   $EA
            LDX   #$0000
            TAY
            BPL   L081FC8
            DEX
L081FC8     PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L0D1573
            PLA
            PLX
            STX   $E2
            STA   $E0
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0012
            LDA   [$F4],Y
            TAX
            LDY   #$0010
            LDA   [$F4],Y
            SEC
            SBC   $EC
            PHA
            TXA
            SBC   $EE
            TAX
            PLA
            STX   $CE
            STA   $CC
            PEI   $CE
            PEI   $CC
            PEI   $E2
            PEI   $E0
            PEI   $E6
            PEI   $E4
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L082012     LDX   #$0000
            LDA   #$0004
            STX   $CE
            STA   $CC
            LDA   $FD
            CLC
            ADC   #$0001
            STA   $DA
L082024     LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0006
            LDA   [$F4],Y
            SEC
            SBC   $DA
            BEQ   L0820A7
            BVS   L08203D
            EOR   #$8000
L08203D     BPL   L0820A7
            LDA   $DA
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDA   #$0014
            CLC
            ADC   $F4
            STA   $F4
            BCC   L082062
            INC   $F6
L082062     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08206C
            INC   $F6
L08206C     LDA   $F4
            LDX   $F6
            STX   $F2
            STA   $F0
            LDX   #$0000
            LDA   #$0004
            PHX
            PHA
            LDA   [$F0]
            LDX   #$0000
            TAY
            BPL   L082085
            DEX
L082085     SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   $CE
            LDA   $CC
            JSL   L0D1573
            PLA
            PLX
            STX   $CE
            STA   $CC
            LDA   $DA
            CLC
            ADC   #$0001
            STA   $DA
            BRL   L082024
L0820A7     LDA   $FD
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDA   #$0014
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0820CA
            INC   $F6
L0820CA     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0820D4
            INC   $F6
L0820D4     LDA   $F4
            LDX   $F6
            STX   $F2
            STA   $F0
            LDA   [$F0]
            SEC
            SBC   #$0001
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
            BCC   L0820F9
            INC   $F6
L0820F9     LDA   $F4
            LDX   $F6
            STX   $E2
            STA   $E0
            LDX   $E2
            LDA   $E0
            STX   $E6
            STA   $E4
            LDX   #$0000
            LDA   #$0004
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L0D1573
            PLA
            PLX
            STX   $E6
            STA   $E4
            PEI   $CE
            PEI   $CC
            PEI   $E2
            PEI   $E0
            PEI   $E6
            PEI   $E4
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   $D2
            LDA   $D0
            SEC
            SBC   #$0004
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STX   $CE
            STA   $CC
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$000E
            LDA   [$F4],Y
            TAX
            LDY   #$000C
            LDA   [$F4],Y
            SEC
            SBC   #$0001
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            SEC
            SBC   $DE
            BEQ   L0821C6
            BVS   L082174
            EOR   #$8000
L082174     BPL   L0821C6
            LDA   $DE
            LDX   #$0000
            TAY
            BPL   L08217F
            DEX
L08217F     PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$000E
            LDA   [$F4],Y
            TAX
            LDY   #$000C
            LDA   [$F4],Y
            SEC
            SBC   #$0001
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            JSL   L0D1705
            PLA
            PLX
            PHX
            PHA
            LDX   #$0000
            LDA   #$0004
            SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   $CE
            LDA   $CC
            JSL   L0D1573
            PLA
            PLX
            STX   $CE
            STA   $CC
L0821C6     LDA   $FD
            CLC
            ADC   #$0001
            STA   $DA
L0821CE     LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0006
            LDA   [$F4],Y
            SEC
            SBC   $DA
            BEQ   L082251
            BVS   L0821E7
            EOR   #$8000
L0821E7     BPL   L082251
            LDA   $DA
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDA   #$0014
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08220C
            INC   $F6
L08220C     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L082216
            INC   $F6
L082216     LDA   $F4
            LDX   $F6
            STX   $F2
            STA   $F0
            LDX   #$0000
            LDA   #$0004
            PHX
            PHA
            LDA   [$F0]
            LDX   #$0000
            TAY
            BPL   L08222F
            DEX
L08222F     SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   $CE
            LDA   $CC
            JSL   L0D1573
            PLA
            PLX
            STX   $CE
            STA   $CC
            LDA   $DA
            CLC
            ADC   #$0001
            STA   $DA
            BRL   L0821CE
L082251     LDA   $FD
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDA   #$0014
            CLC
            ADC   $F4
            STA   $F4
            BCC   L082274
            INC   $F6
L082274     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08227E
            INC   $F6
L08227E     LDA   $F4
            LDX   $F6
            STX   $F2
            STA   $F0
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $CE
            LDA   $CC
            JSL   L0D157E
            BVS   L08229B
            EOR   #$8000
L08229B     BMI   L0822F4
            LDA   $DE
            ASL
            ASL
            PHA
            LDX   L0F003C
            LDA   L0F003A
            STA   $F4
            STX   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0822B6
            INC   $F6
L0822B6     LDA   $F4
            LDX   $F6
            STX   $E2
            STA   $E0
            LDX   $E2
            LDA   $E0
            STX   $E6
            STA   $E4
            LDX   #$0000
            LDA   #$0004
            PHX
            PHA
            LDX   $E6
            LDA   $E4
            JSL   L0D1573
            PLA
            PLX
            STX   $E6
            STA   $E4
            PEI   $CE
            PEI   $CC
            PEI   $E2
            PEI   $E0
            PEI   $E6
            PEI   $E4
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L0822F4     LDA   $EA
            CLC
            ADC   #$0008
            LDX   #$0000
            TAY
            BPL   L082301
            DEX
L082301     PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$000A
            LDA   [$F4],Y
            TAX
            LDY   #$0008
            LDA   [$F4],Y
            JSL   L0D1705
            PLA
            PLX
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            PLA
            PLX
            LDY   #$000A
            PHA
            TXA
            STA   [$F4],Y
            PLA
            LDY   #$0008
            STA   [$F4],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$000E
            LDA   [$F4],Y
            TAX
            LDY   #$000C
            LDA   [$F4],Y
            SEC
            SBC   #$0001
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            PLA
            PLX
            LDY   #$000E
            PHA
            TXA
            STA   [$F4],Y
            PLA
            LDY   #$000C
            STA   [$F4],Y
            LDA   $EA
            LDX   #$0000
            TAY
            BPL   L08237D
            DEX
L08237D     PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0012
            LDA   [$F4],Y
            TAX
            LDY   #$0010
            LDA   [$F4],Y
            JSL   L0D1705
            PLA
            PLX
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            PLA
            PLX
            LDY   #$0012
            PHA
            TXA
            STA   [$F4],Y
            PLA
            LDY   #$0010
            STA   [$F4],Y
            LDA   [$F0]
            SEC
            SBC   #$0001
            PHA
            PLA
            STA   [$F0]
            LDA   $EA
            LDX   #$0000
            TAY
            BPL   L0823C8
            DEX
L0823C8     PHX
            PHA
            LDY   #$0006
            LDA   [$F0],Y
            TAX
            LDY   #$0004
            LDA   [$F0],Y
            JSL   L0D1705
            PLA
            PLX
            PHX
            PHA
            PLA
            PLX
            LDY   #$0006
            PHA
            TXA
            STA   [$F0],Y
            PLA
            LDY   #$0004
            STA   [$F0],Y
            LDA   $DE
            STA   $D8
L0823F0     LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$000E
            LDA   [$F4],Y
            TAX
            LDY   #$000C
            LDA   [$F4],Y
            SEC
            SBC   $D8
            BEQ   L082475
            BVS   L08240F
            EOR   #$8000
L08240F     BPL   L082475
            LDA   $EA
            LDX   #$0000
            TAY
            BPL   L08241A
            DEX
L08241A     PHX
            PHA
            LDA   $D8
            ASL
            ASL
            PHA
            LDX   L0F003C
            LDA   L0F003A
            STA   $F4
            STX   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L082435
            INC   $F6
L082435     LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            JSL   L0D1705
            PLA
            PLX
            PHX
            PHA
            LDA   $D8
            ASL
            ASL
            PHA
            LDX   L0F003C
            LDA   L0F003A
            STA   $F4
            STX   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08245E
            INC   $F6
L08245E     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$F4],Y
            PLA
            STA   [$F4]
            LDA   $D8
            CLC
            ADC   #$0001
            STA   $D8
            BRL   L0823F0
L082475     STZ   $DA
L082477     LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0006
            LDA   [$F4],Y
            SEC
            SBC   $DA
            BNE   L08248E
            BRL   L0825E1
L08248E     BVS   L082493
            EOR   #$8000
L082493     BMI   L082498
            BRL   L0825E1
L082498     LDA   $DA
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDA   #$0014
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0824BB
            INC   $F6
L0824BB     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0824C5
            INC   $F6
L0824C5     LDA   $F4
            LDX   $F6
            STX   $F2
            STA   $F0
            PEI   $DA
            JSL   L081516
            PLY
            STZ   $DC
            BRL   L0825C5
L0824D9     LDA   $DC
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
            BCC   L0824F2
            INC   $F6
L0824F2     LDA   [$F4]
            SEC
            SBC   $DE
            BEQ   L08253C
            BVS   L0824FE
            EOR   #$8000
L0824FE     BPL   L08253C
            LDA   $DC
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
            BCC   L082519
            INC   $F6
L082519     LDA   [$F4]
            SEC
            SBC   #$0001
            PHA
            LDA   $DC
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
            BCC   L082539
            INC   $F6
L082539     PLA
            STA   [$F4]
L08253C     LDA   $DC
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
            BCC   L082557
            INC   $F6
L082557     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L082561
            INC   $F6
L082561     LDA   [$F4]
            SEC
            SBC   $DE
            BEQ   L0825C3
            BVS   L08256D
            EOR   #$8000
L08256D     BPL   L0825C3
            LDA   $DC
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
            BCC   L08258A
            INC   $F6
L08258A     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L082594
            INC   $F6
L082594     LDA   [$F4]
            SEC
            SBC   #$0001
            PHA
            LDA   $DC
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
            BCC   L0825B6
            INC   $F6
L0825B6     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0825C0
            INC   $F6
L0825C0     PLA
            STA   [$F4]
L0825C3     INC   $DC
L0825C5     LDA   [$F0]
            SEC
            SBC   $DC
            BEQ   L0825D6
            BVS   L0825D1
            EOR   #$8000
L0825D1     BPL   L0825D6
            BRL   L0824D9
L0825D6     LDA   $DA
            CLC
            ADC   #$0001
            STA   $DA
            BRL   L082477
L0825E1     LDA   #$0000
L0825E4     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0825EE     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EC
            TCS
            LDA   $FF
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDA   #$0014
            CLC
            ADC   $F6
            STA   $F6
            BCC   L08261C
            INC   $F8
L08261C     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L082626
            INC   $F8
L082626     LDA   $F6
            LDX   $F8
            STX   $F0
            STA   $EE
            LDA   [$EE]
            PHA
            LDA   #$0004
            SEC
            JSL   L0D151F
            PLA
            LDX   #$0000
            TAY
            BPL   L082641
            DEX
L082641     PHX
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
            JSL   L0D1573
            PLA
            PLX
            STX   $F4
            STA   $F2
            LDX   L0F0028
            LDA   L0F0026
            PHX
            PHA
            LDX   $F4
            LDA   $F2
            JSL   L0D157E
            BVS   L082677
            EOR   #$8000
L082677     BMI   L082686
            PEA   $FFFF
            JSL   L0617E1
            PLY
            LDA   #$FFFF
            BRA   L082689
L082686     LDA   #$0000
L082689     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L082693     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00C0
            TCS
            LDA   $FF
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDA   #$0014
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0826C1
            INC   $F8
L0826C1     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0826CB
            INC   $F8
L0826CB     LDA   $F6
            LDX   $F8
            STX   $D8
            STA   $D6
            LDA   [$D6]
            PHA
            LDA   #$0004
            SEC
            JSL   L0D151F
            PLA
            LDX   #$0000
            TAY
            BPL   L0826E6
            DEX
L0826E6     STX   $F0
            STA   $EE
            LDA   $EE
            CMP   #$0000
            BNE   L0826FE
            LDA   $F0
            CMP   #$0000
            BNE   L0826FE
            LDA   #$0000
            BRL   L082B17
L0826FE     LDX   L0F000C
            LDA   L0F000A
            STX   $CC
            STA   $CA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDY   #$0012
            LDA   [$F6],Y
            TAX
            LDY   #$0010
            LDA   [$F6],Y
            CLC
            ADC   $EE
            PHA
            TXA
            ADC   $F0
            TAX
            PLA
            PHX
            PHA
            LDX   L0F0028
            LDA   L0F0026
            JSL   L0D1705
            PLA
            PLX
            PHX
            PHA
            LDX   $CC
            LDA   $CA
            JSL   L0D1573
            PLA
            PLX
            STX   $CC
            STA   $CA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDY   #$0012
            LDA   [$F6],Y
            TAX
            LDY   #$0010
            LDA   [$F6],Y
            CLC
            ADC   $EE
            PHA
            TXA
            ADC   $F0
            TAX
            PLA
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            PLA
            PLX
            LDY   #$0012
            PHA
            TXA
            STA   [$F6],Y
            PLA
            LDY   #$0010
            STA   [$F6],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDY   #$000A
            LDA   [$F6],Y
            TAX
            LDY   #$0008
            LDA   [$F6],Y
            CLC
            ADC   $EE
            PHA
            TXA
            ADC   $F0
            TAX
            PLA
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            PLA
            PLX
            LDY   #$000A
            PHA
            TXA
            STA   [$F6],Y
            PLA
            LDY   #$0008
            STA   [$F6],Y
            LDY   #$0006
            LDA   [$D6],Y
            TAX
            LDY   #$0004
            LDA   [$D6],Y
            CLC
            ADC   $EE
            PHA
            TXA
            ADC   $F0
            TAX
            PLA
            PHX
            PHA
            PLA
            PLX
            LDY   #$0006
            PHA
            TXA
            STA   [$D6],Y
            PLA
            LDY   #$0004
            STA   [$D6],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDY   #$000E
            LDA   [$F6],Y
            TAX
            LDY   #$000C
            LDA   [$F6],Y
            SEC
            SBC   #$0001
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
L0827FF     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $EC
            LDA   $EA
            JSL   L0D157E
            BEQ   L08281B
            BVS   L082816
            EOR   #$8000
L082816     BPL   L08281B
            BRL   L082B17
L08281B     LDX   $EC
            LDA   $EA
            ASL
            ASL
            PHA
            LDX   L0F003C
            LDA   L0F003A
            STA   $F6
            STX   $F8
            PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L082836
            INC   $F8
L082836     LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            STX   $E8
            STA   $E6
            LDX   $EC
            LDA   $EA
            ASL
            ASL
            PHA
            LDX   L0F003C
            LDA   L0F003A
            STA   $F6
            STX   $F8
            PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L08285D
            INC   $F8
L08285D     LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            CLC
            ADC   $EE
            PHA
            TXA
            ADC   $F0
            TAX
            PLA
            PHX
            PHA
            LDX   $EC
            LDA   $EA
            ASL
            ASL
            PHA
            LDX   L0F003C
            LDA   L0F003A
            STA   $F6
            STX   $F8
            PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L08288B
            INC   $F8
L08288B     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$F6],Y
            PLA
            STA   [$F6]
            LDX   L0F000C
            LDA   L0F000A
            STX   $D4
            STA   $D2
            LDX   L0F0028
            LDA   L0F0026
            SEC
            SBC   $E6
            PHA
            TXA
            SBC   $E8
            TAX
            PLA
            PHX
            PHA
            LDX   $D4
            LDA   $D2
            JSL   L0D1573
            PLA
            PLX
            STX   $D4
            STA   $D2
            PEA   $0000
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            PEI   $D4
            PEI   $D2
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
            LDX   $D4
            LDA   $D2
            JSL   L0D1573
            PLA
            PLX
            STX   $D4
            STA   $D2
            PEA   $0000
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            PEI   $D4
            PEI   $D2
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
            LDX   $D4
            LDA   $D2
            JSL   L0D1705
            PLA
            PLX
            STX   $D4
            STA   $D2
            LDA   $E4
            LDX   #$0000
            TAY
            BPL   L082933
            DEX
L082933     PHX
            PHA
            PEI   $CC
            PEI   $CA
            PEI   $D4
            PEI   $D2
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDX   $CC
            LDA   $CA
            STX   $C4
            STA   $C2
            LDA   $E2
            CMP   $FF
            BEQ   L08295A
            BRL   L082AEC
L08295A     LDY   #$0002
            LDA   [$D6],Y
            ASL
            PHA
            LDA   $C2
            STA   $F6
            LDA   $C4
            STA   $F8
            PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L082973
            INC   $F8
L082973     LDA   [$F6]
            PHA
            LDA   [$C2]
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   $DE
            LDY   #$0002
            LDA   [$D6],Y
            ASL
            PHA
            LDA   $C2
            STA   $F6
            LDA   $C4
            STA   $F8
            PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L082999
            INC   $F8
L082999     LDA   [$F6]
            CLC
            ADC   $DE
            CLC
            ADC   #$0002
            STA   $DC
            LDY   #$0002
            LDA   [$D6],Y
            SEC
            SBC   #$0001
            PHA
            LDA   #$0002
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDA   #$0004
            PLX
            STX   $F6
            CLC
            ADC   $F6
            STA   $E0
            LDX   $CC
            LDA   $CA
            STX   $D4
            STA   $D2
            LDA   $E0
            LDX   #$0000
            PHX
            PHA
            LDX   $D4
            LDA   $D2
            JSL   L0D1573
            PLA
            PLX
            STX   $D4
            STA   $D2
            LDX   $D4
            LDA   $D2
            STX   $D0
            STA   $CE
            LDX   #$0000
            LDA   #$0002
            PHX
            PHA
            LDX   $D0
            LDA   $CE
            JSL   L0D1573
            PLA
            PLX
            STX   $D0
            STA   $CE
            LDA   [$C2]
            SEC
            SBC   $E0
            LDX   #$0000
            TAY
            BPL   L082A0A
            DEX
L082A0A     STX   $F4
            STA   $F2
            PEI   $F4
            PEI   $F2
            PEI   $D0
            PEI   $CE
            PEI   $D4
            PEI   $D2
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDY   #$0002
            LDA   [$D6],Y
            ASL
            PHA
            LDA   $C2
            CLC
            ADC   #$0002
            STA   $F6
            LDA   $C4
            BCC   L082A3A
            INC
L082A3A     STA   $F8
            PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L082A46
            INC   $F8
L082A46     LDA   $DC
            STA   [$F6]
            STZ   $DA
            BRA   L082A94
L082A4E     LDA   $DA
            ASL
            PHA
            LDA   $C2
            CLC
            ADC   #$0004
            STA   $F6
            LDA   $C4
            BCC   L082A5F
            INC
L082A5F     STA   $F8
            PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L082A6B
            INC   $F8
L082A6B     LDA   [$F6]
            CLC
            ADC   #$0002
            PHA
            LDA   $DA
            ASL
            PHA
            LDA   $C2
            CLC
            ADC   #$0004
            STA   $F6
            LDA   $C4
            BCC   L082A83
            INC
L082A83     STA   $F8
            PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L082A8F
            INC   $F8
L082A8F     PLA
            STA   [$F6]
            INC   $DA
L082A94     LDY   #$0002
            LDA   [$D6],Y
            SEC
            SBC   #$0001
            SEC
            SBC   $DA
            BEQ   L082AA9
            BVS   L082AA7
            EOR   #$8000
L082AA7     BMI   L082A4E
L082AA9     LDX   $C4
            LDA   $C2
            STX   $C8
            STA   $C6
            LDA   $DC
            LDX   #$0000
            PHX
            PHA
            LDX   $C8
            LDA   $C6
            JSL   L0D1573
            PLA
            PLX
            STX   $C8
            STA   $C6
            LDA   #$0000
            SEP   #$20
            STA   [$C6]
            REP   #$20
            LDA   [$C2]
            CLC
            ADC   #$0004
            PHA
            PLA
            STA   [$C2]
            LDX   $F0
            LDA   $EE
            SEC
            SBC   #$0004
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STX   $F0
            STA   $EE
L082AEC     LDA   [$C2]
            LDX   #$0000
            PHX
            PHA
            LDX   $CC
            LDA   $CA
            JSL   L0D1573
            PLA
            PLX
            STX   $CC
            STA   $CA
            LDX   $EC
            LDA   $EA
            SEC
            SBC   #$0001
            PHA
            TXA
            SBC   #$0000
            TAX
            PLA
            STX   $EC
            STA   $EA
            BRL   L0827FF
L082B17     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L082B21     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00BC
            TCS
            LDA   $FD
            PHA
            LDA   #$0448
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDA   #$0014
            CLC
            ADC   $F4
            STA   $F4
            BCC   L082B4F
            INC   $F6
L082B4F     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L082B59
            INC   $F6
L082B59     LDA   $F4
            LDX   $F6
            STX   $D8
            STA   $D6
            LDA   [$D6]
            SEC
            SBC   #$0001
            BVS   L082B6C
            EOR   #$8000
L082B6C     BMI   L082B74
            LDA   #$0000
            BRL   L082D77
L082B74     STZ   $EC
            STZ   $EE
            STZ   $E0
            STZ   $E2
            STZ   $E8
            STZ   $EA
            BRL   L082CB5
L082B83     LDX   $EA
            LDA   $E8
            ASL
            ASL
            PHA
            LDX   L0F003C
            LDA   L0F003A
            STA   $F4
            STX   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L082B9E
            INC   $F6
L082B9E     LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STX   $E6
            STA   $E4
            LDX   L0F000C
            LDA   L0F000A
            STX   $CC
            STA   $CA
            LDX   L0F0028
            LDA   L0F0026
            SEC
            SBC   $E4
            PHA
            TXA
            SBC   $E6
            TAX
            PLA
            PHX
            PHA
            LDX   $CC
            LDA   $CA
            JSL   L0D1573
            PLA
            PLX
            STX   $CC
            STA   $CA
            LDX   $CC
            LDA   $CA
            STX   $C8
            STA   $C6
            LDA   [$C6]
            STA   $BE
            LDY   #$0002
            LDA   [$C6],Y
            CMP   $FD
            BNE   L082C32
            PEI   $C8
            PEI   $C6
            PEA   $0000
            PEA   $0000
            PEI   $FF
            LDY   #$0002
            LDA   [$D6],Y
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
            STX   $C8
            STA   $C6
            LDA   [$C6]
            PHA
            LDA   $BE
            PLX
            STX   $F4
            SEC
            SBC   $F4
            LDX   #$0000
            TAY
            BPL   L082C22
            DEX
L082C22     PHX
            PHA
            LDX   $EE
            LDA   $EC
            JSL   L0D1573
            PLA
            PLX
            STX   $EE
            STA   $EC
L082C32     LDX   $CC
            LDA   $CA
            STX   $D0
            STA   $CE
            LDX   $EE
            LDA   $EC
            PHX
            PHA
            LDX   $D0
            LDA   $CE
            JSL   L0D1573
            PLA
            PLX
            STX   $D0
            STA   $CE
            LDA   [$C6]
            LDX   #$0000
            TAY
            BPL   L082C57
            DEX
L082C57     PHX
            PHA
            PEI   $D0
            PEI   $CE
            PEI   $C8
            PEI   $C6
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   [$C6]
            LDX   #$0000
            TAY
            BPL   L082C76
            DEX
L082C76     PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L0D1573
            PLA
            PLX
            STX   $E2
            STA   $E0
            LDX   $EA
            LDA   $E8
            ASL
            ASL
            PHA
            LDX   L0F003C
            LDA   L0F003A
            STA   $F4
            STX   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L082CA1
            INC   $F6
L082CA1     LDX   $E2
            LDA   $E0
            LDY   #$0002
            PHA
            TXA
            STA   [$F4],Y
            PLA
            STA   [$F4]
            INC   $E8
            BNE   L082CB5
            INC   $EA
L082CB5     LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$000E
            LDA   [$F4],Y
            TAX
            LDY   #$000C
            LDA   [$F4],Y
            PHX
            PHA
            LDX   $EA
            LDA   $E8
            JSL   L0D157E
            BEQ   L082CE0
            BVS   L082CDB
            EOR   #$8000
L082CDB     BPL   L082CE0
            BRL   L082B83
L082CE0     LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$000A
            LDA   [$F4],Y
            TAX
            LDY   #$0008
            LDA   [$F4],Y
            SEC
            SBC   $EC
            PHA
            TXA
            SBC   $EE
            TAX
            PLA
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            PLA
            PLX
            LDY   #$000A
            PHA
            TXA
            STA   [$F4],Y
            PLA
            LDY   #$0008
            STA   [$F4],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            LDY   #$0012
            LDA   [$F4],Y
            TAX
            LDY   #$0010
            LDA   [$F4],Y
            SEC
            SBC   $EC
            PHA
            TXA
            SBC   $EE
            TAX
            PLA
            PHX
            PHA
            LDX   L0F000C
            LDA   L0F000A
            STA   $F4
            STX   $F6
            PLA
            PLX
            LDY   #$0012
            PHA
            TXA
            STA   [$F4],Y
            PLA
            LDY   #$0010
            STA   [$F4],Y
            LDY   #$0006
            LDA   [$D6],Y
            TAX
            LDY   #$0004
            LDA   [$D6],Y
            SEC
            SBC   $EC
            PHA
            TXA
            SBC   $EE
            TAX
            PLA
            PHX
            PHA
            PLA
            PLX
            LDY   #$0006
            PHA
            TXA
            STA   [$D6],Y
            PLA
            LDY   #$0004
            STA   [$D6],Y
L082D77     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L082D81     ENT
            PHD
            TSC
            SEC
            SBC   #$00EF
            TCD
            ADC   #$00D8
            TCS
            LDA   #L0E2A36
            LDX   #^L0E2A36
            STX   $EA
            STA   $E8
            LDA   $F5
            SEC
            SBC   #$0001
            PHA
            LDA   #$0002
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDA   #$0004
            PLX
            STX   $EC
            CLC
            ADC   $EC
            PHA
            PLA
            STA   [$E8]
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L0D157E
            BNE   L082DD3
            LDA   $F7
            SEC
            SBC   #$0000
            BVS   L082DD1
            EOR   #$8000
L082DD1     BMI   L082DDD
L082DD3     LDA   [$E8]
            CLC
            ADC   #$0002
            PHA
            PLA
            STA   [$E8]
L082DDD     LDY   #$0002
            LDA   [$FD],Y
            PHA
            PLA
            LDY   #$0002
            STA   [$E8],Y
            STZ   $E6
            STZ   $E4
L082DED     LDA   $E6
            SEC
            SBC   $F5
            BVS   L082DF7
            EOR   #$8000
L082DF7     BPL   L082DFC
            BRL   L082F17
L082DFC     LDA   $E6
            CMP   $F7
            BEQ   L082E3E
            LDX   $FF
            LDA   $FD
            STX   $E2
            STA   $E0
            LDA   $E6
            ASL
            PHA
            LDA   $FD
            CLC
            ADC   #$0004
            STA   $EC
            LDA   $FF
            BCC   L082E1B
            INC
L082E1B     STA   $EE
            PLA
            CLC
            ADC   $EC
            STA   $EC
            BCC   L082E27
            INC   $EE
L082E27     LDA   [$EC]
            LDX   #$0000
            PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L0D1573
            PLA
            PLX
            STX   $E2
            STA   $E0
            BRA   L082E5C
L082E3E     STZ   $E0
            STZ   $E2
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L0D157E
            BEQ   L082E5C
            LDX   $FB
            LDA   $F9
            STX   $E2
            STA   $E0
L082E5C     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $E2
            LDA   $E0
            JSL   L0D157E
            BNE   L082E71
            BRL   L082F12
L082E71     LDA   [$E8]
            PHA
            LDA   $E4
            ASL
            PHA
            LDA   $E8
            CLC
            ADC   #$0004
            STA   $EC
            LDA   $EA
            BCC   L082E85
            INC
L082E85     STA   $EE
            PLA
            CLC
            ADC   $EC
            STA   $EC
            BCC   L082E91
            INC   $EE
L082E91     PLA
            STA   [$EC]
            LDX   $EA
            LDA   $E8
            STX   $DE
            STA   $DC
            LDA   $E4
            ASL
            PHA
            LDA   $E8
            CLC
            ADC   #$0004
            STA   $EC
            LDA   $EA
            BCC   L082EAD
            INC
L082EAD     STA   $EE
            PLA
            CLC
            ADC   $EC
            STA   $EC
            BCC   L082EB9
            INC   $EE
L082EB9     LDA   [$EC]
            LDX   #$0000
            PHX
            PHA
            LDX   $DE
            LDA   $DC
            JSL   L0D1573
            PLA
            PLX
            STX   $DE
            STA   $DC
            PEI   $E2
            PEI   $E0
            JSL   L0C04CD
            PLY
            PLY
            CLC
            ADC   #$0001
            STA   $DA
            PEI   $E2
            PEI   $E0
            PEI   $DE
            PEI   $DC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   $DA
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLA
            CMP   #$0000
            BEQ   L082F07
            LDA   $DA
            CLC
            ADC   #$0001
            STA   $DA
L082F07     LDA   [$E8]
            CLC
            ADC   $DA
            PHA
            PLA
            STA   [$E8]
            INC   $E4
L082F12     INC   $E6
            BRL   L082DED
L082F17     TDC
            CLC
            ADC   #$00EF
            TCS
            PLD
            RTL

L082F1F     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            PEA   $0000
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
            LDA   #$004E
            CLC
            ADC   $F6
            STA   $F6
            BCC   L082F4B
            INC   $F8
L082F4B     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L082F55
            INC   $F8
L082F55     LDA   [$F6]
            PHA
            JSL   L0C09C0
            PLY
            PLY
            TAY
            BEQ   L082F66
            LDA   #$0000
            BRA   L082FA5
L082F66     PEA   $0001
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
            LDA   #$004E
            CLC
            ADC   $F6
            STA   $F6
            BCC   L082F87
            INC   $F8
L082F87     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L082F91
            INC   $F8
L082F91     LDA   [$F6]
            PHA
            JSL   L0C09C0
            PLY
            PLY
            TAY
            BEQ   L082FA2
            LDA   #$0001
            BRA   L082FA5
L082FA2     LDA   #$0002
L082FA5     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L082FAF     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F0
            TCS
            PEI   $FD
            JSL   L082F1F
            PLY
            STA   $F2
            PEI   $F2
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L082FE3
            INC   $F6
L082FE3     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L082FED
            INC   $F6
L082FED     LDA   [$F4]
            PHA
            JSL   L0C0A0C
            PLY
            PLY
            PHA
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083015
            INC   $F6
L083015     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08301F
            INC   $F6
L08301F     PLA
            STA   [$F4]
            PEI   $FF
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083042
            INC   $F6
L083042     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08304C
            INC   $F6
L08304C     LDA   [$F4]
            PHA
            JSL   L0C09E6
            PLY
            PLY
            PHA
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083074
            INC   $F6
L083074     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08307E
            INC   $F6
L08307E     PLA
            STA   [$F4]
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L083089     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            PEA   $0003
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
            LDA   #$004E
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0830B5
            INC   $F8
L0830B5     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0830BF
            INC   $F8
L0830BF     LDA   [$F6]
            PHA
            JSL   L0C09C0
            PLY
            PLY
            TAY
            BEQ   L0830D0
            LDA   #$0000
            BRA   L0830D3
L0830D0     LDA   #$0001
L0830D3     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0830DD     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            PEA   $0003
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083109
            INC   $F6
L083109     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083113
            INC   $F6
L083113     LDA   [$F4]
            PHA
            JSL   L0C09E6
            PLY
            PLY
            PHA
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08313B
            INC   $F6
L08313B     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083145
            INC   $F6
L083145     PLA
            STA   [$F4]
            LDA   $FF
            BEQ   L0831AC
            PEA   $0003
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08316D
            INC   $F6
L08316D     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083177
            INC   $F6
L083177     LDA   [$F4]
            PHA
            JSL   L0C0A0C
            PLY
            PLY
            PHA
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08319F
            INC   $F6
L08319F     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0831A9
            INC   $F6
L0831A9     PLA
            STA   [$F4]
L0831AC     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0831B4     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            PEA   $000C
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
            LDA   #$004E
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0831E0
            INC   $F8
L0831E0     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0831EA
            INC   $F8
L0831EA     LDA   [$F6]
            PHA
            JSL   L0C09C0
            PLY
            PLY
            TAY
            BEQ   L0831FB
            LDA   #$0001
            BRA   L0831FE
L0831FB     LDA   #$0000
L0831FE     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            PEA   $000C
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083234
            INC   $F6
L083234     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08323E
            INC   $F6
L08323E     LDA   [$F4]
            PHA
            JSL   L0C09E6
            PLY
            PLY
            PHA
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083266
            INC   $F6
L083266     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083270
            INC   $F6
L083270     PLA
            STA   [$F4]
            LDA   $FF
            BNE   L0832D7
            PEA   $000C
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083298
            INC   $F6
L083298     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0832A2
            INC   $F6
L0832A2     LDA   [$F4]
            PHA
            JSL   L0C0A0C
            PLY
            PLY
            PHA
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0832CA
            INC   $F6
L0832CA     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0832D4
            INC   $F6
L0832D4     PLA
            STA   [$F4]
L0832D7     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            PEA   $0004
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
            LDA   #$004E
            CLC
            ADC   $F6
            STA   $F6
            BCC   L08330B
            INC   $F8
L08330B     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L083315
            INC   $F8
L083315     LDA   [$F6]
            PHA
            JSL   L0C09C0
            PLY
            PLY
            TAY
            BEQ   L083326
            LDA   #$0000
            BRA   L083329
L083326     LDA   #$0001
L083329     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            PEA   $0004
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08335F
            INC   $F6
L08335F     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083369
            INC   $F6
L083369     LDA   [$F4]
            PHA
            JSL   L0C09E6
            PLY
            PLY
            PHA
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083391
            INC   $F6
L083391     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08339B
            INC   $F6
L08339B     PLA
            STA   [$F4]
            LDA   $FF
            BEQ   L083402
            PEA   $0004
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0833C3
            INC   $F6
L0833C3     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0833CD
            INC   $F6
L0833CD     LDA   [$F4]
            PHA
            JSL   L0C0A0C
            PLY
            PLY
            PHA
            LDA   $FD
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
            LDA   #$004E
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0833F5
            INC   $F6
L0833F5     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0833FF
            INC   $F6
L0833FF     PLA
            STA   [$F4]
L083402     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L08340A     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            SEC
            SBC   #$0010
            BVS   L083420
            EOR   #$8000
L083420     BMI   L083457
            PEI   $FF
            LDA   $FD
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   #$0052
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083440
            INC   $F6
L083440     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08344A
            INC   $F6
L08344A     LDA   [$F4]
            PHA
            JSL   L0C09C0
            PLY
            PLY
            BRA   L08348D
            BRA   L08348D
L083457     LDA   $FF
            SEC
            SBC   #$0010
            PHA
            LDA   $FD
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   #$0054
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08347A
            INC   $F6
L08347A     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083484
            INC   $F6
L083484     LDA   [$F4]
            PHA
            JSL   L0C09C0
            PLY
            PLY
L08348D     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L083497     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            SEC
            SBC   #$0010
            BVS   L0834AD
            EOR   #$8000
L0834AD     BMI   L08350C
            PEI   $FF
            LDA   $FD
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   #$0052
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0834CD
            INC   $F6
L0834CD     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0834D7
            INC   $F6
L0834D7     LDA   [$F4]
            PHA
            JSL   L0C09E6
            PLY
            PLY
            PHA
            LDA   $FD
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   #$0052
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0834FD
            INC   $F6
L0834FD     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083507
            INC   $F6
L083507     PLA
            STA   [$F4]
            BRA   L08356C
L08350C     LDA   $FF
            SEC
            SBC   #$0010
            PHA
            LDA   $FD
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   #$0054
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08352F
            INC   $F6
L08352F     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083539
            INC   $F6
L083539     LDA   [$F4]
            PHA
            JSL   L0C09E6
            PLY
            PLY
            PHA
            LDA   $FD
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   #$0054
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08355F
            INC   $F6
L08355F     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083569
            INC   $F6
L083569     PLA
            STA   [$F4]
L08356C     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L083574     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            SEC
            SBC   #$0010
            BVS   L08358A
            EOR   #$8000
L08358A     BMI   L0835E9
            PEI   $FF
            LDA   $FD
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   #$0052
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0835AA
            INC   $F6
L0835AA     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0835B4
            INC   $F6
L0835B4     LDA   [$F4]
            PHA
            JSL   L0C0A0C
            PLY
            PLY
            PHA
            LDA   $FD
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   #$0052
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0835DA
            INC   $F6
L0835DA     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L0835E4
            INC   $F6
L0835E4     PLA
            STA   [$F4]
            BRA   L083649
L0835E9     LDA   $FF
            SEC
            SBC   #$0010
            PHA
            LDA   $FD
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   #$0054
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08360C
            INC   $F6
L08360C     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083616
            INC   $F6
L083616     LDA   [$F4]
            PHA
            JSL   L0C0A0C
            PLY
            PLY
            PHA
            LDA   $FD
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   #$0054
            CLC
            ADC   $F4
            STA   $F4
            BCC   L08363C
            INC   $F6
L08363C     PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L083646
            INC   $F6
L083646     PLA
            STA   [$F4]
L083649     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L083651     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            STZ   $F6
            BRL   L08370F
L083661     LDA   $F6
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
            BCC   L08367D
            INC   $FA
L08367D     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L083687
            INC   $FA
L083687     LDA   #$0000
            STA   [$F8]
            LDA   $F6
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   #$0052
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0836A8
            INC   $FA
L0836A8     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0836B2
            INC   $FA
L0836B2     LDA   #$0000
            STA   [$F8]
            LDA   $F6
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   #$0054
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0836D3
            INC   $FA
L0836D3     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0836DD
            INC   $FA
L0836DD     LDA   #$0000
            STA   [$F8]
            LDA   $F6
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
            BCC   L0836FE
            INC   $FA
L0836FE     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L083708
            INC   $FA
L083708     LDA   #$0000
            STA   [$F8]
            INC   $F6
L08370F     LDA   $F6
            SEC
            SBC   #$0020
            BVS   L08371A
            EOR   #$8000
L08371A     BMI   L08371F
            BRL   L083661
L08371F     STZ   $F6
            BRA   L083782
L083723     LDA   $F6
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
            BCC   L08373F
            INC   $FA
L08373F     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L083749
            INC   $FA
L083749     LDA   $F6
            STA   [$F8]
            PEI   $F6
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
            BCC   L08376D
            INC   $FA
L08376D     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L083777
            INC   $FA
L083777     LDA   [$F8]
            PHA
            JSL   L083497
            PLY
            PLY
            INC   $F6
L083782     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   $F6
            BEQ   L08379D
            BVS   L08379B
            EOR   #$8000
L08379B     BMI   L083723
L08379D     STZ   $F6
            BRA   L0837AA
L0837A1     PEI   $F6
            JSL   L0837BF
            PLY
            INC   $F6
L0837AA     LDA   $F6
            SEC
            SBC   #$0020
            BVS   L0837B5
            EOR   #$8000
L0837B5     BPL   L0837A1
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0837BF     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00D0
            TCS
            STZ   $EE
            STZ   $F4
            BRA   L0837E9
L0837D0     PEI   $F4
            PEI   $FF
            JSL   L08340A
            PLY
            PLY
            TAY
            BEQ   L0837E7
            LDA   $EE
            INC   $EE
            ASL
            TAX
            LDA   $F4
            STA   $DE,X
L0837E7     INC   $F4
L0837E9     LDA   $F4
            CMP   #$0020
            BCC   L0837D0
            LDA   $FF
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
            BCC   L08380C
            INC   $F8
L08380C     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L083816
            INC   $F8
L083816     LDA   $EE
            STA   [$F6]
            LDA   $EE
            SEC
            SBC   #$0002
            BVS   L083825
            EOR   #$8000
L083825     BMI   L08382D
            LDA   #$0000
            BRL   L0839CB
L08382D     STZ   $F2
            STZ   $F4
            BRL   L0839B5
L083834     LDA   $F4
            ASL
            TAX
            LDA   $DE,X
            STA   $DC
            LDA   $F4
            CLC
            ADC   #$0001
            ASL
            TAX
            LDA   $DE,X
            STA   $DA
            LDA   $DC
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
            BCC   L083864
            INC   $F8
L083864     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L08386E
            INC   $F8
L08386E     LDA   [$F6]
            STA   $D8
            LDA   $DA
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
            BCC   L08388E
            INC   $F8
L08388E     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L083898
            INC   $F8
L083898     LDA   [$F6]
            STA   $D6
            LDA   $D8
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
            BCC   L0838BA
            INC   $F8
L0838BA     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0838C4
            INC   $F8
L0838C4     LDA   [$F6]
            STA   $D4
            LDA   $D6
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
            BCC   L0838E6
            INC   $F8
L0838E6     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0838F0
            INC   $F8
L0838F0     LDA   [$F6]
            STA   $D2
            LDA   $D4
            SEC
            SBC   $D2
            BNE   L0838FE
            BRL   L0839B3
L0838FE     BVS   L083903
            EOR   #$8000
L083903     BMI   L083908
            BRL   L0839B3
L083908     LDA   $DC
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
            BCC   L083924
            INC   $F8
L083924     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L08392E
            INC   $F8
L08392E     LDA   [$F6]
            STA   $F0
            LDA   $DA
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
            BCC   L08394E
            INC   $F8
L08394E     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L083958
            INC   $F8
L083958     LDA   [$F6]
            PHA
            LDA   $DC
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
            BCC   L083977
            INC   $F8
L083977     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L083981
            INC   $F8
L083981     PLA
            STA   [$F6]
            LDA   $DA
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
            BCC   L0839A0
            INC   $F8
L0839A0     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0839AA
            INC   $F8
L0839AA     LDA   $F0
            STA   [$F6]
            LDA   #$0001
            STA   $F2
L0839B3     INC   $F4
L0839B5     LDA   $EE
            SEC
            SBC   #$0001
            CMP   $F4
            BEQ   L0839C4
            BCC   L0839C4
            BRL   L083834
L0839C4     LDA   $F2
            BEQ   L0839CB
            BRL   L08382D
L0839CB     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0839D5     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E2
            TCS
            LDA   $FD
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F2
            STX   $F4
            LDA   #$0056
            CLC
            ADC   $F2
            STA   $F2
            BCC   L0839FC
            INC   $F4
L0839FC     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L083A06
            INC   $F4
L083A06     LDA   [$F2]
            STA   $F0
            LDX   L0F0038
            LDA   L0F0036
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            PHA
            LDA   $FB
            PHA
            PEA   $001E
            JSL   L011FF5
            PLY
            SEC
            JSL   L0D151F
            PLA
            PLX
            STX   $F2
            CLC
            ADC   $F2
            STA   $EE
            PEA   $0018
            JSL   L011FF5
            PLY
            PHA
            LDA   $EE
            PLX
            STX   $F2
            CLC
            ADC   $F2
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
            STA   $F2
            STX   $F4
            LDA   #$0054
            CLC
            ADC   $F2
            STA   $F2
            BCC   L083A63
            INC   $F4
L083A63     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L083A6D
            INC   $F4
L083A6D     LDA   [$F2]
            PHA
            PEI   $EE
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
            LDA   #$0052
            CLC
            ADC   $F2
            STA   $F2
            BCC   L083A90
            INC   $F4
L083A90     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L083A9A
            INC   $F4
L083A9A     LDA   [$F2]
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
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            JSL   L0C0C3B
            PLY
            PLY
            PLY
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
            LDA   #$0056
            CLC
            ADC   $F2
            STA   $F2
            BCC   L083AF6
            INC   $F4
L083AF6     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L083B00
            INC   $F4
L083B00     LDA   [$F2]
            PHA
            LDA   $EA
            PLX
            STX   $F2
            SEC
            SBC   $F2
            STA   $EA
            LDA   $E8
            SEC
            SBC   #$0001
            PHA
            PEI   $EA
            LDA   $E4
            CLC
            ADC   #$0001
            PHA
            PEI   $EA
            PEA   $0006
            JSL   L072FCE
            PLY
            PLY
            PLY
            PLY
            PLY
            LDA   $EA
            SEC
            SBC   #$0002
            STA   $EC
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
            LDA   #$0056
            CLC
            ADC   $F2
            STA   $F2
            BCC   L083B51
            INC   $F4
L083B51     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L083B5B
            INC   $F4
L083B5B     LDA   [$F2]
            PHA
            LDA   $EA
            PLX
            STX   $F2
            CLC
            ADC   $F2
            STA   $EA
            PEI   $EC
            LDA   $EE
            CLC
            ADC   #$0003
            PHA
            PEI   $F0
            JSL   L073FBA
            PLY
            PLY
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F2
            STX   $F4
            LDY   #$002E
            LDA   [$F2],Y
            CMP   #$FFFF
            BEQ   L083BA1
            PEI   $F0
            JSL   L070BE2
            PLY
            PEA   $0001
            JSL   L071FA8
            PLY
            JSL   L071957
L083BA1     TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L083BA9     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EA
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0052
            LDA   [$F8],Y
            STA   $EC
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0016
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            STA   $F6
            LDA   #$FFFF
            STA   $F4
            LDA   $F6
            STA   $EE
L083BE3     LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   [$F8]
            PHA
            LDA   $F6
            PLX
            STX   $F8
            CLC
            ADC   $F8
            SEC
            SBC   $EE
            BNE   L083C00
            BRL   L083CC1
L083C00     BVS   L083C05
            EOR   #$8000
L083C05     BMI   L083C0A
            BRL   L083CC1
L083C0A     LDA   $F4
            CLC
            ADC   #$0001
            STA   $F4
            LDA   $EE
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
            BCC   L083C2E
            INC   $FA
L083C2E     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L083C38
            INC   $FA
L083C38     LDA   [$F8]
            SEC
            SBC   #$0000
            BNE   L083C43
            BRL   L083CB6
L083C43     BVS   L083C48
            EOR   #$8000
L083C48     BMI   L083C4D
            BRL   L083CB6
L083C4D     STZ   $F2
            STZ   $F0
            BRA   L083C82
L083C53     PEI   $F2
            PEI   $EE
            JSL   L08340A
            PLY
            PLY
            TAY
            BNE   L083C6A
            LDA   $F2
            CLC
            ADC   #$0001
            STA   $F2
            BRA   L083C53
L083C6A     PEA   $0001
            PEI   $F2
            PEI   $F4
            JSL   L0839D5
            PLY
            PLY
            PLY
            LDA   $F2
            CLC
            ADC   #$0001
            STA   $F2
            INC   $F0
L083C82     LDA   $EE
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
            BCC   L083C9E
            INC   $FA
L083C9E     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L083CA8
            INC   $FA
L083CA8     LDA   [$F8]
            SEC
            SBC   $F0
            BEQ   L083CB6
            BVS   L083CB4
            EOR   #$8000
L083CB4     BMI   L083C53
L083CB6     LDA   $EE
            CLC
            ADC   #$0001
            STA   $EE
            BRL   L083BE3
L083CC1     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            CMP   #$FFFF
            BEQ   L083CEC
            PEI   $EC
            JSL   L070BE2
            PLY
            PEA   $0001
            JSL   L071FA8
            PLY
            JSL   L071957
            JSL   L070CC7
L083CEC     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L083CF4     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EA
            TCS
            LDX   #$0000
            LDA   #$0001
            STX   $EE
            STA   $EC
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0016
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            BEQ   L083D88
            BVS   L083D23
            EOR   #$8000
L083D23     BPL   L083D88
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   [$F8]
            PHA
            LDA   #$0020
            PLX
            STX   $F8
            SEC
            SBC   $F8
            LDX   #$0000
            TAY
            BPL   L083D42
            DEX
L083D42     STX   $F2
            STA   $F0
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0016
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            LDX   #$0000
            TAY
            BPL   L083D60
            DEX
L083D60     STX   $F6
            STA   $F4
            LDX   $F6
            LDA   $F4
            PHX
            PHA
            LDX   #$0000
            LDA   #$03E8
            SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   $F2
            LDA   $F0
            SEC
            JSL   L0D15C0
            PLY
            PLY
            STX   $EE
            STA   $EC
L083D88     LDX   $EE
            LDA   $EC
            PHA
            PEA   $0000
            JSL   L0912A0
            PLY
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L083D9E     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L083DB1     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            JSL   L074043
            STA   $F6
            LDX   #$0000
            LDA   #$0001
            STX   $F4
            STA   $F2
            LDA   $F6
            CMP   #$0000
            BEQ   L083E0E
            LDX   #$0000
            LDA   #$03E8
            PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            LDX   #$0000
            TAY
            BPL   L083DF1
            DEX
L083DF1     SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDA   $F6
            LDX   #$0000
            TAY
            BPL   L083E03
            DEX
L083E03     SEC
            JSL   L0D15C0
            PLY
            PLY
            STX   $F4
            STA   $F2
L083E0E     LDX   $F4
            LDA   $F2
            PHA
            PEA   $0001
            JSL   L0912A0
            PLY
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L083E24     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L083E37     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00C2
            TCS
            STZ   $F6
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$000A
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            STA   $F4
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0034
            LDA   [$F8],Y
            CLC
            ADC   #$0004
            STA   $F0
L083E6E     LDA   $F4
            SEC
            SBC   #$FFFF
            BNE   L083E79
            BRL   L083F08
L083E79     BVS   L083E7E
            EOR   #$8000
L083E7E     BMI   L083E83
            BRL   L083F08
L083E83     PEI   $F4
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
            BEQ   L083EFD
            LDA   $F4
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
            BCC   L083EBA
            INC   $FA
L083EBA     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L083EC4
            INC   $FA
L083EC4     LDA   [$F8]
            STA   $F2
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
            LDA   #$0054
            CLC
            ADC   $F8
            STA   $F8
            BCC   L083EE6
            INC   $FA
L083EE6     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L083EF0
            INC   $FA
L083EF0     LDA   [$F8]
            CLC
            ADC   #$0005
            STA   $F0
            LDA   #$FFFF
            STA   $F4
L083EFD     LDA   $F4
            SEC
            SBC   #$0001
            STA   $F4
            BRL   L083E6E
L083F08     PEA   $0000
            PEA   $0008
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$000C
            BCC   L083F2C
            INX
L083F2C     PHX
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $D6
            SEC
            SBC   #$0003
            STA   $D6
            LDA   $D6
            CLC
            ADC   #$0003
            STA   $DA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L0C0A3E
            PLY
            PLY
            PLY
            PLY
            LDA   $F0
            STA   $D6
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
            BCC   L083F93
            INC   $FA
L083F93     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L083F9D
            INC   $FA
L083F9D     LDA   [$F8]
            SEC
            SBC   #$0038
            STA   $DA
            PEA   $0000
            TDC
            CLC
            ADC   #$00DC
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D4
            PHA
            JSL   L0C0A3E
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00CC
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00DC
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            JSL   L0A0518
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
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
            LDA   #$0056
            CLC
            ADC   $F8
            STA   $F8
            BCC   L084017
            INC   $FA
L084017     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L084021
            INC   $FA
L084021     LDA   [$F8]
            STA   $EE
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
            BCC   L084050
            INC   $FA
L084050     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L08405A
            INC   $FA
L08405A     LDA   [$F8]
            STA   $EC
            LDA   $CE
            CLC
            ADC   #$0003
            SEC
            SBC   $EC
            PHA
            LDA   $EE
            PLX
            STX   $F8
            SEC
            SBC   $F8
            STA   $EE
            LDA   $EE
            SEC
            SBC   #$001C
            BVS   L08407D
            EOR   #$8000
L08407D     BMI   L084084
            LDA   #$001C
            STA   $EE
L084084     JSL   L070D92
            LDA   $CE
            CLC
            ADC   #$0003
            SEC
            SBC   $EC
            BEQ   L08410A
            BVS   L084098
            EOR   #$8000
L084098     BPL   L08410A
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0010
            LDA   [$F8],Y
            CLC
            ADC   #$0001
            PHA
            LDA   $CE
            CLC
            ADC   #$0003
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$000C
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            PHA
            PEI   $EC
            PEA   $0000
            TDC
            CLC
            ADC   #$00C4
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $FFFF
            PEA   $FFFE
            PEA   $0000
            TDC
            CLC
            ADC   #$00C4
            PHA
            JSL   L0C0D36
            PLY
            PLY
            PLY
            PLY
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00C4
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
L08410A     LDA   $CE
            CLC
            ADC   #$0003
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
            LDA   #$0052
            CLC
            ADC   $F8
            STA   $F8
            BCC   L08413C
            INC   $FA
L08413C     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L084146
            INC   $FA
L084146     PLA
            STA   [$F8]
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
            LDA   #$0056
            CLC
            ADC   $F8
            STA   $F8
            BCC   L084174
            INC   $FA
L084174     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L08417E
            INC   $FA
L08417E     LDA   $EE
            STA   [$F8]
            PEA   $0000
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$000A
            LDA   [$F8],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            PHA
            JSL   L0839D5
            PLY
            PLY
            PLY
            JSL   L070CC7
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0841B8     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00C4
            TCS
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0038
            LDA   [$F8],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0034
            LDA   [$F8],Y
            PLX
            STX   $F8
            CLC
            ADC   $F8
            SEC
            SBC   #$0005
            STA   $F2
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$000A
            LDA   [$F8],Y
            CLC
            ADC   #$0001
            STA   $F6
L084203     LDA   $F6
            SEC
            SBC   #$0020
            BVS   L08420E
            EOR   #$8000
L08420E     BPL   L084213
            BRL   L084298
L084213     PEI   $F6
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
            BEQ   L08428D
            LDA   $F6
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
            BCC   L08424A
            INC   $FA
L08424A     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L084254
            INC   $FA
L084254     LDA   [$F8]
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
            LDA   #$0052
            CLC
            ADC   $F8
            STA   $F8
            BCC   L084276
            INC   $FA
L084276     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L084280
            INC   $FA
L084280     LDA   [$F8]
            SEC
            SBC   #$0005
            STA   $F2
            LDA   #$0020
            STA   $F6
L08428D     LDA   $F6
            CLC
            ADC   #$0001
            STA   $F6
            BRL   L084203
L084298     PEA   $0000
            PEA   $0008
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$000C
            BCC   L0842BC
            INX
L0842BC     PHX
            PHA
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $DC
            SEC
            SBC   #$0003
            STA   $D8
            LDA   $DC
            CLC
            ADC   #$0003
            STA   $DC
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            JSL   L0C0A3E
            PLY
            PLY
            PLY
            PLY
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
            BCC   L08431F
            INC   $FA
L08431F     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L084329
            INC   $FA
L084329     LDA   [$F8]
            CLC
            ADC   #$0038
            STA   $D8
            LDA   $F2
            STA   $DC
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$000C
            LDA   [$F8],Y
            STA   $D6
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0010
            LDA   [$F8],Y
            STA   $DA
            PEA   $0000
            TDC
            CLC
            ADC   #$00DE
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
            PHA
            JSL   L0C0A3E
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00CE
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00DE
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            JSL   L0A0518
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
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
            LDA   #$0056
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0843C9
            INC   $FA
L0843C9     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0843D3
            INC   $FA
L0843D3     LDA   [$F8]
            STA   $F0
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
            BCC   L084402
            INC   $FA
L084402     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L08440C
            INC   $FA
L08440C     LDA   [$F8]
            STA   $EE
            LDA   $D4
            SEC
            SBC   #$0003
            SEC
            SBC   $EE
            PHA
            LDA   $F0
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STA   $F0
            LDA   $F0
            SEC
            SBC   #$001C
            BVS   L08442F
            EOR   #$8000
L08442F     BMI   L084436
            LDA   #$001C
            STA   $F0
L084436     JSL   L070D92
            LDA   $D4
            SEC
            SBC   #$0003
            SEC
            SBC   $EE
            BVS   L084448
            EOR   #$8000
L084448     BMI   L0844BA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0010
            LDA   [$F8],Y
            CLC
            ADC   #$0001
            PHA
            PEI   $EE
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$000C
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            PHA
            LDA   $D4
            SEC
            SBC   #$0003
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $FFFF
            PEA   $FFFE
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            JSL   L0C0D36
            PLY
            PLY
            PLY
            PLY
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00C6
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
L0844BA     LDA   $D4
            SEC
            SBC   #$0003
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
            BCC   L0844EC
            INC   $FA
L0844EC     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0844F6
            INC   $FA
L0844F6     PLA
            STA   [$F8]
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
            LDA   #$0056
            CLC
            ADC   $F8
            STA   $F8
            BCC   L084524
            INC   $FA
L084524     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L08452E
            INC   $FA
L08452E     LDA   $F0
            STA   [$F8]
            PEA   $0000
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$000A
            LDA   [$F8],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            PHA
            JSL   L0839D5
            PLY
            PLY
            PLY
            JSL   L070CC7
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L084568     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L08457B     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L08458E     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00D6
            TCS
            PEA   $0000
            PEA   $0008
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$000C
            BCC   L0845BD
            INX
L0845BD     PHX
            PHA
            JSL   L0C0863
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
            LDA   #$0056
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0845F6
            INC   $FA
L0845F6     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L084600
            INC   $FA
L084600     LDA   [$F8]
            SEC
            SBC   #$0003
            PHA
            LDA   $F6
            PLX
            STX   $F8
            SEC
            SBC   $F8
            STA   $F6
            LDA   $F6
            SEC
            SBC   #$0006
            STA   $F2
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0A3E
            PLY
            PLY
            PLY
            PLY
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$000E
            LDA   [$F8],Y
            CLC
            ADC   #$000C
            STA   $F2
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0012
            LDA   [$F8],Y
            SEC
            SBC   #$001C
            STA   $F6
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$000C
            LDA   [$F8],Y
            STA   $F0
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0010
            LDA   [$F8],Y
            STA   $F4
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L0C0A3E
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E8
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            JSL   L0A0518
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            LDA   $EA
            STA   $D8
            LDA   $E8
            STA   $DA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0012
            LDA   [$F8],Y
            SEC
            SBC   $D8
            SEC
            SBC   #$0003
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
            LDA   #$0056
            CLC
            ADC   $F8
            STA   $F8
            BCC   L084710
            INC   $FA
L084710     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L08471A
            INC   $FA
L08471A     PLA
            STA   [$F8]
            JSL   L070D92
            PEA   $0000
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$000A
            LDA   [$F8],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            PHA
            JSL   L0839D5
            PLY
            PLY
            PLY
            JSL   L070CC7
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L084757     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00CA
            TCS
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   #$000F
            STA   $CE
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0034
            LDA   [$F8],Y
            CLC
            ADC   #$0004
            STAL  L0E2E62
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            STAL  L0E2E60
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0038
            LDA   [$F8],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0034
            LDA   [$F8],Y
            PLX
            STX   $F8
            CLC
            ADC   $F8
            SEC
            SBC   #$0005
            STAL  L0E2E66
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   [$F8]
            PHA
            LDA   #$000F
            SEC
            JSL   L0D151F
            PLA
            CLC
            ADC   $CE
            CLC
            ADC   #$000C
            STAL  L0E2E64
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            PEA   ^L0E2E60
            PEA   L0E2E60
            JSL   L0C0A3E
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$000C
            BCC   L084824
            INX
L084824     PHX
            PHA
            JSL   L0C0A3E
            PLY
            PLY
            PLY
            PLY
            PEA   $0002
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            JSL   L0A0518
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            LDA   $F0
            CLC
            ADC   #$0006
            SEC
            SBC   $CE
            PHA
            LDA   #$000F
            SEC
            JSL   L0D14B6
            PLY
            SEC
            SBC   #$0001
            STA   $E6
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0016
            LDA   [$F8],Y
            PHA
            LDA   $E6
            PLX
            STX   $F8
            CLC
            ADC   $F8
            SEC
            SBC   #$0001
            STA   $E4
            LDA   $E4
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
            BCC   L0848AE
            INC   $FA
L0848AE     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0848B8
            INC   $FA
L0848B8     LDA   [$F8]
            CMP   #$0008
            BNE   L0848C5
            LDA   #$0000
            BRL   L084B17
L0848C5     LDA   $F6
            SEC
            SBCL  L0E2E66
            BEQ   L0848ED
            BVS   L0848D3
            EOR   #$8000
L0848D3     BPL   L0848ED
            LDA   $F6
            SEC
            SBCL  L0E2E66
            PHA
            LDA   $F2
            PLX
            STX   $F8
            SEC
            SBC   $F8
            STA   $F2
            LDAL  L0E2E66
            STA   $F6
L0848ED     LDA   $E6
            CLC
            ADC   #$0001
            PHA
            PEA   $001E
            JSL   L011FF5
            PLY
            SEC
            JSL   L0D151F
            PLA
            CLC
            ADC   $CE
            STA   $F0
            PEA   $0018
            JSL   L011FF5
            PLY
            PHA
            LDA   $F0
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STA   $F4
            LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$000C
            LDA   [$F8],Y
            CMP   $F0
            BNE   L08496B
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
            BCC   L084958
            INC   $FA
L084958     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L084962
            INC   $FA
L084962     LDA   [$F8]
            CMP   $F2
            BNE   L08496B
            BRL   L084B13
L08496B     JSL   L070D92
            PEI   $F4
            LDAL  L0E2E66
            PHA
            PEI   $F0
            LDAL  L0E2E62
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E8
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $FFFF
            PEA   $FFFE
            PEA   $0000
            TDC
            CLC
            ADC   #$00E8
            PHA
            JSL   L0C0D36
            PLY
            PLY
            PLY
            PLY
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00E8
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEI   $E4
            PEI   $E6
            JSL   L084B21
            PLY
            PLY
            PLY
            PLY
            LDA   $E4
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
            BCC   L0849ED
            INC   $FA
L0849ED     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0849F7
            INC   $FA
L0849F7     LDA   [$F8]
            SEC
            SBC   #$0000
            BNE   L084A02
            BRL   L084A75
L084A02     BVS   L084A07
            EOR   #$8000
L084A07     BMI   L084A0C
            BRL   L084A75
L084A0C     STZ   $E2
            STZ   $E0
            BRA   L084A41
L084A12     PEI   $E2
            PEI   $E4
            JSL   L08340A
            PLY
            PLY
            TAY
            BNE   L084A29
            LDA   $E2
            CLC
            ADC   #$0001
            STA   $E2
            BRA   L084A12
L084A29     PEA   $0000
            PEI   $E2
            PEI   $E6
            JSL   L0839D5
            PLY
            PLY
            PLY
            LDA   $E2
            CLC
            ADC   #$0001
            STA   $E2
            INC   $E0
L084A41     LDA   $E4
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
            BCC   L084A5D
            INC   $FA
L084A5D     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L084A67
            INC   $FA
L084A67     LDA   [$F8]
            SEC
            SBC   $E0
            BEQ   L084A75
            BVS   L084A73
            EOR   #$8000
L084A73     BMI   L084A12
L084A75     LDAL  L0E00D8
            STA   $CC
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
            JSL   L0705A6
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
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $CC
            LDY   #$0052
            STA   [$F8],Y
            PEA   $0001
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0052
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
            JSL   L070CC7
            BRA   L084B17
L084B13     JSL   L070CC7
L084B17     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L084B21     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00DC
            TCS
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDY   #$0014
            LDA   [$F0],Y
            STA   $EC
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDY   #$000A
            LDA   [$F0],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDY   #$0006
            LDA   [$F0],Y
            PHA
            JSL   L083574
            PLY
            PLY
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDY   #$0006
            LDA   [$F0],Y
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDA   #$0050
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084B8C
            INC   $F2
L084B8C     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084B96
            INC   $F2
L084B96     LDA   [$F0]
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDY   #$0006
            LDA   [$F0],Y
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDA   #$0050
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084BC6
            INC   $F2
L084BC6     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084BD0
            INC   $F2
L084BD0     PLA
            STA   [$F0]
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDY   #$0006
            LDA   [$F0],Y
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDA   #$0050
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084BFC
            INC   $F2
L084BFC     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084C06
            INC   $F2
L084C06     LDA   [$F0]
            SEC
            SBC   #$0000
            BEQ   L084C2A
            BVS   L084C13
            EOR   #$8000
L084C13     BPL   L084C2A
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDY   #$0006
            LDA   [$F0],Y
            PHA
            JSL   L0837BF
            PLY
L084C2A     LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDY   #$0008
            LDA   [$F0],Y
            CLC
            ADC   #$0001
            PHA
            PEA   $001E
            JSL   L011FF5
            PLY
            SEC
            JSL   L0D151F
            PLA
            STA   $EE
            PEA   $001E
            JSL   L011FF5
            PLY
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDY   #$0002
            LDA   [$F0],Y
            PLX
            STX   $F0
            SEC
            SBC   $F0
            PHA
            LDA   $EE
            PLX
            STX   $F0
            CLC
            ADC   $F0
            STA   $EE
            PEA   $0018
            JSL   L011FF5
            PLY
            PHA
            LDA   $EE
            PLX
            STX   $F0
            CLC
            ADC   $F0
            PHA
            LDA   $EC
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
            LDA   #$0054
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084CA7
            INC   $F2
L084CA7     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084CB1
            INC   $F2
L084CB1     LDA   [$F0]
            PHA
            PEI   $EE
            LDA   $EC
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
            LDA   #$0052
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084CD4
            INC   $F2
L084CD4     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084CDE
            INC   $F2
L084CDE     LDA   [$F0]
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            PEA   $FFFF
            PEA   $FFFE
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            JSL   L0C0D36
            PLY
            PLY
            PLY
            PLY
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            JSL   L0C0DC8
            PLY
            PLY
            PLY
            PEI   $FF
            PEI   $FD
            PEI   $FB
            JSL   L084EF3
            PLY
            PLY
            PLY
            STA   $DE
            LDA   $FB
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDA   #$0050
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084D4B
            INC   $F2
L084D4B     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084D55
            INC   $F2
L084D55     LDA   [$F0]
            CLC
            ADC   #$0001
            PHA
            LDA   $FB
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDA   #$0050
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084D78
            INC   $F2
L084D78     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084D82
            INC   $F2
L084D82     PLA
            STA   [$F0]
            LDX   L0F0038
            LDA   L0F0036
            STA   $F0
            STX   $F2
            LDY   #$000A
            LDA   [$F0],Y
            PHA
            PEI   $FB
            JSL   L083497
            PLY
            PLY
            LDA   $EC
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
            LDA   #$0052
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084DBB
            INC   $F2
L084DBB     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084DC5
            INC   $F2
L084DC5     LDA   [$F0]
            PHA
            LDA   $EC
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
            LDA   #$0054
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084DE6
            INC   $F2
L084DE6     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084DF0
            INC   $F2
L084DF0     LDA   [$F0]
            PLX
            STX   $F0
            SEC
            SBC   $F0
            STA   $EA
            LDY   #$0002
            LDA   [$FD],Y
            PHA
            LDY   #$0006
            LDA   [$FD],Y
            PLX
            STX   $F0
            SEC
            SBC   $F0
            STA   $E8
            LDA   $EA
            CMP   $E8
            BEQ   L084E4B
            LDA   $E8
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLY
            PHA
            LDA   $EC
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
            LDA   #$0056
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084E3E
            INC   $F2
L084E3E     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084E48
            INC   $F2
L084E48     PLA
            STA   [$F0]
L084E4B     LDY   #$0002
            LDA   [$FD],Y
            PHA
            LDA   $EC
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
            LDA   #$0052
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084E6F
            INC   $F2
L084E6F     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084E79
            INC   $F2
L084E79     PLA
            STA   [$F0]
            LDY   #$0006
            LDA   [$FD],Y
            PHA
            LDA   $EC
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
            LDA   #$0054
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084EA0
            INC   $F2
L084EA0     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084EAA
            INC   $F2
L084EAA     PLA
            STA   [$F0]
            LDA   $EC
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
            LDA   #$0050
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084ECB
            INC   $F2
L084ECB     PLA
            CLC
            ADC   $F0
            STA   $F0
            BCC   L084ED5
            INC   $F2
L084ED5     LDA   $FB
            STA   [$F0]
            PEI   $FB
            JSL   L0837BF
            PLY
            LDA   $DE
            BEQ   L084EEB
            PEI   $FB
            JSL   L085064
            PLY
L084EEB     TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L084EF3     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00D8
            TCS
            STZ   $DA
            LDA   $FB
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F2
            STX   $F4
            LDA   #$0050
            CLC
            ADC   $F2
            STA   $F2
            BCC   L084F1C
            INC   $F4
L084F1C     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L084F26
            INC   $F4
L084F26     LDA   [$F2]
            CMP   #$0000
            BNE   L084F33
            LDA   #$0000
            BRL   L08505A
L084F33     STZ   $F0
            STZ   $EE
L084F37     LDA   #$0001
            BNE   L084F3F
            BRL   L085058
L084F3F     PEI   $EE
            PEI   $FB
            JSL   L08340A
            PLY
            PLY
            TAY
            BNE   L084F4F
            BRL   L08504D
L084F4F     LDA   $F0
            CLC
            ADC   #$0001
            STA   $F0
            LDA   $EE
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F2
            STX   $F4
            LDA   #$0056
            CLC
            ADC   $F2
            STA   $F2
            BCC   L084F73
            INC   $F4
L084F73     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L084F7D
            INC   $F4
L084F7D     LDA   [$F2]
            STA   $EC
            LDY   #$0004
            LDA   [$FD],Y
            PHA
            LDA   $EC
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
            LDA   #$0054
            CLC
            ADC   $F2
            STA   $F2
            BCC   L084FA5
            INC   $F4
L084FA5     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L084FAF
            INC   $F4
L084FAF     LDA   [$F2]
            PHA
            LDA   [$FD]
            PHA
            LDA   $EC
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
            BCC   L084FD3
            INC   $F4
L084FD3     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L084FDD
            INC   $F4
L084FDD     LDA   [$F2]
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
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            PEI   $FF
            PEI   $FD
            PEA   $0000
            TDC
            CLC
            ADC   #$00DC
            PHA
            JSL   L0C0AF2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STA   $DA
            LDA   $DA
            BNE   L085049
            LDA   $FB
            ASL
            ASL
            ASL
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F2
            STX   $F4
            LDA   #$0050
            CLC
            ADC   $F2
            STA   $F2
            BCC   L085039
            INC   $F4
L085039     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L085043
            INC   $F4
L085043     LDA   [$F2]
            CMP   $F0
            BNE   L08504D
L085049     LDA   $DA
            BRA   L08505A
L08504D     LDA   $EE
            CLC
            ADC   #$0001
            STA   $EE
            BRL   L084F37
L085058     LDA   $DA
L08505A     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L085064     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00E6
            TCS
            LDAL  L0E2E66
            SEC
            SBCL  L0E2E62
            CLC
            ADC   #$0001
            STA   $F4
            LDA   $F4
            PHA
            LDA   $FF
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
            BCC   L08509D
            INC   $F8
L08509D     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0850A7
            INC   $F8
L0850A7     LDA   [$F6]
            SEC
            JSL   L0D14B6
            PLY
            STA   $F2
            LDAL  L0E2E62
            STA   $F0
            STZ   $EE
            STZ   $EC
L0850BB     LDA   $FF
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
            BCC   L0850D7
            INC   $F8
L0850D7     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0850E1
            INC   $F8
L0850E1     LDA   [$F6]
            SEC
            SBC   $EC
            BNE   L0850EB
            BRL   L0852DB
L0850EB     BVS   L0850F0
            EOR   #$8000
L0850F0     BMI   L0850F5
            BRL   L0852DB
L0850F5     PEI   $EE
            PEI   $FF
            JSL   L08340A
            PLY
            PLY
            TAY
            BNE   L085105
            BRL   L0852D6
L085105     INC   $EC
            LDA   $EE
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
            BCC   L085123
            INC   $F8
L085123     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L08512D
            INC   $F8
L08512D     LDA   [$F6]
            STA   $EA
            LDA   $EA
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
            BCC   L08514F
            INC   $F8
L08514F     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L085159
            INC   $F8
L085159     LDA   $F0
            STA   [$F6]
            LDA   $EA
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
            BCC   L08517B
            INC   $F8
L08517B     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L085185
            INC   $F8
L085185     LDA   $F0
            STA   [$F6]
            LDA   $EA
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
            BCC   L0851A7
            INC   $F8
L0851A7     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0851B1
            INC   $F8
L0851B1     LDA   [$F6]
            CLC
            ADC   $F2
            PHA
            LDA   $EA
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
            BCC   L0851D5
            INC   $F8
L0851D5     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0851DF
            INC   $F8
L0851DF     PLA
            STA   [$F6]
            LDA   $EA
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
            BCC   L085200
            INC   $F8
L085200     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L08520A
            INC   $F8
L08520A     LDA   [$F6]
            SEC
            SBC   #$0004
            PHA
            LDA   $EA
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
            BCC   L08522F
            INC   $F8
L08522F     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L085239
            INC   $F8
L085239     PLA
            STA   [$F6]
            LDA   $EA
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
            BCC   L08525A
            INC   $F8
L08525A     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L085264
            INC   $F8
L085264     LDA   [$F6]
            PHA
            LDA   $EA
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
            BCC   L085285
            INC   $F8
L085285     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L08528F
            INC   $F8
L08528F     LDA   [$F6]
            PLX
            STX   $F6
            SEC
            SBC   $F6
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLY
            STA   $E8
            LDA   $EA
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
            BCC   L0852C1
            INC   $F8
L0852C1     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0852CB
            INC   $F8
L0852CB     LDA   $E8
            STA   [$F6]
            LDA   $F0
            CLC
            ADC   $F2
            STA   $F0
L0852D6     INC   $EE
            BRL   L0850BB
L0852DB     TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0852E3     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            CMP   #$0000
            BEQ   L0852F7
            BRA   L085304
L0852F7     PEA   $FFFF
            JSL   L0853C0
            PLY
            BRL   L0853B8
            BRA   L08530B
L085304     CMP   #$0001
            BEQ   L08530B
            BRA   L085318
L08530B     PEA   $FFFC
            JSL   L0853C0
            PLY
            BRL   L0853B8
            BRA   L08531F
L085318     CMP   #$0002
            BEQ   L08531F
            BRA   L08532C
L08531F     PEA   $0001
            JSL   L0853C0
            PLY
            BRL   L0853B8
            BRA   L085333
L08532C     CMP   #$0003
            BEQ   L085333
            BRA   L085340
L085333     PEA   $0004
            JSL   L0853C0
            PLY
            BRL   L0853B8
            BRA   L085347
L085340     CMP   #$0004
            BEQ   L085347
            BRA   L085358
L085347     PEA   $0001
            PEA   $0001
            JSL   L085431
            PLY
            PLY
            BRL   L0853B8
            BRA   L08535F
L085358     CMP   #$0005
            BEQ   L08535F
            BRA   L085370
L08535F     PEA   $0001
            PEA   $FFFF
            JSL   L085431
            PLY
            PLY
            BRL   L0853B8
            BRA   L085377
L085370     CMP   #$0006
            BEQ   L085377
            BRA   L085391
L085377     PEA   $0001
            LDX   L0F0038
            LDA   L0F0036
            STA   $F6
            STX   $F8
            LDA   [$F6]
            PHA
            JSL   L085431
            PLY
            PLY
            BRA   L0853B8
            BRA   L085398
L085391     CMP   #$0007
            BEQ   L085398
            BRA   L0853B8
L085398     PEA   $0001
            LDA   #$FFFF
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F6
            STX   $F8
            LDA   [$F6]
            SEC
            JSL   L0D151F
            PLA
            PHA
            JSL   L085431
            PLY
            PLY
L0853B8     TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0853C0     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F0
            TCS
            JSL   L074043
            STA   $F2
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$002E
            LDA   [$F6],Y
            CLC
            ADC   $FF
            STA   $F4
            LDA   $F4
            SEC
            SBC   $F2
            BEQ   L0853F9
            BVS   L0853F1
            EOR   #$8000
L0853F1     BPL   L0853F9
            LDA   $F2
            STA   $F4
            BRA   L085408
L0853F9     LDA   $F4
            SEC
            SBC   #$0000
            BVS   L085404
            EOR   #$8000
L085404     BMI   L085408
            STZ   $F4
L085408     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$002E
            LDA   [$F6],Y
            CMP   $F4
            BNE   L085420
            LDA   #$0000
            BRA   L085427
L085420     PEI   $F4
            JSL   L0A0C4A
            PLY
L085427     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L085431     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00CC
            TCS
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDY   #$0016
            LDA   [$F4],Y
            CLC
            ADC   $FD
            STA   $F2
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   [$F4]
            PHA
            LDA   #$0020
            PLX
            STX   $F4
            SEC
            SBC   $F4
            CLC
            ADC   #$0001
            STA   $EC
            LDA   $F2
            SEC
            SBC   $EC
            BEQ   L085480
            BVS   L085478
            EOR   #$8000
L085478     BPL   L085480
            LDA   $EC
            STA   $F2
            BRA   L085492
L085480     LDA   $F2
            SEC
            SBC   #$0001
            BVS   L08548B
            EOR   #$8000
L08548B     BMI   L085492
            LDA   #$0001
            STA   $F2
L085492     LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDY   #$0016
            LDA   [$F4],Y
            PHA
            LDA   $F2
            PLX
            STX   $F4
            SEC
            SBC   $F4
            STA   $F0
            LDA   $F0
            CMP   #$0000
            BNE   L0854B9
            LDA   #$0000
            BRL   L0856F2
L0854B9     LDA   $FF
            BEQ   L0854F4
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$000A
            LDA   [$F4],Y
            BEQ   L0854F0
            PEA   $0000
            JSL   L07231B
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$005A
            LDA   [$F4],Y
            CMP   #$0000
            BEQ   L0854F0
            LDA   #$0000
            BRL   L0856F2
L0854F0     JSL   L070D92
L0854F4     LDA   #$000F
            STA   $EE
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDY   #$0004
            LDA   [$F4],Y
            CLC
            ADC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$001C
            LDA   [$F4],Y
            PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDY   #$0002
            LDA   [$F4],Y
            SEC
            SBC   #$0001
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F4
            STX   $F6
            LDY   #$001A
            LDA   [$F4],Y
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
            PEI   $E6
            PEI   $E8
            PEI   $E2
            PEI   $E4
            PEA   $0000
            TDC
            CLC
            ADC   #$00DA
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $F0
            SEC
            SBC   #$0000
            BVS   L08557E
            EOR   #$8000
L08557E     BMI   L085588
            LDA   $F0
            EOR   #$FFFF
            INC
            BRA   L08558A
L085588     LDA   $F0
L08558A     PHA
            LDA   $EE
            SEC
            JSL   L0D151F
            PLA
            STA   $EC
            LDA   $F0
            SEC
            SBC   #$0000
            BVS   L0855A0
            EOR   #$8000
L0855A0     BMI   L0855AA
            LDA   $F0
            EOR   #$FFFF
            INC
            BRA   L0855AC
L0855AA     LDA   $F0
L0855AC     PHA
            LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   [$F4]
            PLX
            STX   $F4
            SEC
            SBC   $F4
            BVS   L0855C4
            EOR   #$8000
L0855C4     BMI   L0855C9
            BRL   L085673
L0855C9     LDA   $F0
            SEC
            SBC   #$0000
            BVS   L0855D4
            EOR   #$8000
L0855D4     BMI   L0855EB
            LDA   $E2
            CLC
            ADC   $EC
            CLC
            ADC   #$0002
            STA   $E6
            LDA   $DE
            SEC
            SBC   #$0003
            STA   $DE
            BRA   L0855FC
L0855EB     LDA   $EC
            CLC
            ADC   #$0002
            PHA
            LDA   $E6
            PLX
            STX   $F4
            SEC
            SBC   $F4
            STA   $E2
L0855FC     LDA   $F0
            PHA
            LDA   $EE
            SEC
            JSL   L0D151F
            PLA
            STA   $EA
            LDA   $DE
            SEC
            SBC   $DA
            SEC
            SBC   $EC
            BVS   L085616
            EOR   #$8000
L085616     BPL   L085673
            PHX
            PHA
            _NewRgn
            STA   L0F0779
            PLA
            PLX
            STX   $D8
            STA   $D6
            PEA   $0001
            _SetSolidBackPat
            STA   L0F0779
            PEA   $0000
            TDC
            CLC
            ADC   #$00DA
            PHA
            PEA   $0000
            LDA   $EA
            EOR   #$FFFF
            INC
            PHA
            PEI   $D8
            PEI   $D6
            _ScrollRect
            STA   L0F0779
            PEA   $0003
            _SetSolidBackPat
            STA   L0F0779
            PEI   $D8
            PEI   $D6
            _DisposeRgn
            STA   L0F0779
L085673     LDX   L0F0038
            LDA   L0F0036
            STA   $F4
            STX   $F6
            LDA   $F2
            LDY   #$0016
            STA   [$F4],Y
            JSL   L083E24
            JSL   L083CF4
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            _InvalRect
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _BeginUpdate
            STA   L0F0779
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            JSL   L073E52
            PLY
            PLY
            JSL   L073EAC
            JSL   L073E73
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _EndUpdate
            STA   L0F0779
            LDA   $FF
            BEQ   L0856F2
            PEA   $0000
            PEA   $0001
            PEA   $0001
            JSL   L070543
            PLY
            PLY
            PLY
            JSL   L070CC7
L0856F2     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0856FC     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EE
            TCS
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L085710
            DEX
L085710     STX   $F4
            STA   $F2
            LDX   $F4
            LDA   $F2
            PHX
            PHA
            JSL   L074043
            LDX   #$0000
            TAY
            BPL   L085725
            DEX
L085725     SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDX   #$0000
            LDA   #$03E8
            SEC
            JSL   L0D15C0
            PLY
            PLY
            STX   $F4
            STA   $F2
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$002E
            LDA   [$F6],Y
            PHA
            LDX   $F4
            LDA   $F2
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   $F0
            PEI   $F0
            JSL   L0853C0
            PLY
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L08576A     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F0
            TCS
            LDA   $FF
            PHA
            LDA   #$0020
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDA   #$03E8
            SEC
            JSL   L0D14B6
            PLY
            STA   $F4
            LDX   L0F0038
            LDA   L0F0036
            STA   $F6
            STX   $F8
            LDY   #$0016
            LDA   [$F6],Y
            PHA
            LDA   $F4
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   $F2
            PEA   $0001
            PEI   $F2
            JSL   L085431
            PLY
            PLY
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL


