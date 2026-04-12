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

	use	SEG2K.X.S
	
GSOS	=	$E100A8

*-----------------------------------

L050000     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E2
            TCS
            PEA   $0082
            PEA   $002C
            LDA   $FB
            ASL
            ASL
            PHA
            LDA   #L0E4924
            STA   $F2
            LDA   #^L0E4924
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L05002A
            INC   $F4
L05002A     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            LDA   $FB
            CLC
            ADC   #$0006
            ASL
            ASL
            PHA
            LDA   #L0E4924
            STA   $F2
            LDA   #^L0E4924
            STA   $F4
            PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L050051
            INC   $F4
L050051     LDY   #$0002
            LDA   [$F2],Y
            TAX
            LDA   [$F2]
            PHX
            PHA
            PEA   $000F
            PEA   ^L0E3219
            PEA   L0E3219
            _SFPutFile
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            PEA   ^L0E322F
            PEA   L0E322F
            PEI   $FF
            PEI   $FD
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
            LDAL  L0E3219
            CMP   #$0000
            BEQ   L0500A5
            LDA   [$FD]
            AND   #$00FF
            CMP   #$0000
            BNE   L0500AB
L0500A5     LDA   #$0000
            BRL   L050435
L0500AB     LDA   L0F0044
            STA   $E8
            STZ   L0F0044
            PEI   $FF
            PEI   $FD
            JSL   L0B22EB
            PLY
            PLY
            STX   $F0
            STA   $EE
            LDA   $E8
            STA   L0F0044
            LDA   L0F0598
            CMP   #$002B
            BEQ   L0500D6
            LDA   L0F0598
            CMP   #$0045
            BNE   L0500E9
L0500D6     LDA   L0F0598
            PHA
            PEA   $FFEB
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRL   L050435
L0500E9     LDA   L0F0598
            CMP   #$0000
            BEQ   L050104
            LDA   L0F0598
            PHA
            PEA   $FFFC
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRL   L050435
L050104     LDA   $FB
            CMP   #$0000
            BEQ   L050112
            CMP   #$0001
            BEQ   L050112
            BRA   L05011B
L050112     LDA   #$0069
            STA   $E4
            BRA   L05014C
            BRA   L050122
L05011B     CMP   #$0002
            BEQ   L050122
            BRA   L05012B
L050122     LDA   #$0004
            STA   $E4
            BRA   L05014C
            BRA   L050132
L05012B     CMP   #$0003
            BEQ   L050132
            BRA   L05013B
L050132     LDA   #$0004
            STA   $E4
            BRA   L05014C
            BRA   L050147
L05013B     CMP   #$0004
            BEQ   L050147
            CMP   #$0005
            BEQ   L050147
            BRA   L05014C
L050147     LDA   #$0072
            STA   $E4
L05014C     PEI   $FF
            PEI   $FD
            JSL   L061327
            PLY
            PLY
            STA   $E6
            LDA   L0F0044
            STA   $E8
            LDA   $E6
            BEQ   L050169
            LDA   #$0001
            STA   L0F0044
            BRA   L05016C
L050169     STZ   L0F0044
L05016C     PEI   $FF
            PEI   $FD
            JSL   L0B22EB
            PLY
            PLY
            STX   $F0
            STA   $EE
            LDA   $E8
            STA   L0F0044
            LDA   L0F0598
            CMP   #$0000
            BEQ   L05019A
            LDA   L0F0598
            PHA
            PEA   $FFFC
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRL   L050435
L05019A     LDA   $FB
            CMP   #$0002
            BEQ   L0501A8
            LDA   $FB
            CMP   #$0003
            BNE   L0501B4
L0501A8     LDX   #$0000
            LDA   #$0200
            STX   $EC
            STA   $EA
            BRA   L0501E7
L0501B4     LDA   $FB
            CMP   #$0004
            BEQ   L0501C2
            LDA   $FB
            CMP   #$0005
            BNE   L0501CE
L0501C2     LDX   #$0000
            LDA   #$02E6
            STX   $EC
            STA   $EA
            BRA   L0501E7
L0501CE     LDX   L0F000C
            LDA   L0F000A
            STA   $F2
            STX   $F4
            LDY   #$000A
            LDA   [$F2],Y
            TAX
            LDY   #$0008
            LDA   [$F2],Y
            STX   $EC
            STA   $EA
L0501E7     LDX   $EC
            LDA   $EA
            PHX
            PHA
            LDX   $F0
            LDA   $EE
            JSL   L0D157E
            BEQ   L05020C
            BVS   L0501FC
            EOR   #$8000
L0501FC     BPL   L05020C
            PEA   $FFEC
            JSL   L0617E1
            PLY
            LDA   #$0000
            BRL   L050435
L05020C     LDA   $E6
            BNE   L050213
            BRL   L050298
L050213     PEI   $FF
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
            LDA   $E4
            STAL  L0E32BB
            PEA   $0005
            PEA   ^L0E32B5
            PEA   L0E32B5
            JSL   L0F0831
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
            BEQ   L050295
            LDA   L0F0598
            PHA
            PEA   $FFFD
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRL   L050435
L050295     BRL   L05035F
L050298     PEI   $FF
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
            LDA   #$00C3
            STAL  L0E32B9
            LDA   $E4
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
            STA   L0F0598
            LDA   L0F0598
            CMP   #$0000
            BEQ   L05030E
            LDA   L0F0598
            PHA
            PEA   $FFFB
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRL   L050435
L05030E     PEI   $FF
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
            BEQ   L05035F
            LDA   L0F0598
            PHA
            PEA   $FFFB
            JSL   L061721
            PLY
            PLY
            LDA   #$0000
            BRL   L050435
L05035F     LDA   $FB
            CMP   #$0000
            BEQ   L050369
            BRL   L0503FD
L050369     PEA   ^L0E5109
            PEA   L0E5109
            LDX   L0F002C
            LDA   L0F002A
            STA   $F2
            STX   $F4
            LDA   $F2
            LDX   $F4
            CLC
            ADC   #$0008
            BCC   L050384
            INX
L050384     PHX
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E321F
            PEA   L0E321F
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            LDX   L0F002C
            LDA   L0F002A
            STA   $F2
            STX   $F4
            LDA   $F2
            LDX   $F4
            CLC
            ADC   #$0008
            BCC   L0503BD
            INX
L0503BD     PHX
            PHA
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E510C
            PEA   L0E510C
            LDX   L0F002C
            LDA   L0F002A
            STA   $F2
            STX   $F4
            LDA   $F2
            LDX   $F4
            CLC
            ADC   #$0008
            BCC   L0503E2
            INX
L0503E2     PHX
            PHA
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            JSL   L073CE1
            PEA   $0000
            JSL   L0A0EBE
            PLY
            BRL   L050432
            BRA   L050404
L0503FD     CMP   #$0001
            BEQ   L050404
            BRA   L050410
L050404     PEA   $0001
            JSL   L0A0EBE
            PLY
            BRA   L050432
            BRA   L050417
L050410     CMP   #$0002
            BEQ   L050417
            BRA   L05041B
L050417     BRA   L050432
            BRA   L050422
L05041B     CMP   #$0003
            BEQ   L050422
            BRA   L050426
L050422     BRA   L050432
            BRA   L050432
L050426     CMP   #$0004
            BEQ   L050432
            CMP   #$0005
            BEQ   L050432
            BRA   L050432
L050432     LDA   #$0001
L050435     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L05043F     ENT
            PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00E8
            TCS
            PEA   ^L0E3A8E
            PEA   L0E3A8E
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEI   $FF
            PEI   $FD
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E3A96
            PEA   L0E3A96
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L061865
            PLY
            PLY
            PLY
            PLY
            PEI   $FF
            PEI   $FD
            PEA   ^L0E3127
            PEA   L0E3127
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L050496     LDA   #$0001
            BNE   L05049E
            BRL   L0505DE
L05049E     PEA   $0001
            PEA   $0000
            PEA   ^L0E3127
            PEA   L0E3127
            PEA   $0002
            PEA   $0001
            PEA   $0040
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L06140B
            TAY
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            STA   $F2
            LDA   $F2
            CMP   #$0002
            BNE   L0504D4
            LDA   #$0000
            BRL   L0505DE
L0504D4     LDA   #L0E3127
            LDX   #^L0E3127
            STA   $F4
            STX   $F6
            LDA   [$F4]
            AND   #$00FF
            CMP   #$002F
            BNE   L0504EB
            BRL   L050554
L0504EB     STZ   $EA
            PEI   $FF
            PEI   $FD
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L0504FF     LDA   $EA
            INC   $EA
            TAX
            LDAL  L0E4BCC,X
            AND   #$00FF
            STA   $EE
            TAY
            BEQ   L05051D
            LDA   $EE
            CMP   #$002F
            BNE   L05051B
            LDA   $EA
            STA   $EC
L05051B     BRA   L0504FF
L05051D     PEA   ^L0E3127
            PEA   L0E3127
            LDA   $EC
            LDX   #$0000
            PHX
            PHA
            LDA   #L0E4BCC
            LDX   #^L0E4BCC
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            PEA   ^L0E3127
            PEA   L0E3127
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
L050554     PEA   $0000
            JSL   L0B1E73
            PLY
            PEI   $FF
            PEI   $FD
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E3127
            PEA   L0E3127
            PEA   ^L0E30A7
            PEA   L0E30A7
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDA   #L0E4CCC
            LDX   #^L0E4CCC
            PHA
            TXA
            STAL  L0E30A1
            PLA
            STAL  L0E309F
            LDA   #L0E30A7
            LDX   #^L0E30A7
            PHA
            TXA
            STAL  L0E30A5
            PLA
            STAL  L0E30A3
            PEA   $0004
            PEA   ^L0E309F
            PEA   L0E309F
            JSL   L0F0831
            LDA   L0F0779
            STA   $F0
            PEA   $0001
            JSL   L0B1E73
            PLY
            LDA   $F0
            CMP   #$0000
            BEQ   L0505C7
            BRA   L0505DB
