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

	use	C.X.S
	
GSOS	=	$E100A8

*-----------------------------------

L060000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E6
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
            STA   $F8
            STX   $FA
            LDA   #$004A
            CLC
            ADC   $F8
            STA   $F8
            BCC   L06002F
            INC   $FA
L06002F     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L060039
            INC   $FA
L060039     LDA   [$F8]
            STA   L0F0096
            LDA   L0F0096
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
            BCC   L06005D
            INC   $FA
L06005D     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L060067
            INC   $FA
L060067     LDA   [$F8]
            STA   L0F00A8
            LDA   L0F00A8
            PHA
            JSL   L06109F
            PLY
            LDA   L0F0096
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
            BCC   L060094
            INC   $FA
L060094     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L06009E
            INC   $FA
L06009E     LDA   [$F8]
            AND   #$00FF
            CMP   #$0002
            BNE   L0600B3
            LDA   L0F0096
            PHA
            JSL   L0607AC
            PLY
            BRA   L0600BC
L0600B3     LDA   L0F0096
            PHA
            JSL   L06015C
            PLY
L0600BC     JSL   L06115A
            LDA   L0F00E1
            CMP   #$0002
            BNE   L0600CB
            BRL   L06014C
L0600CB     JSL   L072D31
            LDA   L0F0096
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
            BCC   L0600EE
            INC   $FA
L0600EE     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0600F8
            INC   $FA
L0600F8     LDA   L0F00A8
            STA   [$F8]
            JSL   L080000
            LDA   L0F0070
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E8
            PHA
            JSL   L092547
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E8
            PHA
            JSL   L0C0A98
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00F0
            PHA
            JSL   L073E52
            PLY
            PLY
            JSL   L072D31
            JSL   L073E73
            LDA   #$0001
            STA   L0F0006
L06014C     PEA   $0000
            JSL   L091C6A
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L06015C     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EC
            TCS
            LDA   #$0001
            STA   $F4
            LDA   $FF
            CMP   #$FFFF
            BNE   L060192
            STZ   L0F00A8
            LDAL  L0E483E
            TAX
            LDAL  L0E483C
            PHX
            PHA
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRL   L0601E5
L060192     LDA   $FF
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
            BCC   L0601B0
            INC   $F8
L0601B0     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0601BA
            INC   $F8
L0601BA     PEI   $F8
            PEI   $F6
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDAL  L0E48AE
            TAX
            LDAL  L0E48AC
            PHX
            PHA
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
L0601E5     PEA   ^L0E4CCC
            PEA   L0E4CCC
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E19C0
            PLA
            STAL  L0E19BE
            LDA   #L0E2053
            LDX   #^L0E2053
            PHA
            TXA
            STAL  L0E19D8
            PLA
            STAL  L0E19D6
            LDA   #L0E4BCC
            LDX   #^L0E4BCC
            PHA
            TXA
            STAL  L0E19F0
            PLA
            STAL  L0E19EE
            LDAL  L0E4842
            TAX
            LDAL  L0E4840
            PHA
            TXA
            STAL  L0E1A08
            PLA
            STAL  L0E1A06
            LDAL  L0E489E
            TAX
            LDAL  L0E489C
            PHA
            TXA
            STAL  L0E1A20
            PLA
            STAL  L0E1A1E
            LDAL  L0E4846
            TAX
            LDAL  L0E4844
            PHA
            TXA
            STAL  L0E1A38
            PLA
            STAL  L0E1A36
            LDAL  L0E484A
            TAX
            LDAL  L0E4848
            PHA
            TXA
            STAL  L0E1A50
            PLA
            STAL  L0E1A4E
            LDAL  L0E484E
            TAX
            LDAL  L0E484C
            PHA
            TXA
            STAL  L0E1A68
            PLA
            STAL  L0E1A66
            LDAL  L0E48A2
            TAX
            LDAL  L0E48A0
            PHA
            TXA
            STAL  L0E1A80
            PLA
            STAL  L0E1A7E
            LDAL  L0E48A6
            TAX
            LDAL  L0E48A4
            PHA
            TXA
            STAL  L0E1A98
            PLA
            STAL  L0E1A96
            LDAL  L0E48AA
            TAX
            LDAL  L0E48A8
            PHA
            TXA
            STAL  L0E1AB0
            PLA
            STAL  L0E1AAE
            LDAL  L0E4852
            TAX
            LDAL  L0E4850
            PHA
            TXA
            STAL  L0E1AC8
            PLA
            STAL  L0E1AC6
            LDAL  L0E4856
            TAX
            LDAL  L0E4854
            PHA
            TXA
            STAL  L0E1AE0
            PLA
            STAL  L0E1ADE
            LDAL  L0E485A
            TAX
            LDAL  L0E4858
            PHA
            TXA
            STAL  L0E1AF8
            PLA
            STAL  L0E1AF6
            LDAL  L0E485E
            TAX
            LDAL  L0E485C
            PHA
            TXA
            STAL  L0E1B10
            PLA
            STAL  L0E1B0E
            LDAL  L0E4862
            TAX
            LDAL  L0E4860
            PHA
            TXA
            STAL  L0E1B28
            PLA
            STAL  L0E1B26
            LDAL  L0E4866
            TAX
            LDAL  L0E4864
            PHA
            TXA
            STAL  L0E1B40
            PLA
            STAL  L0E1B3E
            LDAL  L0E486A
            TAX
            LDAL  L0E4868
            PHA
            TXA
            STAL  L0E1B58
            PLA
            STAL  L0E1B56
            LDAL  L0E486E
            TAX
            LDAL  L0E486C
            PHA
            TXA
            STAL  L0E1B70
            PLA
            STAL  L0E1B6E
            LDAL  L0E4872
            TAX
            LDAL  L0E4870
            PHA
            TXA
            STAL  L0E1B88
            PLA
            STAL  L0E1B86
            LDAL  L0E4876
            TAX
            LDAL  L0E4874
            PHA
            TXA
            STAL  L0E1BA0
            PLA
            STAL  L0E1B9E
            LDAL  L0E487A
            TAX
            LDAL  L0E4878
            PHA
            TXA
            STAL  L0E1BB8
            PLA
            STAL  L0E1BB6
            LDAL  L0E487E
            TAX
            LDAL  L0E487C
            PHA
            TXA
            STAL  L0E1BD0
            PLA
            STAL  L0E1BCE
            LDAL  L0E4882
            TAX
            LDAL  L0E4880
            PHA
            TXA
            STAL  L0E1BE8
            PLA
            STAL  L0E1BE6
            LDAL  L0E4886
            TAX
            LDAL  L0E4884
            PHA
            TXA
            STAL  L0E1C00
            PLA
            STAL  L0E1BFE
            LDAL  L0E488A
            TAX
            LDAL  L0E4888
            PHA
            TXA
            STAL  L0E1C18
            PLA
            STAL  L0E1C16
            LDAL  L0E488E
            TAX
            LDAL  L0E488C
            PHA
            TXA
            STAL  L0E1C30
            PLA
            STAL  L0E1C2E
            LDAL  L0E4892
            TAX
            LDAL  L0E4890
            PHA
            TXA
            STAL  L0E1C48
            PLA
            STAL  L0E1C46
            LDAL  L0E48A2
            TAX
            LDAL  L0E48A0
            PHA
            TXA
            STAL  L0E1C60
            PLA
            STAL  L0E1C5E
            LDA   #L0E19B2
            LDX   #^L0E19B2
            PHA
            TXA
            STAL  L0E193A+2
            PLA
            STAL  L0E193A
            LDA   #L0E19CA
            LDX   #^L0E19CA
            PHA
            TXA
            STAL  L0E193E+2
            PLA
            STAL  L0E193E
            LDA   #L0E19E2
            LDX   #^L0E19E2
            PHA
            TXA
            STAL  L0E1942+2
            PLA
            STAL  L0E1942
            LDA   #L0E19FA
            LDX   #^L0E19FA
            PHA
            TXA
            STAL  L0E1946+2
            PLA
            STAL  L0E1946
            LDA   #L0E1A12
            LDX   #^L0E1A12
            PHA
            TXA
            STAL  L0E194A+2
            PLA
            STAL  L0E194A
            LDA   #L0E1A2A
            LDX   #^L0E1A2A
            PHA
            TXA
            STAL  L0E194E+2
            PLA
            STAL  L0E194E
            LDA   #L0E1A42
            LDX   #^L0E1A42
            PHA
            TXA
            STAL  L0E1952+2
            PLA
            STAL  L0E1952
            LDA   #L0E1A5A
            LDX   #^L0E1A5A
            PHA
            TXA
            STAL  L0E1956+2
            PLA
            STAL  L0E1956
            LDA   #L0E1A72
            LDX   #^L0E1A72
            PHA
            TXA
            STAL  L0E195A+2
            PLA
            STAL  L0E195A
            LDA   #L0E1A8A
            LDX   #^L0E1A8A
            PHA
            TXA
            STAL  L0E195E+2
            PLA
            STAL  L0E195E
            LDA   #L0E1AA2
            LDX   #^L0E1AA2
            PHA
            TXA
            STAL  L0E1962+2
            PLA
            STAL  L0E1962
            LDA   #L0E1ABA
            LDX   #^L0E1ABA
            PHA
            TXA
            STAL  L0E1966+2
            PLA
            STAL  L0E1966
            LDA   #L0E1AD2
            LDX   #^L0E1AD2
            PHA
            TXA
            STAL  L0E196A+2
            PLA
            STAL  L0E196A
            LDA   #L0E1AEA
            LDX   #^L0E1AEA
            PHA
            TXA
            STAL  L0E196E+2
            PLA
            STAL  L0E196E
            LDA   #L0E1B02
            LDX   #^L0E1B02
            PHA
            TXA
            STAL  L0E1972+2
            PLA
            STAL  L0E1972
            LDA   #L0E1B1A
            LDX   #^L0E1B1A
            PHA
            TXA
            STAL  L0E1976+2
            PLA
            STAL  L0E1976
            LDA   #L0E1B32
            LDX   #^L0E1B32
            PHA
            TXA
            STAL  L0E197A+2
            PLA
            STAL  L0E197A
            LDA   #L0E1B4A
            LDX   #^L0E1B4A
            PHA
            TXA
            STAL  L0E197E+2
            PLA
            STAL  L0E197E
            LDA   #L0E1B62
            LDX   #^L0E1B62
            PHA
            TXA
            STAL  L0E1982+2
            PLA
            STAL  L0E1982
            LDA   #L0E1B7A
            LDX   #^L0E1B7A
            PHA
            TXA
            STAL  L0E1986+2
            PLA
            STAL  L0E1986
            LDA   #L0E1B92
            LDX   #^L0E1B92
            PHA
            TXA
            STAL  L0E198A+2
            PLA
            STAL  L0E198A
            LDA   #L0E1BAA
            LDX   #^L0E1BAA
            PHA
            TXA
            STAL  L0E198E+2
            PLA
            STAL  L0E198E
            LDA   #L0E1BC2
            LDX   #^L0E1BC2
            PHA
            TXA
            STAL  L0E1992+2
            PLA
            STAL  L0E1992
            LDA   #L0E1BDA
            LDX   #^L0E1BDA
            PHA
            TXA
            STAL  L0E1996+2
            PLA
            STAL  L0E1996
            LDA   #L0E1BF2
            LDX   #^L0E1BF2
            PHA
            TXA
            STAL  L0E199A+2
            PLA
            STAL  L0E199A
            LDA   #L0E1C0A
            LDX   #^L0E1C0A
            PHA
            TXA
            STAL  L0E199E+2
            PLA
            STAL  L0E199E
            LDA   #L0E1C22
            LDX   #^L0E1C22
            PHA
            TXA
            STAL  L0E19A2+2
            PLA
            STAL  L0E19A2
            LDA   #L0E1C3A
            LDX   #^L0E1C3A
            PHA
            TXA
            STAL  L0E19A6+2
            PLA
            STAL  L0E19A6
            LDA   #L0E1C52
            LDX   #^L0E1C52
            PHA
            TXA
            STAL  L0E19AA+2
            PLA
            STAL  L0E19AA
            PHX
            PHA
            PEA   ^L0E192C
            PEA   L0E192C
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $F0
            STA   $EE
            PEA   $0001
            PEI   $F0
            PEI   $EE
            LDAL  L0E28D0
            CLC
            ADC   #$0006
            PHA
            _SetDItemValue
            STA   L0F0779
            PEA   $0001
            PEI   $F0
            PEI   $EE
            LDAL  L0E28D4
            CLC
            ADC   #$0009
            PHA
            _SetDItemValue
            STA   L0F0779
            PEA   $0001
            PEI   $F0
            PEI   $EE
            LDAL  L0E28D2
            CLC
            ADC   #$000C
            PHA
            _SetDItemValue
            STA   L0F0779
            PEA   $0001
            PEA   ^L0F00A8
            PEA   L0F00A8
            JSL   L060E2F
            PLY
            PLY
            PLY
L060697     LDA   $F4
            BNE   L06069E
            BRL   L06076A
L06069E     PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   L0F00E1
            LDA   L0F00E1
            SEC
            SBC   #$0003
            BEQ   L0606C3
            BVS   L0606C1
            EOR   #$8000
L0606C1     BMI   L0606C8
L0606C3     STZ   $F4
            BRL   L060757
L0606C8     PEA   $0001
            PEI   $F0
            PEI   $EE
            LDA   L0F00E1
            PHA
            _SetDItemValue
            STA   L0F0779
            LDA   L0F00E1
            SEC
            SBC   #$0006
            BVS   L0606E9
            EOR   #$8000
L0606E9     BPL   L060707
            LDA   L0F00E1
            SEC
            SBC   #$0009
            BVS   L0606F7
            EOR   #$8000
L0606F7     BMI   L060707
            LDA   L0F00E1
            SEC
            SBC   #$0006
            STAL  L0E28D0
            BRL   L060757
L060707     LDA   L0F00E1
            SEC
            SBC   #$0009
            BVS   L060713
            EOR   #$8000
L060713     BPL   L060730
            LDA   L0F00E1
            SEC
            SBC   #$000C
            BVS   L060721
            EOR   #$8000
L060721     BMI   L060730
            LDA   L0F00E1
            SEC
            SBC   #$0009
            STAL  L0E28D4
            BRA   L060757
L060730     LDA   L0F00E1
            SEC
            SBC   #$000C
            BVS   L06073C
            EOR   #$8000
L06073C     BPL   L060757
            LDA   L0F00E1
            SEC
            SBC   #$001E
            BVS   L06074A
            EOR   #$8000
L06074A     BMI   L060757
            LDA   L0F00E1
            SEC
            SBC   #$000C
            STAL  L0E28D2
L060757     PEA   $0001
            PEA   ^L0F00A8
            PEA   L0F00A8
            JSL   L060E2F
            PLY
            PLY
            PLY
            BRL   L060697
L06076A     PEI   $F0
            PEI   $EE
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   L0F00E1
            CMP   #$0002
            BNE   L060797
            LDA   #$0000
            BRA   L0607A2
L060797     LDA   $FF
            CMP   #$FFFF
            BNE   L0607A2
            JSL   L0611E5
