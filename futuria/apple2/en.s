*
* Futuria
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
	dfb	01,02,03,04,05,06,07,08,09,10,10,11,12,12,13
	dfb	14,15,16,17,18,19,19,20,20
	dfb	21,21,22,23,23,24,25,26,27,27,28,29,30,31,31
	dfb	32,33,33,34,35,36,37,38,39,40,41,42,43,44,45
	dfb	46,46,47,48,48,49,50,50,51,52,53,54,55,56,57
	dfb	58,59,60,60,61,62,63
	
tblNOUN	str	'ANY'	; 1
	str	'NORT'	; 2
	str	'SOUT'	; 3
	str	'EAST'	; 4
	str	'WEST'	; 5
	str	'UP'	; 6
	str	'DOWN'	; 7
	str	'DOOR'	; 8
	str	'INVE'	; 9
	str	'OPEN'	; 10
	str	'HOLE'	; 10
	str	'BUIL'	; 11
	str	'LIGH'	; 12
	str	'BEAM'	; 12
	str	'TUNN'	; 13
	str	'ROBO'	; 14
	str	'DEVI'	; 15
	str	'CHEM'	; 16
	str	'BEAK'	; 17
	str	'REPO'	; 18
	str	'ROD'	; 19
	str	'PLAS'	; 19
	str	'TOKE'	; 20
	str	'COIN'	; 20
	str	'CRYS'	; 21
	str	'CUBE'	; 21
	str	'BUTT'	; 22
	str	'GROU'	; 23
	str	'FLOO'	; 23
	str	'OIL'	; 24
	str	'MONO'	; 25
	str	'LEVE'	; 26
	str	'SLOT'	; 27
	str	'KEYH'	; 27
	str	'CARD'	; 28
	str	'CANI'	; 29
	str	'STON'	; 30
	str	'STRU'	; 31
	str	'REAC'	; 31
	str	'KEY'	; 32
	str	'LASE'	; 33
	str	'PIST'	; 33
	str	'BOX'	; 34
	str	'WAST'	; 35
	str	'1'	; 36
	str	'2'	; 37
	str	'3'	; 38
	str	'GREE'	; 39
	str	'RED'	; 40
	str	'YELL'	; 41
	str	'PLAT'	; 42
	str	'SCRE'	; 43
	str	'VENT'	; 44
	str	'CART'	; 45
	str	'FORC'	; 46
	str	'FIEL'	; 46
	str	'WIND'	; 47
	str	'PANE'	; 48
	str	'CONT'	; 48
	str	'SIGN'	; 49
	str	'LAKE'	; 50
	str	'WATE'	; 50
	str	'SPEA'	; 51
	str	'GAME'	; 52
	str	'PART'	; 53
	str	'COSM'	; 54 was 'COSMIC'
	str	'KNOB'	; 55
	str	'ROOM'	; 56
	str	'COMP'	; 57
	str	'SHIP'	; 58
	str	'YOU'	; 59
	str	'ME'	; 60
	str	'MYSE'	; 60
	str	'BRID'	; 61
	str	'CITY'	; 62
	str	'ESCA'	; 63
	dfb	chrNULL

tblV	dfb	00
	dfb	01,01,01,01,01,01,02,02,03,03,03,03,03,03,03
	dfb	03,03,03,04,04,05,05,05,05,05,05,05,06,06
	dfb	06,06,06,06,06,07,07,07,08,09,09,10,10,10,11
	dfb	11,11,12,13,14,14,15,16,17,17,18,19,19,19,20
	dfb	20,20,20,21,21,21,21,22,22,23,24,24,25,26,26
	dfb	27,28,28,29,30,31,31,31,32,32,33,33,33,34,35
	dfb	36,37,38,38,38,38,38,38,39,40,41,42
	dfb	27
	dfb	43	; CHEAT
	
