*
* Apple II diagnostics code
*
* (c) 1983, Apple Computer, Inc.
* (s) 2018, Brutal Deluxe Software
*

	mx	%11
	lst	off
	
	use	EQUATES.S

*---------------------------------------------------------
* Code and data $D000..$DFFF for 1st bank
* Empty FF data $D000..$DFFF for 2nd bank
	
	org	$d000
	put	DIAG18B1.S
	put	DIAG18B2.S

*---------------------------------------------------------
* Code and data $E000..$F7FF for Diag code
* Code and data $F800..$FFFF for Monitor ROM

	org	$e000
	put	DIAG19B.S
	put	MONITORIIE.S
	sav	EPROM