L0607A2     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0607AC     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EE
            TCS
            LDA   #$0001
            STA   $F4
            PEA   ^L0F00EF
            PEA   L0F00EF
            PEA   ^L0F00ED
            PEA   L0F00ED
            PEA   ^L0F00F9
            PEA   L0F00F9
            PEA   ^L0F00E7
            PEA   L0F00E7
            PEA   ^L0F00F1
            PEA   L0F00F1
            JSL   L051198
            TAY
            TSC
            CLC
            ADC   #$0014
            TCS
            TYA
            LDA   $FF
            CMP   #$FFFF
            BNE   L060807
            STZ   L0F00A8
            PEA   ^L0E3A37
            PEA   L0E3A37
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRL   L060855
L060807     LDA   $FF
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
            BCC   L060825
            INC   $F8
L060825     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L06082F
            INC   $F8
L06082F     PEI   $F8
            PEI   $F6
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E3A54
            PEA   L0E3A54
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
L060855     PEA   ^L0E4CCC
            PEA   L0E4CCC
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E1D73
            PLA
            STAL  L0E1D71
            LDA   #L0E2053
            LDX   #^L0E2053
            PHA
            TXA
            STAL  L0E1D8B
            PLA
            STAL  L0E1D89
            LDA   #L0E1C6A
            LDX   #^L0E1C6A
            PHA
            TXA
            STAL  L0E1DA3
            PLA
            STAL  L0E1DA1
            LDA   #L0E1C6E
            LDX   #^L0E1C6E
            PHA
            TXA
            STAL  L0E1DBB
            PLA
            STAL  L0E1DB9
            LDA   #L0E1C75
            LDX   #^L0E1C75
            PHA
            TXA
            STAL  L0E1DD3
            PLA
            STAL  L0E1DD1
            LDA   #L0E1C79
            LDX   #^L0E1C79
            PHA
            TXA
            STAL  L0E1DEB
            PLA
            STAL  L0E1DE9
            LDA   #L0E1C7E
            LDX   #^L0E1C7E
            PHA
            TXA
            STAL  L0E1E03
            PLA
            STAL  L0E1E01
            LDA   #L0E1C84
            LDX   #^L0E1C84
            PHA
            TXA
            STAL  L0E1E1B
            PLA
            STAL  L0E1E19
            LDA   #L0E1C89
            LDX   #^L0E1C89
            PHA
            TXA
            STAL  L0E1E33
            PLA
            STAL  L0E1E31
            LDA   #L0E1C8E
            LDX   #^L0E1C8E
            PHA
            TXA
            STAL  L0E1E4B
            PLA
            STAL  L0E1E49
            LDA   #L0E1C93
            LDX   #^L0E1C93
            PHA
            TXA
            STAL  L0E1E63
            PLA
            STAL  L0E1E61
            LDA   #L0E1C99
            LDX   #^L0E1C99
            PHA
            TXA
            STAL  L0E1E7B
            PLA
            STAL  L0E1E79
            LDA   #L0E1C9E
            LDX   #^L0E1C9E
            PHA
            TXA
            STAL  L0E1E93
            PLA
            STAL  L0E1E91
            LDA   #L0E1CA4
            LDX   #^L0E1CA4
            PHA
            TXA
            STAL  L0E1EAB
            PLA
            STAL  L0E1EA9
            LDA   #L0E1CA7
            LDX   #^L0E1CA7
            PHA
            TXA
            STAL  L0E1EC3
            PLA
            STAL  L0E1EC1
            LDA   #L0E1CAA
            LDX   #^L0E1CAA
            PHA
            TXA
            STAL  L0E1EDB
            PLA
            STAL  L0E1ED9
            LDA   #L0E1CAD
            LDX   #^L0E1CAD
            PHA
            TXA
            STAL  L0E1EF3
            PLA
            STAL  L0E1EF1
            LDA   #L0E1CB0
            LDX   #^L0E1CB0
            PHA
            TXA
            STAL  L0E1F0B
            PLA
            STAL  L0E1F09
            LDA   #L0E4BCC
            LDX   #^L0E4BCC
            PHA
            TXA
            STAL  L0E1F23
            PLA
            STAL  L0E1F21
            LDA   #L0E1CB7
            LDX   #^L0E1CB7
            PHA
            TXA
            STAL  L0E1F3B
            PLA
            STAL  L0E1F39
            LDA   #L0E1CBF
            LDX   #^L0E1CBF
            PHA
            TXA
            STAL  L0E1F53
            PLA
            STAL  L0E1F51
            LDA   #L0E1D65
            LDX   #^L0E1D65
            PHA
            TXA
            STAL  L0E1D0D+2
            PLA
            STAL  L0E1D0D
            LDA   #L0E1D7D
            LDX   #^L0E1D7D
            PHA
            TXA
            STAL  L0E1D11+2
            PLA
            STAL  L0E1D11
            LDA   #L0E1D95
            LDX   #^L0E1D95
            PHA
            TXA
            STAL  L0E1D15+2
            PLA
            STAL  L0E1D15
            LDA   #L0E1DAD
            LDX   #^L0E1DAD
            PHA
            TXA
            STAL  L0E1D19+2
            PLA
            STAL  L0E1D19
            LDA   #L0E1DC5
            LDX   #^L0E1DC5
            PHA
            TXA
            STAL  L0E1D1D+2
            PLA
            STAL  L0E1D1D
            LDA   #L0E1DDD
            LDX   #^L0E1DDD
            PHA
            TXA
            STAL  L0E1D21+2
            PLA
            STAL  L0E1D21
            LDA   #L0E1DF5
            LDX   #^L0E1DF5
            PHA
            TXA
            STAL  L0E1D25+2
            PLA
            STAL  L0E1D25
            LDA   #L0E1E0D
            LDX   #^L0E1E0D
            PHA
            TXA
            STAL  L0E1D29+2
            PLA
            STAL  L0E1D29
            LDA   #L0E1E25
            LDX   #^L0E1E25
            PHA
            TXA
            STAL  L0E1D2D+2
            PLA
            STAL  L0E1D2D
            LDA   #L0E1E3D
            LDX   #^L0E1E3D
            PHA
            TXA
            STAL  L0E1D31+2
            PLA
            STAL  L0E1D31
            LDA   #L0E1E55
            LDX   #^L0E1E55
            PHA
            TXA
            STAL  L0E1D35+2
            PLA
            STAL  L0E1D35
            LDA   #L0E1E6D
            LDX   #^L0E1E6D
            PHA
            TXA
            STAL  L0E1D39+2
            PLA
            STAL  L0E1D39
            LDA   #L0E1E85
            LDX   #^L0E1E85
            PHA
            TXA
            STAL  L0E1D3D+2
            PLA
            STAL  L0E1D3D
            LDA   #L0E1E9D
            LDX   #^L0E1E9D
            PHA
            TXA
            STAL  L0E1D41+2
            PLA
            STAL  L0E1D41
            LDA   #L0E1EB5
            LDX   #^L0E1EB5
            PHA
            TXA
            STAL  L0E1D45+2
            PLA
            STAL  L0E1D45
            LDA   #L0E1ECD
            LDX   #^L0E1ECD
            PHA
            TXA
            STAL  L0E1D49+2
            PLA
            STAL  L0E1D49
            LDA   #L0E1EE5
            LDX   #^L0E1EE5
            PHA
            TXA
            STAL  L0E1D4D+2
            PLA
            STAL  L0E1D4D
            LDA   #L0E1EFD
            LDX   #^L0E1EFD
            PHA
            TXA
            STAL  L0E1D51+2
            PLA
            STAL  L0E1D51
            LDA   #L0E1F15
            LDX   #^L0E1F15
            PHA
            TXA
            STAL  L0E1D55+2
            PLA
            STAL  L0E1D55
            LDA   #L0E1F2D
            LDX   #^L0E1F2D
            PHA
            TXA
            STAL  L0E1D59+2
            PLA
            STAL  L0E1D59
            LDA   #L0E1F45
            LDX   #^L0E1F45
            PHA
            TXA
            STAL  L0E1D5D+2
            PLA
            STAL  L0E1D5D
            PHX
            PHA
            PEA   ^L0E1CFF
            PEA   L0E1CFF
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $F2
            STA   $F0
            PEA   $0001
            PEI   $F2
            PEI   $F0
            LDAL  L0E28D8
            CLC
            ADC   #$0003
            PHA
            _SetDItemValue
            STA   L0F0779
            PEA   $0001
            PEI   $F2
            PEI   $F0
            LDAL  L0E28D6
            CLC
            ADC   #$0005
            PHA
            _SetDItemValue
            STA   L0F0779
            PEA   $0001
            PEI   $F2
            PEI   $F0
            LDAL  L0E28DE
            CLC
            ADC   #$0008
            PHA
            _SetDItemValue
            STA   L0F0779
            PEA   $0001
            PEI   $F2
            PEI   $F0
            LDAL  L0E28DA
            CLC
            ADC   #$000B
            PHA
            _SetDItemValue
            STA   L0F0779
            PEA   $0001
            PEI   $F2
            PEI   $F0
            LDAL  L0E28DC
            CLC
            ADC   #$000E
            PHA
            _SetDItemValue
            STA   L0F0779
            PEA   ^L0E28C6
            PEA   L0E28C6
            LDA   L0F00F1
            PHA
            JSL   L0C0118
            PLY
            PLY
            PLY
            PEA   ^L0E5115
            PEA   L0E5115
            PEA   ^L0E28C6
            PEA   L0E28C6
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E2896
            PEA   L0E2896
            LDA   L0F00E7
            PHA
            JSL   L0C0118
            PLY
            PLY
            PLY
            LDA   L0F00E7
            SEC
            SBC   #$000A
            BVS   L060C0F
            EOR   #$8000
L060C0F     BMI   L060C25
            PEA   ^L0E5117
            PEA   L0E5117
            PEA   ^L0E28C6
            PEA   L0E28C6
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
L060C25     PEA   ^L0E2896
            PEA   L0E2896
            PEA   ^L0E28C6
            PEA   L0E28C6
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E5119
            PEA   L0E5119
            PEA   ^L0E28C6
            PEA   L0E28C6
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E2896
            PEA   L0E2896
            LDA   L0F00F9
            SEC
            SBC   #$076C
            PHA
            JSL   L0C0118
            PLY
            PLY
            PLY
            PEA   ^L0E2896
            PEA   L0E2896
            PEA   ^L0E28C6
            PEA   L0E28C6
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            JSL   L060EDC
            PEI   $F2
            PEI   $F0
            PEA   $0014
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            _SetIText
            STA   L0F0779
L060C91     LDA   $F4
            BNE   L060C98
            BRL   L060DED
L060C98     PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   L0F00E1
            LDA   L0F00E1
            SEC
            SBC   #$0003
            BVS   L060CB9
            EOR   #$8000
L060CB9     BMI   L060CBE
            BRL   L060DB6
L060CBE     LDA   L0F00E1
            SEC
            SBC   #$0012
            BEQ   L060CD1
            BVS   L060CCC
            EOR   #$8000
L060CCC     BPL   L060CD1
            BRL   L060DB6
L060CD1     PEA   $0001
            PEI   $F2
            PEI   $F0
            LDA   L0F00E1
            PHA
            _SetDItemValue
            STA   L0F0779
            LDA   L0F00E1
            SEC
            SBC   #$0003
            BVS   L060CF2
            EOR   #$8000
L060CF2     BPL   L060D10
            LDA   L0F00E1
            SEC
            SBC   #$0005
            BVS   L060D00
            EOR   #$8000
L060D00     BMI   L060D10
            LDA   L0F00E1
            SEC
            SBC   #$0003
            STAL  L0E28D8
            BRL   L060DB4
L060D10     LDA   L0F00E1
            SEC
            SBC   #$0005
            BVS   L060D1C
            EOR   #$8000
L060D1C     BPL   L060D3A
            LDA   L0F00E1
            SEC
            SBC   #$0008
            BVS   L060D2A
            EOR   #$8000
L060D2A     BMI   L060D3A
            LDA   L0F00E1
            SEC
            SBC   #$0005
            STAL  L0E28D6
            BRL   L060DB4
L060D3A     LDA   L0F00E1
            SEC
            SBC   #$0008
            BVS   L060D46
            EOR   #$8000
L060D46     BPL   L060D64
            LDA   L0F00E1
            SEC
            SBC   #$000B
            BVS   L060D54
            EOR   #$8000
L060D54     BMI   L060D64
            LDA   L0F00E1
            SEC
            SBC   #$0008
            STAL  L0E28DE
            BRL   L060DB4
L060D64     LDA   L0F00E1
            SEC
            SBC   #$000B
            BVS   L060D70
            EOR   #$8000
L060D70     BPL   L060D8D
            LDA   L0F00E1
            SEC
            SBC   #$000E
            BVS   L060D7E
            EOR   #$8000
L060D7E     BMI   L060D8D
            LDA   L0F00E1
            SEC
            SBC   #$000B
            STAL  L0E28DA
            BRA   L060DB4
L060D8D     LDA   L0F00E1
            SEC
            SBC   #$000E
            BVS   L060D99
            EOR   #$8000
L060D99     BPL   L060DB4
            LDA   L0F00E1
            SEC
            SBC   #$0013
            BVS   L060DA7
            EOR   #$8000
L060DA7     BMI   L060DB4
            LDA   L0F00E1
            SEC
            SBC   #$000E
            STAL  L0E28DC
L060DB4     BRA   L060DCF
L060DB6     LDA   L0F00E1
            CMP   #$0001
            BEQ   L060DC0
            BRA   L060DC6
L060DC0     STZ   $F4
            BRA   L060DCF
            BRA   L060DCD
L060DC6     CMP   #$0002
            BEQ   L060DCD
            BRA   L060DCF
L060DCD     STZ   $F4
L060DCF     JSL   L060EDC
            PEI   $F2
            PEI   $F0
            PEA   $0014
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            _SetIText
            STA   L0F0779
            BRL   L060C91
L060DED     PEI   $F2
            PEI   $F0
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   L0F00E1
            CMP   #$0002
            BNE   L060E1A
            LDA   #$0000
            BRA   L060E25
L060E1A     LDA   $FF
            CMP   #$FFFF
            BNE   L060E25
            JSL   L0611E5
L060E25     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L060E2F     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            LDA   $FF
            CMP   #$0002
            BEQ   L060E44
            BRL   L060E96
L060E44     LDAL  L0E28D8
            PHA
            PEI   $FD
            PEI   $FB
            JSL   L0B1191
            PLY
            PLY
            PLY
            LDAL  L0E28D6
            PHA
            PEI   $FD
            PEI   $FB
            JSL   L0B1201
            PLY
            PLY
            PLY
            LDAL  L0E28DE
            PHA
            PEI   $FD
            PEI   $FB
            JSL   L0B1276
            PLY
            PLY
            PLY
            LDAL  L0E28DA
            PHA
            PEI   $FD
            PEI   $FB
            JSL   L0B12EE
            PLY
            PLY
            PLY
            LDAL  L0E28DC
            PHA
            PEI   $FD
            PEI   $FB
            JSL   L0B1366
            PLY
            PLY
            PLY
            BRA   L060ED4
L060E96     LDA   $FF
            CMP   #$0001
            BEQ   L060EA4
            LDA   $FF
            CMP   #$0008
            BNE   L060ED4