tblVERB	str	'GET'	; 1
	str	'TAKE'	; 1
	str	'GRAB'	; 1
	str	'HOLD'	; 1
	str	'CARR'	; 1
	str	'FETC'	; 1
	str	'DROP'	; 2
	str	'PUT'	; 2
	str	'GO'	; 3
	str	'WALK'	; 3
	str	'RIDE'	; 3
	str	'STEP'	; 3
	str	'ENTE'	; 3
	str	'EXIT'	; 3
	str	'RUN'	; 3
	str	'CROS'	; 3
	str	'SWIM'	; 3
	str	'JUMP'	; 3
	str	'TOUC'	; 4
	str	'FEEL'	; 4
	str	'KILL'	; 5
	str	'DEST'	; 5
	str	'WREC'	; 5
	str	'RUIN'	; 5
	str	'SMAS'	; 5
	str	'BREA'	; 5
	str	'ATTA'	; 5
	str	'EXAM'	; 6
	str	'LOOK'	; 6
	str	'INSP'	; 6
	str	'SEAR'	; 6
	str	'VIEW'	; 6
	str	'SEE'	; 6
	str	'READ'	; 6
	str	'MIX'	; 7
	str	'BLEN'	; 7
	str	'STIR'	; 7
	str	'FILL'	; 8
	str	'USE'	; 9
	str	'WITH'	; 9
	str	'BEND'	; 10
	str	'FLEX'	; 10
	str	'TWIS'	; 10
	str	'PUSH'	; 11
	str	'PRES'	; 11
	str	'SHOV'	; 11
	str	'PULL'	; 12
	str	'QUIT'	; 13
	str	'HELP'	; 14
	str	'HINT'	; 14
	str	'SAVE'	; 15
	str	'INSE'	; 16
	str	'SHOO'	; 17
	str	'BLAS'	; 17
	str	'TURN'	; 18
	str	'OPEN'	; 19
	str	'UNLO'	; 19
	str	'UNCO'	; 19
	str	'CLOS'	; 20
	str	'SHUT'	; 20
	str	'SEAL'	; 20
	str	'COVE'	; 20
	str	'SAY'	; 21
	str	'SCRE'	; 21
	str	'HOLL'	; 21
	str	'YELL'	; 21
	str	'OIL'	; 22
	str	'LUBR'	; 22
	str	'EMPT'	; 23
	str	'POUR'	; 24
	str	'SPIL'	; 24
	str	'CRAW'	; 25
	str	'UNSC'	; 26
	str	'REMO'	; 26
	str	'INVE'	; 27
	str	'AT'	; 28
	str	'ON'	; 28
	str	'IN'	; 29
	str	'@@'	; 30
	str	'THRO'	; 31
	str	'TOSS'	; 31
	str	'HEAV'	; 31
	str	'DRIN'	; 32
	str	'SWAL'	; 32
	str	'EAT'	; 33
	str	'TAST'	; 33
	str	'SMEL'	; 33
	str	'COUN'	; 34
	str	'WAIT'	; 35
	str	'@@'	; 36
	str	'LOAD'	; 37
	str	'SHIT'	; 38
	str	'FUCK'	; 38
	str	'DAMN'	; 38
	str	'PISS'	; 38
	str	'ASS'	; 38
	str	'BAST'	; 38
	str	'VERS'	; 39 - was 'VERSION'
	str	'MAC'	; 40
	str	'SCOR'	; 41
	str	'MAGI'	; 42 - was 'MAGIC'
	str	'I'	; 27
	str	'CHEA'	; 43 - CHEAT
	dfb	chrNULL

* TEXTS

* \ is a sentence separator
* | is a carriage return

tblTEXTS	asc	'\WELCOME to '22'FUTURIA'220d	; 1
	asc	'a Macintosh Adventure'0d
	asc	'by William Demas'0d0d
	asc	'Apple IIgs version'0d
	asc	'by Brutal Deluxe Software'0d0d
