
* Expansion linker file

         DSK   TFBD
         TYP   $B3

* Assemble files

	XPL
	
        ASM   DISASM.S
        KND   $1000
        SNA   Disasm

        ASM   TEXT.S
        KND   $1000
        SNA   Text

        ASM   KERNEL.S
        KND   $1000
        SNA   Kernel

        ASM   SCRIPTS.S
        KND   $1000
        SNA   Scripts

* END
