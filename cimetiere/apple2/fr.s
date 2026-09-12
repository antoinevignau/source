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
	dfb	10,11,12,13,14,15,15,16,17,18,19
	dfb	20,21,22,23,24,25,26,26,27,28,29,29
	dfb	30,31,31,32,33,34,35,36,36,37,38,39,39
	dfb	40,41,41,42,43,44,45,46,10,28
	dfb	90,90,91,91,92,93
	
tblVERB	str	'N'	;  1 NORD
	str	'NORD'	;  1 NORD
	str	'S'	;  2 SUD
	str	'SUD'	;  2 SUD
	str	'O'	;  3 OUEST
	str	'OUES'	;  3 OUEST
	str	'E'	;  4 EST
	str	'EST'	;  4 EST
	str	'I'	;  7 INVENTAIRE
	str	'INVE'	;  7 INVENTAIRE
	str	'INVEN'	;  7 INVENTAIRE
	str	'ALLER'	; 10 ALLER
	str	'ALLUM'	; 11 ALLUMER
	str	'ARRAC'	; 12 ARRACHER
	str	'ASSEM'	; 13 ASSEMBLER
	str	'ATTAC'	; 14 ATTACHER
	str	'BOIRE'	; 15 BOIS/BOIRE
	str	'BOIS'	; 15 BOIS/BOIRE
	str	'CHERC'	; 16 CHERCHER
	str	'CREUS'	; 17 CREUSER
	str	'DESCE'	; 18 DESCENDRE
	str	'DONNE'	; 19 DONNER
	str	'ECOUT'	; 20 ECOUTER
	str	'ENTRE'	; 21 ENTRER
	str	'ETEIN'	; 22 ETEINDRE
	str	'EXAMI'	; 23 EXAMINER
	str	'FOUIL'	; 24 FOUILLER
	str	'FRAPP'	; 25 FRAPPER
	str	'JETER'	; 26 JETTE
	str	'JETTE'	; 26 JETTE
	str	'JOUER'	; 27 JOUER
	str	'LIRE'	; 28 LIRE
	str	'METS'	; 29 METS/METTRE
	str	'METTR'	; 29 METS/METTRE
	str	'MONTE'	; 30 MONTER
	str	'OUVRE'	; 31 OUVRIR
	str	'OUVRI'	; 31 OUVRIR
	str	'PARLE'	; 32 PARLER
	str	'PASSE'	; 33 PASSER
	str	'PLACE'	; 34 PLACER
	str	'PORTE'	; 35 PORTER
	str	'POSE'	; 36 POSER
	str	'POSER'	; 36 POSER
	str	'POUSS'	; 37 POUSSER
	str	'PREND'	; 38 PRENDRE
	str	'R'	; 39 R
	str	'REGAR'	; 39 REGARDER
	str	'REMPL'	; 40 REMPLIR
	str	'TIRE'	; 41 TIRER
	str	'TIRER'	; 41 TIRER
	str	'TOURN'	; 42 TOURNER
	str	'TRAVE'	; 43 TRAVERSER
	str	'UTILI'	; 44 UTILISER
	str	'VERSE'	; 45 VERSER
	str	'AVANC'	; 46 AVANCER
	str	'VA'	; 10 ALLER
	str	'LIS'	; 28 LIRE
	str	'CHARG'	; 90 CHARGER
	str	'LOAD'	; 90 LOAD
	str	'SAUVE'	; 91 SAUVER
	str	'SAVE'	; 91 SAVE
	str	'RECOM'	; 92 RECOMMENCER
	str	'QUITT'	; 93 QUITTER

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
	dfb	60,61,62,63,64,65,66,67,68,69
	dfb	70,71,72,73,74,75,76,77,78,79
	dfb	80,81,82,83,84,85,86,87,88,89
	dfb	90,91,92,93,94,95,96

