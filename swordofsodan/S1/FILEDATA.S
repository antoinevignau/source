*
* Sword of Sodan: the game
*
* (c) 1989, Discovery Software
* (s) 2018, Brutal Deluxe Software
*

         mx    %00
         TYP   BIN
         ORG   $00A000
         lst   off

*----------------------------

LA000    DA    LA010	; 0
         DA    LA012	; 1
         DA    LA030	; 2
         DA    LA03C	; 3
         DA    LA052	; 4
         DA    LA068	; 5
         DA    LA07E	; 6
         DA    LA088	; 7

* MAIN PROGRAM

LA010    DA    LA09C	; 0/0 SODAN, SODAN0, FONT

* MISC SPRITES

LA012    DA    LA0DE	; 1/0 - L.PIC
         DA    LA0F7	; 1 - T.PIC
         DA    LA110	; 2 - M.PIC
         DA    LA126	; 3 - M.PIC
         DA    LA13C	; 4 - CA.PIC
         DA    LA156	; 5 - CA.PIC
         DA    LA170	; 6 - SC.PIC
         DA    LA18A	; 7 - SC.PIC
         DA    LA1A4	; 8 - SC.PIC
         DA    LA1BE	; 9 - SE.PIC
         DA    LA1D5	; A - H0.PIC H1.PIC
         DA    LA204	; B - EO.PIC E1.PIC E2.PIC
         DA    LA24E	; C - C.PIC
         DA    LA267	; D - H.PIC
         DA    LA281	; E - J.PIC

* PLAYER SPRITES

LA030    DA    LA29A	; 2/0
         DA    LA2CE	; 1
         DA    LA2E7	; 2
         DA    LA319	; 3
         DA    LA333	; 4
         DA    LA34D	; 5
         
* ENEMIES

LA03C    DA    LA381	; 3/0
         DA    LA381	; 1
         DA    LA3B7	; 2
         DA    LA3ED	; 3
         DA    LA423	; 4
         DA    $0000	; 5
         DA    LA459	; 6
         DA    $0000	; 7
         DA    LA4C3	; 8
         DA    $0000	; 9
         DA    LA4DF	; A

* LEVEL SPRITES
         
LA052    DA    LA53D	; 4/0
         DA    LA557	; 1
         DA    LA571	; 2
         DA    LA58B	; 3
         DA    LA5A5	; 4
         DA    LA5BF	; 5
         DA    LA5D9	; 6
         DA    LA5F3	; 7
         DA    LA639	; 8
         DA    $0000	; 9
         DA    LA653	; A
         
* LEVEL SPRITES

LA068    DA    LA66A	; 5/0
         DA    LA69C	; 1
         DA    LA6CE	; 2
         DA    LA700	; 3
         DA    LA72C	; 4
         DA    LA75E	; 5
         DA    LA790	; 6
         DA    LA7C2	; 7
         DA    LA7E5	; 8
         DA    LA808	; 9
         DA    LA83A	; A
         
* SOUNDS

LA07E    DA    LA86C	; 6/0
         DA    LA883	; 1
         DA    LA89A	; 2
         DA    LA8C6	; 3
         DA    LA8DD	; 4

* SOUNDS
         
LA088    DA    LA8F4	; 7/0
         DA    LA94E	; 1
         DA    LA992	; 2
         DA    LA9D6	; 3
         DA    LAA1A	; 4
         DA    LAA48	; 5
         DA    LAAA2	; 6
         DA    LAAD0	; 7
         DA    LAB14	; 8
         DA    LAB58	; 9

LA09C    DA    LA0BC
         ADRL  $00020000
         ADRL  $00000000
         DA    LA0C6
         ADRL  $00028400
         ADRL  $00000000
         DA    LA0D1
         ADRL  $00001400
         ADRL  $0001A000
         DW    $FFFF
LA0BC    STR   'S1/SODAN'
LA0C6    STR   'S1/SODAN0'
LA0D1    STR   'S1/F.SHP.LZ'

LA0DE    DA    LA0EA
         ADRL  $00001400
         ADRL  $00E12000
         DW    $FFFF
LA0EA    STR   'S1/L.PIC.LZ'

LA0F7    DA    LA103
         ADRL  $00001400
         ADRL  $00040000
         DW    $FFFF
LA103    STR   'S1/T.PIC.LZ'

LA110    DA    LA11C
         ADRL  $00012000
         ADRL  $00000000
         DW    $FFFF
LA11C    STR   'S1/M.PIC'

LA126    DA    LA132
         ADRL  $00012000
         ADRL  $00000000
         DW    $FFFF
LA132    STR   'S2/M.PIC'

LA13C    DA    LA148
         ADRL  $00001400
         ADRL  $00012000
         DW    $FFFF
LA148    STR   'S2/CA.PIC.LZ'

LA156    DA    LA162
         ADRL  $00001400
         ADRL  $00012000
         DW    $FFFF
LA162    STR   'S3/CA.PIC.LZ'

LA170    DA    LA17C
         ADRL  $00001400
         ADRL  $00012000
         DW    $FFFF
LA17C    STR   'S1/SC.PIC.LZ'

LA18A    DA    LA196
         ADRL  $00001400
         ADRL  $00012000
         DW    $FFFF
LA196    STR   'S2/SC.PIC.LZ'

LA1A4    DA    LA1B0
         ADRL  $00001400
         ADRL  $00012000
         DW    $FFFF
LA1B0    STR   'S3/SC.PIC.LZ'

LA1BE    DA    LA1CA
         ADRL  $00060000
         ADRL  $00000000
         DW    $FFFF
LA1CA    STR   'S1/SE.PIC'

LA1D5    DA    LA1EB
         ADRL  $00030000
         ADRL  $00000000
         DA    LA1F6
         ADRL  $00001400
         ADRL  $00038000
         DW    $FFFF
LA1EB    STR   'S1/H0.PIC'
LA1F6    STR   'S1/H1.PIC.LZ'

LA204    DA    LA224
         ADRL  $00001400
         ADRL  $00040000
         DA    LA232
         ADRL  $00001400
         ADRL  $00048000
         DA    LA240
         ADRL  $00001400
         ADRL  $00050000
         DW    $FFFF
LA224    STR   'S3/E0.PIC.LZ'
LA232    STR   'S3/E1.PIC.LZ'
LA240    STR   'S3/E2.PIC.LZ'

LA24E    DA    LA25A
         ADRL  $00001400
         ADRL  $00012000
         DW    $FFFF
LA25A    STR   'S1/C.PIC.LZ'

LA267    DA    LA273
         ADRL  $00001400
         ADRL  $00012000
         DW    $FFFF
LA273    STR   'S1/HI.PIC.LZ'

LA281    DA    LA28D
         ADRL  $00001400
         ADRL  $00012000
         DW    $FFFF
LA28D    STR   'S1/J.PIC.LZ'

LA29A    DA    LA2B0
         ADRL  $00001400
         ADRL  $00030000
         DA    LA2BF
         ADRL  $00001400
         ADRL  $000378F2
         DW    $FFFF
LA2B0    STR   'S1/H0A.SPR.LZ'
LA2BF    STR   'S1/H0B.SPR.LZ'

LA2CE    DA    LA2DA
         ADRL  $00001400
         ADRL  $00030000
         DW    $FFFF
LA2DA    STR   'S1/G.SPR.LZ'

LA2E7    DA    LA2FD
         ADRL  $00001400
         ADRL  $00030000
         DA    LA30B
         ADRL  $00001400
         ADRL  $00038000
         DW    $FFFF
LA2FD    STR   'S3/E0.SPR.LZ'
LA30B    STR   'S3/E1.SPR.LZ'

LA319    DA    LA325
         ADRL  $00001400
         ADRL  $00030000
         DW    $FFFF
LA325    STR   'S1/C0.SPR.LZ'

LA333    DA    LA33F
         ADRL  $00001400
         ADRL  $00030000
         DW    $FFFF
LA33F    STR   'S1/HI.SPR.LZ'

LA34D    DA    LA363
         ADRL  $00001400
         ADRL  $00030000
         DA    LA372
         ADRL  $00001400
         ADRL  $000386BC
         DW    $FFFF
LA363    STR   'S1/H1A.SPR.LZ'
LA372    STR   'S1/H1B.SPR.LZ'

LA381    DA    LA397
         ADRL  $00001400
         ADRL  $00040000
         DA    LA3A7
         ADRL  $00001400
         ADRL  $00047B6C
         DW    $FFFF
LA397    STR   'S1/L0A.ENEM.LZ'
LA3A7    STR   'S1/L0B.ENEM.LZ'

LA3B7    DA    LA3CD
         ADRL  $00001400
         ADRL  $00030000
         DA    LA3DD
         ADRL  $00001400
         ADRL  $00040000
         DW    $FFFF
LA3CD    STR   'S2/L2A.ENEM.LZ'
LA3DD    STR   'S2/L2B.ENEM.LZ'

LA3ED    DA    LA403
         ADRL  $00001400
         ADRL  $00030000
         DA    LA413
         ADRL  $00001400
         ADRL  $00038000
         DW    $FFFF
LA403    STR   'S2/L3A.ENEM.LZ'
LA413    STR   'S2/L3B.ENEM.LZ'

LA423    DA    LA439
         ADRL  $00001400
         ADRL  $00030000
         DA    LA449
         ADRL  $00001400
         ADRL  $00038150
         DW    $FFFF
LA439    STR   'S2/L4A.ENEM.LZ'
LA449    STR   'S2/L4B.ENEM.LZ'

LA459    DA    LA483
         ADRL  $00001400
         ADRL  $00040000
         DA    LA493
         ADRL  $00001400
         ADRL  $00030000
         DA    LA4A3
         ADRL  $00001400
         ADRL  $00037B36
         DA    LA4B3
         ADRL  $00001400
         ADRL  $00048000
         DW    $FFFF
LA483    STR   'S3/L6A.ENEM.LZ'
LA493    STR   'S3/L6B.ENEM.LZ'
LA4A3    STR   'S3/L6C.ENEM.LZ'
LA4B3    STR   'S3/L6D.ENEM.LZ'

LA4C3    DA    LA4CF
         ADRL  $00001400
         ADRL  $00040000
         DW    $FFFF
LA4CF    STR   'S3/L6A.ENEM.LZ'

LA4DF    DA    LA509
         ADRL  $00030000
         ADRL  $00000000
         DA    LA516
         ADRL  $00040000
         ADRL  $00000000
         DA    LA523
         ADRL  $00048818
         ADRL  $00000000
         DA    LA530
         ADRL  $00038762
         ADRL  $00000000
         DW    $FFFF
LA509    STR   'S3/L9A.ENEM'
LA516    STR   'S3/L9B.ENEM'
LA523    STR   'S3/L9C.ENEM'
LA530    STR   'S3/L9D.ENEM'

LA53D    DA    LA549
         ADRL  $00001400
         ADRL  $00030000
         DW    $FFFF
LA549    STR   'S1/L0.SPR.LZ'

LA557    DA    LA563
         ADRL  $00001400
         ADRL  $00030000
         DW    $FFFF
LA563    STR   'S1/L1.SPR.LZ'

LA571    DA    LA57D
         ADRL  $00001400
         ADRL  $00030000
         DW    $FFFF
LA57D    STR   'S2/L2.SPR.LZ'

LA58B    DA    LA597
         ADRL  $00001400
         ADRL  $00030000
         DW    $FFFF
LA597    STR   'S2/L3.SPR.LZ'

LA5A5    DA    LA5B1
         ADRL  $00001400
         ADRL  $00030000
         DW    $FFFF
LA5B1    STR   'S2/L4.SPR.LZ'

LA5BF    DA    LA5CB
         ADRL  $00001400
         ADRL  $00030000
         DW    $FFFF
LA5CB    STR   'S2/L5.SPR.LZ'

LA5D9    DA    LA5E5
         ADRL  $00001400
         ADRL  $00030000
         DW    $FFFF
LA5E5    STR   'S3/L6.SPR.LZ'

LA5F3    DA    LA613
         ADRL  $00001400
         ADRL  $00040000
         DA    LA621
         ADRL  $00030000
         ADRL  $00000000
         DA    LA62D
         ADRL  $00038CA0
         ADRL  $00000000
         DW    $FFFF
LA613    STR   'S3/L6.SPR.LZ'
LA621    STR   'S3/L7A.SPR'
LA62D    STR   'S3/L7B.SPR'

LA639    DA    LA645
         ADRL  $00001400
         ADRL  $00030000
         DW    $FFFF
LA645    STR   'S3/L8.SPR.LZ'

LA653    DA    LA65F
         ADRL  $00030000
         ADRL  $00000000
         DW    $FFFF
LA65F    STR   'S3/L9.SPR'

LA66A    DA    LA680
         ADRL  $00001400
         ADRL  $00040000
         DA    LA68E
         ADRL  $00001400
         ADRL  $00048000
         DW    $FFFF
LA680    STR   'S1/L0A.PF.LZ'
LA68E    STR   'S1/L0B.PF.LZ'

LA69C    DA    LA6B2
         ADRL  $00001400
         ADRL  $00040000
         DA    LA6C0
         ADRL  $00001400
         ADRL  $00048000
         DW    $FFFF
LA6B2    STR   'S1/L1A.PF.LZ'
LA6C0    STR   'S1/L1B.PF.LZ'

LA6CE    DA    LA6E4
         ADRL  $00001400
         ADRL  $00040000
         DA    LA6F2
         ADRL  $00001400
         ADRL  $00048000
         DW    $FFFF
LA6E4    STR   'S2/L2A.PF.LZ'
LA6F2    STR   'S2/L2B.PF.LZ'

LA700    DA    LA716
         ADRL  $00040000
         ADRL  $00000000
         DA    LA721
         ADRL  $00048000
         ADRL  $00000000
         DW    $FFFF
LA716    STR   'S2/L3A.PF'
LA721    STR   'S2/L3B.PF'

LA72C    DA    LA742
         ADRL  $00001400
         ADRL  $00040000
         DA    LA750
         ADRL  $00001400
         ADRL  $00048000
         DW    $FFFF
LA742    STR   'S2/L4A.PF.LZ'
LA750    STR   'S2/L4B.PF.LZ'

LA75E    DA    LA774
         ADRL  $00001400
         ADRL  $00040000
         DA    LA782
         ADRL  $00001400
         ADRL  $00048000
         DW    $FFFF
LA774    STR   'S2/L5A.PF.LZ'
LA782    STR   'S2/L5B.PF.LZ'

LA790    DA    LA7A6
         ADRL  $00001400
         ADRL  $00040000
         DA    LA7B4
         ADRL  $00001400
         ADRL  $00048000
         DW    $FFFF
LA7A6    STR   'S3/L6A.PF.LZ'
LA7B4    STR   'S3/L6B.PF.LZ'

LA7C2    DA    LA7D8
         ADRL  $00001400
         ADRL  $00040000
         DA    LA7D8
         ADRL  $00001400
         ADRL  $00048000
         DW    $FFFF
LA7D8    STR   'S3/L7.PF.LZ'

LA7E5    DA    LA7FB
         ADRL  $00001400
         ADRL  $00040000
         DA    LA7FB
         ADRL  $00001400
         ADRL  $00048000
         DW    $FFFF
LA7FB    STR   'S3/L8.PF.LZ'

LA808    DA    LA81E
         ADRL  $00001400
         ADRL  $00040000
         DA    LA82C
         ADRL  $00001400
         ADRL  $00048000
         DW    $FFFF
LA81E    STR   'S2/L5A.PF.LZ'
LA82C    STR   'S2/L5C.PF.LZ'

LA83A    DA    LA850
         ADRL  $00001400
         ADRL  $00040000
         DA    LA85E
         ADRL  $00001400
         ADRL  $00048000
         DW    $FFFF
LA850    STR   'S3/L9A.PF.LZ'
LA85E    STR   'S3/L9B.PF.LZ'

LA86C    DA    LA878
         ADRL  $00068000
         ADRL  $00000000
         DW    $FFFF
LA878    STR   'S1/SE.SND'

LA883    DA    LA88F
         ADRL  $00030000
         ADRL  $00000000
         DW    $FFFF
LA88F    STR   'S1/H0.SND'

LA89A    DA    LA8B0
         ADRL  $00030000
         ADRL  $00000000
         DA    LA8BB
         ADRL  $00038000
         ADRL  $00000000
         DW    $FFFF
LA8B0    STR   'S3/E0.SND'
LA8BB    STR   'S3/E1.SND'

LA8C6    DA    LA8D2
         ADRL  $00030000
         ADRL  $00000000
         DW    $FFFF
LA8D2    STR   'S1/HI.SND'

LA8DD    DA    LA8E9
         ADRL  $00030000
         ADRL  $00000000
         DW    $FFFF
