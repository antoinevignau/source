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

	use	SEG3K.X.S
	
GSOS	=	$E100A8

*-----------------------------------

L090000     ENT
            PHD
            TSC
            SEC
            SBC   #$00E7
            TCD
            ADC   #$00DE
            TCS
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   $EF
            STAL  L0E14B6,X
            PEA   $0000
            PEA   $0008
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            TXA
            CLC
            ADC   #L0E14B8
            TAX
            LDA   #^L0E14B8
            BCC   L09003D
            INC
L09003D     PHA
            PHX
            PEI   $F3
            PEI   $F1
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   $F5
            STAL  L0E14C0,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   $F7
            STAL  L0E14C2,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   $F9
            STAL  L0E14C4,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   $FB
            STAL  L0E14C6,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   $FD
            STAL  L0E14C8,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   $FF
            STAL  L0E14CA,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   #$0000
            STAL  L0E14CC,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   #$0000
            STAL  L0E14CE,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   #$0000
            STAL  L0E14D0,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   #$0000
            STAL  L0E14D2,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14C0,X
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14D4,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14B8,X
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14BC,X
            PLX
            STX   $E4
            SEC
            SBC   $E4
            CLC
            ADC   #$0001
            STA   $E2
            LDA   $E2
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14C0,X
            SEC
            JSL   L0D14B6
            PLY
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14D6,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14D6,X
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14C0,X
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDA   $E2
            PLX
            STX   $E4
            SEC
            SBC   $E4
            CLC
            ADC   #$0001
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14D8,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14D8,X
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14C0,X
            PLX
            STX   $E4
            SEC
            SBC   $E4
            BNE   L090208
            BRL   L090273
L090208     BVS   L09020D
            EOR   #$8000
L09020D     BPL   L090273
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14C0,X
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14D8,X
            PLX
            STX   $E4
            CLC
            ADC   $E4
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14D8,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14D6,X
            SEC
            SBC   #$0001
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14D6,X
L090273     LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14BA,X
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14BE,X
            PLX
            STX   $E4
            SEC
            SBC   $E4
            CLC
            ADC   #$0001
            STA   $E0
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14BA,X
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14DA,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14D8,X
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14B8,X
            PLX
            STX   $E4
            CLC
            ADC   $E4
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14DC,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   $E0
            STAL  L0E14DE,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14D8,X
            PHA
            LDA   $E2
            PLX
            STX   $E4
            SEC
            SBC   $E4
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14E0,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14C8,X
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14BA,X
            PLX
            STX   $E4
            CLC
            ADC   $E4
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14E2,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14B8,X
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14E4,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14C8,X
            PHA
            LDA   $E0
            PLX
            STX   $E4
            SEC
            SBC   $E4
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14E6,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   $E2
            STAL  L0E14E8,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14DA,X
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14EA,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14E4,X
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14EC,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   $E0
            STAL  L0E14EE,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   $E2
            STAL  L0E14F0,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14D6,X
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14C0,X
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14F2,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E14E6,X
            PHA
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E14F4,X
            LDA   $ED
            PHA
            LDA   #$01C0
            CLC
            JSL   L0D151F
            PLA
            TAX
            TXA
            CLC
            ADC   #L0E14B6
            LDX   #^L0E14B6
            BCC   L0904C8
            INX
L0904C8     STX   L0F0030
            STA   L0F002E
            JSL   L0904DA
            TDC
            CLC
            ADC   #$00E7
            TCS
            PLD
            RTL

L0904DA     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            STZ   $F6
            BRL   L090618
L0904EA     LDA   $F6
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
            LDA   #$0040
            CLC
            ADC   $F8
            STA   $F8
            BCC   L09050D
            INC   $FA
L09050D     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L090517
            INC   $FA
L090517     LDA   #$0000
            STA   [$F8]
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
            LDA   #$0042
            CLC
            ADC   $F8
            STA   $F8
            BCC   L09053F
            INC   $FA
L09053F     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L090549
            INC   $FA
L090549     LDA   #$0000
            STA   [$F8]
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
            LDA   #$0044
            CLC
            ADC   $F8
            STA   $F8
            BCC   L090571
            INC   $FA
L090571     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L09057B
            INC   $FA
L09057B     LDA   #$0000
            STA   [$F8]
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
            BCC   L0905A3
            INC   $FA
L0905A3     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0905AD
            INC   $FA
L0905AD     LDA   #$0000
            STA   [$F8]
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
            LDA   #$0048
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0905D5
            INC   $FA
L0905D5     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0905DF
            INC   $FA
L0905DF     LDA   #$0000
            STA   [$F8]
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
            LDA   #$004A
            CLC
            ADC   $F8
            STA   $F8
            BCC   L090607
            INC   $FA
L090607     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L090611
            INC   $FA
L090611     LDA   #$0000
            STA   [$F8]
            INC   $F6
L090618     LDA   $F6
            SEC
            SBC   #$0020
            BVS   L090623
            EOR   #$8000
L090623     BMI   L090628
            BRL   L0904EA
L090628     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L090630     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   [$F8]
            CMP   #$0000
            BNE   L09065F
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$002C
            LDA   [$F8],Y
            STA   $F2
            BRA   L090670
L09065F     LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0044
            LDA   [$F8],Y
            STA   $F2
L090670     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            PLA
            STA   [$F8]
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   [$F8]
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            PLA
            LDY   #$0018
            STA   [$F8],Y
            JSL   L0904DA
            STZ   $F6
            BRL   L090789
L0906B3     LDA   $F6
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
            BCC   L0906D1
            INC   $FA
L0906D1     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0906DB
            INC   $FA
L0906DB     LDA   [$F8]
            PHA
            JSL   L0B110B
            PLY
            STA   $F4
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
            LDA   #$0040
            CLC
            ADC   $F8
            STA   $F8
            BCC   L090708
            INC   $FA
L090708     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L090712
            INC   $FA
L090712     LDA   $F6
            STA   [$F8]
            LDA   $F4
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
            BCC   L090739
            INC   $FA
L090739     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L090743
            INC   $FA
L090743     LDA   $F6
            STA   [$F8]
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            PHA
            LDA   $F4
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
            LDA   #$0048
            CLC
            ADC   $F8
            STA   $F8
            BCC   L09077A
            INC   $FA
L09077A     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L090784
            INC   $FA
L090784     PLA
            STA   [$F8]
            INC   $F6
L090789     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   $F6
            BEQ   L0907A7
            BVS   L0907A2
            EOR   #$8000
L0907A2     BPL   L0907A7
            BRL   L0906B3
L0907A7     STZ   $F6
            BRL   L090876
L0907AC     LDA   $F6
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
            LDA   #$0044
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0907CF
            INC   $FA
L0907CF     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0907D9
            INC   $FA
L0907D9     LDA   $F2
            STA   [$F8]
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
            LDA   #$004A
            CLC
            ADC   $F8
            STA   $F8
            BCC   L090800
            INC   $FA
L090800     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L09080A
            INC   $FA
L09080A     LDA   [$F8]
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
            BCC   L090828
            INC   $FA
L090828     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L090832
            INC   $FA
