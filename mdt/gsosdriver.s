*
* Microdrive Turbo GS/OS driver
*
* (c) 1996-2006, Joachim Lange
* (s) 2019, Brutal Deluxe Software
*

	mx	%00
	rel
	typ	DRV	; auxtype MUST be $0110
	dsk	MDT.l
	lst	off

*----------------------------

* Device driver direct page

deviceNum	=	$00			; 00
callNum		=	deviceNum+2		; 02
bufferPtr	=	callNum+2		; 04
requestCount	=	bufferPtr+4		; 06
transferCount	=	requestCount+4		; 0A
blockNum	=	transferCount+4		; 0E
blockSize	=	blockNum+4		; 12
fstID		=	blockSize+2		; 16requestCount+2
statusCode	=	blockSize+2		; 16
controlCode	=	blockSize+2		; 16
volumeID	=	statusCode+2		; 18
cachePriority	=	volumeID+2		; 1A
cachePointer	=	cachePriority+2		; 1C
dibPointer	=	cachePointer+4		; 1E

* Device Information Block = DIB

linkPtr		=	$00			; 00
entryPtr	=	linkPtr+4		; 04
characteristics	=	entryPointer+4		; 08
blockCount	=	characteristics+2	; 0A
length		=	blockCount+4		; 0E
devName		=	length+1		; 0F
slotNum		=	devName+31		; 2E
unitNum		=	slotNum+2		; 30
version		=	unitNum+2		; 32
deviceID	=	version+2		; 34
headLink	=	deviceID+2		; 36
forwardLink	=	headLink+2		; 38
extendedDIBPtr	=	forwardLink+2		; 3A
DIBDevNum	=	extendedDIBPtr+4	; 3E

SPKR	EQU	$C030
DMAREG	EQU	$C037
RDBANK2	EQU	$C080
RDROM2	EQU	$C082
LCBANK2	EQU	$C083
RDBANK1	EQU	$C088
RDROM1	EQU	$C08A
LCBANK1	EQU	$C08B
CLRROM	EQU	$CFFF

CACHE_FIND_BLK	EQU	$01FC04
CACHE_ADD_BLK	EQU	$01FC08

*----------------------------

L0000	DW	L027A-L0000	; offset to 1st DIB
	DW	$0010	;	number	of	devices
	DA	L0090-L0000	;	offset	to	configuration	list
	DA	L0094-L0000	;	offset	to	configuration	list
	DA	L0098-L0000	;	offset	to	configuration	list
	DA	L009C-L0000	;	offset	to	configuration	list
	DA	L00A0-L0000	;	offset	to	configuration	list
	DA	L00A4-L0000	;	offset	to	configuration	list
	DA	L00A8-L0000	;	offset	to	configuration	list
	DA	L00AC-L0000	;	offset	to	configuration	list
	DA	L00B0-L0000	;	offset	to	configuration	list
	DA	L00B4-L0000	;	offset	to	configuration	list
	DA	L00B8-L0000	;	offset	to	configuration	list
	DA	L00BC-L0000	;	offset	to	configuration	list
	DA	L00C0-L0000	;	offset	to	configuration	list
	DA	L00C4-L0000	;	offset	to	configuration	list
	DA	L00C8-L0000	;	offset	to	configuration	list
	DA	L00CC-L0000	;	offset	to	configuration	list

*--- Copyright check (see Driver_Startup)

L0024	ASC	"             MicroDrv/Turbo    GS/OS - HD     Driver v1.00   "
L0061	ASC	"Copyright 1996 by "
L0073	ASC	"Joachim "
L007B	ASC	"Lange                "

* Table for SetConfigParameters

L0090	ADRL	$00000000
L0094	ADRL	$00000000
L0098	ADRL	$00000000
L009C	ADRL	$00000000
L00A0	ADRL	$00000000
L00A4	ADRL	$00000000
L00A8	ADRL	$00000000
L00AC	ADRL	$00000000
L00B0	ADRL	$00000000
L00B4	ADRL	$00000000
L00B8	ADRL	$00000000
L00BC	ADRL	$00000000
L00C0	ADRL	$00000000
L00C4	ADRL	$00000000
L00C8	ADRL	$00000000
L00CC	ADRL	$00000000

* Driver_Status / GetFormatOptions

L00D0	DA	$0000
	DA	L00F2	; device 1
	DA	L010A
	DA	L0122
	DA	L013A
	DA	L0152
	DA	L016A
	DA	L0182
	DA	L019A
	DA	L01B2
	DA	L01CA
	DA	L01E2
	DA	L01FA
	DA	L0212
	DA	L022A
	DA	L0242	; device F
	DA	L025A	; device 10

* See GS/OS Driver Reference, page 236+

L00F2	DW	$0001	; numOptions
	DW	$0001	; numDisplayed
	DW	$0001	; recommendedOption
	DW	$0001	; currentOption

	DW	$0001	; formatOptionNum
	DW	$0000	; linkRefNum
	DW	$0000	; flags (mediaSize in bytes, Universal Format)
	ADRL	$00000000	; blockCount
	DW	$0200	; blockSize
	DW	$0001	; interleaveFactor (1:1)
	DW	$0000	; mediaSize ($0000 blocks)

L010A	HEX	01000100010001000100000000000000
	HEX	0000000201000000
L0122	HEX	01000100010001000100000000000000
	HEX	0000000201000000
L013A	HEX	01000100010001000100000000000000
	HEX	0000000201000000
L0152	HEX	01000100010001000100000000000000
	HEX	0000000201000000
L016A	HEX	01000100010001000100000000000000
	HEX	0000000201000000
L0182	HEX	01000100010001000100000000000000
	HEX	0000000201000000
L019A	HEX	01000100010001000100000000000000
	HEX	0000000201000000
L01B2	HEX	01000100010001000100000000000000
	HEX	0000000201000000
L01CA	HEX	01000100010001000100000000000000
	HEX	0000000201000000
L01E2	HEX	01000100010001000100000000000000
	HEX	0000000201000000
L01FA	HEX	01000100010001000100000000000000
	HEX	0000000201000000
L0212	HEX	01000100010001000100000000000000
	HEX	0000000201000000
L022A	HEX	01000100010001000100000000000000
	HEX	0000000201000000
L0242	HEX	01000100010001000100000000000000
	HEX	0000000201000000
L025A	HEX	01000100010001000100000000000000
	HEX	0000000201000000

	DB	$FF
	DB	$FF
	DB	$FF
	DB	$FF
	DB	$FF
	DB	$FF
	DB	$FF
	DB	$FF

*----------------------------
* DIBs
*----------------------------

L027A	ADRL	L02BE	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.1'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0001	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0001
	DW	$0000
L02BE	ADRL	L0302	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.2'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000
L0302	ADRL	L0346	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.3'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000
L0346	ADRL	L038A	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.4'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000
L038A	ADRL	L03CE	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.5'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000
L03CE	ADRL	L0412	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.6'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000
L0412	ADRL	L0456	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.7'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000
L0456	ADRL	L049A	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.8'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000
L049A	ADRL	L04DE	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.9'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000
L04DE	ADRL	L0522	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.A'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000
L0522	ADRL	L0566	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.B'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000
L0566	ADRL	L05AA	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.C'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000
L05AA	ADRL	L05EE	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.D'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000
L05EE	ADRL	L0632	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.E'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000
L0632	ADRL	L0676	;	pointer	to	the	next	DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.F'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000

* The pointer to the next DIB should be 0

L0676	ADRL	tblDRIVER	; pointer to the next DIB
	ADRL	entryPoint	;	driver	entry	point
	DW	$23E8	;	characteristics
	ADRL	$00000000	;	block	count
	STR	'MICRODRIVE.TURBO.G'	;	device	name
	ASC	'             '
	DW	$0000	;	slot	number
	DW	$0002	;	unit	number
	DW	$1000	;	version
	DW	$0013	;	device	ID
	DW	$0000	;	first	linked	device
	DW	$0000	;	next	linked	device
	ADRL	$00000000	;	extended	DIB	ptr
	DW	$0000	;	device	number
	DW	$0002
	DW	$0000

*----------------------------
* GS/OS driver entry points
*----------------------------

tblDRIVER
	DA	Driver_Startup
	DA	Driver_Open
	DA	Driver_Read
	DA	Driver_Write
	DA	Driver_Close
	DA	Driver_Status
	DA	Driver_Control
	DA	Driver_Flush
	DA	Driver_Shutdown

* Driver_Status entry points

tblSTATUS
	DA	GetDeviceStatus-1
	DA	GetConfigParameters-1
	DA	GetWaitStatus-1
	DA	GetFormatOptions-1
	DA	GetPartitionMap-1

tblCONTROL
	DA	ResetDevice-1
	DA	FormatDevice-1
	DA	EjectMedium-1
	DA	SetConfigParameters-1
	DA	SetWaitStatus-1
	DA	SetFormatOptions-1
	DA	AssignPartitionOwner-1
	DA	ArmSignal-1
	DA	DisarmSignal-1
	DA	SetPartitionMap-1

	DB	$A9	; LDA
	DB	$00	; #$00
	DB	$38	; SEC
	DB	$60	; RTS
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00

*--- Table for GetDeviceStatus

