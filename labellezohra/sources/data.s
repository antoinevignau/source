*
* La Belle Zohra
*
* (c) 1992, Fran�ois Coulon
* (c) 2023, Antoine Vignau & Olivier Zardini
*

	mx    %00

*-----------------------
* MENU
*-----------------------

strMENU1	str	'1- Musique'
strMENU2	str	'2- Pr'8e'sentation'
strMENU3	str	'3- La Belle Zohra'

*-----------------------
* ATARI
*-----------------------

*---

* Apple		Atari
* 22	"	7E
* 82	�	80
* 88	�	85
* 89	�	83
* 8D	�	87
* 8E	�	82
* 8F	�	8A
* 90	�	88
* 91	�	
* 94	�	8C
* 95	�	8B
* 99	�	93
* 9E	�	96
* 9D	�	97
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

nombre_indicateurs	=	18	; NOMBRE MAXI D'INDICATEURS
nombre_paragraphes	=	65	; NOMBRE MAXI DE TEXTES
nombre_objets	=	8	; NOMBRE D'OBJETS
nombre_peches	=	7	; NOMBRE DE PECHES

*--- Les variables globales

MES_DONNEES	=	*

	asc	"OBJET"
objet	ds	nombre_paragraphes+3	; +2 pour couvrir le texte de fin
	asc	"PECHE"
peche	ds	nombre_paragraphes+3
	asc	"CONDITION"
condition	ds	nombre_paragraphes+3
	asc	"CONSEQUENCE"
consequence	ds	nombre_paragraphes+3

	asc	"TEXTEDEBUT"
texteDEBUT	ds	4
	ds	nombre_paragraphes*4	; long
	ds	4		; la fin
	ds	4		; fin de fichier
	asc	"TEXTELEN"
texteLEN	ds	4
	ds	nombre_paragraphes*4	; long
	ds	4		; la fin
	ds	4		; toujours 0

*--- Les variables qui s'effacent

DEBUT_DATA	=	*

i	ds	2
j	ds	2
index	ds	2
theY	ds	2

*--- Variables du jeu

	asc	"INDICATEUR"
indicateur	ds	nombre_indicateurs+1
	asc	"DEJA_LU"
deja_lu	ds	nombre_paragraphes+3

	asc	"ICONE_OBJETS"
icone_objets	ds	nombre_objets+1	; ICONES ALLUM�ES OU ETEINTES
	asc	"ICONE_PECHES"
icone_peches	ds	nombre_peches+1
objet_selectionne	ds	2	; l'objet selectionne
peche_selectionne	ds	2	; le peche selectionne
texte_selectionne	ds	2	; le texte � afficher
textes_encore_presents	ds	2	; false or true

FIN_DATA	=	*

*--- The Window

theWINDOW	dw	$0050
	dw	%00000000_00100000	; visible only
	ds	4
	ds	4
	ds	2
	ds	2
	ds	2
	ds	2
	ds	4
	ds	2
	ds	2
	ds	2
	ds	2
	ds	2
	ds	2
	ds	2
	ds	2
	ds	2
	ds	2
	ds	4
	ds	2
	ds	4
	ds	4
	ds	4
	dw	0	; content rect
	dw	0
	dw	200
	dw	320
	adrl	$ffffffff
	ds	4
	dw	%00000000_00000000

*--- The Text Edit control

haCONTROL	ds	4	; handle to the control

teCONTROL	dw	16	; pCount
	adrl	1	; ID
teRECT	ds	8	; rect
	adrl	$85000000	; editTextControl
	dw	%00000000_00000000	; flags
	dw	%01110100_00000000	; moreFlags
	ds	4	; refCon
	adrl	%01100100_00010000_00000000_00000000	; textFlags
	ds	8	; indentRect
	adrl	$ffffffff	; vertBar
	ds	2	; vertAmount
	ds	4	; horzBar
	ds	2	; horzAmount
	ds	4	; styleRef
	dw	%00000000_00000101	; textDescriptor
teTEXT	ds	4	; textRef
teLEN	ds	4	; textLength

*---

fenetreRECT	ds	8	; le round rectangle autour du controle
frameRECT	ds	8	; la ligne autour du controle

fenetre_x	dw	0,10,10,10,120,10,10,10,10,10
fenetre_y	dw	0,100,100,100,10,100,100,100,10,100
fenetre_xx	dw	0,310,310,310,310,310,310,310,200,310
fenetre_yy	dw	0,190,190,190,190,190,190,190,190,190

*---

objetTEXT	da	$bdbd	; !NOM DE CHAQUE OBJET
	da	objetSTR1
	da	objetSTR2
	da	objetSTR3
	da	objetSTR4
	da	objetSTR5
	da	objetSTR6
	da	objetSTR7
	da	objetSTR8

