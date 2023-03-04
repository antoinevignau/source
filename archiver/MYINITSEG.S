*
* Archiver GS
*
* (c) 1992, Apple Computer, Inc.
* (s) 2023, Antoine Vignau
*

	mx	%00
	rel
	lst	off

*-----------------------------------

	use	4/Mem.Macs
	use	4/Util.Macs

*-----------------------------------

            PHB
            PHK
            PLB
            PEA   $0000
            _PurgeAll
            _CompactMem
            PLB
            RTL


