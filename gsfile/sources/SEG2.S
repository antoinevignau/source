*
* GSFile
*
* (c) 1997, SofWood Company
* (s) 2026, Brutal Deluxe Software
*

	mx	%00
	rel
	lst	off

*----------------------------------- Macros

	use	4/Ctl.Macs
	use	4/Desk.Macs
	use	4/Dialog.Macs
	use	4/DOS.16.Macs
	use	4/Event.Macs
	use	4/Int.Macs
	use	4/Line.Macs
	use	4/List.Macs
	use	4/Locator.Macs
	use	4/Mem.Macs
	use	4/Menu.Macs
	use	4/MIDISyn.Macs
	use	4/Misc.Macs
	use	4/QD.Macs
	use	4/QDAux.Macs
	use	4/SANE.Macs
	use	4/Sound.Macs
	use	4/Std.Macs
	use	4/Text.Macs
	use	4/Util.Macs
	use	4/Window.Macs

	use	SEG2.X.S
	
GSOS	=	$E100A8

*-----------------------------------

L030000     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            LDA   #L0E3AEB
            LDX   #^L0E3AEB
            PHA
            TXA
            STAL  L0E476A
            PLA
            STAL  L0E4768
            LDA   #L0E3AEF
            LDX   #^L0E3AEF
            PHA
            TXA
            STAL  L0E476E
            PLA
            STAL  L0E476C
            LDA   #L0E3AF3
            LDX   #^L0E3AF3
            PHA
            TXA
            STAL  L0E4772
            PLA
            STAL  L0E4770
            LDA   #L0E3AF7
            LDX   #^L0E3AF7
            PHA
            TXA
            STAL  L0E4776
            PLA
            STAL  L0E4774
            LDA   #L0E3AFB
            LDX   #^L0E3AFB
            PHA
            TXA
            STAL  L0E477A
            PLA
            STAL  L0E4778
            LDA   #L0E3AFF
            LDX   #^L0E3AFF
            PHA
            TXA
            STAL  L0E477E
            PLA
            STAL  L0E477C
            LDA   #L0E3B03
            LDX   #^L0E3B03
            PHA
            TXA
            STAL  L0E4782
            PLA
            STAL  L0E4780
            LDA   #L0E3B07
            LDX   #^L0E3B07
            PHA
            TXA
            STAL  L0E4786
            PLA
            STAL  L0E4784
            LDA   #L0E3B0B
            LDX   #^L0E3B0B
            PHA
            TXA
            STAL  L0E478A
            PLA
            STAL  L0E4788
            LDA   #L0E3B0F
            LDX   #^L0E3B0F
            PHA
            TXA
            STAL  L0E478E
            PLA
            STAL  L0E478C
            LDA   #L0E3B13
            LDX   #^L0E3B13
            PHA
            TXA
            STAL  L0E4792
            PLA
            STAL  L0E4790
            LDA   #L0E3B17
            LDX   #^L0E3B17
            PHA
            TXA
            STAL  L0E4796
            PLA
            STAL  L0E4794
            LDA   #L0E3B1B
            LDX   #^L0E3B1B
            PHA
            TXA
            STAL  L0E479A
            PLA
            STAL  L0E4798
            LDA   #L0E3B23
            LDX   #^L0E3B23
            PHA
            TXA
            STAL  L0E479E
            PLA
            STAL  L0E479C
            LDA   #L0E3B2C
            LDX   #^L0E3B2C
            PHA
            TXA
            STAL  L0E47A2
            PLA
            STAL  L0E47A0
            LDA   #L0E3B32
            LDX   #^L0E3B32
            PHA
            TXA
            STAL  L0E47A6
            PLA
            STAL  L0E47A4
            LDA   #L0E3B38
            LDX   #^L0E3B38
            PHA
            TXA
            STAL  L0E47AA
            PLA
            STAL  L0E47A8
            LDA   #L0E3B3C
            LDX   #^L0E3B3C
            PHA
            TXA
            STAL  L0E47AE
            PLA
            STAL  L0E47AC
            LDA   #L0E3B41
            LDX   #^L0E3B41
            PHA
            TXA
            STAL  L0E47B2
            PLA
            STAL  L0E47B0
            LDA   #L0E3B46
            LDX   #^L0E3B46
            PHA
            TXA
            STAL  L0E47B6
            PLA
            STAL  L0E47B4
            LDA   #L0E3B4D
            LDX   #^L0E3B4D
            PHA
            TXA
            STAL  L0E47BA
            PLA
            STAL  L0E47B8
            LDA   #L0E3B57
            LDX   #^L0E3B57
            PHA
            TXA
            STAL  L0E47BE
            PLA
            STAL  L0E47BC
            LDA   #L0E3B5F
            LDX   #^L0E3B5F
            PHA
            TXA
            STAL  L0E47C2
            PLA
            STAL  L0E47C0
            LDA   #L0E3B68
            LDX   #^L0E3B68
            PHA
            TXA
            STAL  L0E47C6
            PLA
            STAL  L0E47C4
            LDA   #L0E3B71
            LDX   #^L0E3B71
            PHA
            TXA
            STAL  L0E47CA
            PLA
            STAL  L0E47C8
            LDA   #L0E3B75
            LDX   #^L0E3B75
            PHA
            TXA
            STAL  L0E47CE
            PLA
            STAL  L0E47CC
            LDA   #L0E3B79
            LDX   #^L0E3B79
            PHA
            TXA
            STAL  L0E47D2
            PLA
            STAL  L0E47D0
            LDA   #L0E3B7D
            LDX   #^L0E3B7D
            PHA
            TXA
            STAL  L0E47D6
            PLA
            STAL  L0E47D4
            LDA   #L0E3B81
            LDX   #^L0E3B81
            PHA
            TXA
            STAL  L0E47DA
            PLA
            STAL  L0E47D8
            LDA   #L0E3B85
            LDX   #^L0E3B85
            PHA
            TXA
            STAL  L0E47DE
            PLA
            STAL  L0E47DC
            LDA   #L0E3B89
            LDX   #^L0E3B89
            PHA
            TXA
            STAL  L0E47E2
            PLA
            STAL  L0E47E0
            LDA   #L0E3B8D
            LDX   #^L0E3B8D
            PHA
            TXA
            STAL  L0E47E6
            PLA
            STAL  L0E47E4
            LDA   #L0E3B94
            LDX   #^L0E3B94
            PHA
            TXA
            STAL  L0E47EA
            PLA
            STAL  L0E47E8
            LDA   #L0E3B9B
            LDX   #^L0E3B9B
            PHA
            TXA
            STAL  L0E47EE
            PLA
            STAL  L0E47EC
            LDA   #L0E3BA3
            LDX   #^L0E3BA3
            PHA
            TXA
            STAL  L0E47F2
            PLA
            STAL  L0E47F0
            LDA   #L0E3BAD
            LDX   #^L0E3BAD
            PHA
            TXA
            STAL  L0E47F6
            PLA
            STAL  L0E47F4
            LDA   #L0E3BB6
            LDX   #^L0E3BB6
            PHA
            TXA
            STAL  L0E47FA
            PLA
            STAL  L0E47F8
            LDA   #L0E3BBD
            LDX   #^L0E3BBD
            PHA
            TXA
            STAL  L0E47FE
            PLA
            STAL  L0E47FC
            LDA   #L0E3BC6
            LDX   #^L0E3BC6
            PHA
            TXA
            STAL  L0E482A
            PLA
            STAL  L0E4828
            LDA   #L0E3BC8
            LDX   #^L0E3BC8
            PHA
            TXA
            STAL  L0E482E
            PLA
            STAL  L0E482C
            LDA   #L0E3BCA
            LDX   #^L0E3BCA
            PHA
            TXA
            STAL  L0E4832
            PLA
            STAL  L0E4830
            LDA   #L0E3BCC
            LDX   #^L0E3BCC
            PHA
            TXA
            STAL  L0E4836
            PLA
            STAL  L0E4834
            LDA   #L0E3BCE
            LDX   #^L0E3BCE
            PHA
            TXA
            STAL  L0E483A
            PLA
            STAL  L0E4838
            LDA   #L0E3BD0
            LDX   #^L0E3BD0
            PHA
            TXA
            STAL  L0E48B2
            PLA
            STAL  L0E48B0
            LDA   #L0E3BF2
            LDX   #^L0E3BF2
            PHA
            TXA
            STAL  L0E48B6
            PLA
            STAL  L0E48B4
            LDA   #L0E3C27
            LDX   #^L0E3C27
            PHA
            TXA
            STAL  L0E48BA
            PLA
            STAL  L0E48B8
            LDA   #L0E3C4F
            LDX   #^L0E3C4F
            PHA
            TXA
            STAL  L0E48BE
            PLA
            STAL  L0E48BC
            LDA   #L0E3C52
            LDX   #^L0E3C52
            PHA
            TXA
            STAL  L0E48C2
            PLA
            STAL  L0E48C0
            LDA   #L0E3C8E
            LDX   #^L0E3C8E
            PHA
            TXA
            STAL  L0E48C6
            PLA
            STAL  L0E48C4
            LDA   #L0E3CC9
            LDX   #^L0E3CC9
            PHA
            TXA
            STAL  L0E48CA
            PLA
            STAL  L0E48C8
            LDA   #L0E3D00
            LDX   #^L0E3D00
            PHA
            TXA
            STAL  L0E48CE
            PLA
            STAL  L0E48CC
            LDA   #L0E3D3B
            LDX   #^L0E3D3B
            PHA
            TXA
            STAL  L0E4802
            PLA
            STAL  L0E4800
            LDA   #L0E3D4A
            LDX   #^L0E3D4A
            PHA
            TXA
            STAL  L0E4806
            PLA
            STAL  L0E4804
            LDA   #L0E3D59
            LDX   #^L0E3D59
            PHA
            TXA
            STAL  L0E480A
            PLA
            STAL  L0E4808
            LDA   #L0E3D6E
            LDX   #^L0E3D6E
            PHA
            TXA
            STAL  L0E480E
            PLA
            STAL  L0E480C
            LDA   #L0E3D88
            LDX   #^L0E3D88
            PHA
            TXA
            STAL  L0E4812
            PLA
            STAL  L0E4810
            LDA   #L0E3DA4
            LDX   #^L0E3DA4
            PHA
            TXA
            STAL  L0E4816
            PLA
            STAL  L0E4814
            LDA   #L0E3DC2
            LDX   #^L0E3DC2
            PHA
            TXA
            STAL  L0E481A
            PLA
            STAL  L0E4818
            LDA   #L0E3DE0
            LDX   #^L0E3DE0
            PHA
            TXA
            STAL  L0E481E
            PLA
            STAL  L0E481C
            LDA   #L0E3DFB
            LDX   #^L0E3DFB
            PHA
            TXA
            STAL  L0E4822
            PLA
            STAL  L0E4820
            LDA   #L0E3E11
            LDX   #^L0E3E11
            PHA
            TXA
            STAL  L0E4826
            PLA
            STAL  L0E4824
            LDA   #L0E3E27
            LDX   #^L0E3E27
            PHA
            TXA
            STAL  L0E483E
            PLA
            STAL  L0E483C
            LDA   #L0E3E40
            LDX   #^L0E3E40
            PHA
            TXA
            STAL  L0E4842
            PLA
            STAL  L0E4840
            LDA   #L0E3E51
            LDX   #^L0E3E51
            PHA
            TXA
            STAL  L0E4846
            PLA
            STAL  L0E4844
            LDA   #L0E3E5C
            LDX   #^L0E3E5C
            PHA
            TXA
            STAL  L0E484A
            PLA
            STAL  L0E4848
            LDA   #L0E3E67
            LDX   #^L0E3E67
            PHA
            TXA
            STAL  L0E484E
            PLA
            STAL  L0E484C
            LDA   #L0E3E72
            LDX   #^L0E3E72
            PHA
            TXA
            STAL  L0E4852
            PLA
            STAL  L0E4850
            LDA   #L0E3E75
            LDX   #^L0E3E75
            PHA
            TXA
            STAL  L0E4856
            PLA
            STAL  L0E4854
            LDA   #L0E3E78
            LDX   #^L0E3E78
            PHA
            TXA
            STAL  L0E485A
            PLA
            STAL  L0E4858
            LDA   #L0E3E7C
            LDX   #^L0E3E7C
            PHA
            TXA
            STAL  L0E485E
            PLA
            STAL  L0E485C
            LDA   #L0E3E7F
            LDX   #^L0E3E7F
            PHA
            TXA
            STAL  L0E4862
            PLA
            STAL  L0E4860
            LDA   #L0E3E84
            LDX   #^L0E3E84
            PHA
            TXA
            STAL  L0E4866
            PLA
            STAL  L0E4864
            LDA   #L0E3E88
            LDX   #^L0E3E88
            PHA
            TXA
            STAL  L0E486A
            PLA
            STAL  L0E4868
            LDA   #L0E3E8B
            LDX   #^L0E3E8B
            PHA
            TXA
            STAL  L0E486E
            PLA
            STAL  L0E486C
            LDA   #L0E3E90
            LDX   #^L0E3E90
            PHA
            TXA
            STAL  L0E4872
            PLA
            STAL  L0E4870
            LDA   #L0E3E94
            LDX   #^L0E3E94
            PHA
            TXA
            STAL  L0E4876
            PLA
            STAL  L0E4874
            LDA   #L0E3E99
            LDX   #^L0E3E99
            PHA
            TXA
            STAL  L0E487A
            PLA
            STAL  L0E4878
            LDA   #L0E3E9D
            LDX   #^L0E3E9D
            PHA
            TXA
            STAL  L0E487E
            PLA
            STAL  L0E487C
            LDA   #L0E3EA1
            LDX   #^L0E3EA1
            PHA
            TXA
            STAL  L0E4882
            PLA
            STAL  L0E4880
            LDA   #L0E3EA6
            LDX   #^L0E3EA6
            PHA
            TXA
            STAL  L0E4886
            PLA
            STAL  L0E4884
            LDA   #L0E3EAA
            LDX   #^L0E3EAA
            PHA
            TXA
            STAL  L0E488A
            PLA
            STAL  L0E4888
            LDA   #L0E3EAD
            LDX   #^L0E3EAD
            PHA
            TXA
            STAL  L0E488E
            PLA
            STAL  L0E488C
            LDA   #L0E3EB0
            LDX   #^L0E3EB0
            PHA
            TXA
            STAL  L0E4892
            PLA
            STAL  L0E4890
            LDA   #L0E3EB4
            LDX   #^L0E3EB4
            PHA
            TXA
            STAL  L0E4896
            PLA
            STAL  L0E4894
            LDA   #L0E3EB7
            LDX   #^L0E3EB7
            PHA
            TXA
            STAL  L0E489A
            PLA
            STAL  L0E4898
            LDA   #L0E3EC0
            LDX   #^L0E3EC0
            PHA
            TXA
            STAL  L0E489E
            PLA
            STAL  L0E489C
            LDA   #L0E3ED9
            LDX   #^L0E3ED9
            PHA
            TXA
            STAL  L0E48A2
            PLA
            STAL  L0E48A0
            LDA   #L0E3EDF
            LDX   #^L0E3EDF
            PHA
            TXA
            STAL  L0E48A6
            PLA
            STAL  L0E48A4
            LDA   #L0E3EE4
            LDX   #^L0E3EE4
            PHA
            TXA
            STAL  L0E48AA
            PLA
            STAL  L0E48A8
            LDA   #L0E3EE9
            LDX   #^L0E3EE9
            PHA
            TXA
            STAL  L0E48AE
            PLA
            STAL  L0E48AC
            LDA   #L0E3EFA
            LDX   #^L0E3EFA
            PHA
            TXA
            STAL  L0E48DE
            PLA
            STAL  L0E48DC
            LDA   #L0E3F11
            LDX   #^L0E3F11
            PHA
            TXA
            STAL  L0E48E2
            PLA
            STAL  L0E48E0
            LDA   #L0E3F29
            LDX   #^L0E3F29
            PHA
            TXA
            STAL  L0E48EA
            PLA
            STAL  L0E48E8
            LDA   #L0E3F4B
            LDX   #^L0E3F4B
            PHA
            TXA
            STAL  L0E48EE
            PLA
            STAL  L0E48EC
            LDA   #L0E3F6E
            LDX   #^L0E3F6E
            PHA
            TXA
            STAL  L0E48F2
            PLA
            STAL  L0E48F0
            LDA   #L0E3F84
            LDX   #^L0E3F84
            PHA
            TXA
            STAL  L0E48F6
            PLA
            STAL  L0E48F4
            LDA   #L0E3F90
            LDX   #^L0E3F90
            PHA
            TXA
            STAL  L0E48FA
            PLA
            STAL  L0E48F8
            LDA   #L0E3F92
            LDX   #^L0E3F92
            PHA
            TXA
            STAL  L0E48FE
            PLA
            STAL  L0E48FC
            LDA   #L0E3FB5
            LDX   #^L0E3FB5
            PHA
            TXA
            STAL  L0E4902
            PLA
            STAL  L0E4900
            LDA   #L0E3FD8
            LDX   #^L0E3FD8
            PHA
            TXA
            STAL  L0E4906
            PLA
            STAL  L0E4904
            LDA   #L0E3FFB
            LDX   #^L0E3FFB
            PHA
            TXA
            STAL  L0E490A
            PLA
            STAL  L0E4908
            LDA   #L0E4005
            LDX   #^L0E4005
            PHA
            TXA
            STAL  L0E490E
            PLA
            STAL  L0E490C
            LDA   #L0E4028
            LDX   #^L0E4028
            PHA
            TXA
            STAL  L0E4912
            PLA
            STAL  L0E4910
            LDA   #L0E404B
            LDX   #^L0E404B
            PHA
            TXA
            STAL  L0E4916
            PLA
            STAL  L0E4914
            LDA   #L0E406E
            LDX   #^L0E406E
            PHA
            TXA
            STAL  L0E491A
            PLA
            STAL  L0E4918
            LDA   #L0E4091
            LDX   #^L0E4091
            PHA
            TXA
            STAL  L0E491E
            PLA
            STAL  L0E491C
            LDA   #L0E40AE
            LDX   #^L0E40AE
            PHA
            TXA
            STAL  L0E4922
            PLA
            STAL  L0E4920
            LDA   #L0E40C5
            LDX   #^L0E40C5
            PHA
            TXA
            STAL  L0E4926
            PLA
            STAL  L0E4924
            LDA   #L0E40D9
            LDX   #^L0E40D9
            PHA
            TXA
            STAL  L0E492A
            PLA
            STAL  L0E4928
            LDA   #L0E40E9
            LDX   #^L0E40E9
            PHA
            TXA
            STAL  L0E492E
            PLA
            STAL  L0E492C
            LDA   #L0E4103
            LDX   #^L0E4103
            PHA
            TXA
            STAL  L0E4932
            PLA
            STAL  L0E4930
            LDA   #L0E4121
            LDX   #^L0E4121
            PHA
            TXA
            STAL  L0E4936
            PLA
            STAL  L0E4934
            LDA   #L0E4138
            LDX   #^L0E4138
            PHA
            TXA
            STAL  L0E493A
            PLA
            STAL  L0E4938
            LDA   #L0E4148
            LDX   #^L0E4148
            PHA
            TXA
            STAL  L0E493E
            PLA
            STAL  L0E493C
            LDA   #L0E4152
            LDX   #^L0E4152
            PHA
            TXA
            STAL  L0E4942
            PLA
            STAL  L0E4940
            LDA   #L0E415C
            LDX   #^L0E415C
            PHA
            TXA
            STAL  L0E4946
            PLA
            STAL  L0E4944
            LDA   #L0E416A
            LDX   #^L0E416A
            PHA
            TXA
            STAL  L0E494A
            PLA
            STAL  L0E4948
            LDA   #L0E4178
            LDX   #^L0E4178
            PHA
            TXA
            STAL  L0E494E
            PLA
            STAL  L0E494C
            LDA   #L0E4185
            LDX   #^L0E4185
            PHA
            TXA
            STAL  L0E4952
            PLA
            STAL  L0E4950
            LDA   #L0E4192
            LDX   #^L0E4192
            PHA
            TXA
            STAL  L0E4956
            PLA
            STAL  L0E4954
            LDA   #L0E41C4
            LDX   #^L0E41C4
            PHA
            TXA
            STAL  L0E495A
            PLA
            STAL  L0E4958
            LDA   #L0E41E7
            LDX   #^L0E41E7
            PHA
            TXA
            STAL  L0E495E
            PLA
            STAL  L0E495C
            LDA   #L0E41EF
            LDX   #^L0E41EF
            PHA
            TXA
            STAL  L0E4962
            PLA
            STAL  L0E4960
            LDA   #L0E41F6
            LDX   #^L0E41F6
            PHA
            TXA
            STAL  L0E4966
            PLA
            STAL  L0E4964
            LDA   #L0E4207
            LDX   #^L0E4207
            PHA
            TXA
            STAL  L0E496A
            PLA
            STAL  L0E4968
            LDA   #L0E420E
            LDX   #^L0E420E
            PHA
            TXA
            STAL  L0E496E
            PLA
            STAL  L0E496C
            LDA   #L0E4217
            LDX   #^L0E4217
            PHA
            TXA
            STAL  L0E4972
            PLA
            STAL  L0E4970
            LDA   #L0E4226
            LDX   #^L0E4226
            PHA
            TXA
            STAL  L0E4976
            PLA
            STAL  L0E4974
            LDA   #L0E423E
            LDX   #^L0E423E
            PHA
            TXA
            STAL  L0E497A
            PLA
            STAL  L0E4978
            LDA   #L0E424B
            LDX   #^L0E424B
            PHA
            TXA
            STAL  L0E497E
            PLA
            STAL  L0E497C
            LDA   #L0E4257
            LDX   #^L0E4257
            PHA
            TXA
            STAL  L0E4982
            PLA
            STAL  L0E4980
            LDA   #L0E4266
            LDX   #^L0E4266
            PHA
            TXA
            STAL  L0E4986
            PLA
            STAL  L0E4984
            LDA   #L0E4273
            LDX   #^L0E4273
            PHA
            TXA
            STAL  L0E498A
            PLA
            STAL  L0E4988
            LDA   #L0E4293
            LDX   #^L0E4293
            PHA
            TXA
            STAL  L0E498E
            PLA
            STAL  L0E498C
            LDA   #L0E42AD
            LDX   #^L0E42AD
            PHA
            TXA
            STAL  L0E4992
            PLA
            STAL  L0E4990
            LDA   #L0E42C8
            LDX   #^L0E42C8
            PHA
            TXA
            STAL  L0E4996
            PLA
            STAL  L0E4994
            LDA   #L0E42DB
            LDX   #^L0E42DB
            PHA
            TXA
            STAL  L0E499A
            PLA
            STAL  L0E4998
            LDA   #L0E42EE
            LDX   #^L0E42EE
            PHA
            TXA
            STAL  L0E499E
            PLA
            STAL  L0E499C
            LDA   #L0E42FE
            LDX   #^L0E42FE
            PHA
            TXA
            STAL  L0E49A2
            PLA
            STAL  L0E49A0
            LDA   #L0E430C
            LDX   #^L0E430C
            PHA
            TXA
            STAL  L0E49A6
            PLA
            STAL  L0E49A4
            LDA   #L0E431D
            LDX   #^L0E431D
            PHA
            TXA
            STAL  L0E49AA
            PLA
            STAL  L0E49A8
            LDA   #L0E4335
            LDX   #^L0E4335
            PHA
            TXA
            STAL  L0E49AE
            PLA
            STAL  L0E49AC
            LDA   #L0E4359
            LDX   #^L0E4359
            PHA
            TXA
            STAL  L0E49B2
            PLA
            STAL  L0E49B0
            LDA   #L0E4373
            LDX   #^L0E4373
            PHA
            TXA
            STAL  L0E49B6
            PLA
            STAL  L0E49B4
            LDA   #L0E4393
            LDX   #^L0E4393
            PHA
            TXA
            STAL  L0E49BA
            PLA
            STAL  L0E49B8
            LDA   #L0E43A9
            LDX   #^L0E43A9
            PHA
            TXA
            STAL  L0E49BE
            PLA
            STAL  L0E49BC
            LDA   #L0E43CF
            LDX   #^L0E43CF
            PHA
            TXA
            STAL  L0E49C2
            PLA
            STAL  L0E49C0
            LDA   #L0E43FA
            LDX   #^L0E43FA
            PHA
            TXA
            STAL  L0E49C6
            PLA
            STAL  L0E49C4
            LDA   #L0E4420
            LDX   #^L0E4420
            PHA
            TXA
            STAL  L0E49CA
            PLA
            STAL  L0E49C8
            LDA   #L0E4446
            LDX   #^L0E4446
            PHA
            TXA
            STAL  L0E49CE
            PLA
            STAL  L0E49CC
            LDA   #L0E4475
            LDX   #^L0E4475
            PHA
            TXA
            STAL  L0E49D2
            PLA
            STAL  L0E49D0
            LDA   #L0E44A0
            LDX   #^L0E44A0
            PHA
            TXA
            STAL  L0E49D6
            PLA
            STAL  L0E49D4
            LDA   #L0E44C8
            LDX   #^L0E44C8
            PHA
            TXA
            STAL  L0E49DA
            PLA
            STAL  L0E49D8
            LDA   #L0E44F1
            LDX   #^L0E44F1
            PHA
            TXA
            STAL  L0E49DE
            PLA
            STAL  L0E49DC
            LDA   #L0E450C
            LDX   #^L0E450C
            PHA
            TXA
            STAL  L0E49E2
            PLA
            STAL  L0E49E0
            LDA   #L0E453A
            LDX   #^L0E453A
            PHA
            TXA
            STAL  L0E49E6
            PLA
            STAL  L0E49E4
            LDA   #L0E455E
            LDX   #^L0E455E
            PHA
            TXA
            STAL  L0E49EA
            PLA
            STAL  L0E49E8
            LDA   #L0E4580
            LDX   #^L0E4580
            PHA
            TXA
            STAL  L0E49EE
            PLA
            STAL  L0E49EC
            LDA   #L0E45A1
            LDX   #^L0E45A1
            PHA
            TXA
            STAL  L0E49F2
            PLA
            STAL  L0E49F0
            LDA   #L0E45BB
            LDX   #^L0E45BB
            PHA
            TXA
            STAL  L0E49F6
            PLA
            STAL  L0E49F4
            LDA   #L0E45D4
            LDX   #^L0E45D4
            PHA
            TXA
            STAL  L0E49FA
            PLA
            STAL  L0E49F8
            LDA   #L0E45EE
            LDX   #^L0E45EE
            PHA
            TXA
            STAL  L0E49FE
            PLA
            STAL  L0E49FC
            LDA   #L0E4604
            LDX   #^L0E4604
            PHA
            TXA
            STAL  L0E4A02
            PLA
            STAL  L0E4A00
            LDA   #L0E4615
            LDX   #^L0E4615
            PHA
            TXA
            STAL  L0E4A06
            PLA
            STAL  L0E4A04
            LDA   #L0E462C
            LDX   #^L0E462C
            PHA
            TXA
            STAL  L0E4A0A
            PLA
            STAL  L0E4A08
            LDA   #L0E463B
            LDX   #^L0E463B
            PHA
            TXA
            STAL  L0E4A0E
            PLA
            STAL  L0E4A0C
            LDA   #L0E4652
            LDX   #^L0E4652
            PHA
            TXA
            STAL  L0E4A12
            PLA
            STAL  L0E4A10
            LDA   #L0E4657
            LDX   #^L0E4657
            PHA
            TXA
            STAL  L0E4A16
            PLA
            STAL  L0E4A14
            LDA   #L0E465D
            LDX   #^L0E465D
            PHA
            TXA
            STAL  L0E4A1A
            PLA
            STAL  L0E4A18
            LDA   #L0E4662
            LDX   #^L0E4662
            PHA
            TXA
            STAL  L0E4A1E
            PLA
            STAL  L0E4A1C
            LDA   #L0E4666
            LDX   #^L0E4666
            PHA
            TXA
            STAL  L0E4A22
            PLA
            STAL  L0E4A20
            LDA   #L0E466A
            LDX   #^L0E466A
            PHA
            TXA
            STAL  L0E4A26
            PLA
            STAL  L0E4A24
            LDA   #L0E466E
            LDX   #^L0E466E
            PHA
            TXA
            STAL  L0E4A2A
            PLA
            STAL  L0E4A28
            LDA   #L0E4672
            LDX   #^L0E4672
            PHA
            TXA
            STAL  L0E4A2E
            PLA
            STAL  L0E4A2C
            LDA   #L0E4676
            LDX   #^L0E4676
            PHA
            TXA
            STAL  L0E48D2
            PLA
            STAL  L0E48D0
            LDA   #L0E4690
            LDX   #^L0E4690
            PHA
            TXA
            STAL  L0E48D6
            PLA
            STAL  L0E48D4
            LDA   #L0E46AC
            LDX   #^L0E46AC
            PHA
            TXA
            STAL  L0E48DA
            PLA
            STAL  L0E48D8
            LDA   #L0E46C8
            LDX   #^L0E46C8
            PHA
            TXA
            STAL  L0E4A32
            PLA
            STAL  L0E4A30
            LDA   #L0E46DF
            LDX   #^L0E46DF
            PHA
            TXA
            STAL  L0E4A3A
            PLA
            STAL  L0E4A38
            LDA   #L0E46F5
            LDX   #^L0E46F5
            PHA
            TXA
            STAL  L0E4A3E
            PLA
            STAL  L0E4A3C
            LDA   #L0E470B
            LDX   #^L0E470B
            PHA
            TXA
            STAL  L0E4A42
            PLA
            STAL  L0E4A40
            LDA   #L0E4731
            LDX   #^L0E4731
            PHA
            TXA
            STAL  L0E4A46
            PLA
            STAL  L0E4A44
            LDA   #L0E4755
            LDX   #^L0E4755
            PHA
            TXA
            STAL  L0E4A4A
            PLA
            STAL  L0E4A48
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L030C3A     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            LDA   $FF
            CMP   #$0001
            BNE   L030C5A
            PEI   $FD
            _EnableMItem
            STA   L0F0779
            BRA   L030C66
