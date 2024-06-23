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

L0C00	=	$0C00	; board buffers per player ($380 bytes)
L1000	=	$1000
L1380	=	$1380
L1700	=	$1700
L1A80	=	$1A80

TEXT	=	$0400
TEXT2	=	$0800
HGR	=	$2000
HGR2	=	$4000

zpXBIT	=	$03	; X from X-coord to X-bit offset
zpXCOL	=	$04	; Y from X-coord to X-col in screen
zpX1	=	$0c	; start X for draw line
zpREL	=	$0d	; 0: fixed address, 1: relative
zpX2	=	$0e	; end X for draw line
zpY1	=	$10	; start Y
zpY2	=	$11	; end Y
zpHGR	=	$12
zpBYLINES	=	$18	; number of lines to draw
zpBYWIDTH	=	$1a	; width of a sprite per line
zpMONITOR	=	$1d	; 0: b&w, 1: color
zpCURPLAYER	=	$50	; current player index
zpNBPLAYERS	=	$51	; number of players (1..5)

zpLEVEL	=	$55	; level number
zpDEMO	=	$e8
zpFGMUSIC	=	$f4	; 0: music never played, 1: intro music played
zpDEVICE	=	$f5	; 0: joypad, 1: joystick

