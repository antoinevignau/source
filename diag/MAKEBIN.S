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
	
	org	$d000
	put	DIAG18B1.S
	put	DIAG19B.S
	put	MONITORIIE.S
	sav	BINARY