L0505C7     PEA   ^L0E3127
            PEA   L0E3127
            PEI   $FF
            PEI   $FD
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            BRA   L0505DE
L0505DB     BRL   L050496
L0505DE     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0505E8     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E4
            TCS
            LDA   $FF
            CMP   #$0000
            BNE   L050610
            LDAL  L0E4A3A
            TAX
            LDAL  L0E4A38
            PHA
            TXA
            STAL  L0E4A36
            PLA
            STAL  L0E4A34
            BRA   L050624
L050610     LDAL  L0E4A3E
            TAX
            LDAL  L0E4A3C
            PHA
            TXA
            STAL  L0E4A36
            PLA
            STAL  L0E4A34
L050624     PEA   $0001
            PEA   $0002
            PEA   ^L0E4A30
            PEA   L0E4A30
            PEA   $0002
            JSL   L0D00BF
            PLY
            PLY
            PLY
            PLY
            PLY
            TAY
            BNE   L050645
            LDA   #$0000
            BRL   L0506A7
L050645     PEA   $0000
            JSL   L0B1E73
            PLY
            PEI   $FD
            PEI   $FB
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDA   #L0E4CCC
            LDX   #^L0E4CCC
            STX   $E8
            STA   $E6
            PEA   $0002
            PEA   $0000
            TDC
            CLC
            ADC   #$00E6
            PHA
            JSL   L0F0831
            LDA   L0F0779
            STA   $F0
            LDA   $F0
            CMP   #$0000
            BEQ   L050687
            BRA   L05069F
L050687     LDA   $FF
            CMP   #$0004
            BEQ   L050698
            PEA   $0002
            JSL   L0A1601
            PLY
            BRA   L05069F
L050698     STZ   L0F0000
            JSL   L030FA2
L05069F     PEA   $0001
            JSL   L0B1E73
            PLY
L0506A7     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0506B1     ENT
            PHD
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
            PEA   $0001
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
            TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L0506E9     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E2
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BEQ   L050708
            BRL   L050972
L050708     LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E257A
            PLA
            STAL  L0E2578
            LDA   #L0E2053
            LDX   #^L0E2053
            PHA
            TXA
            STAL  L0E2592
            PLA
            STAL  L0E2590
            LDAL  L0E4A12
            TAX
            LDAL  L0E4A10
            PHA
            TXA
            STAL  L0E25AA
            PLA
            STAL  L0E25A8
            LDAL  L0E4A16
            TAX
            LDAL  L0E4A14
            PHA
            TXA
            STAL  L0E25C2
            PLA
            STAL  L0E25C0
            LDAL  L0E49F6
            TAX
            LDAL  L0E49F4
            PHA
            TXA
            STAL  L0E25DA
            PLA
            STAL  L0E25D8
            LDAL  L0E4A0E
            TAX
            LDAL  L0E4A0C
            PHA
            TXA
            STAL  L0E25F2
            PLA
            STAL  L0E25F0
            LDAL  L0E49F2
            TAX
            LDAL  L0E49F0
            PHA
            TXA
            STAL  L0E260A
            PLA
            STAL  L0E2608
            LDA   #L0E256C
            LDX   #^L0E256C
            PHA
            TXA
            STAL  L0E254C+2
            PLA
            STAL  L0E254C
            LDA   #L0E2584
            LDX   #^L0E2584
            PHA
            TXA
            STAL  L0E2552
            PLA
            STAL  L0E2550
            LDA   #L0E259C
            LDX   #^L0E259C
            PHA
            TXA
            STAL  L0E2556
            PLA
            STAL  L0E2554
            LDA   #L0E25B4
            LDX   #^L0E25B4
            PHA
            TXA
            STAL  L0E255A
            PLA
            STAL  L0E2558
            LDA   #L0E25CC
            LDX   #^L0E25CC
            PHA
            TXA
            STAL  L0E255E
            PLA
            STAL  L0E255C
            LDA   #L0E25E4
            LDX   #^L0E25E4
            PHA
            TXA
            STAL  L0E2562
            PLA
            STAL  L0E2560
            LDA   #L0E25FC
            LDX   #^L0E25FC
            PHA
            TXA
            STAL  L0E2566
            PLA
            STAL  L0E2564
            JSL   L050F37
            PHX
            PHA
            PEA   ^L0E253E
            PEA   L0E253E
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $EC
            STA   $EA
            PEA   $0001
            PEI   $EC
            PEI   $EA
            LDA   L0F010B
            CLC
            ADC   #$0001
            PHA
            _SetDItemValue
            STA   L0F0779
            LDA   L0F0117
            SEC
            SBC   #$0010
            STA   $E8
            LDA   L0F0119
            SEC
            SBC   #$0012
            STA   $E6
            LDA   $E8
            BEQ   L050864
            PEA   $0001
            PEI   $EC
            PEI   $EA
            PEA   $0005
            _SetDItemValue
            STA   L0F0779
L050864     LDA   $E6
            BEQ   L05087C
            PEA   $0001
            PEI   $EC
            PEI   $EA
            PEA   $0006
            _SetDItemValue
            STA   L0F0779
L05087C     LDA   #$0045
            STA   L0F00E1
L050882     LDA   L0F00E1
            SEC
            SBC   #$0001
            BNE   L05088E
            BRL   L050957
L05088E     BVS   L050893
            EOR   #$8000
L050893     BMI   L050898
            BRL   L050957
L050898     PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   L0F00E1
            LDA   L0F00E1
            CMP   #$0002
            BEQ   L0508B7
            BRA   L0508DF
L0508B7     PEI   $EC
            PEI   $EA
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   #$0000
            BRL   L050F2D
            BRA   L0508EB
L0508DF     CMP   #$0003
            BEQ   L0508EB
            CMP   #$0004
            BEQ   L0508EB
            BRA   L05090E
L0508EB     PEA   $0001
            PEI   $EC
            PEI   $EA
            LDA   L0F00E1
            PHA
            _SetDItemValue
            STA   L0F0779
            LDA   L0F00E1
            SEC
            SBC   #$0001
            STA   L0F010B
            BRA   L050954
            BRA   L050915
L05090E     CMP   #$0005
            BEQ   L050915
            BRA   L050933
L050915     LDA   $E8
            EOR   #$0001
            STA   $E8
            PEI   $E8
            PEI   $EC
            PEI   $EA
            PEA   $0005
            _SetDItemValue
            STA   L0F0779
            BRA   L050954
            BRA   L05093A
L050933     CMP   #$0006
            BEQ   L05093A
            BRA   L050954
L05093A     LDA   $E6
            EOR   #$0001
            STA   $E6
            PEI   $E6
            PEI   $EC
            PEI   $EA
            PEA   $0006
            _SetDItemValue
            STA   L0F0779
L050954     BRL   L050882
L050957     LDA   #$0001
            STA   L0F006E
            LDA   $E8
            CLC
            ADC   #$0010
            STA   L0F0117
            LDA   $E6
            CLC
            ADC   #$0012
            STA   L0F0119
            BRL   L050F0D
