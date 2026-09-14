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

refISSUES	asc	'NSWE'
strISSUES	asc	'N,S,W,E'00

strCORDE	asc	'ROPE'00
strCROCHET	asc	'HOOK'00
strHUILE	asc	'OIL'00
strTORCHE	asc	'TORCH'00
strMIROIR	asc	'MIRROR'00
strAUTEL	asc	'ALTAR'00

*-------------------------------
* MESSAGES
*-------------------------------

strMESSAGE	asc	'OCELOT CEMETERY'00				;   1
	asc	'INVENTORY'00					;   2
	asc	'InsŽrez face a et appuyez entrŽe'00			;   3--
	asc	'Tournez disquette : face b + entrŽe'00			;   4--
	asc	'ISSUE(S):'00					;   5
	asc	'YOU SEE:'00					;   6
	asc	'nothing'00					;   7
	asc	'Bronze key'00				;   8
	asc	'MŽdal'00					;   9
	asc	'Oil'00					;  10
	asc	'Plan'00					;  11
	asc	'Seal'00					;  12
	asc	'Crowbar'00					;  13
	asc	'Press a key to return'00				;  14
*	asc	'Command > '00					;  15
strCOMMANDE	asc	'> '00					;  15
strCHEAT	asc	'TURK182! THE BEST'00				;  16
	asc	'I don'27't understand'00				;  17
	asc	'You can'27't do that here'00			;  18
	asc	'No path in this direction'00			;  19
	asc	'Le pont casse. Vous tombez dans le ravin'00			;  20
	asc	'La passerelle cde sous vos pieds'00			;  21
	asc	'Votre odeur n'a pas ŽchappŽ au prŽdateur'00		;  22
	asc	'Les piges du temple vous sont fatals'00			;  23
	asc	'Passage blocked. Examinez the area'00			;  24
	asc	'Des dards jaillissent des murs'00			;  25
	asc	'It seems to be moving'00				;  26
	asc	'There is nothing like that here'00				;  27
	asc	'Trs utile pour le puits sec'00			;  28
	asc	'Une porte s'ouvre ˆ l'est'00			;  29
	asc	'Vous prenez la lanterne qui dŽvoile un passage secret'00		;  30
	asc	'Fragment taken. '00				;  31
	asc	'Chalk taken. '00				;  32
	asc	'You took '00				;  33
	asc	'Object dropped'00					;  34
	asc	'You throw '00					;  35
	asc	'You find a shovel'00				;  36
	asc	'J'ai l'impression qu'il y a quelque chose de cachŽ'00	;  37
	asc	'Le pont est fragile'00				;  38
	asc	'La cavitŽ est vide'00				;  39
	asc	'Quelqu'un semble avoir oubliŽ sa gourde'00		;  40
	asc	'L'eau semble suspecte'00				;  41
	asc	'La corde est bien fixŽe'00				;  42
	asc	'On dirait qu'il lui manque une corde'00			;  43
	asc	'Vous trouvez un marteau et un burin'00			;  44
	asc	'La salle rŽsonne, idŽal pour jouer de la musique'00		;  45
	asc	'C'est plein de dŽbris'00				;  46
	asc	'Vous voyez un blason et une table'00			;  47
	asc	'Vous trouvez une fiole d'huile'00			;  48
	asc	'Vous voyez un miroir et un autel'00			;  49
	asc	'Vous voyez une boussole et un escalier qui monte'00		;  50
	asc	'Vous voyez un escalier qui monte'00			;  51
	asc	'Elle bloque un passage'00				;  52
	asc	'Vous trouvez le fragment manquant ˆ votre plan'00		;  53
	asc	'Il semble qu'ils contr™lent un mŽcanisme'00		;  54
	asc	'C'est un masque d'ocelot'00			;  55
	asc	'Une dent bouge'00				;  56
	asc	'La passerelle est fragile'00				;  57
	asc	'La passerelle semble sŽcurisŽe'00			;  58
	asc	'Elle semble faite de bronze'00				;  59
	asc	'Vous trouvez une torche'00				;  60
	asc	'Vous ne voyez rien de spŽcial'00			;  61
	asc	'Il semble qu'un sceau a ŽtŽ arrachŽ.'00		;  62
	asc	'Avec un miroir vous y verrez mieux'00			;  63
	asc	'Vous trouvez '00				;  64
	asc	'Ah si j'avais un marteau comme disait la chanson !'00		;  65
	asc	'Il semble attirŽ par une offrande qui sent bon'00		;  66
	asc	'Ces traits effacŽs pourraient tre retracŽs'00		;  67
	asc	'Il semble attendre une pierre'00			;  68
	asc	'Elles devaient contenir de l'eau'00			;  69
	asc	'Une empreinte ronde semble attendre un insigne'00		;  70
	asc	'Elles ont l'air d'avoir perdu le nord'00			;  71
	asc	'Vous voyez une inscription'00				;  72
	asc	'Le gardien semble vouloir vous parler'00			;  73
	asc	'Avec une corde ce serait mieux'00			;  74
	asc	'Le pont semble sŽcurisŽ'00				;  75
	asc	'La passerelle semble sŽcurisŽe'00			;  76
	asc	'La porte s'ouvre'00				;  77
	asc	'La gourde est pleine'00				;  78
	asc	'Vous dŽgagez le passage vers le sud'00			;  79
	asc	'La corde est fixŽe'00				;  80
	asc	'Il manque une corde'00				;  81
	asc	'Une trappe s'ouvre et vous dŽcouvrez une flžte. Vous rŽcuperez la corde'00	;  82
	asc	'Un mur vibre et vous ouvre un passage secret vers le sud'00		;  83
	asc	'La grille s'ouvre, vous pouvez descendre'00			;  84
	asc	'Vous descendez vers la chapelle'00			;  85
	asc	'Oiled torch'00				;  86
	asc	'Une inscription appara”t'00				;  87
	asc	'FŽlins : faites tinter le mŽtal'00			;  88 with "" d2 d3
	asc	'Le reflet vise une tour ˆ l'est'00			;  89
	asc	'Vous voyez un passage au nord'00			;  90
	asc	'Un passage vers l'est s'est ouvert'00			;  91
	asc	'Command cancelled'00				;  92 cha”ne vide
	asc	'Do you want to restart? Y/N'00			;  93
	asc	'Plan complet : autel, pierre, rigoles'00			;  94
	asc	'Le plan n'est pas complet'00			;  95
	asc	'Des rigoles sches apparaissent'00			;  96
	asc	'Elle dessine une flche vers l'est'00			;  97
	asc	'Comme disait la chanson : mets de l'huile !'00		;  98
	asc	'Passage vers le lac est rŽvŽlŽ'00			;  99
	asc	'Le couloir des os ˆ l'est est maintenant ouvert'00		; 100
	asc	'La grille s'ouvre vers le sud'00			; 101
	asc	'Votre odeur est masquŽe'00				; 102
	asc	'Il vous manque un marteau'00				; 103
	asc	'Il vous manque un burin'00				; 104
	asc	'Le mŽcanisme cde et libre le passage'00		; 105
	asc	'Le jeton dispara”t. Passage ˆ l'ouest s'ouvre'00		; 106
	asc	'Un passage vers l'ouest s'ouvre et la clochette rejoint l'inventaire'00	; 107
	asc	'Les piges sont maintenant visibles, vous pouvez avancer'00		; 108
	asc	'Vous dŽsarmez les piges'00			; 109
	asc	'Trois preuves : masque, jade, dent'00			; 110
	asc	'Une amulette est rŽvŽlŽe'00			; 111
	asc	'Un passage secret vous ramne ˆ la jungle basse'00		; 112
	asc	'L'une designe une pierre ˆ l'est'00			; 113
	asc	'Vous dŽcouvrez un passage ˆ l'est'00			; 114
	asc	'Il vous tend une clŽ noire'00			; 115
	asc	'Vous avez pris une dent d'ocelot'00			; 116
	asc	'Votre cle a du mal ˆ entrer, il faudrait dŽbloquer le mŽcanisme'00	; 117
	asc	'Le verrou est dŽbloquŽ'00				; 118
	asc	'Dent placŽe'00				; 119
	asc	'Il vous manque une corde'00				; 120
	asc	'Il vous manque un crochet'00				; 121
	asc	'Vous voyez un passage vers la jungle'00			; 122
	asc	'Le pont cdera sans planche'00			; 123
	asc	'Elle est fermŽe ˆ clŽ'00			; 124
	asc	'La porte est ouverte'00				; 125
	asc	'L'eau vous empoisonne'00				; 126
	asc	'Il faut une gourde'00				; 127
	asc	'Une pelle dŽgagerait les racines'00			; 128
	asc	'Vous n'avez pas de plan'00				; 129
	asc	'La salle rŽsonne, idŽal pour jouer de la musique'00		; 130
	asc	'La grille nŽcessite un pied de biche'00			; 131
	asc	'Il manque un fragment'00				; 132
	asc	'Les ombres ne s'effacent que devant le reflet vert de ton amulette'00	; 133 with "" d2 d3
	asc	' ne sert ˆ rien ici'00				; 134
	asc	'Vous ne voyez rien de spŽcial'00			; 135
	asc	'Inserez face a puis entrŽe'00			; 136
	asc	'Partie sauvegardŽe'00				; 137
	asc	'Partie chargŽe'00				; 138
	asc	'Il reste des objets ou des Žnigmes ˆ utiliser'00		; 139
	asc	'La porte grince et s'ouvre enfin'00			; 140
	asc	'You are dead'00				; 141
	asc	'Start again? Y/N '00				; 142
	asc	'Face a + entrŽe'00				; 143--
	asc	'Face b + entrŽe'00				; 144--
	asc	'CONGRATULATIONS!'00				; 145 with "" d2 d3
	asc	'Vous avez trouvŽ le cimetire'00			; 146
	asc	'des Ocelots et son trŽsor'00			; 147
	asc	'Appuyez sur une touche pour'00				; 148
	asc	'entrer dans la salle'00				; 149
	asc	'Le puits a dŽjˆ ŽtŽ fouillŽ.'00			; 150
	asc	'Les piges sont maintenant visibles.'00			; 151
	asc	'Le passage au sud est ouvert.'00			; 152
	asc	'Do you want to quit? Y/N'00				; 153
