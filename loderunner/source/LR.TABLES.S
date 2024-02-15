*
* Lode Runner
* (c) 1983, Broderbund Software
* (s) 2014, Brutal Deluxe Software
*

* ZP______ Line
* DF E0 E1 0
* E2 E3 E4 1
* E5 E6 E7 2
* E8 E9 EA 3
* EB EC ED 4
* EE EF F0 5
* F1 F2 F3 6
* F4 F5 F6 7
* F7 F8 F9 8
* FA FB FC 9
* FD FE FF 10

*---------------------------------------
* TABLES
*---------------------------------------

	ds	$c00

	lst	on
ici	=	*	; must be $9B00
	lst	off

demoDATA	HEX	164C6602550166023618550144016614
	HEX	360D3017600866031616660436233201
	HEX	6201550166201607660236253014600E
	HEX	101116251008162310066002300F3617
	HEX	660216075501661E1638440116054401
	HEX	16074401360755013604550116035501
	HEX	1603360B55011603360E44016601600C
	HEX	302960024401162B1004600530013667
	HEX	32014401662B360C3015361255011603
	HEX	550136055501160336086602164A1004
	HEX	600730093615660A160D440166021604
	HEX	44011602440616044401160262153631
	HEX	660162041206440166373601301D6033
	HEX	363266031601101B600536284401661F
	HEX	361444015501662D3601301260256601
	HEX	5501160D66023609300A360444013603
	HEX	44013603162244011607440416034401
	HEX	1627120E161E55016619360130036007
	HEX	101F6007300936336604100916081201
	HEX	620C320136324401160B440116094401
	HEX	102C60043003360A4401160544013603
	HEX	44013603440166033603550136085501
	HEX	664C160910154401102F160912031612
	HEX	66023606662D55011603101C55011603
	HEX	440136033215360B300B600C4401620D
	HEX	1202160D4401662036043017361E4401
	HEX	362F300860031022161B662655071603
	HEX	5501661D16021085600230033603320F
	HEX	3603300C36206601160A600666023608
	HEX	30056002660216081001600666013608
	HEX	30046003660116081002600330013608
	HEX	30036003160910026003300336073003
	HEX	600210021608100160023002360A3002
	HEX	60021003160410036005300236076616
	HEX	36026633550136055501360455013603
	HEX	55013603550166A9620C6607600F5501
	HEX	6618162A550116036601600766033603
	HEX	301B360844016618360F660844016638
	HEX	300E6611600466493703000000000030
	HEX	03000000000033070000000000300300
	HEX	00000000370300000000003003000000
	HEX	00003307000000000030030000000000
	HEX	37030000000000300300000000003307
	HEX	00000000003003000000000037030000
	HEX	00000030030000000900330700000000
	HEX	00300300301111111111111111030030
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000

*--- Les niveaux par défaut

L9E00	HEX	D1D5A0A4B1C3B3B58DF9F4E1E2ECE5A0	; 0
	HEX	C5D1D5A0A4B1C3B5B18DE2F9F4E1E2EC
	HEX	E5A0C5D1D5A0A4B1C3B6B28DE2E9F4E1
	HEX	E2ECE5A0C5D1D5A0A4B1C3B7C58DF8E2
	HEX	F9F4E1E2ECE5A0C5D1D5A0A4B1C3B9C1
	HEX	8DF8E2E9F4E1E2ECE5A0C5D1D5A0A4B1
	HEX	C4B2B68DE2EFEFF4A0C5D1D5A0A4B1C4
	HEX	C2B28DF3E3EFF2E5E2F5E6A0C5D1D5A0
	HEX	A4B1C6B0B08DE3E8E1F2E4E1F4E1A0C5
	HEX	D1D5A0A4C1C4B0B08D8DF2F7F4F3F0E1
	HEX	F2EDA0C5D1D5A0A4C2B7C5B88DF2F7F4
	HEX	F3F6EFECEDA0C5D1D5A0A4C2B7C5C28D
	HEX	F2F7F4F3F4F2E3EBA0C5D1D5A0A4C2B7
	HEX	C5C38DF2F7F4F3F3E5E3F4A0C5D1D5A0
	HEX	A4C2B7C5C48DF2F7F4F3E2F5E6E6A0C5
	HEX	D1D5A0A4C2B7C6B08DF2F7F4F3E3EDEE

L9F00	HEX	06000007000007000006000003061311	; 1
	HEX	11111111111111030000030603000000
	HEX	00000007004344440376111111113111
	HEX	11111101000013111111111133000000
	HEX	00000000030011111131434444440300
	HEX	00000300717011330000000803700008
	HEX	03701111310300001311212211111311
	HEX	00003000000003000000000003000000
	HEX	30000000030000000000030000003800
	HEX	70004344444444440370131111111111
	HEX	03700000700013110300000000000311
	HEX	11111101030003000000000003000000
	HEX	00000300030000700000030090700000
	HEX	03001111111111111111111111111111
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000

LA000	HEX	11116111111111111111110111110600	; 2
	HEX	61014444440400000000001016616001
	HEX	71001013000000008010061111011111
	HEX	11131111073111116100004744111113
	HEX	11111131011111111101000110131110
	HEX	11310111000000800000101311100131
	HEX	71101311111113731013111001311111
	HEX	03000000131111131107013111100300
LA080	HEX	00000011111311110131111703000000
	HEX	01000003000000300010131113113121
	HEX	21212121213121211311131131111111
	HEX	00111131212103000300301111110110
	HEX	11310000131111113111111111071111
	HEX	11319300000030701011110180000030
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000

LA100	HEX	00000030000000000000000000008007	; 3
	HEX	00300000000000000000700813810730
	HEX	00000000000000701831031001301111
	HEX	36111131001001300300000000003307
	HEX	00300000003003000000000037030030
	HEX	00000030030000000000330700000000
	HEX	00300300000000003703000000000030
	HEX	03000000000033070000000000300300
	HEX	00000000370300000000003003000000
	HEX	00003307000000000030030000000000
	HEX	37030000000000300300000000003307
	HEX	00000000003003000000000037030000
	HEX	00000030030000000900330700000000
	HEX	00300300301111111111111111030030
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000

*--- Six tables of pointers to sprite data

LA200       DB    <LA900
            DB    <LA902
            DB    <LA904
            DB    <LA912
            DB    <LA906
            DB    <LA922
            DB    <LA914
            DB    <LA932
            DB    <LA908
            DB    <LA942
            DB    <LA924
            DB    <LA952
            DB    <LA916
            DB    <LA962
            DB    <LA934
            DB    <LA972
            DB    <LA90A
            DB    <LA982
            DB    <LA944
            DB    <LA992
            DB    <LA926
            DB    <LA9A2
            DB    <LA954
            DB    <LA9B2
            DB    <LA918
            DB    <LA9C2
            DB    <LA964
            DB    <LA9D2
            DB    <LA936
            DB    <LA9E2
            DB    <LA974
            DB    <LA9F2
            DB    <LA90C
            DB    <LAA02
            DB    <LA984
            DB    <LAA12
            DB    <LA946
            DB    <LAA22
            DB    <LA994
            DB    <LAA32
            DB    <LA928
            DB    <LAA42
            DB    <LA9A4
            DB    <LAA52
            DB    <LA956
            DB    <LAA62
            DB    <LA9B4
            DB    <LAA72
            DB    <LA91A
            DB    <LAA82
            DB    <LA9C4
            DB    <LAA92
            DB    <LA966
            DB    <LAAA2
            DB    <LA9D4
            DB    <LAAB2
            DB    <LA938
            DB    <LAAC2
            DB    <LA9E4
            DB    <LAAD2
            DB    <LA976
            DB    <LAAE2
            DB    <LA9F4
            DB    <LAAF2
            DB    <LA90E
            DB    <LAB02
            DB    <LAA04
            DB    <LAB12
            DB    <LA986
            DB    <LAB22
            DB    <LAA14
            DB    <LAB32
            DB    <LA948
            DB    <LAB42
            DB    <LAA24
            DB    <LAB52
            DB    <LA996
            DB    <LAB62
            DB    <LAA34
            DB    <LAB72
            DB    <LA92A
            DB    <LAB82
            DB    <LAA44
            DB    <LAB92
            DB    <LA9A6
            DB    <LABA2
            DB    <LAA54
            DB    <LABB2
            DB    <LA958
            DB    <LABC2
            DB    <LAA64
            DB    <LABD2
            DB    <LA9B6
            DB    <LABE2
            DB    <LAA74
            DB    <LABF2
            DB    <LA91C
            DB    <LAC02
            DB    <LAA84
            DB    <LAC12
            DB    <LA9C6
            DB    <LAC22
            DB    <LAA94
            DB    <LAC32
            DB    <LA968
            DB    <LAC42
            DB    <LAAA4
            DB    <LAC52
            DB    <LA9D6
            DB    <LAC62
            DB    <LAAB4
            DB    <LAC72
            DB    <LA93A
            DB    <LAC82
            DB    <LAAC4
            DB    <LAC92
            DB    <LA9E6
            DB    <LACA2
            DB    <LAAD4
            DB    <LACB2
            DB    <LA978
            DB    <LACC2
            DB    <LAAE4
            DB    <LACD2
            DB    <LA9F6
            DB    <LACE2
            DB    <LAAF4
            DB    <LACF2
