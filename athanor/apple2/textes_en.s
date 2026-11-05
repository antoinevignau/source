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

chrOUI	=	'Y'
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
	str	'GO'	;  0
	str	'MOVE'	;  1
	str	'ADVANCE'	;  2
	str	'APPROACH'	;  3
	str	'EXAMINE'	;  4
	str	'LOOK'	;  5
	str	'SEARCH'	;  6
	str	'CLOSE'	;  7
	str	'PICK'	;  8
	str	'TAKE'	;  9
	str	'GIVE'	;  A
	str	'RING'	;  B
	str	'FOLLOW'	;  C
	str	'TALK'	;  D
	str	'THROW'	;  E
	str	'DROP'	;  NEW
	str	'REMOVE'	;  F
	str	'UNTIE'	; 10
	str	'COMBINE'	; 11
	str	'ASSEMBLE'	; 12
	str	'ENTER'	; 13
	str	'PUSH'	; 14
	str	'PRESS'	; 15
	str	'HIT'	; 16
	str	'ANSWER'	; 17
	str	'HANG'	; 18
	str	'PUT'	; 19
	str	'USE'	; 1A
	str	'LISTEN'	; 1B
	str	'PULL'	; 1C
	str	'OPEN'	; 1D
	str	'UP'	; 1E
	str	'CLIMB'	; 1F
	str	'WAIT'	; 20
	str	'PRAY'	; 21
	str	'EMPTY'	; 22
	str	'NORTH'	; 23
	str	'N'	; 24
	str	'SOUTH'	; 25
	str	'S'	; 26
	str	'SETH'	; 27
	str	'S+E+T+H'	; 28
	str	'RIGHT'	; 29
	str	'EAST'	; 2A
	str	'E'	; 2B
	str	'SHOW'	; 2C
	str	'LEFT'	; 2D
	str	'WEST'	; 2E
	str	'W'	; 2F
	str	'BRUSH'	; 30
	str	'BRUSHES'	; NEW
	str	'BUSH'	; 31
	str	'BUSHES'	; 32
	str	'EMBANKMENT'	; 33
	str	'FRUIT'	; 34
	str	'FRUITS'	; NEW
	str	'BERRY'	; NEW
	str	'BERRIES'	; NEW
	str	'GATE'	; 35
	str	'BONE'	; 36
	str	'SKELETON'	; 37
	str	'CADAVER'	; 38
	str	'GROUND'	; 39
	str	'AROUND'	; 3A
	str	'WALL'	; 3B
	str	'BELL'	; 3C
	str	'COWBELL'	; NEW
	str	'MONK'	; 3D
	str	'BROTHER'	; 3E
	str	'CELL'	; 3F
	str	'ROOM'	; 40
	str	'BELT'	; 41
	str	'BELT1'	; NEW
	str	'ROPE'	; 42
	str	'BELT2'	; 43
	str	'MATTRESS'	; 44
	str	'BED'	; 45
	str	'LOCK'	; 46
	str	'KEY'	; 47
	str	'KEYS'	; NEW
	str	'KEY'	; NEW
	str	'KEYS'	; NEW
	str	'PIECE'	; 48
	str	'METAL'	; 49
	str	'METALLIC'	; 4A
	str	'COMPLETE-KEY'	; 4B
	str	'COMPLETE-KEY'	; NEW
	str	'STONE'	; 4C
	str	'STONES'	; NEW
	str	'VOICE'	; 4D
	str	'CHAT'	; 4E
	str	'CONVERSATION'	; NEW
	str	'WELL'	; 4F
	str	'COPING'	; 50
	str	'DOOR'	; 51
	str	'BAR'	; 52
	str	'CLOVER'	; 53
	str	'BOTTOM'	; 54
	str	'PILLAR'	; 55
	str	'PORTCULLIS'	; 56
	str	'GRAVEL'	; 57
	str	'PEBBLE'	; NEW
	str	'GIRL'	; 58
	str	'WOMAN'	; 59
	str	'PENDANT'	; 5A
	str	'NECKLACE'	; 5B
	str	'TABLE'	; 5C
	str	'USTENSIL'	; 5D
	str	'POT'	; 5E
	str	'JAR'	; 5F
	str	'MORTAR'	; 60 
	str	'PESTLE'  	; 61 
	str	'POWDER' 	; 62 
	str	'MARY' 	; 63 
	str	'STATUE' 	; 64 
	str	'SLOUGH'    ; 65 
	str	'SKIN'   	; 66 
	str	'SNAKE'	; 67 
	str	'WORKBENCH' ; 68 
	str	'SHELF'	; 69 
	str	'POUCH' 	; 6A 
	str	'POUCHES' 	; NEW 
	str	'STRAP'	; 6B 
	str	'STRING'	; NEW
	str	'ALTAR'  	; 6C 
	str	'GRAVE'	; 6D 
	str	'TOMB'  	; 6E 
	str	'RECESS'  	; 6F 
	str	'EYES'   	; 70 
	str	'EYE'   	; 71 
	str	'CHEST' 	; 72 
	str	'COFFIN' 	; 72 
	str	'ROUND'   	; 73 
	str	'SPLIT'  	; 74 
	str	'STAIR'	; 75
	str	'STAIRS'	; 75
	str	'PERCH'   	; 76 
	str	'STEM'   	; NEW
	str	'RING' 	; 77 
	str	'CHAIN'	; 78
	str	'PARCHMENT1'	; 79 
	str	'PARCHMENT2'	; 7A
	str	'PARCHMENT3'	; 7B
	str	'CROW'	; 7C 
	str	'BIRD' 	; 7D 
	str	'CHAINED-BELL'	; 7E
	str	'LANTERN'	; 7F
	str	'GLASS' 	; 80 
	str	'LECTERN'	; 81 
	str	'BOOK'  	; 82 
	str	'BOOKS'	; NEW
	str	'LADDER'	; 83 
	str	'PETAL' 	; 84 
	str	'PETAL1' 	; NEW
	str	'MANUSCRIPT'	; 85
	str	'PETAL2'	; 86 
	str	'PETAL3'	; 87 
	str	'BUCKET'   	; 88 
	str	'ROPE-BUCKET'	; NEW
	str	'HAND'   	; 89 
	str	'6502'   	; 8A 
	str	'6+5+0+2'	; 8B 
	str	'ARROWSLIT'	; 8C
	str	'PLANT' 	; 8D
	str	'HERB' 	; NEW
	str	'FLASK' 	; 8E 
	str	'INVENTORY'	; 8F
	str	'INVENT' 	; 90 
	str	'I'      	; 91 
	str	'EXIT'  	; 92 
	str	'EXITS' 	; 93 
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
	str	'FILL'	; A1
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
	dw	$1015	; 4D VOICE
	dw	$1015	; 4E CHAT
	dw	$1015	; NEW CONVERSATION
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
	dw	$1034	; 6B STRAP
	dw	$1034	; 6B STRING
	dw	$1035	; 6C AUTEL
	dw	$1036	; 6D TOMBEAU
	dw	$1036	; 6E TOMBE
	dw	$1037	; 6F NICHE
	dw	$1038	; 70 YEUX
	dw	$1038	; 71 OEIL
	dw	$1039	; 72 CHEST
	dw	$1039	; 72 COFFIN
	dw	$1040	; 73 ROND
	dw	$1041	; 74 FENDU
	dw	$1042	; 75 STAIR
	dw	$1042	; 75 STAIRS
	dw	$1043	; 76 PERCH
	dw	$1043	; 76 STEM
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
	dw	$1069	; 8D PLANT
	dw	$1069	; 8D HERB
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
O$1	asc	'LADDER'00	; 1
O$2	asc	'CHAIN'00	; 2
O$3	asc	''00	; - 3
O$4	asc	'BERRY'00	; 4
O$5	asc	'KEY'00	; 5
O$6	asc	'COMPLETE-KEY'00	; 6
O$7	asc	'STRAP'00	; 7
O$8	asc	'PENDANT'00	; 8
O$9	asc	'NECKLACE'00	; 9
O$10	asc	'BELT1'00	; A
O$11	asc	'BELT2'00	; B
O$12	asc	'BELT3'00	; C
O$13	asc	'BELL'00	; D
O$14	asc	'BILLY GOAT'27'S URINE'00	; E
O$15	asc	'MORTAR'00	; F
O$16	asc	'PESTLE'00	; 10
O$17	asc	'BONE'00	; 11
O$18	asc	'SLOUGH'00	; 12
O$19	asc	'BONE POWDER'00	; 13
O$20	asc	'BUCKET'00	; 14
O$21	asc	'GREEK MANUSCRIPT'00	; 15
O$22	asc	''00	; - 16
O$23	asc	''00	; - 17
O$24	asc	'PETAL1'00	; 18
O$25	asc	'PETAL2'00	; 19
O$26	asc	'PETAL3'00	; 1A
O$27	asc	'GRAVEL'00	; 1B
O$28	asc	''00	; - 1C
O$29	asc	'CHAINED-BELL'00	; 1D
O$30	asc	'ROPE'00	; 1E
O$31	asc	'ROPE-BUCKET'00	; 1F
O$32	asc	'STONE EYE'00	; 20

