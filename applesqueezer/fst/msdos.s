*
* MS-DOS FST
*
* (c) 1992, Apple Computer, Inc.
* (s) 2023, Brutal Deluxe Software
*

	mx	%00
	rel
	lst	off

	use	msdos.e
	
*-------------------------------------------

	use	4/Int.Macs
	use	4/Util.Macs
	
*-------------------------------------------
	
                 ASC   'FST '               ; FST signature
                 ADRL  appl_call            ; call handler entry point
                 ADRL  system_call          ; GS/OS internal entry point?
                 DW    $000A                ; file system ID
fst_attr         DW    $8802                ; attributes
                 DW    $0100                ; version
                 DW    $0200                ; block size
                 ADRL  $00010000            ; max volume size (blocks)
                 ADRL  $00000004
                 ADRL  $FFFFFFFF            ; max file size (bytes)
                 ADRL  $00000000
                 STR   'MS-DOS'             ; FST name
                 STR   'MS-DOS FST            v01.00'
                 DW    $0000
                 STR   'MS-DOS FST written by Greg Branche V1.00'

appl_call        PHK
                 PLB
                 REP   #$30
                 CPX   #$0067
                 BCS   cmd_error
                 JMP   (cmd_tbl-2,X)

cmd_error        LDA   #$0001
error_exit       SEC
main_exit        PHA
                 PHP
                 BCC   L00A9
                 LDA   cp_device_flag
                 BPL   L00A9
                 LDX   #fake_name_str
                 LDY   #^fake_name_str
                 LDA   #$0000
                 JSL   FIND_VCR
                 BCS   L00A9
                 JSL   DEREF
                 STX   temp_ptr
                 STY   temp_ptr+2
                 LDA   [temp_ptr]
                 JSL   RELEASE_VCR
L00A9            JSL   UNLOCK_MEM
                 PLP
                 PHP
                 BCC   no_damage
                 LDA   $02,S
                 AND   #$00FF
                 CMP   #$002D
                 BEQ   mark_damaged
                 CMP   #$005A
                 BEQ   mark_damaged
                 CMP   #$0051
                 BNE   no_damage
mark_damaged     LDA   msdos_vcr_ptr
                 ORA   msdos_vcr_ptr+2
                 BEQ   no_damage
                 LDY   #$001F
                 LDA   [msdos_vcr_ptr],Y
                 INC
                 BEQ   no_damage
                 LDA   #$FFFF
                 STA   [msdos_vcr_ptr],Y
                 LDA   $01,S
                 JSR   show_damage
no_damage        LDA   msdos_fcr_ptr
                 ORA   msdos_fcr_ptr+2
                 BEQ   no_fcr
                 LDA   flags
                 AND   #$0400
                 BEQ   no_fcr
                 LDY   #$0012
                 LDA   [msdos_fcr_ptr],Y
                 AND   #$8000
                 EOR   #$8000
                 STA   math_temp
                 LDY   #$0014
                 LDA   [my_fcr_ptr],Y
                 AND   #$7FFF
                 ORA   math_temp
                 STA   [my_fcr_ptr],Y
                 LDA   chk_dirty_flag
                 BEQ   no_fcr
                 LDA   dirty_flags
                 BNE   no_fcr
                 LDY   #$0012
                 LDA   [msdos_fcr_ptr],Y
                 AND   #$8007
                 BEQ   no_fcr
                 LDY   #$0017
                 LDA   [msdos_vcr_ptr],Y
                 INC
                 STA   [msdos_vcr_ptr],Y
no_fcr           LDA   write_occurred
                 BEQ   no_write
                 LDA   $30
                 PHA
                 LDX   write_dev_num
                 PHX
                 PHY
                 LDA   #$0040
                 LDX   #$0000
                 JSL   POST_OS_EVENT
no_write         PLP
                 PLA
                 ORA   error_priority
                 JMPL  SYS_EXIT

write_protect    JSR   process_path
                 BCS   exit
wp_error         LDA   #$002B
exit2            SEC
exit             JMP   main_exit

invalid_op       LDA   #$0065
                 BRA   exit2
system_call      PHK
                 PLB
                 CPX   #$0009
                 BCS   sys_err
                 JMP   (sys_tbl-2,X)

sys_err          LDA   #$0001
                 RTL

cmd_tbl          DA    create
                 DA    write_protect
                 DA    cmd_error
                 DA    write_protect
                 DA    write_protect
                 DA    get_file_info
                 DA    invalid_op
                 DA    volume
                 DA    cmd_error
                 DA    cmd_error
                 DA    write_protect
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    open
                 DA    cmd_error
                 DA    read
                 DA    wp_error
                 DA    close
                 DA    flush
                 DA    set_mark
                 DA    get_mark
                 DA    wp_error
                 DA    get_eof
                 DA    cmd_error
                 DA    cmd_error
                 DA    get_dir_entry
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    get_dev_num
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    wp_error
                 DA    wp_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    cmd_error
                 DA    fst_specific

sys_tbl          DA    startup
                 DA    shutdown
                 DA    sys_remove_vol
                 DA    deferred_flush

startup          JSL   GET_SYS_GBUF
                 STX   gbuf_addr
                 STY   gbuf_addr+2
                 LDA   default_map
                 JSL   ALLOC_SEG
                 LDA   #$0054
                 BCS   L0202
                 STX   map_buffer_vp
                 STY   map_buffer_vp+2
                 JSL   DEREF
                 STX   temp_ptr
                 STY   temp_ptr+2
                 SEP   #$20
                 LDY   default_map
L01F6            DEY
                 BMI   L0200
                 LDA   default_map,Y
                 STA   [temp_ptr],Y
                 BRA   L01F6
L0200            REP   #$21
L0202            RTL

chk_dirty_flag   DW    $0000

volume           JSR   setup_params
                 LDA   $36
                 JSR   id_disk
                 BCC   its_my_puppy
vol_exit         BRL   main_exit
its_my_puppy     LDY   #$0004
                 LDA   [my_pblk_ptr],Y
                 STA   temp_ptr
                 INY
                 INY
                 LDA   [my_pblk_ptr],Y
                 STA   temp_ptr+2
                 STZ   case_bits
                 BIT   fst_attr
                 BPL   L022D
                 LDA   #$FFDF
                 STA   case_bits
L022D            LDA   pcount
                 BNE   L025E
                 LDA   gstring
                 INC
                 STA   [temp_ptr]
                 INC   temp_ptr
                 BNE   L023E
                 INC   temp_ptr+2
L023E            LDY   #$0001
                 SEP   #$20
                 LDA   #$2F
                 STA   [temp_ptr]
L0247            LDA   gstring+1,Y
                 STA   [temp_ptr],Y
                 CPY   gstring
                 BEQ   L0254
                 INY
                 BRA   L0247
L0254            REP   #$20
                 LDA   #$0003
                 STA   pcount
                 BRA   do_bitmap
L025E            LDA   gstring
                 TAX
                 INC
                 STA   math_temp
                 SEC
                 LDA   [temp_ptr]
                 SBC   #$0004
                 BMI   too_small
                 CMP   math_temp
                 BEQ   size_ok
                 BCS   size_ok
                 LDY   #$0002
                 LDA   math_temp
                 STA   [temp_ptr],Y
too_small        SEC
                 LDA   #$004F
                 BRL   vol_exit

size_ok          LDY   #$0002
                 LDA   math_temp
                 STA   [temp_ptr],Y
                 INY
                 INY
                 LDA   #$3A3A
                 STA   [temp_ptr],Y
                 PHX
                 TYA
                 CLC
                 ADC   temp_ptr
                 STA   temp_ptr
                 LDA   #$0000
                 ADC   temp_ptr+2
                 STA   temp_ptr+2
                 PLY
                 STY   math_temp
                 LDY   #$0001
                 SEP   #$20
L02A5            LDA   gstring+1,Y
                 STA   [temp_ptr],Y
                 CPY   math_temp
                 BEQ   L02B1
                 INY
                 BRA   L02A5
L02B1            REP   #$20
                 DEC   pcount
                 DEC   pcount

do_bitmap        DEC   pcount
                 BPL   send_tot_blks
end_volume       CLC
backup2          BRL   vol_exit

send_tot_blks    LDY   #$0008
                 LDA   [msdos_vcr_ptr],Y
                 LDY   #$0008
                 STA   [my_pblk_ptr],Y
                 INY
                 INY
                 LDA   #$0000
                 STA   [my_pblk_ptr],Y
                 DEC   pcount
                 BMI   end_volume
                 JSR   calc_free_blks
                 BCS   backup2
                 LDY   #$000C
                 STA   [my_pblk_ptr],Y
                 INY
                 INY
                 LDA   #$0000
                 STA   [my_pblk_ptr],Y
                 DEC   pcount
                 BMI   end_volume
                 LDA   #$000A
                 LDY   #$0010
                 STA   [my_pblk_ptr],Y
                 DEC   pcount
                 BMI   end_volume
                 LDA   #$0200
                 LDY   #$0012
                 STA   [my_pblk_ptr],Y
                 BRA   end_volume

error_priority   DW    $0000

deferred_flush   JSR   save_def
                 JSR   standard_req
                 LDA   #$0200
                 STA   $14
                 LDX   $3E
                 LDY   $40
                 STX   my_vcr_ptr
                 STY   my_vcr_ptr+2
                 JSR   setup_my_vcr
                 LDA   #$8001
                 STA   $16
                 JSR   mount_volume
                 BCS   L0331
                 LDA   [my_vcr_ptr]
                 STA   $18
                 JSL   CACHE_LOCK
                 BCC   L0331
L0331            JSR   restore_def
                 CLC
                 RTL

save_def         PHP
                 PHY
                 PHX
                 PHA
                 LDX   #$004A
L033D            LDA   $00,X
                 STA   def_dir_page,X
                 DEX
                 BPL   L033D
                 LDX   #$0052
L0348            LDA   fst_start,X
                 STA   def_my_direct,X
                 DEX
                 BPL   L0348
                 LDX   #$0013
L0353            LDA   volume_name,X
                 STA   def_vol_name,X
                 DEX
                 BPL   L0353
                 BRA   L0384
restore_def      PHP
                 PHY
                 PHX
                 PHA
                 LDX   #$004A
L0365            LDA   def_dir_page,X
                 STA   $00,X
                 DEX
                 BPL   L0365
                 LDX   #$0052
L0370            LDA   def_my_direct,X
                 STA   fst_start,X
                 DEX
                 BPL   L0370
                 LDX   #$0013
L037B            LDA   def_vol_name,X
                 STA   volume_name,X
                 DEX
                 BPL   L037B
L0384            PLA
                 PLX
                 PLY
                 PLP
                 RTS

read             LDA   #$0002
                 STA   $02
                 JSR   setup_params
                 JSR   read_write_setup
                 STZ   newline_len
                 LDY   #$0012
                 LDA   [my_fcr_ptr],Y
                 STA   newline_mask
                 BEQ   L03BE
                 LDY   #$0010
                 LDA   [my_fcr_ptr],Y
                 STA   newline_len
                 BEQ   L03BE
                 LDY   #$000C
                 LDA   [my_fcr_ptr],Y
                 TAX
                 INY
                 INY
                 LDA   [my_fcr_ptr],Y
                 TAY
                 JSL   DEREF
                 STX   newline_ptr
                 STY   newline_ptr+2
L03BE            LDY   #$000C
                 LDA   [my_vcr_ptr],Y
                 STA   $00
                 LDY   #$0014
                 LDA   [my_fcr_ptr],Y
                 AND   #$3FFF
                 CMP   #$0002
                 BNE   i_can_read
                 LDA   #$004E
L03D5            SEC
                 BRL   main_exit

i_can_read       JSR   setup_curr_mark
                 JSR   setup_curr_eof
                 LDA   curr_mark+2
                 CMP   curr_eof+2
                 BCC   L03F4
                 LDA   curr_mark
                 CMP   curr_eof
                 BNE   L03F4
                 LDA   #$004C
                 BRA   L03D5
L03F4            LDY   #$001C
                 LDA   [msdos_fcr_ptr],Y
                 CMP   #$00D0
                 BCC   allow_read
                 LDA   #$004B
                 BRA   L03D5
allow_read       JSR   chk_swapped
                 BCC   disk_online
                 BRL   main_exit
disk_online      LDA   $00
                 LDY   #$000C
                 STA   [my_vcr_ptr],Y
                 LDY   #$0006
                 LDA   [my_vcr_ptr],Y
                 AND   #$BFFF
                 STA   [my_vcr_ptr],Y
                 LDA   curr_mark
                 ADC   user_req_cnt
                 STA   math_temp
                 LDA   curr_mark+2
                 ADC   user_req_cnt+2
                 CMP   curr_eof+2
                 BCC   not_greater
                 BNE   too_large
                 LDA   math_temp
                 CMP   curr_eof
                 BCC   not_greater
                 BEQ   not_greater
too_large        SEC
                 LDA   curr_eof
                 SBC   curr_mark
                 STA   user_req_cnt
                 LDA   curr_eof+2
                 SBC   curr_mark+2
                 STA   user_req_cnt+2
not_greater      LDA   newline_len
                 BEQ   single_block
                 DEC
                 BNE   single_block
                 LDA   [newline_ptr]
                 AND   #$00FF
                 STA   newline_char
single_block     JSR   send_partial
                 BCC   fast_loop
                 CLC
                 BRL   end_read_write
fast_loop        LDA   user_req_cnt+2
                 BNE   do_seq_blks
                 LDA   user_req_cnt
                 CMP   #$0201
                 BCS   do_seq_blks
                 BRL   send_last
do_seq_blks      LDA   newline_len
                 BNE   single_block
                 JSR   num_seq_blks
                 BEQ   single_block
                 PHY
                 TXA
                 JSR   Cluster2Block
                 CLC
                 ADC   $01,S
                 STA   $10
                 STZ   $12
                 STZ   $08
                 STZ   $0A
                 PLA
                 LDA   user_req_cnt+1
                 LSR
                 CMP   math_temp
                 BCC   use_users_size
                 LDA   math_temp
use_users_size   ASL
                 STA   $09
                 LDA   users_buf_ptr
                 STA   $04
                 LDA   users_buf_ptr+2
                 STA   $06
                 JSR   read_with_mount
                 BCC   cont001
                 BRL   end_read_write
cont001          JSR   rw_adjust
                 BRL   fast_loop
send_last        JSR   send_partial
                 CLC
end_read_write   PHP
                 PHA
                 LDY   #$000A
                 LDA   tran_cnt
                 STA   [my_pblk_ptr],Y
                 INY
                 INY
                 LDA   tran_cnt+2
                 STA   [my_pblk_ptr],Y
                 JSR   save_curr_mark
                 PLA
                 PLP
                 BRL   main_exit

bump_mark        STA   math_temp
                 CLC
                 LDA   users_buf_ptr
                 ADC   math_temp
                 STA   users_buf_ptr
                 BCC   do_mark
                 INC   users_buf_ptr+2
                 CLC
do_mark          LDA   curr_mark
                 ADC   math_temp
                 STA   curr_mark
                 BCC   do_tran
                 INC   curr_mark+2
                 CLC
do_tran          LDA   tran_cnt
                 ADC   math_temp
                 STA   tran_cnt
                 BCC   do_req_cnt
                 INC   tran_cnt+2
