*
* GS/Paint
* version 1.2
*
* (c) 1986-1987, Version Soft
* (s) 2020, Brutal Deluxe Software
*

	 mx	%00
         rel
	 use	SHUTDOWN.X
	 lst	off
	 
*-------------------------------

	use	4/Ctl.Macs
	use	4/Desk.Macs
	use	4/Dialog.Macs
	use	4/Event.Macs
	use	4/Font.Macs
	use	4/Int.Macs
	use	4/Line.Macs
	use	4/List.Macs
	use	4/Load.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/Misc.Macs
	use	4/Misc.Macs
	use	4/Print.Macs
	use	4/Qd.Macs
	use	4/QdAux.Macs
	use	4/Std.Macs
	use	4/Util.Macs
	use	4/Window.Macs
	
*-------------------------------

         BRA   L0B0004
         LDA   $A5
L0B0004  PHB
         PHK
         PLB
         PEA   ^L01A458
         PEA   L01A458
         _SetCursor
         LDA   $DC
         LDX   $DE
         PHX
         PHA
         PHX
         PHA
         _HUnlock
         _DisposeHandle
         LDA   $E0
         LDX   $E2
         PHX
         PHA
         PHX
         PHA
         _HUnlock
         _DisposeHandle
         LDA   $E4
         LDX   $E6
         PHX
         PHA
         PHX
         PHA
         _HUnlock
         _DisposeHandle
         LDA   $E8
         LDX   $EA
         PHX
         PHA
         PHX
         PHA
         _HUnlock
         _DisposeHandle
         LDA   $EC
         LDX   $EE
         PHX
         PHA
         PHX
         PHA
         _HUnlock
         _DisposeHandle
         LDA   $92
         PHA
         LDA   $90
         PHA
         _CloseWindow
         _DialogShutDown
         _LEShutDown
         _CtlShutDown
         _FMShutDown
         _DeskShutDown
         _MenuShutDown
         _WindShutDown
         _QDAuxShutDown
         _PMShutDown
         _EMShutDown
         _QDShutDown
         _MTShutDown
         _TLShutDown
         LDAL  L01967F
         PHA
         PHA
         _HUnlockAll
         _DisposeAll
         PLB
         RTL