LA280       DB    >LA900
            DB    >LA902
            DB    >LA904
            DB    >LA912
            DB    >LA906
            DB    >LA922
            DB    >LA914
            DB    >LA932
            DB    >LA908
            DB    >LA942
            DB    >LA924
            DB    >LA952
            DB    >LA916
            DB    >LA962
            DB    >LA934
            DB    >LA972
            DB    >LA90A
            DB    >LA982
            DB    >LA944
            DB    >LA992
            DB    >LA926
            DB    >LA9A2
            DB    >LA954
            DB    >LA9B2
            DB    >LA918
            DB    >LA9C2
            DB    >LA964
            DB    >LA9D2
            DB    >LA936
            DB    >LA9E2
            DB    >LA974
            DB    >LA9F2
            DB    >LA90C
            DB    >LAA02
            DB    >LA984
            DB    >LAA12
            DB    >LA946
            DB    >LAA22
            DB    >LA994
            DB    >LAA32
            DB    >LA928
            DB    >LAA42
            DB    >LA9A4
            DB    >LAA52
            DB    >LA956
            DB    >LAA62
            DB    >LA9B4
            DB    >LAA72
            DB    >LA91A
            DB    >LAA82
            DB    >LA9C4
            DB    >LAA92
            DB    >LA966
            DB    >LAAA2
            DB    >LA9D4
            DB    >LAAB2
            DB    >LA938
            DB    >LAAC2
            DB    >LA9E4
            DB    >LAAD2
            DB    >LA976
            DB    >LAAE2
            DB    >LA9F4
            DB    >LAAF2
            DB    >LA90E
            DB    >LAB02
            DB    >LAA04
            DB    >LAB12
            DB    >LA986
            DB    >LAB22
            DB    >LAA14
            DB    >LAB32
            DB    >LA948
            DB    >LAB42
            DB    >LAA24
            DB    >LAB52
            DB    >LA996
            DB    >LAB62
            DB    >LAA34
            DB    >LAB72
            DB    >LA92A
            DB    >LAB82
            DB    >LAA44
            DB    >LAB92
            DB    >LA9A6
            DB    >LABA2
            DB    >LAA54
            DB    >LABB2
            DB    >LA958
            DB    >LABC2
            DB    >LAA64
            DB    >LABD2
            DB    >LA9B6
            DB    >LABE2
            DB    >LAA74
            DB    >LABF2
            DB    >LA91C
            DB    >LAC02
            DB    >LAA84
            DB    >LAC12
            DB    >LA9C6
            DB    >LAC22
            DB    >LAA94
            DB    >LAC32
            DB    >LA968
            DB    >LAC42
            DB    >LAAA4
            DB    >LAC52
            DB    >LA9D6
            DB    >LAC62
            DB    >LAAB4
            DB    >LAC72
            DB    >LA93A
            DB    >LAC82
            DB    >LAAC4
            DB    >LAC92
            DB    >LA9E6
            DB    >LACA2
            DB    >LAAD4
            DB    >LACB2
            DB    >LA978
            DB    >LACC2
            DB    >LAAE4
            DB    >LACD2
            DB    >LA9F6
            DB    >LACE2
            DB    >LAAF4
            DB    >LACF2

LA300       DB    <LA900
            DB    <LA904
            DB    <LA906
            DB    <LA914
            DB    <LA908
            DB    <LA924
            DB    <LA916
            DB    <LA934
            DB    <LA90A
            DB    <LA944
            DB    <LA926
            DB    <LA954
            DB    <LA918
            DB    <LA964
            DB    <LA936
            DB    <LA974
            DB    <LA90C
            DB    <LA984
            DB    <LA946
            DB    <LA994
            DB    <LA928
            DB    <LA9A4
            DB    <LA956
            DB    <LA9B4
            DB    <LA91A
            DB    <LA9C4
            DB    <LA966
            DB    <LA9D4
            DB    <LA938
            DB    <LA9E4
            DB    <LA976
            DB    <LA9F4
            DB    <LA90E
            DB    <LAA04
            DB    <LA986
            DB    <LAA14
            DB    <LA948
            DB    <LAA24
            DB    <LA996
            DB    <LAA34
            DB    <LA92A
            DB    <LAA44
            DB    <LA9A6
            DB    <LAA54
            DB    <LA958
            DB    <LAA64
            DB    <LA9B6
            DB    <LAA74
            DB    <LA91C
            DB    <LAA84
            DB    <LA9C6
            DB    <LAA94
            DB    <LA968
            DB    <LAAA4
            DB    <LA9D6
            DB    <LAAB4
            DB    <LA93A
            DB    <LAAC4
            DB    <LA9E6
            DB    <LAAD4
            DB    <LA978
            DB    <LAAE4
            DB    <LA9F6
            DB    <LAAF4
            DB    <LA910
            DB    <LAB04
            DB    <LAA06
            DB    <LAB14
            DB    <LA988
            DB    <LAB24
            DB    <LAA16
            DB    <LAB34
            DB    <LA94A
            DB    <LAB44
            DB    <LAA26
            DB    <LAB54
            DB    <LA998
            DB    <LAB64
            DB    <LAA36
            DB    <LAB74
            DB    <LA92C
            DB    <LAB84
            DB    <LAA46
            DB    <LAB94
            DB    <LA9A8
            DB    <LABA4
            DB    <LAA56
            DB    <LABB4
            DB    <LA95A
            DB    <LABC4
            DB    <LAA66
            DB    <LABD4
            DB    <LA9B8
            DB    <LABE4
            DB    <LAA76
            DB    <LABF4
            DB    <LA91E
            DB    <LAC04
            DB    <LAA86
            DB    <LAC14
            DB    <LA9C8
            DB    <LAC24
            DB    <LAA96
            DB    <LAC34
            DB    <LA96A
            DB    <LAC44
            DB    <LAAA6
            DB    <LAC54
            DB    <LA9D8
            DB    <LAC64
            DB    <LAAB6
            DB    <LAC74
            DB    <LA93C
            DB    <LAC84
            DB    <LAAC6
            DB    <LAC94
            DB    <LA9E8
            DB    <LACA4
            DB    <LAAD6
            DB    <LACB4
            DB    <LA97A
            DB    <LACC4
            DB    <LAAE6
            DB    <LACD4
            DB    <LA9F8
            DB    <LACE4
            DB    <LAAF6
            DB    <LACF4
LA380       DB    >LA900
            DB    >LA904
            DB    >LA906
            DB    >LA914
            DB    >LA908
            DB    >LA924
            DB    >LA916
            DB    >LA934
            DB    >LA90A
            DB    >LA944
            DB    >LA926
            DB    >LA954
            DB    >LA918
            DB    >LA964
            DB    >LA936
            DB    >LA974
            DB    >LA90C
            DB    >LA984
            DB    >LA946
            DB    >LA994
            DB    >LA928
            DB    >LA9A4
            DB    >LA956
            DB    >LA9B4
            DB    >LA91A
            DB    >LA9C4
            DB    >LA966
            DB    >LA9D4
            DB    >LA938
            DB    >LA9E4
            DB    >LA976
            DB    >LA9F4
            DB    >LA90E
            DB    >LAA04
            DB    >LA986
            DB    >LAA14
            DB    >LA948
            DB    >LAA24
            DB    >LA996
            DB    >LAA34
            DB    >LA92A
            DB    >LAA44
            DB    >LA9A6
            DB    >LAA54
            DB    >LA958
            DB    >LAA64
            DB    >LA9B6
            DB    >LAA74
            DB    >LA91C
            DB    >LAA84
            DB    >LA9C6
            DB    >LAA94
            DB    >LA968
            DB    >LAAA4
            DB    >LA9D6
            DB    >LAAB4
            DB    >LA93A
            DB    >LAAC4
            DB    >LA9E6
            DB    >LAAD4
            DB    >LA978
            DB    >LAAE4
            DB    >LA9F6
            DB    >LAAF4
            DB    >LA910
            DB    >LAB04
            DB    >LAA06
            DB    >LAB14
            DB    >LA988
            DB    >LAB24
            DB    >LAA16
            DB    >LAB34
            DB    >LA94A
            DB    >LAB44
            DB    >LAA26
            DB    >LAB54
            DB    >LA998
            DB    >LAB64
            DB    >LAA36
            DB    >LAB74
            DB    >LA92C
            DB    >LAB84
            DB    >LAA46
            DB    >LAB94
            DB    >LA9A8
            DB    >LABA4
            DB    >LAA56
            DB    >LABB4
            DB    >LA95A
            DB    >LABC4
            DB    >LAA66
            DB    >LABD4
            DB    >LA9B8
            DB    >LABE4
            DB    >LAA76
            DB    >LABF4
            DB    >LA91E
            DB    >LAC04
            DB    >LAA86
            DB    >LAC14
            DB    >LA9C8
            DB    >LAC24
            DB    >LAA96
            DB    >LAC34
            DB    >LA96A
            DB    >LAC44
            DB    >LAAA6
            DB    >LAC54
            DB    >LA9D8
            DB    >LAC64
            DB    >LAAB6
            DB    >LAC74
            DB    >LA93C
            DB    >LAC84
            DB    >LAAC6
            DB    >LAC94
            DB    >LA9E8
            DB    >LACA4
            DB    >LAAD6
            DB    >LACB4
            DB    >LA97A
            DB    >LACC4
            DB    >LAAE6
            DB    >LACD4
            DB    >LA9F8
            DB    >LACE4
            DB    >LAAF6
            DB    >LACF4

