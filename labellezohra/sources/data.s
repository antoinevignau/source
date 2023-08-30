*
* La Belle Zohra
*
* (c) 1992, François Coulon
* (c) 2023, Antoine Vignau & Olivier Zardini
*

	mx    %00

*-----------------------
* ATARI
*-----------------------

*---

* Apple		Atari
* 22	"	7E
* 82	Ç	80
* 88	à	85
* 89	â	83
* 8D	ç	87
* 8E	é	82
* 8F	è	8A
* 90	ê	88
* 91	ë	
* 94	î	8C
* 95	ï	8B
* 99	ô	93
* 9E	û	96
* 9D	ù	97
* CE	OE	B4
* CF	oe	B5

tblATARI	hex	000102030405060708090A0B0C0D0E0F
	hex	101112131415161718191A1B1C1D1E1F
	hex	202122232425262728292A2B2C2D2E2F
	hex	303132333435363738393A3B3C3D3E3F
	hex	404142434445464748494A4B4C4D4E4F
	hex	505152535455565758595A5B5C5D5E5F
	hex	606162636465666768696A6B6C6D6E6F
	hex	707172737475767778797A7B7C7D227F
	hex	82818E898488868D90898F95948D8E8F
	hex	9091929994959E9D98999A9B9C9D9E9F
	hex	A0A1A2A3A4A5A6A7A8A9AAABACADAEAF
	hex	B0B1B2B3CFCEB6B7B8B9BBBABCBDBEBF
	hex	C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF
	hex	D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF
	hex	E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF
	hex	F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF

tblUPPER	hex	000102030405060708090A0B0C0D0E0F
	hex	101112131415161718191A1B1C1D1E1F
	hex	202122232425262728292A2B2C2D2E2F
	hex	303132333435363738393A3B3C3D3E3F
	hex	404142434445464748494A4B4C4D4E4F
	hex	505152535455565758595A5B5C5D5E5F
	hex	604142434445464748494A4B4C4D4E4F	; a-z => A-Z
	hex	505152535455565758595A7B7C7D7E7F
	hex	808182838485868788898A8B8C8D8E8F
	hex	909192939495969798999A9B9C9D9E9F
	hex	A0A1A2A3A4A5A6A7A8A9AAABACADAEAF
	hex	B0B1B2B3B4B5B6B7B8B9BABBBCBDBEBF
	hex	C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF
	hex	D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF
	hex	E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF
	hex	F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF

*-----------------------
* DATA
*-----------------------

DEBUT_DATA	=	*

*--- Mes variables

fgTHEEND	ds	2	; LOGO
i	ds	2
index	ds	2
theX	ds	2
theY	ds	2

*--- Variables du jeu

nombre_indicateurs	=	30	; NOMBRE MAXI D'INDICATEURS
pointeur_indicateurs	=	0	; CLEAR DU NOMBRE D'INDICATEURS
nombre_paragraphes	=	110	; NOMBRE MAXI DE TEXTES

indicateurTEXT	ds	nombre_indicateurs	; NOM DES INDICATEURS UTILISES PAR MOI
indicateur		ds	nombre_indicateurs	; INDICATEUR EN LUI-MEME
paragraphe_lu	ds	nombre_paragraphes
indicateur_paragraphes	ds	nombre_paragraphes	; NUMERO DE L'INDIC CRêE A CHAQUE TEXTE
indicateur_paragraphes_prealables	ds	nombre_paragraphes ; NUMERO DE L'INDIC NECESSAIRE POUR LIRE CE TEXTE

*---

