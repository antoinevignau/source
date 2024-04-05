*
* Lode Runner
* (c) 1983, Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

	org	$0
	lst	off

*-----------------------------------
* SOUND BANK 1
*-----------------------------------

sndBANK1	ent
	putbin	snd/youwin.snd	; 0000 - 10
	ds	$100		;  4300
	putbin	snd/escalier.snd	; 4400 - 4
	ds	$100		;  4700
	putbin	snd/marche.snd	; 4800 - 5
	ds	$100		;  4f00
	putbin	snd/creuse.snd	; 5000 - 3
	ds	$600		;  6200
	putbin	snd/barre.snd	; 6800 - 2
	ds	$300		;  6d00
	putbin	snd/trou.snd	; 7000 - 9
	ds	$700		;  7900
	putbin	snd/nomorechest.snd	; 8000 - 6
	ds	$800		;  a800
	putbin	snd/tresor.snd	; b000 - 8
	putbin	snd/tombe.snd	; c000 - 7
