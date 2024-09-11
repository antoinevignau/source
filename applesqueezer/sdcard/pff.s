*
* Petit FAT File System Module: pff
*
* (c) 2014, ChaN
* (v) 2024, Brutal Deluxe Software
* Visit brutaldeluxe.fr
*

	mx	%00

*-------------------------------
* EQUATES
*-------------------------------

PF_USE_READ	=	1
PF_USE_DIR	=	0
PF_USE_LSEEK	=	0
PF_USE_WRITE	=	0

PF_FS_FAT12	=	1
PF_FS_FAT16	=	1
PF_FS_FAT32	=	1

PF_USE_LCC	=	0

FR_OK	=	0
FR_DISK_ERR	=	1
FR_NOT_READY	=	2
FR_NO_FILE	=	3
FR_NOT_OPENED	=	4
FR_NOT_ENABLED	=	5
FR_NO_FILESYSTEM =	6

FA_OPENED	=	$01
FA_WPRT	=	$02
FA_WIP	=	$40

FS_FAT12	=	1
FS_FAT16	=	2
FS_FAT32	=	3

AM_RDO	=	$01
AM_HID	=	$02
AM_SYS	=	$04
AM_VOL	=	$08
AM_LFN	=	$0F
AM_DIR	=	$10
AM_ARC	=	$20
AM_MASK	=	$3F

*--------------

BS_jmpBoot	=	0
BS_OEMName	=	3
BPB_BytsPerSec	=	11
BPB_SecPerClus	=	13
BPB_RsvdSecCnt	=	14
BPB_NumFATs	=	16
BPB_RootEntCnt	=	17
BPB_TotSec16	=	19
BPB_Media	=	21
BPB_FATSz16	=	22
BPB_SecPerTrk	=	24
BPB_NumHeads	=	26
BPB_HiddSec	=	28
BPB_TotSec32	=	32
BS_55AA	=	510

BS_DrvNum	=	36
BS_BootSig	=	38
BS_VolID	=	39
BS_VolLab	=	43
BS_FilSysType	=	54

BPB_FATSz32	=	36
BPB_ExtFlags	=	40
BPB_FSVer	=	42
BPB_RootClus	=	44
BPB_FSInfo	=	48
BPB_BkBootSec	=	50
BS_DrvNum32	=	64
BS_BootSig32	=	66
BS_VolID32	=	67
BS_VolLab32	=	71
BS_FilSysType32	=	82

MBR_Table	=	446

DIR_Name	=	0
DIR_Attr	=	11
DIR_NTres	=	12
DIR_CrtTime	=	14
DIR_CrtDate	=	16
DIR_FstClusHI	=	20
DIR_WrtTime	=	22
DIR_WrtDate	=	24
DIR_FstClusLO	=	26
DIR_FileSize	=	28

*-------------------------------
* Check File System
*-------------------------------
* 0: The FAT boot record
* 1: Valid boot record but not a FAT
* 2: Not a boot record
* 3: Error

check_fs	lda	buff+BS_55AA	; check record signature
	cmp	#$aa55
	beq	cfs_1
	
	lda	#2
	sec
	rts

cfs_1	lda	buff+BS_FilSysType	; check FAT12/16
	cmp	#$4146
	beq	cfs_ok

	lda	buff+BS_FilSysType32	; check FAT32
	cmp	#$4146
	bne	cfs_2

cfs_ok	lda	#0
	clc
	rts

cfs_2	lda	#1
	sec
	rts

*-------------------------------
* Mount/Unmount a logical drive
*-------------------------------

pf_mount	ldal	SD_CARD_INSERTED
	and	#$ff
	cmp	#1	; disk inserted?
	beq	pfm_1
	
	lda	#FR_NOT_READY
	sec
	rts

pfm_1	ldx	#0	; read MBR
	ldy	#0
	jsr	disk_read
	bcc	pfm_2

	lda	#FR_DISK_ERR
	sec
	rts

pfm_2	jsr	check_fs
	sta	fmt
	
* if (fmt == 1)

	cmp	#1
	bne	pfm_next
	
	lda	buff+MBR_Table+4	; is the partition existing?
	and	#$ff
	beq	pfm_next

	ldx	buff+MBR_Table+10	; partition offset in LBA
	ldy	buff+MBR_Table+8
	jsr	disk_read
	bcc	pfm_3

	lda	#3
	bra	pfm_4
	
pfm_3	jsr	check_fs
pfm_4	sta	fmt
	
*---

pfm_next	lda	fmt
	beq	pfm_next_ok
	
	ldx	#FR_DISK_ERR	; no valid FAT partition is found
	cmp	#3
	beq	pfm_next_err
	ldx	#FR_NO_FILESYSTEM
pfm_next_err	txa
	sec
	rts

*--- Initialize the file system object

pfm_next_ok	clc
	rts

*-------------- Data

fmt	ds	2
sector	ds	4
bsect	ds	4
fsize	ds	4
tsect	ds	4
mclst	ds	4

*-------------------------------
* Open a file
*-------------------------------

pf_open
	rts

*-------------------------------
* Read data from the open file
*-------------------------------

pf_read
	rts

*-------------------------------
* Write data to the open file
*-------------------------------

pf_write
	rts

*-------------------------------
* Move the pointer of the open file
*-------------------------------

pf_lseek
	rts

*-------------------------------
* Open a directory
*-------------------------------

pf_opendir
	rts

*-------------------------------
* Read a directory item from the open directory
*-------------------------------

pf_readdir
	rts

*-------------------------------
* DATA
*-------------------------------

buff	ds	SIZE_SECTOR
