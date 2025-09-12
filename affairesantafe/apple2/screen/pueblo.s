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

PUEBLO	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE

	stz	eau

	@charge_image	#iPUEBLO;#pPUEBLO

PUEBLO10010	@image	#iPUEBLO;#35238
	@commentaire	#PUEBLO10200
	@inkey
	@commentaire	#PUEBLO10210
	@inkey
	@commentaire	#PUEBLO10220
	@ordre	#3;#PUEBLO10230

PUEBLO10020	lda	t
	cmp	#1
	beq	PUEBLO10060
	cmp	#2
	beq	PUEBLO10030
	jmp	PUEBLO10120

PUEBLO10030	lda	eau
	cmp	#0
	beq	PUEBLO10050

	@commentaire	#PUEBLO10260
	@chance
	
PUEBLO10040	lda	chance
	cmp	#0
	beq	PUEBLO10050

	@commentaire	#PUEBLO10270
	@inkey
	jmp	INDIEN

PUEBLO10050	@image	#iPUEBLO;#21343
	@commentaire	#PUEBLO10250
	@inkey
	@commentaire	#PUEBLO10251
	@inkey
	jmp	DEBUT

PUEBLO10060	@image	#iPUEBLO;#32568
	@commentaire	#PUEBLO10280

	lda	#100
	sta	phase

PUEBLO10080	@inkey_true	#A$

	lda	A$
	cmp	#0
	beq	PUEBLO10085
	jmp	PUEBLO10120

PUEBLO10085	@image	#iPUEBLO;#31808
*	asl	phase
	@temporisation	phase
	@image	#iPUEBLO;#32190
*	lsr	phase
	@temporisation	phase
	@image	#iPUEBLO;#31466
*	asl	phase
	@temporisation	phase
	@image	#iPUEBLO;#32190
*	lsr	phase
	@temporisation	phase
	
	lda	phase
	sec
	sbc	#5
	sta	phase

PUEBLO10090	lda	phase
	cmp	#30
	bcs	PUEBLO10080

	@inkey

PUEBLO10100	@commentaire	#PUEBLO10290
	@ordre	#2;#PUEBLO10300
	
	lda	t
	cmp	#1
	beq	PUEBLO10110
	jmp	PUEBLO10150

PUEBLO10110	@image	#iPUEBLO;#23426
	@commentaire	#PUEBLO10310
	@inkey
	@commentaire	#PUEBLO10311
	@inkey
	jmp	DEBUT

PUEBLO10120	lda	#1
	sta	eau
	
	@image	#iPUEBLO;#28809
	@commentaire	#PUEBLO10240
	
PUEBLO10130	@inkey_true	#A$
	lda	A$
	cmp	#0
	bne	PUEBLO10140

	@image	#iPUEBLO;#28115
	@temporisation	#100
	@image	#iPUEBLO;#28463
	@temporisation	#100
	jmp	PUEBLO10130

PUEBLO10140	@ordre	#2;#PUEBLO10230

PUEBLO10150	@image	#iPUEBLO;#25989
	@commentaire	#PUEBLO10320

PUEBLO10160	@inkey_true	#A$
	lda	A$
	cmp	#0
	bne	PUEBLO10170
	
	@image	#iPUEBLO;#25665
	@temporisation	#200
	@image	#iPUEBLO;#25017
	@temporisation	#200
	@image	#iPUEBLO;#25341
	@temporisation	#200
	jmp	PUEBLO10160

PUEBLO10170	@commentaire	#PUEBLO10330
	@ordre	#2;#PUEBLO10340
	
	lda	t
	cmp	#2
	beq	PUEBLO10190

PUEBLO10180	jmp	INDIEN
PUEBLO10190	jmp	CABANE

*-------------------------------
* reno
*-------------------------------

pPUEBLO	strl	'@/data/pueblo.bin'

PUEBLO10200	asc	'       enfin le mexique        j'27'entrais avec mefiance dans  le premier  pueblo rencontre'00
PUEBLO10210	asc	'le village avait  l'27'air desertmais je sentais  une multitude   de regards poses sur moi'00
PUEBLO10220	asc	'  j'27'hesitais a m'27'arreter ici   je sentais un danger obscur'00 
PUEBLO10230	asc	' je penetrais dans la cantina,je passais mon chemin,je faisais boire ma monture'00
PUEBLO10240	asc	' j'27'en profitais  pour remplir   ma gourde dans la fontaine'00
PUEBLO10250	asc	'epuise par cette longue marche  je n'27'arrivais pas jusqu'27'au       prochain point d'27'eau'00
PUEBLO10251	asc	' les vautours  connaissent le dicton le malheur des uns fait    le bonheur  des autres'00
PUEBLO10260	asc	'    je quittais  le pueblo        sans perdre un instant'00
PUEBLO10270	asc	'  je continuais  vers le sud'00
PUEBLO10280	asc	' je mangeais  copieusement et    achetais  des provisions'00
PUEBLO10290	asc	'    la nuit allait arriver     devais-je profiter  d'27'un bon   lit  ou reprendre la route'00
PUEBLO10300	asc	'je prenais une chambre,je repartais'00
PUEBLO10310	asc	'  j'27'aurais du  me fier a mon     instinct et me mefier du    tenancier a l'27'air si servile'00
PUEBLO10311	asc	'au cours de la nuit  quelqu'27'un  penetrait  dans ma chambre      et m'27'epinglait  au lit'00
PUEBLO10320	asc	'  je m'27'installais a quelques    miles du pueblo et passais       une nuit  tranquille'00
PUEBLO10330	asc	'le lendemain matin  j'27'hesitais  sur la direction a prendre'00
PUEBLO10340	asc	'je poursuivais vers le sud,je revenais vers l'27'ouest'00
