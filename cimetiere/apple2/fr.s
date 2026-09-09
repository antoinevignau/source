*
* Le cimetire des ocelots
*
* (c) 2026, Turk182
* (c) 2026, Brutal Deluxe Software
*

*-------------------------------
* VERBES
*-------------------------------

tblV	dfb	0	; value if not found
	dfb	1,1,2,2,3,3,4,4,7,7,7
	dfb	10,11,12,13,14,15,16,17,18,19
	dfb	20,21,22,23,24,25,26,27,28,29
	dfb	30,31,32,33,34,35,36,37,38,39,39
	dfb	40,41,42,43,44,45,46,10,28
	dfb	90,90,91,91,92,93
	
tblVERB	str	'N'	;  1 NORD
	str	'NORD'	;  1 NORD
	str	'S'	;  2 SUD
	str	'SUD'	;  2 SUD
	str	'O'	;  3 OUEST
	str	'OUEST'	;  3 OUEST
	str	'E'	;  4 EST
	str	'EST'	;  4 EST
	str	'I'	;  7 INVENTAIRE
	str	'INV '	;  7 INVENTAIRE
	str	'INVE'	;  7 INVENTAIRE
	str	'ALLE'	; 10 ALLER
	str	'ALLU'	; 11 ALLUMER
	str	'ARRA'	; 12 ARRACHER
	str	'ASSE'	; 13 ASSEMBLER
	str	'ATTA'	; 14 ATTACHER
	str	'BOI'	; 15 BOIS/BOIRE
	str	'CHER'	; 16 CHERCHER
	str	'CREU'	; 17 CREUSER
	str	'DESC'	; 18 DESCENDRE
	str	'DONN'	; 19 DONNER
	str	'ECOU'	; 20 ECOUTER
	str	'ENTR'	; 21 ENTRER
	str	'ETEI'	; 22 ETEINDRE
	str	'EXAM'	; 23 EXAMINER
	str	'FOUI'	; 24 FOUILLER
	str	'FRAP'	; 25 FRAPPER
	str	'JET'	; 26 JETTE
	str	'JOUE'	; 27 JOUER
	str	'LIRE'	; 28 LIRE
	str	'MET'	; 29 METS/METTRE
	str	'MONT'	; 30 MONTER
	str	'OUVR'	; 31 OUVRIR
	str	'PARL'	; 32 PARLER
	str	'PASS'	; 33 PASSER
	str	'PLAC'	; 34 PLACER
	str	'PORT'	; 35 PORTER
	str	'POSE'	; 36 POSER
	str	'POUS'	; 37 POUSSER
	str	'PREN'	; 38 PRENDRE
	str	'R'	; 39 R
	str	'REGA'	; 39 REGARDER
	str	'REMP'	; 40 REMPLIR
	str	'TIRE'	; 41 TIRER
	str	'TOUR'	; 42 TOURNER
	str	'TRAV'	; 43 TRAVERSER
	str	'UTIL'	; 44 UTILISER
	str	'VERS'	; 45 VERSER
	str	'AVAN'	; 46 AVANCER
	str	'VA'	; 10 ALLER
	str	'LIS'	; 28 LIRE
	str	'CHAR'	; 90 CHARGER
	str	'LOAD'	; 90 LOAD
	str	'SAUV'	; 91 SAUVER
	str	'SAVE'	; 91 SAVE
	str	'RECO'	; 92 RECOMMENCER
	str	'QUIT'	; 93 QUITTER

*-------------------------------
* NOMS
*-------------------------------

tblN	dfb	0	; value if not found
	dfb	1,1,2,2,3,3,4,4
	dfb	10,11,12,13,14,15,16,17,18,19
	dfb	20,21,22,23,24,25,26,27,28,29
	dfb	30,31,32,33,34,35,36,37,38,39
	dfb	40,41,42,43,44,45,46,47,48,49
	dfb	50,51,52,53,54,55,56,57,58,59
	dfb	60,61,62,63,64,65,65,65,66,67,68,69
	dfb	70,71,72,73,74,75,76,77,78,79
	dfb	80,81,82,83,84,85,86,87