L060EA4     LDAL  L0E28D0
            PHA
            PEI   $FD
            PEI   $FB
            JSL   L0B18CB
            PLY
            PLY
            PLY
            LDAL  L0E28D2
            PHA
            PEI   $FD
            PEI   $FB
            JSL   L0B193E
            PLY
            PLY
            PLY
            LDAL  L0E28D4
            PHA
            PEI   $FD
            PEI   $FB
            JSL   L0B19B3
            PLY
            PLY
            PLY
L060ED4     TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L060EDC     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            PEA   $0002
            PEA   ^L0F00A8
            PEA   L0F00A8
            JSL   L060E2F
            PLY
            PLY
            PLY
            PEA   ^L0E28C6
            PEA   L0E28C6
            PEA   ^L0E2896
            PEA   L0E2896
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E2896
            PEA   L0E2896
            LDA   L0F00A8
            PHA
            JSL   L0B13AB
            PLY
            PLY
            PLY
            PEA   ^L0E2896
            PEA   L0E2896
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L060F38     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDA   #L0E511B
            LDX   #^L0E511B
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
            BEQ   L060F70
            JSL   L061054
            BRL   L06104C
L060F70     LDAL  L0E32CF
            STAL  L0E32D9
            LDA   #L0E28D0
            LDX   #^L0E28D0
            PHA
            TXA
            STAL  L0E32DD
            PLA
            STAL  L0E32DB
            LDX   #$0000
            LDA   #$0010
            PHA
            TXA
            STAL  L0E32E1
            PLA
            STAL  L0E32DF
            PEA   $0012
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEA   $0002
            LDAL  L0E28D0
            PHA
            JSL   L0611AD
            PLY
            PLY
            TAY
            BNE   L060FC8
            BRL   L061048
L060FC8     PEA   $0011
            LDAL  L0E28D2
            PHA
            JSL   L0611AD
            PLY
            PLY
            TAY
            BNE   L060FDC
            BRL   L061048
L060FDC     PEA   $0002
            LDAL  L0E28D4
            PHA
            JSL   L0611AD
            PLY
            PLY
            TAY
            BNE   L060FF0
            BRL   L061048
L060FF0     PEA   $0002
            LDAL  L0E28D6
            PHA
            JSL   L0611AD
            PLY
            PLY
            TAY
            BNE   L061004
            BRL   L061048
L061004     PEA   $0001
            LDAL  L0E28D8
            PHA
            JSL   L0611AD
            PLY
            PLY
            TAY
            BEQ   L061048
            PEA   $0002
            LDAL  L0E28DA
            PHA
            JSL   L0611AD
            PLY
            PLY
            TAY
            BEQ   L061048
            PEA   $0004
            LDAL  L0E28DC
            PHA
            JSL   L0611AD
            PLY
            PLY
            TAY
            BEQ   L061048
            PEA   $0002
            LDAL  L0E28DE
            PHA
            JSL   L0611AD
            PLY
            PLY
            TAY
            BNE   L06104C
L061048     JSL   L061054
L06104C     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L061054     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDA   #$0000
            STAL  L0E28D0
            LDA   #$0000
            STAL  L0E28D2
            LDA   #$0002
            STAL  L0E28D4
            LDA   #$0000
            STAL  L0E28D6
            LDA   #$0000
            STAL  L0E28D8
            LDA   #$0000
            STAL  L0E28DA
            LDA   #$0000
            STAL  L0E28DC
            LDA   #$0000
            STAL  L0E28DE
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L06109F     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDAL  L0E28D0
            STAL  L0E28E0
            LDAL  L0E28D2
            STAL  L0E28E2
            LDAL  L0E28D6
            STAL  L0E28E6
            LDAL  L0E28D8
            STAL  L0E28E8
            LDAL  L0E28DA
            STAL  L0E28EA
            LDAL  L0E28DC
            STAL  L0E28EC
            LDAL  L0E28DE
            STAL  L0E28EE
            LDAL  L0E28D4
            STAL  L0E28E4
            LDA   L0F00A8
            PHA
            JSL   L0B1983
            PLY
            STAL  L0E28D4
            LDA   L0F00A8
            PHA
            JSL   L0B189D
            PLY
            STAL  L0E28D0
            LDA   L0F00A8
            PHA
            JSL   L0B190B
            PLY
            STAL  L0E28D2
            LDA   L0F00A8
            PHA
            JSL   L0B11D1
            PLY
            STAL  L0E28D6
            LDA   L0F00A8
            PHA
            JSL   L0B1163
            PLY
            STAL  L0E28D8
            LDA   L0F00A8
            PHA
            JSL   L0B12BB
            PLY
            STAL  L0E28DA
            LDA   L0F00A8
            PHA
            JSL   L0B1333
            PLY
            STAL  L0E28DC
            LDA   L0F00A8
            PHA
            JSL   L0B1243
            PLY
            STAL  L0E28DE
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L06115A     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDAL  L0E28E6
            STAL  L0E28D6
            LDAL  L0E28E8
            STAL  L0E28D8
            LDAL  L0E28EA
            STAL  L0E28DA
            LDAL  L0E28EC
            STAL  L0E28DC
            LDAL  L0E28EE
            STAL  L0E28DE
            LDAL  L0E28E2
            STAL  L0E28D2
            LDAL  L0E28E0
            STAL  L0E28D0
            LDAL  L0E28E4
            STAL  L0E28D4
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0611AD     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDA   $FD
            SEC
            SBC   #$0000
            BVS   L0611C3
            EOR   #$8000
L0611C3     BPL   L0611D3
            LDA   $FD
            SEC
            SBC   $FF
            BEQ   L0611D8
            BVS   L0611D1
            EOR   #$8000
L0611D1     BPL   L0611D8
L0611D3     LDA   #$0000
            BRA   L0611DB
L0611D8     LDA   #$0001
L0611DB     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0611E5     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            PEA   $0000
            JSL   L0B1E73
            PLY
            LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDA   #L0E511B
            LDX   #^L0E511B
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            JSL   L061327
            PLY
            PLY
            TAY
            BEQ   L06124E
            LDA   #L0E511B
            LDX   #^L0E511B
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
            BEQ   L06124B
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   #$0000
            BRL   L06131D
L06124B     BRL   L0612C6
L06124E     LDA   #L0E511B
            LDX   #^L0E511B
            PHA
            TXA
            STAL  L0E32B7
            PLA
            STAL  L0E32B5
            LDA   #$00C3
            STAL  L0E32B9
            LDA   #$0068
            STAL  L0E32BB
            LDX   #$0000
            LDA   #$0000
            PHA
            TXA
            STAL  L0E32BF
            PLA
            STAL  L0E32BD
            LDA   #$0000
            STAL  L0E32C1
            PEA   $0001
            PEA   ^L0E32B5
            PEA   L0E32B5
            JSL   L0F0831
            LDA   L0F0779
            CMP   #$0000
            BEQ   L0612A8
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   #$0000
            BRL   L06131D
L0612A8     LDA   #L0E511B
            LDX   #^L0E511B
            PHA
            TXA
            STAL  L0E32D3
            PLA
            STAL  L0E32D1
            PEA   $0010
            PEA   ^L0E32CF
            PEA   L0E32CF
            JSL   L0F0831
L0612C6     LDA   L0F0779
            CMP   #$0000
            BEQ   L0612D1
            BRL   L061315
L0612D1     LDAL  L0E32CF
            STAL  L0E32D9
            LDA   #L0E28D0
            LDX   #^L0E28D0
            PHA
            TXA
            STAL  L0E32DD
            PLA
            STAL  L0E32DB
            LDX   #$0000
            LDA   #$0010
            PHA
            TXA
            STAL  L0E32E1
            PLA
            STAL  L0E32DF
            PEA   $0013
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
L061315     PEA   $0001
            JSL   L0B1E73
            PLY
L06131D     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L061327     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
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
            STAL  L0E32B7
            PLA
            STAL  L0E32B5
            PEA   $0006
            PEA   ^L0E32B5
            PEA   L0E32B5
            JSL   L0F0831
            LDA   L0F0779
            CMP   #$0000
            BNE   L061371
            LDA   #$0001
            BRA   L061374
            BRA   L061374
L061371     LDA   #$0000
L061374     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L06137E     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E4
            TCS
            LDA   L0F0042
            BNE   L061394
            LDA   #$0001
            BRL   L061401
L061394     LDA   L0F0044
            CMP   #$0000
            BNE   L0613A8
            LDA   #L0E39B6
            LDX   #^L0E39B6
            STX   $EE
            STA   $EC
            BRA   L0613B2
L0613A8     LDA   #L0E3A18
            LDX   #^L0E3A18
            STX   $EE
            STA   $EC
L0613B2     LDA   #L0E399C
            LDX   #^L0E399C
            STX   $EA
            STA   $E8
            LDA   #L0E39D8
            LDX   #^L0E39D8
            STX   $F2
            STA   $F0
            LDA   #L0E39F9
            LDX   #^L0E39F9
            STX   $F6
            STA   $F4
            PEA   $0001
            PEA   $0004
            PEA   $0000
            TDC
            CLC
            ADC   #$00E8
            PHA
            PEA   $0002
            JSL   L0D00BF
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   $E6
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   $E6
L061401     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L06140B     ENT
            PHD
            TSC
            SEC
            SBC   #$00E9
            TCD
            ADC   #$00D8
            TCS
            LDA   $F3
            PHA
            LDA   #$0008
            SEC
            JSL   L0D151F
            PLA
            STA   $E2
            LDA   $E2
            CLC
            ADC   #$0020
            STA   $E4
            PEI   $E4
            PEI   $F1
            PEI   $EF
            JSL   L0C04CD
            PLY
            PLY
            PHA
            LDA   #$0008
            SEC
            JSL   L0D151F
            PLA
            CLC
            ADC   #$0020
            PHA
            JSL   L0C0027
            PLY
            PLY
            CLC
            ADC   #$001A
            STA   L0F00E3
            LDA   #$0280
            SEC
            SBC   L0F00E3
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLY
            STA   L0F00E5
            LDA   #$0280
            SEC
            SBC   L0F00E3
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLY
            LDX   #$0000
            TAY
            BPL   L061480
            DEX
L061480     STAL  L0E23B0
            LDA   #$0280
            SEC
            SBCL  L0E23B0
            LDX   #$0000
            TAY
            BPL   L061493
            DEX
L061493     STAL  L0E23B4
            LDA   L0F00E3
            SEC
            SBC   #$005A
            LDX   #$0000
            TAY
            BPL   L0614A5
            DEX
L0614A5     STAL  L0E23D4
            LDAL  L0E23D4
            LDX   #$0000
            TAY
            BPL   L0614B4
            DEX
L0614B4     STAL  L0E23EC
            LDA   L0F00E3
            CLC
            ADC   #$0046
            SEC
            SBC   #$005A
            LDX   #$0000
            TAY
            BPL   L0614CA
            DEX
L0614CA     STAL  L0E23D8
            LDAL  L0E23D8
            LDX   #$0000
            TAY
            BPL   L0614D9
            DEX
L0614D9     STAL  L0E23F0
            LDA   L0F00E3
            SEC
            SBC   #$0064
            LDX   #$0000
            TAY
            BPL   L0614EB
            DEX
L0614EB     STAL  L0E2408
            LDA   L0F00E3
            SEC
            SBC   #$006E
            LDX   #$0000
            TAY
            BPL   L0614FD
            DEX
L0614FD     STAL  L0E2420
            PEI   $F1
            PEI   $EF
            PEA   ^L0E3610
            PEA   L0E3610
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            PEI   $FB
            PEI   $F9
            PEA   ^L0E3690
            PEA   L0E3690
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E23DE
            PLA
            STAL  L0E23DC
            LDA   #L0E2053
            LDX   #^L0E2053
            PHA
            TXA
            STAL  L0E23F6
            PLA
            STAL  L0E23F4
            LDA   #L0E3610
            LDX   #^L0E3610
            PHA
            TXA
            STAL  L0E240E
            PLA
            STAL  L0E240C
            LDA   #L0E3690
            LDX   #^L0E3690
            PHA
            TXA
            STAL  L0E2426
            PLA
            STAL  L0E2424
            LDA   $F3
            STAL  L0E2428
            LDA   #L0E23D0
            LDX   #^L0E23D0
            PHA
            TXA
            STAL  L0E23BE
            PLA
            STAL  L0E23BC
            LDA   #L0E23E8
            LDX   #^L0E23E8
            PHA
            TXA
            STAL  L0E23C2
            PLA
            STAL  L0E23C0
            LDA   #L0E2400
            LDX   #^L0E2400
            PHA
            TXA
            STAL  L0E23C6
            PLA
            STAL  L0E23C4
            LDA   #L0E2418
            LDX   #^L0E2418
            PHA
            TXA
            STAL  L0E23CA
            PLA
            STAL  L0E23C8
            LDA   $FD
            BEQ   L0615C0
            LDA   #$0000
            SEP   #$20
            STA   [$F9]
            REP   #$20
L0615C0     LDA   #$0000
            SEP   #$20
            STAL  L0E2F09
            REP   #$20
            PHX
            PHA
            PEA   ^L0E23AE
            PEA   L0E23AE
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $DE
            STA   $DC
L0615E3     PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   $DA
            LDA   $DA
            SEC
            SBC   #$0003
            BVS   L061602
            EOR   #$8000
L061602     BMI   L0615E3
            PEI   $DE
            PEI   $DC
            PEA   $0004
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            _GetIText
            STA   L0F0779
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            PEI   $FB
            PEI   $F9
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
            PEI   $DE
            PEI   $DC
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   $DA
            TAY
            TDC
            CLC
            ADC   #$00E9
            TCS
            TYA
            PLD
            RTL

L061659     ENT
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
            LDY   #$005A
            LDA   [$F8],Y
            EOR   #$FFFF
            INC
            ASL
            ASL
            PHA
            LDA   #L0E496C
            STA   $F8
            LDA   #^L0E496C
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L06168E
            INC   $FA
L06168E     LDY   #$0002
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
            PEA   ^L0E3A9B
            PEA   L0E3A9B
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
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
            BCC   L0616E5
            INC   $FA
L0616E5     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0616EF
            INC   $FA
L0616EF     PEI   $FA
            PEI   $F8
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E5126
            PEA   L0E5126
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            JSL   L06182D
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L061721     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00BD
            TCS
            LDA   $FD
            EOR   #$FFFF
            INC
            ASL
            ASL
            PHA
            LDA   #L0E496C
            STA   $F4
            LDA   #^L0E496C
            STA   $F6
            PLA
            CLC
            ADC   $F4
            STA   $F4
            BCC   L061749
            INC   $F6
L061749     LDY   #$0002
            LDA   [$F4],Y
            TAX
            LDA   [$F4]
            STX   $EE
            STA   $EC
            PEA   ^L0E5128
            PEA   L0E5128
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00D3
            PHA
            PEI   $FF
            JSL   L0C0118
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00D3
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            JSL   L0D1C10
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00BF
            PHA
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDX   #$0000
            TDC
            CLC
            ADC   #$00BF
            STX   $F2
            STA   $F0
            PEA   $0002
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00EC
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