L050972     LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E2688
            PLA
            STAL  L0E2686
            LDA   #L0E2053
            LDX   #^L0E2053
            PHA
            TXA
            STAL  L0E26A0
            PLA
            STAL  L0E269E
            LDAL  L0E4A12
            TAX
            LDAL  L0E4A10
            PHA
            TXA
            STAL  L0E26B8
            PLA
            STAL  L0E26B6
            LDAL  L0E4A16
            TAX
            LDAL  L0E4A14
            PHA
            TXA
            STAL  L0E26D0
            PLA
            STAL  L0E26CE
            LDAL  L0E4A1A
            TAX
            LDAL  L0E4A18
            PHA
            TXA
            STAL  L0E26E8
            PLA
            STAL  L0E26E6
            LDAL  L0E4A12
            TAX
            LDAL  L0E4A10
            PHA
            TXA
            STAL  L0E2700
            PLA
            STAL  L0E26FE
            LDAL  L0E4A16
            TAX
            LDAL  L0E4A14
            PHA
            TXA
            STAL  L0E2718
            PLA
            STAL  L0E2716
            LDAL  L0E4A1E
            TAX
            LDAL  L0E4A1C
            PHA
            TXA
            STAL  L0E2730
            PLA
            STAL  L0E272E
            LDAL  L0E4A22
            TAX
            LDAL  L0E4A20
            PHA
            TXA
            STAL  L0E2748
            PLA
            STAL  L0E2746
            LDAL  L0E4A26
            TAX
            LDAL  L0E4A24
            PHA
            TXA
            STAL  L0E2760
            PLA
            STAL  L0E275E
            LDAL  L0E4A2A
            TAX
            LDAL  L0E4A28
            PHA
            TXA
            STAL  L0E2778
            PLA
            STAL  L0E2776
            LDAL  L0E4A2E
            TAX
            LDAL  L0E4A2C
            PHA
            TXA
            STAL  L0E2790
            PLA
            STAL  L0E278E
            LDAL  L0E4A22
            TAX
            LDAL  L0E4A20
            PHA
            TXA
            STAL  L0E27A8
            PLA
            STAL  L0E27A6
            LDAL  L0E4A26
            TAX
            LDAL  L0E4A24
            PHA
            TXA
            STAL  L0E27C0
            PLA
            STAL  L0E27BE
            LDAL  L0E4A0A
            TAX
            LDAL  L0E4A08
            PHA
            TXA
            STAL  L0E27D8
            PLA
            STAL  L0E27D6
            LDAL  L0E4A0E
            TAX
            LDAL  L0E4A0C
            PHA
            TXA
            STAL  L0E27F0
            PLA
            STAL  L0E27EE
            LDAL  L0E49F2
            TAX
            LDAL  L0E49F0
            PHA
            TXA
            STAL  L0E2808
            PLA
            STAL  L0E2806
            LDAL  L0E49FA
            TAX
            LDAL  L0E49F8
            PHA
            TXA
            STAL  L0E2820
            PLA
            STAL  L0E281E
            LDAL  L0E4A06
            TAX
            LDAL  L0E4A04
            PHA
            TXA
            STAL  L0E2838
            PLA
            STAL  L0E2836
            LDAL  L0E49FE
            TAX
            LDAL  L0E49FC
            PHA
            TXA
            STAL  L0E2850
            PLA
            STAL  L0E284E
            LDAL  L0E4A02
            TAX
            LDAL  L0E4A00
            PHA
            TXA
            STAL  L0E2868
            PLA
            STAL  L0E2866
            LDA   #L0E267A
            LDX   #^L0E267A
            PHA
            TXA
            STAL  L0E2622+2
            PLA
            STAL  L0E2622
            LDA   #L0E2692
            LDX   #^L0E2692
            PHA
            TXA
            STAL  L0E2626+2
            PLA
            STAL  L0E2626
            LDA   #L0E26AA
            LDX   #^L0E26AA
            PHA
            TXA
            STAL  L0E262A+2
            PLA
            STAL  L0E262A
            LDA   #L0E26C2
            LDX   #^L0E26C2
            PHA
            TXA
            STAL  L0E262E+2
            PLA
            STAL  L0E262E
            LDA   #L0E26DA
            LDX   #^L0E26DA
            PHA
            TXA
            STAL  L0E2632+2
            PLA
            STAL  L0E2632
            LDA   #L0E26F2
            LDX   #^L0E26F2
            PHA
            TXA
            STAL  L0E2636+2
            PLA
            STAL  L0E2636
            LDA   #L0E270A
            LDX   #^L0E270A
            PHA
            TXA
            STAL  L0E263A+2
            PLA
            STAL  L0E263A
            LDA   #L0E2722
            LDX   #^L0E2722
            PHA
            TXA
            STAL  L0E263E+2
            PLA
            STAL  L0E263E
            LDA   #L0E273A
            LDX   #^L0E273A
            PHA
            TXA
            STAL  L0E2642+2
            PLA
            STAL  L0E2642
            LDA   #L0E2752
            LDX   #^L0E2752
            PHA
            TXA
            STAL  L0E2646+2
            PLA
            STAL  L0E2646
            LDA   #L0E276A
            LDX   #^L0E276A
            PHA
            TXA
            STAL  L0E264A+2
            PLA
            STAL  L0E264A
            LDA   #L0E2782
            LDX   #^L0E2782
            PHA
            TXA
            STAL  L0E264E+2
            PLA
            STAL  L0E264E
            LDA   #L0E279A
            LDX   #^L0E279A
            PHA
            TXA
            STAL  L0E2652+2
            PLA
            STAL  L0E2652
            LDA   #L0E27B2
            LDX   #^L0E27B2
            PHA
            TXA
            STAL  L0E2656+2
            PLA
            STAL  L0E2656
            LDA   #L0E27CA
            LDX   #^L0E27CA
            PHA
            TXA
            STAL  L0E265A+2
            PLA
            STAL  L0E265A
            LDA   #L0E27E2
            LDX   #^L0E27E2
            PHA
            TXA
            STAL  L0E265E+2
            PLA
            STAL  L0E265E
            LDA   #L0E27FA
            LDX   #^L0E27FA
            PHA
            TXA
            STAL  L0E2662+2
            PLA
            STAL  L0E2662
            LDA   #L0E2812
            LDX   #^L0E2812
            PHA
            TXA
            STAL  L0E2666+2
            PLA
            STAL  L0E2666
            LDA   #L0E282A
            LDX   #^L0E282A
            PHA
            TXA
            STAL  L0E266A+2
            PLA
            STAL  L0E266A
            LDA   #L0E2842
            LDX   #^L0E2842
            PHA
            TXA
            STAL  L0E2670
            PLA
            STAL  L0E266E
            LDA   #L0E285A
            LDX   #^L0E285A
            PHA
            TXA
            STAL  L0E2672+2
            PLA
            STAL  L0E2672
            JSL   L050F37
            PHX
            PHA
            PEA   ^L0E2614
            PEA   L0E2614
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $EC
            STA   $EA
            PEA   $0001
            PEI   $EC
            PEI   $EA
            LDA   L0F010B
            CLC
            ADC   #$0001
            PHA
            _SetDItemValue
            STA   L0F0779
            PEA   $0001
            PEI   $EC
            PEI   $EA
            LDA   L0F010D
            CLC
            ADC   #$0001
            PHA
            _SetDItemValue
            STA   L0F0779
            PEA   $0001
            PEI   $EC
            PEI   $EA
            LDA   L0F010F
            CLC
            ADC   #$0001
            PHA
            _SetDItemValue
            STA   L0F0779
            PEA   $0001
            PEI   $EC
            PEI   $EA
            LDA   L0F0111
            CLC
            ADC   #$0004
            PHA
            _SetDItemValue
            STA   L0F0779
            PEA   $0001
            PEI   $EC
            PEI   $EA
            LDA   L0F0113
            SEC
            SBC   #$0001
            PHA
            _SetDItemValue
            STA   L0F0779
            LDA   L0F0115
            SEC
            SBC   #$000E
            STA   $E4
            LDA   L0F0119
            SEC
            SBC   #$0012
            STA   $E6
            LDA   $E4
            BEQ   L050D38
            PEA   $0001
            PEI   $EC
            PEI   $EA
            PEA   $000F
            _SetDItemValue
            STA   L0F0779
L050D38     LDA   $E6
            BEQ   L050D50
            PEA   $0001
            PEI   $EC
            PEI   $EA
            PEA   $0010
            _SetDItemValue
            STA   L0F0779
L050D50     LDA   #$0045
            STA   L0F00E1
L050D56     LDA   L0F00E1
            SEC
            SBC   #$0001
            BNE   L050D62
            BRL   L050EF5
L050D62     BVS   L050D67
            EOR   #$8000
L050D67     BMI   L050D6C
            BRL   L050EF5
L050D6C     PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   L0F00E1
            LDA   L0F00E1
            CMP   #$0002
            BEQ   L050D8B
            BRA   L050DB3
L050D8B     PEI   $EC
            PEI   $EA
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   #$0000
            BRL   L050F2D
            BRA   L050DBF
L050DB3     CMP   #$0003
            BEQ   L050DBF
            CMP   #$0004
            BEQ   L050DBF
            BRA   L050DE3
L050DBF     PEA   $0001
            PEI   $EC
            PEI   $EA
            LDA   L0F00E1
            PHA
            _SetDItemValue
            STA   L0F0779
            LDA   L0F00E1
            SEC
            SBC   #$0001
            STA   L0F010B
            BRL   L050EF2
            BRA   L050DF4
L050DE3     CMP   #$0005
            BEQ   L050DF4
            CMP   #$0006
            BEQ   L050DF4
            CMP   #$0007
            BEQ   L050DF4
            BRA   L050E18
L050DF4     PEA   $0001
            PEI   $EC
            PEI   $EA
            LDA   L0F00E1
            PHA
            _SetDItemValue
            STA   L0F0779
            LDA   L0F00E1
            SEC
            SBC   #$0001
            STA   L0F010D
            BRL   L050EF2
            BRA   L050E24
L050E18     CMP   #$0008
            BEQ   L050E24
            CMP   #$0009
            BEQ   L050E24
            BRA   L050E48
L050E24     PEA   $0001
            PEI   $EC
            PEI   $EA
            LDA   L0F00E1
            PHA
            _SetDItemValue
            STA   L0F0779
            LDA   L0F00E1
            SEC
            SBC   #$0001
            STA   L0F010F
            BRL   L050EF2
            BRA   L050E59
L050E48     CMP   #$000A
            BEQ   L050E59
            CMP   #$000B
            BEQ   L050E59
            CMP   #$000C
            BEQ   L050E59
            BRA   L050E7D
L050E59     PEA   $0001
            PEI   $EC
            PEI   $EA
            LDA   L0F00E1
            PHA
            _SetDItemValue
            STA   L0F0779
            LDA   L0F00E1
            CLC
            ADC   #$0001
            STA   L0F0113
            BRL   L050EF2
            BRA   L050E89
L050E7D     CMP   #$000D
            BEQ   L050E89
            CMP   #$000E
            BEQ   L050E89
            BRA   L050EAC
L050E89     PEA   $0001
            PEI   $EC
            PEI   $EA
            LDA   L0F00E1
            PHA
            _SetDItemValue
            STA   L0F0779
            LDA   L0F00E1
            SEC
            SBC   #$0004
            STA   L0F0111
            BRA   L050EF2
            BRA   L050EB3
L050EAC     CMP   #$000F
            BEQ   L050EB3
            BRA   L050ED1
L050EB3     LDA   $E4
            EOR   #$0001
            STA   $E4
            PEI   $E4
            PEI   $EC
            PEI   $EA
            PEA   $000F
            _SetDItemValue
            STA   L0F0779
            BRA   L050EF2
            BRA   L050ED8
L050ED1     CMP   #$0010
            BEQ   L050ED8
            BRA   L050EF2
L050ED8     LDA   $E6
            EOR   #$0001
            STA   $E6
            PEI   $E6
            PEI   $EC
            PEI   $EA
            PEA   $0010
            _SetDItemValue
            STA   L0F0779
L050EF2     BRL   L050D56
L050EF5     LDA   #$0001
            STA   L0F006E
            LDA   $E4
            CLC
            ADC   #$000E
            STA   L0F0115
            LDA   $E6
            CLC
            ADC   #$0012
            STA   L0F0119
L050F0D     PEI   $EC
            PEI   $EA
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
L050F2D     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L050F37     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDA   L0F006E
            BNE   L050F7A
            LDA   #$0002
            STA   L0F010B
            LDA   #$0004
            STA   L0F010D
            LDA   #$0007
            STA   L0F010F
            LDA   #$0009
            STA   L0F0111
            LDA   #$000B
            STA   L0F0113
            LDA   #$000E
            STA   L0F0115
            LDA   #$0010
            STA   L0F0117
            LDA   #$0012
            STA   L0F0119
            LDA   #$0000
L050F7A     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L050F84     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            JSL   L050F37
            LDA   L0F010B
            CMP   #$0002
            BEQ   L050F9D
            BRA   L050FA7
L050F9D     LDA   #$0050
            STA   L0F00FB
            BRA   L050FB4
            BRA   L050FAE
L050FA7     CMP   #$0003
            BEQ   L050FAE
            BRA   L050FB4
L050FAE     LDA   #$0084
            STA   L0F00FB
L050FB4     LDA   L0F010D
            CMP   #$0004
            BEQ   L050FBE
            BRA   L050FC8
L050FBE     LDA   #$001E
            STA   L0F00FF
            BRA   L050FE6
            BRA   L050FCF
L050FC8     CMP   #$0005
            BEQ   L050FCF
            BRA   L050FD9
L050FCF     LDA   #$0050
            STA   L0F00FF
            BRA   L050FE6
            BRA   L050FE0
L050FD9     CMP   #$0006
            BEQ   L050FE0
            BRA   L050FE6
L050FE0     LDA   #$0084
            STA   L0F00FF
L050FE6     LDA   L0F010F
            CMP   #$0007
            BEQ   L050FF0
            BRA   L050FFA
L050FF0     LDA   #$0005
            STA   L0F0101
            BRA   L051007
            BRA   L051001
L050FFA     CMP   #$0008
            BEQ   L051001
            BRA   L051007
L051001     LDA   #$FFFF
            STA   L0F0101
L051007     LDA   L0F0111
            CMP   #$0009
            BEQ   L051011
            BRA   L05101B
L051011     LDA   #$FFFF
            STA   L0F0103
            BRA   L051028
            BRA   L051022
L05101B     CMP   #$000A
            BEQ   L051022
            BRA   L051028
L051022     LDA   #$0001
            STA   L0F0103
L051028     LDA   L0F0113
            CMP   #$000B
            BEQ   L051032
            BRA   L05103C
L051032     LDA   #$0001
            STA   L0F0105
            BRA   L05105A
            BRA   L051043
L05103C     CMP   #$000C
            BEQ   L051043
            BRA   L05104D
L051043     LDA   #$0002
            STA   L0F0105
            BRA   L05105A
            BRA   L051054
L05104D     CMP   #$000D
            BEQ   L051054
            BRA   L05105A
L051054     LDA   #$0003
            STA   L0F0105
L05105A     LDA   L0F0115
            CMP   #$000E
            BEQ   L051064
            BRA   L05106B
L051064     STZ   L0F0107
            BRA   L051078
            BRA   L051072
L05106B     CMP   #$000F
            BEQ   L051072
            BRA   L051078
L051072     LDA   #$0001
            STA   L0F0107
L051078     LDA   L0F0117
            CMP   #$0010
            BEQ   L051082
            BRA   L051089
L051082     STZ   L0F00FD
            BRA   L051096
            BRA   L051090
L051089     CMP   #$0011
            BEQ   L051090
            BRA   L051096
L051090     LDA   #$0001
            STA   L0F00FD
L051096     LDA   L0F0119
            CMP   #$0012
            BEQ   L0510A0
            BRA   L0510A7
L0510A0     STZ   L0F0109
            BRA   L0510B4
            BRA   L0510AE
L0510A7     CMP   #$0013
            BEQ   L0510AE
            BRA   L0510B4
L0510AE     LDA   #$0001
            STA   L0F0109
L0510B4     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L0510BC     ENT
            PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E6
            TCS
            LDA   $FD
            SEC
            SBC   #$0002
            BEQ   L0510E4
            BVS   L0510D4
            EOR   #$8000
L0510D4     BPL   L0510E4
            LDA   $FD
            SEC
            SBC   #$0002
            STA   $EE
            LDA   $FB
            STA   $F0
            BRA   L0510F4
L0510E4     LDA   $FD
            CLC
            ADC   #$000A
            STA   $EE
            LDA   $FB
            SEC
            SBC   #$0001
            STA   $F0
L0510F4     LDA   $F0
            PHA
            LDA   #$0064
            SEC
            JSL   L0D14B6
            PLY
            STA   $EC
            LDA   #$0064
            PHA
            LDA   $EC
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDA   $F0
            PLX
            STX   $F2
            SEC
            SBC   $F2
            STA   $EA
            LDA   $EC
            PHA
            LDA   #$0004
            SEC
            JSL   L0D14B6
            PLY
            PHA
            LDA   $EA
            PHA
            LDA   #$0004
            SEC
            JSL   L0D14B6
            PLY
            PHA
            LDA   #$000D
            PHA
            LDA   $EE
            SEC
            JSL   L0D151F
            PLA
            SEC
            SBC   #$0001
            PHA
            LDA   #$0005
            SEC
            JSL   L0D14B6
            PLY
            CLC
            ADC   $FF
            CLC
            ADC   $EA
            PLX
            STX   $F2
            CLC
            ADC   $F2
            PLX
            STX   $F2
            CLC
            ADC   $F2
            SEC
            SBC   $EC
            SEC
            SBC   $EC
            CLC
            ADC   #$004D
            STA   $E8
            LDA   #$0007
            PHA
            LDA   $E8
            PHA
            LDA   #$0007
            SEC
            JSL   L0D14B6
            PLY
            SEC
            JSL   L0D151F
            PLA
            PHA
            LDA   $E8
            PLX
            STX   $F2
            SEC
            SBC   $F2
            STA   $E8
            LDA   $E8
            TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L051198     ENT
            PHD
            TSC
            SEC
            SBC   #$00E7
            TCD
            ADC   #$00CC
            TCS
            PHA
            PEA   $0034
            _ReadBParam
            STA   L0F0779
            PLA
            AND   #$00FF
            STA   $CE
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            _ReadAsciiTime
            STA   L0F0779
            PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            JSL   L0D03B7
            PLY
            PLY
            LDA   #$0000
            SEP   #$20
            STA   $D2
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STA   $D5
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STA   $D8
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STA   $DB
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STA   $DE
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STA   $E1
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STA   $E4
            REP   #$20
            LDA   $CE
            CMP   #$0000
            BEQ   L051221
            BRA   L05127D
L051221     PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            JSL   L0C0324
            PLY
            PLY
            PHA
            PLA
            STA   [$ED]
            LDX   #$0000
            LDA   #$0003
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$00D0
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            JSL   L0C0324
            PLY
            PLY
            PHA
            PLA
            STA   [$F1]
            LDX   #$0000
            LDA   #$0006
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$00D0
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            JSL   L0C0324
            PLY
            PLY
            PHA
            PLA
            STA   [$F5]
            BRL   L05133D
            BRA   L051284
L05127D     CMP   #$0001
            BEQ   L051284
            BRA   L0512DF
L051284     PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            JSL   L0C0324
            PLY
            PLY
            PHA
            PLA
            STA   [$F1]
            LDX   #$0000
            LDA   #$0003
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$00D0
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            JSL   L0C0324
            PLY
            PLY
            PHA
            PLA
            STA   [$ED]
            LDX   #$0000
            LDA   #$0006
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$00D0
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            JSL   L0C0324
            PLY
            PLY
            PHA
            PLA
            STA   [$F5]
            BRA   L05133D
            BRA   L0512E6
L0512DF     CMP   #$0002
            BEQ   L0512E6
            BRA   L05133D
L0512E6     PEA   $0000
            TDC
            CLC
            ADC   #$00D0
            PHA
            JSL   L0C0324
            PLY
            PLY
            PHA
            PLA
            STA   [$F5]
            LDX   #$0000
            LDA   #$0003
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$00D0
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            JSL   L0C0324
            PLY
            PLY
            PHA
            PLA
            STA   [$ED]
            LDX   #$0000
            LDA   #$0006
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$00D0
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            JSL   L0C0324
            PLY
            PLY
            PHA
            PLA
            STA   [$F1]
L05133D     LDX   #$0000
            LDA   #$0009
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$00D0
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            JSL   L0C0324
            PLY
            PLY
            PHA
            PLA
            STA   [$F9]
            LDX   #$0000
            LDA   #$000C
            PHX
            PHA
            LDX   #$0000
            TDC
            CLC
            ADC   #$00D0
            JSL   L0D1573
            PLA
            PLX
            PHX
            PHA
            JSL   L0C0324
            PLY
            PLY
            PHA
            PLA
            STA   [$FD]
            LDA   [$F5]
            CLC
            ADC   #$076C
            PHA
            PLA
            STA   [$F5]
            TDC
            CLC
            ADC   #$00E7
            TCS
            PLD
            RTL

L051393     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00E6
            TCS
            LDA   L0F0070
            STA   $F6
            STZ   $E8
            STZ   $EA
            LDA   L0F0070
            CMP   #$FFFF
            BNE   L0513B2
            BRL   L0514E5