L072E	DA	$0000
	DA	L0750	; device 1
	DA	L0756
	DA	L075C
	DA	L0762
	DA	L0768
	DA	L076E
	DA	L0774
	DA	L077A
	DA	L0780
	DA	L0786
	DA	L078C
	DA	L0792
	DA	L0798
	DA	L079E
	DA	L07A4	; device F
	DA	L07AA	; device 10

* $4010 means: linked device + diskInDrive

L0750	HEX	104000000000	; statusWord (word) + numBlocks (long)
L0756	HEX	104000000000
L075C	HEX	104000000000
L0762	HEX	104000000000
L0768	HEX	104000000000
L076E	HEX	104000000000
L0774	HEX	104000000000
L077A	HEX	104000000000
L0780	HEX	104000000000
L0786	HEX	104000000000
L078C	HEX	104000000000
L0792	HEX	104000000000
L0798	HEX	104000000000
L079E	HEX	104000000000
L07A4	HEX	104000000000
L07AA	HEX	104000000000

* Driver_Control / SetConfigParameters pointers

L07B0	DA	L0090
	DA	L0094
	DA	L0098
	DA	L009C
	DA	L00A0
	DA	L00A4
	DA	L00A8
	DA	L00AC
	DA	L00B0
	DA	L00B4
	DA	L00B8
	DA	L00BC
	DA	L00C0
	DA	L00C4
	DA	L00C8
	DA	L00CC

	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00

* Driver_Control / SetFormatOptions table

L07F0	DW	$0001	; format option table is always 1
	DW	$0001
	DW	$0001
	DW	$0001
	DW	$0001
	DW	$0001
	DW	$0001
	DW	$0001
	DW	$0001
	DW	$0001
	DW	$0001
	DW	$0001
	DW	$0001
	DW	$0001
	DW	$0001
	DW	$0001
	DW	$000F
	DW	$0001
	DW	$0000

theUNIT	DW	$0000

	DB	$00	; useless?
	DB	$00
	DB	$30
	DB	$31
	DB	$32
	DB	$37
	DB	$FF
	DB	$FF
	DB	$A0
	DB	$A0
	DB	$A0
	DB	$A0
	DB	$A0
	DB	$A0
	DB	$A0
	DB	$A0
	DB	$A0
	DB	$A0
	DB	$A0
	DB	$AD	; =
	DB	$AD	; =
	DB	$AD	; =
	DB	$AD	; =
	DB	$BE	; >

*----------------------------
* Driver
*----------------------------

	MX	%00

entryPoint
	PHB	;	Dispatch
	PHK
	PLB
	CMP	#$0009
	BCC	L083B
	BRL	L0849
L083B	ASL
	TAX
	JSR	(tblDRIVER,X)
	TAY
	PLB
	BCS	L0847
	LDY	#$0000
L0847	TYA
	RTL

L0849	PLB
	LDA	#$0001
	SEC
	RTL
L084F	JMP	L0932

*----------------------------

Driver_Startup

* Check unmodified GS/OS driver

	STZ	L1478
	LDA	L0073	; Jo (achim) = EFCA 1110_1111_1100_1010
	EOR	#$D3C8	;      	       D3C8 1101_0011_1100_1000
	CMP	#$3C02	;	       3C02 0011_1100_0000_0010
	BNE	L084F
	LDA	L007B	; La (nge) = E1CC 1110_0001_1100_1100
	EOR	#$D3C8	;      	     D3C8 1101_0011_1100_1000
	CMP	#$3204	;	     3204 0011_0010_0000_0100
	BNE	L084F
	LDA	L0061	; Co (pyright) = EFC3 1110_1111_1100_0011
	EOR	#$D3C8	;		 D3C8 1101_0011_1100_1000
	CMP	#$3C0B	;		 3C0B 0011_1100_0000_1011
	BNE	L084F

* Find card

	LDA	#$C7F2
	STA	theCARD
L087C	LDX	theCARD
	LDAL	$000000,X
	CMP	#$C4C9	; ID
	BNE	L08B4
	LDAL	$000001,X
	CMP	#$D5C4	; DU
	BNE	L08B4
	LDAL	$000005,X
	CMP	#$D4CD	; MT
	BNE	L08B4
	LDAL	$000007,X
	CMP	#$CCCA	; JL
	BNE	L08B4
	LDAL	$000003,X
	AND	#$00FF
	CMP	#$0010
	BEQ	L08C6
	CMP	#$0011
	BEQ	L08C6
L08B4	LDA	theCARD
	SEC
	SBC	#$0100
	STA	theCARD
	CMP	#$C100
	BCS	L087C
	JMP	L0932

L08C6	LDA	theCARD	; We have the card in slot X
	AND	#$0F00
	LSR
	LSR
	LSR
	LSR
	STA	theSLOT16
	LSR
	LSR
	LSR
	LSR
	STA	theSLOT
	JSR	initPointers	; patch all addresses

	LDA	theUNIT		; is driver busy?
	BNE	L0920

	SEI			; no, copy ROM
	SEP	#$30
	LDA	#$00
L08E7	STAL	RDROM2
	LDAL	CLRROM
	REP	#$30
	LDX	theCARD		; make the card active
	LDAL	$000000,X
	PHK
	PLB
	LDX	#$00FE		; Copy the $C800 page
L08FD	LDAL	$00C800,X
	STA	L1340,X
	DEX
	DEX
	BPL	L08FD

	LDAL	$00C980		; seems to be 0000 when ROM is on (but code must be moved one page down)
	STA	L1474
	CLI
	LDA	L1340
	CMP	#$CCCA		; JL
	BNE	L0932
	LDA	L1474
	CMP	#$48CA		; 
	BNE	L0932

L0920	SEP	#$30
	INC	theUNIT		; which unit?
	LDA	L135A
	CMP	theUNIT
	BCS	L093D		; we can continue
	REP	#$30
	DEC	theUNIT		; I would have voted for the busy flag

L0932	REP	#$30
	LDAL	CLRROM		; bye bye card
	LDA	#$0027		; I/O error
	SEC
	RTS

L093D	REP	#$30
	LDA	theUNIT		; my unit
	ASL
	ASL
	TAX
	LDA	L13BC,X		; get number of blocks
	LDY	#$000A		; blockCount 
	STA	[dibPointer],Y
	LDY	#$000C		; blockCount+2
	LDA	L13BE,X
	AND	#$00FF
	STA	[dibPointer],Y
	LDY	#$002E		; the slot
	LDA	theSLOT
	ORA	#$0008		; external slot set on bit 3
	STA	[dibPointer],Y
	LDY	#$0030		; unitNum (thought it was busy flag)
	LDA	theUNIT
	STA	[dibPointer],Y

	LDAL	CLRROM		; bye bye card
	LDA	#$0000		; return OK
	CLC
	RTS

*----------------------------

Driver_Open
	LDA	#$0000
	CLC
	RTS

*----------------------------

Driver_Read
	LDY	#$0030		; unitNum
	LDA	[dibPointer],Y
	ASL
	ASL
	STA	L146C
	STZ	L1468
	LDA	requestCount	; requestCount
	STA	theRequest
	LDA	requestCount+2
	STA	theRequest+2

L0990	LDAL	$00C087

L0994	LDA	L1468
	BNE	L09E2
	BIT	fstID		; fstID
	BMI	L09BF		; bit 15 = 1 means force read, do not use cache
	CLC
	JSL	CACHE_FIND_BLK
	BCC	L09BC
	LDA	cachePriority
	BEQ	L09BF		; do not read from the cache
	JSL	CACHE_ADD_BLK	; add in the cache
	BCS	L09BF
	JSR	L0EB7		; calc all
	JMP	L0A9B

L09B4	BCS	L09B9
	JMP	L0A2F
L09B9	JMP	L0A7F
L09BC	JMP	L0C33

L09BF	LDA	L1468		; already entered?
	BNE	L09E2

	JSR	L0EB7		; nope, calc all
	LDA	theRequest+1
	AND	#$01FF
	LSR
	SEP	#$30
L09D0	STAL	RDROM1
	STA	L1466
	LDA	#$20
L09D9	STAL	$00C08F
	STA	L1468
	REP	#$30
	
L09E2	LDA	bufferPtr	; BUG? I would have put requestCount instead
	CMP	#$FE01
	BCC	L09EC
L09E9	JMP	readFROMCARD	; read 512 bytes from card

L09EC	STAL	$00C084

	SEP	#$30		; check slow RAM request
	LDA	bufferPtr+2
	CMP	#$E0
	BEQ	L09E9
	CMP	#$E1
	BEQ	L09E9
	CMP	#$90		; or memory bank over 5MB
	BCS	L0A05
	CMP	L1366
	BCS	L09E9

L0A05	STAL	DMAREG

L0A09	LDAL	RDBANK1
	BPL	L0A09
L0A0F	LDAL	$00C08F
	BMI	L0A0F
	AND	#$F9
	CMP	#$58
	BEQ	L0A21
	LSR
	BCC	L0A0F
	JMP	L0A7F

L0A21	STAL	LCBANK2
L0A25	DEC	L1466
	BNE	L0A2D
	STZ	L1468

L0A2D	REP	#$30		; how many bytes left to read?
L0A2F	LDA	theRequest
	SEC
	SBC	blockSize
	STA	theRequest
	BCS	L0A3D
	DEC	theRequest+2
