*
* Lode Runner
* (c) 1983, Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

* 0 vide
* 1 mur
* 2 mur dur
* 3 Žchelle visible
* 4 liane
* 5 trappe
* 6 Žchelle invisible
* 7 trŽsor
* 8 ennemi
* 9 hŽros

* Sprite quand      heros ennemi tombe dans un trou :
* - venant de gauche : 20 53 (35h)
* - venant de droite : 19 54 (36h)
* 
*-----------------------------------
* EQUATES
*-----------------------------------

refSPEED	=	18

lvlWIDTH	=	28	; $1c
lvlHEIGHT	=	16	; $10

sprWIDTH	=	10
sprHEIGHT	=	11
sprBYTES	=	5

nbLIVES	=	5
maxLEVEL	=	150
maxHEIGHT	=	192	; lines

hgrHEIGHT	=	176
hgrWIDTH	=	160	; 40
hgrTOMOVE	=	28160	; 176*160

modeEDIT	=	0	; to decode level
modeGAME	=	1

sprEMPTY	=	0
sprWALL	=	1
sprWALLI	=	2	; mur indestructible
sprLADDER	=	3
sprBAR	=	4
sprTRAP	=	5
sprLADDERI	=	6
sprCHEST	=	7
sprFOE	=	8
sprHERO	=	9
sprCURSOR	=	10
spr0	=	$3b	; until $44
sprA	=	$45	; until $5e >.()/-< (latest sprite is $65)

minJOY	=	$12	; joystick min/center/max values
ctrJOY	=	$2e
maxJOY	=	$3b

*--- The big zero page usage

boardX	=	$00
boardY	=	$01
heroSTEPX	=	$02
heroSTEPY	=	$03
heroINDEX	=	$04
fgLEFTRIGHT	=	$05
ptrBOARD	=	$06	; $06..$07: pointer to board
ptrBBACK	=	$08	; $08..$09: pointer to back board
ptrDATA	=	$0a	; $0a..$0b: pointer to data (HGR or other)

*ptrHGR1	=	$0c	; $0c..$0d
*ptrHGR2	=	$0e	; $0e..$0f

ptrSTRSND	=	$10	; $10..$11: pointer to some table (string, sound)
foeX	=	$12
foeY	=	$13
foeINDEX	=	$14
foeLEFTRIGHT =	$15
foeACTION	=	$16
foeSTEPX	=	$17	; coordinate
foeSTEPY	=	$18	; coordinate
idxFOE	=	$19	; current foe index
fgODDEVEN	=	$1a
theYSCREEN	=	$1b
theXSCREEN	=	$1c
nbLINES	=	$1d
theA	=	$1e
hgrPAGE	=	$1f

ptrHGR1	=	$24	; **new** long
ptrHGR2	=	$28	; **new** long
ptrSPR	=	$2c	; **new** word
nbLINES2	=	$2e	; **new** word

*CH	=	$24	; **
*CV	=	$25	; **
*CSWL	=	$36	; **
*CSWH	=	$37	; **
*KSWL	=	$38	; **
*KSWH	=	$39	; **

theMASK1	=	$50
theMASK2	=	$51
fgCOLLISION	=	$52
tempX6	=	$53
idxNOTE	=	$54
tempX4	=	$55
tempY1	=	$56
tempX5	=	$57
tempX3	=	$5a
tempX2	=	$5b
temp1	=	$5c
tempX	=	$5d
tempY	=	$5e
theJOYX	=	$65
theJOYY	=	$66
sprTABLE	=	$71
theX	=	$85
theY	=	$86
activePAGE	=	$87
tempINDEX	=	$88
theCENTAINE	=	$89
theDIZAINE	=	$8a	; 8a
theUNITE	=	$8b	; 8b
theSPEED	=	$8c	; 8c
nbFOE	=	$8d	; 8d
theSCORE	=	$8e	; 8e..8f.90..91
idxLVLDISK	=	$92	; index in level buffer from disk
nbCHEST	=	$93	; 93
fgCHEST	=	$94	; 94 1: not a chest, 0: a chest
fgINPUT	=	$95	; "J"oystick, "K"eyboard
intLEVEL	=	$96	; 96 theLEVEL-1
theMEN	=	$98	; 5 bonshommes pour dŽmarrer
fgSOUND	=	$99	; 0: no sound, -1: sound on
fgPLAY	=	$9a	; 1: alive, 0: dead
fgHEROFELL	=	$9b	; 0: hero fell into a hole, $20: tempo for game speed
fgHOLE	=	$9c	; -1: left hole, 0: none, 1: right hole
fgGOODSTART	=	$9d	; 1: start from level 0 / allow score update, 0: not true 
theKEY1	=	$9e
theKEY2	=	$9f
idxDIG	=	$a0	; dig index in sprite list
counter	=	$a1	; a simple counter
fgLVLMODE	=	$a2	; 0: edit, <>0: game
idxLADDERI	=	$a3
fgSPEED	=	$a4	; speed of the game
fgCIRCLE	=	$a5	; 0: show level, 1: hide level
theLEVEL	=	$a6	; current level
fgDEMO	=	$a7	; 1: in demo mode
ptrDEMO	=	$a8	; $a8..$a9 - pointer to demo data
demoKEY	=	$aa	; the demo key actions
demoREPEAT	=	$ab	; the demo repeat factor
fgKEYBTN0	=	$ac	; 1: no key/btn0 pressed, 0: key/btn0 pressed
fgCHANGE	=	$ad	; 1: no change, 0: change
sprDATA	=	$df	; $df..$ff

Debut	=	$e0	; the good old DP variables
Arrivee	=	Debut+4

chrLA	=	$88	; left arrow
chrDA	=	$8a	; down arrow
chrUA	=	$8b	; up arrow
chrRET	=	$8d	; 
chrCTRLQ	=	$91	; CTRL-Q: quit
chrRA	=	$95	; right arrow
chrESC	=	$9b	; 
chrSPC	=	" "	; 
chrZERO	=	"0"	; 0
chrONE	=	"1"	; 1
chrTWO	=	"2"	; 2
chrTHREE	=	"3"	; 3
chrNINE	=	"9"	; 
chrDOT	=	"."	; 
chrA	=	"A"	; first character
chrI	=	"I"	; move up
chrJ	=	"J"	; move left
chrK	=	"K"	; move down
chrL	=	"L"	; move right
chrN	=	"N"	; NO
chrO	=	"O"	; dig right
chrP	=	"P"	; 
chrU	=	"U"	; dig left
chrY	=	"Y"	; YES
chrZ	=	"Z"	; last character

*-----------------------------------
* SOFTSWITCHES
*-----------------------------------

KBD	=	$e0c000
KBDSTROBE	=	$e0c010
SPKR	=	$e0c030
BUTN0	=	$e0c061
BUTN1	=	$e0c062
PADDL0	=	$e0c064
PADDL1	=	$e0c065
PTRIG	=	$e0c070

*-----------------------------------
* PAGES GRAPHIQUES
*-----------------------------------

oldHGR1	=	$2000
oldHGR2	=	$4000