L090832     LDA   [$F8]
            SEC
            SBC   #$0001
            PHA
            LDA   $F2
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STA   $F2
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
            BCC   L090866
            INC   $FA
L090866     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L090870
            INC   $FA
L090870     LDA   $F2
            STA   [$F8]
            INC   $F6
L090876     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   $F6
            BEQ   L090894
            BVS   L09088F
            EOR   #$8000
L09088F     BPL   L090894
            BRL   L0907AC
L090894     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L09089C     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            CMP   #$0000
            BEQ   L0908B0
            BRA   L0908BD
L0908B0     PEA   $FFFF
            JSL   L090CB7
            PLY
            BRL   L09099D
            BRA   L0908C4
L0908BD     CMP   #$0001
            BEQ   L0908C4
            BRA   L0908E2
L0908C4     LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$0020
            LDA   [$F6],Y
            EOR   #$FFFF
            INC
            PHA
            JSL   L090CB7
            PLY
            BRL   L09099D
            BRA   L0908E9
L0908E2     CMP   #$0002
            BEQ   L0908E9
            BRA   L0908F6
L0908E9     PEA   $0001
            JSL   L090CB7
            PLY
            BRL   L09099D
            BRA   L0908FD
L0908F6     CMP   #$0003
            BEQ   L0908FD
            BRA   L090917
L0908FD     LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$0020
            LDA   [$F6],Y
            PHA
            JSL   L090CB7
            PLY
            BRL   L09099D
            BRA   L09091E
L090917     CMP   #$0004
            BEQ   L09091E
            BRA   L090938
L09091E     LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$000C
            LDA   [$F6],Y
            PHA
            JSL   L0909A5
            PLY
            BRL   L09099D
            BRA   L09093F
L090938     CMP   #$0005
            BEQ   L09093F
            BRA   L09095D
L09093F     LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$000C
            LDA   [$F6],Y
            EOR   #$FFFF
            INC
            PHA
            JSL   L0909A5
            PLY
            BRL   L09099D
            BRA   L090964
L09095D     CMP   #$0006
            BEQ   L090964
            BRA   L09097D
L090964     LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$003E
            LDA   [$F6],Y
            PHA
            JSL   L0909A5
            PLY
            BRA   L09099D
            BRA   L090984
L09097D     CMP   #$0007
            BEQ   L090984
            BRA   L09099D
L090984     LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$003E
            LDA   [$F6],Y
            EOR   #$FFFF
            INC
            PHA
            JSL   L0909A5
            PLY
L09099D     TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L0909A5     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00D4
            TCS
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDA   [$F6]
            SEC
            SBC   #$0001
            BVS   L0909C5
            EOR   #$8000
L0909C5     BMI   L0909CC
            STZ   $FF
            BRL   L090A8D
L0909CC     LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$0030
            LDA   [$F6],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$0044
            LDA   [$F6],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDA   [$F6]
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
            LDA   #$003A
            CLC
            ADC   $F6
            STA   $F6
            BCC   L090A19
            INC   $F8
L090A19     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L090A23
            INC   $F8
L090A23     LDA   [$F6]
            PLX
            STX   $F6
            SEC
            SBC   $F6
            CLC
            ADC   #$0001
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   $DC
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$0044
            LDA   [$F6],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$002C
            LDA   [$F6],Y
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   $DA
            LDA   $DA
            CLC
            ADC   $FF
            STA   $F2
            LDA   $F2
            SEC
            SBC   $DC
            BEQ   L090A77
            BVS   L090A71
            EOR   #$8000
L090A71     BPL   L090A77
            LDA   $DC
            STA   $F2
L090A77     LDA   $F2
            SEC
            SBC   #$0000
            BVS   L090A82
            EOR   #$8000
L090A82     BMI   L090A86
            STZ   $F2
L090A86     LDA   $F2
            SEC
            SBC   $DA
            STA   $FF
L090A8D     LDA   $FF
            CMP   #$0000
            BNE   L090A97
            BRL   L090CA9
L090A97     LDA   $FF
            STA   $EE
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$002C
            BCC   L090AB9
            INX
L090AB9     PHX
            PHA
            JSL   L0C0A98
            PLY
            PLY
            PLY
            PLY
            LDA   $E6
            SEC
            SBC   #$0001
            STA   $E6
            PEI   $EA
            LDA   $EC
            CLC
            ADC   #$0001
            PHA
            PEI   $E6
            PEI   $E8
            PEA   $0000
            TDC
            CLC
            ADC   #$00DE
            PHA
            JSL   L0C0BD2
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   $FF
            SEC
            SBC   #$0000
            BVS   L090AF8
            EOR   #$8000
L090AF8     BMI   L090B02
            LDA   $FF
            EOR   #$FFFF
            INC
            BRA   L090B04
L090B02     LDA   $FF
L090B04     STA   $F0
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$0030
            LDA   [$F6],Y
            SEC
            SBC   $F0
            BVS   L090B1D
            EOR   #$8000
L090B1D     BPL   L090B46
            LDA   $FF
            SEC
            SBC   #$0000
            BEQ   L090B3F
            BVS   L090B2C
            EOR   #$8000
L090B2C     BPL   L090B3F
            LDA   $EC
            SEC
            SBC   $F0
            STA   $E8
            LDA   $E8
            SEC
            SBC   #$0001
            STA   $E8
            BRA   L090B46
L090B3F     LDA   $E8
            CLC
            ADC   $F0
            STA   $EC
L090B46     LDA   $FF
            SEC
            SBC   #$0000
            BEQ   L090B59
            BVS   L090B53
            EOR   #$8000
L090B53     BPL   L090B59
            LDA   $E0
            INC   $E0
L090B59     STZ   $F4
            BRL   L090C26
L090B5E     LDA   $F4
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
            LDA   #$0044
            CLC
            ADC   $F6
            STA   $F6
            BCC   L090B81
            INC   $F8
L090B81     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L090B8B
            INC   $F8
L090B8B     LDA   [$F6]
            SEC
            SBC   $EE
            PHA
            LDA   $F4
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
            LDA   #$0044
            CLC
            ADC   $F6
            STA   $F6
            BCC   L090BB4
            INC   $F8
L090BB4     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L090BBE
            INC   $F8
L090BBE     PLA
            STA   [$F6]
            LDA   $F4
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
            LDA   #$0046
            CLC
            ADC   $F6
            STA   $F6
            BCC   L090BE4
            INC   $F8
L090BE4     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L090BEE
            INC   $F8
L090BEE     LDA   [$F6]
            SEC
            SBC   $EE
            PHA
            LDA   $F4
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
            LDA   #$0046
            CLC
            ADC   $F6
            STA   $F6
            BCC   L090C17
            INC   $F8
L090C17     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L090C21
            INC   $F8
L090C21     PLA
            STA   [$F6]
            INC   $F4
L090C26     LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDA   [$F6]
            SEC
            SBC   $F4
            BEQ   L090C41
            BVS   L090C3C
            EOR   #$8000
L090C3C     BPL   L090C41
            BRL   L090B5E
L090C41     LDA   $E4
            SEC
            SBC   $E0
            SEC
            SBC   $F0
            BVS   L090C4E
            EOR   #$8000