L0A3D	LDA	theRequest
	BNE	L0A54
	LDA	theRequest+2
	BNE	L0A54
	LDA	requestCount
	STA	transferCount
	LDA	requestCount+2
	STA	transferCount+2
	LDA	#$0000		; we're done!
	CLC
	RTS

* We still have data to read from disk

L0A54	CLC			; next pointer in RAM
	LDA	blockSize	; and next block
	ADC	bufferPtr
	STA	bufferPtr
	BCC	L0A5F
	INC	bufferPtr+2
L0A5F	INC	blockNum
	BNE	L0A65
	INC	blockNum+2

L0A65	LDY	#$000C		; did we reach the end of disk?
	LDA	[dibPointer],Y
	CMP	blockNum+2
	BCS	L0A7C
	LDY	#$000A
	LDA	[dibPointer],Y
	CMP	blockNum
	BCS	L0A7C
	SEC
	LDA	#$0027	; I/O err
	RTS

L0A7C	JMP	L0994		; loop

*----------------------------

L0A7F	SEP	#$30
	PHK
	PLB
	JSR	L11B9	; beep
	JSR	L0EA6
	REP	#$30
	LDA	#$0027	; I/O err
	SEC
	RTS

L0A90	PHK
	PLB
	JSR	L0EA6
	REP	#$30
	SEC
	JMP	L09B4

L0A9B	SEP	#$30
	LDA	#$01
L0A9F	STAL	RDROM1
	LDA	#$20
L0AA5	STAL	$00C08F
	LDA	#$00	; we want bank 0
	PHA
	PLB
L0AAD	LDAL	RDBANK1	; so it could have been LDA RDBANK1
	BPL	L0AAD
L0AB3	LDAL	$00C08F
	BMI	L0AB3
	AND	#$F9	; 1111_1001
	CMP	#$58	; 0101_1000
	BEQ	L0AC4
	LSR		; 2C means 0010_1100
	BCS	L0A90	; not ready?
	BRA	L0AB3	; busy

L0AC4	REP	#$30	; A 16-bit pseudo-bus or what?
	LDY	#$0000
L0AC9	LDA	RDBANK2
	STA	[bufferPtr],Y
	STA	[cachePointer],Y
	INY
	INY
L0AD2	LDA	RDBANK2
	STA	[bufferPtr],Y
	STA	[cachePointer],Y
	INY
	INY
L0ADB	LDA	RDBANK2
	STA	[bufferPtr],Y
	STA	[cachePointer],Y
	INY
	INY
L0AE4	LDA	RDBANK2
	STA	[bufferPtr],Y
	STA	[cachePointer],Y
	INY
	INY
L0AED	LDA	RDBANK2
	STA	[bufferPtr],Y
	STA	[cachePointer],Y
	INY
	INY
L0AF6	LDA	RDBANK2
	STA	[bufferPtr],Y
	STA	[cachePointer],Y
	INY
	INY
L0AFF	LDA	RDBANK2
	STA	[bufferPtr],Y
	STA	[cachePointer],Y
	INY
	INY
L0B08	LDA	RDBANK2
	STA	[bufferPtr],Y
	STA	[cachePointer],Y
	INY
	INY
	CPY	#$0200		; copy 512 bytes even if the blocksize is 256 ;-)
	BCC	L0AC9
	PHK
	PLB
	CLC
	JMP	L09B4

*----------------------------

Driver_Write
	LDY	#$0030
	LDA	[dibPointer],Y
	ASL
	ASL
	STA	L146C
	STZ	L1468
	LDA	requestCount
	STA	theRequest
	LDA	requestCount+2
	STA	theRequest+2
L0B33	LDA	L1468
	BNE	L0B76
	CLC
	JSL	CACHE_FIND_BLK
	BCC	L0B49
	LDA	cachePriority
	BEQ	L0B53
	JSL	CACHE_ADD_BLK
	BCS	L0B53
L0B49	JMP	L0C9B

L0B4C	BIT	cachePriority
	BPL	L0B53
	JMP	L0BD5

L0B53	LDA	L1468
	BNE	L0B76
	JSR	L0EB7
	REP	#$30
	LDA	theRequest+1
	AND	#$01FF
	LSR
	SEP	#$30
L0B66	STAL	RDROM1
	STA	L1466
	LDA	#$30
L0B6F	STAL	$00C08F
	STA	L1468
L0B76	REP	#$30
	LDA	bufferPtr	; BUG? I would have put requestCount instead
	CMP	#$FE01
	BCC	L0B82
L0B7F	JMP	writeTOCARD	; write 512 bytes onto card

L0B82	STAL	$00C084
	SEP	#$30
	LDA	bufferPtr+2
	CMP	#$E0
	BEQ	L0B7F
	CMP	#$E1
	BEQ	L0B7F
	CMP	#$90
	BCS	L0B9B
	CMP	L1366
	BCS	L0B7F
L0B9B	STAL	DMAREG
L0B9F	LDAL	$00C086
L0BA3	LDAL	$00C08F
	BMI	L0BA3
	AND	#$FD
	CMP	#$58
	BEQ	L0BB6
	AND	#$21
	BEQ	L0BA3
	JMP	L0C27

L0BB6	STAL	LCBANK2
L0BBA	LDAL	$00C08F
	BMI	L0BBA
	AND	#$F5
	CMP	#$50
	BEQ	L0BCD
	AND	#$21
	BEQ	L0BBA
	JMP	L0C27

L0BCD	DEC	L1466
	BNE	L0BD5
	STZ	L1468
L0BD5	REP	#$30
	LDA	theRequest
	SEC
	SBC	blockSize
	STA	theRequest
	BCS	L0BE5
	DEC	theRequest+2
L0BE5	LDA	theRequest
	BNE	L0BFC
	LDA	theRequest+2
	BNE	L0BFC
	LDA	requestCount
	STA	transferCount
	LDA	requestCount+2
	STA	transferCount+2
	LDA	#$0000
	CLC
	RTS

L0BFC	CLC
	LDA	blockSize
	ADC	bufferPtr
	STA	bufferPtr
	BCC	L0C07
	INC	bufferPtr+2
L0C07	INC	blockNum
	BNE	L0C0D
	INC	blockNum+2
L0C0D	LDY	#$000C
	LDA	[dibPointer],Y
	CMP	blockNum+2
	BCS	L0C24
	LDY	#$000A
	LDA	[dibPointer],Y
	CMP	blockNum
	BCS	L0C24
	LDA	#$0027	; I/O err
	SEC
	RTS
L0C24	JMP	L0B33

L0C27	SEP	#$30
	JSR	L11B9
	REP	#$30
	LDA	#$0027
	SEC
	RTS

L0C33	LDY	#$01FE
L0C36	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	LDA	[cachePointer],Y
	STA	[bufferPtr],Y
	DEY
	DEY
	BPL	L0C36
	JMP	L0A2F

L0C9B	LDY	#$01FE
L0C9E	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	LDA	[bufferPtr],Y
	STA	[cachePointer],Y
	DEY
	DEY
	BPL	L0C9E
	JMP	L0B4C

*----------------------------

Driver_Close
	LDA	#$0000
	CLC
	RTS

*----------------------------

Driver_Status
	LDA	L1478
	BNE	L0D10
	JSR	L1228
L0D10	LDA	statusCode
	CMP	#$0004
	BCC	L0D1C
	LDA	#$0021
	SEC
	RTS

L0D1C	ASL
	TAX
	LDA	tblSTATUS,X
	PHA
	RTS

*----------------------------
* Driver_Status subcall
*----------------------------

GetDeviceStatus
	LDX	requestCount+2
	BNE	L0D33
	LDX	requestCount
	CPX	#$0002
	BCC	L0D33
	CPX	#$0007
	BCC	L0D38
L0D33	LDA	#$0022		; drvrBadParm
	SEC
	RTS

L0D38	LDY	#$0030		; unitNum
	LDA	[dibPointer],Y
	ASL
	ASL
	TAX
	LDA	L13BE,X		; get number of blocks
	AND	#$00FF
	PHA
	LDA	L13BC,X
	PHA
	LDY	#$0030		; unitNum
	LDA	[dibPointer],Y
	ASL
	TAX
	LDA	L072E,X		; get table for device X
	TAX
	PLA
	STA	|$0002,X
	PLA
	STA	|$0004,X

	LDY	#$0000		; copy device status info
	SEP	#$20		; statusWord (see GS/OS driver call reference page 231+)
L0D63	LDA	|$0000,X	; numBlocks
	STA	[bufferPtr],Y
	INX
	INY
	CPY	requestCount
	BNE	L0D63

	REP	#$20
	LDA	requestCount		; transferCount = requestCount
	STA	transferCount
	STZ	transferCount+2
	LDA	#$0000		; return OK
	CLC
	RTS

*----------------------------
* Driver_Status subcall
*----------------------------

GetConfigParameters
GetWaitStatus
	LDA	#$0026
	SEC
	RTS

*----------------------------
* Driver_Status subcall
*----------------------------

GetFormatOptions
	LDA	#$0022		; drvrBadParm
	LDX	requestCount+2
	BNE	L0D8E
	LDX	requestCount
	CPX	#$0002
	BCS	L0D90
L0D8E	SEC
	RTS

L0D90	LDY	#$0030		; unitNum
	LDA	[dibPointer],Y
	ASL
	ASL
	TAX
	LDA	L13BE,X		; number of blocks
	AND	#$00FF
	PHA
	LDA	L13BC,X
	PHA
	LDA	[dibPointer],Y
	ASL
	TAX
	LDA	L00D0,X
	TAX
	PLA			; save to blockCount
	STA	|$000E,X
	PLA
	STA	|$0010,X
	LDA	#$0001		; interleaveFactor is 1:1
	AND	#$00FF
	STA	|$0014,X

	LDY	#$0030		; unitNum
	LDA	[dibPointer],Y
	ASL
	TAX
	LDA	L00D0,X		; table to formatOptions list
	TAX
	LDA	|$0000,X
	ASL
	ASL
	ASL
	ASL
	CLC
	ADC	#$0008
	CMP	requestCount
	BCS	L0DD8
	STA	requestCount

L0DD8	LDY	#$0000		; copy table
	SEP	#$20
L0DDD	LDA	|$0000,X
	STA	[bufferPtr],Y
	INX
	INY
	CPY	requestCount
	BNE	L0DDD

	REP	#$20		; transferCount = requestCount
	LDA	requestCount
	STA	transferCount
	LDA	requestCount+2
	STA	transferCount+2
	LDA	#$0000
	CLC
	RTS

*----------------------------

Driver_Control
	LDA	controlCode
	CMP	#$000A
	BCC	L0E03
	LDA	#$0021
	SEC
	RTS

L0E03	ASL
	TAX
	LDA	tblCONTROL,X
	PHA
	RTS

*----------------------------

GetPartitionMap	; Driver_Status subcall
	LDA	#$0026		; drvrNoResrc
	SEC
	RTS

*----------------------------
* Driver_Control subcall
*----------------------------

ResetDevice
	LDA	#$0000
	CLC
	RTS

*----------------------------
* Driver_Control subcall
*----------------------------

FormatDevice
	LDA	#$0000
	CLC
	RTS

*----------------------------
* Driver_Control subcall
*----------------------------

EjectMedium
	LDA	#$0000
	CLC
	RTS

*----------------------------
* Driver_Control subcall
*----------------------------

SetConfigParameters
	LDA	#$0022		; drvrBadParm
	LDX	requestCount+2
	BNE	L0E2C
	LDX	requestCount
	CPX	#$0002
	BCS	L0E2E
L0E2C	SEC
	RTS

L0E2E	LDY	#$0030		; unitNum
	LDA	[dibPointer],Y
	ASL
	TAX
	LDA	L07B0,X		; table for SetConfigParameters
	TAX
	LDA	|$0000,X	; lengths must be equal
	CMP	[bufferPtr]
	BEQ	L0E45
	LDA	#$0022		; drvrBadParm
	SEC
	RTS

L0E45	LDY	#$0000		; copy configuration list
	SEP	#$20
L0E4A	LDA	[bufferPtr],Y
	STA	|$0000,X
	INX
	INY
	TYA
	CMP	[bufferPtr],Y
	BNE	L0E4A

	REP	#$20		; transferCount = requestCount
	LDA	requestCount
	STA	transferCount
	LDA	requestCount+2
	STA	transferCount+2
	LDA	#$0000
	CLC
	RTS

*----------------------------
* Driver_Control subcall
*----------------------------

SetFormatOptions
	LDA	#$0022		; drvrBadParm
	LDX	requestCount+2
	BNE	L0E73
	LDX	requestCount
	CPX	#$0002
	BEQ	L0E75
L0E73	SEC
	RTS

L0E75	LDY	#$0030		; unitNum
	LDA	[dibPointer],Y
	TAX
	LDA	[bufferPtr]	; get formatOptionNum
	STA	L07F0,X		; save it in list

	LDA	requestCount	; transferCount = requestCount
	STA	transferCount
	LDA	requestCount+2
	STA	transferCount+2
	LDA	#$0000
	CLC
	RTS

*----------------------------
* Driver_Control subcall
*----------------------------

SetWaitStatus
AssignPartitionOwner
ArmSignal
DisarmSignal
SetPartitionMap
	LDA	#$0026		; drvrNoResrc
	SEC
	RTS

*----------------------------

Driver_Flush
	LDA	#$0020		; drvrBadReq
	SEC
	RTS

*----------------------------

Driver_Shutdown
	DEC	theUNIT		; hum, should really be fgBUSY instead
	BNE	L0EA1
	LDA	#$0000
	CLC
	RTS

L0EA1	LDA	#$0029		; drvrBusy
	SEC
	RTS

*----------------------------
* Wait for card to finish its work?

	MX	%11

L0EA6	PHP
L0EA7	LDAL	$00C08F
	AND	#$08	; 0000_1000
	BEQ	L0EB5
L0EAF	LDAL	RDBANK2
	BRA	L0EA7
L0EB5	PLP
	RTS

*----------------------------
* Calculate offsets and friends?

L0EB7	SEP	#$30
L0EB9	LDAL	$00C08F
	BMI	L0EB9
	LDX	L146C
	CLC
	REP	#$20
	LDA	blockNum
	ADC	L137C,X
	STA	L145E
	SEP	#$20
	LDA	blockNum+2
	ADC	L137E,X
	STA	L1460
	LDA	L137F,X
	STA	L1476
	LDA	L13BF,X
	TAX
	REP	#$20
	CLC
	LDA	L1460
	AND	#$003F
	BEQ	L0EEF
	JMP	L0F75

L0EEF	ASL	L145E
	BCC	L0EF7
	JMP	L0F78

L0EF7	ASL	L145E
	BCC	L0EFF
	JMP	L0F84

L0EFF	ASL	L145E
	BCC	L0F07
	JMP	L0F90

L0F07	ASL	L145E
	BCC	L0F0F
	JMP	L0F9C

L0F0F	ASL	L145E
	BCC	L0F17
	JMP	L0FA8

L0F17	ASL	L145E
	BCC	L0F1F
	JMP	L0FB4

L0F1F	ASL	L145E
	BCC	L0F27
	JMP	L0FC0

L0F27	ASL	L145E
	BCC	L0F2F
	JMP	L0FCC

L0F2F	ASL	L145E
	BCC	L0F37
	JMP	L0FD8

L0F37	ASL	L145E
	BCC	L0F3F
	JMP	L0FE4

L0F3F	ASL	L145E
	BCC	L0F47
	JMP	L0FF0

L0F47	ASL	L145E
	BCC	L0F4F
	JMP	L0FFC

L0F4F	ASL	L145E
	BCC	L0F57
	JMP	L1008

L0F57	ASL	L145E
	BCC	L0F5F
	JMP	L1014

L0F5F	ASL	L145E
	BCC	L0F67
	JMP	L1020

L0F67	ASL	L145E
	BCC	L0F6F
	JMP	L102C

L0F6F	ASL	L145E
	JMP	L1038

L0F75	ASL	L145E
L0F78	ROL
	CMP	L134E,X
	BCC	L0F81
	SBC	L134E,X
L0F81	ROL	L145E
L0F84	ROL
	CMP	L134E,X
	BCC	L0F8D
	SBC	L134E,X
L0F8D	ROL	L145E
L0F90	ROL
	CMP	L134E,X
	BCC	L0F99
	SBC	L134E,X
L0F99	ROL	L145E
L0F9C	ROL
	CMP	L134E,X
	BCC	L0FA5
	SBC	L134E,X
L0FA5	ROL	L145E
L0FA8	ROL
	CMP	L134E,X
	BCC	L0FB1
	SBC	L134E,X
L0FB1	ROL	L145E
L0FB4	ROL
	CMP	L134E,X
	BCC	L0FBD
	SBC	L134E,X
L0FBD	ROL	L145E
L0FC0	ROL
	CMP	L134E,X
	BCC	L0FC9
	SBC	L134E,X
L0FC9	ROL	L145E
L0FCC	ROL
	CMP	L134E,X
	BCC	L0FD5
	SBC	L134E,X
L0FD5	ROL	L145E
L0FD8	ROL
	CMP	L134E,X
	BCC	L0FE1
	SBC	L134E,X
L0FE1	ROL	L145E
L0FE4	ROL
	CMP	L134E,X
	BCC	L0FED
	SBC	L134E,X
L0FED	ROL	L145E
L0FF0	ROL
	CMP	L134E,X
	BCC	L0FF9
	SBC	L134E,X
L0FF9	ROL	L145E
L0FFC	ROL
	CMP	L134E,X
	BCC	L1005
	SBC	L134E,X
L1005	ROL	L145E
L1008	ROL
	CMP	L134E,X
	BCC	L1011
	SBC	L134E,X
L1011	ROL	L145E
L1014	ROL
	CMP	L134E,X
	BCC	L101D
	SBC	L134E,X
L101D	ROL	L145E
L1020	ROL
	CMP	L134E,X
	BCC	L1029
	SBC	L134E,X
L1029	ROL	L145E
L102C	ROL
	CMP	L134E,X
	BCC	L1035
	SBC	L134E,X
L1035	ROL	L145E
L1038	SEP	#$20
	INC
L103B	STAL	LCBANK1
	REP	#$20
	LDA	L145E
	STA	L1450
	LDA	#$0000
	ASL	L1450
	BCC	L1052
	JMP	L10D0

