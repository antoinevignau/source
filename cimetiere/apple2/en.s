*
* Le cimetiere des ocelots
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
	str	'NORTH'	;  1 NORD
	str	'S'	;  2 SUD
	str	'SOUTH'	;  2 SUD
	str	'W'	;  3 OUEST
	str	'WEST'	;  3 OUEST
	str	'E'	;  4 EST
	str	'EAST'	;  4 EST
	str	'I'	;  7 INVENTAIRE
	str	'INVE'	;  7 INVENTAIRE
	str	'INVEN'	;  7 INVENTAIRE
	str	'GO'	; 10 ALLER
	str	'LIGHT'	; 11 ALLUMER
	str	'TEAR'	; 12 ARRACHER
	str	'ASSEM'	; 13 ASSEMBLER
	str	'ATTAC'	; 14 ATTACHER
	str	'DRINK'	; 15 BOIS/BOIRE
	str	'DRINK'	; 15 BOIS/BOIRE
	str	'LOOK'	; 16 CHERCHER
	str	'DIG'	; 17 CREUSER
	str	'DOWN'	; 18 DESCENDRE
	str	'GIVE'	; 19 DONNER
	str	'LISTE'	; 20 ECOUTER
	str	'ENTER'	; 21 ENTRER
	str	'UNLIG'	; 22 ETEINDRE (TURN OFF)
	str	'EXAMI'	; 23 EXAMINER
	str	'SEARC'	; 24 FOUILLER
	str	'HIT'	; 25 FRAPPER
	str	'THROW'	; 26 JETTE
	str	'THROW'	; 26 JETTE
	str	'PLAY'	; 27 JOUER
	str	'READ'	; 28 LIRE
	str	'PUT'	; 29 METS/METTRE
	str	'PUT'	; 29 METS/METTRE
	str	'UP'	; 30 MONTER
	str	'OPEN'	; 31 OUVRIR
	str	'OPEN'	; 31 OUVRIR
	str	'TALK'	; 32 PARLER
	str	'TALK'	; 33 PASSER
	str	'PLACE'	; 34 PLACER
	str	'CARRY'	; 35 PORTER
	str	'DROP'	; 36 POSER
	str	'DROP'	; 36 POSER
	str	'PUSH'	; 37 POUSSER
	str	'TAKE'	; 38 PRENDRE
	str	'L'	; 39 R
	str	'LOOK'	; 39 REGARDER
	str	'FILL'	; 40 REMPLIR
	str	'PULL'	; 41 TIRER
	str	'PULL'	; 41 TIRER
	str	'TURN'	; 42 TOURNER
	str	'CROSS'	; 43 TRAVERSER
	str	'USE'	; 44 UTILISER
	str	'POUR'	; 45 VERSER
	str	'FORWA'	; 46 AVANCER
	str	'GO'	; 10 ALLER
	str	'READ'	; 28 LIRE
	str	'LOAD'	; 90 CHARGER
	str	'LOAD'	; 90 LOAD
	str	'SAVE'	; 91 SAUVER
	str	'SAVE'	; 91 SAVE
	str	'RESTA'	; 92 RECOMMENCER
	str	'QUIT'	; 93 QUITTER

*-------------------------------
* NOMS
*-------------------------------

tblN	dfb	0	; value if not found
	dfb	1,1,2,2,3,3,4,4
	dfb	10,11,12,13,14,15,16,17,18,19
	dfb	20,21,22,23,24,25,26,27,28,29
	dfb	30,31,32,33,34,35,36,37,38,39
	dfb	40,41,42,42,43,44,45,46,47,48,49
	dfb	50,51,52,53,54,55,56,57,58,59
	dfb	60,61,62,63,64,65,66,67,68,69
	dfb	70,71,72,73,74,75,76,77,78,79
	dfb	80,81,82,83,84,85,86,87,88,89
	dfb	90,91,92,93,94,95,96

tblNOUN	str	'N'	;  1 NORD
	str	'NORTH'	;  1 NORD
	str	'S'	;  2 SUD
	str	'SOUTH'	;  2 SUD
	str	'W'	;  3 OUEST
	str	'WEST'	;  3 OUEST
	str	'E'	;  4 EST
	str	'EAST'	;  4 EST
	str	'AMULE'	; 10 AMULETTE
	str	'ANCHO'	; 11 ANCRAGE
	str	'TREE'	; 12 ARBRE
	str	'WORKS'	; 13 ATELIER
	str	'ALTAR'	; 14 AUTEL
	str	'LIBRA'	; 15 BIBLIOTHEQUE
	str	'CROWB'	; 16 BICHE (PIED DE BICHE)
	str	'COAT'	; 17 BLASON
	str	'COMPA'	; 18 BOUSSOLE
	str	'BRAZI'	; 19 BRASERO
	str	'CHISE'	; 20 BURIN
	str	'SHACK'	; 21 CABANE
	str	'CAPE'	; 22 CAPE
	str	'FALL'	; 23 CASCADE (WATERFALL=FALL)
	str	'CHAPE'	; 24 CHAPELLE
	str	'OAK'	; 25 CHENE
	str	'KEY'	; 26 CLE
	str	'BELL'	; 27 CLOCHETTE
	str	'ROPE'	; 28 CORDE
	str	'CHALK'	; 29 CRAIE
	str	'HOOK'	; 30 CROCHET
	str	'CRYPT'	; 31 CRYPTE
	str	'DEBRI'	; 32 DEBRIS
	str	'TOOTH'	; 33 DENT
	str	'WATER' 	; 34 EAU
	str	'ECHO'	; 35 ECHO
	str	'INCEN'	; 36 ENCENS
	str	'STAIR'	; 37 ESCALIER
	str	'FLOWE'	; 38 FLEUR
	str	'FLUTE'	; 39 FLUTE
	str	'FORGE'	; 40 FORGE
	str	'PIT'	; 41 FOSSE
	str	'FERN'	; 42 FOUGERE
	str	'FERNS'	; 42 FOUGERES
	str	'FRECO'	; 43 FRESQUE
	str	'FLASK'	; 44 GOURDE
	str	'GRATE'	; 45 GRILLE
	str	'OIL'	; 46 HUILE
	str	'INSCR'	; 47 INSCRIPTION
	str	'GARDE'	; 48 JARDIN
	str	'TOKEN'	; 49 JETON
	str	'LANTE'	; 50 LANTERNE
	str	'BOOK'	; 51 LIVRE
	str	'LYNX'	; 52 LYNX
	str	'HOUSE'	; 53 MAISON
	str	'HAMME'	; 54 MARTEAU
	str	'MASK'	; 55 MASQUE
	str	'MEDAL'	; 56 MEDAILLE
	str	'MIRRO'	; 57 MIROIR
	str	'WALL'	; 58 MUR
	str	'OCELO'	; 59 OCELOT
	str	'FOOTB'	; 60 PASSERELLE
	str	'SHOVE'	; 61 PELLE
	str	'BAR'	; 62 PIED (PIED DE BICHE)
	str	'STONE'	; 63 PIERRE
	str	'STAKE'	; 64 PIEU
	str	'PLAN'	; 65 PLAN/PLANCHE/PLANTE
	str	'BRIDG'	; 66 PONT
	str	'DOOR'	; 67 PORTE
	str	'WELL'	; 68 PUITS
	str	'ROOT'	; 69 RACINE
	str	'SHELF'	; 70 RAYON
	str	'GUTTE'	; 71 RIGOLE
	str	'BOULD'	; 72 ROCHER
	str	'ROOM'	; 73 SALLE
	str	'SEAL'	; 74 SCEAU
	str	'LOCK'	; 75 SERRURE
	str	'SILHO'	; 76 SILHOUETTE
	str	'PEDES'	; 77 SOCLE
	str	'GROUN' 	; 78 SOL
	str	'SPRIN'	; 79 SOURCE
	str	'STATU'	; 80 STATUE
	str	'STELE'	; 81 STELE
	str	'CANVA'	; 82 TOILE
	str	'TOMB'	; 83 TOMBE
	str	'TORCH'	; 84 TORCHE
	str	'TOWER'	; 85 TOUR
	str	'WINCH'	; 86 TREUIL
	str	'VILLA'	; 87 VILLAGE
	str	'BRONZ'	; 88 CLE DE BRONZE
	str	'BONE'	; 89 CLE D'OS
	str	'BLACK'	; 90 CLE NOIRE
	str	'TABLE'	; 91 TABLE
	str	'PLANK'	; 92 PLANCHE
	str	'PLANT'	; 93 PLANTE
	str	'VIAL'	; 94 FIOLE
	str	'FRAGM'	; 95 FRAGMENT
	str	'STAFF'	; 96 BATON
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

strMESSAGE	asc	'THE OCELOT CEMETERY'00				;   1
	asc	'INVENTORY'00					;   2
	asc	'Inserez face a et appuyez entree'00			;   3--
	asc	'Tournez disquette : face b + entree'00			;   4--
	asc	'ISSUE(S):'00					;   5
	asc	'YOU SEE:'00					;   6
	asc	'nothing'00					;   7
	asc	'Medal'00				;   8
	asc	'Stone'00					;   9
	asc	'Fragment'00					;  10
	asc	'Stick'00					;  11
	asc	'Cloak'00					;  12
	asc	'Flower'00					;  13
	asc	'Press a key to return'00				;  14
*	asc	'Command > '00					;  15
strCOMMANDE	asc	'00 00 00 > '00					;  15
strCHEAT	asc	'TURK182! THE BEST'00				;  16
	asc	'I don'27't understand'00				;  17
	asc	'You can'27't do that here'00			;  18
	asc	'No path in this direction'00			;  19
	asc	'The bridge snaps. You fall into the ravine'00			;  20
	asc	'The footbridge gives way beneath your feet'00			;  21
	asc	'The predator has picked up your scent'00		;  22
	asc	'The temple'27's traps prove fatal'00			;  23
	asc	'Passage blocked. Examinez the area'00			;  24
	asc	'Darts shoot out from the walls'00			;  25
	asc	'It seems to be moving'00				;  26
	asc	'There is nothing like that here'00				;  27
	asc	'Very useful for the dry well'00			;  28
	asc	'A door opens to the east'00			;  29
	asc	'You take the lantern which reveals a secret passage'00		;  30
	asc	'Fragment taken. '00				;  31
	asc	'Chalk taken. '00				;  32
	asc	'You took '00				;  33
	asc	'Object dropped'00					;  34
	asc	'You throw '00					;  35
	asc	'You find a shovel'00				;  36
	asc	'I get the feeling something is hidden'00		; 37
	asc	'The bridge is fragile'00				; 38
	asc	'The cavity is empty'00				; 39
	asc	'Someone seems to have forgotten their flask'00	; 40
	asc	'The water looks suspicious'00			; 41
	asc	'The rope is securely fastened'00			; 42
	asc	'It looks like it'27's missing a rope'00			; 43
	asc	'You find a hammer and a chisel'00			; 44
	asc	'The room echoes-perfect for playing music'00		; 45
	asc	'It'27's full of debris'00				; 46
	asc	'You see a coat of arms and a table'00			; 47
	asc	'You find a vial of oil'00				; 48
	asc	'You see a mirror and an altar'00			; 49
	asc	'You see a compass and a staircase leading up'00	; 50
	asc	'You see a staircase leading up'00			; 51
	asc	'It'27's blocking a passageway'00			; 52
	asc	'You find the missing fragment of your map'00		; 53
	asc	'It looks like they control a mechanism'00		; 54
	asc	'It'27's an ocelot mask'00				; 55
	asc	'A tooth is loose'00				; 56
	asc	'The walkway is fragile'00				; 57
	asc	'The walkway seems secure'00				; 58
	asc	'It appears to be made of bronze'00			; 59
	asc	'You find a torch'00				; 60
	asc	'You don'27't see anything special'00			; 61
	asc	'It looks like a seal has been torn off.'00		; 62
	asc	'You'27'll see better with a mirror'00			; 63
	asc	'You find '00				; 64
	asc	'If only I had a hammer, as the song goes!'00		; 65
	asc	'It seems drawn to a sweet-smelling offering'00		; 66
	asc	'These faded lines could be retraced'00			; 67
	asc	'It seems to be waiting for a stone'00			; 68
	asc	'They were meant to hold water'00			; 69
	asc	'A round indentation seems to await an emblem'00		; 70
	asc	'They seem to have lost their bearings'00			; 71
	asc	'You see an inscription'00				; 72
	asc	'The guardian seems to want to speak to you'00			; 73
	asc	'It would be better with a rope'00			; 74
	asc	'The bridge seems secure'00				; 75
	asc	'The footbridge seems secure'00				; 76
	asc	'The door opens'00					; 77
	asc	'The flask is full'00					; 78
	asc	'You clear the way to the south'00			; 79
	asc	'The rope is secured'00					; 80
	asc	'A rope is missing'00					; 81
	asc	'A trapdoor opens and you discover a flute. You retrieve the rope'00	; 82
	asc	'A wall vibrates and opens a secret passage to the south'00		; 83
	asc	'The grate opens; you can go down'00			; 84
	asc	'You descend toward the chapel'00			; 85
	asc	'Oiled torch'00				;  86
	asc	'An inscription appears'00				;  87
	asc	d2'Felines: make the metal ring'd300			;  88 with "" d2 d3
	asc	'The reflection targets a tower to the east'00			;  89
	asc	'You see a passage to the north'00			;  90
	asc	'A passage to the east has opened'00			;  91
	asc	'Command cancelled'00				;  92 chaine vide
	asc	'Do you want to restart? Y/N'00			;  93
	asc	'Complete plan: altar, stone, gutters'00			; 94
	asc	'The plan is not complete'00			; 95
	asc	'Dry gutters appear'00			; 96
	asc	'It traces an arrow pointing east'00			; 97
	asc	'As the song went: add some oil!'00		; 98
	asc	'Passage to the lake revealed'00			; 99
	asc	'The Bone Corridor to the east is now open'00		; 100
	asc	'The gate opens to the south'00			; 101
	asc	'Your scent is masked'00				; 102
	asc	'You are missing a hammer'00				; 103
	asc	'You are missing a chisel'00				; 104
	asc	'The mechanism gives way and clears the path'00		; 105
	asc	'The token disappears. A passage to the west opens'00		; 106
	asc	'A passage to the west opens and the small bell is added to your inventory'00	; 107
	asc	'The traps are now visible; you can proceed'00		; 108
	asc	'You disarm the traps'00			; 109
	asc	'Three pieces of evidence: mask, jade, tooth'00			; 110
	asc	'An amulet is revealed'00			; 111
	asc	'A secret passage leads you back to the lower jungle'00		; 112
	asc	'One of them points to a stone to the east'00			; 113
	asc	'You discover a passage to the east'00			; 114
	asc	'He hands you a black key'00			; 115
	asc	'You have taken an ocelot tooth'00			; 116
	asc	'Your key is hard to insert; the mechanism needs to be unblocked'00	; 117
	asc	'The lock is unblocked'00				; 118
	asc	'Tooth placed'00				; 119
	asc	'You are missing a rope'00				; 120
	asc	'You are missing a hook'00				; 121
	asc	'You see a passage to the jungle'00			; 122
	asc	'The bridge will give way without a plank'00			; 123
	asc	'It is locked'00				; 124
	asc	'The door is open'00					; 125
	asc	'The water is poisoning you'00				; 126
	asc	'You need a flask'00					; 127
	asc	'A shovel would clear away the roots'00			; 128
	asc	'You don'27't have a map'00					; 129
	asc	'The room echoes - ideal for playing music'00		; 130
	asc	'The grate requires a crowbar'00				; 131
	asc	'A fragment is missing'00				; 132
	asc	d2'The shadows only vanish before the green glow of your amulet'd300	; 133 with "" d2 d3
	asc	' is useless here'00					; 134
	asc	'You see nothing special'00				; 135
	asc	'Inserez face a puis entree'00			; 136
	asc	'Game has been saved'00				; 137
	asc	'Game has been loaded'00				; 138
	asc	'There are still objects or puzzles to use'00		; 139
	asc	'The door creaks and finally opens'00			; 140
	asc	'You are dead'00				; 141
	asc	'Start again? Y/N '00				; 142
	asc	'Face a + entree'00				; 143--
	asc	'Face b + entree'00				; 144--
	asc	d2'CONGRATULATIONS!'d300				; 145 with "" d2 d3
	asc	'You have found the ocelot'00			; 146
	asc	'cimetery and its treasure'00			; 147
	asc	'Press any key to enter'00				; 148
	asc	'the room'00				; 149
	asc	'The well has already been searched'00			; 150
	asc	'The traps are now visible'00			; 151
	asc	'The passage to the south is open'00			; 152
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

tblMF	asc	'MMMMMMMMMMMMFMMMMMMFMMFMMMMMFMMM'

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
	asc	'Guard'27's medal'00	; 12 56	xx
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
	asc	'Engraved stone'00	; 23 63	xx
	asc	'Tooth'00		; 24 33 *	-> orange
	asc	'Wax seal'00		; 25 74
	asc	'Damp book'00		; 26 51
	asc	'Stele fragment'00	; 27 95 81	xx
	asc	'Black key'00		; 28 26 90
	asc	'Incense stick'00	; 29 96 36	xx
	asc	'Poacher'27's cloak'00	; 30 22	xx
	asc	'Token'00		; 31 49
	asc	'Night flower'00	; 32 38	xx
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
	