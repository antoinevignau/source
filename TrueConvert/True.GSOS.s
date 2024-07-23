*
* TrueConvert : GS/OS Module
*
* (c) Brutal Deluxe, 1997

*----------------------------------------

GSOSversion jsl proDOS
 dw $202a
 adrl proVERS

 lda proVERS+2
 and #%01111111_11111111
 cmp #$0400
 rts

*----------------------------------------

GSOSgetOPEN jsl proDOS
 dw $200a
 adrl proGETopen
 rts

GSOSsetOPEN jsl proDOS
 dw $2009
 adrl proSETopen
 rts

GSOSgetSAVE jsl proDOS
 dw $200a
 adrl proGETsave
 rts

GSOSsetSAVE jsl proDOS
 dw $2009
 adrl proSETsave
 rts

*----------------------------------------

*GSOSgetName lda replyPTR+$10
* sta Debut
* lda replyPTR+$12
* sta Debut+2
*
* lda [Debut]
* clc
* adc #2
* sta proCREATE+2
* sta proDESTROY+2
* sta proSETINFO+2
* sta proOPEN+4
*
* ldy #2
* lda [Debut],y
* adc #0
* sta proCREATE+4
* sta proDESTROY+4
* sta proSETINFO+4
* sta proOPEN+6
* rts

GSOSgetName lda #pathPTR1
 sta proCREATE+2
 sta proDESTROY+2
 sta proSETINFO+2
 sta proOPEN+4

 lda #^pathPTR1
 sta proCREATE+4
 sta proDESTROY+4
 sta proSETINFO+4
 sta proOPEN+6

 rts

*----------------------------------------

GSOSopen jsl proDOS
 dw $2010
 adrl proOPEN
 bcs GSOSopen1

 lda proOPEN+2
 sta proSETMARK+2
 sta proREAD+2
 sta proCLOSE+2

 lda proEOF
 sta proREAD+8
 lda proEOF+2
 sta proREAD+10

 clc
 rts
GSOSopen1 sta proERR
 sec
 rts

*----------------------------------------

GSOSsetread sty proREAD+4
 stx proREAD+6
 rts

GSOSread sty proREAD+8
 stx proREAD+10

 jsl proDOS
 dw $2012
 adrl proREAD
 rts

*----------------------------------------

GSOSsetwrite sty proWRITE+4
 stx proWRITE+6
 rts

GSOSwrite sty proWRITE+8
 stx proWRITE+10

 jsl proDOS
 dw $2013
 adrl proWRITE
 rts

*----------------------------------------

GSOSclose jsl proDOS
 dw $2014
 adrl proCLOSE
 rts

*----------------------------------------

GSOSappend sty proSETMARK+6
 stx proSETMARK+8

 jsl proDOS
 dw $2016
 adrl proSETMARK
 rts

*----------------------------------------

GSOScreate stx proCREATE+18
 sty proCREATE+16
 sta proCREATE+8
 sta proSETINFO+8

 jsl proDOS
 dw $2005
 adrl proSETINFO

 jsl proDOS
 dw $2002
 adrl proDESTROY

 jsl proDOS
 dw $2001
 adrl proCREATE
 bcs GSOSsave1

 jsl proDOS
 dw $2010
 adrl proOPEN
 bcs GSOSsave1

 lda proOPEN+2
 sta proSETMARK+2
 sta proWRITE+2
 sta proCLOSE+2

 clc
 rts
GSOSsave1 sta proERR
 sec
 rts

*----------------------------------------

*proERR ds 2

proGETDIR dw 17 ; pcount
 ds 2 ; ref_num
 ds 2 ; flags
 dw 1 ; base
 dw 1 ; displacement
 adrl proGETname ; name_buffer
 ds 2 ; entry_num
 ds 2 ; file_type
 ds 4 ; eof
 ds 4 ; block_count
 ds 8 ; create_td
 ds 8 ; modify_td
 ds 2 ; access
 ds 4 ; aux_type
 ds 2 ; file_sys_id
 ds 4 ; option_list
 ds 4 ; res_eof
 ds 4 ; res_block_count

proCREATE dw 7 ; pcount
 ds 4 ; pathname
 dw $e3 ; access_code
 ds 2 ; file_type
 ds 4 ; aux_type
 ds 2 ; storage_type
 ds 4 ; eof
 ds 4 ; resource_eof

proDESTROY dw 1 ; pcount
 ds 4 ; pathname

proSETINFO dw 12 ; pcount
 ds 4 ; pathname
 dw $e3 ; access_code
 ds 2 ; file_type
 ds 4 ; aux_type
 ds 2 ; reserved
 ds 8 ; create_td
 ds 8 ; modify_td
 ds 4 ; option_list
 ds 4 ; reserved
 ds 4 ; reserved
 ds 4 ; reserved
 ds 4 ; reserved

proOPEN dw 15 ; pcount
 ds 2 ; ref_num
 ds 4 ; pathname
 ds 2 ; request_access
 ds 2 ; resource_num
 ds 2 ; access
 ds 2 ; file_type
 ds 4 ; aux_type
 ds 2 ; storage_type
 ds 8 ; create_td
 ds 8 ; modify_td
 ds 4 ; option_list
proEOF ds 4 ; eof
 ds 4 ; blocks_used
 ds 4 ; resource_eof
 ds 4 ; resource_blocks

proREAD dw 5 ; +00 pcount
 ds 2 ; +02 ref_num
 ds 4 ; +04 data_buffer
 ds 4 ; +08 request_count
 ds 4 ; +12 transfer_count
 dw 1 ; +16 cache_priority

proWRITE dw 5 ; pcount
 ds 2 ; ref_num
 ds 4 ; data_buffer
 ds 4 ; request_count
 ds 4 ; transfer_count
 dw 1 ; cache_priority

proCLOSE dw 1 ; pcount
 ds 2 ; ref_num

proSETMARK dw 3 ; pcount
 ds 2 ; ref_num
 ds 2 ; base
 ds 4 ; displacement

proQUIT dw 2 ; pcount
 ds 4 ; pathname
 ds 2 ; flags

proVERS dw 1 ; pcount
 ds 2 ; version

*----------------------------------------

proGETopen dw 2
 dw 8
 adrl pfxOPEN

proSETopen dw 2
 dw 8
 adrl pfxOPEN2

proGETsave dw 2
 dw 8
 adrl pfxSAVE

proSETsave dw 2
 dw 8
 adrl pfxSAVE2

*---

pfxOPEN dw 256
pfxOPEN2 ds 2
pfxOPEN3 ds 254

pfxSAVE dw 256
pfxSAVE2 ds 2
pfxSAVE3 ds 254

proGETname dw 256
proGETname2 ds 2
proGETname3 ds 254
