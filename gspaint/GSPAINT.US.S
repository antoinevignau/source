*
* GS/Paint
* version 1.2
*
* (c) 1986-1987, Version Soft
* (s) 2020, Brutal Deluxe Software
*
	 
*-------------------------------

L01012B  ENT
         ASC   '>L@\XN1'0D
         ASC   ' LAbout'
         ASC   "I"
         ASC   '\N256'0D
         ASC   ' LHelp'
         ASC   "I"
         ASC   '\VN257'0D
L010155  ENT
         ASC   '>L File \N2'0D
         ASC   ' LNew\*NnN258'0D
         ASC   ' LOpen'
         ASC   "I"
         ASC   '\*OoN259'0D
         ASC   ' LClose\N260'0D
         ASC   ' LSave'
         ASC   "I"
         ASC   '\*EeN261'0D
         ASC   ' LSave as'
         ASC   "I"
         ASC   '\N262'0D
         ASC   ' LRevert to saved'
         ASC   "I"
         ASC   '\VN263'0D
         ASC   ' LPrinter type'
         ASC   "I"
         ASC   '\N264'0D
         ASC   ' LPrint setup'
         ASC   "I"
         ASC   '\N265'0D
         ASC   ' LPrint'
         ASC   "I"
         ASC   '\V*IiN266'0D
         ASC   ' LQuit\*QqN267'0D
L01023E  ENT
         ASC   '>L Edit \N3'0D
         ASC   ' LCancel\V*ZzN268'0D
         ASC   ' LCut\*XxDN269'0D
         ASC   ' LCopy\*CcDN270'0D
         ASC   ' LPaste\*VvDN271'0D
         ASC   ' LClear\VDN272'0D
         ASC   ' LInvert\DN273'0D
         ASC   ' LHorizontal flip\DN274'0D
         ASC   ' LVertical flip\DN275'0D
         ASC   ' LRotate\DN276'0D
L0102FE  ENT
         ASC   '>L Tools \N4'0D
         ASC   ' LGrid\N277'0D
         ASC   ' LMagnify\N278'0D
         ASC   ' LFull page\N279'0D
         ASC   ' LFull screen\N280'0D
         ASC   ' LPencils'
         ASC   "I"
         ASC   '\N281'0D
         ASC   ' LMirrors'
         ASC   "I"
         ASC   '\N282'0D
         ASC   ' LEdit pattern'
         ASC   "I"
         ASC   '\DVN283'0D
         ASC   ' LCompress'
         ASC   "I"
         ASC   '\DN284'0D
         ASC   ' LAnimate'
         ASC   "I"
         ASC   '\DN285'0D
L0103A8  ENT
         ASC   '>L Color \N5'0D
         ASC   ' LFind\N286'0D
         ASC   ' LFree\VN287'0D
         ASC   ' LEdit palette'
         ASC   "I"
         ASC   '\N288'0D
         ASC   ' LChange palette'
         ASC   "I"
         ASC   '\N289'0D
L010405  ENT
         ASC   '>L Text \N6'0D
         ASC   ' LFont'
         ASC   "I"
         ASC   '\VN290'0D
         ASC   ' LLeft justify\C'12
         ASC   '*Gg\N291'0D
         ASC   ' LCenter\*TtN292'0D
         ASC   ' LRight justify\*DdN293'0D
         ASC   '.'

L01046F  ENT
         STR   'OK'
L010472  ENT
         STR   'Cancel'
L01047A  STR   'Yes'
L01047E  STR   'No'
L010482  ENT
         STR   'None'
L010488  STR   'Drive'
L010490  STR   'Close'
L010497  STR   'closing'
L01049E  STR   'Open'
L0104A5  STR   'Save'
L0104AC  STR   'Free : ^0/^1 K'0D
L0104BD  STR   'Folder'
L0104C5  STR   'quitting'
L0104CD  DW    $0004
L0104CF  DW    $0005
L0104D1  DW    $001C
L0104D3  DW    $00FA
L0104D5  STR   'Do you want to save changes'0D'before ^0 ?'
L01050F  DW    $000A
L010511  DW    $0005
L010513  DW    $001E
L010515  DW    $00FA
L010517  STR   'Do you want to revert to the saved version ?'0D
L010550  STR   'Insert system disk'
L01056A  STR   'Insert program disk'
L010586  STR   'Cannot print.'
L01059D  DW    $0014
L01059F  DW    $000A
L0105A1  DW    $0022
L0105A3  DW    $00FA
L0105A5  STR   'GS/Paint will not cancel!'
L0105C5  STR   'Do you have a color ribbon?'
L0105E2  STR   'Save as:'
L0105F5  STR   'Open:'
L0105FE  STR   ' Screen format'
L01060C  STR   ' Paint format '
L01061A  STR   ' Apple format '
L010629  STR   'I/O Error No $^0'0D
L01063C  STR   'Memory Error No $^0'0D
L010653  STR   'Error No $^0'0D
L010662  STR   'System Error No $'
L010676  ENT
         STR   'Untitled'
L010681  ENT
         STR   'Tempo: '
L01068A  ENT
         STR   'Select one image: '
L0106A9  ENT
         STR   'Save animation:'
L0106BE  ENT
         STR   'Play animation:'
L0106D3  STR   'Ecran0'
L0106DA  ENT
         STR   'Recuperation'

L0106E7  STR   '?'
L0106E9  STR   'GS/Paint V1.2'
L0106F7  STR   'by'
L0106FB  STR   'H. Lamiraux'
L010707  STR   'and'
L01070A  STR   'B. Gallet, L. Barthelet'
L010722  STR   'R. Danais, S. Cavril'
L010737  STR   'Copyright 1986, Version Soft.'

L010755  STR   'Disk is read only.'
L010771  STR   'File not found.'
L010785  STR   'Duplicate file name.'
L01079F  STR   'Volume full.'
L0107AD  STR   'Catalog full.'
L0107BE  STR   'Reserved access.'
L0107CD  STR   'Not enough memory.'
