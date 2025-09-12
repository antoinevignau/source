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

VILLAGE	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE
	
	@charge_image	#iVILLAGE;#pVILLAGE

	@image	#iVILLAGE;#34095
	@commentaire	#VILLAGE10080
	@inkey
	@image	#iVILLAGE;#32272
	@commentaire	#VILLAGE10090
	@inkey
	@commentaire	#VILLAGE10100
	@inkey
	@commentaire	#VILLAGE10110
	@inkey
	@commentaire	#VILLAGE10120
	@ordre	#2;#VILLAGE10130
	
	lda	t
	cmp	#1
	beq	VILLAGE10030

VILLAGE10020	@image	#iVILLAGE;#27955
	@commentaire	#VILLAGE10140
	@inkey
	@commentaire	#VILLAGE10150
	@inkey
	jmp	DEBUT

VILLAGE10030	@commentaire	#VILLAGE10160
	@inkey
	@commentaire	#VILLAGE10170
	@chance
	
	lda	chance
	cmp	#0
	beq	VILLAGE10050
	
	@commentaire	#VILLAGE10180
	@inkey
	jmp	VILLAGE10020

VILLAGE10050	@image	#iVILLAGE;#29643
	@commentaire	#VILLAGE10190
	@inkey
	@commentaire	#VILLAGE10200
	@ordre	#2;#VILLAGE10210
	
	lda	t
	cmp	#2
	beq	VILLAGE10070

VILLAGE10060	@commentaire	#VILLAGE10220
	@inkey
	jmp	CABANE

VILLAGE10070	lda             #1
                sta             fgFRAME
                
                @window	#1;#theWINDOW4	; change size of window (from 1 to 3)
	@paper	#1;#indexBLACK
	@pen	#1;#indexWHITE
	@commentaire	#VILLAGE10230	; comment does cls
	@inkey
	@commentaire	#VILLAGE10240
	@inkey
	@image	#iVILLAGE;#20052
	@window	#1;#theWINDOW5
	@paper	#1;#indexBLACK
	@pen	#1;#indexWHITE
	@commentaire	#VILLAGE10250	; comment does cls
	@inkey
	jmp	DEBUT

*-------------------------------
* reno
*-------------------------------

pVILLAGE	strl	'@/data/village.bin'

VILLAGE10080	asc	' j'27'etais accueilli au village   par des regards  farouches'00
VILLAGE10090	asc	'on me faisait entrer  sous une    tente ou  je decouvrais       un vieillard  fievreux'00
VILLAGE10100	asc	' il s'27'agissait du  grand chef      que l'27'homme medecine      ne reussissait pas  a guerir'00
VILLAGE10110	asc	' je comprenais alors pourquoi     je n'27'avais pas ete tue'00
VILLAGE10120	asc	'les apaches esperaient me voir faire mieux que leur sorcier'00
VILLAGE10130	asc	'j'27'essayais de le soigner,je refusais'00
VILLAGE10140	asc	'des guerriers  s'27'emparerent demoi et ne me laisserent pas le loisir de voir  le lendemain'00
VILLAGE10150	asc	'   l'27'un d'27'eux  venait de se   procurer un  nouvel objet tres  decoratif  pour sa tunique'00
VILLAGE10160	asc	'   je lui faisais boire une    tisane dont ma mere  m'27'avait        revele le secret'00
VILLAGE10170	asc	'    les soins et l'27'attente     duraient depuis  une dizaine       de jours lorsque...'00
VILLAGE10180	asc	'    le grand chef decedait'00
VILLAGE10190	asc	'le grand chef  se sentit mieux et me remerciait  de l'27'avoir retenu contre le grand manitou'00
VILLAGE10200	asc	'   il me proposait alors de      rester dans la  tribu si           je le desirais'00
VILLAGE10210	asc	'je repartais,je restais avec les apaches'00
VILLAGE10220	asc	' apres avoir  fait mes adieux    je partais  vers l'27'ouest'00
VILLAGE10230	asc	' je venais de  trouver ce que  inconsciemment  je cherchais  - une vie calme  et paisible  au milieu  d'27'un peuple plein de sagesse et de joie de vivre'00
VILLAGE10240	asc	'on m'27'appelait dorenavant grandours en raison de  ma barbe etje prenais pour femme fleur de printemps qui ne tardait pas  a me donner de beaux enfants'00
VILLAGE10250	asc	'f i n'00
