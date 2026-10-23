*
* Utopia
* by William Demas
*
* (c) 1985, Unicorn Software
* (c) 2026, Brutal Deluxe Software
*

	mx	%00
	lst	off

*--- Chars

chrOUI	=	'Y'
chrNON	=	'N'

chrNORD	=	'N'
chrSUD	=	'S'
chrEST	=	'E'
chrOUEST	=	'W'
chrHAUT	=	'U'
chrBAS	=	'D'
chrINVENTORY	=	'I'

iNOUN_ANY	=	1
iNOUN_NORTH	=	2
iNOUN_SOUTH	=	3
iNOUN_EAST	=	4
iNOUN_WEST	=	5
iNOUN_UP	=	6
iNOUN_DOWN	=	7
iINVENTORY	=	27

iVERB_NOUN	=	42

iVERB_GO	=	3
iVERB_NORTH	=	43
iVERB_SOUTH	=	44
iVERB_EAST	=	45
iVERB_WEST	=	46
iVERB_UP	=	47
iVERB_DOWN	=	48

*--- Other strings

* ": 22 or 27
* ': 27 or A7

strCOMMANDE	asc	0d'> '00
strREPLAY	asc	0d'This Adventure is Over.'0d'Would You Like to Play Again? '00
strLOADGAME	asc	0d'Load game (slot 1-9)? '00	; ** new ** load game (slot 1-9)?
strSAVEGAME	asc	0d'Save game (slot 1-9)? '00	; ** new ** save game (slot 1-9)?

* VOCABULARY

* / is a word separator, same index
* * is a end of word separator
* /0 is the end of the list

tblN	dfb	00
	dfb	01,02,03,04,05,06,07,08,09,09,10,11,12,12,13,13	
	dfb	14,15,16,17,17,18,19,20,21,22,23,24,24,25,26,27
	dfb	28,29,29,30,31,31,32,33,34,35,36,36,37,38,39,40
	dfb	41,42,43,44,44,45,46,47,48,49,49,50,51,52,53,53
	dfb	54,55,55,56,57,58,59,60,61,62,63,63,64,64,65,65
	dfb	66,67,68,69,69,70,71,71,72,73,74,75,76,77,78,78
	dfb	79,80,81,82,83
	
tblNOUN	str	'ANY'	; 1
	str	'NORT'	; 2
	str	'SOUT'	; 3
	str	'EAST'	; 4
	str	'WEST'	; 5
	str	'UP'	; 6
	str	'DOWN'	; 7
	str	'OUT'	; 8
	str	'CYLI'	; 9
	str	'PLAS'	; 9
	str	'CABI'	; 10
	str	'SCRE'	; 11
	str	'CONT'	; 12
	str	'PANE'	; 12
	str	'CHAI'	; 13
	str	'SEAT'	; 13
	str	'HAND'	; 14
	str	'RAG'	; 15
	str	'GAME'	; 16
	str	'DISR'	; 17
	str	'WEAP'	; 17
	str	'KEY'	; 18
	str	'BUTT'	; 19
	str	'WHIT'	; 20
	str	'BLUE'	; 21
	str	'BOX'	; 22
	str	'TUBE'	; 23
	str	'PLAT'	; 24
	str	'META'	; 24
	str	'HATC'	; 25
	str	'CRAW'	; 26
	str	'WIRE'	; 27
	str	'LAKE'	; 28
	str	'LEAT'	; 29
	str	'BAG'	; 29
	str	'CAVE'	; 30
	str	'SHOV'	; 31
	str	'SPAD'	; 31
	str	'OGRE'	; 32
	str	'HOLE'	; 33
	str	'CONC'	; 34
	str	'BOUL'	; 35
	str	'AXE'	; 36
	str	'AX'	; 36
	str	'SKEL'	; 37
	str	'SIGN'	; 38
	str	'TREE'	; 39
	str	'AMUL'	; 40
	str	'MOUN'	; 41
	str	'CROS'	; 42
	str	'ROPE'	; 43
	str	'FORE'	; 44
	str	'WOOD'	; 44
	str	'OPEN'	; 45
	str	'BONE'	; 46
	str	'PICK'	; 47
	str	'BAT'	; 48
	str	'WELL'	; 49
	str	'FOUN'	; 49
	str	'CENT'	; 50
	str	'RIVE'	; 51
	str	'LOG'	; 52
	str	'BRAN'	; 53
	str	'STIC'	; 53
	str	'BOWL'	; 54
	str	'COIN'	; 55
	str	'GOLD'	; 55
	str	'BOOK'	; 56
	str	'PAPE'	; 57
	str	'SWAM'	; 58
	str	'ALLI'	; 59
	str	'PEDE'	; 60
	str	'AMPH'	; 61
	str	'BOLT'	; 62
	str	'ASP'	; 63
	str	'SNAK'	; 63
	str	'GROU'	; 64
	str	'FLOO'	; 64
	str	'RAFT'	; 65
	str	'ABOA'	; 65
	str	'ROAD'	; 66
	str	'CITY'	; 67
	str	'DEBR'	; 68
	str	'SHIP'	; 69
	str	'CRUI'	; 69
	str	'INVE'	; 70
	str	'LIQU'	; 71
	str	'WATE'	; 71
	str	'FIGU'	; 72
	str	'TUNN'	; 73
	str	'RUBB'	; 74
	str	'DOOR'	; 75
	str	'SPEA'	; 76
	str	'YOU'	; 77
	str	'ME'	; 78
	str	'MYSE'	; 78
	str	'COSM'	; 79
	str	'UTOP'	; 80
	str	'CREA'	; 81
	str	'GLAS'	; 82
	str	'SHIE'	; 83
	dfb	chrNULL