LA400       DB    <LA900
            DB    <LA906
            DB    <LA908
            DB    <LA916
            DB    <LA90A
            DB    <LA926
            DB    <LA918
            DB    <LA936
            DB    <LA90C
            DB    <LA946
            DB    <LA928
            DB    <LA956
            DB    <LA91A
            DB    <LA966
            DB    <LA938
            DB    <LA976
            DB    <LA90E
            DB    <LA986
            DB    <LA948
            DB    <LA996
            DB    <LA92A
            DB    <LA9A6
            DB    <LA958
            DB    <LA9B6
            DB    <LA91C
            DB    <LA9C6
            DB    <LA968
            DB    <LA9D6
            DB    <LA93A
            DB    <LA9E6
            DB    <LA978
            DB    <LA9F6
            DB    <LA910
            DB    <LAA06
            DB    <LA988
            DB    <LAA16
            DB    <LA94A
            DB    <LAA26
            DB    <LA998
            DB    <LAA36
            DB    <LA92C
            DB    <LAA46
            DB    <LA9A8
            DB    <LAA56
            DB    <LA95A
            DB    <LAA66
            DB    <LA9B8
            DB    <LAA76
            DB    <LA91E
            DB    <LAA86
            DB    <LA9C8
            DB    <LAA96
            DB    <LA96A
            DB    <LAAA6
            DB    <LA9D8
            DB    <LAAB6
            DB    <LA93C
            DB    <LAAC6
            DB    <LA9E8
            DB    <LAAD6
            DB    <LA97A
            DB    <LAAE6
            DB    <LA9F8
            DB    <LAAF6
            DB    <LA920
            DB    <LAB06
            DB    <LAA08
            DB    <LAB16
            DB    <LA98A
            DB    <LAB26
            DB    <LAA18
            DB    <LAB36
            DB    <LA94C
            DB    <LAB46
            DB    <LAA28
            DB    <LAB56
            DB    <LA99A
            DB    <LAB66
            DB    <LAA38
            DB    <LAB76
            DB    <LA92E
            DB    <LAB86
            DB    <LAA48
            DB    <LAB96
            DB    <LA9AA
            DB    <LABA6
            DB    <LAA58
            DB    <LABB6
            DB    <LA95C
            DB    <LABC6
            DB    <LAA68
            DB    <LABD6
            DB    <LA9BA
            DB    <LABE6
            DB    <LAA78
            DB    <LABF6
            DB    <LA930
            DB    <LAC06
            DB    <LAA88
            DB    <LAC16
            DB    <LA9CA
            DB    <LAC26
            DB    <LAA98
            DB    <LAC36
            DB    <LA96C
            DB    <LAC46
            DB    <LAAA8
            DB    <LAC56
            DB    <LA9DA
            DB    <LAC66
            DB    <LAAB8
            DB    <LAC76
            DB    <LA93E
            DB    <LAC86
            DB    <LAAC8
            DB    <LAC96
            DB    <LA9EA
            DB    <LACA6
            DB    <LAAD8
            DB    <LACB6
            DB    <LA97C
            DB    <LACC6
            DB    <LAAE8
            DB    <LACD6
            DB    <LA9FA
            DB    <LACE6
            DB    <LAAF8
            DB    <LACF6
LA480       DB    >LA900
            DB    >LA906
            DB    >LA908
            DB    >LA916
            DB    >LA90A
            DB    >LA926
            DB    >LA918
            DB    >LA936
            DB    >LA90C
            DB    >LA946
            DB    >LA928
            DB    >LA956
            DB    >LA91A
            DB    >LA966
            DB    >LA938
            DB    >LA976
            DB    >LA90E
            DB    >LA986
            DB    >LA948
            DB    >LA996
            DB    >LA92A
            DB    >LA9A6
            DB    >LA958
            DB    >LA9B6
            DB    >LA91C
            DB    >LA9C6
            DB    >LA968
            DB    >LA9D6
            DB    >LA93A
            DB    >LA9E6
            DB    >LA978
            DB    >LA9F6
            DB    >LA910
            DB    >LAA06
            DB    >LA988
            DB    >LAA16
            DB    >LA94A
            DB    >LAA26
            DB    >LA998
            DB    >LAA36
            DB    >LA92C
            DB    >LAA46
            DB    >LA9A8
            DB    >LAA56
            DB    >LA95A
            DB    >LAA66
            DB    >LA9B8
            DB    >LAA76
            DB    >LA91E
            DB    >LAA86
            DB    >LA9C8
            DB    >LAA96
            DB    >LA96A
            DB    >LAAA6
            DB    >LA9D8
            DB    >LAAB6
            DB    >LA93C
            DB    >LAAC6
            DB    >LA9E8
            DB    >LAAD6
            DB    >LA97A
            DB    >LAAE6
            DB    >LA9F8
            DB    >LAAF6
            DB    >LA920
            DB    >LAB06
            DB    >LAA08
            DB    >LAB16
            DB    >LA98A
            DB    >LAB26
            DB    >LAA18
            DB    >LAB36
            DB    >LA94C
            DB    >LAB46
            DB    >LAA28
            DB    >LAB56
            DB    >LA99A
            DB    >LAB66
            DB    >LAA38
            DB    >LAB76
            DB    >LA92E
            DB    >LAB86
            DB    >LAA48
            DB    >LAB96
            DB    >LA9AA
            DB    >LABA6
            DB    >LAA58
            DB    >LABB6
            DB    >LA95C
            DB    >LABC6
            DB    >LAA68
            DB    >LABD6
            DB    >LA9BA
            DB    >LABE6
            DB    >LAA78
            DB    >LABF6
            DB    >LA930
            DB    >LAC06
            DB    >LAA88
            DB    >LAC16
            DB    >LA9CA
            DB    >LAC26
            DB    >LAA98
            DB    >LAC36
            DB    >LA96C
            DB    >LAC46
            DB    >LAAA8
            DB    >LAC56
            DB    >LA9DA
            DB    >LAC66
            DB    >LAAB8
            DB    >LAC76
            DB    >LA93E
            DB    >LAC86
            DB    >LAAC8
            DB    >LAC96
            DB    >LA9EA
            DB    >LACA6
            DB    >LAAD8
            DB    >LACB6
            DB    >LA97C
            DB    >LACC6
            DB    >LAAE8
            DB    >LACD6
            DB    >LA9FA
            DB    >LACE6
            DB    >LAAF8
            DB    >LACF6

LA500       DB    <LA900
            DB    <LA908
            DB    <LA90A
            DB    <LA918
            DB    <LA90C
            DB    <LA928
            DB    <LA91A
            DB    <LA938
            DB    <LA90E
            DB    <LA948
            DB    <LA92A
            DB    <LA958
            DB    <LA91C
            DB    <LA968
            DB    <LA93A
            DB    <LA978
            DB    <LA910
            DB    <LA988
            DB    <LA94A
            DB    <LA998
            DB    <LA92C
            DB    <LA9A8
            DB    <LA95A
            DB    <LA9B8
            DB    <LA91E
            DB    <LA9C8
            DB    <LA96A
            DB    <LA9D8
            DB    <LA93C
            DB    <LA9E8
            DB    <LA97A
            DB    <LA9F8
            DB    <LA920
            DB    <LAA08
            DB    <LA98A
            DB    <LAA18
            DB    <LA94C
            DB    <LAA28
            DB    <LA99A
            DB    <LAA38
            DB    <LA92E
            DB    <LAA48
            DB    <LA9AA
            DB    <LAA58
            DB    <LA95C
            DB    <LAA68
            DB    <LA9BA
            DB    <LAA78
            DB    <LA930
            DB    <LAA88
            DB    <LA9CA
            DB    <LAA98
            DB    <LA96C
            DB    <LAAA8
            DB    <LA9DA
            DB    <LAAB8
            DB    <LA93E
            DB    <LAAC8
            DB    <LA9EA
            DB    <LAAD8
            DB    <LA97C
            DB    <LAAE8
            DB    <LA9FA
            DB    <LAAF8
            DB    <LA940
            DB    <LAB08
            DB    <LAA0A
            DB    <LAB18
            DB    <LA98C
            DB    <LAB28
            DB    <LAA1A
            DB    <LAB38
            DB    <LA94E
            DB    <LAB48
            DB    <LAA2A
            DB    <LAB58
            DB    <LA99C
            DB    <LAB68
            DB    <LAA3A
            DB    <LAB78
            DB    <LA950
            DB    <LAB88
            DB    <LAA4A
            DB    <LAB98
            DB    <LA9AC
            DB    <LABA8
            DB    <LAA5A
            DB    <LABB8
            DB    <LA95E
            DB    <LABC8
            DB    <LAA6A
            DB    <LABD8
            DB    <LA9BC
            DB    <LABE8
            DB    <LAA7A
            DB    <LABF8
            DB    <LA960
            DB    <LAC08
            DB    <LAA8A
            DB    <LAC18
            DB    <LA9CC
            DB    <LAC28
            DB    <LAA9A
            DB    <LAC38
            DB    <LA96E
            DB    <LAC48
            DB    <LAAAA
            DB    <LAC58
            DB    <LA9DC
            DB    <LAC68
            DB    <LAABA
            DB    <LAC78
            DB    <LA970
            DB    <LAC88
            DB    <LAACA
            DB    <LAC98
            DB    <LA9EC
            DB    <LACA8
            DB    <LAADA
            DB    <LACB8
            DB    <LA97E
            DB    <LACC8
            DB    <LAAEA
            DB    <LACD8
            DB    <LA9FC
            DB    <LACE8
            DB    <LAAFA
            DB    <LACF8
LA580       DB    >LA900
            DB    >LA908
            DB    >LA90A
            DB    >LA918
            DB    >LA90C
            DB    >LA928
            DB    >LA91A
            DB    >LA938
            DB    >LA90E
            DB    >LA948
            DB    >LA92A
            DB    >LA958
            DB    >LA91C
            DB    >LA968
            DB    >LA93A
            DB    >LA978
            DB    >LA910
            DB    >LA988
            DB    >LA94A
            DB    >LA998
            DB    >LA92C
            DB    >LA9A8
            DB    >LA95A
            DB    >LA9B8
            DB    >LA91E
            DB    >LA9C8
            DB    >LA96A
            DB    >LA9D8
            DB    >LA93C
            DB    >LA9E8
            DB    >LA97A
            DB    >LA9F8
            DB    >LA920
            DB    >LAA08
            DB    >LA98A
            DB    >LAA18
            DB    >LA94C
            DB    >LAA28
            DB    >LA99A
            DB    >LAA38
            DB    >LA92E
            DB    >LAA48
            DB    >LA9AA
            DB    >LAA58
            DB    >LA95C
            DB    >LAA68
            DB    >LA9BA
            DB    >LAA78
            DB    >LA930
            DB    >LAA88
            DB    >LA9CA
            DB    >LAA98
            DB    >LA96C
            DB    >LAAA8
            DB    >LA9DA
            DB    >LAAB8
            DB    >LA93E
            DB    >LAAC8
            DB    >LA9EA
            DB    >LAAD8
            DB    >LA97C
            DB    >LAAE8
            DB    >LA9FA
            DB    >LAAF8
            DB    >LA940
            DB    >LAB08
            DB    >LAA0A
            DB    >LAB18
            DB    >LA98C
            DB    >LAB28
            DB    >LAA1A
            DB    >LAB38
            DB    >LA94E
            DB    >LAB48
            DB    >LAA2A
            DB    >LAB58
            DB    >LA99C
            DB    >LAB68
            DB    >LAA3A
            DB    >LAB78
            DB    >LA950
            DB    >LAB88
            DB    >LAA4A
            DB    >LAB98
            DB    >LA9AC
            DB    >LABA8
            DB    >LAA5A
            DB    >LABB8
            DB    >LA95E
            DB    >LABC8
            DB    >LAA6A
            DB    >LABD8
            DB    >LA9BC
            DB    >LABE8
            DB    >LAA7A
            DB    >LABF8
            DB    >LA960
            DB    >LAC08
            DB    >LAA8A
            DB    >LAC18
            DB    >LA9CC
            DB    >LAC28
            DB    >LAA9A
            DB    >LAC38
            DB    >LA96E
            DB    >LAC48
            DB    >LAAAA
            DB    >LAC58
            DB    >LA9DC
            DB    >LAC68
            DB    >LAABA
            DB    >LAC78
            DB    >LA970
            DB    >LAC88
            DB    >LAACA
            DB    >LAC98
            DB    >LA9EC
            DB    >LACA8
            DB    >LAADA
            DB    >LACB8
            DB    >LA97E
            DB    >LACC8
            DB    >LAAEA
            DB    >LACD8
            DB    >LA9FC
            DB    >LACE8
            DB    >LAAFA
            DB    >LACF8

LA600       DB    <LA900
            DB    <LA90A
            DB    <LA90C
            DB    <LA91A
            DB    <LA90E
            DB    <LA92A
            DB    <LA91C
            DB    <LA93A
            DB    <LA910
            DB    <LA94A
            DB    <LA92C
            DB    <LA95A
            DB    <LA91E
            DB    <LA96A
            DB    <LA93C
            DB    <LA97A
            DB    <LA920
            DB    <LA98A
            DB    <LA94C
            DB    <LA99A
            DB    <LA92E
            DB    <LA9AA
            DB    <LA95C
            DB    <LA9BA
            DB    <LA930
            DB    <LA9CA
            DB    <LA96C
            DB    <LA9DA
            DB    <LA93E
            DB    <LA9EA
            DB    <LA97C
            DB    <LA9FA
            DB    <LA940
            DB    <LAA0A
            DB    <LA98C
            DB    <LAA1A
            DB    <LA94E
            DB    <LAA2A
            DB    <LA99C
            DB    <LAA3A
            DB    <LA950
            DB    <LAA4A
            DB    <LA9AC
            DB    <LAA5A
            DB    <LA95E
            DB    <LAA6A
            DB    <LA9BC
            DB    <LAA7A
            DB    <LA960
            DB    <LAA8A
            DB    <LA9CC
            DB    <LAA9A
            DB    <LA96E
            DB    <LAAAA
            DB    <LA9DC
            DB    <LAABA
            DB    <LA970
            DB    <LAACA
            DB    <LA9EC
            DB    <LAADA
            DB    <LA97E
            DB    <LAAEA
            DB    <LA9FC
            DB    <LAAFA
            DB    <LA980
            DB    <LAB0A
            DB    <LAA0C
            DB    <LAB1A
            DB    <LA98E
            DB    <LAB2A
            DB    <LAA1C
            DB    <LAB3A
            DB    <LA990
            DB    <LAB4A
            DB    <LAA2C
            DB    <LAB5A
            DB    <LA99E
            DB    <LAB6A
            DB    <LAA3C
            DB    <LAB7A
            DB    <LA9A0
            DB    <LAB8A
            DB    <LAA4C
            DB    <LAB9A
            DB    <LA9AE
            DB    <LABAA
            DB    <LAA5C
            DB    <LABBA
            DB    <LA9B0
            DB    <LABCA
            DB    <LAA6C
            DB    <LABDA
            DB    <LA9BE
            DB    <LABEA
            DB    <LAA7C
            DB    <LABFA
            DB    <LA9C0
            DB    <LAC0A
            DB    <LAA8C
            DB    <LAC1A
            DB    <LA9CE
            DB    <LAC2A
            DB    <LAA9C
            DB    <LAC3A
            DB    <LA9D0
            DB    <LAC4A
            DB    <LAAAC
            DB    <LAC5A
            DB    <LA9DE
            DB    <LAC6A
            DB    <LAABC
            DB    <LAC7A
            DB    <LA9E0
            DB    <LAC8A
            DB    <LAACC
            DB    <LAC9A
            DB    <LA9EE
            DB    <LACAA
            DB    <LAADC
            DB    <LACBA
            DB    <LA9F0
            DB    <LACCA
            DB    <LAAEC
            DB    <LACDA
            DB    <LA9FE
            DB    <LACEA
            DB    <LAAFC
            DB    <LACFA
LA680       DB    >LA900
            DB    >LA90A
            DB    >LA90C
            DB    >LA91A
            DB    >LA90E
            DB    >LA92A
            DB    >LA91C
            DB    >LA93A
            DB    >LA910
            DB    >LA94A
            DB    >LA92C
            DB    >LA95A
            DB    >LA91E
            DB    >LA96A
            DB    >LA93C
            DB    >LA97A
            DB    >LA920
            DB    >LA98A
            DB    >LA94C
            DB    >LA99A
            DB    >LA92E
            DB    >LA9AA
            DB    >LA95C
            DB    >LA9BA
            DB    >LA930
            DB    >LA9CA
            DB    >LA96C
            DB    >LA9DA
            DB    >LA93E
            DB    >LA9EA
            DB    >LA97C
            DB    >LA9FA
            DB    >LA940
            DB    >LAA0A
            DB    >LA98C
            DB    >LAA1A
            DB    >LA94E
            DB    >LAA2A
            DB    >LA99C
            DB    >LAA3A
            DB    >LA950
            DB    >LAA4A
            DB    >LA9AC
            DB    >LAA5A
            DB    >LA95E
            DB    >LAA6A
            DB    >LA9BC
            DB    >LAA7A
            DB    >LA960
            DB    >LAA8A
            DB    >LA9CC
            DB    >LAA9A
            DB    >LA96E
            DB    >LAAAA
            DB    >LA9DC
            DB    >LAABA
            DB    >LA970
            DB    >LAACA
            DB    >LA9EC
            DB    >LAADA
            DB    >LA97E
            DB    >LAAEA
            DB    >LA9FC
            DB    >LAAFA
            DB    >LA980
            DB    >LAB0A
            DB    >LAA0C
            DB    >LAB1A
            DB    >LA98E
            DB    >LAB2A
            DB    >LAA1C
            DB    >LAB3A
            DB    >LA990
            DB    >LAB4A
            DB    >LAA2C
            DB    >LAB5A
            DB    >LA99E
            DB    >LAB6A
            DB    >LAA3C
            DB    >LAB7A
            DB    >LA9A0
            DB    >LAB8A
            DB    >LAA4C
            DB    >LAB9A
            DB    >LA9AE
            DB    >LABAA
            DB    >LAA5C
            DB    >LABBA
            DB    >LA9B0
            DB    >LABCA
            DB    >LAA6C
            DB    >LABDA
            DB    >LA9BE
            DB    >LABEA
            DB    >LAA7C
            DB    >LABFA
            DB    >LA9C0
            DB    >LAC0A
            DB    >LAA8C
            DB    >LAC1A
            DB    >LA9CE
            DB    >LAC2A
            DB    >LAA9C
            DB    >LAC3A
            DB    >LA9D0
            DB    >LAC4A
            DB    >LAAAC
            DB    >LAC5A
            DB    >LA9DE
            DB    >LAC6A
            DB    >LAABC
            DB    >LAC7A
            DB    >LA9E0
            DB    >LAC8A
            DB    >LAACC
            DB    >LAC9A
            DB    >LA9EE
            DB    >LACAA
            DB    >LAADC
            DB    >LACBA
            DB    >LA9F0
            DB    >LACCA
            DB    >LAAEC
            DB    >LACDA
            DB    >LA9FE
            DB    >LACEA
            DB    >LAAFC
            DB    >LACFA