L0513B2     PEA   $0000
            JSL   L091C6A
            PLY
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
            BCC   L0513DD
            INC   $FA
L0513DD     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0513E7
            INC   $FA
L0513E7     LDA   [$F8]
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
            LDA   #$0058
            CLC
            ADC   $F8
            STA   $F8
            BCC   L05140B
            INC   $FA
L05140B     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L051415
            INC   $FA
L051415     PEI   $FA
            PEI   $F8
            PEA   ^L0E2EF8
            PEA   L0E2EF8
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            LDA   #L0E0A9E
            LDX   #^L0E0A9E
            STX   L0F0034
            STA   L0F0032
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$00BA
            CLC
            ADC   $F8
            BCC   L051448
            INX
L051448     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            PLX
            LDY   #$0A10
            PHA
            TXA
            STA   [$F8],Y
            PLA
            LDY   #$0A0E
            STA   [$F8],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$045C
            CLC
            ADC   $F8
            BCC   L051478
            INX
L051478     STX   L0F002C
            STA   L0F002A
            PEA   $0000
            PEA   $0000
            LDA   L0F0096
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
            STX   $F2
            STA   $F0
            LDX   L0F00C1
            LDA   L0F00BF
            STA   $F8
            STX   $FA
            LDY   #$0006
            LDA   [$F8],Y
            LDX   #$0000
            TAY
            BPL   L0514B9
            DEX
L0514B9     PHX
            PHA
            LDX   $F2
            LDA   $F0
            JSL   L0D1573
            PLA
            PLX
            STX   $F2
            STA   $F0
            PEI   $F2
            PEI   $F0
            PEA   ^L0E4DCC
            PEA   L0E4DCC
            JSL   L0D1CCB
            PLY
            PLY
            PLY
            PLY
            PEA   $0000
            JSL   L01141C
            PLY
            BRA   L05150D
L0514E5     LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDY   #$0016
            LDA   [$F8],Y
            STA   L0F0096
            LDA   #$0000
            SEP   #$20
            STAL  L0E2EF8
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STAL  L0E4DCC
            REP   #$20
L05150D     PEA   ^L0E2EF8
            PEA   L0E2EF8
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            PEA   ^L0E4DCC
            PEA   L0E4DCC
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            JSL   L0D005F
            PLY
            PLY
            PLY
            PLY
            LDA   #L0E204F
            LDX   #^L0E204F
            PHA
            TXA
            STAL  L0E1892
            PLA
            STAL  L0E1890
            LDA   #L0E2053
            LDX   #^L0E2053
            PHA
            TXA
            STAL  L0E18AA
            PLA
            STAL  L0E18A8
            LDAL  L0E4802
            TAX
            LDAL  L0E4800
            PHA
            TXA
            STAL  L0E18C2
            PLA
            STAL  L0E18C0
            LDAL  L0E4806
            TAX
            LDAL  L0E4804
            PHA
            TXA
            STAL  L0E18DA
            PLA
            STAL  L0E18D8
            LDA   #L0E4BCC
            LDX   #^L0E4BCC
            PHA
            TXA
            STAL  L0E18F2
            PLA
            STAL  L0E18F0
            LDA   #L0E4CCC
            LDX   #^L0E4CCC
            PHA
            TXA
            STAL  L0E190A
            PLA
            STAL  L0E1908
            LDX   #$0000
            TDC
            CLC
            ADC   #$00E8
            PHA
            TXA
            STAL  L0E1922
            PLA
            STAL  L0E1920
            LDA   #L0E1884
            LDX   #^L0E1884
            PHA
            TXA
            STAL  L0E1864+2
            PLA
            STAL  L0E1864
            LDA   #L0E189C
            LDX   #^L0E189C
            PHA
            TXA
            STAL  L0E1868+2
            PLA
            STAL  L0E1868
            LDA   #L0E18B4
            LDX   #^L0E18B4
            PHA
            TXA
            STAL  L0E186C+2
            PLA
            STAL  L0E186C
            LDA   #L0E18CC
            LDX   #^L0E18CC
            PHA
            TXA
            STAL  L0E1870+2
            PLA
            STAL  L0E1870
            LDA   #L0E18E4
            LDX   #^L0E18E4
            PHA
            TXA
            STAL  L0E1874+2
            PLA
            STAL  L0E1874
            LDA   #L0E18FC
            LDX   #^L0E18FC
            PHA
            TXA
            STAL  L0E1878+2
            PLA
            STAL  L0E1878
            LDA   #L0E1914
            LDX   #^L0E1914
            PHA
            TXA
            STAL  L0E187C+2
            PLA
            STAL  L0E187C
            PHX
            PHA
            PEA   ^L0E1856
            PEA   L0E1856
            _GetNewModalDialog
            STA   L0F0779
            PLA
            PLX
            STX   $EE
            STA   $EC
L051643     LDA   #$0001
            BNE   L05164B
            BRL   L051739
L05164B     PHA
            PEA   $0000
            PEA   $0000
            _ModalDialog
            STA   L0F0779
            PLA
            STA   L0F00E1
            LDA   L0F00E1
            SEC
            SBC   #$0002
            BEQ   L051672
            BVS   L05166E
            EOR   #$8000
L05166E     BPL   L051672
            BRA   L051643
L051672     LDA   L0F00E1
            CMP   #$0002
            BNE   L0516A0
            PEI   $EE
            PEI   $EC
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   #$0000
            BRL   L05193F
L0516A0     PEI   $EE
            PEI   $EC
            PEA   $0006
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            _GetIText
            STA   L0F0779
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            PEA   ^L0E4DCC
            PEA   L0E4DCC
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
            PEI   $EE
            PEI   $EC
            PEA   $0005
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            _GetIText
            STA   L0F0779
            PEA   ^L0E4CCC
            PEA   L0E4CCC
            PEA   ^L0E2EF8
            PEA   L0E2EF8
            JSL   L0D0000
            PLY
            PLY
            PLY
            PLY
            JSL   L051C1E
            TAY
            BEQ   L051701
            BRA   L051739
            BRA   L051736
L051701     PEI   $EE
            PEI   $EC
            PEA   $0007
            LDA   L0F0094
            ASL
            ASL
            PHA
            LDA   #L0E4800
            STA   $F8
            LDA   #^L0E4800
            STA   $FA
            PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L051722
            INC   $FA
L051722     LDY   #$0002
            LDA   [$F8],Y
            TAX
            LDA   [$F8]
            PHX
            PHA
            _SetIText
            STA   L0F0779
L051736     BRL   L051643
L051739     PEI   $EE
            PEI   $EC
            _CloseDialog
            STA   L0F0779
            LDX   L0F0060
            LDA   L0F005E
            PHX
            PHA
            _SetPort
            STA   L0F0779
            LDA   $F6
            CMP   #$FFFF
            BEQ   L051763
            BRL   L05188E
L051763     PEA   $0000
            JSL   L0825EE
            PLY
            CMP   #$0000
            BEQ   L051776
            LDA   #$0000
            BRL   L05193F
L051776     LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDY   #$0006
            LDA   [$F8],Y
            SEC
            SBC   #$0002
            BVS   L05178E
            EOR   #$8000
L05178E     BPL   L051793
            BRL   L05181E
L051793     LDA   #$0001
            STA   L0F006C
            PEA   ^L0E510F
            PEA   L0E510F
            JSL   L0800DE
            PLY
            PLY
            STA   $F4
            STZ   L0F006C
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$0014
            CLC
            ADC   $F8
            BCC   L0517BF
            INX
L0517BF     STX   L0F002C
            STA   L0F002A
            LDA   $F4
            CMP   #$FFFF
            BNE   L0517D2
            LDA   #$0000
            BRL   L05193F
L0517D2     JSL   L080000
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDA   #$0003
            LDY   #$045E
            STA   [$F8],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDA   #$0000
            LDY   #$04A4
            STA   [$F8],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDA   #$0001
            LDY   #$04C4
            STA   [$F8],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDA   #$0002
            LDY   #$04E4
            STA   [$F8],Y
L05181E     JSL   L051949
            LDX   L0F0074
            LDA   L0F0072
            STA   $F8
            STX   $FA
            LDA   [$F8]
            PHA
            LDX   L0F0074
            LDA   L0F0072
            PHX
            PHA
            PEA   $0001
            JSL   L080F25
            PLY
            PLY
            PLY
            PLY
            STA   $F4
            PEA   $0000
            JSL   L01141C
            PLY
            LDA   $F4
            CMP   #$FFFF
            BNE   L051859
            LDA   #$0000
            BRL   L05193F
L051859     JSL   L080000
            JSL   L051AE7
            LDA   #$0008
            STA   L0F00DB
            LDA   #$0002
            STA   L0F00DD
            LDA   #$0048
            STA   L0F00D9
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   [$F8]
            STA   L0F00D5
            LDA   L0F00D5
            STA   L0F00D7
            STZ   L0F00DF
            BRL   L05191F
L05188E     JSL   L051949
            LDA   L0F0096
            ASL
            TAX
            LDAL  L0E0046,X
            PHA
            LDX   L0F0074
            LDA   L0F0072
            STA   $F8
            STX   $FA
            LDA   [$F8]
            PHA
            LDX   L0F0074
            LDA   L0F0072
            PHX
            PHA
            PEA   $0001
            JSL   L0817D9
            PLY
            PLY
            PLY
            PLY
            PLY
            STA   $F4
            PEA   $0000
            JSL   L01141C
            PLY
            LDA   $F4
            CMP   #$FFFF
            BNE   L0518D4
            LDA   #$0000
            BRL   L05193F