do_req_cnt       SEC
                 LDA   user_req_cnt
                 SBC   math_temp
                 STA   user_req_cnt
                 BCS   end_bump
                 DEC   user_req_cnt+2
end_bump         RTS

set_users_buf    LDA   users_buf_ptr
                 STA   $04
                 LDA   users_buf_ptr+2
                 STA   $06
                 RTS

get_file_info    JSR   setup_params
                 JSR   process_path
                 JSR   move_dir_entry
                 STZ   fcr_wanted
L051E            JSR   get_next_fcr
                 BCS   loop_done
                 LDY   #$0008
                 LDA   [my_fcr_ptr],Y
                 CMP   [my_vcr_ptr]
                 BNE   L051E
                 LDY   #$0006
                 LDA   [msdos_fcr_ptr],Y
                 CMP   one_entry_start_cluster
                 BNE   L051E
                 LDY   #$0012
                 LDA   [msdos_fcr_ptr],Y
                 BPL   L051E
                 LDY   #$0008
                 LDA   [msdos_fcr_ptr],Y
                 STA   one_entry_file_size
                 INY
                 INY
                 LDA   [msdos_fcr_ptr],Y
                 STA   one_entry_file_size+2

loop_done        LDA   storage_type
                 CMP   #$00F0	; volume_header
                 BNE   go_send_info
                 JSR   calc_free_blks
                 BCC   L055C
                 BRL   main_exit

L055C            STA   one_entry_reserved
                 LDY   #$0008
                 LDA   [msdos_vcr_ptr],Y
                 STA   one_entry_file_size
                 SEC
                 SBC   one_entry_reserved
                 STA   one_entry_reserved+4

go_send_info     LDA   pcount
                 BEQ   old_style_info
                 CLC
                 LDA   my_pblk_ptr
                 ADC   #$0004
                 TAX
                 LDA   my_pblk_ptr+2
                 ADC   #$0000
                 TAY
                 LDA   pcount
                 DEC
                 JSR   send_info
                 BRL   main_exit

old_style_info   LDX   #$00C3
                 LDA   one_entry_attributes
                 BIT   #$0001
                 BEQ   L0598
                 LDX   #$0001
L0598            BIT   #$0020
                 BEQ   L05A4
                 PHA
                 TXA
                 ORA   #$0020
                 TAX
                 PLA
L05A4            BIT   #$0006
                 BEQ   L05AE
                 TXA
                 ORA   #$0004
                 TAX
L05AE            TXA
                 LDY   #$0004
                 STA   [my_pblk_ptr],Y
                 INY
                 INY
                 LDX   #$000F
                 LDA   one_entry_attributes
                 BIT   #$0010
                 BNE   L05C4
                 JSR   get_file_type
L05C4            TXA
                 STA   [my_pblk_ptr],Y
                 INY
                 INY
                 LDA   #$0000
                 STA   [my_pblk_ptr],Y
                 INY
                 INY
                 STA   [my_pblk_ptr],Y
                 LDA   one_entry_attributes
                 BIT   #$0010
                 BNE   L05E3
                 JSR   get_file_type
                 DEY
                 DEY
                 STA   [my_pblk_ptr],Y
                 INY
                 INY
L05E3            INY
                 INY
                 LDA   storage_type
                 STA   [my_pblk_ptr],Y
                 INY
                 INY
                 LDA   one_entry_date
                 AND   #$01FF
                 PHA
                 LDA   one_entry_date
                 XBA
                 LSR
                 AND   #$007F
                 CLC
                 ADC   #$0050
                 XBA
                 ASL
                 ORA   $01,S
                 STA   [my_pblk_ptr],Y
                 STA   $01,S
                 INY
                 INY
                 LDA   one_entry_time
                 TAX
                 AND   #$F800
                 LSR
                 LSR
                 LSR
                 PHA
                 TXA
                 LSR
                 LSR
                 LSR
                 LSR
                 AND   #$003F
                 ORA   $01,S
                 STA   [my_pblk_ptr],Y
                 TAX
                 INY
                 INY
                 PLA
                 STA   [my_pblk_ptr],Y
                 INY
                 INY
                 TXA
                 STA   [my_pblk_ptr],Y
                 INY
                 INY
                 LDA   one_entry_reserved+4
                 STA   [my_pblk_ptr],Y
                 INY
                 INY
                 LDA   #$0000
                 STA   [my_pblk_ptr],Y
                 CLC
                 BRL   main_exit

calc_last_mod    LDA   $00
                 LDX   #dummy_name
                 LDY   #^dummy_name
                 JSR   find_file

                 LDA   curr_mod_date
                 TAX
                 ORA   curr_mod_date+2
                 BEQ   same_time
                 STX   one_entry+last_mod_index
                 LDA   curr_mod_date+2
                 STA   one_entry+last_mod_index+2
                 RTS

same_time        LDA   one_entry_date
                 STA   one_entry+last_mod_index
                 LDA   one_entry_start_cluster
                 STA   one_entry+last_mod_index+2
                 RTS

read_with_mount  LDA   #$0002
                 BRA   L0670
write_with_mount LDA   #$0003
L0670            STA   $02
                 JSR   dev_with_mount
                 RTS

tran_cnt         ADRL  $00000000

save_curr_mark   LDY   #$0018
                 LDA   curr_mark
                 STA   [msdos_fcr_ptr],Y
                 INY
                 INY
                 LDA   curr_mark+2
                 STA   [msdos_fcr_ptr],Y
                 RTS

curr_mark        ADRL  $00000000

setup_curr_mark  LDY   #$0018
                 LDA   [msdos_fcr_ptr],Y
                 STA   curr_mark
                 INY
                 INY
                 LDA   [msdos_fcr_ptr],Y
                 STA   curr_mark+2
                 RTS

get_eof          JSR   setup_params
                 LDY   #$0008
                 LDA   [msdos_fcr_ptr],Y
                 TAX
                 INY
                 INY
                 LDA   [msdos_fcr_ptr],Y
                 LDY   #$0004
                 STA   [my_pblk_ptr],Y
                 DEY
                 DEY
                 TXA
                 STA   [my_pblk_ptr],Y
                 CLC
                 BRL   main_exit

open             STZ   resource_num
                 STZ   access
                 STZ   users_access
                 JSR   setup_params
                 BEQ   open_class0
                 JSR   get_access
                 BCS   open_class0
                 JSR   get_res_num
open_class0      JSR   process_path
                 JSR   move_dir_entry
                 JSR   verify_storage
                 BCS   open_exit
                 JSR   check_dup
                 BCS   open_exit
                 JSR   build_the_fcr
                 BCS   open_exit
                 LDY   #$0000
                 LDA   $30
                 AND   #$E000
                 BEQ   L06F1
                 LDY   #$0002
L06F1            LDA   [my_fcr_ptr]
                 STA   [$32],Y
                 JSR   send_open_parms
                 BCC   open_exit
                 PHA
                 JSR   remove_fcr
                 PLA
                 SEC
open_exit        BRL   main_exit

send_open_parms  LDA   pcount
                 CMP   #$0005
                 BCC   L0720
                 SBC   #$0004
                 PHA
                 CLC
                 LDA   my_pblk_ptr
                 ADC   #$000A
                 TAX
                 LDA   my_pblk_ptr+2
                 ADC   #$0000
                 TAY
                 PLA
                 JSR   send_info
L0720            RTS

verify_storage   LDA   storage_type
                 STA   entry_sto_type
                 CMP   #$0050
                 BEQ   setup_access
                 LDX   resource_num
                 BNE   bad_resource
                 CMP   #$0010
                 BEQ   setup_access
                 CMP   #$00D0
                 BEQ   L0740
                 CMP   #$00F0
                 BNE   bad_storage
L0740            LDA   access
                 BEQ   L074A
                 CMP   #$0002
                 BCS   bad_access
L074A            LDA   #$0001
                 STA   access
                 CLC
                 RTS

setup_access     LDA   access
                 BNE   verify_access
                 LDX   #$0001
                 LDA   one_entry_attributes
                 AND   #$0001
                 BNE   L0765
                 LDX   #$0003
L0765            STX   access
                 CLC
                 RTS

verify_access    LSR
                 LSR
                 BCC   exit_access
                 LDA   one_entry_attributes
                 AND   #$0001
                 BEQ   bad_access
                 CLC
exit_access      RTS

bad_resource     LDA   #$0063
                 SEC
                 RTS

bad_access       LDA   #$004E
                 SEC
                 RTS

bad_storage      LDA   #$004B
                 SEC
                 RTS

get_res_num      LDA   pcount
                 CMP   #$0004
                 BCC   end_res
                 LDY   #$0008
                 LDA   [my_pblk_ptr],Y
                 STA   resource_num
                 BEQ   end_res
                 DEC
                 BNE   not_in_range
end_res          RTS

get_access       LDA   pcount
                 CMP   #$0003
                 BCC   no_params
                 LDY   #$0006
                 LDA   [my_pblk_ptr],Y
                 STA   users_access
                 BEQ   end_access
                 STA   access
                 CMP   #$0004
                 BCC   end_access
not_in_range     LDA   #$0053
                 BRL   error_exit
no_params        SEC
                 RTS

end_access       CLC
                 RTS

newline_char            DW    $0000

find_file        STA   $00
                 STX   temp_ptr
                 STY   temp_ptr+2
                 LDA   gbuf_addr
                 STA   gbuf_ptr
                 STA   $04
                 LDA   gbuf_addr+2
                 STA   gbuf_ptr+2
                 STA   $06
                 STZ   curr_mod_date
                 STZ   curr_mod_date+2
                 LDY   #$0006
                 LDA   [msdos_vcr_ptr],Y
                 LSR
                 LSR
                 LSR
                 LSR
                 STA   sector_count
                 STZ   cluster_num
                 LDY   #$0015
                 LDA   [msdos_vcr_ptr],Y
                 STA   dir_start_blk
                 STA   dir_last_blk
                 STA   $10
                 STZ   $12
                 JSR   standard_req
                 LDA   #$0002
                 STA   $02
                 STZ   chars_checked
                 STZ   path_searched
                 JSR   setup_name
                 STZ   entries_blk_num
outter_loop      STZ   last_blk
                 STZ   free_dir_blk
                 STZ   free_dir_offset
                 STZ   searching_free
search_loop      JSR   read_with_cache
                 BCS   error_leave
                 LDY   #$0000
                 STZ   entries_checked
                 JSR   check_block
                 BCC   found
                 BIT   searching_free
                 BPL   @check_active
                 LDA   free_dir_blk
                 BEQ   load_next
                 BIT   path_searched
                 BPL   load_next
                 BRA   no_more_blks
@check_active     LDA   entries_checked
                 CMP   #$0010
                 BNE   not_found
load_next        DEC   sector_count
                 BEQ   next_cluster
                 INC   $10
                 INC   dir_last_blk
                 BRA   search_loop
next_cluster     LDA   cluster_num
                 BEQ   no_more_blks
                 JSR   get_FAT_entry
                 BCS   no_more_blks
                 STA   cluster_num
                 JSR   Cluster2Block
                 STA   $10
                 STA   dir_last_blk
                 LDY   #$0002
                 LDA   [msdos_vcr_ptr],Y
                 AND   #$00FF
                 STA   sector_count
                 BRA   search_loop
not_found        BIT   search_flag
                 BVC   no_more_blks
                 LDA   free_dir_blk
                 BNE   no_more_blks
                 DEC   searching_free
                 BRA   load_next
no_more_blks     LDA   path_searched
                 BNE   file_err
                 LDA   #$0044
                 SEC
                 RTS

file_err         LDA   #$0046
                 SEC
error_leave      RTS

found            LDA   $10
                 STA   entries_blk_num
                 STA   dir_last_blk
                 STY   entries_offset
                 TYX
                 LDY   chars_checked
                 DEY
                 LDA   [temp_ptr],Y
                 AND   #$00FF
                 BEQ   find_success
                 TXA
                 CLC
                 ADC   #$000B
                 TAY
                 LDA   [gbuf_ptr],Y
                 AND   #$0010
                 BEQ   not_found
                 LDA   $10
                 STA   slug_block
                 STX   slug_offset
                 TXA
                 CLC
                 ADC   #$001A
                 TAY
                 LDA   [gbuf_ptr],Y
                 STA   cluster_num
                 JSR   Cluster2Block
                 STA   $10
                 STA   dir_start_blk
                 STA   dir_last_blk
                 LDY   #$0002
                 LDA   [msdos_vcr_ptr],Y
                 AND   #$00FF
                 STA   sector_count
                 JSR   setup_name
                 BRL   outter_loop
find_success     TXA
                 PHA
                 CLC
                 ADC   gbuf_ptr
                 TAX
                 LDA   #$0000
                 ADC   gbuf_ptr+2
                 TAY
                 PLA
                 CLC
                 RTS

sector_count     DW    $0000
cluster_num      DW    $0000

check_block      LDA   entries_checked
                 CMP   #$0010
                 BEQ   check_done
                 INC   entries_checked
                 LDA   [gbuf_ptr],Y
                 CMP   #$2E2E	; '..'
                 BEQ   next_entry
                 AND   #$00FF
                 BEQ   check_done
                 CMP   #$002E	; '.'
                 BEQ   next_entry
                 CMP   #$00E5
                 BEQ   chk_need_free
                 JSR   save_latest_mod
                 JSR   check_name
                 BCS   next_entry
                 PHY
                 TYA
                 CLC
                 ADC   #$000B
                 TAY
                 LDA   [gbuf_ptr],Y
                 PLY
                 AND   #$0008
                 BNE   next_entry
                 CLC
                 RTS

chk_need_free    LDA   free_dir_blk
                 BNE   next_entry
                 LDA   $10
                 STA   free_dir_blk
                 STY   free_dir_offset
next_entry       TYA
                 CLC
                 ADC   #$0020
                 TAY
                 BRA   check_block
check_done       SEC
                 RTS

save_latest_mod  PHY
                 PHX
                 PHA
                 TYA
                 CLC
                 ADC   #$0018
                 TAY
                 LDA   [gbuf_ptr],Y
                 TAX
                 CMP   curr_mod_date
                 BCC   L0975
                 BEQ   check_time
                 DEY
                 DEY
                 LDA   [gbuf_ptr],Y
                 STA   curr_mod_date+2
                 STX   curr_mod_date
                 BRA   L0975
check_time       DEY
                 DEY
                 LDA   [gbuf_ptr],Y
                 CMP   curr_mod_date+2
                 BCC   L0975
                 STA   curr_mod_date+2
                 STX   curr_mod_date
L0975            PLA
                 PLX
                 PLY
                 RTS

check_name       PHY
                 LDX   #$0000
                 SEP   #$20
L097F            LDA   [gbuf_ptr],Y
                 CMP   #$05
                 BNE   L098C
                 CPX   #$0000
                 BNE   L098C
                 LDA   #$E5
L098C            EOR   search_name,X
                 AND   #$DF
                 BNE   L099B+1
                 INX
                 INY
                 CPX   #$000B
                 BNE   L097F
                 CLC
L099B            BCS   L09D5
                 REP   #$20
                 PLY
                 RTS

setup_name       PHY
                 LDY   chars_checked
                 LDA   [temp_ptr],Y
                 AND   #$00FF
                 BNE   more_names
                 DEC   path_searched
                 PLY
                 SEC
                 RTS

more_names       SEP   #$20
                 LDX   #$0000
looper           LDA   [temp_ptr],Y
                 BEQ   end_path
                 CMP   #$3A	; delimiter
                 BEQ   end_name
                 CMP   #$41	; A
                 BCC   not_alpha
                 CMP   #$5B	; Z+1
                 BCC   is_legal
not_alpha        CMP   #$2E	; .
                 BNE   not_extension
                 LDA   #$20
space_fill       CPX   #$0008
                 BCS   do_extension
                 STA   search_name,X
L09D5            INX
                 BRA   space_fill
not_extension    PHX
                 LDX   #$000D
char_check       CMP   illegal_chars,X
                 BEQ   bad_filename
                 DEX
                 BPL   char_check
                 PLX
is_legal         CPX   #$0008
                 BCS   truncate
                 STA   search_name,X
                 INX
truncate         INY
                 BRA   looper
bad_filename     PLX
                 REP   #$20
                 LDA   #$0040
                 SEC
                 BRL   main_exit
                 MX    %10
do_extension     INY
                 LDA   [temp_ptr],Y
                 BEQ   end_path
                 CMP   #$3A
                 BEQ   end_name
                 CMP   #$41
                 BCC   L0A0C
                 CMP   #$5B
                 BCC   L0A19
L0A0C            PHX
                 LDX   #$000D
L0A10            CMP   illegal_chars,X
                 BEQ   bad_filename
                 DEX
                 BPL   L0A10
                 PLX
L0A19            CPX   #$000B
                 BCS   L0A22
                 STA   search_name,X
                 INX
L0A22            BRA   do_extension
end_path         DEC   path_searched+1
end_name         INY
                 STY   chars_checked
                 LDA   #$20
L0A2D            CPX   #$000B
                 BCS   L0A38
                 STA   search_name,X
                 INX
                 BRA   L0A2D
L0A38            STX   search_length
                 REP   #$30
                 PLY
                 CLC
                 RTS

illegal_chars    ASC   '.;,=+/"[]|<> '09
entries_checked  DW    $0000
chars_checked    DW    $0000
free_dir_blk     DW    $0000
volume_name      DS    $14
user_req_cnt     ADRL  $00000000
flags            DW    $0000
write_dev_num    DW    $0000
slug_block       DW    $0000

close            JSR   setup_params
                 DEC   close_flag
                 JSR   remove_fcr
                 BRL   main_exit

build_the_fcr    LDY   #$0002
                 LDA   [my_vcr_ptr],Y
                 TAX
                 INY
                 INY
                 LDA   [my_vcr_ptr],Y
                 TAY
                 JSL   DEREF
                 PEI   temp_ptr
                 PEI   temp_ptr+2
                 STX   temp_ptr
                 STY   temp_ptr+2
                 LDA   [temp_ptr]
                 TAY
                 INC
                 STA   gstring
                 LDA   #$3A3A
                 STA   gstring+2
                 INC   temp_ptr
                 BNE   L0AA8
                 INC   temp_ptr+2
L0AA8            SEP   #$20
L0AAA            LDA   [temp_ptr],Y
                 STA   gstring+2,Y
                 DEY
                 BNE   L0AAA
                 REP   #$20
                 PLA
                 STA   temp_ptr+2
                 PLA
                 STA   temp_ptr
                 LDX   #gstring
                 LDY   #^gstring
                 LDA   #$0238
                 SEC
                 JSL   ALLOC_FCR
                 BCC   success
                 RTS

success          JSL   DEREF
                 STX   my_fcr_ptr
                 STY   my_fcr_ptr+2
                 JSR   setup_my_fcr
                 LDY   #$0008
                 LDA   [my_vcr_ptr],Y
                 INC
                 STA   [my_vcr_ptr],Y
                 LDY   #$0012
                 LDA   #$0000
                 STA   [msdos_fcr_ptr],Y
                 LDA   #$4000
                 JSR   set_fcr_status
                 LDA   access
                 LDY   #$0014
                 ORA   #$8000
                 STA   [my_fcr_ptr],Y
                 LDY   #$0008
                 LDA   [my_vcr_ptr]
                 STA   [my_fcr_ptr],Y
                 LDY   #$0006
                 LDA   #$000A
                 STA   [my_fcr_ptr],Y
                 LDY   #$001C
                 LDA   storage_type
                 STA   [msdos_fcr_ptr],Y
                 CMP   #$00F0
                 BNE   no_adjust2
                 JSR   vol_file_size
no_adjust2       LDY   #$0014
                 LDA   parent_blk
                 STA   [msdos_fcr_ptr],Y
                 LDY   #$0016
                 LDA   entry_offset
                 STA   [msdos_fcr_ptr],Y
                 LDA   resource_num
                 BNE   L0B3F
                 LDY   #$0008
                 LDA   one_entry_file_size
                 STA   [msdos_fcr_ptr],Y
                 INY
                 INY
                 LDA   one_entry_file_size+2
                 STA   [msdos_fcr_ptr],Y
                 LDA   one_entry_start_cluster
                 BRA   L0B51
L0B3F            LDY   #$0008
                 LDA   rfork_entry_file_size
                 STA   [msdos_fcr_ptr],Y
                 INY
                 INY
                 LDA   rfork_entry_file_size+2
                 STA   [msdos_fcr_ptr],Y
                 LDA   rfork_entry_start_cluster
L0B51            LDY   #$0006
                 STA   [msdos_fcr_ptr],Y
                 TAY
                 BNE   L0B66
                 LDY   #$001D
                 LDA   [msdos_vcr_ptr],Y
                 SEC
                 LDY   #$0015
                 SBC   [msdos_vcr_ptr],Y
                 BRA   L0B6E
L0B66            LDY   #$0002
                 LDA   [msdos_vcr_ptr],Y
                 AND   #$00FF
L0B6E            LDY   #$0010
                 STA   [msdos_fcr_ptr],Y
                 LDY   #$0004
                 LDA   one_entry_date
                 STA   [msdos_fcr_ptr],Y
                 LDY   #$0002
                 LDA   one_entry_time
                 STA   [msdos_fcr_ptr],Y
                 LDY   #$0000
                 LDA   one_entry_attributes
                 AND   #$00FF
                 STA   [msdos_fcr_ptr],Y
                 JSR   setup_io_ptrs
                 JSR   setup_io_buf
                 BCC   L0B9C
                 PHA
                 JSR   remove_fcr
                 PLA
                 SEC
L0B9C            RTS

chk_swapped      LDY   #$0006
                 LDA   [my_vcr_ptr],Y
                 AND   #$4000
                 BEQ   L0BCD
                 LDY   #$0002
                 LDA   [my_vcr_ptr],Y
                 TAX
                 INY
                 INY
                 LDA   [my_vcr_ptr],Y
                 TAY
                 JSL   DEREF
                 STX   temp_ptr
                 STY   temp_ptr+2
                 LDA   [temp_ptr]
                 AND   #$000F
                 TAY
                 DEY
L0BC1            LDA   [temp_ptr],Y
                 STA   volume_name,Y
                 DEY
                 BPL   L0BC1
                 JSR   mount_volume
                 RTS

L0BCD            CLC
                 RTS

last_blk         DW    $0000

vol_file_size    LDY   #$0006
                 LDA   [msdos_vcr_ptr],Y
                 ASL
                 ASL
                 ASL
                 ASL
                 ASL
                 STA   one_entry_file_size
                 RTS

dirty_flags      DW    $0000
def_my_direct    DS    $78

setup_my_fcr     CLC
                 LDA   my_fcr_ptr
                 ADC   #$0016
                 STA   msdos_fcr_ptr
                 TAX
                 LDA   my_fcr_ptr+2
                 ADC   #$0000
                 STA   msdos_fcr_ptr+2
                 TAY
                 RTS

entry_offset     DW    $0000
slug_offset      DW    $0000
entries_offset   DW    $0000

id_disk          STA   $00
                 LDA   #$0002
                 STA   $02
                 STZ   $10
                 STZ   $12
                 JSR   standard_req
                 JSR   set_default_buf
try_again        JSR   device_call
                 BCC   id_no_error
                 AND   #$00FF
                 BEQ   id_no_error
                 CMP   #$002E
                 BEQ   try_again
                 SEC
L0C92            RTS

* Boot sector
* +$0000 - BS_jmpBoot - EB or E9
* +$000B - BPB_BytsPerSec - $0200
* +$01FE - BP_Signature - $AA55

id_no_error      LDA   [$04]
                 AND   #$00FF
                 CMP   #$00EB
                 BEQ   L0CA2
                 CMP   #$00E9
                 BNE   L0CB6
L0CA2            LDY   #$01FE
                 LDA   [$04],Y
                 CMP   #$AA55
                 BNE   L0CB6
                 LDY   #$000B
                 LDA   [$04],Y
                 CMP   #$0200
                 BEQ   build_vcr
L0CB6            LDA   #$0052
                 SEC
                 RTS

build_vcr        LDA   $04
                 CLC
                 ADC   #$000B
                 STA   $04
                 LDY   #$0012
                 SEP   #$20
L0CC8            LDA   [$04],Y
                 STA   bios_parm_block,Y
                 DEY
                 BPL   L0CC8
                 REP   #$20
                 LDA   FAT_count
                 AND   #$00FF
                 TAX
                 LDA   #$0000
                 CLC
L0CDD            ADC   FAT_size
                 DEX
                 BNE   L0CDD
                 ADC   reserved_sectors
                 STA   root_dir_block
                 STA   $10
                 LDA   root_dir_count
                 LSR
                 LSR
                 LSR
                 LSR
                 STA   root_dir_size
L0CF5            LDA   gbuf_addr
                 STA   $04
                 JSR   device_call
                 BCS   L0C92
                 LDX   #$0010	; blksize/32
                 LDY   #$000B
L0D05            LDA   [$04]
                 AND   #$00FF
                 BEQ   L0D33
                 CMP   #$00E5
                 BEQ   L0D1B
                 LDA   [$04],Y
                 BIT   #$0008
                 BEQ   L0D1B
                 BRL   L0DA5
L0D1B            CLC
                 LDA   $04
                 ADC   #$0020
                 STA   $04
                 DEX
                 BNE   L0D05
                 INC   $10
                 LDA   $10
                 SEC
                 SBC   root_dir_block
                 CMP   root_dir_size
                 BCC   L0CF5
L0D33            STZ   parent_blk
                 STZ   entry_offset
                 LDA   FAT_size
                 AND   #$00FF
                 XBA
                 ASL
                 STA   $08
                 STZ   $0A
                 JSL   ALLOC_SEG
                 BCS   L0D67
                 PHY
                 PHX
                 JSL   DEREF
                 STX   fat_ptr
                 STY   fat_ptr+2
                 STX   $04
                 STY   $06
                 LDA   reserved_sectors
                 STA   $10
                 STZ   $12
                 JSR   device_call
                 BCC   L0D68
                 PLX
                 PLX
L0D67            RTS

L0D68            LDA   FAT_size
                 AND   #$00FF
                 XBA
                 ASL
                 TAY
                 LDA   #$0000
                 CLC
L0D75            DEY
                 DEY
                 BEQ   L0D7D
                 ADC   [fat_ptr],Y
                 BRA   L0D75
L0D7D            ADC   [fat_ptr]
                 PHA
                 PEA   ^default_name_2
                 PEA   default_name_2
                 PEA   $0005
                 PEA   $0000
                 _Int2Dec
                 PLX
                 PLY
                 JSL   RELEASE_SEG
                 LDA   #default_name
                 STA   $04
                 LDA   #^default_name
                 STA   $06
                 BRA   L0DB3
L0DA5            LDA   $10
                 STA   parent_blk
                 LDA   $04
                 SEC
                 SBC   gbuf_addr
                 STA   entry_offset
L0DB3            SEP   #$20
                 LDY   #$000A
L0DB8            LDA   [$04],Y
                 STA   gstring+2,Y
                 DEY
                 BPL   L0DB8
                 LDY   #$000B
                 LDA   #$20
L0DC5            DEY
                 CMP   gstring+2,Y
                 BEQ   L0DC5
                 INY
                 STY   gstring
                 REP   #$20
                 BIT   cp_flags
                 BPL   L0DD9
                 BRL   L0E2C
L0DD9            LDX   #gstring
                 LDY   #^gstring
                 LDA   #$0000
                 JSL   FIND_VCR
                 BCS   L0E42
                 JSL   DEREF
                 STX   my_vcr_ptr
                 STY   my_vcr_ptr+2
                 LDY   #$000A
                 LDA   [my_vcr_ptr],Y
                 CMP   #$000A
                 BNE   check_active
                 JSR   setup_my_vcr
                 BIT   $16
                 BMI   L0E12
                 SEP   #$20
                 LDY   #$0012
L0E06            LDA   bios_parm_block,Y
                 CMP   [msdos_vcr_ptr],Y
                 BNE   check_active2
                 DEY
                 BPL   L0E06
                 REP   #$20
L0E12            LDY   #$000C
                 LDA   $00
                 STA   [my_vcr_ptr],Y
                 JSR   activate_vcr
                 CLC
                 RTS

L0E1E            LDA   #$0057
                 SEC
L0E22            RTS

check_active2    REP   #$20
check_active     LDY   #$0008
                 LDA   [my_vcr_ptr],Y
                 BEQ   L0E3F
L0E2C            LDA   cp_device_flag
                 BEQ   L0E1E
                 ORA   #$8000
                 STA   cp_device_flag
                 LDA   $00
                 JSL   SWAP_OUT
                 BRA   L0E42
L0E3F            JSR   free_vcr
L0E42            LDA   FAT_size
                 AND   #$00FF
                 XBA
                 ASL
                 STA   FAT_byte_count
                 LDX   #gstring
                 LDY   #^gstring
                 LDA   cp_device_flag
                 BPL   L0E5E
                 LDX   #fake_name_str
                 LDY   #^fake_name_str
L0E5E            LDA   #$002F
                 CLC
                 ADC   FAT_byte_count
                 JSL   ALLOC_VCR
                 BCS   L0E22
                 JSL   DEREF
                 STX   my_vcr_ptr
                 STY   my_vcr_ptr+2
                 JSR   setup_my_vcr
                 LDY   #$000A
                 LDA   #$000A
                 STA   [my_vcr_ptr],Y
                 LDY   #$000C
                 LDA   $00
                 STA   [my_vcr_ptr],Y
                 LDY   #$0006
                 LDA   #$0000
                 STA   [my_vcr_ptr],Y
                 LDY   #$0012
                 SEP   #$20
L0E92            LDA   bios_parm_block,Y
                 STA   [msdos_vcr_ptr],Y
                 DEY
                 BPL   L0E92
                 REP   #$20
                 TYA
                 LDY   #$0013
                 STA   [msdos_vcr_ptr],Y
                 LDY   #$0015
                 LDA   root_dir_block
                 STA   [msdos_vcr_ptr],Y
                 LDY   #$0002
                 LDA   [msdos_vcr_ptr],Y
                 AND   #$00FF
                 TAX
                 LDY   #$0008
                 LDA   [msdos_vcr_ptr],Y
L0EB8            PHA
                 TXA
                 LSR
                 TAX
                 PLA
                 BCS   L0EC2
                 LSR
                 BRA   L0EB8
L0EC2            LDX   #$0000
                 CMP   #$0FF8
                 BCC   L0ECB
                 INX