strDESCRIPTION	ds	48					; 154 - long level description string
	dfb	chrNULL

*-------------------------------
* AUTRES CHAINES
*-------------------------------

T$	ds	128					; 155 - multi-purpose string
U$	ds	128					; 156 - multi-purpose string

*-------------------------------
* OBJETS
*-------------------------------

tblOV1	dfb	61,84,28,88,89,54,20,39,18,57,55,56,10,44,65,29	; index: object
	dfb	27,62,50,94,30,92,63,33,74,51,95,26,96,22,49,38	; value: vocabulary index

tblOV2	dfb	61,84,28,26,26,54,20,39,18,57,55,56,10,44,65,29	; index: object
	dfb	27,16,50,46,30,92,63,33,74,51,81,90,36,22,49,38	; value: vocabulary index

tblMF	asc	'FFFFFMMFFMMFFFMFFMFFMFFFMMMFMFMF'

strUN	asc	'a '00
strUNE	asc	'an '00
strVIDE	asc	''00
strVIRGULE	asc	', '00

*				   # V#
strOBJET	asc	'Shovel'00		;  1 61
	asc	'Torch'00		;  2 83
	asc	'Rope'00		;  3 28
	asc	'Bronze key'00		;  4 88 26
	asc	'Bone key'00		;  5 89 26
	asc	'Hammer'00		;  6 54
	asc	'Chisel'00		;  7 20
	asc	'Flute'00		;  8 39
	asc	'Compass'00		;  9 18
	asc	'Mirror'00		; 10 57
	asc	'Mask'00		; 11 55 *	-> orange
	asc	'Guard's medal'00	; 12 56
	asc	'Amulet'00		; 13 10 *	-> orange
	asc	'Flask'00		; 14 44
	asc	'Torn map'00		; 15 65
	asc	'Chalk'00		; 16 29
	asc	'Small bell'00		; 17 27
	asc	'Crowbar'00		; 18 62 16
	asc	'Lantern'00		; 19 50
	asc	'Oil flask'00		; 20 94 46
	asc	'Lockpick'00		; 21 30
	asc	'Plank'00		; 22 65
	asc	'Engraved stone'00	; 23 63
	asc	'Tooth'00		; 24 33 *	-> orange
	asc	'Wax seal'00		; 25 74
	asc	'Damp book'00		; 26 51
	asc	'Stele fragment'00	; 27 95 81
	asc	'Black key'00		; 28 26 90
	asc	'Incense stick'00	; 29 96 36
	asc	'Poacher's cloak'00	; 30 22
	asc	'Token'00		; 31 49
	asc	'Night flower'00	; 32 38
	dfb	chrNULL
	