LA700       DB    <LA900
            DB    <LA90C
            DB    <LA90E
            DB    <LA91C
            DB    <LA910
            DB    <LA92C
            DB    <LA91E
            DB    <LA93C
            DB    <LA920
            DB    <LA94C
            DB    <LA92E
            DB    <LA95C
            DB    <LA930
            DB    <LA96C
            DB    <LA93E
            DB    <LA97C
            DB    <LA940
            DB    <LA98C
            DB    <LA94E
            DB    <LA99C
            DB    <LA950
            DB    <LA9AC
            DB    <LA95E
            DB    <LA9BC
            DB    <LA960
            DB    <LA9CC
            DB    <LA96E
            DB    <LA9DC
            DB    <LA970
            DB    <LA9EC
            DB    <LA97E
            DB    <LA9FC
            DB    <LA980
            DB    <LAA0C
            DB    <LA98E
            DB    <LAA1C
            DB    <LA990
            DB    <LAA2C
            DB    <LA99E
            DB    <LAA3C
            DB    <LA9A0
            DB    <LAA4C
            DB    <LA9AE
            DB    <LAA5C
            DB    <LA9B0
            DB    <LAA6C
            DB    <LA9BE
            DB    <LAA7C
            DB    <LA9C0
            DB    <LAA8C
            DB    <LA9CE
            DB    <LAA9C
            DB    <LA9D0
            DB    <LAAAC
            DB    <LA9DE
            DB    <LAABC
            DB    <LA9E0
            DB    <LAACC
            DB    <LA9EE
            DB    <LAADC
            DB    <LA9F0
            DB    <LAAEC
            DB    <LA9FE
            DB    <LAAFC
            DB    <LAA00
            DB    <LAB0C
            DB    <LAA0E
            DB    <LAB1C
            DB    <LAA10
            DB    <LAB2C
            DB    <LAA1E
            DB    <LAB3C
            DB    <LAA20
            DB    <LAB4C
            DB    <LAA2E
            DB    <LAB5C
            DB    <LAA30
            DB    <LAB6C
            DB    <LAA3E
            DB    <LAB7C
            DB    <LAA40
            DB    <LAB8C
            DB    <LAA4E
            DB    <LAB9C
            DB    <LAA50
            DB    <LABAC
            DB    <LAA5E
            DB    <LABBC
            DB    <LAA60
            DB    <LABCC
            DB    <LAA6E
            DB    <LABDC
            DB    <LAA70
            DB    <LABEC
            DB    <LAA7E
            DB    <LABFC
            DB    <LAA80
            DB    <LAC0C
            DB    <LAA8E
            DB    <LAC1C
            DB    <LAA90
            DB    <LAC2C
            DB    <LAA9E
            DB    <LAC3C
            DB    <LAAA0
            DB    <LAC4C
            DB    <LAAAE
            DB    <LAC5C
            DB    <LAAB0
            DB    <LAC6C
            DB    <LAABE
            DB    <LAC7C
            DB    <LAAC0
            DB    <LAC8C
            DB    <LAACE
            DB    <LAC9C
            DB    <LAAD0
            DB    <LACAC
            DB    <LAADE
            DB    <LACBC
            DB    <LAAE0
            DB    <LACCC
            DB    <LAAEE
            DB    <LACDC
            DB    <LAAF0
            DB    <LACEC
            DB    <LAAFE
            DB    <LACFC
LA780       DB    >LA900
            DB    >LA90C
            DB    >LA90E
            DB    >LA91C
            DB    >LA910
            DB    >LA92C
            DB    >LA91E
            DB    >LA93C
            DB    >LA920
            DB    >LA94C
            DB    >LA92E
            DB    >LA95C
            DB    >LA930
            DB    >LA96C
            DB    >LA93E
            DB    >LA97C
            DB    >LA940
            DB    >LA98C
            DB    >LA94E
            DB    >LA99C
            DB    >LA950
            DB    >LA9AC
            DB    >LA95E
            DB    >LA9BC
            DB    >LA960
            DB    >LA9CC
            DB    >LA96E
            DB    >LA9DC
            DB    >LA970
            DB    >LA9EC
            DB    >LA97E
            DB    >LA9FC
            DB    >LA980
            DB    >LAA0C
            DB    >LA98E
            DB    >LAA1C
            DB    >LA990
            DB    >LAA2C
            DB    >LA99E
            DB    >LAA3C
            DB    >LA9A0
            DB    >LAA4C
            DB    >LA9AE
            DB    >LAA5C
            DB    >LA9B0
            DB    >LAA6C
            DB    >LA9BE
            DB    >LAA7C
            DB    >LA9C0
            DB    >LAA8C
            DB    >LA9CE
            DB    >LAA9C
            DB    >LA9D0
            DB    >LAAAC
            DB    >LA9DE
            DB    >LAABC
            DB    >LA9E0
            DB    >LAACC
            DB    >LA9EE
            DB    >LAADC
            DB    >LA9F0
            DB    >LAAEC
            DB    >LA9FE
            DB    >LAAFC
            DB    >LAA00
            DB    >LAB0C
            DB    >LAA0E
            DB    >LAB1C
            DB    >LAA10
            DB    >LAB2C
            DB    >LAA1E
            DB    >LAB3C
            DB    >LAA20
            DB    >LAB4C
            DB    >LAA2E
            DB    >LAB5C
            DB    >LAA30
            DB    >LAB6C
            DB    >LAA3E
            DB    >LAB7C
            DB    >LAA40
            DB    >LAB8C
            DB    >LAA4E
            DB    >LAB9C
            DB    >LAA50
            DB    >LABAC
            DB    >LAA5E
            DB    >LABBC
            DB    >LAA60
            DB    >LABCC
            DB    >LAA6E
            DB    >LABDC
            DB    >LAA70
            DB    >LABEC
            DB    >LAA7E
            DB    >LABFC
            DB    >LAA80
            DB    >LAC0C
            DB    >LAA8E
            DB    >LAC1C
            DB    >LAA90
            DB    >LAC2C
            DB    >LAA9E
            DB    >LAC3C
            DB    >LAAA0
            DB    >LAC4C
            DB    >LAAAE
            DB    >LAC5C
            DB    >LAAB0
            DB    >LAC6C
            DB    >LAABE
            DB    >LAC7C
            DB    >LAAC0
            DB    >LAC8C
            DB    >LAACE
            DB    >LAC9C
            DB    >LAAD0
            DB    >LACAC
            DB    >LAADE
            DB    >LACBC
            DB    >LAAE0
            DB    >LACCC
            DB    >LAAEE
            DB    >LACDC
            DB    >LAAF0
            DB    >LACEC
            DB    >LAAFE
            DB    >LACFC

LA800       DB    <LA900
            DB    <LA90E
            DB    <LA910
            DB    <LA91E
            DB    <LA920
            DB    <LA92E
            DB    <LA930
            DB    <LA93E
            DB    <LA940
            DB    <LA94E
            DB    <LA950
            DB    <LA95E
            DB    <LA960
            DB    <LA96E
            DB    <LA970
            DB    <LA97E
            DB    <LA980
            DB    <LA98E
            DB    <LA990
            DB    <LA99E
            DB    <LA9A0
            DB    <LA9AE
            DB    <LA9B0
            DB    <LA9BE
            DB    <LA9C0
            DB    <LA9CE
            DB    <LA9D0
            DB    <LA9DE
            DB    <LA9E0
            DB    <LA9EE
            DB    <LA9F0
            DB    <LA9FE
            DB    <LAA00
            DB    <LAA0E
            DB    <LAA10
            DB    <LAA1E
            DB    <LAA20
            DB    <LAA2E
            DB    <LAA30
            DB    <LAA3E
            DB    <LAA40
            DB    <LAA4E
            DB    <LAA50
            DB    <LAA5E
            DB    <LAA60
            DB    <LAA6E
            DB    <LAA70
            DB    <LAA7E
            DB    <LAA80
            DB    <LAA8E
            DB    <LAA90
            DB    <LAA9E
            DB    <LAAA0
            DB    <LAAAE
            DB    <LAAB0
            DB    <LAABE
            DB    <LAAC0
            DB    <LAACE
            DB    <LAAD0
            DB    <LAADE
            DB    <LAAE0
            DB    <LAAEE
            DB    <LAAF0
            DB    <LAAFE
            DB    <LAB00
            DB    <LAB0E
            DB    <LAB10
            DB    <LAB1E
            DB    <LAB20
            DB    <LAB2E
            DB    <LAB30
            DB    <LAB3E
            DB    <LAB40
            DB    <LAB4E
            DB    <LAB50
            DB    <LAB5E
            DB    <LAB60
            DB    <LAB6E
            DB    <LAB70
            DB    <LAB7E
            DB    <LAB80
            DB    <LAB8E
            DB    <LAB90
            DB    <LAB9E
            DB    <LABA0
            DB    <LABAE
            DB    <LABB0
            DB    <LABBE
            DB    <LABC0
            DB    <LABCE
            DB    <LABD0
            DB    <LABDE
            DB    <LABE0
            DB    <LABEE
            DB    <LABF0
            DB    <LABFE
            DB    <LAC00
            DB    <LAC0E
            DB    <LAC10
            DB    <LAC1E
            DB    <LAC20
            DB    <LAC2E
            DB    <LAC30
            DB    <LAC3E
            DB    <LAC40
            DB    <LAC4E
            DB    <LAC50
            DB    <LAC5E
            DB    <LAC60
            DB    <LAC6E
            DB    <LAC70
            DB    <LAC7E
            DB    <LAC80
            DB    <LAC8E
            DB    <LAC90
            DB    <LAC9E
            DB    <LACA0
            DB    <LACAE
            DB    <LACB0
            DB    <LACBE
            DB    <LACC0
            DB    <LACCE
            DB    <LACD0
            DB    <LACDE
            DB    <LACE0
            DB    <LACEE
            DB    <LACF0
            DB    <LACFE
LA880       DB    >LA900
            DB    >LA90E
            DB    >LA910
            DB    >LA91E
            DB    >LA920
            DB    >LA92E
            DB    >LA930
            DB    >LA93E
            DB    >LA940
            DB    >LA94E
            DB    >LA950
            DB    >LA95E
            DB    >LA960
            DB    >LA96E
            DB    >LA970
            DB    >LA97E
            DB    >LA980
            DB    >LA98E
            DB    >LA990
            DB    >LA99E
            DB    >LA9A0
            DB    >LA9AE
            DB    >LA9B0
            DB    >LA9BE
            DB    >LA9C0
            DB    >LA9CE
            DB    >LA9D0
            DB    >LA9DE
            DB    >LA9E0
            DB    >LA9EE
            DB    >LA9F0
            DB    >LA9FE
            DB    >LAA00
            DB    >LAA0E
            DB    >LAA10
            DB    >LAA1E
            DB    >LAA20
            DB    >LAA2E
            DB    >LAA30
            DB    >LAA3E
            DB    >LAA40
            DB    >LAA4E
            DB    >LAA50
            DB    >LAA5E
            DB    >LAA60
            DB    >LAA6E
            DB    >LAA70
            DB    >LAA7E
            DB    >LAA80
            DB    >LAA8E
            DB    >LAA90
            DB    >LAA9E
            DB    >LAAA0
            DB    >LAAAE
            DB    >LAAB0
            DB    >LAABE
            DB    >LAAC0
            DB    >LAACE
            DB    >LAAD0
            DB    >LAADE
            DB    >LAAE0
            DB    >LAAEE
            DB    >LAAF0
            DB    >LAAFE
            DB    >LAB00
            DB    >LAB0E
            DB    >LAB10
            DB    >LAB1E
            DB    >LAB20
            DB    >LAB2E
            DB    >LAB30
            DB    >LAB3E
            DB    >LAB40
            DB    >LAB4E
            DB    >LAB50
            DB    >LAB5E
            DB    >LAB60
            DB    >LAB6E
            DB    >LAB70
            DB    >LAB7E
            DB    >LAB80
            DB    >LAB8E
            DB    >LAB90
            DB    >LAB9E
            DB    >LABA0
            DB    >LABAE
            DB    >LABB0
            DB    >LABBE
            DB    >LABC0
            DB    >LABCE
            DB    >LABD0
            DB    >LABDE
            DB    >LABE0
            DB    >LABEE
            DB    >LABF0
            DB    >LABFE
            DB    >LAC00
            DB    >LAC0E
            DB    >LAC10
            DB    >LAC1E
            DB    >LAC20
            DB    >LAC2E
            DB    >LAC30
            DB    >LAC3E
            DB    >LAC40
            DB    >LAC4E
            DB    >LAC50
            DB    >LAC5E
            DB    >LAC60
            DB    >LAC6E
            DB    >LAC70
            DB    >LAC7E
            DB    >LAC80
            DB    >LAC8E
            DB    >LAC90
            DB    >LAC9E
            DB    >LACA0
            DB    >LACAE
            DB    >LACB0
            DB    >LACBE
            DB    >LACC0
            DB    >LACCE
            DB    >LACD0
            DB    >LACDE
            DB    >LACE0
            DB    >LACEE
            DB    >LACF0
            DB    >LACFE

*--- The sprites

LA900	DW	$8080
LA902	DW	$8081
LA904	DW	$8082
LA906	DW	$8084
LA908	DW	$8088
LA90A	DW	$8090
LA90C	DW	$80A0
LA90E	DW	$80C0
LA910	DW	$8180
LA912	DW	$8083
LA914	DW	$8086
LA916	DW	$808C
LA918	DW	$8098
LA91A	DW	$80B0
LA91C	DW	$80E0
LA91E	DW	$81C0
LA920	DW	$8280
LA922	DW	$8085
LA924	DW	$808A
LA926	DW	$8094
LA928	DW	$80A8
LA92A	DW	$80D0
LA92C	DW	$81A0
LA92E	DW	$82C0
LA930	DW	$8380
LA932	DW	$8087
LA934	DW	$808E
LA936	DW	$809C
LA938	DW	$80B8
LA93A	DW	$80F0
LA93C	DW	$81E0
LA93E	DW	$83C0
LA940	DW	$8480
LA942	DW	$8089
LA944	DW	$8092
LA946	DW	$80A4
LA948	DW	$80C8
LA94A	DW	$8190
LA94C	DW	$82A0
LA94E	DW	$84C0
LA950	DW	$8580
LA952	DW	$808B
LA954	DW	$8096
LA956	DW	$80AC
LA958	DW	$80D8
LA95A	DW	$81B0
LA95C	DW	$82E0
LA95E	DW	$85C0
LA960	DW	$8680
LA962	DW	$808D
LA964	DW	$809A
LA966	DW	$80B4
LA968	DW	$80E8
LA96A	DW	$81D0
LA96C	DW	$83A0
LA96E	DW	$86C0
LA970	DW	$8780
LA972	DW	$808F
LA974	DW	$809E
LA976	DW	$80BC
LA978	DW	$80F8
LA97A	DW	$81F0
LA97C	DW	$83E0
LA97E	DW	$87C0
LA980	DW	$8880
LA982	DW	$8091
LA984	DW	$80A2
LA986	DW	$80C4
LA988	DW	$8188
LA98A	DW	$8290
LA98C	DW	$84A0
LA98E	DW	$88C0
LA990	DW	$8980
LA992	DW	$8093
LA994	DW	$80A6
LA996	DW	$80CC
LA998	DW	$8198
LA99A	DW	$82B0
LA99C	DW	$84E0
LA99E	DW	$89C0
LA9A0	DW	$8A80
LA9A2	DW	$8095
LA9A4	DW	$80AA
LA9A6	DW	$80D4
LA9A8	DW	$81A8
LA9AA	DW	$82D0
LA9AC	DW	$85A0
LA9AE	DW	$8AC0
LA9B0	DW	$8B80
LA9B2	DW	$8097
LA9B4	DW	$80AE
LA9B6	DW	$80DC
LA9B8	DW	$81B8
LA9BA	DW	$82F0
LA9BC	DW	$85E0
LA9BE	DW	$8BC0
LA9C0	DW	$8C80
LA9C2	DW	$8099
LA9C4	DW	$80B2
LA9C6	DW	$80E4
LA9C8	DW	$81C8
LA9CA	DW	$8390
LA9CC	DW	$86A0
LA9CE	DW	$8CC0
LA9D0	DW	$8D80
LA9D2	DW	$809B
LA9D4	DW	$80B6
LA9D6	DW	$80EC
LA9D8	DW	$81D8
LA9DA	DW	$83B0
LA9DC	DW	$86E0
LA9DE	DW	$8DC0
LA9E0	DW	$8E80
LA9E2	DW	$809D
LA9E4	DW	$80BA
LA9E6	DW	$80F4
LA9E8	DW	$81E8
LA9EA	DW	$83D0
LA9EC	DW	$87A0
LA9EE	DW	$8EC0
LA9F0	DW	$8F80
LA9F2	DW	$809F
LA9F4	DW	$80BE
LA9F6	DW	$80FC
LA9F8	DW	$81F8
LA9FA	DW	$83F0
LA9FC	DW	$87E0
LA9FE	DW	$8FC0
LAA00	DW	$9080
LAA02	DW	$80A1
LAA04	DW	$80C2
LAA06	DW	$8184
LAA08	DW	$8288
LAA0A	DW	$8490
LAA0C	DW	$88A0
LAA0E	DW	$90C0
LAA10	DW	$9180
LAA12	DW	$80A3
LAA14	DW	$80C6
LAA16	DW	$818C
LAA18	DW	$8298
LAA1A	DW	$84B0
LAA1C	DW	$88E0
LAA1E	DW	$91C0
LAA20	DW	$9280
LAA22	DW	$80A5
LAA24	DW	$80CA
LAA26	DW	$8194
LAA28	DW	$82A8
LAA2A	DW	$84D0
LAA2C	DW	$89A0
LAA2E	DW	$92C0
LAA30	DW	$9380
LAA32	DW	$80A7
LAA34	DW	$80CE
LAA36	DW	$819C
LAA38	DW	$82B8
LAA3A	DW	$84F0
LAA3C	DW	$89E0
LAA3E	DW	$93C0
LAA40	DW	$9480
LAA42	DW	$80A9
LAA44	DW	$80D2
LAA46	DW	$81A4
LAA48	DW	$82C8
LAA4A	DW	$8590
LAA4C	DW	$8AA0
LAA4E	DW	$94C0
LAA50	DW	$9580
LAA52	DW	$80AB
LAA54	DW	$80D6
LAA56	DW	$81AC
LAA58	DW	$82D8
LAA5A	DW	$85B0
LAA5C	DW	$8AE0
LAA5E	DW	$95C0
LAA60	DW	$9680
LAA62	DW	$80AD
LAA64	DW	$80DA
LAA66	DW	$81B4
LAA68	DW	$82E8
LAA6A	DW	$85D0
LAA6C	DW	$8BA0
LAA6E	DW	$96C0
LAA70	DW	$9780
LAA72	DW	$80AF
LAA74	DW	$80DE
LAA76	DW	$81BC
LAA78	DW	$82F8
LAA7A	DW	$85F0
LAA7C	DW	$8BE0
LAA7E	DW	$97C0
LAA80	DW	$9880
LAA82	DW	$80B1
LAA84	DW	$80E2
LAA86	DW	$81C4
LAA88	DW	$8388
LAA8A	DW	$8690
LAA8C	DW	$8CA0
LAA8E	DW	$98C0
LAA90	DW	$9980
LAA92	DW	$80B3
LAA94	DW	$80E6
LAA96	DW	$81CC
LAA98	DW	$8398
LAA9A	DW	$86B0
LAA9C	DW	$8CE0
LAA9E	DW	$99C0
LAAA0	DW	$9A80
LAAA2	DW	$80B5
LAAA4	DW	$80EA
LAAA6	DW	$81D4
LAAA8	DW	$83A8
LAAAA	DW	$86D0
LAAAC	DW	$8DA0
LAAAE	DW	$9AC0
LAAB0	DW	$9B80
LAAB2	DW	$80B7
LAAB4	DW	$80EE
LAAB6	DW	$81DC
LAAB8	DW	$83B8
LAABA	DW	$86F0
LAABC	DW	$8DE0
LAABE	DW	$9BC0
LAAC0	DW	$9C80
LAAC2	DW	$80B9
LAAC4	DW	$80F2
LAAC6	DW	$81E4
LAAC8	DW	$83C8
LAACA	DW	$8790
LAACC	DW	$8EA0
LAACE	DW	$9CC0
LAAD0	DW	$9D80
LAAD2	DW	$80BB
LAAD4	DW	$80F6
LAAD6	DW	$81EC
LAAD8	DW	$83D8
LAADA	DW	$87B0
LAADC	DW	$8EE0
LAADE	DW	$9DC0
LAAE0	DW	$9E80
LAAE2	DW	$80BD
LAAE4	DW	$80FA
LAAE6	DW	$81F4
LAAE8	DW	$83E8
LAAEA	DW	$87D0
LAAEC	DW	$8FA0
LAAEE	DW	$9EC0
LAAF0	DW	$9F80
LAAF2	DW	$80BF
LAAF4	DW	$80FE
LAAF6	DW	$81FC
LAAF8	DW	$83F8
LAAFA	DW	$87F0
LAAFC	DW	$8FE0
LAAFE	DW	$9FC0
LAB00	DW	$A080
LAB02	DW	$80C1
LAB04	DW	$8182
LAB06	DW	$8284
LAB08	DW	$8488
LAB0A	DW	$8890
LAB0C	DW	$90A0
LAB0E	DW	$A0C0
LAB10	DW	$A180
LAB12	DW	$80C3
LAB14	DW	$8186
LAB16	DW	$828C
LAB18	DW	$8498
LAB1A	DW	$88B0
LAB1C	DW	$90E0
LAB1E	DW	$A1C0
LAB20	DW	$A280
LAB22	DW	$80C5
LAB24	DW	$818A
LAB26	DW	$8294
LAB28	DW	$84A8
LAB2A	DW	$88D0
LAB2C	DW	$91A0
LAB2E	DW	$A2C0
LAB30	DW	$A380
LAB32	DW	$80C7
LAB34	DW	$818E
LAB36	DW	$829C
LAB38	DW	$84B8
LAB3A	DW	$88F0
LAB3C	DW	$91E0
LAB3E	DW	$A3C0
LAB40	DW	$A480
LAB42	DW	$80C9
LAB44	DW	$8192
LAB46	DW	$82A4
LAB48	DW	$84C8
LAB4A	DW	$8990
LAB4C	DW	$92A0
LAB4E	DW	$A4C0
LAB50	DW	$A580
LAB52	DW	$80CB
LAB54	DW	$8196
LAB56	DW	$82AC
LAB58	DW	$84D8
LAB5A	DW	$89B0
LAB5C	DW	$92E0
LAB5E	DW	$A5C0
LAB60	DW	$A680
LAB62	DW	$80CD
LAB64	DW	$819A
LAB66	DW	$82B4
LAB68	DW	$84E8
LAB6A	DW	$89D0
LAB6C	DW	$93A0
LAB6E	DW	$A6C0
LAB70	DW	$A780
LAB72	DW	$80CF
LAB74	DW	$819E
LAB76	DW	$82BC
LAB78	DW	$84F8
LAB7A	DW	$89F0
LAB7C	DW	$93E0
LAB7E	DW	$A7C0
LAB80	DW	$A880
LAB82	DW	$80D1
LAB84	DW	$81A2
LAB86	DW	$82C4
LAB88	DW	$8588
LAB8A	DW	$8A90
LAB8C	DW	$94A0
LAB8E	DW	$A8C0
LAB90	DW	$A980
LAB92	DW	$80D3
LAB94	DW	$81A6
LAB96	DW	$82CC
LAB98	DW	$8598
LAB9A	DW	$8AB0
LAB9C	DW	$94E0
LAB9E	DW	$A9C0
LABA0	DW	$AA80
LABA2	DW	$80D5
LABA4	DW	$81AA
LABA6	DW	$82D4
LABA8	DW	$85A8
LABAA	DW	$8AD0
LABAC	DW	$95A0
LABAE	DW	$AAC0
LABB0	DW	$AB80
LABB2	DW	$80D7
LABB4	DW	$81AE
LABB6	DW	$82DC
LABB8	DW	$85B8
LABBA	DW	$8AF0
LABBC	DW	$95E0
LABBE	DW	$ABC0
LABC0	DW	$AC80
LABC2	DW	$80D9
LABC4	DW	$81B2
LABC6	DW	$82E4
LABC8	DW	$85C8
LABCA	DW	$8B90
LABCC	DW	$96A0
LABCE	DW	$ACC0
LABD0	DW	$AD80
LABD2	DW	$80DB
LABD4	DW	$81B6
LABD6	DW	$82EC
LABD8	DW	$85D8
LABDA	DW	$8BB0
LABDC	DW	$96E0
LABDE	DW	$ADC0
LABE0	DW	$AE80
LABE2	DW	$80DD
LABE4	DW	$81BA
LABE6	DW	$82F4
LABE8	DW	$85E8
LABEA	DW	$8BD0
LABEC	DW	$97A0
LABEE	DW	$AEC0
LABF0	DW	$AF80
LABF2	DW	$80DF
LABF4	DW	$81BE
LABF6	DW	$82FC
LABF8	DW	$85F8
LABFA	DW	$8BF0
LABFC	DW	$97E0
LABFE	DW	$AFC0
LAC00	DW	$B080
LAC02	DW	$80E1
LAC04	DW	$81C2
LAC06	DW	$8384
LAC08	DW	$8688
LAC0A	DW	$8C90
LAC0C	DW	$98A0
LAC0E	DW	$B0C0
LAC10	DW	$B180
LAC12	DW	$80E3
LAC14	DW	$81C6
LAC16	DW	$838C
LAC18	DW	$8698
LAC1A	DW	$8CB0
LAC1C	DW	$98E0
LAC1E	DW	$B1C0
LAC20	DW	$B280
LAC22	DW	$80E5
LAC24	DW	$81CA
LAC26	DW	$8394
LAC28	DW	$86A8
LAC2A	DW	$8CD0
LAC2C	DW	$99A0
LAC2E	DW	$B2C0
LAC30	DW	$B380
LAC32	DW	$80E7
LAC34	DW	$81CE
LAC36	DW	$839C
LAC38	DW	$86B8
LAC3A	DW	$8CF0
LAC3C	DW	$99E0
LAC3E	DW	$B3C0
LAC40	DW	$B480
LAC42	DW	$80E9
LAC44	DW	$81D2
LAC46	DW	$83A4
LAC48	DW	$86C8
LAC4A	DW	$8D90
LAC4C	DW	$9AA0
LAC4E	DW	$B4C0
LAC50	DW	$B580
LAC52	DW	$80EB
LAC54	DW	$81D6
LAC56	DW	$83AC
LAC58	DW	$86D8
LAC5A	DW	$8DB0
LAC5C	DW	$9AE0
LAC5E	DW	$B5C0
LAC60	DW	$B680
LAC62	DW	$80ED
LAC64	DW	$81DA
LAC66	DW	$83B4
LAC68	DW	$86E8
LAC6A	DW	$8DD0
LAC6C	DW	$9BA0
LAC6E	DW	$B6C0
LAC70	DW	$B780
LAC72	DW	$80EF
LAC74	DW	$81DE
LAC76	DW	$83BC
LAC78	DW	$86F8
LAC7A	DW	$8DF0
LAC7C	DW	$9BE0
LAC7E	DW	$B7C0
LAC80	DW	$B880
LAC82	DW	$80F1
LAC84	DW	$81E2
LAC86	DW	$83C4
LAC88	DW	$8788
LAC8A	DW	$8E90
LAC8C	DW	$9CA0
LAC8E	DW	$B8C0
LAC90	DW	$B980
LAC92	DW	$80F3
LAC94	DW	$81E6
LAC96	DW	$83CC
LAC98	DW	$8798
LAC9A	DW	$8EB0
LAC9C	DW	$9CE0
LAC9E	DW	$B9C0
LACA0	DW	$BA80
LACA2	DW	$80F5
LACA4	DW	$81EA
LACA6	DW	$83D4
LACA8	DW	$87A8
LACAA	DW	$8ED0
LACAC	DW	$9DA0
LACAE	DW	$BAC0
LACB0	DW	$BB80
LACB2	DW	$80F7
LACB4	DW	$81EE
LACB6	DW	$83DC
LACB8	DW	$87B8
LACBA	DW	$8EF0
LACBC	DW	$9DE0
LACBE	DW	$BBC0
LACC0	DW	$BC80
LACC2	DW	$80F9
LACC4	DW	$81F2
LACC6	DW	$83E4
LACC8	DW	$87C8
LACCA	DW	$8F90
LACCC	DW	$9EA0
LACCE	DW	$BCC0
LACD0	DW	$BD80
LACD2	DW	$80FB
LACD4	DW	$81F6
LACD6	DW	$83EC
LACD8	DW	$87D8
LACDA	DW	$8FB0
LACDC	DW	$9EE0
LACDE	DW	$BDC0
LACE0	DW	$BE80
LACE2	DW	$80FD
LACE4	DW	$81FA
LACE6	DW	$83F4
LACE8	DW	$87E8
LACEA	DW	$8FD0
LACEC	DW	$9FA0
LACEE	DW	$BEC0
LACF0	DW	$BF80
LACF2	DW	$80FF
LACF4	DW	$81FE
LACF6	DW	$83FC
LACF8	DW	$87F8
LACFA	DW	$8FF0
LACFC	DW	$9FE0
LACFE	DW	$BFC0

