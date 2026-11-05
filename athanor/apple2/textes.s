*
* Athanor
*
* (c) 2014, Safar Games
* (c) 2025, Brutal Deluxe Software
*

	mx	%00
	lst	off

	use	externals.s

*--- Les accents

* Les accents (encore et toujours)
*
* à	88
* â	89
* ä	8a
* ç	8d
* é	8e
* è	8f
* ê	90
* ë	91
* î	94
* ï	95
* ô	99
* ù	9d
* û	9e
* (c) 	a9 (only c)
* oe	cf
* "	22

*----------------------- Print opcodes

eEOD	=	0
eINK	=	1
ePAPER	=	2
ePEN	=	3
eLOCATE	=	4
eBORDER	=	5
eCLS	=	6
eMODE	=	7
eWAIT	=	8
eSOUND	=	9

*-----------------------------------
* SOFTSWITCHES AND FRIENDS
*-----------------------------------

chrOUI	=	'O'
chrNON	=	'N'

*-----------------------------------
* LES TABLEAUX DU JEU
*-----------------------------------

*-----------------------------------
* LES OVERLAYS DES IMAGES
*-----------------------------------

*  2 FILIP
*  3 RAMP
*  8 REMI35
* 10 PACO

tblGS$	ent
	ds	4
	ds	4
	ds	4
	ds	4
	adrl	COD5
	adrl	SALVA
	adrl	COD6
	adrl	PAYS
	ds	4
	adrl	GRILLE
	ds	4
	adrl	COD0
	adrl	LAD
	adrl	CLOCHE
	adrl	ZEPH
	adrl	LANT
	adrl	LIVRO
	adrl	LIVRCOD2
	adrl	COFFREF
	adrl	COFFREO
	adrl	D85F
	adrl	D85O
	adrl	SEAUP
	adrl	SEAUV
	adrl	STONE
	adrl	BARREH
	adrl	BARREB
	ds	4

*------------------------------
* LE VOCABULAIRE DU JEU
*------------------------------

tblV$	ent
	str	'VA'	;  0
	str	'ALLER'	;  1
	str	'AVANCER'	;  2
	str	'APPROCHER'	;  3
	str	'EXAMINER'	;  4
	str	'REGARDER'	;  5
	str	'FOUILLER'	;  6
	str	'FERMER'	;  7
	str	'RAMASSER'	;  8
	str	'PRENDRE'	;  9
	str	'DONNER'	;  A
	str	'SONNER'	;  B
	str	'SUIVRE'	;  C
	str	'PARLER'	;  D
	str	'LANCER'	;  E
	str	'JETER'	;  NEW
	str	'DETACHER'	;  F
	str	'ENLEVER'	; 10
	str	'COMBINER'	; 11
	str	'ASSEMBLER'	; 12
	str	'ENTRER'	; 13
	str	'APPUYER'	; 14
	str	'PRESSER'	; 15
	str	'TAPER'	; 16
	str	'REPONDRE'	; 17
	str	'ACCROCHER'	; 18
	str	'POSER'	; 19
	str	'UTILISER'	; 1A
	str	'ECOUTER'	; 1B
	str	'TIRER'	; 1C
	str	'OUVRIR'	; 1D
	str	'MONTER'	; 1E
	str	'GRIMPER'	; 1F
	str	'ATTENDRE'	; 20
	str	'PRIER'	; 21
	str	'VIDER'	; 22
	str	'NORD'	; 23
	str	'N'	; 24
	str	'SUD'	; 25
	str	'S'	; 26
	str	'SETH'	; 27
	str	'S+E+T+H'	; 28
	str	'DROITE'	; 29
	str	'EST'	; 2A
	str	'E'	; 2B
	str	'MONTRER'	; 2C
	str	'GAUCHE'	; 2D
	str	'OUEST'	; 2E
	str	'O'	; 2F
	str	'BROUSSAILLE'	; 30
	str	'BROUSSAILLES'	; NEW
	str	'BUISSON'	; 31
	str	'MURIER'	; 32
	str	'TALUS'	; 33
	str	'FRUIT'	; 34
	str	'FRUITS'	; NEW
	str	'MURE'	; NEW
	str	'MURES'	; NEW
	str	'GRILLE'	; 35
	str	'OS'	; 36
	str	'SQUELETTE'	; 37
	str	'CADAVRE'	; 38
	str	'SOL'	; 39
	str	'ALENTOUR'	; 3A
	str	'MUR'	; 3B
	str	'CLOCHE'	; 3C
	str	'CLOCHETTE'	; NEW
	str	'MOINE'	; 3D
	str	'FRERE'	; 3E
	str	'CELLULE'	; 3F
	str	'PIECE'	; 40
	str	'CEINTURE'	; 41
	str	'CEINTURE1'	; NEW
	str	'CORDE'	; 42
	str	'CEINTURE2'	; 43
	str	'PAILLASSE'	; 44
	str	'LIT'	; 45
	str	'SERRURE'	; 46
	str	'CLEF'	; 47
	str	'CLE'	; NEW
	str	'CLEF-NUE'	; NEW
	str	'CLE-NUE'	; NEW
	str	'MORCEAU'	; 48
	str	'METAL'	; 49
	str	'METALLIQUE'	; 4A
	str	'CLEF-ROSACE'	; 4B
	str	'CLE-ROSACE'	; NEW
	str	'PIERRE'	; 4C
	str	'PIERRES'	; NEW
	str	'VOIX'	; 4D
	str	'DISCUSSION'	; 4E
	str	'PUITS'	; 4F
	str	'MARGELLE'	; 50
	str	'PORTE'	; 51
	str	'BARRE'	; 52
	str	'TREFLE'	; 53
	str	'FOND'	; 54
	str	'COLONNE'	; 55
	str	'HERSE'	; 56
	str	'CAILLOU'	; 57
	str	'CAILLOUX'	; NEW
	str	'PAYSANNE'	; 58
	str	'FEMME'	; 59
	str	'PENDENTIF'	; 5A
	str	'COLLIER'	; 5B
	str	'TABLE'	; 5C
	str	'USTENSILE'	; 5D
	str	'POT'	; 5E
	str	'JARRE'	; 5F
	str	'MORTIER'	; 60 
	str	'PILON'  	; 61 
	str	'POUDRE' 	; 62 
	str	'VIERGE' 	; 63 
	str	'STATUE' 	; 64 
	str	'MUE'    	; 65 
	str	'PEAU'   	; 66 
	str	'SERPENT'	; 67 
	str	'ETABLI' 	; 68 
	str	'ETAGERE'	; 69 
	str	'BOURSE' 	; 6A 
	str	'BOURSES' 	; NEW 
	str	'LANIERE'	; 6B 
	str	'AUTEL'  	; 6C 
	str	'TOMBEAU'	; 6D 
	str	'TOMBE'  	; 6E 
	str	'NICHE'  	; 6F 
	str	'YEUX'   	; 70 
	str	'OEIL'   	; 71 
	str	'COFFRE' 	; 72 
	str	'ROND'   	; 73 
	str	'FENDU'  	; 74 
	str	'ESCALIER'	; 75
	str	'TIGE'   	; 76 
	str	'ANNEAU' 	; 77 
	str	'CHAINETTE'	; 78
	str	'PARCHEMIN1'	; 79 
	str	'PARCHEMIN2'	; 7A
	str	'PARCHEMIN3'	; 7B
	str	'CORBEAU'	; 7C 
	str	'OISEAU' 	; 7D 
	str	'CLOCHE-CHAINEE'	; 7E
	str	'LANTERNE'	; 7F
	str	'DEBRIS' 	; 80 
	str	'PUPITRE'	; 81 
	str	'LIVRE'  	; 82 
	str	'LIVRES'	; NEW
	str	'ECHELLE'	; 83 
	str	'PETALE' 	; 84 
	str	'PETALE1' 	; NEW
	str	'MANUSCRIT'	; 85
	str	'PETALE2'	; 86 
	str	'PETALE3'	; 87 
	str	'SEAU'   	; 88 
	str	'CORDE-SEAU'	; NEW
	str	'MAIN'   	; 89 
	str	'6502'   	; 8A 
	str	'6+5+0+2'	; 8B 
	str	'MEURTRIERE'	; 8C
	str	'PLANTE' 	; 8D
	str	'FLACON' 	; 8E 
	str	'INVENTAIRE'	; 8F
	str	'INVENT' 	; 90 
	str	'I'      	; 91 
	str	'ISSUE'  	; 92 
	str	'ISSUES' 	; 93 
	str	'DIRECTION'	; 94
	str	'DIRECTIONS'	; 95
	str	'CHARGER'	; 96 
	str	'LOAD'   	; 97 
	str	'SAUVER' 	; 98 
	str	'ENREGISTRER'	; 99
	str	'SAVE'   	; 9A 
	str	'QUITTER'	; 9B 
	str	'QUIT'   	; 9C 
	str	'RECOMMENCER'	; 9D
	str	'REJOUER'	; 9E 
	str	'REPLAY' 	; 9F 
	str	'RESTART'	; A0 
	str	'REMPLISSAGE'	; A1
	dfb	eEOD	; end of string table

