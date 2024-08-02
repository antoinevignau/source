*
* Moon Patrol
*
* (c) 1982, Williams
* (c) 1983, Atari
* (s) 2024, Antoine Vignau
*

*-----------------------------------
* GAME ZERO PAGE
*-----------------------------------

ptrSCREEN	=	00	; word - pointer to the HGR screen
ptrSCREEN2	=	02	; word - pointer to the HGR screen
ptrSCREEN3	=	04	; word - pointer to the HGR screen

ptrSTRING	=	$05	; word - pointer to a character string
zp07	=	$07	; byte - for vehicle movement - not used
theACCEL	=	$10	; byte - the car acceleration
explosionINDEX =	$11	; byte - explosion sprite index
fgJUMP	=	$13	; byte - 0 = not jumping, 1 = jumping
xCNT	=	$16	; byte - X counter
fwdSHOOTX	= 	$1a	; byte - x-coord of the front shoot
fwdSHOOTY	=	$1b	; byte - y-coord of the front shoot
explosionCNT =	$1c	; byte - shoot (minus)/explosion (positive) counter
theRND	=	$20	;  adr - random value
fgSOUND	=	$35	; byte - 0 = $C030, 1 = $C020
mountX1	=	$41	; byte - x-index within mountain
mountX2	=	$42	; byte - data to determine where to
mountX3	=	$43	; byte - start drawing, that makes the move
ptrCOURSE	=	$44	; word - pointer to the course data
frameCNT	=	$49	; byte - frame counter
vehicleX	=	$57	; byte - x-coord of the vehicle
vehicleY	=	$58	; byte - y-coord of the vehicle
wheel1X	=	$5b	; byte - x-coord of wheel 1
wheel1Y	=	$5c	; byte - y-coord of wheel 1
wheel2X	=	$5d	; byte - x-coord of wheel 2
wheel2Y	=	$5e	; byte - y-coord of wheel 2
wheel3X	=	$5f	; byte - x-coord of wheel 3
wheel3Y	=	$60	; byte - y-coord of wheel 3
oldVEHICLEX	=	$59	; byte - old x-coord of the vehicle
oldVEHICLEY	=	$5a	; byte - old y-coord of the vehicle
oldWHEEL1X	=	$61	; byte - old x-coord of wheel 1
oldWHEEL1Y	=	$62	; byte - old y-coord of wheel 1
oldWHEEL2X	=	$63	; byte - old x-coord of wheel 2
oldWHEEL2Y	=	$64	; byte - old y-coord of wheel 2
oldWHEEL3X	=	$65	; byte - old x-coord of wheel 3
oldWHEEL3Y	=	$66	; byte - old y-coord of wheel 3
bigTRY	=	$6d	; byte - base location to start bouncing wheels
groundSTARTX = 	$6e	; byte - x-col where to start drawing ground (0 or 34 if moon base)
fgHIT	=	$70	; byte - 0 = player is alive, 1 = player was hit
plrPOINT	=	$78	; byte - point reached by the current player
plrSCORE	=	$7a	; adr  - score of player
plrTIME	=	$7d	; word - time of player
avgTIME	=	$7f	; word - average time
saveCOURSE	=	$83	; word - 
milestoneCNT =	$96	; byte - milestone counter
basePOINT	=	$98	; byte - start point (0 for A, 4 for E...)
plrCOURSE	=	$99	; word - player's pointer within the course
zp9C	=	$9c	; byte - for vehicle movement - not used
charX	=	$a6	; byte - 
charY	=	$a7	; byte - 
slot16	=	$d0	; byte - slot * 16
milestoneY	=	$d7	; byte - Y-coord of the milestone letter
milestoneX	=	$d8	; byte - X-bit to draw the letter
milestoneTEMPO =	$dd	; byte - 0..1..2
fgINPUT2	=	$ef	; byte - save
courseTYPE2	=	$f0	; byte - save
nbPLAYERS2	=	$f1	; byte - save
fgSPECIALBONUS = 	$f2	; byte - 0 = no special bonus, 1 = special bonus
timeCNT	=	$f3	; byte - counter for time display

*-----------------------------------
* FIRMWARE EQUATES
*-----------------------------------

KBD         EQU   $C000
KBDSTROBE   EQU   $C010
TAPEOUT     EQU   $C020
SPKR        EQU   $C030
TXTCLR      EQU   $C050
TXTSET      EQU   $C051
MIXCLR      EQU   $C052
TXTPAGE1    EQU   $C054
TXTPAGE2    EQU   $C055
HIRES       EQU   $C057
BUTN0       EQU   $C061
RESET       EQU   $FA62
PREAD       EQU   $FB1E
WAIT        EQU   $FCA8

*-----------------------------------
* SPRITES 1