L030C5A     PEI   $FD
            _DisableMItem
            STA   L0F0779
L030C66     TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L030C6E     PHD
            TSC
            SEC
            SBC   #$00F7
            TCD
            ADC   #$00F2
            TCS
            PEI   $FF
            PEI   $FD
            _CheckMItem
            STA   L0F0779
            TDC
            CLC
            ADC   #$00F7
            TCS
            PLD
            RTL

L030C8F     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            PEA   $0000
            PEA   $0117
            JSL   L030C6E
            PLY
            PLY
            PEA   $0000
            PEA   $0118
            JSL   L030C6E
            PLY
            PLY
            PEA   $0000
            PEA   $0119
            JSL   L030C6E
            PLY
            PLY
            PEA   $0000
            PEA   $0120
            JSL   L030C6E
            PLY
            PLY
            PEA   $0000
            PEA   $0121
            JSL   L030C6E
            PLY
            PLY
            PEA   $0000
            PEA   $0124
            JSL   L030C6E
            PLY
            PLY
            PEA   $0000
            PEA   $0125
            JSL   L030C6E
            PLY
            PLY
            PEA   $0000
            PEA   $0127
            JSL   L030C6E
            PLY
            PLY
            PEA   $0000
            PEA   $0126
            JSL   L030C6E
            PLY
            PLY
            PEA   $0000
            PEA   $0128
            JSL   L030C6E
            PLY
            PLY
            PEA   $0000
            PEA   $0129
            JSL   L030C6E
            PLY
            PLY
            PEA   $0000
            PEA   $012A
            JSL   L030C6E
            PLY
            PLY
            PEA   $0000
            PEA   $0106
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0101
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0103
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0102
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0105
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0104
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0107
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0108
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0109
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $010A
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $010B
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $010C
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0134
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $010D
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $010E
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $010F
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0110
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0111
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0112
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0113
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0114
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0115
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0116
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0117
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0118
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0119
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $011A
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $011B
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $011C
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $011D
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $011E
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $011F
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0120
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0121
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0122
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0123
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0124
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0125
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0127
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0126
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0128
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0129
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $012A
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $012B
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $012C
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $012D
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $012E
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $012F
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0130
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0131
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0132
            JSL   L030C3A
            PLY
            PLY
            PEA   $0000
            PEA   $0133
            JSL   L030C3A
            PLY
            PLY
            TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L030FA2     ENT
            PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            JSL   L030C8F
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0008
            LDA   [$F8],Y
            BNE   L030FD6
            LDA   L0F0070
            CMP   #$FFFF
            BNE   L030FD0
            JSL   L030FE2
            BRA   L030FD4
