
* Expansion linker file

	DSK	AffaireSydney
	TYP	$B3
	AUX	$DB02
         
* Assemble files

	ASM	iigs.s
	KND	$0000
	SNA	Affaire

	ASM	objets.s
	KND	$0001
	SNA	Sydney

	ASM	personnages.s
	KND	$0001
	SNA	Blancon
	
	ASM	sons.s
	KND	$0001
	SNA	Infogrames
	
* END
