
* Expansion linker file

	DSK	AffaireVeraCruz
	TYP	$B3
	AUX	$DB02
         
* Assemble files

	ASM	iigs.s
	KND	$0000
	SNA	Affaire

	ASM	objets.s
	KND	$0001
	SNA	VeraCruz

*	ASM	objets2.s
*	KND	$0001
*	SNA	Cruz
*
*	ASM	objets3.s
*	KND	$0001
*	SNA	Gilles

	ASM	personnages.s
	KND	$0001
	SNA	Blancon
	
	ASM	sons.s
	KND	$0001
	SNA	Infogrames
	
* END
