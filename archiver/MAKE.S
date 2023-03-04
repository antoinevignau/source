
* Expansion linker file

         DSK   Archiver
         TYP   $B3

* Assemble files

         XPL
         
         ASM   MYINITSEG.S
         KND   $0010
         SNA   myInitSeg

         ASM   MAIN.S
         KND   $0000
         SNA   main

         ASM   MYDRVRSEG.S
         KND   $0000
         SNA   myDrvrSeg

         ASM   ARRAYS.S
         KND   $4401
         SNA   arrays

         ASM   GLOBALS.S
         KND   $0400
         SNA   globals

         ASM   MONTECODE.S
         KND   $0000
         SNA   MonteCode

         ASM   DIRECT.S
         KND   $0012
         SNA   Direct

* END
