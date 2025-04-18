*
* Bubble Bobble
*
* (c) 1988, Taito
* (s) 2020, Antoine Vignau
*

	mx	%11
	org	$0c00
	lst	off

*-------------------------------

L0C00	HEX	0000000000000000
L0C08	HEX	0000000000000000
L0C10	HEX	0000000000000000
L0C18	HEX	0000000000000000
L0C20	HEX	0000000000000000

*--- Length

L0C28	HEX	2222222222222222222225242F2E0000
	HEX	00000000000000000000000000000000
	HEX	0000000000000000

*--- Pointers to buffer

L0C50	DFB	>MD100,>MD140,>MD180,>MD1C0,>MD200,>MD240,>MD280,>MD2C0
	DFB	>MD300,>MD340,>MD380,>MD3C0,>MD400,>MD440,>MD480,>MD4C0
	DFB	>MD500,>MD540,>MD580,>MD5C0,>MD600,>MD640,>MD680,>MD6C0
	DFB	>MD700,>MD740,>MD780,>MD7C0,>MD800,>MD840,>MD880,>MD8C0
	DFB	>MD900,>MD940,>MD980,>MD9C0,>MDA00,>MDA40,>MDA80,>MDAC0
L0C78	DFB	<MD100,<MD140,<MD180,<MD1C0,<MD200,<MD240,<MD280,<MD2C0
	DFB	<MD300,<MD340,<MD380,<MD3C0,<MD400,<MD440,<MD480,<MD4C0
	DFB	<MD500,<MD540,<MD580,<MD5C0,<MD600,<MD640,<MD680,<MD6C0
	DFB	<MD700,<MD740,<MD780,<MD7C0,<MD800,<MD840,<MD880,<MD8C0
	DFB	<MD900,<MD940,<MD980,<MD9C0,<MDA00,<MDA40,<MDA80,<MDAC0

L0CA0	HEX	FFFFFFFFFF0000000000000000000000
	HEX	0000000000000000
L0CB8	HEX	0000000000FFFF000000000000000000
	HEX	0000000000000000
L0CD0	HEX	16161616161616000000000000000000
	HEX	0000000000000000
L0CE8	HEX	00000000000000000000000000000000
	HEX	0000000000000000

L0D00	HEX	0A0A0A0A0A0A0A000000000000000000
	HEX	00000000000000000000000000000000

L0D20	HEX	0101010101010101080808080808080F
	HEX	0F0F0F0F0F0F161616161616161D1D1D
	HEX	1D1D1D1D242424242424242B2B2B2B2B
	HEX	2B2B3232323232323239393939393939
	HEX	40404040404040474747474747474E4E
	HEX	4E4E4E4E4E555555555555555C5C5C5C
	HEX	5C5C5C636363636363636A6A6A6A6A6A
	HEX	6A71717171717171787878787878787F
	HEX	7F7F7F7F7F7F868686868686868D8D8D
	HEX	8D8D8D8D949494949494949B9B9B9B9B
	HEX	9B9BA2A2A2A2A2A2A2A9A9A9A9A9A9A9
	HEX	A9A9B0B0B0B0B0B0B0B7B7B7B7B7B7B7
	HEX	BEBEBEBEBEBEBEC5C5C5C5C5C5C50000
	HEX	00000000000000000000000000000000

*--- Level data

L0E00	HEX	00000000000000000000000000000001	; index within a level line
	HEX	01010101010102020202020202030303
	HEX	03030303040404040404040505050505
	HEX	05050606060606060607070707070707
	HEX	08080808080808090909090909090A0A
	HEX	0A0A0A0A0A0B0B0B0B0B0B0B0C0C0C0C
	HEX	0C0C0C0D0D0D0D0D0D0D0E0E0E0E0E0E
	HEX	0E0F0F0F0F0F0F0F1010101010101011
	HEX	11111111111112121212121212131313
	HEX	13131313141414141414141515151515
	HEX	15151616161616161617171717171717
	HEX	18181818181818191919191919191919
	HEX	1919191900000000

*--- Pointer to level line

L0EC8	DFB	>L0800,>L0826,>L084C,>L0872,>L0898,>L08BE,>L08E4,>L090A
	DFB	>L0930,>L0956,>L097C,>L09A2,>L09C8,>L09EE,>L0A14,>L0A3A
	DFB	>L0A60,>L0A86,>L0AAC,>L0AD2,>L0AF8,>L0B1E,>L0B44,>L0B6A
	DFB	>L0B90,>L0BB6,>L0BB6,00

L0EE4	DFB	<L0800,<L0826,<L084C,<L0872,<L0898,<L08BE,<L08E4,<L090A
	DFB	<L0930,<L0956,<L097C,<L09A2,<L09C8,<L09EE,<L0A14,<L0A3A
	DFB	<L0A60,<L0A86,<L0AAC,<L0AD2,<L0AF8,<L0B1E,<L0B44,<L0B6A
	DFB	<L0B90,<L0BB6,<L0BB6,00

*---

L0F00    DB    $00
L0F01    DB    $04
         DB    $07
         DB    $0B
         DB    $0E
         DB    $12
         DB    $15
         DB    $19
         DB    $1C
         DB    $20
         DB    $23
         DB    $27
         DB    $2A
         DB    $2E
         DB    $31
         DB    $35
         DB    $38
         DB    $3C
         DB    $3F
         DB    $43
         DB    $46
         DB    $4A
         DB    $4D
         DB    $51
         DB    $54
         DB    $58
         DB    $5B
         DB    $5F
         DB    $62
         DB    $66
         DB    $69
         DB    $6D
         DB    $70
         DB    $74
         DB    $77
         DB    $7B
         DB    $7E
         DB    $82
         DB    $85
         DB    $89
         DB    $8C
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0F30    DB    $00
         DB    $00
L0F32    DB    $00
L0F33    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0F38    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0F40    DB    $00
         DB    $00
         DB    $01
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0F50    DB    $3F
L0F51    DB    $3F
L0F52    DB    $41
L0F53    DB    $41
L0F54    DB    $D0
         DB    $D0
L0F56    DB    $00
         DB    $80
L0F58    DB    $00
L0F59    DB    $00
L0F5A    DB    $00
L0F5B    DB    $00
L0F5C    DB    $00
L0F5D    DB    $00
L0F5E    DB    $00
L0F5F    DB    $00
L0F60    DB    $00
L0F61    DB    $00
L0F62    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0F70    DB    $00
L0F71    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0F7C    DB    $00
         DB    $00
         DB    $00
         DB    $00
L0F80    DB    $00
L0F81    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0F8C    DB    $00
         DB    $00
         DB    $00
         DB    $00
L0F90    DB    $E8
         DB    $EA
         DB    $DB
         DB    $DB
         DB    $DC
         DB    $DC
         DB    $DC
         DB    $DC
         DB    $DD
         DB    $DD
         DB    $DD
         DB    $DD
         DB    $DE
         DB    $DE
         DB    $DE
         DB    $DE
L0FA0    DB    $00
         DB    $00
         DB    $80
         DB    $C0
         DB    $00
         DB    $40
         DB    $80
         DB    $C0
         DB    $00
         DB    $40
         DB    $80
         DB    $C0
         DB    $00
         DB    $40
         DB    $80
         DB    $C0
L0FB0    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0FB6    DB    $00
         DB    $00
L0FB8    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0FBE    DB    $00
         DB    $00
L0FC0    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0FC6    DB    $00
         DB    $00
L0FC8    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0FD0    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0FD8    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0FE0    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0FE8    DB    $00
         DB    $00
         DB    $00
         DB    $00
L0FEC    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L0FF8    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1000    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1008    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L100F    DB    $00
L1010    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1018    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L101F    DB    $00
L1020    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1028    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L102E    DB    $00
L102F    DB    $00
L1030    DB    $00
L1031    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1038    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1040    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1048    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1050    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1058    DB    $00
L1059    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1080    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L10A8    DB    $00
L10A9    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L10B0    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L10B8    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L10C0    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L10C8    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L10D0    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L10D8    DB    $00
L10D9    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1100    DB    $00
L1101    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1108    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1114    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L111C    DB    $00
         DB    $00
         DB    $00
         DB    $00
L1120    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1134    DB    $00
         DB    $00
         DB    $00
         DB    $00
L1138    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L114C    DB    $00
         DB    $00
         DB    $00
         DB    $00
L1150    DB    $00
L1151    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1158    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1160    DB    $00
L1161    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1170    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1178    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L1180    DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L11B0    DB    $00
         DB    $00
         DB    $01
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
L11B8    DB    $00
L11B9    DB    $03
L11BA    DB    $00
         DB    $02
L11BC    DB    $00
         DB    $01
         DB    $02
         DB    $00
L11C0    DB    $00
         DB    $00
         DB    $00
         DB    $05
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $02
         DB    $04
         DB    $00
         DB    $03
         DB    $04
         DB    $05
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $02
         DB    $05
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $06
         DB    $00
         DB    $06
         DB    $07
         DB    $08
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $01
         DB    $02
         DB    $05
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $08
         DB    $00
         DB    $09
         DB    $0A
         DB    $0B
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $00
         DB    $06
         DB    $02
         DB    $05
         DB    $00
         DB    $00
         DB    $00
         DB    $04
         DB    $00
         DB    $0C
         DB    $0D
         DB    $0E
L11FF    DB    $00

* HGR line pointer high

L1200	HEX	0004080C1014181C0004080C1014181C
	HEX	0105090D1115191D0105090D1115191D
	HEX	02060A0E12161A1E02060A0E12161A1E
	HEX	03070B0F13171B1F03070B0F13171B1F
	HEX	0004080C1014181C0004080C1014181C
	HEX	0105090D1115191D0105090D1115191D
	HEX	02060A0E12161A1E02060A0E12161A1E
	HEX	03070B0F13171B1F03070B0F13171B1F
	HEX	0004080C1014181C0004080C1014181C
	HEX	0105090D1115191D0105090D1115191D
	HEX	02060A0E12161A1E02060A0E12161A1E
	HEX	03070B0F13171B1F03070B0F13171B1F
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	020E0D13080D1404201EFF0000000000

* HGR line pointer low

L1300	HEX	00000000000000008080808080808080
	HEX	00000000000000008080808080808080
	HEX	00000000000000008080808080808080
	HEX	00000000000000008080808080808080
	HEX	2828282828282828A8A8A8A8A8A8A8A8
	HEX	2828282828282828A8A8A8A8A8A8A8A8
	HEX	2828282828282828A8A8A8A8A8A8A8A8
	HEX	2828282828282828A8A8A8A8A8A8A8A8
	HEX	5050505050505050D0D0D0D0D0D0D0D0
	HEX	5050505050505050D0D0D0D0D0D0D0D0
	HEX	5050505050505050D0D0D0D0D0D0D0D0
	HEX	5050505050505050D0D0D0D0D0D0D0D0
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	0000000000000000

L13E8       HEX         20200D08020420810F20041713040D03
            HEX         2020FF
	HEX         0000000000

L1400	HEX	00000000010101020202020303030404
	HEX	04040505050606060607070708080808
	HEX	0909090A0A0A0A0B0B0B0C0C0C0C0D0D
	HEX	0D0E0E0E0E0F0F0F1010101011111112
	HEX	12121213131314141414151515161616
	HEX	16171717181818181919191A1A1A1A1B
	HEX	1B1B1C1C1C1C1D1D1D1E1E1E1E1F1F1F
	HEX	20202020212121222222222323232424
	HEX	24242525252626262627272700000000
	HEX	00000000000000000000000000000000

