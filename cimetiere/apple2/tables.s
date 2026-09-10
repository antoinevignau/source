*
* Le cimetière des ocelots
*
* (c) 2026, Turk182
* (c) 2026, Brutal Deluxe Software
*

*-------------------------------
* OBJETS
*-------------------------------
			; ID Ro FOUILLER 
tblOBJETS	dfb	0	;  1  1 FOUILLER STATUE ou OCELOT
	dfb	0	;  2  6 FOUILLER CABANE
	dfb	23	;  3 23 UTILISER PIERRE
	dfb	0	;  4  5 FOUILLER CHENE
	dfb	0	;  5 30 FOUILLER TOMBE
	dfb	0	;  6 22 FOUILLER ATELIER
	dfb	0	;  7 22 FOUILLER ATELIER
	dfb	0	;  8 18 UTILISER TREUIL
	dfb	0	;  9 32 FOUILLER TOUR
	dfb	0	; 10 31 FOUILLER JARDIN ou PLANTE
	dfb	0	; 11 52 FOUILLER MASQUE
	dfb	0	; 12 27 FOUILLER BLASON
	dfb	0	; 13 55 UTILISER CRAIE
	dfb	0	; 14 13 FOUILLER ROCHER
	dfb	0	; 15 27 FOUILLER TABLE
	dfb	0	; 16 34 FOUILLER SOL (POUR LA CRAIE)
	dfb	0	; 17 33 UTILISER CLOCHETTE
	dfb	0 	; 18 25 FOUILLER DEBRIS
	dfb	0	; 19 54 FOUILLER BIBLIOTHEQUE
	dfb	0	; 20 28 FOUILLER FORGE
	dfb	0	; 21 41 FOUILLER ANCRE
	dfb	0	; 22  2 FOUILLER FOUGERE
	dfb	0	; 23 34 FOUILLER SOCLE
	dfb	0	; 24 63 PLACER DENT
	dfb	0	; 25 26 FOUILLER PUITS
	dfb	0	; 26 54 FOUILLER RAYON
	dfb	0	; 27 34 FOUILLER STELE (POUR LE FRAGMENT)
	dfb	0	; 28 62/63 UTILISER CLE
	dfb	0	; 29 50 FOUILLER ARBRE
	dfb	0	; 30 43 FOUILLER TOILE
	dfb	0	; 31 46 FOUILLER CASCADE
	dfb	0	; 32 49 FOUILLER FLEUR

*-------------------------------
* DIRECTIONS (N/S/O/E)
*-------------------------------
	
tblDIRECTIONS	dfb	0,9,0,2	;  1 Chemin des Ocelots
	dfb	0,10,1,3	;  2 Sentier des fougères
	dfb	0,0,2,4	;  3 Pont de bois
	dfb	0,12,3,5	;  4 Ruisseau
	dfb	0,13,4,6	;  5 Chêne
	dfb	0,14,5,7	;  6 Cabane abandonnée
	dfb	0,0,6,8
	dfb	0,0,7,0
	dfb	1,0,0,10
	dfb	2,0,9,11
	dfb	0,0,10,12
	dfb	4,0,11,13
	dfb	5,0,12,14
	dfb	6,22,13,15	; 14 Chemin des racines
	dfb	7,0,14,16
	dfb	8,0,15,0
	dfb	0,0,0,18
	dfb	0,0,17,19
	dfb	0,0,18,20
	dfb	0,28,19,21
	dfb	0,29,20,22
	dfb	14,0,21,23	; 22
	dfb	0,0,22,24
	dfb	0,0,23,0
	dfb	0,33,0,26
	dfb	0,0,25,27
	dfb	0,0,26,28
	dfb	20,0,27,29
	dfb	21,0,28,30
	dfb	0,0,29,31
	dfb	0,0,30,32
	dfb	25,0,31,0
	dfb	25,41,0,34
	dfb	0,0,33,35
	dfb	0,0,34,36
	dfb	0,0,35,37
	dfb	0,0,36,38
	dfb	0,0,37,39
	dfb	0,0,38,40
	dfb	0,48,39,0
	dfb	33,49,0,42
	dfb	0,0,41,43
	dfb	0,0,42,44
	dfb	0,0,43,45
	dfb	0,0,44,46
	dfb	0,0,45,47
	dfb	0,55,33,48
	dfb	40,56,47,0
	dfb	41,57,0,50
	dfb	0,0,49,51
	dfb	0,0,50,52
	dfb	0,0,51,53
	dfb	0,0,52,54
	dfb	41,0,53,0
	dfb	47,0,0,56
	dfb	48,0,55,0
	dfb	49,0,0,58
	dfb	0,0,57,59
	dfb	0,0,58,60
	dfb	0,0,59,61
	dfb	0,0,60,62
	dfb	0,0,61,63
	dfb	0,0,62,64
	dfb	0,0,63,0

*-------------------------------
* TABLE 8890 (GE, GF)
*-------------------------------

tbl8890	dw	1422,1
	dw	2028,8
	dw	3334,17
	dw	3435,37
	dw	3536,14
	dw	3637,2
	dw	3940,12
	dw	4048,5
	dw	4445,39
	dw	4149,21
	dw	4755,32
	dw	5859,9
	dw	6061,13
	dw	5556,16
	dw	4957,38
	dw	chrNULL
	
*-------------------------------
* TABLE 11000 (SALLE, DRAPEAU, INDEX)
*-------------------------------

tbl11000	dfb	6,1,4
	dfb	14,1,1
	dfb	18,2,8
	dfb	21,1,18
	dfb	25,2,18
	dfb	29,1,25
	dfb	31,1,10
	dfb	32,1,41
	dfb	33,1,17
	dfb	35,1,23
	dfb	36,1,2
	dfb	39,1,12
	dfb	40,1,5
	dfb	41,1,21
	dfb	43,1,30
	dfb	44,1,39
	dfb	46,2,31
	dfb	52,1,35
	dfb	53,2,24
	dfb	55,1,16
	dfb	58,1,9
	dfb	60,1,13
	dfb	62,2,28
	dfb	63,1,28
	dfb	chrNULL	