L0518D4     LDA   #$0008
            STA   L0F00DB
            LDA   #$0002
            STA   L0F00DD
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
            LDA   #$004A
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0518FF
            INC   $FA
L0518FF     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L051909
            INC   $FA
L051909     LDA   [$F8]
            STA   L0F00D9
            LDA   $F6
            STA   L0F00D5
            LDA   L0F0096
            STA   L0F00D7
            LDA   #$0001
            STA   L0F00DF
L05191F     LDA   #$0001
            STA   L0F0006
            PEA   ^L0E1856
            PEA   L0E1856
            PEA   ^L0E17C6
            PEA   L0E17C6
            JSL   L0C0BFE
            PLY
            PLY
            PLY
            PLY
            LDA   #$0004
            STA   L0F0012
L05193F     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L051949     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDA   #L0E0A9E
            LDX   #^L0E0A9E
            STX   L0F0034
            STA   L0F0032
            PEA   $0001
            JSL   L011C24
            PLY
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$045C
            CLC
            ADC   $F8
            BCC   L05197D
            INX
L05197D     STX   L0F002C
            STA   L0F002A
            JSL   L0A0A02
            LDA   L0F0096
            CLC
            ADC   #$0030
            AND   #$00FF
            PHA
            LDA   #L0E4BCC
            LDX   #^L0E4BCC
            STA   $F8
            STX   $FA
            PLA
            SEP   #$20
            STA   [$F8]
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STAL  L0E4BCD
            REP   #$20
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$00BA
            BCC   L0519C3
            INX
L0519C3     PHX
            PHA
            PEA   ^L0E4BCC
            PEA   L0E4BCC
            PEA   $0000
            PEA   $0003
            JSL   L082D81
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #L0E2A36
            LDX   #^L0E2A36
            STX   L0F0074
            STA   L0F0072
            LDX   L0F0074
            LDA   L0F0072
            STA   $F8
            STX   $FA
            LDA   [$F8]
            LDX   #$0000
            TAY
            BPL   L0519FC
            DEX
L0519FC     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$00BA
            BCC   L051A13
            INX
L051A13     PHX
            PHA
            LDX   L0F0074
            LDA   L0F0072
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
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$00BA
            BCC   L051A3E
            INX
L051A3E     PHX
            PHA
            PEA   ^L0E4DCC
            PEA   L0E4DCC
            PEA   $0001
            PEA   $0003
            JSL   L082D81
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #L0E2A36
            LDX   #^L0E2A36
            STX   L0F0074
            STA   L0F0072
            LDX   L0F0074
            LDA   L0F0072
            STA   $F8
            STX   $FA
            LDA   [$F8]
            LDX   #$0000
            TAY
            BPL   L051A77
            DEX
L051A77     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$00BA
            BCC   L051A8E
            INX
L051A8E     PHX
            PHA
            LDX   L0F0074
            LDA   L0F0072
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
            STA   $F8
            STX   $FA
            LDA   $F8
            LDX   $FA
            CLC
            ADC   #$00BA
            BCC   L051AB9
            INX
L051AB9     PHX
            PHA
            PEA   ^L0E4FCC
            PEA   L0E4FCC
            PEA   $0002
            PEA   $0003
            JSL   L082D81
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #L0E2A36
            LDX   #^L0E2A36
            STX   L0F0074
            STA   L0F0072
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L051AE7     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00EC
            TCS
            STZ   $F6
            BRA   L051B03
L051AF6     LDA   $F6
            ASL
            TAX
            LDA   #$FFFF
            STAL  L0E0046,X
            INC   $F6
L051B03     LDA   $F6
            SEC
            SBC   #$0020
            BVS   L051B0E
            EOR   #$8000
L051B0E     BPL   L051AF6
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDY   #$0006
            LDA   [$F8],Y
            CMP   #$0001
            BNE   L051B2A
            LDA   #$0000
            BRL   L051C14
L051B2A     LDA   #L0E0A9E
            LDX   #^L0E0A9E
            STX   L0F0034
            STA   L0F0032
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$00BA
            CLC
            ADC   $F8
            BCC   L051B4B
            INX
L051B4B     PHX
            PHA
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            PLA
            PLX
            LDY   #$0A10
            PHA
            TXA
            STA   [$F8],Y
            PLA
            LDY   #$0A0E
            STA   [$F8],Y
            LDX   L0F000C
            LDA   L0F000A
            STA   $F8
            STX   $FA
            LDX   $FA
            LDA   #$045C
            CLC
            ADC   $F8
            BCC   L051B7B
            INX
L051B7B     STX   L0F002C
            STA   L0F002A
            LDA   #$FFFF
            STA   $F2
L051B86     LDA   #$0001
            BNE   L051B8E
            BRL   L051C0C
L051B8E     PEI   $F2
            JSL   L0A24B8
            PLY
            STA   $F6
            LDA   $F6
            CMP   #$FFFF
            BNE   L051BA0
            BRA   L051C0C
L051BA0     PEA   $0000
            PEA   $0000
            PEI   $F6
            PEA   $0001
            JSL   L081620
            PLY
            PLY
            PLY
            PLY
            LDX   L0F00C1
            LDA   L0F00BF
            STX   $F0
            STA   $EE
            LDX   L0F00C1
            LDA   L0F00BF
            STA   $F8
            STX   $FA
            LDY   #$0004
            LDA   [$F8],Y
            LDX   #$0000
            TAY
            BPL   L051BD3
            DEX
L051BD3     PHX
            PHA
            LDX   $F0
            LDA   $EE
            JSL   L0D1573
            PLA
            PLX
            STX   $F0
            STA   $EE
            LDA   [$EE]
            AND   #$00FF
            SEC
            SBC   #$0030
            STA   $F4
            LDA   $F4
            SEC
            SBC   #$0020
            BVS   L051BF9
            EOR   #$8000
L051BF9     BMI   L051C05
            LDA   $F4
            ASL
            TAX
            LDA   $F6
            STAL  L0E0046,X
L051C05     LDA   $F6
            STA   $F2
            BRL   L051B86
L051C0C     PEA   $0000
            JSL   L01141C
            PLY
L051C14     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L051C1E     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F0
            TCS
            PEA   ^L0E4DCC
            PEA   L0E4DCC
            JSL   L0C04CD
            PLY
            PLY
            STA   $F4
            LDA   $F4
            CMP   #$0000
            BNE   L051C4C
            PEA   $FFFF
            JSL   L051D5D
            PLY
            LDA   #$0000
            BRL   L051D53
L051C4C     STZ   $F6
L051C4E     LDA   $F6
            SEC
            SBC   $F4
            BVS   L051C58
            EOR   #$8000
L051C58     BPL   L051C5D
            BRL   L051D21
L051C5D     PEA   $0001
            LDA   $F6
            TAX
            TXA
            CLC
            ADC   #L0E4DCC
            TAX
            LDA   #^L0E4DCC
            BCC   L051C6F
            INC
L051C6F     PHA
            PHX
            JSL   L0B0FA7
            PLY
            PLY
            PLY
            CMP   #$0000
            BNE   L051C80
            BRL   L051D0D
L051C80     LDA   $F6
            TAX
            LDAL  L0E4DCC,X
            AND   #$00FF
            CMP   #$0025
            BNE   L051C92
            BRL   L051D0D
L051C92     LDA   $F6
            TAX
            LDAL  L0E4DCC,X
            AND   #$00FF
            CMP   #$002B
            BNE   L051CA4
            BRL   L051D0D
L051CA4     LDA   $F6
            TAX
            LDAL  L0E4DCC,X
            AND   #$00FF
            CMP   #$002D
            BEQ   L051D0D
            LDA   $F6
            TAX
            LDAL  L0E4DCC,X
            AND   #$00FF
            CMP   #$002F
            BEQ   L051D0D
            LDA   $F6
            TAX
            LDAL  L0E4DCC,X
            AND   #$00FF
            CMP   #$002A
            BEQ   L051D0D
            LDA   $F6
            TAX
            LDAL  L0E4DCC,X
            AND   #$00FF
            CMP   #$002E
            BEQ   L051D0D
            LDA   $F6
            TAX
            LDAL  L0E4DCC,X
            AND   #$00FF
            CMP   #$0020
            BEQ   L051D0D
            LDA   $F6
            TAX
            LDAL  L0E4DCC,X
            AND   #$00FF
            CMP   #$0029
            BEQ   L051D0D
            LDA   $F6
            TAX
            LDAL  L0E4DCC,X
            AND   #$00FF
            CMP   #$0028
            BNE   L051D11
L051D0D     INC   $F6
            BRA   L051D1E
L051D11     PEA   $FFF8
            JSL   L051D5D
            PLY
            LDA   #$0000
            BRA   L051D53
L051D1E     BRL   L051C4E
L051D21     PEI   $F4
            JSL   L052389
            PLY
            STA   L0F007E
            LDA   L0F007E
            BEQ   L051D3E
            LDA   L0F007E
            PHA
            JSL   L051D5D
            PLY
            LDA   #$0000
            BRA   L051D53
L051D3E     LDX   L0F008E
            LDA   L0F008C
            TAX
            LDA   #$0000
            SEP   #$20
            STAL  L0E4FCC,X
            REP   #$20
            LDA   #$0001
L051D53     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L051D5D     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            EOR   #$FFFF
            INC
            CLC
            ADC   #$0001
            STA   L0F0094
            TDC
            CLC
            ADC   #$00F9
            TCS
            PLD
            RTL

