
* Expansion linker file

         DSK   HyperCardIIGS
         TYP   $B3

*	 XPL
	
* Assemble files

         ASM   FirstSeg.S
         KND   $0010
         SNA   FirstSeg

         ASM   Main.S
         KND   $0000
         SNA   main

         ASM   HyperTable.S
         KND   $4401
         SNA   HyperTable

         ASM   Globals.S
         KND   $0401
         SNA   Globals

         ASM   Direct.S
         KND   $0012
         SNA   Direct

         ASM   HyperLib.S
         KND   $0000
         SNA   HyperLib

         ASM   HyperGrx.S
         KND   $0000
         SNA   HyperGrx

         ASM   HyperTools.S
         KND   $0000
         SNA   HyperTools

         ASM   MainSeg.S
         KND   $0000
         SNA   MainSeg

         ASM   HyperTalk.S
         KND   $0000
         SNA   HyperTalk

         ASM   LowMemCmdF.S
         KND   $0000
         SNA   LowMemCmdF

         ASM   HyperTalk2.S
         KND   $0000
         SNA   HyperTalk2

         ASM   HyperTalk3.S
         KND   $0000
         SNA   HyperTalk3

         ASM   TalkEdit.S
         KND   $0000
         SNA   TalkEdit

         ASM   Eval.S
         KND   $0000
         SNA   Eval

         ASM   Commands.S
         KND   $0000
         SNA   Commands

         ASM   Commands2.S
         KND   $0000
         SNA   Commands

         ASM   Functions.S
         KND   $0000
         SNA   Functions

         ASM   BrowseOnly.S
         KND   $0000
         SNA   BrowseOnly

         ASM   PLib.S
         KND   $0000
         SNA   PLib

         ASM   JumpTable.S
         KND   $0000
         SNA   JumpTable

         ASM   SegInit.S
         KND   $0000
         SNA   SegInit

         ASM   HyperEdit.S
         KND   $0000
         SNA   HyperEdit

         ASM   InfoDialog.S
         KND   $0000
         SNA   InfoDialog

         ASM   Compact.S
         KND   $0000
         SNA   Compact

         ASM   HyperPaint.S
         KND   $0000
         SNA   HyperPaint

         ASM   HyperPnt2.S
         KND   $0000
         SNA   HyperPnt2

         ASM   LowMemCmds.S
         KND   $0000
         SNA   LowMemCmds

         ASM   XWindSeg.S
         KND   $0000
         SNA   XWindSeg

         ASM   HPrintMain.S
         KND   $0000
         SNA   HPrintMain

         ASM   HPrintGrx.S
         KND   $0000
         SNA   HPrintGrx

         ASM   HPrintHF.S
         KND   $0000
         SNA   HPrintHF

         ASM   HPrintDlog.S
         KND   $0000
         SNA   HPrintDlog

         ASM   HPrintRept.S
         KND   $0000
         SNA   HPrintRept

         ASM   HPrintCard.S
         KND   $0000
         SNA   HPrintCard

         ASM   HPrintMix.S
         KND   $0000
         SNA   HPrintMix

* END