*-----------------------------------
* LES TEXTES DU JEU
*-----------------------------------

strLOAD	ent
	asc	'Load game from slot 1-9 ? '00
strSAVE	ent
	asc	'Save game at slot 1-9 ? '00
strQUIT	ent
	asc	'Do you want to quit ('
	dfb	chrOUI
	asc	'/'
	dfb	chrNON
	asc	') ? '00
strRESTART	ent
	asc	'Do you want to restart ('
	dfb	chrOUI
	asc	'/'
	dfb	chrNON
	asc	') ? '00
SP$	ent
	asc	' '00
CR$	ent
	asc	0d00
NO$	ent
	asc	'NORTH '00
SU$	ent
	asc	'SOUTH '00
OU$	ent
	asc	'WEST '00
ES$	ent
	asc	'EAST '00
Q$	ent
	asc	' What to do ? '00
CI$	ent
	asc	0d'Invalid code!'00
EC$	ent
	asc	0d'Enter the code as such: '00
CO$	ent
	asc	0d'xxxxx-xxx'0d'? '00
CB$	ent
	asc	'Valid code :-)'00
Z$	ent
	asc	0d'Sorry, I don'27'understand..Go in peach Brother!'00
W$	ent
	asc	' Exit: '00
IT$	ent
	asc	'Items: '00