tblVP$	ent		; value of each word
	dw	$2	;  0 VA
	dw	$2	;  1 ALLER
	dw	$2	;  2 AVANCER
	dw	$2	;  3 APPROCHER
	dw	$4	;  4 EXAMINER
	dw	$4	;  5 REGARDER
	dw	$6	;  6 FOUILLER
	dw	$7	;  7 FERMER
	dw	$8	;  8 RAMASSER
	dw	$8	;  9 PRENDRE
	dw	$10	;  A DONNER
	dw	$11	;  B SONNER
	dw	$1A	;  C SUIVRE
	dw	$12	;  D PARLER
	dw	$17	;  E LANCER
	dw	$17	;  JETER
	dw	$18	;  F DETACHER
	dw	$18	; 10 ENLEVER
	dw	$19	; 11 COMBINER
	dw	$19	; 12 ASSEMBLER
	dw	$13	; 13 ENTRER
	dw	$14	; 14 APPUYER
	dw	$14	; 15 PRESSER
	dw	$14	; 16 TAPER
	dw	$15	; 17 REPONDRE
	dw	$16	; 18 ACCROCHER
	dw	$16	; 19 POSER
	dw	$20	; 1A UTILISER
	dw	$21	; 1B ECOUTER
	dw	$22	; 1C TIRER
	dw	$30	; 1D OUVRIR
	dw	$31	; 1E MONTER
	dw	$31	; 1F GRIMPER
	dw	$32	; 20 ATTENDRE
	dw	$32	; 21 PRIER
	dw	$33	; 22 VIDER
	dw	$40	; 23 nord
	dw	$40	; 24 n
	dw	$80	; 25 sud
	dw	$80	; 26 s
	dw	$90	; 27 seth
	dw	$90	; 28 s+e+t+h
	dw	$100	; 29 droite
	dw	$100	; 2A est
	dw	$100	; 2B e
	dw	$150	; 2C montrer
	dw	$200	; 2D gauche
	dw	$200	; 2E ouest
	dw	$200	; 2F o
	dw	$1000	; 30 broussaille
	dw	$1000	; BROUSSAILLES
	dw	$1000	; 31 buisson
	dw	$1000	; 32 murier
	dw	$1000	; 33 talus
	dw	$995	; 34 fruit
	dw	$995	; FRUITS
	dw	$995	; MURE
	dw	$995	; MURES
	dw	$1001	; 35 grille
	dw	$1002	; 36 os
	dw	$1002	; 37 squelette
	dw	$1002	; 38 cadavre
	dw	$1003	; 39 sol
	dw	$1003	; 3A alentour
	dw	$1004	; 3B mur
	dw	$1005	; 3C cloche
	dw	$1005	; CLOCHETTE
	dw	$1006	; 3D MOINE
	dw	$1006	; 3E FRERE
	dw	$1007	; 3F CELLULE
	dw	$1007	; 40 PIECE
	dw	$1008	; 41 CEINTURE
	dw	$1008	; CEINTURE1
	dw	$1008	; 42 CORDE
	dw	$1008	; 43 CEINTURE2
	dw	$1009	; 44 PAILLASSE
	dw	$1009	; 45 LIT
	dw	$100A	; 46 SERRURE
	dw	$1010	; 47 CLEF
	dw	$1010	; CLE
	dw	$1010	; CLEF-NUE
	dw	$1010	; CLE-NUE
	dw	$100B	; 48 MORCEAU
	dw	$100B	; 49 METAL
	dw	$100B	; 4A METALLIQUE
	dw	$100C	; 4B CLEF-ROSACE
	dw	$100C	; CLE-ROSACE
	dw	$1011	; 4C PIERRE
	dw	$1011	; PIERRES
	dw	$1015	; 4D VOIX
	dw	$1015	; 4E DISCUSSION
	dw	$1016	; 4F PUITS
	dw	$1016	; 50 MARGELLE
	dw	$101A	; 51 PORTE
	dw	$101B	; 52 BARRE
	dw	$1017	; 53 TREFLE
	dw	$1019	; 54 FOND
	dw	$1020	; 55 COLONNE
	dw	$1021	; 56 HERSE
	dw	$1022	; 57 CAILLOU
	dw	$1022	; CAILLOUX
	dw	$1068	; 58 PAYSANNE
	dw	$1068	; 59 FEMME
	dw	$1024	; 5A PENDENTIF
	dw	$1025	; 5B COLLIER
	dw	$1026	; 5C TABLE
	dw	$1027	; 5D USTENSILE
	dw	$1028	; 5E POT
	dw	$1028	; 5F JARRE
	dw	$1029	; 60 MORTIER
	dw	$1030	; 61 PILON
	dw	$102A	; 62 POUDRE
	dw	$102B	; 63 VIERGE
	dw	$102B	; 64 STATUE
	dw	$102C	; 65 MUE
	dw	$102C	; 66 PEAU
	dw	$102C	; 67 SERPENT
	dw	$1031	; 68 ETABLI
	dw	$1032	; 69 ETAGERE
	dw	$1033	; 6A BOURSE
	dw	$1033	; BOURSES
	dw	$1034	; 6B LANIERE
	dw	$1035	; 6C AUTEL
	dw	$1036	; 6D TOMBEAU
	dw	$1036	; 6E TOMBE
	dw	$1037	; 6F NICHE
	dw	$1038	; 70 YEUX
	dw	$1038	; 71 OEIL
	dw	$1039	; 72 COFFRE
	dw	$1040	; 73 ROND
	dw	$1041	; 74 FENDU
	dw	$1042	; 75 ESCALIER
	dw	$1043	; 76 TIGE
	dw	$1044	; 77 ANNEAU
	dw	$1045	; 78 CHAINETTE
	dw	$1046	; 79 PARCHEMIN1
	dw	$1047	; 7A PARCHEMIN2
	dw	$1048	; 7B PARCHEMIN3
	dw	$1071	; 7C CORBEAU
	dw	$1071	; 7D OISEAU
	dw	$104A	; 7E CLOCHE-CHAINEE
	dw	$1050	; 7F LANTERNE
	dw	$1051	; 80 DEBRIS
	dw	$1052	; 81 PUPITRE
	dw	$1053	; 82 LIVRE
	dw	$1053	; LIVRES
	dw	$1054	; 83 ECHELLE
	dw	$1055	; 84 PETALE
	dw	$1055	; PETALE1
	dw	$1056	; 85 MANUSCRIT
	dw	$1055	; 86 PETALE2
	dw	$1055	; 87 PETALE3
	dw	$1058	; 88 SEAU
	dw	$2060	; CORDE-SEAU
	dw	$1071	; 89 MAIN
	dw	$1066	; 8A 6502
	dw	$1066	; 8B 6+5+0+2
	dw	$1067	; 8C MEURTRIERE
	dw	$1069	; 8D PLANTE
	dw	$1070	; 8E FLACON
	dw	$3333	; 8F INVENTAIRE
	dw	$3333	; 90 INVENT
	dw	$3333	; 91 I
	dw	$4444	; 92 ISSUE
	dw	$4444	; 93 ISSUES
	dw	$4444	; 94 DIRECTION
	dw	$4444	; 95 DIRECTIONS
	dw	$5555	; 96 CHARGER
	dw	$5555	; 97 LOAD
	dw	$6666	; 98 SAUVER
	dw	$6666	; 99 ENREGISTRER
	dw	$6666	; 9A SAVE
	dw	$7777	; 9B QUITTER
	dw	$7777	; 9C QUIT
	dw	$8888	; 9D RECOMMENCER
	dw	$8888	; 9E REJOUER
	dw	$8888	; 9F REPLAY
	dw	$8888	; A0 RESTART
	dw	$9999	; A1 REMPLISSAGE
	