L051D7D     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   #L0E4DCC
            LDX   #^L0E4DCC
            STX   L0F0092
            STA   L0F0090
            LDA   $FF
            LDX   #$0000
            PHX
            PHA
            LDX   L0F0092
            LDA   L0F0090
            JSL   L0D1573
            PLA
            PLX
            STX   L0F0092
            STA   L0F0090
            LDA   $FF
            TAX
            LDAL  L0E4DCC,X
            AND   #$00FF
            TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L051DC1     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00EC
            TCS
            LDX   L0F008A
            LDA   L0F0088
            STX   $F0
            STA   $EE
            LDX   L0F008E
            LDA   L0F008C
            PHX
            PHA
            LDX   $F0
            LDA   $EE
            JSL   L0D1573
            PLA
            PLX
            STX   $F0
            STA   $EE
            LDA   $FB
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$EE]
            REP   #$20
            INC   $EE
            BNE   L051DFF
            INC   $F0
L051DFF     LDA   $FB
            CMP   #$007E
            BEQ   L051E0D
            CMP   #$007F
            BEQ   L051E0D
            BRA   L051E18
L051E0D     LDA   #$0001
            STA   $FB
            BRA   L051E1A
L051E14     BRA   L051E1A
            BRA   L051E1A
L051E18     BRA   L051E14
L051E1A     LDA   $FB
            LDX   #$0000
            TAY
            BPL   L051E23
            DEX
L051E23     PHX
            PHA
            PEI   $F0
            PEI   $EE
            PEI   $FF
            PEI   $FD
            JSL   L0C0863
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            LDA   #$0001
            CLC
            ADC   $FB
            LDX   #$0000
            TAY
            BPL   L051E46
            DEX
L051E46     PHX
            PHA
            LDX   L0F008E
            LDA   L0F008C
            JSL   L0D1573
            PLA
            PLX
            STX   L0F008E
            STA   L0F008C
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L051E62     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00F0
            TCS
            PEI   $FF
            PEI   $FD
            PEI   $FB
            JSL   L051DC1
            PLY
            PLY
            PLY
            TDC
            CLC
            ADC   #$00F5
            TCS
            PLD
            RTL

L051E82     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00EB
            TCS
            LDA   L0F0078
            CLC
            ADC   #$0001
            STA   $EF
            LDA   $EF
            SEC
            SBC   L0F007A
            BVS   L051EA1
            EOR   #$8000
L051EA1     BPL   L051EAC
            LDA   #$FFF8
            BRL   L051F2E
            BRL   L051F2E
L051EAC     PEI   $EF
            JSL   L051D7D
            PLY
            STA   $ED
            LDA   $ED
            CMP   #$002E
            BEQ   L051EEE
            LDA   $ED
            SEC
            SBC   #$0039
            BVS   L051EC7
            EOR   #$8000
L051EC7     BMI   L051ED8
            LDA   $ED
            SEC
            SBC   #$002F
            BEQ   L051ED8
            BVS   L051ED6
            EOR   #$8000
L051ED6     BMI   L051EEE
L051ED8     LDA   $ED
            SEC
            SBC   #$0040
            BEQ   L051EE7
            BVS   L051EE5
            EOR   #$8000
L051EE5     BMI   L051EEE
L051EE7     LDA   $ED
            CMP   #$0028
            BNE   L051F2B
L051EEE     LDA   [$FD]
            AND   #$00FF
            SEP   #$20
            STA   $F2
            REP   #$20
            LDA   #$0031
            STA   $ED
            LDA   $ED
            AND   #$00FF
            SEP   #$20
            STA   $F3
            REP   #$20
            PEA   $0000
            TDC
            CLC
            ADC   #$00F2
            PHA
            PEA   $0002
            JSL   L051E62
            PLY
            PLY
            PLY
            LDA   #$002A
            STA   [$FD]
            INC   L0F0082
            LDA   #$0000
            BRA   L051F2E
            BRA   L051F2E
L051F2B     LDA   #$FFF8
L051F2E     TAY
            TDC
            CLC
            ADC   #$00F7
            TCS
            TYA
            PLD
            RTL

L051F38     PHD
            TSC
            SEC
            SBC   #$00F5
            TCD
            ADC   #$00E4
            TCS
            LDA   L0F0078
            TAX
            TXA
            CLC
            ADC   #L0E4DCC
            LDX   #^L0E4DCC
            BCC   L051F52
            INX
L051F52     STX   $E8
            STA   $E6
            LDA   $FF
            SEC
            SBC   #$0010
            BEQ   L051F6B
            BVS   L051F63
            EOR   #$8000
L051F63     BPL   L051F6B
            LDA   #$FFFE
            BRL   L052099
L051F6B     LDA   #$FFFF
            STA   $EC
            STZ   $EE
L051F72     LDX   L0F002C
            LDA   L0F002A
            STA   $F2
            STX   $F4
            LDY   #$0002
            LDA   [$F2],Y
            SEC
            SBC   $EE
            BNE   L051F89
            BRL   L052018
L051F89     BVS   L051F8E
            EOR   #$8000
L051F8E     BMI   L051F93
            BRL   L052018
L051F93     LDA   $EE
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
            BCC   L051FB1
            INC   $F4
L051FB1     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L051FBB
            INC   $F4
L051FBB     PEI   $F4
            PEI   $F2
            JSL   L0C04CD
            PLY
            PLY
            PHA
            PEI   $FF
            LDA   $EE
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
            BCC   L051FE6
            INC   $F4
L051FE6     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L051FF0
            INC   $F4
L051FF0     PEI   $F4
            PEI   $F2
            PEI   $E8
            PEI   $E6
            JSL   L0C04FA
            TAY
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            STA   $EA
            LDA   $EA
            CMP   #$0000
            BNE   L052013
            LDA   $EE
            STA   $EC
            BRA   L052018
L052013     INC   $EE
            BRL   L051F72
L052018     LDA   $EC
            CMP   #$FFFF
            BNE   L052024
            LDA   #$FFFD
            BRA   L052099
L052024     LDA   $EC
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
            BCC   L052042
            INC   $F4
L052042     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L05204C
            INC   $F4
L05204C     LDA   [$F2]
            AND   #$00FF
            CMP   #$0008
            BNE   L05205B
            LDA   #$FFFB
            BRA   L052099
L05205B     LDA   $EC
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
            BCC   L052079
            INC   $F4
L052079     PLA
            CLC
            ADC   $F2
            STA   $F2
            BCC   L052083
            INC   $F4
L052083     LDA   [$F2]
            AND   #$00FF
            CMP   #$0001
            BEQ   L052092
            LDA   #$FFFC
            BRA   L052099
L052092     LDA   $EC
            STA   [$FB]
            LDA   #$0000
L052099     TAY
            TDC
            CLC
            ADC   #$00F5
            TCS
            TYA
            PLD
            RTL

L0520A3     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            SEC
            SBC   #$0010
            BEQ   L0520C2
            BVS   L0520BB
            EOR   #$8000
L0520BB     BPL   L0520C2
            LDA   #$FFFA
            BRA   L0520C5
L0520C2     LDA   #$0000
L0520C5     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L0520CF     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00E7
            TCS
            LDA   L0F0078
            STA   $F4
            STZ   L0F007E
L0520E2     LDA   #$0001
            BNE   L0520EA
            BRL   L0521A3
L0520EA     INC   $F4
            LDA   $F4
            SEC
            SBC   L0F007A
            BVS   L0520F7
            EOR   #$8000
L0520F7     BPL   L0520FC
            BRL   L05219E
L0520FC     LDA   $F4
            TAX
            LDAL  L0E4DCC,X
            AND   #$00FF
            AND   #$00FF
            SEP   #$20
            STA   $E9
            REP   #$20
            LDA   $E9
            AND   #$00FF
            CMP   #$0028
            BEQ   L05214B
            LDA   $E9
            AND   #$00FF
            CMP   #$0029
            BEQ   L05214B
            LDA   $E9
            AND   #$00FF
            CMP   #$002A
            BEQ   L05214B
            LDA   $E9
            AND   #$00FF
            CMP   #$002B
            BEQ   L05214B
            LDA   $E9
            AND   #$00FF
            CMP   #$002D
            BEQ   L05214B
            LDA   $E9
            AND   #$00FF
            CMP   #$002F
            BNE   L05214D
L05214B     BRA   L0521A3
L05214D     LDA   $FF
            CMP   #$0002
            BNE   L05219C
            LDA   $E9
            AND   #$00FF
            CMP   #$0020
            BNE   L052160
            BRA   L0521A3
L052160     LDA   $E9
            AND   #$00FF
            CMP   #$0025
            BEQ   L05219C
            LDA   $E9
            AND   #$00FF
            SEC
            SBC   #$002E
            BVS   L052178
            EOR   #$8000
L052178     BPL   L052196
            LDA   $E9
            AND   #$00FF
            CMP   #$002F
            BEQ   L052196
            LDA   $E9
            AND   #$00FF
            SEC
            SBC   #$0039
            BEQ   L05219C
            BVS   L052194
            EOR   #$8000
L052194     BPL   L05219C
L052196     LDA   #$FFFA
            BRL   L05227A
L05219C     BRA   L0521A0
L05219E     BRA   L0521A3
L0521A0     BRL   L0520E2
L0521A3     LDA   $F4
            SEC
            SBC   L0F0078
            STA   $F0
            LDA   $FF
            CMP   #$0001
            BNE   L0521DE
            LDA   $F0
            SEC
            SBC   #$0001
            BEQ   L0521DE
            BVS   L0521BF
            EOR   #$8000
L0521BF     BPL   L0521DE
            LDA   $F4
            SEC
            SBC   #$0001
            STA   $F2
L0521C9     LDA   $F2
            TAX
            LDAL  L0E4DCC,X
            AND   #$00FF
            CMP   #$0020
            BNE   L0521DE
            DEC   $F0
            DEC   $F2
            BRA   L0521C9