*--- Each block is $68 long
* Each entry is an offset per sprite per line

tblOFFSPR	HEX	001555060055060010407F0808083040	; 0
	HEX	40403026130660180618600000100025
	HEX	20000000001000004040401010022008
	HEX	02082020202222000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	0000000000000203
	HEX	00020203000200000000070000000000	; 1
	HEX	00000006030300000300000000000002
	HEX	00000000000000000000000000010000
	HEX	01000000000404000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	0000000000000600
	HEX	001555067F55060028607F1C1C1C3060	; 2
	HEX	606031763B0660180618600000000015
	HEX	28200000003800002020202828022008
	HEX	02082020212222000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	0000000000000700
	HEX	00020203070200000001070000000401	; 3
	HEX	01010006030300000300000000000002
	HEX	00000000000000000101010000010000
	HEX	01000004000404000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	0000000000007060
	HEX	0015557E00007E0028607F1C1C1C7060	; 4
	HEX	60603F763B3678783678780000000015
	HEX	01280000003800002020202828222828
	HEX	0A2828202B2222000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	0000000000000006
	HEX	00020203000003000001070000000701	; 5
	HEX	01010006030300000300000000000002
	HEX	02000000000000000101010000010000
	HEX	01000005000404000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	0000000000003870
	HEX	00155506007C060020707F3818187240	; 6
	HEX	6060387C7E7638703C703B0010001015
	HEX	15292000001800102020202020222820
	HEX	0A280822282828000000002A282A2A0A
	HEX	2A2A2A282A5415551555555541041041
	HEX	01414155555555555541454141515501
	HEX	0014144000400000
	HEX	00020203000103000000070000000001	; 7
	HEX	00000203010100060300000000000002
	HEX	02020000000000000000000000010004
	HEX	01000000020101000000000100010101
	HEX	01010101010000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	0000000000000000
	HEX	0000550600300000286C7F5C387A7E70	; 8
	HEX	70787860183C1E6070601E0000000000
	HEX	00002800007E00002828282028280A20
	HEX	28200A2A28202000000000022802020A
	HEX	02022008024411414105054141041051
	HEX	01454151415141410441454141514105
	HEX	0014144000500000
	HEX	00000203000003000101070100000007	; 9
	HEX	00020300000000030103000000000000
	HEX	00000000000000000100010101000001
	HEX	00010000030000000000000100010101
	HEX	00010101010000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	0000000000000000
	HEX	005155060030007822367F337C5E705A	; 10
	HEX	786C386018181B606060180000110151
	HEX	51512820005A00002228222828080A20
	HEX	2020082028202000000000022000000A
	HEX	02022008024411014105050141041011
	HEX	01554551415141010441454141514114
	HEX	0005501055140101
	HEX	00020203000003010406070300010005	; 12
	HEX	01030000000000000006000002000002
	HEX	02020100000500020401010104000000
	HEX	00010000000000000000000100010101
	HEX	00000101010000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	0000000002000820
	HEX	005155060030002860307F307B187042	; 13
	HEX	78603878781818606060181001000051
	HEX	51510020001810053060603230080820
	HEX	202008703870780001000002202A282A
	HEX	2A02202A2A5555014115150155145015
	HEX	01555541554155550441454114551050
	HEX	0005501055050000
	HEX	00020203000003010000070000000001	; 14
	HEX	06000000000000000000000000020002
	HEX	02020001000400000004000000000000
	HEX	00000000000100000200000100010101
	HEX	01000101010000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	0000000002006C00
	HEX	0051557E0030067870707F381C3C5860	; 15
	HEX	60706C6C581E1C706060384004010051
	HEX	515151292038440270607038781E1C70
	HEX	70701C586C306C000100002220020000
	HEX	202A2802204141054501015145145055
	HEX	05415541054115501445455514141450
	HEX	0005500455050001
	HEX	00020203000003010000070000000101	; 16
	HEX	01010000010000000301000400000202
	HEX	02020201000000000001010000000000
	HEX	01000001000300000200000100000101
	HEX	01010001010000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	0000000002000000
	HEX	0051550600557E28585E7F6C3C665830	; 17
	HEX	70186E6C5813365820306C0450040051
	HEX	51515101286C12525E7018784C133658
	HEX	105836586E306C010100282220020000
	HEX	20220802204141054501015145145045
	HEX	05415141054115501445555541140114
	HEX	1405500455140001
	HEX	00020203000203010701070300000303	; 18
	HEX	01030000010000010603000404000002
	HEX	02020200000000000101030001000001
	HEX	03010003000300020200000100000101
	HEX	01010001010000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	0000000002004145
	HEX	005155060055067818407F0C70461830	; 19
	HEX	380C606C581B365860306C1004400051
	HEX	51515151286C0A0840380C600C1B3658
	HEX	3058361860306C0101282A2228220200
	HEX	20220802205141454501014145145145
	HEX	05414141051145511445144541145105
	HEX	1414140100500000
	HEX	00020203000200010001070000010003	; 20
	HEX	00030000010000010603000105000002
	HEX	02020202010002010100030103000001
	HEX	03010000000300020200010101010101
	HEX	01010001010000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	0000000000005545
	HEX	000000060000060018407F0C30401C30	; 21
	HEX	300C6060180D365840306C0010000000
	HEX	00000000006C080840300C60000D3058
	HEX	6058361C60306000002A2A2A282A2A00
	HEX	2A2A082A205155551555015545145545
	HEX	55414155054545551455044141145501
	HEX	1414140100400000
	HEX	00000003000000000001070000010003	; 22
	HEX	00000100000000010503000101000000
	HEX	00000000000000010100000003000001
	HEX	02010000010000000001010101010101
	HEX	01010001010000000000000000000000
	HEX	00000000000000000000000000000000
	HEX	00000000000081A8

LB5F0	HEX	C5A2D4A200D08A948080808080808080