L1052	ASL	L1450
	BCC	L105A
	JMP	L10DC

L105A	ASL	L1450
	BCC	L1062
	JMP	L10E8

L1062	ASL	L1450
	BCC	L106A
	JMP	L10F4

L106A	ASL	L1450
	BCC	L1072
	JMP	L1100

L1072	ASL	L1450
	BCC	L107A
	JMP	L110C

L107A	ASL	L1450
	BCC	L1082
	JMP	L1118

L1082	ASL	L1450
	BCC	L108A
	JMP	L1124

L108A	ASL	L1450
	BCC	L1092
	JMP	L1130

L1092	ASL	L1450
	BCC	L109A
	JMP	L113C

L109A	ASL	L1450
	BCC	L10A2
	JMP	L1148

L10A2	ASL	L1450
	BCC	L10AA
	JMP	L1154

L10AA	ASL	L1450
	BCC	L10B2
	JMP	L1160

L10B2	ASL	L1450
	BCC	L10BA
	JMP	L116C

L10BA	ASL	L1450
	BCC	L10C2
	JMP	L1178

L10C2	ASL	L1450
	BCC	L10CA
	JMP	L1184

L10CA	ASL	L1450
	JMP	L1190

L10D0	ROL
	CMP	L134A,X
	BCC	L10D9
	SBC	L134A,X
L10D9	ROL	L1450
L10DC	ROL
	CMP	L134A,X
	BCC	L10E5
	SBC	L134A,X
L10E5	ROL	L1450
L10E8	ROL
	CMP	L134A,X
	BCC	L10F1
	SBC	L134A,X
L10F1	ROL	L1450
L10F4	ROL
	CMP	L134A,X
	BCC	L10FD
	SBC	L134A,X
L10FD	ROL	L1450
L1100	ROL
	CMP	L134A,X
	BCC	L1109
	SBC	L134A,X
L1109	ROL	L1450
L110C	ROL
	CMP	L134A,X
	BCC	L1115
	SBC	L134A,X
L1115	ROL	L1450
L1118	ROL
	CMP	L134A,X
	BCC	L1121
	SBC	L134A,X
L1121	ROL	L1450
L1124	ROL
	CMP	L134A,X
	BCC	L112D
	SBC	L134A,X
L112D	ROL	L1450
L1130	ROL
	CMP	L134A,X
	BCC	L1139
	SBC	L134A,X
L1139	ROL	L1450
L113C	ROL
	CMP	L134A,X
	BCC	L1145
	SBC	L134A,X
L1145	ROL	L1450
L1148	ROL
	CMP	L134A,X
	BCC	L1151
	SBC	L134A,X
L1151	ROL	L1450
L1154	ROL
	CMP	L134A,X
	BCC	L115D
	SBC	L134A,X
L115D	ROL	L1450
L1160	ROL
	CMP	L134A,X
	BCC	L1169
	SBC	L134A,X
L1169	ROL	L1450
L116C	ROL
	CMP	L134A,X
	BCC	L1175
	SBC	L134A,X
L1175	ROL	L1450
L1178	ROL
	CMP	L134A,X
	BCC	L1181
	SBC	L134A,X
L1181	ROL	L1450
L1184	ROL
	CMP	L134A,X
	BCC	L118D
	SBC	L134A,X
L118D	ROL	L1450
L1190	SEP	#$20
	ORA	L1476
L1195	STAL	$00C08E
	REP	#$20
	LDA	L1450
L119E	STAL	$00C08C
	REP	#$30
	RTS

*----------------------------

	MX	%11
	LDX	#$FF
	BNE	L11C9
	LDX	#$E0
	BNE	L11C9
	LDX	#$C0
	BNE	L11C9
	LDX	#$A0
	BNE	L11C9
	LDX	#$80
	BNE	L11C9
L11B9	LDX	#$60
	BNE	L11C9
	LDX	#$50
	BNE	L11C9
	LDX	#$40
	BNE	L11C9
	LDX	#$20
	BNE	L11C9
L11C9	STX	L1470
	LDY	#$60
L11CE	LDAL	SPKR
	LDX	L1470
L11D5	DEX
	BNE	L11D5
	DEY
	BNE	L11CE
	LDX	#$FF
L11DD	DEY
	BNE	L11DD
	DEX
	BNE	L11DD
	RTS

	LDA	#$14
	STA	L1480
	STZ	L147F
	STZ	L147E
L11EF	LDAL	RDBANK1
	BPL	L11F7
	CLC
	RTS

L11F7	INC	L147E
	BNE	L11EF
	INC	L147F
	BNE	L11EF
	DEC	L1480
	BNE	L11EF
L1206	SEC
	RTS

*----------------------------

L1208	DA	L027A
	DA	L02BE
	DA	L0302
	DA	L0346
	DA	L038A
	DA	L03CE
	DA	L0412
	DA	L0456
	DA	L049A
	DA	L04DE
	DA	L0522
	DA	L0566
	DA	L05AA
	DA	L05EE
	DA	L0632
	DA	L0676

*----------------------------

	MX	%00
L1228	LDY	L1208
	LDA	|$003E,Y
	STA	L147A
	LDA	#$0001
	STA	L147C
L1237	LDA	L147C
	CMP	L135A
	BCC	L1243
	BEQ	L1243
	BRA	L1254
L1243	ASL
	TAY
	LDA	L1206,Y
	TAY
	LDA	L147A
	STA	|$0036,Y
	INC	L147C
	BNE	L1237
L1254	LDA	#$0001
	STA	L147C
L125A	LDA	L147C
	CMP	L135A
	BCC	L1264
	BRA	L127D
L1264	ASL
	TAY
	TAX
	LDA	L1208,Y
	TAY
	LDA	|$003E,Y
	PHA
	TXY
	LDA	L1206,Y
	TAY
	PLA
	STA	|$0038,Y
	INC	L147C
	BNE	L125A
L127D	INC	L1478
	RTS

*----------------------------
* Init s/w addresses
*----------------------------

initPointers
	REP	#$30
	LDA	fgINIT		; was it init'ed?
	BNE	L12E6		; yes, exit

	INC	fgINIT

	LDY	#$0000		; patch s/w addresses
L128E	LDX	L12EB,Y
	LDA	|$0000,X
	AND	#$FF00
	CMP	#$C000
	BNE	L12E7		; crash on error
	LDA	|$0000,X
	CLC
	ADC	theSLOT16
	STA	|$0000,X
	INY
	INY
	CPY	#$004E
	BCC	L128E

	SEP	#$30		; patch fast read/write from direct page
	REP	#$10
	LDX	#$0100
	LDY	#$0000
L12B7	LDA	L19E5+1,Y
	AND	#$F0
	CMP	#$80
	BNE	L12E9		; crash on error
	CLC
	ADC	theSLOT16
	STA	L19E5+1,Y
	LDA	L14B7+1,Y
	AND	#$F0
	CMP	#$80
	BNE	L12E9
	CLC
	ADC	theSLOT16
	STA	L14B7+1,Y
	REP	#$20
	TYA
	CLC
	ADC	#$0005
	TAY
	SEP	#$20
	DEX
	BNE	L12B7
	REP	#$30
L12E6	RTS

L12E7	BRK	$01	; Hum, a BNE goes here
L12E9	DRK	$02	; Hum, a BNE goes here

*----------------------------
* Patch $C0xy table
*----------------------------

L12EB	DA	L0A0F+1
	DA	L0AB3+1
	DA	L0BA3+1
	DA	L0BBA+1
	DA	L0EA7+1
	DA	L0EB9+1
	DA	L1498+1
	DA	L19C1+1
	DA	L1EEC+1
	DA	L0A09+1
	DA	L0AAD+1
	DA	L11EF+1
	DA	L1492+1
	DA	L1EE6+1
	DA	L09D0+1
	DA	L0A9F+1
	DA	L0B66+1
	DA	L103B+1
	DA	L119E+1
	DA	L1195+1
	DA	L0AC9+1
	DA	L0AD2+1
	DA	L0ADB+1
	DA	L0AE4+1
	DA	L0EAF+1
	DA	L0AED+1
	DA	L0AF6+1
	DA	L0AFF+1
	DA	L0B08+1
	DA	L08E7+1
	DA	L09EC+1
	DA	L0B82+1
	DA	L0B9F+1
	DA	L0990+1
	DA	L0A21+1
	DA	L0BB6+1
	DA	L09D9+1
	DA	L0AA5+1
	DA	L0B6F+1

*----------------------------

	DB	$AA
	DB	$AA
	DB	$AA
	DB	$AA
	DB	$AA
	DB	$AA
	DB	$AA

*--- This is a copy of the $C800..$C8FF page (the real one)

L1340	DB	$CA
	DB	$CC
	DB	$64
	DB	$02
	DB	$64
	DB	$02
	DB	$00
	DB	$00
	DB	$00
	DB	$00
L134A	DB	$05
	DB	$00
	DB	$05
	DB	$00
L134E	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$01
	DB	$00
	DB	$01
	DB	$00
	DB	$05
	DB	$00
	DB	$03
	DB	$00
L135A	DB	$08
	DB	$00
	DB	$01
	DB	$00
	DB	$03
	DB	$00
	DB	$04
	DB	$00
	DB	$00
	DB	$00
	DB	$01
	DB	$00
L1366	DB	$40
	DB	$00
	DB	$01
	DB	$00
	DB	$01
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
L137C	DW	$0000
L137E	DB	$00
L137F	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
L13BC	DW	$0000	; number of blocks per device (16*4 bytes)
L13BE	DB	$00
L13BF	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
L1450	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
	DB	$00
L145E	DW	$0000
L1460	DW	$0000
theRequest	ADRL	$00000000
L1466	DW	$0000
L1468	DW	$0000
	DB	$00
	DB	$00
L146C	DW	$0000
	DB	$00
	DB	$00
L1470	DW	$0000
	DB	$00
	DB	$00
L1474	DW	$0000
L1476	DW	$0000
L1478	DW	$0000
L147A	DW	$0000
L147C	DW	$0000
L147E	DB	$00
L147F	DB	$00
L1480	DW	$0000
theCARD	DW	$0000
	DB	$00
	DB	$00
theSLOT	DW	$0000
theSLOT16	DW	$0000
fgINIT	DW	$0000
	DB	$EE
	DB	$EE
	DB	$EE
	DB	$EE

*----------------------------
* Read data from card
*----------------------------

readFROMCARD
	SEP	#$30
L1492	LDAL	RDBANK1
	BPL	L1492
L1498	LDAL	$00C08F
	BMI	L1498
	AND	#$F9
	CMP	#$58
	BEQ	L14AA
	LSR
	BCC	L1498
	JMP	L0A7F

L14AA	LDA	bufferPtr+2
	PHA
	PLB
	REP	#$30
	LDY	bufferPtr
	PHD
	LDA	#$C000
	TCD
L14B7	LDA	$80		; $C0s0 returns a 16-bit value from the disk
	STA	|$0000,Y
	LDA	$80
	STA	|$0002,Y
	LDA	$80
	STA	|$0004,Y
	LDA	$80
	STA	|$0006,Y
	LDA	$80
	STA	|$0008,Y
	LDA	$80
	STA	|$000A,Y
	LDA	$80
	STA	|$000C,Y
	LDA	$80
	STA	|$000E,Y
	LDA	$80
	STA	|$0010,Y
	LDA	$80
	STA	|$0012,Y
	LDA	$80
	STA	|$0014,Y
	LDA	$80
	STA	|$0016,Y
	LDA	$80
	STA	|$0018,Y
	LDA	$80
	STA	|$001A,Y
	LDA	$80
	STA	|$001C,Y
	LDA	$80
	STA	|$001E,Y
	LDA	$80
	STA	|$0020,Y
	LDA	$80
	STA	|$0022,Y
	LDA	$80
	STA	|$0024,Y
	LDA	$80
	STA	|$0026,Y
	LDA	$80
	STA	|$0028,Y
	LDA	$80
	STA	|$002A,Y
	LDA	$80
	STA	|$002C,Y
	LDA	$80
	STA	|$002E,Y
	LDA	$80
	STA	|$0030,Y
	LDA	$80
	STA	|$0032,Y
	LDA	$80
	STA	|$0034,Y
	LDA	$80
	STA	|$0036,Y
	LDA	$80
	STA	|$0038,Y
	LDA	$80
	STA	|$003A,Y
	LDA	$80
	STA	|$003C,Y
	LDA	$80
	STA	|$003E,Y
	LDA	$80
	STA	|$0040,Y
	LDA	$80
	STA	|$0042,Y
	LDA	$80
	STA	|$0044,Y
	LDA	$80
	STA	|$0046,Y
	LDA	$80
	STA	|$0048,Y
	LDA	$80
	STA	|$004A,Y
	LDA	$80
	STA	|$004C,Y
	LDA	$80
	STA	|$004E,Y
	LDA	$80
	STA	|$0050,Y
	LDA	$80
	STA	|$0052,Y
	LDA	$80
	STA	|$0054,Y
	LDA	$80
	STA	|$0056,Y
	LDA	$80
	STA	|$0058,Y
	LDA	$80
	STA	|$005A,Y
	LDA	$80
	STA	|$005C,Y
	LDA	$80
	STA	|$005E,Y
	LDA	$80
	STA	|$0060,Y
	LDA	$80
	STA	|$0062,Y
	LDA	$80
	STA	|$0064,Y
	LDA	$80
	STA	|$0066,Y
	LDA	$80
	STA	|$0068,Y
	LDA	$80
	STA	|$006A,Y
	LDA	$80
	STA	|$006C,Y
	LDA	$80
	STA	|$006E,Y
	LDA	$80
	STA	|$0070,Y
	LDA	$80
	STA	|$0072,Y
	LDA	$80
	STA	|$0074,Y
	LDA	$80
	STA	|$0076,Y
	LDA	$80
	STA	|$0078,Y
	LDA	$80
	STA	|$007A,Y
	LDA	$80
	STA	|$007C,Y
	LDA	$80
	STA	|$007E,Y
	LDA	$80
	STA	|$0080,Y
	LDA	$80
	STA	|$0082,Y
	LDA	$80
	STA	|$0084,Y
	LDA	$80
	STA	|$0086,Y
	LDA	$80
	STA	|$0088,Y
	LDA	$80
	STA	|$008A,Y
	LDA	$80
	STA	|$008C,Y
	LDA	$80
	STA	|$008E,Y
	LDA	$80
	STA	|$0090,Y
	LDA	$80
	STA	|$0092,Y
	LDA	$80
	STA	|$0094,Y
	LDA	$80
	STA	|$0096,Y
	LDA	$80
	STA	|$0098,Y
	LDA	$80
	STA	|$009A,Y
	LDA	$80
	STA	|$009C,Y
	LDA	$80
	STA	|$009E,Y
	LDA	$80
	STA	|$00A0,Y
	LDA	$80
	STA	|$00A2,Y
	LDA	$80
	STA	|$00A4,Y
	LDA	$80
	STA	|$00A6,Y
	LDA	$80
	STA	|$00A8,Y
	LDA	$80
	STA	|$00AA,Y
	LDA	$80
	STA	|$00AC,Y
	LDA	$80
	STA	|$00AE,Y
	LDA	$80
	STA	|$00B0,Y
	LDA	$80
	STA	|$00B2,Y
	LDA	$80
	STA	|$00B4,Y
	LDA	$80
	STA	|$00B6,Y
	LDA	$80
	STA	|$00B8,Y
	LDA	$80
	STA	|$00BA,Y
	LDA	$80
	STA	|$00BC,Y
	LDA	$80
	STA	|$00BE,Y
	LDA	$80
	STA	|$00C0,Y
	LDA	$80
	STA	|$00C2,Y
	LDA	$80
	STA	|$00C4,Y
	LDA	$80
	STA	|$00C6,Y
	LDA	$80
	STA	|$00C8,Y
	LDA	$80
	STA	|$00CA,Y
	LDA	$80
	STA	|$00CC,Y
	LDA	$80
	STA	|$00CE,Y
	LDA	$80
	STA	|$00D0,Y
	LDA	$80
	STA	|$00D2,Y
	LDA	$80
	STA	|$00D4,Y
	LDA	$80
	STA	|$00D6,Y
	LDA	$80
	STA	|$00D8,Y
	LDA	$80
	STA	|$00DA,Y
	LDA	$80
	STA	|$00DC,Y
	LDA	$80
	STA	|$00DE,Y
	LDA	$80
	STA	|$00E0,Y
	LDA	$80
	STA	|$00E2,Y
	LDA	$80
	STA	|$00E4,Y
	LDA	$80
	STA	|$00E6,Y
	LDA	$80
	STA	|$00E8,Y
	LDA	$80
	STA	|$00EA,Y
	LDA	$80
	STA	|$00EC,Y
	LDA	$80
	STA	|$00EE,Y
	LDA	$80
	STA	|$00F0,Y
	LDA	$80
	STA	|$00F2,Y
	LDA	$80
	STA	|$00F4,Y
	LDA	$80
	STA	|$00F6,Y
	LDA	$80
	STA	|$00F8,Y
	LDA	$80
	STA	|$00FA,Y
	LDA	$80
	STA	|$00FC,Y
	LDA	$80
	STA	|$00FE,Y
	LDA	$80
	STA	$0100,Y
	LDA	$80
	STA	$0102,Y
	LDA	$80
	STA	$0104,Y
	LDA	$80
	STA	$0106,Y
	LDA	$80
	STA	$0108,Y
	LDA	$80
	STA	$010A,Y
	LDA	$80
	STA	$010C,Y
	LDA	$80
	STA	$010E,Y
	LDA	$80
	STA	$0110,Y
	LDA	$80
	STA	$0112,Y
	LDA	$80
	STA	$0114,Y
	LDA	$80
	STA	$0116,Y
	LDA	$80
	STA	$0118,Y
	LDA	$80
	STA	$011A,Y
	LDA	$80
	STA	$011C,Y
	LDA	$80
	STA	$011E,Y
	LDA	$80
	STA	$0120,Y
	LDA	$80
	STA	$0122,Y
	LDA	$80
	STA	$0124,Y
	LDA	$80
	STA	$0126,Y
	LDA	$80
	STA	$0128,Y
	LDA	$80
	STA	$012A,Y
	LDA	$80
	STA	$012C,Y
	LDA	$80
	STA	$012E,Y
	LDA	$80
	STA	$0130,Y
	LDA	$80
	STA	$0132,Y
	LDA	$80
	STA	$0134,Y
	LDA	$80
	STA	$0136,Y
	LDA	$80
	STA	$0138,Y
	LDA	$80
	STA	$013A,Y
	LDA	$80
	STA	$013C,Y
	LDA	$80
	STA	$013E,Y
	LDA	$80
	STA	$0140,Y
	LDA	$80
	STA	$0142,Y
	LDA	$80
	STA	$0144,Y
	LDA	$80
	STA	$0146,Y
	LDA	$80
	STA	$0148,Y
	LDA	$80
	STA	$014A,Y
	LDA	$80
	STA	$014C,Y
	LDA	$80
	STA	$014E,Y
	LDA	$80
	STA	$0150,Y
	LDA	$80
	STA	$0152,Y
	LDA	$80
	STA	$0154,Y
	LDA	$80
	STA	$0156,Y
	LDA	$80
	STA	$0158,Y
	LDA	$80
	STA	$015A,Y
	LDA	$80
	STA	$015C,Y
	LDA	$80
	STA	$015E,Y
	LDA	$80
	STA	$0160,Y
	LDA	$80
	STA	$0162,Y
	LDA	$80
	STA	$0164,Y
	LDA	$80
	STA	$0166,Y
	LDA	$80
	STA	$0168,Y
	LDA	$80
	STA	$016A,Y
	LDA	$80
	STA	$016C,Y
	LDA	$80
	STA	$016E,Y
	LDA	$80
	STA	$0170,Y
	LDA	$80
	STA	$0172,Y
	LDA	$80
	STA	$0174,Y
	LDA	$80
	STA	$0176,Y
	LDA	$80
	STA	$0178,Y
	LDA	$80
	STA	$017A,Y
	LDA	$80
	STA	$017C,Y
	LDA	$80
	STA	$017E,Y
	LDA	$80
	STA	$0180,Y
	LDA	$80
	STA	$0182,Y
	LDA	$80
	STA	$0184,Y
	LDA	$80
	STA	$0186,Y
	LDA	$80
	STA	$0188,Y
	LDA	$80
	STA	$018A,Y
	LDA	$80
	STA	$018C,Y
	LDA	$80
	STA	$018E,Y
	LDA	$80
	STA	$0190,Y
	LDA	$80
	STA	$0192,Y
	LDA	$80
	STA	$0194,Y
	LDA	$80
	STA	$0196,Y
	LDA	$80
	STA	$0198,Y
	LDA	$80
	STA	$019A,Y
	LDA	$80
	STA	$019C,Y
	LDA	$80
	STA	$019E,Y
	LDA	$80
	STA	$01A0,Y
	LDA	$80
	STA	$01A2,Y
	LDA	$80
	STA	$01A4,Y
	LDA	$80
	STA	$01A6,Y
	LDA	$80
	STA	$01A8,Y
	LDA	$80
	STA	$01AA,Y
	LDA	$80
	STA	$01AC,Y
	LDA	$80
	STA	$01AE,Y
	LDA	$80
	STA	$01B0,Y
	LDA	$80
	STA	$01B2,Y
	LDA	$80
	STA	$01B4,Y
	LDA	$80
	STA	$01B6,Y
	LDA	$80
	STA	$01B8,Y
	LDA	$80
	STA	$01BA,Y
	LDA	$80
	STA	$01BC,Y
	LDA	$80
	STA	$01BE,Y
	LDA	$80
	STA	$01C0,Y
	LDA	$80
	STA	$01C2,Y
	LDA	$80
	STA	$01C4,Y
	LDA	$80
	STA	$01C6,Y
	LDA	$80
	STA	$01C8,Y
	LDA	$80
	STA	$01CA,Y
	LDA	$80
	STA	$01CC,Y
	LDA	$80
	STA	$01CE,Y
	LDA	$80
	STA	$01D0,Y
	LDA	$80
	STA	$01D2,Y
	LDA	$80
	STA	$01D4,Y
	LDA	$80
	STA	$01D6,Y
	LDA	$80
	STA	$01D8,Y
	LDA	$80
	STA	$01DA,Y
	LDA	$80
	STA	$01DC,Y
	LDA	$80
	STA	$01DE,Y
	LDA	$80
	STA	$01E0,Y
	LDA	$80
	STA	$01E2,Y
	LDA	$80
	STA	$01E4,Y
	LDA	$80
	STA	$01E6,Y
	LDA	$80
	STA	$01E8,Y
	LDA	$80
	STA	$01EA,Y
	LDA	$80
	STA	$01EC,Y
	LDA	$80
	STA	$01EE,Y
	LDA	$80
	STA	$01F0,Y
	LDA	$80
	STA	$01F2,Y
	LDA	$80
	STA	$01F4,Y
	LDA	$80
	STA	$01F6,Y
	LDA	$80
	STA	$01F8,Y
	LDA	$80
	STA	$01FA,Y
	LDA	$80
	STA	$01FC,Y
	LDA	$80
	STA	$01FE,Y
	PLD
	SEP	#$30
	PHK
	PLB
	JMP	L0A25

