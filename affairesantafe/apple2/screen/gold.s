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

GOLD	@border	#indexWHITE
	@cls	#3
	@pen	#2;#indexORANGE
	
	@charge_image	#iGOLD;#pGOLD

GOLD10010	@image	#iGOLD;#36326
	@commentaire	#GOLD10210
GOLD10020	@ordre	#2;#GOLD10220

GOLD10030	lda	t
	cmp	#2
	beq	GOLD10040
	jmp	GOLD10090

GOLD10040	@image	#iGOLD;#22942
	@commentaire	#GOLD10230
GOLD10050	@ordre	#2;#GOLD10240
	
GOLD10060	lda	t
	cmp	#2
	beq	GOLD10070
	jmp	GOLD10090

GOLD10070	lda	#1
	sta	argent
	
	@image	#iGOLD;#29572
	@commentaire	#GOLD10250
	@inkey
	
GOLD10080	@commentaire	#GOLD10260
	jmp	GOLD10170

GOLD10090	@image	#iGOLD;#34290
	@commentaire	#GOLD10300
GOLD10100	@ordre	#3;#GOLD10310
	
GOLD10110	lda	t
	cmp	#1
	beq	GOLD10120
	cmp	#2
	beq	GOLD10130
	jmp	GOLD10160

GOLD10120	@image	#iGOLD;#32305
	@image	#iGOLD;#31443
	@temporisation	#100
	@image	#iGOLD;#32305
	
	inc	boire
	lda	boire
	cmp	#5
	bne	GOLD10100
	jmp	GOLD10200

GOLD10130	@image	#iGOLD;#20750
	@commentaire	#GOLD10330
	@inkey
	@commentaire	#GOLD10340
	@ordre	#2;#GOLD10350
	
	lda	t
	cmp	#2
	beq	GOLD10150

GOLD10140	@bruitage
	@bruitage
	@image	#iGOLD;#25565
	@commentaire	#GOLD10360
	@inkey
	@commentaire	#GOLD10370
	@inkey
	jmp	DEBUT

GOLD10150	@commentaire	#GOLD10380
	jmp	GOLD10170

GOLD10160	@image	#iGOLD;#27034
	@commentaire	#GOLD10390
	@inkey
	@commentaire	#GOLD10400

GOLD10170	@ordre	#2;#GOLD10270

	lda	t
	cmp	#2
	beq	GOLD10190

GOLD10180	@commentaire	#GOLD10280
	@inkey
	jmp	SHERIF

GOLD10190	@commentaire	#GOLD10290
	@inkey
	jmp	MONTAGNE

GOLD10200	@commentaire	#GOLD10320
	@inkey
	jmp	GOLD10170

*-------------------------------
* reno
*-------------------------------

pGOLD	strl	'@/data/gold.bin'

GOLD10210	asc	'    j'27'arrivais a gold-city        a la tombee de la nuit'00
GOLD10220	asc	'j'27'entrais au saloon,je cherchais une ecurie'00
GOLD10230	asc	'je trouvais une vieille grangeabandonnee au bout de la ville  ou je parquais ma monture'00
GOLD10240	asc	'j'27'allais au saloon,je m'27'endormais dans un coin'00
GOLD10250	asc	' je me couchais sur un tas de    foin et passais une nuit       remplie de cauchemars'00
GOLD10260	asc	'   au matin je me reveillais     neanmoins en pleine forme'00
GOLD10270	asc	'je restais en ville,je poursuivais ma route'00
GOLD10280	asc	'   je me mis a la recherche           d'27'une cantine'00
GOLD10290	asc	'  j'27'arnachais mon cheval et        prenais la direction             des montagnes'00
GOLD10300	asc	' j'27'entrais dans un saloon ou  regnait une ambiance de tripot'00
GOLD10310	asc	'je buvais un verre,je faisais un poker,je montais avec une fille'00
GOLD10320	asc	'au matin je me reveillais dans une ruelle la tete lourde et        les poches vides'00
GOLD10330	asc	'je m'27'installais a une table de  ranchers qui jouaient gros'00
GOLD10340	asc	'   je perdais regulierement        il me fallait reagir'00
GOLD10350	asc	'je tentais un coup,j'27'attendais ma chance'00
GOLD10360	asc	' ils connaissaient le coup et ne me laisserent aucune chance'00
GOLD10370	asc	'je finissais mon aventure sous   un petit tas de terre au       cimetiere de gold-city'00
GOLD10380	asc	'  je me faisais completement   ratisser et au petit matin        j'27'etais sans le sou'00
GOLD10390	asc	'la fille avait  du temperament   et me mit sur les genoux      je succombais au sommeil'00
GOLD10400	asc	'au matin je me reveillais dansson lit plus leger de quelques dollars mais en pleine forme'00