L0521DE     LDA   $FF
            CMP   #$0001
            BEQ   L0521E7
            BRA   L052236
L0521E7     PEI   $F0
            PEA   $0000
            TDC
            CLC
            ADC   #$00EE
            PHA
            JSL   L051F38
            PLY
            PLY
            PLY
            STA   L0F007E
            LDA   L0F007E
            BEQ   L052207
            LDA   L0F007E
            BRL   L05227A
L052207     LDA   $EE
            CLC
            ADC   #$0030
            AND   #$00FF
            SEP   #$20
            STA   $EA
            REP   #$20
            LDA   #$0000
            SEP   #$20
            STA   $EB
            REP   #$20
            PEA   $0000
            TDC
            CLC
            ADC   #$00EA
            PHA
            PEA   $007F
            JSL   L051DC1
            PLY
            PLY
            PLY
            BRA   L05226F
            BRA   L05223D
L052236     CMP   #$0002
            BEQ   L05223D
            BRA   L05226F
L05223D     PEI   $F0
            JSL   L0520A3
            PLY
            STA   L0F007E
            LDA   L0F007E
            CMP   #$0000
            BEQ   L052254
            LDA   L0F007E
            BRA   L05227A
L052254     LDA   L0F0078
            TAX
            TXA
            CLC
            ADC   #L0E4DCC
            TAX
            LDA   #^L0E4DCC
            BCC   L052264
            INC
L052264     PHA
            PHX
            PEI   $F0
            JSL   L051E62
            PLY
            PLY
            PLY
L05226F     LDA   $F4
            STA   L0F0078
            INC   L0F0082
            LDA   #$0000
L05227A     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL

L052284     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F5
            TCS
L05228F     LDA   L0F0078
            SEC
            SBC   L0F007A
            BVS   L05229B
            EOR   #$8000
L05229B     BMI   L0522B2
            LDA   L0F0078
            TAX
            LDAL  L0E4DCC,X
            AND   #$00FF
            CMP   #$0020
            BNE   L0522B2
            INC   L0F0078
            BRA   L05228F
L0522B2     LDA   L0F0078
            SEC
            SBC   L0F007A
            BVS   L0522BE
            EOR   #$8000
L0522BE     BPL   L0522C6
            LDA   #$FFFF
            BRL   L05237F
L0522C6     LDA   L0F0078
            TAX
            LDAL  L0E4DCC,X
            AND   #$00FF
            AND   #$00FF
            SEP   #$20
            STA   $F7
            REP   #$20
            STZ   L0F007E
            LDA   L0F0084
            BEQ   L052316
            LDA   $F7
            AND   #$00FF
            CMP   #$002B
            BEQ   L0522F6
            LDA   $F7
            AND   #$00FF
            CMP   #$002D
            BNE   L052316
L0522F6     PEA   $0000
            TDC
            CLC
            ADC   #$00F7
            PHA
            JSL   L051E82
            PLY
            PLY
            STA   L0F007E
            LDA   L0F007E
            CMP   #$0000
            BEQ   L052316
            LDA   L0F007E
            BRL   L05237F
L052316     STZ   L0F0084
            LDA   $F7
            AND   #$00FF
            CMP   #$002E
            BEQ   L052345
            LDA   $F7
            AND   #$00FF
            SEC
            SBC   #$003A
            BVS   L052331
            EOR   #$8000
L052331     BMI   L052355
            LDA   $F7
            AND   #$00FF
            SEC
            SBC   #$002F
            BEQ   L052355
            BVS   L052343
            EOR   #$8000
L052343     BPL   L052355
L052345     PEA   $0002
            JSL   L0520CF
            PLY
            STA   L0F007E
            LDA   L0F007E
            BRA   L05237F
L052355     LDA   $F7
            AND   #$00FF
            SEC
            SBC   #$0040
            BEQ   L052377
            BVS   L052365
            EOR   #$8000
L052365     BPL   L052377
            PEA   $0001
            JSL   L0520CF
            PLY
            STA   L0F007E
            LDA   L0F007E
            BRA   L05237F
L052377     INC   L0F0078
            LDA   $F7
            AND   #$00FF
L05237F     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L052389     PHD
            TSC
            SEC
            SBC   #$00F9
            TCD
            ADC   #$00F4
            TCS
            LDA   $FF
            STA   L0F007A
            STZ   L0F008C
            STZ   L0F008E
            LDA   #L0E4FCC
            LDX   #^L0E4FCC
            STX   L0F008A
            STA   L0F0088
            STZ   L0F0080
            STZ   L0F0082
            LDA   #$0001
            STA   L0F0084
            LDA   #$0001
            STA   L0F0076
            LDA   #$0029
            SEP   #$20
            STAL  L0E4ECD
            REP   #$20
            STZ   L0F0078
            LDA   #$0000
            STAL  L0E2874
            LDA   #$0002
            STAL  L0E2878
            LDA   #$0001
            STAL  L0E287A
            LDA   #$0001
            STAL  L0E287E
            LDA   #$0002
            STAL  L0E2882
            LDA   #$0003
            STAL  L0E2886
            LDA   #$0002
            STAL  L0E288A
            LDA   #$0001
            STAL  L0E288C
            LDA   #$0001
            STAL  L0E2890
            LDA   #$0002
            STAL  L0E2894
            LDA   #$0000
            STAL  L0E2876
            LDA   #$0001
            STAL  L0E2888
L05241F     LDA   #$0001
            BNE   L052427
            BRL   L0525A0
L052427     JSL   L052284
            STA   L0F009C
            LDA   L0F009C
            SEC
            SBC   #$FFFF
            BVS   L05243A
            EOR   #$8000
L05243A     BMI   L052442
            LDA   L0F009C
            BRL   L0525A0
L052442     LDA   L0F009C
            CMP   #$FFFF
            BEQ   L05244D
            BRL   L05249F
L05244D     LDA   L0F0080
            CMP   #$0000
            BNE   L05245D
            LDA   L0F0082
            CMP   #$0001
            BEQ   L052463
L05245D     LDA   #$FFF9
            BRL   L0525A0
L052463     LDA   L0F0076
            SEC
            SBC   #$0001
            BEQ   L052494
            BVS   L052471
            EOR   #$8000
L052471     BPL   L052494
            LDA   L0F0076
            TAX
            TXA
            CLC
            ADC   #L0E4ECC
            TAX
            LDA   #^L0E4ECC
            BCC   L052483
            INC
L052483     PHA
            PHX
            PEA   $007E
            JSL   L051DC1
            PLY
            PLY
            PLY
            DEC   L0F0076
            BRA   L052463
L052494     LDA   #$0000
            BRL   L0525A0
            BRL   L05259D
            BRA   L0524AB
L05249F     CMP   #$0000
            BEQ   L0524AB
            CMP   #$0020
            BEQ   L0524AB
            BRA   L0524B0
L0524AB     BRL   L05259D
            BRA   L0524B7
L0524B0     CMP   #$0025
            BEQ   L0524B7
            BRA   L0524BF
L0524B7     LDA   #$FFF8
            BRL   L0525A0
            BRA   L0524C7
L0524BF     CMP   #$0029
            BEQ   L0524C7
            BRL   L05259A
L0524C7     DEC   L0F0080
            LDA   L0F0080
            SEC
            SBC   #$0000
            BVS   L0524D6
            EOR   #$8000
L0524D6     BMI   L0524DE
            LDA   #$FFF9
            BRL   L0525A0
L0524DE     LDA   L0F0076
            TAX
            LDAL  L0E4ECC,X
            AND   #$00FF
            CMP   #$0028
            BEQ   L05250F
            LDA   L0F0076
            TAX
            TXA
            CLC
            ADC   #L0E4ECC
            TAX
            LDA   #^L0E4ECC
            BCC   L0524FE
            INC
L0524FE     PHA
            PHX
            PEA   $007E
            JSL   L051DC1
            PLY
            PLY
            PLY
            DEC   L0F0076
            BRA   L0524DE
L05250F     DEC   L0F0076
            BRL   L05259D
L052515     LDA   L0F009C
            CMP   #$0028
            BNE   L052528
            LDA   #$0001
            STA   L0F0084
            INC   L0F0080
            BRA   L05252B
L052528     DEC   L0F0082
L05252B     LDA   L0F0082
            CMP   #$0000
            BEQ   L052539
            LDA   #$FFF8
            BRL   L0525A0
L052539     LDA   L0F0076
            TAX
            LDAL  L0E4ECC,X
            AND   #$00FF
            ASL
            TAX
            LDAL  L0E2824,X
            PHA
            LDA   L0F009C
            ASL
            TAX
            LDAL  L0E2836,X
            PLX
            STX   $F6
            SEC
            SBC   $F6
            BEQ   L052563
            BVS   L052561
            EOR   #$8000
L052561     BMI   L052584
L052563     LDA   L0F0076
            TAX
            TXA
            CLC
            ADC   #L0E4ECC
            TAX
            LDA   #^L0E4ECC
            BCC   L052573
            INC
L052573     PHA
            PHX
            PEA   $007E
            JSL   L051DC1
            PLY
            PLY
            PLY
            DEC   L0F0076
            BRA   L052539
L052584     INC   L0F0076
            LDA   L0F009C
            PHA
            LDA   L0F0076
            TAX
            PLA
            SEP   #$20
            STAL  L0E4ECC,X
            REP   #$20
            BRA   L05259D
L05259A     BRL   L052515
L05259D     BRL   L05241F
L0525A0     TAY
            TDC
            CLC
            ADC   #$00F9
            TCS
            TYA
            PLD
            RTL