tblNOUN	str	'N'	;  1 NORD
	str	'NORD'	;  1 NORD
	str	'S'	;  2 SUD
	str	'SUD'	;  2 SUD
	str	'O'	;  3 OUEST
	str	'OUEST'	;  3 OUEST
	str	'E'	;  4 EST
	str	'EST'	;  4 EST
	str	'AMULE'	; 10 AMULETTE
	str	'ANCRA'	; 11 ANCRAGE
	str	'ARBRE'	; 12 ARBRE
	str	'ATELI'	; 13 ATELIER
	str	'AUTEL'	; 14 AUTEL
	str	'BIBLI'	; 15 BIBLIOTHEQUE
	str	'BICHE'	; 16 BICHE
	str	'BLASO'	; 17 BLASON
	str	'BOUSS'	; 18 BOUSSOLE
	str	'BRASE'	; 19 BRASERO
	str	'BURIN'	; 20 BURIN
	str	'CABAN'	; 21 CABANE
	str	'CAPE'	; 22 CAPE
	str	'CASCA'	; 23 CASCADE
	str	'CHAPE'	; 24 CHAPELLE
	str	'CHENE'	; 25 CHENE
	str	'CLE'	; 26 CLE
	str	'CLOCH'	; 27 CLOCHETTE
	str	'CORDE'	; 28 CORDE
	str	'CRAIE'	; 29 CRAIE
	str	'CROCH'	; 30 CROCHET
	str	'CRYPT'	; 31 CRYPTE
	str	'DEBRI'	; 32 DEBRIS
	str	'DENT'	; 33 DENT
	str	'EAU' 	; 34 EAU
	str	'ECHO'	; 35 ECHO
	str	'ENCEN'	; 36 ENCENS
	str	'ESCAL'	; 37 ESCALIER
	str	'FLEUR'	; 38 FLEUR
	str	'FLUTE'	; 39 FLUTE
	str	'FORGE'	; 40 FORGE
	str	'FOSSE'	; 41 FOSSE
	str	'FOUGE'	; 42 FOUGERE
	str	'FRESQ'	; 43 FRESQUE
	str	'GOURD'	; 44 GOURDE
	str	'GRILL'	; 45 GRILLE
	str	'HUILE'	; 46 HUILE
	str	'INSCR'	; 47 INSCRIPTION
	str	'JARDI'	; 48 JARDIN
	str	'JETON'	; 49 JETON
	str	'LANTE'	; 50 LANTERNE
	str	'LIVRE'	; 51 LIVRE
	str	'LYNX'	; 52 LYNX
	str	'MAISO'	; 53 MAISON
	str	'MARTE'	; 54 MARTEAU
	str	'MASQU'	; 55 MASQUE
	str	'MEDAI'	; 56 MEDAILLE
	str	'MIROI'	; 57 MIROIR
	str	'MUR'	; 58 MUR
	str	'OCELO'	; 59 OCELOT
	str	'PASSE'	; 60 PASSERELLE
	str	'PELLE'	; 61 PELLE
	str	'PIED'	; 62 PIED
	str	'PIERR'	; 63 PIERRE
	str	'PIEU'	; 64 PIEU
	str	'PLAN'	; 65 PLAN/PLANCHE/PLANTE
	str	'PONT'	; 66 PONT
	str	'PORTE'	; 67 PORTE
	str	'PUITS'	; 68 PUITS
	str	'RACIN'	; 69 RACINE
	str	'RAYON'	; 70 RAYON
	str	'RIGOL'	; 71 RIGOLE
	str	'ROCHE'	; 72 ROCHER
	str	'SALLE'	; 73 SALLE
	str	'SCEAU'	; 74 SCEAU
	str	'SERRU'	; 75 SERRURE
	str	'SILHO'	; 76 SILHOUETTE
	str	'SOCLE'	; 77 SOCLE
	str	'SOL' 	; 78 SOL
	str	'SOURC'	; 79 SOURCE
	str	'STATU'	; 80 STATUE
	str	'STELE'	; 81 STELE
	str	'TOILE'	; 82 TOILE
	str	'TOMBE'	; 83 TOMBE
	str	'TORCH'	; 84 TORCHE
	str	'TOUR'	; 85 TOUR
	str	'TREUI'	; 86 TREUIL
	str	'VILLA'	; 87 VILLAGE
	str	'BRONZ'	; 88 CLE DE BRONZE
	str	'OS'	; 89 CLE D'OS
	str	'NOIR'	; 90 CLE NOIRE
	str	'TABLE'	; 91 TABLE
	str	'PLANC'	; 92 PLANCHE
	str	'PLANT'	; 93 PLANTE
	str	'FIOLE'	; 94 FIOLE
	str	'FRAGM'	; 95 FRAGMENT
	str	'BATON'	; 96 BATON
	dfb	chrNULL

*-------------------------------
* DIRECTIONS
*-------------------------------

refISSUES	asc	'NSOE'
strISSUES	asc	'N,S,O,E'00

strCORDE	asc	'CORDE'00
strCROCHET	asc	'CROCHET'00
strHUILE	asc	'HUILE'00
strTORCHE	asc	'TORCHE'00
strMIROIR	asc	'MIROIR'00
strAUTEL	asc	'AUTEL'00

*-------------------------------
* MESSAGES
*-------------------------------

strMESSAGE	asc	'LE CIMETIERE DES OCELOTS'00				;   1
	asc	'INVENTAIRE'00					;   2
	asc	'Ins'8e'rez face a et appuyez entr'8e'e'00			;   3--
	asc	'Tournez disquette : face b + entr'8e'e'00			;   4--
	asc	'SORTIE(S):'00					;   5
	asc	'VOUS VOYEZ:'00					;   6
	asc	'rien'00					;   7
	asc	'Cl'8e' bronze'00				;   8
	asc	'M'8e'daille'00					;   9
	asc	'Huile'00					;  10
	asc	'Plan'00					;  11
	asc	'Sceau'00					;  12
	asc	'Pied biche'00					;  13
	asc	'Touche pour revenir'00				;  14
