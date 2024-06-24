*
* Pac-Man
*
* (c) 1983, Atari
* (s) 2024, Antoine Vignau
*

sprEMPTY	=	0	; three tile possibilities
sprDOT	=	1
sprENERGY	=	2

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

zpXBIT	=	$03	; X from X-coord to X-bit offset
zpXCOL	=	$04	; Y from X-coord to X-col in screen
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
zpCURPLAYER	=	$50	; current player index
zpNBPLAYERS	=	$51	; number of players (1..5)
ZPSCORE	=	$52	; (3 bytes) score
zpRANK	=	$55	; rank number (ie. the level)
zpNBLIVES	=	$58	; number of lives (bit 7 is set)
zpDOTTEMPO	=	$5e	; tempo for energizer dot blinking
zpDOTFLAG	=	$5f	; 0: show dots, 1: hide dots
zpDEMO	=	$e8	; 0: game, 1: demo
zpFGMUSIC	=	$f4	; 0: music never played, 1: intro music played
zpDEVICE	=	$f5	; 0: joypad, 1: joystick