objetSTR1	asc	"LUNETTES"
objetSTR2	asc	"CUILLERE"
objetSTR3	asc	"FLEUR"
objetSTR4	asc	"CARNET"
objetSTR5	asc	"DICO"
objetSTR6	asc	"BIJOUX"
objetSTR7	asc	"CLES"
objetSTR8	asc	"ARGENT"

objet_x	dw	0,238,222,195,0,27,131,276,133
objet_y	dw	0,51,110,0,17,55,32,19,69
objet_xx	dw	0,283,268,266,57,106,178,319,188
objet_yy	dw	0,88,151,39,54,103,64,50,101

*---

pecheTEXT	da	$bdbd	; NOM DE CHAQUE PECHE (+1 POUR L'INDIC SUITE...)
	da	pecheSTR1
	da	pecheSTR2
	da	pecheSTR3
	da	pecheSTR4
	da	pecheSTR5
	da	pecheSTR6
	da	pecheSTR7

pecheSTR1	asc	"ORGUEIL"
pecheSTR2	asc	"AVARICE"
pecheSTR3	asc	"GOURMANDISE"
pecheSTR4	asc	"ENVIE"
pecheSTR5	asc	"LUXURE"
pecheSTR6	asc	"COLERE"
pecheSTR7	asc	"PARESSE"

peche_x	dw	0,184,0,46,276,92,138,230
peche_y	dw	0,162,162,162,162,162,162,162
peche_xx	dw	0,227,43,89,319,135,181,273
peche_yy	dw	0,199,199,199,199,199,199,199

*--- Sound files
* SNDxy.SND where x is the scene, y the file index (0..9)

tblSND	da	sndPART1
	da	sndPART2
	da	sndPART3
	da	sndPART4
	da	sndPART5
	dw	-1

sndPART1	da	snd10
	da	snd11
	da	snd12
	da	snd13
	da	snd14
	da	snd15
	da	snd16
	da	snd17
	da	snd18
	dw	-1
	
sndPART2	da	snd20
	da	snd21
	da	snd22
	da	snd23
	da	snd24
	da	snd25
	da	snd26
	da	snd27
	da	snd28
	dw	-1
	
sndPART3	da	snd30
	da	snd31
	da	snd32
	da	snd33
	da	snd34
	da	snd35
	da	snd36
	da	snd37
	da	snd38
	dw	-1
	
sndPART4	da	snd40
	da	snd41
	da	snd42
	dw	-1
	
sndPART5	da	snd50
	da	snd51
	da	snd52
	da	snd53
	da	snd54
	da	snd55
	da	snd56
	da	snd57
	da	snd58
	dw	-1

* 10 1cemonsi,7500,"ce monsieur!",""
* 11 1safemme,7500,"sa femme!",""
* 12 1lechame,7500,"le chameau!",""
* 13 1smala,7500,"et toute la smala!",""
* 14 fx_batte,10000,"",""
* 15 fx_flute,5000,"",""
* 16 fx_synth,5000,"",""
* 17 fx_tromp,7500,"",""
* 18 fx_tromp,10000,"",""

snd10	asc	'10'
	dw	217
	str	'ce monsieur!'
	str	''
snd11	asc	'11'
	dw	217
	str	'sa femme!'
	str	''
snd12	asc	'12'
	dw	217
	str	'le chameau!'
	str	''
snd13	asc	'13'
	dw	217
	str	'et toute la smala!'
	str	''
snd14	asc	'14'
	dw	290
	str	''
	str	''
snd15	asc	'15'
	dw	145
	str	''
	str	''
snd16	asc	'16'
	dw	145
	str	''
	str	''
snd17	asc	'17'
	dw	217
	str	''
	str	''
snd18	asc	'18'
	dw	290
	str	''
	str	''

* 20 2coinfli,7500,"des coins o�","les flics ne vont plus"
* 21 2kararab,7500,"y'a des quartiers arab'",""
* 22 2karbret,7500,"si c'�tait des quartiers bretons...",""
* 23 2gensnan,7500,"some people from Nanterre,","some people from Belleville!"
* 24 fx_boing,5000,"",""
* 25 fx_couic,5000,"",""
* 26 fx_siren,5000,"",""
* 27 fx_guita,5000,"",""
* 28 fx_guita,7500,"",""

snd20	asc	'20'
	dw	217
	str	'des coins o'9d
	str	'les flics ne vont plus'
snd21	asc	'21'
	dw	217
	str	'y'27'a des quartiers arab'
	str	''
snd22	asc	'22'
	dw	217
	str	'si c'278e'tait des quartiers bretons...'
	str	''
snd23	asc	'23'
	dw	217
	str	'some people from Nanterre'
	str	'some people from Belleville!'
snd24	asc	'24'
	dw	145
	str	''
	str	''
snd25	asc	'25'
	dw	145
	str	''
	str	''
snd26	asc	'26'
	dw	145
	str	''
	str	''
snd27	asc	'27'
	dw	145
	str	''
	str	''
snd28	asc	'28'
	dw	217
	str	''
	str	''

* 30 3BOPARLE,7500,"ces beaux-parleurs","de la t�l�vision?"
* 31 3FAITFRA,7500,"qu'est-ce qu'ils ont fait","pour la france?"
* 32 3PASMILI,7500,"les trois quarts du temps, y z'ont","pas fait leur service miliaire"
* 33 3UNPEUPE,7500,"y sont meme un peu p�d� sur les bords!",""
* 34 fx_hey,7500,"hey hey hey!",""
* 35 fx_cuivr,7500,"",""
* 36 fx_dzoin,7500,"",""
* 37 fx_dehem,7500,"",""
* 38 fx_dehem,10000,"",""

snd30	asc	'30'
	dw	217
	str	'ces beaux-parleurs'
	str	'de la t'8e'l'8e'vision?'
snd31	asc	'31'
	dw	217
	str	'qu'27'est-ce qu'27'ils ont fait'
	str	'pour la france?'
snd32	asc	'32'
	dw	217
	str	'les trois quarts du temps, y z'27'ont'
	str	'pas fait leur service militaire'
snd33	asc	'33'
	dw	217
	str	'y sont meme un peu p'8e'd'8e' sur les bords!'
	str	''
snd34	asc	'34'
	dw	217
	str	'hey hey hey!'
	str	''
snd35	asc	'35'
	dw	217
	str	''
	str	''
snd36	asc	'36'
	dw	217
	str	''
	str	''
snd37	asc	'37'
	dw	217
	str	''
	str	''
snd38	asc	'38'
	dw	290
	str	''
	str	''
	

* 40 4algefra,7500,"nous n'�tions pas pour","l'alg�rie francaise"
* 41 4algesah,7500,"nous �tions pour l'alg�rie et","le sahara francais!"
* 42 4sousoff,7500,"les sous-off' de la coloniale,","dont j'�tais"

snd40	asc	'40'
	dw	217
	str	'nous n'278e'tions pas pour'
	str	'l'27'alg'8e'rie francaise'
snd41	asc	'41'
	dw	217
	str	'nous '8e'tions pour l'27'alg'8e'rie et'
	str	'le sahara francais!'
snd42	asc	'42'
	dw	217
	str	'les sous-off de la coloniale'
	str	'dont j'278e'tais'

* 50 5haine,7500,"qui a la haine de l'�tranger?",""
* 51 5terrfra,7500,"la terre de france, elle est","d'abord aux fran�ais"
* 52 5collabo,7500,"on nous parle des collabos,","y z'en ont fait moins"
* 53 5clepen,7500,"c'est Le Pen (de ch'val)",""
* 54 5antifra,7500,"est anti-fran�ais",""
* 55 5abrutis,7500,"nous sommes des a.....s",""
* 56 fx_beat,7500,"",""
* 57 fx_glin1,7500,"",""
* 58 fx_glin2,7500,"",""

snd50	asc	'50'
	dw	217
	str	'qui a la haine de l'278e'tranger?'
	str	''
snd51	asc	'51'
	dw	217
	str	'la terre de france, elle est'
	str	'd'27'abord aux fran'8d'ais'
snd52	asc	'52'
	dw	217
	str	'on nous parle des collabos'
	str	'y z'27'en ont fait moins'
snd53	asc	'53'
	dw	217
	str	'c'27'est Le Pen (de ch'27'val)'
	str	''
snd54	asc	'54'
	dw	217
	str	'est anti-fran'8d'ais'
	str	''
snd55	asc	'55'
	dw	217
	str	'nous sommes des a.....s'
	str	''
snd56	asc	'56'
	dw	217
	str	''
	str	''
snd57	asc	'57'
	dw	217
	str	''
	str	''
snd58	asc	'58'
	dw	217
	str	''
	str	''

*--- Donnees Sound Tool Set

waveSTART	ds	4	; waveStart (long)
waveSIZE	ds	2	; waveSize en octets
waveFREQ	dw	214	; freqOffset

tblSTR1	ds	10*2	; pointeur sur la premi�re phrase
tblSTR2	ds	10*2	; pointeur sur la seconde phrase
tblSIZE	ds	10*2	; taille de chaque son
tblFREQ	ds	10*2	; fr�quence de chaque son
sndKEY	ds	10*2	; FALSE: not pressed, TRUE: key pressed

fgSND	ds	2	; 0 means no sound
zikPLAY	ds	2
zikMUSIC	ds	4
sndVECTOR	ds	4
zikPAGE	ds	2
ptrMUSIC	ds	4
zikPTR	ds	4
fgPAGE	ds	2
whichSND	ds	2