icone_objets	ds	nombre_objets	; ICONES ALLUMêES OU ETEINTES
icone_peches	ds	nombre_peches+1	; (+1 POUR L'INDICATEUR DE SUITE...)

*---

fenetre_x	dw	10,10,10,120,10,10,10,10,10
fenetre_y	dw	100,100,100,10,100,100,100,10,100
fenetre_xx	dw	310,310,310,310,310,310,310,200,310
fenetre_yy	dw	190,190,190,190,190,190,190,190,190

*---

nombre_objets =	8	; NOMBRE D'OBJETS

objetTEXT	da	objetSTR1	; !NOM DE CHAQUE OBJET
	da	objetSTR2
	da	objetSTR3
	da	objetSTR4
	da	objetSTR5
	da	objetSTR6
	da	objetSTR7
	da	objetSTR8
	da	objetSTR9

objetSTR1	asc	"LUNETTES"
objetSTR2	asc	"CUILLERE"
objetSTR3	asc	"FLEUR"
objetSTR4	asc	"CARNET"
objetSTR5	asc	"DICO"
objetSTR6	asc	"BIJOUX"
objetSTR7	asc	"CLES"
objetSTR8	asc	"ARGENT"
objetSTR9	asc	"FIN"

ancien_objet ds	2

objet_x	dw	238,222,195,0,27,131,276,133
objet_y	dw	51,110,0,17,55,32,19,69
objet_xx	dw	283,268,266,57,106,178,319,188
objet_yy	dw	88,151,39,54,103,64,50,101

*---
	
nombre_peches =	7	; NOMBRE DE PECHES

pecheTEXT	da	pecheSTR1	; NOM DE CHAQUE PECHE (+1 POUR L'INDIC SUITE...)
	da	pecheSTR2
	da	pecheSTR3
	da	pecheSTR4
	da	pecheSTR5
	da	pecheSTR6
	da	pecheSTR7
	da	pecheSTR8

pecheSTR1	asc	"ORGUEIL"
pecheSTR2	asc	"AVARICE"
pecheSTR3	asc	"GOURMANDISE"
pecheSTR4	asc	"ENVIE"
pecheSTR5	asc	"LUXURE"
pecheSTR6	asc	"COLERE"
pecheSTR7	asc	"PARESSE"
pecheSTR8	asc	"suite"

peche_x	dw	184,0,46,276,92,138,230
peche_y	dw	162,162,162,162,162,162,162
peche_xx	dw	227,43,89,319,135,181,273
peche_yy	dw	199,199,199,199,199,199,199

*---

bloc_texte	ds	2000
mot	ds	128

*---

paragraphe	ds	nombre_paragraphes	; INDEX DE DES DEBUTS DES PARAGRAPHES
* LOGO paragraphe%(1)=0
pointeur_paragraphes	ds	2
paragraphes_lus	ds	2
reference_objet	ds	nombre_paragraphes	; NUMERO DE L'OBJET ASSOCIE A CHAQUE PARAGRAPHE
reference_peche	ds	nombre_paragraphes	; NUMERO DU PECHE ASSOCIE A CHAQUE PARAGRAPHE

*---

*  DATA 1cemonsi,7500,"ce monsieur!",""
*  DATA 1safemme,7500,"sa femme!",""
*  DATA 1lechame,7500,"le chameau!",""
*  DATA 1smala,7500,"et toute la smala!",""
*  DATA fx_batte,10000,"",""
*  DATA fx_flute,5000,"",""
*  DATA fx_synth,5000,"",""
*  DATA fx_tromp,7500,"",""
*  DATA fx_tromp,10000,"",""
*  DATA FIN,0,"",""
*  '
*  DATA 2coinfli,7500,"des coins oó","les flics ne vont plus"
*  DATA 2kararab,7500,"y'a des quartiers arab'",""
*  DATA 2karbret,7500,"si c'Çtait des quartiers bretons...",""
*  DATA 2gensnan,7500,"some people from Nanterre,","some people from Belleville!"
*  DATA fx_boing,5000,"",""
*  DATA fx_couic,5000,"",""
*  DATA fx_siren,5000,"",""
*  DATA fx_guita,5000,"",""
*  DATA fx_guita,7500,"",""
*  DATA FIN,0,"",""
*  '
*  DATA 3BOPARLE,7500,"ces beaux-parleurs","de la tÇlÇvision?"
*  DATA 3FAITFRA,7500,"qu'est-ce qu'ils ont fait","pour la france?"
*  DATA 3PASMILI,7500,"les trois quarts du temps, y z'ont","pas fait leur service miliaire"
*  DATA 3UNPEUPE,7500,"y sont meme un peu pÇdÇ sur les bords!",""
*  DATA fx_hey,7500,"hey hey hey!",""
*  DATA fx_cuivr,7500,"",""
*  DATA fx_dzoin,7500,"",""
*  DATA fx_dehem,7500,"",""
*  DATA fx_dehem,10000,"",""
*  DATA FIN,0,"",""
*  '
*  DATA 4algefra,7500,"nous n'Çtions pas pour","l'algÇrie francaise"
*  DATA 4algesah,7500,"nous Çtions pour l'algÇrie et","le sahara francais!"
*  DATA 4sousoff,7500,"les sous-off' de la coloniale,","dont j'Çtais"
*  DATA FIN,0,"",""
*  '
*  DATA 5haine,7500,"qui a la haine de l'Çtranger?",""
*  DATA 5terrfra,7500,"la terre de france, elle est","d'abord aux franáais"
*  DATA 5collabo,7500,"on nous parle des collabos,","y z'en ont fait moins"
*  DATA 5clepen,7500,"c'est Le Pen (de ch'val)",""
*  DATA 5antifra,7500,"est anti-franáais",""
*  DATA 5abrutis,7500,"nous sommes des a.....s",""
*  DATA fx_beat,7500,"",""
*  DATA fx_glin1,7500,"",""
*  DATA fx_glin2,7500,"",""
*  DATA FIN,0,"",""

FIN_DATA	=	*
