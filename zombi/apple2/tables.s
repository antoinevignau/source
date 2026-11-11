*
* Zombi
*
* (c) 1986, Yannick Cadin et Ubisoft
* (c) 2026, Brutal Deluxe Software (Apple II)
*

	mx	%00
	lst	off

*-------------------------------
* REGLES
*-------------------------------
* Il faut trouver de l'essence pour partir en hélicoptère
* Il faut mettre un fusible pour avoir l'électricité au sous-sol
* Sans électricité, on a le masque (MASK.NEO) visible
* Les skin-heads cherchent la nourriture
* Les morts-vivants cherchent de la chair humaine

* Le temps : 
*  Le temps démarre à 11h15
*  Une minute de jeu pour 5 secondes réelles
*  La nuit est de 22h à 6h 

*-------------------------------
* COORDONNEES ECRAN
*-------------------------------
*
* Personnages
*  1 :  12,4,43,35
*  2 :  52,4,83,35
*  3 :  92,4,123,35
*  4 : 132,4,163,35
*  5 : 180,4,211,35

* Cartouche de droite
*  Nom : affichage 234,4
*    1 : 228,20,259,51
*    2 : 276,20,307,51
*    F : 232,64,311,70 - Force (80)
*    H : 232,80,311,86 - Habileté (80)
*    S : 232,96,311,102 - Santé (80)
*        couleur de fond : index 11
*          couleur rouge : index 12

* Lieu
*   Ecran : 8,48,167,127
*    Haut : 76,40,100,47
*  Gauche : 0,76,7,100
*  Droite : 168,76,175,100
*     Bas : 76,128,100,135

* Texte (à ajuster)
*  Gauche : 30,145,147,155 - affichage 31,146
*  Droite : 248,119,287,127 - affichage 249,120

* Icônes
*   Sauver : 27,169,55,198
*  Quitter : 59,169,87,198
*  Charger : 91,169,119,198
*   Outils : 123,169,151,198

* Logo UBI Soft : 260,170,318,193

*------------------------------
* LES RECTANGLES DES PERSONNAGES
*------------------------------

tblPERSO_X1	dw	12,52,92,132,180,228,276
tblPERSO_X2	dw	43,83,123,161,211,259,307
tblPERSO_Y1	dw	4,4,4,4,4,20,20
tblPERSO_Y2	dw	35,35,35,35,35,51,51

rectPERSO	dw	0,0,0,0

*------------------------------
* LES RECTANGLES DU PERSONNAGE
*------------------------------

rectDEBUT	=	232	; début + valeur (F/H/S)
rectFIN	=	311	; détermine la fin

rectFORCE_R	dw	64,232,71,311	; d'abord l'actif
rectFORCE_F	dw	64,232,71,312	; puis l'inactif

rectHABILETE_R	dw	80,232,87,311
rectHABILETE_F	dw	80,232,87,312

rectSANTE_R	dw	96,232,103,311
rectSANTE_F	dw	96,232,103,312

*-------------------------------
* PLAN
*-------------------------------
*
* Chaque niveau est de 8x7
*  Gauche = -1 sur la même ligne
*  Droite = +1 sur la même ligne
*  Avance = -8 sur la colonne précédente
*              si 0, monter de +56
*  Recule = +8 sur la colonne suivante
*              si 0, descendre de -56

xPLAN_MIN	=	1
xPLAN_MAX	=	8
yPLAN_MIN	=	1
yPLAN_MAX	=	7

PLAN_DEBUT	=	0
PLAN_TAILLE	=	8*7
PLAN_FIN	=	6*PLAN_TAILLE

refPLAN_INDEX	=	PLAN_FIN-20
refPLAN_X	=	5	; entre 1 et 8
refPLAN_Y	=	5	; entre 1 et 7

PLAN

* Sous-sol
	hex	0000000000000000
	hex	060708090A0B0000
	hex	050000000C000000
	hex	041011000D000000
	hex	0300000F0E000000
	hex	0201000000000000
	hex	0000000000000000

* 1er niveau
	hex	52003F0046000000
	hex	4020212247000000
	hex	531D1E1F4248494A
	hex	541A1B1C00000045
	hex	551516171819004B
	hex	561213140000004C
	hex	434D414E4F505144

* 2ème niveau
	hex	0000000000000000
	hex	0023240000000000
	hex	0000252600000000
	hex	0027282900000000
	hex	00002A2B2C2D0000
	hex	00002E002F000000
	hex	0000000000000000

* 3ème niveau
	hex	0000000000000000
	hex	0030310000000000
	hex	0000323300000000
	hex	0000340000000000
	hex	0035363738390000
	hex	0000003A00000000
	hex	0000000000000000

* 4ème niveau
	hex	0000000000000000
	hex	00003B0000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	00000000003C0000
	hex	0000000000000000
	hex	0000000000000000

* Terrasse
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	000000003E3D0000	; Démarre en 3E
	hex	0000000000000000
	hex	0000000000000000

*-------------------------------
* LES SALLES NOIRES
*-------------------------------

SALLES_SOMBRES
	dfb	2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17
	dfb	-1
	
*-------------------------------
* NOMBRE DE ZOMBIES PAR SALLE
*-------------------------------

* Le skin-head sera en salle 78

zENSALLE	dfb	0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0
	dfb	1,0,0,5,0,0,2,1,1,0,0,1,1,0,3,4
	dfb	5,0,0,2,0,1,0,2,0,1,0,1,0,0,1,2
	dfb	1,1,1,0,1,0,1,0,1,0,1,0,0,0,0,2
	dfb	1,1,1,1,1,1,1,1,1,1,1,0,0,1,0,0
	dfb	0,-1,-1
	
*-------------------------------
* OBJETS
*-------------------------------

	hex	01020000
	hex	01028000
	hex	01010001
	hex	01014001
	hex	01028001
	hex	01020002
	hex	01018002
	hex	0101C002
	hex	01020003
	hex	01018003
	hex	0101C003
	hex	01020004
	hex	01028004
	hex	01010005
	hex	01014005
	hex	01028005
	hex	01020006
	hex	01018006
	hex	0101C006
	hex	01020007
	hex	01018007
	hex	0101C007
	hex	02020008
	hex	02020009
	hex	0201000A
	hex	0101800A
	hex	0101C00A
	hex	0101000B
	hex	0201400B
	hex	0101C00B
	hex	0201000C
	hex	0101800C
	hex	0101C00C
	hex	0101000D
	hex	0101400D
	hex	0101800D
	hex	0101C00D
	hex	0101000E
	hex	0101400E
	hex	0101800E
	hex	0101C00E
	hex	0101000F
	hex	0101400F
	hex	0101800F
	hex	0101C00F
	hex	02010010
	hex	01018010
	hex	0101C010
	hex	02010011
	hex	02018011
	hex	02010012
	hex	02018012
	hex	01010013
	hex	01014013
	hex	01018013
	hex	0201C013
	hex	02014014
	hex	0101C014
	hex	01010015
	hex	01014015
	hex	02028015
	hex	01018016
	hex	0101C016
	hex	01010017
	hex	01024017
	hex	0102C017

*-------------------------------
* PERSONNAGES
*-------------------------------	; Sprite
			;   Mort
persoALEXANDRE	asc	'Alexandre'00	; 1 5 - Bonan
persoSYLVIE	asc	'Sylvie'00	; 2 6 - ?
persoYANNICK	asc	'Yannick'00	; 3 7 - Cadin
persoPATRICK	asc	'Patrick'00	; 4 8 - Daher
	
*-------------------------------
* CURSOR
*-------------------------------

theCURSOR	hex	F0000000
	hex	FF000000
	hex	FFF00000
	hex	FFFF0000
	hex	FFFFF000
	hex	FFFFFF00
	hex	FFFFFFF0
	hex	FFFFFFFF
	hex	FFFFF000
	hex	FF0FF000
	hex	F000FF00
	hex	0000FF00
	hex	00000FF0
	hex	00000FF0
	
*-------------------------------
* GFX DIMENSIONS
*-------------------------------

boutonSIZE	dw	0,0,17,89	;  1 0000,0000,0011,0059

echecSIZE	dw	0,0,288,112	;  1 0000,0000,0120,0070

lieuxSIZE	dw	0,0,160,80	;  1 0000,0000,00A0,0050 
	dw	0,0,160,80	;  2 0000,0000,00A0,0050 
	dw	0,0,160,80	;  3 0000,0000,00A0,0050 
	dw	0,0,160,80	;  4 0000,0000,00A0,0050 
	dw	0,0,160,80	;  5 0000,0000,00A0,0050 
	dw	0,0,160,80	;  6 0000,0000,00A0,0050 
	dw	0,0,160,80	;  7 0000,0000,00A0,0050 
	dw	0,0,160,80	;  8 0000,0000,00A0,0050 
	dw	0,0,160,80	;  9 0000,0000,00A0,0050 
	dw	0,0,160,80	; 10 0000,0000,00A0,0050 
	dw	0,0,160,80	; 11 0000,0000,00A0,0050 
	dw	0,0,160,80	; 12 0000,0000,00A0,0050 
	dw	0,0,160,80	; 13 0000,0000,00A0,0050 
	dw	0,0,160,80	; 14 0000,0000,00A0,0050 
	dw	0,0,160,80	; 15 0000,0000,00A0,0050 
	dw	0,0,160,80	; 16 0000,0000,00A0,0050 
	dw	0,0,160,80	; 17 0000,0000,00A0,0050 
	dw	0,0,160,80	; 18 0000,0000,00A0,0050 
	dw	0,0,160,80	; 19 0000,0000,00A0,0050 
	dw	0,0,160,80	; 20 0000,0000,00A0,0050 
	dw	0,0,160,80	; 21 0000,0000,00A0,0050 
	dw	0,0,160,80	; 22 0000,0000,00A0,0050 
	dw	0,0,160,80	; 23 0000,0000,00A0,0050 
	dw	0,0,160,80	; 24 0000,0000,00A0,0050 
	dw	0,0,160,80	; 25 0000,0000,00A0,0050 
	dw	0,0,160,80	; 26 0000,0000,00A0,0050 
	dw	0,0,160,80	; 27 0000,0000,00A0,0050 
	dw	0,0,160,80	; 28 0000,0000,00A0,0050 
	dw	0,0,160,80	; 29 0000,0000,00A0,0050 
	dw	0,0,160,80	; 30 0000,0000,00A0,0050 
	dw	0,0,160,80	; 31 0000,0000,00A0,0050 
	dw	0,0,160,80	; 32 0000,0000,00A0,0050 
	dw	0,0,160,80	; 33 0000,0000,00A0,0050 
	dw	0,0,160,80	; 34 0000,0000,00A0,0050 
	dw	0,0,160,80	; 35 0000,0000,00A0,0050 
	dw	0,0,160,80	; 36 0000,0000,00A0,0050 
	dw	0,0,160,80	; 37 0000,0000,00A0,0050 
	dw	0,0,160,80	; 38 0000,0000,00A0,0050 
	dw	0,0,160,80	; 39 0000,0000,00A0,0050 
	dw	0,0,160,80	; 40 0000,0000,00A0,0050 
	dw	0,0,160,80	; 41 0000,0000,00A0,0050 
	dw	0,0,160,80	; 42 0000,0000,00A0,0050 
	dw	0,0,160,80	; 43 0000,0000,00A0,0050 
	dw	0,0,160,80	; 44 0000,0000,00A0,0050 
	dw	0,0,160,80	; 45 0000,0000,00A0,0050 hall niveau 2
	dw	1,0,160,80	; 46 0001,0000,00A0,0050 
	dw	0,0,160,80	; 47 0000,0000,00A0,0050 
	dw	0,0,160,80	; 48 0000,0000,00A0,0050 
	dw	0,0,160,80	; 49 0000,0000,00A0,0050 
	dw	0,0,160,80	; 50 0000,0000,00A0,0050 
	dw	0,0,160,80	; 51 0000,0000,00A0,0050 dans la pharmacie
	dw	0,0,160,80	; 52 0000,0000,00A0,0050 couloir pharmacie
	dw	0,0,160,80	; 53 0000,0000,00A0,0050 magasin sports 3000
	dw	0,0,160,80	; 54 0000,0000,00A0,0050 devanture sports 3000
	dw	0,0,160,80	; 55 0000,0000,00A0,0050 contactez ubi soft
	dw	0,0,160,80	; 56 0000,0000,00A0,0050 vous êtes programmeur ?
	dw	0,0,160,80	; 57 0000,0000,00A0,0050 hall niveau 3
	dw	0,0,160,80	; 58 0000,0000,00A0,0050 magasin d'électronique
	dw	0,0,160,80	; 59 0000,0000,00A0,0050 
	dw	0,0,160,80	; 60 0000,0000,00A0,0050 hall niveau 4
	dw	0,0,160,80	; 61 0000,0000,00A0,0050 hall rdc
	dw	0,0,160,80	; 62 0000,0000,00A0,0050 hélicoptère (1ère salle)
	dw	0,0,160,80	; 63 0000,0000,00A0,0050 
	dw	0,0,160,80	; 64 0000,0000,00A0,0050 
	dw	0,0,160,80	; 65 0000,0000,00A0,0050 
	dw	0,0,160,80	; 66 0000,0000,00A0,0050 
	dw	0,0,160,80	; 67 0000,0000,00A0,0050 
	dw	0,0,160,80	; 68 0000,0000,00A0,0050 
	dw	0,0,160,80	; 69 0000,0000,00A0,0050 
	dw	0,0,160,80	; 70 0000,0000,00A0,0050 
	dw	0,0,160,80	; 71 0000,0000,00A0,0050 
	dw	0,0,160,80	; 72 0000,0000,00A0,0050 
	dw	0,0,160,80	; 73 0000,0000,00A0,0050 
	dw	0,0,160,80	; 74 0000,0000,00A0,0050 
	dw	0,0,160,80	; 75 0000,0000,00A0,0050 cabine camion
	dw	0,0,160,80	; 76 0000,0000,00A0,0050 cabine hélicoptère
	dw	0,0,160,79	; 77 0000,0000,00A0,0050 camion de face
	dw	0,0,160,80	; 78 0000,0000,00A0,0050 fourgonnette de face
	dw	0,0,160,80	; 79 0000,0000,00A0,0050 jumelle vue 1
	dw	1,0,160,80	; 80 0001,0000,00A0,0050 jumelle vue 2
	dw	0,0,160,80	; 81 0000,0000,00A0,0050 morts-vivants 1
	dw	0,0,160,80	; 82 0000,0000,00A0,0050 morts-vivants 2

objectSIZE	dw	0,0,16,32	;  1 0000,0000,0010,0020 77 porte fermée du camion
	dw	0,0,16,32	;  2 0000,0000,0010,0020 62 porte fermée de l'hélicoptère
	dw	0,0,16,16	;  3 0000,0000,0010,0010 78 porte arrière fermée de la fourgonnette
	dw	0,0,16,16	;  4 0000,0000,0010,0010 62 porte arrière fermée de l'hélicoptère
	dw	0,0,16,32	;  5 0000,0000,0010,0020 35 fenêtre fermée du fast-food
	dw	0,0,16,32	;  6 0000,0000,0010,0020 38 fenêtre fermée de l'outillage
	dw	0,0,16,16	;  7 0000,0000,0010,0010 17 boîte à fusibles fermée
	dw	0,0,16,16	;  8 0000,0000,0010,0010 51 boîte fermée de la pharmacie
	dw	0,0,16,32	;  9 0000,0000,0010,0020 52 porte fermée du couloir de la pharmacie
	dw	0,0,16,16	; 10 0000,0000,0010,0010 58 boîte fermée de l'électronique
	dw	0,0,16,16	; 11 0000,0000,0010,0010 38 boîte fermée de l'outillage
	dw	0,0,17,32	; 12 0000,0000,0011,0020 77 porte ouverte du camion
	dw	0,0,16,32	; 13 0000,0000,0010,0020 62 porte ouverte de l'hélicoptère
	dw	0,0,16,16	; 14 0000,0000,0010,0010 78 porte ouverte de la fourgonnette
	dw	0,0,16,16	; 15 0000,0000,0010,0010 62 porte arrière ouverte de l'hélicoptère
	dw	0,0,16,32	; 16 0000,0000,0010,0020 35 fenêtre ouverte du fast-food
	dw	0,0,16,32	; 17 0000,0000,0010,0020 38 fenêtre ouverte de l'outillage
	dw	0,0,16,16	; 18 0000,0000,0010,0010 17 boîte à fusibles ouverte
	dw	0,0,16,16	; 19 0000,0000,0010,0010 51 boîte ouverte de la pharmacie
	dw	0,0,16,32	; 20 0000,0000,0010,0020 52 porte ouverte du couloir de la pharmacie
	dw	0,0,16,16	; 21 0000,0000,0010,0010 58 boîte ouverte de l'électronique
	dw	0,0,16,16	; 22 0000,0000,0010,0010 38 boîte ouverte de l'outillage
	dw	0,15,26,17	; 23 0000,000F,001A,0011 23 chariot "caddie"
	dw	2,15,27,17	; 24 0002,000F,001B,0011 15 chariot
	dw	0,7,32,9	; 25 0000,0007,0020,0009 skin-head allongé
	dw	1,3,14,13	; 26 0001,0003,000E,000D 51 trousse de secours dans la pharmacie
	dw	0,7,14,9	; 27 0000,0007,000E,0009 41 pistolet dans l'armurerie
	dw	0,5,16,11	; 28 0000,0005,0010,000B 41 revolver dans l'armurerie
	dw	0,7,32,9	; 29 0000,0007,0020,0009 41 fusil dans l'armurerie
	dw	0,13,15,3	; 30 0000,000D,000F,0003 38 tournevis dans l'outillage
	dw	1,7,28,9	; 31 0001,0007,001C,0009 38 hache dans l'outillage
	dw	0,8,16,8	; 32 0000,0008,0010,0008 38 marteau dans l'outillage
	dw	4,1,8,15	; 33 0004,0001,0008,000F 47 talkie-walkie dans le bureau
	dw	0,7,14,9	; 34 0000,0007,000E,0009 53 corde chez Sports 3000
	dw	0,7,14,9	; 35 0000,0007,000E,0009 26 tuyau d'arrosage chez le fleuriste
	dw	0,10,16,6	; 36 0000,000A,0010,0006 38 lampe-torche dans l'outillage
	dw	2,6,11,10	; 37 0002,0006,000B,000A 28 paire de jumelles chez l'opticien
	dw	0,9,16,7	; 38 0000,0009,0010,0007 52 paire de gants dans le couloir de la pharmacie
	dw	2,4,11,12	; 39 0002,0004,000B,000C 21 livre chez le libraire
	dw	0,12,15,4	; 40 0000,000C,000F,0004 59 clé jaune du camion dans le bureau technique
	dw	0,11,15,5	; 41 0000,000B,000F,0005 59 clé rouge/bleue du camion dans le bureau technique
	dw	0,9,14,7	; 42 0000,0009,000E,0007 47 clé double rouge/bleue dans le bureau
	dw	2,9,13,7	; 43 0002,0009,000D,0007 48 cassette vidéo chez Video Z
	dw	0,12,5,4	; 44 0006,000C,0005,0004 58 fusible chez l'électronique
	dw	0,1,15,15	; 45 0000,0001,000F,000F 52 jerrican dans le couloir de la pharmacie
	dw	0,5,32,11	; 46 0000,0005,0020,000B mort-vivant allongé
	dw	5,6,6,8	; 47 0005,0006,0006,0008 35 soda dans le fast-food
	dw	3,8,9,6	; 48 0003,0008,0009,0006 35 sandwich dans le fast-food
	dw	0,0,32,16	; 49 0000,0000,0020,0010 34 lit vide dans le magasin de meubles
	dw	4,1,28,11	; 50 0004,0001,001C,000B 34 lit occupé dans le magasin de meubles
	dw	0,0,32,16	; 51 0000,0000,0020,0010 29 boîtier sous télévision éteint dans magasin hi-fi
	dw	0,0,32,16	; 52 0000,0000,0020,0010 29 télévision éteinte dans magasin hi-fi
	dw	0,0,16,16	; 53 0000,0000,0010,0010 59 angle de bureau éteint dans bureau technique
	dw	0,0,16,16	; 54 0000,0000,0010,0010 75 camion au point mort
	dw	0,0,16,14	; 55 0000,0000,0010,000E éteint
	dw	0,0,32,16	; 56 0000,0000,0020,0010 29 boîtier sous télévision allumé dans magasin hi-fi
	dw	0,0,32,16	; 57 0000,0000,0020,0010 29 télévision allumée 1 dans magasin hi-fi
	dw	0,0,16,16	; 58 0000,0000,0010,0010 59 angle de bureau allumé dans bureau technique
	dw	0,0,16,16	; 59 0000,0000,0010,0010 75 camion vitesse enclenchée
	dw	0,0,16,14	; 60 0000,0000,0010,000E allumé
	dw	0,0,32,32	; 61 0000,0000,0020,0020 29 télévision allumée 2 dans magasin hi-fi
	dw	0,0,16,16	; 62 0000,0000,0010,0010 75 pédale d'accélérateur enfoncée
	dw	0,0,16,16	; 63 0000,0000,0010,0010 manche à balai
	dw	6,6,6,9	; 64 0006,0006,0006,0009 8/49 boîtier asscenseur allumé
	dw	0,0,16,32	; 65 0000,0000,0010,0020 boîtier
	dw	0,0,16,32	; 66 0000,0000,0010,0020 39 ordinateur allumé
	dw	0,0,30,46	; 67 0000,0000,002E,002E cadre choix action sur écran principal

skinsSIZE	dw	0,7,32,52	;  1 0000,0007,0020,0034 Déplacement vers la gauche 1
	dw	0,3,26,56	;  2 0000,0003,001A,0038 Déplacement vers la gauche 2
	dw	0,4,37,55	;  3 0000,0004,0025,0037 Déplacement vers la gauche 3
	dw	0,6,44,53	;  4 0000,0006,002C,0035 Déplacement vers la gauche 4
	dw	0,3,30,56	;  5 0000,0003,001E,0038 Déplacement vers la gauche 5
	dw	0,4,33,55	;  6 0000,0004,0021,0037 Meurt vers la gauche 1
	dw	0,0,28,59	;  7 0000,0000,001C,003B Meurt vers la gauche 2
	dw	0,11,40,48	;  8 0000,000B,0028,0030 Meurt vers la gauche 3
	dw	0,23,69,36	;  9 0000,0017,0045,0024 Meurt vers la gauche 4
	dw	0,42,76,17	; 10 0000,002A,004C,0011 Meurt vers la gauche 5
	dw	0,7,32,52	; 11 0000,0007,0020,0034 Déplacement vers la droite 1
	dw	0,3,26,56	; 12 0000,0003,001A,0038 Déplacement vers la droite 2
	dw	0,4,37,55	; 13 0000,0004,0025,0037 Déplacement vers la droite 3
	dw	0,6,44,53	; 14 0000,0006,002C,0035 Déplacement vers la droite 4
	dw	0,3,30,56	; 15 0000,0003,001E,0038 Déplacement vers la droite 5
	dw	0,4,33,55	; 16 0000,0004,0021,0037 Meurt vers la droite 1
	dw	0,0,28,59	; 17 0000,0000,001C,003B Meurt vers la droite 2
	dw	0,11,40,48	; 18 0000,000B,0028,0030 Meurt vers la droite 3
	dw	0,23,69,36	; 19 0000,0017,0045,0024 Meurt vers la droite 4
	dw	0,42,92,17	; 20 0000,002A,004C,0011 Meurt vers la droite 5
	dw	0,0,59,49	; 21 0000,0000,003B,0031 Bagarre 1
	dw	0,1,59,48	; 22 0000,0001,003B,0030 Bagarre 2

tetesSIZE	dw	0,0,32,32	;  1 0000,0000,0020,0020 Alexandre vivant
	dw	0,0,32,32	;  2 0000,0000,0020,0020 Sylvie vivante
	dw	0,1,32,31	;  3 0000,0001,0020,001F Yannick vivant
	dw	0,0,32,32	;  4 0000,0000,0020,0020 Patrick vivant
	dw	0,0,32,32	;  5 0000,0000,0020,0020 Alexandre mort
	dw	0,1,32,31	;  6 0000,0001,0020,001F Sylvie morte
	dw	0,1,32,31	;  7 0000,0001,0020,001F Yannick mort
	dw	0,0,32,32	;  8 0000,0000,0020,0020 Patrick mort
	dw	0,0,32,32	;  9 0000,0000,0020,0020 Croix
	dw	5,2,21,28	; 10 0005,0002,0015,001C Mort-vivant
	dw	0,3,32,29	; 11 0000,0003,0020,001D Skin
	
victoireSIZE	dw	0,0,288,112	;  1 0000,0000,0120,0070 

zSIZE	dw	0,4,32,55	;  1 0000,0004,0020,0037 Déplacement vers la gauche 1
	dw	1,1,24,58	;  2 0001,0001,0018,003A Déplacement vers la gauche 2
	dw	1,2,27,57	;  3 0001,0002,001B,0039 Déplacement vers la gauche 3
	dw	1,4,32,55	;  4 0001,0004,0020,0037 Déplacement vers la gauche 4
	dw	1,1,23,58	;  5 0001,0001,0017,003A Déplacement vers la gauche 5
	dw	1,3,27,56	;  6 0001,0003,001B,0038 Meurt vers la gauche 1
	dw	0,0,28,59	;  7 0000,0000,001C,003B Meurt vers la gauche 2
	dw	0,9,36,51	;  8 0000,0009,0024,0033 Meurt vers la gauche 3
	dw	0,22,59,38	;  9 0000,0016,003B,0026 Meurt vers la gauche 4
	dw	0,43,73,17	; 10 0000,002B,0049,0011 Meurt vers la gauche 5
	dw	0,4,32,55	; 11 0000,0004,0020,0037 Déplacement vers la droite 1
	dw	0,1,24,58	; 12 0000,0001,0018,003A Déplacement vers la droite 2
	dw	0,2,27,57	; 13 0000,0002,001B,0039 Déplacement vers la droite 3
	dw	0,4,32,55	; 14 0000,0004,0020,0037 Déplacement vers la droite 4
	dw	0,1,23,58	; 15 0000,0001,0017,003A Déplacement vers la droite 5
	dw	0,3,27,56	; 16 0000,0003,001B,0038 Meurt vers la droite 1
	dw	0,0,28,59	; 17 0000,0000,001C,003B Meurt vers la droite 2
	dw	0,9,36,51	; 18 0000,0009,0024,0033 Meurt vers la droite 3
	dw	0,22,59,38	; 19 0000,0016,003B,0026 Meurt vers la droite 4
	dw	0,43,73,17	; 20 0000,002B,0049,0011 Meurt vers la droite 5
	dw	7,3,52,46	; 21 0007,0003,0034,002E Bagarre 1
	dw	0,0,59,49	; 22 0000,0000,003B,0031 Bagarre 2
