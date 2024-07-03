;...............................................................
;
; FILE : HLS.S                          - protection -
;        -----
;...............................................................
         keep  HLS
         65816 on
         mcopy Hls.macros
         longi on
         longa on
;...............................................................
;
;        HLS.DEB
;
;...............................................................
HLS_DEB  START
;--
         brl   HLS

         END
;...............................................................
;
;        HLS
;
;...............................................................
HLS      START
         Using GlobalData
;--------------------------------------
X        gequ  $10                      ;X/Y Reg
M        gequ  $20                      ;A Reg
;--------------------------------------
         phb
         phk                            ; (a trick for short addressing)
         plb
;--
         lda   >MyID
         pha
         JSL   HlsOpen
         pla
;--
Encore   jsr   TestDrives               ; Find that signature
;--
         lda >Result_Upro3
         beq Suite
;--
         jsr Le_Disk                    ; demande du disk
         bra Encore
;--
Suite    jsl   HlsClose
;--
         plb
         rtl

         END
;...............................................................
;
;  TestDrives - call the HLSPRO code and display the results
;
;...............................................................
TestDrives  START
         Using GlobalData
;--
basl     equ   00
bash     equ   01
;--
         lda #0
         sta >Result_Upro3
;--
         php
         sep   #X+M             ;Bytes
         LONGA off
         LONGI off
;--
         ldx   #32                      ;Test track 32 / Side 1
         ldy   #01
         jsr   my_call
         bcs   error
;--
         jsr   test_Lg_T32
         bcs   error
;--
         ldx   #33                      ;Test track 33 / Side 1
         ldy   #01                      ; (Should be shorter)
         jsr   my_call
         bcs   error
;--
         jsr   test_lg_T33
         bcs   error
;--
back     plp
         rts
;--
error    lda   >Result_Upro3
         inc   a
         sta   >Result_Upro3
         plp
         rts
;--------------------------------------
;        Call Routine
;--------------------------------------
my_call  anop
         stx   track
         sty   side
         phy
         phx
         pea   disk_name|-16
         pea   disk_name         
         jsl   HLSPRO
         sta   err
         pla
         pla                            ;Add 6 to sp
         pla
         pla
         pla
         pla
         lda   err
         rts
;--------------------------------------
;        Test_Lg_T32
;--------------------------------------
Test_Lg_T32    ANOP

               stx lenght               |la longueur
               sty lenght+1

               php                      |en 16 bits
               rep #$30
               longa on
               longi on

               lda lenght               |longueur piste 31 side 1
               cmp #8000
               bcc NoGood32
               cmp #8201
               bcs NoGood32
;--
               plp
               clc
               rts
;--
NoGood32       plp
               sec
               rts

               longa off
               longi off
;--------------------------------------
;        Test_Lg_T33
;--------------------------------------
Test_Lg_T33    ANOP

               stx lenght               |la longueur
               sty lenght+1

               php                      |en 16 bits
               rep #$30

               longa on
               longi on

               lda lenght               |longueur piste 32 side 1
               cmp #7600
               bcc NoGood33
               cmp #7801
               bcs NoGood33
;--
               plp
               clc
               rts
;--
NoGood33       plp
               sec
               rts
;...............................................................
;
;        Le_Disk
;
;...............................................................
Le_Disk        ENTRY
;--
               jsr xor_text
;--
               PushWord #0
               PushLong #Alert_Disk
               PushLong #0
               _StopAlert
               pla
;--
               jsr xor_text
;--
FDP            rts
;--------------------------------------
;        xor_text
;--------------------------------------
xor_text       ANOP

               sep #$20
               longa off

               ldx #26
Rxor_text      lda IMDK1,x
               eor #$55
               sta IMDK1,x
               dex
               bne Rxor_text

               rep #$20
               longa on

               rts
;--------------------------------------
;        Alert_Disk
;--------------------------------------
Alert_Disk     ANOP
               dc i'50,30,110,290'
               dc i'1'
               dc i1'$81'
               dc i1'$81'
               dc i1'$81'
               dc i1'$81'
               dc i4'ItemDk1'           |ok
               dc i4'ItemDk2'           |disk
               dc i4'0'
;--
ItemDk1        anop
               dc i'1'
               dc i'35,95,55,165'
               dc i'$000A'
               dc i4'okDk1'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
ItemDk2        anop
               dc i'2'
               dc i'10,50,30,250'
               dc i'$800F'
               dc i4'IMDk1'
               dc i'0'
               dc i'0'
               dc i4'0'
;--
track    dc    i1' 32'
side     dc    i1'$01'
err      dc    i1'$00'
;--
Lenght         ds 2
OkDk1          str 'Ok'
IMDk1          dc i1'26'
               dc h'1C3B2630272175063D3A221A33337518342621302775113C263E'
;                   I n s e r t * S h o w O f f * M a s t e r * D i s k '
;--
Disk_name  anop
         dc    c'SHOWOFF'               |c'HLS.SIG'
         dc    h'00'
;--
work_buf ds    512
;--
         END

         copy Upro3.s                   |source protection