*------------------------------
* LE TABLEAU T$
*------------------------------

tblT$	ent
	adrl	T$0,T$1,T$2,T$3,T$4
	adrl	T$5,T$6,T$7,T$8,T$9

T$0	asc	'0123456789'00
T$1	asc	'1234567890'00
T$2	asc	'2345678901'00
T$3	asc	'3456789012'00
T$4	asc	'4567890123'00
T$5	asc	'5678901234'00
T$6	asc	'6789012345'00
T$7	asc	'7890123456'00
T$8	asc	'8901234567'00
T$9	asc	'9012345678'00

*------------------------------
* LES WARPS DU JEU
*------------------------------

tblW$	ent
	adrl	0,W$1,W$2,W$3,W$4,W$5,0,W$7,0,0
	adrl	0,0,0,0,0,0,0,0,0,0
	adrl	0,W$21,W$22,W$23,0,W$25,W$26,W$27,0,W$29
	adrl	W$30,W$31,W$32,W$33,W$34,W$35,W$36,W$37,W$38,W$39
	adrl	W$40,W$41,W$42,0,0,0,0,0,0,0
	adrl	W$50,0,W$52,W$53,0,0,0,0,0,0
	adrl	W$60,W$61,W$62,W$63,0,W$65,W$66,W$67,W$68,W$69
	adrl	W$70,0,0,0,0,0,0,0,0,0
	adrl	W$80,W$81,W$82,W$83,W$84,W$85,W$86,0,W$88,W$89

*  +0: long - pointer to file
*  +4: byte - not used
*  +5: byte - VC
*  +6: byte - IS
*  +7: byte - nord
*  +8: byte - sud
*  +9: byte - est
* +10: byte - ouest

W$1	adrl	CHEM0102
	dfb	01,02
	dfb	01,02
W$2	adrl	CHEM0102
	dfb	01,02
	dfb	03,03,01
W$3	adrl	CHEM0306
	dfb	03,06
	dfb	14,21,02,07,04
W$4	adrl	CHEM0405
	dfb	04,05
	dfb	03,05,03
W$5	adrl	CHEM0405
	dfb	04,05
	dfb	12,00,00,04,07
W$7	adrl	CHEM0007
	dfb	00,07
	dfb	12,89,00,05,03
W$21	adrl	CELL2129
	dfb	21,29
	dfb	02,00,29
W$22	adrl	CELL2223
	dfb	22,23
	dfb	02,00,29
W$23	adrl	CELL2223
	dfb	22,23
	dfb	02,00,30
W$25	adrl	0	; CELLU025
	dfb	00,00
	dfb	00
W$26	adrl	0	; CELLU026
	dfb	00,00
	dfb	03,50,31
W$27	adrl	CELL0027
	dfb	00,27
	dfb	12,00,00,31,28
W$29	adrl	CELL2129
	dfb	21,29
	dfb	14,37,30,22,21
W$30	adrl	CELL3031
	dfb	30,31
	dfb	11,31,29,23,24
W$31	adrl	CELL3031
	dfb	30,31
	dfb	03,27,30,00,50
W$32	adrl	COUR3233
	dfb	32,33
	dfb	15,39,80,41,33
W$33	adrl	COUR3233
	dfb	32,33
	dfb	03,34,32
W$34	adrl	COUR3435
	dfb	34,35
	dfb	15,61,35,36,33
W$35	adrl	COUR3435
	dfb	34,35
	dfb	11,34,40,36
W$36	adrl	COUR3637
	dfb	36,37
	dfb	07,34,37,00,35
W$37	adrl	COUR3637
	dfb	36,37
	dfb	15,40,29,36,38
W$38	adrl	COUR3842
	dfb	38,42
	dfb	11,42,37,39
W$39	adrl	COUR3940
	dfb	39,40
	dfb	15,35,42,40,41
W$40	adrl	COUR3940
	dfb	39,40
	dfb	14,00,37,35,39
W$41	adrl	COUR0041
	dfb	00,41
	dfb	11,32,42,39
W$42	adrl	COUR3842
	dfb	38,42
	dfb	03,88,41
W$50	adrl	HERB5052
	dfb	50,52
	dfb	03,52,31
W$52	adrl	HERB5052
	dfb	50,52
	dfb	02,53,50
W$53	adrl	HERB0053
	dfb	00,53
	dfb	02,00,52
W$60	adrl	CHAP6061
	dfb	60,61
	dfb	08,00,00,61
W$61	adrl	CHAP6061
	dfb	60,61
	dfb	15,65,34,62,60
W$62	adrl	CHAP6263
	dfb	62,63
	dfb	04,00,00,00,61
W$63	adrl	CHAP6263
	dfb	62,63
	dfb	05,67,00,00,65
W$65	adrl	CHAP6566
	dfb	65,66
	dfb	11,66,61,63
W$66	adrl	CHAP6566
	dfb	65,66
	dfb	14,00,65,67,69
W$67	adrl	CHAP6768
	dfb	67,68
	dfb	14,00,63,68,66
W$68	adrl	CHAP6768
	dfb	67,68
	dfb	04,00,00,00,67
W$69	adrl	CHAP6970
	dfb	69,70
	dfb	08,00,00,66,70