L030FD0     JSL   L031309
L030FD4     BRA   L030FDA
L030FD6     JSL   L031524
L030FDA     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L030FE2     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$006C
            LDA   [$F8],Y
            PHA
            PEA   $0129
            JSL   L030C6E
            PLY
            PLY
            PEA   $0001
            PEA   $012D
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0129
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0106
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0101
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0102
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0105
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0104
            JSL   L030C3A
            PLY
            PLY
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   #$0020
            BVS   L031072
            EOR   #$8000
L031072     BMI   L03108C
            PEA   $0001
            PEA   $011B
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $011C
            JSL   L030C3A
            PLY
            PLY
L03108C     LDA   L0F0042
            BNE   L0310B5
            PEA   $0001
            PEA   $0107
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0108
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $010D
            JSL   L030C3A
            PLY
            PLY
L0310B5     JSL   L03129C
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            CMP   #$0000
            BNE   L0310D3
            LDA   #$0000
            BRL   L031292
L0310D3     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   [$F8]
            CMP   #$0000
            BNE   L0310FC
            PEA   $0001
            PEA   $010C
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0134
            JSL   L030C3A
            PLY
            PLY
L0310FC     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0062
            LDA   [$F8],Y
            BEQ   L03111B
            PEA   $0001
            PEA   $0120
            JSL   L030C6E
            PLY
            PLY
            BRA   L031127
L03111B     PEA   $0001
            PEA   $0121
            JSL   L030C6E
            PLY
            PLY
L031127     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0066
            LDA   [$F8],Y
            BEQ   L031146
            PEA   $0001
            PEA   $0124
            JSL   L030C6E
            PLY
            PLY
            BRA   L031152
L031146     PEA   $0001
            PEA   $0125
            JSL   L030C6E
            PLY
            PLY
L031152     LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0064
            LDA   [$F8],Y
            BNE   L031187
            PEA   $0001
            PEA   $0116
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $012B
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $012C
            JSL   L030C3A
            PLY
            PLY
L031187     LDA   L0F0042
            BEQ   L0311A4
            PEA   $0001
            PEA   $0109
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $010B
            JSL   L030C3A
            PLY
            PLY
L0311A4     LDA   L0F0044
            CMP   #$0001
            BEQ   L0311B1
            LDA   L0F0042
            BEQ   L0311BD
L0311B1     PEA   $0001
            PEA   $010A
            JSL   L030C3A
            PLY
            PLY
L0311BD     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   [$F8]
            SEC
            SBC   #$0000
            BEQ   L0311E2
            BVS   L0311D4
            EOR   #$8000
L0311D4     BPL   L0311E2
            PEA   $0001
            PEA   $010E
            JSL   L030C3A
            PLY
            PLY
L0311E2     LDA   L0F0044
            CMP   #$0001
            BNE   L031202
            PEA   $0001
            PEA   $010F
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0110
            JSL   L030C3A
            PLY
            PLY
L031202     STZ   $F6
L031204     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   $F6
            BEQ   L03123E
            BVS   L03121D
            EOR   #$8000
L03121D     BPL   L03123E
            LDA   $F6
            ASL
            TAX
            LDAL  L0E0046,X
            CMP   #$FFFF
            BNE   L03123A
            PEA   $0001
            PEA   $0126
            JSL   L030C3A
            PLY
            PLY
            BRA   L03123E
L03123A     INC   $F6
            BRA   L031204
L03123E     PEA   $0001
            PEA   $0111
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0124
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0125
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0120
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0121
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0129
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0115
            JSL   L030C3A
            PLY
            PLY
L031292     TAY
            TDC
            CLC
            ADC   #$00FB
            TCS
            TYA
            PLD
            RTL

L03129C     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            PEA   $0001
            PEA   $012E
            JSL   L030C3A
            PLY
            PLY
            LDA   L0F0000
            BEQ   L0312DC
            PEA   $0001
            PEA   $0131
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0132
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0133
            JSL   L030C3A
            PLY
            PLY
L0312DC     LDA   L0F0042
            BNE   L0312E9
            LDA   L0F0044
            CMP   #$0001
            BNE   L031301