LA8E9    STR   'S1/H1.SND'

LA8F4    DA    LA91E
         ADRL  $00030000
         ADRL  $00000000
         DA    LA92A
         ADRL  $00034000
         ADRL  $00000000
         DA    LA936
         ADRL  $00038000
         ADRL  $00000000
         DA    LA942
         ADRL  $00E00800
         ADRL  $00000000
         DW    $FFFF
LA91E    STR   'S1/L0A.SND'
LA92A    STR   'S1/L0B.SND'
LA936    STR   'S1/L0C.SND'
LA942    STR   'S1/L0D.SND'

LA94E    DA    LA96E
         ADRL  $00030000
         ADRL  $00000000
         DA    LA97A
         ADRL  $00034000
         ADRL  $00000000
         DA    LA986
         ADRL  $00038000
         ADRL  $00000000
         DW    $FFFF
LA96E    STR   'S1/L1A.SND'
LA97A    STR   'S1/L0B.SND'
LA986    STR   'S1/L1B.SND'

LA992    DA    LA9B2
         ADRL  $00030000
         ADRL  $00000000
         DA    LA9BE
         ADRL  $00034000
         ADRL  $00000000
         DA    LA9CA
         ADRL  $00E00800
         ADRL  $00000000
         DW    $FFFF
LA9B2    STR   'S2/L2A.SND'
LA9BE    STR   'S2/L2B.SND'
LA9CA    STR   'S2/L2C.SND'

LA9D6    DA    LA9F6
         ADRL  $00030000
         ADRL  $00000000
         DA    LAA02
         ADRL  $00036400
         ADRL  $00000000
         DA    LAA0E
         ADRL  $00E00800
         ADRL  $00000000
         DW    $FFFF
LA9F6    STR   'S2/L3A.SND'
LAA02    STR   'S2/L3B.SND'
LAA0E    STR   'S2/L3C.SND'

LAA1A    DA    LAA30
         ADRL  $00030000
         ADRL  $00000000
         DA    LAA3C
         ADRL  $00038000
         ADRL  $00000000
         DW    $FFFF
LAA30    STR   'S2/L4A.SND'
LAA3C    STR   'S2/L4B.SND'

LAA48    DA    LAA72
         ADRL  $00030000
         ADRL  $00000000
         DA    LAA7E
         ADRL  $00033600
         ADRL  $00000000
         DA    LAA8A
         ADRL  $00E00800
         ADRL  $00000000
         DA    LAA96
         ADRL  $00E07600
         ADRL  $00000000
         DW    $FFFF
LAA72    STR   'S2/L5A.SND'
LAA7E    STR   'S2/L5B.SND'
LAA8A    STR   'S2/L5C.SND'
LAA96    STR   'S2/L5D.SND'

LAAA2    DA    LAAB8
         ADRL  $00030000
         ADRL  $00000000
         DA    LAAC4
         ADRL  $00037E00
         ADRL  $00000000
         DW    $FFFF
LAAB8    STR   'S3/L6A.SND'
LAAC4    STR   'S3/L6B.SND'

LAAD0    DA    LAAF0
         ADRL  $00030000
         ADRL  $00000000
         DA    LAAFC
         ADRL  $00E00800
         ADRL  $00000000
         DA    LAB08
         ADRL  $00E04800
         ADRL  $00000000
         DW    $FFFF
LAAF0    STR   'S3/L7A.SND'
LAAFC    STR   'S3/L7B.SND'
LAB08    STR   'S3/L7C.SND'

LAB14    DA    LAB34
         ADRL  $00030000
         ADRL  $00000000
         DA    LAB40
         ADRL  $00E00800
         ADRL  $00000000
         DA    LAB4C
         ADRL  $00E07900
         ADRL  $00000000
         DW    $FFFF
LAB34    STR   'S3/L8A.SND'
LAB40    STR   'S3/L8B.SND'
LAB4C    STR   'S3/L8C.SND'

LAB58    DA    LAB6E
         ADRL  $00030000
         ADRL  $00000000
         DA    LAB7A
         ADRL  $00E00800
         ADRL  $00000000
         DW    $FFFF
LAB6E    STR   'S3/L9A.SND'
LAB7A    STR   'S3/L9B.SND'
