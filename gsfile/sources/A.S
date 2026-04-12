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

	use	A.X.S
	
GSOS	=	$E100A8

*-----------------------------------

L020000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            PHX
            PHA
            PEA   ^L0F0538
            PEA   L0F0538
            _NewMenu
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            PEA   $0000
            _InsertMenu
            STA   L0F0779
            PHX
            PHA
            PEA   ^L0F04ED
            PEA   L0F04ED
            _NewMenu
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            PEA   $0000
            _InsertMenu
            STA   L0F0779
            PHX
            PHA
            PEA   ^L0F0459
            PEA   L0F0459
            _NewMenu
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            PEA   $0000
            _InsertMenu
            STA   L0F0779
            PHX
            PHA
            PEA   ^L0F03F9
            PEA   L0F03F9
            _NewMenu
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            PEA   $0000
            _InsertMenu
            STA   L0F0779
            PHX
            PHA
            PEA   ^L0F0396
            PEA   L0F0396
            _NewMenu
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            PEA   $0000
            _InsertMenu
            STA   L0F0779
            PHX
            PHA
            PEA   ^L0F02CD
            PEA   L0F02CD
            _NewMenu
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            PEA   $0000
            _InsertMenu
            STA   L0F0779
            PHX
            PHA
            PEA   ^L0F01D6
            PEA   L0F01D6
            _NewMenu
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            PEA   $0000
            _InsertMenu
            STA   L0F0779
            PHX
            PHA
            PEA   ^L0F0161
            PEA   L0F0161
            _NewMenu
            STA   L0F0779
            PLA
            PLX
            PHX
            PHA
            PEA   $0000
            _InsertMenu
            STA   L0F0779
            PEA   $0001
            _FixAppleMenu
            STA   L0F0779
            PHA
            _FixMenuBar
            STA   L0F0779
            PLA
            _DrawMenuBar
            STA   L0F0779
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL


