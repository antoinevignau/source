
* TFBD generated equates
*    (c) PHC 1992,93


SOFTEV      EQU   $03F2
PWREDUP     EQU   $03F4
KBD         EQU   $C000
KBDSTROBE   EQU   $C010
SPKR        EQU   $C030
TXTCLR      EQU   $C050
MIXCLR      EQU   $C052
HIRES       EQU   $C057
BUTN0       EQU   $C061
BUTN1       EQU   $C062
PTRIG       EQU   $C070

*-----------------------

TEXT1	=	$400
TEXT2	=	$800
HGR1	=	$2000
HGR2	=	$4000

*-----------------------

fgSOUND	=	$10	; byte - 0 = sound / -1 = no sound
theDEVICE	=	$42	; byte - 0 = joystick / 1 = keyboard
nbPLAYERS	=	$45	; byte - 1 or 2
