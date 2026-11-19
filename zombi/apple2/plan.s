*
* Zombi
*
* (c) 1986, Yannick Cadin et Ubisoft
* (c) 2026, Brutal Deluxe Software (Apple II)
*

	mx	%00
	lst	off

*-------------------------------
* PLAN
*-------------------------------
*
* Il y a 6 niveaux
* Chaque niveau est de 7 lignes de 8 colonnes
*  Gauche = -1 sur la même ligne
*  Droite = +1 sur la même ligne
*  Avance = -8 sur la colonne précédente
*              si 0, monter de +56
*  Recule = +8 sur la colonne suivante
*              si 0, descendre de -56

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

