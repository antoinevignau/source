
* Expansion linker file

         DSK   PAINT2.SYS16
         TYP   $B3

* Assemble files

         ASM   MAIN.S
         KND   $0000
         SNA   MAIN

         ASM   INIT.S
         KND   $8000
         SNA   INIT

         ASM   EDITCOLOR.S
         KND   $8000
         SNA   EDITCOLOR

         ASM   EDITBRUSH.S
         KND   $8000
         SNA   EDITBRUSH

         ASM   EDITMIROR.S
         KND   $8000
         SNA   EDITMIROR

         ASM   EDITPAT.S
         KND   $8000
         SNA   EDITPAT

         ASM   PALETTE.S
         KND   $8000
         SNA   PALETTE

         ASM   ANIMATION.S
         KND   $8000
         SNA   ANIMATION

         ASM   SEARCHC.S
         KND   $8000
         SNA   SEARCHC

         ASM   FULLSCREEN.S
         KND   $8000
         SNA   FULLSCREEN

         ASM   SHUTDOWN.S
         KND   $8000
         SNA   SHUTDOWN

         ASM   SHOWPAGE.S
         KND   $8000
         SNA   SHOWPAGE

* END
