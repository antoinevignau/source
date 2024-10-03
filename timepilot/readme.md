Sounds and their meanings - Taken from the Windows version.

1000	"bosslx",            // Loops.  Boss (LVL0) active (engine)
	"bossl0",            // "
	"bossl1",            // "
	"bossl2",            // "
	"bossl3",            // "
	"bossl4",            // " (But missing since I am not good enough! ;)
2D00	"enemy_explode",     // In Game, one shot
1000	"enemy_shoot",       // In Game, one shot
2F00	"pickup",            // In Game, one shot.  Collect a parachute
0B00*	"player_shoot",      // In Game, one shot
1000*	"rocket_fly",        // Loops when rocket on screen - LVL2+ (Starts at helicopter level)
0F00*	"rocket_launch",     // In Game, one shot
2C00	"wapon_explode",     // In Game, one shot.  Player hit a Bomb, Boomerang or Rocket.
1700*	"wave_start",        // In Game, one shot.  A wave of enemies will enter

9100	"big_explosion",     // In Game, one shot - Player, Bomber or Boss dies
2E00	"bomb",              // In Game, one shot
1800	"coindrop",          // Just for nostalgia.  I play it once only when the game is launched
2C00	"extra_life",        // In Game, one shot
13300	"game_start",        // Once as the game start, no other audio active
13B00	"highscore",         // Loops while user enters initials
6000	"next_level",        // After Time Warp.  Start of LVL1+.  Can use big_explosion
F100	"timewarp",          // Killed BOSS and alive, so warp.  Only sound, then stage swap

DOCRAM memory map
00+01	0000	WAPON EXPLODE
	1000	WAPON EXPLODE
	2000	WAPON EXPLODE
------------2C00
02+03	3000	BOSS LEVEL X
04+05	4000	ENEMY EXPLODE
	5000	ENEMY EXPLODE
	6000	ENEMY EXPLODE
------------6D00
06+07	7000	ENEMY SHOOT
08+09	8000	PICKUP
	9000	PICKUP
	A000	PICKUP
------------AF00
10+11	B000	PLAYER SHOOT
------------BC00
12+13	C000	WAVE START
	D000	WAVE START
------------D800
14+15	E000	ROCKET FLY
16+17	F000	ROCKET LAUNCH
18+21	2C00	BIG EXPLOSION / NEXT_LEVEL (can start after other fx play)
22+25	2E00	EXTRA LIFE / COINDROP / GAME START / HIGHSCORE (exclusive)
26+29	6E00        BOMB / TIMEWARP (can start after other fx play)

AUDIO_BIG_EXPLOSION    	=	0	; A ptrBIGEXPLO
AUDIO_BOMB             	=	1	; B ptrBOMB
AUDIO_BOOOMERANG       	=	2	; C ptrBOOMERANG
AUDIO_BOSSL0           	=	3	; D 
AUDIO_BOSSL1           	=	4	; E 
AUDIO_BOSSL2           	=	5	; F 
AUDIO_BOSSL3           	=	6	; G 
AUDIO_BOSSL4           	=	7	; H 
AUDIO_COINDROP         	=	8	; I ptrCOINDROP
AUDIO_ENEMY_EXPLODE    	=	9	; J 
AUDIO_ENEMY_SHOOT      	=	10	; K 
AUDIO_ENEMY_SHOOT_SPACE	=	11	; L 
AUDIO_EXTRA_LIFE       	=	12	; M ptrEXTRALIFE
AUDIO_GAME_START       	=	13	; N ptrGAMESTART
AUDIO_HIGHSCORE        	=	14	; O ptrHIGHSCORE
AUDIO_NEXT_LEVEL       	=	15	; P ptrNEXTLEVEL
AUDIO_PICKUP           	=	16	; Q 
AUDIO_PLAYER_SHOOT     	=	17	; R 
AUDIO_ROCKET_FLY       	=	18	; S 
AUDIO_ROCKET_LAUNCH    	=	19	; T 
AUDIO_STAGE_CLEAR      	=	20	; U 
AUDIO_TIMEWARP         	=	21	; V ptrTIMEWARP
AUDIO_WAPON_EXPLODE    	=	22	; W 
AUDIO_WAVE_START       	=	23	; X 

pBIGEXPLO	strl	'1/snd/bigexplo.snd'
pBOMB	strl	'1/snd/bomb.snd'
pBOSS	strl	'1/snd/boss0.snd'	; +12 for the level
pCOINDROP	strl	'1/snd/coindrop.snd'
pEXTRALIFE	strl	'1/snd/extralife.snd'
pGAMESTART	strl	'1/snd/gamestart.snd'
pHIGHSCORE	strl	'1/snd/highscore.snd'
pNEXTLEVEL	strl	'1/snd/nextlevel.snd'
pTIMEWARP	strl	'1/snd/timewarp.snd'

DOCRAM memory map with sound index

   0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F
0 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22
1 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22
2 22 22 22 22 22 22 22 22 22 22 22 22 
3 03 03 03 03 03 03 03 03 03 03 03 03 03 03 03 03 (to 07)
4 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09
5 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09 09
6 09 09 09 09 09 09 09 09 09 09 09 09 09 
7 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 (to 11)
8 17 17 17 17 17 17 17 17 17 17 17 17 17 17 17 17
9 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18 18
A 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19 19
B 23 23 23 23 23 23 23 23 23 23 23 23 23 23 23 23
C 23 23 23 23 23 23 23    00+00 01+12 21+21 08+13+14
D 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16
E 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16
F 16 16 16 16 16 16 16 16 16 16 16 16 16 16 16