tblNOUN	str	'N'	;  1 NORD
	str	'NORD'	;  1 NORD
	str	'S'	;  2 SUD
	str	'SUD'	;  2 SUD
	str	'O'	;  3 OUEST
	str	'OUEST'	;  3 OUEST
	str	'E'	;  4 EST
	str	'EST'	;  4 EST
	str	'AMUL'	; 10 AMULETTE
	str	'ANCR'	; 11 ANCRE
	str	'ARBR'	; 12 ARBRE
	str	'ATEL'	; 13 ATELIER
	str	'AUTE'	; 14 AUTEL
	str	'BIBL'	; 15 BIBLIOTHEQUE
	str	'BICH'	; 16 BICHE
	str	'BLAS'	; 17 BLASON
	str	'BOUS'	; 18 BOUSSOLE
	str	'BRAS'	; 19 BRAS
	str	'BURI'	; 20 BURIN
	str	'CABA'	; 21 CABANE
	str	'CAPE'	; 22 CAPE
	str	'CASC'	; 23 CASCADE
	str	'CHAP'	; 24 CHAPELLE
	str	'CHEN'	; 25 CHENE
	str	'CLE'	; 26 CLE
	str	'CLOC'	; 27 CLOCHETTE
	str	'CORD'	; 28 CORDE
	str	'CRAI'	; 29 CRAIE
	str	'CROC'	; 30 CROCHET
	str	'CRYP'	; 31 CRYPTE
	str	'DEBR'	; 32 DEBRIS
	str	'DENT'	; 33 DENT
	str	'EAU' 	; 34 EAU
	str	'ECHO'	; 35 ECHO
	str	'ENCE'	; 36 ENCENS
	str	'ESCA'	; 37 ESCALIER
	str	'FLEU'	; 38 FLEUR
	str	'FLUT'	; 39 FLUTE
	str	'FORG'	; 40 FORGE
	str	'FOSS'	; 41 FOSSE
	str	'FOUG'	; 42 FOUGERE
	str	'FRES'	; 43 FRESQUE
	str	'GOUR'	; 44 GOURDE
	str	'GRIL'	; 45 GRILLE
	str	'HUIL'	; 46 HUILE
	str	'INSC'	; 47 INSCRIPTION
	str	'JARD'	; 48 JARDIN
	str	'JETO'	; 49 JETON
	str	'LANT'	; 50 LANTERNE
	str	'LIVR'	; 51 LIVRE
	str	'LYNX'	; 52 LYNX
	str	'MAIS'	; 53 MAISON
	str	'MART'	; 54 MARTEAU
	str	'MASQ'	; 55 MASQUE
	str	'MEDA'	; 56 MEDAILLE
	str	'MIRO'	; 57 MIROIR
	str	'MUR'	; 58 MUR
	str	'OCEL'	; 59 OCELOT
	str	'PASS'	; 60 PASSERELLE
	str	'PELL'	; 61 PELLE
	str	'PIED'	; 62 PIED
	str	'PIER'	; 63 PIERRE
	str	'PIEU'	; 64 PIEU
	str	'PLAN'	; 65 PLAN/PLANCHE/PLANTE
	str	'PONT'	; 66 PONT
	str	'PORT'	; 67 PORTE
	str	'PUIT'	; 68 PUIT
	str	'RACI'	; 69 RACINE
	str	'RAYO'	; 70 RAYON
	str	'RIGO'	; 71 RIGOLE
	str	'ROCH'	; 72 ROCHER
	str	'SALL'	; 73 SALLE
	str	'SCEA'	; 74 SCEAU
	str	'SERR'	; 75 SERRURE
	str	'SILH'	; 76 SILHOUETTE
	str	'SOCL'	; 77 SOCLE
	str	'SOL' 	; 78 SOL
	str	'SOUR'	; 79 SOURCE
	str	'STAT'	; 80 STATUE
	str	'STEL'	; 81 STELE
	str	'TOIL'	; 82 TOILE
	str	'TOMB'	; 83 TOMBE
	str	'TORC'	; 84 TORCHE
	str	'TOUR'	; 85 TOUR
	str	'TREU'	; 86 TREUIL
	str	'VILL'	; 87 VILLAGE
	dfb	chrNULL