W$70	adrl	CHAP6970
	dfb	69,70
	dfb	08,00,00,69
W$80	adrl	BIBL8081
	dfb	80,81
	dfb	03,81,32
W$81	adrl	BIBL8081
	dfb	80,81
	dfb	03,82,80
W$82	adrl	BIBL8283
	dfb	82,83
	dfb	11,84,81,83
W$83	adrl	BIBL8283
	dfb	82,83
	dfb	04,00,00,00,82
W$84	adrl	BIBL8485
	dfb	84,85
	dfb	03,85,82
W$85	adrl	BIBL8485
	dfb	84,85
	dfb	02,86,84
W$86	adrl	BIBL0086
	dfb	00,86
	dfb	02,00,85
W$88	adrl	CIME8889
	dfb	88,89
	dfb	03,89,42
W$89	adrl	CIME8889
	dfb	88,89
	dfb	02,07,88

*------------------------------
* LES OBJETS DU JEU
*------------------------------

refO$	ent
	adrl	O$0,O$1,O$2,O$3,O$4,O$5,O$6,O$7,O$8,O$9
	adrl	O$10,O$11,O$12,O$13,O$14,O$15,O$16,O$17,O$18,O$19
	adrl	O$20,O$21,O$22,O$23,O$24,O$25,O$26,O$27,O$28,O$29
	adrl	O$30,O$31,O$32
	ds	4

tblO$	ent
	adrl	O$0,O$1,O$2,O$3,O$4,O$5,O$6,O$7,O$8,O$9
	adrl	O$10,O$11,O$12,O$13,O$14,O$15,O$16,O$17,O$18,O$19
	adrl	O$20,O$21,O$22,O$23,O$24,O$25,O$26,O$27,O$28,O$29
	adrl	O$30,O$31,O$32
	ds	4

O$0	asc	'BUG'00	; 0
O$1	asc	'ECHELLE'00	; 1
O$2	asc	'CHAINETTE'00	; 2
O$3	asc	''00	; - 3
O$4	asc	'MURES'00	; 4
O$5	asc	'CLEF-NUE'00	; 5
O$6	asc	'CLEF-ROSACE'00	; 6
O$7	asc	'LANIERE'00	; 7
O$8	asc	'PENDENTIF'00	; 8
O$9	asc	'COLLIER'00	; 9
O$10	asc	'CEINTURE1'00	; A
O$11	asc	'CEINTURE2'00	; B
O$12	asc	'CEINTURE3'00	; C
O$13	asc	'CLOCHE'00	; D
O$14	asc	'URINE DE BOUC'00	; E
O$15	asc	'MORTIER'00	; F
O$16	asc	'PILON'00	; 10
O$17	asc	'OS'00	; 11
O$18	asc	'MUE DE SERPENT'00	; 12
O$19	asc	'POUDRE D'27'OS'00	; 13
O$20	asc	'SEAU'00	; 14
O$21	asc	'MANUSCRIT GREC'00	; 15
O$22	asc	''00	; - 16
O$23	asc	''00	; - 17
O$24	asc	'PETALE1'00	; 18
O$25	asc	'PETALE2'00	; 19
O$26	asc	'PETALE3'00	; 1A
O$27	asc	'CAILLOUX'00	; 1B
O$28	asc	''00	; - 1C
O$29	asc	'CLOCHE-CHAINEE'00	; 1D
O$30	asc	'CORDE'00	; 1E
O$31	asc	'CORDE-SEAU'00	; 1F
O$32	asc	'OEIL DE PIERRE'00	; 20

*-----------------------------------
* LES TEXTES DU JEU
*-----------------------------------

strLOAD	ent
	asc	'Charger partie emplacement 1-9 ? '00
strSAVE	ent
	asc	'Sauver partie emplacement 1-9 ? '00
strQUIT	ent
	asc	'Voulez-vous quitter ('
	dfb	chrOUI
	asc	'/'
	dfb	chrNON
	asc	') ? '00
strRESTART	ent
	asc	'Voulez-vous recommencer ('
	dfb	chrOUI
	asc	'/'
	dfb	chrNON
	asc	') ? '00
SP$	ent
	asc	' '00
CR$	ent
	asc	0d00
NO$	ent
	asc	'NORD '00
SU$	ent
	asc	'SUD '00
OU$	ent
	asc	'OUEST '00
ES$	ent
	asc	'EST '00
Q$	ent
	asc	' Que faites vous ? '00
CI$	ent
	asc	0d'Code incorrect !'00
EC$	ent
	asc	0d'Entrez votre code sous la forme : '00
CO$	ent
	asc	0d'xxxxx-xxx'0d'? '00
CB$	ent
	asc	'Code correct :-)'00
Z$	ent
	asc	0d'D'8e'sol'8e', je ne comprends pas..va en paix mon fr'8f're.'00
W$	ent
	asc	' Issue(s) : '00
IT$	ent
	asc	'Objets : '00
strOK	ent
	asc	0d'Ok..'00
AD$	ent
	asc	'D'8e'j'88' fait..'00
BG$	ent
	asc	'Votre sac contient : '00
strRIEN	ent
	asc	'rien.'0d00
ME$	ent
	asc	0d'El'8e'ment manquant'0d00
NE$	ent
	asc	0d'Nouvel objet cr'8e8e0d00
WE$	ent
	asc	0d'Ca ne donne rien.'00
PR$	ent
	asc	0d'Vous vous recueillez en pri'8f'res..'00
strPATIENTEZ	ent
	asc	'Patientez svp..'00
strAPPUYEZ	ent
	asc	'Appuyez une touche'00
strWARPMANQUANT	ent
	asc	'Fichier Warp (i$) manquant !'00
strVC	ent
	asc	'VC%='00
strPASDEWARP	ent
	asc	'N warp impossible !'00
strNOID	ent
	asc	'ID not found !!'00
strCOMMA	ent
	asc	', '00

*-----------------------------------
* LES BINAIRES (TEXTES)
*-----------------------------------

INTROFR1	ent
	asc	'Concept original d'27'Erik Safar'
	dfb	eEOD

INTROFR2	ent
	asc	'(c) 2014, Safar Games'
	dfb	eEOD

INTROFR3	ent
	asc	'Version Apple IIgs'
	dfb	eEOD

INTROFR4	ent
	asc	'(c) 2026, Brutal Deluxe Software'
	dfb	eEOD

INTROFR5	ent
	asc	'Antoine Vignau & Olivier Zardini'
	dfb	eEOD

INTROFR6	ent
	asc	'Pressez une touche pour jouer'
	dfb	eEOD

*--------------

* #0 : saute deux lignes
* #1 : couleur marron
* #2 : couleur blanche

*CREDFR	ent
*	putbin	bin/CREDFR.BIN	; texte

