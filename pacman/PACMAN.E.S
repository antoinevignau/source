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

nbDOTS	=	248	; 244 normal dots & 4 energizer dots

L0300	=	$0300	; buffer area to save scores

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

CH	=	$24	; firmware X-pos
CV	=	$25	; firmware Y-pos

zpHISCORE	=	$00	; (3 bytes) high score
zpXBIT	=	$03	; X from X-coord to X-bit offset
zpXCOL	=	$04	; Y from X-coord to X-col in screen
zpDECSCORE	=	$05	; (3 bytes) the decimal score
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
zpSPRHEIGHT	=	$18	; (byte) sprite height in lines
zpSPRWIDTH	=	$1a	; (byte) sprite width in bytes
zpPTR3	=	$1b	; (word)
zpMONITOR	=	$1d	; 0: b&w, 1: color
hgrBIT7	=	$1e	; (byte) defines which palette to use ($00 or $80)
zp1F	=	$1f
* $20 to $4F are not used
zpCURPLAYER	=	$50	; (byte) current player index
zpNBPLAYERS	=	$51	; (byte) number of players (1..5)
curSCORE	=	$52	; (3 bytes) score
zpRANK	=	$55	; (byte) rank number (ie. the level)
zpNBDOTS	=	$56	; (byte) number of dots on the board (248 by default)
fruitFREQ	=	$57	; (byte) appearance frequency of a fruits
zpNBLIVES	=	$58	; (byte) number of lives (bit 7 is set)
frameCNT	=	$59	; (byte) frame counter
zpPTRFRUIT	=	$5c	; (word) pointer to the fruit sprite
zpDOTTEMPO	=	$5e	; (byte) tempo for energizer dot blinking
zpDOTFLAG	=	$5f	; (byte) 0: show dots, 1: hide dots
pacmanX	=	$60	; (byte) Pacman X
pacmanY	=	$61	; (byte) Pacman Y
boardY	=	$6a	; (byte) y-coord in board
boardX	=	$6b	; (byte) x-coord in board
enemyX	=	$70	; (byte) enemy X
enemyY	=	$71	; (byte) enemy Y
ghostINDEX	=	$e0	; (byte) 1: Inky, 2: Pinky, 3: Blinky, 4: Clyde
fgDEMO	=	$e8	; (byte) 0: game, 1: demo
zpSPEED	=	f3	; (byte) ghosts speed
fgMUSIC	=	$f4	; (byte) 0: music never played, 1: intro music played
theDEVICE	=	$f5	; (byte) 0: joypad, 1: joystick