L090C4E     BPL   L090C91
            PHX
            PHA
            _NewRgn
            STA   L0F0779
            PLA
            PLX
            STX   $D8
            STA   $D6
            PEA   $0000
            TDC
            CLC
            ADC   #$00DE
            PHA
            LDA   $FF
            EOR   #$FFFF
            INC
            PHA
            PEA   $0000
            PEI   $D8
            PEI   $D6
            _ScrollRect
            STA   L0F0779
            PEI   $D8
            PEI   $D6
            _DisposeRgn
            STA   L0F0779
L090C91     JSL   L091079
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            JSL   L072DF7
            PLY
            PLY
            LDA   #$0000
            BRA   L090CAD
L090CA9     JSL   L091079
L090CAD     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L090CB7     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00D2
            TCS
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$0020
            LDA   [$F6],Y
            PHA
            JSL   L074043
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   $EE
            INC   $EE
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
            SBC   $EE
            BEQ   L090D06
            BVS   L090D00
            EOR   #$8000
L090D00     BPL   L090D06
            LDA   $EE
            STA   $F4
L090D06     LDA   $F4
            SEC
            SBC   #$0000
            BVS   L090D11
            EOR   #$8000
L090D11     BMI   L090D15
            STZ   $F4
L090D15     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDY   #$002E
            LDA   [$F6],Y
            PHA
            LDA   $F4
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   $F2
            LDA   $F2
            CMP   #$0000
            BNE   L090D39
            BRL   L090EDD
L090D39     LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$000A
            LDA   [$F6],Y
            STA   $EC
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDA   $F6
            LDX   $F8
            CLC
            ADC   #$0024
            BCC   L090D68
            INX
L090D68     PHX
            PHA
            JSL   L0C0A98
            PLY
            PLY
            PLY
            PLY
            PEI   $E8
            PEI   $EA
            PEI   $E4
            PEI   $E6
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
            LDA   $F2
            SEC
            SBC   #$0000
            BVS   L090D9A
            EOR   #$8000
L090D9A     BMI   L090DA4
            LDA   $F2
            EOR   #$FFFF
            INC
            BRA   L090DA6
L090DA4     LDA   $F2
L090DA6     PHA
            LDA   $EC
            SEC
            JSL   L0D151F
            PLA
            LDX   #$0000
            TAY
            BPL   L090DB6
            DEX
L090DB6     STX   $DA
            STA   $D8
            LDX   #$0000
            LDA   #$000C
            PHX
            PHA
            LDX   $DA
            LDA   $D8
            JSL   L0D157E
            BVS   L090DCF
            EOR   #$8000
L090DCF     BPL   L090E08
            LDA   $F2
            SEC
            SBC   #$0000
            BVS   L090DDC
            EOR   #$8000
L090DDC     BMI   L090DF4
            LDA   $E4
            LDX   #$0000
            TAY
            BPL   L090DE7
            DEX
L090DE7     CLC
            ADC   $D8
            PHA
            TXA
            ADC   $DA
            TAX
            PLA
            STA   $E8
            BRA   L090E08
L090DF4     LDA   $E8
            LDX   #$0000
            TAY
            BPL   L090DFD
            DEX
L090DFD     SEC
            SBC   $D8
            PHA
            TXA
            SBC   $DA
            TAX
            PLA
            STA   $E4
L090E08     LDA   $F2
            SEC
            SBC   #$0000
            BVS   L090E13
            EOR   #$8000
L090E13     BMI   L090E1D
            LDA   $E0
            SEC
            SBC   #$0001
            STA   $E0
L090E1D     LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDA   $F4
            LDY   #$002E
            STA   [$F6],Y
            LDA   $E0
            SEC
            SBC   $DC
            LDX   #$0000
            TAY
            BPL   L090E3A
            DEX
L090E3A     LDX   #$0000
            TAY
            BPL   L090E41
            DEX
L090E41     PHX
            PHA
            LDX   $DA
            LDA   $D8
            JSL   L0D157E
            BVS   L090E50
            EOR   #$8000
L090E50     BPL   L090EBD
            LDA   $F2
            PHA
            LDA   $EC
            SEC
            JSL   L0D151F
            PLA
            STA   $F0
            PHX
            PHA
            _NewRgn
            STA   L0F0779
            PLA
            PLX
            STX   $D6
            STA   $D4
            LDA   $F0
            SEC
            SBC   #$0000
            BVS   L090E7C
            EOR   #$8000
L090E7C     BMI   L090E86
            LDA   $E0
            CLC
            ADC   #$0001
            STA   $E0
L090E86     LDA   $E2
            CLC
            ADC   #$0001
            STA   $E2
            PEA   $0000
            TDC
            CLC
            ADC   #$00DC
            PHA
            PEA   $0000
            LDA   $F0
            EOR   #$FFFF
            INC
            PHA
            PEI   $D6
            PEI   $D4
            _ScrollRect
            STA   L0F0779
            PEI   $D6
            PEI   $D4
            _DisposeRgn
            STA   L0F0779
L090EBD     JSL   L091202
            LDA   $EA
            CLC
            ADC   #$0001
            STA   $EA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            JSL   L072DF7
            PLY
            PLY
            LDA   #$0000
            BRA   L090EE1
L090EDD     JSL   L091202
L090EE1     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L090EEB     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EC
            TCS
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$0020
            LDA   [$F6],Y
            PHA
            JSL   L074043
            PLX
            STX   $F6
            SEC
            SBC   $F6
            STA   $F0
            INC   $F0
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L090F1D
            DEX
L090F1D     PHX
            PHA
            LDA   $F0
            LDX   #$0000
            TAY
            BPL   L090F28
            DEX
L090F28     SEC
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
            LDX   #$0000
            TAY
            BPL   L090F58
            DEX
L090F58     PHX
            PHA
            LDX   $F4
            LDA   $F2
            JSL   L0D1705
            PLA
            PLX
            STA   $EE
            PEI   $EE
            JSL   L090CB7
            PLY
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L090F75     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EA
            TCS
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$0030
            LDA   [$F6],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$0044
            LDA   [$F6],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDA   [$F6]
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
            LDA   #$003A
            CLC
            ADC   $F6
            STA   $F6
            BCC   L090FCD
            INC   $F8
L090FCD     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L090FD7
            INC   $F8
L090FD7     LDA   [$F6]
            PLX
            STX   $F6
            SEC
            SBC   $F6
            CLC
            ADC   #$0001
            PLX
            STX   $F6
            SEC
            SBC   $F6
            LDX   #$0000
            TAY
            BPL   L090FF0
            DEX
L090FF0     STX   $F4
            STA   $F2
            LDA   $FF
            LDX   #$0000
            TAY
            BPL   L090FFD
            DEX
L090FFD     PHX
            PHA
            LDX   $F4
            LDA   $F2
            SEC
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
            STX   $F0
            STA   $EE
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$0044
            LDA   [$F6],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$002C
            LDA   [$F6],Y
            PLX
            STX   $F6
            SEC
            SBC   $F6
            LDX   #$0000
            TAY
            BPL   L091049
            DEX
