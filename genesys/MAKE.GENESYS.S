*
* Genesys v1.2.4
* Make control
*

* Expansion linker file

         DSK   Genesys
         TYP   $B3

* Assemble files

	 XPL
	 
         ASM   GEMAIN.S
         KND   $0000
         SNA   Genesys

         ASM   GESEG3.S
         KND   $0000
         SNA   K_SEIDULE

         ASM   GESEG4.S
         KND   $0000
         SNA   K_SEIDULE