CREDFR	ent
	asc	'#1CONCEPTION'
	asc	'#2Eric SAFAR'
	asc	'#0'
	asc	'#0'
	asc	'#1GRAPHISMES'
	asc	'#2Sophie LECOMTE'
	asc	'#2Eric SAFAR'
	asc	'#0'
	asc	'#1ILLUSTRATIONS'
	asc	'#2Angel BAUTISTA'
	asc	'#0'
	asc	'#1MUSIQUES'
	asc	'#2Herv'8e' MONCHATRE'
	asc	'#0'
	asc	'#1CONCEPTION JAQUETTE'
	asc	'#2Gabriel GATTINI'
	asc	'#0'
	asc	'#1MAQUETTISTE et Site Internet'
	asc	'#2Lionel Amalric'
	asc	'#0'
	asc	'#1MUSIC PLAYER & FONT Oric'
	asc	'#2Mike Pointier'
	asc	'#0'
	asc	'#1MUSIC PLAYER Amstrad'
	asc	'#2Starkos'
	asc	'#0'
	asc	'#1TRADUCTION ANGLAISE'
	asc	'#2Ernest SAFAR'
	asc	'#0'
	asc	'#1CORRECTION DIALOGUES'
	asc	'#2Bonnie SAFAR'
	asc	'#0'
	asc	'#1TRADUCTION ALLEMANDE'
	asc	'#2Tom HOLLENDIECK'
	asc	'#0'
	asc	'#1REALISATION du MANUEL'
	asc	'#2Ren'8e' Speranza'
	asc	'#0'
	asc	'#1SOUTIEN et ENCOURAGEMENTS'
	asc	'#2Forum GAMOPAT'
	asc	'#2Dr Floyd'
	asc	'#2Forum Silicium'
	asc	'#2Forum System-cfg'
	asc	'#0'
	asc	'#1Fonte AMSTRAD'
	asc	'#2ALPHAKOR'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#1REMERCIEMENTS SPECIAUX'
	asc	'#2Dani'8f'le et Remi HERBULOT'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#1UN GRAND MERCI AUSSI A :'
	asc	'#0'
	asc	'#0'
	asc	'#1CONTROLE CLAVIER TO8D'
	asc	'#2C'8e'lia Thibault'
	asc	'#0'
	asc	'#1CLAVIER PC'
	asc	'#2Mario (The cat)'
	asc	'#0'
	asc	'#1HEXA <-> DECIMAL'
	asc	'#2Casio 4000p'
	asc	'#0'
	asc	'#1JEUX AMSTRAD'
	asc	'#2Hurlements'
	asc	'#2Zombi'
	asc	'#2Sram 1 & 2'
	asc	'#2Meurtre '88' grande vitesse'
	asc	'#2Harry & Harry Mission Torpedo'
	asc	'#0'
	asc	'#1POUR MES NOTES AU BAC'
	asc	'#2Mon Laser 200'
	asc	'#2Mon Oric Atmos'
	asc	'#2Ghost'27'n Goblins'
	asc	'#2Moon Cresta'
	asc	'#2Galaga'
	asc	'#2Xain'27'd Sleena'
	asc	'#2Pole Position'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
*	asc	'-Un grand merci aussi '88' toi joueur d'27'Athanor, je te donne rendez-vous '
*	asc	'pour la suite de ton aventure disponible bient'99't sur ton Amstrad.'0d
*	asc	'Et n'27'oublie pas, quand le Mal reviendra, nous reviendrons aussi.'
	asc	'-Un grand merci aussi '88' toi joueur '0d
	asc	'd'27'Athanor, je te donne rendez-vous '0d
	asc	'pour la suite de ton aventure '0d
	asc	'disponible bient'99't sur ton Apple IIgs.'
	asc	'Et n'27'oublie pas, quand le Mal '0d
	asc	'reviendra, nous reviendrons aussi.'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	dfb	eEOD

*--------------

*DIALFR	ent
*	putbin	bin/DIALFR.BIN	; texte
*DIALFR02	ent
*	putbin	bin/DIALFR02.BIN	; texte