L091049     PHX
            PHA
            LDX   $F0
            LDA   $EE
            JSL   L0D1705
            PLA
            PLX
            STA   $EC
            PEI   $EC
            JSL   L0909A5
            PLY
            TDC
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
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L091079     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EA
            TCS
            STZ   $EC
            STZ   $EE
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   [$F8]
            SEC
            SBC   #$0000
            BNE   L09109D
            BRL   L0911B3
L09109D     BVS   L0910A2
            EOR   #$8000
L0910A2     BMI   L0910A7
            BRL   L0911B3
L0910A7     LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0044
            LDA   [$F8],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$002C
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BNE   L0910D1
            BRL   L0911B3
L0910D1     BVS   L0910D6
            EOR   #$8000
L0910D6     BMI   L0910DB
            BRL   L0911B3
L0910DB     LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0044
            LDA   [$F8],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$002C
            LDA   [$F8],Y
            PLX
            STX   $F8
            SEC
            SBC   $F8
            LDX   #$0000
            TAY
            BPL   L091107
            DEX
L091107     STX   $F6
            STA   $F4
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0044
            LDA   [$F8],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   [$F8]
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
            LDA   #$003A
            CLC
            ADC   $F8
            STA   $F8
            BCC   L091148
            INC   $FA
L091148     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L091152
            INC   $FA
L091152     LDA   [$F8]
            PLX
            STX   $F8
            SEC
            SBC   $F8
            CLC
            ADC   #$0001
            LDX   #$0000
            TAY
            BPL   L091165
            DEX
L091165     STX   $F2
            STA   $F0
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0030
            LDA   [$F8],Y
            LDX   #$0000
            TAY
            BPL   L09117F
            DEX
L09117F     PHX
            PHA
            LDX   $F2
            LDA   $F0
            JSL   L0D1705
            PLA
            PLX
            STX   $F2
            STA   $F0
            LDX   #$0000
            LDA   #$03E8
            PHX
            PHA
            LDX   $F6
            LDA   $F4
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
L0911B3     LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $EE
            LDA   $EC
            JSL   L0D157E
            BEQ   L0911CC
            BVS   L0911CA
            EOR   #$8000
L0911CA     BMI   L0911E7
L0911CC     LDX   $EE
            LDA   $EC
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0A16
            LDA   [$F8],Y
            PHA
            JSL   L0912A0
            PLY
            PLY
L0911E7     TDC
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
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L091202     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
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
            STA   $F2
            STZ   $F4
            STZ   $F6
            LDA   $F2
            SEC
            SBC   #$0000
            BEQ   L091277
            BVS   L09123A
            EOR   #$8000
L09123A     BPL   L091277
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
            BPL   L09125A
            DEX
L09125A     SEC
            JSL   L0D166F
            PLA
            PLX
            PHX
            PHA
            LDA   $F2
            LDX   #$0000
            TAY
            BPL   L09126C
            DEX
L09126C     SEC
            JSL   L0D15C0
            PLY
            PLY
            STX   $F6
            STA   $F4
L091277     LDX   $F6
            LDA   $F4
            STA   L0F0121
            LDA   L0F0121
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0A14
            LDA   [$F8],Y
            PHA
            JSL   L0912A0
            PLY
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0912A0     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            SEC
            SBC   #$03E8
            BEQ   L0912BF
            BVS   L0912B8
            EOR   #$8000
L0912B8     BPL   L0912BF
            LDA   #$03E8
            STA   $FF
L0912BF     PEI   $FF
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
            BCC   L0912DA
            INC   $F6
L0912DA     LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            PHX
            PHA
            _SetCtlValue
            STA   L0F0779
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0912F6     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDAL  L0E003A
            STA   L0F0133
            LDAL  L0E0038
            STA   L0F0135
            JSL   L0914A6
            LDA   L0F0123
            CMP   #$0000
            BEQ   L09131D
            BRA   L09132A
L09131D     PEA   $0000
            JSL   L091C6A
            PLY
            BRL   L09149E
            BRA   L091331
L09132A     CMP   #$0001
            BEQ   L091331
            BRA   L09133A
L091331     JSL   L091DCC
            BRL   L09149E
            BRA   L091341
L09133A     CMP   #$0002
            BEQ   L091341
            BRA   L091352
L091341     PEA   $0000
            JSL   L091C6A
            PLY
            JSL   L092198
            BRL   L09149E
            BRA   L091359
L091352     CMP   #$0004
            BEQ   L091359
            BRA   L09136A
L091359     PEA   $0000
            JSL   L091C6A
            PLY
            JSL   L0A0000
            BRL   L09149E
            BRA   L091371
L09136A     CMP   #$0005
            BEQ   L091371
            BRA   L091382
L091371     PEA   $0000
            JSL   L091C6A
            PLY
            JSL   L091C3F
            BRL   L09149E
            BRA   L091389
L091382     CMP   #$0006
            BEQ   L091389
            BRA   L091394
L091389     LDA   #$000A
            STA   L0F0012
            BRL   L09149E
            BRA   L09139B
L091394     CMP   #$0007
            BEQ   L09139B
            BRA   L0913A4
L09139B     JSL   L0A08AD
            BRL   L09149E
            BRA   L0913AB
L0913A4     CMP   #$0008
            BEQ   L0913AB
            BRA   L0913B4
L0913AB     JSL   L0A0997
            BRL   L09149E
            BRA   L0913BB
L0913B4     CMP   #$0009
            BEQ   L0913BB
            BRA   L0913FE
L0913BB     PHA
            LDA   L0F0133
            PHA
            LDA   L0F0135
            PHA
            PEA   ^L0918A9
            PEA   L0918A9
            LDA   L0F0125
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
            BCC   L0913E4
            INC   $FA
L0913E4     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            PHX
            PHA
            _TrackControl
            STA   L0F0779
            PLA
            BRL   L09149E
            BRA   L091406
L0913FE     CMP   #$000A
            BEQ   L091406
            BRL   L09149E
L091406     PHA
            LDA   L0F0133
            PHA
            LDA   L0F0135
            PHA
            PEA   $0000
            PEA   $0000
            LDA   L0F0125
            ASL
            ASL
            PHA
            LDA   #L0E182E
            STA   $F8
            LDA   #^L0E182E
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L09142F
            INC   $FA
L09142F     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            PHX
            PHA
            _TrackControl
            STA   L0F0779
            PLA
            TAY
            BNE   L09144A
            BRL   L09149E
L09144A     LDA   L0F0125
            CLC
            ADC   #$0004
            CMP   #$0004
            BEQ   L091458
            BRA   L091475
L091458     LDX   L0F0034
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
            BRA   L09149E
            BRA   L09147C
L091475     CMP   #$0006
            BEQ   L09147C
            BRA   L091484
L09147C     JSL   L0A2535
            BRA   L09149E
            BRA   L09148B
L091484     CMP   #$0005
            BEQ   L09148B
            BRA   L091493
L09148B     JSL   L0A254C
            BRA   L09149E
            BRA   L09149A
L091493     CMP   #$0007
            BEQ   L09149A
            BRA   L09149E
