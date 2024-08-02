*
* Battlezone
*
* (c) 1983, Atari
* (d) 2024, Antoine Vignau
*

*-----------------------------------

SOFTEV      =	$03F2
KBD         =	$C000
CLR80VID    =	$C00C
KBDSTROBE   =	$C010
TAPEOUT     =	$C020
SPKR        =	$C030
TXTCLR      =	$C050
TXTSET      =	$C051
MIXCLR      =	$C052
MIXSET      =	$C053
TXTPAGE1    =	$C054
LORES       =	$C056
HIRES       =	$C057
BUTN0       =	$C061
PADDL0      =	$C064
PADDL1      =	$C065
PTRIG       =	$C070
SETPWRC     =	$FB6F
BELL1       =	$FBDD
WAIT        =	$FCA8

*-----------------------------------

TEXT1	=	$0400
HGR1	=	$2000
HGR2	=	$4000

LA000	=	$A000	; second page pointer
	
*-----------------------------------

ptrSTRING	=	$88	; word - pointer to a C-string
ptrSTRINGS	=	$8A	; word - pointer to list of strings
charX	=	$8C	; byte - x-coord of 1st character to draw
charY	=	$8D	; byte - y-coord of 2nd character to draw
charCOLOR	=	$94	; byte - color of character
nbPLAYERS	=	$8E	; byte - 0 = 1P, 1 = 2P
curLEVEL	=	$92	; byte - current level
fgOFFLIMIT	=	$93	; byte - 0 = draw if off limits, 1 = do not draw if off limits
curPLAYER	=	$B3	; byte - 0..1
X1	=	$B7	; byte - X1-coord for line drawing
Y1	=	$B8	; byte - Y1-coord for line drawing
X2	=	$B9	; byte - X2-coord for line drawing
Y2	=	$BA	; byte - Y2-coord for line drawing
deltaX	=	$BB	; byte - Bresenham delta X
deltaY	=	$BC	; byte - Bresenham delta Y
errVALUE	=	$BD	; byte - Bresenham error value (either X or Y)
errX	=	$BE	; byte - Bresenham error X
errY	=	$BF	; byte - Bresenham error Y
fgCLIPPING	=	$DE	; byte - 0 = no clipping needed, -1 = clipping needed
joyX	=	$E3	; byte - X-joy position
joyY	=	$E4	; byte - Y-joy position
fgSOUND	=	$EA	; byte - 0 = no sound, 1 = sound
joyBTN	=	$EB	; byte - 0 = button pressed

*-----------------------------------