L0617E1     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            EOR   #$FFFF
            INC
            ASL
            ASL
            PHA
            LDA   #L0E496C
            STA   $F6
            LDA   #^L0E496C
            STA   $F8
            PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L061809
            INC   $F8
L061809     LDY   #$0002
            LDA   [$F6],Y
            TAX
            LDA   [$F6]
            PHX
            PHA
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            JSL   L06182D
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L06182D     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDA   #L0E4BCC
            LDX   #^L0E4BCC
            STX   $F6
            STA   $F4
            PEA   $0002
            PEA   $0001
            PEA   $0000
            TDC
            CLC
            ADC   #$00F4
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
            ADC   #$00FB
            TCS
            PLD
            RTL

L061865     ENT
            PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EA
            TCS
            LDA   #$0000
            STA   $EC
            STA   $EE
L061877     LDA   $EE
            PHA
            LDX   $FB
            LDA   $F9
            STA   $F0
            STX   $F2
            PLA
            TAY
            BPL   L061888
            DEC   $F2
L061888     CLC
            ADC   $F0
            STA   $F0
            BCC   L061891
            INC   $F2
L061891     LDA   [$F0]
            AND   #$00FF
            CMP   #$0000
            BEQ   L06189F
            INC   $EE
            BRA   L061877
L06189F     LDA   $EC
            INC   $EC
            PHA
            LDX   $FF
            LDA   $FD
            STA   $F0
            STX   $F2
            PLA
            TAY
            BPL   L0618B2
            DEC   $F2
L0618B2     CLC
            ADC   $F0
            STA   $F0
            BCC   L0618BB
            INC   $F2
L0618BB     LDA   [$F0]
            AND   #$00FF
            PHA
            LDA   $EE
            INC   $EE
            PHA
            LDX   $FB
            LDA   $F9
            STA   $F0
            STX   $F2
            PLA
            TAY
            BPL   L0618D4
            DEC   $F2
L0618D4     CLC
            ADC   $F0
            STA   $F0
            BCC   L0618DD
            INC   $F2
L0618DD     PLA
            SEP   #$20
            STA   [$F0]
            REP   #$20
            AND   #$00FF
            CMP   #$0000
            BEQ   L0618EE
            BRA   L06189F
L0618EE     TDC
            CLC
            ADC   #$00F3
            TCS
            PLD
            RTL

L0618F6     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E2474
            PLA
            STAL  L0E2472
            LDAL  L0E48B2
            TAX
            LDAL  L0E48B0
            PHA
            TXA
            STAL  L0E248C
            PLA
            STAL  L0E248A
            LDAL  L0E48B6
            TAX
            LDAL  L0E48B4
            PHA
            TXA
            STAL  L0E24A4
            PLA
            STAL  L0E24A2
            LDAL  L0E48BA
            TAX
            LDAL  L0E48B8
            PHA
            TXA
            STAL  L0E24BC
            PLA
            STAL  L0E24BA
            LDAL  L0E48BE
            TAX
            LDAL  L0E48BC
            PHA
            TXA
            STAL  L0E24D4
            PLA
            STAL  L0E24D2
            LDAL  L0E48C2
            TAX
            LDAL  L0E48C0
            PHA
            TXA
            STAL  L0E24EC
            PLA
            STAL  L0E24EA
            LDAL  L0E48C6
            TAX
            LDAL  L0E48C4
            PHA
            TXA
            STAL  L0E2504
            PLA
            STAL  L0E2502
            LDAL  L0E48CA
            TAX
            LDAL  L0E48C8
            PHA
            TXA
            STAL  L0E251C
            PLA
            STAL  L0E251A
            LDAL  L0E48CE
            TAX
            LDAL  L0E48CC
            PHA
            TXA
            STAL  L0E2534
            PLA
            STAL  L0E2532
            LDA   #L0E2466
            LDX   #^L0E2466
            PHA
            TXA
            STAL  L0E2440
            PLA
            STAL  L0E243E
            LDA   #L0E247E
            LDX   #^L0E247E
            PHA
            TXA
            STAL  L0E2444
            PLA
            STAL  L0E2442
            LDA   #L0E2496
            LDX   #^L0E2496
            PHA
            TXA
            STAL  L0E2448
            PLA
            STAL  L0E2446
            LDA   #L0E24AE
            LDX   #^L0E24AE
            PHA
            TXA
            STAL  L0E244C
            PLA
            STAL  L0E244A
            LDA   #L0E24C6
            LDX   #^L0E24C6
            PHA
            TXA
            STAL  L0E2450
            PLA
            STAL  L0E244E
            LDA   #L0E24DE
            LDX   #^L0E24DE
            PHA
            TXA
            STAL  L0E2454
            PLA
            STAL  L0E2452
            LDA   #L0E24F6
            LDX   #^L0E24F6
            PHA
            TXA
            STAL  L0E2458
            PLA
            STAL  L0E2456
            LDA   #L0E250E
            LDX   #^L0E250E
            PHA
            TXA
            STAL  L0E245C
            PLA
            STAL  L0E245A
            LDA   #L0E2526
            LDX   #^L0E2526
            PHA
            TXA
            STAL  L0E2460
            PLA
            STAL  L0E245E
            PHX
            PHA
            PEA   ^L0E2430
            PEA   L0E2430
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $F6
            STA   $F4
L061A63     PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   L0F00E1
            LDA   L0F00E1
            SEC
            SBC   #$0003
            BVS   L061A84
            EOR   #$8000
L061A84     BMI   L061A63
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
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L061AAE     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E8
            TCS
            LDA   #L0E2053
            LDX   #^L0E2053
            PHA
            TXA
            STAL  L0E5159
            PLA
            STAL  L0E5157
            LDA   #L0E3AB6
            LDX   #^L0E3AB6
            PHA
            TXA
            STAL  L0E5171
            PLA
            STAL  L0E516F
            LDA   #L0E514B
            LDX   #^L0E514B
            PHA
            TXA
            STAL  L0E5141
            PLA
            STAL  L0E513F
            LDA   #L0E5163
            LDX   #^L0E5163
            PHA
            TXA
            STAL  L0E5145
            PLA
            STAL  L0E5143
            STZ   L0F015F
            PHX
            PHA
            PEA   ^L0E5131
            PEA   L0E5131
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $F4
            STA   $F2
            STZ   $F6
            PEI   $F4
            PEI   $F2
            _DrawDialog
            STA   L0F0779
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BEQ   L061B5E
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L061B4E
            INX
L061B4E     PHX
            PHA
            PEA   ^L0E5188
            PEA   L0E5188
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L061B5E     LDA   L0F015F
            BEQ   L061B66
            BRL   L061D0C
L061B66     PHA
            PEA   $000A
            PEA   ^L0E002E
            PEA   L0E002E
            _GetNextEvent
            STA   L0F0779
            PLA
            TAY
            BNE   L061B81
            BRL   L061CEE
L061B81     LDAL  L0E002E
            CMP   #$0003
            BEQ   L061B8D
            BRL   L061C04
L061B8D     LDAL  L0E0030+2
            TAX
            LDAL  L0E0030
            AND   #$00FF
            CMP   #$000D
            BNE   L061C04
            LDA   #$0001
            STA   L0F015F
            PHX
            PHA
            PEI   $F4
            PEI   $F2
            PEA   $0001
            _GetControlDItem
            STA   L0F0779
            PLA
            PLX
            STX   $EC
            STA   $EA
            PEA   $0001
            PEI   $EC
            PEI   $EA
            _HiliteControl
            STA   L0F0779
            PEA   $0000
            PEI   $EC
            PEI   $EA
            _HiliteControl
            STA   L0F0779
            PEA   $0001
            PEI   $EC
            PEI   $EA
            _HiliteControl
            STA   L0F0779
            PEA   $0000
            PEI   $EC
            PEI   $EA
            _HiliteControl
            STA   L0F0779
            BRL   L061B5E
L061C04     LDAL  L0E002E
            CMP   #$0001
            BEQ   L061C10
            BRL   L061CEE
L061C10     PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            LDA   #L0E0038
            LDX   #^L0E0038
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L0D133A
            PLY
            PLY
            PLY
            PLY
            PLY
            _FindWindow
            STA   L0F0779
            PLA
            CMP   #$0013
            BEQ   L061C4D
            BRL   L061CEE
L061C4D     LDA   $EE
            CMP   $F2
            BEQ   L061C56
            BRL   L061CEE
L061C56     LDA   $F0
            CMP   $F4
            BEQ   L061C5F
            BRL   L061CEE
L061C5F     PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            LDA   #L0E0038
            LDX   #^L0E0038
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L0D133A
            PLY
            PLY
            PLY
            PLY
            PLY
            PEI   $F4
            PEI   $F2
            _FindControl
            STA   L0F0779
            PLA
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $EC
            LDA   $EA
            JSL   L0D157E
            BEQ   L061CEE
            PHA
            LDA   #L0E0038
            LDX   #^L0E0038
            TAY
            TSC
            SEC
            SBC   #$0004
            TCS
            PHX
            PHY
            PEA   $0000
            INC
            PHA
            PEA   $0004
            JSL   L0D133A
            PLY
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            PEA   $0000
            PEI   $EC
            PEI   $EA
            _TrackControl
            STA   L0F0779
            PLA
            CMP   #$0000
            BEQ   L061CEB
            LDA   #$0001
            STA   L0F015F
L061CEB     BRL   L061B5E
L061CEE     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BEQ   L061D05
            JSL   L063399
            BRA   L061D09
L061D05     JSL   L062847
L061D09     BRL   L061B5E
L061D0C     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BEQ   L061D5D
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0A10
            LDA   [$F8],Y
            TAX
            LDY   #$0A0E
            LDA   [$F8],Y
            STX   L0F00AD
            STA   L0F00AB
            PEA   ^L0E5188
            PEA   L0E5188
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L061D53
            INX
L061D53     PHX
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L061D5D     PEI   $F4
            PEI   $F2
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

L061D85     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00D6
            TCS
            LDA   #$0001
            STA   $DE
            LDA   $FF
            CMP   #$0000
            BEQ   L061D9E
            BRA   L061DBC
L061D9E     PEA   $0000
            JSL   L091C6A
            PLY
            LDA   #$0000
            SEP   #$20
            STAL  L0E2EF8
            REP   #$20
            LDA   #$0004
            STA   L0F0068
            BRL   L061E6C
            BRA   L061DC4
L061DBC     CMP   #$0001
            BEQ   L061DC4
            BRL   L061E6C
L061DC4     PEA   $0000
            JSL   L091C6A
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
            STA   $F6
            STX   $F8
            LDA   #$004A
            CLC
            ADC   $F6
            STA   $F6
            BCC   L061DF0
            INC   $F8
L061DF0     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L061DFA
            INC   $F8
L061DFA     LDA   [$F6]
            STA   $D8
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
            LDA   #$0058
            CLC
            ADC   $F6
            STA   $F6
            BCC   L061E1C
            INC   $F8
L061E1C     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L061E26
            INC   $F8
L061E26     PEI   $F8
            PEI   $F6
            PEA   ^L0E2EF8
            PEA   L0E2EF8
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
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
            LDA   #$004C
            CLC
            ADC   $F6
            STA   $F6
            BCC   L061E56
            INC   $F8
L061E56     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L061E60
            INC   $F8
L061E60     LDA   [$F6]
            AND   #$00FF
            CLC
            ADC   #$0004
            STA   L0F0068
L061E6C     LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E2202
            PLA
            STAL  L0E2200
            LDA   #L0E2053
            LDX   #^L0E2053
            PHA
            TXA
            STAL  L0E221A
            PLA
            STAL  L0E2218
            LDA   #L0E2EF8
            LDX   #^L0E2EF8
            PHA
            TXA
            STAL  L0E2232
            PLA
            STAL  L0E2230
            LDA   #L0E215F
            LDX   #^L0E215F
            PHA
            TXA
            STAL  L0E224A
            PLA
            STAL  L0E2248
            LDA   #L0E2165
            LDX   #^L0E2165
            PHA
            TXA
            STAL  L0E2262
            PLA
            STAL  L0E2260
            LDA   #L0E216D
            LDX   #^L0E216D
            PHA
            TXA
            STAL  L0E227A
            PLA
            STAL  L0E2278
            LDA   #L0E2173
            LDX   #^L0E2173
            PHA
            TXA
            STAL  L0E2292
            PLA
            STAL  L0E2290
            LDA   #L0E2179
            LDX   #^L0E2179
            PHA
            TXA
            STAL  L0E22AA
            PLA
            STAL  L0E22A8
            LDA   #L0E2181
            LDX   #^L0E2181
            PHA
            TXA
            STAL  L0E22C2
            PLA
            STAL  L0E22C0
            LDA   #L0E2188
            LDX   #^L0E2188
            PHA
            TXA
            STAL  L0E22DA
            PLA
            STAL  L0E22D8
            LDA   #L0E218F
            LDX   #^L0E218F
            PHA
            TXA
            STAL  L0E22F2
            PLA
            STAL  L0E22F0
            LDA   #L0E2194
            LDX   #^L0E2194
            PHA
            TXA
            STAL  L0E230A
            PLA
            STAL  L0E2308
            LDA   #L0E21A1
            LDX   #^L0E21A1
            PHA
            TXA
            STAL  L0E2322
            PLA
            STAL  L0E2320
            LDA   #L0E21F4
            LDX   #^L0E21F4
            PHA
            TXA
            STAL  L0E21BC+2
            PLA
            STAL  L0E21BC
            LDA   #L0E220C
            LDX   #^L0E220C
            PHA
            TXA
            STAL  L0E21C0+2
            PLA
            STAL  L0E21C0
            LDA   #L0E2224
            LDX   #^L0E2224
            PHA
            TXA
            STAL  L0E21C4+2
            PLA
            STAL  L0E21C4
            LDA   #L0E223C
            LDX   #^L0E223C
            PHA
            TXA
            STAL  L0E21C8+2
            PLA
            STAL  L0E21C8
            LDA   #L0E2254
            LDX   #^L0E2254
            PHA
            TXA
            STAL  L0E21CC+2
            PLA
            STAL  L0E21CC
            LDA   #L0E226C
            LDX   #^L0E226C
            PHA
            TXA
            STAL  L0E21D0+2
            PLA
            STAL  L0E21D0
            LDA   #L0E2284
            LDX   #^L0E2284
            PHA
            TXA
            STAL  L0E21D4+2
            PLA
            STAL  L0E21D4
            LDA   #L0E229C
            LDX   #^L0E229C
            PHA
            TXA
            STAL  L0E21D8+2
            PLA
            STAL  L0E21D8
            LDA   #L0E22B4
            LDX   #^L0E22B4
            PHA
            TXA
            STAL  L0E21DC+2
            PLA
            STAL  L0E21DC
            LDA   #L0E22CC
            LDX   #^L0E22CC
            PHA
            TXA
            STAL  L0E21E0+2
            PLA
            STAL  L0E21E0
            LDA   #L0E22E4
            LDX   #^L0E22E4
            PHA
            TXA
            STAL  L0E21E4+2
            PLA
            STAL  L0E21E4
            LDA   #L0E22FC
            LDX   #^L0E22FC
            PHA
            TXA
            STAL  L0E21E8+2
            PLA
            STAL  L0E21E8
            LDA   #L0E2314
            LDX   #^L0E2314
            PHA
            TXA
            STAL  L0E21EC+2
            PLA
            STAL  L0E21EC
            PHX
            PHA
            PEA   ^L0E21AE
            PEA   L0E21AE
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $DC
            STA   $DA
            PEA   $0001
            PEI   $DC
            PEI   $DA
            LDA   L0F0068
            PHA
            _SetDItemValue
            STA   L0F0779