L09149A     JSL   L0A261A
L09149E     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0914A6     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            STZ   L0F0123
            STZ   L0F0125
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00F4
            PHA
            LDA   L0F0133
            PHA
            LDA   L0F0135
            PHA
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _FindControl
            STA   L0F0779
            PLA
            STA   $F2
            PEI   $F2
            PEI   $F6
            PEI   $F4
            JSL   L0915DC
            PLY
            PLY
            PLY
            TAY
            BEQ   L0914F4
            LDA   #$0000
            BRL   L0915D2
L0914F4     PEI   $F2
            PEI   $F6
            PEI   $F4
            JSL   L09164B
            PLY
            PLY
            PLY
            TAY
            BEQ   L09150A
            LDA   #$0000
            BRL   L0915D2
L09150A     PEI   $F2
            PEI   $F6
            PEI   $F4
            JSL   L091744
            PLY
            PLY
            PLY
            TAY
            BEQ   L091520
            LDA   #$0000
            BRL   L0915D2
L091520     PEI   $F2
            PEI   $F6
            PEI   $F4
            JSL   L09183A
            PLY
            PLY
            PLY
            TAY
            BEQ   L091536
            LDA   #$0000
            BRL   L0915D2
L091536     LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$0034
            BCC   L09154B
            INX
L09154B     PHX
            PHA
            LDA   L0F0135
            PHA
            LDA   L0F0133
            PHA
            JSL   L0C0806
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L091566
            LDA   #$0000
            BRL   L0915D2
L091566     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BNE   L09158E
            JSL   L091A6E
            TAY
            BNE   L091589
            JSL   L091B66
            TAY
            BNE   L091589
            JSL   L091906
L091589     LDA   #$0000
            BRA   L0915D2
L09158E     LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   L0F0135
            BEQ   L0915AA
            BVS   L0915A8
            EOR   #$8000
L0915A8     BMI   L0915CC
L0915AA     LDX   L0F0038
            LDA   L0F0036
            STA   $F8
            STX   $FA
            LDY   #$0004
            LDA   [$F8],Y
            SEC
            SBC   L0F0135
            BVS   L0915C2
            EOR   #$8000
L0915C2     BPL   L0915CC
            LDA   #$0004
            STA   L0F0123
            BRA   L0915D2
L0915CC     LDA   #$0006
            STA   L0F0123
L0915D2     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0915DC     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
            LDA   $FF
            CMP   #$0081
            BNE   L09163E
            STZ   $F0
L0915F0     LDA   $F0
            SEC
            SBC   #$0005
            BVS   L0915FB
            EOR   #$8000
L0915FB     BMI   L09163E
            LDX   $FD
            LDA   $FB
            PHX
            PHA
            LDA   $F0
            ASL
            ASL
            PHA
            LDA   #L0E1822
            STA   $F2
            LDA   #^L0E1822
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L09161C
            INC   $F4
L09161C     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            JSL   L0D157E
            BNE   L09163A
            LDA   #$0007
            STA   L0F0123
            LDA   $F0
            STA   L0F0125
            LDA   #$0001
            BRA   L091641
L09163A     INC   $F0
            BRA   L0915F0
L09163E     LDA   #$0000
L091641     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L09164B     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
            LDA   $FF
            CMP   #$0007
            BEQ   L091667
            LDA   $FF
            CMP   #$0008
            BEQ   L091667
            BRL   L091737
L091667     STZ   $F0
L091669     LDA   $F0
            SEC
            SBC   #$0005
            BVS   L091674
            EOR   #$8000
L091674     BPL   L091679
            BRL   L091737
L091679     LDX   $FD
            LDA   $FB
            PHX
            PHA
            LDA   $F0
            ASL
            ASL
            PHA
            LDA   #L0E1822
            STA   $F2
            LDA   #^L0E1822
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L091698
            INC   $F4
L091698     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            JSL   L0D157E
            BEQ   L0916A9
            BRL   L091732
L0916A9     LDA   #$0008
            STA   L0F0123
            LDA   $F0
            STA   L0F0125
            LDA   $F0
            CMP   #$0000
            BEQ   L0916BD
            BRA   L0916DE
L0916BD     LDA   $FF
            CMP   #$0007
            BNE   L0916CC
            LDA   #$0007
            STA   L0F0127
            BRA   L0916D9
L0916CC     LDA   $FF
            CMP   #$0008
            BNE   L0916D9
            LDA   #$0006
            STA   L0F0127
L0916D9     BRL   L09172D
            BRA   L0916EA
L0916DE     CMP   #$0001
            BEQ   L0916EA
            CMP   #$0003
            BEQ   L0916EA
            BRA   L09170A
L0916EA     LDA   $FF
            CMP   #$0007
            BNE   L0916F9
            LDA   #$0001
            STA   L0F0127
            BRA   L091706
L0916F9     LDA   $FF
            CMP   #$0008
            BNE   L091706
            LDA   #$0003
            STA   L0F0127
L091706     BRA   L09172D
            BRA   L091711
L09170A     CMP   #$0002
            BEQ   L091711
            BRA   L09172D
L091711     LDA   $FF
            CMP   #$0007
            BNE   L091720
            LDA   #$0007
            STA   L0F0127
            BRA   L09172D
L091720     LDA   $FF
            CMP   #$0008
            BNE   L09172D
            LDA   #$0006
            STA   L0F0127
L09172D     LDA   #$0001
            BRA   L09173A
L091732     INC   $F0
            BRL   L091669
L091737     LDA   #$0000
L09173A     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L091744     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
            LDA   $FF
            CMP   #$0005
            BEQ   L091760
            LDA   $FF
            CMP   #$0006
            BEQ   L091760
            BRL   L09182D
L091760     STZ   $F0
L091762     LDA   $F0
            SEC
            SBC   #$0005
            BVS   L09176D
            EOR   #$8000
L09176D     BPL   L091772
            BRL   L09182D
L091772     LDX   $FD
            LDA   $FB
            PHX
            PHA
            LDA   $F0
            ASL
            ASL
            PHA
            LDA   #L0E1822
            STA   $F2
            LDA   #^L0E1822
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L091791
            INC   $F4
L091791     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            JSL   L0D157E
            BEQ   L0917A2
            BRL   L091828
L0917A2     LDA   #$0009
            STA   L0F0123
            LDA   $F0
            STA   L0F0125
            LDA   $F0
            CMP   #$0000
            BEQ   L0917B6
            BRA   L0917D7
L0917B6     LDA   $FF
            CMP   #$0005
            BNE   L0917C5
            LDA   #$0005
            STA   L0F0127
            BRA   L0917D2
L0917C5     LDA   $FF
            CMP   #$0006
            BNE   L0917D2
            LDA   #$0004
            STA   L0F0127
L0917D2     BRL   L091823
            BRA   L0917E3
L0917D7     CMP   #$0001
            BEQ   L0917E3
            CMP   #$0003
            BEQ   L0917E3
            BRA   L091800
L0917E3     LDA   $FF
            CMP   #$0005
            BNE   L0917EF
            STZ   L0F0127
            BRA   L0917FC
L0917EF     LDA   $FF
            CMP   #$0006
            BNE   L0917FC
            LDA   #$0002
            STA   L0F0127
L0917FC     BRA   L091823
            BRA   L091807
L091800     CMP   #$0002
            BEQ   L091807
            BRA   L091823
L091807     LDA   $FF
            CMP   #$0005
            BNE   L091816
            LDA   #$0005
            STA   L0F0127
            BRA   L091823