*-------------------------------
* LIEUX
*-------------------------------

strLIEU	asc	'Ocelot Clearing'00	;  1
	asc	'Fern Trail'00		;  2
	asc	'Wooden Bridge'00	;  3
	asc	'Black Stream'00	;  4
	asc	'Old Oak'00		;  5
	asc	'Abandoned Shack'00	;  6
	asc	'Rocky Slope'00		;  7
	asc	'Overlook'00		;  8
	asc	'Misty Marsh'00		;  9
	asc	'Rotting Footbridge'00	; 10
	asc	'Reed Islet'00		; 11
	asc	'Hollow Willow'00	; 12
	asc	'Iron-rich Spring'00	; 13
	asc	'Root Path'00		; 14
	asc	'Collapsed Burrow'00	; 15
	asc	'Northern Edge'00	; 16
	asc	'Forgotten Quarry'00	; 17
	asc	'Rusted Winch'00	; 18
	asc	'Low Tunnel'00		; 19
	asc	'Echo Chamber'00	; 20
	asc	'Dry Well'00		; 21
	asc	'Stonecutter'27's Workshop'00	; 22
	asc	'Rope Store'00		; 23
	asc	'White Ledge'00		; 24
	asc	'Deserted Village'00	; 25
	asc	'Well Square'00		; 26
	asc	'Warden'27's House'00	; 27
	asc	'Cold Forge'00		; 28
	asc	'Broken Chapel'00	; 29
	asc	'Ancient Cemetery'00	; 30
	asc	'Walled Garden'00	; 31
	asc	'Watchtower'00		; 32
	asc	'Statue Woods'00	; 33
	asc	'Stele Path'00		; 34
	asc	'Stone Altar'00		; 35
	asc	'Claw Cave'00		; 36
	asc	'Underground Lake'00	; 37
	asc	'Flooded Staircase'00	; 38
	asc	'Hunter'27's Crypt'00	; 39
	asc	'Corridor of Bones'00	; 40
	asc	'Red Ravine'00		; 41
	asc	'Natural Arch'00	; 42
	asc	'Poachers'27' Camp'00	; 43
	asc	'Pike Pit'00		; 44
	asc	'Suspended Path'00	; 45
	asc	'Dry Waterfall'00	; 46
	asc	'Lynx'27's Lair'00	; 47
	asc	'Basalt Gate'00		; 48
	asc	'Low Jungle'00		; 49
	asc	'Rope Tree'00		; 50
	asc	'Collapsed Temple'00	; 51
	asc	'Mask Chamber'00	; 52
	asc	'Ocelot Courtyard'00	; 53
	asc	'Dead Library'00	; 54
	asc	'Fresco Hall'00		; 55
	asc	'Sealed Sanctuary'00	; 56
	asc	'Windy Plateau'00	; 57
	asc	'Singing Stones'00	; 58
	asc	'Ruined Observatory'00	; 59
	asc	'Staircase of Shadows'00	; 60
	asc	'Gallery of Names'00	; 61
	asc	'Black Antechamber'00	; 62
	asc	'Gate of the Felines'00	; 63
	asc	'Ocelot Cemetery'00	; 64
	dfb	chrNULL

*--- Introduction

tblINTRO	da	strINTRO1,strINTRO2,strINTRO3,strINTRO4,strINTRO5
*	asc	'1234567890123456789012345678901234567890'
strINTRO1	asc	'The Ocelot Cemetery'00
strINTRO2	asc	'Based on an original idea by Turk182!'00
strINTRO3	asc	'Apple IIgs version by'00
strINTRO4	asc	'Antoine Vignau & Olivier Zardini'00
strINTRO5	asc	'(c) 2026, Brutal Deluxe Software'00
	