tblV	dfb	00
	dfb	01,01,01,01,01,01,02,02,02,02,03,03,03,03,03,03
	dfb	03,03,03,04,04,04,05,05,06,06,06,06,06,06,06,07
	dfb	07,07,07,07,07,07,08,08,08,08,09,10,10,11,11,11
	dfb	11,12,13,14,14,14,14,14,14,14,15,16,17,17,18,19
	dfb	20,21,22,22,23,24,25,26,27,28,29,30,31,31,32,33
	dfb	33,34,35,36,37,37,37,37,37,37,38,39,39,40,40,41
	dfb	42,42,36,43
	
tblVERB	str	'GET'	; 1
	str	'TAKE'	; 1
	str	'GRAB'	; 1
	str	'HOLD'	; 1
	str	'CARR'	; 1
	str	'FETC'	; 1
	str	'DROP'	; 2
	str	'PUT'	; 2
	str	'THRO'	; 2
	str	'RELE'	; 2
	str	'GO'	; 3
	str	'WALK'	; 3
	str	'RIDE'	; 3
	str	'STEP'	; 3
	str	'ENTE'	; 3
	str	'RUN'	; 3
	str	'CROS'	; 3
	str	'SWIM'	; 3
	str	'CLIM'	; 3
	str	'OPEN'	; 4
	str	'UNLO'	; 4
	str	'UNCO'	; 4
	str	'REMO'	; 5
	str	'UNSC'	; 5
	str	'PUSH'	; 6
	str	'PRES'	; 6
	str	'SHOV'	; 6
	str	'MOVE'	; 6
	str	'HIT'	; 6
	str	'SLAP'	; 6
	str	'PUNC'	; 6
	str	'EXAM'	; 7
	str	'LOOK'	; 7
	str	'INSP'	; 7
	str	'SEAR'	; 7
	str	'VIEW'	; 7
	str	'SEE'	; 7
	str	'READ'	; 7
	str	'SAY'	; 8
	str	'SCRE'	; 8
	str	'HOLL'	; 8
	str	'YELL'	; 8
	str	'INSE'	; 9
	str	'USE'	; 10
	str	'WITH'	; 10
	str	'CLOS'	; 11
	str	'SHUT'	; 11
	str	'SEAL'	; 11
	str	'COVE'	; 11
	str	'QUIT'	; 12
	str	'DIG'	; 13
	str	'KILL'	; 14
	str	'DEST'	; 14
	str	'WREC'	; 14
	str	'SMAS'	; 14
	str	'BREA'	; 14
	str	'ATTA'	; 14
	str	'HANG'	; 14
	str	'BLOW'	; 15
	str	'WEAR'	; 16
	str	'SHOO'	; 17
	str	'FIRE'	; 17
	str	'AT'	; 18
	str	'TIE'	; 19
	str	'TO'	; 20
	str	'FILL'	; 21
	str	'DRIN'	; 22
	str	'EAT'	; 22
	str	'IN'	; 23
	str	'WRES'	; 24
	str	'LOAD'	; 25
	str	'FROM'	; 26
	str	'SAVE'	; 27
	str	'WAIT'	; 28
	str	'GIVE'	; 29
	str	'EMPT'	; 30
	str	'POUR'	; 31
	str	'SPLI'	; 31
	str	'COUN'	; 32
	str	'HELP'	; 33
	str	'HINT'	; 33
	str	'CHOP'	; 34
	str	'ON'	; 35
	str	'INVE'	; 36
	str	'SHIT'	; 37
	str	'FUCK'	; 37
	str	'DAMN'	; 37
	str	'PISS'	; 37
	str	'ASS'	; 37
	str	'BAST'	; 37
	str	'VERS'	; 38
	str	'MAC'	; 39
	str	'UTOP'	; 39
	str	'LIST'	; 40
	str	'HEAR'	; 40
	str	'SCOR'	; 41
	str	'LEAV'	; 42
	str	'QUIT'	; 42
	str	'I'	; 36
	str	'CHEA'	; 43
	dfb	chrNULL