L091816     LDA   $FF
            CMP   #$0006
            BNE   L091823
            LDA   #$0004
            STA   L0F0127
L091823     LDA   #$0001
            BRA   L091830
L091828     INC   $F0
            BRL   L091762
L09182D     LDA   #$0000
L091830     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L09183A     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
            LDA   $FF
            CMP   #$0002
            BNE   L09189C
            STZ   $F0
L09184E     LDA   $F0
            SEC
            SBC   #$0004
            BVS   L091859
            EOR   #$8000
L091859     BMI   L09189C
            LDX   $FD
            LDA   $FB
            PHX
            PHA
            LDA   $F0
            ASL
            ASL
            PHA
            LDA   #L0E182E
            STA   $F2
            LDA   #^L0E182E
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L09187A
            INC   $F4
L09187A     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            JSL   L0D157E
            BNE   L091898
            LDA   #$000A
            STA   L0F0123
            LDA   $F0
            STA   L0F0125
            LDA   #$0001
            BRA   L09189F
L091898     INC   $F0
            BRA   L09184E
L09189C     LDA   #$0000
L09189F     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0918A9     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            LDA   L0F0127
            PHA
            LDA   L0F0125
            ASL
            ASL
            ASL
            PHA
            LDA   #L0E1842
            STA   $F2
            LDA   #^L0E1842
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L0918D3
            INC   $F4
L0918D3     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            STA   $F2
            STX   $F4
            LDA   $F2
            LDX   $F4
            JSL   L0D1396
            PLY
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            SEP   #$20
            LDA   $03,S
            STA   $09,S
            LDA   $02,S
            STA   $08,S
            LDA   $01,S
            STA   $07,S
            REP   #$20
            TSC
            CLC
            ADC   #$0006
            TCS
            RTL

L091906     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$0024
            BCC   L091926
            INX
L091926     PHX
            PHA
            LDA   L0F0135
            PHA
            LDA   L0F0133
            PHA
            JSL   L0C0806
            PLY
            PLY
            PLY
            PLY
            TAY
            BEQ   L091957
            LDA   L0F0070
            CMP   #$FFFF
            BNE   L091957
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            CMP   #$0000
            BNE   L09195D
L091957     LDA   #$0000
            BRL   L091A64
L09195D     STZ   $F4
L09195F     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   $F4
            BEQ   L09198D
            BVS   L091978
            EOR   #$8000
L091978     BPL   L09198D
            LDA   $F4
            ASL
            TAX
            LDAL  L0E0046,X
            CMP   #$FFFF
            BNE   L091989
            BRA   L09198D
L091989     INC   $F4
            BRA   L09195F
L09198D     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            CMP   $F4
            BNE   L0919A6
            LDA   #$0000
            BRL   L091A64
L0919A6     LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0026
            LDA   [$F8],Y
            PHA
            LDA   L0F0135
            PLX
            STX   $F8
            SEC
            SBC   $F8
            STA   $F6
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            PHA
            LDA   $F6
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$000A
            LDA   [$F8],Y
            SEC
            JSL   L0D14B6
            PLY
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STA   L0F0125
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   [$F8]
            SEC
            SBC   L0F0125
            BVS   L091A07
            EOR   #$8000
L091A07     BMI   L091A18
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   [$F8]
            STA   L0F0125
L091A18     STZ   L0F0127
L091A1B     LDA   L0F0127
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
            BCC   L091A3F
            INC   $FA
L091A3F     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L091A49
            INC   $FA
L091A49     LDA   [$F8]
            SEC
            SBC   L0F0133
            BVS   L091A54
            EOR   #$8000
L091A54     BMI   L091A5B
            INC   L0F0127
            BRA   L091A1B
L091A5B     LDA   #$0005
            STA   L0F0123
            LDA   #$0001
L091A64     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L091A6E     PHD
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
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$002C
            BCC   L091A8E
            INX
L091A8E     PHX
            PHA
            LDA   L0F0135
            PHA
            LDA   L0F0133
            PHA
            JSL   L0C0806
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L091AA9
            LDA   #$0000
            BRL   L091B5C
L091AA9     STZ   $F6
            BRL   L091B3E
L091AAE     LDA   $F6
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
            BCC   L091AD1
            INC   $FA
L091AD1     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L091ADB
            INC   $FA
L091ADB     LDA   [$F8]
            SEC
            SBC   #$0004
            SEC
            SBC   L0F0133
            BVS   L091AEA
            EOR   #$8000
L091AEA     BMI   L091B3C
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
            BCC   L091B0F
            INC   $FA
L091B0F     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L091B19
            INC   $FA
L091B19     LDA   [$F8]
            CLC
            ADC   #$0004
            SEC
            SBC   L0F0133
            BEQ   L091B3C
            BVS   L091B2A
            EOR   #$8000
L091B2A     BPL   L091B3C
            LDA   #$0002
            STA   L0F0123
            LDA   $F6
            STA   L0F0125
            LDA   #$0001
            BRA   L091B5C
L091B3C     INC   $F6
L091B3E     LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   [$F8]
            SEC
            SBC   $F6
            BEQ   L091B59
            BVS   L091B54
            EOR   #$8000
L091B54     BPL   L091B59
            BRL   L091AAE
L091B59     LDA   #$0000
L091B5C     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L091B66     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            PEA   ^L0E31A7
            PEA   L0E31A7
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$002C
            BCC   L091B8C
            INX
L091B8C     PHX
            PHA
            JSL   L0C06F9
            PLY
            PLY
            PLY
            PLY
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0022
            LDA   [$F8],Y
            STAL  L0E31AD
            PEA   ^L0E31A7
            PEA   L0E31A7
            LDA   L0F0135
            PHA
            LDA   L0F0133
            PHA
            JSL   L0C0806
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L091BC8
            LDA   #$0000
            BRL   L091C35
L091BC8     STZ   $F6
            BRA   L091C1A
L091BCC     LDA   $F6
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
            BCC   L091BEF
            INC   $FA
L091BEF     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L091BF9
            INC   $FA
L091BF9     LDA   [$F8]
            SEC
            SBC   L0F0133
            BEQ   L091C18
            BVS   L091C06
            EOR   #$8000
L091C06     BPL   L091C18
            LDA   #$0001
            STA   L0F0123
            LDA   $F6
            STA   L0F0125
            LDA   #$0001
            BRA   L091C35
L091C18     INC   $F6
L091C1A     LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   [$F8]
            SEC
            SBC   $F6
            BEQ   L091C32
            BVS   L091C30
            EOR   #$8000
L091C30     BMI   L091BCC
L091C32     LDA   #$0000
L091C35     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L091C3F     PHD
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
            LDA   L0F0125
            LDY   #$002E
            STA   [$F8],Y
            LDA   #$0009
            STA   L0F0012
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L091C6A     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EE
            TCS
            LDA   L0F0070
            CMP   #$FFFF
            BNE   L091C89
            LDA   $FF
            BNE   L091C87
            LDA   #$0000
            BRL   L091DC2
L091C87     BRA   L091C93
L091C89     LDA   $FF
            BEQ   L091C93
            LDA   #$0000
            BRL   L091DC2