L14A0	HEX	130E20020E0D13080D1404200F0B0018
	HEX	080D06201307042006000C041C200F11
	HEX	04121220130704FE2020200508110420
	HEX	011413130E0D200104050E1104201308
	HEX	0C042011140D12200E14131AFF000000
	HEX	00000000000000000000000000000000
L1500	HEX	00020406010305000204060103050002
	HEX	04060103050002040601030500020406
	HEX	01030500020406010305000204060103
	HEX	05000204060103050002040601030500
	HEX	02040601030500020406010305000204
	HEX	06010305000204060103050002040601
	HEX	03050002040601030500020406010305
	HEX	00020406010305000204060103050002
	HEX	04060103050002040601030500000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
L1600	HEX	000102030405060708090A0B0C0D0E0F
	HEX	101112131415161718191A1B1C1D1E1F
	HEX	202122232425262728292A2B2C2D2E2F
	HEX	303132333435363738393A3B3C3D3E3F
	HEX	404142434445464748494A4B4C4D4E4F
	HEX	505152535455565758595A5B5C5D5E5F
	HEX	606162636465666768696A6B6C6D6E6F
	HEX	707172737475767778797A7B7C7D7E7F
L1680	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
L1700	HEX	00020406080A0C0E10121416181A1C1E
	HEX	20222426282A2C2E30323436383A3C3E
	HEX	40424446484A4C4E50525456585A5C5E
	HEX	60626466686A6C6E70727476787A7C7E
	HEX	00020406080A0C0E10121416181A1C1E
	HEX	20222426282A2C2E30323436383A3C3E
	HEX	40424446484A4C4E50525456585A5C5E
	HEX	60626466686A6C6E70727476787A7C7E
L1780	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	01010101010101010101010101010101
	HEX	01010101010101010101010101010101
	HEX	01010101010101010101010101010101
	HEX	01010101010101010101010101010101
L1800	HEX	0004080C1014181C2024282C3034383C
	HEX	4044484C5054585C6064686C7074787C
	HEX	0004080C1014181C2024282C3034383C
	HEX	4044484C5054585C6064686C7074787C
	HEX	0004080C1014181C2024282C3034383C
	HEX	4044484C5054585C6064686C7074787C
	HEX	0004080C1014181C2024282C3034383C
	HEX	4044484C5054585C6064686C7074787C
L1880	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	01010101010101010101010101010101
	HEX	01010101010101010101010101010101
	HEX	02020202020202020202020202020202
	HEX	02020202020202020202020202020202
	HEX	03030303030303030303030303030303
	HEX	03030303030303030303030303030303
L1900	HEX	00081018202830384048505860687078
	HEX	00081018202830384048505860687078
	HEX	00081018202830384048505860687078
	HEX	00081018202830384048505860687078
	HEX	00081018202830384048505860687078
	HEX	00081018202830384048505860687078
	HEX	00081018202830384048505860687078
	HEX	00081018202830384048505860687078
L1980	HEX	00000000000000000000000000000000
	HEX	01010101010101010101010101010101
	HEX	02020202020202020202020202020202
	HEX	03030303030303030303030303030303
	HEX	04040404040404040404040404040404
	HEX	05050505050505050505050505050505
	HEX	06060606060606060606060606060606
	HEX	07070707070707070707070707070707
L1A00	HEX	00102030405060700010203040506070
	HEX	00102030405060700010203040506070
	HEX	00102030405060700010203040506070
	HEX	00102030405060700010203040506070
	HEX	00102030405060700010203040506070
	HEX	00102030405060700010203040506070
	HEX	00102030405060700010203040506070
	HEX	00102030405060700010203040506070
L1A80	HEX	00000000000000000101010101010101
	HEX	02020202020202020303030303030303
	HEX	04040404040404040505050505050505
	HEX	06060606060606060707070707070707
	HEX	08080808080808080909090909090909
	HEX	0A0A0A0A0A0A0A0A0B0B0B0B0B0B0B0B
	HEX	0C0C0C0C0C0C0C0C0D0D0D0D0D0D0D0D
	HEX	0E0E0E0E0E0E0E0E0F0F0F0F0F0F0F0F
