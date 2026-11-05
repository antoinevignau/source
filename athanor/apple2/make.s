*
* Athanor
*
* (c) 2014, Safar Games
* (c) 2025, Brutal Deluxe Software
*

* Expansion linker file

	DSK	Athanor
	TYP	$B3
	AUX	$DB02

* Assemble files

	ASM	iigs.s
	KND	$0000
	SNA	Athanor

	ASM	data.s
	KND	$0001
	SNA	Safar

	ASM	textes.s
	KND	$0001
	SNA	Games