L091C93     LDA   $FF
            BEQ   L091C9D
            LDA   L0F0125
            STA   L0F0070
L091C9D     LDA   L0F0070
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
            BCC   L091CC1
            INC   $F8
L091CC1     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L091CCB
            INC   $F8
L091CCB     LDA   [$F6]
            STA   $F4
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$0022
            LDA   [$F6],Y
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDY   #$0036
            LDA   [$F6],Y
            PLX
            STX   $F6
            CLC
            ADC   $F6
            SEC
            SBC   #$000A
            STA   $F2
            LDA   $F4
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
            LDA   #$0058
            CLC
            ADC   $F6
            STA   $F6
            BCC   L091D18
            INC   $F8
L091D18     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L091D22
            INC   $F8
L091D22     PEI   $F8
            PEI   $F6
            JSL   L0C04CD
            PLY
            PLY
            STA   $F0
            LDA   $FF
            BEQ   L091D76
            PEI   $F0
            PEI   $F2
            LDA   $F4
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
            LDA   #$0058
            CLC
            ADC   $F6
            STA   $F6
            BCC   L091D54
            INC   $F8
L091D54     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L091D5E
            INC   $F8
L091D5E     PEI   $F8
            PEI   $F6
            LDA   L0F0070
            PHA
            PEI   $F4
            JSL   L07338A
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRA   L091DBE
L091D76     PEI   $F0
            PEI   $F2
            LDA   $F4
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
            LDA   #$0058
            CLC
            ADC   $F6
            STA   $F6
            BCC   L091D98
            INC   $F8
L091D98     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L091DA2
            INC   $F8
L091DA2     PEI   $F8
            PEI   $F6
            LDA   L0F0070
            PHA
            PEI   $F4
            JSL   L073359
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$FFFF
            STA   L0F0070
L091DBE     JSL   L030FA2
L091DC2     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L091DCC     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00D4
            TCS
            LDA   L0F0125
            CMP   L0F0070
            BEQ   L091DE7
            PEA   $0000
            JSL   L091C6A
            PLY
L091DE7     LDX   L0F0030
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
            SBC   #$0001
            STA   $F6
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0034
            LDA   [$F8],Y
            STA   $DE
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0038
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            STA   $E2
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            STA   $E0
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0032
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            STA   $E4
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
            LDA   #$0044
            CLC
            ADC   $F8
            STA   $F8
            BCC   L091E82
            INC   $FA
L091E82     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L091E8C
            INC   $FA
L091E8C     LDA   [$F8]
            STA   $E6
            LDA   $E6
            SEC
            SBC   $DE
            BVS   L091E9A
            EOR   #$8000
L091E9A     BMI   L091EA0
            LDA   $DE
            STA   $E6
L091EA0     LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            STA   $E8
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0032
            LDA   [$F8],Y
            CLC
            ADC   #$0001
            STA   $EC
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
            LDA   #$0046
            CLC
            ADC   $F8
            STA   $F8
            BCC   L091EEE
            INC   $FA
L091EEE     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L091EF8
            INC   $FA
L091EF8     LDA   [$F8]
            SEC
            SBC   $F6
            BEQ   L091F0F
            BVS   L091F04
            EOR   #$8000
L091F04     BPL   L091F0F
            LDA   $F6
            SEC
            SBC   $E6
            STA   $EA
            BRA   L091F44
L091F0F     LDA   L0F0125
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
            BCC   L091F33
            INC   $FA
L091F33     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L091F3D
            INC   $FA
L091F3D     LDA   [$F8]
            SEC
            SBC   $E6
            STA   $EA
L091F44     PEA   $0000
            PEA   $0004
            PEA   $0000
            TDC
            CLC
            ADC   #$00D6
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
            LDA   $D8
            STA   $F4
            PEA   $0008
            PEI   $F4
            PEI   $E6
            JSL   L0924F7
            PLY
            PLY
            PLY
            STA   $F4
            LDA   $E6
            CMP   $F4
            BNE   L091F95
            JSL   L09252C
            LDA   #$0000
            BRL   L09218E
L091F95     PEA   $0000
            JSL   L091C6A
            PLY
            STZ   $F2
L091F9F     LDA   $F2
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
            LDA   #$0044
            CLC
            ADC   $F8
            STA   $F8
            BCC   L091FC2
            INC   $FA
L091FC2     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L091FCC
            INC   $FA
L091FCC     LDA   [$F8]
            SEC
            SBC   $F4
            BEQ   L091FDA
            BVS   L091FD8
            EOR   #$8000
L091FD8     BMI   L091FF9
L091FDA     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   $F2
            BEQ   L091FF9
            BVS   L091FF3
            EOR   #$8000
L091FF3     BPL   L091FF9
            INC   $F2
            BRA   L091F9F
L091FF9     LDA   $F2
            SEC
            SBC   L0F0125
            BEQ   L092010
            BVS   L092006
            EOR   #$8000
L092006     BPL   L092010
            LDA   $F2
            SEC
            SBC   #$0001
            STA   $F2
L092010     LDA   $F2
            CMP   L0F0125
            BNE   L09201D
            LDA   #$0000
            BRL   L09218E
L09201D     STZ   $F0
            BRL   L092101
L092022     LDA   $F0
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
            BCC   L092040
            INC   $FA
L092040     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L09204A
            INC   $FA
L09204A     LDA   [$F8]
            PHA
            JSL   L0B110B
            PLY
            STA   $EE
            LDA   $F2
            SEC
            SBC   L0F0125
            BVS   L09205F
            EOR   #$8000
L09205F     BMI   L0920AF
            LDA   $F2
            SEC
            SBC   #$0001
            SEC
            SBC   $EE
            BVS   L09206F
            EOR   #$8000
L09206F     BMI   L0920AD
            LDA   $EE
            SEC
            SBC   L0F0125
            BVS   L09207C
            EOR   #$8000
L09207C     BMI   L0920AD
            LDA   $F0
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
            BCC   L09209C
            INC   $FA
L09209C     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0920A6
            INC   $FA
L0920A6     LDA   [$F8]
            PHA
            INC
            STA   [$F8]
            PLA
L0920AD     BRA   L0920FF
L0920AF     LDA   $EE
            SEC
            SBC   L0F0125
            BEQ   L0920FF
            BVS   L0920BC
            EOR   #$8000
L0920BC     BPL   L0920FF
            LDA   $F2
            CLC
            ADC   #$0001
            SEC
            SBC   $EE
            BEQ   L0920FF
            BVS   L0920CE
            EOR   #$8000
L0920CE     BPL   L0920FF
            LDA   $F0
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
            BCC   L0920EE
            INC   $FA
L0920EE     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0920F8
            INC   $FA
L0920F8     LDA   [$F8]
            PHA
            DEC
            STA   [$F8]
            PLA
L0920FF     INC   $F0
L092101     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   $F0
            BEQ   L09211F
            BVS   L09211A
            EOR   #$8000
L09211A     BPL   L09211F
            BRL   L092022
L09211F     LDA   L0F0125
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
            BCC   L092143
            INC   $FA
L092143     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L09214D
            INC   $FA
