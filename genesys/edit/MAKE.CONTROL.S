*
* Genesys v1.2.4
* Make control
*

* Expansion linker file

         DSK   Control
         TYP   $BC

* Assemble files

	 XPL
	 
         ASM   MMCONTROL.S
         KND   $0000
         SNA   Control

         ASM   MMDIALOGS.S
         KND   $0000
         SNA   MMDialogs