*-------------------------------
* DIRECTIONS
*-------------------------------

refISSUES	asc	'NSOE'
strISSUES	asc	'N,S,O,E'00

*-------------------------------
* MESSAGES
*-------------------------------

strMESSAGE	asc	'Le cimeti'8f're des ocelots'00				;   1
	asc	'Inventaire'00					;   2
	asc	'Ins'8e'rez face a et appuyez entr'8e'e'00			;   3--
	asc	'Tournez disquette : face b + entr'8e'e'00			;   4--
	asc	'SORTIE(S):'00					;   5
	asc	'Vous voyez:'00					;   6
	asc	'rien'00					;   7
	asc	'Cl'8e' bronze'00				;   8
	asc	'M'8e'daille'00					;   9
	asc	'Huile'00					;  10
	asc	'Plan'00					;  11
	asc	'Sceau'00					;  12
	asc	'Pied biche'00					;  13
	asc	'Touche pour revenir'00				;  14
	asc	'Commande > '00					;  15
strCHEAT	asc	'TURK182! THE BEST'00				;  16
	asc	'Je ne comprends pas'00				;  17
	asc	'Vous ne pouvez pas faire '8d'a ici'00			;  18
	asc	'Aucun chemin dans cette direction'00			;  19
	asc	'Le pont casse. Vous tombez dans le ravin'00			;  20
	asc	'La passerelle c'8f'de sous vos pieds'00			;  21
	asc	'Votre odeur n'27'a pas '8e'chapp'8e' au pr'8e'dateur'00		;  22
	asc	'Les pi'8f'ges du temple vous sont fatals'00			;  23
	asc	'Passage bloqu'8e'. Examinez le lieu'00			;  24
	asc	'Des dards jaillissent des murs'00			;  25
	asc	'Elle semble bouger'00				;  26
	asc	'Il n'27'y a pas de '00				;  27
	asc	'Tr'8f's utile pour le puits sec'00			;  28
	asc	'Une porte s'27'ouvre '88' l'27'est'00			;  29
	asc	'Vous prenez la lanterne qui d'8e'voile un passage secret'00		;  30
	asc	'Vous prenez le fragment'00				;  31
	asc	'Vous prenez la craie'00				;  32
	asc	'Vous avez pris '00				;  33
	asc	'Objet pos'8e00				;  34
	asc	'Vous jetez '00					;  35
	asc	'Vous trouvez une pelle'00				;  36
	asc	'J'27'ai l'27'impression qu'27'il y a quelque chose de cach'8e00	;  37
	asc	'Le pont est fragile'00				;  38
	asc	'La cavit'8e' est vide'00				;  39
	asc	'Quelqu'27'un semble avoir oubli'8e' sa gourde'00		;  40
	asc	'L'27'eau semble suspecte'00				;  41
	asc	'La corde est bien fix'8e'e'00				;  42
	asc	'On dirait qu'27'il lui manque une corde'00			;  43
	asc	'Vous trouvez un marteau et un burin'00			;  44
	asc	'La salle r'8e'sonne, id'8e'al pour jouer de la musique'00		;  45
	asc	'C'27'est plein de d'8e'bris'00				;  46
	asc	'Vous voyez un blason et une table'00			;  47
	asc	'Vous trouvez une fiole d'27'huile'00			;  48
	asc	'Vous voyez un miroir et un autel'00			;  49
	asc	'Vous voyez une boussole et un escalier qui monte'00		;  50
	asc	'Vous voyez un escalier qui monte'00			;  51
	asc	'Elle bloque un passage'00				;  52
	asc	'Vous trouvez le fragment manquant '88' votre plan'00		;  53
	asc	'Il semble qu'27'ils contr'99'lent un m'8e'canisme'00		;  54
	asc	'C'27'est un masque d'27'ocelot'00			;  55
	asc	'Une dent rouge'00				;  56
	asc	'La passerelle est fragile'00				;  57
	asc	'La passerelle semble s'8e'curis'8e'e'00			;  58
	asc	'Elle semble faite de bronze'00				;  59
	asc	'Vous trouvez une torche'00				;  60
	asc	'Vous ne voyez rien de sp'8e'cial'00			;  61
	asc	'Il semble qu'27'un sceau a '8e't'8e' arrach'8e'.'00		;  62
	asc	'Avec un miroir vous y verrez mieux'00			;  63
	asc	'Vous trouvez '00				;  64
	asc	'Ah si j'27'avais un marteau comme disait la chanson !'00		;  65
	asc	'Il semble attir'8e' par une offrande qui sent bon'00		;  66
	asc	'Ces traits effac'8e's pourraient '90'tre retrac'8e's'00		;  67
	asc	'Il semble attendre une pierre'00			;  68
	asc	'Elles devaient contenir de l'27'eau'00			;  69
	asc	'Une empreinte ronde semble attendre un insigne'00		;  70
	asc	'Elles ont l'27'air d'27'avoir perdu le nord'00			;  71
	asc	'Vous voyez une inscription'00				;  72
	asc	'Le gardien semble vouloir vous parler'00			;  73
	asc	'Avec une corde ce serait mieux'00			;  74
	asc	'Le pont semble s'8e'curis'8e00				;  75
	asc	'La passerelle semble s'8e'curis'8e'e'00			;  76
	asc	'La porte s'27'ouvre'00				;  77
	asc	'La gourde est pleine'00				;  78
	asc	'Vous d'8e'gagez le passage vers le sud'00			;  79
	asc	'La corde est fix'8e'e'00				;  80
	asc	'Il manque une corde'00				;  81
	asc	'Une trappe s'27'ouvre et vous d'8e'couvrez une fl'9e'te. Vous r'8e'cuperez la corde'00	;  82
	asc	'Un mur vibre et vous ouvre un passage secret vers le sud'00		;  83
	asc	'La grille s'27'ouvre, vous pouvez descendre'00			;  84
	asc	'Vous descendez vers la chapelle'00			;  85
	asc	'Torche huil'8e'e'00				;  86
	asc	'Une inscription appara'94't'00				;  87
	asc	'F'8e'lins : faites tinter le m'8e'tal'00			;  88
	asc	'Le reflet vise une tour '88' l'27'est'00			;  89
	asc	'Vous voyez un passage au nord'00			;  90
	asc	'Un passage vers l'27'est s'27'est ouvert'00			;  91
	asc	'Vous voyez un passage au nord'00			;  92
	asc	'Un passage vers l'27'est s'27'est ouvert'00			;  93
	asc	'Plan complet : autel, pierre, rigoles'00			;  94
	asc	'Le plan n'27'est pas complet'00			;  95
	asc	'Des rigoles s'8f'ches apparaissent'00			;  96
	asc	'Elle dessine une fl'8f'che vers l'27'est'00			;  97
	asc	'Comme disait la chanson : mets de l'27'huile !'00		;  98
	asc	'Passage vers le lac est r'8e'v'8e'l'8e00			;  99
	asc	'Le couloir des os '88' l'27'est est maintenant ouvert'00		; 100
	asc	'La grille s'27'ouvre vers le sud'00			; 101
	asc	'Votre odeur est masqu'8e'e'00				; 102
	asc	'Il vous manque un marteau'00				; 103
	asc	'Il vous manque un burin'00				; 104
	asc	'Le m'8e'canisme c'8f'de et lib'8f're le passage'00		; 105
	asc	'Le jeton dispara'94't. Passage '88' l'27'ouest s'27'ouvre'00		; 106
	asc	'Un passage vers l'27'ouest s'27'ouvre et la clochette rejoint l'27'inventaire'00	; 107
	asc	'Les pi'8f'ges sont maintenant visibles, vous pouvez avancer'00		; 108
	asc	'Vous d'8e'sarmez les pi'8f'ges'00			; 109
	asc	'Trois preuves : masque, jade, dent'00			; 110
	asc	'Une amulette est r'8e'v'8e'l'8e'e'00			; 111
	asc	'Un passage secret vous ram'8f'ne '88' la jungle basse'00		; 112
	asc	'L'27'une designe une pierre '88' l'27'est'00			; 113
	asc	'Vous d'8e'couvrez un passage '88' l'27'est'00			; 114
	asc	'Il vous tend une cl'8e' noire'00			; 115
	asc	'Vous avez pris une dent d'27'ocelot'00			; 116
	asc	'Votre cle a du mal '88' entrer, il faudrait d'8e'bloquer le m'8e'canisme'00	; 117
	asc	'Le verrou est d'8e'bloqu'8e00				; 118
	asc	'Dent plac'8e'e'00				; 119
	asc	'Il vous manque une corde'00				; 120
	asc	'Il vous manque un crochet'00				; 121
	asc	'Vous voyez un passage vers la jungle'00			; 122
	asc	'Le pont c'8f'dera sans planche'00			; 123
	asc	'Elle est ferm'8e'e '88' cl'8e00			; 124
	asc	'La porte est ouverte'00				; 125
	asc	'L'27'eau vous empoisonne'00				; 126
	asc	'Il faut une gourde'00				; 127
	asc	'Une pelle d'8e'gagerait les racines'00			; 128
	asc	'Vous n'27'avez pas de plan'00				; 129
	asc	'La salle r'8e'sonne, id'8e'al pour jouer de la musique'00		; 130
	asc	'La grille n'8e'cessite un pied de biche'00			; 131
	asc	'Il manque un fragment'00				; 132
	asc	'Les ombres ne s'27'effacent que devant le reflet vert de ton amulette'00	; 133
	asc	' ne sert '88' rien ici'00				; 134
	asc	'Vous ne voyez rien de sp'8e'cial'00			; 135
	asc	'Inserez face a puis entr'8e'e'00			; 136
	asc	'Partie sauvegard'8e'e'00				; 137
	asc	'Partie charg'8e'e'00				; 138
	asc	'Il reste des objets ou des '8e'nigmes '88' utiliser'00		; 139
	asc	'La porte grince et s'27'ouvre enfin'00			; 140
	asc	'Vous '90'tes mort'00				; 141
	asc	'Recommencer ? o/n '00				; 142
	asc	'Face a + entr'8e'e'00				; 143--
	asc	'Face b + entr'8e'e'00				; 144--
	asc	27'BRAVO !'2700					; 145
	asc	'Vous avez trouv'8e' le cimeti'8f're'00			; 146
	asc	'des Ocelots et son tr'8e'sor'00			; 147
	asc	'Appuyez sur une touche pour'00				; 148
	asc	'entrer dans la salle'00				; 149
	asc	'Le puits a d'8e'j'88' '8e't'8e' fouill'8e'.'00			; 150
	asc	'Les pi'8f'ges sont maintenant visibles.'00			; 151
	asc	'Le passage au sud est ouvert.'00			; 152
	asc	'Voulez-vous quitter ? o/n '00				; 153
	dfb	chrNULL

