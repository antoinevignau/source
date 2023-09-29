
* TFBD generated equates
*    (c) PHC 1992,93


DEV_DISPATCHER  EQU   $01FC00
ALLOC_SEG       EQU   $01FC1C
RELEASE_SEG     EQU   $01FC20
ALLOC_VCR       EQU   $01FC24
RELEASE_VCR     EQU   $01FC28
ALLOC_FCR       EQU   $01FC2C
RELEASE_FCR     EQU   $01FC30
SWAP_OUT        EQU   $01FC34
DEREF           EQU   $01FC38
GET_SYS_GBUF    EQU   $01FC3C
SYS_EXIT        EQU   $01FC40
SYS_DEATH       EQU   $01FC44
FIND_VCR        EQU   $01FC48
CACHE_LOCK      EQU   $01FC54
GET_VCR         EQU   $01FC60
GET_FCR         EQU   $01FC64
LOCK_MEM        EQU   $01FC68
UNLOCK_MEM      EQU   $01FC6C
MOVE_INFO       EQU   $01FC70
REPORT_ERROR    EQU   $01FC94
MOUNT_MESSAGE   EQU   $01FC98
POST_OS_EVENT   EQU   $01FCC4

WARM_COLD_START EQU   $E101D0

* Direct Page usage

fst_start	=	$80
my_dp	=	fst_start
my_pblk_ptr	=	my_dp		; 80
my_vcr_ptr	=	my_pblk_ptr+4	; 84
msdos_vcr_ptr =	my_vcr_ptr+4	; 88
my_fcr_ptr	=	msdos_vcr_ptr+4	; 8C
msdos_fcr_ptr =	my_fcr_ptr+4	; 90
gbuf_ptr	=	msdos_fcr_ptr+4	; 94
temp_ptr	=	gbuf_ptr+4		; 98
temp2_ptr	=	temp_ptr+4		; 9C
temp3_ptr	=	temp2_ptr+4		; A0
temp4_ptr	=	temp3_ptr+4		; A4
map_ptr	=	temp4_ptr+4		; A8
math_temp	=	map_ptr+4		; AC
data_ptr	=	math_temp+4		; B0
index_ptr	=	data_ptr+4		; B4
master_ptr	=	index_ptr+4		; B8
fat_ptr	=	master_ptr+4	; BC
users_buf_ptr =	fat_ptr+4		; C0
newline_ptr	=	users_buf_ptr+4	; C4
namebuf_vp	=	newline_ptr+4	; C8
namebuf_ptr	=	namebuf_vp+4	; CC
dp_end	=	namebuf_ptr+4	; D0

* file attributes
archive	=	%00100000
subdirectory =	%00010000
vol_label	=	%00001000
sys_file	=	%00000100
hidden_file	=	%00000010
read_only	=	%00000001

file_type_index	=	$10	; look at page 168 (ProDOS 8 manual)
key_blk_index	=	$11	; index into disk entry
blks_used_index	=	$13
eof_index		=	$15
create_index	=	$18
version_index	=	$1C
min_version		=	$1D
access_index	=	$1E
aux_type_index	=	$1F
last_mod_index	=	$21
header_ptr_index 	=	$25

blk_size	=	512	; standard size of a sector
delimiter	=	$3a	; pathname delimiter = ":"
min_send_cnt =	$21	; If read < 33 bytes use local routine

prodos_version =	$0005	; current version of the PRODOS.
path1_mask	=	$4000	; used to determine if path1 is avail.
path2_mask	=	$0040	; used to determine if path2 is avail.
max_span	=	12	; maximum length of filename:
			; 8 char name + 3 char extension + .