L062053     LDA   $DE
            BEQ   L0620B2
            PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   $F4
            LDA   $F4
            SEC
            SBC   #$0004
            BVS   L062076
            EOR   #$8000
L062076     BPL   L0620A1
            LDA   $F4
            SEC
            SBC   #$000B
            BEQ   L062087
            BVS   L062085
            EOR   #$8000
L062085     BMI   L0620A1
L062087     PEA   $0001
            PEI   $DC
            PEI   $DA
            PEI   $F4
            _SetDItemValue
            STA   L0F0779
            LDA   $F4
            STA   L0F0068
            BRA   L0620B0
L0620A1     LDA   $F4
            SEC
            SBC   #$0003
            BVS   L0620AC
            EOR   #$8000
L0620AC     BMI   L0620B0
            STZ   $DE
L0620B0     BRA   L062053
L0620B2     PEI   $DC
            PEI   $DA
            PEA   $0003
            PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            _GetIText
            STA   L0F0779
            PEI   $DC
            PEI   $DA
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   $F4
            CMP   #$0002
            BNE   L0620F9
            LDA   #$FFFF
            BRL   L062242
L0620F9     PEA   $0000
            TDC
            CLC
            ADC   #$00E0
            PHA
            PEA   ^L0E2EF8
            PEA   L0E2EF8
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
            LDA   L0F0068
            SEC
            SBC   #$0002
            CMP   #$0002
            BEQ   L06211E
            BRA   L062129
L06211E     STZ   L0F00DB
            STZ   L0F00DD
            BRL   L0621C4
            BRA   L062130
L062129     CMP   #$0003
            BEQ   L062130
            BRA   L062141
L062130     LDA   #$0001
            STA   L0F00DB
            LDA   #$0002
            STA   L0F00DD
            BRL   L0621C4
            BRA   L062148
L062141     CMP   #$0004
            BEQ   L062148
            BRA   L062159
L062148     LDA   #$0002
            STA   L0F00DB
            LDA   #$0002
            STA   L0F00DD
            BRL   L0621C4
            BRA   L062160
L062159     CMP   #$0005
            BEQ   L062160
            BRA   L062171
L062160     LDA   #$0003
            STA   L0F00DB
            LDA   #$0002
            STA   L0F00DD
            BRL   L0621C4
            BRA   L062178
L062171     CMP   #$0006
            BEQ   L062178
            BRA   L062189
L062178     LDA   #$0004
            STA   L0F00DB
            LDA   #$0001
            STA   L0F00DD
            BRL   L0621C4
            BRA   L062190
L062189     CMP   #$0007
            BEQ   L062190
            BRA   L0621A0
L062190     LDA   #$0005
            STA   L0F00DB
            LDA   #$0002
            STA   L0F00DD
            BRA   L0621C4
            BRA   L0621A7
L0621A0     CMP   #$0008
            BEQ   L0621A7
            BRA   L0621B4
L0621A7     LDA   #$0006
            STA   L0F00DB
            STZ   L0F00DD
            BRA   L0621C4
            BRA   L0621BB
L0621B4     CMP   #$0009
            BEQ   L0621BB
            BRA   L0621C4
L0621BB     LDA   #$0007
            STA   L0F00DB
            STZ   L0F00DD
L0621C4     LDA   $FF
            CMP   #$0000
            BNE   L0621E8
            LDA   #$0048
            STA   L0F00D9
            LDX   L0F0030
            LDA   L0F002E
            STA   $F6
            STX   $F8
            LDA   [$F6]
            STA   L0F00D5
            LDA   L0F00D5
            STA   L0F00D7
            BRA   L062220
L0621E8     LDA   $D8
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
            LDA   #$004A
            CLC
            ADC   $F6
            STA   $F6
            BCC   L062206
            INC   $F8
L062206     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L062210
            INC   $F8
L062210     LDA   [$F6]
            STA   L0F00D9
            LDA   L0F0125
            STA   L0F00D5
            LDA   $D8
            STA   L0F00D7
L062220     LDA   $FF
            STA   L0F00DF
            LDA   #$0001
            STA   L0F0006
            PEA   ^L0E21AE
            PEA   L0E21AE
            PEA   ^L0E17C6
            PEA   L0E17C6
            JSL   L0C0BFE
            PLY
            PLY
            PLY
            PLY
            LDA   #$0000
L062242     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L06224C     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            PEA   $0001
            PEA   $0002
            PEA   ^L0E48DC
            PEA   L0E48DC
            PEA   $0002
            JSL   L0D00BF
            PLY
            PLY
            PLY
            PLY
            PLY
            TAY
            BEQ   L062279
            LDA   #$0001
            BRA   L06227C
            BRA   L06227C
L062279     LDA   #$0002
L06227C     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L062286     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00A9
            TCS
            PEA   $0000
            JSL   L091C6A
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
            BCC   L0622BD
            INC   $FA
L0622BD     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0622C7
            INC   $FA
L0622C7     LDA   [$F8]
            STA   $B1
            PEA   ^L0E517B
            PEA   L0E517B
            PEA   $0000
            TDC
            CLC
            ADC   #$00B5
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   $B1
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
            BCC   L062300
            INC   $FA
L062300     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L06230A
            INC   $FA
L06230A     PEI   $FA
            PEI   $F8
            PEA   $0000
            TDC
            CLC
            ADC   #$00B5
            PHA
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E5183
            PEA   L0E5183
            PEA   $0000
            TDC
            CLC
            ADC   #$00B5
            PHA
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00B5
            PHA
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDA   $B1
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
            BCC   L06236B
            INC   $FA
L06236B     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062375
            INC   $FA
L062375     PEI   $FA
            PEI   $F8
            PEA   $0000
            TDC
            CLC
            ADC   #$00B5
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00B5
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00E7
            PHA
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E235C
            PLA
            STAL  L0E235A
            LDA   #L0E2053
            LDX   #^L0E2053
            PHA
            TXA
            STAL  L0E2374
            PLA
            STAL  L0E2372
            LDA   #L0E4BCC
            LDX   #^L0E4BCC
            PHA
            TXA
            STAL  L0E238C
            PLA
            STAL  L0E238A
            LDX   #$0000
            TDC
            CLC
            ADC   #$00E7
            PHA
            TXA
            STAL  L0E23A4
            PLA
            STAL  L0E23A2
            LDA   #L0E234E
            LDX   #^L0E234E
            PHA
            TXA
            STAL  L0E233A+2
            PLA
            STAL  L0E233A
            LDA   #L0E2366
            LDX   #^L0E2366
            PHA
            TXA
            STAL  L0E233E+2
            PLA
            STAL  L0E233E
            LDA   #L0E237E
            LDX   #^L0E237E
            PHA
            TXA
            STAL  L0E2342+2
            PLA
            STAL  L0E2342
            LDA   #L0E2396
            LDX   #^L0E2396
            PHA
            TXA
            STAL  L0E2346+2
            PLA
            STAL  L0E2346
            PHX
            PHA
            PEA   ^L0E232C
            PEA   L0E232C
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $AF
            STA   $AD
L062446     PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   $AB
            LDA   $AB
            SEC
            SBC   #$0003
            BVS   L062465
            EOR   #$8000
L062465     BMI   L062446
            PEI   $AF
            PEI   $AD
            PEA   $0003
            PEA   $0000
            TDC
            CLC
            ADC   #$00E7
            PHA
            _GetIText
            STA   L0F0779
            PEI   $AF
            PEI   $AD
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   $AB
            CMP   #$0002
            BNE   L0624AE
            LDA   #$FFFF
            BRL   L062540
L0624AE     PEA   $0000
            TDC
            CLC
            ADC   #$00E7
            PHA
            PEA   ^L0E2EF8
            PEA   L0E2EF8
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
            LDA   $B1
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
            BCC   L0624E3
            INC   $FA
L0624E3     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0624ED
            INC   $FA
L0624ED     LDA   [$F8]
            AND   #$00FF
            STA   L0F00DB
            PEI   $B1
            JSL   L082F1F
            PLY
            STA   L0F00DD
            LDA   $B1
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
            BCC   L06251D
            INC   $FA
L06251D     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062527
            INC   $FA
L062527     LDA   [$F8]
            STA   L0F00D9
            LDA   L0F0125
            STA   L0F00D5
            LDA   $B1
            STA   L0F00D7
            LDA   #$0001
            STA   L0F00DF
            LDA   #$0000
L062540     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L06254A     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            LDA   L0F0070
            STA   $F4
            PEA   $0000
            JSL   L091C6A
            PLY
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
            BCC   L062585
            INC   $FA
L062585     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L06258F
            INC   $FA
L06258F     LDA   [$F8]
            STA   $F6
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
            LDA   #$0058
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0625B1
            INC   $FA
L0625B1     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0625BB
            INC   $FA
L0625BB     PEI   $FA
            PEI   $F8
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
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
            BCC   L0625EB
            INC   $FA
L0625EB     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0625F5
            INC   $FA
L0625F5     LDA   [$F8]
            AND   #$00FF
            CMP   #$0001
            BNE   L062617
            PEI   $F6
            JSL   L06268A
            PLY
            TAY
            BNE   L062617
            PEA   $FFEA
            JSL   L0617E1
            PLY
            LDA   #$FFFF
            BRL   L062680
L062617     LDAL  L0E48F2
            TAX
            LDAL  L0E48F0
            PHX
            PHA
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDA   #L0E4BCC
            LDX   #^L0E4BCC
            PHA
            TXA
            STAL  L0E48E6
            PLA
            STAL  L0E48E4
            PEA   $0001
            PEA   $0003
            PEA   ^L0E48E4
            PEA   L0E48E4
            PEA   $0002
            JSL   L0D00BF
            PLY
            PLY
            PLY
            PLY
            PLY
            TAY
            BEQ   L06267D
            LDA   L0F0125
            STA   L0F00D7
            LDA   #$0000
            BRA   L062680
            BRA   L062680
L06267D     LDA   #$FFFF
L062680     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L06268A     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00EC
            TCS
            STZ   $F0
L062697     LDA   #$0001
            BEQ   L0626E1
            LDA   $F0
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
            BCC   L0626BA
            INC   $F8
L0626BA     PLA
            CLC
            ADC   $F6
            STA   $F6
            BCC   L0626C4
            INC   $F8
L0626C4     LDA   [$F6]
            AND   #$00FF
            CMP   #$0008
            BNE   L0626D0
            BRA   L0626E1
L0626D0     INC   $F0
            LDA   $F0
            CMP   #$0020
            BNE   L0626DF
            LDA   #$0001
            BRL   L062804
L0626DF     BRA   L062697
L0626E1     LDA   #L0E0A9E
            LDX   #^L0E0A9E
            STX   L0F0034
            STA   L0F0032
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            LDX   $F8
            LDA   #$00BA
            CLC
            ADC   $F6
            BCC   L062702
            INX
L062702     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F6
            STX   $F8
            PLA
            PLX
            LDY   #$0A10
            PHA
            TXA
            STA   [$F6],Y
            PLA
            LDY   #$0A0E
            STA   [$F6],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F6
            STX   $F8
            LDX   $F8
            LDA   #$045C
            CLC
            ADC   $F6
            BCC   L062732
            INX
L062732     STX   L0F002C
            STA   L0F002A
            STZ   $F0
L06273A     LDA   $F0
            SEC
            SBC   #$0020
            BVS   L062745
            EOR   #$8000
L062745     BPL   L06274A
            BRL   L0627F9
L06274A     LDA   $F0
            ASL
            TAX
            LDAL  L0E0046,X
            CMP   #$FFFF
            BNE   L06275A
            BRL   L0627F4
L06275A     PEA   $0000
            PEA   $0000
            LDA   $F0
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
            LDY   #$0008
            LDA   [$F6],Y
            LDX   #$0000
            PHX
            PHA
            LDX   $F4
            LDA   $F2
            JSL   L0D1573
            PLA
            PLX
            STX   $F4
            STA   $F2
L0627A0     LDA   [$F2]
            AND   #$00FF
            CMP   #$0000
            BEQ   L0627F4
            LDA   [$F2]
            AND   #$00FF
            CMP   #$007F
            BNE   L0627EC
            LDX   #$0000
            LDA   #$0001
            PHX
            PHA
            LDX   $F4
            LDA   $F2
            JSL   L0D1573
            PLA
            PLX
            STA   $F6
            STX   $F8
            LDA   [$F6]
            AND   #$00FF
            STA   $EE
            LDA   $EE
            SEC
            SBC   #$0030
            STA   $EE
            LDA   $EE
            CMP   $FF
            BNE   L0627EC
            PEA   $0000
            JSL   L01141C
            PLY
            LDA   #$0000
            BRA   L062804
L0627EC     INC   $F2
            BNE   L0627F2
            INC   $F4
L0627F2     BRA   L0627A0
L0627F4     INC   $F0
            BRL   L06273A
L0627F9     PEA   $0000
            JSL   L01141C
            PLY
            LDA   #$0001
L062804     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L06280E     ENT
            PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            STA   L0F014B
            LDA   L0F004A
            STA   $F4
            PEA   $0000
            JSL   L091C6A
            PLY
            JSL   L063736
            TAY
            BEQ   L06283F
            JSL   L061AAE
            LDA   $F4
            STA   L0F004A
            JSL   L063E06
L06283F     TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L062847     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EA
            TCS
            LDA   L0F0145
            CMP   #$FFFF
            BEQ   L06285D
            BRL   L062950
L06285D     JSL   L062DDD
            LDA   L0F00FD
            BNE   L062869
            BRL   L062944
L062869     LDA   L0F015B
            SEC
            SBC   L0F015D
            BVS   L062875
            EOR   #$8000
L062875     BPL   L06287A
            BRL   L062944
L06287A     LDA   L0F004A
            STA   $EC
            STZ   $F6
            BRA   L0628D3
L062883     LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DC,X
            SEC
            SBC   $EC
            PHA
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E38DC,X
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DE,X
            SEC
            SBC   $EC
            PHA
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E38DE,X
            INC   $F6
L0628D3     LDA   $F6
            SEC
            SBC   L0F015D
            BVS   L0628DE
            EOR   #$8000
L0628DE     BPL   L062883
            JSL   L063B49
            LDA   #$0038
            STA   L0F0149
            STZ   L0F0147
            JSL   L063BD6
            LDA   L0F0109
            BNE   L0628FE
            LDA   #$FFFF
            STA   L0F0145
            BRA   L062914
L0628FE     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            STA   L0F0145
L062914     LDA   L0F0145
            PHA
            JSL   L0A24B8
            PLY
            STA   L0F0145
            JSL   L064034
            PEA   $000C
            JSL   L063EA1
            PLY
            PEA   $0086
            LDX   L0F0143
            LDA   L0F0141
            PHX
            PHA
            JSL   L064288
            PLY
            PLY
            PLY
            JSL   L063AE1
            BRA   L06294A