*-------------------------------
* OBJETS
*-------------------------------

tblOV	dfb	61,83,28,26,26,54,20,39,18,57,55,56,10,44,65,29	; index: object
	dfb	27,62,50,46,30,65,63,33,74,50,81,26,36,22,49,38	; value: vocabulary index

tblMF	asc	'FFFFFMMFFMMFFFMFFMFFMFFFMMMFMFMF'

strUN	asc	'Un '00
strUNE	asc	'Une '00

*				   # V#
strOBJET	asc	'pelle'00		;  1 61
	asc	'torche'00		;  2 83
	asc	'corde'00		;  3 28
	asc	'cl'8e' de bronze'00	;  4 26
	asc	'cl'8e' d'27'os'00	;  5 26
	asc	'marteau'00		;  6 54
	asc	'burin'00		;  7 20
	asc	'fl'9e'te'00		;  8 39
	asc	'boussole'00		;  9 18
	asc	'miroir'00		; 10 57
	asc	'masque'00		; 11 55
	asc	'm'8e'daille de garde'00	; 12 56
	asc	'amulette'00		; 13 10
	asc	'gourde'00		; 14 44
	asc	'plan d'8e'chir'8e00	; 15 65
	asc	'craie'00		; 16 29
	asc	'clochette'00		; 17 27
	asc	'pied de biche'00	; 18 62
	asc	'lanterne'00		; 19 50
	asc	'fiole d'27'huile'00	; 20 46
	asc	'crochet'00		; 21 30
	asc	'planche'00		; 22 65
	asc	'pierre grav'8e'e'00	; 23 63
	asc	'dent'00		; 24 33
	asc	'sceau de cire'00	; 25 74
	asc	'livre humide'00	; 26 50
	asc	'fragment de st'8f'le'00	; 27 81
	asc	'cl'8e' noire'00	; 28 26
	asc	'b"89"ton d'27'encens'00	; 29 36
	asc	'cape de braconnier'00	; 30 22
	asc	'jeton'00		; 31 49
	asc	'fleur nocturne'00	; 32 38
	dfb	chrNULL
	