sprWHEEL		=	0	; wheel
sprVEHICLE		=	1	; car
sprVERTICALSHOOT	=	2	; vertical shoot
sprHORIZONTALSHOOT	=	3	; horizontal shoot
sprHEXPLOSION1	=	4	; horizontal explosion animation step #1
sprHEXPLOSION2	=	5	; horizontal explosion #2
sprHEXPLOSION3	=	6	; horizontal explosion #3
sprHEXPLOSION4	=	7	; horizontal explosion #4
sprENEMY11		=	8	; enemy 1 #1
sprENEMY12		=	9	; enemy 1 #2
sprENEMY13		=	10	; enemy 1 #3	A
sprENEMY14		=	11	; enemy 1 #4	B
sprENEMY2		=	12	; enemy 2		C
sprENEMY3		=	13	; enemy 3		D
sprSMALLROCK	=	14	; small rock	E
sprBIGROCK		=	15	; big rock		F
sprTANK		=	16	; tank		10
sprMINE1		=	17	; mine #1		11
sprMINE2		=	18	; mine #2		12
sprSMALLHOLE	=	19	; small hole	13
sprMEDIUMHOLE	=	20	; medium hole (enemy 1)	14
sprBIGHOLE		=	21	; big hole		15
sprMUSHROOM1	=	22	; mushroom #1	16
sprMUSHROOM2	=	23	; mushroom #2	17
sprENEMYVEHICLE	=	24	; enemy vehicle	18

*-----------------------------------
* SPRITES 2 (EXPLOSIONS)

sprENEMYEXPLOSION1	=	0	; 0
sprENEMYEXPLOSION2	=	1	; 1
sprBOMBEXPLOSION1	=	2	; 2
sprBOMBEXPLOSION2	=	3	; 3
sprBOMBEXPLOSION3	=	4	; 4
sprBOMBEXPLOSION4	=	5	; 5
sprCAREXPLOSION1	=	6	; 6
sprCAREXPLOSION2	=	7	; 7
sprCAREXPLOSION3	=	8	; 8
sprENEMY3BOMB	=	9	; 9
sprENEMY1BOMB	=	10	; A
sprHORIZONTALBAR	=	11	; B
sprRAINBOWEXPLOSION1	=	12	; C
sprRAINBOWEXPLOSION2	=	13	; D
sprSMALLEXPLOSION	=	14	; E
sprSCORE100 	=	15	; F
sprSCORE500 	=	16	; 10
sprSCORE800 	=	17	; 11
sprSCORE1000	=	18	; 12

*-----------------------------------
* GAME VARIABLES
*-----------------------------------

NB_LIVES	=	4	; which are 3+1 as the programmer uses BNE and not BPL for the end

P1_courseTYPE =	$200	; byte - beginner or champion course for P1
P2_courseTYPE =	$201	; byte - beginner or champion course for P2
P1_point	=	$202	; byte - point reached by P1
P2_point	=	$203	; byte - point reached by P2
P1_score	=	$204	; adr  - $204 and $206 and $208
P2_score	=	$205	; adr  - $205 and $207 and $209
coursePTR1	=	$20a	; word - $20a and $20c
coursePTR2	=	$20b	; word - $20b and $20d
P1_basePOINT =	$20e	; byte - current base point of P1
P2_basePOINT =	$20f	; byte - current base point of P2
P1_plrCOURSE =	$210	; word - $210 and $212
P2_plrCOURSE =	$211	; word - $211 and $213
P1_nbLIVES	=	$214	; byte
P2_nbLIVES	=	$215	; byte
courseTYPE	=	$216	; byte - 0 = beginner, 1 = champion
nbPLAYERS	=	$217	; byte - 0 = 1 player, 1 = 2 players
nbLIVES	=	$218	; byte - nb lives + 1
fgINPUT	=	$219	; byte - 0 = keyboard, 1 = joystick
theBONUS	=	$21a	; adr  - $21a and $21b and $21c - bonus to add to score
charWAIT	=	$21d	; byte - time to wait between drawing two chars
curRANGE	=	$21e	; byte - 0/2/4/6/8 mean A/E/J/O/T
fgBONUS	=	$21f	; byte - 0 = bonus, 1 = no bonus
fgBESTTIME	=	$220	; byte - 0 = no best time, 1 = best time
PATTERNC	=	$221	; byte - used for the logo
fgDEMO	=	$222	; byte - 0 = game mode, 1 = demo mode (replay?)
demoINDEX	=	$223	; byte - index for demo data
demoCNT	=	$224	; byte - demo frame counter * $224
fgDEMO2	=	$225	; byte - 0 = game mode, 1 = demo mode
coursePTR3	=	$226	; word - pointer to course data
coursePTR4	=	$228	; word - pointer to course data 
curPLAYER	=	$22a	; byte - 0 = player 1, 1 = player 2
P1_time	=	$22b	; word - and $22d
P2_time	=	$22c	; word - and $22e
highSCORE	=	$22f	; adr  - the high score
timePLAYER	=	$232	; word - player time on course range (A to E, E to J...)
courseTYPE_unused =	$234	; byte - copy of courseTYPE (unused)
fgBLINK	=	$235	; byte -0/1 = blinks 1UP/2UP

L0300	=	$300

