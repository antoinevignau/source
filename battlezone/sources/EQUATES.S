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

HGR1	=	$2000
HGR2	=	$4000

LA000	=	$A000	; second page pointer
	
*-----------------------------------

nbPLAYERS	=	$8E	; byte - 0 = 1P, 1 = 2P
curLEVEL	=	$92	; byte - current level
curPLAYER	=	$B3	; byte - 0..1
joyX	=	$E3	; byte - X-joy position
joyY	=	$E4	; byte - Y-joy position
fgSOUND	=	$EA	; byte - 0 = no sound, 1 = sound
joyBTN	=	$EB	; byte - 0 = button pressed

*-----------------------------------
