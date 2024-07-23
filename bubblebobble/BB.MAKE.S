*
* Bubble Bobble
*
* (c) 1988, Taito
* (s) 2020, Antoine Vignau
*

	mx	%11
	lst	off

*-------------------------------

	put	BB.EQUATES.S
	
	put	BB.0800.S	; LOGO $0800..
	put	BB.0C00.S	; LOGO $0C00..
	ds	$2000		; LOGO $2000..
	ds	$2000		; LOGO $4000..
	put	BB.6000.S	; LOGO $6000..
	put	BB.9700.S	; LOGO $9700..
	ds	$900		; LOGO $B700..
	ds	$100		; LOGO $D000.. where we should be at $C000
	put	BB.D100.S	; LOGO $D100.. itou
	ds	$500		; LOGO $DB00.. itou
	put	BB.D000.S	; LOGO $D000..
	ds	$1000		; LOGO $E000..
	ds	$800		; LOGO $F000..
	put	BB.F800.S	; LOGO $F800..$FFFF
	
*-------------------------------