DIALFR	ent
	dfb	01,00
	asc	'Vous arrivez en bas d'27'un chemin qui m'8f'ne '88' l'27'abbaye visible au loin'00
	dfb	02,00
	asc	'Vous cheminez, quelques broussailles '8e'pineuses se disputent le bord du talus'00
	dfb	02,01
	asc	'Ce sont des muriers.Il y a meme encore quelques fruits'00
	dfb	03,00
	asc	'Vous voil'88' au pied de l'27'abbaye.'00
	dfb	03,01
	asc	'Un moine apparait, il semble bien stoique..'00
	dfb	03,02
	asc	'Sois le bienvenu '8e'tranger.'00
	dfb	03,03
	asc	'Veuillez me suivre, l'27'abb'8e' vous attend.Je vous conduis '88' votre cellule.'00
	dfb	03,04
	asc	'Ressortir '8e'tant interdit, vous auriez d'9e' rester plus discret.'00
	dfb	04,00
	asc	'Vue d'27'ici la b'89'tisse est impressionnante.'00
	dfb	05,00
	asc	'La lande brumeuse '88' perte de vue et toujours ces murs de pierres moussues.Dr'99'le d'27'odeur..'00
	dfb	05,01
	asc	'Tiens!! de petits cadavres d'27'oiseaux et ossements divers'00
	dfb	05,02
	asc	'Vous apercevez une meurtri'8f're de forme bien particuli'8f're l'88'-haut..mais inaccesible.'00
	dfb	07,00
	asc	'Vent glacial ici..Une grille scell'8e'e dans le mur semble fossilis'8e'e.'00
	dfb	07,01
	asc	'Elle semble coinc'8e'e de l'27'int'8e'rieur.'00
	dfb	07,02
	asc	'Une grille de fer de belle construction mais le temps '88' fait son oeuvre.'00
	dfb	07,03
	asc	'Maintenant elle s'27'ouvre sans probl'8f'me'00
	dfb	21,00
	asc	'Le fr'8f're vous a demand'8e' de patienter jusqu'2788' l'27'arriv'8e'e de l'27'abb'8e' et de ne quitter la cellule sous aucun pr'8e'texte.'00
	dfb	21,01
	asc	'Bonjour fr'8f're..Content de vous voir. Vous savez, votre venue perturbe et inqui'8e'te la communaut'8e'..L'27'inquisition traque l'27'h'8e'r'8e'sie sans rel'89'che.J'27'oubliais ! '	; next line
	asc	'Je vous ai laiss'8e' la porte du couloir ouverte.'00
	dfb	21,02
	asc	'Quitter votre cellule a '8e't'8e' pris comme une volont'8e' de fouiner..Le bucher a '8e't'8e' dress'8e' en votre honneur.'00
	dfb	22,00
	asc	'Cellule monastique sans grand interet.Un moine se tient pr'8f's de vous.'00
	dfb	22,01
	asc	'Bonjour mon fr'8f're, je suis le fr'8f're Filipo..Vous ne devriez pas '90'tre ici et je ne devrais pas vous parler.Il se passe des choses '8e'tranges dans cette abbaye..ne restez pas..'00
	dfb	22,04
	asc	'Je vous aurais pr'8e'venu..'00
	dfb	22,05
	asc	'Fuyez pauvre fou !!'00
	dfb	22,02
	asc	'Une cellule tr'8f's '8e'pur'8e'e hormis quelques babioles de '8d'i de l'88'.'00
	dfb	22,03
	asc	'En y regardant de plus pr'8f's, une corde traine au sol, les fr'8f'res en font usage de ceinture.'00
	dfb	23,00
	asc	'Cette cellule regorge de livres.Il y a aussi une paillasse bien confortable.'00
	dfb	23,01
	asc	'La paillasse semble manipul'8e'e souvent.Quelqu'27'un y a gliss'8e' une clef.Une clef un peu bizarre, elle semble incompl'8f'te'00
	dfb	23,02
	asc	'Un livre est ouvert sur la table, il y a une annotation : n'27'as tu jamais dans'8e' avec le diable au clair de lune ?'00
	dfb	27,00
	asc	'Vous voil'88' dans une grande salle.Peut-'90'tre un r'8e'fectoire.Des voix proviennent de la pi'8f'ce '88' l'27'ouest.La discussion semble anim'8e'e.'00
	dfb	27,01
	asc	'La pr'8e'sence de cet '8e'tranger ne me dit rien qui vaille.Qu'27'en dis-tu mon fr'8f're ?Je pense qu'27'il est de cette confr'8e'rie...M'8e'fions nous.'00
	dfb	27,02
	asc	'Vous entrez dans la pi'8f'ce et surprenez toute l'27'assistance..Cette intrusion est tr'8f's mal prise.Votre proc'8f's fut rapide..Les flammes l'8e'ch'8f'rent longuement vos pieds.'00
	dfb	27,03
	asc	'Vous faites bien car un symbole a '8e't'8e' grav'8e' ici.Je vais tacher de le m'8e'moriser.'00
	dfb	27,04
	asc	'Des ustensiles divers, dont un pilon.'00
	dfb	29,00
	asc	'A l'27'ouest, votre cellule.Au nord, la sortie vers la cour.'00
	dfb	30,00
	asc	'Couloir..Il y a une cellule '88' l'27'est.'00
	dfb	31,00
	asc	'Le bout du couloir, une porte de chaque cot'8e' et une salle plus vaste juste devant.'00
	dfb	31,01
	asc	'La porte est ferm'8e'e.De plus la serrure parait curieuse.'00
	dfb	31,02
	asc	'La serrure a une forme tr'8f's particuli'8f're, la cl'8e' qui ouvre cette porte est unique..Quelque chose semble coinc'8e' dans la serrure.On dirait un petit morceau de m'8e'tal.'00
	dfb	31,04
	asc	'Il s'27'agit en fait d'27'un petit p'8e'tale m'8e'tallique.Curieux, pourquoi '8e'tait-il coinc'8e' ici ?'00
	dfb	31,03
	asc	'Bien jou'8e' !! L'27'acc'8f's '88' cette cellule est maintenant possible.'00
	dfb	31,05
	asc	'Bien jou'8e' !! Je fermerai donc les yeux cette fois, voil'88' votre lani'8f're.'00
	dfb	31,06
	asc	'Proposez moi quelque chose d'27'int'8e'ressant et je vous rends la lani'8f're'00
	dfb	31,07
	asc	'Merci, mais ce n'27'est pas suffisant.'00
	dfb	31,08
	asc	'Fr'8f're Remigio patiente devant sa cellule.'00
	dfb	31,09
	asc	'Fr'8f're Remigio vous attrape '88' la sortie de sa cellule, il vous reprend la lani'8f're et vous fixe, l'27'air m'8e'content.'00
	dfb	36,00
	asc	'Ces vieilles pierres semblent murmurer : '27'Courage mon fr'8f're, je t'27'aiderai '88' d'8e'nouer les trames obscures du malin.'2700
	dfb	37,00
	asc	'Une belle cour d'27'abbaye, les dortoirs au sud, couloir bord'8e' de piliers s'8e'culaires..Il r'8f'gne ici un silence monacal.'00
	dfb	38,00
	asc	'Il y a un puits au centre de la cour..Vous apercevez la grille au fond.'00
	dfb	39,00
	asc	'Vous flanez dans la cour avec l'27'impression d'2790'tre observ'8e'.'00
	dfb	39,01
	asc	'Vous voyez le visage du fr'8f're Salvatore s'27'illuminer.J'27'ai enfin la r'8e'ponse '88' ce reve incessant.Prenez ce pendentif, merci encore.'00
	dfb	39,02
	asc	'L'27'air hagard, il vous fixe en r'8e'p'8e'tant : La forme de la meurtri'8f're ?Quelle est la forme de la meurtri'8f're ?'00
	dfb	40,00
	asc	'Un puits pareil '88' tous les puits, la margelle est remarquable.'00
	dfb	40,01
	asc	'Ce puits est sans conteste l'27'oeuvre d'27'un habile tailleur de pierre.il a plu ces derniers jours et Dieu vit dans la pluie.'00
	dfb	40,02
	asc	'La corde lest'8e'e de son seau est en place.'00
	dfb	40,03
	asc	'Vous faites descendre votre dispositif vers le fond du puits..Et apr'8f's quelques essais.Le voil'88' enfin..Ce petit objet brillant s'27'av'8f're '90'tre une petite cloche en cuivre.'00
	dfb	40,04
	asc	'Vous apercevez quelque chose de brillant au fond.'00
	dfb	41,00
	asc	'Une cour classique avec ses colonnes imposantes.De bien belles constructions.'00
	dfb	41,01
	asc	'Ce n'27'est pas du marbre mais une bien belle pierre cependant.Tiens, qui s'27'est amus'8e' '88' graver ce symbole ici ?'00
	dfb	42,00
	asc	'Vous etes dans l'27'entr'8e'e de la cour.Le sol est caillouteux.La herse est baiss'8e'e, impossible de sortir.'00
	dfb	42,01
	asc	'Splendide herse, impossible '88' franchir.'00
	dfb	42,03
	asc	'Quelques cailloux de-ci, de-l'88'.'00
	dfb	42,04
	asc	'Qui sait..Ca pourrait servir.'00
	dfb	32,00
	asc	'Vous flanez dans la cour.'00
	dfb	33,00
	asc	'Vous cheminez, '88' l'27'abri dans le couloir autour de la cour.'00
	dfb	33,01
	asc	'Bonjour mon fr'8f're, vous n'27'avez pas d'27'id'8e'es bizarres en t'90'te comme les autres moines j'27'esp'8f're ?Un collier me prot'8e'gerait.Vous n'27'auriez pas '8d'a par hasard ?'	; next line
	asc	'Je ne serais pas ingrate..'00
	dfb	33,02
	asc	'Ah oui ! c'27'est tout '88' fait '8d'a, mais il n'27'est pas complet.Je voudrais le porter.Revenez me voir lorsqu'27'il sera complet.'00
	dfb	33,03
	asc	'Ah oui ! Magnifique, c'27'est tout '88' fait '8d'a..Je vais enfin '90'tre tranquille.Je vous en serais infiniement reconnaissante.Tenez, prenez '8d'a, c'27'est un oeil en pierre tr'8f's ancien.'00
	dfb	33,04
	asc	'Merci encore, maintenant je tiens les moines louches '8e'loign'8e's.'00
	dfb	34,00
	asc	'Depuis cet endroit de la cour, on entend des chuchotements venant du nord.'00
	dfb	35,00
	asc	'Un endroit bien paisible et ensoleill'8e' de la cour.D'27'ailleurs un fr'8f're a install'8e' ici une jarre avec quelques plantes.'00
	dfb	35,01
	asc	'Il s'27'agit de plantes m'8e'dicinales : alth'8e'e, bistorte et autres val'8e'rianes.S'9e'rement celles de fr'8f're Remigio, l'27'herboriste.'00
	dfb	35,02
	asc	'Je ne suis pas certain que fr'8f're Remigio appr'8e'cierait.'00
	dfb	35,03
	asc	'L'8e'g'8f'rement enterr'8e', vous d'8e'couvrez un petit flacon '8e'tiquet'8e' : '27'urine de bouc'00
	dfb	50,00
	asc	'Vous etes dans l'27'entr'8e'e de l'27'herboristerie du fr'8f're Remigio.'00
	dfb	50,01
	asc	'Seul le fr'8f're s'27'y retrouve ici.'00
	dfb	50,02
	asc	'Il y a quelques mortiers et autres ustensiles dont il est difficile de d'8e'terminer l'27'usage.'00
	dfb	50,03
	asc	'Seul le fr'8f're Remigio sait ce qu'27'ils contiennent et je ne suis pas ici pour prendre des cours d'27'herboristerie.'00
	dfb	52,00
	asc	'Un mur fait de pierres grav'8e'es et num'8e'rot'8e'es.'00
	dfb	52,01
	asc	'Pas de doute, le mur est solide mais en y regardant de plus pr'8f's, on peut distinguer une petite s'8e'rie de symboles.'00
	dfb	52,02
	asc	'La combinaison '8e'tait bien celle l'88'..Un bien curieux code cependant.L'27'acc'8f's est maintenant ouvert.'00
	dfb	53,00
	asc	'C'27'est donc '8d'a la pi'8f'ce secr'8f'te de fr'8f're Remigio, il y stocke ses graines, racines et rhizomes rares et quelques potions aux effets inavouables.Quelques '8e'tag'8f'res et un petit '8e'tabli.'00
	dfb	53,01
	asc	'Quelques racines de saponaire, bistorte et feuilles de gentiane ainsi que quelques petites bourses.'00
	dfb	53,02
	asc	'Des bocaux, encore des bocaux.'00
	dfb	53,04
	asc	'Vous d'8e'tachez soigneusement la lani'8f're et reniflez le contenu d'27'une bourse..La tete vous tourne, le mieux serait de ne pas recommencer.'00
	dfb	53,05
	asc	'De petites bourses pour herboriser..Elles sont soigneusement closes par une lani'8f're.'00
	dfb	61,00
	asc	'Nous voil'88' dans la chapelle, la nef au nord.'00
	dfb	60,00
	asc	'Il semblerait que ce soit d'27'ici que les fr'8f'res sonnent les cloches.'00
	dfb	60,01
	asc	'Ding  dong.'00
	dfb	62,00
	asc	'Un coin de l'27'entr'8e'e sans grand interet.'00
	dfb	62,01
	asc	'Je vous salue Marie pleine de grace.'00
	dfb	81,01
	asc	'Il vous regarde interloqu'8e'.Pour qui me prenez-vous ?'00
	dfb	81,02
	asc	'Je connais votre petit pech'8e' fr'8f're Ernesto, promis cela restera entre nous.Prenez ces belles mures et r'8e'galez-vous..Un peu gen'8e', le fr'8f're accepte volontiers.'	; next line
	asc	'il ach'8f'te '8e'galement votre silence en vous donnant une ceinture arguant que vous '90'tes ridicule vous autres Franciscains '88' vous balader sans ceinture de corde.'00
	dfb	81,03
	asc	'Allez en paix mon fr'8f're..Je prie le seigneur pour notre pitance de chaque jour.'00
	dfb	63,00
	asc	'Si ces murs pouvaient parler..'00
	dfb	63,01
	asc	'Et ils le peuvent. La preuve, ce symbole a s'9e'rement des tas de choses '88' dire.Je vais tacher de m'27'en souvenir'00
	dfb	65,00
	asc	'Tous ces prie-Dieu en enfilade donnent une drole d'27'impression.Il faudrait peut-'90'tre que j'27'assiste '88' l'27'office'00
	dfb	66,00
	asc	'Plus pr'8f's de toi mon Dieu..L'27'autel se tient juste devant vous..Une entr'8e'e '88' l'27'ouest.'00
	dfb	66,01
	asc	'Est-ce bien s'8e'rieux mon fils ? Un peu de respect voyons.'00
	dfb	66,02
	asc	'C'27'est de toute beaut'8e'.'00
	dfb	67,00
	asc	'Pater noster qui es in coelis sanctificetur nomen tuum adveniat regnum tuum fiat voluntas tuas sicut in coelo et in terra'00
	dfb	68,00
	asc	'Une sorte de remise o| les fr'8f'res peuvent entreposer des choses sans interet.'00
	dfb	68,01
	asc	'Une vraie caverne d'27'ali Baba, mais tout est usag'8e' ici.'00
	dfb	68,02
	asc	'Elle a l'27'allure d'27'une vraie, mais c'27'est du platre'00
	dfb	68,03
	asc	'La patine est us'8e'e, mais elle reste magnifique'00
	dfb	68,04
	asc	'Des poteries '8e'brech'8e'es.'00
	dfb	68,05
	asc	'Parfait, j'27'avais cru...Allez en paix mon fr'8f're.'00
	dfb	68,06
	asc	'Vade retro Satana..Cette odeur f'8e'tide vous a trahi..Le commerce avec le d'8e'mon vous a men'8e' droit au bucher.'00
	dfb	68,07
	asc	'Le bruit a attir'8e' l'27'abb'8e', il exige que vous lui montriez votre main droite.'00
	dfb	69,00
	asc	'Une salle fun'8e'raire, un tombeau richement sculpt'8e', il y a '8e'galement une petite niche creus'8e'e dans le mur.'00
	dfb	69,01
	asc	'De petites gargouilles aux yeux bien expressifs.'00
	dfb	69,02
	asc	'Une petite niche o'9d' une vierge peut '90'tre pos'8e'e, mais l'88', il s'27'agit d'27'un coffre.'00
	dfb	69,03
	asc	'Rien de notable.'00
	dfb	69,04
	asc	'Tous plus effrayants les uns que les autres, un oeil est manquant'00
	dfb	69,05
	asc	'Plut'99't un petit coffret, je ne vois pas de serrure par contre.'00
	dfb	69,06
	asc	'Le coffre est ouvert, un p'8e'tale m'8e'tallique '88' l'27'int'8e'rieur'00
	dfb	69,07
	asc	'Bien jou'8e'.. Le d'8e'clic entendu contre le mur confirme qu'27'il y avait bien un passage cach'8e'.'00
	dfb	70,00
	asc	'Bien cach'8e', '8e'trange..Un anneau est accroch'8e' au mur'00
	dfb	70,01
	asc	'A y regarder de plus pr'8f's, '8d'a ressemble fort '88' un perchoir'00
	dfb	70,02
	asc	'Un banal anneau, mais quelque chose doit pouvoir s'27'accrocher ici'00
	dfb	70,03
	asc	'Riche id'8e'e mais '8d'a semble incomplet.'00
	dfb	70,04
	asc	'Bravo ! Cet anneau semble fait pour fixer ce m'8e'canisme.'00
	dfb	70,05
	asc	'Vous avez de la suite dans les id'8e'es, le tintement de votre cloche produit un effet inattendu.. Un corbeau vient de se poser sur le perchoir. Il semble avoir r'8e'pondu '88' votre appel.'00
	dfb	70,09
	asc	'Vous avez beaucoup d'27'imagination... Le corbeau un peu moins.. Il reste indiff'8e'rent '88' vos suppliques.'00
	dfb	80,00
	asc	'Vous '90'tes dans l'27'entr'8e'e de la biblioth'8f'que, silence de rigueur.'00
	dfb	80,01
	asc	'Suspendue par de fr'8e'les chainettes, il ne faudrait pas grand chose pour qu'27'elle vous tombe dessus.'00
	dfb	80,02
	asc	'Vous visez juste.. La lanterne s'8e'crase au sol..par chance les fr'8f'res ne sont pas pr'8e'sents, personne ne vous a vu.Un tas de d'8e'bris divers est '88' vos pieds'00
	dfb	80,03
	asc	'La lanterne est inutilisable. Une chainette est peut-'90'tre r'8e'cup'8e'rable.'00
	dfb	81,00
	asc	'Vous progressez dans la biblioth'8f'que.'00
	dfb	82,00
	asc	'Rien de sp'8e'cial ici.'00
	dfb	82,01
	asc	'Que de beaux livres, c'27'est impressionnant !'00
	dfb	82,02
	asc	'Quelques titres pris au hasard.- Mission torpedo.- Il va falloir changer de m'8e'moire.- Meurtre '88' l'27'abbaye.'00
	dfb	84,00
	asc	'Des livres encore des livres..Beau pupitre.'00
	dfb	84,01
	asc	'Un pupitre d'27'enlumineur'00
	dfb	84,02
	asc	'Une '8e'dition originale du Critias, de Platon, magnifique !'00
	dfb	84,03
	asc	'hum..hum..encore un symbole..'00
	dfb	85,00
	asc	'Le fond de la biblioth'8f'que, des pierres trainent au sol.'00
	dfb	85,01
	asc	'Chaque pierre au sol est grav'8e'e d'27'une lettre'00
	dfb	85,02
	asc	'Une phrase est grav'8e'e au dessus de la porte : '27'iV lapides intrare'2700
	dfb	85,03
	asc	'Il y en a beaucoup trop, mais je peux s'9e'rement les utiliser'00
	dfb	85,04
	asc	'Cette combinaison ne donne rien.'00
	dfb	85,05
	asc	'Dans un grondement rauque, la porte s'27'ouvre lentement.. Bravo !'00
	dfb	85,06
	asc	'Une porte ferm'8e'e par un m'8e'canisme '88' base de pierres'00
	dfb	83,00
	asc	'Des '8e'tag'8f'res de livres anciens et pr'8e'cieux..Une des plus grandes biblioth'8f'ques de la chr'8e'tient'8e'.'00
	dfb	83,01
	asc	'Il y a de petites niches perch'8e'es au dessus des livres, mais elles sont inaccessibles.'00
	dfb	83,02
	asc	'Que dire de plus ? Vous ne voyez pas bien.. Il faudrait pouvoir se hisser'00
	dfb	83,03
	asc	'Vous posez l'8e'chelle contre les '8e'tag'8f'res.'00
	dfb	83,04
	asc	'Vous grimpez, inquiet, mais '8d'a en valait la peine. Vous trouvez : un p'8e'tale m'8e'tallique, un manuscrit grec'00
	dfb	86,00
	asc	'Vous p'8e'n'8e'trez dans une petite annexe de la biblioth'8f'que, quelques ouvrages r'8e'form'8e's se trouvent ici.Vous notez tout particuli'8f'rement la meurtri'8f're, '	; next line
	asc	'cette forme de tr'8f'fle est tr'8f's inhabituelle'00
	dfb	86,01
	asc	'Rien d'27'autre '88' noter.'00
	dfb	86,02
	asc	'Une note traine dans un livre, il est '8e'crit : Ernesto est trop gourmand'00
	dfb	88,00
	asc	'L'27'entr'8e'e de ce qui semble '90'tre le petit cimeti'8f're priv'8e' de l'27'abbaye'00
	dfb	88,01
	asc	'Repose en paix fr'8f're Gohin.'00
	dfb	88,02
	asc	'Il est plein de pierres, c'27'est beaucoup trop lourd'00
	dfb	88,03
	asc	'Qui sait..'00
	dfb	89,00
	asc	'Le fond du cimeti'8f're, une grille donne vers l'27'ext'8e'rieur'00
	dfb	89,01
	asc	'Des pierres partout, l'27'habitat id'8e'al de nombreux serpents.'00
	dfb	89,02
	asc	'Cette grille permet d'27'acc'8e'der '88' l'27'ext'8e'rieur de l'27'abbaye, elle est bloqu'8e'e par une barre de fer'00
	dfb	89,03
	asc	'La grille est maintenant d'8e'gag'8e'e.'00
	dfb	89,04
	asc	'La pr'8e'sence de cette mue confirme que des serpents se baladent ici.'00
	dfb	eEOD,eEOD	; end of data

