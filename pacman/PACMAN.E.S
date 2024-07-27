*
* Pac-Man
*
* (c) 1983, Atari
* (s) 2024, Antoine Vignau
*

sprEMPTY	=	0	; three tile possibilities
sprDOT	=	1
sprENERGY	=	2

gINKY	=	1
gPINKY	=	2
gBLINKY	=	3
gCLYDE	=	4

dirDOWN	=	0
dirUP	=	1
dirRIGHT	=	2
dirLEFT	=	3

score1600	=	0
score200	=	2
score400	=	4
score800	=	8

nbDOTS	=	248	; 244 normal dots & 4 energizer dots

L0300	=	$0300	; buffer area to save scores
GHOST1MOVE	=	$0800	; buffer area for ghosts moves
GHOST2MOVE	=	GHOST1MOVE+256
GHOST3MOVE	=	GHOST2MOVE+256
GHOST4MOVE	=	GHOST3MOVE+256

L0800	=	$0800	; $0800..$0BFF
L0C00	=	$0C00	; board buffers per player ($380 bytes)
L1000	=	$1000	; P2
L1380	=	$1380	; P3
L1700	=	$1700	; P4
L1A80	=	$1A80	; P5

TEXT	=	$0400
TEXT2	=	$0800
HGR	=	$2000
HGR2	=	$4000
HGR3	=	$6000	; does not exist but marks the area past HGR2

CH	=	$24	; firmware X-pos
CV	=	$25	; firmware Y-pos

highSCORE	=	$00	; (3 bytes) high score
zpXBIT	=	$03	; X from X-coord to X-bit offset
zpXCOL	=	$04	; Y from X-coord to X-col in screen
deciSCORE	=	$05	; (3 bytes) the decimal score
zpTEMP1	=	$08
zpTEMP2	=	$09
zpTEMP3	=	$0a
zpTEMP4	=	$0b
zpX1	=	$0c	; (word) start X
zpX2	=	$0e	; (word) end X
zpY1	=	$10	; (byte) start Y
zpY2	=	$11	; (byte) end Y
zpHGR	=	$12	; (word) pointer to HGR world
zpPTR1	=	$14	; (word) 1st pointer
zpPTR2	=	$16	; (word) 2nd pointer
ptrMOVE	=	zpPTR2      ; (word) pointer to the list of authorized moves
sprHEIGHT	=	$18	; (byte) sprite height in lines
sprWIDTH	=	$1a	; (byte) sprite width in bytes
zpPTR3	=	$1b	; (word)
fgCOLOR	=	$1d	; 0: b&w, 1: color
hgrBIT7	=	$1e	; (byte) defines which palette to use ($00 or $80)
zp1F	=	$1f
* $20 to $4F are not used
curPLAYER	=	$50	; (byte) current player index
nbPLAYERS	=	$51	; (byte) number of players (1..5)
curSCORE	=	$52	; 0 (3 bytes) score
theRANK	=	$55	; 3 (byte) rank number (ie. the level)
nbDOTS	=	$56	; 4 (byte) number of dots on the board (248 by default)
fruitFREQ	=	$57	; 5 (byte) appearance frequency of a fruits
nbLIVES	=	$58	; 6 (byte) number of lives (bit 7 is set)
frameCNT	=	$59	; 7 (byte) frame counter
fruitCNT	=	$5a	; (word) fruit counter (how long it is displayed)
ptrFRUIT	=	$5c	; (word) pointer to the fruit sprite
dotTEMPO	=	$5e	; (byte) tempo for energizer dot blinking
fgDOTS	=	$5f	; (byte) 0: show dots, 1: hide dots
*
* Within board, X/Y coords of Pacman are:
* UL 41/0B
* UR D7/0B
* LL 41/B3
* LR D7/B3
*
pacmanDATA	=	$60	; (struct) structure of  8 bytes
pacmanX	=	$60	; (byte) Pacman X
pacmanY	=	$61	; (byte) Pacman Y
pacmanDIR	=	$62	; (byte) Pacman direction (see above)
theDIR	=	$63	; (byte) next Pacman direction (given by input device)
pacmanBOARD	=	$64	; (byte) current index in boardMOVES where Pacman is
pacmanNEXTBOARD =	$65	; (byte) next index in the same table, $FF if move is invalid
pacmanSTEP	=	$66	; (byte) Pacman sprite index (that makes the animation step)
* $67 is no more used, see $8B7E
bonusINDEX	=	$68	; (byte) 2/4/8/16 for bonus 200/400/800/1600
pacmanTUNNEL =	$69	; (byte) 0: Pacman not in tunnel, 1: Pacman in tunnel
boardY	=	$6a	; (byte) y-coord in board
boardX	=	$6b	; (byte) x-coord in board
*
ghostDATA	=	$70	; (struct) structure of 8/20 bytes for the current ghost
ghostX	=	$70	; 0 (byte) ghost X
ghostY	=	$71	; 1 (byte) ghost Y
ghostDIR	=	$72	; 2
ghostBOARD	=	$73	; 3 (byte) current index in boardMOVES where the ghost is
ghostNEXTBOARD = 	$74	; 4 (byte) next index in the same table, $FF if move is invalid
ghostMOVE	=	$75	; 5 (word) pointer to the ghost move board of 256 bytes
ghostMOVEINDEX = 	$77	; 7 (byte) index within that board
ghostFRIGHTENED =	$78	; (byte) 0: ghost is not frightened, 1: ghost is frightened
ghostISDEAD	=	$79	; (byte) 0: ghost is alive, dead otherwise
ghostTEMPO	=	80	; (byte) tempo to refresh a ghost (aka ghost speed)
* Each ghost data is: 84 / 98 / AC / C0
ghost1DATA	=	$84
ghost1X	=	ghost1DATA
ghost1Y	=	ghost1DATA+1
ghost1DIR	=	ghost1DATA+2
ghost1CASE	=	ghost1DATA+3
ghost1NEXTCASE = 	ghost1DATA+4
ghost1FRIGHTENED = 	ghost1DATA+8
ghost1DEAD	=	ghost1DATA+9
*
ghost2DATA	=	$98
ghost2X	=	ghost2DATA
ghost2Y	=	ghost2DATA+1
ghost2FRIGHTENED =	ghost2DATA+8
ghost2DEAD	=	ghost2DATA+9
*
ghost3DATA	=	$ac
ghost3X	=	ghost3DATA
ghost3Y	=	ghost3DATA+1
ghost3FRIGHTENED =	ghost3DATA+8
ghost3DEAD	=	ghost3DATA+9
*
ghost4DATA	=	$c0
ghost4X	=	ghost4DATA
ghost4Y	=	ghost4DATA+1
ghost4FRIGHTENED =	ghost4DATA+8
ghost4DEAD	=	ghost4DATA+9
*
ghostINDEX	=	$e0	; (byte) 1: Inky, 2: Pinky, 3: Blinky, 4: Clyde
frFRUIT	=	$e7	; (byte) 0: fruit counter not activated, 1: fruit counter activated
fgDEMO	=	$e8	; (byte) 0: game, 1: demo
saveVAR	=	$f1	; (byte) save variable
* $F2 is not used
zpSPEED	=	f3	; (byte) ghosts speed?
fgMUSIC	=	$f4	; (byte) 0: music never played, 1: intro music played
theDEVICE	=	$f5	; (byte) 0: joypad, 1: joystick

