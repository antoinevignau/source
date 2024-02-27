*
* rSounder
* (c) 1995, Paul Benson
* (s) 2024, Brutal Deluxe Software
*
*
* v3.1: align a sound on a page
*       removed (c) suffix on sound data

	mx    %00
	rel

*-----------------------------------

	use	4/Ctl.Macs
	use	4/Desk.Macs
	use	4/Event.Macs
	use	4/Font.Macs
	use	4/Int.Macs
	use	4/Line.Macs
	use	4/List.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/MIDISyn.Macs
	use	4/Misc.Macs
	use	4/Print.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Resource.Macs
	use	4/Sane.Macs
	use	4/Scrap.Macs
	use	4/Sound.Macs
	use	4/Std.Macs
	use	4/TextEdit.Macs
	use	4/Util.Macs
	use	4/Window.Macs

	use	RSOUNDER.X.S
	
*-----------------------------------

GSOS        EQU   $E100A8

*-----------------------------------
	
            JSL   L02CBA4
            PEA   >L030000
            PLB
            PLB
            JSL   L02AE9C
            JSL   L0246A5
            JSL   L02AE93
L020015     TSC
            SEC
            SBC   #$0004
            TCS
            PHD
            TCD
            LDA   #$8000
            STAL  L03001B
            LDA   #$0000
            STAL  L030019
            STAL  L03000D
            STAL  L030015
            PHA
            PHA
            _SetMenuBar
            STAL  L02B111
            _InitCursor
            STAL  L02B111
            PEA   $00FF
            _DisableMItem
            STAL  L02B111
            PEA   $0104
            _DisableMItem
            STAL  L02B111
            PEA   $0112
            _DisableMItem
            STAL  L02B111
            PEA   $0115
            _DisableMItem
            STAL  L02B111
            PEA   $0113
            _DisableMItem
            STAL  L02B111
            PEA   $0114
            _DisableMItem
            STAL  L02B111
            PEA   $010E
            _DisableMItem
            STAL  L02B111
            PEA   $0109
            _DisableMItem
            STAL  L02B111
            PEA   $010A
            _DisableMItem
            STAL  L02B111
            PEA   $0108
            _DisableMItem
            STAL  L02B111
            PEA   $010B
            _DisableMItem
            STAL  L02B111
            PEA   $0119
            _DisableMItem
            STAL  L02B111
            PEA   $010C
            _DisableMItem
            STAL  L02B111
            PEA   $010D
            _DisableMItem
            STAL  L02B111
            PHA
            PHA
            PEA   $0001
            PEA   $0001
            PEA   $0000
            _LoadResource
            STAL  L02B111
            PLA
            STAL  L030031
            PLA
            STAL  L030033
            LDAL  L030033
            PHA
            LDAL  L030031
            PHA
            _HLock
            STAL  L02B111
            LDAL  L030033
            TAX
            LDAL  L030031
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STAL  L03000F
            TXA
            STAL  L030011
            LDAL  L030011
            TAX
            LDAL  L03000F
            STA   $01
            STX   $03
            LDA   [$01]
            LDX   #$0000
            TAY
            BPL   L020178
            DEX
L020178     STAL  L030039
            TXA
            STAL  L03003B
            LDAL  L030011
            TAX
            LDAL  L03000F
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            STAL  L03000D
            PHA
            PHA
            PEA   $8024
            PEA   $0000
            PEA   $0001
            _LoadResource
            STAL  L02B111
            PLA
            STAL  L03002D
            PLA
            STAL  L03002F
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L020201
            LDAL  L03002B
            LDX   #$0000
            CMP   #$0201
            BNE   L0201CF
            INX
L0201CF     TXA
            CMP   #$0000
            BEQ   L0201DA
            LDA   #$0001
            BRA   L0201F0
L0201DA     LDAL  L03002B
            LDX   #$0000
            CMP   #$1E06
            BNE   L0201E7
            INX
L0201E7     TXA
            CMP   #$0000
            BEQ   L0201F0
            LDA   #$0001
L0201F0     TAX
            BEQ   L0201F6
            LDA   #$0001
L0201F6     EOR   #$0001
            BEQ   L0201FF
            JSL   L0250E2
L0201FF     BRA   L020251
L020201     PEA   $0006
            PEA   $0001
            PEA   ^L020259
            PEA   L020259
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            PEA   $0000
            PEA   $0000
            _SendRequest
            STAL  L02B111
            PEA   $8024
            PEA   $0000
            PEA   $0001
            _DetachResource
            STAL  L02B111
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
L020251     PLD
            TSC
            CLC
            ADC   #$0004
            TCS
            RTL

L020259     STR   'Apple~SoundCP~'
            DB    $00
L020269     TSC
            SEC
            SBC   #$012C
            TCS
            PHD
            TCD
            LDAL  L030019
            AND   #$0010
            BNE   L0202D2
            LDAL  L030019
            ORA   #$0010
            STAL  L030019
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0FF8
            PEA   $800E
            _NewWindow2
            STAL  L02B111
            PLA
            STAL  L03001D
            PLA
            STAL  L03001F
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L0202D2
            PEA   $0028
            JSL   L024DB6
L0202D2     LDAL  L030011
            TAX
            LDAL  L03000F
            CLC
            ADC   #$0006
            BCC   L0202E2
            INX
L0202E2     STA   $17
            STX   $19
            LDA   [$17]
            XBA
            AND   #$FF00
            STA   [$17]
            LDAL  L030011
            TAX
            LDAL  L03000F
            CLC
            ADC   #$0006
            BCC   L0202FE
            INX
L0202FE     STA   $05
            STX   $07
            INC   $05
            BNE   L020308
            INC   $07
L020308     LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            PEA   $0000
            PEA   $0010
            PEI   $07
            PEI   $05
            _SetLETextByID
            STAL  L02B111
            LDAL  L030011
            TAX
            LDAL  L03000F
            CLC
            ADC   #$0006
            BCC   L020337
            INX
L020337     STA   $17
            STX   $19
            LDA   [$17]
            XBA
            AND   #$00FF
            STA   [$17]
            LDAL  L030011
            TAX
            LDAL  L03000F
            STA   $01
            STX   $03
            LDA   [$01]
            PHA
            PEA   ^L020904
            PEA   L020904
            PEA   $0000
            TDC
            CLC
            ADC   #$001B
            PHA
            JSL   L02AA15
            LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            PEA   $0000
            PEA   $0011
            PEA   $0000
            TDC
            CLC
            ADC   #$001B
            PHA
            JSL   L02A628
            PHX
            PHA
            _SetLETextByID
            STAL  L02B111
            LDAL  L030011
            TAX
            LDAL  L03000F
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            PHA
            PEA   ^L020907
            PEA   L020907
            PEA   $0000
            TDC
            CLC
            ADC   #$001B
            PHA
            JSL   L02AA15
            LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            PEA   $0000
            PEA   $0012
            PEA   $0000
            TDC
            CLC
            ADC   #$001B
            PHA
            JSL   L02A628
            PHX
            PHA
            _SetLETextByID
            STAL  L02B111
            LDAL  L030011
            TAX
            LDAL  L03000F
            STA   $01
            STX   $03
            LDY   #$0004
            LDA   [$01],Y
            BEQ   L02044E
            LDA   #$0000
            PHA
            PHA
            PHA
            LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            PEA   $0000
            PEA   $000E
            _GetCtlHandleFromID
            STAL  L02B111
            _SetCtlValue
            STAL  L02B111
            LDA   #$0001
            PHA
            PHA
            PHA
            LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            PEA   $0000
            PEA   $000F
            _GetCtlHandleFromID
            STAL  L02B111
            _SetCtlValue
            STAL  L02B111
            BRA   L0204A6
L02044E     LDA   #$0001
            PHA
            PHA
            PHA
            LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            PEA   $0000
            PEA   $000E
            _GetCtlHandleFromID
            STAL  L02B111
            _SetCtlValue
            STAL  L02B111
            LDA   #$0000
            PHA
            PHA
            PHA
            LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            PEA   $0000
            PEA   $000F
            _GetCtlHandleFromID
            STAL  L02B111
            _SetCtlValue
            STAL  L02B111
L0204A6     LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            _ShowWindow
            STAL  L02B111
            LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            _SelectWindow
            STAL  L02B111
L0204D0     LDA   #$0000
            STA   $0D
            STA   $0F
L0204D7     PHA
            PHA
            PEA   ^L04008A
            PEA   L04008A
            PEA   $0000
            PEA   $0000
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0018
            _DoModalWindow
            STAL  L02B111
            PLA
            STA   $0D
            PLA
            STA   $0F
            PEI   $0F
            PEI   $0D
            LDA   #$0013
            LDX   #$0000
            LDY   #$0001
            CMP   $01,S
            BEQ   L020517
            DEY
L020517     TXA
            CMP   $03,S
            BEQ   L02051F
            LDY   #$0000
L02051F     PLA
            PLA
            TYA
            BNE   L020543
            PEI   $0F
            PEI   $0D
            LDA   #$0014
            LDX   #$0000
            LDY   #$0001
            CMP   $01,S
            BEQ   L020536
            DEY
L020536     TXA
            CMP   $03,S
            BEQ   L02053E
            LDY   #$0000
L02053E     PLA
            PLA
            TYA
            BEQ   L0204D7
L020543     PEI   $0F
            PEI   $0D
            LDA   #$0013
            LDX   #$0000
            LDY   #$0001
            CMP   $01,S
            BEQ   L020555
            DEY
L020555     TXA
            CMP   $03,S
            BEQ   L02055D
            LDY   #$0000
L02055D     PLA
            PLA
            TYA
            BNE   L020565
            BRL   L0208C8
L020565     STZ   $07
            TDC
            CLC
            ADC   #$0022
            STA   $05
            INC   $05
            BNE   L020574
            INC   $07
L020574     LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            PEA   $0000
            PEA   $0010
            PEI   $07
            PEI   $05
            _GetLETextByID
            STAL  L02B111
            LDA   [$05]
            AND   #$00FF
            LDX   #$0000
            CLC
            ADC   $05
            STA   $09
            TXA
            ADC   $07
            STA   $0B
L0205A5     LDA   [$09]
            AND   #$00FF
            CMP   #$002F
            BEQ   L0205B9
            LDA   [$09]
            AND   #$00FF
            CMP   #$003A
            BNE   L0205C3
L0205B9     LDA   $09
            BNE   L0205BF
            DEC   $0B
L0205BF     DEC   $09
            BRA   L0205A5
L0205C3     INC   $09
            BNE   L0205C9
            INC   $0B
L0205C9     SEP   #$20
            LDA   #$00
            STA   [$09]
            REP   #$20
            LDX   $07
            LDA   $05
            INC
            BNE   L0205D9
            INX
L0205D9     STA   $09
            STX   $0B
L0205DD     LDA   [$09]
            AND   #$00FF
            TAX
            BEQ   L0205FF
            LDA   [$09]
            AND   #$00FF
            CMP   #$002F
            BNE   L0205F7
            SEP   #$20
            LDA   #$3A
            STA   [$09]
            REP   #$20
L0205F7     INC   $09
            BNE   L0205FD
            INC   $0B
L0205FD     BRA   L0205DD
L0205FF     LDX   $0B
            LDA   $09
            SEC
            SBC   $05
            TAY
            TXA
            SBC   $07
            TAX
            TYA
            DEC
            STA   $22
            LDX   #$0125
            TDC
            CLC
            ADC   #$0022
            STA   $00,X
            STZ   $02,X
            LDA   #$0003
            LDX   #$0123
            STA   $00,X
            PEA   $2006
            PEA   $0000
            TDC
            CLC
            ADC   #$0123
            PHA
            JSL   L02A4D6
            JSL   L02AE36
            STAL  L03002B
            LDAL  L03002B
            BEQ   L02064F
            JSL   L0250E2
            LDA   #$0000
            STA   $0D
            STA   $0F
            BRL   L0208C8
L02064F     LDX   #$012B
            LDA   $00,X
            CMP   #$000F
            BEQ   L020684
            PEA   $0000
            PEA   $0000
            PEA   ^L02090A
            PEA   L02090A
            PEA   $0000
            PEA   $0004
            JSL   L024AEF
            LDX   #$0000
            TAY
            BPL   L020676
            DEX
L020676     STX   $0F
            STA   $0D
            LDA   #$0000
            STA   $0D
            STA   $0F
            BRL   L0208C8
L020684     PEA   $0000
            TDC
            CLC
            ADC   #$0024
            PHA
            LDAL  L030011
            PHA
            LDAL  L03000F
            CLC
            ADC   #$0008
            BCC   L02069F
            PLX
            INX
            PHX
L02069F     PHA
            JSL   L02AB57
            LDAL  L030011
            TAX
            LDAL  L03000F
            CLC
            ADC   #$0006
            BCC   L0206B4
            INX
L0206B4     STA   $01
            STX   $03
            LDA   $22
            STA   [$01]
            STZ   $07
            TDC
            CLC
            ADC   #$001B
            STA   $05
            INC   $05
            BNE   L0206CB
            INC   $07
L0206CB     LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            PEA   $0000
            PEA   $0012
            PEA   $0000
            TDC
            CLC
            ADC   #$001B
            PHA
            _GetLETextByID
            STAL  L02B111
            PEI   $07
            PEI   $05
            JSL   L02A60A
            AND   #$000F
            STAL  L03000D
            PHA
            LDAL  L030011
            TAX
            LDAL  L03000F
            CLC
            ADC   #$0002
            BCC   L02070F
            INX
L02070F     STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            PEA   $0000
            PEA   $0011
            PEA   $0000
            TDC
            CLC
            ADC   #$001B
            PHA
            _GetLETextByID
            STAL  L02B111
            PEI   $07
            PEI   $05
            JSL   L02A60A
            STAL  L030039
            TXA
            STAL  L03003B
            LDA   L030039
            ORA   L03003B
            BNE   L02076A
            CLC
            LDAL  L030039
            ADC   #$0001
            STAL  L030039
            BCC   L02076A
            LDAL  L03003B
            INC
            STAL  L03003B
L02076A     PEA   $0000
            PEA   $FFFA
            LDAL  L03003B
            TAX
            LDAL  L030039
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L020785
            TYA
            CMP   $01,S
L020785     BEQ   L020789
            BCS   L02078A
L020789     DEX
L02078A     PLA
            PLA
            TXA
            BEQ   L02079D
            LDA   #$0000
            STAL  L03003B
            LDA   #$FFFA
            STAL  L030039
L02079D     LDAL  L030011
            TAX
            LDAL  L03000F
            STA   $01
            STX   $03
            LDAL  L030039
            STA   [$01]
            PHA
            LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            PEA   $0000
            _FindRadioButton
            STAL  L02B111
            PLA
            CMP   #$0000
            BEQ   L0207D4
            LDA   #$0001
            BRA   L020804
L0207D4     PHA
            LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            PEA   $0001
            _FindRadioButton
            STAL  L02B111
            PLA
            STA   $01
            LDA   #$0001
            TAX
            CMP   $01
            BEQ   L0207FA
            BCS   L0207FB
L0207FA     DEX
L0207FB     TXA
            CMP   #$0000
            BEQ   L020804
            LDA   #$0001
L020804     PHA
            LDAL  L030011
            TAX
            LDAL  L03000F
            CLC
            ADC   #$0004
            BCC   L020815
            INX
L020815     STA   $01
            STX   $03
            PLA
            STA   [$01]
            PEA   $0001
            PEA   $0001
            PEA   $0001
            PEA   $0000
            _MarkResourceChange
            STAL  L02B111
            LDAL  L030019
            AND   #$0004
            BNE   L02083F
            BRL   L0208C8
L02083F     LDAL  L03003B
            PHA
            LDAL  L030039
            PHA
            PEA   ^L02091E
            PEA   L02091E
            PEA   $0000
            TDC
            CLC
            ADC   #$001B
            PHA
            JSL   L02AA15
            LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            PEA   $0000
            PEA   $0009
            PEA   $0000
            TDC
            CLC
            ADC   #$001B
            PHA
            JSL   L02A628
            PHX
            PHA
            _SetLETextByID
            STAL  L02B111
            LDAL  L03000D
            PHA
            PEA   ^L020922
            PEA   L020922
            PEA   $0000
            TDC
            CLC
            ADC   #$001B
            PHA
            JSL   L02AA15
            LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            PEA   $0000
            PEA   $0006
            PEA   $0000
            TDC
            CLC
            ADC   #$001B
            PHA
            JSL   L02A628
            PHX
            PHA
            _SetLETextByID
            STAL  L02B111
L0208C8     LDA   $0D
            ORA   $0F
            BNE   L0208D1
            BRL   L0204D0
L0208D1     LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            _HideWindow
            STAL  L02B111
            _InitCursor
            STAL  L02B111
            LDAL  L030019
            ORA   #$0010
            STAL  L030019
            PLD
            TSC
            CLC
            ADC   #$012C
            TCS
            RTL

L020904     ASC   '%d'00
L020907     ASC   '%d'00
L02090A     ASC   'Must Specify A Path'00
L02091E     ASC   '%ld'00
L020922     ASC   '%d'00
L020925     TSC
            SEC
            SBC   #$0008
            TCS
            PHD
            TCD
            LDA   #L040034
            STA   $05
            LDA   #^L040034
            STA   $07
            LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            PEA   $0000
            PEA   $0009
            PEA   ^L040034
            PEA   L040034
            _GetLETextByID
            STAL  L02B111
            INC   $05
            BNE   L02095E
            INC   $07
L02095E     PEI   $07
            PEI   $05
            JSL   L02A60A
            STAL  L030039
            TXA
            STAL  L03003B
            LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            PEA   $0000
            PEA   $0006
            PEA   ^L040034
            PEA   L040034
            _GetLETextByID
            STAL  L02B111
            PEI   $07
            PEI   $05
            JSL   L02A60A
            AND   #$000F
            STAL  L03000D
            LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            PEA   $0000
            PEA   $0002
            PEA   ^L040034
            PEA   L040034
            _GetLETextByID
            STAL  L02B111
            LDAL  L040034
            AND   #$00FF
            STAL  L030037
            LDA   $05
            BNE   L0209D1
            DEC   $07
L0209D1     DEC   $05
L0209D3     LDA   [$05]
            AND   #$00FF
            TAX
            BEQ   L0209F1
            LDY   #$0001
            LDA   [$05],Y
            AND   #$00FF
            SEP   #$20
            STA   [$05]
            REP   #$20
            INC   $05
            BNE   L0209EF
            INC   $07
L0209EF     BRA   L0209D3
L0209F1     PLD
            TSC
            CLC
            ADC   #$0008
            TCS
            RTL

L0209F9     TSC
            SEC
            SBC   #$014D
            TCS
            PHD
            TCD
            LDA   #$0001
            STA   $07
            STZ   $09
            LDA   #$0003
            STAL  L0400FA
            STAL  L040100
            PEA   ^L040034
            PEA   L040034
            PEA   $0000
            TDC
            CLC
            ADC   #$0025
            PHA
            JSL   L02AB57
            LDX   #$0151
            LDA   $00,X
            CMP   #$0003
            BEQ   L020A43
            PEA   ^L020FC6
            PEA   L020FC6
            PEA   $0000
            TDC
            CLC
            ADC   #$0025
            PHA
            JSL   L02AB0B
L020A43     PEA   $0000
            TDC
            CLC
            ADC   #$0025
            PHA
            JSL   L02AB8B
            STA   $23
            STZ   $05
L020A54     LDA   $23
            CMP   $05
            BEQ   L020A5C
            BCS   L020A5E
L020A5C     BRA   L020ABC
L020A5E     PEA   $0000
            TDC
            CLC
            ADC   #$0025
            PHA
            LDX   #$0000
            LDA   $05
            BPL   L020A6F
            DEX
L020A6F     PHX
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            LDA   [$01]
            AND   #$00FF
            CMP   #$0020
            BNE   L020AB8
            PEA   $0000
            TDC
            CLC
            ADC   #$0025
            PHA
            LDX   #$0000
            LDA   $05
            BPL   L020A9D
            DEX
L020A9D     PHX
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$2E
            STA   [$01]
            REP   #$20
L020AB8     INC   $05
            BRA   L020A54
L020ABC     LDX   #$0151
            LDA   $00,X
            LDX   #$0000
            CMP   #$0003
            BNE   L020ACA
            INX
L020ACA     TXA
            STA   $15
            PEA   ^L020FC9
            LDA   #L020FC9
            STA   $17
            PLA
            STA   $19
            TDC
            CLC
            ADC   #$0023
            LDX   #$0000
            STX   $1D
            STA   $1B
            PEA   ^L020FD7
            LDA   #L020FD7
            STA   $1F
            PLA
            STA   $21
L020AEF     LDA   $07
            BNE   L020AF6
            BRL   L020E34
L020AF6     LDX   #$0151
            LDA   $00,X
            BNE   L020B3B
            PEA   $004B
            PEA   $0028
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEI   $21
            PEI   $1F
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L040106
            PEA   L040106
            PEA   ^L02479D
            PEA   L02479D
            PEA   ^L0400F2
            PEA   L0400F2
            _SFPGetFile2
            STAL  L02B111
            BRA   L020B60
L020B3B     PEA   $004B
            PEA   $0028
            PEA   $0000
            PEI   $19
            PEI   $17
            PEA   $0000
            PEI   $1D
            PEI   $1B
            PEA   ^L0400F2
            PEA   L0400F2
            _SFPutFile2
            STAL  L02B111
L020B60     LDAL  L0400F2
            BNE   L020B69
            BRL   L020E2E
L020B69     LDAL  L0400FE
            TAX
            LDAL  L0400FC
            STAL  L030005
            TXA
            STAL  L030007
            LDAL  L030007
            TAX
            LDAL  L030005
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STAL  L030009
            TXA
            STAL  L03000B
            LDA   $15
            BNE   L020BA0
            BRL   L020D5B
L020BA0     LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            LDA   #$0001
            LDX   #$0124
            STA   $00,X
            LDAL  L03000B
            TAX
            LDAL  L030009
            CLC
            ADC   #$0002
            BCC   L020BE2
            INX
L020BE2     TXY
            LDX   #$0126
            STA   $00,X
            TYA
            STA   $02,X
            LDA   #$00C3
            LDX   #$012A
            STA   $00,X
            LDA   #$0006
            LDX   #$012C
            STA   $00,X
            LDAL  L03003B
            TAX
            LDAL  L030039
            JSL   L02BB54
            PEA   $3FF9
            PEA   $9F5B
            PEA   $A979
            PEA   $3B31
            PEA   $F000
            JSL   L02BF65
            JSL   L02BBB7
            TXY
            LDX   #$012E
            STA   $00,X
            STY   $02,X
            PEA   $2002
            PEA   $0000
            TDC
            CLC
            ADC   #$0124
            PHA
            JSL   L02A4D6
            LDA   #$0004
            LDX   #$0124
            STA   $00,X
            PEA   $2001
            PEA   $0000
            TDC
            CLC
            ADC   #$0124
            PHA
            JSL   L02A4D6
            LDA   #$0004
            LDX   #$0132
            STA   $00,X
            LDAL  L03000B
            TAX
            LDAL  L030009
            CLC
            ADC   #$0002
            BCC   L020C67
            INX
L020C67     TXY
            LDX   #$0136
            STA   $00,X
            TYA
            STA   $02,X
            LDA   #$0002
            LDX   #$013A
            STA   $00,X
            LDX   #$013C
            STZ   $00,X
            PEA   $2010
            PEA   $0000
            TDC
            CLC
            ADC   #$0132
            PHA
            JSL   L02A4D6
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L020C9F
            JSL   L0250E2
            BRL   L020FB0
L020C9F     LDA   #$0004
            LDX   #$013E
            STA   $00,X
            LDX   #$0134
            LDA   $00,X
            LDX   #$0140
            STA   $00,X
            LDAL  L030029
            TAX
            LDAL  L030027
            TXY
            LDX   #$0142
            STA   $00,X
            STY   $02,X
            LDAL  L030023
            TAX
            LDAL  L030021
            TXY
            LDX   #$0146
            STA   $00,X
            STY   $02,X
            PEA   $2013
            PEA   $0000
            TDC
            CLC
            ADC   #$013E
            PHA
            JSL   L02A4D6
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L020D0D
            JSL   L0250E2
            LDA   #$0001
            LDX   #$013E
            STA   $00,X
            PEA   $2014
            PEA   $0000
            TDC
            CLC
            ADC   #$013E
            PHA
            JSL   L02A4D6
            BRL   L020FB0
L020D0D     LDX   #$0142	; write suffix
            LDA   #L040000
            STA   $00,X
            LDA   #^L040000
            STA   $02,X

            LDX   #$0146
*            LDA   #$0033
*            STA   $00,X
	lda	L030021
	and	#$ff
	sta	$00,x
	lda	#256
	sec
	sbc	$00,x
	sta	$00,x

            LDA   #$0000
            STA   $02,X
            PEA   $2013
            PHA
            TDC
            CLC
            ADC   #$013E
            PHA
            JSL   L02A4D6
            LDA   #$0001
            LDX   #$013E
            STA   $00,X
            PEA   $2014
            PEA   $0000
            TDC
            CLC
            ADC   #$013E
            PHA
            JSL   L02A4D6
            LDAL  L030019
            AND   #$00FE
            STAL  L030019
            BRL   L020FB0

L020D5B     PEA   $0000
            PEA   $0003
            PEA   $00D8
            PEA   $00C3
            LDAL  L03000B
            PHA
            LDAL  L030009
            CLC
            ADC   #$0002
            BCC   L020D79
            PLX
            INX
            PHX
L020D79     PHA
            _CreateResourceFile
            STAL  L02B111
            JSL   L02AE36
            STAL  L03002B
            TAX
            BNE   L020D93
            BRL   L020E2A
L020D93     LDAL  L03002B
            CMP   #$0070
            BEQ   L020DD6
            LDAL  L03002B
            CMP   #$1E01
            BEQ   L020DD6
            JSL   L0250E2
            LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            BRL   L020FB0
L020DD6     LDX   #$0151
            LDA   $00,X
            BEQ   L020E26
            PHA
            PEA   $0005
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0005
            _AlertWindow
            STAL  L02B111
            PLA
            LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            BRL   L020FB0
L020E26     STZ   $07
            BRA   L020E2C
L020E2A     STZ   $07
L020E2C     BRA   L020E31
L020E2E     BRL   L020FB0
L020E31     BRL   L020AEF
L020E34     PHA
            PEA   $8003
            PEA   $0000
            PEA   $0000
            LDAL  L03000B
            PHA
            LDAL  L030009
            CLC
            ADC   #$0002
            BCC   L020E50
            PLX
            INX
            PHX
L020E50     PHA
            _OpenResourceFile
            STAL  L02B111
            PLA
            STA   $13
            PHA
            PHA
            PEA   $FFFF
            PEA   $8024
            _UniqueResourceID
            STAL  L02B111
            PLA
            STA   $0F
            PLA
            STA   $11
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            PEA   $0000
            PEA   $8024
            PEI   $11
            PEI   $0F
            _AddResource
            STAL  L02B111
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L020EE4
            JSL   L0250E2
            PEA   $8024
            PEI   $11
            PEI   $0F
            _DetachResource
            STAL  L02B111
            PEI   $13
            _CloseResourceFile
            STAL  L02B111
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L020EE1
            LDA   $13
            ORA   #$8000
            PHA
            _CloseResourceFile
            STAL  L02B111
L020EE1     BRL   L020F86
L020EE4     PEA   $8024
            PEI   $11
            PEI   $0F
            PEA   ^L040034
            PEA   L040034
            JSL   L02A628
            PHX
            PHA
            _RMSetResourceName
            STAL  L02B111
            PEI   $13
            _UpdateResourceFile
            STAL  L02B111
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L020F21
            PEA   $0003
            JSL   L024DB6
L020F21     PEA   $8024
            PEI   $11
            PEI   $0F
            _DetachResource
            STAL  L02B111
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L020F45
            PEA   $0004
            JSL   L024DB6
L020F45     PEI   $13
            _CloseResourceFile
            STAL  L02B111
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L020F64
            PEA   $0005
            JSL   L024DB6
L020F64     LDAL  L03000B
            PHA
            LDAL  L030009
            CLC
            ADC   #$0002
            BCC   L020F76
            PLX
            INX
            PHX
L020F76     PHA
            JSL   L0251FD
            LDAL  L030019
            AND   #$00FE
            STAL  L030019
L020F86     LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
L020FB0     LDX   #$014E
            LDA   $00,X
            LDY   $01,X
            LDX   #$0150
            STA   $00,X
            STY   $01,X
            PLD
            TSC
            CLC
            ADC   #$014F
            TCS
            RTL

L020FC6     ASC   '.r'00
L020FC9     STR   'Save Where? '
            DB    $00
L020FD7     STR   'Append to what file?'
            DB    $00

L020FED     TSC
            SEC
            SBC   #$0004
            TCS
            PHD
            TCD
            LDAL  L030019
            AND   #$0001
            BEQ   L021001
            BRL   L0210DD
L021001     LDAL  L030019
            AND   #$0002
            BNE   L02100D
            BRL   L0210DD
L02100D     LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L030019
            AND   #$00FC
            STAL  L030019
            PEA   $0115
            _DisableMItem
            STAL  L02B111
            PEA   $0113
            _DisableMItem
            STAL  L02B111
            PEA   $0114
            _DisableMItem
            STAL  L02B111
            PEA   $0112
            _DisableMItem
            STAL  L02B111
            PEA   $0104
            _DisableMItem
            STAL  L02B111
            PEA   $010E
            _DisableMItem
            STAL  L02B111
            PEA   $010A
            _DisableMItem
            STAL  L02B111
            PEA   $010B
            _DisableMItem
            STAL  L02B111
            PEA   $0119
            _DisableMItem
            STAL  L02B111
            PEA   $010C
            _DisableMItem
            STAL  L02B111
            PEA   $010D
            _DisableMItem
            STAL  L02B111
            PEA   $0109
            _DisableMItem
            STAL  L02B111
            LDA   #$0001
            STA   $01
            BRL   L0211FC
L0210DD     LDAL  L030019
            AND   #$0002
            BNE   L0210E9
            BRL   L0211F7
L0210E9     PHA
            PEA   $0005
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0003
            _AlertWindow
            STAL  L02B111
            PLA
            STA   $03
            LDA   $03
            BNE   L021110
            STZ   $01
            BRL   L0211FC
L021110     LDA   $03
            CMP   #$0001
            BEQ   L02111A
            BRL   L0211E9
L02111A     LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L030019
            AND   #$00FC
            STAL  L030019
            PEA   $0115
            _DisableMItem
            STAL  L02B111
            PEA   $0113
            _DisableMItem
            STAL  L02B111
            PEA   $0114
            _DisableMItem
            STAL  L02B111
            PEA   $0112
            _DisableMItem
            STAL  L02B111
            PEA   $0104
            _DisableMItem
            STAL  L02B111
            PEA   $010E
            _DisableMItem
            STAL  L02B111
            PEA   $010A
            _DisableMItem
            STAL  L02B111
            PEA   $010B
            _DisableMItem
            STAL  L02B111
            PEA   $0119
            _DisableMItem
            STAL  L02B111
            PEA   $010C
            _DisableMItem
            STAL  L02B111
            PEA   $010D
            _DisableMItem
            STAL  L02B111
            PEA   $0109
            _DisableMItem
            STAL  L02B111
            LDA   #$0002
            STA   $01
            BRA   L0211FC
L0211E9     PEA   $0001
            JSL   L0209F9
            LDA   #$0001
            STA   $01
            BRA   L0211FC
L0211F7     LDA   #$0001
            STA   $01
L0211FC     LDY   $01
            PLD
            TSC
            CLC
            ADC   #$0004
            TCS
            TYA
            RTL

L021207     TSC
            SEC
            SBC   #$0076
            TCS
            PHD
            TCD
            JSL   L020FED
            TAX
            BEQ   L021219
            LDA   #$0001
L021219     EOR   #$0001
            BEQ   L021221
            BRL   L021688
L021221     STZ   $09
            PEA   ^L021690
            LDA   #L021690
            STA   $0D
            PLA
            STA   $0F
L02122E     LDA   #$0003
            STAL  L0400FA
            STAL  L040100
            PEA   $004B
            PEA   $0028
            PEA   $0000
            PEI   $0F
            PEI   $0D
            PEA   ^L024836
            PEA   L024836
            PEA   $0000
            PEA   $0000
            PEA   ^L0400F2
            PEA   L0400F2
            _SFGetFile2
            STAL  L02B111
            LDAL  L0400F2
            BNE   L02126C
            BRL   L021681
L02126C     LDAL  L0400FE
            TAX
            LDAL  L0400FC
            STAL  L030005
            TXA
            STAL  L030007
            LDAL  L030007
            TAX
            LDAL  L030005
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STAL  L030009
            TXA
            STAL  L03000B
            LDA   #$0007
            STAL  L0400B8
            LDAL  L03000B
            TAX
            LDAL  L030009
            CLC
            ADC   #$0002
            BCC   L0212B3
            INX
L0212B3     STA   $13
            STX   $15
            LDX   $15
            LDA   $13
            STAL  L0400BC
            TXA
            STAL  L0400BE
            LDA   [$13]
            STA   $11
            LDX   #$0000
            CMP   #$0045
            BCC   L0212D3
            BEQ   L0212D3
            INX
L0212D3     TXA
            BNE   L0212DA
            LDA   $11
            BRA   L0212DD
L0212DA     LDA   #$0045
L0212DD     STA   $0B
            LDX   #$0000
            TAY
            BPL   L0212E6
            DEX
L0212E6     PHX
            PHA
            LDAL  L03000B
            PHA
            LDAL  L030009
            CLC
            ADC   #$0004
            BCC   L0212FA
            PLX
            INX
            PHX
L0212FA     PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0031
            PHA
            JSL   L02AC0F
            PEA   $0000
            TDC
            CLC
            ADC   #$0031
            PHA
            LDX   #$0000
            LDA   $0B
            BPL   L021319
            DEX
L021319     PHX
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$00
            STA   [$01]
            REP   #$20
            LDA   #$0001
            STAL  L0400C0
            DEC
            STAL  L0400C2
            PEA   $2010
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L02135F
            PEA   $0019
            JSL   L024DB6
L02135F     LDAL  L0400C6
            CMP   #$0006
            BNE   L021395
            LDAL  L0400CA
            TAX
            LDAL  L0400C8
            JSL   L02BB54
            PEA   $4004
            PEA   $CD9F
            PEA   $F972
            PEA   $4745
            PEA   $3800
            JSL   L02BF65
            JSL   L02BBB7
            STAL  L030039
            TXA
            STAL  L03003B
L021395     LDAL  L03003B
            PHA
            LDAL  L030039
            PHA
            LDA   #$0190
            LDX   #$0000
            TAY
            TXA
            INX
            CMP   $03,S
            BNE   L0213AF
            TYA
            CMP   $01,S
L0213AF     BEQ   L0213B3
            BCS   L0213B4
L0213B3     DEX
L0213B4     PLA
            PLA
            TXA
            BEQ   L0213D8
            LDAL  L030011
            TAX
            LDAL  L03000F
            STA   $01
            STX   $03
            LDA   [$01]
            LDX   #$0000
            TAY
            BPL   L0213CF
            DEX
L0213CF     STAL  L030039
            TXA
            STAL  L03003B
L0213D8     LDA   #$0002
            STA   $17
            LDAL  L0400BA
            STA   $19
            STA   $21
            PEA   $2019
            PEA   $0000
            TDC
            CLC
            ADC   #$0017
            PHA
            JSL   L02A4D6
            PEI   $1D
            PEI   $1B
            LDA   $01,S
            STAL  L0400E2
            LDA   $03,S
            STAL  L0400E4
            LDA   $01,S
            STA   $27
            LDA   $03,S
            STA   $29
            PLA
            STAL  L030021
            PLA
            STAL  L030023
            LDAL  L030019
            AND   #$0008
            TAX
            BEQ   L021424
            LDA   #$0001
L021424     EOR   #$0001
            BEQ   L021437
            PEA   $0109
            _EnableMItem
            STAL  L02B111
L021437     PEA   $010A
            _EnableMItem
            STAL  L02B111
            PEA   $010B
            _EnableMItem
            STAL  L02B111
            PEA   $0119
            _EnableMItem
            STAL  L02B111
            PEA   $010C
            _EnableMItem
            STAL  L02B111
            PEA   $010D
            _EnableMItem
            STAL  L02B111
            PHA
            PHA
            LDAL  L0400E4
            PHA
            LDAL  L0400E2
            CLC
            ADC   #$000A
            BCC   L021491
            PLX
            INX
            PHX
L021491     PHA
            LDAL  L030035
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            STAL  L02B111
            PLA
            STAL  L03002D
            PLA
            STAL  L03002F
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L0214EB
            LDAL  L03002B
            CMP   #$0201
            BNE   L0214D0
            LDA   #$0086
            STAL  L03002B
L0214D0     JSL   L0250E2
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            BRL   L021688
L0214EB     LDAL  L03002F
            TAX
            LDAL  L03002D
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STX   $07
            STA   $05
            PEA   $0000
            DEY
            PLA
            SEP   #$20
            STA   [$05],Y
            REP   #$20
            AND   #$00FF
            SEP   #$20
            STA   [$05]
            REP   #$20
            PEI   $07
            LDA   $05
            CLC
            ADC   #$000A
            BCC   L021525
            PLX
            INX
            PHX
L021525     PHA
            LDA   $01,S
            STA   $23
            LDA   $03,S
            STA   $25
            PLA
            STAL  L030027
            PLA
            STAL  L030029
            LDAL  L0400E4
            PHA
            LDAL  L0400E2
            PHA
            PEA   $0000
            PEA   $0008
            JSL   L02B0CB
            PLA
            AND   #$FFFF
            PHA
            LDA   $03,S
            AND   #$0000
            STA   $03,S
            PLA
            PLX
            STAL  L030025
            LDAL  L030025
            TAX
            BEQ   L021568
            LDA   #$0001
L021568     EOR   #$0001
            BEQ   L021574
            LDA   #$0001
            STAL  L030025
L021574     LDA   #$0004
            STA   $1F
            PEA   $2012
            PEA   $0000
            TDC
            CLC
            ADC   #$001F
            PHA
            JSL   L02A4D6
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            SEC
            LDA   $01,S
            SBC   #$0001
            STA   $01,S
            BCS   L0215A2
            LDA   $03,S
            DEC
            STA   $03,S
L0215A2     LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$00
            STA   [$01]
            REP   #$20
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L0215D7
            PEA   $001A
            JSL   L024DB6
L0215D7     LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            LDAL  L030019
            AND   #$0004
            TAX
            BEQ   L021622
            LDA   #$0001
L021622     EOR   #$0001
            BEQ   L021674
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0FFA
            PEA   $800E
            _NewWindow2
            STAL  L02B111
            PLA
            STAL  L030001
            PLA
            STAL  L030003
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L021674
            PEA   $001B
            JSL   L024DB6
L021674     PEA   $0000
            TDC
            CLC
            ADC   #$0031
            PHA
            JSL   L025455
L021681     LDA   $09
            BEQ   L021688
            BRL   L02122E
L021688     PLD
            TSC
            CLC
            ADC   #$0076
            TCS
            RTL

L021690     STR  'Whadya Want? '
            DB   $00

L02169F     TSC
            SEC
            SBC   #$00CA
            TCS
            PHD
            TCD
            JSL   L020FED
            TAX
            BEQ   L0216B1
            LDA   #$0001
L0216B1     EOR   #$0001
            BEQ   L0216B9
            BRL   L022009
L0216B9     LDA   #$0061
            SEP   #$20
            STA   $61
            REP   #$20
            AND   #$00FF
            SEP   #$20
            STA   $2A
            REP   #$20
            PEA   ^L022011
            LDA   #L022011
            STA   $2B
            PLA
            STA   $2D
L0216D6     LDA   #$0003
            STAL  L0400FA
            STAL  L040100
            SEP   #$20
            LDA   $2A
            STA   $59
            REP   #$20
            STZ   $12
            PEA   $004B
            PEA   $0028
            PEA   $0000
            PEI   $2D
            PEI   $2B
            PEA   ^L024836
            PEA   L024836
            PEA   $0000
            PEA   $0000
            PEA   ^L0400F2
            PEA   L0400F2
            _SFGetFile2
            STAL  L02B111
            LDAL  L0400F2
            BNE   L02171E
            BRL   L021FCD
L02171E     LDAL  L0400FE
            TAX
            LDAL  L0400FC
            STAL  L030005
            TXA
            STAL  L030007
            LDAL  L030007
            TAX
            LDAL  L030005
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STAL  L030009
            TXA
            STAL  L03000B
            LDA   #$0007
            STAL  L0400B8
            LDAL  L03000B
            TAX
            LDAL  L030009
            CLC
            ADC   #$0002
            BCC   L021765
            INX
L021765     STA   $31
            STX   $33
            LDX   $33
            LDA   $31
            STAL  L0400BC
            TXA
            STAL  L0400BE
            LDA   [$31]
            STA   $2F
            LDX   #$0000
            CMP   #$0045
            BCC   L021785
            BEQ   L021785
            INX
L021785     TXA
            BNE   L02178C
            LDA   $2F
            BRA   L02178F
L02178C     LDA   #$0045
L02178F     STA   $14
            PEA   $0000
            PHA
            LDAL  L03000B
            PHA
            LDAL  L030009
            CLC
            ADC   #$0004
            BCC   L0217A7
            PLX
            INX
            PHX
L0217A7     PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0085
            PHA
            JSL   L02AC0F
            PEA   $0000
            TDC
            CLC
            ADC   #$0085
            PHA
            LDX   #$0000
            LDA   $14
            BPL   L0217C6
            DEX
L0217C6     PHX
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$00
            STA   [$01]
            REP   #$20
            LDA   #$0001
            STAL  L0400C0
            DEC
            STAL  L0400C2
            PEA   $2010
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L02180C
            PEA   $012D
            JSL   L024DB6
L02180C     LDAL  L0400BA
            STA   $49
            LDA   #$0004
            STA   $47
            STZ   $4D
            TDC
            CLC
            ADC   #$0059
            STA   $4B
            LDA   #$0008
            STA   $4F
            LDA   #$0000
            STA   $51
            PEA   $2012
            PHA
            TDC
            CLC
            ADC   #$0047
            PHA
            JSL   L02A4D6
            STZ   $4D
            TDC
            CLC
            ADC   #$0061
            STA   $4B
            LDA   #$0024
            STA   $4F
            LDA   #$0000
            STA   $51
            PEA   $2012
            PHA
            TDC
            CLC
            ADC   #$0047
            PHA
            JSL   L02A4D6
            PEA   $0000
            PEA   $0004
            PEA   ^L022020
            PEA   L022020
            PEA   $0000
            TDC
            CLC
            ADC   #$0059
            PHA
            JSL   L02ABAF
            TAX
            BNE   L0218D0
            PEA   $0000
            PEA   $0004
            PEA   ^L022025
            PEA   L022025
            PEA   $0000
            TDC
            CLC
            ADC   #$0061
            PHA
            JSL   L02ABAF
            TAX
            BNE   L0218D0
            PEA   $0000
            PEA   $0004
            PEA   ^L02202A
            PEA   L02202A
            PEA   $0000
            TDC
            CLC
            ADC   #$0065
            PHA
            JSL   L02ABAF
            TAX
            BNE   L0218D0
            PEA   $0000
            PEA   $0004
            PEA   ^L02202F
            PEA   L02202F
            PEA   $0000
            TDC
            CLC
            ADC   #$007D
            PHA
            JSL   L02ABAF
            TAX
            BNE   L0218D0
            LDA   $6D
            CMP   #$0001
            BEQ   L0218F1
L0218D0     PHA
            PEA   $0005
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0008
            _AlertWindow
            STAL  L02B111
            PLA
            STA   $12
            BRL   L022002
L0218F1     LDX   $73
            LDA   $71
            STAL  L030039
            TXA
            STAL  L03003B
            LDA   $79
            CMP   #$0001
            BEQ   L021908
            BRL   L021A86
L021908     PEI   $83
            PEI   $81
            LDA   $01,S
            STA   $4F
            LDA   $03,S
            STA   $51
            PLA
            STAL  L030021
            PLA
            STAL  L030023
            PHA
            PHA
            LDAL  L030023
            PHA
            LDAL  L030021
            CLC
            ADC   #$000A
            BCC   L021932
            PLX
            INX
            PHX
L021932     PHA
            LDAL  L030035
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            STAL  L02B111
            PLA
            STAL  L03002D
            PLA
            STAL  L03002F
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L02198C
            LDAL  L03002B
            CMP   #$0201
            BNE   L021971
            LDA   #$0086
            STAL  L03002B
L021971     JSL   L0250E2
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            BRL   L022009
L02198C     _WaitCursor
            STAL  L02B111
            LDAL  L03002F
            TAX
            LDAL  L03002D
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STX   $07
            STA   $05
            PEA   $0000
            DEY
            PLA
            SEP   #$20
            STA   [$05],Y
            REP   #$20
            AND   #$00FF
            SEP   #$20
            STA   [$05]
            REP   #$20
            PEI   $07
            LDA   $05
            CLC
            ADC   #$000A
            BCC   L0219D1
            PLX
            INX
            PHX
L0219D1     PHA
            LDA   $01,S
            STA   $4B
            LDA   $03,S
            STA   $4D
            PLA
            STAL  L030027
            PLA
            STAL  L030029
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            PEA   $0000
            PEA   $0008
            JSL   L02B0CB
            PLA
            AND   #$FFFF
            PHA
            LDA   $03,S
            AND   #$0000
            STA   $03,S
            PLA
            PLX
            STAL  L030025
            LDAL  L030025
            TAX
            BEQ   L021A14
            LDA   #$0001
L021A14     EOR   #$0001
            BEQ   L021A20
            LDA   #$0001
            STAL  L030025
L021A20     LDA   #$0004
            STA   $47
            PEA   $2012
            PEA   $0000
            TDC
            CLC
            ADC   #$0047
            PHA
            JSL   L02A4D6
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            SEC
            LDA   $01,S
            SBC   #$0001
            STA   $01,S
            BCS   L021A4E
            LDA   $03,S
            DEC
            STA   $03,S
L021A4E     LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$00
            STA   [$01]
            REP   #$20
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L021A83
            PEA   $012C
            JSL   L024DB6
L021A83     BRL   L021ED8
L021A86     LDA   $6F
            CMP   #$0002
            BNE   L021AAD
            PHA
            PEA   $0005
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0007
            _AlertWindow
            STAL  L02B111
            PLA
            STA   $12
            BRA   L021AB2
L021AAD     LDA   #$0004
            STA   $12
L021AB2     LDA   $79
            CMP   #$0002
            BNE   L021AD3
            PEI   $83
            PEI   $81
            PEA   $0000
            PEA   $0001
            JSL   L02B0CB
            PLA
            STAL  L030021
            PLA
            STAL  L030023
            BRA   L021AEB
L021AD3     PEI   $83
            PEI   $81
            PEA   $0000
            PEA   $0002
            JSL   L02B0CB
            PLA
            STAL  L030021
            PLA
            STAL  L030023
L021AEB     PHA
            PHA
            PEA   $0000
            PEA   $1000
            LDA   $01,S
            STA   $1E
            LDA   $03,S
            STA   $20
            LDAL  L030035
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            STAL  L02B111
            PLA
            STA   $26
            PLA
            STA   $28
            PHA
            PHA
            LDAL  L030023
            PHA
            LDAL  L030021
            CLC
            ADC   #$000A
            BCC   L021B2E
            PLX
            INX
            PHX
L021B2E     PHA
            LDAL  L030035
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            STAL  L02B111
            PLA
            STAL  L03002D
            PLA
            STAL  L03002F
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L021B9F
            LDAL  L03002B
            CMP   #$0201
            BNE   L021B6D
            LDA   #$0086
            STAL  L03002B
L021B6D     JSL   L0250E2
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
            STZ   $12
            BRL   L022009
L021B9F     _WaitCursor
            STAL  L02B111
            LDAL  L03002F
            TAX
            LDAL  L03002D
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STX   $07
            STA   $05
            PEA   $0000
            DEY
            PLA
            SEP   #$20
            STA   [$05],Y
            REP   #$20
            AND   #$00FF
            SEP   #$20
            STA   [$05]
            REP   #$20
            LDY   #$000A
            LDX   $07
            TYA
            CLC
            ADC   $05
            BCC   L021BE3
            INX
L021BE3     STAL  L030027
            PHA
            TXA
            STAL  L030029
            PLA
            STX   $0B
            STA   $09
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            PEA   $0000
            PEA   $0008
            JSL   L02B0CB
            PLA
            AND   #$FFFF
            PHA
            LDA   $03,S
            AND   #$0000
            STA   $03,S
            PLA
            PLX
            STAL  L030025
            LDAL  L030025
            TAX
            BEQ   L021C22
            LDA   #$0001
L021C22     EOR   #$0001
            BEQ   L021C2E
            LDA   #$0001
            STAL  L030025
L021C2E     PEA   $0000
            PEA   $0000
            LDA   $01,S
            STA   $1A
            LDA   $03,S
            STA   $1C
            LDA   $01,S
            STA   $22
            LDA   $03,S
            STA   $24
            PLA
            PLX
            STA   $18
            LDA   #$0001
            STA   $16
            LDA   #$0004
            STA   $47
            LDY   #$0002
            LDA   [$26],Y
            TAX
            LDA   [$26]
            STX   $37
            STA   $35
L021C5E     PEI   $83
            PEI   $81
            SEC
            PLA
            SBC   $22
            PHA
            LDA   $03,S
            SBC   $24
            STA   $03,S
            LDA   #$1000
            LDX   #$0000
            TAY
            TXA
            INX
            CMP   $03,S
            BNE   L021C7D
            TYA
            CMP   $01,S
L021C7D     BCS   L021C80
            DEX
L021C80     PLA
            PLA
            TXA
            BEQ   L021C94
            SEC
            LDA   $81
            SBC   $22
            STA   $1E
            LDA   $83
            SBC   $24
            STA   $20
            INC   $18
L021C94     PEI   $37
            PEI   $35
            LDA   $01,S
            STA   $0D
            LDA   $03,S
            STA   $0F
            PLA
            STA   $4B
            PLA
            STA   $4D
            LDA   $1E
            LDX   $20
            STA   $4F
            STX   $51
            PEA   $2012
            PEA   $0000
            TDC
            CLC
            ADC   #$0047
            PHA
            JSL   L02A4D6
            JSL   L02AE36
            STAL  L03002B
            LDAL  L03002B
            CMP   #$004C
            BNE   L021CD4
            STZ   $16
            BRL   L021E9A
L021CD4     LDAL  L03002B
            BEQ   L021D19
            JSL   L0250E2
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
            PEI   $28
            PEI   $26
            _DisposeHandle
            STAL  L02B111
            BRL   L022009
L021D19     CLC
            LDA   $1E
            ADC   $22
            STA   $22
            LDA   $20
            ADC   $24
            STA   $24
            LDA   $12
            LDX   #$0000
            CMP   #$0004
            BNE   L021D31
            INX
L021D31     TXA
            STA   $39
            LDY   #$0002
            LDA   [$26],Y
            TAX
            LDA   [$26]
            STX   $3D
            STA   $3B
            LDA   $12
            LDX   #$0000
            CMP   #$0002
            BNE   L021D4B
            INX
L021D4B     TXA
            STA   $3F
            LDA   $12
            LDX   #$0000
            CMP   #$0001
            BNE   L021D59
            INX
L021D59     TXA
            STA   $41
            LDA   $12
            LDX   #$0000
            CMP   #$0001
            BNE   L021D67
            INX
L021D67     TXA
            STA   $43
            LDA   $12
            TAX
            BEQ   L021D72
            LDA   #$0001
L021D72     EOR   #$0001
            STA   $45
L021D77     INC   $1A
            BNE   L021D7D
            INC   $1C
L021D7D     LDA   $39
            BEQ   L021D92
            LDY   #$0001
            LDA   [$0D],Y
            AND   #$00FF
            SEP   #$20
            STA   $11
            REP   #$20
            BRL   L021E2C
L021D92     LDA   $79
            CMP   #$0002
            BNE   L021DDA
            LDA   $45
            BEQ   L021DAA
            LDA   [$0D]
            AND   #$00FF
            SEP   #$20
            STA   $11
            REP   #$20
            BRA   L021DD8
L021DAA     LDA   $43
            BEQ   L021DBE
            LDY   #$0001
            LDA   [$0D],Y
            AND   #$00FF
            SEP   #$20
            STA   $11
            REP   #$20
            BRA   L021DD8
L021DBE     LDA   [$0D]
            AND   #$00FF
            LSR
            PHA
            LDY   #$0001
            LDA   [$0D],Y
            AND   #$00FF
            LSR
            CLC
            ADC   $01,S
            PLX
            SEP   #$20
            STA   $11
            REP   #$20
L021DD8     BRA   L021E2C
L021DDA     LDY   #$0001
            LDA   [$0D],Y
            AND   #$00FF
            SEP   #$20
            STA   $11
            REP   #$20
            CLC
            LDA   $0D
            ADC   #$0002
            STA   $0D
            BCC   L021DF4
            INC   $0F
L021DF4     INC   $1A
            BNE   L021DFA
            INC   $1C
L021DFA     LDA   $41
            BEQ   L021E0E
            LDY   #$0001
            LDA   [$0D],Y
            AND   #$00FF
            SEP   #$20
            STA   $11
            REP   #$20
            BRA   L021E2C
L021E0E     LDA   $3F
            BEQ   L021E2C
            LDA   $11
            AND   #$00FF
            LSR
            PHA
            LDY   #$0001
            LDA   [$0D],Y
            AND   #$00FF
            LSR
            CLC
            ADC   $01,S
            PLX
            SEP   #$20
            STA   $11
            REP   #$20
L021E2C     CLC
            LDA   $0D
            ADC   #$0002
            STA   $0D
            BCC   L021E38
            INC   $0F
L021E38     LDA   $11
            AND   #$00FF
            TAX
            BEQ   L021E43
            LDA   #$0001
L021E43     EOR   #$0001
            BEQ   L021E4E
            SEP   #$20
            INC   $11
            REP   #$20
L021E4E     SEP   #$20
            LDA   $11
            STA   [$09]
            REP   #$20
            INC   $09
            BNE   L021E5C
            INC   $0B
L021E5C     PEA   $0000
            PEA   $1000
            PEI   $0F
            PEI   $0D
            SEC
            PLA
            SBC   $3B
            PHA
            LDA   $03,S
            SBC   $3D
            STA   $03,S
            JSL   L02C444
            BEQ   L021E7A
            BRL   L021D77
L021E7A     LDA   $18
            TAX
            BEQ   L021E82
            LDA   #$0001
L021E82     EOR   #$0001
            CMP   #$0000
            BEQ   L021E94
            LDA   $16
            CMP   #$0000
            BEQ   L021E94
            LDA   #$0001
L021E94     TAX
            BEQ   L021E9A
            BRL   L021C5E
L021E9A     STZ   $12
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            SEC
            LDA   $01,S
            SBC   #$0001
            STA   $01,S
            BCS   L021EB5
            LDA   $03,S
            DEC
            STA   $03,S
L021EB5     LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$00
            STA   [$01]
            REP   #$20
L021ED8     LDAL  L030019
            AND   #$0008
            TAX
            BEQ   L021EE5
            LDA   #$0001
L021EE5     EOR   #$0001
            BEQ   L021EF8
            PEA   $0109
            _EnableMItem
            STAL  L02B111
L021EF8     PEA   $010A
            _EnableMItem
            STAL  L02B111
            PEA   $010B
            _EnableMItem
            STAL  L02B111
            PEA   $0119
            _EnableMItem
            STAL  L02B111
            PEA   $010C
            _EnableMItem
            STAL  L02B111
            PEA   $010D
            _EnableMItem
            STAL  L02B111
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            LDAL  L030019
            AND   #$0004
            TAX
            BEQ   L021F5F
            LDA   #$0001
L021F5F     EOR   #$0001
            BEQ   L021FB1
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0FFA
            PEA   $800E
            _NewWindow2
            STAL  L02B111
            PLA
            STAL  L030001
            PLA
            STAL  L030003
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L021FB1
            PEA   $001B
            JSL   L024DB6
L021FB1     PEA   $0000
            TDC
            CLC
            ADC   #$0085
            PHA
            JSL   L025455
            PEI   $28
            PEI   $26
            _DisposeHandle
            STAL  L02B111
L021FCD     LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            _InitCursor
            STAL  L02B111
L022002     LDA   $12
            BEQ   L022009
            BRL   L0216D6
L022009     PLD
            TSC
            CLC
            ADC   #$00CA
            TCS
            RTL

L022011     STR   'Whadya Want? '
            DB    $00
	
L022020     ASC   'RIFF'00
L022025     ASC   'WAVE'00
L02202A     ASC   'fmt '00
L02202F     ASC   'data'00

L022034     TSC
            SEC
            SBC   #$0004
            TCS
            PHD
            TCD
            PEI   $0A
            PEI   $08
            PEA   $0000
            PEA   $0018
            JSL   L02B0CB
            PEI   $0A
            PEI   $08
            PEA   $0000
            PEA   $0018
            JSL   L02C9F7
            PLA
            ORA   $03,S
            STA   $03,S
            PLA
            ORA   $03,S
            STA   $03,S
            PEI   $0A
            LDA   $08
            AND   #$FF00
            PHA
            LDA   $03,S
            AND   #$0000
            STA   $03,S
            PEA   $0000
            PEA   $0008
            JSL   L02C9F7
            PLA
            ORA   $03,S
            STA   $03,S
            PLA
            ORA   $03,S
            STA   $03,S
            PEI   $0A
            LDA   $08
            AND   #$0000
            PHA
            LDA   $03,S
            AND   #$00FF
            STA   $03,S
            PEA   $0000
            PEA   $0008
            JSL   L02B0CB
            PLA
            ORA   $03,S
            STA   $03,S
            PLA
            ORA   $03,S
            STA   $03,S
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   $06
            STA   $0A
            LDA   $05
            STA   $09
            LDX   $03
            LDY   $01
            PLD
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            RTL

L0220C3     TSC
            SEC
            SBC   #$05DF
            TCS
            PHD
            TCD
            LDA   #$0009
            LDX   #$04FE
            STA   $00,X
            LDX   #$0500
            LDA   #$0003
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDA   #$006D
            LDX   #$0504
            STA   $00,X
            LDA   #$0028
            LDX   #$0506
            STA   $00,X
            LDA   #$007B
            LDX   #$0508
            STA   $00,X
            LDA   #$006E
            LDX   #$050A
            STA   $00,X
            LDX   #$050C
            LDA   #$0000
            STA   $00,X
            LDA   #$8000
            STA   $02,X
            LDA   #$0001
            LDX   #$0510
            STA   $00,X
            LDA   #$3000
            LDX   #$0512
            STA   $00,X
            LDX   #$0514
            LDA   #$0000
            STA   $00,X
            STA   $02,X
            PEA   ^L022DA3
            PEA   L022DA3
            LDX   #$0518
            PLA
            STA   $00,X
            PLA
            STA   $02,X
            LDX   #$051C
            LDA   #$0000
            STA   $00,X
            STA   $02,X
            SEP   #$20
            LDA   #$0D
            LDX   #$0520
            STA   $00,X
            LDA   #$8D
            INX
            STA   $00,X
            REP   #$20
            LDX   #$0522
            STZ   $00,X
            LDX   #$0524
            STZ   $00,X
            LDA   #$0009
            LDX   #$0526
            STA   $00,X
            LDX   #$0528
            LDA   #$0001
            STA   $00,X
            DEC
            STA   $02,X
            LDA   #$006C
            LDX   #$052C
            STA   $00,X
            LDA   #$015E
            LDX   #$052E
            STA   $00,X
            LDA   #$007C
            LDX   #$0530
            STA   $00,X
            LDA   #$01A4
            LDX   #$0532
            STA   $00,X
            LDX   #$0534
            LDA   #$0000
            STA   $00,X
            LDA   #$8000
            STA   $02,X
            LDX   #$0538
            STZ   $00,X
            LDA   #$3000
            LDX   #$053A
            STA   $00,X
            LDX   #$053C
            LDA   #$0001
            STA   $00,X
            DEC
            STA   $02,X
            PEA   ^L022DA9
            PEA   L022DA9
            LDX   #$0540
            PLA
            STA   $00,X
            PLA
            STA   $02,X
            LDX   #$0544
            LDA   #$0000
            STA   $00,X
            STA   $02,X
            SEP   #$20
            LDA   #$9B
            LDX   #$0548
            STA   $00,X
            LDA   #$1B
            INX
            STA   $00,X
            REP   #$20
            LDX   #$054A
            STZ   $00,X
            LDX   #$054C
            STZ   $00,X
            LDA   #$000E
            LDX   #$054E
            STA   $00,X
            LDX   #$0550
            LDA   #$0002
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDA   #$0014
            LDX   #$0554
            STA   $00,X
            LDX   #$0556
            STA   $00,X
            LDA   #$0064
            LDX   #$0558
            STA   $00,X
            LDA   #$019A
            LDX   #$055A
            STA   $00,X
            LDX   #$055C
            LDA   #$0000
            STA   $00,X
            LDA   #$8900
            STA   $02,X
            LDX   #$0560
            STZ   $00,X
            LDA   #$7400
            LDX   #$0562
            STA   $00,X
            LDX   #$0564
            LDA   #$0042
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDX   #$0568
            STZ   $00,X
            LDA   #$0008
            LDX   #$056A
            STA   $00,X
            LDA   #$0003
            LDX   #$056C
            STA   $00,X
            LDA   #$0001
            LDX   #$056E
            STA   $00,X
            LDX   #$0570
            DEC
            STA   $00,X
            STA   $02,X
            LDA   #$000A
            LDX   #$0574
            STA   $00,X
            LDA   #$0006
            LDX   #$0576
            STA   $00,X
            LDX   #$0578
            LDA   #$0000
            STA   $00,X
            STA   $02,X
            LDX   #$057C
            STA   $00,X
            STA   $02,X
            LDX   #$0580
            TDC
            CLC
            ADC   #$04FE
            STA   $00,X
            STZ   $02,X
            LDX   #$0584
            TDC
            CLC
            ADC   #$0526
            STA   $00,X
            STZ   $02,X
            LDX   #$0588
            TDC
            CLC
            ADC   #$054E
            STA   $00,X
            STZ   $02,X
            LDX   #$058C
            LDA   #$0000
            STA   $00,X
            STA   $02,X
            LDA   #$0050
            LDX   #$0590
            STA   $00,X
            LDA   #$0060
            LDX   #$0592
            STA   $00,X
            LDX   #$0594
            LDA   #$0000
            STA   $00,X
            STA   $02,X
            LDX   #$0598
            LDA   #$002A
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDA   #$000A
            LDX   #$059C
            STA   $00,X
            LDA   #$0014
            LDX   #$059E
            STA   $00,X
            LDA   #$0244
            LDX   #$05A0
            STA   $00,X
            LDA   #$00B4
            LDX   #$05A2
            STA   $00,X
            LDX   #$05A4
            LDA   #$0000
            STA   $00,X
            STA   $02,X
            LDX   #$05A8
            STZ   $00,X
            LDX   #$05AA
            STZ   $00,X
            LDX   #$05AC
            STZ   $00,X
            LDX   #$05AE
            STZ   $00,X
            LDX   #$05B0
            STZ   $00,X
            LDX   #$05B2
            STZ   $00,X
            LDX   #$05B4
            STZ   $00,X
            LDX   #$05B6
            STZ   $00,X
            LDX   #$05B8
            STZ   $00,X
            LDX   #$05BA
            STZ   $00,X
            LDX   #$05BC
            STA   $00,X
            STA   $02,X
            LDX   #$05C0
            STZ   $00,X
            LDX   #$05C2
            STA   $00,X
            STA   $02,X
            LDX   #$05C6
            STA   $00,X
            STA   $02,X
            LDX   #$05CA
            STA   $00,X
            STA   $02,X
            LDA   #$001E
            LDX   #$05CE
            STA   $00,X
            LDA   #$002D
            LDX   #$05D0
            STA   $00,X
            LDA   #$00AA
            LDX   #$05D2
            STA   $00,X
            LDA   #$020D
            LDX   #$05D4
            STA   $00,X
            LDX   #$05D6
            LDA   #$FFFF
            STA   $00,X
            STA   $02,X
            TDC
            CLC
            ADC   #$0580
            LDX   #$0000
            TXY
            LDX   #$05DA
            STA   $00,X
            STY   $02,X
            LDA   #$0003
            LDX   #$05DE
            STA   $00,X
            JSL   L020FED
            TAX
            BNE   L0223A2
            BRL   L022D9B
L0223A2     LDA   #$0003
            STAL  L0400FA
            STAL  L040100
            STZ   $0F
            PEA   $004B
            PEA   $0028
            PEA   $0000
            PEA   ^L022DB1
            PEA   L022DB1
            PEA   ^L024836
            PEA   L024836
            PEA   $0000
            PEA   $0000
            PEA   ^L0400F2
            PEA   L0400F2
            _SFGetFile2
            STAL  L02B111
            LDAL  L0400F2
            BNE   L0223E4
            BRL   L022D66
L0223E4     LDAL  L0400FE
            TAX
            LDAL  L0400FC
            STAL  L030005
            TXA
            STAL  L030007
            LDAL  L030007
            TAX
            LDAL  L030005
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STAL  L030009
            TXA
            STAL  L03000B
            LDA   #$0007
            STAL  L0400B8
            LDAL  L03000B
            TAX
            LDAL  L030009
            CLC
            ADC   #$0002
            BCC   L02242B
            INX
L02242B     STA   $3C
            STX   $3E
            LDX   $3E
            LDA   $3C
            STAL  L0400BC
            TXA
            STAL  L0400BE
            LDA   [$3C]
            STA   $3A
            LDX   #$0000
            CMP   #$0045
            BCC   L02244B
            BEQ   L02244B
            INX
L02244B     TXA
            BNE   L022452
            LDA   $3A
            BRA   L022455
L022452     LDA   #$0045
L022455     STA   $0D
            LDA   #$0001
            STAL  L0400C0
            DEC
            STAL  L0400C2
            PEA   $2010
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L022482
            PEA   $01F5
            JSL   L024DB6
L022482     LDAL  L0400BA
            LDX   #$03F6
            STA   $00,X
            LDX   #$03E4
            STA   $00,X
            LDA   #$0004
            LDX   #$03E2
            STA   $00,X
            LDX   #$03E6
            TDC
            CLC
            ADC   #$03FE
            STA   $00,X
            STZ   $02,X
            LDX   #$03EA
            LDA   #$0014
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            PEA   $2012
            PHA
            TDC
            CLC
            ADC   #$03E2
            PHA
            JSL   L02A4D6
            LDX   #$03E6
            TDC
            CLC
            ADC   #$0040
            STA   $00,X
            STZ   $02,X
            LDX   #$03EA
            LDA   #$03A2
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            PEA   $2012
            PHA
            TDC
            CLC
            ADC   #$03E2
            PHA
            JSL   L02A4D6
            LDA   #$0003
            LDX   #$03F4
            STA   $00,X
            LDX   #$03FA
            LDA   #$0438
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDX   #$03F8
            STZ   $00,X
            PEA   $2016
            PHA
            TDC
            CLC
            ADC   #$03F4
            PHA
            JSL   L02A4D6
            LDX   #$03E6
            TDC
            CLC
            ADC   #$0019
            STA   $00,X
            STZ   $02,X
            LDX   #$03EA
            LDA   #$0004
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            PEA   $2012
            PHA
            TDC
            CLC
            ADC   #$03E2
            PHA
            JSL   L02A4D6
            PEI   $1B
            PEI   $19
            LDA   #$2E4D
            LDX   #$2E4B
            LDY   #$0001
            CMP   $01,S
            BEQ   L022547
            DEY
L022547     TXA
            CMP   $03,S
            BEQ   L02254F
            LDY   #$0000
L02254F     PLA
            PLA
            TYA
            BNE   L022573
            PEI   $1B
            PEI   $19
            LDA   #$4C46
            LDX   #$3454
            LDY   #$0001
            CMP   $01,S
            BEQ   L022566
            DEY
L022566     TXA
            CMP   $03,S
            BEQ   L02256E
            LDY   #$0000
L02256E     PLA
            PLA
            TYA
            BEQ   L02258D
L022573     PEA   $0000
            PEA   $0000
            PEA   ^L022DC0
            PEA   L022DC0
            PEA   $0000
            PEA   $000A
            JSL   L024AEF
            STA   $0F
            BRA   L0225A5
L02258D     PEA   $0000
            PEA   $0000
            PEA   ^L022DC3
            PEA   L022DC3
            PEA   $0000
            PEA   $000A
            JSL   L024AEF
            STA   $0F
L0225A5     LDA   $0F
            BEQ   L0225B0
            LDA   #$001F
            STA   $13
            BRA   L0225B5
L0225B0     LDA   #$000F
            STA   $13
L0225B5     STZ   $15
            PEA   $0000
            TDC
            CLC
            ADC   #$0040
            PHA
            LDA   $01,S
            STA   $05
            LDA   $03,S
            STA   $07
            PLA
            PLA
L0225CA     LDA   $13
            SEC
            SBC   $15
            BEQ   L0225D8
            BVS   L0225D6
            EOR   #$8000
L0225D6     BMI   L0225DB
L0225D8     BRL   L0226D9
L0225DB     PEA   $0000
            PEA   $0000
            LDA   $01,S
            STA   $19
            LDA   $03,S
            STA   $1B
            PLA
            PLX
            STA   $17
L0225ED     PEI   $1B
            PEI   $19
            LDA   #$0016
            LDX   #$0000
            TAY
            TXA
            INX
            CMP   $03,S
            BNE   L022601
            TYA
            CMP   $01,S
L022601     BEQ   L022605
            BCS   L022606
L022605     DEX
L022606     PLA
            PLA
            TXA
            BEQ   L02267A
            LDA   $17
            BNE   L02267A
            PEA   ^L02A50A
            PEA   L02A50A
            LDX   $1B
            LDA   $19
            CLC
            ADC   $05
            TAY
            TXA
            ADC   $07
            TAX
            STY   $01
            STX   $03
            LDA   [$01]
            AND   #$00FF
            LDX   #$0000
            TAY
            BPL   L022631
            DEX
L022631     PHX
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            LDA   [$01]
            AND   #$0080
            BNE   L022671
            LDX   $1B
            LDA   $19
            CLC
            ADC   $05
            TAY
            TXA
            ADC   $07
            TAX
            STY   $01
            STX   $03
            LDA   [$01]
            AND   #$00FF
            TAX
            BNE   L02266D
            LDA   $19
            ORA   $1B
            BNE   L02266B
            INC   $17
L02266B     BRA   L02267A
L02266D     INC   $17
            BRA   L02267A
L022671     INC   $19
            BNE   L022677
            INC   $1B
L022677     BRL   L0225ED
L02267A     LDA   $17
            BEQ   L0226A5
            LDY   #$0016
            LDA   [$05],Y
            BEQ   L022697
            PEI   $15
            PEA   ^L022DC6
            PEA   L022DC6
            PEI   $07
            PEI   $05
            JSL   L02AA15
            BRA   L0226A5
L022697     PEA   ^L022DD4
            PEA   L022DD4
            PEI   $07
            PEI   $05
            JSL   L02AA15
L0226A5     LDY   #$0016
            LDA   [$05],Y
            STA   $3A
            XBA
            AND   #$00FF
            PHA
            LDA   $3A
            XBA
            AND   #$FF00
            ORA   $01,S
            PLX
            TAX
            PHA
            LDY   #$0016
            PLA
            STA   [$05],Y
            INC   $15
            PEI   $07
            PEI   $05
            CLC
            LDA   $05
            ADC   #$001E
            STA   $05
            BCC   L0226D4
            INC   $07
L0226D4     PLA
            PLA
            BRL   L0225CA
L0226D9     LDX   #$0000
            LDA   $13
            BPL   L0226E1
            DEX
L0226E1     PHX
            PHA
            PEA   $0000
            PEA   $0006
            JSL   L02C5AD
            JSL   L02C21D
            STX   $1F
            STA   $1D
            LDA   #$0098
            STAL  L030042
            STZ   $15
            PEI   $1F
            PEI   $1D
            LDA   $01,S
            STA   $21
            LDA   $03,S
            STA   $23
            PLA
            PLA
L02270C     LDA   $13
            SEC
            SBC   $15
            BEQ   L02271A
            BVS   L022718
            EOR   #$8000
L022718     BMI   L02271C
L02271A     BRA   L02276B
L02271C     LDX   #$0000
            LDA   $15
            BPL   L022724
            DEX
L022724     PHX
            PHA
            PEA   $0000
            PEA   $001E
            JSL   L02C5AD
            PEA   $0000
            TDC
            CLC
            ADC   #$0040
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            STA   [$21]
            LDY   #$0002
            PLA
            STA   [$21],Y
            LDY   #$0004
            LDA   #$0000
            STA   [$21],Y
            INC   $15
            PEI   $23
            PEI   $21
            CLC
            LDA   $21
            ADC   #$0006
            STA   $21
            BCC   L022767
            INC   $23
L022767     PLA
            PLA
            BRA   L02270C
L02276B     LDY   #$0004
            LDA   #$0080
            STA   [$1D],Y
            LDA   $13
            LDX   #$0568
            STA   $00,X
            LDX   #$0578
            LDA   $1D
            STA   $00,X
            LDA   $1F
            STA   $02,X
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0043
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$0590
            LDX   #$0000
            PHX
            PHA
            PEA   $800E
            _NewWindow2
            STAL  L02B111
            PLA
            STA   $09
            PLA
            STA   $0B
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L0227D2
            PEA   $000D
            JSL   L024DB6
L0227D2     PEI   $0B
            PEI   $09
            _SetPort
            STAL  L02B111
            PEA   $0013
            PEA   $0010
            _MoveTo
            STAL  L02B111
            PEA   ^L022DE5
            PEA   L022DE5
            _DrawCString
            STAL  L02B111
            PEA   $0000
            TDC
            CLC
            ADC   #$03FE
            PHA
            _DrawCString
            STAL  L02B111
            PEA   ^L022E00
            PEA   L022E00
            _DrawCString
            STAL  L02B111
            PHA
            PHA
            PEI   $0B
            PEI   $09
            PEA   $0000
            PEA   $0002
            _GetCtlHandleFromID
            STAL  L02B111
            PLA
            STA   $2A
            PLA
            STA   $2C
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L022857
            PEA   $000E
            JSL   L024DB6
L022857     STZ   $0F
L022859     PHA
            PHA
            PEA   ^L04008A
            PEA   L04008A
            PEA   $0000
            PEA   $0000
            PEA   ^L0248A8
            PEA   L0248A8
            PEA   $0000
            PEA   $0000
            PEA   $0010
            _DoModalWindow
            STAL  L02B111
            PLA
            STA   $19
            PLA
            STA   $1B
            LDAL  L04008A
            CMP   #$0001
            BNE   L0228B2
            PEI   $1B
            PEI   $19
            LDA   #$0001
            LDX   #$0000
            TAY
            CMP   $01,S
            BEQ   L0228A0
            DEY
L0228A0     TXA
            CMP   $03,S
            BEQ   L0228A8
            LDY   #$0000
L0228A8     PLA
            PLA
            TYA
            BEQ   L0228B2
            LDA   #$FFFF
            STA   $0F
L0228B2     PEI   $1B
            PEI   $19
            LDA   #$0003
            LDX   #$0000
            LDY   #$0001
            CMP   $01,S
            BEQ   L0228C4
            DEY
L0228C4     TXA
            CMP   $03,S
            BEQ   L0228CC
            LDY   #$0000
L0228CC     PLA
            PLA
            TYA
            BEQ   L0228F9
            PHA
            PEA   $0000
            PEI   $2C
            PEI   $2A
            _NextMember2
            STAL  L02B111
            PLA
            STA   $0F
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L0228F9
            PEA   $0203
            JSL   L024DB6
L0228F9     LDA   $0F
            BNE   L022900
            BRL   L022859
L022900     PEI   $1F
            PEI   $1D
            JSL   L02C1EF
            PEI   $0B
            PEI   $09
            _CloseWindow
            STAL  L02B111
            LDA   $0F
            CMP   #$FFFF
            BNE   L02295F
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            BRL   L022D9B
L02295F     DEC   $0F
            LDX   #$0000
            LDA   $0F
            BPL   L022969
            DEX
L022969     PHX
            PHA
            PEA   $0000
            PEA   $001E
            JSL   L02C5AD
            PEA   $0000
            TDC
            CLC
            ADC   #$0040
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PEA   $0000
            TDC
            CLC
            ADC   #$03FE
            PHA
            JSL   L02AB57
            _WaitCursor
            STAL  L02B111
            LDA   #$0000
            STAL  L03003B
            LDA   #$2AF8
            STAL  L030039
            LDX   #$03FA
            LDA   #$0000
            STA   $00,X
            STA   $02,X
            INC
            LDX   #$03F8
            STA   $00,X
            PEA   $2016
            PEA   $0000
            TDC
            CLC
            ADC   #$03F4
            PHA
            JSL   L02A4D6
            LDA   #$0003
            LDX   #$03F8
            STA   $00,X
            LDA   $13
            DEC
            STA   $15
L0229DC     LDA   $15
            SEC
            SBC   $0F
            BVS   L0229E6
            EOR   #$8000
L0229E6     BPL   L022A39
            LDX   #$0000
            LDA   $15
            BPL   L0229F0
            DEX
L0229F0     PHX
            PHA
            PEA   $0000
            PEA   $001E
            JSL   L02C5AD
            PEA   $0000
            TDC
            CLC
            ADC   #$0040
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            LDY   #$0016
            LDA   [$01],Y
            ASL
            LDX   #$0000
            TXY
            LDX   #$03FA
            STA   $00,X
            STY   $02,X
            PEA   $2016
            PHY
            TDC
            CLC
            ADC   #$03F4
            PHA
            JSL   L02A4D6
            DEC   $15
            BRA   L0229DC
L022A39     LDX   #$0000
            LDA   $0F
            BPL   L022A41
            DEX
L022A41     PHX
            PHA
            PEA   $0000
            PEA   $001E
            JSL   L02C5AD
            PEA   $0000
            TDC
            CLC
            ADC   #$0040
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            LDY   #$0016
            LDA   [$01],Y
            ASL
            PEA   $0000
            PHA
            LDA   $01,S
            LDX   #$03EA
            STA   $00,X
            LDA   $03,S
            LDX   #$03EC
            STA   $00,X
            PLA
            STAL  L030021
            PLA
            STAL  L030023
            PHA
            PHA
            LDAL  L030023
            PHA
            LDAL  L030021
            CLC
            ADC   #$000A
            BCC   L022A9D
            PLX
            INX
            PHX
L022A9D     PHA
            LDAL  L030035
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            STAL  L02B111
            PLA
            STAL  L03002D
            PLA
            STAL  L03002F
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L022B21
            LDAL  L03002B
            CMP   #$0201
            BNE   L022ADC
            LDA   #$0086
            STAL  L03002B
L022ADC     JSL   L0250E2
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            BRL   L022D9B
L022B21     LDAL  L03002F
            TAX
            LDAL  L03002D
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STX   $28
            STA   $26
            PEA   $0000
            DEY
            PLA
            SEP   #$20
            STA   [$26],Y
            REP   #$20
            AND   #$00FF
            SEP   #$20
            STA   [$26]
            REP   #$20
            PEI   $28
            LDA   $26
            CLC
            ADC   #$000A
            BCC   L022B5B
            PLX
            INX
            PHX
L022B5B     PHA
            LDA   $01,S
            LDX   #$03E6
            STA   $00,X
            LDA   $03,S
            LDX   #$03E8
            STA   $00,X
            PLA
            STAL  L030027
            PLA
            STAL  L030029
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            PEA   $0000
            PEA   $0008
            JSL   L02B0CB
            PLA
            AND   #$FFFF
            PHA
            LDA   $03,S
            AND   #$0000
            STA   $03,S
            PLA
            PLX
            STAL  L030025
            LDAL  L030025
            BNE   L022BA7
            LDA   #$0001
            STAL  L030025
L022BA7     LDA   #$0004
            LDX   #$03E2
            STA   $00,X
            PEA   $2012
            PEA   $0000
            TDC
            CLC
            ADC   #$03E2
            PHA
            JSL   L02A4D6
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            SEC
            LDA   $01,S
            SBC   #$0001
            STA   $01,S
            BCS   L022BD8
            LDA   $03,S
            DEC
            STA   $03,S
L022BD8     LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$00
            STA   [$01]
            REP   #$20
            LDAL  L03002F
            TAX
            LDAL  L03002D
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STX   $28
            STA   $26
            CLC
            LDA   $26
            ADC   #$000A
            STA   $26
            BCC   L022C20
            INC   $28
L022C20     PEA   $0000
            PEA   $0000
            LDA   $01,S
            STA   $19
            LDA   $03,S
            STA   $1B
            PLA
            PLX
            AND   #$00FF
            SEP   #$20
            STA   $25
            REP   #$20
            INC   $19
            BNE   L022C3F
            INC   $1B
L022C3F     INC   $19
            BNE   L022C45
            INC   $1B
L022C45     LDA   [$26]
            AND   #$00FF
            CLC
            ADC   #$0080
            SEP   #$20
            STA   $25
            REP   #$20
            LDA   $25
            AND   #$00FF
            BNE   L022C61
            SEP   #$20
            INC   $25
            REP   #$20
L022C61     SEP   #$20
            LDA   $25
            STA   [$26]
            REP   #$20
            INC   $26
            BNE   L022C6F
            INC   $28
L022C6F     PEI   $1B
            PEI   $19
            LDAL  L030023
            TAX
            LDAL  L030021
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L022C88
            TYA
            CMP   $01,S
L022C88     BEQ   L022C8C
            BCS   L022C8D
L022C8C     DEX
L022C8D     PLA
            PLA
            TXA
            BNE   L022C3F
            LDAL  L030019
            AND   #$0008
            BNE   L022CA9
            PEA   $0109
            _EnableMItem
            STAL  L02B111
L022CA9     PEA   $010A
            _EnableMItem
            STAL  L02B111
            PEA   $010B
            _EnableMItem
            STAL  L02B111
            PEA   $0119
            _EnableMItem
            STAL  L02B111
            PEA   $010C
            _EnableMItem
            STAL  L02B111
            PEA   $010D
            _EnableMItem
            STAL  L02B111
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            LDAL  L030019
            AND   #$0004
            BNE   L022D59
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0FFA
            PEA   $800E
            _NewWindow2
            STAL  L02B111
            PLA
            STAL  L030001
            PLA
            STAL  L030003
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L022D59
            PEA   $001B
            JSL   L024DB6
L022D59     PEA   $0000
            TDC
            CLC
            ADC   #$03FE
            PHA
            JSL   L025455
L022D66     _InitCursor
            STAL  L02B111
            LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
L022D9B     PLD
            TSC
            CLC
            ADC   #$05DF
            TCS
            RTL

L022DA3     STR   'Okay'
            DB    $00
L022DA9     STR   'Cancel'
            DB    $00
L022DB1     STR   'Whadya Want? '
            DB    $00
	
L022DC0     ASC   '31'00
L022DC3     ASC   '15'00
L022DC6     ASC   'Instrument %d'00
L022DD4     ASC   'Empty Instrument'00
L022DE5     ASC   'Choose an instrument from '00
L022E00     ASC   ':'00
L022E02     TSC
            SEC
            SBC   #$00C8
            TCS
            PHD
            TCD
            JSL   L020FED
            TAX
            BEQ   L022E14
            LDA   #$0001
L022E14     EOR   #$0001
            BEQ   L022E1C
            BRL   L023965
L022E1C     PEA   ^L02396D
            LDA   #L02396D
            STA   $33
            PLA
            STA   $35
L022E27     LDA   #$0003
            STAL  L0400FA
            STAL  L040100
            LDA   #$0000
            STA   $6B
            STA   $6D
            STZ   $13
            PEA   $004B
            PEA   $0028
            PHA
            PEI   $35
            PEI   $33
            PEA   ^L024836
            PEA   L024836
            PHA
            PHA
            PEA   ^L0400F2
            PEA   L0400F2
            _SFGetFile2
            STAL  L02B111
            LDAL  L0400F2
            BNE   L022E68
            BRL   L023929
L022E68     LDAL  L0400FE
            TAX
            LDAL  L0400FC
            STAL  L030005
            TXA
            STAL  L030007
            LDAL  L030007
            TAX
            LDAL  L030005
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STAL  L030009
            TXA
            STAL  L03000B
            LDA   #$0007
            STAL  L0400B8
            LDAL  L03000B
            TAX
            LDAL  L030009
            CLC
            ADC   #$0002
            BCC   L022EAF
            INX
L022EAF     STA   $39
            STX   $3B
            LDX   $3B
            LDA   $39
            STAL  L0400BC
            TXA
            STAL  L0400BE
            LDA   [$39]
            STA   $37
            LDX   #$0000
            CMP   #$0045
            BCC   L022ECF
            BEQ   L022ECF
            INX
L022ECF     TXA
            BNE   L022ED6
            LDA   $37
            BRA   L022ED9
L022ED6     LDA   #$0045
L022ED9     STA   $15
            PEA   $0000
            PHA
            LDAL  L03000B
            PHA
            LDAL  L030009
            CLC
            ADC   #$0004
            BCC   L022EF1
            PLX
            INX
            PHX
L022EF1     PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0083
            PHA
            JSL   L02AC0F
            PEA   $0000
            TDC
            CLC
            ADC   #$0083
            PHA
            LDX   #$0000
            LDA   $15
            BPL   L022F10
            DEX
L022F10     PHX
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$00
            STA   [$01]
            REP   #$20
            LDA   #$0001
            STAL  L0400C0
            DEC
            STAL  L0400C2
            PEA   $2010
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L022F56
            PEA   $012D
            JSL   L024DB6
L022F56     LDAL  L0400BA
            STA   $63
            STA   $51
            LDA   #$0004
            STA   $4F
            STZ   $55
            TDC
            CLC
            ADC   #$006B
            STA   $53
            LDA   #$0018
            STA   $57
            LDA   #$0000
            STA   $59
            PEA   $2012
            PHA
            TDC
            CLC
            ADC   #$004F
            PHA
            JSL   L02A4D6
            PEI   $6D
            PEI   $6B
            LDA   #$732E
            LDX   #$646E
            LDY   #$0001
            CMP   $01,S
            BEQ   L022F96
            DEY
L022F96     TXA
            CMP   $03,S
            BEQ   L022F9E
            LDY   #$0000
L022F9E     PLA
            PLA
            TYA
            BNE   L022FC4
            PHA
            PEA   $0005
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0008
            _AlertWindow
            STAL  L02B111
            PLA
            STA   $13
            BRL   L02395E
L022FC4     PEI   $81
            PEI   $7F
            JSL   L022034
            STX   $81
            STA   $7F
            PEI   $79
            PEI   $77
            JSL   L022034
            STX   $79
            STA   $77
            PEI   $75
            PEI   $73
            JSL   L022034
            STX   $75
            STA   $73
            PEI   $71
            PEI   $6F
            JSL   L022034
            PHX
            PHA
            LDA   $01,S
            STA   $6F
            LDA   $03,S
            STA   $71
            PLA
            STA   $67
            PLA
            STA   $69
            PEI   $7D
            PEI   $7B
            JSL   L022034
            STAL  L030039
            TXA
            STAL  L03003B
            LDA   #$0003
            STA   $61
            STZ   $65
            PEA   $2016
            PEA   $0000
            TDC
            CLC
            ADC   #$0061
            PHA
            JSL   L02A4D6
            PEA   $0000
            PEA   $0002
            LDX   $81
            LDA   $7F
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L02303E
            TYA
            CMP   $01,S
L02303E     BEQ   L023042
            BCS   L023043
L023042     DEX
L023043     PLA
            PLA
            TXA
            BNE   L023086
            PEA   $0000
            PEA   $0003
            LDX   $79
            LDA   $77
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L02305E
            TYA
            CMP   $01,S
L02305E     BEQ   L023062
            BCS   L023063
L023062     DEX
L023063     PLA
            PLA
            TXA
            BNE   L023086
            PEI   $79
            PEI   $77
            LDA   #$0001
            LDX   #$0000
            TAY
            TXA
            TYX
            CMP   $03,S
            BNE   L02307C
            TYA
            CMP   $01,S
L02307C     BEQ   L023080
            BCS   L023081
L023080     DEX
L023081     PLA
            PLA
            TXA
            BEQ   L0230A5
L023086     PHA
            PEA   $0005
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0009
            _AlertWindow
            STAL  L02B111
            PLA
            BRL   L023965
L0230A5     PEI   $81
            PEI   $7F
            LDA   #$0001
            LDX   #$0000
            TAY
            CMP   $01,S
            BEQ   L0230B5
            DEY
L0230B5     TXA
            CMP   $03,S
            BEQ   L0230BD
            LDY   #$0000
L0230BD     PLA
            PLA
            TYA
            BNE   L0230C5
            BRL   L023216
L0230C5     PEI   $79
            PEI   $77
            LDA   #$0003
            LDX   #$0000
            TAY
            TXA
            INX
            CMP   $03,S
            BNE   L0230D9
            TYA
            CMP   $01,S
L0230D9     BEQ   L0230DD
            BCS   L0230DE
L0230DD     DEX
L0230DE     PLA
            PLA
            TXA
            BNE   L0230E6
            BRL   L023216
L0230E6     PEI   $75
            PEI   $73
            LDA   $01,S
            STA   $57
            LDA   $03,S
            STA   $59
            PLA
            STAL  L030021
            PLA
            STAL  L030023
            PHA
            PHA
            LDAL  L030023
            PHA
            LDAL  L030021
            CLC
            ADC   #$000A
            BCC   L023110
            PLX
            INX
            PHX
L023110     PHA
            LDAL  L030035
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            STAL  L02B111
            PLA
            STAL  L03002D
            PLA
            STAL  L03002F
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L02316A
            LDAL  L03002B
            CMP   #$0201
            BNE   L02314F
            LDA   #$0086
            STAL  L03002B
L02314F     JSL   L0250E2
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            BRL   L023965
L02316A     _WaitCursor
            STAL  L02B111
            LDAL  L03002F
            TAX
            LDAL  L03002D
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STX   $07
            STA   $05
            PEA   $0000
            DEY
            PLA
            SEP   #$20
            STA   [$05],Y
            REP   #$20
            AND   #$00FF
            SEP   #$20
            STA   [$05]
            REP   #$20
            PEI   $07
            LDA   $05
            CLC
            ADC   #$000A
            BCC   L0231AF
            PLX
            INX
            PHX
L0231AF     PHA
            LDA   $01,S
            STA   $53
            LDA   $03,S
            STA   $55
            PLA
            STAL  L030027
            PLA
            STAL  L030029
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            PEA   $0000
            PEA   $0008
            JSL   L02B0CB
            PLA
            AND   #$FFFF
            PHA
            LDA   $03,S
            AND   #$0000
            STA   $03,S
            PLA
            PLX
            STAL  L030025
            LDAL  L030025
            TAX
            BEQ   L0231F2
            LDA   #$0001
L0231F2     EOR   #$0001
            BEQ   L0231FE
            LDA   #$0001
            STAL  L030025
L0231FE     LDA   #$0004
            STA   $4F
            PEA   $2012
            PEA   $0000
            TDC
            CLC
            ADC   #$004F
            PHA
            JSL   L02A4D6
            BRL   L0236C2
L023216     PEI   $81
            PEI   $7F
            LDA   #$0002
            LDX   #$0000
            LDY   #$0001
            CMP   $01,S
            BEQ   L023228
            DEY
L023228     TXA
            CMP   $03,S
            BEQ   L023230
            LDY   #$0000
L023230     PLA
            PLA
            TYA
            BEQ   L023255
            PHA
            PEA   $0005
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0007
            _AlertWindow
            STAL  L02B111
            PLA
            STA   $13
            BRA   L02325A
L023255     LDA   #$0004
            STA   $13
L02325A     _WaitCursor
            STAL  L02B111
            PEI   $81
            PEI   $7F
            LDA   #$0002
            LDX   #$0000
            LDY   #$0001
            CMP   $01,S
            BEQ   L023277
            DEY
L023277     TXA
            CMP   $03,S
            BEQ   L02327F
            LDY   #$0000
L02327F     PLA
            PLA
            TYA
            BEQ   L02329E
            PEI   $75
            PEI   $73
            PEA   $0000
            PEA   $0001
            JSL   L02B0CB
            PLA
            STAL  L030021
            PLA
            STAL  L030023
            BRA   L0232B6
L02329E     PEI   $75
            PEI   $73
            PEA   $0000
            PEA   $0002
            JSL   L02B0CB
            PLA
            STAL  L030021
            PLA
            STAL  L030023
L0232B6     PHA
            PHA
            PEA   $0000
            PEA   $1000
            LDA   $01,S
            STA   $1F
            LDA   $03,S
            STA   $21
            LDAL  L030035
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            STAL  L02B111
            PLA
            STA   $27
            PLA
            STA   $29
            PHA
            PHA
            LDAL  L030023
            PHA
            LDAL  L030021
            CLC
            ADC   #$000A
            BCC   L0232F9
            PLX
            INX
            PHX
L0232F9     PHA
            LDAL  L030035
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            STAL  L02B111
            PLA
            STAL  L03002D
            PLA
            STAL  L03002F
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L02336A
            LDAL  L03002B
            CMP   #$0201
            BNE   L023338
            LDA   #$0086
            STAL  L03002B
L023338     JSL   L0250E2
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
            STZ   $13
            BRL   L023965
L02336A     LDAL  L03002F
            TAX
            LDAL  L03002D
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STX   $07
            STA   $05
            PEA   $0000
            DEY
            PLA
            SEP   #$20
            STA   [$05],Y
            REP   #$20
            AND   #$00FF
            SEP   #$20
            STA   [$05]
            REP   #$20
            LDY   #$000A
            LDX   $07
            TYA
            CLC
            ADC   $05
            BCC   L0233A3
            INX
L0233A3     STAL  L030027
            PHA
            TXA
            STAL  L030029
            PLA
            STX   $0B
            STA   $09
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            PEA   $0000
            PEA   $0008
            JSL   L02B0CB
            PLA
            AND   #$FFFF
            PHA
            LDA   $03,S
            AND   #$0000
            STA   $03,S
            PLA
            PLX
            STAL  L030025
            LDAL  L030025
            TAX
            BEQ   L0233E2
            LDA   #$0001
L0233E2     EOR   #$0001
            BEQ   L0233EE
            LDA   #$0001
            STAL  L030025
L0233EE     PEA   $0000
            PEA   $0000
            LDA   $01,S
            STA   $1B
            LDA   $03,S
            STA   $1D
            LDA   $01,S
            STA   $23
            LDA   $03,S
            STA   $25
            PLA
            PLX
            STA   $19
            LDA   #$0001
            STA   $17
            LDA   #$0004
            STA   $4F
            LDY   #$0002
            LDA   [$27],Y
            TAX
            LDA   [$27]
            STX   $3F
            STA   $3D
L02341E     PEI   $75
            PEI   $73
            SEC
            PLA
            SBC   $23
            PHA
            LDA   $03,S
            SBC   $25
            STA   $03,S
            LDA   #$1000
            LDX   #$0000
            TAY
            TXA
            INX
            CMP   $03,S
            BNE   L02343D
            TYA
            CMP   $01,S
L02343D     BCS   L023440
            DEX
L023440     PLA
            PLA
            TXA
            BEQ   L023454
            SEC
            LDA   $73
            SBC   $23
            STA   $1F
            LDA   $75
            SBC   $25
            STA   $21
            INC   $19
L023454     PEI   $3F
            PEI   $3D
            LDA   $01,S
            STA   $0D
            LDA   $03,S
            STA   $0F
            PLA
            STA   $53
            PLA
            STA   $55
            LDA   $1F
            LDX   $21
            STA   $57
            STX   $59
            PEA   $2012
            PEA   $0000
            TDC
            CLC
            ADC   #$004F
            PHA
            JSL   L02A4D6
            JSL   L02AE36
            STAL  L03002B
            LDAL  L03002B
            CMP   #$004C
            BNE   L023494
            STZ   $17
            BRL   L023684
L023494     LDAL  L03002B
            BEQ   L0234D9
            JSL   L0250E2
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
            PEI   $29
            PEI   $27
            _DisposeHandle
            STAL  L02B111
            BRL   L023965
L0234D9     CLC
            LDA   $1F
            ADC   $23
            STA   $23
            LDA   $21
            ADC   $25
            STA   $25
            LDA   $13
            LDX   #$0000
            CMP   #$0004
            BNE   L0234F1
            INX
L0234F1     TXA
            STA   $41
            LDY   #$0002
            LDA   [$27],Y
            TAX
            LDA   [$27]
            STX   $45
            STA   $43
            LDA   $13
            LDX   #$0000
            CMP   #$0002
            BNE   L02350B
            INX
L02350B     TXA
            STA   $47
            LDA   $13
            LDX   #$0000
            CMP   #$0001
            BNE   L023519
            INX
L023519     TXA
            STA   $49
            LDA   $13
            TAX
            BEQ   L023524
            LDA   #$0001
L023524     EOR   #$0001
            STA   $4B
            LDA   $13
            LDX   #$0000
            CMP   #$0001
            BNE   L023534
            INX
L023534     TXA
            STA   $4D
L023537     INC   $1B
            BNE   L02353D
            INC   $1D
L02353D     LDA   $41
            BEQ   L02354F
            LDA   [$0D]
            AND   #$00FF
            SEP   #$20
            STA   $11
            REP   #$20
            BRL   L023616
L02354F     PEI   $81
            PEI   $7F
            LDA   #$0002
            LDX   #$0000
            LDY   #$0001
            CMP   $01,S
            BEQ   L023561
            DEY
L023561     TXA
            CMP   $03,S
            BEQ   L023569
            LDY   #$0000
L023569     PLA
            PLA
            TYA
            BEQ   L0235CD
            PEI   $79
            PEI   $77
            LDA   #$0003
            LDX   #$0000
            TAY
            TXA
            INX
            CMP   $03,S
            BNE   L023582
            TYA
            CMP   $01,S
L023582     BEQ   L023586
            BCS   L023587
L023586     DEX
L023587     PLA
            PLA
            TXA
            BEQ   L0235CD
            LDA   $4B
            BEQ   L0235A0
            LDY   #$0001
            LDA   [$0D],Y
            AND   #$00FF
            SEP   #$20
            STA   $11
            REP   #$20
            BRA   L0235CB
L0235A0     LDA   $4D
            BEQ   L0235B1
            LDA   [$0D]
            AND   #$00FF
            SEP   #$20
            STA   $11
            REP   #$20
            BRA   L0235CB
L0235B1     LDA   [$0D]
            AND   #$00FF
            LSR
            PHA
            LDY   #$0001
            LDA   [$0D],Y
            AND   #$00FF
            LSR
            CLC
            ADC   $01,S
            PLX
            SEP   #$20
            STA   $11
            REP   #$20
L0235CB     BRA   L023616
L0235CD     LDA   [$0D]
            AND   #$00FF
            SEP   #$20
            STA   $11
            REP   #$20
            CLC
            LDA   $0D
            ADC   #$0002
            STA   $0D
            BCC   L0235E4
            INC   $0F
L0235E4     INC   $1B
            BNE   L0235EA
            INC   $1D
L0235EA     LDA   $49
            BEQ   L0235FB
            LDA   [$0D]
            AND   #$00FF
            SEP   #$20
            STA   $11
            REP   #$20
            BRA   L023616
L0235FB     LDA   $47
            BEQ   L023616
            LDA   $11
            AND   #$00FF
            LSR
            PHA
            LDA   [$0D]
            AND   #$00FF
            LSR
            CLC
            ADC   $01,S
            PLX
            SEP   #$20
            STA   $11
            REP   #$20
L023616     CLC
            LDA   $0D
            ADC   #$0002
            STA   $0D
            BCC   L023622
            INC   $0F
L023622     LDA   $11
            AND   #$00FF
            TAX
            BEQ   L02362D
            LDA   #$0001
L02362D     EOR   #$0001
            BEQ   L023638
            SEP   #$20
            INC   $11
            REP   #$20
L023638     SEP   #$20
            LDA   $11
            STA   [$09]
            REP   #$20
            INC   $09
            BNE   L023646
            INC   $0B
L023646     PEA   $0000
            PEA   $1000
            PEI   $0F
            PEI   $0D
            SEC
            PLA
            SBC   $43
            PHA
            LDA   $03,S
            SBC   $45
            STA   $03,S
            JSL   L02C444
            BEQ   L023664
            BRL   L023537
L023664     LDA   $19
            TAX
            BEQ   L02366C
            LDA   #$0001
L02366C     EOR   #$0001
            CMP   #$0000
            BEQ   L02367E
            LDA   $17
            CMP   #$0000
            BEQ   L02367E
            LDA   #$0001
L02367E     TAX
            BEQ   L023684
            BRL   L02341E
L023684     STZ   $13
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            SEC
            LDA   $01,S
            SBC   #$0001
            STA   $01,S
            BCS   L02369F
            LDA   $03,S
            DEC
            STA   $03,S
L02369F     LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$00
            STA   [$01]
            REP   #$20
L0236C2     LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            SEC
            LDA   $01,S
            SBC   #$0001
            STA   $01,S
            BCS   L0236DB
            LDA   $03,S
            DEC
            STA   $03,S
L0236DB     LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$00
            STA   [$01]
            REP   #$20
            LDAL  L03002F
            TAX
            LDAL  L03002D
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STX   $07
            STA   $05
            CLC
            LDA   $05
            ADC   #$000A
            STA   $05
            BCC   L023723
            INC   $07
L023723     PEA   $0000
            PEA   $0000
            LDA   $01,S
            STA   $1B
            LDA   $03,S
            STA   $1D
            PLA
            PLX
            AND   #$00FF
            SEP   #$20
            STA   $12
            REP   #$20
            INC   $1B
            BNE   L023742
            INC   $1D
L023742     INC   $1B
            BNE   L023748
            INC   $1D
L023748     PEI   $79
            PEI   $77
            LDA   #$0001
            LDX   #$0000
            TAY
            CMP   $01,S
            BEQ   L023758
            DEY
L023758     TXA
            CMP   $03,S
            BEQ   L023760
            LDY   #$0000
L023760     PLA
            PLA
            TYA
            BEQ   L0237DB
            LDA   [$05]
            AND   #$00FF
            EOR   #$FFFF
            STA   $2B
            AND   #$0080
            STA   $2D
            LDA   $2B
            LDX   #$0004
            JSL   L02CA73
            AND   #$0007
            STA   $2F
            PEA   ^L04007A
            PEA   L04007A
            LDA   $2F
            ASL
            LDX   #$0000
            TAY
            BPL   L023792
            DEX
L023792     PHX
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            LDA   [$01]
            PHA
            LDA   $2B
            AND   #$000F
            PHA
            LDA   $2F
            CLC
            ADC   #$0003
            TAX
            PLA
            JSL   L02C9E7
            CLC
            ADC   $01,S
            PLX
            STA   $31
            LDA   $2D
            BEQ   L0237CC
            LDA   $31
            EOR   #$FFFF
            INC
            STA   $31
L0237CC     LDA   $31
            LDX   #$0008
            JSL   L02CA73
            SEP   #$20
            STA   [$05]
            REP   #$20
L0237DB     LDA   [$05]
            AND   #$00FF
            CLC
            ADC   #$0080
            SEP   #$20
            STA   $12
            REP   #$20
            LDA   $12
            AND   #$00FF
            TAX
            BEQ   L0237F5
            LDA   #$0001
L0237F5     EOR   #$0001
            BEQ   L023800
            SEP   #$20
            INC   $12
            REP   #$20
L023800     SEP   #$20
            LDA   $12
            STA   [$05]
            REP   #$20
            INC   $05
            BNE   L02380E
            INC   $07
L02380E     PEI   $1D
            PEI   $1B
            LDAL  L030023
            TAX
            LDAL  L030021
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L023827
            TYA
            CMP   $01,S
L023827     BEQ   L02382B
            BCS   L02382C
L02382B     DEX
L02382C     PLA
            PLA
            TXA
            BEQ   L023834
            BRL   L023742
L023834     LDAL  L030019
            AND   #$0008
            TAX
            BEQ   L023841
            LDA   #$0001
L023841     EOR   #$0001
            BEQ   L023854
            PEA   $0109
            _EnableMItem
            STAL  L02B111
L023854     PEA   $010A
            _EnableMItem
            STAL  L02B111
            PEA   $010B
            _EnableMItem
            STAL  L02B111
            PEA   $0119
            _EnableMItem
            STAL  L02B111
            PEA   $010C
            _EnableMItem
            STAL  L02B111
            PEA   $010D
            _EnableMItem
            STAL  L02B111
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            LDAL  L030019
            AND   #$0004
            TAX
            BEQ   L0238BB
            LDA   #$0001
L0238BB     EOR   #$0001
            BEQ   L02390D
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0FFA
            PEA   $800E
            _NewWindow2
            STAL  L02B111
            PLA
            STAL  L030001
            PLA
            STAL  L030003
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L02390D
            PEA   $001B
            JSL   L024DB6
L02390D     PEA   $0000
            TDC
            CLC
            ADC   #$0083
            PHA
            JSL   L025455
            PEI   $29
            PEI   $27
            _DisposeHandle
            STAL  L02B111
L023929     _InitCursor
            STAL  L02B111
            LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
L02395E     LDA   $13
            BEQ   L023965
            BRL   L022E27
L023965     PLD
            TSC
            CLC
            ADC   #$00C8
            TCS
            RTL

L02396D     STR   'Whadya Want? '
            DB    $00
	
L02397C     TSC
            SEC
            SBC   #$0256
            TCS
            PHD
            TCD
            JSL   L020FED
            TAX
            BEQ   L02398E
            LDA   #$0001
L02398E     EOR   #$0001
            BEQ   L023996
            BRL   L024183
L023996     PHA
            _GetPenMode
            STAL  L02B111
            PLA
            STA   $0D
            PEA   $004B
            PEA   $0028
            PEA   $0000
            PEA   ^L02418B
            PEA   L02418B
            PEA   ^L024836
            PEA   L024836
            PEA   $0000
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$002B
            PHA
            _SFMultiGet2
            STAL  L02B111
            LDA   $2B
            TAX
            BEQ   L0239DC
            LDA   #$0001
L0239DC     EOR   #$0001
            BEQ   L0239E4
            BRL   L024183
L0239E4     _WaitCursor
            STAL  L02B111
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0050
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            PEA   $0002
            PEA   $0000
            PEA   $0FF7
            PEA   $800E
            _NewWindow2
            STAL  L02B111
            PLA
            STA   $1F
            PLA
            STA   $21
            PEI   $21
            PEI   $1F
            _SetPort
            STAL  L02B111
            JSL   L024766
            PEA   $0002
            _SetPenMode
            STAL  L02B111
            LDY   #$0002
            LDA   [$2D],Y
            TAX
            LDA   [$2D]
            CLC
            ADC   #$0002
            BCC   L023A56
            INX
L023A56     STA   $17
            STX   $19
            LDAL  L030011
            TAX
            LDAL  L03000F
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            STAL  L03000D
            STZ   $05
L023A72     LDA   $2B
            CMP   $05
            BEQ   L023A7A
            BCS   L023A7D
L023A7A     BRL   L02413F
L023A7D     LDA   $17
            LDX   $19
            STA   $07
            STX   $09
            CLC
            ADC   #$0008
            BCC   L023A8C
            INX
L023A8C     STA   $13
            STX   $15
            CLC
            LDA   $17
            ADC   #$0006
            STA   $17
            BCC   L023A9C
            INC   $19
L023A9C     PEA   $0023
            PEA   $001E
            _MoveTo
            STAL  L02B111
            PEI   $19
            PEI   $17
            _DrawString
            STAL  L02B111
            LDA   [$17]
            AND   #$00FF
            LDX   #$0156
            STA   $00,X
            PEA   $0000
            PEA   $00FF
            PEI   $19
            PEI   $17
            JSL   L02A73C
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0158
            PHA
            JSL   L02AC0F
            LDA   [$07]
            CMP   #$000F
            BNE   L023AED
            BRL   L02413A
L023AED     LDA   [$07]
            CMP   #$0006
            BNE   L023B65
            LDY   #$0002
            LDA   [$13],Y
            TAX
            LDA   [$13]
            JSL   L02BB54
            PEA   $4004
            PEA   $CD9F
            PEA   $F972
            PEA   $4745
            PEA   $3800
            JSL   L02BF65
            JSL   L02BBB7
            STAL  L030039
            TXA
            STAL  L03003B
            LDAL  L03003B
            PHA
            LDAL  L030039
            PHA
            LDA   #$0190
            LDX   #$0000
            TAY
            TXA
            INX
            CMP   $03,S
            BNE   L023B3A
            TYA
            CMP   $01,S
L023B3A     BEQ   L023B3E
            BCS   L023B3F
L023B3E     DEX
L023B3F     PLA
            PLA
            TXA
            BEQ   L023B63
            LDAL  L030011
            TAX
            LDAL  L03000F
            STA   $01
            STX   $03
            LDA   [$01]
            LDX   #$0000
            TAY
            BPL   L023B5A
            DEX
L023B5A     STAL  L030039
            TXA
            STAL  L03003B
L023B63     BRA   L023B84
L023B65     LDAL  L030011
            TAX
            LDAL  L03000F
            STA   $01
            STX   $03
            LDA   [$01]
            LDX   #$0000
            TAY
            BPL   L023B7B
            DEX
L023B7B     STAL  L030039
            TXA
            STAL  L03003B
L023B84     LDA   #$0004
            STAL  L0400B8
            LDA   #$0000
            STAL  L0400BE
            TDC
            CLC
            ADC   #$0156
            STAL  L0400BC
            LDA   #$0001
            STAL  L0400C0
            DEC
            STAL  L0400C2
            PEA   $2010
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L023BC6
            JSL   L0250E2
            BRL   L02413F
L023BC6     LDX   #$0156
            LDA   $00,X
            CMP   #$00FD
            BEQ   L023BD2
            BCS   L023BD4
L023BD2     BRA   L023BE6
L023BD4     SEP   #$20
            LDA   #$2E
            LDX   #$0255
            STA   $00,X
            LDA   #$72
            INX
            STA   $00,X
            REP   #$20
            BRA   L023C50
L023BE6     PEA   $0000
            TDC
            CLC
            ADC   #$0158
            PHA
            LDX   #$0156
            LDA   $00,X
            LDX   #$0000
            TAY
            BPL   L023BFB
            DEX
L023BFB     PHX
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$2E
            STA   [$01]
            REP   #$20
            PEA   $0000
            TDC
            CLC
            ADC   #$0158
            PHA
            LDX   #$0156
            LDA   $00,X
            INC
            LDX   #$0000
            TAY
            BPL   L023C2C
            DEX
L023C2C     PHX
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$72
            STA   [$01]
            REP   #$20
            LDX   #$0156
            LDA   $00,X
            INC
            INC
            STA   $00,X
L023C50     LDAL  L0400BA
            STA   $33
            STA   $3B
            LDA   #$0002
            STA   $31
            PEA   $2019
            PEA   $0000
            TDC
            CLC
            ADC   #$0031
            PHA
            JSL   L02A4D6
            PEI   $37
            PEI   $35
            LDA   $01,S
            STAL  L0400E2
            LDA   $03,S
            STAL  L0400E4
            LDA   $01,S
            STA   $41
            LDA   $03,S
            STA   $43
            PLA
            STAL  L030021
            PLA
            STAL  L030023
            PHA
            PHA
            LDAL  L0400E4
            PHA
            LDAL  L0400E2
            CLC
            ADC   #$000A
            BCC   L023CA3
            PLX
            INX
            PHX
L023CA3     PHA
            LDAL  L030035
            PHA
            PEA   $C000
            PEA   $0000
            PEA   $0000
            _NewHandle
            STAL  L02B111
            PLA
            STAL  L03002D
            PLA
            STAL  L03002F
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L023CFD
            LDAL  L03002B
            CMP   #$0201
            BNE   L023CE2
            LDA   #$0086
            STAL  L03002B
L023CE2     JSL   L0250E2
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            BRL   L02413A
L023CFD     LDAL  L03002F
            TAX
            LDAL  L03002D
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STX   $1D
            STA   $1B
            PEI   $1D
            LDA   $1B
            CLC
            ADC   #$000A
            BCC   L023D23
            PLX
            INX
            PHX
L023D23     PHA
            LDA   $01,S
            STA   $3D
            LDA   $03,S
            STA   $3F
            PLA
            STAL  L030027
            PLA
            STAL  L030029
            LDA   $1B
            LDX   $1D
            STA   $07
            STX   $09
            LDAL  L0400E4
            PHA
            LDAL  L0400E2
            PHA
            PEA   $0000
            PEA   $0008
            JSL   L02B0CB
            PLA
            AND   #$FFFF
            PHA
            LDA   $03,S
            AND   #$0000
            STA   $03,S
            PLA
            PLX
            STAL  L030025
            LDAL  L030025
            TAX
            BEQ   L023D6E
            LDA   #$0001
L023D6E     EOR   #$0001
            BEQ   L023D76
            INC   L030025
L023D76     JSL   L026CEE
            LDA   #$0000
            STA   [$07]
            LDY   #$0002
            LDAL  L030025
            STA   [$07],Y
            LDY   #$0004
            LDAL  L030017
            STA   [$07],Y
            LDY   #$0006
            LDAL  L03000D
            STA   [$07],Y
            LDY   #$0008
            LDAL  L030039
            STA   [$07],Y
            LDA   #$0004
            STA   $39
            PEA   $2012
            PEA   $0000
            TDC
            CLC
            ADC   #$0039
            PHA
            JSL   L02A4D6
            LDA   #$0001
            STAL  L0400B8
            PEA   $2014
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            SEC
            LDA   $01,S
            SBC   #$0001
            STA   $01,S
            BCS   L023DE5
            LDA   $03,S
            DEC
            STA   $03,S
L023DE5     LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$00
            STA   [$01]
            REP   #$20
            LDAL  L030011
            TAX
            LDAL  L03000F
            STA   $01
            STX   $03
            LDY   #$0004
            LDA   [$01],Y
            BEQ   L023E8C
            LDA   #$0002
            STA   $4B
            LDA   #$0008
            STA   $4D
            STZ   $51
            TDC
            CLC
            ADC   #$0053
            STA   $4F
            LDA   #$00FF
            STA   [$4F]
            PEA   $200A
            PEA   $0000
            TDC
            CLC
            ADC   #$004B
            PHA
            JSL   L02A4D6
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L023E56
            PEA   $00EB
            JSL   L024DB6
L023E56     LDAL  L030011
            TAX
            LDAL  L03000F
            CLC
            ADC   #$0006
            BCC   L023E66
            INX
L023E66     STA   $4F
            STX   $51
            PEA   $2009
            PEA   $0000
            TDC
            CLC
            ADC   #$004B
            PHA
            JSL   L02A4D6
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L023E8C
            PEA   $00EC
            JSL   L024DB6
L023E8C     PEA   $0000
            PEA   $0003
            PEA   $00D8
            PEA   $00C3
            PEA   $0000
            TDC
            CLC
            ADC   #$0156
            PHA
            _CreateResourceFile
            STAL  L02B111
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L023F0C
            LDAL  L03002B
            LDX   #$0000
            CMP   #$0070
            BNE   L023EC4
            INX
L023EC4     TXA
            CMP   #$0000
            BEQ   L023ECF
            LDA   #$0001
            BRA   L023EE5
L023ECF     LDAL  L03002B
            LDX   #$0000
            CMP   #$1E01
            BNE   L023EDC
            INX
L023EDC     TXA
            CMP   #$0000
            BEQ   L023EE5
            LDA   #$0001
L023EE5     TAX
            BEQ   L023EEB
            LDA   #$0001
L023EEB     EOR   #$0001
            BEQ   L023F0C
            JSL   L0250E2
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
            BRL   L02413F
L023F0C     PHA
            PEA   $8003
            PEA   $0000
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$0156
            PHA
            _OpenResourceFile
            STAL  L02B111
            PLA
            STA   $0B
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L023F54
            JSL   L0250E2
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
            BRL   L02413F
L023F54     PHA
            PHA
            PEA   $FFFF
            PEA   $8024
            _UniqueResourceID
            STAL  L02B111
            PLA
            STA   $0F
            PLA
            STA   $11
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            PEA   $0000
            PEA   $8024
            PEI   $11
            PEI   $0F
            _AddResource
            STAL  L02B111
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L023FC4
            LDA   $0B
            ORA   #$8000
            PHA
            _CloseResourceFile
            STAL  L02B111
            JSL   L0250E2
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
            BRL   L02413F
L023FC4     LDX   $19
            LDA   $17
            CLC
            ADC   #$0002
            BCC   L023FCF
            INX
L023FCF     STA   $27
            STX   $29
            LDA   [$17]
            AND   #$00FF
            DEC
            DEC
            SEP   #$20
            STA   [$27]
            REP   #$20
            PEA   $8024
            PEI   $11
            PEI   $0F
            PEI   $29
            PEI   $27
            _RMSetResourceName
            STAL  L02B111
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L02402E
            LDA   $0B
            ORA   #$8000
            PHA
            _CloseResourceFile
            STAL  L02B111
            JSL   L0250E2
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
            BRL   L02413F
L02402E     SEP   #$20
            LDY   #$0002
            LDA   #$3A
            STA   [$17],Y
            REP   #$20
            PEA   $000F
            _SetForeColor
            STAL  L02B111
            PEA   $0023
            PEA   $001E
            _MoveTo
            STAL  L02B111
            PEI   $19
            PEI   $17
            _DrawString
            STAL  L02B111
            PEA   $0000
            _SetForeColor
            STAL  L02B111
            PEI   $0B
            _UpdateResourceFile
            STAL  L02B111
            PEI   $0B
            _CloseResourceFile
            STAL  L02B111
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L0240C6
            LDA   $0B
            ORA   #$8000
            PHA
            _CloseResourceFile
            STAL  L02B111
            JSL   L0250E2
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
            BRA   L02413F
L0240C6     PEA   $0000
            TDC
            CLC
            ADC   #$0156
            PHA
            JSL   L0251FD
            LDAL  L030011
            TAX
            LDAL  L03000F
            STA   $01
            STX   $03
            LDY   #$0004
            LDA   [$01],Y
            BEQ   L024112
            STZ   $51
            TDC
            CLC
            ADC   #$0055
            STA   $4F
            PEA   $2009
            PEA   $0000
            TDC
            CLC
            ADC   #$004B
            PHA
            JSL   L02A4D6
            JSL   L02AE36
            STAL  L03002B
            TAX
            BEQ   L024112
            PEA   $00F6
            JSL   L024DB6
L024112     LDA   [$17]
            AND   #$00FF
            INC
            LDX   #$0000
            CLC
            ADC   $17
            STA   $17
            TXA
            ADC   $19
            STA   $19
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
L02413A     INC   $05
            BRL   L023A72
L02413F     PEI   $2F
            PEI   $2D
            _DisposeHandle
            STAL  L02B111
            PEI   $0D
            _SetPenMode
            STAL  L02B111
            _InitCursor
            STAL  L02B111
            PEI   $21
            PEI   $1F
            _CloseWindow
            STAL  L02B111
            PEA   $0108
            _DisableMItem
            STAL  L02B111
L024183     PLD
            TSC
            CLC
            ADC   #$0256
            TCS
            RTL

L02418B     STR   'Whadya Want? '
            DB    $00
	
L02419A     PHA
            TSC
            PHD
            TCD
            PEI   $08
            LDA   $06
            AND   #$FFFF
            PHA
            LDA   $03,S
            AND   #$0000
            STA   $03,S
            PLA
            PLX
            STA   $01
L0241B1     BRL   L024295
L0241B4     BRL   L0242ED
            JSL   L027A23
L0241BB     BRL   L0242ED
            JSL   L027AD9
L0241C2     BRL   L0242ED
            JSL   L027B8F
L0241C9     BRL   L0242ED
            JSL   L027C28
L0241D0     BRL   L0242ED
L0241D3     BRL   L0242ED
            JSL   L0268A6
L0241DA     BRL   L0242ED
            JSL   L02537D
L0241E1     BRL   L0242ED
            JSL   L021207
L0241E8     BRL   L0242ED
            JSL   L0257DE
L0241EF     BRL   L0242ED
            PEA   $0001
            JSL   L0209F9
L0241F9     BRL   L0242ED
            PEA   $0000
            JSL   L0209F9
L024203     BRL   L0242ED
            PEA   $0003
            JSL   L0209F9
L02420D     BRL   L0242ED
            PHA
            PEA   $0005
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0001
            _AlertWindow
            STAL  L02B111
            PLA
            STAL  L030013
L024230     BRL   L0242ED
            JSL   L026715
L024237     BRL   L0242ED
            JSL   L024F8A
L02423E     BRL   L0242ED
            JSL   L024EF2
L024245     BRL   L0242ED
            JSL   L020269
L02424C     BRL   L0242ED
            JSL   L02397C
L024253     BRL   L0242ED
            JSL   L027850
L02425A     BRL   L0242ED
            JSL   L0272F3
L024261     BRL   L0242ED
            JSL   L026D7A
L024268     BRL   L0242ED
            JSL   L02169F
L02426F     BRA   L0242ED
            JSL   L0220C3
L024275     BRA   L0242ED
            JSL   L022E02
L02427B     BRA   L0242ED
            JSL   L027CB6
L024281     BRA   L0242ED
            JSL   L02884B
L024287     BRA   L0242ED
            JSL   L029245
L02428D     BRA   L0242ED
            JSL   L02A31B
            BRA   L0242ED
L024295     LDA   $01
            SEC
            SBC   #$00FA
            CMP   #$0020
            BCC   L0242A3
            LDA   #$0020
L0242A3     ASL
            TAX
            LDAL  L0242AB,X
            PHA
            RTS

L0242AB     DA    L0241B1+2
            DA    L0241B4+2
            DA    L0241BB+2
            DA    L0241C2+2
            DA    L0241C9+2
            DA    L0241D0+2
            DA    L0241D3+2
            DA    L0241DA+2
            DA    L0242ED-1
            DA    L0241E1+2
            DA    L0241EF+2
            DA    L0242ED-1
            DA    L0242ED-1
            DA    L02420D+2
            DA    L024237+2
            DA    L024230+2
            DA    L02423E+2
            DA    L024261+2
            DA    L024253+2
            DA    L02425A+2
            DA    L0241F9+2
            DA    L02424C+2
            DA    L024245+2
            DA    L0241E8+2
            DA    L024203+2
            DA    L02427B+1
            DA    L024287+1
            DA    L024281+1
            DA    L024268+2
            DA    L02426F+1
            DA    L024275+1
            DA    L02428D+1
            DA    L0242ED-1

L0242ED     PEA   $0000
            PEI   $08
            PEI   $06
            PEA   $0000
            PEA   $0010
            JSL   L02C248
            PLA
            STA   $01,S
            _HiliteMenu
            STAL  L02B111
            LDA   $04
            STA   $08
            LDA   $03
            STA   $07
            PLD
            TSC
            CLC
            ADC   #$0006
            TCS
            RTL

L02431C     TSC
            SEC
            SBC   #$0004
            TCS
            PHD
            TCD
            PHA
            PHA
            _FrontWindow
            STAL  L02B111
            PLA
            STA   $01
            PLA
            STA   $03
            PHA
            PEI   $03
            PEI   $01
            _GetWKind
            STAL  L02B111
            PLA
            CMPL  L03001B
            BNE   L024351
            BRL   L02440F
L024351     LDAL  L03001B
            EOR   #$8000
            STAL  L03001B
            LDAL  L03001B
            AND   #$8000
            BEQ   L0243BB
            PEA   $00FA
            _EnableMItem
            STAL  L02B111
            PEA   $00FB
            _EnableMItem
            STAL  L02B111
            PEA   $00FC
            _EnableMItem
            STAL  L02B111
            PEA   $00FD
            _EnableMItem
            STAL  L02B111
            PEA   $00FE
            _EnableMItem
            STAL  L02B111
            PEA   $00FF
            _EnableMItem
            STAL  L02B111
            BRA   L02440F
L0243BB     PEA   $00FA
            _DisableMItem
            STAL  L02B111
            PEA   $00FB
            _DisableMItem
            STAL  L02B111
            PEA   $00FC
            _DisableMItem
            STAL  L02B111
            PEA   $00FD
            _DisableMItem
            STAL  L02B111
            PEA   $00FE
            _DisableMItem
            STAL  L02B111
            PEA   $00FF
            _DisableMItem
            STAL  L02B111
L02440F     PLD
            TSC
            CLC
            ADC   #$0004
            TCS
            RTL

L024417     TSC
            SEC
            SBC   #$0008
            TCS
            PHD
            TCD
            LDAL  L0400B2
            PHA
            LDAL  L0400B0
            PHA
            LDA   #$0001
            LDX   #$0000
            TAY
            CMP   $01,S
            BEQ   L024435
            DEY
L024435     TXA
            CMP   $03,S
            BEQ   L02443D
            LDY   #$0000
L02443D     PLA
            PLA
            TYA
            BNE   L02446A
            LDAL  L0400B2
            PHA
            LDAL  L0400B0
            PHA
            LDA   #$0004
            LDX   #$0000
            LDY   #$0001
            CMP   $01,S
            BEQ   L02445A
            DEY
L02445A     TXA
            CMP   $03,S
            BEQ   L024462
            LDY   #$0000
L024462     PLA
            PLA
            TYA
            BNE   L02446A
            BRL   L0245D6
L02446A     JSL   L020925
            LDA   L030039
            ORA   L03003B
            BNE   L02448D
            CLC
            LDAL  L030039
            ADC   #$0001
            STAL  L030039
            BCC   L02448D
            LDAL  L03003B
            INC
            STAL  L03003B
L02448D     PEA   $0000
            PEA   $FFFA
            LDAL  L03003B
            TAX
            LDAL  L030039
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L0244A8
            TYA
            CMP   $01,S
L0244A8     BEQ   L0244AC
            BCS   L0244AD
L0244AC     DEX
L0244AD     PLA
            PLA
            TXA
            BEQ   L0244C0
            LDA   #$0000
            STAL  L03003B
            LDA   #$FFFA
            STAL  L030039
L0244C0     JSL   L026CEE
            LDAL  L03002F
            TAX
            LDAL  L03002D
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STX   $07
            STA   $05
            LDA   #$0000
            STA   [$05]
            LDAL  L030025
            STA   [$05],Y
            LDY   #$0004
            LDAL  L030017
            STA   [$05],Y
            LDY   #$0006
            LDAL  L03000D
            STA   [$05],Y
            LDY   #$0008
            LDAL  L030039
            STA   [$05],Y
            LDAL  L0400B2
            PHA
            LDAL  L0400B0
            PHA
            LDA   #$0001
            LDX   #$0000
            TAY
            CMP   $01,S
            BEQ   L024519
            DEY
L024519     TXA
            CMP   $03,S
            BEQ   L024521
            LDY   #$0000
L024521     PLA
            PLA
            TYA
            BNE   L024529
            BRL   L0245D2
L024529     LDAL  L030019
            AND   #$00F7
            STAL  L030019
            LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            _HideWindow
            STAL  L02B111
            LDAL  L030019
            AND   #$0002
            BEQ   L0245D0
            PEA   $0115
            _EnableMItem
            STAL  L02B111
            PEA   $0113
            _EnableMItem
            STAL  L02B111
            PEA   $0114
            _EnableMItem
            STAL  L02B111
            PEA   $0112
            _EnableMItem
            STAL  L02B111
            PEA   $0104
            _EnableMItem
            STAL  L02B111
            PEA   $010E
            _EnableMItem
            STAL  L02B111
            PEA   $0109
            _EnableMItem
            STAL  L02B111
            PEA   $0108
            _EnableMItem
            STAL  L02B111
            PEA   $010F
            _EnableMItem
            STAL  L02B111
L0245D0     BRA   L0245D6
L0245D2     JSL   L026715
L0245D6     PLD
            TSC
            CLC
            ADC   #$0008
            TCS
            RTL

L0245DE     TSC
            SEC
            SBC   #$0008
            TCS
            PHD
            TCD
            LDA   #$001F
            STAL  L0400A0
            LDA   #$FFFF
            STAL  L04009E
L0245F4     JSL   L02431C
            PHA
            PHA
            PEA   $C000
            PEA   $0000
            _HandleDiskInsert
            STAL  L02B111
            PLA
            STA   $03
            PLA
            STA   $05
            PHA
            PEA   $FFFF
            PEA   ^L04008A
            PEA   L04008A
            _TaskMaster
            STAL  L02B111
            PLA
            STA   $01
            STA   $07
L02462B     BRA   L02465A
            LDAL  L04009C
            PHA
            LDAL  L04009A
            PHA
            JSL   L02419A
L02463B     BRA   L024694
            JSL   L024417
L024641     BRA   L024694
            LDAL  L04009C
            PHA
            LDAL  L04009A
            PHA
            _CloseWindow
            STAL  L02B111
            BRA   L024694
L02465A     LDA   $07
            SEC
            SBC   #$0011
            CMP   #$0011
            BCC   L024668
            LDA   #$0011
L024668     ASL
            TAX
            LDAL  L024670,X
            PHA
            RTS

L024670     DA    L02462B+1
            DA    L024692+1
            DA    L024692+1
            DA    L024692+1
            DA    L024692+1
            DA    L024641+1
            DA    L024692+1
            DA    L024692+1
            DA    L02462B+1
            DA    L024692+1
            DA    L024692+1
            DA    L024692+1
            DA    L024692+1
            DA    L024692+1
            DA    L024692+1
            DA    L024692+1
            DA    L02463B+1
L024692     DA    L024692+1
L024694     LDAL  L030015
            BNE   L02469D
            BRL   L0245F4
L02469D     PLD
            TSC
            CLC
            ADC   #$0008
            TCS
            RTL

L0246A5     JSL   L024E9F
            JSL   L020015
            _ShowCursor
            STAL  L02B111
            JSL   L0245DE
            JSL   L024ACF
            RTL

L0246C1     TSC
            SEC
            SBC   #$000A
            TCS
            PHD
            TCD
            PHA
            PHA
            LDA   #$0002
            PHA
            PEI   $10
            PEI   $0E
            PEI   $14
            PEI   $12
            _NewMenuBar2
            STAL  L02B111
            PLA
            STA   $07
            PLA
            STA   $09
            LDA   $12
            ORA   $14
            BEQ   L0246F1
            BRL   L02473E
L0246F1     PEI   $09
            PEI   $07
            _SetSysBar
            STAL  L02B111
            PEA   $0000
            PEA   $0000
            _SetMenuBar
            STAL  L02B111
            PEA   $0000
            PEA   $0000
            _RefreshDesktop
            STAL  L02B111
            LDA   #$0001
            PHA
            _FixAppleMenu
            STAL  L02B111
            PHA
            _FixMenuBar
            STAL  L02B111
            PLA
L02473E     _DrawMenuBar
            STAL  L02B111
            LDA   $07
            LDX   $09
            STA   $01
            STX   $03
            LDA   $0C
            STA   $14
            LDA   $0B
            STA   $13
            LDX   $03
            LDY   $01
            PLD
            TSC
            CLC
            ADC   #$0012
            TCS
            TYA
            RTL

L024766     TSC
            SEC
            SBC   #$0004
            TCS
            PHD
            TCD
            PHB
            PHB
            PLA
            STA   $03
            PEA   >L03003D
            PLB
            PLB
            PHA
            PHA
            _GetPort
            STAL  L02B111
            _DrawControls
            STAL  L02B111
            LDA   $03
            PHA
            PLB
            PLB
            PLD
            TSC
            CLC
            ADC   #$0004
            TCS
            RTL

L02479D     TSC
            SEC
            SBC   #$0004
            TCS
            PHD
            TCD
            PHB
            PHB
            PLA
            STA   $03
            PEA   >L03003D
            PLB
            PLB
            LDA   $06
            STA   $0E
            LDA   $05
            STA   $0D
            LDA   $03
            PHA
            PLB
            PLB
            PLD
            TSC
            CLC
            ADC   #$000C
            TCS
            RTL

L0247C4     TSC
            SEC
            SBC   #$000A
            TCS
            PHD
            TCD
            PHB
            PHB
            PLA
            STA   $09
            PEA   >L03003D
            PLB
            PLB
            LDY   #$0010
            LDA   [$0E],Y
            LDX   #$0000
            CMP   #$000F
            BNE   L0247E4
            INX
L0247E4     TXA
            LDX   #$0000
            TAY
            BPL   L0247EC
            DEX
L0247EC     STX   $03
            ORA   $03
            BEQ   L0247F8
            LDA   #$0001
            BRL   L02480C
L0247F8     LDY   #$0038
            LDA   [$0E],Y
            TAX
            LDY   #$0036
            LDA   [$0E],Y
            STX   $03
            ORA   $03
            BEQ   L02480C
            LDA   #$0001
L02480C     TAX
            BNE   L024812
            BRL   L02481A
L024812     LDA   #$0002
            STA   $01
            BRL   L02481C
L02481A     STZ   $01
L02481C     LDA   $0C
            STA   $10
            LDA   $0B
            STA   $0F
            LDY   $01
            LDA   $09
            PHA
            PLB
            PLB
            PLD
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            STA   $04,S
            RTL

L024836     TSC
            SEC
            SBC   #$000A
            TCS
            PHD
            TCD
            PHB
            PHB
            PLA
            STA   $09
            PEA   >L03003D
            PLB
            PLB
            LDY   #$0010
            LDA   [$0E],Y
            LDX   #$0000
            CMP   #$000F
            BNE   L024856
            INX
L024856     TXA
            LDX   #$0000
            TAY
            BPL   L02485E
            DEX
L02485E     STX   $03
            ORA   $03
            BEQ   L02486A
            LDA   #$0001
            BRL   L02487E
L02486A     LDY   #$0014
            LDA   [$0E],Y
            TAX
            LDY   #$0012
            LDA   [$0E],Y
            STX   $03
            ORA   $03
            BEQ   L02487E
            LDA   #$0001
L02487E     TAX
            BNE   L024884
            BRL   L02488C
L024884     LDA   #$0002
            STA   $01
            BRL   L02488E
L02488C     STZ   $01
L02488E     LDA   $0C
            STA   $10
            LDA   $0B
            STA   $0F
            LDY   $01
            LDA   $09
            PHA
            PLB
            PLB
            PLD
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            STA   $04,S
            RTL

L0248A8     TSC
            SEC
            SBC   #$0008
            TCS
            PHD
            TCD
            PHB
            PHB
            PLA
            STA   $07
            PEA   >L03003D
            PLB
            PLB
            LDA   L03004C
            ORA   L03004E
            BEQ   L0248C5
            BRL   L0248DC
L0248C5     PHA
            PHA
            _GetDblTime
            STAL  L02B111
            PLA
            STAL  L03004C
            PLA
            STAL  L03004E
L0248DC     LDA   [$0C]
            CMP   #$0003
            BEQ   L0248E6
            BRL   L024958
L0248E6     LDY   #$0004
            LDA   [$0C],Y
            PHA
            LDY   #$0002
            LDA   [$0C],Y
            PHA
            PLA
            AND   #$00FF
            PHA
            LDA   $03,S
            AND   #$0000
            STA   $03,S
            LDA   #$002E
            LDX   #$0000
            LDY   #$0001
            CMP   $01,S
            BEQ   L02490C
            DEY
L02490C     TXA
            CMP   $03,S
            BEQ   L024914
            LDY   #$0000
L024914     PLA
            PLA
            TYA
            BNE   L02491C
            BRL   L024958
L02491C     LDY   #$000E
            LDA   [$0C],Y
            AND   #$0100
            BNE   L024929
            BRL   L024958
L024929     LDY   #$0004
            LDA   [$0C],Y
            PHA
            LDY   #$0002
            LDA   [$0C],Y
            PHA
            PLA
            AND   #$FF00
            PHA
            LDA   $03,S
            AND   #$FFFF
            STA   $03,S
            PLA
            ORA   #$001B
            PHA
            LDA   $03,S
            ORA   #$0000
            STA   $03,S
            LDY   #$0002
            PLA
            STA   [$0C],Y
            INY
            INY
            PLA
            STA   [$0C],Y
L024958     LDA   [$0C]
            CMP   #$0001
            BEQ   L024962
            BRL   L024A45
L024962     LDY   #$000A
            LDA   [$0C],Y
            STA   $01
            LDAL  L030042
            SEC
            SBC   $01
            BEQ   L024979
            BVS   L024977
            EOR   #$8000
L024977     BMI   L02497C
L024979     BRL   L024A45
L02497C     LDY   #$000A
            LDA   [$0C],Y
            BMI   L02498A
            CMP   #$0032
            BEQ   L02498A
            BCS   L02498D
L02498A     BRL   L024A45
L02498D     LDY   #$000A
            TYA
            CLC
            ADC   #$0002
            TAY
            LDA   [$0C],Y
            BMI   L0249A2
            CMP   #$01C7
            BCC   L0249A2
            BRL   L024A45
L0249A2     LDY   #$000A
            TYA
            CLC
            ADC   #$0002
            TAY
            LDA   [$0C],Y
            BMI   L0249B6
            CMP   #$0041
            BEQ   L0249B6
            BCS   L0249B9
L0249B6     BRL   L024A45
L0249B9     LDY   #$0008
            LDA   [$0C],Y
            PHA
            LDY   #$0006
            LDA   [$0C],Y
            PHA
            LDAL  L03004E
            PHA
            LDAL  L03004C
            PHA
            LDAL  L030046
            PHA
            LDAL  L030044
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLY
            PLA
            LDX   #$0001
            CMP   $03,S
            BNE   L0249F0
            TYA
            CMP   $01,S
L0249F0     BEQ   L0249F4
            BCS   L0249F5
L0249F4     DEX
L0249F5     PLA
            PLA
            TXA
            BNE   L0249FD
            BRL   L024A31
L0249FD     LDA   #$0003
            STA   [$0C]
            LDY   #$0004
            LDA   [$0C],Y
            PHA
            LDY   #$0002
            LDA   [$0C],Y
            PHA
            PLA
            AND   #$FF00
            PHA
            LDA   $03,S
            AND   #$FFFF
            STA   $03,S
            PLA
            ORA   #$000D
            PHA
            LDA   $03,S
            ORA   #$0000
            STA   $03,S
            LDY   #$0002
            PLA
            STA   [$0C],Y
            INY
            INY
            PLA
            STA   [$0C],Y
L024A31     LDY   #$0008
            LDA   [$0C],Y
            TAX
            LDY   #$0006
            LDA   [$0C],Y
            STAL  L030044
            TXA
            STAL  L030046
L024A45     LDA   $0A
            STA   $0E
            LDA   $09
            STA   $0D
            LDA   $07
            PHA
            PLB
            PLB
            PLD
            TSC
            CLC
            ADC   #$000C
            TCS
            RTL

L024A5A     TSC
            SEC
            SBC   #$0006
            TCS
            PHD
            TCD
            LDX   $03
            PHX
            TSX
            STX   $03
            JSL   L02AE55
            TAY
            LDA   $03
            TCS
            PLA
            STA   $03
            TYA
            STAL  L030035
            PHA
            PHA
            LDAL  L030035
            PHA
            LDA   #$000A
            PHA
            PEA   $0000
            PEA   $0001
            _StartUpTools
            STAL  L02B111
            PLA
            STAL  L030048
            PLA
            STAL  L03004A
            LDX   $03
            PHX
            TSX
            STX   $03
            JSL   L02AE36
            TAY
            LDA   $03
            TCS
            PLA
            STA   $03
            TYA
            TAX
            BNE   L024AB6
            BRL   L024ABE
L024AB6     LDA   #$FFFF
            STA   $05
            BRL   L024AC0
L024ABE     STZ   $05
L024AC0     LDA   $05
            STA   $01
            LDY   $01
            PLD
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            RTL

L024ACF     PHA
            TSC
            PHD
            TCD
            LDA   #$0001
            PHA
            LDAL  L03004A
            PHA
            LDAL  L030048
            PHA
            _ShutDownTools
            STAL  L02B111
            PLD
            PLY
            RTL

L024AEF     TSC
            SEC
            SBC   #$0040
            TCS
            PHD
            TCD
            LDA   #$0000
            STA   $0B
            LDA   #$0001
            LDX   #$0000
            TAY
            BPL   L024B06
            DEX
L024B06     PHX
            PHA
            PEA   $0000
            PEA   $0004
            JSL   L02C5AD
            PEA   $0000
            TDC
            CLC
            ADC   #$0044
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            LDA   #$0001
            LDX   #$0000
            TAY
            BPL   L024B30
            DEX
L024B30     PHX
            PHA
            PEA   $0000
            PEA   $0004
            JSL   L02C5AD
            PEA   $0000
            TDC
            CLC
            ADC   #$0039
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            STA   $03
            PLA
            STA   $05
            LDA   $01,S
            STA   [$03]
            LDY   #$0002
            LDA   $03,S
            STA   [$03],Y
            LDA   #$0000
            LDX   #$0000
            TAY
            BPL   L024B6B
            DEX
L024B6B     PHX
            PHA
            PEA   $0000
            PEA   $0004
            JSL   L02C5AD
            PEA   $0000
            TDC
            CLC
            ADC   #$0039
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            STA   $03
            PLA
            STA   $05
            LDA   $01,S
            STA   [$03]
            LDY   #$0002
            LDA   $03,S
            STA   [$03],Y
            PLA
            PLA
L024B9E     LDA   #$FFFF
            LDX   #$0000
            TAY
            BPL   L024BA8
            DEX
L024BA8     PHX
            PHA
            PEA   $0000
            PEA   $0004
            JSL   L02C5AD
            LDA   #$0000
            LDX   #$0000
            TAY
            BPL   L024BBE
            DEX
L024BBE     PHX
            PHA
            PEA   $0000
            PEA   $0004
            JSL   L02C5AD
            PEA   $0000
            TDC
            CLC
            ADC   #$0039
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            STA   $0D
            PLA
            STA   $0F
            PEA   $0000
            PEA   $0004
            PEA   $0000
            PEA   $0001
            JSL   L02C5AD
            LDY   #$0002
            LDA   [$0D],Y
            PHA
            LDA   [$0D]
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            LDA   $01,S
            STA   [$0D]
            LDY   #$0002
            LDA   $03,S
            STA   [$0D],Y
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $03
            STX   $05
            LDY   #$0002
            LDA   [$03],Y
            PHA
            LDA   [$03]
            PHA
            LDA   $01,S
            STA   $07
            LDA   $03,S
            STA   $09
            PLA
            STA   $03
            PLA
            ORA   $03
            BNE   L024C40
            BRL   L024C64
L024C40     LDA   #$000A
            LDX   #$0001
            SEC
            SBC   $0B
            BEQ   L024C52
            BVS   L024C50
            EOR   #$8000
L024C50     BMI   L024C53
L024C52     DEX
L024C53     TXA
            LDX   #$0000
            TAY
            BPL   L024C5B
            DEX
L024C5B     STX   $03
            ORA   $03
            BEQ   L024C64
            LDA   #$0001
L024C64     TAY
            BNE   L024C6A
            BRL   L024CAF
L024C6A     PEI   $09
            PEI   $07
            LDA   $0B
            INC   $0B
            LDX   #$0000
            TAY
            BPL   L024C79
            DEX
L024C79     PHX
            PHA
            PEA   $0000
            PEA   $0004
            JSL   L02C5AD
            PEA   $0000
            TDC
            CLC
            ADC   #$0011
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            STA   $03
            PLA
            STA   $05
            LDA   $01,S
            STA   [$03]
            LDY   #$0002
            LDA   $03,S
            STA   [$03],Y
            PLA
            PLA
            BRL   L024B9E
L024CAF     PEA   $0000
            TDC
            CLC
            ADC   #$0039
            PHA
            JSL   L02AE5A
            PHA
            LDA   #$0004
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0011
            PHA
            PEI   $46
            PEI   $44
            _AlertWindow
            STAL  L02B111
            PLA
            STA   $01
            BRL   L024CDF
L024CDF     LDA   $42
            STA   $46
            LDA   $41
            STA   $45
            LDY   $01
            PLD
            TSC
            CLC
            ADC   #$0044
            TCS
            TYA
            RTL

L024CF2     TSC
            SEC
            SBC   #$000E
            TCS
            PHD
            TCD
            PHA
            PHA
            _FindTargetCtl
            STAL  L02B111
            PLA
            STA   $0B
            PLA
            STA   $0D
            LDX   $09
            PHX
            TSX
            STX   $09
            JSL   L02AE36
            TAY
            LDA   $09
            TCS
            PLA
            STA   $09
            TYA
            TAX
            BNE   L024D25
            BRL   L024D32
L024D25     LDA   #$0000
            STA   $01
            LDA   #$0000
            STA   $03
            BRL   L024DA9
L024D32     PHA
            PEI   $0D
            PEI   $0B
            _GetCtlMoreFlags
            STAL  L02B111
            PLA
            AND   #$1000
            BNE   L024D4B
            BRL   L024D9F
L024D4B     LDY   #$0002
            LDA   [$0B],Y
            TAX
            LDA   [$0B]
            STA   $05
            STX   $07
            LDY   #$0016
            LDA   [$05],Y
            PHA
            LDY   #$0014
            LDA   [$05],Y
            PHA
            LDA   #$0000
            LDX   #$8300
            LDY   #$0001
            CMP   $01,S
            BEQ   L024D71
            DEY
L024D71     TXA
            CMP   $03,S
            BEQ   L024D79
            LDY   #$0000
L024D79     PLA
            PLA
            TYA
            BNE   L024D81
            BRL   L024D9F
L024D81     LDY   #$0002
            LDA   [$0B],Y
            TAX
            LDA   [$0B]
            STA   $05
            STX   $07
            LDY   #$001E
            LDA   [$05],Y
            TAX
            LDY   #$001C
            LDA   [$05],Y
            STX   $03
            STA   $01
            BRL   L024DA9
L024D9F     LDA   #$0000
            STA   $01
            LDA   #$0000
            STA   $03
L024DA9     LDX   $03
            LDY   $01
            PLD
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            RTL

L024DB6     PHA
            TSC
            PHD
            TCD
            _GrafOff
            STAL  L02B111
            LDX   $01
            PHX
            TSX
            STX   $01
            PEA   ^L024E5C
            PEA   L024E5C
            JSL   L02A80B
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            LDX   $01
            PHX
            TSX
            STX   $01
            LDAL  L03002B
            PHA
            LDA   $06
            PHA
            PEA   ^L024E8F
            PEA   L024E8F
            JSL   L02A77E
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L02A66F
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L024ACF
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            LDX   $01
            PHX
            TSX
            STX   $01
            LDA   #$0001
            PHA
            JSL   L02A667
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            LDA   $04
            STA   $06
            LDA   $03
            STA   $05
            PLD
            TSC
            CLC
            ADC   #$0004
            TCS
            RTL

L024E5C     ASC   'A fatal error has occurred. Press any k'
            ASC   'ey to exit.'00
L024E8F     ASC   'Location %d: %X'00
L024E9F     PHA
            TSC
            PHD
            TCD
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L024A5A
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            TAX
            BNE   L024EBB
            BRL   L024ED1
L024EBB     LDX   $01
            PHX
            TSX
            STX   $01
            LDA   #$0001
            PHA
            JSL   L024DB6
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
L024ED1     LDX   $01
            PHX
            TSX
            STX   $01
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0001
            JSL   L0246C1
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            PLD
            PLY
            RTL

L024EF2     TSC
            SEC
            SBC   #$0012
            TCS
            PHD
            TCD
            LDAL  L030023
            TAX
            LDAL  L030021
            SEC
            SBC   #$0001
            BCS   L024F0A
            DEX
L024F0A     STX   $0D
            STA   $0B
            LDAL  L030019
            AND   #$0002
            BNE   L024F1A
            BRL   L024F82
L024F1A     LDA   #$0000
            STA   $07
            LDA   #$0000
            STA   $09
            LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            LDA   $01,S
            STA   $0F
            LDA   $03,S
            STA   $11
            PLA
            PLA
L024F38     PEI   $09
            PEI   $07
            LDX   $0D
            LDA   $0B
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L024F4C
            TYA
            CMP   $01,S
L024F4C     BEQ   L024F50
            BCS   L024F51
L024F50     DEX
L024F51     PLA
            PLA
            TXA
            BNE   L024F59
            BRL   L024F82
L024F59     LDA   [$0F]
            AND   #$00FF
            TAX
            BEQ   L024F64
            BRL   L024F6D
L024F64     SEP   #$20
            LDA   [$0F]
            INC
            STA   [$0F]
            REP   #$20
L024F6D     INC   $07
            BNE   L024F73
            INC   $09
L024F73     PEI   $11
            PEI   $0F
            INC   $0F
            BNE   L024F7D
            INC   $11
L024F7D     PLA
            PLA
            BRL   L024F38
L024F82     PLD
            TSC
            CLC
            ADC   #$0012
            TCS
            RTL

L024F8A     PHA
            TSC
            PHD
            TCD
            LDAL  L030019
            AND   #$0004
            BEQ   L024F9A
            BRL   L025009
L024F9A     PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            LDA   #$0002
            PHA
            PEA   $0000
            PEA   $0FFA
            LDA   #$800E
            PHA
            _NewWindow2
            STAL  L02B111
            PLA
            STAL  L030001
            PLA
            STAL  L030003
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L02AE36
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            STAL  L03002B
            TAX
            BNE   L024FF3
            BRL   L025009
L024FF3     LDX   $01
            PHX
            TSX
            STX   $01
            LDA   #$001F
            PHA
            JSL   L024DB6
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
L025009     LDAL  L030019
            AND   #$0008
            BEQ   L025015
            BRL   L0250DF
L025015     LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            _ShowWindow
            STAL  L02B111
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L02AE36
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            STAL  L03002B
            TAX
            BNE   L025046
            BRL   L02505C
L025046     LDX   $01
            PHX
            TSX
            STX   $01
            LDA   #$0020
            PHA
            JSL   L024DB6
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
L02505C     LDA   #$0109
            PHA
            _DisableMItem
            STAL  L02B111
            LDA   #$0115
            PHA
            _DisableMItem
            STAL  L02B111
            LDA   #$0113
            PHA
            _DisableMItem
            STAL  L02B111
            LDA   #$0114
            PHA
            _DisableMItem
            STAL  L02B111
            LDA   #$0112
            PHA
            _DisableMItem
            STAL  L02B111
            LDA   #$0104
            PHA
            _DisableMItem
            STAL  L02B111
            LDA   #$010E
            PHA
            _DisableMItem
            STAL  L02B111
            LDA   #$010F
            PHA
            _DisableMItem
            STAL  L02B111
            LDAL  L030019
            ORA   #$000C
            STAL  L030019
L0250DF     PLD
            PLY
            RTL

L0250E2     TSC
            SEC
            SBC   #$0014
            TCS
            PHD
            TCD
            LDAL  L03002B
            BMI   L0250F8
            CMP   #$0072
            BCC   L0250F8
            BRL   L025119
L0250F8     PHA
            LDA   #$0000
            PHA
            PEA   $0000
            PEA   $0000
            LDAL  L03002B
            PHA
            _ErrorWindow
            STAL  L02B111
            PLA
            STA   $07
            BRL   L0251EE
L025119     LDAL  L03002B
            CMP   #$0086
            BEQ   L025125
            BRL   L0251A8
L025125     PHA
            PHA
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _GetHandleSize
            STAL  L02B111
            PEA   $0000
            PEA   $000A
            JSL   L02B0CB
            PLA
            STA   $09
            PLA
            STA   $0B
            LDA   $09
            ORA   $0B
            BEQ   L025155
            BRL   L02515F
L025155     LDA   #$0001
            STA   $09
            LDA   #$0000
            STA   $0B
L02515F     LDX   $05
            PHX
            TSX
            STX   $05
            PEI   $0B
            PEI   $09
            PEA   ^L0251F6
            PEA   L0251F6
            PEA   $0000
            TDC
            CLC
            ADC   #$000D
            PHA
            JSL   L02AA15
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            PHA
            LDA   #$0000
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$000D
            PHA
            LDAL  L03002B
            PHA
            _ErrorWindow
            STAL  L02B111
            PLA
            STA   $07
            BRL   L0251EE
L0251A8     LDX   $05
            PHX
            TSX
            STX   $05
            LDAL  L03002B
            PHA
            PEA   ^L0251FA
            PEA   L0251FA
            PEA   $0000
            TDC
            CLC
            ADC   #$000D
            PHA
            JSL   L02AA15
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            PHA
            LDA   #$0000
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$000D
            PHA
            LDA   #$0072
            PHA
            _ErrorWindow
            STAL  L02B111
            PLA
            STA   $07
L0251EE     PLD
            TSC
            CLC
            ADC   #$0014
            TCS
            RTL

L0251F6     ASC   '%ld'00
L0251FA     ASC   '%X'00

L0251FD     TSC
            SEC
            SBC   #$0022
            TCS
            PHD
            TCD
            LDA   #$0004
            STAL  L0400B8
            LDX   $28
            LDA   $26
            STAL  L0400BC
            TXA
            STAL  L0400BE
            LDA   #$0002
            STAL  L0400C0
            LDA   #$0001
            STAL  L0400C2
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2010
            PHA
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L02525F
            BRL   L025274
L02525F     LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            BRL   L02536D
L025274     LDA   #$0003
            STA   $19
            LDAL  L0400BA
            PHA
            PLA
            STA   $1B
            STA   $09
            STZ   $1D
            LDA   #$000C
            STA   $1F
            LDA   #$0000
            STA   $21
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2016
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0019
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L0252CA
            BRL   L0252E0
L0252CA     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0006
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L0252E0     LDA   #$0004	; write suffix
            STA   $07
            LDA   #L040000
            STA   $0B
            LDA   #^L040000
            STA   $0D

*            LDA   #$0033
*            STA   $0F
	lda	L030021
	and	#$ff
	sta	$0f
	lda	#256
	sec
	sbc	$0f
	sta	$0f

            LDA   #$0000
            STA   $11
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2013
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0007
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L025334
            BRL   L02534A
L025334     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0007
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L02534A     LDA   #$0001
            STAL  L0400B8
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2014
            PHA
            PEA   ^L0400B8
            PEA   L0400B8
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L02536D     LDA   $24
            STA   $28
            LDA   $23
            STA   $27
            PLD
            TSC
            CLC
            ADC   #$0026
            TCS
            RTL

L02537D     TSC
            SEC
            SBC   #$0004
            TCS
            PHD
            TCD
            LDAL  L030019
            AND   #$0001
            BNE   L025391
            BRL   L0253E3
L025391     PHA
            LDA   #$0005
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0002
            _AlertWindow
            STAL  L02B111
            PLA
            STA   $03
            LDA   $03
            TAX
            BEQ   L0253B8
            LDA   #$0001
L0253B8     EOR   #$0001
            BNE   L0253C0
            BRL   L0253C3
L0253C0     BRL   L02544D
L0253C3     LDA   $03
            CMP   #$0002
            BEQ   L0253CD
            BRL   L0253E3
L0253CD     LDX   $01
            PHX
            TSX
            STX   $01
            LDA   #$0001
            PHA
            JSL   L0209F9
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
L0253E3     LDA   #$FFFF
            STAL  L030015
            LDAL  L030019
            AND   #$0002
            BNE   L0253F6
            BRL   L02540B
L0253F6     LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
L02540B     LDAL  L030019
            AND   #$0004
            BNE   L025417
            BRL   L02542C
L025417     LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            _CloseWindow
            STAL  L02B111
L02542C     LDAL  L030019
            AND   #$0010
            BNE   L025438
            BRL   L02544D
L025438     LDAL  L03001F
            PHA
            LDAL  L03001D
            PHA
            _CloseWindow
            STAL  L02B111
L02544D     PLD
            TSC
            CLC
            ADC   #$0004
            TCS
            RTL

L025455     PHA
            TSC
            PHD
            TCD
            LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            PEA   $0000
            PEA   $0002
            LDX   $01
            PHX
            TSX
            STX   $01
            PEI   $08
            PEI   $06
            JSL   L02A628
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            PHX
            PHA
            _SetLETextByID
            STAL  L02B111
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L02AE36
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            STAL  L03002B
            TAX
            BNE   L0254A8
            BRL   L0254BE
L0254A8     LDX   $01
            PHX
            TSX
            STX   $01
            LDA   #$00E7
            PHA
            JSL   L024DB6
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
L0254BE     LDX   $01
            PHX
            TSX
            STX   $01
            LDAL  L03003B
            PHA
            LDAL  L030039
            PHA
            PEA   ^L0256B4
            PEA   L0256B4
            PEI   $08
            PEI   $06
            JSL   L02AA15
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            PEA   $0000
            PEA   $0009
            LDX   $01
            PHX
            TSX
            STX   $01
            PEI   $08
            PEI   $06
            JSL   L02A628
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            PHX
            PHA
            _SetLETextByID
            STAL  L02B111
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L02AE36
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            STAL  L03002B
            TAX
            BNE   L025533
            BRL   L025549
L025533     LDX   $01
            PHX
            TSX
            STX   $01
            LDA   #$00E8
            PHA
            JSL   L024DB6
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
L025549     LDX   $01
            PHX
            TSX
            STX   $01
            LDAL  L03000D
            PHA
            PEA   ^L0256B8
            PEA   L0256B8
            PEI   $08
            PEI   $06
            JSL   L02AA15
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            PEA   $0000
            PEA   $0006
            LDX   $01
            PHX
            TSX
            STX   $01
            PEI   $08
            PEI   $06
            JSL   L02A628
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            PHX
            PHA
            _SetLETextByID
            STAL  L02B111
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L02AE36
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            STAL  L03002B
            TAX
            BNE   L0255B9
            BRL   L0255CF
L0255B9     LDX   $01
            PHX
            TSX
            STX   $01
            LDA   #$00E9
            PHA
            JSL   L024DB6
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
L0255CF     LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            _ShowWindow
            STAL  L02B111
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L02AE36
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            STAL  L03002B
            TAX
            BNE   L025600
            BRL   L025616
L025600     LDX   $01
            PHX
            TSX
            STX   $01
            LDA   #$0018
            PHA
            JSL   L024DB6
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
L025616     LDA   #$0109
            PHA
            _DisableMItem
            STAL  L02B111
            LDA   #$0112
            PHA
            _DisableMItem
            STAL  L02B111
            LDA   #$0115
            PHA
            _DisableMItem
            STAL  L02B111
            LDA   #$0113
            PHA
            _DisableMItem
            STAL  L02B111
            LDA   #$0114
            PHA
            _DisableMItem
            STAL  L02B111
            LDA   #$0104
            PHA
            _DisableMItem
            STAL  L02B111
            LDA   #$010E
            PHA
            _DisableMItem
            STAL  L02B111
            LDA   #$010F
            PHA
            _DisableMItem
            STAL  L02B111
            LDAL  L030019
            ORA   #$000F
            STAL  L030019
            LDAL  L030019
            AND   #$FFBF
            STAL  L030019
            LDA   $04
            STA   $08
            LDA   $03
            STA   $07
            PLD
            TSC
            CLC
            ADC   #$0006
            TCS
            RTL

L0256B4     AND   $6C
            STZ   $00
L0256B8     AND   $64
L0256BA     BRK   $3B
            SEC
            SBC   #$0010
            TCS
            PHD
            TCD
            LDA   $14
            LDX   $16
            STA   $09
            STX   $0B
            LDA   $18
            LDX   $1A
            STA   $0D
            STX   $0F
L0256D3     LDX   $07
            PHX
            TSX
            STX   $07
            LDA   [$09]
            AND   #$00FF
            PHA
            JSL   L02AE3B
            TAY
            LDA   $07
            TCS
            PLA
            STA   $07
            TYA
            PHA
            LDX   $07
            PHX
            TSX
            STX   $07
            LDA   [$0D]
            AND   #$00FF
            PHA
            JSL   L02AE3B
            TAY
            LDA   $07
            TCS
            PLA
            STA   $07
            TYA
            SEC
            SBC   $01,S
            PLX
            TAX
            BEQ   L02570E
            BRL   L025733
L02570E     LDA   [$09]
            AND   #$00FF
            TAX
            BNE   L025719
            BRL   L025733
L025719     LDA   [$0D]
            AND   #$00FF
            TAX
            BNE   L025724
            BRL   L025733
L025724     INC   $09
            BNE   L02572A
            INC   $0B
L02572A     INC   $0D
            BNE   L025730
            INC   $0F
L025730     BRL   L0256D3
L025733     LDX   $07
            PHX
            TSX
            STX   $07
            LDA   [$09]
            AND   #$00FF
            PHA
            JSL   L02AE3B
            TAY
            LDA   $07
            TCS
            PLA
            STA   $07
            TYA
            PHA
            LDX   $07
            PHX
            TSX
            STX   $07
            LDA   [$0D]
            AND   #$00FF
            PHA
            JSL   L02AE3B
            TAY
            LDA   $07
            TCS
            PLA
            STA   $07
            TYA
            PLY
            STY   $03
            SEC
            SBC   $03
            BEQ   L025773
            BVS   L025771
            EOR   #$8000
L025771     BMI   L025776
L025773     BRL   L02577E
L025776     LDA   #$FFFF
            STA   $01
            BRL   L0257CB
L02577E     LDX   $07
            PHX
            TSX
            STX   $07
            LDA   [$0D]
            AND   #$00FF
            PHA
            JSL   L02AE3B
            TAY
            LDA   $07
            TCS
            PLA
            STA   $07
            TYA
            PHA
            LDX   $07
            PHX
            TSX
            STX   $07
            LDA   [$09]
            AND   #$00FF
            PHA
            JSL   L02AE3B
            TAY
            LDA   $07
            TCS
            PLA
            STA   $07
            TYA
            PLY
            STY   $03
            SEC
            SBC   $03
            BEQ   L0257BE
            BVS   L0257BC
            EOR   #$8000
L0257BC     BMI   L0257C1
L0257BE     BRL   L0257C9
L0257C1     LDA   #$0001
            STA   $01
            BRL   L0257CB
L0257C9     STZ   $01
L0257CB     LDA   $12
            STA   $1A
            LDA   $11
            STA   $19
            LDY   $01
            PLD
            TSC
            CLC
            ADC   #$0018
            TCS
            TYA
            RTL

L0257DE     TSC
            SEC
            SBC   #$021D
            TCS
            PHD
            TCD
            LDA   #$0009
            LDX   #$013C
            STA   $00,X
            LDX   #$013E
            LDA   #$0003
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDA   #$006D
            LDX   #$0142
            STA   $00,X
            LDA   #$0028
            LDX   #$0144
            STA   $00,X
            LDA   #$007B
            LDX   #$0146
            STA   $00,X
            LDA   #$006E
            LDX   #$0148
            STA   $00,X
            LDX   #$014A
            LDA   #$0000
            STA   $00,X
            LDA   #$8000
            STA   $02,X
            LDA   #$0001
            LDX   #$014E
            STA   $00,X
            LDA   #$3000
            LDX   #$0150
            STA   $00,X
            LDX   #$0152
            LDA   #$0000
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            PEA   ^L0266D0
            PEA   L0266D0
            LDX   #$0156
            PLA
            STA   $00,X
            PLA
            STA   $02,X
            LDX   #$015A
            LDA   #$0000
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            SEP   #$20
            LDA   #$0D
            LDX   #$015E
            STA   $00,X
            REP   #$20
            SEP   #$20
            LDA   #$8D
            LDX   #$015F
            STA   $00,X
            REP   #$20
            LDX   #$0160
            STZ   $00,X
            LDX   #$0162
            STZ   $00,X
            LDA   #$0009
            LDX   #$0164
            STA   $00,X
            LDX   #$0166
            LDA   #$0001
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDA   #$006C
            LDX   #$016A
            STA   $00,X
            LDA   #$015E
            LDX   #$016C
            STA   $00,X
            LDA   #$007C
            LDX   #$016E
            STA   $00,X
            LDA   #$01A4
            LDX   #$0170
            STA   $00,X
            LDX   #$0172
            LDA   #$0000
            STA   $00,X
            LDA   #$8000
            STA   $02,X
            LDX   #$0176
            STZ   $00,X
            LDA   #$3000
            LDX   #$0178
            STA   $00,X
            LDX   #$017A
            LDA   #$0001
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            PEA   ^L0266D6
            PEA   L0266D6
            LDX   #$017E
            PLA
            STA   $00,X
            PLA
            STA   $02,X
            LDX   #$0182
            LDA   #$0000
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            SEP   #$20
            LDA   #$9B
            LDX   #$0186
            STA   $00,X
            REP   #$20
            SEP   #$20
            LDA   #$1B
            LDX   #$0187
            STA   $00,X
            REP   #$20
            LDX   #$0188
            STZ   $00,X
            LDX   #$018A
            STZ   $00,X
            LDA   #$000E
            LDX   #$018C
            STA   $00,X
            LDX   #$018E
            LDA   #$0002
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDA   #$0014
            LDX   #$0192
            STA   $00,X
            LDA   #$0014
            LDX   #$0194
            STA   $00,X
            LDA   #$0064
            LDX   #$0196
            STA   $00,X
            LDA   #$019A
            LDX   #$0198
            STA   $00,X
            LDX   #$019A
            LDA   #$0000
            STA   $00,X
            LDA   #$8900
            STA   $02,X
            LDX   #$019E
            STZ   $00,X
            LDA   #$7400
            LDX   #$01A0
            STA   $00,X
            LDX   #$01A2
            LDA   #$0042
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDX   #$01A6
            STZ   $00,X
            LDA   #$0008
            LDX   #$01A8
            STA   $00,X
            LDA   #$0003
            LDX   #$01AA
            STA   $00,X
            LDA   #$0001
            LDX   #$01AC
            STA   $00,X
            LDX   #$01AE
            LDA   #$0000
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDA   #$000A
            LDX   #$01B2
            STA   $00,X
            LDA   #$0006
            LDX   #$01B4
            STA   $00,X
            LDX   #$01B6
            LDA   #$0000
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDX   #$01BA
            LDA   #$0000
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDX   #$01BE
            TDC
            CLC
            ADC   #$013C
            STA   $00,X
            STZ   $02,X
            LDX   #$01C2
            TDC
            CLC
            ADC   #$0164
            STA   $00,X
            STZ   $02,X
            LDX   #$01C6
            TDC
            CLC
            ADC   #$018C
            STA   $00,X
            STZ   $02,X
            LDX   #$01CA
            LDA   #$0000
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDA   #$0050
            LDX   #$01CE
            STA   $00,X
            LDA   #$0060
            LDX   #$01D0
            STA   $00,X
            LDX   #$01D2
            LDA   #$0000
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDX   #$01D6
            LDA   #$002A
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDA   #$000A
            LDX   #$01DA
            STA   $00,X
            LDA   #$0014
            LDX   #$01DC
            STA   $00,X
            LDA   #$0244
            LDX   #$01DE
            STA   $00,X
            LDA   #$00B4
            LDX   #$01E0
            STA   $00,X
            LDX   #$01E2
            LDA   #$0000
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDX   #$01E6
            STZ   $00,X
            LDX   #$01E8
            STZ   $00,X
            LDX   #$01EA
            STZ   $00,X
            LDX   #$01EC
            STZ   $00,X
            LDX   #$01EE
            STZ   $00,X
            LDX   #$01F0
            STZ   $00,X
            LDX   #$01F2
            STZ   $00,X
            LDX   #$01F4
            STZ   $00,X
            LDX   #$01F6
            STZ   $00,X
            LDX   #$01F8
            STZ   $00,X
            LDX   #$01FA
            LDA   #$0000
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDX   #$01FE
            STZ   $00,X
            LDX   #$0200
            LDA   #$0000
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDX   #$0204
            LDA   #$0000
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDX   #$0208
            LDA   #$0000
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDA   #$001E
            LDX   #$020C
            STA   $00,X
            LDA   #$002D
            LDX   #$020E
            STA   $00,X
            LDA   #$00AA
            LDX   #$0210
            STA   $00,X
            LDA   #$020D
            LDX   #$0212
            STA   $00,X
            LDX   #$0214
            LDA   #$FFFF
            STA   $00,X
            LDA   #$FFFF
            STA   $02,X
            TDC
            CLC
            ADC   #$01BE
            LDX   #$0000
            TXY
            LDX   #$0218
            STA   $00,X
            STY   $02,X
            LDA   #$0003
            LDX   #$021C
            STA   $00,X
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L020FED
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            TAX
            BEQ   L025B19
            BRL   L025B1C
L025B19     BRL   L0266C8
L025B1C     LDA   #$0003
            STAL  L0400FA
            LDA   #$0003
            STAL  L040100
            STZ   $0B
            LDA   #$004B
            PHA
            LDA   #$0028
            PHA
            LDA   #$0000
            PHA
            PEA   ^L0266DE
            PEA   L0266DE
            PEA   ^L0247C4
            PEA   L0247C4
            PEA   $0000
            PEA   $0000
            PEA   ^L0400F2
            PEA   L0400F2
            _SFGetFile2
            STAL  L02B111
            LDAL  L0400F2
            BNE   L025B64
            BRL   L0266C8
L025B64     LDAL  L0400FE
            TAX
            LDAL  L0400FC
            STAL  L030005
            TXA
            STAL  L030007
            LDAL  L030007
            TAX
            LDAL  L030005
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STAL  L030009
            TXA
            STAL  L03000B
            PHA
            LDA   #$8001
            PHA
            PEA   $0000
            PEA   $0000
            LDAL  L03000B
            PHA
            LDAL  L030009
            PHA
            PLA
            CLC
            ADC   #$0002
            BCC   L025BB3
            PLX
            INX
            PHX
L025BB3     PHA
            _OpenResourceFile
            STAL  L02B111
            PLA
            STA   $0D
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L025BDE
            BRL   L025C81
L025BDE     LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L025C21
            BRL   L025C37
L025C21     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0334
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L025C37     LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L025C68
            BRL   L025C7E
L025C68     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0335
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L025C7E     BRL   L0266C8
L025C81     PHA
            LDA   #$0001
            PHA
            _SetResourceFileDepth
            STAL  L02B111
            PLA
            STA   $0F
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L025CB0
            BRL   L025CC6
L025CB0     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0009
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L025CC6     PHA
            PHA
            LDA   #$8024
            PHA
            _CountResources
            STAL  L02B111
            PLA
            STA   $23
            PLA
            STA   $25
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L025CF9
            BRL   L025D0F
L025CF9     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$000A
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L025D0F     LDA   $23
            ORA   $25
            BEQ   L025D18
            BRL   L025D65
L025D18     PHA
            LDA   $0F
            PHA
            _SetResourceFileDepth
            STAL  L02B111
            PLA
            STA   $0F
            LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            LDA   $0D
            PHA
            _CloseResourceFile
            STAL  L02B111
            BRL   L0266C8
L025D65     LDX   $05
            PHX
            TSX
            STX   $05
            PEI   $25
            PEI   $23
            PEA   $0000
            PEA   $0006
            JSL   L02C5AD
            JSL   L02C21D
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STX   $19
            STA   $17
            LDX   $05
            PHX
            TSX
            STX   $05
            PEI   $25
            PEI   $23
            PEA   $0000
            PEA   $0104
            JSL   L02C5AD
            JSL   L02C21D
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STX   $2D
            STA   $2B
            PEA   $0000
            PEA   $000A
            PEI   $25
            PEI   $23
            JSL   L02C444
            BEQ   L025DC0
            BRL   L025DC9
L025DC0     PEA   $0000
            PEA   $000A
            BRL   L025DCD
L025DC9     PEI   $25
            PEI   $23
L025DCD     PEA   $0000
            PEA   $000A
            JSL   L02C5AD
            PLA
            CLC
            ADC   #$0034
            BCC   L025DE1
            PLX
            INX
            PHX
L025DE1     PHA
            PLA
            PLX
            STAL  L030042
            STZ   $11
            PEA   $0000
            PEA   $0001
            LDA   $01,S
            STA   $13
            LDA   $03,S
            STA   $15
            PLA
            PLA
            PEI   $19
            PEI   $17
            LDA   $01,S
            STA   $1B
            LDA   $03,S
            STA   $1D
            PLA
            PLA
            PEI   $2D
            PEI   $2B
            LDA   $01,S
            STA   $2F
            LDA   $03,S
            STA   $31
            PLA
            PLA
L025E16     PEI   $25
            PEI   $23
            LDA   $11
            LDX   #$0000
            TAY
            BPL   L025E23
            DEX
L025E23     PHX
            PHA
            JSL   L02C444
            BNE   L025E2E
            BRL   L025F8E
L025E2E     PHA
            PHA
            LDA   #$8024
            PHA
            PEI   $15
            PEI   $13
            _GetIndResource
            STAL  L02B111
            LDY   #$0100
            PLA
            STA   [$2F],Y
            INY
            INY
            PLA
            STA   [$2F],Y
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L025E6A
            BRL   L025E80
L025E6A     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$000B
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L025E80     LDA   #$8024
            PHA
            LDY   #$0102
            LDA   [$2F],Y
            PHA
            LDY   #$0100
            LDA   [$2F],Y
            PHA
            PEI   $31
            PEI   $2F
            _RMGetResourceName
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            CMP   #$1E10
            BNE   L025EBD
            BRL   L025EC9
L025EBD     LDAL  L03002B
            CMP   #$1E11
            BEQ   L025EC9
            BRL   L025EF4
L025EC9     LDX   $05
            PHX
            TSX
            STX   $05
            LDY   #$0102
            LDA   [$2F],Y
            PHA
            LDY   #$0100
            LDA   [$2F],Y
            PHA
            PEA   ^L0266ED
            PEA   L0266ED
            PEI   $31
            PEI   $2F
            JSL   L02AA15
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            BRL   L025F44
L025EF4     LDAL  L03002B
            BNE   L025EFD
            BRL   L025F16
L025EFD     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$000C
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            BRL   L025F44
L025F16     LDX   $05
            PHX
            TSX
            STX   $05
            LDX   $05
            PHX
            TSX
            STX   $05
            PEI   $31
            PEI   $2F
            JSL   L02A73C
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            PHX
            PHA
            PEI   $31
            PEI   $2F
            JSL   L02AB57
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L025F44     PEI   $31
            PEI   $2F
            PLA
            STA   [$1B]
            LDY   #$0002
            PLA
            STA   [$1B],Y
            LDY   #$0004
            LDA   #$0000
            STA   [$1B],Y
            INC   $11
            PEI   $15
            PEI   $13
            INC   $13
            BNE   L025F65
            INC   $15
L025F65     PLA
            PLA
            PEI   $1D
            PEI   $1B
            CLC
            LDA   $1B
            ADC   #$0006
            STA   $1B
            BCC   L025F77
            INC   $1D
L025F77     PLA
            PLA
            PEI   $31
            PEI   $2F
            CLC
            LDA   $2F
            ADC   #$0104
            STA   $2F
            BCC   L025F89
            INC   $31
L025F89     PLA
            PLA
            BRL   L025E16
L025F8E     LDX   $05
            PHX
            TSX
            STX   $05
            PEA   ^L0256BA+1
            PEA   L0256BA+1
            PEA   $0000
            PEA   $0104
            PEI   $25
            PEI   $23
            PEI   $2D
            PEI   $2B
            JSL   L02A843
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDY   #$0004
            LDA   #$0080
            STA   [$17],Y
            LDA   $23
            LDX   #$01A6
            STA   $00,X
            LDX   #$01B6
            LDA   $17
            STA   $00,X
            LDA   $19
            STA   $02,X
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0043
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            LDA   #$0000
            PHA
            TDC
            CLC
            ADC   #$01CE
            LDX   #$0000
            PHX
            PHA
            LDA   #$800E
            PHA
            _NewWindow2
            STAL  L02B111
            PLA
            STA   $07
            PLA
            STA   $09
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L026027
            BRL   L02603D
L026027     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$000D
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L02603D     PEI   $09
            PEI   $07
            _SetPort
            STAL  L02B111
            LDA   #$0013
            PHA
            LDA   #$0010
            PHA
            _MoveTo
            STAL  L02B111
            PEA   ^L0266F1
            PEA   L0266F1
            _DrawCString
            STAL  L02B111
            PHA
            PHA
            PEI   $09
            PEI   $07
            PEA   $0000
            PEA   $0002
            _GetCtlHandleFromID
            STAL  L02B111
            PLA
            STA   $1F
            PLA
            STA   $21
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L0260A9
            BRL   L0260BF
L0260A9     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$000E
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L0260BF     STZ   $0B
L0260C1     PHA
            PHA
            PEA   ^L04008A
            PEA   L04008A
            PEA   $0000
            PEA   $0000
            PEA   ^L0248A8
            PEA   L0248A8
            PEA   $0000
            PEA   $0000
            LDA   #$0010
            PHA
            _DoModalWindow
            STAL  L02B111
            PLA
            STA   $13
            PLA
            STA   $15
            LDAL  L04008A
            CMP   #$0001
            BEQ   L0260FC
            BRL   L026123
L0260FC     PEI   $15
            PEI   $13
            LDA   #$0001
            LDX   #$0000
            LDY   #$0001
            CMP   $01,S
            BEQ   L02610E
            DEY
L02610E     TXA
            CMP   $03,S
            BEQ   L026116
            LDY   #$0000
L026116     PLA
            PLA
            TYA
            BNE   L02611E
            BRL   L026123
L02611E     LDA   #$FFFF
            STA   $0B
L026123     PEI   $15
            PEI   $13
            LDA   #$0003
            LDX   #$0000
            LDY   #$0001
            CMP   $01,S
            BEQ   L026135
            DEY
L026135     TXA
            CMP   $03,S
            BEQ   L02613D
            LDY   #$0000
L02613D     PLA
            PLA
            TYA
            BNE   L026145
            BRL   L026316
L026145     PHA
            LDA   #$0000
            PHA
            PEI   $21
            PEI   $1F
            _NextMember2
            STAL  L02B111
            PLA
            STA   $0B
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L026178
            BRL   L02618E
L026178     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$000F
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L02618E     PHA
            PHA
            LDA   #$8024
            PHA
            LDA   $0B
            DEC
            LDX   #$0000
            TAY
            BPL   L02619E
            DEX
L02619E     PHX
            PHA
            PEA   $0000
            PEA   $0104
            JSL   L02C5AD
            CLC
            PLA
            ADC   $2B
            PHA
            LDA   $03,S
            ADC   $2D
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            LDY   #$0102
            LDA   [$01],Y
            PHA
            LDY   #$0100
            LDA   [$01],Y
            PHA
            _LoadResource
            STAL  L02B111
            PLA
            STAL  L03002D
            PLA
            STAL  L03002F
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L0261F8
            BRL   L02625B
L0261F8     LDAL  L03002B
            CMP   #$0201
            BEQ   L026204
            BRL   L02620B
L026204     LDA   #$0086
            STAL  L03002B
L02620B     LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            PEI   $09
            PEI   $07
            _CloseWindow
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            PEI   $19
            PEI   $17
            JSL   L02C1EF
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            PEI   $2D
            PEI   $2B
            JSL   L02C1EF
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            BRL   L0266C8
L02625B     LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _HLock
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L02628C
            BRL   L0262A2
L02628C     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0010
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L0262A2     LDA   #$8024
            PHA
            LDA   $0B
            DEC
            LDX   #$0000
            TAY
            BPL   L0262B0
            DEX
L0262B0     PHX
            PHA
            PEA   $0000
            PEA   $0104
            JSL   L02C5AD
            CLC
            PLA
            ADC   $2B
            PHA
            LDA   $03,S
            ADC   $2D
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            LDY   #$0102
            LDA   [$01],Y
            PHA
            LDY   #$0100
            LDA   [$01],Y
            PHA
            _DetachResource
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L026300
            BRL   L026316
L026300     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0011
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L026316     LDA   $0B
            BNE   L02631D
            BRL   L0260C1
L02631D     PEI   $09
            PEI   $07
            _CloseWindow
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L026348
            BRL   L02635E
L026348     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0012
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L02635E     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   $0B
            DEC
            LDX   #$0000
            TAY
            BPL   L02636E
            DEX
L02636E     PHX
            PHA
            PEA   $0000
            PEA   $0104
            JSL   L02C5AD
            CLC
            PLA
            ADC   $2B
            PHA
            LDA   $03,S
            ADC   $2D
            STA   $03,S
            PEA   $0000
            TDC
            CLC
            ADC   #$003C
            PHA
            JSL   L02AB57
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            PEI   $19
            PEI   $17
            JSL   L02C1EF
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            PEI   $2D
            PEI   $2B
            JSL   L02C1EF
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            PHA
            LDA   $0F
            PHA
            _SetResourceFileDepth
            STAL  L02B111
            PLA
            STA   $0F
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L0263F4
            BRL   L02640A
L0263F4     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0013
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L02640A     LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L02643B
            BRL   L026451
L02643B     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0014
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L026451     LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L026482
            BRL   L026498
L026482     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0015
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L026498     LDA   $0D
            PHA
            _CloseResourceFile
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L0264C2
            BRL   L0264D8
L0264C2     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0016
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L0264D8     LDA   $0B
            CMP   #$FFFF
            BEQ   L0264E2
            BRL   L0264E5
L0264E2     BRL   L0266C8
L0264E5     LDAL  L030019
            AND   #$0008
            BEQ   L0264F1
            BRL   L026500
L0264F1     LDA   #$010A
            PHA
            _EnableMItem
            STAL  L02B111
L026500     LDA   #$010B
            PHA
            _EnableMItem
            STAL  L02B111
            LDA   #$0119
            PHA
            _EnableMItem
            STAL  L02B111
            LDA   #$010C
            PHA
            _EnableMItem
            STAL  L02B111
            LDA   #$010D
            PHA
            _EnableMItem
            STAL  L02B111
            LDAL  L03002F
            TAX
            LDAL  L03002D
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            CLC
            ADC   #$000A
            BCC   L026558
            INX
L026558     STAL  L030027
            TXA
            STAL  L030029
            LDAL  L03002F
            TAX
            LDAL  L03002D
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STX   $29
            STA   $27
            PHA
            PHA
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _GetHandleSize
            STAL  L02B111
            SEC
            LDA   $01,S
            SBC   #$000A
            STA   $01,S
            BCS   L0265A0
            LDA   $03,S
            DEC
            STA   $03,S
L0265A0     PLA
            STAL  L030021
            PLA
            STAL  L030023
            LDY   #$0002
            LDA   [$27],Y
            STAL  L030025
            LDY   #$0008
            LDA   [$27],Y
            LDX   #$0000
            STAL  L030039
            TXA
            STAL  L03003B
            LDY   #$0006
            LDA   [$27],Y
            STAL  L03000D
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            SEC
            LDA   $01,S
            SBC   #$0001
            STA   $01,S
            BCS   L0265E6
            LDA   $03,S
            DEC
            STA   $03,S
L0265E6     LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$00
            STA   [$01]
            REP   #$20
            LDA   #$0006
            PHA
            LDA   #$0001
            PHA
            PEA   ^L026705
            PEA   L026705
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            PEA   $0000
            PEA   $0000
            _SendRequest
            STAL  L02B111
            LDAL  L030019
            AND   #$0004
            BEQ   L02663E
            BRL   L0266AD
L02663E     PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            LDA   #$0002
            PHA
            PEA   $0000
            PEA   $0FFA
            LDA   #$800E
            PHA
            _NewWindow2
            STAL  L02B111
            PLA
            STAL  L030001
            PLA
            STAL  L030003
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L026697
            BRL   L0266AD
L026697     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0017
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L0266AD     LDX   $05
            PHX
            TSX
            STX   $05
            PEA   $0000
            TDC
            CLC
            ADC   #$003C
            PHA
            JSL   L025455
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L0266C8     PLD
            TSC
            CLC
            ADC   #$021D
            TCS
            RTL

L0266D0     STR   'Okay'
            DB    $00
L0266D6     STR   'Cancel'
            DB    $00
L0266DE     STR   'Whadya Want? '
            DB    $00
	
L0266ED     ASC   '%lX'00
L0266F1     ASC   'Choose your rSound:'00
L026705     STR   'Apple~SoundCP~'
            DB    $00
L026715     TSC
            SEC
            SBC   #$001E
            TCS
            PHD
            TCD
            LDAL  L030019
            AND   #$0002
            BNE   L026729
            BRL   L02688E
L026729     LDA   #$0006
            PHA
            LDA   #$0001
            PHA
            PEA   ^L026896
            PEA   L026896
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            PEA   $0000
            PEA   $0000
            _SendRequest
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            CMP   #$0120
            BEQ   L02676C
            BRL   L02688E
L02676C     LDA   #$0008
            PHA
            LDA   #$0100
            PHA
            _LoadOneTool
            STAL  L02B111
            PHA
            PHA
            PEA   $0000
            PEA   $0100
            LDAL  L030035
            PHA
            LDA   #$C005
            PHA
            PEA   $0000
            PEA   $0000
            _NewHandle
            STAL  L02B111
            PLA
            STA   $09
            PLA
            STA   $0B
            LDA   [$09]
            PHA
            _SoundStartUp
            STAL  L02B111
            LDAL  L03000D
            XBA
            AND   #$FF00
            ASL
            ASL
            ASL
            ASL
            CLC
            ADC   #$0101
            STA   $07
            LDAL  L030029
            TAX
            LDAL  L030027
            STX   $0F
            STA   $0D
            LDAL  L030025
            STA   $11
            LDAL  L03003B
            TAX
            LDAL  L030039
            JSL   L02BB54
            PEA   $3FF9
            PEA   $9F5B
            PEA   $A979
            PEA   $3B31
            PEA   $F000
            JSL   L02BF65
            JSL   L02BBEC
            STA   $13
            LDA   #$2000
            STA   $15
            LDA   #$0003
            STA   $17
            LDA   #$0000
            STA   $19
            LDA   #$0000
            STA   $1B
            LDA   #$00FF
            STA   $1D
            LDA   $07
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$000D
            PHA
            _FFStartSound
            STAL  L02B111
L026830     PHA
            LDA   #$0001
            PHA
            _FFGeneratorStatus
            STAL  L02B111
            PLA
            AND   #$8000
            BEQ   L026849
            BRL   L02684C
L026849     BRL   L026830
L02684C     PHA
            LDA   #$0001
            PHA
            _FFSoundDoneStatus
            STAL  L02B111
            PLA
            BEQ   L026862
            BRL   L026865
L026862     BRL   L02684C
L026865     LDA   #$0002
            PHA
            _FFStopSound
            STAL  L02B111
            _SoundShutDown
            STAL  L02B111
            PEI   $0B
            PEI   $09
            _DisposeHandle
            STAL  L02B111
L02688E     PLD
            TSC
            CLC
            ADC   #$001E
            TCS
            RTL

L026896     STR   'Apple~SoundCP~'
            DB    $00
L0268A6     TSC
            SEC
            SBC   #$008C
            TCS
            PHD
            TCD
            SEP   #$20
            STZ   $65
            REP   #$20
            SEP   #$20
            STZ   $66
            REP   #$20
            SEP   #$20
            STZ   $67
            REP   #$20
            SEP   #$20
            STZ   $68
            REP   #$20
            SEP   #$20
            STZ   $69
            REP   #$20
            SEP   #$20
            STZ   $6A
            REP   #$20
            SEP   #$20
            STZ   $6B
            REP   #$20
            SEP   #$20
            STZ   $6C
            REP   #$20
            SEP   #$20
            STZ   $6D
            REP   #$20
            SEP   #$20
            STZ   $6E
            REP   #$20
            SEP   #$20
            STZ   $6F
            REP   #$20
            SEP   #$20
            LDA   #$0C
            STA   $70
            REP   #$20
            SEP   #$20
            LDA   #$07
            STA   $71
            REP   #$20
            SEP   #$20
            STZ   $72
            REP   #$20
            SEP   #$20
            STZ   $73
            REP   #$20
            SEP   #$20
            STZ   $74
            REP   #$20
            SEP   #$20
            LDA   #$02
            STA   $75
            REP   #$20
            SEP   #$20
            LDA   #$0F
            STA   $76
            REP   #$20
            SEP   #$20
            LDA   #$04
            STA   $77
            REP   #$20
            SEP   #$20
            LDA   #$0A
            STA   $78
            REP   #$20
            SEP   #$20
            LDA   #$AE
            STA   $79
            REP   #$20
            SEP   #$20
            LDA   #$04
            STA   $7A
            REP   #$20
            SEP   #$20
            LDA   #$A0
            STA   $7B
            REP   #$20
            SEP   #$20
            LDA   #$0F
            STA   $7C
            REP   #$20
            SEP   #$20
            LDA   #$C0
            STA   $7D
            REP   #$20
            SEP   #$20
            LDA   #$0F
            STA   $7E
            REP   #$20
            SEP   #$20
            LDA   #$FA
            STA   $7F
            REP   #$20
            SEP   #$20
            LDA   #$0F
            STA   $80
            REP   #$20
            SEP   #$20
            LDA   #$FF
            STA   $81
            REP   #$20
            SEP   #$20
            LDA   #$0F
            STA   $82
            REP   #$20
            SEP   #$20
            LDA   #$FF
            STA   $83
            REP   #$20
            SEP   #$20
            LDA   #$0F
            STA   $84
            REP   #$20
            LDAL  L030040
            PHA
            LDAL  L03003E
            PHA
            PLA
            EOR   #$0001
            PHA
            LDA   $03,S
            EOR   #$0000
            STA   $03,S
            PLA
            STAL  L03003E
            PLA
            STAL  L030040
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            LDA   #$0002
            PHA
            PEA   $0000
            PEA   $0FF9
            LDA   #$800E
            PHA
            _NewWindow2
            STAL  L02B111
            PLA
            STA   $07
            PLA
            STA   $09
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L026A07
            BRL   L026A1D
L026A07     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$001D
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L026A1D     PEI   $09
            PEI   $07
            _ShowWindow
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L026A48
            BRL   L026A5E
L026A48     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$001E
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L026A5E     STZ   $15
L026A60     LDA   $15
            BMI   L026A6C
            CMP   #$0004
            BCC   L026A6C
            BRL   L026ABF
L026A6C     PHA
            LDA   $15
            INC
            PHA
            _GetMenuFlag
            STAL  L02B111
            PLA
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0085
            PHA
            LDA   $15
            ASL
            LDX   #$0000
            TAY
            BPL   L026A91
            DEX
L026A91     PHX
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDA   #$0080
            PHA
            LDA   $15
            INC
            PHA
            _SetMenuFlag
            STAL  L02B111
            INC   $15
            BRL   L026A60
L026ABF     _DrawMenuBar
            STAL  L02B111
            LDA   #$000A
            STA   $2B
            LDA   #$0000
            STA   $2D
            PHA
            LDA   #$0064
            PHA
            _GetSCB
            STAL  L02B111
            PLA
            STA   $11
            LDA   #$003A
            STA   $15
L026AEC     LDA   $15
            BMI   L026AF8
            CMP   #$009B
            BCC   L026AF8
            BRL   L026B0F
L026AF8     LDA   $15
            PHA
            LDA   #$000F
            PHA
            _SetSCB
            STAL  L02B111
            INC   $15
            BRL   L026AEC
L026B0F     LDA   #$000F
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0045
            PHA
            _GetColorTable
            STAL  L02B111
            LDA   #$000F
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0065
            PHA
            _SetColorTable
            STAL  L02B111
            PHA
            PHA
            LDA   #$8024
            PHA
            LDAL  L030040
            PHA
            LDAL  L03003E
            PHA
            _LoadResource
            STAL  L02B111
            PLA
            STA   $0B
            PLA
            STA   $0D
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L026B7C
            BRL   L026BAB
L026B7C     LDAL  L03002B
            CMP   #$0201
            BNE   L026B88
            BRL   L026BA6
L026B88     LDAL  L03002B
            CMP   #$1E06
            BNE   L026B94
            BRL   L026BA6
L026B94     LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L026BA6     STZ   $0F
            BRL   L026BD3
L026BAB     LDA   #$0006
            PHA
            LDA   #$0001
            PHA
            PEA   ^L026CDE
            PEA   L026CDE
            PEI   $0D
            PEI   $0B
            PEA   $0000
            PEA   $0000
            _SendRequest
            STAL  L02B111
            LDA   #$0001
            STA   $0F
L026BD3     PHA
            LDA   #$004A
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0017
            PHA
            _TaskMaster
            STAL  L02B111
            PLA
            STA   $13
            LDA   $13
            CMP   #$0001
            BNE   L026BF9
            BRL   L026C03
L026BF9     LDA   $13
            CMP   #$0003
            BEQ   L026C03
            BRL   L026BD3
L026C03     LDA   #$003A
            STA   $15
L026C08     LDA   $15
            BMI   L026C14
            CMP   #$009B
            BCC   L026C14
            BRL   L026C2A
L026C14     LDA   $15
            PHA
            LDA   $11
            PHA
            _SetSCB
            STAL  L02B111
            INC   $15
            BRL   L026C08
L026C2A     LDA   #$000F
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0045
            PHA
            _SetColorTable
            STAL  L02B111
            PEI   $09
            PEI   $07
            _CloseWindow
            STAL  L02B111
            STZ   $15
L026C53     LDA   $15
            BMI   L026C5F
            CMP   #$0004
            BCC   L026C5F
            BRL   L026C9C
L026C5F     PEA   $0000
            TDC
            CLC
            ADC   #$0085
            PHA
            LDA   $15
            ASL
            LDX   #$0000
            TAY
            BPL   L026C72
            DEX
L026C72     PHX
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            LDA   [$01]
            PHA
            LDA   $15
            INC
            PHA
            _SetMenuFlag
            STAL  L02B111
            INC   $15
            BRL   L026C53
L026C9C     LDA   $0F
            BNE   L026CA3
            BRL   L026CCB
L026CA3     LDA   #$8024
            PHA
            LDAL  L030040
            PHA
            LDAL  L03003E
            PHA
            _DetachResource
            STAL  L02B111
            PEI   $0D
            PEI   $0B
            _DisposeHandle
            STAL  L02B111
L026CCB     _DrawMenuBar
            STAL  L02B111
            PLD
            TSC
            CLC
            ADC   #$008C
            TCS
            RTL

L026CDE     STR   'Apple~SoundCP~'
            DB    $00
L026CEE     TSC
            SEC
            SBC   #$0006
            TCS
            PHD
            TCD
            LDX   $05
            PHX
            TSX
            STX   $05
            LDAL  L03003B
            TAX
            LDAL  L030039
            JSL   L02BB54
            PEA   $400D
            PEA   $CDA0
            PEA   $0000
            PEA   $0000
            PEA   $0000
            JSL   L02BC4A
            JSL   L02BABB
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            JSL   L02BC73
            PEA   $3FFE
            PEA   $B172
            PEA   $17F9
            PEA   $B5A7
            PEA   $D800
            JSL   L02BC4A
            PEA   $400A
            PEA   $C000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            JSL   L02BF65
            JSL   L02BB85
            STAL  L030017
            LDAL  L030017
            BMI   L026D63
            BRL   L026D72
L026D63     LDAL  L030017
            EOR   #$FFFF
            INC
            ORA   #$8000
            STAL  L030017
L026D72     PLD
            TSC
            CLC
            ADC   #$0006
            TCS
            RTL

L026D7A     TSC
            SEC
            SBC   #$0027
            TCS
            PHD
            TCD
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            LDA   #$0002
            PHA
            PEA   $0000
            PEA   $0FF4
            LDA   #$800E
            PHA
            _NewWindow2
            STAL  L02B111
            PLA
            STA   $17
            PLA
            STA   $19
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L026DD7
            BRL   L026DED
L026DD7     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0258
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L026DED     PEI   $19
            PEI   $17
            _ShowWindow
            STAL  L02B111
            PEI   $19
            PEI   $17
            _SelectWindow
            STAL  L02B111
L026E0B     PHA
            PHA
            PEA   ^L04008A
            PEA   L04008A
            PEA   $0000
            PEA   $0000
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   #$0018
            PHA
            _DoModalWindow
            STAL  L02B111
            PLA
            PLX
            STA   $1B
            LDA   $1B
            CMP   #$0025
            BNE   L026E42
            BRL   L026E4C
L026E42     LDA   $1B
            CMP   #$0026
            BEQ   L026E4C
            BRL   L026E0B
L026E4C     LDAL  L030023
            TAX
            LDAL  L030021
            SEC
            SBC   #$0001
            BCS   L026E5C
            DEX
L026E5C     STX   $11
            STA   $0F
            _WaitCursor
            STAL  L02B111
            LDA   $1B
            CMP   #$0026
            BEQ   L026E75
            BRL   L026FAB
L026E75     PEI   $19
            PEI   $17
            PEA   $0000
            PEA   $0029
            PEA   $0000
            TDC
            CLC
            ADC   #$0023
            PHA
            _GetLETextByID
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            PEA   $0000
            TDC
            CLC
            ADC   #$0024
            PHA
            JSL   L02A60A
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STA   $1B
            LDA   $1B
            LDX   #$0000
            JSL   L02BB54
            PEA   $4005
            PEA   $C800
            PEA   $0000
            PEA   $0000
            PEA   $0000
            JSL   L02BC4A
            PEA   $0000
            TDC
            CLC
            ADC   #$001F
            PHA
            JSL   L02BFC2
            LDAL  L030029
            TAX
            LDAL  L030027
            STX   $0D
            STA   $0B
            PEA   $0000
            PEA   $0000
            LDA   $01,S
            STA   $13
            LDA   $03,S
            STA   $15
            PLA
            PLA
L026EF6     PEI   $15
            PEI   $13
            LDX   $11
            LDA   $0F
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L026F0A
            TYA
            CMP   $01,S
L026F0A     BEQ   L026F0E
            BCS   L026F0F
L026F0E     DEX
L026F0F     PLA
            PLA
            TXA
            BNE   L026F17
            BRL   L026FA8
L026F17     LDA   [$0B]
            AND   #$00FF
            SEC
            SBC   #$0080
            STA   $1D
            LDA   $1D
            JSL   L02BB2E
            PEA   $0000
            TDC
            CLC
            ADC   #$001F
            PHA
            PEA   $0000
            TSC
            CLC
            ADC   #$0007
            PHA
            PEA   $0204
            _SANEFP816
            JSL   L02BB85
            STA   $1D
            LDA   $1D
            BPL   L026F53
            CMP   #$FF81
            BCC   L026F56
L026F53     BRL   L026F5B
L026F56     LDA   #$FF81
            STA   $1D
L026F5B     LDA   $1D
            BMI   L026F66
            CMP   #$007F
            BEQ   L026F66
            BCS   L026F69
L026F66     BRL   L026F6E
L026F69     LDA   #$007F
            STA   $1D
L026F6E     LDA   $1D
            AND   #$00FF
            CLC
            ADC   #$0080
            PHA
            PLA
            SEP   #$20
            STA   [$0B]
            REP   #$20
            LDA   [$0B]
            AND   #$00FF
            TAX
            BEQ   L026F8A
            BRL   L026F93
L026F8A     SEP   #$20
            LDA   [$0B]
            INC
            STA   [$0B]
            REP   #$20
L026F93     INC   $13
            BNE   L026F99
            INC   $15
L026F99     INC   $0B
            BNE   L026F9F
            INC   $0D
L026F9F     PEI   $0D
            PEI   $0B
            PLA
            PLA
            BRL   L026EF6
L026FA8     BRL   L0270FA
L026FAB     LDA   #$0080
            SEP   #$20
            STA   $0A
            REP   #$20
            SEP   #$20
            STA   $09
            REP   #$20
            LDAL  L030029
            TAX
            LDAL  L030027
            STX   $0D
            STA   $0B
            PEA   $0000
            PEA   $0000
            LDA   $01,S
            STA   $13
            LDA   $03,S
            STA   $15
            PLA
            PLA
L026FD7     PEI   $15
            PEI   $13
            LDX   $11
            LDA   $0F
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L026FEB
            TYA
            CMP   $01,S
L026FEB     BEQ   L026FEF
            BCS   L026FF0
L026FEF     DEX
L026FF0     PLA
            PLA
            TXA
            BNE   L026FF8
            BRL   L027051
L026FF8     LDA   $09
            AND   #$00FF
            PHA
            LDA   [$0B]
            AND   #$00FF
            PLY
            STY   $01
            CMP   $01
            BEQ   L02700C
            BCS   L02700F
L02700C     BRL   L02701A
L02700F     LDA   [$0B]
            AND   #$00FF
            SEP   #$20
            STA   $09
            REP   #$20
L02701A     LDA   [$0B]
            AND   #$00FF
            PHA
            LDA   $0A
            AND   #$00FF
            PLY
            STY   $01
            CMP   $01
            BEQ   L02702E
            BCS   L027031
L02702E     BRL   L02703C
L027031     LDA   [$0B]
            AND   #$00FF
            SEP   #$20
            STA   $0A
            REP   #$20
L02703C     INC   $13
            BNE   L027042
            INC   $15
L027042     INC   $0B
            BNE   L027048
            INC   $0D
L027048     PEI   $0D
            PEI   $0B
            PLA
            PLA
            BRL   L026FD7
L027051     PEA   $0000
            PEA   $FFFF
            LDA   $0A
            AND   #$00FF
            PHA
            LDA   $09
            AND   #$00FF
            SEC
            SBC   $01,S
            PLX
            PEA   $0000
            PHA
            JSL   L02C850
            PLA
            PLX
            STA   $07
            LDAL  L030029
            TAX
            LDAL  L030027
            STX   $0D
            STA   $0B
            PEA   $0000
            PEA   $0000
            LDA   $01,S
            STA   $13
            LDA   $03,S
            STA   $15
            PLA
            PLA
L02708F     PEI   $15
            PEI   $13
            LDX   $11
            LDA   $0F
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L0270A3
            TYA
            CMP   $01,S
L0270A3     BEQ   L0270A7
            BCS   L0270A8
L0270A7     DEX
L0270A8     PLA
            PLA
            TXA
            BNE   L0270B0
            BRL   L0270FA
L0270B0     LDA   $0A
            AND   #$00FF
            PHA
            LDA   [$0B]
            AND   #$00FF
            SEC
            SBC   $01,S
            PLX
            LDX   $07
            JSL   L02CABC
            XBA
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$0B]
            REP   #$20
            LDA   [$0B]
            AND   #$00FF
            TAX
            BEQ   L0270DC
            BRL   L0270E5
L0270DC     SEP   #$20
            LDA   [$0B]
            INC
            STA   [$0B]
            REP   #$20
L0270E5     INC   $13
            BNE   L0270EB
            INC   $15
L0270EB     INC   $0B
            BNE   L0270F1
            INC   $0D
L0270F1     PEI   $0D
            PEI   $0B
            PLA
            PLA
            BRL   L02708F
L0270FA     PEI   $19
            PEI   $17
            _CloseWindow
            STAL  L02B111
            LDAL  L030019
            AND   #$0008
            BNE   L027115
            BRL   L02713C
L027115     LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            _BringToFront
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L024766
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L02713C     _InitCursor
            STAL  L02B111
            PLD
            TSC
            CLC
            ADC   #$0027
            TCS
            RTL

L02714F     TSC
            SEC
            SBC   #$0015
            TCS
            PHD
            TCD
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            LDA   #$0002
            PHA
            PEA   $0000
            PEA   $0FF6
            LDA   #$800E
            PHA
            _NewWindow2
            STAL  L02B111
            PLA
            STA   $09
            PLA
            STA   $0B
            LDX   $07
            PHX
            TSX
            STX   $07
            JSL   L02AE36
            TAY
            LDA   $07
            TCS
            PLA
            STA   $07
            TYA
            STAL  L03002B
            TAX
            BNE   L0271AC
            BRL   L0271C2
L0271AC     LDX   $07
            PHX
            TSX
            STX   $07
            LDA   #$0190
            PHA
            JSL   L024DB6
            TAY
            LDA   $07
            TCS
            PLA
            STA   $07
            TYA
L0271C2     PEI   $0B
            PEI   $09
            _ShowWindow
            STAL  L02B111
            PEI   $0B
            PEI   $09
            _SelectWindow
            STAL  L02B111
L0271E0     PHA
            PHA
            PEA   ^L04008A
            PEA   L04008A
            PEA   $0000
            PEA   $0000
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   #$0018
            PHA
            _DoModalWindow
            STAL  L02B111
            PLA
            PLX
            STA   $0D
            LDA   $0D
            CMP   #$0018
            BNE   L027217
            BRL   L027221
L027217     LDA   $0D
            CMP   #$0019
            BEQ   L027221
            BRL   L0271E0
L027221     LDA   $0D
            CMP   #$0018
            BEQ   L02722B
            BRL   L0272A0
L02722B     PEI   $0B
            PEI   $09
            PEA   $0000
            PEA   $0017
            PEA   $0000
            TDC
            CLC
            ADC   #$000F
            PHA
            _GetLETextByID
            STAL  L02B111
            LDX   $07
            PHX
            TSX
            STX   $07
            PEA   $0000
            TDC
            CLC
            ADC   #$0010
            PHA
            JSL   L02A60A
            TAY
            LDA   $07
            TCS
            PLA
            STA   $07
            TYA
            STA   $0D
            LDA   $0D
            BEQ   L02726D
            BRL   L02726F
L02726D     INC   $0D
L02726F     LDAL  L03003B
            PHA
            LDAL  L030039
            PHA
            LDA   $0D
            LDX   #$0000
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L02728A
            TYA
            CMP   $01,S
L02728A     BEQ   L02728E
            BCS   L02728F
L02728E     DEX
L02728F     PLA
            PLA
            TXA
            BNE   L027297
            BRL   L02729D
L027297     LDAL  L030039
            STA   $0D
L02729D     BRL   L0272A2
L0272A0     STZ   $0D
L0272A2     PEI   $0B
            PEI   $09
            _CloseWindow
            STAL  L02B111
            LDAL  L030019
            AND   #$0008
            BNE   L0272BD
            BRL   L0272E4
L0272BD     LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            _BringToFront
            STAL  L02B111
            LDX   $07
            PHX
            TSX
            STX   $07
            JSL   L024766
            TAY
            LDA   $07
            TCS
            PLA
            STA   $07
            TYA
L0272E4     LDA   $0D
            STA   $01
            LDY   $01
            PLD
            TSC
            CLC
            ADC   #$0015
            TCS
            TYA
            RTL

L0272F3     TSC
            SEC
            SBC   #$0044
            TCS
            PHD
            TCD
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02714F
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STA   $0F
            TAX
            BEQ   L027315
            BRL   L027318
L027315     BRL   L027848
L027318     LDAL  L03003B
            TAX
            LDAL  L030039
            JSL   L02BB54
            LDA   $0F
            LDX   #$0000
            JSL   L02BB54
            JSL   L02BC4A
            PEA   $0000
            TDC
            CLC
            ADC   #$002D
            PHA
            JSL   L02BF8E
            PEA   $3FFF
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$002D
            PHA
            PEA   $0000
            TSC
            CLC
            ADC   #$0007
            PHA
            PEA   $0100
            _SANEFP816
            PEA   $0000
            TDC
            CLC
            ADC   #$0025
            PHA
            JSL   L02BF8E
            LDX   $05
            PHX
            TSX
            STX   $05
            PEA   $4000
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$0025
            PHA
            PEA   $0000
            TSC
            CLC
            ADC   #$0007
            PHA
            PEA   $0104
            _SANEFP816
            JSL   L02BBB7
            PHX
            PHA
            JSL   L02C21D
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STX   $1B
            STA   $19
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L0273DA
            BRL   L0273FF
L0273DA     LDAL  L03002B
            CMP   #$0201
            BEQ   L0273E6
            BRL   L0273ED
L0273E6     LDA   #$0086
            STAL  L03002B
L0273ED     LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L0273FF     LDX   $05
            PHX
            TSX
            STX   $05
            PEA   $4002
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$002D
            PHA
            PEA   $0000
            TSC
            CLC
            ADC   #$0007
            PHA
            PEA   $0104
            _SANEFP816
            JSL   L02BBB7
            PHX
            PHA
            JSL   L02C21D
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STX   $0D
            STA   $0B
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L027462
            BRL   L027487
L027462     LDAL  L03002B
            CMP   #$0201
            BEQ   L02746E
            BRL   L027475
L02746E     LDA   #$0086
            STAL  L03002B
L027475     LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L027487     _WaitCursor
            STAL  L02B111
            LDA   $19
            LDX   $1B
            STA   $15
            STX   $17
            LDA   #$0000
            STA   $0F
L02749F     PEA   $0000
            TDC
            CLC
            ADC   #$0025
            PHA
            JSL   L02BF38
            LDA   $0F
            LDX   #$0000
            JSL   L02BB54
            JSL   L02BF05
            BNE   L0274BE
            BRL   L0274D7
L0274BE     SEP   #$20
            LDA   #$80
            STA   [$15]
            REP   #$20
            INC   $0F
            INC   $15
            BNE   L0274CE
            INC   $17
L0274CE     PEI   $17
            PEI   $15
            PLA
            PLA
            BRL   L02749F
L0274D7     PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$003D
            PHA
            JSL   L02BF8E
            LDA   $0B
            LDX   $0D
            STA   $07
            STX   $09
            LDA   #$0000
            STA   $0F
L027500     PEA   $0000
            TDC
            CLC
            ADC   #$002D
            PHA
            JSL   L02BF38
            LDA   $0F
            LDX   #$0000
            JSL   L02BB54
            JSL   L02BF05
            BNE   L02751F
            BRL   L02759C
L02751F     PEA   $3FFF
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$0025
            PHA
            JSL   L02BF38
            LDA   $0F
            LDX   #$0000
            JSL   L02BB54
            JSL   L02BFF6
            JSL   L02BC4A
            PEI   $09
            PEI   $07
            JSL   L02BF8E
            PEI   $09
            PEI   $07
            JSL   L02BF38
            PEA   $0000
            TDC
            CLC
            ADC   #$003D
            PHA
            PEA   $0000
            TSC
            CLC
            ADC   #$0007
            PHA
            PEA   $0100
            _SANEFP816
            PEA   $0000
            TDC
            CLC
            ADC   #$003D
            PHA
            JSL   L02BF8E
            INC   $0F
            CLC
            LDA   $07
            ADC   #$0008
            STA   $07
            BCC   L027593
            INC   $09
L027593     PEI   $09
            PEI   $07
            PLA
            PLA
            BRL   L027500
L02759C     LDA   $0B
            LDX   $0D
            STA   $07
            STX   $09
            LDA   #$0000
            STA   $0F
L0275A9     PEA   $0000
            TDC
            CLC
            ADC   #$002D
            PHA
            JSL   L02BF38
            LDA   $0F
            LDX   #$0000
            JSL   L02BB54
            JSL   L02BF05
            BNE   L0275C8
            BRL   L027630
L0275C8     PEA   $3FFF
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$0025
            PHA
            JSL   L02BF38
            LDA   $0F
            LDX   #$0000
            JSL   L02BB54
            JSL   L02BFF6
            JSL   L02BC4A
            PEA   $0000
            TDC
            CLC
            ADC   #$003D
            PHA
            PEA   $0000
            TSC
            CLC
            ADC   #$0007
            PHA
            PEA   $0106
            _SANEFP816
            PEI   $09
            PEI   $07
            JSL   L02BF8E
            INC   $0F
            CLC
            LDA   $07
            ADC   #$0008
            STA   $07
            BCC   L027627
            INC   $09
L027627     PEI   $09
            PEI   $07
            PLA
            PLA
            BRL   L0275A9
L027630     LDAL  L030023
            TAX
            LDAL  L030021
            SEC
            SBC   #$0001
            BCS   L027640
            DEX
L027640     STX   $1F
            STA   $1D
            LDA   #$0000
            STA   $21
            LDA   #$0000
            STA   $23
            LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            LDA   $01,S
            STA   $11
            LDA   $03,S
            STA   $13
            PLA
            PLA
L027662     PEI   $23
            PEI   $21
            LDX   $1F
            LDA   $1D
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L027676
            TYA
            CMP   $01,S
L027676     BEQ   L02767A
            BCS   L02767B
L02767A     DEX
L02767B     PLA
            PLA
            TXA
            BNE   L027683
            BRL   L0277F3
L027683     LDX   $1B
            LDA   $19
            INC
            BNE   L02768B
            INX
L02768B     STA   $15
            STX   $17
            LDA   #$0001
            STA   $0F
L027694     PEA   $0000
            TDC
            CLC
            ADC   #$0025
            PHA
            JSL   L02BF38
            LDA   $0F
            LDX   #$0000
            JSL   L02BB54
            JSL   L02BF05
            BNE   L0276B3
            BRL   L0276DC
L0276B3     LDA   [$15]
            AND   #$00FF
            PHA
            LDX   $17
            LDA   $15
            SEC
            SBC   #$0001
            BCS   L0276C4
            DEX
L0276C4     STA   $01
            STX   $03
            PLA
            SEP   #$20
            STA   [$01]
            REP   #$20
            INC   $15
            BNE   L0276D5
            INC   $17
L0276D5     INC   $0F
            LDA   $0F
            BRL   L027694
L0276DC     LDA   [$11]
            AND   #$00FF
            PHA
            LDX   $17
            LDA   $15
            SEC
            SBC   #$0001
            BCS   L0276ED
            DEX
L0276ED     STA   $01
            STX   $03
            PLA
            SEP   #$20
            STA   [$01]
            REP   #$20
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            TDC
            CLC
            ADC   #$0035
            PHA
            JSL   L02BF8E
            STZ   $0F
            PEI   $1B
            PEI   $19
            LDA   $01,S
            STA   $15
            LDA   $03,S
            STA   $17
            PLA
            PLA
            PEI   $0D
            PEI   $0B
            LDA   $01,S
            STA   $07
            LDA   $03,S
            STA   $09
            PLA
            PLA
L027732     PEA   $0000
            TDC
            CLC
            ADC   #$002D
            PHA
            JSL   L02BF38
            LDA   $0F
            LDX   #$0000
            JSL   L02BB54
            JSL   L02BF05
            BNE   L027751
            BRL   L0277B1
L027751     LDA   [$15]
            AND   #$00FF
            LDX   #$0000
            JSL   L02BB54
            PEI   $09
            PEI   $07
            JSL   L02BF38
            JSL   L02BF65
            PEA   $0000
            TDC
            CLC
            ADC   #$0035
            PHA
            PEA   $0000
            TSC
            CLC
            ADC   #$0007
            PHA
            PEA   $0100
            _SANEFP816
            PEA   $0000
            TDC
            CLC
            ADC   #$0035
            PHA
            JSL   L02BF8E
            CLC
            LDA   $07
            ADC   #$0008
            STA   $07
            BCC   L02779E
            INC   $09
L02779E     INC   $15
            BNE   L0277A4
            INC   $17
L0277A4     PEI   $17
            PEI   $15
            PLA
            PLA
            INC   $0F
            LDA   $0F
            BRL   L027732
L0277B1     PEA   $0000
            TDC
            CLC
            ADC   #$0035
            PHA
            JSL   L02BF38
            JSL   L02BB85
            PHA
            PLA
            SEP   #$20
            STA   [$11]
            REP   #$20
            LDA   [$11]
            AND   #$00FF
            TAX
            BEQ   L0277D5
            BRL   L0277DE
L0277D5     SEP   #$20
            LDA   [$11]
            INC
            STA   [$11]
            REP   #$20
L0277DE     INC   $21
            BNE   L0277E4
            INC   $23
L0277E4     INC   $11
            BNE   L0277EA
            INC   $13
L0277EA     PEI   $13
            PEI   $11
            PLA
            PLA
            BRL   L027662
L0277F3     LDX   $05
            PHX
            TSX
            STX   $05
            PEI   $1B
            PEI   $19
            JSL   L02C1EF
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            PEI   $0D
            PEI   $0B
            JSL   L02C1EF
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDA   #$010B
            PHA
            _EnableMItem
            STAL  L02B111
            LDA   #$0119
            PHA
            _EnableMItem
            STAL  L02B111
            _InitCursor
            STAL  L02B111
L027848     PLD
            TSC
            CLC
            ADC   #$0044
            TCS
            RTL

L027850     TSC
            SEC
            SBC   #$002C
            TCS
            PHD
            TCD
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02714F
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STA   $0F
            TAX
            BEQ   L027872
            BRL   L027875
L027872     BRL   L027A1B
L027875     LDAL  L03003B
            TAX
            LDAL  L030039
            JSL   L02BB54
            LDA   $0F
            LDX   #$0000
            JSL   L02BB54
            JSL   L02BC4A
            PEA   $0000
            TDC
            CLC
            ADC   #$0015
            PHA
            JSL   L02BF8E
            LDAL  L030023
            TAX
            LDAL  L030021
            SEC
            SBC   #$0001
            BCS   L0278AC
            DEX
L0278AC     STX   $0D
            STA   $0B
            LDAL  L030029
            TAX
            LDAL  L030027
            STX   $13
            STA   $11
            LDA   [$11]
            AND   #$00FF
            JSL   L02BB2E
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            JSL   L02BF8E
            _WaitCursor
            STAL  L02B111
            LDA   #$0000
            STA   $07
            LDA   #$0000
            STA   $09
L0278E8     PEI   $09
            PEI   $07
            LDX   $0D
            LDA   $0B
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L0278FC
            TYA
            CMP   $01,S
L0278FC     BEQ   L027900
            BCS   L027901
L027900     DEX
L027901     PLA
            PLA
            TXA
            BNE   L027909
            BRL   L0279F2
L027909     LDA   [$11]
            AND   #$00FF
            JSL   L02BB2E
            PEA   $0000
            TDC
            CLC
            ADC   #$0025
            PHA
            JSL   L02BF8E
            PEA   $0000
            TDC
            CLC
            ADC   #$0025
            PHA
            JSL   L02BF38
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            PEA   $0000
            TSC
            CLC
            ADC   #$0007
            PHA
            PEA   $0102
            _SANEFP816
            PEA   $0000
            TDC
            CLC
            ADC   #$0015
            PHA
            PEA   $0000
            TSC
            CLC
            ADC   #$0007
            PHA
            PEA   $0106
            _SANEFP816
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            PEA   $0000
            TSC
            CLC
            ADC   #$0007
            PHA
            PEA   $0100
            _SANEFP816
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            JSL   L02BF8E
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            JSL   L02BF38
            LDA   [$11]
            AND   #$00FF
            LDX   #$0000
            JSL   L02BB54
            JSL   L02BFF6
            PEA   $4006
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            JSL   L02BB05
            JSL   L02BB85
            PHA
            PLA
            SEP   #$20
            STA   [$11]
            REP   #$20
            LDA   [$11]
            AND   #$00FF
            TAX
            BEQ   L0279D4
            BRL   L0279DD
L0279D4     SEP   #$20
            LDA   [$11]
            INC
            STA   [$11]
            REP   #$20
L0279DD     INC   $07
            BNE   L0279E3
            INC   $09
L0279E3     INC   $11
            BNE   L0279E9
            INC   $13
L0279E9     PEI   $13
            PEI   $11
            PLA
            PLA
            BRL   L0278E8
L0279F2     LDA   #$010B
            PHA
            _EnableMItem
            STAL  L02B111
            LDA   #$0119
            PHA
            _EnableMItem
            STAL  L02B111
            _InitCursor
            STAL  L02B111
L027A1B     PLD
            TSC
            CLC
            ADC   #$002C
            TCS
            RTL

L027A23     TSC
            SEC
            SBC   #$000A
            TCS
            PHD
            TCD
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L024CF2
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            STX   $05
            STA   $03
            LDA   $03
            ORA   $05
            BEQ   L027A4A
            BRL   L027A4D
L027A4A     BRL   L027AD1
L027A4D     PHA
            PHA
            _GetPort
            STAL  L02B111
            PLA
            STA   $07
            PLA
            STA   $09
            PHA
            PHA
            _FrontWindow
            STAL  L02B111
            _StartDrawing
            STAL  L02B111
            PEI   $05
            PEI   $03
            _LECut
            STAL  L02B111
            LDA   #$0000
            PHA
            LDA   #$0000
            PHA
            _SetOrigin
            STAL  L02B111
            PEI   $09
            PEI   $07
            _SetPort
            STAL  L02B111
            _ZeroScrap
            STAL  L02B111
            PHA
            _LEGetScrapLen
            STAL  L02B111
            PLA
            BNE   L027AC6
            BRL   L027AD1
L027AC6     _LEToScrap
            STAL  L02B111
L027AD1     PLD
            TSC
            CLC
            ADC   #$000A
            TCS
            RTL

L027AD9     TSC
            SEC
            SBC   #$000A
            TCS
            PHD
            TCD
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L024CF2
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            STX   $05
            STA   $03
            LDA   $03
            ORA   $05
            BEQ   L027B00
            BRL   L027B03
L027B00     BRL   L027B87
L027B03     PHA
            PHA
            _GetPort
            STAL  L02B111
            PLA
            STA   $07
            PLA
            STA   $09
            PHA
            PHA
            _FrontWindow
            STAL  L02B111
            _StartDrawing
            STAL  L02B111
            PEI   $05
            PEI   $03
            _LECopy
            STAL  L02B111
            LDA   #$0000
            PHA
            LDA   #$0000
            PHA
            _SetOrigin
            STAL  L02B111
            PEI   $09
            PEI   $07
            _SetPort
            STAL  L02B111
            _ZeroScrap
            STAL  L02B111
            PHA
            _LEGetScrapLen
            STAL  L02B111
            PLA
            BNE   L027B7C
            BRL   L027B87
L027B7C     _LEToScrap
            STAL  L02B111
L027B87     PLD
            TSC
            CLC
            ADC   #$000A
            TCS
            RTL

L027B8F     TSC
            SEC
            SBC   #$000A
            TCS
            PHD
            TCD
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L024CF2
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            STX   $05
            STA   $03
            LDA   $03
            ORA   $05
            BEQ   L027BB6
            BRL   L027BB9
L027BB6     BRL   L027C20
L027BB9     _LEFromScrap
            STAL  L02B111
            PHA
            PHA
            _GetPort
            STAL  L02B111
            PLA
            STA   $07
            PLA
            STA   $09
            PHA
            PHA
            _FrontWindow
            STAL  L02B111
            _StartDrawing
            STAL  L02B111
            PEI   $05
            PEI   $03
            _LEPaste
            STAL  L02B111
            LDA   #$0000
            PHA
            LDA   #$0000
            PHA
            _SetOrigin
            STAL  L02B111
            PEI   $09
            PEI   $07
            _SetPort
            STAL  L02B111
L027C20     PLD
            TSC
            CLC
            ADC   #$000A
            TCS
            RTL

L027C28     TSC
            SEC
            SBC   #$000A
            TCS
            PHD
            TCD
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L024CF2
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            STX   $05
            STA   $03
            LDA   $03
            ORA   $05
            BEQ   L027C4F
            BRL   L027C52
L027C4F     BRL   L027CAE
L027C52     PHA
            PHA
            _GetPort
            STAL  L02B111
            PLA
            STA   $07
            PLA
            STA   $09
            PHA
            PHA
            _FrontWindow
            STAL  L02B111
            _StartDrawing
            STAL  L02B111
            PEI   $05
            PEI   $03
            _LEDelete
            STAL  L02B111
            LDA   #$0000
            PHA
            LDA   #$0000
            PHA
            _SetOrigin
            STAL  L02B111
            PEI   $09
            PEI   $07
            _SetPort
            STAL  L02B111
L027CAE     PLD
            TSC
            CLC
            ADC   #$000A
            TCS
            RTL

L027CB6     TSC
            SEC
            SBC   #$0171
            TCS
            PHD
            TCD
            SEP   #$20
            LDA   #$52
            STA   $13
            REP   #$20
            SEP   #$20
            LDA   #$49
            STA   $14
            REP   #$20
            SEP   #$20
            LDA   #$46
            STA   $15
            REP   #$20
            SEP   #$20
            LDA   #$46
            STA   $16
            REP   #$20
            LDA   #$0000
            STA   $17
            LDA   #$0000
            STA   $19
            SEP   #$20
            LDA   #$57
            STA   $1B
            REP   #$20
            SEP   #$20
            LDA   #$41
            STA   $1C
            REP   #$20
            SEP   #$20
            LDA   #$56
            STA   $1D
            REP   #$20
            SEP   #$20
            LDA   #$45
            STA   $1E
            REP   #$20
            SEP   #$20
            LDA   #$66
            STA   $1F
            REP   #$20
            SEP   #$20
            LDA   #$6D
            STA   $20
            REP   #$20
            SEP   #$20
            LDA   #$74
            STA   $21
            REP   #$20
            SEP   #$20
            LDA   #$20
            STA   $22
            REP   #$20
            LDA   #$0010
            STA   $23
            LDA   #$0000
            STA   $25
            LDA   #$0001
            STA   $27
            LDA   #$0001
            STA   $29
            LDA   #$0000
            STA   $2B
            LDA   #$0000
            STA   $2D
            LDA   #$0000
            STA   $2F
            LDA   #$0000
            STA   $31
            LDA   #$0001
            STA   $33
            LDA   #$0008
            STA   $35
            SEP   #$20
            LDA   #$64
            STA   $37
            REP   #$20
            SEP   #$20
            LDA   #$61
            STA   $38
            REP   #$20
            SEP   #$20
            LDA   #$74
            STA   $39
            REP   #$20
            SEP   #$20
            LDA   #$61
            STA   $3A
            REP   #$20
            LDA   #$0000
            STA   $3B
            LDA   #$0000
            STA   $3D
            SEP   #$20
            LDA   #$50
            STA   $3F
            REP   #$20
            SEP   #$20
            LDA   #$48
            STA   $40
            REP   #$20
            SEP   #$20
            LDA   #$42
            STA   $41
            REP   #$20
            SEP   #$20
            LDA   #$34
            STA   $42
            REP   #$20
            LDA   #$0033
            STA   $43
            LDA   #$0000
            STA   $45
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            LDA   #$0002
            PHA
            PEA   $0000
            PEA   $0FF5
            LDA   #$800E
            PHA
            _NewWindow2
            STAL  L02B111
            PLA
            STA   $07
            PLA
            STA   $09
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L027E03
            BRL   L027E19
L027E03     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$032A
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L027E19     LDAL  L03003B
            PHA
            LDAL  L030039
            PHA
            LDA   #$4650
            LDX   #$0000
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L027E35
            TYA
            CMP   $01,S
L027E35     BEQ   L027E39
            BCS   L027E3A
L027E39     DEX
L027E3A     PLA
            PLA
            TXA
            BNE   L027E42
            BRL   L027EE4
L027E42     LDA   #$0001
            PHA
            PEI   $09
            PEI   $07
            PEA   $0000
            PEA   $0021
            _SetCtlValueByID
            STAL  L02B111
            PEA   $0000
            PEA   $2A49
            LDAL  L03003B
            TAX
            LDAL  L030039
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L027E76
            TYA
            CMP   $01,S
L027E76     BEQ   L027E7A
            BCS   L027E7B
L027E7A     DEX
L027E7B     PLA
            PLA
            TXA
            BNE   L027E83
            BRL   L027EC8
L027E83     LDAL  L03003B
            PHA
            LDAL  L030039
            PHA
            LDA   #$2BD9
            LDX   #$0000
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L027E9F
            TYA
            CMP   $01,S
L027E9F     BEQ   L027EA3
            BCS   L027EA4
L027EA3     DEX
L027EA4     PLA
            PLA
            TXA
            BNE   L027EAC
            BRL   L027EC8
L027EAC     LDA   #$0001
            PHA
            PEI   $09
            PEI   $07
            PEA   $0000
            PEA   $0020
            _SetCtlValueByID
            STAL  L02B111
            BRL   L027EE1
L027EC8     LDA   #$0001
            PHA
            PEI   $09
            PEI   $07
            PEA   $0000
            PEA   $001F
            _SetCtlValueByID
            STAL  L02B111
L027EE1     BRL   L02804E
L027EE4     LDAL  L03003B
            PHA
            LDAL  L030039
            PHA
            LDA   #$80E8
            LDX   #$0000
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L027F00
            TYA
            CMP   $01,S
L027F00     BEQ   L027F04
            BCS   L027F05
L027F04     DEX
L027F05     PLA
            PLA
            TXA
            BNE   L027F0D
            BRL   L027FAF
L027F0D     LDA   #$0001
            PHA
            PEI   $09
            PEI   $07
            PEA   $0000
            PEA   $0022
            _SetCtlValueByID
            STAL  L02B111
            PEA   $0000
            PEA   $5492
            LDAL  L03003B
            TAX
            LDAL  L030039
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L027F41
            TYA
            CMP   $01,S
L027F41     BEQ   L027F45
            BCS   L027F46
L027F45     DEX
L027F46     PLA
            PLA
            TXA
            BNE   L027F4E
            BRL   L027F93
L027F4E     LDAL  L03003B
            PHA
            LDAL  L030039
            PHA
            LDA   #$57B2
            LDX   #$0000
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L027F6A
            TYA
            CMP   $01,S
L027F6A     BEQ   L027F6E
            BCS   L027F6F
L027F6E     DEX
L027F6F     PLA
            PLA
            TXA
            BNE   L027F77
            BRL   L027F93
L027F77     LDA   #$0001
            PHA
            PEI   $09
            PEI   $07
            PEA   $0000
            PEA   $0020
            _SetCtlValueByID
            STAL  L02B111
            BRL   L027FAC
L027F93     LDA   #$0001
            PHA
            PEI   $09
            PEI   $07
            PEA   $0000
            PEA   $001F
            _SetCtlValueByID
            STAL  L02B111
L027FAC     BRL   L02804E
L027FAF     LDA   #$0001
            PHA
            PEI   $09
            PEI   $07
            PEA   $0000
            PEA   $0023
            _SetCtlValueByID
            STAL  L02B111
            PEA   $0000
            PEA   $A924
            LDAL  L03003B
            TAX
            LDAL  L030039
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L027FE3
            TYA
            CMP   $01,S
L027FE3     BEQ   L027FE7
            BCS   L027FE8
L027FE7     DEX
L027FE8     PLA
            PLA
            TXA
            BNE   L027FF0
            BRL   L028035
L027FF0     LDAL  L03003B
            PHA
            LDAL  L030039
            PHA
            LDA   #$AF64
            LDX   #$0000
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L02800C
            TYA
            CMP   $01,S
L02800C     BEQ   L028010
            BCS   L028011
L028010     DEX
L028011     PLA
            PLA
            TXA
            BNE   L028019
            BRL   L028035
L028019     LDA   #$0001
            PHA
            PEI   $09
            PEI   $07
            PEA   $0000
            PEA   $0020
            _SetCtlValueByID
            STAL  L02B111
            BRL   L02804E
L028035     LDA   #$0001
            PHA
            PEI   $09
            PEI   $07
            PEA   $0000
            PEA   $001F
            _SetCtlValueByID
            STAL  L02B111
L02804E     PEI   $09
            PEI   $07
            _ShowWindow
            STAL  L02B111
            PEI   $09
            PEI   $07
            _SelectWindow
            STAL  L02B111
L02806C     PHA
            PHA
            PEA   ^L04008A
            PEA   L04008A
            PEA   $0000
            PEA   $0000
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   #$0018
            PHA
            _DoModalWindow
            STAL  L02B111
            PLA
            PLX
            STA   $0B
            LDA   $0B
            PEA   $0000
            PHA
            LDA   #$0024
            LDX   #$0000
            LDY   #$0001
            CMP   $01,S
            BEQ   L0280AD
            DEY
L0280AD     TXA
            CMP   $03,S
            BEQ   L0280B5
            LDY   #$0000
L0280B5     PLA
            PLA
            TYA
            BNE   L0280BD
            BRL   L02806C
L0280BD     PHA
            PEI   $09
            PEI   $07
            LDA   #$0002
            PHA
            _FindRadioButton
            STAL  L02B111
            PLA
            STA   $0D
            PHA
            PEI   $09
            PEI   $07
            LDA   #$0003
            PHA
            _FindRadioButton
            STAL  L02B111
            PLA
            LDX   #$0000
            STX   $11
            STA   $0F
            PEI   $09
            PEI   $07
            _CloseWindow
            STAL  L02B111
            LDA   $0F
            ORA   $11
            BEQ   L028108
            BRL   L028115
L028108     LDA   #$2B11
            STA   $0F
            LDA   #$0000
            STA   $11
            BRL   L02814E
L028115     PEI   $11
            PEI   $0F
            LDA   #$0001
            LDX   #$0000
            LDY   #$0001
            CMP   $01,S
            BEQ   L028127
            DEY
L028127     TXA
            CMP   $03,S
            BEQ   L02812F
            LDY   #$0000
L02812F     PLA
            PLA
            TYA
            BNE   L028137
            BRL   L028144
L028137     LDA   #$5622
            STA   $0F
            LDA   #$0000
            STA   $11
            BRL   L02814E
L028144     LDA   #$AC44
            STA   $0F
            LDA   #$0000
            STA   $11
L02814E     LDA   $0D
            BEQ   L028155
            BRL   L028181
L028155     _WaitCursor
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            PEI   $11
            PEI   $0F
            JSL   L029889
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            _InitCursor
            STAL  L02B111
L028181     LDA   #$0001
            STA   $0D
L028186     LDA   $0D
            PEA   $0000
            PHA
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            SEC
            PLA
            SBC   $03,S
            STA   $03,S
            PLA
            SBC   $03,S
            STA   $03,S
            LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            LDA   [$01]
            AND   #$00FF
            TAX
            BNE   L0281C7
            BRL   L0281CA
L0281C7     BRL   L0281CF
L0281CA     INC   $0D
            BRL   L028186
L0281CF     DEC   $0D
            LDA   $0D
            PEA   $0000
            PHA
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            PLA
            CLC
            ADC   #$005F
            BCC   L0281EB
            PLX
            INX
            PHX
L0281EB     PHA
            SEC
            PLA
            SBC   $03,S
            STA   $03,S
            PLA
            SBC   $03,S
            STA   $03,S
            PLA
            STA   $17
            PLA
            STA   $19
            LDA   $0D
            PEA   $0000
            PHA
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            SEC
            PLA
            SBC   $03,S
            STA   $03,S
            PLA
            SBC   $03,S
            STA   $03,S
            PLA
            STA   $3B
            PLA
            STA   $3D
            PEI   $11
            PEI   $0F
            LDA   $01,S
            STA   $2F
            LDA   $03,S
            STA   $31
            PLA
            STA   $2B
            PLA
            STA   $2D
            LDA   #$0003
            STAL  L0400FA
            LDA   #$0003
            STAL  L040100
            LDX   $05
            PHX
            TSX
            STX   $05
            PEA   ^L040034
            PEA   L040034
            PEA   $0000
            TDC
            CLC
            ADC   #$0049
            PHA
            JSL   L02AB57
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            PEA   ^L028838
            PEA   L028838
            PEA   $0000
            TDC
            CLC
            ADC   #$0049
            PHA
            JSL   L02AB0B
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            PEA   $0000
            TDC
            CLC
            ADC   #$0049
            PHA
            JSL   L02AB8B
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STA   $47
            STZ   $0B
L02829F     LDA   $47
            CMP   $0B
            BEQ   L0282A7
            BCS   L0282AA
L0282A7     BRL   L02830E
L0282AA     PEA   $0000
            TDC
            CLC
            ADC   #$0049
            PHA
            LDA   $0B
            LDX   #$0000
            TAY
            BPL   L0282BC
            DEX
L0282BC     PHX
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            LDA   [$01]
            AND   #$00FF
            CMP   #$0020
            BEQ   L0282DC
            BRL   L028309
L0282DC     PEA   $0000
            TDC
            CLC
            ADC   #$0049
            PHA
            LDA   $0B
            LDX   #$0000
            TAY
            BPL   L0282EE
            DEX
L0282EE     PHX
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            SEP   #$20
            LDA   #$2E
            STA   [$01]
            REP   #$20
L028309     INC   $0B
            BRL   L02829F
L02830E     LDA   #$004B
            PHA
            LDA   #$0028
            PHA
            LDA   #$0000
            PHA
            PEA   ^L02883D
            PEA   L02883D
            LDA   #$0000
            PHA
            TDC
            CLC
            ADC   #$0047
            LDX   #$0000
            PHX
            PHA
            PEA   ^L0400F2
            PEA   L0400F2
            _SFPutFile2
            STAL  L02B111
            LDAL  L0400F2
            BNE   L028348
            BRL   L028830
L028348     LDAL  L0400FE
            TAX
            LDAL  L0400FC
            STAL  L030005
            TXA
            STAL  L030007
            LDAL  L030007
            TAX
            LDAL  L030005
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STAL  L030009
            TXA
            STAL  L03000B
            LDA   #$0001
            LDX   #$0148
            STA   $00,X
            LDAL  L03000B
            PHA
            LDAL  L030009
            PHA
            PLA
            CLC
            ADC   #$0002
            BCC   L028394
            PLX
            INX
            PHX
L028394     PHA
            LDA   $01,S
            LDX   #$014A
            STA   $00,X
            LDA   $03,S
            LDX   #$014C
            STA   $00,X
            LDX   #$015A
            PLA
            STA   $00,X
            PLA
            STA   $02,X
            LDA   #$00C3
            LDX   #$014E
            STA   $00,X
            LDA   #$0006
            LDX   #$0150
            STA   $00,X
            LDAL  L03003B
            TAX
            LDAL  L030039
            JSL   L02BB54
            PEA   $3FF9
            PEA   $9F5B
            PEA   $A979
            PEA   $3B31
            PEA   $F000
            JSL   L02BF65
            JSL   L02BBB7
            TXY
            LDX   #$0152
            STA   $00,X
            STY   $02,X
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2002
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0148
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDA   #$0004
            LDX   #$0148
            STA   $00,X
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2001
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0148
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDA   #$0004
            LDX   #$0156
            STA   $00,X
            LDA   #$0002
            LDX   #$015E
            STA   $00,X
            LDX   #$0160
            STZ   $00,X
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2010
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0156
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L02847E
            BRL   L0284BD
L02847E     LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            BRL   L028830
L0284BD     LDA   #$0004
            LDX   #$0162
            STA   $00,X
            LDX   #$0158
            LDA   $00,X
            LDX   #$0164
            STA   $00,X
            LDX   #$0166
            TDC
            CLC
            ADC   #$0013
            STA   $00,X
            STZ   $02,X
            LDX   #$016A
            LDA   #$002C
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2013
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0162
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L028523
            BRL   L028643	; BUG was L028644
L028523     LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDA   #$0001
            LDX   #$0162
            STA   $00,X
            LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2014
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0162
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            BRL   L028830
            LDAL  L030029
            TAX
            LDAL  L030027
            TXY
            LDX   #$0166
            STA   $00,X
            STY   $02,X
            LDA   $0D
            PEA   $0000
            PHA
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            SEC
            PLA
            SBC   $03,S
            STA   $03,S
            PLA
            SBC   $03,S
            STA   $03,S
            LDX   #$016A
            PLA
            STA   $00,X
            PLA
            STA   $02,X
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2013
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0162
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L0285F9
            BRL   L02865F
L0285F9     LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDA   #$0001
            LDX   #$0162
            STA   $00,X
            LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05

L028643     LDA   #$2014
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0162
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            BRL   L028830
L02865F     LDX   #$0166
            TDC
            CLC
            ADC   #$003F
            STA   $00,X
            STZ   $02,X
            LDX   #$016A
            LDA   #$0008
            STA   $00,X
            LDA   #$0000
            STA   $02,X
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2013
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0162
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L0286B3
            BRL   L028719
L0286B3     LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDA   #$0001
            LDX   #$0162
            STA   $00,X
            LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2014
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0162
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            BRL   L028830
L028719     LDX   #$0166	; write suffix
            LDA   #L040000
            STA   $00,X
            LDA   #^L040000
            STA   $02,X

            LDX   #$016A
*            LDA   #$0033
*            STA   $00,X
	lda	L030021
	and	#$ff
	sta	$00,x
	lda	#256
	sec
	sbc	$00,x
	sta	$00,x

            LDA   #$0000
            STA   $02,X
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2013
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0162
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAX
            BNE   L02876E
            BRL   L0287D4
L02876E     LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDA   #$0001
            LDX   #$0162
            STA   $00,X
            LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2014
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0162
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            BRL   L028830
L0287D4     LDA   #$0001
            LDX   #$0162
            STA   $00,X
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2014
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0162
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDAL  L030019
            AND   #$00FE
            STAL  L030019
            LDAL  L0400FE
            PHA
            LDAL  L0400FC
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            PHA
            LDAL  L040102
            PHA
            _DisposeHandle
            STAL  L02B111
L028830     PLD
            TSC
            CLC
            ADC   #$0171
            TCS
            RTL

L028838     ASC   '.WAV'00
L02883D     STR   'Save Where? '
            DB    $00
	
L02884B     TSC
            SEC
            SBC   #$0192
            TCS
            PHD
            TCD
            SEP   #$20
            LDA   #$2E
            STA   $1D
            REP   #$20
            TDC
            CLC
            ADC   #$001D
            LDX   #$0000
            INC
            BNE   L028867
            INX
L028867     STA   $01
            STX   $03
            SEP   #$20
            LDA   #$73
            STA   [$01]
            REP   #$20
            TDC
            CLC
            ADC   #$001D
            LDX   #$0000
            CLC
            ADC   #$0002
            BCC   L028882
            INX
L028882     STA   $01
            STX   $03
            SEP   #$20
            LDA   #$6E
            STA   [$01]
            REP   #$20
            TDC
            CLC
            ADC   #$001D
            LDX   #$0000
            CLC
            ADC   #$0003
            BCC   L02889D
            INX
L02889D     STA   $01
            STX   $03
            SEP   #$20
            LDA   #$64
            STA   [$01]
            REP   #$20
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            PLA
            CLC
            ADC   #$0004
            BCC   L0288BC
            PLX
            INX
            PHX
L0288BC     PHA
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   #$0000
            STA   [$01]
            LDY   #$0002
            LDA   #$4B00
            STA   [$01],Y
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            PLA
            CLC
            ADC   #$0008
            BCC   L0288E3
            PLX
            INX
            PHX
L0288E3     PHA
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   #$0000
            STA   [$01]
            LDY   #$0002
            LDA   #$0000
            STA   [$01],Y
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            PLA
            CLC
            ADC   #$000C
            BCC   L02890A
            PLX
            INX
            PHX
L02890A     PHA
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   #$0000
            STA   [$01]
            LDY   #$0002
            LDA   #$0100
            STA   [$01],Y
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            PLA
            CLC
            ADC   #$0010
            BCC   L028931
            PLX
            INX
            PHX
L028931     PHA
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   #$0000
            STA   [$01]
            LDY   #$0002
            LDA   #$0000
            STA   [$01],Y
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            PLA
            CLC
            ADC   #$0014
            BCC   L028958
            PLX
            INX
            PHX
L028958     PHA
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   #$0000
            STA   [$01]
            LDY   #$0002
            LDA   #$0100
            STA   [$01],Y
            LDX   $05
            PHX
            TSX
            STX   $05
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            PLA
            CLC
            ADC   #$0018
            BCC   L028985
            PLX
            INX
            PHX
L028985     PHA
            LDA   #$0033
            PHA
            JSL   L02B180
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            LDAL  L030023
            TAX
            LDAL  L030021
            PHX
            PHA
            JSL   L022034
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            PLA
            CLC
            ADC   #$0008
            BCC   L0289C8
            PLX
            INX
            PHX
L0289C8     PHA
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   $01,S
            STA   [$01]
            LDY   #$0002
            LDA   $03,S
            STA   [$01],Y
            PLA
            PLA
            LDX   $05
            PHX
            TSX
            STX   $05
            LDAL  L03003B
            PHA
            LDAL  L030039
            PHA
            JSL   L022034
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            PLA
            CLC
            ADC   #$0010
            BCC   L028A0D
            PLX
            INX
            PHX
L028A0D     PHA
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   $01,S
            STA   [$01]
            LDY   #$0002
            LDA   $03,S
            STA   [$01],Y
            PLA
            PLA
            LDX   $05
            PHX
            TSX
            STX   $05
	LDA   #$0001
            LDX   #$0000
            TAY
            BPL   L028A31
            DEX
L028A31     PHX
            PHA
            PEA   $0000
            PEA   $0001
            JSL   L02C5AD
            PEA   ^L040000	; write suffix
            PEA   L040000
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            PLA
            CLC
            ADC   #$0018
            BCC   L028A61
            PLX
            INX
            PHX
L028A61     PHA
            JSL   L02AB57
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDA   #$0003
            PHA
            LDX   #^L0400F2
            LDA   #L0400F2
            CLC
            ADC   #$0008
            BCC   L028A7F
            INX
L028A7F     STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDA   #$0003
            PHA
            LDX   #^L0400F2
            LDA   #L0400F2
            CLC
            ADC   #$000E
            BCC   L028A97
            INX
L028A97     STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDX   $05
            PHX
            TSX
            STX   $05
            PEA   ^L040034
            PEA   L040034
            PEA   $0000
            TDC
            CLC
            ADC   #$0068
            PHA
            PLA
            CLC
            ADC   #$0002
            BCC   L028ABD
            PLX
            INX
            PHX
L028ABD     PHA
            JSL   L02AB57
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            PEA   ^L029233
            PEA   L029233
            PEA   $0000
            TDC
            CLC
            ADC   #$0068
            PHA
            PLA
            CLC
            ADC   #$0002
            BCC   L028AE9
            PLX
            INX
            PHX
L028AE9     PHA
            JSL   L02AB0B
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            PEA   $0000
            TDC
            CLC
            ADC   #$0068
            PHA
            PLA
            CLC
            ADC   #$0002
            BCC   L028B0F
            PLX
            INX
            PHX
L028B0F     PHA
            JSL   L02AB8B
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            PHA
            PLA
            STA   $68
            LDA   #$0000
            STA   $17
L028B25     LDA   $68
            LDX   #$0001
            CMP   $17
            BEQ   L028B30
            BCS   L028B31
L028B30     DEX
L028B31     TXA
            BNE   L028B37
            BRL   L028BCB

L028B37     LDA   $17
            PEA   $0000
            PHA
            PEA   $0000
            PEA   $0001
            JSL   L02C5AD
            PEA   $0000
            TDC
            CLC
            ADC   #$0068
            PHA
            PLA
            CLC
            ADC   #$0002
            BCC   L028B5A
            PLX
            INX
            PHX
L028B5A     PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            LDA   [$01]
            AND   #$00FF
            LDX   #$0000
            CMP   #$0020
            BNE   L028B7A
            INX
L028B7A     TXA
            BNE   L028B80
            BRL   L028BC6
L028B80     LDA   #$002E
            AND   #$00FF
            PHA
            LDA   $17
            PEA   $0000
            PHA
            PEA   $0000
            PEA   $0001
            JSL   L02C5AD
            PEA   $0000
            TDC
            CLC
            ADC   #$0068
            PHA
            PLA
            CLC
            ADC   #$0002
            BCC   L028BAA
            PLX
            INX
            PHX
L028BAA     PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            PLA
            SEP   #$20
            STA   [$01]
            REP   #$20
            AND   #$00FF
L028BC6     INC   $17
            BRL   L028B25
L028BCB     LDA   #$004B
            PHA
            LDA   #$0028
            PHA
            LDA   #$0000
            PHA
            PEA   ^L029237
            PEA   L029237
            LDA   #$0000
            PHA
            TDC
            CLC
            ADC   #$0068
            LDX   #$0000
            PHX
            PHA
            PEA   ^L0400F2
            PEA   L0400F2
            _SFPutFile2
            STAL  L02B111
            LDAL  L0400F2
            BNE   L028C05
            BRL   L02922B
L028C05     _WaitCursor
            STAL  L02B111
            LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            LDA   $01,S
            STA   $0B
            LDA   $03,S
            STA   $0D
            PLA
            PLA
            LDA   #$0000
            LDX   #$0000
            TAY
            BPL   L028C2E
            DEX
L028C2E     PHX
            PHA
            LDA   $01,S
            STA   $19
            LDA   $03,S
            STA   $1B
            PLA
            PLA
L028C3A     PEI   $1B
            PEI   $19
            LDAL  L030023
            TAX
            LDAL  L030021
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L028C53
            TYA
            CMP   $01,S
L028C53     BEQ   L028C57
            BCS   L028C58
L028C57     DEX
L028C58     PLA
            PLA
            TXA
            BNE   L028C60
            BRL   L028D62
L028C60     LDA   #$0080
            PHA
            LDA   [$0B]
            AND   #$00FF
            SEC
            SBC   $01,S
            PLX
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$0B]
            REP   #$20
            AND   #$00FF
            LDA   [$0B]
            AND   #$00FF
            XBA
            AND   #$FF00
            STA   $0F
            LDA   [$0B]
            AND   #$00FF
            AND   #$0080
            STA   $11
            LDA   $11
            BNE   L028C97
            BRL   L028C9F
L028C97     LDA   $0F
            EOR   #$FFFF
            INC
            STA   $0F
L028C9F     LDA   $0F
            CLC
            ADC   #$0084
            STA   $0F
            LDA   $0F
            LDX   #$0007
            JSL   L02CA73
            AND   #$00FF
            STA   $17
            LDA   #$0080
            STA   $15
            LDA   #$0007
            STA   $13
L028CBF     LDA   $13
            LDX   #$0001
            SEC
            SBC   #$0000
            BEQ   L028CD1
            BVS   L028CCF
            EOR   #$8000
L028CCF     BMI   L028CD2
L028CD1     DEX
L028CD2     TXA
            BNE   L028CD8
            BRL   L028CF6
L028CD8     LDA   $17
            AND   $15
            BNE   L028CE1
            BRL   L028CE4
L028CE1     BRL   L028CF6
L028CE4     LDA   $15
            LDX   #$0001
            JSL   L02CA73
            STA   $15
            LDA   $13
            DEC   $13
            BRL   L028CBF
L028CF6     LDA   $13
            STA   $17
            LDA   $0F
            PHA
            LDA   $17
            CLC
            ADC   #$0003
            TAX
            PLA
            JSL   L02CB94
            AND   #$000F
            STA   $13
            LDA   $17
            ASL
            ASL
            ASL
            ASL
            ORA   $11
            ORA   $13
            EOR   #$FFFF
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$0B]
            REP   #$20
            AND   #$00FF
            LDA   [$0B]
            AND   #$00FF
            TAX
            BEQ   L028D34
            LDA   #$0001
L028D34     EOR   #$0001
            BNE   L028D3C
            BRL   L028D4D
L028D3C     LDA   #$0002
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$0B]
            REP   #$20
            AND   #$00FF
L028D4D     INC   $0B
            BNE   L028D53
            INC   $0D
L028D53     PEI   $1B
            PEI   $19
            INC   $19
            BNE   L028D5D
            INC   $1B
L028D5D     PLA
            PLA
            BRL   L028C3A
L028D62     _InitCursor
            STAL  L02B111
            LDAL  L0400FE
            TAX
            LDAL  L0400FC
            STAL  L030005
            PHA
            TXA
            STAL  L030007
            PLA
            LDAL  L030007
            TAX
            LDAL  L030005
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STAL  L030009
            PHA
            TXA
            STAL  L03000B
            PLA
            LDA   #$0001
            PHA
            PLA
            LDX   #$0169
            STA   $00,X
            LDAL  L03000B
            PHA
            LDAL  L030009
            PHA
            PLA
            CLC
            ADC   #$0002
            BCC   L028DBF
            PLX
            INX
            PHX
L028DBF     PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0169
            PHA
            PLA
            CLC
            ADC   #$0002
            BCC   L028DD3
            PLX
            INX
            PHX
L028DD3     PHA
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   $01,S
            STA   [$01]
            LDY   #$0002
            LDA   $03,S
            STA   [$01],Y
            PEA   $0000
            TDC
            CLC
            ADC   #$0177
            PHA
            PLA
            CLC
            ADC   #$0004
            BCC   L028DF8
            PLX
            INX
            PHX
L028DF8     PHA
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   $01,S
            STA   [$01]
            LDY   #$0002
            LDA   $03,S
            STA   [$01],Y
            PLA
            PLA
            LDA   #$00C3
            PHA
            TDC
            CLC
            ADC   #$0169
            LDX   #$0000
            CLC
            ADC   #$0006
            BCC   L028E1F
            INX
L028E1F     STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDA   #$0006
            PHA
            TDC
            CLC
            ADC   #$0169
            LDX   #$0000
            CLC
            ADC   #$0008
            BCC   L028E39
            INX
L028E39     STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDAL  L03003B
            TAX
            LDAL  L030039
            JSL   L02BB54
            PEA   $3FF9
            PEA   $9F5B
            PEA   $A979
            PEA   $3B31
            PEA   $F000
            JSL   L02BF65
            JSL   L02BBB7
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0169
            PHA
            PLA
            CLC
            ADC   #$000A
            BCC   L028E79
            PLX
            INX
            PHX
L028E79     PHA
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   $01,S
            STA   [$01]
            LDY   #$0002
            LDA   $03,S
            STA   [$01],Y
            PLA
            PLA
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2002
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0169
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDA   #$0004
            PHA
            PLA
            LDX   #$0169
            STA   $00,X
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2001
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0169
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDA   #$0004
            PHA
            PLA
            LDX   #$0177
            STA   $00,X
            LDA   #$0002
            PHA
            TDC
            CLC
            ADC   #$0177
            LDX   #$0000
            CLC
            ADC   #$0008
            BCC   L028EF2
            INX
L028EF2     STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDA   #$0000
            PHA
            TDC
            CLC
            ADC   #$0177
            LDX   #$0000
            CLC
            ADC   #$000A
            BCC   L028F0C
            INX
L028F0C     STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2010
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0177
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAY
            BNE   L028F4E
            BRL   L028F8F
L028F4E     LDAL  L0400FE
            TAX
            LDAL  L0400FC
            PHX
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            TAX
            LDAL  L040102
            PHX
            PHA
            _DisposeHandle
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            BRL   L02922B
L028F8F     LDA   #$0004
            PHA
            PLA
            LDX   #$0183
            STA   $00,X
            LDX   #$0179
            LDA   $00,X
            PHA
            TDC
            CLC
            ADC   #$0183
            LDX   #$0000
            CLC
            ADC   #$0002
            BCC   L028FAE
            INX
L028FAE     STA   $01
            STX   $03
            PLA
            STA   [$01]
            PEA   $0000
            TDC
            CLC
            ADC   #$001D
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0183
            PHA
            PLA
            CLC
            ADC   #$0004
            BCC   L028FD1
            PLX
            INX
            PHX
L028FD1     PHA
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   $01,S
            STA   [$01]
            LDY   #$0002
            LDA   $03,S
            STA   [$01],Y
            PLA
            PLA
            PEA   $0000
            TDC
            CLC
            ADC   #$0183
            PHA
            PLA
            CLC
            ADC   #$0008
            BCC   L028FF8
            PLX
            INX
            PHX
L028FF8     PHA
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   #$004B
            STA   [$01]
            LDY   #$0002
            LDA   #$0000
            STA   [$01],Y
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2013
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0183
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAY
            BNE   L029047
            BRL   L0290B1
L029047     LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDA   #$0001
            PHA
            PLA
            LDX   #$0183
            STA   $00,X
            LDAL  L0400FE
            TAX
            LDAL  L0400FC
            PHX
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            TAX
            LDAL  L040102
            PHX
            PHA
            _DisposeHandle
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2014
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0183
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            BRL   L02922B
L0290B1     LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0183
            PHA
            PLA
            CLC
            ADC   #$0004
            BCC   L0290CE
            PLX
            INX
            PHX
L0290CE     PHA
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   $01,S
            STA   [$01]
            LDY   #$0002
            LDA   $03,S
            STA   [$01],Y
            PLA
            PLA
            LDAL  L030023
            TAX
            LDAL  L030021
            PHX
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0183
            PHA
            PLA
            CLC
            ADC   #$0008
            BCC   L029100
            PLX
            INX
            PHX
L029100     PHA
            PLA
            STA   $01
            PLA
            STA   $03
            LDA   $01,S
            STA   [$01]
            LDY   #$0002
            LDA   $03,S
            STA   [$01],Y
            PLA
            PLA
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2013
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0183
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAY
            BNE   L02914F
            BRL   L0291B9
L02914F     LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDA   #$0001
            PHA
            PLA
            LDX   #$0183
            STA   $00,X
            LDAL  L0400FE
            TAX
            LDAL  L0400FC
            PHX
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            TAX
            LDAL  L040102
            PHX
            PHA
            _DisposeHandle
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2014
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0183
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            BRL   L02922B
L0291B9     LDA   #$0001
            PHA
            PLA
            LDX   #$0183
            STA   $00,X
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$2014
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$0183
            PHA
            JSL   L02A4D6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDAL  L030019
            AND   #$00FE
            STAL  L030019
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L020FED
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDAL  L0400FE
            TAX
            LDAL  L0400FC
            PHX
            PHA
            _DisposeHandle
            STAL  L02B111
            LDAL  L040104
            TAX
            LDAL  L040102
            PHX
            PHA
            _DisposeHandle
            STAL  L02B111
L02922B     PLD
            TSC
            CLC
            ADC   #$0192
            TCS
            RTL

L029233     ASC   '.AU'00
L029237     STR   'Save Where? '
            DB    $00

L029245     TSC
            SEC
            SBC   #$0059
            TCS
            PHD
            TCD
            PHA
            PHA
            LDA   #$8006
            PHA
            PEA   $0000
            PEA   $012D
            _LoadResource
            STAL  L02B111
            PLA
            PLX
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            PHA
            LDA   [$01]
            PHA
            LDA   $01,S
            STA   $07
            LDA   $03,S
            STA   $09
            PLA
            PLA
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$000E
            LDX   #$0000
            TAY
            BPL   L02928D
            DEX
L02928D     PHX
            PHA
            PEA   ^L02987A
            PEA   L02987A
            LDA   #$0001
            LDX   #$0000
            TAY
            BPL   L02929F
            DEX
L02929F     PHX
            PHA
            PEA   $0000
            PEA   $0001
            JSL   L02C5AD
            CLC
            PLA
            ADC   $07
            PHA
            LDA   $03,S
            ADC   $09
            STA   $03,S
            JSL   L02ABAF
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            TAY
            BNE   L0292C8
            BRL   L0292E5
L0292C8     LDA   #$1E06
            STAL  L03002B
            LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$0005
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L0292E5     LDAL  L03003B
            PHA
            LDAL  L030039
            PHA
            LDA   #$0032
            LDX   #$0000
            TAY
            BPL   L0292F9
            DEX
L0292F9     JSL   L02B113
            LDA   $01,S
            STA   $1C
            LDA   $03,S
            STA   $1E
            PLA
            PLA
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            LDA   #$0002
            PHA
            PEA   $0000
            PEA   $0FF2
            LDA   #$800E
            PHA
            _NewWindow2
            STAL  L02B111
            LDA   $01,S
            STA   $14
            LDA   $03,S
            STA   $16
            PLA
            PLA
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAY
            BNE   L029360
            BRL   L029376
L029360     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$01BC
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L029376     PEI   $16
            PEI   $14
            _ShowWindow
            STAL  L02B111
            PEI   $16
            PEI   $14
            _SelectWindow
            STAL  L02B111
L029394     PHA
            PHA
            PEA   $0000
            TDC
            CLC
            ADC   #$002C
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   #$0018
            PHA
            _DoModalWindow
            STAL  L02B111
            LDA   $01,S
            STA   $18
            LDA   $03,S
            STA   $1A
            PLA
            PLA
            LDA   #$002F
            LDX   #$0000
            TAY
            BPL   L0293D4
            DEX
L0293D4     CMP   $18
            BNE   L0293DA
            CPX   $1A
L0293DA     BEQ   L0293E1
            LDA   #$0001
            BRA   L0293E4
L0293E1     LDA   #$0000
L0293E4     BEQ   L0293E9
            BRL   L029394
L0293E9     LDAL  L030019
            AND   #$0040
            BNE   L0293F5
            BRL   L029407
L0293F5     PEI   $16
            PEI   $14
            _CloseWindow
            STAL  L02B111
            BRL   L029872
L029407     LDA   $3A
            AND   #$0100
            BNE   L029411
            BRL   L0295CE
L029411     _WaitCursor
            STAL  L02B111
            PHA
            PHA
            PEI   $16
            PEI   $14
            PEA   $0000
            PEA   $0030
            _GetCtlHandleFromID
            STAL  L02B111
            _ShowControl
            STAL  L02B111
            LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            LDA   $01,S
            STA   $07
            LDA   $03,S
            STA   $09
            LDA   $01,S
            STA   $0B
            LDA   $03,S
            STA   $0D
            PLA
            PLA
            LDA   #$0000
            LDX   #$0000
            TAY
            BPL   L029464
            DEX
L029464     PHX
            PHA
            LDA   $01,S
            STA   $18
            LDA   $03,S
            STA   $1A
            LDA   $01,S
            STA   $20
            LDA   $03,S
            STA   $22
            PLA
            PLX
            AND   #$00FF
            SEP   #$20
            STA   $13
            REP   #$20
L029481     PEI   $1A
            PEI   $18
            LDAL  L030023
            TAX
            LDAL  L030021
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L02949A
            TYA
            CMP   $01,S
L02949A     BEQ   L02949E
            BCS   L02949F
L02949E     DEX
L02949F     PLA
            PLA
            TXA
            BNE   L0294A7
            BRL   L0295C0
L0294A7     LDA   $13
            AND   #$00FF
            BNE   L0294B1
            BRL   L029502
L0294B1     LDA   [$0F]
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$07]
            REP   #$20
            AND   #$00FF
            INC   $0F
            BNE   L0294C7
            INC   $11
L0294C7     LDX   $1E
            LDA   $1C
            CMP   $20
            BNE   L0294D1
            CPX   $22
L0294D1     BNE   L0294D8
            LDA   #$0001
            BRA   L0294DB
L0294D8     LDA   #$0000
L0294DB     BNE   L0294E0
            BRL   L0294FF
L0294E0     LDA   #$0000
            LDX   #$0000
            TAY
            BPL   L0294EA
            DEX
L0294EA     PHX
            PHA
            LDA   $01,S
            STA   $20
            LDA   $03,S
            STA   $22
            PLA
            PLX
            AND   #$00FF
            SEP   #$20
            STA   $13
            REP   #$20
L0294FF     BRL   L02959F
L029502     LDA   [$0B]
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$07]
            REP   #$20
            AND   #$00FF
            LDA   #$0002
            LDX   #$0000
            TAY
            BPL   L02951C
            DEX
L02951C     PHX
            PHA
            PEA   $0000
            PEA   $0001
            JSL   L02C5AD
            CLC
            PLA
            ADC   $0B
            PHA
            LDA   $03,S
            ADC   $0D
            STA   $03,S
            LDA   $01,S
            STA   $0B
            LDA   $03,S
            STA   $0D
            PLA
            PLA
            LDX   $1E
            LDA   $1C
            CMP   $20
            BNE   L029547
            CPX   $22
L029547     BNE   L02954E
            LDA   #$0001
            BRA   L029551
L02954E     LDA   #$0000
L029551     BNE   L029556
            BRL   L02959F
L029556     LDA   #$0001
            AND   #$00FF
            SEP   #$20
            STA   $13
            REP   #$20
            LDA   #$0000
            LDX   #$0000
            TAY
            BPL   L02956C
            DEX
L02956C     PHX
            PHA
            LDA   $01,S
            STA   $20
            LDA   $03,S
            STA   $22
            PLA
            PLA
            PEI   $1E
            PEI   $1C
            LDA   #$0001
            LDX   #$0000
            JSL   L02CB25
            PEI   $09
            PEI   $07
            SEC
            PLA
            SBC   $03,S
            STA   $03,S
            PLA
            SBC   $03,S
            STA   $03,S
            LDA   $01,S
            STA   $0F
            LDA   $03,S
            STA   $11
            PLA
            PLA
L02959F     INC   $07
            BNE   L0295A5
            INC   $09
L0295A5     PEI   $1A
            PEI   $18
            INC   $18
            BNE   L0295AF
            INC   $1A
L0295AF     PLA
            PLA
            PEI   $22
            PEI   $20
            INC   $20
            BNE   L0295BB
            INC   $22
L0295BB     PLA
            PLA
            BRL   L029481
L0295C0     LDAL  L030019
            ORA   #$0040
            STAL  L030019
            BRL   L029858
L0295CE     LDA   $3A
            AND   #$0800
            BNE   L0295D8
            BRL   L029858
L0295D8     _WaitCursor
            STAL  L02B111
            PHA
            PHA
            PEI   $16
            PEI   $14
            PEA   $0000
            PEA   $0030
            _GetCtlHandleFromID
            STAL  L02B111
            _ShowControl
            STAL  L02B111
            PHA
            PHA
            PEI   $1E
            PEI   $1C
            LDA   #$0002
            LDX   #$0000
            TAY
            BPL   L029615
            DEX
L029615     JSL   L02B113
            CLC
            PLA
            ADC   #$0001
            PHA
            LDA   $03,S
            ADC   #$0000
            STA   $03,S
            LDAL  L030035
            PHA
            LDA   #$C000
            PHA
            PEA   $0000
            PEA   $0000
            _NewHandle
            STAL  L02B111
            LDA   $01,S
            STA   $28
            LDA   $03,S
            STA   $2A
            PLA
            PLA
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAY
            BNE   L029666
            BRL   L029695
L029666     LDAL  L03002B
            LDX   #$0000
            CMP   #$0201
            BNE   L029673
            INX
L029673     TXA
            BNE   L029679
            BRL   L029680
L029679     LDA   #$0086
            STAL  L03002B
L029680     LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            BRL   L029872
L029695     LDY   #$0002
            LDA   [$28],Y
            PHA
            LDA   [$28]
            PHA
            LDA   $01,S
            STA   $0B
            LDA   $03,S
            STA   $0D
            PLA
            PLA
            LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            LDA   $01,S
            STA   $07
            LDA   $03,S
            STA   $09
            LDA   $01,S
            STA   $0F
            LDA   $03,S
            STA   $11
            PLA
            PLA
            PEI   $1E
            PEI   $1C
            LDA   #$0001
            LDX   #$0000
            TAY
            BPL   L0296D2
            DEX
L0296D2     PHX
            PHA
            JSL   L02B0CB
            LDA   $01,S
            STA   $24
            LDA   $03,S
            STA   $26
            PLA
            PLA
            LDX   $05
            PHX
            TSX
            STX   $05
            PEI   $26
            PEI   $24
            PEI   $09
            PEI   $07
            PEI   $0D
            PEI   $0B
            JSL   L02A6DB
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDA   #$0000
            LDX   #$0000
            TAY
            BPL   L02970A
            DEX
L02970A     PHX
            PHA
            LDA   $01,S
            STA   $20
            LDA   $03,S
            STA   $22
            LDA   $01,S
            STA   $18
            LDA   $03,S
            STA   $1A
            PLA
            PLX
            AND   #$00FF
            SEP   #$20
            STA   $13
            REP   #$20
L029727     PEI   $1A
            PEI   $18
            LDAL  L030023
            TAX
            LDAL  L030021
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L029740
            TYA
            CMP   $01,S
L029740     BEQ   L029744
            BCS   L029745
L029744     DEX
L029745     PLA
            PLA
            TXA
            BNE   L02974D
            BRL   L02983E
L02974D     LDX   $26
            LDA   $24
            CMP   $20
            BNE   L029757
            CPX   $22
L029757     BNE   L02975E
            LDA   #$0001
            BRA   L029761
L02975E     LDA   #$0000
L029761     BNE   L029766
            BRL   L0297D0
L029766     PEI   $1E
            PEI   $1C
            LDA   #$0001
            LDX   #$0000
            JSL   L02CB25
            CLC
            PLA
            ADC   $0F
            PHA
            LDA   $03,S
            ADC   $11
            STA   $03,S
            LDA   $01,S
            STA   $0F
            LDA   $03,S
            STA   $11
            PLA
            PLA
            LDY   #$0002
            LDA   [$28],Y
            PHA
            LDA   [$28]
            PHA
            LDA   $01,S
            STA   $0B
            LDA   $03,S
            STA   $0D
            PLA
            PLA
            LDX   $05
            PHX
            TSX
            STX   $05
            PEI   $26
            PEI   $24
            PEI   $11
            PEI   $0F
            PEI   $0D
            PEI   $0B
            JSL   L02A6DB
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDA   #$0000
            LDX   #$0000
            TAY
            BPL   L0297C4
            DEX
L0297C4     PHX
            PHA
            LDA   $01,S
            STA   $20
            LDA   $03,S
            STA   $22
            PLA
            PLA
L0297D0     LDA   [$0B]
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$07]
            REP   #$20
            AND   #$00FF
            INC   $07
            BNE   L0297E6
            INC   $09
L0297E6     INC   $18
            BNE   L0297EC
            INC   $1A
L0297EC     LDAL  L030023
            TAX
            LDAL  L030021
            CMP   $18
            BNE   L0297FB
            CPX   $1A
L0297FB     BNE   L029802
            LDA   #$0001
            BRA   L029805
L029802     LDA   #$0000
L029805     BNE   L02980A
            BRL   L02980D
L02980A     BRL   L02983E
L02980D     LDA   [$0B]
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$07]
            REP   #$20
            AND   #$00FF
            INC   $07
            BNE   L029823
            INC   $09
L029823     INC   $0B
            BNE   L029829
            INC   $0D
L029829     INC   $18
            BNE   L02982F
            INC   $1A
L02982F     PEI   $22
            PEI   $20
            INC   $20
            BNE   L029839
            INC   $22
L029839     PLA
            PLA
            BRL   L029727
L02983E     PEI   $2A
            PEI   $28
            _DisposeHandle
            STAL  L02B111
            LDAL  L030019
            ORA   #$0040
            STAL  L030019
L029858     PEI   $16
            PEI   $14
            _CloseWindow
            STAL  L02B111
            _InitCursor
            STAL  L02B111
L029872     PLD
            TSC
            CLC
            ADC   #$0059
            TCS
            RTL

L02987A     ASC   'Buy IBM Aptiva'00

L029889     TSC
            SEC
            SBC   #$004C
            TCS
            PHD
            TCD
            LDX   $52
            LDA   $50
            JSL   L02BB54
            LDAL  L03003B
            TAX
            LDAL  L030039
            JSL   L02BB54
            JSL   L02BC4A
            PEA   $0000
            TDC
            CLC
            ADC   #$002D
            PHA
            JSL   L02BC1E
            TSC
            CLC
            ADC   #$000A
            TCS
            PEA   $0000
            TDC
            CLC
            ADC   #$002D
            PHA
            JSL   L02BF38
            PEA   $3FFF
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            JSL   L02BF05
            BNE   L0298E2
            BRL   L029E35
L0298E2     PHA
            PHA
            LDAL  L030023
            TAX
            LDAL  L030021
            JSL   L02BB54
            PEA   $0000
            TDC
            CLC
            ADC   #$002D
            PHA
            PEA   $0000
            TSC
            CLC
            ADC   #$0007
            PHA
            PEA   $0104
            _SANEFP816
            LDA   #$0014
            LDX   #$0000
            JSL   L02BB54
            JSL   L02BB05
            JSL   L02BBB7
            PHX
            PHA
            LDAL  L030035
            PHA
            LDA   #$C000
            PHA
            PEA   $0000
            PEA   $0000
            _NewHandle
            STAL  L02B111
            LDA   $01,S
            STA   $07
            LDA   $03,S
            STA   $09
            PLA
            PLA
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAY
            BNE   L029961
            BRL   L029990
L029961     LDAL  L03002B
            LDX   #$0000
            CMP   #$0201
            BNE   L02996E
            INX
L02996E     TXA
            BNE   L029974
            BRL   L02997B
L029974     LDA   #$0086
            STAL  L03002B
L02997B     LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L0250E2
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            BRL   L02A307
L029990     LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            LDA   $01,S
            STA   $0B
            LDA   $03,S
            STA   $0D
            PLA
            PLA
            PEA   $0000
            PEA   $000A
            PEA   $0000
            PEA   $0001
            JSL   L02C5AD
            LDY   #$0002
            LDA   [$07],Y
            PHA
            LDA   [$07]
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            LDA   $01,S
            STA   $0F
            LDA   $03,S
            STA   $11
            PLA
            PLA
            PEA   $0000
            TDC
            CLC
            ADC   #$002D
            PHA
            JSL   L02BF38
            PEA   $0000
            TDC
            CLC
            ADC   #$0035
            PHA
            JSL   L02BC1E
            TSC
            CLC
            ADC   #$000A
            TCS
            LDA   #$0000
            LDX   #$0000
            TAY
            BPL   L0299FC
            DEX
L0299FC     PHX
            PHA
            LDA   $01,S
            STA   $13
            LDA   $03,S
            STA   $15
            LDA   $01,S
            STA   $17
            LDA   $03,S
            STA   $19
            LDA   $01,S
            STA   $1F
            LDA   $03,S
            STA   $21
            PLA
            PLA
L029A18     PEI   $15
            PEI   $13
            LDAL  L030023
            TAX
            LDAL  L030021
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L029A31
            TYA
            CMP   $01,S
L029A31     BEQ   L029A35
            BCS   L029A36
L029A35     DEX
L029A36     PLA
            PLA
            TXA
            BNE   L029A3E
            BRL   L029B82
L029A3E     PEA   $0000
            TDC
            CLC
            ADC   #$0035
            PHA
            JSL   L02BF38
            LDX   $21
            LDA   $1F
            JSL   L02BB54
            JSL   L02BFF6
            JSL   L02BBEC
            STA   $23
            LDA   [$0B]
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$0F]
            REP   #$20
            AND   #$00FF
            INC   $17
            BNE   L029A73
            INC   $19
L029A73     INC   $0F
            BNE   L029A79
            INC   $11
L029A79     LDA   [$0B]
            AND   #$00FF
            PHA
            LDA   #$0001
            LDX   #$0000
            TAY
            BPL   L029A89
            DEX
L029A89     PHX
            PHA
            PEA   $0000
            PEA   $0001
            JSL   L02C5AD
            CLC
            PLA
            ADC   $0B
            PHA
            LDA   $03,S
            ADC   $0D
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            LDA   [$01]
            AND   #$00FF
            SEC
            SBC   $01,S
            PLX
            STA   $27
            LDA   #$0001
            STA   $25
L029AB6     LDA   $23
            LDX   #$0001
            CMP   $25
            BEQ   L029AC1
            BCS   L029AC2
L029AC1     DEX
L029AC2     TXA
            BNE   L029AC8
            BRL   L029B14
L029AC8     LDA   [$0B]
            AND   #$00FF
            PHA
            LDA   $27
            LDX   $23
            JSL   L02CA8E
            LDX   $25
            JSL   L02CABC
            CLC
            ADC   $01,S
            PLX
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$0F]
            REP   #$20
            AND   #$00FF
            INC   $25
            PEI   $11
            PEI   $0F
            INC   $0F
            BNE   L029AFA
            INC   $11
L029AFA     PLA
            PLX
            STA   $01
            STX   $03
            LDA   [$01]
            AND   #$00FF
            PEI   $19
            PEI   $17
            INC   $17
            BNE   L029B0F
            INC   $19
L029B0F     PLA
            PLA
            BRL   L029AB6
L029B14     PEA   $0000
            TDC
            CLC
            ADC   #$0035
            PHA
            JSL   L02BF38
            JSL   L02BBB7
            PHX
            PHA
            LDA   $01,S
            STA   $1F
            LDA   $03,S
            STA   $21
            PLA
            PLA
            PEA   $0000
            TDC
            CLC
            ADC   #$002D
            PHA
            JSL   L02BF38
            PEA   $0000
            TDC
            CLC
            ADC   #$0035
            PHA
            PEA   $0000
            TSC
            CLC
            ADC   #$0007
            PHA
            PEA   $0100
            _SANEFP816
            PEA   $0000
            TDC
            CLC
            ADC   #$0035
            PHA
            JSL   L02BC1E
            TSC
            CLC
            ADC   #$000A
            TCS
            INC   $13
            BNE   L029B73
            INC   $15
L029B73     PEI   $0D
            PEI   $0B
            INC   $0B
            BNE   L029B7D
            INC   $0D
L029B7D     PLA
            PLA
            BRL   L029A18
L029B82     LDX   $19
            LDA   $17
            STAL  L030021
            PHA
            TXA
            STAL  L030023
            PLA
            LDX   $52
            LDA   $50
            STAL  L030039
            PHA
            TXA
            STAL  L03003B
            PLA
            LDA   L030039
            ORA   L03003B
            BNE   L029BAD
            LDA   #$0001
            BRA   L029BB0
L029BAD     LDA   #$0000
L029BB0     BNE   L029BB5
            BRL   L029BCC
L029BB5     CLC
            LDAL  L030039
            ADC   #$0001
            STAL  L030039
            BCC   L029BCC
            LDAL  L03003B
            INC
            STAL  L03003B
L029BCC     PEA   $0000
            PEA   $FFFA
            LDAL  L03003B
            TAX
            LDAL  L030039
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L029BE7
            TYA
            CMP   $01,S
L029BE7     BEQ   L029BEB
            BCS   L029BEC
L029BEB     DEX
L029BEC     PLA
            PLA
            TXA
            BNE   L029BF4
            BRL   L029C08
L029BF4     PEA   $0000
            PEA   $FFFA
            LDA   $01,S
            STAL  L030039
            LDA   $03,S
            STAL  L03003B
            PLA
            PLA
L029C08     PEI   $09
            PEI   $07
            _HLock
            STAL  L02B111
            LDY   #$0002
            LDA   [$07],Y
            PHA
            LDA   [$07]
            PHA
            LDA   $01,S
            STA   $0B
            LDA   $03,S
            STA   $0D
            PLA
            PLA
            LDA   #$000A
            LDX   #$0000
            TAY
            BPL   L029C34
            DEX
L029C34     PHX
            PHA
            PEA   $0000
            PEA   $0001
            JSL   L02C5AD
            CLC
            PLA
            ADC   $0B
            PHA
            LDA   $03,S
            ADC   $0D
            STA   $03,S
            LDA   $01,S
            STAL  L030027
            LDA   $03,S
            STAL  L030029
            PLA
            PLA
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            LDA   #$0008
            LDX   #$0000
            TAY
            BPL   L029C6D
            DEX
L029C6D     PHX
            PHA
            JSL   L02C248
            LDA   #$FFFF
            PEA   $0000
            PHA
            PLA
            AND   $03,S
            STA   $03,S
            PLA
            AND   $03,S
            STA   $03,S
            PLA
            PLX
            STAL  L030025
            LDAL  L030025
            TAX
            BEQ   L029C94
            LDA   #$0001
L029C94     EOR   #$0001
            BNE   L029C9C
            BRL   L029CA3
L029C9C     LDA   #$0001
            STAL  L030025
L029CA3     LDA   #$0000
            AND   #$00FF
            PHA
            LDA   #$0001
            LDX   #$0000
            TAY
            BPL   L029CB4
            DEX
L029CB4     PHX
            PHA
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            SEC
            PLA
            SBC   $03,S
            STA   $03,S
            PLA
            SBC   $03,S
            STA   $03,S
            PEA   $0000
            PEA   $0001
            JSL   L02C5AD
            LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            PLA
            SEP   #$20
            STA   [$01]
            REP   #$20
            AND   #$00FF
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L026CEE
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDY   #$0002
            LDA   [$07],Y
            PHA
            LDA   [$07]
            PHA
            LDA   $01,S
            STA   $29
            LDA   $03,S
            STA   $2B
            PLA
            PLA
            LDA   #$0000
            PHA
            LDA   #$0000
            LDX   #$0000
            TAY
            BPL   L029D2D
            DEX
L029D2D     PHX
            PHA
            PEA   $0000
            PEA   $0002
            JSL   L02C5AD
            CLC
            PLA
            ADC   $29
            PHA
            LDA   $03,S
            ADC   $2B
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDAL  L030025
            PHA
            LDA   #$0001
            LDX   #$0000
            TAY
            BPL   L029D5C
            DEX
L029D5C     PHX
            PHA
            PEA   $0000
            PEA   $0002
            JSL   L02C5AD
            CLC
            PLA
            ADC   $29
            PHA
            LDA   $03,S
            ADC   $2B
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDAL  L030017
            PHA
            LDA   #$0002
            LDX   #$0000
            TAY
            BPL   L029D8B
            DEX
L029D8B     PHX
            PHA
            PEA   $0000
            PEA   $0002
            JSL   L02C5AD
            CLC
            PLA
            ADC   $29
            PHA
            LDA   $03,S
            ADC   $2B
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDAL  L03000D
            PHA
            LDA   #$0003
            LDX   #$0000
            TAY
            BPL   L029DBA
            DEX
L029DBA     PHX
            PHA
            PEA   $0000
            PEA   $0002
            JSL   L02C5AD
            CLC
            PLA
            ADC   $29
            PHA
            LDA   $03,S
            ADC   $2B
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDAL  L03003B
            TAX
            LDAL  L030039
            PHA
            LDA   #$0004
            LDX   #$0000
            TAY
            BPL   L029DEE
            DEX
L029DEE     PHX
            PHA
            PEA   $0000
            PEA   $0002
            JSL   L02C5AD
            CLC
            PLA
            ADC   $29
            PHA
            LDA   $03,S
            ADC   $2B
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _DisposeHandle
            STAL  L02B111
            LDX   $09
            LDA   $07
            STAL  L03002D
            PHA
            TXA
            STAL  L03002F
            PLA
            BRL   L02A266
L029E35     LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            LDA   $01,S
            STA   $0F
            LDA   $03,S
            STA   $11
            LDA   $01,S
            STA   $0B
            LDA   $03,S
            STA   $0D
            PLA
            PLA
            PEA   $0000
            TDC
            CLC
            ADC   #$002D
            PHA
            JSL   L02BF38
            PEA   $0000
            TDC
            CLC
            ADC   #$0035
            PHA
            JSL   L02BC1E
            TSC
            CLC
            ADC   #$000A
            TCS
            PEA   $0000
            TDC
            CLC
            ADC   #$002D
            PHA
            JSL   L02BF38
            JSL   L02BBB7
            PHX
            PHA
            LDA   $01,S
            STA   $1B
            LDA   $03,S
            STA   $1D
            PLA
            PLA
            LDA   #$0000
            LDX   #$0000
            TAY
            BPL   L029E98
            DEX
L029E98     PHX
            PHA
            LDA   $01,S
            STA   $17
            LDA   $03,S
            STA   $19
            LDA   $01,S
            STA   $13
            LDA   $03,S
            STA   $15
            LDA   $01,S
            STA   $1F
            LDA   $03,S
            STA   $21
            PLA
            PLX
            JSL   L02BB54
            PEA   $0000
            TDC
            CLC
            ADC   #$003D
            PHA
            JSL   L02BC1E
            TSC
            CLC
            ADC   #$000A
            TCS
L029ECB     PEI   $15
            PEI   $13
            LDAL  L030023
            TAX
            LDAL  L030021
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L029EE4
            TYA
            CMP   $01,S
L029EE4     BEQ   L029EE8
            BCS   L029EE9
L029EE8     DEX
L029EE9     PLA
            PLA
            TXA
            BNE   L029EF1
            BRL   L029FD6
L029EF1     PEI   $1D
            PEI   $1B
            SEC
            PLA
            SBC   $1F
            PHA
            LDA   $03,S
            SBC   $21
            STA   $03,S
            LDA   #$0000
            LDX   #$0000
            LDY   #$0001
            CMP   $01,S
            BEQ   L029F0E
            DEY
L029F0E     TXA
            CMP   $03,S
            BEQ   L029F16
            LDY   #$0000
L029F16     PLA
            PLA
            TYA
            BEQ   L029F1E
            BRL   L029F68
L029F1E     LDA   [$0B]
            AND   #$00FF
            PHA
            PLA
            SEP   #$20
            STA   [$0F]
            REP   #$20
            AND   #$00FF
            INC   $17
            BNE   L029F34
            INC   $19
L029F34     INC   $0F
            BNE   L029F3A
            INC   $11
L029F3A     PEA   $0000
            TDC
            CLC
            ADC   #$0035
            PHA
            JSL   L02BF38
            PEA   $0000
            TDC
            CLC
            ADC   #$003D
            PHA
            JSL   L02BC1E
            TSC
            CLC
            ADC   #$000A
            TCS
            PEI   $1D
            PEI   $1B
            LDA   $01,S
            STA   $1F
            LDA   $03,S
            STA   $21
            PLA
            PLA
L029F68     PEA   $0000
            TDC
            CLC
            ADC   #$002D
            PHA
            JSL   L02BF38
            PEA   $0000
            TDC
            CLC
            ADC   #$0035
            PHA
            PEA   $0000
            TSC
            CLC
            ADC   #$0007
            PHA
            PEA   $0100
            _SANEFP816
            PEA   $0000
            TDC
            CLC
            ADC   #$0035
            PHA
            JSL   L02BC1E
            TSC
            CLC
            ADC   #$000A
            TCS
            PEA   $0000
            TDC
            CLC
            ADC   #$0035
            PHA
            JSL   L02BF38
            JSL   L02BBB7
            PHX
            PHA
            LDA   $01,S
            STA   $1B
            LDA   $03,S
            STA   $1D
            PLA
            PLA
            INC   $13
            BNE   L029FC7
            INC   $15
L029FC7     PEI   $0D
            PEI   $0B
            INC   $0B
            BNE   L029FD1
            INC   $0D
L029FD1     PLA
            PLA
            BRL   L029ECB
L029FD6     LDX   $19
            LDA   $17
            STAL  L030021
            PHA
            TXA
            STAL  L030023
            PLA
            LDX   $52
            LDA   $50
            STAL  L030039
            PHA
            TXA
            STAL  L03003B
            PLA
            LDA   L030039
            ORA   L03003B
            BNE   L02A001
            LDA   #$0001
            BRA   L02A004
L02A001     LDA   #$0000
L02A004     BNE   L02A009
            BRL   L02A020
L02A009     CLC
            LDAL  L030039
            ADC   #$0001
            STAL  L030039
            BCC   L02A020
            LDAL  L03003B
            INC
            STAL  L03003B
L02A020     PEA   $0000
            PEA   $FFFA
            LDAL  L03003B
            TAX
            LDAL  L030039
            TAY
            TXA
            LDX   #$0001
            CMP   $03,S
            BNE   L02A03B
            TYA
            CMP   $01,S
L02A03B     BEQ   L02A03F
            BCS   L02A040
L02A03F     DEX
L02A040     PLA
            PLA
            TXA
            BNE   L02A048
            BRL   L02A05C
L02A048     PEA   $0000
            PEA   $FFFA
            LDA   $01,S
            STAL  L030039
            LDA   $03,S
            STAL  L03003B
            PLA
            PLA
L02A05C     LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            LDA   #$0008
            LDX   #$0000
            TAY
            BPL   L02A070
            DEX
L02A070     PHX
            PHA
            JSL   L02C248
            LDA   #$FFFF
            PEA   $0000
            PHA
            PLA
            AND   $03,S
            STA   $03,S
            PLA
            AND   $03,S
            STA   $03,S
            PLA
            PLX
            STAL  L030025
            LDAL  L030025
            TAX
            BEQ   L02A097
            LDA   #$0001
L02A097     EOR   #$0001
            BNE   L02A09F
            BRL   L02A0A6
L02A09F     LDA   #$0001
            STAL  L030025
L02A0A6     LDA   #$0000
            AND   #$00FF
            PHA
            LDA   #$0001
            LDX   #$0000
            TAY
            BPL   L02A0B7
            DEX
L02A0B7     PHX
            PHA
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            SEC
            PLA
            SBC   $03,S
            STA   $03,S
            PLA
            SBC   $03,S
            STA   $03,S
            PEA   $0000
            PEA   $0001
            JSL   L02C5AD
            LDAL  L030029
            PHA
            LDAL  L030027
            PHA
            CLC
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            ADC   $03,S
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            PLA
            SEP   #$20
            STA   [$01]
            REP   #$20
            AND   #$00FF
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L026CEE
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDAL  L03002F
            TAX
            LDAL  L03002D
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            PHA
            LDA   [$01]
            PHA
            LDA   $01,S
            STA   $29
            LDA   $03,S
            STA   $2B
            PLA
            PLA
            LDAL  L030025
            PHA
            LDA   #$0001
            LDX   #$0000
            TAY
            BPL   L02A13E
            DEX
L02A13E     PHX
            PHA
            PEA   $0000
            PEA   $0002
            JSL   L02C5AD
            CLC
            PLA
            ADC   $29
            PHA
            LDA   $03,S
            ADC   $2B
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDAL  L030017
            PHA
            LDA   #$0002
            LDX   #$0000
            TAY
            BPL   L02A16D
            DEX
L02A16D     PHX
            PHA
            PEA   $0000
            PEA   $0002
            JSL   L02C5AD
            CLC
            PLA
            ADC   $29
            PHA
            LDA   $03,S
            ADC   $2B
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDAL  L03003B
            TAX
            LDAL  L030039
            PHA
            LDA   #$0004
            LDX   #$0000
            TAY
            BPL   L02A1A1
            DEX
L02A1A1     PHX
            PHA
            PEA   $0000
            PEA   $0002
            JSL   L02C5AD
            CLC
            PLA
            ADC   $29
            PHA
            LDA   $03,S
            ADC   $2B
            STA   $03,S
            PLA
            PLX
            STA   $01
            STX   $03
            PLA
            STA   [$01]
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _HUnlock
            STAL  L02B111
            LDAL  L030023
            PHA
            LDAL  L030021
            PHA
            CLC
            PLA
            ADC   #$000A
            PHA
            LDA   $03,S
            ADC   #$0000
            STA   $03,S
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _SetHandleSize
            STAL  L02B111
            LDAL  L03002F
            PHA
            LDAL  L03002D
            PHA
            _HLock
            STAL  L02B111
            LDAL  L03002F
            TAX
            LDAL  L03002D
            STA   $01
            STX   $03
            LDY   #$0002
            LDA   [$01],Y
            PHA
            LDA   [$01]
            PHA
            LDA   $01,S
            STA   $0B
            LDA   $03,S
            STA   $0D
            PLA
            PLA
            LDA   #$000A
            LDX   #$0000
            TAY
            BPL   L02A241
            DEX
L02A241     PHX
            PHA
            PEA   $0000
            PEA   $0001
            JSL   L02C5AD
            CLC
            PLA
            ADC   $0B
            PHA
            LDA   $03,S
            ADC   $0D
            STA   $03,S
            LDA   $01,S
            STAL  L030027
            LDA   $03,S
            STAL  L030029
            PLA
            PLA
L02A266     LDAL  L030019
            AND   #$0004
            BNE   L02A272
            BRL   L02A307
L02A272     LDX   $05
            PHX
            TSX
            STX   $05
            LDAL  L03003B
            PHA
            LDAL  L030039
            PHA
            PEA   ^L02A317
            PEA   L02A317
            PEA   $0000
            TDC
            CLC
            ADC   #$0045
            PHA
            JSL   L02AA15
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            PEA   $0000
            PEA   $0009
            LDX   $05
            PHX
            TSX
            STX   $05
            PEA   $0000
            TDC
            CLC
            ADC   #$0045
            PHA
            JSL   L02A628
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            PHX
            PHA
            _SetLETextByID
            STAL  L02B111
            LDX   $05
            PHX
            TSX
            STX   $05
            JSL   L02AE36
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
            STAL  L03002B
            TAY
            BNE   L02A2F1
            BRL   L02A307
L02A2F1     LDX   $05
            PHX
            TSX
            STX   $05
            LDA   #$014C
            PHA
            JSL   L024DB6
            TAY
            LDA   $05
            TCS
            PLA
            STA   $05
            TYA
L02A307     LDA   $4E
            STA   $52
            LDA   $4D
            STA   $51
            PLD
            TSC
            CLC
            ADC   #$0050
            TCS
            RTL

L02A317     AND   $6C
            STZ   $00
L02A31B     TSC
            SEC
            SBC   #$0016
            TCS
            PHD
            TCD
            PHA
            PHA
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PEA   ^L024766
            PEA   L024766
            PEA   $0000
            PEA   $0000
            LDA   #$0002
            PHA
            PEA   $0000
            PEA   $0FF3
            LDA   #$800E
            PHA
            _NewWindow2
            STAL  L02B111
            PLA
            STA   $03
            PLA
            STA   $05
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L02AE36
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            STAL  L03002B
            TAX
            BNE   L02A378
            BRL   L02A38E
L02A378     LDX   $01
            PHX
            TSX
            STX   $01
            LDA   #$0320
            PHA
            JSL   L024DB6
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
L02A38E     PEI   $05
            PEI   $03
            _ShowWindow
            STAL  L02B111
            PEI   $05
            PEI   $03
            _SelectWindow
            STAL  L02B111
L02A3AC     PHA
            PHA
            PEA   ^L04008A
            PEA   L04008A
            PEA   $0000
            PEA   $0000
            PEA   $8000
            PEA   $0000
            PEA   $0000
            PEA   $0000
            LDA   #$0018
            PHA
            _DoModalWindow
            STAL  L02B111
            PLA
            PLX
            STA   $07
            LDA   $07
            LDX   #$0000
            CMP   #$002D
            BEQ   L02A3E4
            INX
L02A3E4     TXA
            CMP   #$0000
            BNE   L02A3ED
            BRL   L02A401
L02A3ED     LDA   $07
            LDX   #$0000
            CMP   #$002C
            BEQ   L02A3F8
            INX
L02A3F8     TXA
            CMP   #$0000
            BEQ   L02A401
            LDA   #$0001
L02A401     TAX
            BEQ   L02A407
            BRL   L02A3AC
L02A407     LDA   $07
            CMP   #$002D
            BEQ   L02A411
            BRL   L02A423
L02A411     PEI   $05
            PEI   $03
            _CloseWindow
            STAL  L02B111
            BRL   L02A4CE
L02A423     _WaitCursor
            STAL  L02B111
            PEI   $05
            PEI   $03
            PEA   $0000
            PEA   $002B
            PEA   $0000
            TDC
            CLC
            ADC   #$000F
            PHA
            _GetLETextByID
            STAL  L02B111
            LDX   $01
            PHX
            TSX
            STX   $01
            PEA   $0000
            TDC
            CLC
            ADC   #$0010
            PHA
            JSL   L02A60A
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            STX   $0D
            STA   $0B
            PEI   $05
            PEI   $03
            _CloseWindow
            STAL  L02B111
            LDAL  L030019
            AND   #$0008
            BNE   L02A486
            BRL   L02A4AD
L02A486     LDAL  L030003
            PHA
            LDAL  L030001
            PHA
            _BringToFront
            STAL  L02B111
            LDX   $01
            PHX
            TSX
            STX   $01
            JSL   L024766
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
L02A4AD     LDX   $01
            PHX
            TSX
            STX   $01
            PEI   $0D
            PEI   $0B
            JSL   L029889
            TAY
            LDA   $01
            TCS
            PLA
            STA   $01
            TYA
            _InitCursor
            STAL  L02B111
L02A4CE     PLD
            TSC
            CLC
            ADC   #$0016
            TCS
            RTL

L02A4D6     TSC
            PHD
            TCD
            LDA   $08
            STAL  L02A4EF
            LDA   $04
            STAL  L02A4F1
            LDA   $06
            STAL  L02A4F1+2
            JSL   GSOS
L02A4EF     DW    $0000
L02A4F1     ADRL  $00000000
            STAL  L02B111
            LDA   $02
            STA   $08
            LDA   $01
            STA   $07
            PLD
            TSC
            CLC
            ADC   #$0006
            TCS
            RTL

            DB    $00
L02A50A     DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $28
            DB    $28
            DB    $28
            DB    $28
            DB    $28
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $08
            DB    $B0
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $C1
            DB    $C1
            DB    $C1
            DB    $C1
            DB    $C1
            DB    $C1
            DB    $C1
            DB    $C1
            DB    $C1
            DB    $C1
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $C2
            DB    $C2
            DB    $C2
            DB    $C2
            DB    $C2
            DB    $C2
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $82
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $C4
            DB    $C4
            DB    $C4
            DB    $C4
            DB    $C4
            DB    $C4
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $84
            DB    $90
            DB    $90
            DB    $90
            DB    $90
            DB    $08
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02A60A     PEA   $000A
            PEA   $0000
            PEA   $0000
            LDA   $0C,S
            PHA
            LDA   $0C,S
            PHA
            JSL   L02AC65
            TAY
            LDA   $02,S
            STA   $06,S
            PLA
            STA   $03,S
            PLA
            TYA
            RTL

L02A628     TSC
            SEC
            SBC   #$0004
            TCS
            PHD
            TCD
            PHB
            PHK
            PLB
            SEP   #$30
            LDY   #$00
L02A637     LDA   [$08],Y
            STA   L02B3D1,Y
            BEQ   L02A642
            INY
            BNE   L02A637
            DEY
L02A642     STY   L02B3D0
            REP   #$30
            LDA   #L02B3D0
            STA   $01
            LDA   #^L02B3D0
            STA   $03
            PLB
            LDX   $03
            LDY   $01
            LDA   $06
            STA   $0A
            LDA   $05
            STA   $09
            PLD
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            RTL

L02A667     JSR   L02B032
            LDA   $04,S
            JMP   L02C95C

L02A66F     LDAL  L02AA93
            CMP   #L02AA97
            BNE   L02A6CC
            LDAL  L02AA93+2
            CMP   #^L02AA97
            BNE   L02A6CC
            LDAL  L02AAB3
            CMP   #$FFFF
            BNE   L02A6CC
            LDAL  L02AAAF
            AND   #$0080
            BNE   L02A6AA
            LDAL  L02AAAF
            AND   #$00FF
            TAX
            LDAL  L02AAAF
            XBA
            ORA   #$FF00
            STAL  L02AAAF
            TXA
            BRA   L02A6C3
L02A6AA     JSL   L02C0BB
            TAX
            BNE   L02A6C3
            LDA   #$0080
            ORAL  L02AAB1
            STAL  L02AAB1
            JSL   L02C0BB
            LDA   #$FFFF
L02A6C3     CMP   #$000D
            BNE   L02A6CB
            LDA   #$000A
L02A6CB     RTL

L02A6CC     LDAL  L02AA93+2
            PHA
            LDAL  L02AA93
            PHA
            JSL   L02B4D2
            RTL

L02A6DB     TSC
            PHD
            TCD
            LDA   $06
            PHA
            LDA   $04
            PHA
            LDA   $0C
            LSR
            BCC   L02A6FF
            SEP   #$20
            LDA   [$08]
            STA   [$04]
            REP   #$20
            DEC   $0C
            INC   $04
            BNE   L02A6F9
            INC   $06
L02A6F9     INC   $08
            BNE   L02A6FF
            INC   $0A
L02A6FF     LDX   $0E
            BEQ   L02A715
            LDY   #$0000
L02A706     LDA   [$08],Y
            STA   [$04],Y
            DEY
            DEY
            BNE   L02A706
            INC   $0A
            INC   $06
            DEX
            BNE   L02A706
L02A715     LDY   $0C
            BEQ   L02A729
            DEY
            DEY
            BEQ   L02A725
L02A71D     LDA   [$08],Y
            STA   [$04],Y
            DEY
            DEY
            BNE   L02A71D
L02A725     LDA   [$08]
            STA   [$04]
L02A729     PLY
            PLX
            LDA   $01
            STA   $0D
            LDA   $02
            STA   $0E
            PLD
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            RTL

L02A73C     TSC
            SEC
            SBC   #$0004
            TCS
            PHD
            TCD
            PHB
            PHK
            PLB
            SEP   #$30
            LDA   [$08]
            TAY
            LDA   #$00
            STA   L02B3D0,Y
            TYX
            BEQ   L02A75C
L02A754     LDA   [$08],Y
            STA   L02B3CF,Y
            DEY
            BNE   L02A754
L02A75C     REP   #$30
            LDA   #L02B3D0
            STA   $01
            LDA   #^L02B3D0
            STA   $03
            PLB
            LDX   $03
            LDY   $01
            LDA   $06
            STA   $0A
            LDA   $05
            STA   $09
            PLD
            TSC
            CLC
            ADC   #$0008
            TCS
            TYA
            RTL

L02A77E     LDA   #L02A7C0
            STAL  L02B33A+1
            LDA   #>L02A7C0
            STAL  L02B33A+2
            TSC
            CLC
            ADC   #$0008
            STAL  L02A7BE
            PEA   $0000
            PHA
            JSL   L02B1A5
            SEC
            PLA
            SBCL  L02A7BE
            CLC
            ADC   #$0004
            STAL  L02A7BE
            PLA
            PHB
            PLX
            PLY
            TSC
            CLC
            ADCL  L02A7BE
            TCS
            PHY
            PHX
            PLB
            LDAL  L02B356
            RTL

L02A7BE     DW    $0000
L02A7C0     LDAL  L02AACF
            CMP   #L02AAD3
            BNE   L02A7F2
            LDAL  L02AACF+1
            CMP   #>L02AAD3
            BNE   L02A7F2
            LDAL  L02AAEF
            CMP   #$FFFE
            BNE   L02A7F2
            PHP
            PLX
            PLY
            PLA
            PHY
            PHX
            PLP
            PHA
            CMP   #$000A
            BNE   L02A7EB
            LDA   #$000D
L02A7EB     PHA
            JSL   L02C07B
            PLA
            RTL

L02A7F2     LDAL  L02AACF+2
            PHA
            LDAL  L02AACF
            PHA
            LDA   $08,S
            PHA
            JSL   $000000
            PHB
            PLX
            PLY
            PLA
            PHY
            PHX
            PLB
            RTL

L02A80B     TSC
            SEC
            SBC   #$0002
            TCS
            PHD
            TCD
            STZ   $01
L02A815     LDA   [$06]
            AND   #$00FF
            BEQ   L02A829
            PHA
            JSL   L02A7C0
            INC   $06
            BNE   L02A827
            INC   $08
L02A827     BRA   L02A815
L02A829     PEA   $000A
            JSL   L02A7C0
            LDY   $01
            LDA   $04
            STA   $08
            LDA   $03
            STA   $07
            PLD
            TSC
            CLC
            ADC   #$0006
            TCS
            TYA
            RTL

L02A843     TSC
            PHD
            TCD
            PHB
            PHK
            PLB
            LDA   $08
            BNE   L02A84F
            DEC   $0A
L02A84F     DEC   $08
            LDA   $0A
            PHA
            LDA   $08
            PHA
            LDA   $0E
            PHA
            LDA   $0C
            PHA
            JSL   L02C5AD
            PLA
            STA   $08
            PLA
            STA   $0A
            CLC
            LDA   $08
            ADC   $04
            STA   $08
            LDA   $0A
            ADC   $06
            STA   $0A
            LDA   $0E
            STA   L02AA13
            LDA   $0C
            STA   L02AA11
            LDA   $10
            STA   L02A906+1
            STA   L02A934+1
            LDA   $11
            STA   L02A906+2
            STA   L02A934+2
            LDA   $0A
            PHA
            LDA   $08
            PHA
            LDA   $06
            PHA
            LDA   $04
            PHA
            JSL   L02A8AF
            PLB
            LDA   $02
            STA   $12
            LDA   $01
            STA   $11
            PLD
            TSC
            CLC
            ADC   #$0010
            TCS
            RTL

L02A8AF     TSC
            SEC
            SBC   #$0008
            TCS
            PHD
            TCD
            PHB
            PHK
            PLB
L02A8BA     LDA   $12
            CMP   $0E
            BNE   L02A8C4
            LDA   $10
            CMP   $0C
L02A8C4     BEQ   L02A8C8
            BCS   L02A8D9
L02A8C8     PLB
            LDA   $0A
            STA   $12
            LDA   $09
            STA   $11
            PLD
            TSC
            CLC
            ADC   #$0010
            TCS
            RTL

L02A8D9     LDA   $12
            STA   $07
            LDA   $10
            STA   $05
            LDA   $0E
            STA   $03
            LDA   $0C
            STA   $01
            BRA   L02A8FA
L02A8EB     CLC
            LDA   $01
            ADC   L02AA11
            STA   $01
            LDA   $03
            ADC   L02AA13
            STA   $03
L02A8FA     LDA   $12
            PHA
            LDA   $10
            PHA
            LDA   $03
            PHA
            LDA   $01
            PHA
L02A906     JSL   L02A906
            TAX
            BMI   L02A8EB
L02A90D     LDA   $05
            CMP   $0C
            BNE   L02A919
            LDA   $07
            CMP   $0E
            BEQ   L02A93B
L02A919     SEC
            LDA   $05
            SBC   L02AA11
            STA   $05
            LDA   $07
            SBC   L02AA13
            STA   $07
            LDA   $12
            PHA
            LDA   $10
            PHA
            LDA   $07
            PHA
            LDA   $05
            PHA
L02A934     JSL   L02A934
            DEC
            BPL   L02A90D
L02A93B     LDA   $03
            PHA
            LDA   $01
            PHA
            LDA   $07
            PHA
            LDA   $05
            PHA
            JSR   L02A9A5
            LDA   $03
            CMP   $07
            BNE   L02A954
            LDA   $01
            CMP   $05
L02A954     BCC   L02A8EB
            LDA   $07
            PHA
            LDA   $05
            PHA
            LDA   $03
            PHA
            LDA   $01
            PHA
            JSR   L02A9A5
            LDA   $03
            PHA
            LDA   $01
            PHA
            LDA   $12
            PHA
            LDA   $10
            PHA
            JSR   L02A9A5
            SEC
            LDA   $01
            SBC   L02AA11
            STA   $05
            LDA   $03
            SBC   L02AA13
            STA   $07
            LDA   $07
            PHA
            LDA   $05
            PHA
            LDA   $0E
            PHA
            LDA   $0C
            PHA
            JSL   L02A8AF
            CLC
            LDA   $01
            ADC   L02AA11
            STA   $0C
            LDA   $03
            ADC   L02AA13
            STA   $0E
            BRL   L02A8BA
L02A9A5     TSC
            PHD
            TCD
            LDX   L02AA13
            BEQ   L02A9C5
            LDY   #$0000
L02A9B0     LDA   [$03],Y
            TAX
            LDA   [$07],Y
            STA   [$03],Y
            TXA
            STA   [$07],Y
            DEY
            DEY
            BNE   L02A9B0
            INC   $05
            INC   $09
            DEX
            BNE   L02A9B0
L02A9C5     LDA   L02AA11
            LSR
            BCC   L02A9E9
            SEP   #$20
            LDA   [$03]
            TAX
            LDA   [$07]
            STA   [$03]
            TXA
            STA   [$07]
            REP   #$20
            INC   $03
            BNE   L02A9DF
            INC   $05
L02A9DF     INC   $07
            BNE   L02A9E5
            INC   $09
L02A9E5     LDA   L02AA11
            LSR
L02A9E9     ASL
            BEQ   L02AA07
            TAY
            BRA   L02A9F9
L02A9EF     LDA   [$03],Y
            TAX
            LDA   [$07],Y
            STA   [$03],Y
            TXA
            STA   [$07],Y
L02A9F9     DEY
            DEY
            BNE   L02A9EF
            LDA   [$03]
            TAX
            LDA   [$07]
            STA   [$03]
            TXA
            STA   [$07]
L02AA07     PLD
            PLX
            TSC
            CLC
            ADC   #$0008
            TCS
            PHX
            RTS

L02AA11     DW    $0000
L02AA13     DW    $0000
L02AA15     PHB
            PHK
            PLB
            PLX
            PLY
            PLA
            STA   L02AA8F
            PLA
            STA   L02AA91
            PHY
            PHX
            PLB
            LDA   #L02AA65
            STAL  L02B33A+1
            LDA   #>L02AA65
            STAL  L02B33A+2
            TSC
            CLC
            ADC   #$0008
            STAL  L02AA8D
            PEA   $0000
            PHA
            JSL   L02B1A5
            SEC
            PLA
            SBCL  L02AA8D
            CLC
            ADC   #$0004
            STAL  L02AA8D
            PLA
            PHB
            PLX
            PLY
            TSC
            CLC
            ADCL  L02AA8D
            TCS
            PHY
            PHX
            PLB
            LDAL  L02B356
            RTL

L02AA65     PHB
            PLX
            PLA
            PLY
            PHA
            PHX
            PLB
            LDX   L02AA91
            PHX
            LDX   L02AA8F
            PHX
            PHD
            TSC
            TCD
            TYA
            AND   #$00FF
            STA   [$03]
            PLD
            PLA
            PLA
            PHB
            PHK
            PLB
            INC   L02AA8F
            BNE   L02AA8B
            INC   L02AA91
L02AA8B     PLB
            RTL

L02AA8D     DB    $00
            DB    $00
L02AA8F     DB    $00
            DB    $00
L02AA91     DB    $00
            DB    $00
L02AA93     ADRL  L02AA97
L02AA97     ADRL  L02AAD3
L02AA9B     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02AAAF     DB    $FF
            DB    $FF
L02AAB1     DB    $0A
            DB    $02
L02AAB3     DB    $FF
            DB    $FF
L02AAB5     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $FF
            DB    $FF
            DB    $0A
            DB    $02
            DB    $FF
            DB    $FF
L02AACF     ADRL  L02AAD3
L02AAD3     ADRL  L02B6C4
L02AAD7     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $FF
            DB    $FF
            DB    $12
            DB    $02
L02AAEF     DB    $FE
            DB    $FF
L02AAF1     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $FF
            DB    $FF
            DB    $12
            DB    $02
            DB    $FE
            DB    $FF
L02AB0B     LDA   $06,S
            PHA
            LDA   $06,S
            PHA
            TSC
            PHD
            TCD
            LDY   #$0000
            SEP   #$20
L02AB19     LDA   [$08],Y
            BEQ   L02AB24
            INY
            BNE   L02AB19
            INC   $0A
            BRA   L02AB19
L02AB24     REP   #$20
            TYA
            CLC
            ADC   $08
            STA   $08
            SEP   #$20
            LDY   #$0000
L02AB31     LDA   [$0C],Y
            STA   [$08],Y
            BEQ   L02AB40
            INY
            BNE   L02AB31
            INC   $0A
            INC   $0E
            BRA   L02AB31
L02AB40     REP   #$20
            LDA   $05
            STA   $0D
            LDA   $06
            STA   $0E
            LDX   $03
            LDY   $01
            PLD
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            RTL

L02AB57     LDA   $06,S
            PHA
            LDA   $06,S
            PHA
            TSC
            PHD
            TCD
            SEP   #$20
            LDY   #$0000
L02AB65     LDA   [$0C],Y
            STA   [$08],Y
            BEQ   L02AB74
            INY
            BNE   L02AB65
            INC   $0A
            INC   $0E
            BRA   L02AB65
L02AB74     REP   #$20
            LDA   $05
            STA   $0D
            LDA   $06
            STA   $0E
            LDX   $03
            LDY   $01
            PLD
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            RTL

L02AB8B     TSC
            PHD
            TCD
            LDY   #$0000
            LDX   #$0000
            SEP   #$20
L02AB96     LDA   [$04],Y
            BEQ   L02ABA2
            INY
            BNE   L02AB96
            INX
            INC   $06
            BRA   L02AB96
L02ABA2     REP   #$20
            PLD
            LDA   $02,S
            STA   $06,S
            PLA
            STA   $03,S
            PLA
            TYA
            RTL

L02ABAF     TSC
            SEC
            SBC   #$0002
            TCS
            PHD
            TCD
            LDY   #$0000
            LDX   $10
            BMI   L02ABEE
            BNE   L02ABC4
            LDX   $0E
            BEQ   L02ABEE
L02ABC4     LDX   $0E
            SEP   #$20
L02ABC8     LDA   [$06],Y
            BEQ   L02ABE2
            CMP   [$0A],Y
            BNE   L02ABF3
            DEX
            BNE   L02ABD9
            LDA   $10
            BEQ   L02ABEE
            DEC   $10
L02ABD9     INY
            BNE   L02ABC8
            INC   $08
            INC   $0C
            BRA   L02ABC8
L02ABE2     LDX   #$0000
            LDA   [$0A],Y
            BEQ   L02ABF8
L02ABE9     LDX   #$FFFF
            BRA   L02ABF8
L02ABEE     LDX   #$0000
            BRA   L02ABF8
L02ABF3     BCC   L02ABE9
            LDX   #$0001
L02ABF8     STX   $01
            REP   #$20
            LDY   $01
            LDA   $04
            STA   $10
            LDA   $03
            STA   $0F
            PLD
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            RTL

L02AC0F     TSC
            SEC
            SBC   #$0004
            TCS
            PHD
            TCD
            LDA   $0A
            STA   $03
            LDA   $08
            STA   $01
            SEP   #$20
            LDY   #$0000
            LDX   $12
            BMI   L02AC4E
            BNE   L02AC2E
            LDX   $10
            BEQ   L02AC4E
L02AC2E     LDX   $10
L02AC30     LDA   [$0C],Y
            STA   [$08],Y
            BEQ   L02AC4B
            DEX
            BNE   L02AC3F
            LDA   $12
            BEQ   L02AC4E
            DEC   $12
L02AC3F     INY
            BNE   L02AC30
            INC   $0A
            INC   $0E
            BRA   L02AC30
L02AC48     INY
            STA   [$08],Y
L02AC4B     DEX
            BNE   L02AC48
L02AC4E     REP   #$20
            LDX   $03
            LDY   $01
            LDA   $06
            STA   $12
            LDA   $05
            STA   $11
            PLD
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            RTL

L02AC65     PEA   $0000
            PEA   $0000
            PEA   $0000
            TSC
            PHD
            TCD
            LDA   $0E
            ORA   $10
            BEQ   L02AC82
            LDA   $0A
            STA   [$0E]
            LDY   #$0002
            LDA   $0C
            STA   [$0E],Y
L02AC82     LDA   [$0A]
            AND   #$00FF
            TAX
            LDAL  L02A50A,X
            AND   #$0020
            BEQ   L02AC99
            INC   $0A
            BNE   L02AC97
            INC   $0C
L02AC97     BRA   L02AC82
L02AC99     LDA   [$0A]
            AND   #$00FF
            CMP   #$002D
            BNE   L02ACA7
            INC   $01
            BRA   L02ACAC
L02ACA7     CMP   #$002B
            BNE   L02ACB2
L02ACAC     INC   $0A
            BNE   L02ACB2
            INC   $0C
L02ACB2     LDA   $0C
            PHA
            LDA   $0A
            PHA
            LDA   $12
            PHA
            LDA   $10
            PHA
            LDA   $0E
            PHA
            LDA   $0C
            PHA
            LDA   $0A
            PHA
            JSL   L02AD14
            STX   $05
            STA   $03
            TXY
            BPL   L02ACEA
            LDA   #$0002
            STAL  L02B10B
            LDA   $0E
            ORA   $10
            BNE   L02ACEA
            LDA   $01,S
            STA   [$0E]
            LDY   #$0002
            LDA   $03,S
            STA   [$0E],Y
L02ACEA     PLA
            PLA
            LDA   $01
            BEQ   L02ACFF
            SEC
            LDA   #$0000
            SBC   $03
            STA   $03
            LDA   #$0000
            SBC   $05
            STA   $05
L02ACFF     LDX   $05
            LDY   $03
            LDA   $07
            STA   $11
            LDA   $08
            STA   $12
            PLD
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            RTL

L02AD14     PEA   $0000
            PEA   $0000
            PEA   $0000
            TSC
            PHD
            TCD
            LDA   $0E
            ORA   $10
            BEQ   L02AD31
            LDA   $0A
            STA   [$0E]
            LDY   #$0002
            LDA   $0C
            STA   [$0E],Y
L02AD31     LDA   [$0A]
            AND   #$00FF
            TAX
            LDAL  L02A50A,X
            AND   #$0020
            BEQ   L02AD48
            INC   $0A
            BNE   L02AD46
            INC   $0C
L02AD46     BRA   L02AD31
L02AD48     LDA   [$0A]
            AND   #$00FF
            CMP   #$002B
            BNE   L02AD58
            INC   $0A
            BNE   L02AD58
            INC   $0C
L02AD58     LDA   $12
            BNE   L02AD7F
            LDA   #$000A
            STA   $12
            LDA   [$0A]
            AND   #$00FF
            CMP   #$0030
            BNE   L02AD7F
            LDA   #$0008
            STA   $12
            LDY   #$0001
            LDA   [$0A],Y
            AND   #$005F
            CMP   #$0058
            BNE   L02AD7F
            ASL   $12
L02AD7F     LDA   [$0A]
            AND   #$5F7F
            CMP   #$5830
            BNE   L02AD9C
            CLC
            LDA   $0A
            ADC   #$0002
            STA   $0A
            BCC   L02AD95
            INC   $0C
L02AD95     LDA   $12
            CMP   #$0010
            BNE   L02AE07
L02AD9C     LDA   [$0A]
            AND   #$00FF
            CMP   #$0030
            BCC   L02AE03
            CMP   #$003A
            BCC   L02ADBD
            AND   #$005F
            CMP   #$0041
            BCC   L02AE03
            CMP   #$005B
            BCS   L02AE03
            SBC   #$0036
            BRA   L02ADC0
L02ADBD     AND   #$000F
L02ADC0     CMP   $12
            BCS   L02AE03
            LDX   #$0001
            STX   $01
            PHA
            PHA
            PHA
            PHA
            PHA
            LDA   $05
            PHA
            LDA   $03
            PHA
            PEA   $0000
            LDA   $12
            PHA
            _LongMul
            PLA
            STA   $03
            PLA
            STA   $05
            PLA
            ORA   $01,S
            PLX
            PLY
            TAX
            BNE   L02AE07
            CLC
            TYA
            ADC   $03
            STA   $03
            BCC   L02ADFB
            INC   $05
            BEQ   L02AE07
L02ADFB     INC   $0A
            BNE   L02AE01
            INC   $0C
L02AE01     BRA   L02AD9C
L02AE03     LDA   $01
            BNE   L02AE10
L02AE07     LDA   #$0002
            STAL  L02B10B
            BRA   L02AE21
L02AE10     LDA   $0E
            ORA   $10
            BEQ   L02AE21
            LDA   $0A
            STA   [$0E]
            LDY   #$0002
            LDA   $0C
            STA   [$0E],Y
L02AE21     LDX   $05
            LDY   $03
            LDA   $07
            STA   $11
            LDA   $08
            STA   $12
            PLD
            TSC
            CLC
            ADC   #$0010
            TCS
            TYA
            RTL

L02AE36     LDAL  L02B111
            RTL

L02AE3B     LDA   $04,S
            TAX
            LDA   $02,S
            STA   $04,S
            PLA
            STA   $01,S
            LDAL  L02A50A,X
            AND   #$0004
            BEQ   L02AE53
            TXA
            AND   #$005F
            RTL

L02AE53     TXA
            RTL

L02AE55     LDAL  L02B10D
            RTL

L02AE5A     PHB
            PHD
            TSC
            TCD
            SEC
            LDY   #$0004
            LDA   [$07]
            SBC   [$07],Y
            STAL  L02AE91
            CLC
            ADC   $01
            STA   $01
            LDA   [$07],Y
            TAX
            DEX
            LDA   [$07]
            TAY
            DEY
            SEC
            TSC
            SBC   [$07]
            EOR   #$FFFF
            MVP   $000000,$000000
            CLC
            TSC
            ADCL  L02AE91
            TCS
            PLD
            PLX
            PLY
            PLA
            PLA
            PHY
            PHX
            PLB
            RTL

L02AE91     BRK   $00
L02AE93     PHA
            JSR   L02B032
            PLA
            JMPL  L02C95C

L02AE9C     PHB
            PHK
            PLB
            PLX
            PLY
            PEA   $0000
            PEA   $0000
            PEA   $0000
            PHY
            PHX
            LDA   L02C28D
            PHA
            LDA   L02C28B
            PHA
            TSC
            PHD
            TCD
            STZ   L02B089
            STZ   L02B08B
            JSL   L02B08D
            LDA   $01
            ORA   $03
            BNE   L02AECA
            BRL   L02B027
L02AECA     CLC
            LDA   $01
            ADC   #$0008
            STA   $01
            BCC   L02AED6
            INC   $03
L02AED6     LDX   #$0000
            TXY
            SEP   #$20
L02AEDC     LDA   [$01],Y
            BEQ   L02AF03
            CMP   #$20
            BEQ   L02AEEC
            CMP   #$22
            BEQ   L02AEEC
            CMP   #$09
            BNE   L02AEEF
L02AEEC     INY
            BRA   L02AEDC
L02AEEF     INX
L02AEF0     LDA   [$01],Y
            BEQ   L02AF03
            CMP   #$20
            BEQ   L02AEDC
            CMP   #$22
            BEQ   L02AEDC
            CMP   #$09
            BEQ   L02AEDC
            INY
            BRA   L02AEF0
L02AF03     REP   #$20
            TXA
            INC
            ASL
            ASL
            STA   L02B030
            PHY
            SEC
            ADC   $01,S
            PLY
            PHA
            PHA
            PEA   $0000
            PHA
            LDAL  L02B10D
            PHA
            PEA   $C008
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCC   L02AF58
L02AF2E     BRA   L02AF3E

L02AF30     STR   'Out of memory'

L02AF3E     PEA   ^L02AF30
	PEA   L02AF30-1
            PEA   $0000
            PEA   $0001
            PEA   $0001
            JSL   L02C8DC
            LDA   #$FFFF
            JMPL  L02C95C

L02AF58     PLA
            STA   $0B
            PLA
            STA   $0D
            LDY   #$0002
            LDA   [$0B],Y
            TAX
            LDA   [$0B]
            STA   L02B02C
            STX   L02B02E
            CLC
            ADC   L02B030
            BCC   L02AF73
            INX
L02AF73     STA   $0B
            STX   $0D
            SEP   #$20
            LDY   #$0000
L02AF7C     LDA   [$01],Y
            STA   [$0B],Y
            BEQ   L02AF85
            INY
            BRA   L02AF7C
L02AF85     REP   #$20
            LDA   $0D
            STA   $03
            LDA   $0B
            STA   $01
            LDA   L02B02E
            STA   $0D
            LDA   L02B02C
            STA   $0B
L02AF99     LDA   [$01]
            AND   #$00FF
            BEQ   L02B013
            CMP   #$0020
            BEQ   L02AFAA
            CMP   #$0009
            BNE   L02AFB2
L02AFAA     INC   $01
            BNE   L02AFB0
            INC   $03
L02AFB0     BRA   L02AF99
L02AFB2     TAX
            CMP   #$0022
            BNE   L02AFBE
            INC   $01
            BNE   L02AFBE
            INC   $03
L02AFBE     LDY   #$0002
            LDA   $01
            STA   [$0B]
            LDA   $03
            STA   [$0B],Y
            CLC
            LDA   $0B
            ADC   #$0004
            STA   $0B
            BCC   L02AFD5
            INC   $0D
L02AFD5     INC   $09
            CPX   #$0022
            BNE   L02AFF0
L02AFDC     LDA   [$01]
            AND   #$00FF
            BEQ   L02B013
            CMP   #$0022
            BEQ   L02B009
            INC   $01
            BNE   L02AFEE
            INC   $03
L02AFEE     BRA   L02AFDC
L02AFF0     LDA   [$01]
            AND   #$00FF
            BEQ   L02B013
            CMP   #$0020
            BEQ   L02B009
            CMP   #$0009
            BEQ   L02B009
            INC   $01
            BNE   L02B007
            INC   $03
L02B007     BRA   L02AFF0
L02B009     SEP   #$20
            LDA   #$00
            STA   [$01]
            REP   #$20
            BRA   L02AFAA
L02B013     LDA   #$0000
            STA   [$0B]
            LDY   #$0002
            STA   [$0B],Y
            LDA   L02B02E
            STA   $0D
            LDA   L02B02C
            STA   $0B
L02B027     PLD
            PLA
            PLA
            PLB
            RTL

L02B02C     DW    $0000
L02B02E     DW    $0000
L02B030     DW    $0000
L02B032     PHB
            PHK
            PLB
            LDA   L02B08B
            PHA
            LDA   L02B089
            PHA
            PHD
            TSC
            TCD
L02B040     LDA   $03
            ORA   $05
            BEQ   L02B06A
            PEA   >L02B05B
            PEA   L02B05B*$100
            PHB
            PLA
            LDY   #$0005
            LDA   [$03],Y
            PHA
            DEY
            DEY
            LDA   [$03],Y
            PHA
            PHB
            PLA
L02B05B     RTL

            LDY   #$0002
            LDA   [$03],Y
            TAX
            LDA   [$03]
            STA   $03
            STX   $05
            BRA   L02B040
L02B06A     LDAL  L02B6C6
            ORAL  L02B6C4
            BEQ   L02B084
            LDAL  L02B6C6
            PHA
            LDAL  L02B6C4
            PHA
            JSL   $000000
            BRA   L02B06A
L02B084     PLD
            PLA
            PLA
            PLB
            RTS

L02B089     DW    $0000
L02B08B     DW    $0000
L02B08D     LDX   #$0018
L02B090     LDA   L02B6E2,X
            STA   L02B6C8,X
            LDA   L02AAB5,X
            STA   L02AA9B,X
            LDA   L02AAF1,X
            STA   L02AAD7,X
            DEX
            DEX
            BPL   L02B090
            LDA   #L02B6C4
            STA   L02B6C0
            LDA   #^L02B6C4
            STA   L02B6C0+2
            LDA   #L02AA97
            STA   L02AA93
            LDA   #^L02AA97
            STA   L02AA93+2
            LDA   #L02AAD3
            STA   L02AACF
            LDA   #^L02AAD3
            STA   L02AACF+2
            RTL

L02B0CB     TSC
            PHD
            TCD
            LDA   $06
            BPL   L02B0ED
            CMP   #$FFFF
            BNE   L02B0E7
            LDX   $04
            CPX   #$FFDE
            BCC   L02B0E7
L02B0DE     ASL   $08
            ROL   $0A
            INX
            BNE   L02B0DE
            BRA   L02B0FF
L02B0E7     STZ   $08
            STZ   $0A
            BRA   L02B0FF
L02B0ED     BNE   L02B0E7
            LDX   $04
            BEQ   L02B0FF
            CPX   #$0021
            BCS   L02B0E7
L02B0F8     LSR   $0A
            ROR   $08
            DEX
            BNE   L02B0F8
L02B0FF     LDA   $00
            STA   $04
            LDA   $02
            STA   $06
            PLD
            PLA
            PLA
            RTL

L02B10B     DW    $0000
L02B10D     DW    $0000
            DW    $0006
L02B111     DW    $0000
L02B113     TAY
            PEA   $0000
            PEA   $0000
            LDA   $0A,S
            PHA
            LDA   $0A,S
            PHA
            TSC
            PHD
            TCD
            STY   $0C
            STX   $0E
            TYA
            ORA   $0E
            BEQ   L02B178
            LDA   $0E
            ORA   $03
            BEQ   L02B154
            LDY   #$0020
L02B135     ASL   $01
            ROL   $03
            ROL   $05
            ROL   $07
            SEC
            LDA   $05
            SBC   $0C
            TAX
            LDA   $07
            SBC   $0E
            BCC   L02B14F
            STX   $05
            STA   $07
            INC   $01
L02B14F     DEY
            BNE   L02B135
            BRA   L02B170
L02B154     LDA   #$0000
            LDY   #$0010
L02B15A     ASL   $01
            ROL
            SEC
            SBC   $0C
            BCS   L02B169
            ADC   $0C
            DEY
            BNE   L02B15A
            BRA   L02B16E
L02B169     INC   $01
            DEY
            BNE   L02B15A
L02B16E     STA   $05
L02B170     LDA   $03
            STA   $0E
            LDA   $01
            STA   $0C
L02B178     PLD
            TSC
            CLC
            ADC   #$0008
            TCS
            RTL

L02B180     TSC
            PHD
            TCD
            LDA   #$0000
            STA   [$06]
            LDX   $06
            TXY
            INY
            LDA   $04
            DEC
            DEC
            PHB
            MVN   $000000,$000000
            PLB
            LDA   $02
            STA   $08
            LDA   $01
            STA   $07
            PLD
            TSC
            CLC
            ADC   #$0006
            TCS
            RTL

L02B1A5     PHB
            PHK
            PLB
            PHD
            TSC
            TCD
L02B1AB     STZ   L02B356
L02B1AE     LDA   [$0E]
            AND   #$00FF
            BEQ   L02B1C7
            CMP   #$0025
            BEQ   L02B1D2
            PHA
            JSL   L02B337
            INC   $0E
            BNE   L02B1C5
            INC   $10
L02B1C5     BRA   L02B1AE
L02B1C7     LDA   $0C
            STA   $10
            LDA   $0B
            STA   $0F
            PLD
            PLB
            RTL

L02B1D2     INC   $0E
            BNE   L02B1D8
            INC   $10
L02B1D8     STZ   L02B34E
            STZ   L02B340
            STZ   L02B34A
            STZ   L02B34C
            STZ   L02B344
            LDA   #$0020
            STA   L02B348
            STZ   L02B346
            STZ   L02B350
            STZ   L02B33E
L02B1F6     JSR   L02B25D
            BCS   L02B1F6
            JSR   L02B2A5
            STA   L02B340
            LDA   [$0E]
            AND   #$00FF
            CMP   #$002E
            BNE   L02B21F
            INC   $0E
            BNE   L02B211
            INC   $10
L02B211     INC   L02B34C
            JSR   L02B2A5
            STA   L02B34A
            LDA   [$0E]
            AND   #$00FF
L02B21F     CMP   #$006C
            BNE   L02B229
            INC   L02B344
            BRA   L02B233
L02B229     CMP   #$004C
            BEQ   L02B233
            CMP   #$0068
            BNE   L02B23E
L02B233     INC   $0E
            BNE   L02B239
            INC   $10
L02B239     LDA   [$0E]
            AND   #$00FF
L02B23E     INC   $0E
            BNE   L02B244
            INC   $10
L02B244     LDX   #$0040
L02B247     CMP   L02B2F3,X
            BEQ   L02B255
            DEX
            DEX
            DEX
            DEX
            BPL   L02B247
            BRL   L02B1AE
L02B255     PEA   L02B1AB+2
            INX
            INX
            JMP   (L02B2F3,X)

L02B25D     LDA   [$0E]
            AND   #$00FF
            CMP   #$002D
            BNE   L02B26F
            LDA   #$0001
            STA   L02B346
            BRA   L02B29B
L02B26F     CMP   #$0030
            BNE   L02B279
            STA   L02B348
            BRA   L02B29B
L02B279     CMP   #$002B
            BEQ   L02B28B
            CMP   #$0020
            BNE   L02B290
            LDX   L02B350
            CPX   #$002B
            BEQ   L02B29B
L02B28B     STA   L02B350
            BRA   L02B29B
L02B290     CMP   #$0023
            BNE   L02B2A3
            LDA   #$0001
            STA   L02B33E
L02B29B     INC   $0E
            BNE   L02B2A1
            INC   $10
L02B2A1     SEC
            RTS

L02B2A3     CLC
            RTS

L02B2A5     STZ   L02B2F1
            LDA   [$0E]
            AND   #$00FF
            CMP   #$002A
            BNE   L02B2C5
            INC   $0E
            BNE   L02B2B8
            INC   $10
L02B2B8     LDA   [$07]
            STA   L02B2F1
            INC   $07
            INC   $07
L02B2C1     LDA   L02B2F1
            RTS

L02B2C5     LDA   [$0E]
            AND   #$00FF
            CMP   #$0030
            BCC   L02B2C1
            CMP   #$003A
            BCS   L02B2C1
            AND   #$000F
            PHA
            ASL   L02B2F1
            LDA   L02B2F1
            ASL
            ASL
            ADC   L02B2F1
            ADC   $01,S
            PLX
            STA   L02B2F1
            INC   $0E
            BNE   L02B2EF
            INC   $10
L02B2EF     BRA   L02B2C5
L02B2F1     DA    $0000
L02B2F3     DA    $0025
            DA    L02B6FC
            DA    $006E
            DA    L02B99E
            DA    $0073
            DA    L02B79C
            DA    $0062
            DA    L02B7BD
            DA    $0070
            DA    L02B714
            DA    $0063
            DA    L02B81E
            DA    $0058
            DA    L02B71A
            DA    $0078
            DA    L02B70C
            DA    $006F
            DA    L02B9CD
            DA    $0075
            DA    L02B85F
            DA    $0064
            DA    L02B832
            DA    $0069
            DA    L02B832
            DA    $0066
            DA    L02BCBB
            DA    $0065
            DA    L02BCA8
            DA    $0045
            DA    L02BCAD
            DA    $0067
            DA    L02BE7E
            DA    $0047
            DA    L02BE83
L02B337     INC   L02B356
L02B33A     JMPL  $000000

L02B33E     DB    $00
            DB    $00
L02B340     DB    $00
            DB    $00
L02B342     DB    $00
L02B343     DB    $00
L02B344     DB    $00
            DB    $00
L02B346     DB    $00
            DB    $00
L02B348     DB    $00
            DB    $00
L02B34A     DB    $00
            DB    $00
L02B34C     DB    $00
            DB    $00
L02B34E     DB    $00
            DB    $00
L02B350     DB    $00
            DB    $00
L02B352     DB    $00
L02B353     DB    $00
L02B354     DB    $00
L02B355     DB    $00
L02B356     DB    $00
            DB    $00
L02B358     DB    $00
L02B359     DB    $00
L02B35A     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02B3A9     DB    $00
            DB    $00
L02B3AB     DB    $00
            DB    $00
L02B3AD     DB    $00
            DB    $00
L02B3AF     DB    $00
            DB    $00
L02B3B1     DB    $00
            DB    $00
L02B3B3     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02B3CF     DB    $00
L02B3D0     DB    $00
L02B3D1     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02B4D2     TSC
            SEC
            SBC   #$0006
            TCS
            PHD
            TCD
            PHB
            PHK
            PLB
            LDA   $0C
            PHA
            LDA   $0A
            PHA
            JSL   L02BA5F
            BCS   L02B4F3
            LDY   #$001A
            LDA   [$0A],Y
            AND   #$0180
            BEQ   L02B4FB
L02B4F3     LDA   #$FFFF
            STA   $01
            BRL   L02B684
L02B4FB     LDY   #$0018
            LDA   [$0A],Y
            AND   #$0080
            BNE   L02B517
            LDA   [$0A],Y
            AND   #$00FF
            STA   $01
            LDA   [$0A],Y
            XBA
            ORA   #$FF00
            STA   [$0A],Y
            BRL   L02B684
L02B517     LDY   #$001C
            LDA   [$0A],Y
            BPL   L02B552
            CMP   #$FFFF
            BNE   L02B541
            JSL   L02C0BB
            TAX
            BNE   L02B53C
            LDA   #$0080
            ORAL  L02AAB1
            STAL  L02AAB1
            JSL   L02C0BB
            LDA   #$FFFF
L02B53C     STA   $01
            BRL   L02B684
L02B541     LDA   $0C
            PHA
            LDA   $0A
            PHA
            JSR   L02BAA1
            LDA   #$FFFF
            STA   $01
            BRL   L02B684
L02B552     LDY   #$001A
            LDA   [$0A],Y
            BIT   #$0008
            BNE   L02B563
            BIT   #$0010
            BNE   L02B541
            BRA   L02B571
L02B563     LDY   #$0014
            LDA   [$0A],Y
            INY
            INY
            ORA   [$0A],Y
            BEQ   L02B571
            BRL   L02B632
L02B571     LDY   #$001A
            LDA   [$0A],Y
            BIT   #$0002
            BEQ   L02B594
            STZ   L02B6B2+2
            TDC
            CLC
            ADC   #$0001
            STA   L02B6B2
            LDA   #$0001
            STA   L02B6B6
            LDA   #$0000
            STA   L02B6B6+2
            BRA   L02B5B2
L02B594     LDY   #$0008
            LDA   [$0A],Y
            STA   L02B6B2
            INY
            INY
            LDA   [$0A],Y
            STA   L02B6B2+2
            LDY   #$0010
            LDA   [$0A],Y
            STA   L02B6B6
            INY
            INY
            LDA   [$0A],Y
            STA   L02B6B6+2
L02B5B2     LDY   #$001C
            LDA   [$0A],Y
            STA   L02B6B0
            JSL   GSOS
            DW    $2012            ; Read
            ADRL  L02B6AE
            BCC   L02B5E2
            LDY   #$001A
            CMP   #$004C
            BNE   L02B5D3
            LDA   #$0080
            BRA   L02B5D6
L02B5D3     LDA   #$0100
L02B5D6     ORA   [$0A],Y
            STA   [$0A],Y
            LDA   #$FFFF
            STA   $01
            BRL   L02B684
L02B5E2     LDY   #$001A
            LDA   [$0A],Y
            AND   #$0002
            BEQ   L02B5EF
            BRL   L02B684
L02B5EF     CLC
            LDY   #$000C
            LDA   L02B6B2
            ADC   L02B6BA
            STA   [$0A],Y
            INY
            INY
            LDA   L02B6B2+2
            ADC   L02B6BA+2
            STA   [$0A],Y
            LDY   #$0008
            LDA   [$0A],Y
            TAX
            INY
            INY
            LDA   [$0A],Y
            LDY   #$0006
            STA   [$0A],Y
            DEY
            DEY
            TXA
            STA   [$0A],Y
            LDY   #$0014
            LDA   L02B6BA
            STA   [$0A],Y
            INY
            INY
            LDA   L02B6BA+2
            STA   [$0A],Y
            LDY   #$001A
            LDA   [$0A],Y
            ORA   #$0008
            STA   [$0A],Y
L02B632     LDY   #$0004
            LDA   [$0A],Y
            STA   $03
            CLC
            ADC   #$0001
            STA   [$0A],Y
            INY
            INY
            LDA   [$0A],Y
            STA   $05
            ADC   #$0000
            STA   [$0A],Y
            LDA   [$03]
            AND   #$00FF
            STA   $01
            LDY   #$0014
            SEC
            LDA   [$0A],Y
            SBC   #$0001
            STA   [$0A],Y
            BCS   L02B665
            INY
            INY
            LDA   [$0A],Y
            DEC
            STA   [$0A],Y
L02B665     LDY   #$001A
            LDA   [$0A],Y
            AND   #$0020
            BEQ   L02B684
            LDY   #$0014
            LDA   [$0A],Y
            INY
            INY
            ORA   [$0A],Y
            BNE   L02B684
            LDY   #$001A
            LDA   [$0A],Y
            EOR   #$0008
            STA   [$0A],Y
L02B684     LDA   $01
            CMP   #$000D
            BNE   L02B69A
            LDY   #$001A
            LDA   [$0A],Y
            AND   #$0200
            BEQ   L02B69A
            LDA   #$000A
            STA   $01
L02B69A     PLB
            LDY   $01
            LDA   $08
            STA   $0C
            LDA   $07
            STA   $0B
            PLD
            TSC
            CLC
            ADC   #$000A
            TCS
            TYA
            RTL

L02B6AE     DW    $0004            ; Parms for Read
L02B6B0     DW    $0000            ;  ref num
L02B6B2     ADRL  $00000000        ;  buffer ptr
L02B6B6     ADRL  $00000000        ;  request count
L02B6BA     ADRL  $00000000        ;  transfer count
            DW    $0001
L02B6C0     ADRL  L02B6C4
L02B6C4     DB    $00
            DB    $00
L02B6C6     DB    $00
            DB    $00
L02B6C8     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $FF
            DB    $FF
            DB    $12
            DB    $02
            DB    $FD
            DB    $FF
L02B6E2     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $FF
            DB    $FF
            DB    $12
            DB    $02
            DB    $FD
            DB    $FF
L02B6FC     DEC   L02B340
            JSR   L02BA46
            PEA   $0025
            JSL   L02B337
            BRL   L02BA40
L02B70C     LDA   #$0020
            STA   L02B79A
            BRA   L02B71D
L02B714     LDA   #$0001
            STA   L02B344
L02B71A     STZ   L02B79A
L02B71D     STZ   L02B350
            LDA   #$2020
            STA   L02B358
            LDA   #$0051
            LDX   #L02B358
            LDY   #L02B359
            MVN   L02B358,L02B359
            STZ   L02B354
            LDA   L02B344
            BEQ   L02B742
            LDY   #$0002
            LDA   [$07],Y
            STA   L02B354
L02B742     LDA   [$07]
            STA   L02B352
            STZ   L02B342
            SEP   #$30
            LDY   #$52
L02B74E     LDA   #$00
            LDX   #$04
L02B752     LSR   L02B355
            ROR   L02B354
            ROR   L02B353
            ROR   L02B352
            ROR
            DEX
            BNE   L02B752
            LSR
            LSR
            LSR
            LSR
            ORA   #$30
            CMP   #$3A
            BCC   L02B771
            ADC   #$06
            ORA   L02B79A
L02B771     STA   L02B358,Y
            DEY
            LDA   L02B355
            ORA   L02B354
            ORA   L02B353
            ORA   L02B352
            BNE   L02B74E
            LDA   L02B33E
            BEQ   L02B795
            LDA   #$58
            ORA   L02B79A
            STA   L02B343
            LDA   #$30
            STA   L02B342
L02B795     REP   #$30
            BRL   L02B891
L02B79A     DW    $0000
L02B79C     LDA   $09
            PHA
            LDA   $07
            PHA
            LDY   #$0002
            LDA   [$07],Y
            TAX
            LDA   [$07]
            STA   $07
            STX   $09
            SEP   #$20
            LDY   #$FFFF
L02B7B3     INY
            LDA   [$07],Y
            BNE   L02B7B3
            REP   #$20
            TYA
            BRA   L02B7DA
L02B7BD     LDA   $09
            PHA
            LDA   $07
            PHA
            LDY   #$0002
            LDA   [$07],Y
            TAX
            LDA   [$07]
            STA   $07
            STX   $09
            LDA   [$07]
            AND   #$00FF
            INC   $07
            BNE   L02B7DA
            INC   $09
L02B7DA     LDX   L02B34C
            BEQ   L02B7E7
            CMP   L02B34A
            BCC   L02B7E7
            LDA   L02B34A
L02B7E7     STA   L02B352
            SEC
            LDA   L02B340
            SBC   L02B352
            STA   L02B340
            JSR   L02BA46
            LDX   L02B352
            BEQ   L02B811
            LDY   #$0000
L02B7FF     PHY
            LDA   [$07],Y
            AND   #$00FF
            PHA
            JSL   L02B337
            PLY
            INY
            DEC   L02B352
            BNE   L02B7FF
L02B811     CLC
            PLA
            ADC   #$0004
            STA   $07
            PLA
            STA   $09
            BRL   L02BA40
L02B81E     DEC   L02B340
            JSR   L02BA46
            LDA   [$07]
            PHA
            JSL   L02B337
            INC   $07
            INC   $07
            BRL   L02BA40
L02B832     LDA   L02B344
            BEQ   L02B84F
            LDY   #$0002
            LDA   [$07],Y
            BPL   L02B85F
            SEC
            LDA   #$0000
            SBC   [$07]
            STA   [$07]
            LDA   #$0000
            SBC   [$07],Y
            STA   [$07],Y
            BRA   L02B859
L02B84F     LDA   [$07]
            BPL   L02B85F
            EOR   #$FFFF
            INC
            STA   [$07]
L02B859     LDA   #$002D
            STA   L02B350
L02B85F     STZ   L02B342
            LDA   L02B344
            BEQ   L02B86D
            LDY   #$0002
            LDA   [$07],Y
            PHA
L02B86D     LDA   [$07]
            PHA
            PEA   ^L02B358
            PEA   L02B358
            PEA   $0053
            PEA   $0000
            LDA   L02B344
            BEQ   L02B88A
            _Long2Dec
            BRA   L02B891
L02B88A     _Int2Dec
L02B891     LDA   L02B34C
            BNE   L02B89C
            LDA   #$0001
            STA   L02B34A
L02B89C     LDX   L02B34A
            BNE   L02B8B1
            LDA   L02B3A9
            CMP   #$3020
            BNE   L02B8D8
            LDA   #$2020
            STA   L02B3A9
            BRA   L02B8D8
L02B8B1     LDY   #$0000
            SEP   #$20
            LDA   #$20
L02B8B8     CMP   L02B358,Y
            BNE   L02B8C5
            INY
            CPY   #$0053
            BNE   L02B8B8
            BRA   L02B8D6
L02B8C5     CMP   L02B358,Y
            BEQ   L02B8D3
            DEX
            BEQ   L02B8D3
            INY
            CPY   #$0053
            BNE   L02B8C5
L02B8D3     STX   L02B34A
L02B8D6     REP   #$20
L02B8D8     SEC
            LDA   L02B340
            SBC   L02B34A
            STA   L02B340
            LDA   L02B350
            BEQ   L02B8EA
            DEC   L02B340
L02B8EA     LDA   L02B342
            BEQ   L02B8F5
            DEC   L02B340
            DEC   L02B340
L02B8F5     LDX   #$0000
            LDY   #$0052
            SEP   #$20
            LDA   #$20
L02B8FF     CMP   L02B358,Y
            BEQ   L02B908
            INX
            DEY
            BPL   L02B8FF
L02B908     REP   #$20
            SEC
            TXA
            SBC   L02B340
            EOR   #$FFFF
            INC
            STA   L02B340
            LDA   L02B348
            CMP   #$0030
            BEQ   L02B921
            JSR   L02BA46
L02B921     LDA   L02B350
            BEQ   L02B92B
            PHA
            JSL   L02B337
L02B92B     LDA   L02B342
            BEQ   L02B93D
            PHA
            JSL   L02B337
            LDA   L02B343
            PHA
            JSL   L02B337
L02B93D     LDA   L02B348
            CMP   #$0030
            BNE   L02B959
            LDA   L02B340
            BMI   L02B959
            BEQ   L02B959
L02B94C     LDA   L02B348
            PHA
            JSL   L02B337
            DEC   L02B340
            BNE   L02B94C
L02B959     LDA   L02B34A
            BEQ   L02B96A
L02B95E     PEA   $0030
            JSL   L02B337
            DEC   L02B34A
            BNE   L02B95E
L02B96A     LDY   #$FFFF
L02B96D     INY
            LDA   L02B358,Y
            AND   #$00FF
            CMP   #$0020
            BEQ   L02B96D
L02B979     CPY   #$0053
            BEQ   L02B98E
            PHY
            LDA   L02B358,Y
            AND   #$00FF
            PHA
            JSL   L02B337
            PLY
            INY
            BRA   L02B979
L02B98E     LDA   L02B344
            BEQ   L02B997
            INC   $07
            INC   $07
L02B997     INC   $07
            INC   $07
            BRL   L02BA40
L02B99E     LDA   $09
            PHA
            LDA   $07
            PHA
            LDY   #$0002
            LDA   [$07],Y
            TAX
            LDA   [$07]
            STA   $07
            STX   $09
            LDA   L02B356
            STA   [$07]
            LDA   L02B344
            BEQ   L02B9C2
            LDY   #$0002
            LDA   #$0000
            STA   [$07],Y
L02B9C2     CLC
            PLA
            ADC   #$0004
            STA   $07
            PLA
            STA   $09
            RTS

L02B9CD     STZ   L02B350
            LDA   #$2020
            STA   L02B358
            LDA   #$0051
            LDX   #L02B358
            LDY   #L02B359
            MVN   L02B358,L02B359
            STZ   L02B354
            LDA   L02B344
            BEQ   L02B9F2
            LDY   #$0002
            LDA   [$07],Y
            STA   L02B354
L02B9F2     LDA   [$07]
            STA   L02B352
            SEP   #$30
            LDY   #$52
L02B9FB     LDA   L02B355
            ORA   L02B354
            ORA   L02B353
            ORA   L02B352
            BEQ   L02BA2A
            LDA   #$00
            LDX   #$03
L02BA0D     LSR   L02B355
            ROR   L02B354
            ROR   L02B353
            ROR   L02B352
            ROR
            DEX
            BNE   L02BA0D
            LSR
            LSR
            LSR
            LSR
            LSR
            ORA   #$30
            STA   L02B358,Y
            DEY
            BRA   L02B9FB
L02BA2A     CPY   #$52
            BEQ   L02BA33
            LDA   L02B33E
            BEQ   L02BA38
L02BA33     LDA   #$30
            STA   L02B358,Y
L02BA38     REP   #$30
            STZ   L02B342
            BRL   L02B891
L02BA40     LDA   L02B346
            BNE   L02BA4B
L02BA45     RTS

L02BA46     LDA   L02B346
            BNE   L02BA45
L02BA4B     LDA   L02B340
            BMI   L02BA45
            BEQ   L02BA45
L02BA52     PEA   $0020
            JSL   L02B337
            DEC   L02B340
            BNE   L02BA52
            RTS

L02BA5F     PHB
            PHK
            PLB
            PEA   ^L02AA97
            PEA   L02AA97
            TSC
            PHD
            TCD
L02BA6B     LDA   $01
            ORA   $03
            BEQ   L02BA8B
            LDA   $01
            CMP   $09
            BNE   L02BA7D
            LDA   $03
            CMP   $0B
            BEQ   L02BA95
L02BA7D     LDY   #$0002
            LDA   [$01],Y
            TAX
            LDA   [$01]
            STA   $01
            STX   $03
            BRA   L02BA6B
L02BA8B     LDA   #$0005
            STAL  L02B10B
            SEC
            BRA   L02BA96
L02BA95     CLC
L02BA96     PLD
            PLA
            PLA
            PLX
            PLY
            PLA
            PLA
            PHY
            PHX
            PLB
            RTL

L02BAA1     TSC
            PHD
            TCD
            LDY   #$001A
            LDA   [$03],Y
            ORA   #$0100
            STA   [$03],Y
            LDA   #$0005
            STAL  L02B10B
            PLD
            PLA
            PLY
            PLY
            PHA
            RTS

L02BABB     PHB
            PLX
            PLY
            PHK
            PLB
            PLA
            STA   L02C05B
            PLA
            STA   L02C05D
            PLA
            STA   L02C05F
            PLA
            STA   L02C061
            PLA
            STA   L02C063
            PHY
            PHX
            PEA   ^L02C05B
            PEA   L02C05B
            PEA   $0000
            _SANEElems816
            PEA   $0003
            _SANEFP816
            TXA
            AND   #$0100
            BEQ   L02BAFD
            LDA   #$0001
            STAL  L02B10B
L02BAFD     LDX   #^L02C05B
            LDA   #L02C05B
            PLB
            RTL

L02BB05     TSC
            PEA   $0000
            CLC
            ADC   #$0004
            PHA
            PEA   $0000
            ADC   #$000A
            PHA
            PEA   $0000
            _SANEFP816
            LDA   $00,S
            STA   $0A,S
            LDA   $02,S
            STA   $0C,S
            TSC
            CLC
            ADC   #$000A
            TCS
            RTL

L02BB2E     PHB
            PLX
            PLY
            PHA
            PHA
            PHA
            PHA
            PHA
            PHY
            PHX
            PLB
            PHA
            TSC
            INC
            PEA   $0000
            PHA
            PEA   $0000
            CLC
            ADC   #$0005
            PHA
            PEA   $040E
            _SANEFP816
            PLA
            RTL

L02BB54     PHB
            PHK
            PLB
            STA   L02BB81
            STX   L02BB83
            PLX
            PLY
            PHA
            PHA
            PHA
            PHA
            PHA
            PHY
            PHX
            PLB
            PEA   ^L02BB81
            PEA   L02BB81
            PEA   $0000
            CLC
            TSC
            ADC   #$000A
            PHA
            PEA   $030E
            _SANEFP816
            RTL

L02BB81     DW    $0000
L02BB83     DW    $0000
L02BB85     TSC
            CLC
            ADC   #$0004
            PEA   $0000
            PHA
            PEA   $0000
            PHA
            PEA   $0000
            PHA
            PEA   $0016
            _SANEFP816
            PEA   $0410
            _SANEFP816
            PHB
            PLA
            STA   $09,S
            PLA
            STA   $09,S
            PLA
            PLX
            PLX
            PLB
            TAX
            RTL

L02BBB7     TSC
            CLC
            ADC   #$0004
            PEA   $0000
            PHA
            PEA   $0000
            PHA
            PEA   $0000
            PHA
            PEA   $0016
            _SANEFP816
            PEA   $0310
            _SANEFP816
            PHB
            PLA
            STA   $09,S
            PLA
            STA   $09,S
            PLA
            PLX
            PLY
            PLB
            TAY
            BNE   L02BBEB
            TXY
L02BBEB     RTL

L02BBEC     TSC
            CLC
            ADC   #$0004
            PEA   $0000
            PHA
            PEA   $0000
            PHA
            PEA   $0000
            PHA
            PEA   $0016
            _SANEFP816
            PEA   $0310
            _SANEFP816
            PHB
            PLA
            STA   $09,S
            PLA
            STA   $09,S
            PLA
            PLX
            PLX
            PLB
            TAX
            RTL

L02BC1E     TSC
            PHD
            TCD
            PEA   $0000
            CLC
            TDC
            ADC   #$0008
            PHA
            LDA   $06
            PHA
            LDA   $04
            PHA
            PEA   $0110
            _SANEFP816
            LDA   $02
            STA   $06
            LDA   $01
            STA   $05
            PLD
            TSC
            CLC
            ADC   #$0004
            TCS
            RTL

L02BC4A     TSC
            PEA   $0000
            CLC
            ADC   #$0004
            PHA
            PEA   $0000
            ADC   #$000A
            PHA
            PEA   $0006
            _SANEFP816
            LDA   $00,S
            STA   $0A,S
            LDA   $02,S
            STA   $0C,S
            TSC
            CLC
            ADC   #$000A
            TCS
            RTL

L02BC73     PHB
            PHK
            PLB
            STZ   L02BC9B+2
            STA   L02BC9B+1
            TXA
            XBA
            ORA   L02BC9B+2
            STA   L02BC9B+2
            PLX
            PLY
            TSC
            SEC
            SBC   #$000A
            TCS
            PHY
            PHX
            PLB
            CLC
            TSC
            ADC   #$0004
            STAL  L02BC9F+1
            LDX   #$0008
L02BC9B     LDAL  $000000,X
L02BC9F     STAL  $000000,X
            DEX
            DEX
            BPL   L02BC9B
            RTL

L02BCA8     STZ   L02BE7C
            BRA   L02BCB3
L02BCAD     LDA   #$0001
            STA   L02BE7C
L02BCB3     STZ   L02B3AB
            INC   L02B34A
            BRA   L02BCC4
L02BCBB     LDA   #$0001
            STA   L02B3AB
            STZ   L02BE7C
L02BCC4     LDY   #$0008
            LDA   [$07],Y
            BPL   L02BCD6
            EOR   #$8000
            STA   [$07],Y
            LDA   #$002D
            STA   L02B350
L02BCD6     LDA   L02B34C
            BNE   L02BCE4
            LDA   #$0007
            SEC
            SBC   L02B3AB
            BRA   L02BCE7
L02BCE4     LDA   L02B34A
L02BCE7     STA   L02B3AD
            PEA   ^L02B3AB
            PEA   L02B3AB
            LDA   $09
            PHA
            LDA   $07
            PHA
            PEA   ^L02B3AF
            PEA   L02B3AF
            PEA   $000B
            _SANEFP816
            PEA   ^L02B3AB
            PEA   L02B3AB
            PEA   ^L02B3AF
            PEA   L02B3AF
            PEA   ^L02B358
            PEA   L02B358
            PEA   $0001
            _SANEDecStr816
            LDA   L02B3AB
            BNE   L02BD41
            SEP   #$30
            LDX   L02B358
            LDA   L02B356,X
            CMP   #$65
            BNE   L02BD41
            INC   L02B358
            LDA   L02B358,X
            STA   L02B359,X
            LDA   #$30
            STA   L02B358,X
L02BD41     REP   #$30
            LDA   L02B34E
            BEQ   L02BD4D
L02BD48     JSR   L02BE30
            BCS   L02BD48
L02BD4D     LDA   L02BE7C
            BEQ   L02BD68
            SEP   #$30
            LDX   L02B358
L02BD57     LDA   L02B358,X
            CMP   #$65
            BEQ   L02BD61
            DEX
            BNE   L02BD57
L02BD61     LDA   #$45
            STA   L02B358,X
            REP   #$30
L02BD68     LDA   L02B359
            AND   #$00FF
            CMP   #$0020
            BNE   L02BD82
            DEC   L02B358
            LDA   #$0050
            LDX   #L02B35A
            LDY   #L02B359
            MVN   L02B35A,L02B359
L02BD82     LDA   L02B3AD
            BNE   L02BDBD
            LDA   L02B33E
            BEQ   L02BDBD
            SEP   #$30
            INC   L02B358
            LDX   #$01
L02BD93     LDA   L02B358,X
            CMP   #$30
            BCC   L02BDA4
            CMP   #$3A
            BCS   L02BDA4
            INX
            CPX   L02B358
            BNE   L02BD93
L02BDA4     LDY   L02B358,X
            LDA   #$2E
            STA   L02B358,X
L02BDAC     CPX   L02B358
            BEQ   L02BDBB
            INX
            TYA
            LDY   L02B358,X
            STA   L02B358,X
            BRA   L02BDAC
L02BDBB     REP   #$30
L02BDBD     LDA   L02B350
            BEQ   L02BDC5
            DEC   L02B340
L02BDC5     LDA   L02B358
            AND   #$00FF
            SEC
            SBC   L02B340
            EOR   #$FFFF
            INC
            STA   L02B340
            LDA   L02B348
            CMP   #$0030
            BEQ   L02BDE1
            JSR   L02BA46
L02BDE1     LDA   L02B350
            BEQ   L02BDEB
            PHA
            JSL   L02B337
L02BDEB     LDA   L02B348
            CMP   #$0030
            BNE   L02BE06
            LDA   L02B340
            BEQ   L02BE06
            BMI   L02BE06
L02BDFA     PEA   $0030
            JSL   L02B337
            DEC   L02B340
            BNE   L02BDFA
L02BE06     LDA   L02B358
            AND   #$00FF
            TAY
            BEQ   L02BE25
            LDX   #$0001
L02BE12     LDA   L02B358,X
            PHX
            PHY
            AND   #$00FF
            PHA
            JSL   L02B337
            PLY
            PLX
            INX
            DEY
            BNE   L02BE12
L02BE25     CLC
            LDA   $07
            ADC   #$000A
            STA   $07
            BRL   L02BA40
L02BE30     SEP   #$30
            LDX   #$00
L02BE34     LDA   L02B359,X
            CMP   #$2E
            BEQ   L02BE43
            INX
            CPX   L02B358
            BNE   L02BE34
            BRA   L02BE66
L02BE43     CPX   L02B358
            BEQ   L02BE52
            LDA   L02B359,X
            CMP   #$65
            BEQ   L02BE52
            INX
            BRA   L02BE43
L02BE52     LDA   L02B358,X
            CMP   #$30
            BNE   L02BE5F
            JSR   L02BE6A
            SEC
            BRA   L02BE67
L02BE5F     CMP   #$2E
            BNE   L02BE66
            JSR   L02BE6A
L02BE66     CLC
L02BE67     REP   #$30
            RTS

L02BE6A     CPX   L02B358
            BEQ   L02BE78
            LDA   L02B359,X
            STA   L02B358,X
            INX
            BRA   L02BE6A
L02BE78     DEC   L02B358
            RTS

L02BE7C     DW    $0000
L02BE7E     STZ   L02BF01
            BRA   L02BE89
L02BE83     LDA   #$0001
            STA   L02BF01
L02BE89     LDA   L02B34C
            BNE   L02BE97
            LDA   #$0006
            STA   L02B34A
            INC   L02B34C
L02BE97     LDA   L02B34A
            STA   L02B3AD
            PEA   ^L02B3AB
            PEA   L02B3AB
            LDA   $09
            PHA
            LDA   $07
            PHA
            PEA   ^L02B3AF
            PEA   L02B3AF
            PEA   $000B
            _SANEFP816
            LDA   L02B33E
            EOR   #$0001
            STA   L02B34E
            LDA   #$0001
            STA   L02B33E
            LDA   L02B3B3
            AND   #$00FF
            CLC
            ADC   L02B3B1
            DEC
            STA   L02BF03
            BPL   L02BEDD
            CMP   #$FFFD
            BCS   L02BEF7
L02BEDD     CMP   L02B34A
            BCC   L02BEF7
            BEQ   L02BEF7
            DEC   L02B34A
            BPL   L02BEEC
            STZ   L02B34A
L02BEEC     LDA   L02BF01
            BNE   L02BEF4
            BRL   L02BCA8
L02BEF4     BRL   L02BCAD
L02BEF7     SEC
            LDA   L02B34A
            SBC   L02BF03
            BRL   L02BCBB
L02BF01     DW    $0000
L02BF03     DW    $0000
L02BF05     TSC
            PEA   $0000
            CLC
            ADC   #$000E
            PHA
            PEA   $0000
            SEC
            SBC   #$000A
            PHA
            PEA   $000A
            _SANEFP816
            LDA   $00,S
            STA   $14,S
            LDA   $02,S
            STA   $16,S
            TSC
            CLC
            ADC   #$0014
            TCS
            TXA
            AND   #$0040
            BEQ   L02BF37
            LDA   #$0001
L02BF37     RTL

L02BF38     TSC
            SEC
            SBC   #$000E
            TCS
            LDA   $12,S
            STA   $05,S
            LDA   $14,S
            STA   $07,S
            LDA   $10,S
            STA   $0A,S
            LDA   $0E,S
            STA   $08,S
            CLC
            TSC
            ADC   #$000C
            STA   $01,S
            LDA   #$0000
            STA   $03,S
            PEA   $010E
            _SANEFP816
            RTL

L02BF65     TSC
            PEA   $0000
            CLC
            ADC   #$0004
            PHA
            PEA   $0000
            ADC   #$000A
            PHA
            PEA   $0004
            _SANEFP816
            LDA   $00,S
            STA   $0A,S
            LDA   $02,S
            STA   $0C,S
            TSC
            CLC
            ADC   #$000A
            TCS
            RTL

L02BF8E     TDC
            TAX
            TSC
            SEC
            SBC   #$FFFF
            TCD
            DEC
            TCS
            PHX
            PEA   $0000
            CLC
            TDC
            ADC   #$0007
            PHA
            LDA   $05
            PHA
            LDA   $03
            PHA
            PEA   $0110
            _SANEFP816
            LDA   $01
            STA   $0F
            LDA   $00
            STA   $0E
            CLC
            TDC
            ADC   #$000D
            PLD
            TCS
            RTL

L02BFC2     TDC
            TAX
            TSC
            SEC
            SBC   #$FFFF
            TCD
            DEC
            TCS
            PHX
            PEA   $0000
            CLC
            TDC
            ADC   #$0007
            PHA
            LDA   $05
            PHA
            LDA   $03
            PHA
            PEA   $0210
            _SANEFP816
            LDA   $01
            STA   $0F
            LDA   $00
            STA   $0E
            CLC
            TDC
            ADC   #$000D
            PLD
            TCS
            RTL

L02BFF6     TSC
            PEA   $0000
            CLC
            ADC   #$0004
            PHA
            PEA   $0000
            ADC   #$000A
            PHA
            PEA   $0002
            _SANEFP816
            LDA   $00,S
            STA   $0A,S
            LDA   $02,S
            STA   $0C,S
            TSC
            CLC
            ADC   #$000A
            TCS
            RTL

            DB    $35
            DB    $C2
            DB    $68
            DB    $21
            DB    $A2
            DB    $DA
            DB    $0F
            DB    $C9
            DB    $00
            DB    $40
            DB    $35
            DB    $C2
            DB    $68
            DB    $21
            DB    $A2
            DB    $DA
            DB    $0F
            DB    $C9
            DB    $FF
            DB    $3F
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $80
            DB    $FD
            DB    $3F
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $80
            DB    $FE
            DB    $3F
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $80
            DB    $FF
            DB    $3F
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $80
            DB    $00
            DB    $40
L02C05B     DB    $00
            DB    $00
L02C05D     DB    $00
            DB    $00
L02C05F     DB    $00
            DB    $00
L02C061     DB    $00
            DB    $00
L02C063     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02C07B     JMP   L02C07E

L02C07E     TSC
            PHD
            TCD
            LDA   $04
            STAL  L02C0B9
            LDAL  L02C576
            STAL  L02C0AB
            JSL   GSOS
            DW    $2013            ; Write
            ADRL  L02C0A9
            LDA   $02
            STA   $04
            LDA   $01
            STA   $03
            PLD
            TSC
            CLC
            ADC   #$0002
            TCS
            RTL

L02C0A9     DW    $0004            ; Parms for Write
L02C0AB     DW    $0000            ;  ref num
            ADRL  L02C0B9          ;  buffer ptr
            ADRL  $00000001        ;  request count
            ADRL  $00000000        ;  transfer count
L02C0B9     BRK   $00
L02C0BB     PHB
            PHK
            PLB
L02C0BE     LDA   L02C572
            BEQ   L02C0C8
            STZ   L02C572
            PLB
            RTL

L02C0C8     LDX   L02C56E
            CPX   L02C570
            BCS   L02C0DD
            LDA   L02C46E,X
            AND   #$00FF
            BEQ   L02C0DB
            INC   L02C56E
L02C0DB     PLB
            RTL

L02C0DD     JSL   L02C0E3
            BRA   L02C0BE
L02C0E3     JMP   L02C0E6

L02C0E6     PHB
            PHK
            PLB
            LDA   L02C580
            BEQ   L02C0F3
            JSR   L02C111
            PLB
            RTL

L02C0F3     LDA   L02C574
            STA   L02C1CD
            STZ   L02C56E
            LDA   #$0001
            STA   L02C570
            STZ   L02C46E
            JSL   GSOS
            DW    $2012            ; Read
            ADRL  L02C1CB
            PLB
            RTL

L02C111     LDA   L02C580
            STA   L02C178
            STA   L02C194
            STA   L02C1AA
            STA   L02C1DD
            JSL   GSOS
            DW    $202E            ; DControl
            ADRL  L02C176
            JSL   GSOS
            DW    $202E            ; DControl
            ADRL  L02C1DB
            JSL   GSOS
            DW    $202F            ; DRead
            ADRL  L02C192
            JSL   GSOS
            DW    $202D            ; DStatus
            ADRL  L02C1A8
            LDX   L02C1A4
            INX
            STX   L02C570
            SEP   #$20
            LDA   L02C1BA+8
            CMP   #$2E
            BNE   L02C15C
            LDA   #$00
            BRA   L02C16D
L02C15C     CMP   #$0D
            BNE   L02C16D
            REP   #$20
            PEA   $000D
            JSL   L02C07B
            SEP   #$20
            LDA   #$0D
L02C16D     STA   L02C46D,X
            REP   #$20
            STZ   L02C56E
            RTS

L02C176     DW    $0005            ; Parms for DControl
L02C178     DW    $0000            ;  device num
            DW    $8001            ;  control code
            ADRL  L02C188          ;  control list
            ADRL  $0000000A        ;  request count
            ADRL  $00000000        ;  transfer count
L02C188     HEX   7F82030000022E800D00
L02C192     DW    $0006            ; Parms for DRead
L02C194     DW    $0000            ;  device num
            ADRL  L02C46E          ;  buffer ptr
            ADRL  $000000FF        ;  request count
            ADRL  $00000000        ;  starting block
            DW    $0000            ;  block size
L02C1A4     ADRL  $00000000        ;  transfer count
L02C1A8     DW    $0005            ; Parms for DStatus
L02C1AA     DW    $0000            ;  device num
            DW    $8001            ;  status code
            ADRL  L02C1BA          ;  status list
            ADRL  $00000011        ;  request count
            ADRL  $00000000        ;  transfer count
L02C1BA     HEX   00000000000000000000000000000000
            HEX   00
L02C1CB     DW    $0004            ; Parms for Read
L02C1CD     DW    $0000            ;  ref num
            ADRL  L02C46E          ;  buffer ptr
            ADRL  $00000001        ;  request count
            ADRL  $00000000        ;  transfer count
L02C1DB     DW    $0005            ; Parms for DControl
L02C1DD     DW    $0000            ;  device num
            DW    $8003            ;  control code
            ADRL  L02C1ED          ;  control list
            ADRL  $00000002        ;  request count
            ADRL  $00000000        ;  transfer count
L02C1ED     HEX   0000
L02C1EF     TSC
            PHD
            TCD
            LDY   $04
            LDX   $06
            SEC
            TYA
            SBC   #$0002
            STA   $04
            BCS   L02C201
            DEC   $06
L02C201     LDA   [$04]
            BNE   L02C20C
            TYA
            JSL   L02C3D0
            BRA   L02C211
L02C20C     TYA
            JSL   L02C2E3
L02C211     LDA   $00
            STA   $04
            LDA   $02
            STA   $06
            PLD
            PLA
            PLA
            RTL

L02C21D     LDA   $06,S
            TAX
            LDA   $04,S
            CPX   #$0000
            BNE   L02C237
            CMP   #$0FFC
            BCS   L02C237
            CMP   #$0000
            BEQ   L02C23B
            JSL   L02C65E
            BRA   L02C23B
L02C237     JSL   L02C775
L02C23B     TAY
            LDA   $00,S
            STA   $04,S
            LDA   $02,S
            STA   $06,S
            PLA
            PLA
            TYA
            RTL

L02C248     TSC
            PHD
            TCD
            LDA   $06
            BPL   L02C26A
            CMP   #$FFFF
            BNE   L02C264
            LDX   $04
            CPX   #$FFDE
            BCC   L02C264
L02C25B     ASL   $08
            ROL   $0A
            INX
            BNE   L02C25B
            BRA   L02C27F
L02C264     STZ   $08
            STZ   $0A
            BRA   L02C27F
L02C26A     BNE   L02C264
            LDX   $04
            BEQ   L02C27F
            CPX   #$0021
            BCS   L02C264
L02C275     LDA   $0A
            ASL
            ROR   $0A
            ROR   $08
            DEX
            BNE   L02C275
L02C27F     LDA   $00
            STA   $04
            LDA   $02
            STA   $06
            PLD
            PLA
            PLA
            RTL

L02C28B     DB    $00
            DB    $00
L02C28D     DB    $00
            DB    $00
L02C28F     DB    $00
            DB    $00
L02C291     DB    $00
            DB    $00
            ADRL  L02C297
L02C297     DB    $00
            DB    $00
            ADRL  L02C29D
L02C29D     DB    $00
            DB    $00
L02C29F     DB    $00
            DB    $00
            ADRL  L02C2A5
L02C2A5     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02C2B1     DB    $00
            DB    $00
L02C2B3     DB    $00
            DB    $00
L02C2B5     DB    $00
            DB    $00
L02C2B7     DB    $00
            DB    $00
L02C2B9     DB    $00
            DB    $00
            DB    $00
            DB    $00
L02C2BD     DB    $00
            DB    $00
L02C2BF     DB    $00
            DB    $00
L02C2C1     DB    $00
L02C2C2     DB    $00
L02C2C3     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02C2E3     PHA
            PHA
            PHA
            SEC
            SBC   #$0004
            BCS   L02C2ED
            DEX
L02C2ED     PHX
            PHA
            TSC
            PHD
            TCD
            LDA   [$01]
            BPL   L02C2F9
            BRL   L02C3C8
L02C2F9     LDA   [$01]
            ORA   #$8000
            STA   [$01]
            LDY   #$0002
            LDA   [$01],Y
            STA   $09
            TAY
            LDA   $01
            LDX   $03
            JSL   L02C582
L02C310     LDA   $09
            CMP   #$1000
            BCC   L02C31A
            BRL   L02C3B6
L02C31A     LDA   [$01]
            AND   $09
            BEQ   L02C371
            SEC
            LDA   $01
            SBC   $09
            STA   $05
            LDA   $03
            SBC   #$0000
            STA   $07
            LDY   #$0002
            LDA   [$05],Y
            CMP   $09
            BEQ   L02C33A
            BRL   L02C3C8
L02C33A     LDA   [$05]
            BMI   L02C341
            BRL   L02C3C8
L02C341     LDY   $09
            LDX   $03
            LDA   $01
            JSL   L02C97C
            LDY   $09
            LDX   $07
            LDA   $05
            JSL   L02C97C
            LDA   $05
            STA   $01
            LDA   $07
            STA   $03
            ASL   $09
            LDA   $09
            LDY   #$0002
            STA   [$01],Y
            TAY
            LDA   $01
            LDX   $03
            JSL   L02C582
            BRA   L02C310
L02C371     CLC
            LDA   $01
            ADC   $09
            STA   $05
            LDA   $03
            ADC   #$0000
            STA   $07
            LDY   #$0002
            LDA   [$05],Y
            CMP   $09
            BNE   L02C3C8
            LDA   [$05]
            BPL   L02C3C8
            LDY   $09
            LDX   $03
            LDA   $01
            JSL   L02C97C
            LDY   $09
            LDX   $07
            LDA   $05
            JSL   L02C97C
            ASL   $09
            LDY   #$0002
            LDA   $09
            STA   [$01],Y
            LDY   $09
            LDA   $01
            LDX   $03
            JSL   L02C582
            BRL   L02C310
L02C3B6     LDY   $09
            LDA   $01
            LDX   $03
            JSL   L02C97C
            LDA   $01
            LDX   $03
            JSL   L02C3D0
L02C3C8     PLD
            TSC
            CLC
            ADC   #$000A
            TCS
            RTL

L02C3D0     PHA
            PHA
            SEC
            SBC   #$000E
            BCS   L02C3D9
            DEX
L02C3D9     PHX
            PHA
            TSC
            PHD
            TCD
            LDY   #$0002
            LDA   [$01],Y
            ORA   [$01]
            BNE   L02C3FA
            LDY   #$0004
            LDA   [$01],Y
            STAL  L02CBBC
            INY
            INY
            LDA   [$01],Y
            STAL  L02CBBE
            BRA   L02C40F
L02C3FA     LDA   [$01]
            STA   $05
            LDA   [$01],Y
            STA   $07
            LDY   #$0004
            LDA   [$01],Y
            STA   [$05],Y
            INY
            INY
            LDA   [$01],Y
            STA   [$05],Y
L02C40F     LDY   #$0004
            LDA   [$01],Y
            TAX
            INY
            INY
            ORA   [$01],Y
            BEQ   L02C42C
            LDA   [$01],Y
            STA   $07
            STX   $05
            LDY   #$0002
            LDA   [$01]
            STA   [$05]
            LDA   [$01],Y
            STA   [$05],Y
L02C42C     LDY   #$000A
            LDA   [$01],Y
            PHA
            DEY
            DEY
            LDA   [$01],Y
            PHA
            _DisposeHandle
            PLD
            PLA
            PLA
            PLA
            PLA
            RTL

L02C444     LDX   #$0000
            LDA   $0A,S
            EOR   $06,S
            BPL   L02C453
            LDA   $06,S
            CMP   $0A,S
            BRA   L02C45D
L02C453     LDA   $0A,S
            CMP   $06,S
            BNE   L02C45D
            LDA   $08,S
            CMP   $04,S
L02C45D     BCC   L02C462
            BEQ   L02C462
            INX
L02C462     PHB
            PLA
            STA   $07,S
            PLA
            STA   $07,S
            PLA
            PLA
            PLB
            TXA
L02C46D     RTL

L02C46E     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02C566     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02C56E     DB    $00
            DB    $00
L02C570     DB    $00
            DB    $00
L02C572     DB    $00
            DB    $00
L02C574     DB    $00
            DB    $00
L02C576     DB    $00
            DB    $00
L02C578     DB    $00
            DB    $00
L02C57A     DB    $00
            DB    $00
L02C57C     DB    $00
            DB    $00
L02C57E     DB    $00
            DB    $00
L02C580     DB    $00
            DB    $00
L02C582     PHX
            PHA
            TSC
            PHD
            TCD
            TYA
            JSL   L02D03D
            LDY   #$0004
            LDAL  L02CBC0,X
            STA   [$01],Y
            INY
            INY
            LDAL  L02CBC2,X
            STA   [$01],Y
            LDA   $01
            STAL  L02CBC0,X
            LDA   $03
            STAL  L02CBC2,X
            PLD
            PLA
            PLA
            RTL

L02C5AD     TSC
            SEC
            SBC   #$000C
            TCS
            PHD
            TCD
            JSL   L02CA3A
            LDA   $07
            BEQ   L02C5E4
            LDY   #$0020
            JSR   L02C5C6
            BRL   L02C615
L02C5C6     LDA   $05
            LSR
            BCC   L02C5D8
            CLC
            LDA   $09
            ADC   $10
            STA   $09
            LDA   $0B
            ADC   $12
            STA   $0B
L02C5D8     ROR   $0B
            ROR   $09
            ROR   $07
            ROR   $05
            DEY
            BNE   L02C5C6
            RTS

L02C5E4     ORA   $12
            BEQ   L02C5FF
            LDY   #$0010
            JSR   L02C5C6
            LDA   $07
            STA   $05
            LDA   $09
            STA   $07
            LDA   $0B
            STA   $09
            STZ   $0B
            BRL   L02C615
L02C5FF     LDY   #$0010
            LDX   $05
            STX   $07
L02C606     LSR   $07
            BCC   L02C60D
            CLC
            ADC   $10
L02C60D     ROR
            ROR   $05
            DEY
            BNE   L02C606
            STA   $07
L02C615     LDA   $07
            AND   #$8000
            ORA   $09
            ORA   $0B
            BEQ   L02C632
            LDA   $0E
            STA   $12
            LDA   $0C
            STA   $10
            PLD
            TSC
            CLC
            ADC   #$0010
            TCS
            SEP   #$40
            RTL

L02C632     LDA   $01
            BEQ   L02C645
            SEC
            LDA   #$0000
            SBC   $05
            STA   $05
            LDA   #$0000
            SBC   $07
            STA   $07
L02C645     CLV
            LDA   $07
            STA   $16
            LDA   $05
            STA   $14
            LDA   $0E
            STA   $12
            LDA   $0C
            STA   $10
            PLD
            TSC
            CLC
            ADC   #$0010
            TCS
            RTL

L02C65E     PHA
            CLC
            ADC   #$0004
            PHA
            TSC
            SEC
            SBC   #$000A
            TCS
            PHD
            TCD
            LDA   #$0008
L02C66F     CMP   $0B
            BCS   L02C676
            ASL
            BRA   L02C66F
L02C676     STA   $0D
            JSL   L02D03D
            STX   $09
            STX   $0B
L02C680     LDX   $0B
            LDAL  L02CBC0,X
            ORAL  L02CBC2,X
            BNE   L02C6DB
            CPX   #$0024
            BCC   L02C6CF
            LDA   #$1000
            LDX   #$0000
            JSL   L02C775
            STA   $01
            STAL  L02CBE4
            STX   $03
            TXA
            STAL  L02CBE6
            ORA   $01
            BNE   L02C6AF
            BRL   L02C75A
L02C6AF     LDA   #$8000
            STA   [$01]
            LDY   #$0002
            LDA   #$1000
            STA   [$01],Y
            INY
            INY
            LDA   #$0000
            STA   [$01],Y
            INY
            INY
            STA   [$01],Y
            LDA   $0B
            CMP   $09
            BEQ   L02C73B
            BRA   L02C730
L02C6CF     CLC
            LDA   $0B
            ADC   #$0004
            STA   $0B
            ASL   $0D
            BRA   L02C730
L02C6DB     LDX   $0B
            CPX   $09
            BCC   L02C728
            BEQ   L02C728
            LDAL  L02CBC2,X
            STA   $03
            LDAL  L02CBC0,X
            STA   $01
            LDY   $0D
            LDX   $03
            JSL   L02C97C
            LSR   $0D
            CLC
            LDA   $01
            ADC   $0D
            STA   $05
            LDA   $03
            ADC   #$0000
            STA   $07
            LDY   #$0002
            LDA   $0D
            STA   [$05],Y
            STA   [$01],Y
            ORA   [$01]
            STA   [$05]
            LDY   $0D
            LDA   $01
            LDX   $03
            JSL   L02C582
            LDY   $0D
            LDA   $05
            LDX   $07
            JSL   L02C582
L02C728     SEC
            LDA   $0B
            SBC   #$0004
            STA   $0B
L02C730     LDA   $0B
            BMI   L02C73B
            CMP   $09
            BCC   L02C73B
            BRL   L02C680
L02C73B     LDX   $09
            LDAL  L02CBC0,X
            STA   $01
            LDAL  L02CBC2,X
            STA   $03
            LDY   $0D
            LDX   $03
            LDA   $01
            JSL   L02C97C
            LDA   [$01]
            AND   #$7FFF
            STA   [$01]
L02C75A     LDA   $01
            LDX   $03
            ORA   $03
            BEQ   L02C76B
            LDA   $01
            CLC
            ADC   #$0004
            BCC   L02C76B
            INX
L02C76B     TAY
            PLD
            TSC
            CLC
            ADC   #$000E
            TCS
            TYA
            RTL

L02C775     CLC
            ADC   #$000E
            BCC   L02C77C
            INX
L02C77C     STAL  L02C84C
            TXA
            STAL  L02C84E
            LDA   #$0008
            STAL  L02C84A
L02C78C     PHA
            PHA
            LDAL  L02C84E
            PHA
            LDAL  L02C84C
            PHA
            LDAL  L02B10D
            PHA
            LDAL  L02C84E
            BNE   L02C7A8
            LDA   #$4010
            BRA   L02C7AB
L02C7A8     LDA   #$4000
L02C7AB     ORAL  L02C84A
            PHA
            PEA   $0000
            PEA   $0000
            _NewHandle
            BCC   L02C7D8
            PLA
            PLA
            LDAL  L02C84A
            AND   #$0008
            BEQ   L02C7D3
            LDA   #$0000
            STAL  L02C84A
            BRA   L02C78C
L02C7D3     LDA   #$0000
            TAX
            RTL

L02C7D8     PHA
            PHA
            TSC
            PHD
            TCD
            LDY   #$0002
            LDA   [$05]
            STA   $01
            LDA   [$05],Y
            STA   $03
            LDA   #$0000
            STA   [$01]
            STA   [$01],Y
            LDAL  L02CBBC
            INY
            INY
            STA   [$01],Y
            LDAL  L02CBBE
            INY
            INY
            STA   [$01],Y
            INY
            INY
            LDA   $05
            STA   [$01],Y
            INY
            INY
            LDA   $07
            STA   [$01],Y
            INY
            INY
            LDA   #$0000
            STA   [$01],Y
            LDAL  L02CBBC
            STA   $05
            LDAL  L02CBBE
            STA   $07
            ORA   $05
            BEQ   L02C82D
            LDY   #$0002
            LDA   $01
            STA   [$05]
            LDA   $03
            STA   [$05],Y
L02C82D     LDA   $01
            STAL  L02CBBC
            LDA   $03
            STAL  L02CBBE
            CLC
            LDA   $01
            ADC   #$000E
            LDX   $03
            BCC   L02C844
            INX
L02C844     PLD
            PLY
            PLY
            PLY
            PLY
            RTL

L02C84A     BRK   $00
L02C84C     BRK   $00
L02C84E     BRK   $00
L02C850     TSC
            SEC
            SBC   #$000C
            TCS
            PHD
            TCD
            LDA   $10
            ORA   $12
            BNE   L02C868
            PEA   $0009
            JSL   L02CD3D
            BRL   L02C8C3
L02C868     JSL   L02CA3A
            LDA   $16
            ORA   $12
            BEQ   L02C894
            LDY   #$0020
L02C875     ASL   $05
            ROL   $07
            ROL   $09
            ROL   $0B
            SEC
            LDA   $09
            SBC   $10
            TAX
            LDA   $0B
            SBC   $12
            BCC   L02C88F
            STX   $09
            STA   $0B
            INC   $05
L02C88F     DEY
            BNE   L02C875
            BEQ   L02C8B0
L02C894     LDA   #$0000
            LDY   #$0010
L02C89A     ASL   $05
            ROL
            SEC
            SBC   $10
            BCS   L02C8A9
            ADC   $10
            DEY
            BNE   L02C89A
            BEQ   L02C8AE
L02C8A9     INC   $05
            DEY
            BNE   L02C89A
L02C8AE     STA   $09
L02C8B0     LDA   $01
            BEQ   L02C8C3
            SEC
            LDA   #$0000
            SBC   $05
            STA   $05
            LDA   #$0000
            SBC   $07
            STA   $07
L02C8C3     LDA   $05
            STA   $14
            LDA   $07
            STA   $16
            LDA   $0C
            STA   $10
            LDA   $0E
            STA   $12
            CLV
            PLD
            TSC
            CLC
            ADC   #$0010
            TCS
            RTL

L02C8DC     TSC
            PHD
            TCD
            INC   $0A
            BNE   L02C8E5
            INC   $0C
L02C8E5     LDA   [$0A]
            AND   #$00FF
            SEC
            SBC   $08
            BPL   L02C8F9
            EOR   #$FFFF
            INC
            LDY   $04
            JSL   L02D1B2
L02C8F9     LDA   [$0A]
            AND   #$00FF
            BEQ   L02C94C
            STA   $08
            INC   $0A
            BNE   L02C908
            INC   $0C
L02C908     LDA   $04
            BEQ   L02C92D
L02C90C     LDA   [$0A]
            AND   #$00FF
            PHA
            JSL   L02CBE8
            INC   $0A
            BNE   L02C91C
            INC   $0C
L02C91C     DEC   $08
            BNE   L02C90C
            LDA   $06
            BEQ   L02C94C
            PEA   $000D
            JSL   L02CBE8
            BRA   L02C94C
L02C92D     LDA   [$0A]
            AND   #$00FF
            PHA
            JSL   L02C07B
            INC   $0A
            BNE   L02C93D
            INC   $0C
L02C93D     DEC   $08
            BNE   L02C92D
            LDA   $06
            BEQ   L02C94C
            PEA   $000D
            JSL   L02C07B
L02C94C     LDA   $02
            STA   $0C
            LDA   $00
            STA   $0A
            PLD
            CLC
            TSC
            ADC   #$000A
            TCS
            RTL

L02C95C     PHA
            JSL   L02CC28
            JSL   L02D00F
            JSL   L02CE93
            PLA
            JSL   GSOS
            DW    $2029            ; Quit
            ADRL  L02C974
L02C974     DW    $0002            ; Parms for Quit
            ADRL  $00000000        ;  path name
            DW    $0000            ;  flags
L02C97C     PHX
            PHA
            LDA   #$0000
            PHA
            PHA
            PHA
            PHA
            TSC
            PHD
            TCD
            TYA
            JSL   L02D03D
            LDAL  L02CBC0,X
            STA   $05
            LDAL  L02CBC2,X
            STA   $07
L02C999     LDA   $05
            CMP   $09
            BNE   L02C9A5
            LDA   $07
            CMP   $0B
            BEQ   L02C9BC
L02C9A5     LDA   $05
            STA   $01
            LDA   $07
            STA   $03
            LDY   #$0004
            LDA   [$01],Y
            STA   $05
            INY
            INY
            LDA   [$01],Y
            STA   $07
            BRA   L02C999
L02C9BC     LDY   #$0004
            LDA   $01
            ORA   $02
            BNE   L02C9D5
            LDA   [$05],Y
            STAL  L02CBC0,X
            INY
            INY
            LDA   [$05],Y
            STAL  L02CBC2,X
            BRA   L02C9DF
L02C9D5     LDA   [$05],Y
            STA   [$01],Y
            INY
            INY
            LDA   [$05],Y
            STA   [$01],Y
L02C9DF     PLD
            TSC
            CLC
            ADC   #$000C
            TCS
            RTL

L02C9E7     TXY
            BEQ   L02C9F6
            BMI   L02C9F2
L02C9EC     ASL
            DEX
            BNE   L02C9EC
            BRA   L02C9F6
L02C9F2     LSR
            INX
            BNE   L02C9F2
L02C9F6     RTL

L02C9F7     TSC
            PHD
            TCD
            LDA   $06
            BPL   L02CA1C
            CMP   #$FFFF
            BNE   L02CA16
            LDX   $04
            CPX   #$FFDE
            BCC   L02CA16
L02CA0A     LDA   $0A
            ASL
            ROR   $0A
            ROR   $08
            INX
            BNE   L02CA0A
            BRA   L02CA2E
L02CA16     STZ   $08
            STZ   $0A
            BRA   L02CA2E
L02CA1C     BNE   L02CA16
            LDX   $04
            BEQ   L02CA2E
            CPX   #$0021
            BCS   L02CA16
L02CA27     ASL   $08
            ROL   $0A
            DEX
            BNE   L02CA27
L02CA2E     LDA   $00
            STA   $04
            LDA   $02
            STA   $06
            PLD
            PLA
            PLA
            RTL

L02CA3A     STZ   $01
            LDA   $16
            BPL   L02CA53
            SEC
            LDA   #$0000
            SBC   $14
            STA   $05
            LDA   #$0000
            SBC   $16
            STA   $07
            INC   $01
            BRA   L02CA59
L02CA53     STA   $07
            LDA   $14
            STA   $05
L02CA59     STZ   $09
            STZ   $0B
            LDA   $12
            BPL   L02CA72
            SEC
            LDA   #$0000
            SBC   $10
            STA   $10
            LDA   #$0000
            SBC   $12
            STA   $12
            DEC   $01
L02CA72     RTL

L02CA73     TXY
            BEQ   L02CA8D
            BPL   L02CA7E
L02CA78     ASL
            INX
            BNE   L02CA78
            BRA   L02CA8D
L02CA7E     BIT   #$8000
            BNE   L02CA88
L02CA83     LSR
            DEX
            BNE   L02CA83
            RTL

L02CA88     SEC
            ROR
            DEX
            BNE   L02CA88
L02CA8D     RTL

L02CA8E     TXY
            BEQ   L02CAB8
            PHA
            PHX
            TSC
            PHD
            TCD
            LDA   #$0000
            LDY   #$0010
L02CA9C     ASL   $03
            ROL
            SEC
            SBC   $01
            BCS   L02CAAB
            ADC   $01
            DEY
            BNE   L02CA9C
            BRA   L02CAB0
L02CAAB     INC   $03
            DEY
            BNE   L02CA9C
L02CAB0     TAX
            LDA   $03
            CLV
            PLD
            PLY
            PLY
            RTL

L02CAB8     PLA
            SEP   #$40
            RTL

L02CABC     PHX
            PHA
            PHD
            TSC
            TCD
            CPX   $03
            BCS   L02CACB
            LDA   $03
            STX   $03
            STA   $05
L02CACB     LDA   #$0000
            LSR   $03
            BCC   L02CAD5
            CLC
            ADC   $05
L02CAD5     ASL   $05
            LSR   $03
            BCC   L02CADE
            CLC
            ADC   $05
L02CADE     ASL   $05
            LSR   $03
            BCC   L02CAE7
            CLC
            ADC   $05
L02CAE7     ASL   $05
            LSR   $03
            BEQ   L02CB1C
            BCC   L02CAF2
            CLC
            ADC   $05
L02CAF2     ASL   $05
            LSR   $03
            BCC   L02CAFB
            CLC
            ADC   $05
L02CAFB     ASL   $05
            LSR   $03
            BCC   L02CB04
            CLC
            ADC   $05
L02CB04     ASL   $05
            LSR   $03
            BCC   L02CB0D
            CLC
            ADC   $05
L02CB0D     ASL   $05
            LSR   $03
            BCC   L02CB16
            CLC
            ADC   $05
L02CB16     ASL   $05
            PLD
            PLX
            PLX
            RTL

L02CB1C     BCC   L02CB21
            CLC
            ADC   $05
L02CB21     PLD
            PLX
            PLX
            RTL

L02CB25     PEA   $0000
            PEA   $0000
            PHX
            PHA
            TSC
            PHD
            TCD
            TXA
            BEQ   L02CB5A
            LDY   #$0020
            JSR   L02CB3C
            BRL   L02CB84
L02CB3C     LDA   $01
            LSR
            BCC   L02CB4E
            CLC
            LDA   $05
            ADC   $0C
            STA   $05
            LDA   $07
            ADC   $0E
            STA   $07
L02CB4E     ROR   $07
            ROR   $05
            ROR   $03
            ROR   $01
            DEY
            BNE   L02CB3C
            RTS

L02CB5A     LDA   $0E
            BEQ   L02CB6E
            LDY   #$0010
            JSR   L02CB3C
            LDA   $05
            STA   $0E
            LDA   $03
            STA   $0C
            BRA   L02CB8C
L02CB6E     LDY   #$0010
            LDX   $01
            STX   $03
L02CB75     LSR   $03
            BCC   L02CB7C
            CLC
            ADC   $0C
L02CB7C     ROR
            ROR   $01
            DEY
            BNE   L02CB75
            STA   $03
L02CB84     LDA   $03
            STA   $0E
            LDA   $01
            STA   $0C
L02CB8C     PLD
            TSC
            CLC
            ADC   #$0008
            TCS
            RTL

L02CB94     TXY
            BEQ   L02CBA3
            BPL   L02CB9F
L02CB99     ASL
            INX
            BNE   L02CB99
            BRA   L02CBA3
L02CB9F     LSR
            DEX
            BNE   L02CB9F
L02CBA3     RTL

L02CBA4     PHA
            PHX
            PHY
            JSL   L02D024
            JSL   L02CE78
            JSL   L02CFE1
            JSL   L02CD14
            JSL   L02CC70
            RTL

L02CBBC     DB    $00
            DB    $00
L02CBBE     DB    $00
            DB    $00
L02CBC0     DB    $00
            DB    $00
L02CBC2     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02CBE4     DB    $00
            DB    $00
L02CBE6     DB    $00
            DB    $00
L02CBE8     JMP   L02CBEB

L02CBEB     TSC
            PHD
            TCD
            LDA   $04
            STAL  L02CC26
            LDAL  L02C578
            STAL  L02CC18
            JSL   GSOS
            DW    $2013            ; Write
            ADRL  L02CC16
            LDA   $02
            STA   $04
            LDA   $01
            STA   $03
            PLD
            TSC
            CLC
            ADC   #$0002
            TCS
            RTL

L02CC16     DW    $0004            ; Parms for Write
L02CC18     DW    $0000            ;  ref num
            ADRL  L02CC26          ;  buffer ptr
            ADRL  $00000001        ;  request count
            ADRL  $00000000        ;  transfer count
L02CC26     DB    $00
            DB    $00
L02CC28     PHB
            PHK
            PLB
            LDA   L02C57A
            BEQ   L02CC40
            LDA   L02C574
            STA   L02CC6E
            JSL   GSOS
            DW    $2014            ; Close
            ADRL  L02CC6C
L02CC40     LDA   L02C57C
            BEQ   L02CC55
            LDA   L02C576
            STA   L02CC6E
            JSL   GSOS
            DW    $2014            ; Close
            ADRL  L02CC6C
L02CC55     LDA   L02C57E
            BEQ   L02CC6A
            LDA   L02C578
            STA   L02CC6E
            JSL   GSOS
            DW    $2014            ; Close
            ADRL  L02CC6C
L02CC6A     PLB
            RTL

L02CC6C     DW    $0001            ; Parms for Close
L02CC6E     DW    $0000            ;  ref num
L02CC70     PHB
            PHK
            PLB
            STZ   L02C46E
            STZ   L02C56E
            STZ   L02C570
            STZ   L02C572
            PEA   $000A
            JSL   L02D04E
            STA   L02C574
            STZ   L02C580
            LDA   L02C574
            STA   L02CCED
            JSL   GSOS
            DW    $2039            ; GetRefInfo
            ADRL  L02CCEB
            BCS   L02CCD5
            LDA   L02CCF7
            CMP   #$0009
            BNE   L02CCB4
            LDA   L02CD01
            AND   #$00FF
            CMP   #$003A
            BNE   L02CCD5
            DEC   L02CCF7
L02CCB4     LDY   #$0008
L02CCB7     LDA   L02CCF7,Y
            CMP   L02CD0A,Y
            BNE   L02CCD5
            DEY
            DEY
            BPL   L02CCB7
            JSL   GSOS
            DW    $2020            ; GetDevNumber
            ADRL  L02CD02
            BCS   L02CCD5
            LDA   L02CD08
            STA   L02C580
L02CCD5     PEA   $000B
            JSL   L02D04E
            STA   L02C576
            PEA   $000C
            JSL   L02D04E
            STA   L02C578
            PLB
            RTL

L02CCEB     DW    $0003            ; Parms for GetRefInfo
L02CCED     DW    $0000            ;  ref num
            DW    $0000            ;  access
            ADRL  L02CCF5          ;  path name
L02CCF5     DB    $0D
            DB    $00
L02CCF7     DB    $00
            DB    $00
            DB    $20
            DB    $20
            DB    $20
            DB    $20
            DB    $20
            DB    $20
            DB    $20
            DB    $20
L02CD01     DB    $20
L02CD02     DW    $0002            ; Parms for GetDevNumber
            ADRL  L02CD0A          ;  device name
L02CD08     DW    $0000            ;  device num
L02CD0A     STRL  '.CONSOLE'
L02CD14     PHB
            PHK
            PLB
            LDA   #$0020
            STA   L02C29D
            STZ   L02C291
            STZ   L02C28F
            STZ   L02C2C1
            STZ   L02C2C3
            STZ   L02C2BD
            STZ   L02C2BF
            STZ   L02C2B7
            STZ   L02C2B9
            STZ   L02C2B3
            STZ   L02C2B5
            PLB
            RTL

L02CD3D     LDA   $04,S
            PHA
            JSL   L02CEA4
            JMPL  L02CD48

L02CD48     PHK
            PLB
            LDA   L02C2C1
            BNE   L02CD52
            BRL   L02CE72
L02CD52     BRA   L02CD6C
L02CD54     STR   'Error occurred at line '
L02CD6C     PEA   ^L02CD54
            PEA   L02CD54-1
            PEA   $0000
            PEA   $0000
            PEA   $0001
            JSL   L02C8DC
            LDA   L02C2C1
            PHA
            PEA   $0001
            PEA   $0000
            PEA   $0001
            JSL   L02D1D4
L02CD90     BRA   L02CDA1
L02CD92     STR   ' in procedure '
L02CDA1     PEA   ^L02CD92
            PEA   L02CD92-1
            PEA   $0000
            PEA   $0000
            PEA   $0001
            JSL   L02C8DC
            PEA   ^L02C2C2
            PEA   L02C2C2
            PEA   $0000
            PEA   $0001
            PEA   $0001
            JSL   L02C8DC
            JSL   L02D204
            LDA   L02C2BD
            ORA   L02C2BF
            BNE   L02CDD6
            BRL   L02CE72
L02CDD6     PEA   $000D
            JSL   L02CBE8
            PEA   $000A
            JSL   L02CBE8
L02CDE4     BRA   L02CDF3
L02CDE6     STR   '  Line  Name'
L02CDF3     PEA   ^L02CDE6
            PEA   L02CDE6-1
            PEA   $0000
            PEA   $0001
            PEA   $0001
            JSL   L02C8DC
L02CE06     BRA   L02CE15
L02CE08     STR   '  ----  ----'
L02CE15     PEA   ^L02CE08
            PEA   L02CE08-1
            PEA   $0000
            PEA   $0001
            PEA   $0001
            JSL   L02C8DC
L02CE28     LDA   L02C2BD
            ORA   L02C2BF
            BEQ   L02CE72
            LDA   L02C2C1
            PHA
            PEA   $0006
            PEA   $0000
            PEA   $0001
            JSL   L02D1D4
L02CE41     BRA   L02CE46
L02CE43     STR   '  '
L02CE46     PEA   ^L02CE43
            PEA   L02CE43-1
            PEA   $0000
            PEA   $0000
            PEA   $0001
            JSL   L02C8DC
            PEA   ^L02C2C2
            PEA   L02C2C2
            PEA   $0000
            PEA   $0001
            PEA   $0001
            JSL   L02C8DC
            JSL   L02D204
            BRA   L02CE28
L02CE72     LDA   #$FFFF
            BRL   L02C95C
L02CE78     PHA
            PHA
            PEA   $0000
            TSC
            PHA
            _FindHandle
            PHD
            TSC
            TCD
            LDA   [$03]
            PLD
            STAL  L02C29F
            PLA
            PLA
            RTL

L02CE93     JSL   L02D19D
            LDAL  L02B10D
            PHA
            _DisposeAll
            RTL

L02CEA4     PHD
            PEA   ^L02CED6
            PEA   L02CED6
            TSC
            TCD
            LDX   $0A
L02CEAF     DEX
            BEQ   L02CEBE
            SEC
            LDA   [$01]
            AND   #$00FF
            ADC   $01
            STA   $01
            BRA   L02CEAF
L02CEBE     DEC   $01
            PEA   $0000
            PEA   $0001
            PEA   $0001
            JSL   L02C8DC
            PLD
            LDA   $02,S
            STA   $04,S
            PLA
            STA   $01,S
            RTL

L02CED6     STR   'Subrange exceeded'
            STR   'File is not open'
            STR   'Read while at end of file'
            STR   'I/O error'
            STR   'Out of memory'
            STR   'EOLN while at end of file'
            STR   'Set overflow'
            STR   'Jump to undefined case statement label'
            STR   'Integer math error'
            STR   'Real math error'
            STR   'Underflow'
            STR   'Overflow'
            STR   'Divide by zero'
            STR   'Inexact'
            STR   'Stack overflow'
            STR   'Stack error'
L02CFE1     LDA   #$0000
            STAL  L02C2B1
            PHA
            _SANEStatus
            PLA
            BNE   L02D00E
            LDAL  L02C29F
            PHA
            CLC
            ADC   #$0100
            STAL  L02C29F
            _SANEStartUp
            LDA   #$0001
            STAL  L02C2B1
L02D00E     RTL

L02D00F     LDAL  L02C2B1
            BEQ   L02D023
            _SANEShutDown
            LDA   #$0000
            STAL  L02C2B1
L02D023     RTL

L02D024     PHK
            PLX
            PLY
            PLA
            STAL  L02C28B
            PLA
            STAL  L02C28D
            PLA
            ORA   #$0100
            STAL  L02B10D
            PHY
            PHX
            PLB
            RTL

L02D03D     LDX   #$0000
            DEC
            LSR
            LSR
            LSR
            BEQ   L02D04D
L02D046     INX
            INX
            INX
            INX
            LSR
            BNE   L02D046
L02D04D     RTL

L02D04E     TSC
            SEC
            SBC   #$000A
            TCS
            PHD
            TCD
            STZ   $01
            LDA   $0E
            ASL
            TAX
            STZ   L02C566,X
            LDA   $0E
            STA   L02D137
            JSL   GSOS
            DW    $2037            ; GetStdRefNum
            ADRL  L02D135
            BCS   L02D07A
            LDA   L02D139
            BEQ   L02D07A
            STA   $01
            BRL   L02D11A
L02D07A     PHA
            PHA
            PEA   $0000
            PEA   $2000
            PHA
            PEA   $0000
            PHA
            PHA
            PEA   ^L02D04E
            PEA   L02D04E
            _FindHandle
            _SetHandleID
            PEA   $C010
            PEA   $0000
            PEA   $0000
            _NewHandle
            PLY
            PLX
            BCS   L02D11A
            STX   $05
            STY   $03
            LDY   #$0002
            LDA   [$03],Y
            STA   $09
            STA   L02D131+2
            STA   L02D13D+2
            STA   L02D147+2
            LDA   [$03]
            STA   $07
            STA   L02D131
            INC
            INC
            STA   L02D13D
            STA   L02D147
            LDA   #$2000
            STA   [$07]
            LDA   $0E
            STA   L02D12F
            JSL   GSOS
            DW    $200A            ; GetPrefix
            ADRL  L02D12D
            BCS   L02D10D
            JSL   GSOS
            DW    $2038            ; GetRefNum
            ADRL  L02D13B
            BCS   L02D0FC
            LDA   L02D141
            STA   $01
            BNE   L02D10D
L02D0FC     JSL   GSOS
            DW    $2010            ; Open
            ADRL  L02D143
            BCS   L02D10D
            LDA   L02D145
            STA   $01
L02D10D     LDA   $05
            PHA
            LDA   $03
            PHA
            _DisposeHandle
L02D11A     LDY   $01
            LDA   $0C
            STA   $0E
            LDA   $0B
            STA   $0D
            PLD
            TSC
            CLC
            ADC   #$000C
            TCS
            TYA
            RTL

L02D12D     DW    $0002            ; Parms for GetPrefix
L02D12F     DW    $0000            ;  prefix num
L02D131     ADRL  $00000000        ;  prefix ptr
L02D135     DW    $0002            ; Parms for GetStdRefNum
L02D137     DW    $0000            ;  prefix num
L02D139     DW    $0000            ;  ref num
L02D13B     DW    $0002            ; Parms for GetRefNum
L02D13D     ADRL  $00000000        ;  path name
L02D141     DW    $0000            ;  ref num
L02D143     DW    $0002            ; Parms for Open
L02D145     DW    $0000            ;  ref num
L02D147     ADRL  $00000000        ;  path name
L02D14B     DW    $0028
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02D175     DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
            DB    $00
L02D19D     PHB
            PHK
            PLB
            STZ   L02CBBC
            STZ   L02CBBE
            LDX   #$0026
L02D1A9     STZ   L02CBC0,X
            DEX
            DEX
            BPL   L02D1A9
            PLB
            RTL

L02D1B2     PHA
            PHD
            TSC
            TCD
            TYA
            BEQ   L02D1C6
L02D1B9     PEA   $0020
            JSL   L02CBE8
            DEC   $03
            BNE   L02D1B9
            BRA   L02D1D1
L02D1C6     PEA   $0020
            JSL   L02C07B
            DEC   $03
            BNE   L02D1C6
L02D1D1     PLD
            PLA
            RTL

L02D1D4     TSC
            PHD
            TCD
            PEA   ^L02D14B
            PEA   L02D14B
            LDA   $0A
            JSL   L02D22D
            PEA   ^L02D14B
            PEA   L02D14B
            LDA   $08
            PHA
            LDA   $06
            PHA
            LDA   $04
            PHA
            JSL   L02C8DC
            LDA   $02
            STA   $0A
            LDA   $00
            STA   $08
            PLD
            PLA
            PLA
            PLA
            PLA
            RTL

L02D204     PHB
            PHK
            PLB
            LDA   L02C2BF
            PHA
            LDA   L02C2BD
            PHA
            TSC
            PHD
            TCD
            LDY   #$0024
L02D215     LDA   [$01],Y
            STA   L02C2BD,Y
            DEY
            DEY
            BPL   L02D215
            LDA   $03
            PHA
            LDA   $01
            PHA
            JSL   L02C1EF
            PLD
            PLA
            PLA
            PLB
            RTL

L02D22D     PHA
            PEA   ^L02D175
            PEA   L02D175
            PEA   $0028
            PEA   $0001
            _Int2Dec
            JMP   L02D244

L02D244     PHD
            TSC
            TCD
            SEP   #$20
            LDX   #$0000
            LDA   #$20
L02D24E     CMPL  L02D175,X
            BNE   L02D257
            INX
            BRA   L02D24E
L02D257     REP   #$20
            TXA
            SEC
            SBC   #$0028
            EOR   #$FFFF
            INC
            SEP   #$20
            CMP   [$06]
            BEQ   L02D26A
            BCS   L02D281
L02D26A     LDY   #$0001
            STA   [$06],Y
L02D26F     LDAL  L02D175,X
            INY
            STA   [$06],Y
            INX
            CPX   #$0028
            BCC   L02D26F
            REP   #$20
            CLV
            BRA   L02D285
L02D281     REP   #$20
            SEP   #$40
L02D285     LDA   $02,S
            STA   $06,S
            LDA   $04,S
            STA   $08,S
            PLD
            PLA
            PLA
            RTL


