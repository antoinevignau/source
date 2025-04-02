
* Expansion linker file

         LKV   $2
         VER   $2

         TYP   S16

* Assemble files

         ASM   SEG01
         ASM   SEG02
         ASM   SEG03
         ASM   SEG04
         ASM   SEG05
         ASM   SEG06
         ASM   SEG07
         ASM   SEG08
         ASM   SEG09
         ASM   SEG0A
         ASM   SEG0B
         ASM   SEG0C
         ASM   SEG0D
         ASM   SEG0E
         ASM   SEG0F
         ASM   SEG10
         ASM   SEG11
         ASM   SEG12
         ASM   SEG13
         ASM   SEG14
         ASM   SEG15
         ASM   SEG16
         ASM   SEG17
         ASM   SEG18
         ASM   SEG19
         ASM   SEG1A
         ASM   SEG1B
         ASM   SEG1C
         ASM   SEG1D
         ASM   SEG1E
         ASM   SEG1F
         ASM   SEG20
         ASM   SEG21
         ASM   SEG22
         ASM   SEG23
         ASM   SEG24
         ASM   SEG25
         ASM   SEG26
         ASM   SEG27

* Now link files

         KND   $0000
         LNK   SEG01.L
         SAV   ShufflePuck
         KND   $4401      ; 4401
         LNK   SEG02.L
         SAV   ShufflePuck
         KND   $4401      ; 4401
         LNK   SEG03.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG04.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG05.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG06.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG07.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG08.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG09.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG0A.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG0B.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG0C.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG0D.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG0E.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG0F.L
         SAV   ShufflePuck

         KND   $0000
         LNK   SEG10.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG11.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG12.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG13.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG14.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG15.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG16.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG17.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG18.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG19.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG1A.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG1B.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG1C.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG1D.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG1E.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG1F.L
         SAV   ShufflePuck

         KND   $0000
         LNK   SEG20.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG21.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG22.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG23.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG24.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG25.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG26.L
         SAV   ShufflePuck
         KND   $0000
         LNK   SEG27.L
         SAV   ShufflePuck

         END

* Execute commands

* CMD CRUNCH ShufflePuck
* CMD XPRESS ShufflePuck