L062944     LDA   #$0001
            STA   L0F015F
L06294A     LDA   #$0000
            BRL   L062DD3
L062950     LDA   L0F0149
            CLC
            ADC   #$0001
            STA   L0F0149
            LDA   L0F0149
            SEC
            SBC   #$0037
            BVS   L062966
            EOR   #$8000
L062966     BPL   L06297C
            LDA   L0F0147
            CMP   #$0000
            BEQ   L062978
            PEA   $0007
            JSL   L063E77
            PLY
L062978     JSL   L0631F6
L06297C     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$00BA
            BCC   L062991
            INX
L062991     PHX
            PHA
            LDA   L0F0145
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
            STA   $F4
            LDA   $F4
            CMP   #$FFFE
            BNE   L0629C4
            LDA   #$0001
            STA   L0F015F
            LDA   #$0000
            BRL   L062DD3
L0629C4     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$00BA
            CLC
            ADC   $F8
            BCC   L0629D9
            INX
L0629D9     STX   L0F00AD
            STA   L0F00AB
            LDA   L0F0159
            STA   $F6
            BRL   L062D63
L0629E7     LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38E0,X
            STA   $F2
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DC,X
            STA   $F0
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DE,X
            STA   $EE
            PEI   $F2
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
            BCC   L062A45
            INC   $FA
L062A45     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062A4F
            INC   $FA
L062A4F     LDA   [$F8]
            AND   #$00FF
            CMP   #$0001
            BEQ   L062A8E
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
            BCC   L062A77
            INC   $FA
L062A77     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062A81
            INC   $FA
L062A81     LDA   [$F8]
            AND   #$00FF
            CMP   #$0008
            BEQ   L062A8E
            BRL   L062BD5
L062A8E     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0056
            LDA   [$F8],Y
            SEC
            SBC   #$0002
            BVS   L062AA6
            EOR   #$8000
L062AA6     BMI   L062AD0
            PEA   ^L0E5288
            PEA   L0E5288
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L062AC3
            INX
L062AC3     PHX
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRL   L062B89
L062AD0     LDA   #$0001
            STA   L0F0155
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L062AEB
            INX
L062AEB     PHX
            PHA
            JSL   L064158
            PLY
            PLY
            LDA   $F6
            ASL
            ASL
            PHA
            LDA   #L0E385C
            STA   $F8
            LDA   #^L0E385C
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062B0C
            INC   $FA
L062B0C     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            PHX
            PHA
            LDX   L0F0153
            LDA   L0F0151
            PHX
            PHA
            JSL   L0641E0
            PLY
            PLY
            PLY
            PLY
            TAY
            BEQ   L062B36
            LDA   $F6
            ASL
            TAX
            LDA   #$0001
            STAL  L0E381C,X
            BRA   L062B89
L062B36     LDA   $F6
            ASL
            ASL
            PHA
            LDA   #L0E385C
            STA   $F8
            LDA   #^L0E385C
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062B4F
            INC   $FA
L062B4F     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            CLC
            ADC   L0F0151
            PHA
            TXA
            ADC   L0F0153
            TAX
            PLA
            PHX
            PHA
            LDA   $F6
            ASL
            ASL
            PHA
            LDA   #L0E385C
            STA   $F8
            LDA   #^L0E385C
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062B7D
            INC   $FA
L062B7D     PLA
            PLX
            LDY   #$0002
            PHA
            TXA
            STA   [$F8],Y
            PLA
            STA   [$F8]
L062B89     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L062B9E
            INX
L062B9E     PHX
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
            BCC   L062BBE
            INC   $FA
L062BBE     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062BC8
            INC   $FA
L062BC8     LDA   [$F8]
            PHA
            JSL   L0B19F5
            PLY
            PLY
            PLY
            BRL   L062C50
L062BD5     LDA   $F2
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
            BCC   L062BF3
            INC   $FA
L062BF3     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062BFD
            INC   $FA
L062BFD     LDA   [$F8]
            AND   #$00FF
            CMP   #$0002
            BNE   L062C50
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L062C1C
            INX
L062C1C     PHX
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
            BCC   L062C3C
            INC   $FA
L062C3C     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062C46
            INC   $FA
L062C46     LDA   [$F8]
            PHA
            JSL   L0B13AB
            PLY
            PLY
            PLY
L062C50     LDA   $F0
            SEC
            SBC   #$0000
            BVS   L062C5B
            EOR   #$8000
L062C5B     BMI   L062C98
            LDX   L0F0143
            LDA   L0F0141
            PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L062C7A
            INX
L062C7A     PHX
            PHA
            PEI   $F2
            JSL   L082F1F
            PLY
            PHA
            PEI   $EE
            PEA   $0000
            JSL   L06404F
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            BRL   L062D61
L062C98     LDA   L0F004A
            SEC
            SBC   #$0001
            SEC
            SBC   $EE
            BVS   L062CA7
            EOR   #$8000
L062CA7     BPL   L062CAC
            BRL   L062D2A
L062CAC     PEA   $00FF
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L064288
            PLY
            PLY
            PLY
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L062CD7
            INX
L062CD7     PHX
            PHA
            PEI   $F2
            JSL   L082F1F
            PLY
            PHA
            LDA   $EE
            SEC
            SBC   $F0
            PHA
            PEA   $0000
            JSL   L06404F
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            LDA   L0F004A
            SEC
            SBC   $F0
            LDX   #$0000
            TAY
            BPL   L062D03
            DEX
L062D03     PHX
            PHA
            LDA   $F0
            TAX
            TXA
            CLC
            ADC   #L0E3796
            TAX
            LDA   #^L0E3796
            BCC   L062D14
            INC
L062D14     PHA
            PHX
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRA   L062D61
L062D2A     LDX   L0F0143
            LDA   L0F0141
            PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$090E
            BCC   L062D47
            INX
L062D47     PHX
            PHA
            PEI   $F2
            JSL   L082F1F
            PLY
            PHA
            PEI   $EE
            PEI   $F0
            JSL   L06404F
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
L062D61     INC   $F6
L062D63     LDA   $F6
            SEC
            SBC   L0F015B
            BVS   L062D6E
            EOR   #$8000
L062D6E     BMI   L062D73
            BRL   L0629E7
L062D73     PEA   $0001
            LDA   L0F004A
            PHA
            LDX   L0F0143
            LDA   L0F0141
            PHX
            PHA
            JSL   L063F0B
            PLY
            PLY
            PLY
            PLY
            LDA   L0F0145
            PHA
            JSL   L0A24B8
            PLY
            STA   L0F0145
            LDA   L0F0109
            BEQ   L062DD3
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDY   #$0020
            LDA   [$F8],Y
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            PLX
            STX   $F8
            CLC
            ADC   $F8
            SEC
            SBC   L0F0145
            BEQ   L062DCD
            BVS   L062DCB
            EOR   #$8000
L062DCB     BMI   L062DD3
L062DCD     LDA   #$FFFF
            STA   L0F0145
L062DD3     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L062DDD     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00D6
            TCS
            LDA   #$0000
            SEP   #$20
            STA   $D8
            REP   #$20
            LDA   L0F0155
            BNE   L062DFC
            LDA   #$0000
            BRL   L0631EC
L062DFC     LDA   L0F0159
            STA   $F6
            BRL   L062ED8
L062E04     LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38E0,X
            STA   $F0
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DC,X
            STA   $EE
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DE,X
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
            STA   $F8
            STX   $FA
            LDA   #$004C
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062E5B
            INC   $FA
L062E5B     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062E65
            INC   $FA
L062E65     LDA   [$F8]
            AND   #$00FF
            CMP   #$0001
            BEQ   L062EA1
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
            LDA   #$004C
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062E8D
            INC   $FA
L062E8D     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062E97
            INC   $FA
L062E97     LDA   [$F8]
            AND   #$00FF
            CMP   #$0008
            BNE   L062ED6
L062EA1     LDA   $EE
            STA   $F4
            BRA   L062EB7
L062EA7     LDA   $F4
            TAX
            LDA   #$003D
            SEP   #$20
            STAL  L0E3796,X
            REP   #$20
            INC   $F4
L062EB7     LDA   $EC
            CLC
            ADC   #$0001
            SEC
            SBC   $F4
            BEQ   L062ED6
            BVS   L062EC7
            EOR   #$8000
L062EC7     BPL   L062ED6
            LDA   $F4
            SEC
            SBC   L0F004A
            BVS   L062ED4
            EOR   #$8000
L062ED4     BPL   L062EA7
L062ED6     INC   $F6
L062ED8     LDA   $F6
            SEC
            SBC   L0F015B
            BVS   L062EE3
            EOR   #$8000
L062EE3     BMI   L062EE8
            BRL   L062E04
L062EE8     PEA   $0001
            LDA   L0F004A
            PHA
            LDX   L0F0143
            LDA   L0F0141
            PHX
            PHA
            JSL   L063F0B
            PLY
            PLY
            PLY
            PLY
            LDA   L0F0159
            STA   $F6
            BRL   L0631C5
L062F07     LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38E0,X
            STA   $F0
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DC,X
            STA   $EE
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DE,X
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
            STA   $F8
            STX   $FA
            LDA   #$004C
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062F5E
            INC   $FA
L062F5E     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062F68
            INC   $FA
L062F68     LDA   [$F8]
            AND   #$00FF
            CMP   #$0001
            BEQ   L062FA7
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
            LDA   #$004C
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062F90
            INC   $FA
L062F90     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062F9A
            INC   $FA
L062F9A     LDA   [$F8]
            AND   #$00FF
            CMP   #$0008
            BEQ   L062FA7
            BRL   L0631C3
L062FA7     LDA   $F6
            ASL
            TAX
            LDAL  L0E381C,X
            BEQ   L062FD1
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DE,X
            TAX
            LDA   #$003F
            SEP   #$20
            STAL  L0E3796,X
            REP   #$20
            BRL   L0631C3
L062FD1     PEA   ^L0E4BCC
            PEA   L0E4BCC
            LDA   $F6
            ASL
            ASL
            PHA
            LDA   #L0E385C
            STA   $F8
            LDA   #^L0E385C
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L062FF0
            INC   $FA
L062FF0     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            PHX
            PHA
            JSL   L0C01F2
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0C04CD
            PLY
            PLY
            STA   $F2
            LDA   $F2
            SEC
            SBC   #$0002
            BVS   L06301B
            EOR   #$8000
L06301B     BMI   L06303C
            LDAL  L0E4BCC
            SEP   #$20
            STAL  L0E4BCD
            REP   #$20
            LDA   #$0030
            SEP   #$20
            STAL  L0E4BCC
            REP   #$20
            LDA   $F2
            CLC
            ADC   #$0001
            STA   $F2
L06303C     LDA   $F2
            TAX
            LDAL  L0E4BCB,X
            AND   #$00FF
            PHA
            LDA   $F2
            TAX
            PLA
            SEP   #$20
            STAL  L0E4BCC,X
            REP   #$20
            LDA   $F2
            TAX
            LDAL  L0E4BCA,X
            AND   #$00FF
            PHA
            LDA   $F2
            TAX
            PLA
            SEP   #$20
            STAL  L0E4BCB,X
            REP   #$20
            LDA   $F2
            TAX
            LDA   #$002E
            SEP   #$20
            STAL  L0E4BCA,X
            REP   #$20
            LDA   $F2
            CLC
            ADC   #$0001
            TAX
            LDA   #$0000
            SEP   #$20
            STAL  L0E4BCC,X
            REP   #$20
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
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
            STA   $F8
            STX   $FA
            LDA   #$0048
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0630C8
            INC   $FA
L0630C8     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0630D2
            INC   $FA
L0630D2     LDA   [$F8]
            PHA
            JSL   L0B19F5
            PLY
            PLY
            PLY
            PEA   $00FF
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L064288
            PLY
            PLY
            PLY
            LDA   $EE
            SEC
            SBC   #$0000
            BVS   L0630F7
            EOR   #$8000
L0630F7     BMI   L063126
            LDX   L0F0143
            LDA   L0F0141
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            PEI   $F0
            JSL   L082F1F
            PLY
            PHA
            PEI   $EC
            PEA   $0000
            JSL   L06404F
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            BRL   L0631C3
L063126     LDA   L0F004A
            SEC
            SBC   #$0001
            SEC
            SBC   $EC
            BVS   L063135
            EOR   #$8000
L063135     BPL   L06313A
            BRL   L06319A
L06313A     PEA   ^L0E4BCC
            PEA   L0E4BCC
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            PEI   $F0
            JSL   L082F1F
            PLY
            PHA
            LDA   $EC
            SEC
            SBC   $EE
            PHA
            PEA   $0000
            JSL   L06404F
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            LDA   L0F004A
            SEC
            SBC   $EE
            LDX   #$0000
            TAY
            BPL   L063173
            DEX
L063173     PHX
            PHA
            LDA   $EE
            TAX
            TXA
            CLC
            ADC   #L0E3796
            TAX
            LDA   #^L0E3796
            BCC   L063184
            INC
L063184     PHA
            PHX
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRA   L0631C3
L06319A     LDX   L0F0143
            LDA   L0F0141
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$00D8
            PHA
            PEI   $F0
            JSL   L082F1F
            PLY
            PHA
            PEI   $EC
            PEI   $EE
            JSL   L06404F
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
L0631C3     INC   $F6
L0631C5     LDA   $F6
            SEC
            SBC   L0F015B
            BVS   L0631D0
            EOR   #$8000
L0631D0     BMI   L0631D5
            BRL   L062F07
L0631D5     PEA   $0001
            LDA   L0F004A
            PHA
            LDX   L0F0143
            LDA   L0F0141
            PHX
            PHA
            JSL   L063F0B
            PLY
            PLY
            PLY
            PLY
L0631EC     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L0631F6     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F2
            TCS
            PEA   $0086
            PEA   ^L0E3796
            PEA   L0E3796
            JSL   L064288
            PLY
            PLY
            PLY
            LDX   L0F0139
            LDA   L0F0137
            PHX
            PHA
            LDA   L0F013D
            TAX
            TXA
            CLC
            ADC   #L0E3796
            TAX
            LDA   #^L0E3796
            BCC   L063229
            INC
L063229     PHA
            PHX
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E528C
            PEA   L0E528C
            LDA   L0F013F
            TAX
            TXA
            CLC
            ADC   #L0E3796
            TAX
            LDA   #^L0E3796
            BCC   L063249
            INC
L063249     PHA
            PHX
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   L0F0147
            CLC
            ADC   #$0001
            STA   L0F0147
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            LDA   L0F0147
            PHA
            JSL   L0C0118
            PLY
            PLY
            PLY
            LDX   L0F0143
            LDA   L0F0141
            PHX
            PHA
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            PEA   $0002
            LDA   L0F013F
            CLC
            ADC   #$0008
            PHA
            LDA   L0F013F
            CLC
            ADC   #$0005
            PHA
            JSL   L06404F
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            PEA   $0001
            LDA   L0F00FB
            PHA
            LDX   L0F0143
            LDA   L0F0141
            PHX
            PHA
            JSL   L063F0B
            PLY
            PLY
            PLY
            PLY
            PEA   $0001
            JSL   L063E77
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BEQ   L0632D7
            LDA   #$0002
            STA   L0F0149
            LDA   #$0000
            BRL   L06338F
