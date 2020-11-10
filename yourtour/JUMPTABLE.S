*
* Your tour of the Apple IIgs
*
* (c) 1989, Apple Computer
* (s) 2020, Antoine Vignau
*

	mx	%00
	rel
	lst	off

*-------------------------------

	use	JUMPTABLE.X
	
*-------------------------------


L0E0000  DS    8
         DW    $0000
         DW    $0001
         DW    ^L0A0D1F
         ADRL  L0A0D1F
L0E0012  ENT
         JSL   $000000
         DW    $0000
         DW    $0001
         DW    $000A
         ADRL  L0A0CE4
L0E0020  ENT
         JSL   $000000
         DW    $0000
         DW    $0001
         DW    $000A
         ADRL  L0A0ED6
L0E002E  ENT
         JSL   $000000
         DW    $0000
         DW    $0001
         DW    $000A
         ADRL  L0A0000
L0E003C  ENT
         JSL   $000000
         DW    $0000
         DW    $0001
         DW    $0009
         ADRL  L090D8F
L0E004A  ENT
         JSL   $000000
         DW    $0000
         DW    $0001
         DW    $0009
         ADRL  L09115C
L0E0058  ENT
         JSL   $000000
         DW    $0000
         DW    $0001
         DW    $0009
         ADRL  L091E8B
L0E0066  ENT
         JSL   $000000
         DW    $0000
         DW    $0001
         DW    $0008
         ADRL  L080000
L0E0074  ENT
         JSL   $000000
         DW    $0000
         DW    $0001
         DW    $0009
         ADRL  L093992
L0E0082  ENT
         JSL   $000000
         DS    4