*	asc	'Commande > '00					;  15
strCOMMANDE	asc	'00 00 00 > '00					;  15
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
	asc	'Il n'27'y a pas cela ici'00				;  27
	asc	'Tr'8f's utile pour le puits sec'00			;  28
	asc	'Une porte s'27'ouvre '88' l'27'est'00			;  29
	asc	'Vous prenez la lanterne qui d'8e'voile un passage secret'00		;  30
	asc	'Vous prenez le fragment. '00				;  31
	asc	'Vous prenez la craie. '00				;  32
	asc	'Vous avez pris '00				;  33
	asc	'Objet pos'8e00					;  34
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
	asc	'Une dent bouge'00				;  56
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
	asc	d2'F'8e'lins : faites tinter le m'8e'tal'd300			;  88
	asc	'Le reflet vise une tour '88' l'27'est'00			;  89
	asc	'Vous voyez un passage au nord'00			;  90
	asc	'Un passage vers l'27'est s'27'est ouvert'00			;  91
	asc	'Commande non r'8e'alis'8e'e'00				;  92 cha”ne vide
	asc	'Voulez-vous recommencer ? o/n'00			;  93
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
	asc	d2'Les ombres ne s'27'effacent que devant le reflet vert de ton amulette'd300	; 133
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
	asc	d2'BRAVO !'d300					; 145
	asc	'Vous avez trouv'8e' le cimeti'8f're'00			; 146
	asc	'des Ocelots et son tr'8e'sor'00			; 147
	asc	'Appuyez sur une touche pour'00				; 148
	asc	'entrer dans la salle'00				; 149
	asc	'Le puits a d'8e'j'88' '8e't'8e' fouill'8e'.'00			; 150
	asc	'Les pi'8f'ges sont maintenant visibles.'00			; 151
	asc	'Le passage au sud est ouvert.'00			; 152
	asc	'Voulez-vous quitter ? o/n'00				; 153
strDESCRIPTION	ds	48					; 154 - long level description string
T$	ds	128					; 155 - multi-purpose string
	dfb	chrNULL

*-------------------------------
* OBJETS
*-------------------------------

tblOV1	dfb	61,84,28,88,89,54,20,39,18,57,55,56,10,44,65,29	; index: object
	dfb	27,62,50,94,30,92,63,33,74,51,95,26,96,22,49,38	; value: vocabulary index

tblOV2	dfb	61,84,28,26,26,54,20,39,18,57,55,56,10,44,65,29	; index: object
	dfb	27,16,50,46,30,92,63,33,74,51,81,90,36,22,49,38	; value: vocabulary index

tblMF	asc	'FFFFFMMFFMMFFFMFFMFFMFFFMMMFMFMF'

strUN	asc	'un '00
strUNE	asc	'une '00
strVIDE	asc	''00
strVIRGULE	asc	', '00

*				   # V#
strOBJET	asc	'Pelle'00		;  1 61
	asc	'Torche'00		;  2 83
	asc	'Corde'00		;  3 28
	asc	'Cl'8e' de bronze'00	;  4 88 26
	asc	'Cl'8e' d'27'os'00	;  5 89 26
	asc	'Marteau'00		;  6 54
	asc	'Burin'00		;  7 20
	asc	'Fl'9e'te'00		;  8 39
	asc	'Boussole'00		;  9 18
	asc	'Miroir'00		; 10 57
	asc	'Masque'00		; 11 55 *
	asc	'M'8e'daille de garde'00	; 12 56
	asc	'Amulette'00		; 13 10 *
	asc	'Gourde'00		; 14 44
	asc	'Plan d'8e'chir'8e00	; 15 65
	asc	'Craie'00		; 16 29
	asc	'Clochette'00		; 17 27
	asc	'Pied de biche'00	; 18 62 16
	asc	'Lanterne'00		; 19 50
	asc	'Fiole d'27'huile'00	; 20 94 46
	asc	'Crochet'00		; 21 30
	asc	'Planche'00		; 22 65
	asc	'Pierre grav'8e'e'00	; 23 63
	asc	'Dent'00		; 24 33 *
	asc	'Sceau de cire'00	; 25 74
	asc	'Livre humide'00	; 26 51
	asc	'Fragment de st'8f'le'00	; 27 95 81
	asc	'Cl'8e' noire'00	; 28 26 90
	asc	'B'89'ton d'27'encens'00	; 29 96 36
	asc	'Cape de braconnier'00	; 30 22
	asc	'Jeton'00		; 31 49
	asc	'Fleur nocturne'00	; 32 38
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
