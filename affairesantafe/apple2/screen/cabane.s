*
* L'affaire Santa Fe
*
* (c) Gilles Blancon
* (c) 1988, Infogrames
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

*-------------------------------
* INTRODUCTION
*-------------------------------

CABANE	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE
	
	@charge_image	#iCABANE;#pCABANE

	@image	#iCABANE;#36713
	@commentaire	#CABANE10160

CABANE10020	@inkey_true	#A$

	lda	A$
	cmp	#0
	bne	CABANE10030

	@image	#iCABANE;#36538
	@temporisation	#150
	@image	#iCABANE;#36363
	@temporisation	#150
	@image	#iCABANE;#36188
	@temporisation	#150
	jmp	CABANE10020

CABANE10030	@commentaire	#CABANE10170
	@ordre	#2;#CABANE10180
	
	lda	t
	cmp	#2
	beq	CABANE10060

CABANE10050	jmp	CHASSEUR

CABANE10060	lda	#1
	sta	maggy
	
	@commentaire	#CABANE10190
	@inkey
	@image	#iCABANE;#33585
	@commentaire	#CABANE10200

CABANE10070	@ordre	#2;#CABANE10210
	
	lda	t
	cmp	#2
	beq	CABANE10100

CABANE10080	@commentaire	#CABANE10220
	@image	#iCABANE;#24751
	@inkey
	@commentaire	#CABANE10230
	@inkey
	@commentaire	#CABANE10240
	@inkey
	@commentaire	#CABANE10250
	@image	#iCABANE;#26463
	@commentaire	#CABANE10260
	@inkey
	jmp	CHASSEUR

CABANE10100	@saisie
	@mot	#8
	beq	CABANE10110
	@mot	#9
	bne	CABANE10070

CABANE10110	@image	#iCABANE;#33205
	@temporisation	#500
	@image	#iCABANE;#32506
	@temporisation	#500
	@commentaire	#CABANE10270
	@inkey
	@commentaire	#CABANE10271

	@image	#iCABANE;#30197
	@inkey
	@commentaire	#CABANE10280
	
CABANE10130	@inkey_true	#A$
	lda	A$
	cmp	#0
	bne	CABANE10140

	@image	#iCABANE;#29371
	@temporisation	#200
	@image	#iCABANE;#28598
	@temporisation	#500

	inc	nb
	lda	nb
	cmp	#4
	bcc	CABANE10130

CABANE10140	@commentaire	#CABANE10290
	@inkey
	@commentaire	#CABANE10300
	@inkey
	jmp	DEBUT

*-------------------------------
* reno
*-------------------------------

pCABANE	strl	'@/data/cabane.bin'

CABANE10160	asc	'   a la sortie d'27'un bois je    decouvrais une cabane brulee'00
CABANE10170	asc	' c'27'etait de la besogne apache  et il ne faisait pas bon de        s'27'attarder par la'00
CABANE10180	asc	'je passais mon chemin,je m'27'approchais'00
CABANE10190	asc	' j'27'avancais prudemment entre      les corps tortures et           les debris fumants'00
CABANE10200	asc	'   a l'27'arriere de la grange    je decouvrais une jeune femme   miraculeusement epargnee'00
CABANE10210	asc	'je la detachais, j'27'avais une autre idee en tete'00
CABANE10220	asc	' apres lui avoir donne a boire elle me racontait ce qu'27'elle        venait de vivre'00
CABANE10230	asc	'les apaches etaient arrives en plein midi et avaient tue et    torture toute sa famille'00
CABANE10240	asc	' elle s'27'etait agenouillee et  avait prie le bon dieu a voix      haute et en chantant'00
CABANE10250	asc	'les apaches l'27'avaient surement     prise pour une folle     ce qui lui avait  sauve la vie'00
CABANE10260	asc	'   apres avoir enterre les    parents de  maggy et son frere   je la prenais en croupe'00
CABANE10270	asc	' elle etait appetissante et ne    semblait pas farouche'00
CABANE10271	asc	' apres l'27'avoir detachee je la couchais a terre et la violais'00
CABANE10280	asc	'  je ne me rendais pas compte     qu'27'elle avait reussi a      s'27'emparer de mon coutelas'00
CABANE10290	asc	' elle me plantait le coutelas   en pleine poitrine puis me        regardait agoniser'00
CABANE10300	asc	' je me souvenais alors de ma  mere qui me recommandait de me       mefier des femmes'00