L0312E9     PEA   $0001
            PEA   $012F
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0130
            JSL   L030C3A
            PLY
            PLY
L031301     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L031309     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F4
            TCS
            LDA   L0F0070
            PHA
            LDA   #$000C
            CLC
            JSL   L0D151F
            PLA
            PHA
            LDX   L0F0030
            LDA   L0F002E
            STA   $F8
            STX   $FA
            LDA   #$004A
            CLC
            ADC   $F8
            STA   $F8
            BCC   L031338
            INC   $FA
L031338     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L031342
            INC   $FA
L031342     LDA   [$F8]
            STA   $F6
            PEI   $F6
            JSL   L082F1F
            PLY
            CMP   #$0000
            BEQ   L031354
            BRA   L031364
L031354     PEA   $0001
            PEA   $0117
            JSL   L030C6E
            PLY
            PLY
            BRA   L03138E
            BRA   L03136B
L031364     CMP   #$0001
            BEQ   L03136B
            BRA   L03137B
L03136B     PEA   $0001
            PEA   $0118
            JSL   L030C6E
            PLY
            PLY
            BRA   L03138E
            BRA   L031382
L03137B     CMP   #$0002
            BEQ   L031382
            BRA   L03138E
L031382     PEA   $0001
            PEA   $0119
            JSL   L030C6E
            PLY
            PLY
L03138E     LDA   $F6
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   #$004C
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0313AC
            INC   $FA
L0313AC     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0313B6
            INC   $FA
L0313B6     LDA   [$F8]
            AND   #$00FF
            CMP   #$0008
            BNE   L0313CE
            PEA   $0001
            PEA   $011C
            JSL   L030C3A
            PLY
            PLY
            BRA   L0313DA
L0313CE     PEA   $0001
            PEA   $011B
            JSL   L030C3A
            PLY
            PLY
L0313DA     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDY   #$0002
            LDA   [$F8],Y
            SEC
            SBC   #$0001
            BEQ   L031402
            BVS   L0313F4
            EOR   #$8000
L0313F4     BPL   L031402
            PEA   $0001
            PEA   $011D
            JSL   L030C3A
            PLY
            PLY
L031402     PEA   $0001
            PEA   $011E
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $011F
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0122
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0123
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0117
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0118
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0119
            JSL   L030C3A
            PLY
            PLY
            PEI   $F6
            JSL   L083089
            PLY
            TAY
            BEQ   L03146E
            PEA   $0001
            PEA   $0114
            JSL   L030C3A
            PLY
            PLY
            BRA   L03147A
L03146E     PEA   $0001
            PEA   $0113
            JSL   L030C3A
            PLY
            PLY