*	asc	'Dedicated to All Mac'0d
	asc	'Dedicated to All Mac and Apple IIgs'0d
	asc	'Owners Everywhere...'0d0d
	asc	'\It Says:'0d		; 2
	asc	'Watch for The Next Adventure'0d
	asc	22'UTOPIA'22' Coming Soon!'0d0d
	asc	'\The Door Slides Open!'	; 3
	asc	'\My Hand Breaks the Beam and'	; 4
	asc	'\How?'	; 5
	asc	'\The Door is Wired!'0d'I'27'm ELECTROCUTED!!'0d0d	; 6
	asc	'\Sorry '	; 7
	asc	'\I Can'27't.'	; 8
	asc	'\Laying in a Pool of Oil.'	; 9
	asc	'\ZAP!'	; A
	asc	'\Robot '	; B
	asc	'\Won'27't Let Me.'	; C
	asc	'\The Opening Has Been Sealed.'	; D
	asc	'\Shoots Me!'	; E
	asc	'\Nothing'	; F
	asc	'\Happens.'	; 10
	asc	'\BOOOOOM!'	; 11
	asc	'\Chemicals EXPLODE!'	; 12
	asc	'\With What?'	; 13
	asc	'\'	; 14
	asc	'\'	; 15
	asc	'\'	; 16
	asc	'\'	; 17
	asc	'\'	; 18
	asc	'\'	; 19
	asc	'\'	; 1A
	asc	'\'	; 1B
	asc	'\'	; 1C
	asc	'\'	; 1D
	asc	'\'	; 1E
	asc	'\'	; 1F
	asc	'\It'27's Glowing'	; 20
	asc	'\Bright'	; 21
	asc	'\Light'	; 22
	asc	'\Pink'	; 23
	asc	'\Red'	; 24
	asc	'\I See'	; 25
	asc	'\Special.'	; 26
	asc	'\Cube'	; 27
	asc	'\Begins Whining.'	; 28
	asc	'\It'27's Getting Louder!'	; 29
	asc	'\EXPLODES!'	; 2A
	asc	'\Laser'	; 2B
	asc	'\OUCH!'	; 2C
	asc	'\It Begins to Glow.'	; 2D
	asc	'\Deadly Fumes Fill the Air.'	; 2E
	asc	'\A'	; 2F
	asc	'\Button'	; 30
	asc	'\Lever'	; 31
	asc	'\and'	; 32
	asc	'\Slot'	; 33
	asc	'\An Alluring Voice Says:'	; 34
	asc	'\'22'PASSWORD PLEASE!'22	; 35
	asc	'\'22'INSERT COIN PLEASE!'22	; 36
	asc	'\It'27's Rusty.'	; 37
	asc	'\We'27're Moving!'	; 38
	asc	'\We'27're Heading Underground!'0d'It'27's Getting Dark!'	; 39
	asc	'\We'27're Above Ground Again.'	; 3A
	asc	'\We'27've Stopped.'	; 3B
	asc	'\It Says:'0d'Welcome to FUTURIA'0d'The Password is: 3 15 19 13 9 3.'0d'G O O D   L U C K  !!'0d	; 3C
	asc	'\-CLICK- '	; 3D
	asc	'\Vaporizes.'	; 3E
	asc	'\The Rod is Getting Dim.'	; 3F
	asc	'\The Power is '	; 40
	asc	'\On'	; 41
	asc	'\Off'	; 42
	asc	'\Robot Says: '	; 43
	asc	'\'22'STOP'22	; 44
	asc	'\'22'STOP INTRUDER'22	; 45
	asc	'\'22'STOP ALIEN'22	; 46
	asc	'\'22'INTRUDER ALERT'22	; 47
	asc	'\My Hair is Falling Out!'	; 48
	asc	'\I Feel'	; 49
	asc	'\Strange...'	; 4A
	asc	'\Sick'	; 4B
	asc	'\I Die of Radiation Poisoning.'	; 4C
	asc	'\Something'	; 4D
	asc	'\I Hear'	; 4E
	asc	'\Bright Flash of Light!'	; 4F
	asc	'\There'27's a'	; 50
	asc	'\Yellow'	; 51
	asc	'\Spot Me and'	; 52
	asc	'\Key'	; 53
	asc	'\Card'	; 54
	asc	'\in it.'	; 55
	asc	'\Seems to be'	; 56
	asc	'\I Also See an Empty Slot.'	; 57
	asc	'\Has a Gun.'	; 58
	asc	'\and My'	; 59
	asc	'\My Hand'	; 5A
	asc	'\It Hits the'	; 5B
	asc	'\Vaporize'	; 5C
	asc	'\It Looks Like'	; 5D
	asc	'\Nuclear Reactor.'	; 5E
	asc	'\Deactivated.'	; 5F
	asc	'\They'27're'	; 60
	asc	'\Pulls Several Levers'	; 61
	asc	'\Presses Several Buttons'	; 62
	asc	'\Disappears.'	; 63
	asc	'\This Liquid Isn'27't Water. My'0d'Whole Body Goes Numb and I Drown!'0d0d	; 64
	asc	'\It'27's Full of '	; 65
	asc	'\a Strange Liquid.'	; 66
	asc	'\OK'	; 67
	asc	'\Small Knob.'	; 68
	asc	'\Green'	; 69
	asc	'\Say Again & Use a'0d'Color or Number Instead.'	; 6A
	asc	'\Where?'	; 6B
	asc	'\Too Heavy.'	; 6C
	asc	'\Won'27't Budge.'	; 6D
	asc	'\I Walk Out of a Moving Monorail!'	; 6E
	asc	'\Made of Lead.'	; 6F
	asc	'\A Robot Just Walked in.'	; 70
	asc	'\Tokens.'	; 71
	asc	'\1 Token.'	; 72
	asc	'\With'	; 73
	asc	'\Holds Me Back.'	; 74
	asc	'\DECONTAMINATION COMPLETE'	; 75
	asc	'\Follows Me.'	; 76
	asc	'\on it.'	; 77
	asc	'\Charges.'	; 78
	asc	'\Magnetic.'	; 79
	asc	'\Working on the Structure.'	; 7A
	asc	'\Strange Glowing Stone.'	; 7B
	asc	'\Robots '	; 7C
	asc	'\Attack!'	; 7D
	asc	'\OH NO!'	; 7E
	asc	'\GOT ONE! '	; 7F
	asc	'\Buttons Marked'	; 80
	asc	'\1'	; 81
	asc	'\2'	; 82
	asc	'\3'	; 83
	asc	'\There'27's a Slot With a'	; 84
	asc	'\It'27's Empty.'	; 85
	asc	'\Radioactive Material Causes'0d'a Malfunction! I Materialize'0d'Extremely Malformed!!'	; 86
	asc	'\'22'WARNING'22	; 87
	asc	'\'22'RESTRICTED AREA'22	; 88
	asc	'\'22'INTRUDER ALERT'22	; 89
	asc	'\Armed.'	; 8A
	asc	'\It'27's Screwed Shut.'	; 8B
	asc	'\WOOOSH'0d'I'27'm Sucked Out Into Space!'	; 8C
	asc	'\I Activate Something'0d'Out of Sequence.'	; 0d
	asc	'\Takes Off!  CONGRATULATIONS!!!'0d'YOU'27'VE DONE IT !!!'	; 8E
	asc	'\Hangar Doors Are'	; 8F
	asc	'\Open'	; 90
	asc	'\Closed'	; 91
	asc	'\Outer Space'	; 92
	asc	'\Space Ship'	; 93
	asc	'\is'	; 94
	asc	'\SHIP READY FOR LAUNCH'	; 95
	asc	'\Takes'	; 96
	asc	'\AW COME ON!'0d'You'27've Only Just'0d'Started Playing!'	; 97
	asc	'\'22'FUTURIA'22'   VERSION: 3.1'0d0d	; 98
	asc	'Program: William Demas'0d
	asc	'Graphics: Craig Sadler'0d0d
	asc	'(c) 1985 Unicorn Software Co.'0d
	asc	'(c) 2026 Brutal Deluxe Software'0d0d
	asc	'\See the Enclosed Hint Sheet...'	; 99
	asc	'\Don'27't be Ridiculous...'	; 9A
	asc	'\That'27's Me!'	; 9B
	asc	'\There is No Score in FUTURIA.'0d'Your Mission: Escape (ALIVE!)'0d0d	; 9C
	asc	'\There is No Magic in FUTURIA.'0d0d	; 9D
	dfb	chrNULL

* OBJECTS

tblOBJECTS	asc	'\Strange Lake'	; 1
	asc	'\Sign'	; 2
	asc	'\Small Speaker'	; 3
	asc	'\Huge Door'	; 4
	asc	'\Opening'	; 5
	asc	'\Cylindrical Building'	; 6
	asc	'\Thin Beam of Light'	; 7
	asc	'\Steel Door'	; 8
	asc	'\Strange Device'	; 9
	asc	'\Chemicals'	; A
	asc	'\Crystalline Cube'	; B
	asc	'\Repository'	; C
	asc	'\Small Token'	; D
	asc	'\Plastic Rod'	; E
	asc	'\Beaker'	; F
	asc	'\(It'27's Full of Oil)'	; 10
	asc	'\Monorail'	; 11
	asc	'\Glowing Rod'	; 12
	asc	'\Compartment'	; 13
	asc	'\Lever'	; 14
	asc	'\Door'	; 15
	asc	'\Open Door'	; 16
	asc	'\Plastic Card'	; 17
	asc	'\Canister'	; 18
	asc	'\Strange Structure'	; 19
	asc	'\Numerous Robots'	; 1A
	asc	'\Small Building'	; 1B
	asc	'\Green Key'	; 1C
	asc	'\Laser Pistol'	; 1D
	asc	'\Small Box'	; 1E
	asc	'\Red Button'	; 1F
	asc	'\Reactor'	; 20
	asc	'\Transuranic Waste'	; 21
	asc	'\Red Key'	; 22
	asc	'\Robot'	; 23
	asc	'\Control Panel'	; 24
	asc	'\Control Panel'	; 25
	asc	'\Small Tokens'	; 26
	asc	'\Lead Room'	; 27
	asc	'\Metal Platform'	; 28
	asc	'\Screwdriver'	; 29
	asc	'\Control Panel'	; 2A
	asc	'\Robot Parts'	; 2B
	asc	'\Small Cartridge'	; 2C
	asc	'\Keyhole'	; 2D
	asc	'\Control Panel'	; 2E
	asc	'\Vent'	; 2F
	asc	'\Open Vent'	; 30
	asc	'\Key in Keyhole'	; 31
	asc	'\Control Panel'	; 32
	asc	'\Yellow Key'	; 33
	asc	'\Many Colored Bottons & Levers'	; 34
	asc	'\Lead Room'	; 35
	asc	'\Force Field'	; 36
	asc	'\Space Ship'	; 37
	asc	'\Control Panel'	; 38
	asc	'\Hangar Doors'	; 39
	asc	'\Escalator'	; 3A
	asc	'\Remote Control Unit'	; 3B
	asc	'\Window'	; 3C
	asc	'\Glass Window'	; 3D
	asc	'\Control Panel'	; 3E
	asc	'\Atomic Waste'	; 3F
	asc	'\Control Panel'	; 40
	asc	'\Steel Door'	; 41
	asc	'\Open Canister'	; 42
	asc	'\Glowing Stone'	; 43
	asc	'\Small Building'	; 44
	asc	'\Lever'	; 45
	asc	'\Green Button'	; 46
	asc	'\Thin Beam of Light'	; 47
	asc	'\Steel Door'	; 48
	asc	'\Open Door'	; 49
	asc	'\Thin Beam of Light'	; 4A
	asc	'\Steel Door'	; 4B
	asc	'\Open Door'	; 4C
	asc	'\Thin Beam of Light'	; 4D
	asc	'\Steel Door'	; 4E
	asc	'\Open Door'	; 50
	asc	'\Thin Beam of Light'	; 51
	asc	'\Steel Door'	; 52
	asc	'\Open Door'	; 53
	asc	'\Thin Beam of Light'	; 54
	asc	'\Steel Door'	; 55
	asc	'\Open Door'	; 56
	asc	'\Thin Beam of Light'	; 57
	asc	'\Steel Door'	; 58
	asc	'\Thin Beam of Light'	; 59
	asc	'\Steel Door'	; 5A
	asc	'\Open Door'	; 5B
	asc	'\Thin Beam of Light'	; 5C
	asc	'\Steel Door'	; 5D
	asc	'\Open Door'	; 5E
	asc	'\Plastic Rod'	; 5F
	asc	'\Open Door'	; 60
	asc	'\Robot'	; 61
	asc	'\Control Panel'	; 62
	asc	'\Opening'	; 63
	asc	'\Robot'	; 64
	asc	'\Metal Platform'	; 65
	asc	'\Metal Platform'	; 66
	asc	'\Strange Lake'	; 67
	asc	'\Long Bridge'	; 68
	asc	'\'	; 69
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
	asc	'\FUTURIA Save Game Filename:'	; 40
	asc	'\Saved Game'	; 41
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

tblDESCRIPTIONS	asc	'\I'27'm in an Ultramodern City'	; 1
	asc	'\I'27'm in a Long Metal Tunnel'	; 2
	asc	'\I'27'm in a Long Metal Tunnel'	; 3
	asc	'\I'27'm in a Long Metal Tunnel'	; 4
	asc	'\I'27'm on a Metal Paved Street'	; 5
	asc	'\I'27'm on a Metal Paved Street'	; 6
	asc	'\I'27'm in a Laboratory'	; 7
	asc	'\I'27'm in a Laboratory'	; 8
	asc	'\I'27'm on a Metal Road'	; 9
	asc	'\I'27'm on a Metal Road'	; 10
	asc	'\I'27'm in a Repository'	; 11
	asc	'\I'27'm on an Escalator'	; 12
	asc	'\I'27'm at the Transportation Center'	; 13
	asc	'\I'27'm on a Monorail'	; 14
	asc	'\I'27'm in a Subterranean Shaft'	; 15
	asc	'\I'27'm in a Small Grotto'	; 16
	asc	'\I'27'm at a Dead End'	; 17
	asc	'\I'27'm in a Subterranean Shaft'	; 18
	asc	'\I'27'm in a Control Center'	; 19
	asc	'\I'27'm in an Underground Building'	; 20
	asc	'\I'27'm in a Small Lead Room'	; 21
	asc	'\I'27'm on a Metal Platform'	; 22
	asc	'\I'27'm in a Small Metal Room'	; 23
	asc	'\I'27'm in a Hallway'	; 24
	asc	'\I'27'm in a Storeroom'	; 25
	asc	'\I'27'm in a Steel Chamber'	; 26
	asc	'\I'27'm on a Metal Platform'	; 27
	asc	'\I'27'm in a Long Corridor'	; 28
	asc	'\I'27'm in a Small Room'	; 29
	asc	'\I'27'm in a Robot Assembly Room'	; 30
	asc	'\I'27'm in a Long Corridor'	; 31
	asc	'\I'27'm in a Deserted Reactor'	; 32
	asc	'\I'27'm in a Decaying Field'	; 33
	asc	'\'	; 34
	asc	'\I'27'm in a Small White Room'	; 35
	asc	'\I'27'm in a Long Corridor'	; 36
	asc	'\I'27'm at a Security Control Station'	; 37
	asc	'\I'27'm on a Forlorn Road'	; 38
	asc	'\I'27'm on a Forlorn Road'	; 39
	asc	'\I'27'm at a Security Control Station'	; 40
	asc	'\I'27'm at a Security Outpost'	; 41
	asc	'\I'27'm at the Outskirts of the City'	; 42
	asc	'\I'27'm in a Storeroom'	; 43
	asc	'\I'27'm on a Dirt Path'	; 44
	asc	'\I'27'm at a Construction Site'	; 45
	asc	'\I'27'm at a Construction Site'	; 46
	asc	'\I'27'm on a Dirt Path'	; 47
	asc	'\I'27'm in a Small Room'	; 48
	asc	'\I'27'm on a Metal Platform'	; 49
	asc	'\I'27'm in a Small Room'	; 50
	asc	'\I'27'm in a Metal Corridor'	; 51
	asc	'\I'27'm in a Metal Corridor'	; 52
	asc	'\I'27'm in a Control Center'	; 53
	asc	'\I'27'm in a Metal Corridor'	; 54
	asc	'\I'27'm in a Small Lead Room'	; 55
	asc	'\I'27'm in a Force Field'	; 56
	asc	'\I'27'm in a Hangar'	; 57
	asc	'\I'27'm in a Steel Chamber'	; 58
	asc	'\I'27'm in a Narrow Passage'	; 59
	asc	'\I'27'm at the Launch Control Station'	; 60
	asc	'\I'27'm in a Space Ship'	; 61
	asc	'\I'27'm in a Space Ship'	; 62
	asc	'\I'27'm in a Space Ship'	; 63
	asc	'\I'27'm in a Narrow Vent'	; 64
	asc	'\I'27'm in a Narrow Vent'	; 65
	asc	'\I'27'm at the Outskirts of a City'	; 66
	dfb	chrNULL