* TEXTS

* \ is a sentence separator
* | is a carriage return

tblTEXTS
	asc	'\'0d'Rough Landing......'0d'But We Made it !'0d0d
	asc	'\WOOOOOSH'
	asc	'\'0d'BOOOOOOM'0d'The Ship Crashes'0d'Into the Planetoid !'0d
	asc	'\OK'
	asc	'\'0d'I Hear an Alarm Sounding!'0d
	asc	'\I Found'
	asc	'\Something.'
	asc	'\Nothing'
	asc	'\It'27's Locked'
	asc	'\There'27's a Blue Button'0d'and a White Button on it.'
	asc	'\It'27's Marked '22'AUTO PILOT'22''
	asc	'\OUCH!'
	asc	'\Button Glows Bright'
	asc	'\Red.'
	asc	'\Green.'
	asc	'\-CLICK-'	; 10
	asc	'\The Ship is on a Collision'0d'Course With a Planetoid!!'0d
	asc	'\Say Again & Use a Color Instead.'
	asc	'\Sorry, It'27's Screwed Down.'
	asc	'\'0d'BOOOOM!'
	asc	'\It'27's Too HOT!!'
	asc	'\It Shatters in My Hand!'
	asc	'\Sorry.'
	asc	'\Tell Me How?'
	asc	'\Welcome to UTOPIA'0d'Another Macintosh Adventure'0d'By William Demas'0d0d'Apple IIgs version'0d'by Brutal Deluxe Software'0d0d	; ** new av **
	asc	'\ALERT!  Cruiser Malfunction!'
	asc	'\This Liquid Isn'27't Water. My'0d'Whole Body Goes Numb and I Drown!'0d0d
	asc	'\It Says: Summon the Guardian'0d'of This Land and He Will'0d'Transport You Ac... The Rest'0d'of The Page is Missing!!'0d0d
	asc	'\Loud Noise Causes a Cave-in!'0d
	asc	'\A Strange Figure Appears...'
	asc	'\He SQUASHES Me!!'0d
	asc	'\Ogre SCREAMS!'	; 20
	asc	'\He Slumps Over and Dies.'
	asc	'\It Contains'
	asc	'\Bolts'
	asc	'\It Says:'0d'CONGRATULATIONS!  You'27've'0d'Reached UTOPIA!  You Remain'0d'Here in Peace Until the End'0d'of Your Days.'0d0d
	asc	'\TIMBER!'
	asc	'\It Begins to Glow.'
	asc	'\Ogre'
	asc	'\Won'27't Let Me.'
	asc	'\THUD. He Falls'0d'Right on Top of Me!!'0d
	asc	'\Ogres Begin Fighting.'
	asc	'\Ogre Battle'0d'Causes an AVALANCHE!!'0d
	asc	'\Won'27't Budge.'
	asc	'\At What?  Like: '22'AT TREE'220d
	asc	'\He Gets ANGRY!!'
	asc	'\ZAP'
	asc	'\Where?'	; 30
	asc	'\It Contains'
	asc	'\a Strange Liquid.'
	asc	'\Got Him!'
	asc	'\Happens.'
	asc	'\Bat'
	asc	'\Bites Me!!'0d
	asc	'\'0d'Centaur'
	asc	'\Figure'
	asc	'\Holds Out His Hand.'0d'I Think He Wants Something..'0d
	asc	'\Takes a Drink From the Well.'0d
	asc	'\Centaur Grabs His Throat,'0d'SCREAMS, and Falls Into'0d'The River.'0d
	asc	'\He'27's Carrying a'0d'Shiny Metal Shield.'
	asc	'\It Deflects Off of His Shield.'
	asc	'\He Takes it and'0d'Wanders Off...'0d
	asc	'\I Sink Like a Rock.'
	asc	'\I Float Across'0d'to the Other Side...'	; 40
	asc	'\It Says:  ..ross the Lake.'0d'Price for This Service is'0d'9 Gold Coins.'0d
	asc	'\What Do You Know!!'0d'I Did it !!!'0d
	asc	'\The Amphora Falls'0d'and Shatters.'
	asc	'\Asp'
	asc	'\Spear Shoots From'0d'Across the Room...'0d
	asc	'\and HITS ME!!'0d0d
	asc	'\and Hits the Wall.'
	asc	'\He Counts the Coins...'
	asc	'\Looks Dissatisfied'0d'and Strangles Me!!'0d0d
	asc	'\and Summons Me Aboard.'
	asc	'\I Have'
	asc	'\8'
	asc	'\9'
	asc	'\Coins'
	asc	'\I See'
	asc	'\He'27's After Me!!'	; 50
	asc	'\Lands on My Neck and'
	asc	'\Alligator'
	asc	'\He'27's Sitting Up'0d'Against the Wall.'
	asc	'\PING!'
	asc	'\Missed!'
	asc	'\I Hear a Loud Explosion'0d'in the Distance.'0d
	asc	'\The Ship Explodes!'
	asc	'\Charges.'
	asc	'\They'27're Petrified.'
	asc	'\U'
	asc	'\t'
	asc	'\o'
	asc	'\p'
	asc	'\i'
	asc	'\a'
	asc	'\ '
	asc	'\b'
	asc	'\y'
	asc	'\ '
	asc	'\W'
	asc	'\i'
	asc	'\l'
	asc	'\l'
	asc	'\i'
	asc	'\a'
	asc	'\m'
	asc	'\ '
	asc	'\D'
	asc	'\e'
	asc	'\m'
	asc	'\a'
	asc	'\s'
	asc	'\.'
	asc	'\.'
	asc	'\.'
	asc	'\We'27're Floating'0d'Towards the City...'0d
	asc	'\Vanishes.'
	asc	'\3'
	asc	'\2'
	asc	'\1'
	asc	'\Bolt.'
	asc	'\Water'
	asc	'\and'
	asc	'\It'27's Empty.'
	asc	'\It Says:'0d'Have You Played FUTURIA Yet?'0d'Try it!  You'27'll Like it!!'0d0d
	asc	'\I Don'27't Have Any.'
	asc	'\POISON!!'
	asc	'\Special.'
	asc	'\I Can'27't.'
	asc	'\Too High'
	asc	'\Rope Snapped, But I Made it!'0d
	asc	'\SPLAT!'
	asc	'\It'27's Dead.'
	asc	'\From'
	asc	'\Coin.'
	asc	'\It Soaks Into the Ground.'
	asc	'\It Sinks Into the Swamp.'
	asc	'\Special.'
	asc	'\7'
	asc	'\Holds Me Back.'
	asc	'\(Read the Sign)'
	asc	'\Slithers Up the'0d'Branch and Bites Me!!'0d0d
	asc	'\Doesn'27't Work.'
	asc	'\Don'27't Be Ridiculous.'
	asc	'\Something Grabs My'0d'Leg and Pulls Me Under!'0d0d
	asc	'\Examine Your Surroundings'0d'Carefully. (See the Hint Booklet'0d'for Additional Help.)'0d0d
	asc	'\'22'UTOPIA'22'   Version: 3.3'0d0d'Program: William Demas'0d'Graphics: Joseph Hewitt'0d0d'.1985  Unicorn Software Co.'0d0d0d
	asc	'\That'27's Me!'
	asc	'\Sorry.'0d'I Can'27't See a Thing.'
	asc	'\There is No Score in UTOPIA.'0d
	asc	'\(This Isn'27't FUTURIA)'0d
	asc	'\It'27's Screwed Down'0d'Onto the Floor.'
	asc	'\It'27's Closed.'
	asc	'\I'27'm Afraid That'0d'It'27'll Never Fly Again...'
	asc	'\It Looks BEAUTIFUL From Here,'0d'But There'27's No Way For Me to'0d'Get Across This Lake!!'
	asc	'\He'27's Blocking the Cave.'
	asc	'\Impossible...'
	asc	'\Sorry. It'27's Blocked.'
	asc	'\I Don'27't Have it.'
	asc	'\YUK!'
	asc	'\Very Strange...'
	asc	'\I Hear'
	asc	'\'0d'I Think One of the'0d'Skeletons Just Moved!!'
	asc	'\I Believe That'0d'They'27're Already DEAD!!'
	asc	'\They'27're All Holding'0d'Swords and Shields'
	asc	'\The Skeletons Come to'0d'Life and Hack Me to Pieces!!'0d0d
	asc	'\They'27're Eating Something'0d'That Looks Like Human Flesh!'0d'YUCK!'0d
	asc	'\That'27's Not a Very Good'0d'Idea! They Look Very'0d'Dangerous and Hungry!'0d
	asc	'\The Creatures Won'27't Let Me...'
	asc	'\'0d'The Creatures are Looking'0d'at Me With Hungry Eyes...'
	asc	'\'0d'The Creatures Decide That I'0d'Would Make a Good Snack. They'0d'Rip Me Into Bite-Size Pieces !!'0d0d
	asc	'\The Skeletons Won'27't Let Me...'
	asc	'\It is.'
	asc	'\If You Like Cities,'0d'Try Playing '22'FUTURIA'22'!'0d
	asc	'\Nice Try...'
	asc	'\He Pushes Me Back...'
	asc	'\He Knocks Me Down!!'
	asc	'\He Responds'0d'by KILLING ME!!'0d
	asc	'\It'27's Very Dark...'
	asc	'\'
	dfb	chrNULL