*-------------------------------
* LIEUX
*-------------------------------

strLIEU	asc	'Clairi'8f're de l'27'Ocelot'00	;  1
	asc	'Sentier des Foug'8f'res'00	;  2
	asc	'Pont de Bois'00	;  3
	asc	'Ruisseau Noir'00	;  4
	asc	'Vieux Ch'90'ne'00	;  5
	asc	'Cabane Abandonn'8e'e'00	;  6
	asc	'Pente Rocheuse'00	;  7
	asc	'Belved'8f're'00	;  8
	asc	'Marais des Brumes'00	;  9
	asc	'Passerelle Pourrie'00	; 10
	asc	'Il'99't des Roseaux'00	; 11
	asc	'Saule Creux'00		; 12
	asc	'Source Ferrugineuse'00	; 13
	asc	'Chemin des Racines'00	; 14
	asc	'Terrier Effondr'8e00	; 15
	asc	'Lisi'8f're Nord'00	; 16
	asc	'Carri'8f're Oubli'8e'e'00	; 17
	asc	'Treuil Rouill'8e00	; 18
	asc	'Galerie Basse'00	; 19
	asc	'Salle des Echos'00	; 20
	asc	'Puits Sec'00		; 21
	asc	'Atelier du Tailleur'00	; 22
	asc	'R'8e'serve de Cordes'00	; 23
	asc	'Corniche Blanche'00	; 24
	asc	'Village D'8e'sert'00	; 25
	asc	'Place du Puits'00	; 26
	asc	'Maison du Garde'00	; 27
	asc	'Forge Eteinte'00	; 28
	asc	'Chapelle Bris'8e'e'00	; 29
	asc	'Cimeti'8f're Ancien'00	; 30
	asc	'Jardin Clos'00		; 31
	asc	'Tour de Guet'00	; 32
	asc	'Bois des Statues'00	; 33
	asc	'Sentier des St'8f'les'00	; 34
	asc	'Autel de Pierre'00	; 35
	asc	'Grotte aux Griffes'00	; 36
	asc	'Lac Souterrain'00	; 37
	asc	'Escalier Noy'8e00	; 38
	asc	'Crypte du Chasseur'00	; 39
	asc	'Couloir des Os'00	; 40
	asc	'Ravin Rouge'00		; 41
	asc	'Arche Naturelle'00	; 42
	asc	'Camp des Braconniers'00	; 43
	asc	'Fosse aux Pieux'00	; 44
	asc	'Chemin Suspendu'00	; 45
	asc	'Cascade S'8f'che'00	; 46
	asc	'Repaire du Lynx'00	; 47
	asc	'Porte de Basalte'00	; 48
	asc	'Jungle Basse'00	; 49
	asc	'Arbre aux Cordes'00	; 50
	asc	'Temple Effondr'8e00	; 51
	asc	'Salle du Masque'00	; 52
	asc	'Cour des Ocelots'00	; 53
	asc	'Biblioth'8f'que Morte'00	; 54
	asc	'Salle des Fresques'00	; 55
	asc	'Sanctuaire Ferm'8e00	; 56
	asc	'Plateau du Vent'00	; 57
	asc	'Pierres Chantantes'00	; 58
	asc	'Observatoire Ruine'00	; 59
	asc	'Escalier des Ombres'00	; 60
	asc	'Galerie des Noms'00	; 61
	asc	'Antichambre Noire'00	; 62
	asc	'Porte des F'8e'lins'00	; 63
	asc	'Cim'8f'tiere des Ocelots'00	; 64
	dfb	chrNULL