L0632D7     PEA   ^L0E3710
            PEA   L0E3710
            JSL   L0C04CD
            PLY
            PLY
            STA   $F6
            LDA   $F6
            SEC
            SBC   L0F004A
            BEQ   L0632F9
            BVS   L0632F2
            EOR   #$8000
L0632F2     BPL   L0632F9
            LDA   L0F004A
            STA   $F6
L0632F9     PEA   $0000
            PEI   $F6
            PEA   ^L0E3710
            PEA   L0E3710
            JSL   L063F0B
            PLY
            PLY
            PLY
            PLY
            LDA   L0F0159
            STA   $F6
            BRA   L063368
L063313     LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DC,X
            STA   $F4
            BRA   L063338
L063328     LDA   $F4
            TAX
            LDA   #$002D
            SEP   #$20
            STAL  L0E3796,X
            REP   #$20
            INC   $F4
L063338     LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DE,X
            CLC
            ADC   #$0001
            SEC
            SBC   $F4
            BEQ   L063366
            BVS   L063357
            EOR   #$8000
L063357     BPL   L063366
            LDA   $F4
            SEC
            SBC   L0F004A
            BVS   L063364
            EOR   #$8000
L063364     BPL   L063328
L063366     INC   $F6
L063368     LDA   $F6
            SEC
            SBC   L0F015B
            BVS   L063373
            EOR   #$8000
L063373     BPL   L063313
            PEA   $0001
            LDA   L0F004A
            PHA
            LDX   L0F0143
            LDA   L0F0141
            PHX
            PHA
            JSL   L063F0B
            PLY
            PLY
            PLY
            PLY
            STZ   L0F0149
L06338F     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L063399     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E6
            TCS
            LDA   L0F0107
            BEQ   L0633DE
            LDA   L0F0147
            CMP   #$0000
            BNE   L0633B7
            JSL   L0631F6
            BRA   L0633DE
L0633B7     LDA   L0F0149
            CLC
            ADC   L0F0101
            CLC
            ADC   L0F0105
            SEC
            SBC   #$003C
            BVS   L0633CB
            EOR   #$8000
L0633CB     BPL   L0633DE
            LDA   #$0042
            SEC
            SBC   L0F0149
            PHA
            JSL   L063E77
            PLY
            JSL   L0631F6
L0633DE     PEA   ^L0E0F82
            PEA   L0E0F82
            LDA   L0F0145
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
            STA   $EE
            LDA   $EE
            CMP   #$FFFE
            BNE   L063415
            LDA   #$0001
            STA   L0F015F
            LDA   #$0000
            BRL   L06372C
L063415     STZ   $F2
            BRL   L0636A2
L06341A     STZ   $EC
            LDA   $F2
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
            BCC   L063438
            INC   $FA
L063438     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L063442
            INC   $FA
L063442     LDA   [$F8]
            SEC
            SBC   #$0000
            BNE   L06344D
            BRL   L063686
L06344D     BVS   L063452
            EOR   #$8000
L063452     BMI   L063457
            BRL   L063686
L063457     STZ   $F6
            STZ   $F0
            BRL   L06364F
L06345E     PEI   $F6
            PEI   $F2
            JSL   L08340A
            PLY
            PLY
            TAY
            BNE   L06346F
            INC   $F6
            BRA   L06345E
L06346F     LDA   $F6
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
            BCC   L06348B
            INC   $FA
L06348B     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L063495
            INC   $FA
L063495     LDA   [$F8]
            STA   $F4
            INC   $F6
            LDA   #L0E0F82
            LDX   #^L0E0F82
            STX   L0F00AD
            STA   L0F00AB
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            PEA   ^L0E0F82
            PEA   L0E0F82
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            PEI   $F4
            JSL   L0721E0
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
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
            BCC   L0634E8
            INC   $FA
L0634E8     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0634F2
            INC   $FA
L0634F2     LDA   [$F8]
            AND   #$00FF
            CMP   #$0001
            BEQ   L063531
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
            BCC   L06351A
            INC   $FA
L06351A     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L063524
            INC   $FA
L063524     LDA   [$F8]
            AND   #$00FF
            CMP   #$0008
            BEQ   L063531
            BRL   L06358C
L063531     LDA   $EA
            SEC
            SBC   #$0002
            BVS   L06353C
            EOR   #$8000
L06353C     BMI   L063552
            PEA   ^L0E5291
            PEA   L0E5291
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L063552     PEA   ^L0E4BCC
            PEA   L0E4BCC
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
            LDA   #$0048
            CLC
            ADC   $F8
            STA   $F8
            BCC   L063576
            INC   $FA
L063576     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L063580
            INC   $FA
L063580     LDA   [$F8]
            PHA
            JSL   L0B19F5
            PLY
            PLY
            PLY
            BRA   L0635F6
L06358C     LDA   $F4
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
            BCC   L0635AA
            INC   $FA
L0635AA     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0635B4
            INC   $FA
L0635B4     LDA   [$F8]
            AND   #$00FF
            CMP   #$0002
            BNE   L0635F6
            PEA   ^L0E4BCC
            PEA   L0E4BCC
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
            LDA   #$0048
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0635E2
            INC   $FA
L0635E2     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0635EC
            INC   $FA
L0635EC     LDA   [$F8]
            PHA
            JSL   L0B13AB
            PLY
            PLY
            PLY
L0635F6     PEA   ^L0E4BCC
            PEA   L0E4BCC
            LDA   $EC
            TAX
            TXA
            CLC
            ADC   #L0E3796
            TAX
            LDA   #^L0E3796
            BCC   L06360B
            INC
L06360B     PHA
            PHX
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0C04CD
            PLY
            PLY
            PHA
            LDA   $EC
            PLX
            STX   $F8
            CLC
            ADC   $F8
            STA   $EC
            LDA   $EC
            INC   $EC
            TAX
            LDA   #$0020
            SEP   #$20
            STAL  L0E3796,X
            REP   #$20
            LDA   $EC
            SEC
            SBC   L0F00FF
            BEQ   L06364D
            BVS   L063649
            EOR   #$8000
L063649     BPL   L06364D
            BRA   L063686
L06364D     INC   $F0
L06364F     LDA   $F2
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
            BCC   L06366B
            INC   $FA
L06366B     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L063675
            INC   $FA
L063675     LDA   [$F8]
            SEC
            SBC   $F0
            BEQ   L063686
            BVS   L063681
            EOR   #$8000
L063681     BPL   L063686
            BRL   L06345E
L063686     PEA   $0001
            LDA   L0F00FF
            PHA
            LDX   L0F0143
            LDA   L0F0141
            PHX
            PHA
            JSL   L063F0B
            PLY
            PLY
            PLY
            PLY
            INC   L0F0149
            INC   $F2
L0636A2     LDA   $F2
            SEC
            SBC   L0F0101
            BVS   L0636AD
            EOR   #$8000
L0636AD     BMI   L0636B2
            BRL   L06341A
L0636B2     LDA   L0F0103
            CMP   #$0001
            BNE   L0636D5
            LDA   #$0042
            SEC
            SBC   L0F0149
            STA   $E8
            PEI   $E8
            JSL   L063E77
            PLY
            LDA   L0F0149
            CLC
            ADC   $E8
            STA   L0F0149
            BRA   L0636E8
L0636D5     LDA   L0F0105
            PHA
            JSL   L063E77
            PLY
            LDA   L0F0149
            CLC
            ADC   L0F0105
            STA   L0F0149
L0636E8     LDA   L0F0145
            PHA
            JSL   L0A24B8
            PLY
            STA   L0F0145
            LDA   L0F0109
            BEQ   L06371B
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            SEC
            SBC   L0F0145
            BEQ   L063715
            BVS   L063713
            EOR   #$8000
L063713     BMI   L06371B
L063715     LDA   #$FFFF
            STA   L0F0145
L06371B     LDA   L0F0145
            CMP   #$FFFF
            BNE   L06372C
            LDA   #$0001
            STA   L0F015F
            LDA   #$0000
L06372C     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L063736     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E4
            TCS
            JSL   L050F84
            LDA   L0F0109
            BNE   L063752
            LDA   #$FFFF
            STA   L0F0145
            BRA   L063768
L063752     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$002E
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            STA   L0F0145
L063768     LDA   L0F0145
            PHA
            JSL   L0A24B8
            PLY
            STA   L0F0145
            LDA   L0F0145
            CMP   #$FFFF
            BNE   L063782
            LDA   #$0000
            BRL   L063842
L063782     LDA   L0F0000
            BEQ   L063795
            LDA   #L0E332D
            LDX   #^L0E332D
            STX   L0F0139
            STA   L0F0137
            BRA   L0637B0
L063795     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$0008
            CLC
            ADC   $F8
            BCC   L0637AA
            INX
L0637AA     STX   L0F0139
            STA   L0F0137
L0637B0     LDX   L0F0139
            LDA   L0F0137
            PHX
            PHA
            JSL   L0C04CD
            PLY
            PLY
            STA   L0F013B
            STZ   $F6
            BRA   L0637E3
L0637C5     LDA   $F6
            TAX
            LDA   #$0020
            SEP   #$20
            STAL  L0E3796,X
            REP   #$20
            LDA   $F6
            TAX
            LDA   #$0020
            SEP   #$20
            STAL  L0E3710,X
            REP   #$20
            INC   $F6
L0637E3     LDA   $F6
            SEC
            SBC   #$0086
            BVS   L0637EE
            EOR   #$8000
L0637EE     BPL   L0637C5
            STZ   L0F0147
            LDA   #$0038
            STA   L0F0149
            LDA   #L0E3796
            LDX   #^L0E3796
            STX   L0F0143
            STA   L0F0141
            STZ   L0F0155
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BEQ   L06381F
            JSL   L063D99
            BRA   L063823
L06381F     JSL   L06389C
L063823     LDA   L0F014B
            CMP   #$0002
            BNE   L063835
            LDAL  L0E32CF
            STAL  L0E32D9
            BRA   L06383F
L063835     JSL   L06384C
            STA   $E6
            LDA   $E6
            BRA   L063842
L06383F     LDA   #$0001
L063842     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L06384C     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            PEA   $0000
            PEA   $0001
            _SetOutputDevice
            STA   L0F0779
            LDA   L0F0779
            CMP   #$0000
            BEQ   L06387C
            PEA   $FFFD
            JSL   L0617E1
            PLY
            LDA   #$0000
            BRA   L06387F
L06387C     LDA   #$0001
L06387F     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L063889     PHD
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

L06389C     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E2
            TCS
            LDA   L0F00FB
            STA   L0F004A
            STZ   $F4
            STZ   L0F015D
            JSL   L063AE1
            STZ   $F6
            BRL   L063995
L0638BB     LDA   $F6
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
            BCC   L0638DE
            INC   $FA
L0638DE     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0638E8
            INC   $FA
L0638E8     LDA   [$F8]
            STA   $EC
            PEI   $EC
            JSL   L083089
            PLY
            TAY
            BNE   L0638F9
            BRL   L063993
L0638F9     LDA   $EC
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
            BCC   L063917
            INC   $FA
L063917     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L063921
            INC   $FA
L063921     LDA   [$F8]
            SEC
            SBC   #$0004
            PHA
            LDA   #$0008
            SEC
            JSL   L0D14B6
            PLY
            STA   $F2
            LDA   L0F015D
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   $F4
            STAL  L0E38DC,X
            LDA   $F4
            CLC
            ADC   $F2
            SEC
            SBC   #$0001
            PHA
            LDA   L0F015D
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E38DE,X
            LDA   L0F015D
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDA   $EC
            STAL  L0E38E0,X
            LDA   L0F015D
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DE,X
            CLC
            ADC   #$0003
            STA   $F4
            INC   L0F015D
L063993     INC   $F6
L063995     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   $F6
            BEQ   L0639B3
            BVS   L0639AE
            EOR   #$8000
L0639AE     BPL   L0639B3
            BRL   L0638BB
L0639B3     LDA   L0F015D
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38D8,X
            STA   $EE
            LDA   L0F004A
            SEC
            SBC   #$0001
            SEC
            SBC   $EE
            BNE   L0639D6
            BRL   L063AC4
L0639D6     BVS   L0639DB
            EOR   #$8000
L0639DB     BMI   L0639E0
            BRL   L063AC4
L0639E0     STZ   L0F0159
            LDA   L0F015D
            STA   L0F0157
            LDA   L0F0159
            CLC
            ADC   L0F0157
            STA   L0F015B
            LDA   L0F004A
            SEC
            SBC   $EE
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLY
            STA   $F0
            STZ   $F6
            BRA   L063A59
L063A09     LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DC,X
            CLC
            ADC   $F0
            PHA
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E38DC,X
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DE,X
            CLC
            ADC   $F0
            PHA
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            PLA
            STAL  L0E38DE,X
            INC   $F6
L063A59     LDA   $F6
            SEC
            SBC   L0F015D
            BVS   L063A64
            EOR   #$8000
L063A64     BPL   L063A09
            LDA   L0F013B
            CLC
            ADC   #$0008
            PHA
            LDA   $EE
            CLC
            ADC   #$0001
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BEQ   L063A96
            BVS   L063A81
            EOR   #$8000
L063A81     BPL   L063A96
            LDA   $F0
            STA   L0F013D
            LDA   $EE
            CLC
            ADC   $F0
            SEC
            SBC   #$0008
            STA   L0F013F
            BRA   L063AC2
L063A96     LDA   L0F013B
            CLC
            ADC   #$0008
            PHA
            LDA   L0F004A
            PLX
            STX   $F8
            SEC
            SBC   $F8
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLY
            STA   L0F013D
            LDA   L0F013D
            CLC
            ADC   L0F013B
            SEC
            SBC   #$0001
            STA   L0F013F
L063AC2     BRA   L063AD5
L063AC4     JSL   L063B49
            STZ   L0F013D
            LDA   L0F004A
            SEC
            SBC   #$0009
            STA   L0F013F
L063AD5     JSL   L063BD6
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L063AE1     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            STZ   $F6
            BRA   L063B26
L063AF0     LDA   $F6
            ASL
            ASL
            PHA
            LDA   #L0E385C
            STA   $F8
            LDA   #^L0E385C
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L063B09
            INC   $FA
L063B09     LDX   #$0000
            LDA   #$0000
            LDY   #$0002
            PHA
            TXA
            STA   [$F8],Y
            PLA
            STA   [$F8]
            LDA   $F6
            ASL
            TAX
            LDA   #$0000
            STAL  L0E381C,X
            INC   $F6
L063B26     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   $F6
            BEQ   L063B41
            BVS   L063B3F
            EOR   #$8000
L063B3F     BMI   L063AF0
L063B41     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L063B49     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            STZ   L0F0159
L063B57     LDA   L0F0159
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DE,X
            SEC
            SBC   #$0000
            BVS   L063B72
            EOR   #$8000
L063B72     BMI   L063B79
            INC   L0F0159
            BRA   L063B57
L063B79     LDA   L0F0159
            CLC
            ADC   #$0001
            STA   L0F015B
