*
* Genesys v1.2.4
* Make window
*

* Expansion linker file

         DSK   Window
         TYP   $BC

* Assemble files
	 
         ASM   WINDOW.S
         KND   $0000
         SNA   Window

         ASM   WINSETUP.S
         KND   $0000
         SNA   WindowStup

         ASM   WINCOLOR.S
         KND   $0000
         SNA   ColorStuph

         ASM   WINCONTROL.S
         KND   $0000
         SNA   ControlStu