L0ECB            LDY   #$001B
                 TXA
                 STA   [msdos_vcr_ptr],Y
                 LDY   #$0006
                 LDA   [msdos_vcr_ptr],Y
                 LSR
                 LSR
                 LSR
                 LSR
                 CLC
                 LDY   #$0015
                 ADC   [msdos_vcr_ptr],Y
                 LDY   #$001D
                 STA   [msdos_vcr_ptr],Y
                 LDA   my_vcr_ptr
                 CLC
                 ADC   #$002F
                 STA   $04
                 LDA   my_vcr_ptr+2
                 ADC   #$0000
                 STA   $06
                 LDA   FAT_byte_count
                 STA   $08
                 STZ   $0A
                 LDA   reserved_sectors
                 STA   $10
                 STZ   $12
                 JSR   device_call
                 RTS

pcount           DW    $0000
newline_mask     DW    $0000
close_flag       DW    $0000

read_with_cache  LDA   #$0002
                 BRA   L0F14
write_with_cache LDA   #$0003
L0F14            STA   $02
                 LDA   [my_vcr_ptr]
                 STA   $18
                 LDA   $1A
                 PHA
                 LDA   #$8002
                 STA   $1A
                 JSR   dev_with_mount
                 PHP
                 TAX
                 LDA   $02,S
                 STA   $1A
                 TXA
                 PLP
                 PLX
                 RTS

get_file_type    PHY
                 LDX   #$0000
                 LDA   map_enable_flag
                 BEQ   L0F7D
                 JSR   deref_map
                 LDA   #$0000
                 SEP   #$20
                 LDY   #$0002
L0F43            LDX   #$0000
                 LDA   [map_ptr],Y
                 BEQ   L0F7D
                 LDX   #$0000
L0F4D            INX
                 INY
                 LDA   [map_ptr],Y
                 BNE   L0F4D
                 PHY
                 STX   length
                 DEY
                 CPX   filename_length
                 BEQ   L0F5F
                 BCS   L0F81
L0F5F            LDX   filename_length
L0F62            LDA   [map_ptr],Y
                 CMP   filename_length+1,X
                 BNE   L0F81
                 DEY
                 DEX
                 DEC   length
                 BNE   L0F62
                 PLY
                 INY
                 LDA   [map_ptr],Y
                 REP   #$20
                 AND   #$00FF
                 TAX
                 INY
                 LDA   [map_ptr],Y
L0F7D            REP   #$20
                 PLY
                 RTS

L0F81            PLY
                 INY
                 INY
                 INY
                 INY
                 BRA   L0F43

calc_free_blks   LDY   #$0013
                 LDA   [msdos_vcr_ptr],Y
                 INC
                 BEQ   L0F93
                 DEC
                 CLC
                 RTS

L0F93            JSR   setup_fat_ptr
                 LDY   #$0008
                 LDA   [msdos_vcr_ptr],Y
                 STA   math_temp
                 LDY   #$0002
                 LDA   [msdos_vcr_ptr],Y
                 AND   #$00FF
                 PHA
                 LSR
                 BEQ   L0FAE
L0FA9            LSR   math_temp
                 LSR
                 BNE   L0FA9
L0FAE            LDX   math_temp
                 STZ   math_temp
L0FB2            TXA
                 JSR   get_FAT_entry
                 TAY
                 BNE   L0FC0
                 LDA   math_temp
                 CLC
                 ADC   $01,S
                 STA   math_temp
L0FC0            DEX
                 BNE   L0FB2
                 PLA
                 LDA   math_temp
                 LDY   #$0013
                 STA   [msdos_vcr_ptr],Y
                 CLC
                 RTS

deref_map        LDX   map_buffer_vp
                 LDY   map_buffer_vp+2
                 JSL   DEREF
                 STX   map_ptr
                 STY   map_ptr+2
                 RTS

case_bits        DW    $0000

flush            JSR   setup_params
                 DEC   close_flag
                 LDA   pcount
                 CMP   #$0002
                 BCC   L1001
                 LDY   #$0004
                 LDA   [$32],Y
                 ASL
                 BEQ   L0FFA
                 LDA   #$0053
                 SEC
                 BRA   L1004
L0FFA            BCC   L1001
                 JSR   do_fast_flush
                 BRA   L1004
L1001            JSR   flush_file
L1004            BRL   main_exit

process_path     LDA   #$8002
                 STA   $1A
                 LDA   #$4000
                 LDX   $3A
                 LDY   $3C
                 JSR   build_path
                 BCC   L101B
                 BRL   dev_or_vol
L101B            LDA   search_flag
                 AND   #$2000
                 BEQ   L1028
                 LDA   #$0040
                 SEC
                 RTS

L1028            STX   hold_path_ptr
                 STY   hold_path_ptr+2
                 LDA   $36
                 BEQ   L103E
                 STA   $00
L1034            LDA   $00
                 JSR   id_disk
                 BCC   L1046
L103B            BRL   main_exit
L103E            JSR   vol_to_buffer
                 JSR   find_volume
                 BCS   L103B
L1046            LDA   #$8000
                 STA   error_priority
                 LDA   flags
                 AND   #$0100
                 BEQ   L1057
                 JSR   check_spans
L1057            LDA   flags
                 AND   #$2000
                 BEQ   L106F
                 JSR   setup_my_vcr
                 LDY   #$001F
                 LDA   [msdos_vcr_ptr],Y
                 BEQ   L106F
                 LDA   #$0051
                 BRL   damaged_message
L106F            LDA   $00
                 LDX   hold_path_ptr
                 LDY   hold_path_ptr+2
                 JSR   find_file
                 BCC   save_parent
                 CMP   #$002E
                 BEQ   L1034
                 BIT   search_flag
                 BVC   not_ok
                 CMP   #$0046
                 BNE   not_ok
                 SEC
                 RTS

not_ok           SEC
                 BRL   main_exit
save_parent      STA   entry_offset
                 LDA   $10
                 STA   parent_blk
                 STX   $04
                 STY   $06
L109D            JSR   set_user_cache
                 RTS

dev_or_vol       LDA   $36
                 BEQ   L10DD
                 JSR   id_disk
                 BCS   L10DA
L10AA            LDA   #$8000
                 STA   error_priority
                 BIT   search_flag
                 BMI   L10D6
                 LDA   parent_blk
                 BEQ   L10CA
                 LDA   entry_offset
                 CLC
                 ADC   gbuf_addr
                 STA   $04
                 LDA   gbuf_addr+2
                 STA   $06
                 BRA   L109D
L10CA            LDA   #default_name
                 STA   $04
                 LDA   #^default_name
                 STA   $06
                 BRA   L109D
L10D6            LDA   #$0040
                 SEC
L10DA            BRL   main_exit
L10DD            JSR   find_volume
                 BCC   L10AA
                 BRL   main_exit
set_user_cache   PHA
                 LDA   user_cache
                 STA   $1A
                 PLA
                 RTS

path_searched    DW    $0000
root_dir_block   DW    $0000
root_dir_size    DW    $0000
FAT_byte_count   DW    $0000
default_name     ASC   'MSDOS#'
default_name_2   ASC   '     '
                 DB    $08	; attributes
                 DS    10	; reserved
	     DW    $0000	; time
	     DW    $0000	; date
	     DW    $0000	; starting cluster
	     ADRL  $00000000	; file size

search_length    DW    $0000

damaged_message  PHA
                 JSR   show_damage
                 JSL   UNLOCK_MEM
                 SEC
                 PLA
                 JMPL  SYS_EXIT

show_damage      JSR   setup_vol_mesg
                 LDA   volume_name
                 XBA
                 STA   volume_name
                 PEA   $0003
                 PEA   ^volume_name
                 PEA   volume_name+1
                 PEA   $0000
                 PEA   $0000
                 JSL   REPORT_ERROR
                 LDA   volume_name
                 XBA
                 STA   volume_name
                 RTS

setup_vol_mesg   LDY   #$0002
                 LDA   [my_vcr_ptr],Y
                 TAX
                 INY
                 INY
                 LDA   [my_vcr_ptr],Y
                 TAY
                 JSL   DEREF
                 STX   temp_ptr
                 STY   temp_ptr+2
                 LDA   [temp_ptr]
                 TAY
                 INY
L1161            LDA   [temp_ptr],Y
                 STA   volume_name,Y
                 DEY
                 BPL   L1161
                 RTS

curr_eof         ADRL  $00000000
searching_free   DW    $0000

setup_my_vcr     JSR   setup_fat_ptr
                 CLC
                 LDA   my_vcr_ptr
                 ADC   #$000E
                 STA   msdos_vcr_ptr
                 TAX
                 LDA   my_vcr_ptr+2
                 ADC   #$0000
                 STA   msdos_vcr_ptr+2
                 TAY
                 RTS

parent_blk       DW    $0000

remove_fcr       LDY   #$0017
                 LDA   [msdos_vcr_ptr],Y
                 DEC
                 BNE   L118F
L118F            LDY   #$0008
                 LDA   [my_vcr_ptr],Y
                 DEC
                 BMI   L11A1
                 STA   [my_vcr_ptr],Y
                 LDA   [my_fcr_ptr]
                 JSL   RELEASE_FCR
                 CLC
                 RTS

L11A1            LDA   #$534B               ; SK
                 JMPL  SYS_DEATH

fcr_wanted       DW    $0000

setup_params     LDA   gbuf_addr
                 STA   gbuf_ptr
                 LDA   gbuf_addr+2
                 STA   gbuf_ptr+2

                 STZ   $18
                 STZ   search_flag
                 STZ   msdos_vcr_ptr
                 STZ   msdos_vcr_ptr+2
                 STZ   my_vcr_ptr
                 STZ   my_vcr_ptr+2
                 STZ   msdos_fcr_ptr
                 STZ   msdos_fcr_ptr+2

                 STZ   case_bits

                 STZ   slug_block
                 STZ   close_flag

                 STZ   expand_record_expand_file
                 STZ   expand_record_expand_flag
                 STZ   chk_dirty_flag
                 STZ   dirty_flags
                 STZ   dirty_cnt_changed
                 STZ   write_occurred

                 STZ   cp_device_flag
                 STZ   cp_flags
                 STZ   error_priority

                 LDA   start_tbl-2,X
                 STA   flags
                 AND   #$001F
                 STA   max_pcount

                 STZ   pcount
                 TYA
                 LSR
                 STA   class
                 BEQ   L1233
                 LDA   flags
                 AND   #$00E0
                 ASL
                 ASL
                 ASL
                 XBA
                 CMP   class
                 BCS   L1213
                 LDA   #$0062
                 BRA   L121D
L1213            LDA   [$32]
                 CMP   max_pcount
                 BCC   L1220
                 LDA   #$0004
L121D            BRL   main_exit
L1220            STA   pcount
                 LDA   $32
                 ADC   #$0002
                 STA   my_pblk_ptr
                 LDA   $34
                 ADC   #$0000
                 STA   my_pblk_ptr+2
                 BRA   L123B
L1233            LDA   $32
                 STA   my_pblk_ptr
                 LDA   $34
                 STA   my_pblk_ptr+2
L123B            LDX   #$000A
                 STX   $16
                 JSL   LOCK_MEM
                 LDA   $36
                 STA   $00
                 LDA   flags
                 AND   #$0200
                 BEQ   L1294
                 LDX   $3E
                 LDY   $40
                 JSL   DEREF
                 STX   my_vcr_ptr
                 STY   my_vcr_ptr+2
                 JSR   setup_my_vcr
                 LDA   flags
                 AND   #$2000
                 BEQ   L1276
                 LDY   #$001F
                 LDA   [msdos_vcr_ptr],Y
                 INC
                 BNE   L1276
                 SEC
                 LDA   #$004E
                 BRL   main_exit
L1276            LDY   #$0006
                 LDA   [my_vcr_ptr],Y
                 AND   #$4000
                 BEQ   L1294
                 LDA   $30
                 AND   #$DFFF
                 CMP   #$0014
                 BNE   L1291
                 LDY   #$0017
                 LDA   [msdos_vcr_ptr],Y
                 BEQ   L1294
L1291            JSR   mount_volume
L1294            LDA   flags
                 AND   #$0400
                 BEQ   L12BD
                 LDX   $3A
                 LDY   $3C
                 JSL   DEREF
                 STX   my_fcr_ptr
                 STY   my_fcr_ptr+2
                 JSR   setup_my_fcr
                 LDA   flags
                 AND   #$1000
                 BEQ   L12BD
                 LDY   #$0012
                 LDA   [msdos_fcr_ptr],Y
                 AND   #$8000
                 BEQ   L12BD
L12BD            LDA   flags
                 AND   #$0800
                 BEQ   L12C8
                 JSR   setup_io_ptrs
L12C8            LDA   flags
                 AND   #$4000
                 BEQ   L12DE
                 STA   chk_dirty_flag
                 LDY   #$0012
                 LDA   [msdos_fcr_ptr],Y
                 AND   #$8007
                 STA   dirty_flags
L12DE            LDA   class
                 RTS

send_partial     JSR   fill_io_buf
                 BCC   filled_up
                 BRL   end_read_write
filled_up        LDA   curr_mark
                 AND   #$01FF
                 SEC
                 SBC   #$0200
                 EOR   #$FFFF
                 INC
                 LDX   user_req_cnt+2
                 BNE   send_all_bytes
                 CMP   user_req_cnt
                 BEQ   send_all_bytes
                 BCC   send_all_bytes
                 LDA   user_req_cnt
send_all_bytes   STA   math_temp
                 TAY
                 LDA   newline_len
                 BNE   check_newline
                 CLC
                 LDA   curr_mark
                 AND   #$01FF
                 ADC   data_ptr
                 TAX
                 LDA   #$0000
                 ADC   data_ptr+2
                 CPY   #$0021
                 BCC   send_small
                 PHA
                 PHX
                 PEI   users_buf_ptr+2
                 PEI   users_buf_ptr
                 PEA   $0000
                 PHY
                 PEA   $0805
                 JSL   MOVE_INFO
                 BRA   end_partial

send_small       STX   temp_ptr
                 STA   temp_ptr+2
                 DEY
                 TYA
                 BMI   end_partial
                 CMP   #$0002
                 BCC   send_8_bit
                 DEC
                 ROR
                 BCS   send_8_bit
                 DEY
loop_16          LDA   [temp_ptr],Y
                 STA   [users_buf_ptr],Y
                 DEY
                 DEY
                 BPL   loop_16
                 BRA   end_partial
send_8_bit       SEP   #$20
loop_8           LDA   [temp_ptr],Y
                 STA   [users_buf_ptr],Y
                 DEY
                 BPL   loop_8
                 REP   #$20
end_partial      LDA   math_temp
                 JSR   bump_mark
                 LDA   user_req_cnt
                 ORA   user_req_cnt+2
                 BEQ   all_done
                 LDY   #$0012
                 LDA   [msdos_fcr_ptr],Y
                 AND   #$8000
                 BEQ   L1374
L1374            CLC
                 RTS

all_done         SEC
                 RTS

check_newline    TAX
                 LDA   curr_mark
                 AND   #$01FF
                 TAY
                 STA   entries_checked
                 SEC
                 LDA   users_buf_ptr
                 SBC   entries_checked
                 STA   temp_ptr
                 LDA   users_buf_ptr+2
                 SBC   #$0000
                 STA   temp_ptr+2
                 CLC
                 TYA
                 ADC   math_temp
                 STA   entries_checked
                 DEX
                 BNE   slow_read
                 PHP
                 SEP   #$20
fast_newline     LDA   [data_ptr],Y
                 STA   [temp_ptr],Y
                 AND   newline_mask
                 CMP   newline_char
                 BEQ   found_newline
                 INY
                 CPY   entries_checked
                 BNE   fast_newline
                 PLP
                 MX    %00
                 BRA   end_partial
found_newline    PLP
                 MX    %00
                 LDA   curr_mark
                 AND   #$01FF
                 STA   math_temp
                 SEC
                 TYA
                 SBC   math_temp
                 INC
                 JSR   bump_mark
                 STZ   user_req_cnt
                 STZ   user_req_cnt+2
                 SEC
                 RTS

slow_read        PHP
                 SEP   #$20
slow_newline     LDA   [data_ptr],Y
                 STA   [temp_ptr],Y
                 AND   newline_mask
                 TYX
                 LDY   newline_len
                 DEY
next_newline     CMP   [newline_ptr],Y
                 BEQ   found_one
                 DEY
                 BPL   next_newline
                 TXY
                 INY
                 CPY   entries_checked
                 BNE   slow_newline
                 PLP
                 MX    %00
                 BRL   end_partial
found_one        TXY
                 BRA   found_newline

filename_length  DW    $0000
filename_text    DS    $C

build_path       STA   and_mask
                 INX
                 BNE   L1406
                 INY
L1406            INX
                 BNE   L140A
                 INY
L140A            STX   temp_ptr
                 STY   temp_ptr+2
                 LDA   $42
                 AND   and_mask
                 BNE   L1417
                 SEC
                 RTS

L1417            LDA   $36
                 BEQ   L141D
L141B            CLC
                 RTS

L141D            JSR   vol_to_buffer
                 PHA
                 INY
                 INY
                 TYA
                 LDY   temp_ptr+2
                 CLC
                 ADC   temp_ptr
                 TAX
                 BCC   L142D
                 INY
L142D            PLA
                 BNE   L141B
                 SEC
                 RTS

fake_name_str    DW    $0003
                 DB    $0C
                 DB    $0A
                 DB    $0E
                 DB    $00

set_default_buf  LDA   gbuf_addr
                 STA   $04
                 LDA   gbuf_addr+2
                 STA   $06
                 RTS

standard_req     LDA   #$0200
                 STA   $08
                 STZ   $0A
                 RTS

hold_path_ptr    ADRL  $00000000	; Fixed bug

default_map      DW    $007E
                 ASC   '.TXT'00
                 DB    $04
                 DW    $0000
                 ASC   '.BAT'00
                 DB    $04
                 DW    $0000
                 ASC   '.BIN'00
                 DB    $06
                 DW    $0000
                 ASC   '.ASC'00
                 DB    $04
                 DW    $0000
                 ASC   '.C'00
                 DB    $04
                 DW    $0000
                 ASC   '.H'00
                 DB    $04
                 DW    $0000
                 ASC   '.PAS'00
                 DB    $04
                 DW    $0000
                 ASC   '.ASM'00
                 DB    $04
                 DW    $0000
                 ASC   '.LST'00
                 DB    $04
                 DW    $0000
                 ASC   '.COB'00
                 DB    $04
                 DW    $0000
                 ASC   '.FOR'00
                 DB    $04
                 DW    $0000
                 ASC   '.DOC'00
                 DB    $04
                 DW    $0000
                 ASC   '.SRC'00
                 DB    $04
                 DW    $0000
                 ASC   '.GIF'00
                 DB    users_buf_ptr
                 DW    $8006
                 ASC   '.DOX'00
                 DB    $04
                 DW    $0000
                 ASC   '.ME'00
                 DB    $04
                 DW    $0000
                 DB    $00

def_vol_name     DS    $14

fst_specific     LDA   [$32]
                 CMP   #$0003
                 BEQ   L14ED
                 LDA   #$0004
                 SEC
                 BRL   main_exit
L14ED            LDY   #$0004
                 LDA   [$32],Y
                 CMP   #$0004
                 BCS   L14FF
                 ASL
                 TAX
                 JSR   (specific_cmds,X)
                 BRL   main_exit
L14FF            LDA   #$0065
                 SEC
                 BRL   main_exit

specific_cmds    DA    map_enable
                 DA    get_map_size
                 DA    get_map_table
                 DA    set_map_table

sys_remove_vol   CLC
                 RTL

get_mark         JSR   setup_params
                 LDY   #$0018
                 LDA   [msdos_fcr_ptr],Y
                 TAX
                 INY
                 INY
                 LDA   [msdos_fcr_ptr],Y
                 LDY   #$0004
                 STA   [my_pblk_ptr],Y
                 DEY
                 DEY
                 TXA
                 STA   [my_pblk_ptr],Y
                 CLC
                 BRL   main_exit
set_mark         STZ   base
                 JSR   setup_params
                 BEQ   class0
                 LDY   #$0002
                 JSR   check_base
                 LDY   #$0004
                 BRA   main_entry
class0           LDY   #$0002
main_entry       LDA   [my_pblk_ptr],Y
                 STA   displacement
                 INY
                 INY
                 LDA   [my_pblk_ptr],Y
                 STA   displacement+2
                 JSR   calc_curr_mark
                 BCC   set_the_mark
                 LDA   #$004D
L1555            BRL   main_exit
set_the_mark     JSR   fill_io_buf
                 BCS   L1555
                 JSR   save_curr_mark
                 CLC
                 BRA   L1555

setup_fat_ptr    CLC
                 LDA   my_vcr_ptr
                 ADC   #$002F
                 STA   fat_ptr
                 TAX
                 LDA   my_vcr_ptr+2
                 ADC   #$0000
                 STA   fat_ptr+2
                 TAY
                 RTS

write_occurred   DW    $0000

free_vcr         LDA   [my_vcr_ptr]
                 JSL   RELEASE_VCR
                 RTS

create           JSR   setup_params
                 LDA   #$C000
                 STA   search_flag
                 JSR   process_path
                 BCC   L1591
                 CMP   #$0046
                 BNE   L1595
L1591            LDA   #$002B
                 SEC
L1595            BRL   main_exit

dir_start_blk    DW    $0000

get_dev_num      JSR   setup_params
                 LDA   $36
                 BNE   L15BE
                 LDA   #$4000
                 STA   search_flag
                 JSR   process_path
                 BCC   L15BC
                 CMP   #$0046
                 BNE   L15B8
                 LDA   $36
                 BNE   L15BC
                 LDA   #$0040
L15B8            SEC
                 BRL   main_exit
L15BC            LDA   $00
L15BE            LDY   #$0004
                 STA   [my_pblk_ptr],Y
                 CLC
                 BRL   main_exit
	     
dirty_cnt_changed DW    $0000
max_pcount       DW    $0000

bios_parm_block  DW    $0000
cluster_size     DB    $00
reserved_sectors DW    $0000
FAT_count        DB    $00
root_dir_count   DW    $0000
total_sectors    DW    $0000
media_desc       DB    $00
FAT_size         DW    $0000
track_size       DW    $0000
head_count       DW    $0000
hidden_sectors   DW    $0000
bpb_size         =     *-bios_parm_block

* A dir_entry record is 32-bytes long as in one_entry but...

one_entry		=	*
one_entry_name	DS	11	; +00
one_entry_attributes	DB	$00	; +11
one_entry_reserved	DS	10	; +12
one_entry_time   	DW	$0000	; +22
one_entry_date   	DW	$0000	; +24
one_entry_start_cluster	DW	$0000	; +26
one_entry_file_size	ADRL	$00000000	: +28

rfork_entry		=	*
rfork_entry_name	DS	11	; +00
rfork_entry_attributes	DB	$00	; +11
rfork_entry_reserved	DS	10	; +12
rfork_entry_time   	DW	$0000	; +22
rfork_entry_date   	DW	$0000	; +24
rfork_entry_start_cluster DW	$0000	; +26
rfork_entry_file_size	ADRL	$00000000	: +28

rfork_entry      DB    $00
one_entry+last_mod_index	; ...the FST writes in the resource fork entry
                 DB    $00
                 DB    $00
one_entry+last_mod_index+2
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
rfork_entry_start_cluster
                 DW    $0000
rfork_entry_file_size
                 ADRL  $00000000

set_fcr_status   LDY   #$0012
                 ORA   [msdos_fcr_ptr],Y
                 STA   [msdos_fcr_ptr],Y
                 RTS

users_access     DW    $0000

shutdown         CLC
                 LDAL  WARM_COLD_START
                 BNE   L1641
                 LDX   map_buffer_vp
                 LDY   map_buffer_vp+2
                 JSL   RELEASE_SEG
                 PHP
                 PHA
                 JSL   UNLOCK_MEM
                 PLA
                 PLP
L1641            RTL

map_enable_flag  DW    $0001
storage_type     DW    $0000

setup_io_buf     JSR   standard_req
                 LDY   #$0006
                 LDA   [msdos_fcr_ptr],Y
                 LDY   #$000C
                 STA   [msdos_fcr_ptr],Y
                 JSR   Cluster2Block
                 STA   $10
                 STZ   $12
                 LDY   #$000E
                 LDA   #$0000
                 STA   [msdos_fcr_ptr],Y
                 LDA   #$8002
                 STA   $1A
                 LDX   data_ptr
                 LDY   data_ptr+2
                 STX   $04
                 STY   $06
                 JSR   read_with_cache
                 RTS

curr_mod_date    ADRL  $00000000

read_write_setup LDA   user_cache
                 STA   $1A
                 STZ   tran_cnt
                 STZ   tran_cnt+2
                 LDA   pcount
                 CMP   #$0005
                 BNE   L169F
                 LDY   #$000E
                 LDA   [my_pblk_ptr],Y
                 BEQ   L169F
                 CMP   #$0001
                 BEQ   L169D
                 SEC
                 LDA   #$0053
                 BRL   main_exit

L169D            STA   $1A
L169F            LDY   #$0002
                 LDA   [my_pblk_ptr],Y
                 STA   users_buf_ptr
                 INY
                 INY
                 LDA   [my_pblk_ptr],Y
                 AND   #$00FF
                 STA   users_buf_ptr+2
                 LDY   #$000A
                 LDA   #$0000
                 STA   [my_pblk_ptr],Y
                 INY
                 INY
                 STA   [my_pblk_ptr],Y
                 LDY   #$0006
                 LDA   [my_pblk_ptr],Y
                 STA   user_req_cnt
                 INY
                 INY
                 LDA   [my_pblk_ptr],Y
                 STA   user_req_cnt+2
                 TXA
                 ORA   user_req_cnt
                 BEQ   L16D1
                 RTS

L16D1            CLC
                 BRL   main_exit

dir_last_blk     DW    $0000
def_dir_page     DS    $4C

send_info        STX   temp_ptr
                 STY   temp_ptr+2
                 STA   math_temp
                 TAX
                 BNE   L172D
                 RTS

L172D            LDX   #$00C3
                 LDA   one_entry_attributes
                 BIT   #$0001
                 BEQ   L173B
                 LDX   #$0001
L173B            BIT   #$0020
                 BEQ   L1747
                 PHA
                 TXA
                 ORA   #$0020
                 TAX
                 PLA
L1747            BIT   #$0006
                 BEQ   L1751
                 TXA
                 ORA   #$0004
                 TAX
L1751            LDY   #$0000
                 TXA
                 STA   [temp_ptr],Y
                 DEC   math_temp
                 BNE   L175D
end_send1        CLC
                 RTS

L175D            LDX   #$000F
                 LDA   one_entry_attributes
                 BIT   #$0010
                 BNE   L176B
                 JSR   get_file_type
L176B            TXA
                 LDY   #$0002
                 STA   [temp_ptr],Y
                 DEC   math_temp
                 BEQ   end_send1
                 LDY   #$0004
                 LDA   #$0000
                 STA   [temp_ptr],Y
                 INY
                 INY
                 STA   [temp_ptr],Y
                 LDA   one_entry_attributes
                 BIT   #$0010
                 BNE   L1791
                 JSR   get_file_type
                 LDY   #$0004
                 STA   [temp_ptr],Y
L1791            DEC   math_temp
                 BEQ   end_send1
                 LDY   #$0008
                 LDA   storage_type
                 LSR
                 LSR
                 LSR
                 LSR
                 STA   [temp_ptr],Y
                 DEC   math_temp
                 BEQ   end_send1
                 LDX   #$0000
                 TXY
                 JSR   unpack_time
                 LDY   #$000A
                 JSR   send_time
                 DEC   math_temp
                 BEQ   end_send1
                 LDX   one_entry_date
                 LDY   one_entry_time
                 JSR   unpack_time
                 LDY   #$0012
                 JSR   send_time
                 DEC   math_temp
                 BEQ   L1804
                 LDY   #$001A
                 LDA   [temp_ptr],Y
                 TAX
                 INY
                 INY
                 LDA   [temp_ptr],Y
                 TAY
                 BNE   L17D9
                 TXA
                 BEQ   L1802
L17D9            PEI   temp_ptr
                 PEI   temp_ptr+2
                 STX   temp_ptr
                 STY   temp_ptr+2
                 LDA   [temp_ptr]
                 CMP   #$0004
                 BCC   opt_range_err
                 TAX
                 LDA   #$0002
                 TAY
                 STA   [temp_ptr],Y
                 TXA
                 CMP   #$0006
                 BCC   opt_size_error
                 INY
                 INY
                 LDA   #$000A
                 STA   [temp_ptr],Y
                 PLA
                 STA   temp_ptr+2
                 PLA
                 STA   temp_ptr
L1802            DEC   math_temp
L1804            BEQ   L184C
                 LDY   #$001E
                 LDX   one_entry_file_size+2
                 LDA   one_entry_file_size
                 JSR   store_longword
                 DEC   math_temp
                 BEQ   L184C
                 LDX   #$0000
                 LDA   one_entry_start_cluster
                 BEQ   L1821
                 JSR   count_blks_used
L1821            LDY   #$0022
                 JSR   store_longword
                 DEC   math_temp
                 BEQ   L184C
                 LDY   #$0026
                 LDX   rfork_entry_file_size+2
                 LDA   rfork_entry_file_size
                 JSR   store_longword
                 DEC   math_temp
                 BEQ   L184C
                 LDX   #$0000
                 LDA   rfork_entry_start_cluster
                 BEQ   L1846
                 JSR   count_blks_used
L1846            LDY   #$002A
                 JSR   store_longword
L184C            CLC
                 RTS

opt_range_err    PLA
                 STA   temp_ptr+2
                 PLA
                 STA   temp_ptr
                 LDA   #$0053
                 SEC
                 RTS

opt_size_error   PLA
                 STA   temp_ptr+2
                 PLA
                 STA   temp_ptr
                 LDA   #$004F
                 SEC
                 RTS

store_longword   STA   [temp_ptr],Y
                 INY
                 INY
                 TXA
                 STA   [temp_ptr],Y
                 RTS

send_time        LDA   minutes
                 XBA
                 STA   [temp_ptr],Y
                 INY
                 INY
                 LDA   hours
                 STA   [temp_ptr],Y
                 INY
                 LDA   year
                 STA   [temp_ptr],Y
                 INY
                 LDA   day
                 BEQ   L1886
                 DEC
L1886            STA   [temp_ptr],Y
                 INY
                 LDA   month
                 BEQ   L188F
                 DEC
L188F            STA   [temp_ptr],Y
                 INY
                 LDA   day_of_week
                 XBA
                 STA   [temp_ptr],Y
                 RTS

Cluster2Block    PHY
                 PHX
                 TAY
                 BNE   L18A5
                 LDY   #$0015
                 LDA   [msdos_vcr_ptr],Y
                 BRA   L18C1
L18A5            DEC
                 DEC
                 PHA
                 LDY   #$0002
                 LDA   [msdos_vcr_ptr],Y
                 AND   #$00FF
L18B0            LSR
                 TAX
                 BCS   L18BA
                 PLA
                 ASL
                 PHA
                 TXA
                 BRA   L18B0
L18BA            PLA
                 LDY   #$001D
                 CLC
                 ADC   [msdos_vcr_ptr],Y
L18C1            PLX
                 PLY
                 RTS

device_call      LDA   $02
                 CMP   #$0005
                 BCS   L18E8
                 CMP   #$0003
                 BEQ   L18D9
                 LDA   $1A
                 AND   #$7FFF
                 STA   $1A
                 BRA   L18E1
L18D9            STA   write_occurred
                 LDA   $00
                 STA   write_dev_num
L18E1            LDA   #$0200
                 STA   $14
                 STZ   $12
L18E8            JSL   DEV_DISPATCHER
                 RTS

count_blks_used  TAX
                 BNE   real_file
                 LDY   #$001D
                 LDA   [msdos_vcr_ptr],Y
                 SEC
                 LDY   #$0015
                 SBC   [msdos_vcr_ptr],Y
                 RTS

real_file        STZ   math_temp+2
L18FE            INC   math_temp+2
                 JSR   get_FAT_entry
                 BCC   L18FE
                 LDY   #$0002
                 LDA   [msdos_vcr_ptr],Y
                 AND   #$00FF
                 PHA
                 PHA
                 PHA
                 PEI   math_temp+2
                 _Multiply
                 PLA
                 PLX
                 RTS

resource_num     DW    $0000

start_tbl        DW    $2128
                 DW    $2122
                 DW    $0000
                 DW    $2124
                 DW    $212D
                 DW    $012D
                 DW    $0027
                 DW    $0027
                 DW    $0000
                 DW    $0000
                 DW    $2122
                 DW    $0000
                 DW    $0000
                 DW    $0000
                 DW    $0000
                 DW    $0130
                 DW    $0000
                 DW    $0E26
                 DW    $6E26
                 DW    $0E22
                 DW    $2E23
                 DW    $0E25
                 DW    $0423
                 DW    $7E24
                 DW    $0423
                 DW    $0000
                 DW    $0000
                 DW    $0E32
                 DW    $0000
                 DW    $0000
                 DW    $0000
                 DW    $0123
                 DW    $0000
                 DW    $0000
                 DW    $0000
                 DW    $0127
                 DW    $0127
search_flag      DW    $0000
gbuf_addr        ADRL  $00000000
day              DW    $0000

move_dir_entry   LDY   #$001E
L1973            LDA   [$04],Y
                 STA   one_entry,Y
                 LDA   #$0000
                 STA   rfork_entry,Y
                 DEY
                 DEY
                 BPL   L1973
                 LDY   #$000B
                 LDA   [$04],Y
                 BIT   #$0008
                 BNE   L19E3
                 LDX   #$0010
                 BIT   #$0010
                 BEQ   L1997
                 LDX   #$00D0
L1997            STX   storage_type
                 SEP   #$20
                 LDY   #$0000
                 TYX
L19A0            LDA   one_entry,Y
                 CMP   #$20
                 BEQ   L19B0
                 STA   filename_text,Y
                 INY
                 CPY   #$0008
                 BCC   L19A0
L19B0            LDA   #$2E
                 STA   filename_text,Y
                 INY
L19B6            LDA   one_entry+8,X
                 CMP   #$20
                 BEQ   L19C7
                 STA   filename_text,Y
                 INY
                 INX
                 CPX   #$0003
                 BCC   L19B6
L19C7            TXA
                 BNE   L19CB
                 DEY
L19CB            STY   filename_length
                 REP   #$20
                 LDA   $30
                 AND   #$1FFF
                 CMP   #$0010
                 BEQ   L19DF
                 CMP   #$0006
                 BNE   L19E2
L19DF            JSR   chk_4_rfork
L19E2            RTS

L19E3            LDA   #$00F0
                 STA   storage_type
                 SEP   #$20
                 LDA   #$10
                 TSB   one_entry_attributes
                 LDY   #$0000
L19F3            LDA   one_entry,Y
                 CMP   #$20
                 BEQ   L1A03
                 STA   filename_text,Y
                 INY
                 CPY   #$000B
                 BCC   L19F3
L1A03            STY   filename_length
                 REP   #$20
                 RTS

chk_4_rfork      JSR   make_rfork_name
                 LDA   #$4000
                 LDX   namebuf_ptr
                 LDY   namebuf_ptr+2
                 JSR   build_path
                 LDA   $00
                 JSR   find_file
                 BCS   L1A33
                 STX   temp4_ptr
                 STY   temp4_ptr+2
                 LDY   #$001E
L1A24            LDA   [temp4_ptr],Y
                 STA   rfork_entry,Y
                 DEY
                 DEY
                 BPL   L1A24
                 LDA   #$0050
                 STA   storage_type
L1A33            LDX   namebuf_vp
                 LDY   namebuf_vp+2
                 JSL   RELEASE_SEG
                 RTS

get_dir_entry    JSR   setup_params
                 PHP
                 LDA   my_pblk_ptr+2
                 STA   temp2_ptr+2
                 CLC
                 LDA   my_pblk_ptr
                 STA   temp2_ptr
                 ADC   #$0004
                 STA   my_pblk_ptr
                 BCC   L1A52
                 INC   my_pblk_ptr+2
L1A52            PLP
                 BNE   L1A5B
                 LDA   #$000E
                 STA   pcount
L1A5B            LDY   #$001C
                 LDA   [msdos_fcr_ptr],Y
                 CMP   #$00D0
                 BCS   L1A6C
                 SEC
                 LDA   #$004A
                 BRL   main_exit
L1A6C            LDY   #$0002
                 LDA   #$0000
                 STA   [temp2_ptr],Y
                 JSR   standard_req
                 LDA   data_ptr
                 CLC
                 ADC   #$000B
                 STA   index_ptr
                 LDA   data_ptr+2
                 ADC   #$0000
                 STA   index_ptr+2
                 LDA   [my_pblk_ptr]
                 STA   base
                 CMP   #$0003
                 BCC   L1A96
                 LDA   #$0053
gde_exit         BRL   main_exit
L1A96            LDY   #$0004
                 LDA   [my_pblk_ptr],Y
                 STA   temp_ptr
                 INY
                 INY
                 LDA   [my_pblk_ptr],Y
                 AND   #$00FF
                 STA   temp_ptr+2
                 LDY   #$0002
                 LDA   [my_pblk_ptr],Y
                 STA   displacement
                 ORA   base
                 BNE   nothing_special
                 JSR   reset_gde
                 BCS   gde_exit
                 LDY   #$0020
                 LDA   [msdos_fcr_ptr],Y
                 STA   entry_offset
                 JSR   send_tot_files
                 JSR   reset_gde
                 BRL   main_exit
nothing_special  LDY   #$0020
                 LDA   [msdos_fcr_ptr],Y
                 STA   entry_offset
                 LDY   #$001E
                 LDA   [msdos_fcr_ptr],Y
                 TAY
                 BEQ   L1ADA
                 DEC
L1ADA            STA   math_temp
                 LDA   base
                 BEQ   absolute
                 DEC
                 BEQ   forward
                 SEC
                 TYA
                 SBC   displacement
                 BCS   L1AFE
end_dir_err      SEC
                 LDA   #$0061
L1AEF            BRL   main_exit
absolute         LDA   displacement
                 BRA   L1AFE
forward          CLC
                 TYA
                 ADC   displacement
                 BCS   end_dir_err
L1AFE            TAX
                 BEQ   end_dir_err
                 DEC
                 JSR   find_entry
                 BCS   L1AEF
                 LDY   #$001E
                 LDA   math_temp
                 INC
                 STA   [msdos_fcr_ptr],Y
                 LDY   #$0020
                 LDA   entry_offset
                 STA   [msdos_fcr_ptr],Y
                 CLC
                 ADC   data_ptr
                 STA   $04
                 LDA   data_ptr+2
                 ADC   #$0000
                 STA   $06
                 JSR   move_dir_entry
                 LDA   #$004F
                 STA   math_temp
                 LDA   [temp_ptr]
                 CMP   #$0004
                 BCC   L1B88
                 LDY   #$0002
                 LDA   filename_length
                 STA   [temp_ptr],Y
                 CLC
                 ADC   #$0004
                 CMP   [temp_ptr]
                 BEQ   L1B4F
                 BCC   L1B4F
                 LDA   [temp_ptr]
                 SBC   #$0004
                 BEQ   L1B88
                 BCC   L1B88
                 BRA   L1B5D
L1B4F            STZ   math_temp
                 LDA   filename_length
                 BNE   L1B5D
                 LDA   #$0051
                 SEC
                 BRL   main_exit
L1B5D            TAY
                 CLC
                 LDA   temp_ptr
                 ADC   #$0003
                 STA   temp_ptr
                 BCC   L1B6A
                 INC   temp_ptr+2
L1B6A            STY   gde_temp
                 LDY   #$0000
                 SEP   #$20
L1B72            LDA   filename_text,Y
                 INY
                 STA   [temp_ptr],Y
                 CPY   gde_temp
                 BNE   L1B72
                 REP   #$20
                 LDA   math_temp
                 CMP   #$004F
                 BEQ   L1B88
                 STZ   math_temp
L1B88            STZ   temp4_ptr
                 STZ   temp4_ptr+2
                 LDA   one_entry_attributes
                 AND   #$001C
                 BEQ   L1B97
                 BRL   L1C46
L1B97            LDY   #$0002
                 LDA   [my_fcr_ptr],Y
                 TAX
                 INY
                 INY
                 LDA   [my_fcr_ptr],Y
                 TAY
                 JSL   DEREF
                 STX   temp4_ptr
                 STY   temp4_ptr+2
                 LDA   [temp4_ptr]
                 CLC
                 ADC   L25F4
                 CLC
                 ADC   filename_length
                 CLC
                 ADC   #$0002
                 JSL   ALLOC_SEG
                 BCC   L1BC4
                 LDA   #$0054
                 BRL   main_exit
L1BC4            STX   namebuf_vp
                 STY   namebuf_vp+2
                 JSL   DEREF
                 STX   namebuf_ptr
                 STY   namebuf_ptr+2
                 SEP   #$20
                 LDY   #$0002
                 LDX   #$0000
L1BD8            INY
                 LDA   [temp4_ptr],Y
                 BEQ   L1BF4
                 CMP   #$3A
                 BNE   L1BD8
L1BE1            INY
                 LDA   [temp4_ptr],Y
                 BEQ   L1BEE
                 PHY
                 TXY
                 STA   [namebuf_ptr],Y
                 PLY
                 INX
                 BRA   L1BE1
L1BEE            TXY
                 LDA   #$3A
                 STA   [namebuf_ptr],Y
                 INX
L1BF4            TXY
                 LDX   #$0000
L1BF8            LDA   L25F4+2,X
                 STA   [namebuf_ptr],Y
                 INX
                 INY
                 CPX   L25F4
                 BCC   L1BF8
                 LDX   #$0000
L1C07            LDA   filename_text,X
                 STA   [namebuf_ptr],Y
                 INY
                 INX
                 CPX   filename_length
                 BCC   L1C07
                 LDA   #$00
                 STA   [namebuf_ptr],Y
                 REP   #$20
                 LDA   $00
                 LDX   namebuf_ptr
                 LDY   namebuf_ptr+2
                 PEI   temp_ptr+2
                 PEI   temp_ptr
                 JSR   find_file
                 PLA
                 STA   temp_ptr
                 PLA
                 STA   temp_ptr+2
                 STZ   temp4_ptr
                 STZ   temp4_ptr+2
                 BCS   L1C3E
                 STX   temp4_ptr
                 STY   temp4_ptr+2
                 LDY   #$0002
                 LDA   #$8000
                 STA   [temp2_ptr],Y
L1C3E            LDX   namebuf_vp
                 LDY   namebuf_vp+2
                 JSL   RELEASE_SEG
L1C46            SEC
                 LDA   pcount
                 SBC   #$0005
                 STA   pcount
                 BEQ   L1C55
                 JSR   send_gde_stuff
L1C55            LDA   math_temp
                 CMP   #$0001
                 BRL   main_exit

send_gde_stuff   LDA   my_pblk_ptr
                 STA   temp_ptr
                 LDA   my_pblk_ptr+2
                 STA   temp_ptr+2
                 LDY   #$0008
                 LDA   find_this_entry
                 INC
                 STA   [temp_ptr],Y
                 DEC   pcount
                 BEQ   L1C8A
                 LDY   #$000A
                 LDX   #$000F
                 LDA   storage_type
                 CMP   #$00D0
                 BCS   L1C84
                 JSR   get_file_type
L1C84            TXA
                 STA   [temp_ptr],Y
                 DEC   pcount
L1C8A            BNE   L1C8F
                 BRL   L1D14
L1C8F            JSR   send_data_eof
                 DEC   pcount
                 BEQ   L1D14
                 JSR   send_data_blks
                 DEC   pcount
                 BEQ   L1D14
                 LDX   #$0000
                 TXY
                 JSR   unpack_time
                 LDY   #$0014
                 JSR   send_time
                 DEC   pcount
                 BEQ   L1D14
                 LDX   one_entry_date
                 LDY   one_entry_time
                 JSR   unpack_time
                 LDY   #$001C
                 JSR   send_time
                 DEC   pcount
                 BEQ   L1D14
                 LDX   #$00E3
                 LDA   one_entry_attributes
                 BIT   #$0001
                 BEQ   L1CD3
                 LDX   #$0001
L1CD3            BIT   #$0020
                 BEQ   L1CDF
                 PHA
                 TXA
                 ORA   #$0020
                 TAX
                 PLA
L1CDF            BIT   #$0002
                 BEQ   L1CE9
                 TXA
                 ORA   #$0004
                 TAX
L1CE9            TXA
                 LDY   #$0024
                 STA   [temp_ptr],Y
                 DEC   pcount
                 BEQ   L1D14
                 LDA   #$0000
                 LDY   #$0026
                 STA   [temp_ptr],Y
                 INY
                 INY
                 STA   [temp_ptr],Y
                 LDA   storage_type
                 CMP   #$00D0
                 BCS   L1D11
                 JSR   get_file_type
                 DEY
                 DEY
                 STA   [temp_ptr],Y
                 INY
                 INY
L1D11            DEC   pcount
L1D14            BEQ   L1D76
                 LDA   #$000A
                 LDY   #$002A
                 STA   [temp_ptr],Y
                 DEC   pcount
                 BEQ   L1D76
                 LDY   #$002C
                 LDA   [temp_ptr],Y
                 TAX
                 INY
                 INY
                 LDA   [temp_ptr],Y
                 TAY
                 BNE   L1D33
                 TXA
                 BEQ   L1D66
L1D33            PEI   temp_ptr
                 PEI   temp_ptr+2
                 STX   temp_ptr
                 STY   temp_ptr+2
                 LDA   [temp_ptr]
                 CMP   #$0004
                 BCS   L1D47
                 LDA   #$0053
                 BRA   L1D77
L1D47            TAX
                 LDA   #$0002
                 TAY
                 STA   [temp_ptr],Y
                 TXA
                 CMP   #$0006
                 BCS   L1D59
                 LDA   #$004F
                 BRA   L1D77
L1D59            INY
                 INY
                 LDA   #$000A
                 STA   [temp_ptr],Y
                 PLA
                 STA   temp_ptr+2
                 PLA
                 STA   temp_ptr
L1D66            DEC   pcount
                 BEQ   L1D76
                 JSR   send_res_eof
                 DEC   pcount
                 BEQ   L1D76
                 JSR   send_res_blks
L1D76            RTS

L1D77            STA   math_temp
                 PLA
                 STA   temp_ptr+2
                 PLA
                 STA   temp_ptr
                 RTS

send_data_eof    LDY   #$000C
                 LDA   one_entry_file_size
                 STA   [temp_ptr],Y
                 INY
                 INY
                 LDA   one_entry_file_size+2
                 STA   [temp_ptr],Y
                 RTS

send_data_blks   LDX   #$0000
                 LDA   one_entry_start_cluster
                 BEQ   L1D9B
                 JSR   count_blks_used
L1D9B            LDY   #$0010
                 STA   [temp_ptr],Y
                 INY
                 INY
                 TXA
                 STA   [temp_ptr],Y
                 RTS

send_res_eof     LDA   temp4_ptr
                 ORA   temp4_ptr+2
                 TAX
                 BEQ   L1DB7
                 LDY   #$001E
                 LDA   [temp4_ptr],Y
                 TAX
                 DEY
                 DEY
                 LDA   [temp4_ptr],Y
L1DB7            LDY   #$0030
                 STA   [temp_ptr],Y
                 INY
                 INY
                 TXA
                 STA   [temp_ptr],Y
                 RTS

send_res_blks    LDA   temp4_ptr
                 ORA   temp4_ptr+2
                 TAX
                 BEQ   L1DD1
                 LDY   #$001A
                 LDA   [temp4_ptr],Y
                 JSR   count_blks_used
L1DD1            LDY   #$0034
                 STA   [temp_ptr],Y
                 INY
                 INY
                 TXA
                 STA   [temp_ptr],Y
                 RTS

add_entry_len    TYA
                 CLC
                 ADC   #$0020
                 TAY
                 RTS

sub_entry_len    TYA
                 SEC
                 SBC   #$0020
                 TAY
                 RTS

send_tot_files   LDA   pcount
                 CMP   #$0006
                 BCC   L1E04
                 LDA   #$0001
                 STA   math_temp
                 LDA   #$FFFF
                 JSR   find_entry
                 LDA   math_temp
                 LDY   #$0008
                 STA   [my_pblk_ptr],Y
L1E04            RTS

reset_gde        LDY   #$0006
                 LDA   [msdos_fcr_ptr],Y
                 LDY   #$000C
                 CMP   [msdos_fcr_ptr],Y
                 BNE   L1E1A
                 TAX
                 LDY   #$000E
                 LDA   [msdos_fcr_ptr],Y
                 BEQ   L1E2F
                 TXA
L1E1A            LDY   #$000C
                 STA   [msdos_fcr_ptr],Y
                 LDY   #$000E
                 LDA   #$0000
                 STA   [msdos_fcr_ptr],Y
                 JSR   read_gde_blk
                 BCS   L1E5D
                 LDA   #$0000
L1E2F            LDY   #$0020
                 STA   [msdos_fcr_ptr],Y
                 LDY   #$001E
                 STA   [msdos_fcr_ptr],Y
                 LDY   #$0006
                 LDA   [msdos_fcr_ptr],Y
                 BEQ   L1E5C
                 LDA   [data_ptr]
                 AND   #$00FF
                 CMP   #$002E
                 BNE   L1E5E
                 LDY   #$0020
                 LDA   [data_ptr],Y
                 CMP   #$2E2E
                 BNE   L1E5E
                 LDA   #$0040
                 LDY   #$0020
                 STA   [msdos_fcr_ptr],Y
L1E5C            CLC
L1E5D            RTS

L1E5E            SEC
                 LDA   #$0051
                 BRL   main_exit
read_gde_blk     LDY   #$000C
                 LDA   [msdos_fcr_ptr],Y
                 JSR   Cluster2Block
                 CLC
                 LDY   #$000E
                 ADC   [msdos_fcr_ptr],Y
                 STA   $10
                 LDA   my_fcr_ptr
                 ADC   #$0038
                 STA   $04
                 LDA   my_fcr_ptr+2
                 ADC   #$0000
                 STA   $06
                 JSR   read_with_cache
                 RTS

load_ext_blk     JSR   set_default_buf
                 JSR   standard_req
                 LDA   one_entry+key_blk_index
                 STA   $10
                 JSR   read_with_cache
                 BCC   L1E9A
                 BRL   main_exit
L1E9A            RTS

find_entry       LDY   entry_offset
                 STA   find_this_entry
                 CMP   math_temp
                 BEQ   L1EDA
                 BCC   L1F16
L1EA7            CPY   #$01E0
                 BCS   L1EDE
                 JSR   add_entry_len
L1EAF            LDA   [data_ptr],Y
                 AND   #$00FF
                 BEQ   L1F11
                 CMP   #$00E5
                 BEQ   L1EA7
                 CMP   #$002E	; .
                 BEQ   L1EA7
                 LDA   [index_ptr],Y
                 BIT   #$0008
                 BNE   L1EA7
                 JSR   chkResName
                 BCS   L1EA7
                 STY   entry_offset
                 INC   math_temp
                 LDA   math_temp
                 CMP   find_this_entry
                 BNE   L1EA7
L1ED8            CLC
                 RTS

L1EDA            DEC   math_temp
                 BRA   L1EAF
L1EDE            LDY   #$000E
                 LDA   [msdos_fcr_ptr],Y
                 INC
                 STA   [msdos_fcr_ptr],Y
                 LDY   #$0010
                 CMP   [msdos_fcr_ptr],Y
                 BCC   L1F06
                 LDY   #$000C
                 LDA   [msdos_fcr_ptr],Y
                 BEQ   L1F11
                 JSR   get_FAT_entry
                 BCS   L1F11
                 LDY   #$000C
                 STA   [msdos_fcr_ptr],Y
                 LDA   #$0000
                 LDY   #$000E
                 STA   [msdos_fcr_ptr],Y
L1F06            JSR   read_gde_blk
                 LDY   #$0000
                 BCC   L1EAF
                 BRL   main_exit
L1F11            SEC
                 LDA   #$0061
                 RTS

L1F16            TYA
                 BEQ   L1F40
                 JSR   sub_entry_len
L1F1C            LDA   [data_ptr],Y
                 AND   #$00FF
                 BEQ   L1F11
                 CMP   #$00E5
                 BEQ   L1F16
                 CMP   #$002E
                 BEQ   L1F16
                 JSR   chkResName
                 BCS   L1F16
                 STY   entry_offset
                 DEC   math_temp
                 LDA   math_temp
                 CMP   find_this_entry
                 BNE   L1F16
                 BRA   L1ED8
L1F40            LDY   #$000E
                 LDA   [msdos_fcr_ptr],Y
                 BNE   L1F5D
                 JSR   reset_gde
                 LDY   #$001E
                 LDA   [msdos_fcr_ptr],Y
                 STA   math_temp
                 LDY   #$0020
                 LDA   [msdos_fcr_ptr],Y
                 STA   entry_offset
                 TAY
                 BRL   L1EAF
L1F5D            DEC
                 STA   [msdos_fcr_ptr],Y
                 JSR   read_gde_blk
                 LDY   #$01E0
                 BCC   L1F1C
                 BRL   main_exit
chkResName       PHY
                 TYA
                 CLC
                 ADC   #$000A
                 TAY
                 LDX   #$000A
                 SEP   #$20
L1F77            LDA   L1F89,X
                 CMP   [data_ptr],Y
                 BNE   L1F83+1
                 DEY
                 DEX
                 BPL   L1F77
                 SEC
L1F83            BCC   gstring+9
                 REP   #$20
                 PLY
                 RTS

L1F89            ASC   'RESOURCEFRK'
gstring          DS    $14
user_cache       DW    $0000
cp_device_flag   DW    $0000

num_seq_blks     JSR   get_data_num
                 STA   index_ptr+2
                 LDY   #$0010
                 SEC
                 SBC   [msdos_fcr_ptr],Y
                 EOR   #$FFFF
                 INC
                 STA   math_temp
                 PHX
                 TXA
                 INC
                 STA   entries_checked
L1FC3            TXA
                 JSR   get_FAT_entry
                 BCS   L1FDF
                 CMP   entries_checked
                 BNE   L1FDF
                 TAX
                 INC
                 STA   entries_checked
                 LDY   #$0010
                 CLC
                 LDA   [msdos_fcr_ptr],Y
                 ADC   math_temp
                 STA   math_temp
                 BRA   L1FC3
L1FDF            PLX
                 LDY   index_ptr+2
                 LDA   math_temp
                 RTS

base             DW    $0000

find_volume      LDA   #$0001
                 STA   search_device
                 STZ   skip_dev
                 JSR   chk_vol_syntax
                 LDX   #volume_name
                 LDY   #^volume_name
                 LDA   #$0000
                 JSL   FIND_VCR
                 BCS   L2026
                 JSL   DEREF
                 STX   my_vcr_ptr
                 STY   my_vcr_ptr+2
                 LDY   #$000A
                 LDA   [my_vcr_ptr],Y
                 CMP   #$000A	; fst_id
                 BEQ   L2019
                 LDA   #$0052
                 SEC
                 RTS

L2019            LDY   #$000C
                 LDA   [my_vcr_ptr],Y
                 STA   search_device
                 STA   skip_dev
                 BRA   L202E
L2026            LDA   search_device
                 CMP   skip_dev
                 BEQ   L2044
L202E            JSR   id_disk
                 BCC   L2049
                 CMP   #$0011
                 BEQ   L203F
                 CMP   #$0057
                 BEQ   L2042
                 BRA   L207B
L203F            LDA   #$0045
L2042            SEC
                 RTS

L2044            INC   search_device
                 BRA   L2026
L2049            LDA   gstring
                 CMP   volume_name
                 BNE   L207B
                 TAY
                 PHP
                 SEP   #$20
L2055            LDA   gstring+1,Y
                 EOR   volume_name+1,Y
                 BEQ   L2074
                 CMP   #$20
                 BNE   L207A
                 LDA   gstring+1,Y
                 CMP   #$41
                 BCC   L207A
                 CMP   #$5B
                 BCC   L2074
                 CMP   #$61
                 BCC   L207A
                 CMP   #$7B
                 BCS   L207A
L2074            DEY
                 BNE   L2055
                 PLP
                 CLC
                 RTS

L207A            PLP
L207B            LDA   skip_dev
                 CMP   search_device
                 BNE   L2044
                 STZ   search_device
                 BRA   L2044

chk_vol_syntax   SEP   #$30
                 LDY   volume_name
                 CPY   #$0C
                 BCS   L209E
L2091            LDA   volume_name+1,Y
                 CMP   #$3A
                 BEQ   L209E
                 DEY
                 BNE   L2091
                 REP   #$31
                 RTS

L209E            REP   #$30
                 LDA   #$0040
                 BRL   main_exit

search_device    DW    $0000
skip_dev         DW    $0000

mount_volume     JSR   save_the_world
                 JSR   setup_vol_mesg
L20B0            JSR   find_volume
                 BCC   L20BE
                 JSR   issue_mount
                 BCC   L20B0
                 JSR   restore_world
                 RTS

L20BE            LDA   $00
                 JSR   restore_world
                 STA   $00
                 LDY   #$000C
                 STA   [my_vcr_ptr],Y
                 LDY   #$0006
                 LDA   [my_vcr_ptr],Y
                 AND   #$BFFF
                 STA   [my_vcr_ptr],Y
                 CLC
                 RTS

save_the_world   PHP
                 PHY
                 PHX
                 PHA
                 LDA   world_flag
                 BNE   L211C
                 INC   world_flag
                 LDX   #$004A
L20E5            LDA   $00,X
                 STA   direct_page,X
                 DEX
                 BPL   L20E5
                 LDX   #$0052
L20F0            LDA   fst_start,X
                 STA   my_direct,X
                 DEX
                 BPL   L20F0
                 BRA   L2117

restore_world    PHP
                 PHY
                 PHX
                 PHA
                 LDX   #$004A
L2101            LDA   direct_page,X
                 STA   $00,X
                 DEX
                 BPL   L2101
                 LDX   #$0052
L210C            LDA   my_direct,X
                 STA   fst_start,X
                 DEX
                 BPL   L210C
                 DEC   world_flag
L2117            PLA
                 PLX
                 PLY
                 PLP
                 RTS

L211C            JSL   SYS_DEATH

search_name      DS    $B
cp_flags         DW    $0000
direct_page      DS    $4C

setup_curr_eof   LDY   #$0008
                 LDA   [msdos_fcr_ptr],Y
                 STA   curr_eof
                 INY
                 INY
                 LDA   [msdos_fcr_ptr],Y
                 STA   curr_eof+2
                 RTS

minutes          DW    $0000
map_buffer_vp    ADRL  $00000000
dummy_name       ASC   'cant.find.me'
                 DW    $0000

issue_mount      LDA   volume_name
                 XBA
                 STA   volume_name
                 PEA   ^volume_name
                 PEA   volume_name+1
                 LDA   #$0001
                 JSL   MOUNT_MESSAGE
                 TAX
                 LDA   volume_name
                 XBA
                 STA   volume_name
                 TXA
                 BNE   L21BE
                 CLC
                 RTS

L21BE            SEC
                 LDA   #$0045
                 RTS

find_this_entry  DW    $0000

map_enable       LDY   #$0006
                 LDA   [$32],Y
                 CMP   map_enable_flag
                 STA   map_enable_flag
                 BEQ   L21D5
                 JSR   post_volume_changed
L21D5            CLC
                 RTS

activate_vcr     LDY   #$0006
                 LDA   [my_vcr_ptr],Y
                 AND   #$BFFF
                 STA   [my_vcr_ptr],Y
                 RTS

entry_sto_type   DW    $0000

rw_adjust        CLC
                 LDA   users_buf_ptr
                 ADC   $08
                 STA   users_buf_ptr
                 LDA   users_buf_ptr+2
                 ADC   $0A
                 STA   users_buf_ptr+2
                 LDA   tran_cnt
                 ADC   $08
                 STA   tran_cnt
                 LDA   tran_cnt+2
                 ADC   $0A
                 STA   tran_cnt+2
                 LDA   curr_mark
                 ADC   $08
                 STA   curr_mark
                 LDA   curr_mark+2
                 ADC   $0A
                 STA   curr_mark+2
                 SEC
                 LDA   user_req_cnt
                 SBC   $08
                 STA   user_req_cnt
                 LDA   user_req_cnt+2
                 SBC   $0A
                 STA   user_req_cnt+2
                 RTS

length           DW    $0000
newline_len      DW    $0000