L063B83     LDA   #$0001
            BEQ   L063BCE
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            CMP   L0F015B
            BNE   L063B9E
            BRA   L063BCE
L063B9E     LDA   L0F015B
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DC,X
            PHA
            LDA   L0F004A
            SEC
            SBC   #$0001
            PLX
            STX   $F8
            SEC
            SBC   $F8
            BEQ   L063BC7
            BVS   L063BC5
            EOR   #$8000
L063BC5     BMI   L063BC9
L063BC7     BRA   L063BCE
L063BC9     INC   L0F015B
            BRA   L063B83
L063BCE     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L063BD6     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EC
            TCS
            PEA   $00FF
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L064288
            PLY
            PLY
            PLY
            PEA   $0085
            PEA   ^L0E3710
            PEA   L0E3710
            JSL   L064288
            PLY
            PLY
            PLY
            LDA   L0F0159
            STA   $F6
            BRL   L063D81
L063C09     LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38E0,X
            STA   $F4
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DE,X
            STA   $F2
            LDA   $F6
            PHA
            LDA   #$0006
            CLC
            JSL   L0D151F
            PLA
            TAX
            LDAL  L0E38DC,X
            STA   $F0
            PEI   $F4
            JSL   L082F1F
            PLY
            STA   $EE
            LDA   $F0
            SEC
            SBC   #$0000
            BVS   L063C56
            EOR   #$8000
L063C56     BMI   L063CA0
            PEA   ^L0E3710
            PEA   L0E3710
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
            BCC   L063C7C
            INC   $FA
L063C7C     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L063C86
            INC   $FA
L063C86     PEI   $FA
            PEI   $F8
            PEI   $EE
            PEI   $F2
            PEA   $0000
            JSL   L06404F
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            BRL   L063D7F
L063CA0     LDA   L0F004A
            SEC
            SBC   #$0001
            SEC
            SBC   $F2
            BVS   L063CAF
            EOR   #$8000
L063CAF     BPL   L063CB4
            BRL   L063D3B
L063CB4     PEA   ^L0E4BCC
            PEA   L0E4BCC
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
            BCC   L063CD8
            INC   $FA
L063CD8     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L063CE2
            INC   $FA
L063CE2     PEI   $FA
            PEI   $F8
            PEI   $EE
            LDA   $F2
            SEC
            SBC   $F0
            PHA
            PEA   $0000
            JSL   L06404F
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            LDA   $F0
            SEC
            SBC   #$0001
            PHA
            LDA   L0F004A
            PLX
            STX   $F8
            SEC
            SBC   $F8
            LDX   #$0000
            TAY
            BPL   L063D14
            DEX
L063D14     PHX
            PHA
            LDA   $F0
            TAX
            TXA
            CLC
            ADC   #L0E3710
            TAX
            LDA   #^L0E3710
            BCC   L063D25
            INC
L063D25     PHA
            PHX
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            BRA   L063D7F
L063D3B     PEA   ^L0E3710
            PEA   L0E3710
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
            BCC   L063D5F
            INC   $FA
L063D5F     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L063D69
            INC   $FA
L063D69     PEI   $FA
            PEI   $F8
            PEI   $EE
            PEI   $F2
            PEI   $F0
            JSL   L06404F
            TAY
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
L063D7F     INC   $F6
L063D81     LDA   $F6
            SEC
            SBC   L0F015B
            BVS   L063D8C
            EOR   #$8000
L063D8C     BMI   L063D91
            BRL   L063C09
L063D91     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L063D99     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0F00FF
            STA   L0F004A
            LDA   L0F0101
            CMP   #$FFFF
            BNE   L063DF1
            LDA   #$001F
            STA   $F6
L063DB7     LDA   $F6
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
            BCC   L063DD3
            INC   $FA
L063DD3     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L063DDD
            INC   $FA
L063DDD     LDA   [$F8]
            CMP   #$0000
            BNE   L063DE8
            DEC   $F6
            BRA   L063DB7
L063DE8     LDA   $F6
            CLC
            ADC   #$0001
            STA   L0F0101
L063DF1     STZ   L0F013D
            LDA   L0F00FB
            SEC
            SBC   #$0009
            STA   L0F013F
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L063E06     PHD
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
            LDY   #$0008
            LDA   [$F8],Y
            BNE   L063E2E
            JSL   L064034
            PEA   $000C
            JSL   L063EA1
            PLY
L063E2E     LDA   L0F014B
            CMP   #$0002
            BNE   L063E6B
            LDAL  L0E32D9
            STA   $F2
            PEA   $0017
            PEA   $0000
            TDC
            CLC
            ADC   #$00F2
            PHA
            JSL   L0F0831
            PEA   $0018
            PEA   $0000
            TDC
            CLC
            ADC   #$00F2
            PHA
            JSL   L0F0831
            PEA   $0014
            PEA   ^L0E32D9
            PEA   L0E32D9
            JSL   L0F0831
            BRA   L063E6F
L063E6B     JSL   L063889
L063E6F     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L063E77     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
L063E82     LDA   $FF
            SEC
            SBC   #$0000
            BEQ   L063E99
            BVS   L063E8F
            EOR   #$8000
L063E8F     BPL   L063E99
            DEC   $FF
            JSL   L064034
            BRA   L063E82
L063E99     TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L063EA1     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F1
            TCS
            LDA   $FF
            AND   #$00FF
            SEP   #$20
            STA   $F3
            REP   #$20
            LDA   L0F014B
            CMP   #$0002
            BNE   L063EF2
            LDX   #$0000
            TDC
            CLC
            ADC   #$00F3
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
            BRA   L063F03
L063EF2     PEI   $FF
            _WriteChar
            STA   L0F0779
            LDA   L0F0779
            STA   $F4
L063F03     TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L063F0B     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00EC
            TCS
L063F16     LDA   $FD
            SEC
            SBC   #$0000
            BEQ   L063F79
            BVS   L063F23
            EOR   #$8000
L063F23     BPL   L063F79
            LDA   $FD
            SEC
            SBC   #$0001
            PHA
            LDX   $FB
            LDA   $F9
            STA   $F0
            STX   $F2
            PLA
            TAY
            BPL   L063F3A
            DEC   $F2
L063F3A     CLC
            ADC   $F0
            STA   $F0
            BCC   L063F43
            INC   $F2
L063F43     LDA   [$F0]
            AND   #$00FF
            CMP   #$0020
            BEQ   L063F75
            LDA   $FD
            SEC
            SBC   #$0001
            PHA
            LDX   $FB
            LDA   $F9
            STA   $F0
            STX   $F2
            PLA
            TAY
            BPL   L063F62
            DEC   $F2
L063F62     CLC
            ADC   $F0
            STA   $F0
            BCC   L063F6B
            INC   $F2
L063F6B     LDA   [$F0]
            AND   #$00FF
            CMP   #$0000
            BNE   L063F79
L063F75     DEC   $FD
            BRA   L063F16
L063F79     LDX   L0F0034
            LDA   L0F0032
            STA   $F0
            STX   $F2
            LDY   #$0008
            LDA   [$F0],Y
            BNE   L063F97
            LDA   $FD
            CMP   #$0000
            BNE   L063F97
            LDA   #$0000
            BRL   L06402A
L063F97     STZ   $EE
            BRA   L064017
L063F9B     LDA   $EE
            PHA
            LDX   $FB
            LDA   $F9
            STA   $F0
            STX   $F2
            PLA
            TAY
            BPL   L063FAC
            DEC   $F2
L063FAC     CLC
            ADC   $F0
            STA   $F0
            BCC   L063FB5
            INC   $F2
L063FB5     LDA   [$F0]
            AND   #$00FF
            CMP   #$0000
            BNE   L063FC9
            PEA   $0020
            JSL   L063EA1
            PLY
            BRA   L063FEE
L063FC9     LDA   $EE
            PHA
            LDX   $FB
            LDA   $F9
            STA   $F0
            STX   $F2
            PLA
            TAY
            BPL   L063FDA
            DEC   $F2
L063FDA     CLC
            ADC   $F0
            STA   $F0
            BCC   L063FE3
            INC   $F2
L063FE3     LDA   [$F0]
            AND   #$00FF
            PHA
            JSL   L063EA1
            PLY
L063FEE     LDA   $FF
            BEQ   L064015
            LDA   $EE
            PHA
            LDX   $FB
            LDA   $F9
            STA   $F0
            STX   $F2
            PLA
            TAY
            BPL   L064003
            DEC   $F2
L064003     CLC
            ADC   $F0
            STA   $F0
            BCC   L06400C
            INC   $F2
L06400C     LDA   #$0020
            SEP   #$20
            STA   [$F0]
            REP   #$20
L064015     INC   $EE
L064017     LDA   $EE
            SEC
            SBC   $FD
            BVS   L064021
            EOR   #$8000
L064021     BMI   L064026
            BRL   L063F9B
L064026     JSL   L064034
L06402A     TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L064034     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            PEA   $000D
            JSL   L063EA1
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L06404F     PHD
            TSC
            SEC
            SBC   #$00ED
            TCD
            ADC   #$00E4
            TCS
            PEI   $FB
            PEI   $F9
            JSL   L0C04CD
            PLY
            PLY
            STA   $E8
            LDA   $E8
            CMP   #$0000
            BEQ   L064079
            LDA   $F5
            SEC
            SBC   $F3
            BVS   L064077
            EOR   #$8000
L064077     BMI   L06407F
L064079     LDA   #$0000
            BRL   L06414E
L06407F     LDA   $F7
            CMP   #$0000
            BEQ   L064088
            BRA   L064090
L064088     LDA   $F3
            STA   $E6
            BRA   L0640D0
            BRA   L064097
L064090     CMP   #$0002
            BEQ   L064097
            BRA   L0640A6
L064097     LDA   $F5
            SEC
            SBC   $E8
            CLC
            ADC   #$0001
            STA   $E6
            BRA   L0640D0
            BRA   L0640AD
L0640A6     CMP   #$0001
            BEQ   L0640AD
            BRA   L0640D0
L0640AD     LDA   $F3
            CLC
            ADC   $E8
            PHA
            LDA   $F5
            PLX
            STX   $EA
            SEC
            SBC   $EA
            PHA
            LDA   #$0002
            SEC
            JSL   L0D14B6
            PLY
            PHA
            LDA   $F3
            PLX
            STX   $EA
            CLC
            ADC   $EA
            STA   $E6
L0640D0     LDA   $E6
            SEC
            SBC   $F3
            BVS   L0640DA
            EOR   #$8000
L0640DA     BMI   L0640F8
            LDA   $F3
            SEC
            SBC   $E6
            LDX   #$0000
            PHX
            PHA
            LDX   $FB
            LDA   $F9
            JSL   L0D1573
            PLA
            PLX
            STX   $FB
            STA   $F9
            LDA   $F3
            STA   $E6
L0640F8     LDA   $F5
            SEC
            SBC   $E6
            CLC
            ADC   #$0001
            PHA
            PEI   $E8
            JSL   L0C0000
            PLY
            PLY
            STA   $E8
            LDA   $E8
            SEC
            SBC   #$0000
            BEQ   L06411B
            BVS   L064119
            EOR   #$8000
L064119     BMI   L064120
L06411B     LDA   #$0000
            BRA   L06414E
L064120     LDA   $E8
            LDX   #$0000
            TAY
            BPL   L064129
            DEX
L064129     PHX
            PHA
            LDA   $E6
            LDX   #$0000
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            PEI   $FB
            PEI   $F9
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L06414E     TAY
            TDC
            CLC
            ADC   #$00ED
            TCS
            TYA
            PLD
            RTL

L064158     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E0
            TCS
            LDA   #$0000
            SEP   #$20
            STA   $E4
            REP   #$20
            STZ   $E2
L06416E     LDA   [$FD]
            AND   #$00FF
            CMP   #$0000
            BEQ   L06419C
            LDA   [$FD]
            AND   #$00FF
            CMP   #$002E
            BEQ   L064194
            LDA   [$FD]
            AND   #$00FF
            PHA
            LDA   $E2
            TAX
            PLA
            SEP   #$20
            STA   $E4,X
            REP   #$20
            INC   $E2
L064194     INC   $FD
            BNE   L06419A
            INC   $FF
L06419A     BRA   L06416E
L06419C     LDA   $E2
            TAX
            LDA   #$0000
            SEP   #$20
            STA   $E4,X
            REP   #$20
            LDA   $E2
            CMP   #$0000
            BNE   L0641B7
            STZ   L0F0151
            STZ   L0F0153
            BRA   L0641D8
L0641B7     PEA   ^L0F0151
            PEA   L0F0151
            PEA   ^L0E5295
            PEA   L0E5295
            PEA   $0000
            TDC
            CLC
            ADC   #$00E4
            PHA
            JSL   L0D1BE1
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
L0641D8     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L0641E0     PHD
            TSC
            SEC
            SBC   #$00F3
            TCD
            ADC   #$00E8
            TCS
            STZ   $EA
            LDX   #$0000
            LDA   #$0000
            PHX
            PHA
            LDX   $FF
            LDA   $FD
            CLC
            ADC   $F9
            PHA
            TXA
            ADC   $FB
            TAX
            PLA
            PHX
            PHA
            LDX   #$0000
            LDA   #$0064
            SEC
            JSL   L0D15C0
            PLY
            PLY
            JSL   L0D157E
            BEQ   L064240
            BVS   L06421C
            EOR   #$8000
L06421C     BPL   L064240
            LDX   $FF
            LDA   $FD
            CLC
            ADC   $F9
            PHA
            TXA
            ADC   $FB
            TAX
            PLA
            PHX
            PHA
            LDX   #$0000
            LDA   #$0064
            SEC
            JSL   L0D15C0
            PLY
            PLY
            JSL   L0D16F6
            BRA   L06425C
L064240     LDX   $FF
            LDA   $FD
            CLC
            ADC   $F9
            PHA
            TXA
            ADC   $FB
            TAX
            PLA
            PHX
            PHA
            LDX   #$0000
            LDA   #$0064
            SEC
            JSL   L0D15C0
            PLY
            PLY
L06425C     STX   $EE
            STA   $EC
            LDX   #$0147
            LDA   #$AE13
            PHX
            PHA
            LDX   $EE
            LDA   $EC
            JSL   L0D157E
            BVS   L064275
            EOR   #$8000
L064275     BMI   L06427C
            LDA   #$0001
            STA   $EA
L06427C     LDA   $EA
            TAY
            TDC
            CLC
            ADC   #$00F3
            TCS
            TYA
            PLD
            RTL

L064288     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EE
            TCS
            STZ   $F0
            BRA   L0642BC
L064297     LDA   $F0
            PHA
            LDX   $FD
            LDA   $FB
            STA   $F2
            STX   $F4
            PLA
            TAY
            BPL   L0642A8
            DEC   $F4
L0642A8     CLC
            ADC   $F2
            STA   $F2
            BCC   L0642B1
            INC   $F4
L0642B1     LDA   #$0020
            SEP   #$20
            STA   [$F2]
            REP   #$20
            INC   $F0
L0642BC     LDA   $F0
            SEC
            SBC   $FF
            BVS   L0642C6
            EOR   #$8000
L0642C6     BPL   L064297
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL


