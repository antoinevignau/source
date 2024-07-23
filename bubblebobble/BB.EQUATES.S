*
* Bubble Bobble
*
* (c) 1988, Taito
* (s) 2024, Antoine Vignau
*

*-----------------------------------
* GAME EQUATES
*-----------------------------------

HPAG	=	$326	; current HGR page

tblMUSIC	=	$0800	; $800 for music 1, $802 for music 2
HGR1	=	$2000
HGR2	=	$4000

*-----------------------------------
* FIRMWARE EQUATES
*-----------------------------------

KBD	=	$C000
SETSTDZP	=	$C008
KBDSTROBE	=	$C010
SPKR	=	$C030
CYAREG	=	$C036
TXTCLR	=	$C050
TXTSET	=	$C051
MIXCLR	=	$C052
TXTPAGE1	=	$C054
HIRES	=	$C057
BUTN0	=	$C061
BUTN1	=	$C062
LCBANK2	=	$C083
RDROM1	=	$C08A
LCBANK1	=	$C08B

PREAD	=	$FB1E

*-----------------------------------
* ZERO PAGE
*-----------------------------------

fgSOUND	=	$10	; 0 = play music, 1 = no music
curPLAYER	=	$d3	; 0 = player 1, 1 = player 2
P1_LEVEL	=	$da
P2_LEVEL	=	$db
theINDEX	=	$e9	; an index variable
fgPAGE	=	$ec	; 0 = PAGE1, 1 = PAGE2
theMOVE	=	$f2	; 1 = left, 0 = middle, 2 = right
nbPLAYERS	=	$f6	; 1 = 1 player, 2 = 2 players
