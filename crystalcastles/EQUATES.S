*
* Crystal Castles
* by John Stouffer
*
* (c) 1983, Atari
* (s) 2024, Brutal Deluxe Software
*

            MX    %11
	LST   OFF

*-----------------------------------
* EQUATES
*-----------------------------------

SOFTEV      EQU   $03F2
PWREDUP     EQU   $03F4
KBD         EQU   $C000
KBDSTROBE   EQU   $C010
SPKR        EQU   $C030
TXTCLR      EQU   $C050
TXTSET      EQU   $C051
MIXCLR      EQU   $C052
TXTPAGE1    EQU   $C054
HIRES       EQU   $C057
BUTN0       EQU   $C061
BUTN1       EQU   $C062
PADDL0      EQU   $C064
PADDL1      EQU   $C065
PTRIG       EQU   $C070
BASCALC     EQU   $FBC1
HOME        EQU   $FC58
WAIT        EQU   $FCA8

L0800       =	$0800
L0801	=	L0800+$01
L0808	=	L0800+$08
L0809	=	L0800+$09
L0810	=	L0800+$10
L0811	=	L0800+$11
L0820	=	L0800+$20
L0830	=	L0800+$30
L0838	=	L0800+$38
L0840	=	L0800+$40
L0848	=	L0800+$48
L0849	=	L0800+$49
L0850	=	L0800+$50
L0868	=	L0800+$68
L0869	=	L0800+$69
L0870	=	L0800+$70
L0871	=	L0800+$71
L0878	=	L0800+$78
L0880	=	L0800+$80
L08A0	=	L0800+$A0

L6200	=	$6200
L6300	=	L6200+$100
L6400	=	L6300+$100
L6500	=	L6400+$100
L6600	=	L6500+$100
L6700	=	L6600+$100

L9D00	=	$9D00
L9E00	=	$9E00

LA000	=	$A000
LA040	=	LA000+$40
LA080	=	LA040+$40
LA0C0	=	LA080+$40
LA100	=	LA0C0+$40
LA140	=	LA100+$40
LA180	=	LA140+$40
LA1C0	=	LA180+$40
LA200	=	LA1C0+$40
LA240	=	LA200+$40
LA280	=	LA240+$40
LA2C0	=	LA280+$40
LA300	=	LA2C0+$40
LA340	=	LA300+$40
LA380	=	LA340+$40
LA3C0	=	LA380+$40

NBLIVES	=	2

*-----------------------------------
* ZERO PAGE
*-----------------------------------

nbPLAYERS	=	$19	; byte - 0: one player, 1: two players
curPLAYER	=	$1a	; byte - 
theLASTGEM	=	$46	; byte - 0: player had the last gem, <>0: enemies had it
p1SCORE	=	$4a	;  adr - 
p2SCORE	=	$4d	;  adr - 
p1LIVES	=	$54	; byte - 
p2LIVES	=	$55	; byte - 
joyX	=	$60	; byte - 
joyY	=	$61	; byte - 
theLEVEL	=	$79	; byte - 
myVAR_DC	=	$dc	; byte - 
thePAGE	=	$ec	; byte - 
hgrPAGE	=	$ed	; byte - #$20 or #$40 for page switching

*--- End of equates
