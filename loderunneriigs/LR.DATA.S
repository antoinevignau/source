*
* Lode Runner
* (c) 1983, Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

	mx	%11
	lst	off

* Sprites : 102

* sprEMPTY	=	0
* sprWALL	=	1
* sprWALLI	=	2	; mur indestructible
* sprLADDER	=	3
* sprBAR	=	4
* sprTRAP	=	5
* sprLADDERI	=	6
* sprCHEST	=	7
* sprFOE	=	8
* sprHERO	=	9

* 3B: 0
* 45: A
* 5E: Z

*---------------------------------------
* HGR	280 x 192
* Board	 28 x  16
* Sprite	 10 x  11
* --------------------
*           280 x 171
	
	ds	\
	
*--- Decoded level (28 x 16)

L0800	DS	lvlWIDTH	; le plateau avec les personnages
L081C	DS	lvlWIDTH
L0838	DS	lvlWIDTH
L0854	DS	lvlWIDTH
L0870	DS	lvlWIDTH
L088C	DS	lvlWIDTH
L08A8	DS	lvlWIDTH
L08C4	DS	lvlWIDTH
L08E0	DS	lvlWIDTH
L08FC	DS	lvlWIDTH
L0918	DS	lvlWIDTH
L0934	DS	lvlWIDTH
L0950	DS	lvlWIDTH
L096C	DS	lvlWIDTH
L0988	DS	lvlWIDTH
L09A4	DS	lvlWIDTH
	ds	\
	
L0A00	DS	lvlWIDTH	; le plateau sans les personnages
L0A1C	DS	lvlWIDTH
L0A38	DS	lvlWIDTH
L0A54	DS	lvlWIDTH
L0A70	DS	lvlWIDTH
L0A8C	DS	lvlWIDTH
L0AA8	DS	lvlWIDTH
L0AC4	DS	lvlWIDTH
L0AE0	DS	lvlWIDTH
L0AFC	DS	lvlWIDTH
L0B18	DS	lvlWIDTH
L0B34	DS	lvlWIDTH
L0B50	DS	lvlWIDTH
L0B6C	DS	lvlWIDTH
L0B88	DS	lvlWIDTH
L0BA4	DS	lvlWIDTH
	ds	\

*--- $0C00

sizeLI	=	48	; on pourrait avoir 48 échelles invisibles
tblLADDERIX	ds	sizeLI	; $0C00 mais le jeu n'en autorise
tblLADDERIY	ds	sizeLI	; que 45

sizeFOE	=	8	; on pourrait avoir 8 ennemis
tblFOEX	ds	sizeFOE	; $0C60 mais le jeu n'en autorise
tblFOEY	ds	sizeFOE	; que 5
tblFOEACTION ds	sizeFOE
tblFOESTEPX	ds	sizeFOE	; animation step in x-coord
tblFOESTEPY	ds	sizeFOE	; animation step in y-coord
tblFOEINDEX	ds	sizeFOE	; animation index
tblFOELEFTRIGHT ds	sizeFOE	; does foe runs to the left or to the right?
tblFOETEMPO	ds	sizeFOE	; performs actions based on value

sizeHOLE	=	32	; nombre de trous possibles
tblHOLEX	ds	sizeHOLE	; $0CA0 X des trous
tblHOLEY	ds	sizeHOLE	; Y des trous
tblHOLET	ds	sizeHOLE	; tempo des trous

*--- $0D00 - Level buffer from/to disk

levelDISK	ds	256

*--- $0E00 - buffer pour le son

sndDURATION	ds	128
sndNOTE	ds	128

*--- Line numbers

xhgr
]debut	=	$2000
	lup	200
	dfb	<]debut
]debut	=	]debut+160
	--^

yhgr
]debut	=	$2000
	lup	200
	dfb	>]debut
]debut	=	]debut+160
	--^

*--- Level line numbers

tblBOARDALLL
	DFB	<L0800,<L081C,<L0838,<L0854,<L0870,<L088C,<L08A8,<L08C4
	DFB	<L08E0,<L08FC,<L0918,<L0934,<L0950,<L096C,<L0988,<L09A4
tblBOARDALLH
	DFB	>L0800,>L081C,>L0838,>L0854,>L0870,>L088C,>L08A8,>L08C4
	DFB	>L08E0,>L08FC,>L0918,>L0934,>L0950,>L096C,>L0988,>L09A4
tblBOARDBACKL
	DFB	<L0A00,<L0A1C,<L0A38,<L0A54,<L0A70,<L0A8C,<L0AA8,<L0AC4
	DFB	<L0AE0,<L0AFC,<L0B18,<L0B34,<L0B50,<L0B6C,<L0B88,<L0BA4
tblBOARDBACKH
	DFB	>L0A00,>L0A1C,>L0A38,>L0A54,>L0A70,>L0A8C,>L0AA8,>L0AC4
	DFB	>L0AE0,>L0AFC,>L0B18,>L0B34,>L0B50,>L0B6C,>L0B88,>L0BA4

*--- From a X in board to a X in HGR

xtable
]debut	=	10
	lup	lvlWIDTH
	dfb	]debut
]debut	=	]debut+5
	--^

*--- From a Y in board to a Y in HGR

ytable	DB	$00	; HGR line index
	DB	$0B	;   0.11.22.33
	DB	$16	;  22
	DB	$21	;  33
	DB	$2C	;  44
	DB	$37	;  55
	DB	$42	;  66
	DB	$4D	;  77
	DB	$58	;  88
	DB	$63	;  99
	DB	$6E	; 110
	DB	$79	; 121
	DB	$84	; 132
	DB	$8F	; 143
	DB	$9A	; 154
	DB	$A5	; 165
	DB	$B5	; 181	; ligne de texte

*--- $1F00 - Score buffer

scorebuf	ds	256

*--- Référence des scores

scoreEMPTY	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	0000000000000000
	hex	00000000CCCFC4C5A0D2D5CECEC5D2
	hex	00		; <= data disk

	ds	\