L03147A     LDA   $F6
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   #$004C
            CLC
            ADC   $F8
            STA   $F8
            BCC   L031498
            INC   $FA
L031498     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0314A2
            INC   $FA
L0314A2     LDA   [$F8]
            AND   #$00FF
            CMP   #$0001
            BEQ   L031510
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   #$004C
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0314CA
            INC   $FA
L0314CA     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0314D4
            INC   $FA
L0314D4     LDA   [$F8]
            AND   #$00FF
            CMP   #$0008
            BEQ   L031510
            LDA   $F6
            ASL
            ASL
            ASL
            ASL
            ASL
            PHA
            LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   #$004C
            CLC
            ADC   $F8
            STA   $F8
            BCC   L0314FC
            INC   $FA
L0314FC     PLA
            CLC
            ADC   $F8
            STA   $F8
            BCC   L031506
            INC   $FA
L031506     LDA   [$F8]
            AND   #$00FF
            CMP   #$0002
            BNE   L03151C
L031510     PEA   $0001
            PEA   $011A
            JSL   L030C3A
            PLY
            PLY
L03151C     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL

L031524     PHD
            TSC
            SEC
            SBC   #$00FB
            TCD
            ADC   #$00F6
            TCS
            PEA   $0001
            PEA   $0126
            JSL   L030C6E
            PLY
            PLY
            PEA   $0000
            PEA   $0127
            JSL   L030C6E
            PLY
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0068
            LDA   [$F8],Y
            PHA
            PEA   $0128
            JSL   L030C6E
            PLY
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$006E
            LDA   [$F8],Y
            PHA
            PEA   $012A
            JSL   L030C6E
            PLY
            PLY
            LDA   L0F0042
            BEQ   L03158A
            PEA   $0001
            PEA   $0109
            JSL   L030C3A
            PLY
            PLY
L03158A     LDA   L0F0044
            CMP   #$0001
            BEQ   L031597
            LDA   L0F0042
            BEQ   L0315C8
L031597     LDX   L0F002C
            LDA   L0F002A
            STA   $F8
            STX   $FA
            LDA   [$F8]
            SEC
            SBC   #$0000
            BEQ   L0315BC
            BVS   L0315AE
            EOR   #$8000
L0315AE     BPL   L0315BC
            PEA   $0000
            PEA   $010E
            JSL   L030C3A
            PLY
            PLY
L0315BC     PEA   $0001
            PEA   $010A
            JSL   L030C3A
            PLY
            PLY
L0315C8     PEA   $0001
            PEA   $0127
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0128
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $012A
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0103
            JSL   L030C3A
            PLY
            PLY
            LDX   L0F0034
            LDA   L0F0032
            STA   $F8
            STX   $FA
            LDY   #$0010
            LDA   [$F8],Y
            BEQ   L03160C
            BRL   L03166C
L03160C     PEA   $0001
            PEA   $0106
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0101
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0102
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0105
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $0104
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $012D
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $012B
            JSL   L030C3A
            PLY
            PLY
            PEA   $0001
            PEA   $012C
            JSL   L030C3A
            PLY
            PLY
L03166C     TDC
            CLC
            ADC   #$00FB
            TCS
            PLD
            RTL