*--------------

*FINALE	ent
*	putbin	bin/FINALE.BIN	; texte

FINALE	ent
	asc	'Bienvenue Seth, que de chemin parcouru pour arriver jusqu'2788' Zephyr et moi.'
	asc	'Merci pour le parchemin, il traite de la D'8e'esse aux serpents, tu feras sa connaissance bient'99't.'
	asc	'Tu dois te poser beaucoup de questions, n'27'est-ce pas ?'
	asc	'Ta venue '88' l'27'abbaye n'278e'tait pas une co'95'ncidence, c'27'est la confr'8e'rie des '8e'rudits qui t'27'envoie.'
	asc	'Tu es le disciple de Khar, un survivant Atlante.'
	asc	'oui, des Atlantes.'
	asc	'Ton nom est Seth, c'27'est ta vraie identit'8e' au sein de ce groupe.'
	asc	'Bient'99't, tu en apprendras davantage sur toi.'
	asc	'Les Atlantes ont presque tous disparu lors du grand cataclysme, il y a 12000 ans.'
	asc	'Mais la porte qui cl'99't leur monde n'27'a pas '8e't'8e' scell'8e'e.'
	asc	'une menace plane de nouveau sur ce groupe de survivants car les dieux d'8e'testent que leurs cr'8e'atures prennent un chemin diff'8e'rent de celui qu'27'ils leur dictent.'
	asc	'Le grand architecte Atlante, Eliphas, a fait cacher 7 artefacts au coeur de certains de ses '8e'difices.'
	asc	'Retrouve-les !! et permets ainsi la fermeture d'8e'finitive de la porte menant au monde des Atlantes.'
	asc	'Les artefacts se sont r'8e'veill'8e's, je ne suis qu'27'une '8e'manation g'8e'n'8e'r'8e'e par celui cach'8e' '88' l'27'abbaye.'
	asc	'Ton aventure ne fait que commencer Seth..'
	asc	'D'8e'cachette cette enveloppe et tu entreras en possession du premier artefact.'
	asc	'Retrouve les 6 autres pour ainsi cl'99're la porte '88' tout jamais.'
	asc	'Ton temps est venu.'
	asc	'Sur ton chemin, de nombreuses menaces te guettent mais Aaradia est s'9e'rement la plus d'8e'termin'8e'e, souviens-t'27'en.'
	asc	'C'27'est une Atlante puissante qui nourrit de sombres desseins et ne reculera devant rien pour s'27'emparer des artefacts.'
	asc	'Bonne chance Seth.'
	dfb	eEOD

*-----------------------------------
* LES BINAIRES (MUSIQUES)
*-----------------------------------

CREDIT3	ent
	putbin	bin/CREDIT3.BIN	; musique
MEDIV6	ent
	putbin	bin/MEDIV6.BIN	; musique
WON4	ent
	putbin	bin/WON4.BIN	; musique