L09214D     LDA   [$F8]
            STA   $F0
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
            STA   $F8
            STX   $FA
            LDA   #$0048
            CLC
            ADC   $F8
            STA   $F8
            BCC   L092171
            INC   $FA
L092171     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L09217B
            INC   $FA
L09217B     PEI   $FA
            PEI   $F8
            JSL   L0B112E
            PLY
            PLY
            PLY
            JSL   L090630
            JSL   L072D31
L09218E     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L092198     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00D4
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
            SBC   #$0001
            STA   $F6
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
            LDA   #$0044
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0921F2
            INC   $FA
L0921F2     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0921FC
            INC   $FA
L0921FC     LDA   [$F8]
            CLC
            ADC   #$0007
            STA   $D8
            LDA   #$01B0
            STA   $F4
            LDA   $D8
            CLC
            ADC   $F4
            SEC
            SBC   #$0001
            STA   $D6
            LDA   $D6
            SEC
            SBC   $F6
            BEQ   L092232
            BVS   L092220
            EOR   #$8000
L092220     BPL   L092232
            PEA   $0008
            PEI   $F6
            PEI   $D8
            JSL   L0924F7
            PLY
            PLY
            PLY
            STA   $D6
L092232     LDA   $D8
            SEC
            SBC   #$0003
            STA   $E2
            LDA   $D6
            SEC
            SBC   $D8
            CLC
            ADC   #$0009
            STA   $E6
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0036
            LDA   [$F8],Y
            STA   $E4
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$003A
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            STA   $E8
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
            LDA   #$0046
            CLC
            ADC   $F8
            STA   $F8
            BCC   L09228F
            INC   $FA
L09228F     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L092299
            INC   $FA
L092299     LDA   [$F8]
            SEC
            SBC   #$0003
            STA   $EA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0036
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            STA   $EC
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$003A
            LDA   [$F8],Y
            CLC
            ADC   #$0001
            STA   $F0
            LDA   #$0007
            STA   $EE
            PEA   $0000
            PEA   $0004
            PEA   $0000
            TDC
            CLC
            ADC   #$00DA
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E2
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            JSL   L0A0518
            TAY
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            LDA   $DC
            STA   $F2
            PEA   $0008
            LDA   $F2
            CLC
            ADC   #$0003
            PHA
            PEI   $D8
            JSL   L0924F7
            PLY
            PLY
            PLY
            STA   $F2
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
            LDA   #$0046
            CLC
            ADC   $F8
            STA   $F8
            BCC   L09233A
            INC   $FA
L09233A     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L092344
            INC   $FA
L092344     LDA   [$F8]
            CMP   $F2
            BNE   L092350
            LDA   #$0000
            BRL   L0924ED
L092350     LDA   L0F0125
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
            LDA   #$0044
            CLC
            ADC   $F8
            STA   $F8
            BCC   L092374
            INC   $FA
L092374     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L09237E
            INC   $FA
L09237E     LDA   [$F8]
            PHA
            LDA   $F2
            PLX
            STX   $F8
            SEC
            SBC   $F8
            CLC
            ADC   #$0001
            PHA
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
            BCC   L0923B2
            INC   $FA
L0923B2     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0923BC
            INC   $FA
L0923BC     LDA   [$F8]
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
            BCC   L0923DA
            INC   $FA
L0923DA     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0923E4
            INC   $FA
L0923E4     PLA
            STA   [$F8]
            JSL   L090630
            LDA   L0F0125
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
            BCC   L09240A
            INC   $FA
L09240A     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L092414
            INC   $FA
L092414     LDA   [$F8]
            CMP   #$0000
            BEQ   L09244D
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
            LDA   #$0044
            CLC
            ADC   $F8
            STA   $F8
            BCC   L09243F
            INC   $FA
L09243F     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L092449
            INC   $FA
L092449     LDA   [$F8]
            STA   $E2
L09244D     LDA   $F2
            SEC
            SBC   $EA
            BVS   L092457
            EOR   #$8000
L092457     BMI   L09248F
            LDA   L0F0125
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
            BCC   L092478
            INC   $FA
L092478     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L092482
            INC   $FA
L092482     LDA   [$F8]
            CMP   #$0000
            BNE   L09248D
            LDA   $F2
            STA   $E2
L09248D     BRA   L0924C3
L09248F     LDA   L0F0125
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
            BCC   L0924AE
            INC   $FA
L0924AE     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0924B8
            INC   $FA
L0924B8     LDA   [$F8]
            CMP   #$0000
            BNE   L0924C3
            LDA   $EA
            STA   $E2
L0924C3     LDA   $E2
            SEC
            SBC   #$0008
            STA   $E2
            LDA   $F6
            SEC
            SBC   $E2
            CLC
            ADC   #$0001
            STA   $E6
            JSL   L091079
            JSL   L072D31
            LDA   L0F0042
            BNE   L0924ED
            LDA   #$0001
            STA   L0F0042
            JSL   L030FA2
L0924ED     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0924F7     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            LDA   $FD
            SEC
            SBC   $FB
            PHA
            LDA   $FF
            SEC
            JSL   L0D14B6
            PLY
            PHA
            LDA   $FF
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDA   $FB
            PLX
            STX   $F2
            CLC
            ADC   $F2
            TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L09252C     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            PEA   $0001
            JSL   L091C6A
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L092547     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
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
            STA   $F0
            LDX   L0F0030
            LDA   L0F002E
            STA   $F2
            STX   $F4
            LDY   #$002C
            LDA   [$F2],Y
            PHA
            LDA   $FF
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
            BCC   L0925B0
            INC   $F4
L0925B0     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L0925BA
            INC   $F4
L0925BA     LDA   [$F2]
            PHA
            JSL   L0C0027
            PLY
            PLY
            PHA
            PLA
            STA   [$FB]
            LDX   L0F0030
            LDA   L0F002E
            STA   $F2
            STX   $F4
            LDY   #$0036
            LDA   [$F2],Y
            SEC
            SBC   #$0001
            PHA
            PLA
            LDY   #$0002
            STA   [$FB],Y
            LDX   L0F0030
            LDA   L0F002E
            STA   $F2
            STX   $F4
            LDY   #$003A
            LDA   [$F2],Y
            PHA
            PLA
            LDY   #$0006
            STA   [$FB],Y
            LDA   [$FB]
            PHA
            LDA   $FF
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
            BCC   L09261D
            INC   $F4
L09261D     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L092627
            INC   $F4
L092627     LDA   [$F2]
            PLX
            STX   $F2
            SEC
            SBC   $F2
            PHA
            PLA
            LDY   #$0004
            STA   [$FB],Y
            LDY   #$0004
            LDA   [$FB],Y
            PHA
            LDA   [$FB]
            PLX
            STX   $F2
            CLC
            ADC   $F2
            SEC
            SBC   #$0001
            SEC
            SBC   $F0
            BEQ   L09266A
            BVS   L092652
            EOR   #$8000
L092652     BPL   L09266A
            LDA   [$FB]
            PHA
            LDA   $F0
            PLX
            STX   $F2
            SEC
            SBC   $F2
            CLC
            ADC   #$0001
            PHA
            PLA
            LDY   #$0004
            STA   [$FB],Y
L09266A     TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL


