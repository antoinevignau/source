
* Expansion linker file

         dsk	SP
         typ	EXE
         aux	$0100

* Assemble files

         asm	SP1.S
         knd	$0000
         sna	EXE

         asm	SP2.S
         knd	$0000
         sna	PSEG

* END