*----------------------------
* Write data to card
*----------------------------

writeTOCARD
	SEP	#$30
L19C1	LDAL	$00C08F
	BMI	L19C1
	AND	#$FD	; 1111_1101
	CMP	#$58	; 0101_1000
	BEQ	L19D4
	AND	#$21	; 0010_0001
	BEQ	L19C1
	JMP	L0C27

L19D4	PHB
	LDA	bufferPtr+2
	PHA
	PLB
	REP	#$30
	LDY	bufferPtr
	PHD
	LDA	#$C000
	TCD
	LDA	|$0000,Y
L19E5	STA	$80
	LDA	|$0002,Y
	STA	$80
	LDA	|$0004,Y
	STA	$80
	LDA	|$0006,Y
	STA	$80
	LDA	|$0008,Y
	STA	$80
	LDA	|$000A,Y
	STA	$80
	LDA	|$000C,Y
	STA	$80
	LDA	|$000E,Y
	STA	$80
	LDA	|$0010,Y
	STA	$80
	LDA	|$0012,Y
	STA	$80
	LDA	|$0014,Y
	STA	$80
	LDA	|$0016,Y
	STA	$80
	LDA	|$0018,Y
	STA	$80
	LDA	|$001A,Y
	STA	$80
	LDA	|$001C,Y
	STA	$80
	LDA	|$001E,Y
	STA	$80
	LDA	|$0020,Y
	STA	$80
	LDA	|$0022,Y
	STA	$80
	LDA	|$0024,Y
	STA	$80
	LDA	|$0026,Y
	STA	$80
	LDA	|$0028,Y
	STA	$80
	LDA	|$002A,Y
	STA	$80
	LDA	|$002C,Y
	STA	$80
	LDA	|$002E,Y
	STA	$80
	LDA	|$0030,Y
	STA	$80
	LDA	|$0032,Y
	STA	$80
	LDA	|$0034,Y
	STA	$80
	LDA	|$0036,Y
	STA	$80
	LDA	|$0038,Y
	STA	$80
	LDA	|$003A,Y
	STA	$80
	LDA	|$003C,Y
	STA	$80
	LDA	|$003E,Y
	STA	$80
	LDA	|$0040,Y
	STA	$80
	LDA	|$0042,Y
	STA	$80
	LDA	|$0044,Y
	STA	$80
	LDA	|$0046,Y
	STA	$80
	LDA	|$0048,Y
	STA	$80
	LDA	|$004A,Y
	STA	$80
	LDA	|$004C,Y
	STA	$80
	LDA	|$004E,Y
	STA	$80
	LDA	|$0050,Y
	STA	$80
	LDA	|$0052,Y
	STA	$80
	LDA	|$0054,Y
	STA	$80
	LDA	|$0056,Y
	STA	$80
	LDA	|$0058,Y
	STA	$80
	LDA	|$005A,Y
	STA	$80
	LDA	|$005C,Y
	STA	$80
	LDA	|$005E,Y
	STA	$80
	LDA	|$0060,Y
	STA	$80
	LDA	|$0062,Y
	STA	$80
	LDA	|$0064,Y
	STA	$80
	LDA	|$0066,Y
	STA	$80
	LDA	|$0068,Y
	STA	$80
	LDA	|$006A,Y
	STA	$80
	LDA	|$006C,Y
	STA	$80
	LDA	|$006E,Y
	STA	$80
	LDA	|$0070,Y
	STA	$80
	LDA	|$0072,Y
	STA	$80
	LDA	|$0074,Y
	STA	$80
	LDA	|$0076,Y
	STA	$80
	LDA	|$0078,Y
	STA	$80
	LDA	|$007A,Y
	STA	$80
	LDA	|$007C,Y
	STA	$80
	LDA	|$007E,Y
	STA	$80
	LDA	|$0080,Y
	STA	$80
	LDA	|$0082,Y
	STA	$80
	LDA	|$0084,Y
	STA	$80
	LDA	|$0086,Y
	STA	$80
	LDA	|$0088,Y
	STA	$80
	LDA	|$008A,Y
	STA	$80
	LDA	|$008C,Y
	STA	$80
	LDA	|$008E,Y
	STA	$80
	LDA	|$0090,Y
	STA	$80
	LDA	|$0092,Y
	STA	$80
	LDA	|$0094,Y
	STA	$80
	LDA	|$0096,Y
	STA	$80
	LDA	|$0098,Y
	STA	$80
	LDA	|$009A,Y
	STA	$80
	LDA	|$009C,Y
	STA	$80
	LDA	|$009E,Y
	STA	$80
	LDA	|$00A0,Y
	STA	$80
	LDA	|$00A2,Y
	STA	$80
	LDA	|$00A4,Y
	STA	$80
	LDA	|$00A6,Y
	STA	$80
	LDA	|$00A8,Y
	STA	$80
	LDA	|$00AA,Y
	STA	$80
	LDA	|$00AC,Y
	STA	$80
	LDA	|$00AE,Y
	STA	$80
	LDA	|$00B0,Y
	STA	$80
	LDA	|$00B2,Y
	STA	$80
	LDA	|$00B4,Y
	STA	$80
	LDA	|$00B6,Y
	STA	$80
	LDA	|$00B8,Y
	STA	$80
	LDA	|$00BA,Y
	STA	$80
	LDA	|$00BC,Y
	STA	$80
	LDA	|$00BE,Y
	STA	$80
	LDA	|$00C0,Y
	STA	$80
	LDA	|$00C2,Y
	STA	$80
	LDA	|$00C4,Y
	STA	$80
	LDA	|$00C6,Y
	STA	$80
	LDA	|$00C8,Y
	STA	$80
	LDA	|$00CA,Y
	STA	$80
	LDA	|$00CC,Y
	STA	$80
	LDA	|$00CE,Y
	STA	$80
	LDA	|$00D0,Y
	STA	$80
	LDA	|$00D2,Y
	STA	$80
	LDA	|$00D4,Y
	STA	$80
	LDA	|$00D6,Y
	STA	$80
	LDA	|$00D8,Y
	STA	$80
	LDA	|$00DA,Y
	STA	$80
	LDA	|$00DC,Y
	STA	$80
	LDA	|$00DE,Y
	STA	$80
	LDA	|$00E0,Y
	STA	$80
	LDA	|$00E2,Y
	STA	$80
	LDA	|$00E4,Y
	STA	$80
	LDA	|$00E6,Y
	STA	$80
	LDA	|$00E8,Y
	STA	$80
	LDA	|$00EA,Y
	STA	$80
	LDA	|$00EC,Y
	STA	$80
	LDA	|$00EE,Y
	STA	$80
	LDA	|$00F0,Y
	STA	$80
	LDA	|$00F2,Y
	STA	$80
	LDA	|$00F4,Y
	STA	$80
	LDA	|$00F6,Y
	STA	$80
	LDA	|$00F8,Y
	STA	$80
	LDA	|$00FA,Y
	STA	$80
	LDA	|$00FC,Y
	STA	$80
	LDA	|$00FE,Y
	STA	$80
	LDA	$0100,Y
	STA	$80
	LDA	$0102,Y
	STA	$80
	LDA	$0104,Y
	STA	$80
	LDA	$0106,Y
	STA	$80
	LDA	$0108,Y
	STA	$80
	LDA	$010A,Y
	STA	$80
	LDA	$010C,Y
	STA	$80
	LDA	$010E,Y
	STA	$80
	LDA	$0110,Y
	STA	$80
	LDA	$0112,Y
	STA	$80
	LDA	$0114,Y
	STA	$80
	LDA	$0116,Y
	STA	$80
	LDA	$0118,Y
	STA	$80
	LDA	$011A,Y
	STA	$80
	LDA	$011C,Y
	STA	$80
	LDA	$011E,Y
	STA	$80
	LDA	$0120,Y
	STA	$80
	LDA	$0122,Y
	STA	$80
	LDA	$0124,Y
	STA	$80
	LDA	$0126,Y
	STA	$80
	LDA	$0128,Y
	STA	$80
	LDA	$012A,Y
	STA	$80
	LDA	$012C,Y
	STA	$80
	LDA	$012E,Y
	STA	$80
	LDA	$0130,Y
	STA	$80
	LDA	$0132,Y
	STA	$80
	LDA	$0134,Y
	STA	$80
	LDA	$0136,Y
	STA	$80
	LDA	$0138,Y
	STA	$80
	LDA	$013A,Y
	STA	$80
	LDA	$013C,Y
	STA	$80
	LDA	$013E,Y
	STA	$80
	LDA	$0140,Y
	STA	$80
	LDA	$0142,Y
	STA	$80
	LDA	$0144,Y
	STA	$80
	LDA	$0146,Y
	STA	$80
	LDA	$0148,Y
	STA	$80
	LDA	$014A,Y
	STA	$80
	LDA	$014C,Y
	STA	$80
	LDA	$014E,Y
	STA	$80
	LDA	$0150,Y
	STA	$80
	LDA	$0152,Y
	STA	$80
	LDA	$0154,Y
	STA	$80
	LDA	$0156,Y
	STA	$80
	LDA	$0158,Y
	STA	$80
	LDA	$015A,Y
	STA	$80
	LDA	$015C,Y
	STA	$80
	LDA	$015E,Y
	STA	$80
	LDA	$0160,Y
	STA	$80
	LDA	$0162,Y
	STA	$80
	LDA	$0164,Y
	STA	$80
	LDA	$0166,Y
	STA	$80
	LDA	$0168,Y
	STA	$80
	LDA	$016A,Y
	STA	$80
	LDA	$016C,Y
	STA	$80
	LDA	$016E,Y
	STA	$80
	LDA	$0170,Y
	STA	$80
	LDA	$0172,Y
	STA	$80
	LDA	$0174,Y
	STA	$80
	LDA	$0176,Y
	STA	$80
	LDA	$0178,Y
	STA	$80
	LDA	$017A,Y
	STA	$80
	LDA	$017C,Y
	STA	$80
	LDA	$017E,Y
	STA	$80
	LDA	$0180,Y
	STA	$80
	LDA	$0182,Y
	STA	$80
	LDA	$0184,Y
	STA	$80
	LDA	$0186,Y
	STA	$80
	LDA	$0188,Y
	STA	$80
	LDA	$018A,Y
	STA	$80
	LDA	$018C,Y
	STA	$80
	LDA	$018E,Y
	STA	$80
	LDA	$0190,Y
	STA	$80
	LDA	$0192,Y
	STA	$80
	LDA	$0194,Y
	STA	$80
	LDA	$0196,Y
	STA	$80
	LDA	$0198,Y
	STA	$80
	LDA	$019A,Y
	STA	$80
	LDA	$019C,Y
	STA	$80
	LDA	$019E,Y
	STA	$80
	LDA	$01A0,Y
	STA	$80
	LDA	$01A2,Y
	STA	$80
	LDA	$01A4,Y
	STA	$80
	LDA	$01A6,Y
	STA	$80
	LDA	$01A8,Y
	STA	$80
	LDA	$01AA,Y
	STA	$80
	LDA	$01AC,Y
	STA	$80
	LDA	$01AE,Y
	STA	$80
	LDA	$01B0,Y
	STA	$80
	LDA	$01B2,Y
	STA	$80
	LDA	$01B4,Y
	STA	$80
	LDA	$01B6,Y
	STA	$80
	LDA	$01B8,Y
	STA	$80
	LDA	$01BA,Y
	STA	$80
	LDA	$01BC,Y
	STA	$80
	LDA	$01BE,Y
	STA	$80
	LDA	$01C0,Y
	STA	$80
	LDA	$01C2,Y
	STA	$80
	LDA	$01C4,Y
	STA	$80
	LDA	$01C6,Y
	STA	$80
	LDA	$01C8,Y
	STA	$80
	LDA	$01CA,Y
	STA	$80
	LDA	$01CC,Y
	STA	$80
	LDA	$01CE,Y
	STA	$80
	LDA	$01D0,Y
	STA	$80
	LDA	$01D2,Y
	STA	$80
	LDA	$01D4,Y
	STA	$80
	LDA	$01D6,Y
	STA	$80
	LDA	$01D8,Y
	STA	$80
	LDA	$01DA,Y
	STA	$80
	LDA	$01DC,Y
	STA	$80
	LDA	$01DE,Y
	STA	$80
	LDA	$01E0,Y
	STA	$80
	LDA	$01E2,Y
	STA	$80
	LDA	$01E4,Y
	STA	$80
	LDA	$01E6,Y
	STA	$80
	LDA	$01E8,Y
	STA	$80
	LDA	$01EA,Y
	STA	$80
	LDA	$01EC,Y
	STA	$80
	LDA	$01EE,Y
	STA	$80
	LDA	$01F0,Y
	STA	$80
	LDA	$01F2,Y
	STA	$80
	LDA	$01F4,Y
	STA	$80
	LDA	$01F6,Y
	STA	$80
	LDA	$01F8,Y
	STA	$80
	LDA	$01FA,Y
	STA	$80
	LDA	$01FC,Y
	STA	$80
	LDA	$01FE,Y
	STA	$80
	PLD
	SEP	#$30
	PLB
L1EE6	LDAL	RDBANK1
	BPL	L1EE6
L1EEC	LDAL	$00C08F
	BMI	L1EEC
	JMP	L0BBA