check_dup        STZ   fcr_wanted
                 LDX   one_entry_start_cluster
                 LDA   resource_num
                 BEQ   L2235
                 LDX   rfork_entry_start_cluster
L2235            STX   key_block
L2238            JSR   get_next_fcr
                 BCS   L2271
                 LDY   #$0008
                 LDA   [my_fcr_ptr],Y
                 CMP   [my_vcr_ptr]
                 BNE   L2238
                 LDY   #$0006
                 LDA   [msdos_fcr_ptr],Y
                 CMP   key_block
                 BNE   L2238
                 LDY   #$0014
                 LDA   [my_fcr_ptr],Y
                 AND   #$3FFF
                 CMP   #$0002
                 BCS   L2267
                 LDA   users_access
                 BEQ   L226B
                 CMP   #$0002
                 BCC   L226A
L2267            LDA   #$0050
L226A            RTS

L226B            LDA   #$0001
                 STA   access
L2271            CLC
                 RTS

setup_io_ptrs    STZ   data_ptr
                 STZ   data_ptr+2
                 LDY   #$0012
                 LDA   [msdos_fcr_ptr],Y
                 AND   #$4000
                 BEQ   L2290
                 CLC
                 LDA   my_fcr_ptr
                 ADC   #$0038
                 STA   data_ptr
                 LDA   my_fcr_ptr+2
                 ADC   #$0000
                 STA   data_ptr+2
L2290            RTS

entries_blk_num  DW    $0000
free_dir_offset  DW    $0000

flush_file       STZ   flush_entry
                 BRA   cont_flush
do_fast_flush    LDA   #$0001
                 BRA   stuffit
flush_io_buffer  LDA   #$FFFF
stuffit          STA   flush_entry
cont_flush       CLC
                 RTS

get_map_size     JSR   deref_map
                 LDA   [map_ptr]
                 LDY   #$0006
                 STA   [$32],Y
                 CLC
                 RTS

get_next_fcr     LDA   fcr_wanted
                 INC
                 STA   fcr_wanted
                 JSL   GET_FCR
                 BCS   L22D6
                 JSL   DEREF
                 STX   my_fcr_ptr
                 STY   my_fcr_ptr+2
                 LDY   #$0006
                 LDA   [my_fcr_ptr],Y
                 CMP   #$000A
                 BNE   get_next_fcr
                 JSR   setup_my_fcr
                 CLC
L22D6            RTS

dev_with_mount   JSR   device_call
                 BCS   L22DD
                 RTS

L22DD            CMP   #$002E
                 BEQ   L22E9
                 CMP   #$002F
                 BEQ   L22E9
                 SEC
                 RTS

L22E9            JSR   mount_volume
                 BCC   dev_with_mount
                 RTS

get_FAT_entry    PHA
                 LDY   #$001B
                 LDA   [msdos_vcr_ptr],Y
                 BNE   L2310
                 LDA   $01,S
                 LSR
                 PHP
                 CLC
                 ADC   $02,S
                 TAY
                 LDA   [fat_ptr],Y
                 PLP
                 BCC   L2308
                 LSR
                 LSR
                 LSR
                 LSR
L2308            AND   #$0FFF
                 PLY
                 CMP   #$0FF0
                 RTS

L2310            LDA   $01,S
                 ASL
                 TAY
                 LDA   [fat_ptr],Y
                 PLY
                 CMP   #$FFF0
                 RTS

access           DW    $0000

calc_curr_mark   JSR   setup_curr_eof
                 JSR   setup_curr_mark
                 LDA   base
                 BEQ   L2374
                 DEC
                 BEQ   L2346
                 DEC
                 BEQ   L235D
                 SEC
                 LDA   curr_mark
                 SBC   displacement
                 STA   curr_mark
                 LDA   curr_mark+2
                 SBC   displacement+2
                 STA   curr_mark+2
                 BCS   L235B
L2343            SEP   #$41
                 RTS

L2346            SEC
                 LDA   curr_eof
                 SBC   displacement
                 STA   curr_mark
                 LDA   curr_eof+2
                 SBC   displacement+2
                 STA   curr_mark+2
                 BCC   L2343
L235B            CLC
                 RTS

L235D            CLC
                 LDA   curr_mark
                 ADC   displacement
                 STA   curr_mark
                 LDA   curr_mark+2
                 ADC   displacement+2
                 STA   curr_mark+2
                 BCC   L2380
L2372            CLV
                 RTS

L2374            LDA   displacement
                 STA   curr_mark
                 LDA   displacement+2
                 STA   curr_mark+2
L2380            LDA   curr_mark+2
                 CMP   curr_eof+2
                 BEQ   L238B
                 BCS   L2372
                 RTS

L238B            LDA   curr_mark
                 CMP   curr_eof
                 BEQ   L2395
                 BCS   L2372
L2395            CLC
                 RTS

expand_record_expand_flag
                 DW    $0000
expand_record_expand_file 
                 DW    $0000
expand_record_expand_storage
                 DW    $0000
expand_record_expand_key_blk
                 DW    $0000
expand_record_expand_blks_used
                 DW    $0000
expand_record_expand_eof
                 ADRL  $00000000

set_map_table    LDA   map_buffer_vp
                 LDX   map_buffer_vp+2
                 STA   index_ptr
                 STX   index_ptr+2
                 LDY   #$0006
                 LDA   [$32],Y
                 STA   temp_ptr
                 INY
                 INY
                 LDA   [$32],Y
                 STA   temp_ptr+2
                 LDA   [temp_ptr]
                 JSL   ALLOC_SEG
                 LDA   #$0054
                 BCS   L23F1
                 STX   map_buffer_vp
                 STY   map_buffer_vp+2
                 JSL   DEREF
                 STX   map_ptr
                 STY   map_ptr+2
                 LDA   [temp_ptr]
                 TAY
                 SEP   #$20
L23DA            DEY
                 BMI   L23E3
                 LDA   [temp_ptr],Y
                 STA   [map_ptr],Y
                 BRA   L23DA
L23E3            REP   #$20
                 LDX   index_ptr
                 LDY   index_ptr+2
                 JSL   RELEASE_SEG
                 JSR   post_volume_changed
                 CLC
L23F1            RTS

get_map_table    JSR   deref_map
                 LDY   #$0006
                 LDA   [$32],Y
                 STA   temp_ptr
                 INY
                 INY
                 LDA   [$32],Y
                 STA   temp_ptr+2
                 LDA   [map_ptr]
                 TAY
                 SEP   #$20
L2407            DEY
                 BMI   L2410
                 LDA   [map_ptr],Y
                 STA   [temp_ptr],Y
                 BRA   L2407
L2410            REP   #$20
                 CLC
                 RTS

class            DW    $0000

check_base       LDA   [my_pblk_ptr],Y
                 CMP   #$0004
                 BCS   L2421
                 STA   base
                 RTS

L2421            LDA   #$0053
                 BRL   main_exit

post_volume_changed            LDA   #$0001
L242A            JSL   GET_VCR
                 BCS   L2465
                 JSL   DEREF
                 STX   temp_ptr
                 STY   temp_ptr+2
                 LDY   #$000A
                 LDA   [temp_ptr],Y
                 CMP   #$000A
                 BNE   L2460
                 LDY   #$0006
                 LDA   [temp_ptr],Y
                 AND   #$4000
                 BNE   L2460
                 PEA   $2033
                 LDY   #$000C
                 LDA   [temp_ptr],Y
                 PHA
                 PHA
                 LDA   #$0040
                 LDX   #$0000
                 JSL   POST_OS_EVENT
L2460            LDA   #$0000
                 BRA   L242A
L2465            RTS

year             DW    $0000

fill_io_buf      STZ   mark_changed
                 JSR   setup_curr_eof
                 LDA   curr_mark
                 ORA   curr_mark+2
                 BEQ   mark_ok
                 LDA   curr_mark+2
                 CMP   curr_eof+2
                 BCC   mark_ok
                 LDA   curr_mark
                 CMP   curr_eof
                 BCC   mark_ok
                 SBC   #$0001
                 STA   curr_mark
                 LDA   curr_mark+2
                 SBC   #$0000
                 STA   curr_mark+2
                 DEC   mark_changed
mark_ok          JSR   standard_req
                 JSR   get_data_num
                 STX   index_ptr
                 STA   index_ptr+2
                 LDY   #$000E
                 CMP   [msdos_fcr_ptr],Y
                 BNE   load_data
                 LDY   #$000C
                 TXA
                 CMP   [msdos_fcr_ptr],Y
                 BEQ   exit_fill_data
load_data        JSR   chk_data_clean
                 BCS   outta_here
                 LDA   index_ptr
                 JSR   Cluster2Block
                 CLC
                 ADC   index_ptr+2
                 STA   $10
                 STZ   $12
                 LDA   data_ptr
                 STA   $04
                 LDA   data_ptr+2
                 STA   $06
                 JSR   read_with_mount
                 BCS   outta_here
store_data_num   LDY   #$000C
                 LDA   index_ptr
                 STA   [msdos_fcr_ptr],Y
                 LDY   #$000E
                 LDA   index_ptr+2
                 STA   [msdos_fcr_ptr],Y
exit_fill_data   CLC
outta_here       PHP
                 PHA
                 BIT   mark_changed
                 BPL   no_change
                 INC   curr_mark
                 BNE   no_change
                 INC   curr_mark+2
no_change        PLA
                 PLP
                 RTS

get_data_num     LDA   curr_mark+3
                 LSR
                 LDA   curr_mark+1
                 ROR
                 PHA
                 LDY   #$0006
                 LDA   [msdos_fcr_ptr],Y
                 TAX
L24FF            LDY   #$0010
                 LDA   $01,S
                 CMP   [msdos_fcr_ptr],Y
                 BEQ   L250A
                 BCC   L2516
L250A            SEC
                 SBC   [msdos_fcr_ptr],Y
                 STA   $01,S
                 TXA
                 JSR   get_FAT_entry
                 TAX
                 BRA   L24FF
L2516            PLA
                 RTS

chk_data_clean   CLC
                 PHY
                 LDY   #$0012
                 LDA   [msdos_fcr_ptr],Y
                 AND   #$0004
                 BEQ   L2524
L2524            PLY
                 RTS

check_spans      LDA   $42
                 AND   #$4000
                 BEQ   L253D
                 LDA   $44
                 BEQ   L2536
                 CMP   #$000D
                 BCC   L253D
L2536            SEC
L2537            LDA   #$0040
                 BRL   main_exit
L253D            LDA   $42
                 AND   #$0040
                 BEQ   L254D
                 LDA   $46
                 BEQ   L2536
                 CMP   #$000D
                 BCS   L2537
L254D            RTS

and_mask         DW    $0000
my_direct        DS    $78

vol_to_buffer    LDY   #$0001
L25CB            LDA   [temp_ptr],Y
                 AND   #$00FF
                 BEQ   L25E7
                 CMP   #$003A
                 BEQ   L25E7
                 STA   volume_name+1,Y
                 INY
                 CPY   #$000D
                 BCC   L25CB
                 LDA   #$0040
                 SEC
                 BRL   main_exit
L25E7            TAX
                 LDA   #$0000
                 STA   volume_name+1,Y
                 DEY
                 STY   volume_name
                 TXA
                 RTS

L25F4            STRL  'RESOURCE.FRK:'

unpack_time      STX   pro_time
                 STY   pro_time+2
                 JSR   zero_date
                 TXA
                 ORA   pro_time+2
                 BEQ   L268E
                 LDA   pro_time
                 AND   #$001F
                 STA   day
                 CMP   #$0020
                 BCS   zero_date
                 TAY
                 TXA
                 LSR
                 LSR
                 LSR
                 LSR
                 LSR
                 AND   #$000F
                 STA   month
                 CMP   #$000D
                 BCS   zero_date
                 TAX
                 LDA   pro_time
                 XBA
                 LSR
                 AND   #$007F
                 CLC
                 ADC   #$0050
                 STA   year
                 JSR   dow_convert
                 STA   day_of_week
                 LDA   pro_time+2
                 AND   #$000F
                 ASL
                 STA   seconds
                 CMP   #$003C
                 BCS   zero_date
                 LDA   pro_time+2
                 LSR
                 LSR
                 LSR
                 LSR
                 LSR
                 AND   #$003F
                 STA   minutes
                 CMP   #$003C
                 BCS   zero_date
                 LDA   pro_time+2
                 XBA
                 LSR
                 LSR
                 LSR
                 AND   #$001F
                 STA   hours
                 CMP   #$0018
                 BCC   L268E
zero_date        STZ   hours
                 STZ   minutes
                 STZ   year
                 STZ   month
                 STZ   day
                 STZ   day_of_week
L268E            RTS

hours            DW    $0000
displacement     ADRL  $00000000

flush_entry      DW    $0000
month            DW    $0000
day_of_week      DW    $0000
world_flag       DW    $0000

make_rfork_name  PEI   math_temp
                 LDA   [$3A]
                 CLC
                 ADC   #$0019
                 JSL   ALLOC_SEG
                 BCC   L26AE
                 BRL   main_exit
L26AE            STX   namebuf_vp
                 STY   namebuf_vp+2
                 JSL   DEREF
                 STX   namebuf_ptr
                 STY   namebuf_ptr+2
                 LDA   [$3A]
                 INC
                 STA   temp4_ptr
                 INC   temp4_ptr
                 TAY
                 SEP   #$20
                 LDA   #$3A
L26C6            DEY
                 CPY   #$0002
                 BCC   L26D0
                 CMP   [$3A],Y
                 BNE   L26C6
L26D0            INY
                 STY   math_temp
                 CPY   #$0002
                 BEQ   L26E4
                 LDY   #$0002
L26DB            LDA   [$3A],Y
                 STA   [namebuf_ptr],Y
                 INY
                 CPY   math_temp
                 BCC   L26DB
L26E4            LDX   #$0000
L26E7            LDA   L25F4+2,X
                 STA   [namebuf_ptr],Y
                 INY
                 INX
                 CPX   L25F4
                 BCC   L26E7
                 TYX
                 LDY   math_temp
L26F6            LDA   [$3A],Y
                 PHY
                 TXY
                 STA   [namebuf_ptr],Y
                 INX
                 PLY
                 INY
                 CPY   temp4_ptr
                 BCC   L26F6
                 LDA   #$00
                 TXY
                 STA   [namebuf_ptr],Y
                 REP   #$20
                 TXA
                 DEC
                 DEC
                 STA   [namebuf_ptr]
                 PLA
                 STA   math_temp
                 RTS

gde_temp         DW    $0000
seconds          DW    $0000
key_block        DW    $0000
mark_changed     DW    $0000

dow_convert      PHP
                 SEP   #$30
                 PHY
                 TAY
                 LSR
                 LSR
                 STA   dow_temp
                 TYA
                 AND   #$03
                 BNE   L272F
                 CPX   #$03
                 BCS   L272F
                 DEY
L272F            CLC
                 TYA
                 ADC   dow_temp
                 ADC   dow_temp,X
                 ADC   $01,S
                 PLY
                 SEC
L273B            SBC   #$07
                 CMP   #$08
                 BCS   L273B
                 PLP
	     MX    %00
                 RTS

dow_temp         DB    $00
wkmon            HEX   080B0B07090C070A0D080B0D
pro_time         ADRL  $00000000

*-------------------------------------------
	