* OBJECTS

tblOBJECTS
	asc	'\Damaged Star-Cruiser'	; 1
	asc	'\Open Cabinet'	; 2
	asc	'\Metal Cabinet'	; 3
	asc	'\Large Plastic Cylinder'	; 4
	asc	'\View Screen'	; 5
	asc	'\Control Panel'	; 6
	asc	'\Chair'	; 7
	asc	'\Hatch'	; 8
	asc	'\Small Key'	; 9
	asc	'\Metal Plate'	; A
	asc	'\Crawlway'	; B
	asc	'\Mass of Wires'	; C
	asc	'\Charred Tube'	; D
	asc	'\Disruptor'	; E
	asc	'\Box'	; F
	asc	'\Screwdriver'	; 10
	asc	'\Old Rag'	; 11
	asc	'\Open Hatch'	; 12
	asc	'\Empty Socket'	; 13
	asc	'\Tube'	; 14
	asc	'\Broken Glass'	; 15
	asc	'\Freshly Socketed Tube'	; 16
	asc	'\Strange Lake'	; 17
	asc	'\Cave'	; 18
	asc	'\Shovel'	; 19
	asc	'\Ogre'	; 1A
	asc	'\Hole in the Wall'	; 1B
	asc	'\Hollow Conch'	; 1C
	asc	'\Boulder'	; 1D
	asc	'\Rocks'	; 1E
	asc	'\Axe'	; 1F
	asc	'\Skeleton'	; 20
	asc	'\Old Book'	; 21
	asc	'\Leather Bag'	; 22
	asc	'\Sign'	; 23
	asc	'\Trees'	; 24
	asc	'\Trees'	; 25
	asc	'\Trees'	; 26
	asc	'\Log'	; 27
	asc	'\Branch'	; 28
	asc	'\Dark Forest'	; 29
	asc	'\Amulet'	; 2A
	asc	'\Rope'	; 2B
	asc	'\Rocky Mountain'	; 2C
	asc	'\Ogre'	; 2D
	asc	'\Cave'	; 2E
	asc	'\Hole'	; 2F
	asc	'\Crossbow'	; 30
	asc	'\Opening'	; 31
	asc	'\Dusty Bones'	; 32
	asc	'\Pickaxe'	; 33
	asc	'\Hole'	; 34
	asc	'\Bat'	; 35
	asc	'\Well'	; 36
	asc	'\Strange Red River'	; 37
	asc	'\Centaur'	; 38
	asc	'\Small Bowl'	; 39
	asc	'\Gold Coin'	; 3A
	asc	'\Murky Swamp'	; 3B
	asc	'\Piece of Paper'	; 3C
	asc	'\Pedestal'	; 3D
	asc	'\Amphora'	; 3E
	asc	'\Asp'	; 3F
	asc	'\Gold Coins'	; 40
	asc	'\Cave'	; 41
	asc	'\Alligator'	; 42
	asc	'\Broken Amphora'	; 43
	asc	'\Rope Tied to Bolt'	; 44
	asc	'\Other End of Rope'	; 45
	asc	'\Bolt Embedded in the Ground'	; 46
	asc	'\Bolt'	; 47
	asc	'\Bolt'	; 48
	asc	'\Bolt'	; 49
	asc	'\Raft'	; 4A
	asc	'\Tall, Dark Figure'	; 4B
	asc	'\Fighting Ogres'	; 4C
	asc	'\Dirt Road'	; 4D
	asc	'\Branch With Asp on it'	; 4E
	asc	'\Spear Embedded in the Wall'	; 4F
	asc	'\Small Speaker'	; 50
	asc	'\Angry Ogre'	; 51
	asc	'\Dead Ogre'	; 52
	asc	'\Dead Ogre'	; 53
	asc	'\I'27'm Wearing an Amulet'	; 54
	asc	'\Loaded Crossbow'	; 55
	asc	'\Debris'	; 56
	asc	'\Rubble'	; 57
	asc	'\Narrow Tunnel'	; 58
	asc	'\Huge Door'	; 59
	asc	'\Gold Coin'	; 5A
	asc	'\Several Skeletons'	; 5B
	asc	'\Small Opening'	; 5C
	asc	'\Dusty Bones'	; 5D
	asc	'\Two Evil-Looking Creatures'	; 5E
	asc	'\Small Opening'	; 5F
	asc	'\Rocky Mountain'	; 60
	asc	'\'	; 61 = 97
	dfb	chrNULL

* MESSAGES

iMESSAGE_TOODARK =	1	; I can't see anything. It's too dark
iMESSAGE_EXIT	=	2	; Exits
iMESSAGE_NOEXIT	=	3	; I see no obvious exits
iMESSAGE_NOSEE	=	4	; I don't see anything
iMESSAGE_ISEE	=	5	; Things that I see
iMESSAGE_CARRY	=	7	; I'm carrying
iMESSAGE_IBEG	=	9	; I beg your pardon
iMESSAGE_10	=	10	; I don't see it here
iMESSAGE_11	=	11	; I already have it
iMESSAGE_12	=	12	; I'm carrying too much
iMESSAGE_NOTYET	=	13	; I can't do that yet
iMESSAGE_14	=	14	; I need a direction too
iMESSAGE_15	=	15	; I can't go that way
iMESSAGE_DARK	=	16	; Moving in the dark is dangerous
iMESSAGE_17	=	17	; SPLAT! I fell flat on my face
iMESSAGE_NOUNDER =	19	; I don't understand
iMESSAGE_EMPTY	=	20	; I'm emptyhanded
iMESSAGE_NOCAR	=	21	; I'm not carrying
iMESSAGE_HOW	=	22	; How can I drop something...
iMESSAGE_OK	=	23	; OK
iMESSAGE_NOTCAP	=	24	; I'm not capable of...
iMESSAGE_CHEATON =	45	; Cheat mode on
iMESSAGE_CHEATOFF =	46	; Cheat mode off
iMESSAGE_LOAD	=	47	; Load which slot (1-9)? '00
iMESSAGE_SAVE	=	48	; Save to which slot (1-9)? '00
iMESSAGE_IOERR	=	49	; Action cancelled.
iMESSAGE_LOADOK	=	50	; Game loaded successfully.
iMESSAGE_SAVEOK	=	51	; Game saved successfully.
iMESSAGE_CANCEL	=	52	; Operation cancelled.

tblMESSAGES	asc	'\I Can'27't See Anything. It'27's Too DARK!'	; 1
	asc	'\Exits: '	; 2
	asc	'\I See No Obvious Exits.'	; 3
	asc	'\ (I Don'27't See Anything)'	; 4
	asc	'\Things That I See:'0d' '	; 5
	asc	'\'0d'I Don'27't Know the '	; 6
* was end of 6: '(Huh?)'0d'Noun'0d'Verb'0d'	; 6
	asc	'\'0d'I'27'm Carrying:'	; 7
	asc	'\'0d'I'27'm Dead!'0d0d	; 8
	asc	'\'0d'I Beg Your Pardon ?'	; 9
	asc	'\'0d'I Don'27't See it Here...'	; 10
	asc	'\'0d'I Already Have it!'0d22'TAKE INVENTORY'22	; 11
	asc	'\'0d'I'27'm Carrying Too Much!'0d'Drop Something First!!!'	; 12
	asc	'\'0d'I Can'27't Do That Yet!'	; 13
	asc	'\'0d'I Need a Direction Too!'	; 14
	asc	'\'0d'I Can'27't Go That Way!'	; 15
	asc	'\'0d'Moving in the Dark is DANGEROUS!'	; 16
	asc	'\'0d'SPLAT!  I Fell Flat On My Face!!'	; 17
	asc	'\'0d'Stumbling Around in the Dark is'0d'Pointless. I Quit.'	; 18
	asc	'\'0d'I Don'27't Understand That!'	; 19
	asc	'\'0d'I'27'm Emptyhanded.'	; 20
	asc	'\'0d'I'27'm Not Carrying it!'0d22'TAKE INVENTORY'22	; 21
	asc	'\'0d'How Can I Drop Something'0d'That'27's Right in Front of Me?'	; 22
	asc	'\'0d'OK'	; 23
	asc	'\'0d'I'27'm Not Capable of Doing That.'	; 24
	asc	'\> LOAD GAME'	; 25
	asc	'\> SAVE GAME'	; 26
	asc	'\> QUIT'	; 27
	asc	'\> GO NORTH'	; 28
	asc	'\> GO SOUTH'	; 29
	asc	'\> GO EAST'	; 30
	asc	'\> GO WEST'	; 31
	asc	'\> GO UP'	; 32
	asc	'\> GO DOWN'	; 33
	asc	'\> HINT'	; 34
	asc	'\> TAKE INVENTORY'	; 35
	asc	'\Game Saved.'	; 36
	asc	'\Disk Full!'0d'Save Failed.'	; 37
	asc	'\Directory Full!'0d'Save Failed.'	; 38
	asc	'\Aborted'	; 39
	asc	'\Save Game as:'	; 40
	asc	'\1985 (c) Unicorn'	; 41
	asc	'\Verb '22	; 42
	asc	'\Noun '22	; 43
	asc	'\'22'.'	; 44
	asc	'\'0d'Cheat mode on'	; 45
	asc	'\'0d'Cheat mode off'	; 46
	asc	'\'0d'Load which slot (1-9)? '	; 47
	asc	'\'0d'Save to which slot (1-9)? '	; 48
	asc	'\'0d'I/O Error.'0d	; 49
	asc	'\'0d'Game loaded successfully.'0d	; 50
	asc	'\'0d'Game saved successfully.'0d	; 51
	asc	'\'0d'Operation cancelled.'0d	; 52
	dfb	chrNULL

* Rewrite of message 6
* I Don't Know the Verb + CR 'Prendre'.
* I Don't Know the Noun + CR 'Bouteille'.
* -> 6 + 42 + verb + 44
* -> 6 + 43 + noun + 44

* DESCRIPTIONS

* First words must be 'I'm '

tblDESCRIPTIONS
	asc	'\I'27'm in a Plastic Cylinder'	; 1
	asc	'\I'27'm Aboard a Star-Cruiser'	; 2
	asc	'\I'27'm Aboard a Star-Cruiser'	; 3
	asc	'\I'27'm Aboard a Star-Cruiser'	; 4
	asc	'\I'27'm Aboard a Star-Cruiser'	; 5
	asc	'\I'27'm Aboard a Star-Cruiser'	; 6
	asc	'\I'27'm in Narrow Crawlway'	; 7
	asc	'\I'27'm on an Earth-Like Planet. Across the Lake I See UTOPIA!'	; 8
	asc	'\I'27'm in a Green Pasture'	; 9
	asc	'\I'27'm in a Hidden Chamber'	; A
	asc	'\I'27'm at a Dead End'	; B
	asc	'\I'27'm in a Desolate Canyon'	; C
	asc	'\I'27'm in a Cave'	; D
	asc	'\I'27'm in a Cave'	; E
	asc	'\I'27'm in a Narrow Passageway'	; F
	asc	'\I'27'm in a Cave'	; 10
	asc	'\I'27'm in a Musty Grotto'	; 11
	asc	'\I'27'm in a Narrow Passageway'	; 12
	asc	'\I'27'M IN UTOPIA !!!'	; 13
	asc	'\I'27'm on a Dirt Road'	; 14
	asc	'\I'27'm on a Dirt Road'	; 15
	asc	'\I'27'm on a Dirt Road'	; 16
	asc	'\I'27'm in a Forbidding Chasm'	; 17
	asc	'\I'27'm on a Mountain Top'	; 18
	asc	'\I'27'm in a Dark Forest'	; 19
	asc	'\I'27'm on a Dirt Road'	; 1A
	asc	'\I'27'm in a Dark Forest'	; 1B
	asc	'\I'27'm in a Dark Forest'	; 1C
	asc	'\I'27'm in a Dusty Field'	; 1D
	asc	'\I'27'm in a Damp Cave'	; 1E
	asc	'\I'27'm in a Damp Cave'	; 1F
	asc	'\I'27'm in a Huge Underground Cavern'	; 20
	asc	'\I'27'm in a Damp Cave'	; 21
	asc	'\ '	; 22
	asc	'\I'27'm on an Eerie Beach'	; 23
	asc	'\I'27'm on a Dirt Path'	; 24
	asc	'\I'27'm on a Dirt Path'	; 25
	asc	'\I'27'm on a Muddy Bank'	; 26
	asc	'\I'27'm in a Murky Swamp'	; 27
	asc	'\I'27'm in an Ancient Shrine'	; 28
	asc	'\I'27'm on a Dirt Path'	; 29
	asc	'\I'27'm on a Raft'	; 2A
	asc	'\I'27'm Floating in a River'	; 2B
	asc	'\I'27'm by a Small Opening in a Mountain'	; 2C
	asc	'\I am in a Musty Old Cave. I Feel Very Nervous in Here.'	; 2D = 45
	dfb	chrNULL