strOK	ent
	asc	0d'Ok..'00
AD$	ent
	asc	'Already done..'00
BG$	ent
	asc	'Your bad contains: '00
strRIEN	ent
	asc	'nothing.'0d00
ME$	ent
	asc	0d'Missing part'0d00
NE$	ent
	asc	0d'New item created'0d00
WE$	ent
	asc	0d'Nothing happened.'00
PR$	ent
	asc	0d'You pray..'00
strPATIENTEZ	ent
	asc	'Please wait..'00
strAPPUYEZ	ent
	asc	'Press any key'00
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
	asc	'Original game by Erik Safar'
	dfb	eEOD

INTROFR2	ent
	asc	'(c) 2014, Safar Games'
	dfb	eEOD

INTROFR3	ent
	asc	'Apple IIgs version'
	dfb	eEOD

INTROFR4	ent
	asc	'(c) 2026, Brutal Deluxe Software'
	dfb	eEOD

INTROFR5	ent
	asc	'Antoine Vignau & Olivier Zardini'
	dfb	eEOD

INTROFR6	ent
	asc	'Press a key to play'
	dfb	eEOD

*--------------

* #0 : saute deux lignes
* #1 : couleur marron
* #2 : couleur blanche

*CREDFR	ent
*	putbin	bin/CREDFR.BIN	; texte

CREDFR	ent
	asc	'#1SCENARIO and CODE'
	asc	'#2Eric SAFAR'
	asc	'#0'
	asc	'#0'
	asc	'#1GRAPHICS'
	asc	'#2Sophie LECOMTE'
	asc	'#2Eric SAFAR'
	asc	'#0'
	asc	'#1COVER'
	asc	'#2Angel BAUTISTA'
	asc	'#0'
	asc	'#1MUSIC'
	asc	'#2Herv'8e' MONCHATRE'
	asc	'#0'
	asc	'#1PACKAGING'
	asc	'#2Gabriel GATTINI'
	asc	'#2LES ARTS GRAPHIQUES - NICE'
	asc	'#0'
	asc	'#1COVER LAYOUT and Web Site'
	asc	'#2Lionel Amalric'
	asc	'#0'
	asc	'#1MUSIC PLAYER & FONT Oric'
	asc	'#2Mike Pointier'
	asc	'#0'
	asc	'#1MUSIC PLAYER Amstrad'
	asc	'#2Starkos'
	asc	'#0'
	asc	'#1ENGLISH TRANSLATION'
	asc	'#2Ernest SAFAR'
	asc	'#2Nicholas CAMPBELL'
	asc	'#0'
	asc	'#1DIALOG CORRECTIONS'
	asc	'#2Bonnie SAFAR'
	asc	'#0'
	asc	'#1GERMAN TRANSLATION'
	asc	'#2Tom HOLLENDIECK'
	asc	'#0'
	asc	'#1MANUAL'
	asc	'#2Ren'8e' Speranza'
	asc	'#0'
	asc	'#1SUPPORT'
	asc	'#2Forum GAMOPAT'
	asc	'#2Dr Floyd'
	asc	'#2Forum Silicium'
	asc	'#2Forum.Oric.org'
	asc	'#0'
	asc	'#1AMSTRAD Font'
	asc	'#2ALPHAKOR'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#1SPECIAL GREETINGS'
	asc	'#2Dani'8f'le et Remi HERBULOT'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#0'
	asc	'#1A big Thank you to :'
	asc	'#0'
	asc	'#0'
	asc	'#1THOMSON TO8D KEYBOARD CONTROL'
	asc	'#2C'8e'lia Thibault'
	asc	'#0'
	asc	'#1PC KEYBOARD'
	asc	'#2Mario (The cat)'
	asc	'#0'
	asc	'#1HEXA <-> DECIMAL'
	asc	'#2Casio 4000p'
	asc	'#0'
	asc	'#1AMSTRAD GAMES'
	asc	'#2Hurlements'
	asc	'#2Zombi'
	asc	'#2Sram 1 & 2'
	asc	'#2Meurtre '88' grande vitesse'
	asc	'#2Harry & Harry Mission Torpedo'
	asc	'#0'
	asc	'#1FOR MY GRADES IN FINALS'
	asc	'#2My Laser 200'
	asc	'#2My Oric Atmos'
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
	asc	'#0-Also, a big thank you to you, Athanor'27's player, and I look forward to seeing you play the sequel of your '
	asc	'adventure on your Apple IIgs!And don'27't forget, when evil will come back, we will come back too..'
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
	asc	'You have reached the end of a track leading to the abbey which can be seen far away'00
	dfb	02,00
	asc	'You walk along a path towards the abbey.Some thorny bushes lie near the edge of an embankment'00
	dfb	02,01
	asc	'They are blackberry bushes.There are even some berries remaining'00
	dfb	03,00
	asc	'Here you are, at the foot of the abbey.'00
	dfb	03,01
	asc	'A monk appears.He looks oddly stoical.'00
	dfb	03,02
	asc	'Welcome, Brother.'00
	dfb	03,03
	asc	'Please follow me.The abbot is waiting for you.I will lead you to your cell.'00
	dfb	03,04
	asc	'Leaving the abbey is forbidden.You should have remained more discreet.'00
	dfb	04,00
	asc	'From where you stand, the building seems quite imposing.'00
	dfb	05,00
	asc	'The foggy moor stretches as far as the eye can see.Otherwise, the only things of note are mossy rocks and walls and there is also a strange smell.'00
	dfb	05,01
	asc	'Many carcasses of dead birds lie here, and various bones are scattered around.'00
	dfb	05,02
	asc	'You can see a distinctively shaped arrowslit above you, but it is out of your reach.'00
	dfb	07,00
	asc	'An icy wind blasts across the moor... and the gate in the wall seems almost fossilised'00
	dfb	07,01
	asc	'It seems to be locked from the inside'00
	dfb	07,02
	asc	'A well-forged iron gate, however, time has done its works'00
	dfb	07,03
	asc	'Now it opens without any problems.'00
	dfb	21,00
	asc	'The brother asked you to wait here until the aboot arrived and you were told not to leave your cell under any circumstances.'00
	dfb	21,01
	asc	'Good morning Brother, glad to see you.You know, your presence here worries the community.The Inquisition zealously pursues any heresy.Wait! I left the door in the corridor open for you'00
	dfb	21,02
	asc	'Leaving your cell was regarded as an attempt to snoop into places that you were forbidden to enter.A stake has been prepared for you.'00
	dfb	22,00
	asc	'A sparsely furnished monastic cell.A monk is standing nearby.'00
	dfb	22,01
	asc	'Hello Brother, I am Brother Filipo, you shouldn'27't be here and I shouldn'27't be talking to you Strange things are happening in this abbey.Don'27't stay here.'00
	dfb	22,04
	asc	'Don'27't say I didn'27't warn you...'00
	dfb	22,05
	asc	'Run, fool!'00
	dfb	2202
	asc	'A, monk'27's cell.It is quite uncluttered.'00
	dfb	2203
	asc	'You notice a rope lying on the floor.It seems that the Brothers use it as a belt.'00
	dfb	23,00
	asc	'This cell is full of books.There'27's also a confortable straw mattress'00
	dfb	23,01
	asc	'The mattress seems to have been moved frequently.Someone has hidden a key under it.A strange key, though, as something seems to be missing from it.'00
	dfb	23,02
	asc	'A book is lying open on the table.There is a small note in it : Have you ever danced with the devil in the moonlight?'00
	dfb	27,00
	asc	'You find yourself in a large room, the refectory, perhaps?You hear low voices coming from the western room.The conversation seems animated.'00
	dfb	27,01
	asc	'The presence of this stranger is anything but reassuring.What do you think Brother?I think he'27's from this brotherhood.We must be careful.'00
	dfb	27,02
	asc	'You enter the room and catch the Brothers unawares.This intrusion doesn'27't please them at allYour trial was quick, but your death will be long and lingering as the fire of the stake begins to burn your feet.'00
	dfb	27,03
	asc	'You notice a symbol engraved on the wall.You'27'll try to remember it for later'00
	dfb	27,04
	asc	'Various ustensils, including a pestle.'00
	dfb	29,00
	asc	'To the west is your cell.The courtyard lies to the north.'00
	dfb	30,00
	asc	'A corridor! There is a cell to the east.'00
	dfb	31,00
	asc	'This is the end of the corridor.There are doors on both sides and a large room lies just ahead'00
	dfb	31,01
	asc	'The door is locked.What'27's more, the lock is extremely strange.'00
	dfb	31,02
	asc	'The lock has a very distinctive shape.The key that opens this door must be unique.Something seems to be stuck in the lack.It looks like a small piece of metal'00
	dfb	31,04
	asc	'Actually, it'27's a little petal shaped piece of metal.This is bizarre, why was it stuck in here?'00
	dfb	31,03
	asc	'Well done! You can now access this cell freely.'00
	dfb	3105
	asc	'Excellent! I'27'll turn a blind eye this time, Brother.Here is the strap.'00
	dfb	31,06
	asc	'Offer me something interesting and I'27'll give you this strap'00
	dfb	31,07
	asc	'Thank you, but it'27's not enough.'00
	dfb	31,08
	asc	'Brother Remigio is waiting outside his cell.'00
	dfb	31,09
	asc	'Brother Remigio grabs you as you leave his cell.He takes the strap back and stares at you with a hostile look.'00
	dfb	36,00
	asc	'These old walls seem to whisper : Have courage, Brother, I will help you !'00
	dfb	37,00
	asc	'A pleasant abbey courtyard.The sleeping quarters are to the south, and a corridor runs along the west, north and east sides, bordered by centuries-old pilars.A monastic silence reigns here'00
	dfb	38,00
	asc	'There'27's a well in the middle of the courtyard.You can see a gate at the back.'00
	dfb	39,00
	asc	'You stroll around the courtyard, but you sense that you are being watched.'00
	dfb	39,01
	asc	'You notice that Brother Salvatore'27's face is lit up.I'27've finally got the answer to this never-ending dream!Take this pendant.Thanks again..'00
	dfb	39,02
	asc	'Wearing a frantic look, he stares at you and keeps repeating : '27'The shape of the arrowslit, What shape is it?'00
	dfb	40,00
	asc	'It looks like any other well, although it is beautifully constructed.'00
	dfb	40,01
	asc	'This well is unquestionably the work of a skiful quarrier.It has rained during the last few days and God'27's presence can be felt in the rain.'00
	dfb	40,02
	asc	'The rope, weighted with its bucket, is in place.'00
	dfb	40,03
	asc	'You wind the rope and bucket carefully down to the bottom of the well, and after a few attempts.You eventually manage to retrieve a small copper bell.'00
	dfb	40,04
	asc	'You notice something shiny at the bottom.'00
	dfb	41,00
	asc	'A typical courtyard with impressive pillars and arches.'00
	dfb	41,01
	asc	'It'27's not marble, but it'27's still well built..Hey! who took a fancy to draw this symbol here? I'27'll try to remember it.'00
	dfb	42,00
	asc	'You are now in the entrance of the courtyard.The ground is covered with gravelThe partcullis is lowered.It is now impossible to leave'00
	dfb	42,01
	asc	'The parcullis looks very intimidating, and it is impossible to pass.'00
	dfb	42,03
	asc	'A bunch of pebbles here and there.'00
	dfb	42,04
	asc	'Who knows? They may come in handy.'00
	dfb	32,00
	asc	'Strolling around the courtyard.'00
	dfb	33,00
	asc	'You walk along the corridors that surround the courtyard.'00
	dfb	33,01
	asc	'Hello Brother, I do hope you don'27't have any strange intentions towards the other Brothers?A necklace would protect me. Do you have one, by any chance?I could give you a useful item in return.'00
	dfb	3302
	asc	'Yes, that'27's it, but it'27's incomplete.I'27'd like to wear it.Come back and see me when you'27've found the missing pieces.'00
	dfb	33,03
	asc	'Excellent! That'27's exactly what I was looking for! I'27'll be alone and quiet at last.Your actions are beyond gratefulness.Here, take this, it'27's an ancient stone carving of an eye.'00
	dfb	33,04
	asc	'Thanks again.Now I can repel any shady monks.'00
	dfb	34,00
	asc	'From this area of the courtyard, you can hear whispers coming from the north.'00
	dfb	35,00
	asc	'A very peaceful and suny area of the courtyard.Moreaver, a Brother has put an earthenware jar here with some plants in it.'00
	dfb	35,01
	asc	'They are medicinal herbs.They probably belong to Brother Remigio, the herbalist.'00
	dfb	35,02
	asc	'I'27'm not sure Brother Remigio would appreciate it.'00
	dfb	35,03
	asc	'You discover a partially buried flask labelled, '27'Billy-goat'27's urine'2700
	dfb	50,00
	asc	'You are at the entrance to Brother Remigio the herbalist'27's workroom.'00
	dfb	50,01
	asc	'This is Brother Remigio'27's Workroom.'00
	dfb	50,02
	asc	'There are some mortars and other ustensils - although it is difficult to work out what they are used for.'00
	dfb	50,03
	asc	'Only Brother Remigio knows what'27's inside them and I'27'm not here to take lessons in botany.'00
	dfb	52,00
	asc	'And engraved and numbered stone wall'00
	dfb	52,01
	asc	'This wall is undoubtedly solid but by looking at it more closely, you notice a series of symbols.'00
	dfb	52,02
	asc	'It'27's the correct combination.A strange code, though...You can now access the secret room!'00
	dfb	53,00
	asc	'This is Brother Remigio'27's secret room.Rare seeds, roots and rhizomes are stockpiled here along with some potions with unkown effects.Some shelves and a small workbench.'00
	dfb	53,01
	asc	'Some dried roots and leaves along with some little pouches.'00
	dfb	53,02
	asc	'More and more jars...'00
	dfb	53,04
	asc	'You carefully remove the string and smell the contents of a pouch.You feel dizzy...It would be best not to try that again.'00
	dfb	53,05
	asc	'Little pouches for collecting plants.They are tied by a piece of string.'00
	dfb	61,00
	asc	'You are in the chapel, The nave lies to the north'00
	dfb	60,00
	asc	'It seems that the brothers ring the bells from here.'00
	dfb	60,01
	asc	'Ding  dong.'00
	dfb	62,00
	asc	'An uninteresting corner of the entrance.'00
	dfb	62,01
	asc	'Hail Mary, full of grace'00
	dfb	81,01
	asc	'He is taken aback and exclaims : '27'What do you take me for ?'2700
	dfb	81,02
	asc	'I know your sin, Brother Ernesto.This will stay between us, I promise.Take these berries and have a delicious meal...Embarrassed, the Brother accepts gladly.He also buys your silence by giving you a belt, claiming that you ridicule your fellow Franciscans for walking around without a rope belt.'00
	dfb	81,03
	asc	'Go in peace, Brother.I pray to the Lord for our daily bread.'00
	dfb	63,00
	asc	'If only these walls could talk..'00
	dfb	63,01
	asc	'And they can! The proof is that this symbol certainly has a lot of things to say...I'27'll try to remember it'00
	dfb	65,00
	asc	'All these lined-up prayer stools give me a strange feeling.Maybe I should attend the church service.'00
	dfb	66,00
	asc	'Closer to you, my Lord.The altar is in front of you.There is a path to the west.'00
	dfb	66,01
	asc	'Are you serious, my son ? Show a little respect.'00
	dfb	66,02
	asc	'It is...beautiful'00
	dfb	67,00
	asc	'Pater noster qui es in caelis sanctificetur nomen tuum Adveniat regnum tuum Fiat voluntas tua sicut in caelo et in terra'00
	dfb	68,00
	asc	'A kind of store room where the Brothers can stockpile stuff that they have no use for.'00
	dfb	68,01
	asc	'It'27's a real Aladdin'27's cave, but everything in here is used and warn out.'00
	dfb	68,02
	asc	'It looks like it'27's built from stone, but in fact it'27's made of plaster.'00
	dfb	68,03
	asc	'The patina is ancient but it still looks splendid'00
	dfb	68,04
	asc	'Chipped pieces of pottery.'00
	dfb	68,05
	asc	'Perfect! You may go in peace, Brother.'00
	dfb	68,06
	asc	'Vade retro Satana.The foul stench betrayed you.Bargaining with the devil has led you directly to the stake.'00
	dfb	68,07
	asc	'The noise has drawn the abbot here.He demands the you show him your right hand.'00
	dfb	69,00
	asc	'A funeral room with richly carved tomb inside.There is also a small recess in the wall.'00
	dfb	69,01
	asc	'Little statues of gargoyles with expressive eyes.'00
	dfb	69,02
	asc	'A little recess where a statue of the Virgin Mary could be put - but instead, there is a chest.'00
	dfb	69,03
	asc	'Nothing noteworthy.'00
	dfb	69,04
	asc	'Each pair of eyes looks more frightning than the last one, but one statue has a missing eye.'00
	dfb	69,05
	asc	'It'27's more like a small casket, but there is no visible lock.'00
	dfb	69,06
	asc	'The chest is open.There is a petal-shaped piece of metal inside it.'00
	dfb	69,07
	asc	'Well done! The clicking heard against the wall reveals a secret passage.'00
	dfb	70,00
	asc	'A well hidden passage.Strange...a ring is hanging on the wall'00
	dfb	70,01
	asc	'By looking at it more closely, it seems to be a perch.'00
	dfb	70,02
	asc	'A normal ring, but something could be hung from it'00
	dfb	70,03
	asc	'A good idea, but it seems that something is missing.'00
	dfb	70,04
	asc	'Nice! The ring was made to fix this mechanism.'00
	dfb	70,05
	asc	'You'27've very single-minded! Ringing the bell produces an unexpected result.A crow just landed on the perch.It seems that he has answered your call.'00
	dfb	70,09
	asc	'You have a lot of imagination, but the crow doesn'27't! He remains indifferent to your requests.'00
	dfb	80,00
	asc	'You'27're at the entrance to the library.Silence must be maintained'00
	dfb	80,01
	asc	'Hung by fragile chains, it wouldn'27't take much to bring this lantern down.'00
	dfb	80,02
	asc	'That was well aimed.The lantern crashes to the ground.Fortunately, the Brothers aren'27't here, so nobody saw you.A pile of broken glass and metal lies at your feet.'00
	dfb	80,03
	asc	'The lantern is unusable, but you may be able to salvage a chain from it.'00
	dfb	81,00
	asc	'You progress through the library.'00
	dfb	82,00
	asc	'Nothing special here.'00
	dfb	82,01
	asc	'Such marvellous books, it'27's a very impressive collection !'00
	dfb	82,02
	asc	'Some titles here and there : '27'The Lord of the Rings, The Chronocles of Brother Cadfae!, The Name of the Rose'2700
	dfb	84,00
	asc	'More and more books.Nice lectern'00
	dfb	84,01
	asc	'An illuminator'27's lectern'00
	dfb	84,02
	asc	'Amazing! An original edition of Plato'27's Critias'00
	dfb	84,03
	asc	'ho.hum...another symbol!'00
	dfb	85,00
	asc	'You are at the rear of the library.Stones litter the ground'00
	dfb	85,01
	asc	'A letter is engraved on each stone'00
	dfb	85,02
	asc	'A sentence is engraved above the door : '27'IV lapides intrare'2700
	dfb	85,03
	asc	'There are far too many, but I can certainly use them.'00
	dfb	85,04
	asc	'This combination doesn'27't work.'00
	dfb	85,05
	asc	'Slowly, the door opens with a hoarse rumble.Congratulations!'00
	dfb	85,06
	asc	'This door is locked by a stone-based mechanism.'00
	dfb	83,00
	asc	'These shelves are full of ancient and precious books.This probably one of the biggest libraries in Christendom.'00
	dfb	83,01
	asc	'There are small recesses perched above books - but you cannot reach them.'00
	dfb	83,02
	asc	'You can'27't see them clearly from here.You'27'll have to find some way to reach them.'00
	dfb	83,03
	asc	'You put the ladder against the shelves.'00
	dfb	83,04
	asc	'Feeling nervous, you climb the rungs of the ladder, but you manage to reach the top without falling off.You find a petal-shaped piece of metal and a Greek manuscript.'00
	dfb	86,00
	asc	'You enter a small annex of the library.Some old and discarded works are to be found here.You especially notice the clover-shapped arrowslit which is very unusual indeed.'00
	dfb	86,01
	asc	'Nothing else of note, except for the clover shape.'00
	dfb	86,02
	asc	'You find a note written in a book : '27'Ernesto is a real gourmand!'2700
	dfb	88,00
	asc	'The entrance to the private cemetery within the grounds of the abbey.'00
	dfb	88,01
	asc	'Rest in peace Brother Gohin.My friend.'00
	dfb	88,02
	asc	'It'27's full of stones and it'27's much too heavy for you to carry.'00
	dfb	88,03
	asc	'Who knows? Maybe it will come in useful.'00
	dfb	89,00
	asc	'The back of the cemetery.A gate bars access to the outside.'00
	dfb	89,01
	asc	'Rocks everywhere, an ideal habitat for snakes.'00
	dfb	89,02
	asc	'This gate allows you to leave the grounds of the abbey.It'27's currently blocked by an iron bar'00
	dfb	89,03
	asc	'The gate can now be opened.'00
	dfb	89,04
	asc	'This slaughed skin confirms that snakes are roaming around here.'00
	dfb	eEOD,eEOD	; end of data

*--------------

*FINALE	ent
*	putbin	bin/FINALE.BIN	; texte

FINALE	ent
	asc	'Welcome Seth.'
	asc	'You'27've come a long way to reach Zephyr and I.'
	asc	'Thanks for the parchment.'
	asc	'It deals with the Goddess of Snakes.'
	asc	'You will meet her soon.'
	asc	'You must be asking yourself a lot of questions right now.'
	asc	'Your arrival at the abbey was not a coincidence.'
	asc	'The Brotherhood of Scholars sent you.'
	asc	'You are a follower of Khar, an Atlantean survivor.'
	asc	'Yes, you read that well, Atlanteans..'
	asc	'Your name is Seth; that is your real identity among this group.'
	asc	'The Atlanteans almost entirely disappeared at the time of the Great Cataclysm 12000 years ago, but the gate that shuts their world has not been sealed.'
	asc	'A threat hangs over this group of survivors once more,'
	asc	' because the gods become angry when their creations take a different path from the one they have shown them.'
	asc	'The Great Atlantean architect Eliphas has hidden seven artefacts under some of his buildings.'
	asc	'You must find them - and allow the definitive closure of the gate leading to the Atlanteans'27' world!'
	asc	'The artefacts have awakened; I am just an emanation generated by the one hidden in the abbey.'
	asc	'Your adventure has only just begun, Seth.'
	asc	'Unseal this envelope and you will gain possession of the first artefact.'
	asc	'Your time has come.'
	asc	'On the way, many threats await you in the shadows, and remember that Aaradia is probably the most determined of all.'
	asc	'She is a powerful Atlantean who harbours sinister intentions and she will stop at nothing to obtain the artefacts.'
	asc	'Good luck Seth, and do not forget, I will contact you again soon.'
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