L1B00	HEX	00204060002040600020406000204060
	HEX	00204060002040600020406000204060
	HEX	00204060002040600020406000204060
	HEX	00204060002040600020406000204060
	HEX	00204060002040600020406000204060
	HEX	00204060002040600020406000204060
	HEX	00204060002040600020406000204060
	HEX	00204060002040600020406000204060
L1B80	HEX	00000000010101010202020203030303
	HEX	04040404050505050606060607070707
	HEX	08080808090909090A0A0A0A0B0B0B0B
	HEX	0C0C0C0C0D0D0D0D0E0E0E0E0F0F0F0F
	HEX	10101010111111111212121213131313
	HEX	14141414151515151616161617171717
	HEX	18181818191919191A1A1A1A1B1B1B1B
	HEX	1C1C1C1C1D1D1D1D1E1E1E1E1F1F1F1F
L1C00	HEX	00400040004000400040004000400040
	HEX	00400040004000400040004000400040
	HEX	00400040004000400040004000400040
	HEX	00400040004000400040004000400040
	HEX	00400040004000400040004000400040
	HEX	00400040004000400040004000400040
	HEX	00400040004000400040004000400040
	HEX	00400040004000400040004000400040
L1C80	HEX	00000101020203030404050506060707
	HEX	080809090A0A0B0B0C0C0D0D0E0E0F0F
	HEX	10101111121213131414151516161717
	HEX	181819191A1A1B1B1C1C1D1D1E1E1F1F
	HEX	20202121222223232424252526262727
	HEX	282829292A2A2B2B2C2C2D2D2E2E2F2F
	HEX	30303131323233333434353536363737
	HEX	383839393A3A3B3B3C3C3D3D3E3E3F3F
L1D00	HEX	7F7C7C7C737070707370707073707070
	HEX	4F4C4C4C434040404340404043404040
	HEX	4F4C4C4C434040404340404043404040
	HEX	4F4C4C4C434040404340404043404040
	HEX	3F3C3C3C333030303330303033303030
	HEX	0F0C0C0C030000000300000003000000
	HEX	0F0C0C0C030000000300000003000000
	HEX	0F0C0C0C030000000300000003000000
	HEX	7F7E7978797879786766616061606160
	HEX	67666160616061606766616061606160
	HEX	1F1E1918191819180706010001000100
	HEX	07060100010001000706010001000100
	HEX	1F1E1918191819180706010001000100
	HEX	07060100010001000706010001000100
	HEX	1F1E1918191819180706010001000100
	HEX	07060100010001000706010001000100
L1E00	HEX	7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
	HEX	7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
	HEX	7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
	HEX	7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
	HEX	7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E
	HEX	7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E
	HEX	7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E
	HEX	7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E7E
	HEX	7F3F7F3F7F3F7F3F7F3F7F3F7F3F7F3F
	HEX	7F3F7F3F7F3F7F3F7F3F7F3F7F3F7F3F
	HEX	7F3F7F3F7F3F7F3F7F3F7F3F7F3F7F3F
	HEX	7F3F7F3F7F3F7F3F7F3F7F3F7F3F7F3F
	HEX	7F3F7F3F7F3F7F3F7F3F7F3F7F3F7F3F
	HEX	7F3F7F3F7F3F7F3F7F3F7F3F7F3F7F3F
	HEX	7F3F7F3F7F3F7F3F7F3F7F3F7F3F7F3F
	HEX	7F3F7F3F7F3F7F3F7F3F7F3F7F3F7F3F
L1F00	HEX	00000000808080000000008080800000
	HEX	00008080800000000080808000000000
	HEX	80808000000000808080000000008080
	HEX	80000000008080800000000080808000
	HEX	00000080808000000000808080000000
	HEX	00808080000000008080800000000080
	HEX	80800000000080808000000000808080
	HEX	00000000808080000000008080800000
	HEX	00008080800000000080808000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
